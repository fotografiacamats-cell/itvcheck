# fix-slugs.ps1 - Aplica las 10 correcciones restantes con normalizacion robusta

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$estacionesDir = Join-Path $base 'estaciones'
$planFile = Join-Path $base 'plan-saneamiento-filtrado.csv'
$logFile = Join-Path $base 'aplicar-correcciones-log.csv'

if (-not (Test-Path $estacionesDir)) {
    $estacionesDir = $base
    Write-Host "No encontre $estacionesDir\estaciones, usando raiz: $estacionesDir" -ForegroundColor Yellow
}

# --- Normalizacion robusta (no depende del encoding del archivo) ---
function Convertir-Slug($s) {
    if (-not $s) { return '' }
    $formD = $s.Normalize([System.Text.NormalizationForm]::FormD)
    $sb = New-Object System.Text.StringBuilder
    foreach ($c in $formD.ToCharArray()) {
        $cat = [System.Globalization.CharUnicodeInfo]::GetUnicodeCategory($c)
        if ($cat -ne [System.Globalization.UnicodeCategory]::NonSpacingMark) {
            [void]$sb.Append($c)
        }
    }
    $n = $sb.ToString().ToLower().Trim()
    $n = $n -replace '[^a-z0-9\s-]', ''
    $n = $n -replace '\s+', '-'
    $n = $n -replace '-+', '-'
    return $n.Trim('-')
}

function Normalizar-Tel($t) {
    if (-not $t) { return '' }
    return ($t -replace '\s', '' -replace '\.', '' -replace '-', '')
}

# --- Cargar plan y detectar los que faltan ---
$plan = Import-Csv $planFile -Encoding UTF8
$aAplicar = $plan | Where-Object { $_.accion -like 'AUTO_SEGURO*' }

# Ver cuales ya se hicieron y cuales no
$log = Import-Csv $logFile -Encoding UTF8
$yaOk = $log | Where-Object { $_.estado -eq 'ACTUALIZADO' } | ForEach-Object { $_.mi_nombre }
$pendientes = $aAplicar | Where-Object { $yaOk -notcontains $_.mi_nombre }

Write-Host ""
Write-Host "Pendientes de aplicar: $($pendientes.Count)" -ForegroundColor Yellow
Write-Host ""

$logNuevo = @()

foreach ($p in $pendientes) {
    $slug = Convertir-Slug $p.mi_nombre
    $filePath = Join-Path $estacionesDir "$slug.html"

    if (-not (Test-Path $filePath)) {
        # Intento con carpeta estaciones/ explicitamente
        $altPath = Join-Path (Join-Path $base 'estaciones') "$slug.html"
        if (Test-Path $altPath) { $filePath = $altPath } else {
            Write-Host "NO ENCONTRADO: $($p.mi_nombre) -> $slug.html" -ForegroundColor Red
            $logNuevo += [PSCustomObject]@{ mi_nombre=$p.mi_nombre; archivo="$slug.html"; estado='NO_ENCONTRADO'; cambios='' }
            continue
        }
    }

    $content = Get-Content $filePath -Raw -Encoding UTF8
    $original = $content
    $cambios = @()

    # 1) TELEFONO en fila
    $patronTel = '(<span class="label">(?:Tel&eacute;fono|Teléfono)</span><span class="valor">)([^<]*)(</span>)'
    $matchTel = [regex]::Match($content, $patronTel)
    if ($matchTel.Success -and $p.tel_dgt) {
        $telActual = $matchTel.Groups[2].Value
        if ((Normalizar-Tel $telActual) -eq (Normalizar-Tel $p.tel_mio)) {
            $nuevo = $matchTel.Groups[1].Value + $p.tel_dgt + $matchTel.Groups[3].Value
            $content = $content.Replace($matchTel.Value, $nuevo)
            $cambios += "tel: '$telActual' -> '$($p.tel_dgt)'"
        }
    }

    # 2) LINK tel:
    if ($p.tel_mio -and $p.tel_dgt) {
        $telV = ($p.tel_mio -replace '[^0-9]', '')
        $telN = ($p.tel_dgt -replace '[^0-9]', '')
        if ($telV -and $telN -and ($telV -ne $telN)) {
            $content = $content -replace ('tel:\+?' + [regex]::Escape($telV)), ('tel:+' + $telN)
            $cambios += "link tel"
        }
    }

    # 3) DIRECCION
    $patronDir = '(<span class="label">(?:Direcci&oacute;n|Dirección)</span><span class="valor">)([^<]*)(</span>)'
    $matchDir = [regex]::Match($content, $patronDir)
    if ($matchDir.Success -and $p.dir_dgt) {
        $dirActual = $matchDir.Groups[2].Value
        if ($dirActual -ne $p.dir_dgt) {
            $nuevo = $matchDir.Groups[1].Value + $p.dir_dgt + $matchDir.Groups[3].Value
            $content = $content.Replace($matchDir.Value, $nuevo)
            $cambios += "dir: '$dirActual' -> '$($p.dir_dgt)'"
        }
    }

    # 4) COORDS
    if ($p.lat_mia -and $p.lat_dgt -and ("$($p.lat_mia),$($p.lng_mia)" -ne "$($p.lat_dgt),$($p.lng_dgt)")) {
        $latV = $p.lat_mia; $lngV = $p.lng_mia
        $latN = $p.lat_dgt; $lngN = $p.lng_dgt

        $content = $content.Replace("q=$latV,$lngV", "q=$latN,$lngN")
        $content = $content.Replace("destination=$latV,$lngV", "destination=$latN,$lngN")
        $content = $content.Replace("`"latitude`":$latV,`"longitude`":$lngV", "`"latitude`":$latN,`"longitude`":$lngN")
        $cambios += "coords"
    }

    if ($content -ne $original) {
        Set-Content -Path $filePath -Value $content -Encoding UTF8 -NoNewline
        Write-Host "OK: $($p.mi_nombre) -> $slug.html" -ForegroundColor Green
        $logNuevo += [PSCustomObject]@{ mi_nombre=$p.mi_nombre; archivo="$slug.html"; estado='ACTUALIZADO'; cambios=($cambios -join ' | ') }
    } else {
        Write-Host "SIN CAMBIOS: $($p.mi_nombre) (archivo=$slug.html)" -ForegroundColor Yellow
        $logNuevo += [PSCustomObject]@{ mi_nombre=$p.mi_nombre; archivo="$slug.html"; estado='SIN_CAMBIOS'; cambios='' }
    }
}

# Anexar al log existente
$logTodos = $log + $logNuevo
$logTodos | Export-Csv -Path $logFile -NoTypeInformation -Encoding UTF8

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  RESUMEN FIX" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
$logNuevo | Group-Object estado | Format-Table Count, Name -AutoSize