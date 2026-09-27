param([switch]$Apply)

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$reemplazos = @{
    "https://www.amazon.es/s?k=bateria+coche+AGM&tag=itvcheck-21" = "https://www.amazon.es/dp/B0BW9HJ395?tag=itvcheck-21"
    "https://www.amazon.es/s?k=multimetro+digital+coche&tag=itvcheck-21" = "https://www.amazon.es/dp/B0FBGGP41Y?tag=itvcheck-21"
    "https://www.amazon.es/s?k=bateria+coche+EFB&tag=itvcheck-21" = "https://www.amazon.es/dp/B01EWOJW1M?tag=itvcheck-21"
    "https://www.amazon.es/s?k=escobilla+limpiaparabrisas+600mm&tag=itvcheck-21" = "https://www.amazon.es/dp/B00G27RSPU?tag=itvcheck-21"
    "https://www.amazon.es/s?k=escobilla+limpiaparabrisas+650mm&tag=itvcheck-21" = "https://www.amazon.es/dp/B002ZRQ4AG?tag=itvcheck-21"
    "https://www.amazon.es/s?k=escobilla+limpiaparabrisas+400mm&tag=itvcheck-21" = "https://www.amazon.es/dp/B00FAI41QQ?tag=itvcheck-21"
    "https://www.amazon.es/s?k=escobilla+limpiaparabrisas+450mm&tag=itvcheck-21" = "https://www.amazon.es/dp/B004INPEYW?tag=itvcheck-21"
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
