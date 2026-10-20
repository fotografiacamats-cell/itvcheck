# actualizar-indice-estaciones.ps1
# Version corregida: busca la marca exacta '<a href="index" class="btn">' que va despues del bloque

$ErrorActionPreference = 'Stop'
$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'
$htmlFile = Join-Path $base 'estaciones-itv.html'

$json = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$html = Get-Content $htmlFile -Raw -Encoding UTF8

# Filtrar solo las que tienen HTML
$conFicha = @()
foreach($e in $json.estaciones) {
    if(Test-Path (Join-Path $base "estaciones\$($e.slug).html")) {
        $conFicha += $e
    }
}

Write-Host "Estaciones con ficha HTML: $($conFicha.Count)" -ForegroundColor Cyan

# Agrupar por CCAA
$porCCAA = $conFicha | Group-Object -Property ccaa | Sort-Object Name

# Generar el HTML
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine('<div id="indice-estaciones-ccaa" style="margin-top:50px;">')
[void]$sb.AppendLine("<h2>Todas las estaciones de ITV con ficha publica ($($conFicha.Count))</h2>")
[void]$sb.AppendLine('<p>Listado por comunidad autonoma.</p>')

foreach($grupo in $porCCAA) {
    $ccaa = $grupo.Name
    $estaciones = $grupo.Group | Sort-Object ciudad, nombre
    $count = $estaciones.Count
    
    [void]$sb.AppendLine('<details style="border:1px solid #E2E8F0;border-radius:10px;margin-bottom:10px;background:#fff;">')
    [void]$sb.AppendLine("<summary style=`"cursor:pointer;padding:14px 18px;font-weight:700;font-size:16px;list-style:none;`">$ccaa <span style=`"color:#C48B00;font-weight:600;`">($count)</span></summary>")
    [void]$sb.AppendLine('<ul style="list-style:none;margin:0;padding:0 18px 18px;columns:2;column-gap:30px;font-size:14px;">')
    
    foreach($e in $estaciones) {
        $nombreEsc = $e.nombre -replace '&', '&amp;'
        $ciudadEsc = $e.ciudad -replace '&', '&amp;'
        $operadorEsc = $e.operador -replace '&', '&amp;'
        [void]$sb.AppendLine("<li><a href=`"estaciones/$($e.slug).html`">$nombreEsc</a> <span style=`"color:#888;font-size:12px;`">$ciudadEsc &middot; $operadorEsc</span></li>")
    }
    
    [void]$sb.AppendLine('</ul>')
    [void]$sb.AppendLine('</details>')
}

[void]$sb.AppendLine('</div>')
[void]$sb.AppendLine('')

$nuevoBloque = $sb.ToString()

# Marcas exactas
$marcaInicio = '<div id="indice-estaciones-ccaa"'
$marcaFin = '<a href="index" class="btn">'

$idxInicio = $html.IndexOf($marcaInicio)
if($idxInicio -lt 0) {
    Write-Host "ERROR: No se encontro '$marcaInicio'" -ForegroundColor Red
    exit 1
}

# Buscar la marca de fin A PARTIR del inicio (para no confundir con el header)
$idxFin = $html.IndexOf($marcaFin, $idxInicio)
if($idxFin -lt 0) {
    Write-Host "ERROR: No se encontro '$marcaFin' despues del inicio" -ForegroundColor Red
    exit 1
}

Write-Host "Bloque: caracteres $idxInicio a $idxFin" -ForegroundColor Cyan
Write-Host "Antes: ...$($html.Substring($idxInicio-30, 30))" -ForegroundColor DarkGray
Write-Host "Despues: $($html.Substring($idxFin, 50))..." -ForegroundColor DarkGray

# Reconstruir: [antes del bloque] + [nuevo bloque] + [desde la marca fin en adelante]
$antes = $html.Substring(0, $idxInicio)
$despues = $html.Substring($idxFin)

$htmlNuevo = $antes + $nuevoBloque + $despues

Set-Content -Path $htmlFile -Value $htmlNuevo -Encoding UTF8 -NoNewline

Write-Host ""
Write-Host "OK: Indice actualizado con $($conFicha.Count) estaciones en $($porCCAA.Count) CCAA." -ForegroundColor Green
Write-Host "Verifica abriendo estaciones-itv.html y desplazandote al final." -ForegroundColor Yellow