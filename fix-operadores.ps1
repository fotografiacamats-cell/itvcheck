# fix-operadores-v2.ps1 - Reemplazo directo de patrones corruptos conocidos

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'
$backupFile = Join-Path $base ('estaciones.json.backup-opfix-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))

Copy-Item $jsonFile $backupFile -Force
Write-Host "Backup: $backupFile" -ForegroundColor Cyan

$j = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json

# --- Patrones de operador corruptos -> operador correcto ---
$operadoresFix = @{
    'Tï¿½oV'     = 'TÜV'
    'TÃœV'       = 'TÜV'
    'TÃƒÂœV'    = 'TÜV'
    'TÜV'        = 'TÜV'   # ya correcto
}
# Tambien capturar cualquier variante "T??V" o "T?V"
$patronTUV = '^T.{1,6}V$'

$corregidosOp = 0
foreach ($e in $j.estaciones) {
    if (-not $e.operador) { continue }
    $op = $e.operador

    # Fix directo por tabla
    if ($operadoresFix.ContainsKey($op)) {
        if ($op -ne 'TÜV') {
            $e.operador = $operadoresFix[$op]
            $corregidosOp++
        }
        continue
    }

    # Si no está en la tabla pero empieza con T y contiene caracteres no-ASCII, asumir TÜV
    $tieneNoAscii = $false
    foreach ($c in $op.ToCharArray()) {
        if ([int][char]$c -gt 127) { $tieneNoAscii = $true; break }
    }
    if ($tieneNoAscii -and $op -match $patronTUV) {
        $e.operador = 'TÜV'
        $corregidosOp++
    }
}

# --- Fix del resto de campos: aplicar Fix-String iterativo ---
$latin1 = [System.Text.Encoding]::GetEncoding(28591)
$utf8   = [System.Text.Encoding]::UTF8
$charC3 = [char]195
$charC2 = [char]194
$charFFFD = [char]65533

function Fix-String-Iterativo($s) {
    if (-not $s) { return $s }
    $prev = $null
    $iter = 0
    while ($s -ne $prev -and $iter -lt 5) {
        $prev = $s
        # Si contiene caracteres típicos de mojibake, re-decodificar
        if ($s.IndexOf($charC3) -ge 0 -or $s.IndexOf($charC2) -ge 0) {
            try {
                $bytes = $latin1.GetBytes($s)
                $s = $utf8.GetString($bytes)
            } catch { break }
        }
        $iter++
    }
    return $s
}

$corregidosNombre = 0
foreach ($e in $j.estaciones) {
    $orig = $e.nombre
    $e.nombre = Fix-String-Iterativo $e.nombre
    if ($e.nombre -ne $orig) { $corregidosNombre++ }

    $orig = $e.ciudad
    $e.ciudad = Fix-String-Iterativo $e.ciudad
    if ($e.ciudad -ne $orig) {}

    $orig = $e.direccion
    $e.direccion = Fix-String-Iterativo $e.direccion
    if ($e.direccion -ne $orig) {}

    $orig = $e.ccaa
    $e.ccaa = Fix-String-Iterativo $e.ccaa
    if ($e.ccaa -ne $orig) {}
}

$j | ConvertTo-Json -Depth 5 | Out-File $jsonFile -Encoding UTF8

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  FIX v2 - RESULTADO" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Operadores corregidos: $corregidosOp" -ForegroundColor Green
Write-Host "  Nombres corregidos:    $corregidosNombre" -ForegroundColor Green
Write-Host ""

# --- Verificacion exhaustiva ---
$check = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json

Write-Host "Operadores unicos en el JSON:" -ForegroundColor Yellow
$check.estaciones | Where-Object { $_.operador } | Group-Object operador | 
    Sort-Object Count -Descending | Format-Table Count, Name -AutoSize

Write-Host ""
Write-Host "Buscando caracteres corruptos residuales (U+FFFD):" -ForegroundColor Yellow
$problematicos = @()
foreach ($e in $check.estaciones) {
    foreach ($campo in @('nombre','ciudad','ccaa','operador','direccion')) {
        $valor = $e.$campo
        if ($valor -and $valor.IndexOf($charFFFD) -ge 0) {
            $problematicos += "$campo: '$valor' (ficha: $($e.slug))"
        }
    }
}

if ($problematicos.Count -eq 0) {
    Write-Host "  OK - Cero caracteres corruptos U+FFFD" -ForegroundColor Green
} else {
    Write-Host "  AVISO - Quedan $($problematicos.Count) campos con U+FFFD:" -ForegroundColor Red
    $problematicos | Select-Object -First 10 | ForEach-Object { Write-Host "    $_" -ForegroundColor DarkGray }
}

# Verificar si queda algun Tï...oV
$tuvRaros = $check.estaciones | Where-Object { $_.operador -and $_.operador -ne 'TÜV' -and $_.operador -match '^T.*V$' }
if ($tuvRaros.Count -gt 0) {
    Write-Host ""
    Write-Host "Operadores 'T...V' residuales:" -ForegroundColor Red
    $tuvRaros | Select-Object -First 5 nombre, operador, slug | Format-Table -AutoSize
} else {
    Write-Host ""
    Write-Host "OK - Todos los TÜV normalizados correctamente" -ForegroundColor Green
}