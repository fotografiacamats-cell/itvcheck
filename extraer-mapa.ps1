# extraer-mapa.ps1 v2 — con InvariantCulture para separador decimal correcto

$ErrorActionPreference = 'Stop'
$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$mapFile = Join-Path $base 'estaciones-itv.html'
$outFile = Join-Path $base 'estaciones-actuales.csv'

if (-not (Test-Path $mapFile)) { throw "No encuentro $mapFile" }

# Forzar cultura invariante para todo el script (punto decimal, sin separador de miles)
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

Write-Host "Leyendo $mapFile..." -ForegroundColor Cyan
$html = Get-Content $mapFile -Raw -Encoding UTF8

$match = [regex]::Match($html, '(?s)var estaciones\s*=\s*\[(.*?)\];')
if (-not $match.Success) { throw "No encuentro el array 'estaciones' en el HTML." }

$body = $match.Groups[1].Value
$lineas = $body -split "`n" | Where-Object { $_ -match "nombre\s*:\s*'" }

Write-Host "Detectadas $($lineas.Count) lineas de estacion." -ForegroundColor Cyan

function GetCampo($l, $nombre) {
    $r = [regex]::Match($l, "$nombre\s*:\s*'([^']*)'")
    if ($r.Success) { return $r.Groups[1].Value } else { return '' }
}
function GetNum($l, $nombre) {
    $r = [regex]::Match($l, "$nombre\s*:\s*(-?[0-9\.]+)")
    if ($r.Success) {
        # Parsear con InvariantCulture para asegurar punto decimal
        return [double]::Parse($r.Groups[1].Value, $inv)
    } else { return 0.0 }
}

$estaciones = foreach ($linea in $lineas) {
    $l = $linea.Trim()
    [PSCustomObject]@{
        nombre    = GetCampo $l 'nombre'
        ciudad    = GetCampo $l 'ciudad'
        ccaa      = GetCampo $l 'ccaa'
        operador  = GetCampo $l 'operador'
        direccion = GetCampo $l 'direccion'
        cp        = GetCampo $l 'cp'
        lat       = GetNum   $l 'lat'
        lng       = GetNum   $l 'lng'
        tipo      = GetCampo $l 'tipo'
        tel       = GetCampo $l 'tel'
    }
}

$estaciones = $estaciones | Sort-Object nombre, lat, lng -Unique
$estaciones | Export-Csv -Path $outFile -NoTypeInformation -Encoding UTF8

Write-Host ""
Write-Host "OK - Exportadas $($estaciones.Count) estaciones a $outFile" -ForegroundColor Green
Write-Host ""
Write-Host "Verificacion (debe mostrar PUNTO decimal, no coma):" -ForegroundColor Yellow
$estaciones | Select-Object -First 3 | Format-Table nombre, lat, lng -AutoSize