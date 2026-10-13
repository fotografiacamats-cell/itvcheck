# fix-filtro-texto.ps1
# Amplia el filtro de texto para buscar tambien en ccaa y operador

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$mapFile = Join-Path $base 'estaciones-itv.html'

Copy-Item $mapFile "$mapFile.backup-filtro-$(Get-Date -Format 'yyyyMMdd-HHmmss')" -Force

$content = Get-Content $mapFile -Raw -Encoding UTF8

# Buscar el bloque actual del filtro
$buscar = @'
var coincideTexto = texto === '' ||
 e.nombre.toLowerCase().includes(texto) ||
 e.ciudad.toLowerCase().includes(texto);
'@

$reemplazar = @'
var coincideTexto = texto === '' ||
 e.nombre.toLowerCase().includes(texto) ||
 e.ciudad.toLowerCase().includes(texto) ||
 e.ccaa.toLowerCase().includes(texto) ||
 e.operador.toLowerCase().includes(texto);
'@

if ($content.Contains($buscar)) {
    $content = $content.Replace($buscar, $reemplazar)
    Set-Content $mapFile -Value $content -Encoding UTF8 -NoNewline
    Write-Host "OK - Filtro ampliado a ccaa y operador" -ForegroundColor Green
} else {
    Write-Host "AVISO - No encuentro el bloque exacto" -ForegroundColor Yellow
    Write-Host "Buscando variantes..." -ForegroundColor Yellow
    
    # Variante con saltos de linea diferentes
    $patron = '(?s)var coincideTexto = texto === '''' \|\|[\s\S]*?e\.ciudad\.toLowerCase\(\)\.includes\(texto\);'
    $match = [regex]::Match($content, $patron)
    
    if ($match.Success) {
        $nuevo = @'
var coincideTexto = texto === '' ||
 e.nombre.toLowerCase().includes(texto) ||
 e.ciudad.toLowerCase().includes(texto) ||
 e.ccaa.toLowerCase().includes(texto) ||
 e.operador.toLowerCase().includes(texto);
'@
        $content = $content.Replace($match.Value, $nuevo)
        Set-Content $mapFile -Value $content -Encoding UTF8 -NoNewline
        Write-Host "OK - Filtro ampliado (regex fallback)" -ForegroundColor Green
    } else {
        Write-Host "ERROR - No se pudo aplicar el fix. Revisar manualmente." -ForegroundColor Red
    }
}

# Verificar
$check = Get-Content $mapFile -Raw -Encoding UTF8
if ($check -match 'e\.ccaa\.toLowerCase\(\)\.includes') {
    Write-Host "Verificado: filtro ahora incluye ccaa" -ForegroundColor Green
}