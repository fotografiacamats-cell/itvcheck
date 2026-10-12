# modificar-mapa.ps1 - Convierte el HTML del mapa para usar estaciones.json

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$mapFile = Join-Path $base 'estaciones-itv.html'
$backupFile = Join-Path $base ('estaciones-itv.html.backup-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))

if (-not (Test-Path $mapFile)) { throw "No encuentro $mapFile" }

Write-Host "Backup en $backupFile..." -ForegroundColor Cyan
Copy-Item $mapFile $backupFile -Force
Write-Host "OK" -ForegroundColor Green

$content = Get-Content $mapFile -Raw -Encoding UTF8
$original = $content

# --- 1) Reemplazar el array estaciones por uno vacio ---
$patronArray = '(?s)var estaciones = \[.*?\];(\s*)var map,'
if (-not [regex]::IsMatch($content, $patronArray)) {
    throw "No encuentro el bloque 'var estaciones = [...];' seguido de 'var map,'"
}
$content = [regex]::Replace($content, $patronArray, "var estaciones = [];`$1var map,")
Write-Host "1) Array estaciones vaciado" -ForegroundColor Green

# --- 2) Anadir funcion cargarEstaciones antes de iniciarTodo ---
$patronIniciar = '(?s)(function iniciarTodo\(tieneCluster\)\{)'
$fetchFn = @'
function cargarEstaciones() {
  return fetch('/data/estaciones.json')
    .then(function(r){
      if (!r.ok) { throw new Error('HTTP ' + r.status); }
      return r.json();
    })
    .then(function(data){
      if (data && data.estaciones && data.estaciones.length) {
        estaciones = data.estaciones;
        console.log('[ITVcheck] ' + estaciones.length + ' estaciones cargadas desde JSON');
      } else {
        throw new Error('JSON sin estaciones');
      }
    });
}

function iniciarTodo(tieneCluster){
'@
$content = [regex]::Replace($content, $patronIniciar, $fetchFn, 1)
Write-Host "2) Funcion cargarEstaciones insertada" -ForegroundColor Green

# --- 3) Modificar window.addEventListener('load', ...) para que espere al fetch ---
$patronLoad = '(?s)(window\.addEventListener\(''load'', function\(\)\{.*?)(iniciarTodo\(typeof L\.markerClusterGroup !== ''undefined''\);\s*\}\);)'
$reemplazoLoad = @'
$1cargarEstaciones()
  .then(function(){
    iniciarTodo(typeof L.markerClusterGroup !== 'undefined');
  })
  .catch(function(err){
    console.error('[ITVcheck] Error cargando JSON:', err);
    document.getElementById('mapa').innerHTML = '<div class="mapa-error">&#10060; Error cargando estaciones.json<br><br>' + err.message + '</div>';
  });
});
'@
if ([regex]::IsMatch($content, $patronLoad)) {
    $content = [regex]::Replace($content, $patronLoad, $reemplazoLoad, 1)
    Write-Host "3) Event listener load actualizado" -ForegroundColor Green
} else {
    Write-Host "3) AVISO: no se pudo modificar el event listener. Aplicar manualmente." -ForegroundColor Yellow
}

# --- 4) Actualizar contadores 192 -> 495 ---
$cambios192 = 0
$content = [regex]::Replace($content, 'MAPA INTERACTIVO &middot; 192 ESTACIONES', { $script:cambios192++; 'MAPA INTERACTIVO &middot; 495 ESTACIONES' })
$content = [regex]::Replace($content, '192 estaciones verificadas', { $script:cambios192++; '495 estaciones verificadas' })
$content = [regex]::Replace($content, '<span class="n">192</span>', { $script:cambios192++; '<span class="n">495</span>' })
$content = [regex]::Replace($content, 'Todas las estaciones de ITV en Espa&ntilde;a \(192\)', { $script:cambios192++; 'Todas las estaciones de ITV en Espa&ntilde;a (495)' })
$content = [regex]::Replace($content, 'Mapa interactivo con 192 estaciones de ITV', { $script:cambios192++; 'Mapa interactivo con 495 estaciones de ITV' })
Write-Host "4) $cambios192 contadores actualizados a 495" -ForegroundColor Green

# --- 5) Regenerar ItemList JSON-LD ---
$patronItemList = '(?s)<script type="application/ld\+json">\s*\{"@context":"https://schema\.org","@type":"ItemList".*?</script>'
if ([regex]::IsMatch($content, $patronItemList)) {
    $nuevoItemList = @'
<script type="application/ld+json">
{"@context":"https://schema.org","@type":"ItemList","name":"Estaciones de ITV en España","numberOfItems":495}
</script>
'@
    $content = [regex]::Replace($content, $patronItemList, $nuevoItemList, 1)
    Write-Host "5) ItemList JSON-LD regenerado (495 items sin listar)" -ForegroundColor Green
} else {
    Write-Host "5) AVISO: no se pudo regenerar ItemList. Revisar manualmente." -ForegroundColor Yellow
}

# --- Guardar ---
Set-Content -Path $mapFile -Value $content -Encoding UTF8 -NoNewline

# --- Verificaciones ---
Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  MODIFICACION APLICADA" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
$diff = (Get-Content $mapFile -Raw -Encoding UTF8).Length - $original.Length
Write-Host "  Archivo: $mapFile"
Write-Host "  Backup:  $backupFile"
Write-Host "  Delta:   $diff bytes" -ForegroundColor Cyan
Write-Host ""

# Checks
$check1 = (Get-Content $mapFile -Raw -Encoding UTF8) -match 'var estaciones = \[\];'
$check2 = (Get-Content $mapFile -Raw -Encoding UTF8) -match 'function cargarEstaciones\(\)'
$check3 = (Get-Content $mapFile -Raw -Encoding UTF8) -match "fetch\('/data/estaciones.json'\)"
$check4 = (Get-Content $mapFile -Raw -Encoding UTF8) -match '495 ESTACIONES'
$check5 = (Get-Content $mapFile -Raw -Encoding UTF8) -match '"numberOfItems":495'

Write-Host "Verificaciones:" -ForegroundColor Yellow
Write-Host "  [1] var estaciones = [];         $([char]0x2705) $check1" -ForegroundColor $(if ($check1) { 'Green' } else { 'Red' })
Write-Host "  [2] function cargarEstaciones()  $([char]0x2705) $check2" -ForegroundColor $(if ($check2) { 'Green' } else { 'Red' })
Write-Host "  [3] fetch('/data/estaciones.json') $([char]0x2705) $check3" -ForegroundColor $(if ($check3) { 'Green' } else { 'Red' })
Write-Host "  [4] 495 ESTACIONES visible       $([char]0x2705) $check4" -ForegroundColor $(if ($check4) { 'Green' } else { 'Red' })
Write-Host "  [5] ItemList numberOfItems 495   $([char]0x2705) $check5" -ForegroundColor $(if ($check5) { 'Green' } else { 'Red' })

if ($check1 -and $check2 -and $check3 -and $check4) {
    Write-Host ""
    Write-Host "OK - Listo para probar el mapa" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "AVISO - Revisa los checks fallidos antes de continuar" -ForegroundColor Yellow
}