$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$results = @()

Get-ChildItem -Recurse -Filter *.html | Where-Object { $_.Name -ne "404.html" } | ForEach-Object {
    $content = Get-Content $_.FullName -Raw -Encoding UTF8

    $matches = [regex]::Matches($content, '<a[^>]+href="(https://www\.amazon\.es/[^"]+)"[^>]*>(.*?)</a>')

    foreach ($m in $matches) {
        $url = $m.Groups[1].Value
        $texto = ($m.Groups[2].Value -replace '<[^>]+>', '').Trim()
        if ($texto.Length -gt 60) { $texto = $texto.Substring(0, 60) + "..." }

        $tipo = if ($url -match '/s\?k=') { "BUSQUEDA" } elseif ($url -match '/dp/') { "PRODUCTO" } else { "OTRO" }
        $asin = if ($url -match '/dp/([A-Z0-9]{10})') { $Matches[1] } else { "" }

        $results += [PSCustomObject]@{
            Archivo = $_.Name
            Tipo = $tipo
            ASIN = $asin
            Texto = $texto
            URL = $url
        }
    }
}

$busqueda = $results | Where-Object { $_.Tipo -eq "BUSQUEDA" }
$producto = $results | Where-Object { $_.Tipo -eq "PRODUCTO" }
$otro = $results | Where-Object { $_.Tipo -eq "OTRO" }

Write-Host ""
Write-Host "=== AUDITORIA DE ENLACES DE AMAZON ===" -ForegroundColor Cyan
Write-Host "Total enlaces: $($results.Count)"
Write-Host "  BUSQUEDA (/s?k=): $($busqueda.Count)" -ForegroundColor Red
Write-Host "  PRODUCTO (/dp/):  $($producto.Count)" -ForegroundColor Green
Write-Host "  OTROS:            $($otro.Count)" -ForegroundColor Yellow
Write-Host ""

Write-Host "=== BUSQUEDAS UNICAS (a reemplazar) ===" -ForegroundColor Red
$busqueda | Group-Object URL | Sort-Object Count -Descending | ForEach-Object {
    Write-Host "[$($_.Count) usos] $($_.Name)"
}
Write-Host ""

Write-Host "=== PRODUCTOS UNICOS (ya tienen ASIN) ===" -ForegroundColor Green
$producto | Group-Object ASIN | Sort-Object Count -Descending | ForEach-Object {
    $asin = $_.Name
    $ejemplo = $_.Group[0]
    Write-Host "[$($_.Count) usos] $asin - ""$($ejemplo.Texto)"""
}

$results | Export-Csv -Path "scripts\amazon-audit.csv" -NoTypeInformation -Encoding UTF8
Write-Host ""
Write-Host "Detalle completo exportado a: scripts\amazon-audit.csv" -ForegroundColor Cyan
