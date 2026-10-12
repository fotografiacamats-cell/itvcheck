# filtrar-auto.ps1 - Endurece el filtro de AUTO_ACTUALIZAR

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$planFile  = Join-Path $base 'plan-saneamiento.csv'
$mineFile  = Join-Path $base 'estaciones-actuales.csv'
$outFile   = Join-Path $base 'plan-saneamiento-filtrado.csv'

$plan = Import-Csv $planFile -Encoding UTF8
$mine = Import-Csv $mineFile -Encoding UTF8

# Crear índice de mis CP por nombre
$cpMio = @{}
foreach ($m in $mine) { $cpMio[$m.nombre.Trim()] = $m.cp.Trim() }

function Normalizar-Tel($t) {
    if (-not $t) { return '' }
    return ($t -replace '\s', '' -replace '\.', '' -replace '-', '')
}

# Enriquecer el plan con mi CP
$resultado = foreach ($p in $plan) {
    $miCP = if ($cpMio.ContainsKey($p.mi_nombre.Trim())) { $cpMio[$p.mi_nombre.Trim()] } else { '' }
    $dgtCP = ''  # lo rellenaremos abajo

    $dist = [double]$p.distancia_m

    $cpCoincide = $false
    $telCoincide = (Normalizar-Tel $p.tel_mio) -eq (Normalizar-Tel $p.tel_dgt)

    # Reclasificar
    $nuevaAccion = $p.accion
    if ($p.accion -eq 'AUTO_ACTUALIZAR') {
        if ($dist -le 500) {
            $nuevaAccion = 'AUTO_SEGURO_DISTANCIA'
        } elseif ($telCoincide) {
            $nuevaAccion = 'AUTO_SEGURO_TEL'
        } elseif ($p.dgt_tel -eq '' -or $p.dgt_direccion -eq '') {
            $nuevaAccion = 'REVISAR_DATOS_INCOMPLETOS'
        } elseif ($dist -gt 5000) {
            $nuevaAccion = 'REVISAR_DISTANCIA_ALTA'
        } else {
            $nuevaAccion = 'REVISAR_MANUAL'
        }
    }

    [PSCustomObject]@{
        accion          = $nuevaAccion
        accion_original = $p.accion
        estado          = $p.estado
        mi_nombre       = $p.mi_nombre
        dgt_slug        = $p.dgt_slug
        distancia_m     = $p.distancia_m
        campos_cambiar  = $p.campos_cambiar
        tel_mio         = $p.tel_mio
        tel_dgt         = $p.tel_dgt
        tel_coincide    = $telCoincide
        dir_mia         = $p.dir_mia
        dir_dgt         = $p.dir_dgt
        op_mio          = $p.op_mio
        op_dgt          = $p.op_dgt
        lat_mia         = $p.lat_mia
        lng_mia         = $p.lng_mia
        lat_dgt         = $p.lat_dgt
        lng_dgt         = $p.lng_dgt
    }
}

$resultado | Export-Csv -Path $outFile -NoTypeInformation -Encoding UTF8

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  PLAN FILTRADO" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
$resultado | Group-Object accion | Sort-Object Count -Descending | Format-Table Count, Name -AutoSize

Write-Host ""
Write-Host "Detalle de SEGURO:" -ForegroundColor Green
$resultado | Where-Object { $_.accion -like 'AUTO_SEGURO*' } |
    Select-Object mi_nombre, accion, distancia_m, tel_mio, tel_dgt |
    Format-Table -AutoSize