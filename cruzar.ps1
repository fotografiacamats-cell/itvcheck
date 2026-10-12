# cruzar.ps1 v4 - con aliases + excepciones manuales

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$mineFile   = Join-Path $base 'estaciones-actuales.csv'
$dgtFile    = Join-Path $base 'estaciones-dgt-limpio.csv'
$aliasFile  = Join-Path $base 'alias-municipios.csv'
$excepFile  = Join-Path $base 'excepciones-manuales.csv'
$outFile    = Join-Path $base 'cruce-resultado.csv'
$outNew     = Join-Path $base 'nuevas-a-crear.csv'

$mine  = Import-Csv $mineFile -Encoding UTF8
$dgt   = Import-Csv $dgtFile  -Encoding UTF8
$alias = Import-Csv $aliasFile -Encoding UTF8

# Cargar excepciones (puede no existir)
$excep = @{}
if (Test-Path $excepFile) {
    $excepData = Import-Csv $excepFile -Encoding UTF8
    foreach ($e in $excepData) {
        $excep[$e.mi_nombre.Trim()] = $e.dgt_codigo.Trim()
    }
}

# Index DGT por codigo_centro para lookup rapido
$dgtPorCodigo = @{}
foreach ($d in $dgt) { $dgtPorCodigo[$d.codigo_centro.Trim()] = $d }

Write-Host "Tu:          $($mine.Count)" -ForegroundColor Cyan
Write-Host "DGT:         $($dgt.Count)"  -ForegroundColor Cyan
Write-Host "Aliases:     $($alias.Count)" -ForegroundColor Cyan
Write-Host "Excepciones: $($excep.Count)" -ForegroundColor Cyan
Write-Host ""

# --- Normalizacion ---
function Normalizar-Texto($s) {
    if (-not $s) { return '' }
    $n = $s.ToLower().Trim()
    $n = $n -replace '[áàäâã]', 'a'
    $n = $n -replace '[éèëê]', 'e'
    $n = $n -replace '[íìïî]', 'i'
    $n = $n -replace '[óòöô]', 'o'
    $n = $n -replace '[úùüû]', 'u'
    $n = $n -replace 'ñ', 'n'
    $n = $n -replace 'ç', 'c'
    $n = $n -replace 'ª', 'a'
    $n = $n -replace '\s+', ' '
    return $n.Trim()
}

$mapaAlias = @{}
foreach ($a in $alias) {
    $v = Normalizar-Texto $a.variante
    $c = Normalizar-Texto $a.canonical
    if ($v) { $mapaAlias[$v] = $c }
}

function Canonicalizar-Municipio($m) {
    $n = Normalizar-Texto $m
    if ($mapaAlias.ContainsKey($n)) { return $mapaAlias[$n] }
    return $n
}

function Normalizar-Operador($op) {
    if (-not $op) { return 'desconocido' }
    $n = $op.ToUpper()
    if ($n -match 'APPLUS')                                            { return 'applus' }
    if ($n -match 'VEIASA|VERIFICACIONES INDUSTRIALES DE ANDALUC')    { return 'veiasa' }
    if ($n -match 'SGS|GENERAL DE SERVICIOS ITV')                      { return 'sgs' }
    if ($n -match 'ITEVELESA')                                         { return 'itevelesa' }
    if ($n -match 'ITVASA')                                            { return 'itvasa' }
    if ($n -match 'SITVAL|VALENCIANA DE SERVICIOS|ASEGURAMIENTO TECNICO') { return 'sitval' }
    if ($n -match 'CERTIO')                                            { return 'certio' }
    if ($n -match 'PREVENCONTROL|REVISIONES DE VEHICULOS')             { return 'prevencontrol' }
    if ($n -match 'TUV|TÜV|RHEINLAND|ATISAE')                          { return 'tuv' }
    if ($n -match 'DEKRA')                                             { return 'dekra' }
    if ($n -match 'ITA|ITASUA|ITELINK')                                { return 'itasua' }
    if ($n -match 'SYC|SUPERVISION Y CONTROL')                         { return 'syc' }
    if ($n -match 'IVESUR')                                            { return 'ivesur' }
    if ($n -match 'BARBASTRO|ARAGONESA|OCA')                           { return 'aragon' }
    if ($n -match 'RIOJA|ITEVEFIRSA')                                  { return 'rioja' }
    if ($n -match 'MACO|IDV|ITA-CASTILLA')                             { return 'grupo-local' }
    if ($n -match 'EXTREMADURA|GOBIERNO')                              { return 'gobierno' }
    if ($n -match 'CONSELL|INSULAR')                                   { return 'consell' }
    return 'otro'
}

function Get-Distancia($lat1, $lng1, $lat2, $lng2) {
    $R = 6371000.0
    $dLat = ($lat2 - $lat1) * [Math]::PI / 180
    $dLng = ($lng2 - $lng1) * [Math]::PI / 180
    $a = [Math]::Sin($dLat/2) * [Math]::Sin($dLat/2) +
         [Math]::Cos($lat1 * [Math]::PI/180) *
         [Math]::Cos($lat2 * [Math]::PI/180) *
         [Math]::Sin($dLng/2) * [Math]::Sin($dLng/2)
    return $R * 2 * [Math]::Atan2([Math]::Sqrt($a), [Math]::Sqrt(1-$a))
}

# Index DGT por municipio canonical
$dgtPorMuni = @{}
foreach ($d in $dgt) {
    $c = Canonicalizar-Municipio $d.municipio
    if (-not $dgtPorMuni.ContainsKey($c)) { $dgtPorMuni[$c] = @() }
    $dgtPorMuni[$c] += $d
}

# --- Cruce ---
$UMBRAL_EXACTO = 500
$resultado = @()
$dgtUsado  = @{}

foreach ($m in $mine) {
    $latM = [double]$m.lat
    $lngM = [double]$m.lng
    $muniC = Canonicalizar-Municipio $m.ciudad
    $opM   = Normalizar-Operador $m.operador
    $mejor = $null
    $mejorDist = [double]::MaxValue
    $estado = 'NO_MATCH'

    # === EXCEPCIONES PRIMERO ===
    if ($excep.ContainsKey($m.nombre.Trim())) {
        $codigoExc = $excep[$m.nombre.Trim()]
        if ($dgtPorCodigo.ContainsKey($codigoExc)) {
            $mejor = $dgtPorCodigo[$codigoExc]
            $mejorDist = Get-Distancia $latM $lngM ([double]$mejor.lat) ([double]$mejor.lng)
            $estado = 'MATCH_EXCEPCION'
        }
    }

    # === Si no hay excepcion, matching normal ===
    if ($estado -eq 'NO_MATCH') {
        foreach ($d in $dgt) {
            $dist = Get-Distancia $latM $lngM ([double]$d.lat) ([double]$d.lng)
            if ($dist -lt $mejorDist) {
                $mejorDist = $dist
                $mejor = $d
            }
        }

        if ($mejorDist -le $UMBRAL_EXACTO) {
            $estado = 'MATCH_EXACTO'
        } else {
            $candidatos = $dgtPorMuni[$muniC]
            if ($candidatos) {
                $matchOp = $candidatos | Where-Object {
                    (Normalizar-Operador $_.operador) -eq $opM
                } | Select-Object -First 1

                if ($matchOp) {
                    $mejor = $matchOp
                    $mejorDist = Get-Distancia $latM $lngM ([double]$mejor.lat) ([double]$mejor.lng)
                    $estado = 'MATCH_MUNICIPIO_OPERADOR'
                } else {
                    $matchMuni = $candidatos | Select-Object -First 1
                    if ($matchMuni) {
                        $mejor = $matchMuni
                        $mejorDist = Get-Distancia $latM $lngM ([double]$mejor.lat) ([double]$mejor.lng)
                        $estado = 'MATCH_MUNICIPIO'
                    }
                }
            }
        }
    }

    if ($estado -ne 'NO_MATCH' -and $mejor) {
        $dgtUsado[$mejor.codigo_centro] = $true
    }

    $resultado += [PSCustomObject]@{
        estado        = $estado
        distancia_m   = [Math]::Round($mejorDist, 1)
        mi_nombre     = $m.nombre
        mi_ciudad     = $m.ciudad
        mi_operador   = $m.operador
        mi_tel        = $m.tel
        mi_direccion  = $m.direccion
        mi_lat        = $latM
        mi_lng        = $lngM
        dgt_codigo    = if ($mejor) { $mejor.codigo_centro } else { '' }
        dgt_nombre    = if ($mejor) { $mejor.post_title } else { '' }
        dgt_operador  = if ($mejor) { $mejor.operador } else { '' }
        dgt_direccion = if ($mejor) { $mejor.direccion } else { '' }
        dgt_cp        = if ($mejor) { $mejor.cp } else { '' }
        dgt_tel       = if ($mejor) { $mejor.telefono } else { '' }
        dgt_slug      = if ($mejor) { $mejor.post_name } else { '' }
        dgt_municipio = if ($mejor) { $mejor.municipio } else { '' }
        dgt_lat       = if ($mejor) { $mejor.lat } else { '' }
        dgt_lng       = if ($mejor) { $mejor.lng } else { '' }
    }
}

$nuevas = $dgt | Where-Object { -not $dgtUsado.ContainsKey($_.codigo_centro) }

$resultado | Export-Csv -Path $outFile -NoTypeInformation -Encoding UTF8
$nuevas    | Export-Csv -Path $outNew  -NoTypeInformation -Encoding UTF8

$exacto = @($resultado | Where-Object { $_.estado -eq 'MATCH_EXACTO' }).Count
$exce   = @($resultado | Where-Object { $_.estado -eq 'MATCH_EXCEPCION' }).Count
$muniOp = @($resultado | Where-Object { $_.estado -eq 'MATCH_MUNICIPIO_OPERADOR' }).Count
$muni   = @($resultado | Where-Object { $_.estado -eq 'MATCH_MUNICIPIO' }).Count
$nomat  = @($resultado | Where-Object { $_.estado -eq 'NO_MATCH' }).Count

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  RESULTADO DEL CRUCE (v4)" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  MATCH_EXCEPCION (manual):       $exce"  -ForegroundColor Magenta
Write-Host "  MATCH_EXACTO (<=500m):          $exacto" -ForegroundColor Green
Write-Host "  MATCH_MUNI+OPER:                $muniOp" -ForegroundColor Green
Write-Host "  MATCH_MUNICIPIO (revisar):      $muni"   -ForegroundColor Yellow
Write-Host "  NO_MATCH (huerfanas):           $nomat"  -ForegroundColor Red
Write-Host "  ---" -ForegroundColor DarkGray
Write-Host "  Nuevas a crear (DGT):           $($nuevas.Count)" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Yellow

if ($nomat -gt 0) {
    Write-Host ""
    Write-Host "Huerfanas restantes:" -ForegroundColor Red
    $resultado | Where-Object { $_.estado -eq 'NO_MATCH' } | Format-Table mi_nombre, mi_ciudad, mi_operador -AutoSize
}