$archivos = @(
    "C:\Users\Usuario\Desktop\ITVcheck\index.html",
    "C:\Users\Usuario\Desktop\ITVcheck\guias.html",
    "C:\Users\Usuario\Desktop\ITVcheck\tipos-defectos-itv.html",
    "C:\Users\Usuario\Desktop\ITVcheck\guia-completa-itv.html",
    "C:\Users\Usuario\Desktop\ITVcheck\checklist-itv.html",
    "C:\Users\Usuario\Desktop\ITVcheck\estaciones-itv.html",
    "C:\Users\Usuario\Desktop\ITVcheck\operadores-itv-espana.html"
)

$totalCambios = 0

foreach ($f in $archivos) {
    if (-not (Test-Path $f)) { continue }
    $c = [System.IO.File]::ReadAllText($f, [System.Text.UTF8Encoding]::new($false))
    $original = $c

    # Colores verdes hardcoded → ink o signal según contexto
    $c = $c.Replace('color:#10B981', 'color:var(--signal-dark)')
    $c = $c.Replace('background:#10B981', 'background:var(--signal)')
    $c = $c.Replace('background:var(--ve)', 'background:var(--signal)')
    $c = $c.Replace('color:var(--ve)', 'color:var(--signal-dark)')
    $c = $c.Replace('border-left:4px solid #10B981', 'border-left:4px solid var(--signal)')

    # Colores slate/grises Tailwind remanentes
    $c = $c.Replace('color:#0F172A', 'color:var(--ink)')
    $c = $c.Replace('color:#1E293B', 'color:var(--ink)')
    $c = $c.Replace('color:#64748B', 'color:var(--ink-3)')
    $c = $c.Replace('color:#94A3B8', 'color:var(--ink-3)')

    # Fondo oscuro de popup del mapa
    $c = $c.Replace('background:#F8FAFC', 'background:var(--paper-2)')
    $c = $c.Replace('background:#F0FDF4', 'background:var(--paper-2)')
    $c = $c.Replace('background:#EFF6FF', 'background:var(--paper-2)')
    $c = $c.Replace('background:#FEF3C7', 'background:#FFF8E5')

    # Bordes verdes
    $c = $c.Replace('border-left:4px solid #10B981', 'border-left:4px solid var(--signal)')
    $c = $c.Replace('border-left:3px solid #10B981', 'border-left:3px solid var(--signal)')

    # Emojis inline en botones/popups
    $c = $c.Replace('📄 Ver ficha completa', 'Ver ficha completa')
    $c = $c.Replace('📌 Las 15 más cercanas a ti', 'Las 15 más cercanas')
    $c = $c.Replace('&#127970; Ver operadores', 'Ver operadores')
    $c = $c.Replace('&#128205; ', '')

    if ($c -ne $original) {
        [System.IO.File]::WriteAllText($f, $c, [System.Text.UTF8Encoding]::new($false))
        $borrados = $original.Length - $c.Length
        Write-Host "OK: $($f | Split-Path -Leaf) - modificado" -ForegroundColor Green
        $totalCambios++
    } else {
        Write-Host "SKIP: $($f | Split-Path -Leaf) - sin cambios" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Total archivos modificados: $totalCambios" -ForegroundColor Cyan

# Verificación: buscar restos de verde
Write-Host ""
Write-Host "=== Restos de verde ===" -ForegroundColor Cyan
foreach ($f in $archivos) {
    if (-not (Test-Path $f)) { continue }
    $c = [System.IO.File]::ReadAllText($f, [System.Text.UTF8Encoding]::new($false))
    $count = ([regex]::Matches($c, '#10B981|#059669|#047857|var\(--ve\)')).Count
    Write-Host "  $($f | Split-Path -Leaf): $count"
}