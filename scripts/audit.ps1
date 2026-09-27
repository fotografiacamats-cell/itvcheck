# scripts/audit.ps1
# Auditoria previa: detecta problemas antes de arreglarlos

Write-Host "Auditando ITVcheck..." -ForegroundColor Cyan

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$issues = @()

# 1. Footers mal cerrados
$bad = Select-String -Path *.html -Pattern '<footer<footer>' -ErrorAction SilentlyContinue
if ($bad) { $issues += "X Footers mal cerrados: $($bad.Count) ocurrencias" }

# 2. Referencias residuales [reference:N]
$bad = Select-String -Path *.html -Pattern '\[reference:\d+\]' -ErrorAction SilentlyContinue
if ($bad) { $issues += "X [reference:N] residuales: $($bad.Count) ocurrencias" }

# 3. Placeholders /i y /I
$bad = Select-String -Path *.html -Pattern 'href="/[iI]"' -ErrorAction SilentlyContinue
if ($bad) { $issues += "X Placeholders /i /I: $($bad.Count) ocurrencias" }

# 4. Slots falsos de AdSense
$bad = Select-String -Path *.html -Pattern 'data-ad-slot="(1234567890|0987654321)"' -ErrorAction SilentlyContinue
if ($bad) { $issues += "[!] Slots AdSense placeholder: $($bad.Count) ocurrencias" }

# 5. Meta descriptions duplicadas
$metas = Get-ChildItem -Filter *.html | ForEach-Object {
    $m = Select-String -Path $_.FullName -Pattern 'name="description" content="([^"]+)"'
    if ($m) { [PSCustomObject]@{ File = $_.Name; Meta = $m.Matches.Groups[1].Value } }
}
$dup = $metas | Group-Object Meta | Where-Object { $_.Count -gt 1 }
if ($dup) { $issues += "X Meta descriptions duplicadas: $($dup.Count) grupos" }

# 6. Archivos sin canonical
$noCanon = Get-ChildItem -Filter *.html | Where-Object {
    -not (Select-String -Path $_.FullName -Pattern '<link rel="canonical"' -Quiet)
}
if ($noCanon) { $issues += "[!] Sin canonical: $($noCanon.Name -join ', ')" }

# Reporte final
if ($issues.Count -eq 0) {
    Write-Host "OK. Sin issues detectados." -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Issues encontrados:" -ForegroundColor Yellow
    $issues | ForEach-Object { Write-Host $_ }
}
