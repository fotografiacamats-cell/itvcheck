# force-update.ps1 - Fuerza actualizacion de fichas con datos DGT
# No compara con lo actual, sobreescribe directamente.

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$planFile = Join-Path $base 'plan-saneamiento-filtrado.csv'
$logFile = Join-Path $base 'force-update-log.csv'

# Buscar carpeta de estaciones
$estacionesDir = Join-Path $base 'estaciones'
if (-not (Test-Path $estacionesDir)) { $estacionesDir = $base }
Write-Host "Carpeta de fichas: $estacionesDir" -ForegroundColor Cyan

# Backup antes de tocar
$backupDir = Join-Path $base ('estaciones-backup-force-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))
Write-Host "Creando backup en $backupDir..." -ForegroundColor Cyan
if ((Get-Item $estacionesDir).FullName -eq (Get-Item $base).FullName) {
    # Fichas en raiz - backup selectivo
    New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
    Get-ChildItem $estacionesDir -Filter "itv-*.html" | Copy-Item -Destination $backupDir
} else {
    Copy-Item $estacionesDir $backupDir -Recurse -Force
}
Write-Host "OK backup creado." -ForegroundColor Green

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

$plan = Import-Csv $planFile -Encoding UTF8
# Solo los que tienen datos DGT (excluye NO_MATCH)
$aProcesar = $plan | Where-Object { $_.dgt_slug -and $_.dgt_slug -ne '' }

Write-Host ""
Write-Host "Fichas a forzar: $($aProcesar.Count)" -ForegroundColor Yellow
Write-Host ""

$log = @()

foreach ($p in $aProcesar) {
    $slug = Convertir-Slug $p.mi_nombre
    $filePath = Join-Path $estacionesDir "$slug.html"

    if (-not (Test-Path $filePath)) {
        Write-Host "NO ENCONTRADO: $($p.mi_nombre) -> $slug.html" -ForegroundColor DarkRed
        $log += [PSCustomObject]@{ mi_nombre=$p.mi_nombre; estado='NO_ENCONTRADO'; cambios='' }
        continue
    }

    $content = Get-Content $filePath -Raw -Encoding UTF8
    $original = $content
    $cambios = @()

    # 1. TELEFONO en el div (fuerza)
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

    # 2. LINK tel: (fuerza) - limpiar cualquier tel:+34... previo
    if ($p.tel_dgt) {
        $telLimpio = $p.tel_dgt -replace '[^0-9]', ''
        $patronLink = 'href="tel:\+?[0-9]+"'
        if ([regex]::IsMatch($content, $patronLink)) {
            $content = [regex]::Replace($content, $patronLink, ('href="tel:+' + $telLimpio + '"'), 1)
            $cambios += "link-tel"
        }
    }

    # 3. DIRECCION (fuerza)
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

    # 4. COORDENADAS - iframe y JSON-LD
    if ($p.lat_dgt -and $p.lng_dgt) {
        $latN = $p.lat_dgt
        $lngN = $p.lng_dgt

        # iframe src con q=lat,lng
        $patronIframe = 'q=-?[0-9]+\.[0-9]+,-?[0-9]+\.[0-9]+'
        if ([regex]::IsMatch($content, $patronIframe)) {
            $content = [regex]::Replace($content, $patronIframe, "q=$latN,$lngN", 1)
            $cambios += "iframe-maps"
        }

        # Google Maps dir link
        $patronDest = 'destination=-?[0-9]+\.[0-9]+,-?[0-9]+\.[0-9]+'
        if ([regex]::IsMatch($content, $patronDest)) {
            $content = [regex]::Replace($content, $patronDest, "destination=$latN,$lngN")
            $cambios += "link-maps"
        }

        # JSON-LD geo
        $patronGeo = '"latitude":-?[0-9]+\.[0-9]+,"longitude":-?[0-9]+\.[0-9]+'
        if ([regex]::IsMatch($content, $patronGeo)) {
            $content = [regex]::Replace($content, $patronGeo, "`"latitude`":$latN,`"longitude`":$lngN")
            $cambios += "jsonld-geo"
        }
    }

    if ($content -ne $original) {
        Set-Content -Path $filePath -Value $content -Encoding UTF8 -NoNewline
        Write-Host "OK: $($p.mi_nombre)" -ForegroundColor Green
        $log += [PSCustomObject]@{ mi_nombre=$p.mi_nombre; estado='ACTUALIZADO'; cambios=($cambios -join '|') }
    } else {
        Write-Host "SIN CAMBIOS: $($p.mi_nombre)" -ForegroundColor DarkGray
        $log += [PSCustomObject]@{ mi_nombre=$p.mi_nombre; estado='SIN_CAMBIOS'; cambios='' }
    }
}

$log | Export-Csv -Path $logFile -NoTypeInformation -Encoding UTF8

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  RESUMEN FORCE UPDATE" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
$log | Group-Object estado | Format-Table Count, Name -AutoSize
Write-Host ""
Write-Host "Backup: $backupDir" -ForegroundColor Cyan
Write-Host "Log:    $logFile" -ForegroundColor Cyan