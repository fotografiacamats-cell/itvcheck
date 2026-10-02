$scriptPath = "C:\Users\Usuario\Desktop\ITVcheck\scripts\generar-ccaas.ps1"
$c = [System.IO.File]::ReadAllText($scriptPath, [System.Text.UTF8Encoding]::new($false))

# BUG 1: ToUpper() no respeta entidades HTML. Usar un mapa de nombres en MAYUSCULAS precomputado.
$viejo1 = '$html = $html.Replace(''{{TOPBAR_RIGHT}}'', "CCAA $ccaaNum &middot; $($m.nombre.ToUpper())")'
$nuevo1 = '$nombreUpper = $m.nombre; $nombreUpper = $nombreUpper.Replace(''&aacute;'',''A'').Replace(''&eacute;'',''E'').Replace(''&iacute;'',''I'').Replace(''&oacute;'',''O'').Replace(''&uacute;'',''U'').Replace(''&ntilde;'',''N'') | ForEach-Object { $_.ToUpper() }; $html = $html.Replace(''{{TOPBAR_RIGHT}}'', "CCAA $ccaaNum &middot; $nombreUpper")'

if ($c.Contains($viejo1)) {
    $c = $c.Replace($viejo1, $nuevo1)
    Write-Host "OK: bug 1 (topbar upper) parcheado" -ForegroundColor Green
} else {
    Write-Host "AVISO: no encontre linea topbar" -ForegroundColor Yellow
}

# BUG 2: title con entidades HTML se ve literal en la pestana del navegador
$viejo2 = '$title = "ITV $($m.nombre) 2026: Precios, Estaciones y Consejos | ITVcheck"'
$nuevo2 = '$nombrePlano = $m.nombre; $nombrePlano = $nombrePlano.Replace(''&aacute;'',''á'').Replace(''&eacute;'',''é'').Replace(''&iacute;'',''í'').Replace(''&oacute;'',''ó'').Replace(''&uacute;'',''ú'').Replace(''&ntilde;'',''ñ''); $title = "ITV $nombrePlano 2026: Precios, Estaciones y Consejos | ITVcheck"'

if ($c.Contains($viejo2)) {
    $c = $c.Replace($viejo2, $nuevo2)
    Write-Host "OK: bug 2 (title) parcheado" -ForegroundColor Green
} else {
    Write-Host "AVISO: no encontre linea title" -ForegroundColor Yellow
}

# BUG 3: meta description con entidades HTML
$viejo3 = '$metaDesc = "ITV en $($m.nombre) 2026: precios, estaciones, operadores y consejos para ahorrar. Gu&iacute;a actualizada."'
$nuevo3 = '$metaDesc = "ITV en $nombrePlano 2026: precios, estaciones, operadores y consejos para ahorrar. Guía actualizada."'

if ($c.Contains($viejo3)) {
    $c = $c.Replace($viejo3, $nuevo3)
    Write-Host "OK: bug 3 (meta description) parcheado" -ForegroundColor Green
} else {
    Write-Host "AVISO: no encontre linea meta description" -ForegroundColor Yellow
}

[System.IO.File]::WriteAllText($scriptPath, $c, [System.Text.UTF8Encoding]::new($false))

Write-Host ""
Write-Host "Ejecutando regeneracion..." -ForegroundColor Cyan
Remove-Item "C:\Users\Usuario\Desktop\ITVcheck\temp\ccaas-v2\*.html" -Force -ErrorAction SilentlyContinue
powershell -ExecutionPolicy Bypass -File $scriptPath

Write-Host ""
Write-Host "Copiando a raiz..." -ForegroundColor Cyan
Copy-Item "C:\Users\Usuario\Desktop\ITVcheck\temp\ccaas-v2\*.html" "C:\Users\Usuario\Desktop\ITVcheck\" -Force

Write-Host ""
Write-Host "Verificacion de bugs arreglados:" -ForegroundColor Cyan
$base = "C:\Users\Usuario\Desktop\ITVcheck"
foreach ($slug in @('itv-paisvasco','itv-andalucia','itv-valencia')) {
    $html = [System.IO.File]::ReadAllText("$base\$slug.html", [System.Text.UTF8Encoding]::new($false))
    $tieneUpper = $html -match '&middot;\s*PA&IACUTE;S' -or $html -match '&middot;\s*ANDAL&IACUTE;'
    $titleOk = ($html -match '<title>ITV Pa&iacute;s Vasco 2026' -or $html -match '<title>ITV Andaluc&iacute;a 2026' -or $html -match '<title>ITV Comunidad Valenciana 2026')
    $nombreUpperOk = -not ($html -match '&middot;\s*[A-Z]+&IACUTE;')
    Write-Host ("{0,-25} upperOK:{1,-8} titleOK:{2}" -f $slug, $nombreUpperOk, $titleOk)
}