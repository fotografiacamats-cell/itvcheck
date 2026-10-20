# actualizar-metas-hubs.ps1
# Arregla SOLO title + meta description de los 19 hubs CCAA
# Genera contenido unico y correcto por CCAA con datos reales del JSON

$ErrorActionPreference = 'Stop'
$base = 'C:\Users\Usuario\Desktop\ITVcheck'

# Mapeo hub -> CCAA exacta (usa [char] para evitar problemas de encoding)
$mapeo = @{
    'itv-cataluna.html'         = 'Catalu' + [char]0x00F1 + 'a'
    'itv-castillayleon.html'    = 'Castilla y Le' + [char]0x00F3 + 'n'
    'itv-castillalamancha.html' = 'Castilla-La Mancha'
    'itv-andalucia.html'        = 'Andaluc' + [char]0x00ED + 'a'
    'itv-galicia.html'          = 'Galicia'
    'itv-valencia.html'         = 'Comunidad Valenciana'
    'itv-paisvasco.html'        = 'Pa' + [char]0x00ED + 's Vasco'
    'itv-aragon.html'           = 'Arag' + [char]0x00F3 + 'n'
    'itv-canarias.html'         = 'Canarias'
    'itv-asturias.html'         = 'Asturias'
    'itv-cantabria.html'        = 'Cantabria'
    'itv-extremadura.html'      = 'Extremadura'
    'itv-murcia.html'           = 'Murcia'
    'itv-navarra.html'          = 'Navarra'
    'itv-larioja.html'          = 'La Rioja'
    'itv-baleares.html'         = 'Baleares'
    'itv-ceuta.html'            = 'Ceuta'
    'itv-melilla.html'          = 'Melilla'
    'itv-madrid.html'           = 'Madrid'
}

$json = Get-Content "$base\data\estaciones.json" -Raw -Encoding UTF8 | ConvertFrom-Json

# Funcion: convertir nombre CCAA a HTML con entidades
function A-HtmlEntidades($s) {
    $r = $s
    $r = $r -replace 'á', '&aacute;'
    $r = $r -replace 'é', '&eacute;'
    $r = $r -replace 'í', '&iacute;'
    $r = $r -replace 'ó', '&oacute;'
    $r = $r -replace 'ú', '&uacute;'
    $r = $r -replace 'ñ', '&ntilde;'
    return $r
}

$resumen = @()

foreach($hubFile in $mapeo.Keys) {
    $hubPath = Join-Path $base $hubFile
    if(-not (Test-Path $hubPath)) { continue }
    
    $ccaa = $mapeo[$hubFile]
    
    # Contar estaciones con ficha HTML
    $count = 0
    foreach($e in $json.estaciones) {
        if($e.ccaa -eq $ccaa -and (Test-Path "$base\estaciones\$($e.slug).html")) {
            $count++
        }
    }
    
    # Nombre HTML (con entidades)
    $nombreHtml = A-HtmlEntidades $ccaa
    
    # Cargar HTML original
    $html = Get-Content $hubPath -Raw -Encoding UTF8
    
    # Backup por si acaso
    Copy-Item $hubPath "$hubPath.bak" -Force
    
    # Nuevos textos
    $titleNuevo = "ITV $nombreHtml 2026: Precios, $count Estaciones y Cita Previa | ITVcheck"
    $metaNuevo = "Gu&iacute;a completa de la ITV en $nombreHtml 2026: $count estaciones con tel&eacute;fono, horario y c&oacute;mo llegar. Precios oficiales y cita previa online."
    
    # Reemplazar title
    $html = $html -replace '(?s)<title>.*?</title>', "<title>$titleNuevo</title>"
    
    # Reemplazar meta description (solo la etiqueta name="description", no otras)
    $html = $html -replace '<meta name="description" content="[^"]*">', "<meta name=`"description`" content=`"$metaNuevo`">"
    
    # Reemplazar og:title y og:description si existen
    $html = $html -replace '<meta property="og:title" content="[^"]*">', "<meta property=`"og:title`" content=`"$titleNuevo`">"
    $html = $html -replace '<meta property="og:description" content="[^"]*">', "<meta property=`"og:description`" content=`"$metaNuevo`">"
    
    Set-Content -Path $hubPath -Value $html -Encoding UTF8 -NoNewline
    
    $resumen += [PSCustomObject]@{
        Hub = $hubFile
        CCAA = $ccaa
        Estaciones = $count
    }
    
    Write-Host ("  OK: {0,-30} -> {1,3} estaciones [{2}]" -f $hubFile, $count, $ccaa) -ForegroundColor Green
}

Write-Host ""
Write-Host "=== RESUMEN ===" -ForegroundColor Cyan
$resumen | Format-Table -AutoSize
Write-Host "Total hubs actualizados: $($resumen.Count)" -ForegroundColor Green
Write-Host "Backups guardados en *.html.bak" -ForegroundColor Yellow