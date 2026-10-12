# fix-mojibake-json.ps1 v2 - sin caracteres especiales en el codigo
# Corrige strings con mojibake (UTF-8 leido como Latin-1)

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'
$backupFile = Join-Path $base ('estaciones.json.backup-mojibake-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))

Copy-Item $jsonFile $backupFile -Force
Write-Host "Backup: $backupFile" -ForegroundColor Cyan

# Encoding helpers
$latin1 = [System.Text.Encoding]::GetEncoding(28591)   # ISO-8859-1 por code page
$utf8   = [System.Text.Encoding]::UTF8

# Codigos ASCII de deteccion (evitan caracteres literales en el script)
$charC3 = [char]195   # "Ã" (primer byte de UTF-8 secuencia)
$charC2 = [char]194   # "Â"

function Fix-String($s) {
    if (-not $s) { return $s }
    if ($s.IndexOf($charC3) -ge 0 -or $s.IndexOf($charC2) -ge 0) {
        try {
            $bytes = $latin1.GetBytes($s)
            return $utf8.GetString($bytes)
        } catch {
            return $s
        }
    }
    return $s
}

# Cargar
$j = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$correcciones = 0

foreach ($e in $j.estaciones) {
    $origNombre    = $e.nombre
    $origCiudad    = $e.ciudad
    $origCCAA      = $e.ccaa
    $origOperador  = $e.operador
    $origDireccion = $e.direccion

    $e.nombre    = Fix-String $e.nombre
    $e.ciudad    = Fix-String $e.ciudad
    $e.ccaa      = Fix-String $e.ccaa
    $e.operador  = Fix-String $e.operador
    $e.direccion = Fix-String $e.direccion

    if ($e.nombre -ne $origNombre -or $e.ciudad -ne $origCiudad -or
        $e.ccaa -ne $origCCAA -or $e.operador -ne $origOperador -or
        $e.direccion -ne $origDireccion) {
        $correcciones++
    }
}

# Guardar
$j | ConvertTo-Json -Depth 5 | Out-File -FilePath $jsonFile -Encoding UTF8

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  FIX MOJIBAKE" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Entradas corregidas: $correcciones" -ForegroundColor Green
Write-Host ""

# Verificar
$check = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$ccaasUnicas = $check.estaciones | Where-Object { $_.ccaa } | Select-Object -ExpandProperty ccaa -Unique | Sort-Object

Write-Host "CCAA distintas ahora: $($ccaasUnicas.Count)" -ForegroundColor Yellow
$ccaasUnicas | ForEach-Object { Write-Host "  - $_" }