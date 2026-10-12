# fix-slugs-json.ps1
# Corrige los slugs del JSON para que coincidan con los archivos HTML reales

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'
$estDir   = Join-Path $base 'estaciones'

function Slugify($s) {
    if (-not $s) { return '' }
    $formD = $s.Normalize([System.Text.NormalizationForm]::FormD)
    $sb = New-Object System.Text.StringBuilder
    foreach ($c in $formD.ToCharArray()) {
        $cat = [System.Globalization.CharUnicodeInfo]::GetUnicodeCategory($c)
        if ($cat -ne [System.Globalization.UnicodeCategory]::NonSpacingMark) {
            [void]$sb.Append($c)
        }
    }
    $n = $sb.ToString().ToLower().Trim()
    $n = $n -replace '[^a-z0-9\s-]', ''
    $n = $n -replace '\s+', '-'
    return $n.Trim('-')
}

# Backup
Copy-Item $jsonFile "$jsonFile.backup-fixslugs-$(Get-Date -Format 'yyyyMMdd-HHmmss')" -Force

$j = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json

# Indexar archivos
$archivosExistentes = @{}
Get-ChildItem $estDir -Filter 'itv-*.html' | ForEach-Object {
    $archivosExistentes[$_.BaseName] = $true
}

$cambios = New-Object System.Collections.ArrayList
$sinMatch = New-Object System.Collections.ArrayList

foreach ($e in $j.estaciones) {
    if ($e.source -notin @('site','site-orphan')) { continue }
    if ($archivosExistentes.ContainsKey($e.slug)) { continue }
    
    $slugViejo = $e.slug
    $encontrado = $false
    
    # Intento 1: slugify del nombre completo
    $s1 = Slugify $e.nombre
    if ($s1 -and $archivosExistentes.ContainsKey($s1)) {
        $e.slug = $s1
        [void]$cambios.Add("$($e.nombre): $slugViejo -> $s1")
        $encontrado = $true
    }
    
    if (-not $encontrado) {
        [void]$sinMatch.Add([PSCustomObject]@{
            Nombre       = $e.nombre
            Ciudad       = $e.ciudad
            SlugViejo    = $slugViejo
            SlugEsperado = $s1
        })
    }
}

$j | ConvertTo-Json -Depth 5 | Out-File $jsonFile -Encoding UTF8

# Detectar duplicados
$dups = $j.estaciones | Where-Object { $_.source -in @('site','site-orphan') } | Group-Object slug | Where-Object { $_.Count -gt 1 }

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  FIX SLUGS" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Cambios aplicados: $($cambios.Count)" -ForegroundColor Green
Write-Host "  Sin match:         $($sinMatch.Count)" -ForegroundColor $(if ($sinMatch.Count -gt 0) { 'Yellow' } else { 'Green' })
Write-Host "  Duplicados:        $($dups.Count)" -ForegroundColor $(if ($dups.Count -gt 0) { 'Red' } else { 'Green' })
Write-Host ""

if ($cambios.Count -gt 0) {
    Write-Host "Primeros 15 cambios:" -ForegroundColor Cyan
    $cambios | Select-Object -First 15 | ForEach-Object { Write-Host "  $_" -ForegroundColor DarkGray }
    Write-Host ""
}

if ($sinMatch.Count -gt 0) {
    Write-Host "--- SIN MATCH (necesitan revision manual) ---" -ForegroundColor Yellow
    $sinMatch | Format-Table -AutoSize
    Write-Host ""
}

if ($dups.Count -gt 0) {
    Write-Host "--- SLUGS DUPLICADOS (revisar) ---" -ForegroundColor Red
    foreach ($d in $dups) {
        Write-Host "  Slug: $($d.Name) ($($d.Count) veces)" -ForegroundColor Red
        $d.Group | ForEach-Object { Write-Host "    - $($_.nombre)" -ForegroundColor DarkGray }
    }
}