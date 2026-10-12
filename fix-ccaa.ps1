# fix-ccaa.ps1 - Rellena CCAA vacias en el JSON

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'

# Leer JSON
$json = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json

# CCAA para los 9 sin asignar (todos Pais Vasco)
$mapaCCAA = @{
    'ITV Amorebieta'         = 'País Vasco'
    'ITV Arrigorriaga'       = 'País Vasco'
    'ITV Irún'               = 'País Vasco'
    'ITV Vitoria - Jundiz'   = 'País Vasco'
    'ITV Sopela'             = 'País Vasco'
    'ITV Urnieta'            = 'País Vasco'
    'ITV Trapagaran'         = 'País Vasco'
    'ITV Zalla'              = 'País Vasco'
    'ITV Zamudio'            = 'País Vasco'
}

$cambios = 0
foreach ($e in $json.estaciones) {
    if (-not $e.ccaa -and $mapaCCAA.ContainsKey($e.nombre.Trim())) {
        $e.ccaa = $mapaCCAA[$e.nombre.Trim()]
        $cambios++
    }
}

Write-Host "Entradas corregidas: $cambios" -ForegroundColor Green

# Guardar
$json | ConvertTo-Json -Depth 5 | Out-File -FilePath $jsonFile -Encoding UTF8

# Verificar
$check = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$sinCCAA = @($check.estaciones | Where-Object { -not $_.ccaa })
Write-Host ""
Write-Host "Total entradas: $($check.total)" -ForegroundColor Cyan
Write-Host "Sin CCAA ahora: $($sinCCAA.Count)" -ForegroundColor $(if ($sinCCAA.Count -eq 0) { 'Green' } else { 'Red' })