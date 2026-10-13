# marcar-duplicado.ps1 - sin acentos literales

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'

$j = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$cambios = 0

foreach ($e in $j.estaciones) {
    if ($e.nombre -eq 'ITV VEIASA MÁLAGA EL VISO' -and $e.source -eq 'dgt-new') {
        $e.source = 'duplicate-of-itv-el-viso'
        $cambios++
        Write-Host "Marcado: $($e.nombre)" -ForegroundColor Green
    }
}

$j | ConvertTo-Json -Depth 5 | Out-File $jsonFile -Encoding UTF8
Write-Host "Total marcados: $cambios" -ForegroundColor Cyan

# Verificar con -match en vez de -eq (evita problema de acentos)
$check = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$and = $check.estaciones | Where-Object { $_.ccaa -match 'Andaluc' -and $_.source -eq 'dgt-new' }
Write-Host "Fichas pendientes Andalucia ahora: $($and.Count)" -ForegroundColor Cyan