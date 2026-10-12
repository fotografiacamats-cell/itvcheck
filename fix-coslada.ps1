# fix-coslada.ps1
# Resuelve el conflicto itv-coslada duplicado

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$estDir = Join-Path $base 'estaciones'
$jsonFile = Join-Path $base 'data\estaciones.json'

# 1. Buscar backup de la ficha original de SGS
$backups = @(
    'estaciones-backup-force-20261012-174455',
    'estaciones-backup-20261012-174025'
)

$backupEncontrado = $null
foreach ($b in $backups) {
    $path = Join-Path $base "$b\itv-coslada.html"
    if (Test-Path $path) {
        $backupEncontrado = $path
        break
    }
}

if (-not $backupEncontrado) {
    throw "No encuentro el backup de itv-coslada.html original"
}

Write-Host "Backup encontrado: $backupEncontrado" -ForegroundColor Cyan

# 2. Verificar que el backup es la version SGS (original)
$backupContent = Get-Content $backupEncontrado -Raw -Encoding UTF8
if ($backupContent -match 'SGS') {
    Write-Host "Backup confirmado como SGS (original)" -ForegroundColor Green
} else {
    Write-Host "AVISO: El backup no menciona SGS. Revisar manualmente." -ForegroundColor Yellow
}

# 3. Renombrar la actual (Itevelesa) a itv-coslada-itevelesa.html
$actualPath = Join-Path $estDir 'itv-coslada.html'
$nuevaPath  = Join-Path $estDir 'itv-coslada-itevelesa.html'

if (Test-Path $actualPath) {
    Move-Item $actualPath $nuevaPath -Force
    Write-Host "Renombrado: itv-coslada.html -> itv-coslada-itevelesa.html" -ForegroundColor Green
}

# 4. Copiar el backup como itv-coslada-sgs.html
$sgsPath = Join-Path $estDir 'itv-coslada-sgs.html'
Copy-Item $backupEncontrado $sgsPath -Force
Write-Host "Restaurado: itv-coslada-sgs.html (version original SGS)" -ForegroundColor Green

# 5. Actualizar el JSON
Copy-Item $jsonFile "$jsonFile.backup-coslada-$(Get-Date -Format 'yyyyMMdd-HHmmss')" -Force
$j = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json

foreach ($e in $j.estaciones) {
    if ($e.slug -eq 'itv-coslada') {
        if ($e.operador -match 'SGS') {
            $e.slug = 'itv-coslada-sgs'
            Write-Host "JSON: ITV Coslada (SGS) -> itv-coslada-sgs" -ForegroundColor Green
        } elseif ($e.operador -match 'Itevelesa') {
            $e.slug = 'itv-coslada-itevelesa'
            Write-Host "JSON: ITV Itevelesa Coslada -> itv-coslada-itevelesa" -ForegroundColor Green
        }
    }
}

$j | ConvertTo-Json -Depth 5 | Out-File $jsonFile -Encoding UTF8

# 6. Verificar
$check = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$dups = $check.estaciones | Where-Object { $_.source -in @('site','site-orphan') } | Group-Object slug | Where-Object { $_.Count -gt 1 }

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  FIX COSLADA" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Duplicados restantes: $($dups.Count)" -ForegroundColor $(if ($dups.Count -eq 0) { 'Green' } else { 'Red' })

# 7. Verificar que los archivos existen
$sgsOk = Test-Path (Join-Path $estDir 'itv-coslada-sgs.html')
$itevOk = Test-Path (Join-Path $estDir 'itv-coslada-itevelesa.html')
Write-Host "  itv-coslada-sgs.html:       $(if ($sgsOk) { 'OK' } else { 'FALTA' })" -ForegroundColor $(if ($sgsOk) { 'Green' } else { 'Red' })
Write-Host "  itv-coslada-itevelesa.html: $(if ($itevOk) { 'OK' } else { 'FALTA' })" -ForegroundColor $(if ($itevOk) { 'Green' } else { 'Red' })