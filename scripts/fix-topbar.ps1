# FIX topbar CCAA sin caracteres especiales (solo ASCII + codigos Unicode)
# Corrige: PAIS -> PAIS con I acentuada, etc.

$base = "C:\Users\Usuario\Desktop\ITVcheck"

# Codigos Unicode (evita problemas de encoding al guardar)
$A = [char]0x00C1  # A con acento agudo
$E = [char]0x00C9  # E con acento agudo
$I = [char]0x00CD  # I con acento agudo
$O = [char]0x00D3  # O con acento agudo
$U = [char]0x00DA  # U con acento agudo
$N = [char]0x00D1  # Ene

# Pares buscar -> reemplazar (construidos con [char] para no meter acentos en el fuente)
$reemplazos = @{
    "ANDALUCIA"          = "ANDALUC" + [string]$I + "A"
    "ARAGON"             = "ARAG" + [string]$O + "N"
    "CASTILLA Y LEON"    = "CASTILLA Y LE" + [string]$O + "N"
    "CATALUNA"           = "CATALU" + [string]$N + "A"
    "PAIS VASCO"         = "PA" + [string]$I + "S VASCO"
    "PA&IACUTE;S VASCO"  = "PA" + [string]$I + "S VASCO"
    "ANDALUC&IACUTE;A"   = "ANDALUC" + [string]$I + "A"
    "ARAG&OACUTE;N"      = "ARAG" + [string]$O + "N"
    "CASTILLA Y LE&OACUTE;N" = "CASTILLA Y LE" + [string]$O + "N"
    "CATALU&NTILDE;A"    = "CATALU" + [string]$N + "A"
}

$totalArreglados = 0

foreach ($slug in @("itv-andalucia","itv-aragon","itv-asturias","itv-baleares","itv-canarias","itv-cantabria","itv-castillalamancha","itv-castillayleon","itv-cataluna","itv-ceuta","itv-extremadura","itv-galicia","itv-larioja","itv-melilla","itv-murcia","itv-navarra","itv-paisvasco","itv-valencia")) {
    $ruta = Join-Path $base ($slug + ".html")
    if (-not (Test-Path $ruta)) { continue }

    $c = [System.IO.File]::ReadAllText($ruta, [System.Text.UTF8Encoding]::new($false))
    $original = $c

    foreach ($k in $reemplazos.Keys) {
        $c = $c.Replace($k, $reemplazos[$k])
    }

    if ($c -ne $original) {
        [System.IO.File]::WriteAllText($ruta, $c, [System.Text.UTF8Encoding]::new($false))
        Write-Host ("OK: " + $slug) -ForegroundColor Green
        $totalArreglados++
    } else {
        Write-Host ("SKIP: " + $slug) -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host ("Arreglados: " + $totalArreglados) -ForegroundColor Cyan
Write-Host ""
Write-Host "--- Verificacion topbar ---" -ForegroundColor Cyan
foreach ($slug in @("itv-paisvasco","itv-andalucia","itv-cataluna","itv-castillayleon","itv-aragon")) {
    $ruta = Join-Path $base ($slug + ".html")
    $html = [System.IO.File]::ReadAllText($ruta, [System.Text.UTF8Encoding]::new($false))
    $m = [regex]::Match($html, 'CCAA \d+ &middot; [^<]+')
    Write-Host ("  " + $slug + " -> " + $m.Value) -ForegroundColor Green
}