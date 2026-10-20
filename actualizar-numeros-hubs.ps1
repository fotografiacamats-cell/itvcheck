# actualizar-numeros-hubs.ps1
# Actualiza TODOS los numeros hardcodeados en los 19 hubs CCAA
# - Aside (datos clave): "N Estaciones de ITV"
# - Data-bar: "N Estaciones autorizadas"
# - Peculiaridades: "N estaciones en toda la comunidad"
# - FAQ HTML: "Actualmente hay N estaciones"
# - FAQ JSON-LD: "Actualmente hay N estaciones autorizadas"
# - Mag-notice: "hay N estaciones de ITV"
# - Schema Article (corrige encoding y "Castilla y Leon" cruzado)

$ErrorActionPreference = 'Stop'
$base = 'C:\Users\Usuario\Desktop\ITVcheck'

# Mapeo hub -> CCAA exacta (con [char] para evitar problemas de encoding)
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

# Contar TODAS las estaciones por CCAA (no solo las que tienen HTML)
$totalPorCCAA = @{}
foreach($e in $json.estaciones) {
    if(-not $totalPorCCAA.ContainsKey($e.ccaa)) { $totalPorCCAA[$e.ccaa] = 0 }
    $totalPorCCAA[$e.ccaa]++
}

# Helper para entidades HTML
function A-HtmlEntidades($s) {
    $r = $s
    $r = $r -replace [char]0x00E1, '&aacute;'
    $r = $r -replace [char]0x00E9, '&eacute;'
    $r = $r -replace [char]0x00ED, '&iacute;'
    $r = $r -replace [char]0x00F3, '&oacute;'
    $r = $r -replace [char]0x00FA, '&uacute;'
    $r = $r -replace [char]0x00F1, '&ntilde;'
    return $r
}

$resumen = @()

foreach($hubFile in $mapeo.Keys) {
    $hubPath = Join-Path $base $hubFile
    if(-not (Test-Path $hubPath)) { continue }
    
    $ccaa = $mapeo[$hubFile]
    $total = if($totalPorCCAA.ContainsKey($ccaa)) { $totalPorCCAA[$ccaa] } else { 0 }
    $nombreHtml = A-HtmlEntidades $ccaa
    
    $html = Get-Content $hubPath -Raw -Encoding UTF8
    $cambios = 0
    
    # ==========================================
    # 1. ASIDE: <span class="n">N</span><span class="l">Estaciones de ITV
    # ==========================================
    $patternAside = '(<span class="n">)\d+(</span><span class="l">Estaciones de ITV)'
    $matchesAside = [regex]::Matches($html, $patternAside)
    if($matchesAside.Count -gt 0) {
        $html = [regex]::Replace($html, $patternAside, "`${1}$total`${2}")
        $cambios += $matchesAside.Count
    }
    
    # ==========================================
    # 2. DATA-BAR: <span class="n">N<small></small></span><span class="l">Estaciones autorizadas
    # ==========================================
    $patternDataBar = '(<span class="n">)\d+(<small></small></span><span class="l">Estaciones autorizadas)'
    $matchesDataBar = [regex]::Matches($html, $patternDataBar)
    if($matchesDataBar.Count -gt 0) {
        $html = [regex]::Replace($html, $patternDataBar, "`${1}$total`${2}")
        $cambios += $matchesDataBar.Count
    }
    
    # ==========================================
    # 3. PECULIARIDADES: "N estaciones en toda la comunidad"
    # ==========================================
    $patternPec = '(\b)\d+(\s+estaciones en toda la comunidad)'
    $matchesPec = [regex]::Matches($html, $patternPec)
    if($matchesPec.Count -gt 0) {
        $html = [regex]::Replace($html, $patternPec, "`${1}$total`${2}")
        $cambios += $matchesPec.Count
    }
    
    # ==========================================
    # 4. FAQ HTML: "Actualmente hay <strong>N estaciones</strong>"
    # ==========================================
    $patternFaqHtml = '(Actualmente hay <strong>)\d+( estaciones</strong>)'
    $matchesFaqHtml = [regex]::Matches($html, $patternFaqHtml)
    if($matchesFaqHtml.Count -gt 0) {
        $html = [regex]::Replace($html, $patternFaqHtml, "`${1}$total`${2}")
        $cambios += $matchesFaqHtml.Count
    }
    
    # ==========================================
    # 5. FAQ JSON-LD: "Actualmente hay N estaciones autorizadas."
    # ==========================================
    $patternFaqJson = '("Actualmente hay )\d+( estaciones autorizadas)'
    $matchesFaqJson = [regex]::Matches($html, $patternFaqJson)
    if($matchesFaqJson.Count -gt 0) {
        $html = [regex]::Replace($html, $patternFaqJson, "`${1}$total`${2}")
        $cambios += $matchesFaqJson.Count
    }
    
    # ==========================================
    # 6. MAG-NOTICE: "hay <strong>N estaciones</strong> de ITV"
    # ==========================================
    $patternNotice = '(<strong>)\d+( estaciones</strong> de ITV)'
    $matchesNotice = [regex]::Matches($html, $patternNotice)
    if($matchesNotice.Count -gt 0) {
        $html = [regex]::Replace($html, $patternNotice, "`${1}$total`${2}")
        $cambios += $matchesNotice.Count
    }
    
    # ==========================================
    # 7. Variantes: "unas N estaciones" y "mas de N estaciones"
    # ==========================================
    $patternUnas = '(unas )\d+( estaciones)'
    $matchesUnas = [regex]::Matches($html, $patternUnas)
    if($matchesUnas.Count -gt 0) {
        $html = [regex]::Replace($html, $patternUnas, "`${1}$total`${2}")
        $cambios += $matchesUnas.Count
    }
    
    $patternMas = '(m&aacute;s de )\d+( estaciones)'
    $matchesMas = [regex]::Matches($html, $patternMas)
    if($matchesMas.Count -gt 0) {
        $html = [regex]::Replace($html, $patternMas, "`${1}$total`${2}")
        $cambios += $matchesMas.Count
    }
    
    # ==========================================
    # 8. FIX Schema Article: description corrupta
    # ==========================================
    # Buscar el bloque Article y arreglar la description
    $patternArticle = '("@type":"Article"[^}]+?"description":")[^"]+(")'
    $matchesArticle = [regex]::Matches($html, $patternArticle)
    if($matchesArticle.Count -gt 0) {
        $descArticle = "ITV en $ccaa 2026: precios, $total estaciones, operadores y consejos para ahorrar. Gu" + [char]0x00ED + "a actualizada."
        $html = [regex]::Replace($html, $patternArticle, "`${1}$descArticle`${2}")
        $cambios += $matchesArticle.Count
    }
    
    Set-Content -Path $hubPath -Value $html -Encoding UTF8 -NoNewline
    
    $resumen += [PSCustomObject]@{
        Hub = $hubFile
        CCAA = $ccaa
        Total = $total
        Cambios = $cambios
    }
    
    Write-Host ("  {0,-30} -> total {1,3} | {2} reemplazos" -f $hubFile, $total, $cambios) -ForegroundColor Green
}

Write-Host ""
Write-Host "=== RESUMEN ===" -ForegroundColor Cyan
$resumen | Format-Table -AutoSize
Write-Host "Total hubs: $($resumen.Count)" -ForegroundColor Green
$totalReemplazos = ($resumen | Measure-Object -Property Cambios -Sum).Sum
Write-Host "Total reemplazos: $totalReemplazos" -ForegroundColor Cyan