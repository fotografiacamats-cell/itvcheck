$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$results = @()

Get-ChildItem -Recurse -Filter *.html | Where-Object {
    $_.Name -notin @('404.html') -and $_.DirectoryName -notmatch 'scripts'
} | ForEach-Object {
    $content = Get-Content $_.FullName -Raw -Encoding UTF8

    if ($content -match '(?s)<body[^>]*>(.*?)</body>') { $body = $Matches[1] } else { $body = $content }
    $body = $body -replace '(?s)<script.*?</script>', ''
    $body = $body -replace '(?s)<style.*?</style>', ''
    $body = $body -replace '(?s)<svg.*?</svg>', ''
    $body = $body -replace '(?s)<!--.*?-->', ''

    $text = $body -replace '<[^>]+>', ' '
    $text = $text -replace '\s+', ' '
    $text = $text.Trim()

    $words = ($text -split '\s+').Count

    $results += [PSCustomObject]@{
        Archivo = $_.Name
        Palabras = $words
    }
}

$thin = $results | Where-Object { $_.Palabras -lt 400 } | Sort-Object Palabras
$medium = $results | Where-Object { $_.Palabras -ge 400 -and $_.Palabras -lt 700 } | Sort-Object Palabras
$ok = $results | Where-Object { $_.Palabras -ge 700 }

Write-Host "`n=== ANALISIS DE CONTENIDO ===" -ForegroundColor Cyan
Write-Host "Total paginas: $($results.Count)`n"

if ($thin.Count -gt 0) {
    Write-Host "CRITICO (<400 palabras): $($thin.Count) paginas" -ForegroundColor Red
    $thin | ForEach-Object { Write-Host "  $($_.Palabras) - $($_.Archivo)" }
    Write-Host ""
}

if ($medium.Count -gt 0) {
    Write-Host "MEJORABLE (400-700): $($medium.Count) paginas" -ForegroundColor Yellow
    $medium | ForEach-Object { Write-Host "  $($_.Palabras) - $($_.Archivo)" }
    Write-Host ""
}

Write-Host "OK (700+): $($ok.Count) paginas" -ForegroundColor Green