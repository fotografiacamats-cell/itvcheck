param([switch]$Apply)

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$reemplazos = @{
    "https://www.amazon.es/s?k=bombilla+W5W&tag=itvcheck-21" = "https://www.amazon.es/dp/B092JGM388?tag=itvcheck-21"
    "https://www.amazon.es/s?k=llave+carraca+10mm&tag=itvcheck-21" = "https://www.amazon.es/dp/B07SYCY2SW?tag=itvcheck-21"
}

$totalCambios = 0
$archivosCambiados = 0

Get-ChildItem -Recurse -Filter *.html | Where-Object { $_.Name -ne "404.html" } | ForEach-Object {
    $content = Get-Content $_.FullName -Raw -Encoding UTF8
    $original = $content
    $cambiosEnArchivo = 0

    foreach ($buscar in $reemplazos.Keys) {
        $contar = ([regex]::Matches($content, [regex]::Escape($buscar))).Count
        if ($contar -gt 0) {
            $cambiosEnArchivo += $contar
            $content = $content.Replace($buscar, $reemplazos[$buscar])
        }
    }

    if ($cambiosEnArchivo -gt 0) {
        $totalCambios += $cambiosEnArchivo
        $archivosCambiados++
        if ($Apply) {
            Set-Content $_.FullName -Value $content -NoNewline -Encoding UTF8
            Write-Host "  APLICADO: $($_.Name) ($cambiosEnArchivo cambios)" -ForegroundColor Green
        } else {
            Write-Host "  [DRY-RUN] $($_.Name): $cambiosEnArchivo cambios" -ForegroundColor Yellow
        }
    }
}

Write-Host ""
if ($Apply) {
    Write-Host "=== APLICADO ===" -ForegroundColor Cyan
} else {
    Write-Host "=== DRY-RUN (no se ha modificado nada) ===" -ForegroundColor Cyan
}
Write-Host "Archivos afectados: $archivosCambiados"
Write-Host "Enlaces sustituidos: $totalCambios"
