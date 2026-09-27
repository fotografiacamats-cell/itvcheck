# scripts/generate-sitemap.ps1
# Regenera sitemap.xml solo con paginas HTML que existen realmente

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$baseUrl = "https://itvcheck.es"
$today = (Get-Date).ToString("yyyy-MM-dd")

function Get-Priority($path) {
    if ($path -eq "/") { return "1.0" }
    if ($path -match "^/(guia-completa-itv|cuando-me-toca-itv|calculadora-precio-itv|checklist-itv|guias|itv-por-comunidad)$") { return "0.9" }
    if ($path -match "^/itv-[a-z]+$") { return "0.8" }
    if ($path -match "^/mecanica/[a-z0-9\-]+$") { return "0.6" }
    if ($path -match "^/(aviso-legal|politica-|sobre-nosotros|contacto|404)") { return "0.3" }
    return "0.5"
}

function Get-Changefreq($path) {
    if ($path -eq "/" -or $path -eq "/guias") { return "weekly" }
    if ($path -match "^/(aviso-legal|politica-|sobre-nosotros|contacto|404)") { return "yearly" }
    return "monthly"
}

$exclude = @("404.html", "index.html")

$files = Get-ChildItem -Recurse -Filter *.html | Where-Object {
    $exclude -notcontains $_.Name
}

$urls = @()

$urls += "  <url>`n    <loc>$baseUrl/</loc>`n    <lastmod>$today</lastmod>`n    <changefreq>weekly</changefreq>`n    <priority>1.0</priority>`n  </url>"

foreach ($f in $files) {
    $relative = $f.FullName.Replace($root, "").Replace("\", "/").Replace(".html", "")
    $url = "$baseUrl$relative"
    $prio = Get-Priority $relative
    $freq = Get-Changefreq $relative
    $urls += "  <url>`n    <loc>$url</loc>`n    <lastmod>$today</lastmod>`n    <changefreq>$freq</changefreq>`n    <priority>$prio</priority>`n  </url>"
}

$header = "<?xml version=`"1.0`" encoding=`"UTF-8`"?>"
$openTag = "<urlset xmlns=`"http://www.sitemaps.org/schemas/sitemap/0.9`">"
$closeTag = "</urlset>"

$sitemap = "$header`n$openTag`n$($urls -join "`n")`n$closeTag`n"

[System.IO.File]::WriteAllText("$root\sitemap.xml", $sitemap, [System.Text.UTF8Encoding]::new($false))

Write-Host "Sitemap regenerado con $($urls.Count) URLs" -ForegroundColor Green
