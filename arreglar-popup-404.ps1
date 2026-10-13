# arreglar-popup-404.ps1
# Oculta el boton "Ver ficha completa" si la estacion no tiene pagina
# Los 495 pines siguen visibles, pero solo los 293 con ficha muestran el boton

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$mapFile = Join-Path $base 'estaciones-itv.html'
$backupFile = Join-Path $base ('estaciones-itv.html.backup-popup-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))

Copy-Item $mapFile $backupFile -Force
Write-Host "Backup: $backupFile" -ForegroundColor Cyan

$content = Get-Content $mapFile -Raw -Encoding UTF8
$original = $content

# ============================================================
# FIX 1: popup del mapa principal (linea ~885)
# ============================================================
$patron1 = "botones \+= '<a href=""estaciones/' \+\s*e\.nombre\.toLowerCase\(\)\.normalize\([^)]+\)\.replace\([^)]+\)\.replace\([^)]+\)\.replace\([^)]+\)\.trim\(\)\.replace\([^)]+\) \+ '\.html"" class=""btn-popup"" style=""background:var\(--signal\);color:#fff;margin-top:6px;"">&?[^<]*Ver ficha completa</a>';"

if ($content -match $patron1) {
    # Reemplazar por version condicional
    $nueva1 = @'
if(e.source === 'site' || e.source === 'site-orphan'){
    botones += '<a href="estaciones/' + e.slug + '.html" class="btn-popup" style="background:var(--signal);color:#fff;margin-top:6px;">&#128196; Ver ficha completa</a>';
}
'@
    $content = [regex]::Replace($content, $patron1, $nueva1, 1)
    Write-Host "Fix 1 aplicado (popup principal)" -ForegroundColor Green
} else {
    Write-Host "AVISO: no encontro la linea del popup principal (linea 885)" -ForegroundColor Yellow
}

# ============================================================
# FIX 2: popup de "las 15 mas cercanas" (linea ~1033)
# ============================================================
$patron2 = "'<a href=""estaciones/' \+ slugify\(e\.nombre\) \+ '\.html"" class=""btn-popup"" style=""background:var\(--signal\);color:#fff;margin-top:6px;"">&?[^<]*Ver ficha completa</a>' \+"

if ($content -match $patron2) {
    $nueva2 = @'
((e.source === 'site' || e.source === 'site-orphan') ? '<a href="estaciones/' + e.slug + '.html" class="btn-popup" style="background:var(--signal);color:#fff;margin-top:6px;">&#128196; Ver ficha completa</a>' : '') +
'@
    $content = [regex]::Replace($content, $patron2, $nueva2, 1)
    Write-Host "Fix 2 aplicado (popup cercanas)" -ForegroundColor Green
} else {
    Write-Host "AVISO: no encontro la linea del popup cercanas (linea 1033)" -ForegroundColor Yellow
}

if ($content -ne $original) {
    Set-Content -Path $mapFile -Value $content -Encoding UTF8 -NoNewline
    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Yellow
    Write-Host "  POPUP ARREGLADO" -ForegroundColor Yellow
    Write-Host "==========================================" -ForegroundColor Yellow

    # Verificacion
    $check = Get-Content $mapFile -Raw -Encoding UTF8
    $condicionales = ([regex]::Matches($check, "e\.source === 'site'")).Count
    Write-Host "  Condicionales aplicadas: $condicionales (esperado: 2)" -ForegroundColor $(if ($condicionales -eq 2) { 'Green' } else { 'Yellow' })
} else {
    Write-Host "Sin cambios aplicados" -ForegroundColor Red
}