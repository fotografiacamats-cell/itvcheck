$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$ccaaFiles = Get-ChildItem -Filter "itv-*.html" | Where-Object {
    $_.Name -notmatch "(-por-comunidad|acoruna|alicante|barcelona|bizkaia|cadiz|granada|gipuzkoa|laspalmas|malaga|pontevedra|santacruzdetenerife|sevilla|zaragoza)\.html$"
}

Write-Host ""
Write-Host "Analizando $($ccaaFiles.Count) paginas CCAA...`n" -ForegroundColor Cyan

$frases = @{}
foreach ($f in $ccaaFiles) {
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    if ($content -match "(?s)<body[^>]*>(.*?)</body>") { $body = $Matches[1] } else { $body = $content }

    $parrafos = [regex]::Matches($body, "(?s)<p[^>]*>(.*?)</p>") | ForEach-Object {
        ($_.Groups[1].Value -replace "<[^>]+>", "").Trim()
    } | Where-Object { $_.Length -gt 60 -and $_ -notmatch "^Utilizamos cookies" }

    foreach ($p in $parrafos) {
        $hash = $p.Substring(0, [Math]::Min(80, $p.Length))
        if (-not $frases.ContainsKey($hash)) { $frases[$hash] = @() }
        $frases[$hash] += $f.Name
    }
}

$duplicadas = $frases.GetEnumerator() | Where-Object { $_.Value.Count -ge 3 } | Sort-Object { $_.Value.Count } -Descending

Write-Host "FRASES DUPLICADAS EN 3+ PAGINAS: $($duplicadas.Count)" -ForegroundColor Red
Write-Host ""

$i = 0
foreach ($d in $duplicadas) {
    if ($i -ge 15) { break }
    Write-Host "[$($d.Value.Count) paginas] $($d.Key)..." -ForegroundColor Yellow
    Write-Host "  -> $($d.Value -join ", ")" -ForegroundColor DarkGray
    Write-Host ""
    $i++
}

Write-Host "Total bloques duplicados en 3+ paginas: $($duplicadas.Count)" -ForegroundColor Cyan
