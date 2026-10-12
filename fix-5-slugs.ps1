# fix-5-slugs.ps1 - Aplica las correcciones a las 5 fichas con slug de triple guion

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$estacionesDir = Join-Path $base 'estaciones'
if (-not (Test-Path $estacionesDir)) { $estacionesDir = $base }

$planFile = Join-Path $base 'plan-saneamiento-filtrado.csv'
$logFile  = Join-Path $base 'force-update-log.csv'

$plan = Import-Csv $planFile -Encoding UTF8

# Mapeo manual de los 5 slugs que fallan
$mapaSlug = @{
    'ITV Ceuta - El Tarajal'         = 'itv-ceuta---el-tarajal.html'
    'ITV La Maquinista - Caracas'    = 'itv-la-maquinista---caracas.html'
    'ITV Melilla - Centro'           = 'itv-melilla---centro.html'
    'ITV Melilla - El Sepes'         = 'itv-melilla---el-sepes.html'
    'ITV Vitoria - Jundiz'           = 'itv-vitoria---jundiz.html'
}

$log = @()

foreach ($nombre in $mapaSlug.Keys) {
    $archivo = $mapaSlug[$nombre]
    $filePath = Join-Path $estacionesDir $archivo

    if (-not (Test-Path $filePath)) {
        Write-Host "NO ENCONTRADO: $nombre -> $archivo" -ForegroundColor Red
        $log += [PSCustomObject]@{ mi_nombre=$nombre; estado='NO_ENCONTRADO'; cambios='' }
        continue
    }

    # Buscar el registro correspondiente en el plan
    $p = $plan | Where-Object { $_.mi_nombre.Trim() -eq $nombre.Trim() } | Select-Object -First 1
    if (-not $p) {
        Write-Host "SIN DATOS EN PLAN: $nombre" -ForegroundColor Yellow
        continue
    }

    $content = Get-Content $filePath -Raw -Encoding UTF8
    $original = $content
    $cambios = @()

    # 1. TELEFONO
    if ($p.tel_dgt) {
        $patronTel = '(<span class="label">(?:Tel&eacute;fono|Teléfono)</span><span class="valor">)[^<]*(</span>)'
        if ([regex]::IsMatch($content, $patronTel)) {
            $content = [regex]::Replace($content, $patronTel, {
                param($m)
                $m.Groups[1].Value + $p.tel_dgt + $m.Groups[2].Value
            }, 1)
            $cambios += "tel->$($p.tel_dgt)"
        }
    }

    # 2. LINK tel:
    if ($p.tel_dgt) {
        $telLimpio = $p.tel_dgt -replace '[^0-9]', ''
        $patronLink = 'href="tel:\+?[0-9]+"'
        if ([regex]::IsMatch($content, $patronLink)) {
            $content = [regex]::Replace($content, $patronLink, ('href="tel:+' + $telLimpio + '"'), 1)
            $cambios += "link-tel"
        }
    }

    # 3. DIRECCION
    if ($p.dir_dgt) {
        $patronDir = '(<span class="label">(?:Direcci&oacute;n|Dirección)</span><span class="valor">)[^<]*(</span>)'
        if ([regex]::IsMatch($content, $patronDir)) {
            $content = [regex]::Replace($content, $patronDir, {
                param($m)
                $m.Groups[1].Value + $p.dir_dgt + $m.Groups[2].Value
            }, 1)
            $cambios += "dir"
        }
    }

    # 4. COORDENADAS
    if ($p.lat_dgt -and $p.lng_dgt) {
        $latN = $p.lat_dgt; $lngN = $p.lng_dgt
        $patronIframe = 'q=-?[0-9]+\.[0-9]+,-?[0-9]+\.[0-9]+'
        if ([regex]::IsMatch($content, $patronIframe)) {
            $content = [regex]::Replace($content, $patronIframe, "q=$latN,$lngN", 1)
            $cambios += "iframe"
        }
        $patronDest = 'destination=-?[0-9]+\.[0-9]+,-?[0-9]+\.[0-9]+'
        if ([regex]::IsMatch($content, $patronDest)) {
            $content = [regex]::Replace($content, $patronDest, "destination=$latN,$lngN")
            $cambios += "maps"
        }
        $patronGeo = '"latitude":-?[0-9]+\.[0-9]+,"longitude":-?[0-9]+\.[0-9]+'
        if ([regex]::IsMatch($content, $patronGeo)) {
            $content = [regex]::Replace($content, $patronGeo, "`"latitude`":$latN,`"longitude`":$lngN")
            $cambios += "geo"
        }
    }

    if ($content -ne $original) {
        Set-Content -Path $filePath -Value $content -Encoding UTF8 -NoNewline
        Write-Host "OK: $nombre" -ForegroundColor Green
        $log += [PSCustomObject]@{ mi_nombre=$nombre; estado='ACTUALIZADO'; cambios=($cambios -join '|') }
    } else {
        Write-Host "SIN CAMBIOS: $nombre" -ForegroundColor DarkGray
        $log += [PSCustomObject]@{ mi_nombre=$nombre; estado='SIN_CAMBIOS'; cambios='' }
    }
}

# Anexar al log
$logPrev = Import-Csv $logFile -Encoding UTF8
$logTotal = $logPrev + $log
$logTotal | Export-Csv -Path $logFile -NoTypeInformation -Encoding UTF8

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  RESUMEN FIX 5" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
$log | Group-Object estado | Format-Table Count, Name -AutoSize