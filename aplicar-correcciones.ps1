# aplicar-correcciones.ps1 - Aplica AUTO_SEGURO a las fichas HTML

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$estacionesDir = Join-Path $base 'estaciones'
$planFile = Join-Path $base 'plan-saneamiento-filtrado.csv'
$backupDir = Join-Path $base ('estaciones-backup-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))
$logFile = Join-Path $base 'aplicar-correcciones-log.csv'

if (-not (Test-Path $estacionesDir)) { throw "No encuentro $estacionesDir" }
if (-not (Test-Path $planFile))     { throw "No encuentro $planFile" }

Write-Host "Creando backup en $backupDir..." -ForegroundColor Cyan
Copy-Item -Path $estacionesDir -Destination $backupDir -Recurse -Force
Write-Host "OK - Backup creado." -ForegroundColor Green

$plan = Import-Csv $planFile -Encoding UTF8
$aAplicar = $plan | Where-Object { $_.accion -like 'AUTO_SEGURO*' }

Write-Host ""
Write-Host "Fichas a corregir: $($aAplicar.Count)" -ForegroundColor Yellow
Write-Host ""

function Convertir-Slug($s) {
    if (-not $s) { return '' }
    $n = $s.ToLower().Trim()
    $n = $n -replace '[áàäâã]', 'a'
    $n = $n -replace '[éèëê]', 'e'
    $n = $n -replace '[íìïî]', 'i'
    $n = $n -replace '[óòöô]', 'o'
    $n = $n -replace '[úùüû]', 'u'
    $n = $n -replace 'ñ', 'n'
    $n = $n -replace 'ç', 'c'
    $n = $n -replace '[^a-z0-9\s-]', ''
    $n = $n -replace '\s+', '-'
    return $n
}

function Normalizar-Tel($t) {
    if (-not $t) { return '' }
    return ($t -replace '\s', '' -replace '\.', '' -replace '-', '')
}

$log = @()

foreach ($p in $aAplicar) {
    $slug = Convertir-Slug $p.mi_nombre
    $filePath = Join-Path $estacionesDir "$slug.html"

    if (-not (Test-Path $filePath)) {
        Write-Host "NO ENCONTRADO: $($p.mi_nombre) -> $slug.html" -ForegroundColor Red
        $log += [PSCustomObject]@{ mi_nombre=$p.mi_nombre; archivo="$slug.html"; estado='NO_ENCONTRADO'; cambios='' }
        continue
    }

    $content = Get-Content $filePath -Raw -Encoding UTF8
    $original = $content
    $cambios = @()

    # 1) TELEFONO en fila div
    $patronTel = '(<span class="label">(?:Tel&eacute;fono|Teléfono)</span><span class="valor">)([^<]*)(</span>)'
    $matchTel = [regex]::Match($content, $patronTel)
    if ($matchTel.Success) {
        $telActual = $matchTel.Groups[2].Value
        if ((Normalizar-Tel $telActual) -eq (Normalizar-Tel $p.tel_mio) -and $p.tel_dgt) {
            $nuevo = $matchTel.Groups[1].Value + $p.tel_dgt + $matchTel.Groups[3].Value
            $content = $content -replace [regex]::Escape($matchTel.Value), [regex]::Escape($nuevo).Replace('\','') 
            # Truco: usar [regex]::Replace con MatchEvaluator para evitar escapes
            $content = [regex]::Replace($content, $patronTel, { param($m) $m.Groups[1].Value + $p.tel_dgt + $m.Groups[3].Value }, 1)
            $cambios += "tel: '$telActual' -> '$($p.tel_dgt)'"
        }
    }

    # 2) TELEFONO en link tel:
    if ($p.tel_mio -and $p.tel_dgt) {
        $telLimpioViejo = ($p.tel_mio -replace '[^0-9]', '')
        $telLimpioNuevo = ($p.tel_dgt -replace '[^0-9]', '')
        if ($telLimpioViejo -and $telLimpioNuevo -and ($telLimpioViejo -ne $telLimpioNuevo)) {
            $content = $content -replace ('tel:\+?' + [regex]::Escape($telLimpioViejo)), ('tel:+' + $telLimpioNuevo)
            $cambios += "link tel actualizado"
        }
    }

    # 3) DIRECCION en fila div
    $patronDir = '(<span class="label">(?:Direcci&oacute;n|Dirección)</span><span class="valor">)([^<]*)(</span>)'
    $matchDir = [regex]::Match($content, $patronDir)
    if ($matchDir.Success -and $p.dir_dgt) {
        $dirActual = $matchDir.Groups[2].Value
        if ($dirActual -like "*$($p.dir_mia)*" -or $p.dir_mia -like "*$dirActual*") {
            $content = [regex]::Replace($content, $patronDir, { param($m) $m.Groups[1].Value + $p.dir_dgt + $m.Groups[3].Value }, 1)
            $cambios += "dir: '$dirActual' -> '$($p.dir_dgt)'"
        }
    }

    # 4) COORDENADAS en iframe y JSON-LD
    if ($p.lat_mia -and $p.lat_dgt) {
        $latV = $p.lat_mia; $lngV = $p.lng_mia
        $latN = $p.lat_dgt; $lngN = $p.lng_dgt

        if ("$latV,$lngV" -ne "$latN,$lngN") {
            # iframe: q=lat,lng
            $content = $content -replace ([regex]::Escape("q=$latV,$lngV")), "q=$latN,$lngN"
            $content = $content -replace ([regex]::Escape("destination=$latV,$lngV")), "destination=$latN,$lngN"
            # JSON-LD geo
            $content = $content -replace ([regex]::Escape("`"latitude`":$latV,`"longitude`":$lngV")), "`"latitude`":$latN,`"longitude`":$lngN"
            $cambios += "coords"
        }
    }

    if ($content -ne $original) {
        Set-Content -Path $filePath -Value $content -Encoding UTF8 -NoNewline
        Write-Host "OK: $($p.mi_nombre) -> $slug.html" -ForegroundColor Green
        $log += [PSCustomObject]@{ mi_nombre=$p.mi_nombre; archivo="$slug.html"; estado='ACTUALIZADO'; cambios=($cambios -join ' | ') }
    } else {
        Write-Host "SIN CAMBIOS: $($p.mi_nombre)" -ForegroundColor Yellow
        $log += [PSCustomObject]@{ mi_nombre=$p.mi_nombre; archivo="$slug.html"; estado='SIN_CAMBIOS'; cambios='' }
    }
}

$log | Export-Csv -Path $logFile -NoTypeInformation -Encoding UTF8

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  RESUMEN" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
$log | Group-Object estado | Format-Table Count, Name -AutoSize
Write-Host ""
Write-Host "Backup: $backupDir" -ForegroundColor Cyan
Write-Host "Log:    $logFile" -ForegroundColor Cyan
Write-Host ""
Write-Host "Para revertir todo:" -ForegroundColor DarkGray
Write-Host "  Remove-Item '$estacionesDir\*' -Recurse -Force" -ForegroundColor DarkGray
Write-Host "  Copy-Item '$backupDir\*' '$estacionesDir' -Recurse -Force" -ForegroundColor DarkGray