# arreglar-popup-v2.ps1
# Fix quirurgico del popup principal usando regex dotall (multi-linea)

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$mapFile = Join-Path $base 'estaciones-itv.html'
$backupFile = Join-Path $base ('estaciones-itv.html.backup-popup2-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))

Copy-Item $mapFile $backupFile -Force
Write-Host "Backup: $backupFile" -ForegroundColor Cyan

$content = Get-Content $mapFile -Raw -Encoding UTF8
$original = $content

# Patron dotall: desde "botones += '<a href="estaciones/'" hasta el cierre con "Ver ficha completa</a>';"
# El (?s) hace que . coincida con saltos de linea
$patron = "(?s)botones \+= '<a href=""estaciones/'" + '\s*\+.*?Ver ficha completa</a>'';'

if ($content -match $patron) {
    $nuevaLinea = @'
if(e.source === 'site' || e.source === 'site-orphan'){
    botones += '<a href="estaciones/' + e.slug + '.html" class="btn-popup" style="background:var(--signal);color:#fff;margin-top:6px;">&#128196; Ver ficha completa</a>';
}
'@
    $content = [regex]::Replace($content, $patron, $nuevaLinea, 1)
    Write-Host "Fix 1 aplicado (popup principal)" -ForegroundColor Green
} else {
    Write-Host "AVISO: regex dotall tampoco matchea. Vamos con un enfoque por lineas..." -ForegroundColor Yellow

    # Enfoque alternativo: trabajar linea a linea
    $lineas = $content -split "`n"
    $nuevasLineas = @()
    $i = 0
    $encontrado = $false

    while ($i -lt $lineas.Count) {
        $linea = $lineas[$i]

        if (-not $encontrado -and $linea -match "botones \+= '<a href=""estaciones/" ) {
            # Buscar el cierre en las siguientes lineas
            $j = $i
            $bloque = ""
            while ($j -lt $lineas.Count -and $j -lt ($i + 10)) {
                $bloque += $lineas[$j]
                if ($lineas[$j] -match "Ver ficha completa</a>';") {
                    break
                }
                $j++
            }

            if ($bloque -match "Ver ficha completa</a>';") {
                # Reemplazar el bloque completo
                $nuevasLineas += "if(e.source === 'site' || e.source === 'site-orphan'){"
                $nuevasLineas += "    botones += '<a href=""estaciones/' + e.slug + '.html"" class=""btn-popup"" style=""background:var(--signal);color:#fff;margin-top:6px;"">&#128196; Ver ficha completa</a>';"
                $nuevasLineas += "}"
                $encontrado = $true
                $i = $j + 1
                continue
            }
        }

        $nuevasLineas += $linea
        $i++
    }

    if ($encontrado) {
        $content = $nuevasLineas -join "`n"
        Write-Host "Fix 1 aplicado (metodo por lineas)" -ForegroundColor Green
    } else {
        Write-Host "ERROR: no se pudo aplicar el fix" -ForegroundColor Red
    }
}

if ($content -ne $original) {
    Set-Content -Path $mapFile -Value $content -Encoding UTF8 -NoNewline
    
    # Verificar
    $check = Get-Content $mapFile -Raw -Encoding UTF8
    $condicionales = ([regex]::Matches($check, "e\.source === 'site'")).Count
    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Yellow
    Write-Host "  RESULTADO" -ForegroundColor Yellow
    Write-Host "==========================================" -ForegroundColor Yellow
    Write-Host "  Condicionales en el archivo: $condicionales" -ForegroundColor $(if ($condicionales -ge 2) { 'Green' } else { 'Yellow' })
    Write-Host "  Esperado: 2 (popup principal + cercanas)" -ForegroundColor DarkGray
} else {
    Write-Host "Sin cambios" -ForegroundColor Yellow
}