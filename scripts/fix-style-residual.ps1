$base = "C:\Users\Usuario\Desktop\ITVcheck"

$archivos = @(
    "blog\itv-coche-mas-200000-km.html",
    "blog\itv-coche-parado-6-meses.html",
    "blog\itv-motos-ciclomotores.html"
)

foreach ($a in $archivos) {
    $ruta = "$base\$a"
    if (-not (Test-Path $ruta)) { continue }

    $c = [System.IO.File]::ReadAllText($ruta, [System.Text.UTF8Encoding]::new($false))
    $original = $c

    # Eliminar cualquier bloque <style>...</style> que contenga "h1-inline"
    # (multilinea, con cualquier contenido entre medias)
    $regex = [regex]'(?s)<style>\s*[^<]*h1-inline[^<]*</style>\s*'
    $c = $regex.Replace($c, '')

    if ($c -ne $original) {
        [System.IO.File]::WriteAllText($ruta, $c, [System.Text.UTF8Encoding]::new($false))
        Write-Host "OK: $a eliminado <style> interno" -ForegroundColor Green
    } else {
        Write-Host "SKIP: $a (nada que eliminar)" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "--- Verificacion ---" -ForegroundColor Cyan
foreach ($a in $archivos) {
    $ruta = "$base\$a"
    if (Test-Path $ruta) {
        $c = [System.IO.File]::ReadAllText($ruta, [System.Text.UTF8Encoding]::new($false))
        $tieneStyle = $c.Contains('<style>')
        $tieneHeroBlog = $c.Contains('class="mag-hero hero-blog"')
        Write-Host ("{0,-45} style:{1,-8} hero-blog:{2}" -f $a, $tieneStyle, $tieneHeroBlog)
    }
}