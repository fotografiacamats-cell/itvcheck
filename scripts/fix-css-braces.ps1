$f = "C:\Users\Usuario\Desktop\ITVcheck\styles-editorial.css"
Copy-Item $f "$f.bak-braces" -Force

$c = [System.IO.File]::ReadAllText($f, [System.Text.UTF8Encoding]::new($false))
$original = $c

# Fix 1: cerrar @media RESPONSIVE antes de DEFECTOS
$c = $c -replace '(\.mag-vehiculo-grid \{ grid-template-columns: repeat\(2, 1fr\); \})(\s*\r?\n\s*\r?\n)(/\* =+\r?\n\s*DEFECTOS ITV)', "`$1`n}`n`n`$3"

# Fix 2: cerrar @media DEFECTOS antes de LIMPIEZA
$c = $c -replace '(\.stat-box strong \{ font-size: 22px; \})(\s*\r?\n\s*\r?\n)(/\* =+\r?\n\s*LIMPIEZA DE EMOJIS)', "`$1`n}`n`n`$3"

# Fix 3: cerrar .btn-volver:hover antes de CHECKLIST
$c = $c -replace '(color: var\(--paper\);)(\s*\r?\n\s*\r?\n)(/\* =+\r?\n\s*CHECKLIST ITV)', "`$1`n}`n`n`$3"

# Fix 4: quitar } extra al final
$c = $c.TrimEnd()
$c = $c -replace '(\.[a-z\-]+ \{ padding: 20px; \}\s*\r?\n\})\s*\r?\n\}\s*$', "`$1`n"

[System.IO.File]::WriteAllText($f, $c, [System.Text.UTF8Encoding]::new($false))

# Contar llaves para verificar
$abre = ([regex]::Matches($c, '\{')).Count
$cierra = ([regex]::Matches($c, '\}')).Count

Write-Host ""
Write-Host "=== RESULTADO ===" -ForegroundColor Green
Write-Host "Llaves abiertas:  $abre"
Write-Host "Llaves cerradas:  $cierra"
Write-Host "Balance:          $($abre - $cierra) (debe ser 0)"
Write-Host "Cambio aplicado:  $($c -ne $original)"
Write-Host "Tamaño:           $((Get-Item $f).Length) bytes"
Write-Host "Backup:           $f.bak-braces" -ForegroundColor Yellow