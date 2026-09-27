$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$sinTag = @()
$conTag = 0

Get-ChildItem -Recurse -Filter *.html | Where-Object { $_.Name -ne "404.html" } | ForEach-Object {
    $content = Get-Content $_.FullName -Raw -Encoding UTF8
    $matches = [regex]::Matches($content, 'href="(https://www\.amazon\.es/[^"]+)"')

    foreach ($m in $matches) {
        $url = $m.Groups[1].Value
        if ($url -match 'tag=itvcheck-21') {
            $conTag++
        } else {
            $sinTag += [PSCustomObject]@{
                Archivo = $_.Name
                URL = $url
            }
        }
    }
}

Write-Host ""
Write-Host "=== VERIFICACION DE TAG DE AFILIADO ===" -ForegroundColor Cyan
Write-Host "Enlaces CON tag itvcheck-21:  $conTag" -ForegroundColor Green
Write-Host "Enlaces SIN tag itvcheck-21:  $($sinTag.Count)" -ForegroundColor $(if ($sinTag.Count -eq 0) { "Green" } else { "Red" })
Write-Host ""

if ($sinTag.Count -gt 0) {
    Write-Host "=== ENLACES SIN TAG (revisar) ===" -ForegroundColor Red
    $sinTag | ForEach-Object {
        Write-Host "  [$($_.Archivo)] $($_.URL)"
    }
} else {
    Write-Host "Todos los enlaces de Amazon tienen tu tag. No hay fugas." -ForegroundColor Green
}
