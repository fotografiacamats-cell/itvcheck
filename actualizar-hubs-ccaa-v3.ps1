# actualizar-hubs-ccaa-v3.ps1
# Encoding-safe: usa [char]0x00XX para todos los acentos
# Bug fix: fuerza array con @()

$ErrorActionPreference = 'Stop'
$base = 'C:\Users\Usuario\Desktop\ITVcheck'

# Construir nombres de CCAA con caracteres explicitos (evita problemas de encoding)
$CCAA_Cataluna          = 'Catalu' + [char]0x00F1 + 'a'          # Cataluña
$CCAA_CastillaYLeon     = 'Castilla y Le' + [char]0x00F3 + 'n'   # Castilla y León
$CCAA_CastillaLaMancha  = 'Castilla-La Mancha'
$CCAA_Andalucia         = 'Andaluc' + [char]0x00ED + 'a'         # Andalucía
$CCAA_Galicia           = 'Galicia'
$CCAA_CValenciana       = 'Comunidad Valenciana'
$CCAA_PaisVasco         = 'Pa' + [char]0x00ED + 's Vasco'        # País Vasco
$CCAA_Aragon            = 'Arag' + [char]0x00F3 + 'n'            # Aragón
$CCAA_Canarias          = 'Canarias'
$CCAA_Asturias          = 'Asturias'
$CCAA_Cantabria         = 'Cantabria'
$CCAA_Extremadura       = 'Extremadura'
$CCAA_Murcia            = 'Murcia'
$CCAA_Navarra           = 'Navarra'
$CCAA_LaRioja           = 'La Rioja'
$CCAA_Baleares          = 'Baleares'
$CCAA_Ceuta             = 'Ceuta'
$CCAA_Melilla           = 'Melilla'
$CCAA_Madrid            = 'Madrid'

# Mapeo hub -> CCAA exacta
$mapeo = @{
    'itv-cataluna.html'         = $CCAA_Cataluna
    'itv-castillayleon.html'    = $CCAA_CastillaYLeon
    'itv-castillalamancha.html' = $CCAA_CastillaLaMancha
    'itv-andalucia.html'        = $CCAA_Andalucia
    'itv-galicia.html'          = $CCAA_Galicia
    'itv-valencia.html'         = $CCAA_CValenciana
    'itv-paisvasco.html'        = $CCAA_PaisVasco
    'itv-aragon.html'           = $CCAA_Aragon
    'itv-canarias.html'         = $CCAA_Canarias
    'itv-asturias.html'         = $CCAA_Asturias
    'itv-cantabria.html'        = $CCAA_Cantabria
    'itv-extremadura.html'      = $CCAA_Extremadura
    'itv-murcia.html'           = $CCAA_Murcia
    'itv-navarra.html'          = $CCAA_Navarra
    'itv-larioja.html'          = $CCAA_LaRioja
    'itv-baleares.html'         = $CCAA_Baleares
    'itv-ceuta.html'            = $CCAA_Ceuta
    'itv-melilla.html'          = $CCAA_Melilla
    'itv-madrid.html'           = $CCAA_Madrid
}

$json = Get-Content "$base\data\estaciones.json" -Raw -Encoding UTF8 | ConvertFrom-Json

$resumen = @()

foreach($hubFile in $mapeo.Keys) {
    $hubPath = Join-Path $base $hubFile
    if(-not (Test-Path $hubPath)) { continue }
    
    $ccaa = $mapeo[$hubFile]
    
    $html = Get-Content $hubPath -Raw -Encoding UTF8
    
    # Filtrar estaciones de esta CCAA exacta
    $estaciones = @()
    foreach($e in $json.estaciones) {
        if($e.ccaa -eq $ccaa -and (Test-Path "$base\estaciones\$($e.slug).html")) {
            $estaciones += $e
        }
    }
    $estaciones = $estaciones | Sort-Object ciudad, nombre
    $count = $estaciones.Count
    
    # Detectar patron de URL del hub
    $usaBarra = $html -match 'href="/estaciones/'
    $patronURL = if($usaBarra) { '/estaciones/' } else { 'estaciones/' }
    $usaOperador = $html -match '<span class="op">'
    
    # Localizar bloque
    $marcaInicio = '<div class="ccaa-estaciones">'
    $idxInicio = $html.IndexOf($marcaInicio)
    if($idxInicio -lt 0) {
        Write-Host "  SKIP: $hubFile (sin bloque ccaa-estaciones)" -ForegroundColor DarkGray
        continue
    }
    
    $idxFooter = $html.IndexOf('<p class="footer-cta">', $idxInicio)
    if($idxFooter -lt 0) { 
        Write-Host "  SKIP: $hubFile (sin footer-cta)" -ForegroundColor DarkGray
        continue 
    }
    
    $idxCierre = $html.IndexOf('</div>', $idxFooter)
    if($idxCierre -lt 0) { continue }
    $idxCierre += '</div>'.Length
    
    # Generar bloque nuevo
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine('<div class="ccaa-estaciones">')
    [void]$sb.AppendLine("  <h2>Estaciones de ITV en $ccaa ($count)</h2>")
    [void]$sb.AppendLine('  <p class="lead">Cada estaci&oacute;n tiene su ficha con tel&eacute;fono, horario, ubicaci&oacute;n, precio orientativo y bot&oacute;n de cita previa.</p>')
    [void]$sb.AppendLine('  <ul>')
    
    foreach($e in $estaciones) {
        $nombreEsc = $e.nombre -replace '&', '&amp;'
        $opEsc = $e.operador -replace '&', '&amp;'
        if($usaOperador) {
            [void]$sb.AppendLine("    <li><a href=`"$patronURL$($e.slug).html`">$nombreEsc</a> &middot; <span class=`"op`">$opEsc</span></li>")
        } else {
            [void]$sb.AppendLine("    <li><a href=`"$patronURL$($e.slug).html`">$nombreEsc</a></li>")
        }
    }
    
    [void]$sb.AppendLine('  </ul>')
    [void]$sb.AppendLine('  <p class="footer-cta"><a href="/estaciones-itv">Ver mapa completo de estaciones &rarr;</a></p>')
    [void]$sb.Append('</div>')
    
    $bloqueNuevo = $sb.ToString()
    $htmlNuevo = $html.Substring(0, $idxInicio) + $bloqueNuevo + $html.Substring($idxCierre)
    Set-Content -Path $hubPath -Value $htmlNuevo -Encoding UTF8 -NoNewline
    
    $resumen += [PSCustomObject]@{
        Hub = $hubFile
        CCAA = $ccaa
        Fichas = $count
        Patron = $patronURL
    }
    
    $color = if($count -gt 0) { "Green" } else { "Red" }
    Write-Host ("  OK: {0,-30} -> {1,3} fichas ({2}) [{3}]" -f $hubFile, $count, $patronURL, $ccaa) -ForegroundColor $color
}

Write-Host ""
Write-Host "=== RESUMEN ===" -ForegroundColor Cyan
$resumen | Format-Table -AutoSize
$total = ($resumen | Measure-Object -Property Fichas -Sum).Sum
Write-Host "Total hubs: $($resumen.Count)" -ForegroundColor Green
Write-Host "Total fichas enlazadas: $total" -ForegroundColor Cyan