# limpiar-dgt.ps1 v3 - acceso posicional robusto

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$inFile  = Join-Path $base 'estaciones-dgt.csv'
$outFile = Join-Path $base 'estaciones-dgt-limpio.csv'

if (-not (Test-Path $inFile)) { throw "No encuentro $inFile" }

Write-Host "Leyendo $inFile..." -ForegroundColor Cyan
$dgt = Import-Csv $inFile -Encoding UTF8
Write-Host "Leidos $($dgt.Count) registros DGT." -ForegroundColor Cyan

# Diagnostico: mostrar las columnas detectadas
$firstRow = $dgt | Select-Object -First 1
$propNames = @($firstRow.PSObject.Properties | ForEach-Object { $_.Name })
Write-Host "Columnas detectadas ($($propNames.Count)):" -ForegroundColor Yellow
for ($i = 0; $i -lt $propNames.Count; $i++) {
    Write-Host "  [$i] $($propNames[$i])"
}
Write-Host ""

$limpio = foreach ($row in $dgt) {
    # Convertir propiedades a array plano de valores (SOLUCION BUG)
    $vals = @()
    foreach ($prop in $row.PSObject.Properties) { $vals += $prop.Value }

    # Acceso posicional (indices basados en el CSV de la DGT)
    $codigo   = if ($vals.Count -gt 3)  { $vals[3].Trim() }  else { '' }
    $ccaa     = if ($vals.Count -gt 4)  { $vals[4].Trim() }  else { '' }
    $prov     = if ($vals.Count -gt 5)  { $vals[5].Trim() }  else { '' }
    $muni     = if ($vals.Count -gt 6)  { $vals[6].Trim().TrimEnd(',').Trim() } else { '' }
    $operador = if ($vals.Count -gt 7)  { $vals[7].Trim() }  else { '' }
    $dir      = if ($vals.Count -gt 8)  { $vals[8].Trim() }  else { '' }
    $rawCP    = if ($vals.Count -gt 9)  { $vals[9].Trim() }  else { '' }
    $rawTel   = if ($vals.Count -gt 10) { $vals[10].Trim() } else { '' }
    $rawLat   = if ($vals.Count -gt 13) { $vals[13].Trim() } else { '0' }
    $rawLng   = if ($vals.Count -gt 14) { $vals[14].Trim() } else { '0' }
    $info     = if ($vals.Count -gt 17) { $vals[17].Trim() } else { '' }

    if (-not $codigo) { continue }

    $lat = [double]::Parse(($rawLat -replace ',', '.'), $inv)
    $lng = [double]::Parse(($rawLng -replace ',', '.'), $inv)

    $slug    = if ($info -match 'post_name:([^,]+)')  { $matches[1] } else { '' }
    $title   = if ($info -match 'post_title:([^,]+)') { $matches[1] } else { '' }
    $pinCity = if ($info -match 'Pin_city:([^,]+)')   { $matches[1] } else { '' }

    $cp  = if ($rawCP)  { $rawCP.PadLeft(5, '0') } else { '' }
    $tel = if ($rawTel) { ($rawTel -split '[\/]{1,2}' | Select-Object -First 1).Trim() } else { '' }

    [PSCustomObject]@{
        codigo_centro = $codigo
        operador      = $operador
        ccaa          = $ccaa
        provincia     = $prov
        municipio     = $muni
        direccion     = $dir
        cp            = $cp
        telefono      = $tel
        lat           = $lat
        lng           = $lng
        post_title    = $title
        post_name     = $slug
        pin_city      = $pinCity
    }
}

$antes   = @($limpio).Count
$limpio  = $limpio | Sort-Object lat, lng -Unique
$despues = @($limpio).Count

Write-Host "Deduplicados: $antes -> $despues" -ForegroundColor Yellow

$limpio | Export-Csv -Path $outFile -NoTypeInformation -Encoding UTF8

Write-Host ""
Write-Host "OK - $despues estaciones DGT limpias en $outFile" -ForegroundColor Green
Write-Host ""
Write-Host "Resumen por CCAA:" -ForegroundColor Yellow
$limpio | Group-Object ccaa | Sort-Object Count -Descending | Format-Table Count, Name -AutoSize