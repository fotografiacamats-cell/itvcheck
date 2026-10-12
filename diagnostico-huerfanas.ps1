# diagnostico-huerfanas.ps1 - Muestra las 5 DGT mas cercanas para cada huerfana

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$cruceFile = Join-Path $base 'cruce-resultado.csv'
$dgtFile   = Join-Path $base 'estaciones-dgt-limpio.csv'

$cruce = Import-Csv $cruceFile -Encoding UTF8
$dgt   = Import-Csv $dgtFile  -Encoding UTF8

function Get-Distancia($lat1, $lng1, $lat2, $lng2) {
    $R = 6371000.0
    $dLat = ($lat2 - $lat1) * [Math]::PI / 180
    $dLng = ($lng2 - $lng1) * [Math]::PI / 180
    $a = [Math]::Sin($dLat/2) * [Math]::Sin($dLat/2) +
         [Math]::Cos($lat1 * [Math]::PI/180) *
         [Math]::Cos($lat2 * [Math]::PI/180) *
         [Math]::Sin($dLng/2) * [Math]::Sin($dLng/2)
    return $R * 2 * [Math]::Atan2([Math]::Sqrt($a), [Math]::Sqrt(1-$a))
}

$huerfanas = $cruce | Where-Object { $_.estado -eq 'NO_MATCH' }

foreach ($h in $huerfanas) {
    Write-Host ""
    Write-Host "════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  $($h.mi_nombre) - $($h.mi_ciudad) - $($h.mi_operador)" -ForegroundColor Cyan
    Write-Host "  Coords: $($h.mi_lat), $($h.mi_lng)" -ForegroundColor DarkGray
    Write-Host "════════════════════════════════════════════════════" -ForegroundColor Cyan

    # Las 5 DGT mas cercanas
    $top = $dgt | ForEach-Object {
        [PSCustomObject]@{
            codigo = $_.codigo_centro
            titulo = $_.post_title
            muni   = $_.municipio
            op     = $_.operador
            dist   = [Math]::Round((Get-Distancia ([double]$h.mi_lat) ([double]$h.mi_lng) ([double]$_.lat) ([double]$_.lng)), 0)
        }
    } | Sort-Object dist | Select-Object -First 5

    $top | Format-Table codigo, titulo, muni, dist -AutoSize
}