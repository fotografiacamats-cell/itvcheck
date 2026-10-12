# plan-saneamiento.ps1 v3
# Compara tus 185 matched con DGT y genera un plan de correcciones

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$cruceFile = Join-Path $base 'cruce-resultado.csv'
$outFile   = Join-Path $base 'plan-saneamiento.csv'

$cruce = Import-Csv $cruceFile -Encoding UTF8
$matched = $cruce | Where-Object { $_.estado -ne 'NO_MATCH' }

# Detectar canibalizadas (dgt_codigo aparece >1 vez entre MATCH_MUNICIPIO)
$codigosCanibalizados = @{}
$cruce | Where-Object { $_.estado -eq 'MATCH_MUNICIPIO' } |
    Group-Object dgt_codigo |
    Where-Object { $_.Count -gt 1 } |
    ForEach-Object { $codigosCanibalizados[$_.Name] = $true }

function Normalizar-Tel($t) {
    if (-not $t) { return '' }
    return ($t -replace '\s', '' -replace '\.', '' -replace '-', '')
}

function Normalizar-Dir($d) {
    if (-not $d) { return '' }
    $n = $d.ToLower().Trim()
    $n = $n -replace '[áàäâã]', 'a'
    $n = $n -replace '[éèëê]', 'e'
    $n = $n -replace '[íìïî]', 'i'
    $n = $n -replace '[óòöô]', 'o'
    $n = $n -replace '[úùüû]', 'u'
    $n = $n -replace 'ñ', 'n'
    $n = $n -replace 'pol\.?\s*ind\.?', 'poligono industrial'
    $n = $n -replace 'pol\.?\s*industrial', 'poligono industrial'
    $n = $n -replace 'ctra\.?', 'carretera'
    $n = $n -replace 'c/', 'calle '
    $n = $n -replace '[,.;]', ' '
    $n = $n -replace '\s+', ' '
    return $n.Trim()
}

$plan = foreach ($m in $matched) {
    $telIgual  = (Normalizar-Tel $m.mi_tel) -eq (Normalizar-Tel $m.dgt_tel)
    $dirIgual  = (Normalizar-Dir $m.mi_direccion) -eq (Normalizar-Dir $m.dgt_direccion)
    $dist      = [double]$m.distancia_m
    $coordsOK  = $dist -le 500

    $opIgual = ($m.mi_operador -match [regex]::Escape(($m.dgt_operador -split '\s+')[0])) -or
               ($m.dgt_operador -match [regex]::Escape($m.mi_operador))

    $revisar = @()
    if (-not $telIgual) { $revisar += 'TEL' }
    if (-not $dirIgual) { $revisar += 'DIR' }
    if (-not $coordsOK) { $revisar += 'COORD' }
    if (-not $opIgual)  { $revisar += 'OP' }

    $accion = ''
    if ($codigosCanibalizados.ContainsKey($m.dgt_codigo)) {
        $accion = 'REVISAR_MANUAL_CANIBALIZADA'
    } elseif ($m.estado -eq 'MATCH_MUNICIPIO') {
        $accion = 'REVISAR_MANUAL'
    } else {
        if ($revisar.Count -eq 0) { $accion = 'OK' }
        else { $accion = 'AUTO_ACTUALIZAR' }
    }

    [PSCustomObject]@{
        estado          = $m.estado
        accion          = $accion
        mi_nombre       = $m.mi_nombre
        dgt_slug        = $m.dgt_slug
        distancia_m     = $m.distancia_m
        campos_cambiar  = ($revisar -join '|')
        tel_mio         = $m.mi_tel
        tel_dgt         = $m.dgt_tel
        dir_mia         = $m.mi_direccion
        dir_dgt         = $m.dgt_direccion
        op_mio          = $m.mi_operador
        op_dgt          = $m.dgt_operador
        lat_mia         = $m.mi_lat
        lng_mia         = $m.mi_lng
        lat_dgt         = $m.dgt_lat
        lng_dgt         = $m.dgt_lng
    }
}

$plan | Export-Csv -Path $outFile -NoTypeInformation -Encoding UTF8

$total      = @($plan).Count
$ok         = @($plan | Where-Object { $_.accion -eq 'OK' }).Count
$auto       = @($plan | Where-Object { $_.accion -eq 'AUTO_ACTUALIZAR' }).Count
$revisar    = @($plan | Where-Object { $_.accion -eq 'REVISAR_MANUAL' }).Count
$canibal    = @($plan | Where-Object { $_.accion -eq 'REVISAR_MANUAL_CANIBALIZADA' }).Count

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  PLAN DE SANEAMIENTO v3" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Total matched:        $total" -ForegroundColor Cyan
Write-Host "  OK (no tocar):        $ok"    -ForegroundColor Green
Write-Host "  AUTO_ACTUALIZAR:      $auto"  -ForegroundColor Green
Write-Host "  REVISAR_MANUAL:       $revisar" -ForegroundColor Yellow
Write-Host "  REVISAR_CANIBALIZADA: $canibal"  -ForegroundColor Red
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "Desglose de campos a cambiar:" -ForegroundColor Cyan
Write-Host "  Tel:   $(@($plan | Where-Object { $_.campos_cambiar -match 'TEL' }).Count) fichas"
Write-Host "  Dir:   $(@($plan | Where-Object { $_.campos_cambiar -match 'DIR' }).Count) fichas"
Write-Host "  Op:    $(@($plan | Where-Object { $_.campos_cambiar -match 'OP' }).Count) fichas"
Write-Host "  Coord: $(@($plan | Where-Object { $_.campos_cambiar -match 'COORD' }).Count) fichas"