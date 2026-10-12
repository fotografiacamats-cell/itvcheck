# regenerar-listado.ps1

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'
$mapFile  = Join-Path $base 'estaciones-itv.html'
$backupFile = Join-Path $base ('estaciones-itv.html.backup-listado-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))

$json = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$estaciones = $json.estaciones
Write-Host "Estaciones totales: $($estaciones.Count)" -ForegroundColor Cyan

Copy-Item $mapFile $backupFile -Force
Write-Host "Backup: $backupFile" -ForegroundColor Cyan

$grupos = $estaciones | Where-Object { $_.ccaa } | Group-Object ccaa | Sort-Object Name
Write-Host "CCAA distintas: $($grupos.Count)" -ForegroundColor Cyan

# --- Construir bloque nuevo ---
$sb = New-Object System.Text.StringBuilder

[void]$sb.AppendLine('<div id="indice-estaciones-ccaa" style="margin-top:50px;">')
[void]$sb.AppendLine("<h2>Todas las estaciones de ITV en Espa&ntilde;a ($($estaciones.Count))</h2>")
[void]$sb.AppendLine('<p>Listado completo por comunidad aut&oacute;noma. Cada estaci&oacute;n tiene su propia ficha con tel&eacute;fono, horario, direcci&oacute;n, c&oacute;mo llegar y bot&oacute;n de cita previa.</p>')

$primera = $true
foreach ($g in $grupos) {
    $openAttr = if ($primera) { ' open' } else { '' }
    $primera = $false

    [void]$sb.AppendLine("<details$openAttr style=""border:1px solid #E2E8F0;border-radius:10px;margin-bottom:10px;background:#fff;"">")
    [void]$sb.AppendLine("<summary style=""cursor:pointer;padding:14px 18px;font-weight:700;font-size:16px;color:var(--ink);list-style:none;"">$($g.Name) <span style=""color:var(--signal-dark);font-weight:600;"">($($g.Count))</span></summary>")
    [void]$sb.AppendLine('<ul style="list-style:none;margin:0;padding:0 18px 18px;columns:2;column-gap:30px;font-size:14px;">')

    $ordenados = $g.Group | Sort-Object ciudad, nombre
    foreach ($e in $ordenados) {
        $nombreEsc  = $e.nombre   -replace '&','&amp;' -replace '<','&lt;' -replace '>','&gt;'
        $ciudadEsc  = $e.ciudad   -replace '&','&amp;' -replace '<','&lt;' -replace '>','&gt;'
        $operadorEsc = $e.operador -replace '&','&amp;' -replace '<','&lt;' -replace '>','&gt;'
        [void]$sb.AppendLine("<li><a href=""estaciones/$($e.slug).html"">$nombreEsc</a> <span style=""color:var(--ink-3);font-size:12px;"">$ciudadEsc &middot; $operadorEsc</span></li>")
    }

    [void]$sb.AppendLine('</ul>')
    [void]$sb.AppendLine('</details>')
}
[void]$sb.AppendLine('</div>')

$bloqueNuevo = $sb.ToString()

# --- Reemplazar ---
$content = Get-Content $mapFile -Raw -Encoding UTF8
$original = $content

$patron = '(?s)<div id="indice-estaciones-ccaa"[^>]*>.*?(?=<a href="index" class="btn">)'
$match = [regex]::Match($content, $patron)
if (-not $match.Success) { throw "No encuentro el bloque" }

$bloqueViejo = $match.Value
$content = $content.Replace($bloqueViejo, $bloqueNuevo + "`n")

# Actualizar seccion "Comunidades con mas estaciones"
$numAndalucia = ($grupos | Where-Object { $_.Name -eq 'Andalucía' }).Count
$numCataluna  = ($grupos | Where-Object { $_.Name -eq 'Cataluña'  }).Count
$numMadrid    = ($grupos | Where-Object { $_.Name -eq 'Madrid'    }).Count
$numCV        = ($grupos | Where-Object { $_.Name -eq 'Comunidad Valenciana' }).Count

$content = $content -replace '(<strong>Andalucía:</strong>)[^<]+', ('$1 ' + $numAndalucia + ' estaciones')
$content = $content -replace '(<strong>Cataluña:</strong>)[^<]+', ('$1 ' + $numCataluna + ' estaciones')
$content = $content -replace '(<strong>Madrid:</strong>)[^<]+',   ('$1 ' + $numMadrid + ' estaciones')
$content = $content -replace '(<strong>Comunidad Valenciana:</strong>)[^<]+', ('$1 ' + $numCV + ' estaciones')

Set-Content -Path $mapFile -Value $content -Encoding UTF8 -NoNewline

# --- Reporte ---
Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  LISTADO REGENERADO" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Total estaciones:     $($estaciones.Count)" -ForegroundColor Green
Write-Host "  CCAA en el listado:   $($grupos.Count)" -ForegroundColor Green
Write-Host "  Delta bytes:          $($content.Length - $original.Length)" -ForegroundColor Cyan
Write-Host "  Backup:               $backupFile" -ForegroundColor Cyan
Write-Host ""
Write-Host "Distribucion por CCAA (orden alfabetico):" -ForegroundColor Yellow
$grupos | Format-Table Count, Name -AutoSize

# Verificacion
$check = Get-Content $mapFile -Raw -Encoding UTF8
$totalDetails = ([regex]::Matches($check, '<details')).Count
Write-Host "Verificacion:"
Write-Host "  <details> en el archivo: $totalDetails (esperado: $($grupos.Count))" -ForegroundColor $(if ($totalDetails -eq $grupos.Count) { 'Green' } else { 'Yellow' })
Write-Host "  Contiene '(495)':        $($check -match '\(495\)')" -ForegroundColor $(if ($check -match '\(495\)') { 'Green' } else { 'Red' })