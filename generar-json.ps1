# generar-json.ps1 v3 - preserva duplicados con slug propio + fix CCAA

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$cruceFile  = Join-Path $base 'cruce-resultado.csv'
$nuevasFile = Join-Path $base 'nuevas-a-crear.csv'
$mineFile   = Join-Path $base 'estaciones-actuales.csv'
$dataDir    = Join-Path $base 'data'
if (-not (Test-Path $dataDir)) { New-Item -ItemType Directory -Path $dataDir | Out-Null }
$outFile = Join-Path $dataDir 'estaciones.json'

$cruce  = Import-Csv $cruceFile  -Encoding UTF8
$nuevas = Import-Csv $nuevasFile -Encoding UTF8
$mine   = Import-Csv $mineFile   -Encoding UTF8

function Convertir-Slug($s) {
    if (-not $s) { return '' }
    $formD = $s.Normalize([System.Text.NormalizationForm]::FormD)
    $sb = New-Object System.Text.StringBuilder
    foreach ($c in $formD.ToCharArray()) {
        $cat = [System.Globalization.CharUnicodeInfo]::GetUnicodeCategory($c)
        if ($cat -ne [System.Globalization.UnicodeCategory]::NonSpacingMark) { [void]$sb.Append($c) }
    }
    $n = $sb.ToString().ToLower().Trim()
    $n = $n -replace '[^a-z0-9\s-]', ''
    $n = $n -replace '\s+', '-'
    $n = $n -replace '-+', '-'
    return $n.Trim('-')
}

function MapearCCAA($ccaa) {
    if (-not $ccaa) { return '' }
    $c = $ccaa.Trim().ToUpper()
    switch -Regex ($c) {
        '^ANDALUC'                                 { return 'Andalucía' }
        '^ARAG'                                    { return 'Aragón' }
        '^ASTURIAS'                                { return 'Asturias' }
        '^BALEARES'                                { return 'Baleares' }
        '^CANARIAS'                                { return 'Canarias' }
        '^CANTABRIA'                               { return 'Cantabria' }
        '^CASTILLA\s*LA\s*MANCHA|^CASTILLA-LA'    { return 'Castilla-La Mancha' }
        '^CASTILLA\s*Y\s*LE'                       { return 'Castilla y León' }
        '^CATALU'                                  { return 'Cataluña' }
        '^C\.?\s*VALENCIANA|^COMUNIDAD VALENCIANA' { return 'Comunidad Valenciana' }
        '^EXTREMADURA'                             { return 'Extremadura' }
        '^GALICIA'                                 { return 'Galicia' }
        '^MADRID'                                  { return 'Madrid' }
        '^MURCIA'                                  { return 'Murcia' }
        '^NAVARRA'                                 { return 'Navarra' }
        '^PA[IÍ]S VASCO|EUSKADI'                   { return 'País Vasco' }
        '^LA\s*RIOJA|^RIOJA'                       { return 'La Rioja' }
        '^CEUTA'                                   { return 'Ceuta' }
        '^MELILLA'                                 { return 'Melilla' }
        default                                    { return '' }
    }
}

function Normalizar-OperadorCorto($op) {
    if (-not $op) { return 'Otro' }
    $n = $op.ToUpper()
    if ($n -match 'APPLUS')                                            { return 'Applus' }
    if ($n -match 'VEIASA|VERIFICACIONES INDUSTRIALES DE ANDALUC')    { return 'VEIASA' }
    if ($n -match 'SGS|GENERAL DE SERVICIOS ITV')                      { return 'SGS' }
    if ($n -match 'ITEVELESA')                                         { return 'Itevelesa' }
    if ($n -match 'ITVASA')                                            { return 'ITVASA' }
    if ($n -match 'SITVAL|VALENCIANA DE SERVICIOS|ASEGURAMIENTO TECNICO') { return 'SITVAL' }
    if ($n -match 'CERTIO')                                            { return 'Certio' }
    if ($n -match 'PREVENCONTROL|REVISIONES DE VEHICULOS')             { return 'Prevencontrol' }
    if ($n -match 'TUV|TÜV|RHEINLAND|ATISAE')                          { return 'TÜV' }
    if ($n -match 'DEKRA')                                             { return 'Dekra' }
    if ($n -match 'ITA|ITASUA|ITELINK')                                { return 'Itasua' }
    if ($n -match 'SYC|SUPERVISION Y CONTROL')                         { return 'SYC' }
    if ($n -match 'IVESUR')                                            { return 'Ivesur' }
    if ($n -match 'BARBASTRO|ARAGONESA|OCA')                           { return 'Aragon' }
    if ($n -match 'RIOJA|ITEVEFIRSA')                                  { return 'Rioja' }
    if ($n -match 'EXTREMADURA|GOBIERNO')                              { return 'Gobierno' }
    if ($n -match 'CONSELL|INSULAR')                                   { return 'Consell' }
    return 'Otro'
}

function Obtener-Horario($operador) {
    $op = $operador.ToUpper()
    if ($op -match 'APPLUS|TUV|TÜV')  { return 'extendido' }
    if ($op -match 'SGS|VEIASA')       { return 'amplio' }
    if ($op -match 'SITVAL')           { return 'continuo' }
    return 'estandar'
}

function Safe-Num($v) {
    if (-not $v) { return 0 }
    $n = 0.0
    if ([double]::TryParse($v, [ref]$n)) { return $n }
    return 0
}

# --- Índices auxiliares ---

$ccaaNuevas = @{}
foreach ($n in $nuevas) {
    $s = Convertir-Slug $n.post_name
    if ($s) { $ccaaNuevas[$s] = MapearCCAA $n.ccaa }
}

$ccaaMinePorNombre = @{}
foreach ($m in $mine) {
    $ccaaMinePorNombre[$m.nombre.Trim()] = MapearCCAA $m.ccaa
}

$datosMinePorNombre = @{}
foreach ($m in $mine) {
    $datosMinePorNombre[$m.nombre.Trim()] = $m
}

# --- Construir lista ---

$lista = @()
$slugsUsados = @{}
$duplicadosResueltos = @()

# 1) Matched
$matched = $cruce | Where-Object { $_.estado -ne 'NO_MATCH' }
foreach ($m in $matched) {
    $slugDGT = Convertir-Slug $m.dgt_slug
    $slugPropio = Convertir-Slug $m.mi_nombre

    # Elegir slug: si el DGT ya está usado, usar el propio
    if ($slugDGT -and -not $slugsUsados.ContainsKey($slugDGT)) {
        $slug = $slugDGT
        $esDuplicado = $false
    } elseif ($slugPropio -and -not $slugsUsados.ContainsKey($slugPropio)) {
        $slug = $slugPropio
        $esDuplicado = $true
        $duplicadosResueltos += "Preservado con slug propio: $($m.mi_nombre) -> $slug (DGT era: $slugDGT)"
    } else {
        $slug = $slugPropio + '-2'
        $esDuplicado = $true
        $duplicadosResueltos += "Preservado con -2: $($m.mi_nombre) -> $slug"
    }

    # Si es duplicado, usar datos del sitio (no del DGT) para no contaminar
    if ($esDuplicado -and $datosMinePorNombre.ContainsKey($m.mi_nombre.Trim())) {
        $datos = $datosMinePorNombre[$m.mi_nombre.Trim()]
        $lista += [PSCustomObject]@{
            nombre    = $m.mi_nombre
            slug      = $slug
            ciudad    = $datos.ciudad
            ccaa      = MapearCCAA $datos.ccaa
            operador  = Normalizar-OperadorCorto $datos.operador
            direccion = $datos.direccion
            cp        = $datos.cp
            lat       = Safe-Num $datos.lat
            lng       = Safe-Num $datos.lng
            tipo      = $datos.tipo
            tel       = $datos.tel
            horario   = Obtener-Horario $datos.operador
            source    = 'site-orphan'
        }
    } else {
        # No es duplicado, usar datos DGT
        $ccaa = $ccaaMinePorNombre[$m.mi_nombre.Trim()]
        $lista += [PSCustomObject]@{
            nombre    = $m.mi_nombre
            slug      = $slug
            ciudad    = $m.dgt_municipio
            ccaa      = $ccaa
            operador  = Normalizar-OperadorCorto $m.dgt_operador
            direccion = $m.dgt_direccion
            cp        = $m.dgt_cp
            lat       = Safe-Num $m.dgt_lat
            lng       = Safe-Num $m.dgt_lng
            tipo      = 'todos'
            tel       = $m.dgt_tel
            horario   = Obtener-Horario $m.dgt_operador
            source    = 'site'
        }
    }
    $slugsUsados[$slug] = $true
}

# 2) Huérfanas
$huerfanas = $cruce | Where-Object { $_.estado -eq 'NO_MATCH' }
foreach ($h in $huerfanas) {
    $slug = Convertir-Slug $h.mi_nombre
    if ($slugsUsados.ContainsKey($slug)) { $slug = $slug + '-2' }
    $lista += [PSCustomObject]@{
        nombre    = $h.mi_nombre
        slug      = $slug
        ciudad    = $h.mi_ciudad
        ccaa      = $ccaaMinePorNombre[$h.mi_nombre.Trim()]
        operador  = Normalizar-OperadorCorto $h.mi_operador
        direccion = $h.mi_direccion
        cp        = ''
        lat       = Safe-Num $h.mi_lat
        lng       = Safe-Num $h.mi_lng
        tipo      = 'todos'
        tel       = $h.mi_tel
        horario   = 'estandar'
        source    = 'site-orphan'
    }
    $slugsUsados[$slug] = $true
}

# 3) Nuevas
foreach ($n in $nuevas) {
    $slug = Convertir-Slug $n.post_name
    if (-not $slug) { $slug = Convertir-Slug $n.post_title }
    if ($slugsUsados.ContainsKey($slug)) { $slug = $slug + '-2' }

    $lista += [PSCustomObject]@{
        nombre    = $n.post_title
        slug      = $slug
        ciudad    = $n.municipio
        ccaa      = MapearCCAA $n.ccaa
        operador  = Normalizar-OperadorCorto $n.operador
        direccion = $n.direccion
        cp        = $n.cp
        lat       = Safe-Num $n.lat
        lng       = Safe-Num $n.lng
        tipo      = 'todos'
        tel       = $n.telefono
        horario   = Obtener-Horario $n.operador
        source    = 'dgt-new'
    }
    $slugsUsados[$slug] = $true
}

$lista = $lista | Sort-Object ccaa, ciudad, nombre

$json = [PSCustomObject]@{
    generado   = (Get-Date -Format 'yyyy-MM-ddTHH:mm:ss')
    version    = '1.0'
    total      = $lista.Count
    estaciones = @($lista)
}
$json | ConvertTo-Json -Depth 5 | Out-File -FilePath $outFile -Encoding UTF8

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  JSON v3 GENERADO" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Total entradas: $($lista.Count)" -ForegroundColor Green
Write-Host "  Duplicados preservados: $($duplicadosResueltos.Count)" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Sin CCAA: $(@($lista | Where-Object { -not $_.ccaa }).Count)" -ForegroundColor Red
Write-Host "  Sin tel:  $(@($lista | Where-Object { -not $_.tel }).Count)" -ForegroundColor Yellow
Write-Host "  Sin coords validas: $(@($lista | Where-Object { $_.lat -eq 0 -or $_.lng -eq 0 }).Count)" -ForegroundColor Yellow
Write-Host ""
Write-Host "Distribucion por CCAA:" -ForegroundColor Yellow
$lista | Group-Object ccaa | Sort-Object Count -Descending | Format-Table Count, Name -AutoSize

if ($duplicadosResueltos.Count -gt 0) {
    Write-Host ""
    Write-Host "Duplicados preservados con slug propio:" -ForegroundColor Cyan
    $duplicadosResueltos | ForEach-Object { Write-Host "  $_" -ForegroundColor DarkGray }
}

# Lista de los sin CCAA
$sinCCAA = $lista | Where-Object { -not $_.ccaa }
if ($sinCCAA.Count -gt 0) {
    Write-Host ""
    Write-Host "Sin CCAA (revisar):" -ForegroundColor Red
    $sinCCAA | Format-Table nombre, ciudad, operador -AutoSize
}