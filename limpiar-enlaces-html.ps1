# ============================================================
# limpiar-enlaces-html.ps1
# Reemplaza href="...html" por href="..." en archivos HTML vivos.
# Excluye carpetas de backup, temp, node_modules, .git, etc.
# Hace backup antes de modificar nada.
# ============================================================

$ErrorActionPreference = "Stop"
$raiz = (Get-Location).Path

# Carpetas a excluir (backups y ruido)
$excluir = @(
    "temp\",
    "estaciones-backup",
    "estaciones-backup-force",
    "node_modules\",
    ".git\",
    "backup-sitemap"
)

function Es-Vivo($ruta) {
    $rel = $ruta.Substring($raiz.Length).TrimStart("\")
    foreach ($e in $excluir) {
        if ($rel.StartsWith($e, [System.StringComparison]::OrdinalIgnoreCase)) { return $false }
    }
    return $true
}

# 1. Encontrar archivos vivos con enlaces .html
Write-Host "Buscando archivos vivos con enlaces .html..." -ForegroundColor Cyan
$vivos = Get-ChildItem -Recurse -Filter "*.html" -File |
         Where-Object { Es-Vivo $_.FullName } |
         ForEach-Object {
             $hits = Select-String -Path $_.FullName -Pattern 'href="[^"]*\.html' -AllMatches
             if ($hits) {
                 [PSCustomObject]@{
                     Archivo = $_
                     Enlaces = ($hits.Matches | Measure-Object).Count
                 }
             }
         } |
         Sort-Object Enlaces -Descending

if (-not $vivos) {
    Write-Host "No hay enlaces .html en archivos vivos. Nada que hacer." -ForegroundColor Green
    return
}

$totalEnlaces = ($vivos | Measure-Object Enlaces -Sum).Sum
Write-Host "Archivos vivos con enlaces .html: $($vivos.Count)" -ForegroundColor Yellow
Write-Host "Total enlaces .html en vivos: $totalEnlaces" -ForegroundColor Yellow
Write-Host ""
Write-Host "Top 20 archivos con más enlaces .html:" -ForegroundColor Cyan
$vivos | Select-Object -First 20 | ForEach-Object {
    "{0,5}  {1}" -f $_.Enlaces, $_.Archivo.FullName.Replace("$raiz\","")
}

# 2. Backup
$fecha = Get-Date -Format "yyyyMMdd-HHmm"
$backupDir = ".\backup-enlaces-$fecha"
New-Item -ItemType Directory -Force -Path $backupDir | Out-Null

Write-Host ""
Write-Host "Haciendo backup en $backupDir ..." -ForegroundColor Cyan
foreach ($v in $vivos) {
    $rel = $v.Archivo.FullName.Substring($raiz.Length).TrimStart("\")
    $destino = Join-Path $backupDir $rel
    $destinoDir = Split-Path $destino -Parent
    if (-not (Test-Path $destinoDir)) { New-Item -ItemType Directory -Force -Path $destinoDir | Out-Null }
    Copy-Item $v.Archivo.FullName $destino -Force
}
Write-Host "Backup completado." -ForegroundColor Green

# 3. Reemplazar
Write-Host ""
Write-Host "Reemplazando enlaces .html ..." -ForegroundColor Cyan
$modificados = 0
$enlacesCambiados = 0

foreach ($v in $vivos) {
    $ruta = $v.Archivo.FullName
    $original = Get-Content $ruta -Raw -Encoding UTF8
    $nuevo = $original

    # a) href="algo.html" -> href="algo"
    $nuevo = [regex]::Replace($nuevo, 'href="([^"]*?)\.html"', 'href="$1"')

    # b) href=".../index" -> href=".../"
    #    href="index" -> href="/"
    $nuevo = [regex]::Replace($nuevo, 'href="([^"]*?)/index"', 'href="$1/"')
    $nuevo = [regex]::Replace($nuevo, 'href="index"', 'href="/"')
    # c) href="https://itvcheck.es/index" ya cubierto por (b)
    # d) href="/index" -> href="/"
    $nuevo = [regex]::Replace($nuevo, 'href="/index"', 'href="/"')

    if ($nuevo -ne $original) {
        $diff = ([regex]::Matches($original, 'href="[^"]*?\.html"')).Count
        Set-Content -Path $ruta -Value $nuevo -Encoding UTF8 -NoNewline
        $modificados++
        $enlacesCambiados += $diff
        Write-Host ("  OK  {0}  ({1} enlaces)" -f $v.Archivo.Name, $diff) -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "Archivos modificados: $modificados" -ForegroundColor Green
Write-Host "Enlaces .html reemplazados: $enlacesCambiados" -ForegroundColor Green
Write-Host "Backup en: $backupDir" -ForegroundColor Green