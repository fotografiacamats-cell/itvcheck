# ============================================================
# limpiar-sitemap.ps1
# Lee sitemap.xml, normaliza URLs (sin .html, /index, http, www),
# deduplica y regenera sitemap-limpio.xml conservando lastmod,
# changefreq y priority de la primera aparición.
# ============================================================

param(
    [string]$Entrada = ".\sitemap.xml",
    [string]$Salida  = ".\sitemap-limpio.xml"
)

if (-not (Test-Path $Entrada)) {
    Write-Host "No existe $Entrada" -ForegroundColor Red
    exit 1
}

Write-Host "Leyendo $Entrada..." -ForegroundColor Cyan
$xml = [xml](Get-Content $Entrada -Raw -Encoding UTF8)

$originales = @($xml.urlset.url).Count
Write-Host "URLs originales: $originales" -ForegroundColor Yellow

# Diccionario ordenado: URL normalizada -> metadatos
$mapa = [ordered]@{}

foreach ($u in $xml.urlset.url) {
    $loc = $u.loc.Trim()

    # Normalizar
    $n = $loc -replace '^http://', 'https://'
    $n = $n -replace '^https://www\.', 'https://'
    $n = $n -replace '/index(\.html)?$', '/'
    $n = $n -replace '\.html$', ''
    if ($n -ne 'https://itvcheck.es/' -and $n.EndsWith('/')) {
        $n = $n.TrimEnd('/')
    }
    $n = $n -replace '\?.*$', ''

    if (-not $mapa.Contains($n)) {
        $mapa[$n] = @{
            lastmod    = if ($u.lastmod)    { $u.lastmod }    else { $null }
            changefreq = if ($u.changefreq) { $u.changefreq } else { $null }
            priority   = if ($u.priority)   { $u.priority }   else { $null }
        }
    }
}

$finales = $mapa.Count
$eliminadas = $originales - $finales

Write-Host "URLs únicas tras normalizar: $finales" -ForegroundColor Yellow
Write-Host "Duplicados eliminados: $eliminadas" -ForegroundColor Yellow

# Generar XML
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine('<?xml version="1.0" encoding="UTF-8"?>')
[void]$sb.AppendLine('<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">')

foreach ($loc in $mapa.Keys) {
    $meta = $mapa[$loc]
    [void]$sb.AppendLine('  <url>')
    [void]$sb.AppendLine("    <loc>$loc</loc>")
    if ($meta.lastmod)    { [void]$sb.AppendLine("    <lastmod>$($meta.lastmod)</lastmod>") }
    if ($meta.changefreq) { [void]$sb.AppendLine("    <changefreq>$($meta.changefreq)</changefreq>") }
    if ($meta.priority)   { [void]$sb.AppendLine("    <priority>$($meta.priority)</priority>") }
    [void]$sb.AppendLine('  </url>')
}

[void]$sb.AppendLine('</urlset>')

$sb.ToString() | Out-File -FilePath $Salida -Encoding UTF8

Write-Host ""
Write-Host "Sitemap generado: $Salida" -ForegroundColor Green
Write-Host "URLs finales: $finales" -ForegroundColor Green