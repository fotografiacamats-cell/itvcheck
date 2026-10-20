param(
    [Parameter(Mandatory=$true)]
    [string]$CCAA
)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " GENERAR LOTE: $CCAA" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

Copy-Item .\data\estaciones.json .\data\estaciones_full.json -Force

$json = Get-Content .\data\estaciones.json -Raw -Encoding UTF8 | ConvertFrom-Json

$lote = @()
foreach($e in $json.estaciones) {
    $ruta = ".\estaciones\$($e.slug).html"
    if($e.ccaa -eq $CCAA -and -not (Test-Path $ruta)) {
        $lote += $e
    }
}

if($lote.Count -eq 0) {
    Write-Host "No hay estaciones pendientes en $CCAA. Todas tienen ficha." -ForegroundColor Yellow
    Move-Item .\data\estaciones_full.json .\data\estaciones.json -Force
    exit
}

Write-Host "Estaciones a generar en $CCAA : $($lote.Count)" -ForegroundColor Yellow

$jsonTemp = @{ estaciones = $lote }
$jsonTemp | ConvertTo-Json -Depth 10 | Set-Content .\data\estaciones.json -Encoding UTF8

Write-Host "Ejecutando mejorar-generador.ps1..." -ForegroundColor Cyan
.\mejorar-generador.ps1

$jsonFull = Get-Content .\data\estaciones_full.json -Raw -Encoding UTF8 | ConvertFrom-Json
$marcadas = 0
foreach($e in $jsonFull.estaciones) {
    if($e.ccaa -eq $CCAA -and $lote.slug -contains $e.slug) {
        $e.source = 'site'
        $marcadas++
    }
}
$jsonFull | ConvertTo-Json -Depth 10 | Set-Content .\data\estaciones.json -Encoding UTF8

Remove-Item .\data\estaciones_full.json -Force

Write-Host ""
Write-Host "Lote completado:" -ForegroundColor Green
Write-Host "   - Fichas generadas: $($lote.Count)" -ForegroundColor Green
Write-Host "   - Marcadas como 'site': $marcadas" -ForegroundColor Green
Write-Host ""