$archivos = @(
    "C:\Users\Usuario\Desktop\ITVcheck\index.html",
    "C:\Users\Usuario\Desktop\ITVcheck\guias.html",
    "C:\Users\Usuario\Desktop\ITVcheck\tipos-defectos-itv.html",
    "C:\Users\Usuario\Desktop\ITVcheck\guia-completa-itv.html"
)

$emojiPattern = '\p{So}'

$totalArchivos = 0

foreach ($f in $archivos) {
    if (-not (Test-Path $f)) { continue }
    $c = [System.IO.File]::ReadAllText($f, [System.Text.UTF8Encoding]::new($false))
    $original = $c

    $c = [regex]::Replace($c, $emojiPattern, '')
    $c = $c -replace '  +', ' '
    $c = $c -replace '>\s+<', '><'

    if ($c -ne $original) {
        [System.IO.File]::WriteAllText($f, $c, [System.Text.UTF8Encoding]::new($false))
        $borrados = $original.Length - $c.Length
        Write-Host "OK: $($f | Split-Path -Leaf) - $borrados caracteres eliminados" -ForegroundColor Green
        $totalArchivos++
    } else {
        Write-Host "SKIP: $($f | Split-Path -Leaf) - sin cambios" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Total: $totalArchivos archivos modificados" -ForegroundColor Cyan