# auditar-enlaces.ps1 v2 - con ArrayList (fiable en PS 5.1)

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'
$estDir   = Join-Path $base 'estaciones'

$json = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json

function Normalizar($s) {
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
    $n = $n -replace '[^a-z0-9]', ''
    return $n
}

# Colecciones robustas
$ok          = New-Object System.Collections.ArrayList
$rotas       = New-Object System.Collections.ArrayList
$fixables    = New-Object System.Collections.ArrayList
$sinArchivo  = New-Object System.Collections.ArrayList
$huerfanos   = New-Object System.Collections.ArrayList
$duplicados  = New-Object System.Collections.ArrayList

# Inventario de archivos
$archivos = @()
Get-ChildItem $estDir -Filter "itv-*.html" | ForEach-Object {
    $archivos += [PSCustomObject]@{
        Nombre     = $_.Name
        SlugFile   = $_.BaseName
        SlugNorm   = Normalizar $_.BaseName
        Size       = $_.Length
    }
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  AUDITORIA DE ENLACES" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "Archivos HTML reales: $($archivos.Count)" -ForegroundColor Cyan

$todas = $json.estaciones
$conFicha = $todas | Where-Object { $_.source -in @('site','site-orphan') }

Write-Host "Entradas en JSON: $($todas.Count)" -ForegroundColor Cyan
Write-Host "  Con ficha esperada: $($conFicha.Count)" -ForegroundColor Cyan
Write-Host "  Pendientes (dgt-new): $(@($todas | Where-Object { $_.source -eq 'dgt-new' }).Count)" -ForegroundColor Cyan
Write-Host ""

# Slugs duplicados
$conFicha | Group-Object slug | Where-Object { $_.Count -gt 1 } | ForEach-Object {
    [void]$duplicados.Add([PSCustomObject]@{ Slug = $_.Name; Count = $_.Count })
}

# Clasificar cada entrada
foreach ($e in $conFicha) {
    $slugEnJson = $e.slug
    $slugNorm   = Normalizar $slugEnJson

    # 1. Existe exacto
    if (Test-Path (Join-Path $estDir "$slugEnJson.html")) {
        [void]$ok.Add($e)
        continue
    }

    # 2. Normalizado
    $cand1 = @($archivos | Where-Object { $_.SlugNorm -eq $slugNorm })
    if ($cand1.Count -eq 1) {
        [void]$fixables.Add([PSCustomObject]@{
            Nombre       = $e.nombre
            SlugJson     = $slugEnJson
            SlugCorrecto = $cand1[0].SlugFile
            Ciudad       = $e.ciudad
            Razon        = 'Normalizacion'
        })
        continue
    }

    # 3. Primeros 8 chars del nombre
    $nombreNorm = Normalizar $e.nombre
    if ($nombreNorm.Length -ge 8) {
        $prefijo = $nombreNorm.Substring(0, 8)
        $cand2 = @($archivos | Where-Object { $_.SlugNorm.Contains($prefijo) })
        if ($cand2.Count -eq 1) {
            [void]$fixables.Add([PSCustomObject]@{
                Nombre       = $e.nombre
                SlugJson     = $slugEnJson
                SlugCorrecto = $cand2[0].SlugFile
                Ciudad       = $e.ciudad
                Razon        = 'Nombre (8 chars)'
            })
            continue
        }
    }

    # 4. Ciudad
    $ciudadNorm = Normalizar $e.ciudad
    if ($ciudadNorm.Length -ge 5) {
        $cand3 = @($archivos | Where-Object { $_.SlugNorm.Contains($ciudadNorm) })
        if ($cand3.Count -eq 1) {
            [void]$fixables.Add([PSCustomObject]@{
                Nombre       = $e.nombre
                SlugJson     = $slugEnJson
                SlugCorrecto = $cand3[0].SlugFile
                Ciudad       = $e.ciudad
                Razon        = 'Ciudad'
            })
            continue
        }
    }

    # 5. Ambigua o sin archivo
    $todos = @()
    $todos += $cand1
    $todos += $cand2
    $todos += $cand3
    $todosUnicos = @($todos | Select-Object -ExpandProperty SlugFile -Unique)

    if ($todosUnicos.Count -gt 1) {
        [void]$rotas.Add([PSCustomObject]@{
            Nombre     = $e.nombre
            SlugJson   = $slugEnJson
            Ciudad     = $e.ciudad
            Candidatos = ($todosUnicos -join ', ')
        })
    } else {
        [void]$sinArchivo.Add([PSCustomObject]@{
            Nombre   = $e.nombre
            SlugJson = $slugEnJson
            Ciudad   = $e.ciudad
            Source   = $e.source
        })
    }
}

# Huerfanos: archivos sin entrada en JSON
$slugsJson = @($conFicha | Select-Object -ExpandProperty slug)
foreach ($a in $archivos) {
    if ($a.SlugFile -notin $slugsJson) {
        [void]$huerfanos.Add($a)
    }
}

# REPORTE
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  RESULTADO" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  OK:                    $($ok.Count)" -ForegroundColor Green
Write-Host "  FIXABLES (auto):       $($fixables.Count)" -ForegroundColor Yellow
Write-Host "  ROTAS (ambiguas):      $($rotas.Count)" -ForegroundColor Red
Write-Host "  SIN ARCHIVO:           $($sinArchivo.Count)" -ForegroundColor Red
Write-Host "  HUERFANOS:             $($huerfanos.Count)" -ForegroundColor Magenta
Write-Host "  SLUGS DUPLICADOS:      $($duplicados.Count)" -ForegroundColor Red
Write-Host ""

if ($fixables.Count -gt 0) {
    Write-Host "--- FIXABLES AUTOMATICAMENTE ---" -ForegroundColor Yellow
    $fixables | Select-Object -First 30 | Format-Table -AutoSize Nombre, SlugJson, SlugCorrecto, Razon
    Write-Host ""
}

if ($rotas.Count -gt 0) {
    Write-Host "--- ROTAS AMBIGUAS ---" -ForegroundColor Red
    $rotas | Format-Table -AutoSize Nombre, SlugJson, Candidatos
    Write-Host ""
}

if ($sinArchivo.Count -gt 0) {
    Write-Host "--- SIN ARCHIVO ---" -ForegroundColor Red
    $sinArchivo | Format-Table -AutoSize Nombre, SlugJson, Ciudad, Source
    Write-Host ""
}

if ($huerfanos.Count -gt 0) {
    Write-Host "--- HUERFANOS (archivo sin entrada en JSON) ---" -ForegroundColor Magenta
    $huerfanos | Select-Object -First 30 | Format-Table -AutoSize SlugFile, Size
    Write-Host ""
}

if ($duplicados.Count -gt 0) {
    Write-Host "--- SLUGS DUPLICADOS ---" -ForegroundColor Red
    $duplicados | Format-Table -AutoSize Slug, Count
    Write-Host ""
}

# Exportar
$fixables   | Export-Csv (Join-Path $base 'aud-fixables.csv')   -NoTypeInformation -Encoding UTF8
$rotas      | Export-Csv (Join-Path $base 'aud-rotas.csv')      -NoTypeInformation -Encoding UTF8
$sinArchivo | Export-Csv (Join-Path $base 'aud-sin-archivo.csv') -NoTypeInformation -Encoding UTF8
$huerfanos  | Export-Csv (Join-Path $base 'aud-huerfanos.csv')  -NoTypeInformation -Encoding UTF8

Write-Host "CSVs exportados: aud-fixables.csv, aud-rotas.csv, aud-sin-archivo.csv, aud-huerfanos.csv" -ForegroundColor Cyan