# diagnostico-canibalizacion.ps1 - Muestra los casos de canibalizacion

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$cruceFile = Join-Path $base 'cruce-resultado.csv'
$dgtFile   = Join-Path $base 'estaciones-dgt-limpio.csv'

$cruce = Import-Csv $cruceFile -Encoding UTF8
$dgt   = Import-Csv $dgtFile  -Encoding UTF8

# Fichas tuyas en MATCH_MUNICIPIO
$muni = $cruce | Where-Object { $_.estado -eq 'MATCH_MUNICIPIO' }

# Detectar grupos con dgt_codigo duplicado
$duplicados = $muni | Group-Object dgt_codigo | Where-Object { $_.Count -gt 1 }

foreach ($grupo in $duplicados) {
    $codigo = $grupo.Name
    $dgtInfo = $dgt | Where-Object { $_.codigo_centro.Trim() -eq $codigo } | Select-Object -First 1

    Write-Host ""
    Write-Host "══════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  DGT $codigo - $($dgtInfo.post_title)" -ForegroundColor Cyan
    Write-Host "  Municipio: $($dgtInfo.municipio) | Operador: $($dgtInfo.operador)" -ForegroundColor Gray
    Write-Host "  Direccion: $($dgtInfo.direccion) | Tel: $($dgtInfo.telefono)" -ForegroundColor Gray
    Write-Host "  Coordenadas: $($dgtInfo.lat), $($dgtInfo.lng)" -ForegroundColor Gray
    Write-Host "══════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""

    foreach ($f in $grupo.Group) {
        Write-Host "  ► TU FICHA: $($f.mi_nombre)" -ForegroundColor Yellow
        Write-Host "    Ciudad:    $($f.mi_ciudad)"
        Write-Host "    Operador:  $($f.mi_operador)"
        Write-Host "    Direccion: $($f.mi_direccion)"
        Write-Host "    Coords:    $($f.mi_lat), $($f.mi_lng)"
        Write-Host "    Distancia a DGT: $($f.distancia_m) m"
        Write-Host ""
    }
}