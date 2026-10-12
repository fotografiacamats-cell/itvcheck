# fix-operadores-faq.ps1 - Corrige operadores y arregla FAQ del generador

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'
$csvFile  = Join-Path $base 'estaciones-dgt-limpio.csv'

# =====================================================
# 1. Recuperar operador real desde el CSV DGT
# =====================================================
Write-Host "Leyendo CSV DGT para recuperar operadores reales..." -ForegroundColor Cyan

if (-not (Test-Path $csvFile)) { throw "No encuentro $csvFile" }
$csvDgt = Import-Csv $csvFile -Encoding UTF8

# Indexar por slug (post_name) y por lat/lng para matching
$porSlug = @{}
foreach ($d in $csvDgt) {
    if ($d.post_name) {
        $key = $d.post_name.Trim().ToLower()
        $porSlug[$key] = $d
    }
}

Write-Host "CSV indexado: $($porSlug.Count) slugs unicos" -ForegroundColor Green

# Cargar JSON
$j = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json

# Corregir operadores
$corregidosOp = 0
$corregidosNombre = 0
foreach ($e in $j.estaciones) {
    # Solo si el operador es generico
    if ($e.operador -eq 'Otro' -or -not $e.operador) {
        $slug = $e.slug
        if ($slug -and $porSlug.ContainsKey($slug)) {
            $csv = $porSlug[$slug]
            if ($csv.operador) {
                $e.operador = $csv.operador.Trim()
                $corregidosOp++
            }
        }
    }
}

# Reporte
Write-Host "Operadores corregidos: $corregidosOp" -ForegroundColor Green

$j | ConvertTo-Json -Depth 5 | Out-File $jsonFile -Encoding UTF8

Write-Host ""
Write-Host "Ejemplos corregidos:" -ForegroundColor Yellow
$check = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$check.estaciones | Where-Object { $_.ccaa -eq 'Madrid' -and $_.source -eq 'dgt-new' } |
    Select-Object -First 8 nombre, operador | Format-Table -AutoSize