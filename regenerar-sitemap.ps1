# regenerar-sitemap.ps1
# Sustituye las URLs de fichas de estacion en el sitemap por las correctas

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'
$sitemapFile = Join-Path $base 'sitemap.xml'
$estDir = Join-Path $base 'estaciones'

# Backup
Copy-Item $sitemapFile "$sitemapFile.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')" -Force

# Cargar
$json = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$sitemap = Get-Content $sitemapFile -Raw -Encoding UTF8

# Stats previas
$urlsAntes = ([regex]::Matches($sitemap, '<loc>([^<]+)</loc>')).Count
$urlsEstacionAntes = ([regex]::Matches($sitemap, '<loc>[^<]*/estaciones/itv-[^<]*</loc>')).Count

Write-Host "URLs antes: $urlsAntes" -ForegroundColor Cyan
Write-Host "  De las cuales son fichas: $urlsEstacionAntes" -ForegroundColor Cyan

# Eliminar todos los <url>...</url> que apunten a /estaciones/itv-*
$patronEstacion = '(?s)\s*<url>\s*<loc>[^<]*/estaciones/itv-[^<]*</loc>.*?</url>'
$sitemapLimpio = [regex]::Replace($sitemap, $patronEstacion, '')

$urlsEstacionDespues = ([regex]::Matches($sitemapLimpio, '<loc>[^<]*/estaciones/itv-[^<]*</loc>')).Count
Write-Host "Fichas eliminadas del sitemap: $urlsEstacionAntes" -ForegroundColor Yellow
Write-Host "Fichas que quedan (deberian ser 0): $urlsEstacionDespues" -ForegroundColor $(if ($urlsEstacionDespues -eq 0) { 'Green' } else { 'Red' })

# Construir el bloque nuevo de fichas
$fichas = $json.estaciones | Where-Object { $_.source -in @('site','site-orphan') }
$hoy = (Get-Date -Format 'yyyy-MM-dd')

$sb = New-Object System.Text.StringBuilder
$incluidas = 0
$sinArchivo = @()

foreach ($e in $fichas) {
    $slug = $e.slug
    if (-not $slug) { continue }

    # Verificar que el archivo existe
    $filePath = Join-Path $estDir "$slug.html"
    if (-not (Test-Path $filePath)) {
        $sinArchivo += $slug
        continue
    }

    $url = "https://itvcheck.es/estaciones/$slug"
    [void]$sb.AppendLine("  <url>")
    [void]$sb.AppendLine("    <loc>$url</loc>")
    [void]$sb.AppendLine("    <lastmod>$hoy</lastmod>")
    [void]$sb.AppendLine("    <changefreq>monthly</changefreq>")
    [void]$sb.AppendLine("    <priority>0.7</priority>")
    [void]$sb.AppendLine("  </url>")
    $incluidas++
}

# Insertar el bloque nuevo antes de </urlset>
$bloqueNuevo = $sb.ToString().TrimEnd()
$sitemapFinal = $sitemapLimpio -replace '</urlset>', "$bloqueNuevo`n</urlset>"

Set-Content $sitemapFile -Value $sitemapFinal -Encoding UTF8 -NoNewline

$urlsFinales = ([regex]::Matches($sitemapFinal, '<loc>([^<]+)</loc>')).Count

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  SITEMAP REGENERADO" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  URLs totales antes:     $urlsAntes" -ForegroundColor Cyan
Write-Host "  Fichas eliminadas:      $urlsEstacionAntes" -ForegroundColor Yellow
Write-Host "  Fichas a&ntilde;adidas:          $incluidas" -ForegroundColor Green
Write-Host "  URLs totales ahora:     $urlsFinales" -ForegroundColor Green
Write-Host ""

if ($sinArchivo.Count -gt 0) {
    Write-Host "AVISO: $($sinArchivo.Count) fichas no tienen archivo HTML:" -ForegroundColor Red
    $sinArchivo | Select-Object -First 10 | ForEach-Object { Write-Host "  $_" -ForegroundColor DarkRed }
    Write-Host ""
}

# Verificar integridad
Write-Host "Verificando integridad..." -ForegroundColor Cyan
$urls = [regex]::Matches($sitemapFinal, '<loc>([^<]+)</loc>') | ForEach-Object { $_.Groups[1].Value }
$rotas = @()
foreach ($u in $urls) {
    if ($u -match '/estaciones/(itv-[^/]+)$') {
        $slugEnUrl = $matches[1]
        $filePath = Join-Path $estDir "$slugEnUrl.html"
        if (-not (Test-Path $filePath)) {
            $rotas += $u
        }
    }
}

if ($rotas.Count -eq 0) {
    Write-Host "OK - Cero URLs de estacion rotas en el sitemap" -ForegroundColor Green
} else {
    Write-Host "AVISO - $($rotas.Count) URLs rotas:" -ForegroundColor Red
    $rotas | Select-Object -First 10 | ForEach-Object { Write-Host "  $_" -ForegroundColor DarkRed }
}