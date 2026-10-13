# aplicar-titulos.ps1
# Aplica nuevos <title> y meta description desde titulos-nuevos.csv

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$csvFile = Join-Path $base 'titulos-nuevos.csv'
$estDir  = Join-Path $base 'estaciones'

if (-not (Test-Path $csvFile)) { throw "No encuentro $csvFile" }

$cambios = Import-Csv $csvFile -Encoding UTF8
Write-Host "Cambios a aplicar: $($cambios.Count)" -ForegroundColor Cyan

$ok = 0
$errores = @()

foreach ($c in $cambios) {
    $slug = $c.slug.Trim()
    $filePath = Join-Path $estDir "$slug.html"

    if (-not (Test-Path $filePath)) {
        $errores += "NO ENCONTRADO: $slug.html"
        continue
    }

    $content = Get-Content $filePath -Raw -Encoding UTF8
    $original = $content

    # Reemplazar <title>
    $patronTitle = '<title>[^<]*</title>'
    $nuevoTitle = '<title>' + $c.nuevo_title + '</title>'
    $content = [regex]::Replace($content, $patronTitle, $nuevoTitle, 1)

    # Reemplazar meta description
    $patronMeta = '<meta name="description" content="[^"]*">'
    $nuevaMeta = '<meta name="description" content="' + $c.nueva_description + '">'
    $content = [regex]::Replace($content, $patronMeta, $nuevaMeta, 1)

    if ($content -ne $original) {
        Set-Content -Path $filePath -Value $content -Encoding UTF8 -NoNewline
        Write-Host "OK: $slug.html" -ForegroundColor Green
        $ok++
    } else {
        Write-Host "SIN CAMBIOS: $slug.html" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  RESULTADO" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Actualizados: $ok / $($cambios.Count)" -ForegroundColor Green
if ($errores.Count -gt 0) {
    Write-Host "  Errores: $($errores.Count)" -ForegroundColor Red
    $errores | ForEach-Object { Write-Host "    $_" -ForegroundColor DarkRed }
}