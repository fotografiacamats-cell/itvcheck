# ============================================================
# Extrae datos de las 18 CCAA restantes para el config del rediseno v2
# ============================================================

$base = "C:\Users\Usuario\Desktop\ITVcheck"
$tempDir = "$base\temp"
if (-not (Test-Path $tempDir)) { New-Item -ItemType Directory -Path $tempDir | Out-Null }

$ccaas = @(
    'itv-andalucia', 'itv-aragon', 'itv-asturias', 'itv-baleares',
    'itv-canarias', 'itv-cantabria', 'itv-castillalamancha', 'itv-castillayleon',
    'itv-cataluna', 'itv-ceuta', 'itv-extremadura', 'itv-galicia',
    'itv-larioja', 'itv-melilla', 'itv-murcia', 'itv-navarra',
    'itv-paisvasco', 'itv-valencia'
)

$resultado = [ordered]@{}

foreach ($slug in $ccaas) {
    $archivo = "$base\$slug.html"
    if (-not (Test-Path $archivo)) {
        Write-Host "NO EXISTE: $slug.html" -ForegroundColor Red
        continue
    }

    $c = [System.IO.File]::ReadAllText($archivo, [System.Text.UTF8Encoding]::new($false))

    # H1
    $h1Match = [regex]::Match($c, '(?s)<h1[^>]*>(.*?)</h1>')
    $h1 = if ($h1Match.Success) {
        ($h1Match.Groups[1].Value -replace '<[^>]+>', '' -replace '\s+', ' ').Trim()
    } else { '' }

    # Meta description
    $mdMatch = [regex]::Match($c, '<meta\s+name="description"\s+content="([^"]*)"')
    $metaDesc = if ($mdMatch.Success) { $mdMatch.Groups[1].Value } else { '' }

    # Title
    $titleMatch = [regex]::Match($c, '<title>([^<]+)</title>')
    $title = if ($titleMatch.Success) { $titleMatch.Groups[1].Value } else { '' }

    # Estaciones
    $stationMatches = [regex]::Matches($c, 'href="(estaciones/itv-[^"]+\.html)"[^>]*>([^<]+)</a>')
    $stations = @()
    foreach ($m in $stationMatches) {
        $stations += @{
            url    = $m.Groups[1].Value
            nombre = $m.Groups[2].Value.Trim()
        }
    }

    # Operadores (busqueda simple)
    $operadores = @()
    $ops = @('Applus','SGS','TUV','Itevelesa','VEIASA','SITVAL','ITVASA','Dekra','Itasua','SYC','Ivesur','Euroitvs','Motielco','ITV Go','IDV','Rheinland')
    foreach ($op in $ops) {
        if ($c -match [regex]::Escape($op)) {
            $operadores += $op
        }
    }

    # Precios detectados (usa escape unicode para el simbolo euro)
    $preciosMatches = [regex]::Matches($c, '(\d{2}[,.]\d{2}\s*\u20AC|\d{2}-\d{2}\s*\u20AC)')
    $precios = @()
    foreach ($m in $preciosMatches) { $precios += $m.Value }

    $kb = [math]::Round((Get-Item $archivo).Length / 1024, 1)

    $resultado[$slug] = [ordered]@{
        h1                = $h1
        title             = $title
        meta_description  = $metaDesc
        estaciones        = $stations
        num_estaciones    = $stations.Count
        operadores        = $operadores
        precios_raw       = $precios
        tamano_kb         = $kb
    }

    Write-Host ("{0,-30} {1,3} estaciones  -  {2,6} KB" -f $slug, $stations.Count, $kb) -ForegroundColor Green
}

$json = $resultado | ConvertTo-Json -Depth 10
$outPath = "$tempDir\extraccion-ccaa.json"
[System.IO.File]::WriteAllText($outPath, $json, [System.Text.UTF8Encoding]::new($false))

Write-Host ""
Write-Host "JSON guardado en: $outPath" -ForegroundColor Cyan
Write-Host "Siguiente paso: pegame el contenido del JSON" -ForegroundColor Yellow