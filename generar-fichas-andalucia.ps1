# generar-fichas-andalucia.ps1
# Genera las fichas del Lote 2 Andalucia
# Version sin acentos literales (evita problemas de encoding)

param([switch]$TestMode)

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'
$plantillaFile = Join-Path $base 'plantilla-ficha.html'
$descriptorFile = Join-Path $base 'descriptores-andalucia.csv'
$estacionesDir = Join-Path $base 'estaciones'

if (-not (Test-Path $jsonFile)) { throw "No encuentro $jsonFile" }
if (-not (Test-Path $plantillaFile)) { throw "No encuentro $plantillaFile" }

$json = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$plantilla = Get-Content $plantillaFile -Raw -Encoding UTF8

# Cargar descriptores manuales (si existen)
$descriptores = @{}
if (Test-Path $descriptorFile) {
    $descs = Import-Csv $descriptorFile -Encoding UTF8
    foreach ($d in $descs) {
        $descriptores[$d.slug.Trim()] = $d.descriptor.Trim()
    }
    Write-Host "Descriptores manuales cargados: $($descriptores.Count)" -ForegroundColor Cyan
}

# ============================================================
# FUNCIONES
# ============================================================

function Get-TitleCase($s) {
    if (-not $s) { return $s }
    $c = (Get-Culture).TextInfo.ToTitleCase($s.ToLower())
    $c = $c -replace '\bDe\b', 'de' -replace '\bDel\b', 'del'
    $c = $c -replace '\bLa\b', 'la' -replace '\bLas\b', 'las'
    $c = $c -replace '\bEl\b', 'el' -replace '\bLos\b', 'los'
    $c = $c -replace '\bY\b', 'y' -replace '\bEn\b', 'en'
    $c = $c -replace '\bA\b', 'a' -replace '\bCon\b', 'con'
    if ($c.Length -gt 0) { $c = $c.Substring(0,1).ToUpper() + $c.Substring(1) }
    return $c
}

function Formatear-Direccion($d) {
    if (-not $d) { return '' }
    $c = Get-TitleCase $d
    $c = $c -replace '\bC/\s*', 'C/ '
    $c = $c -replace '\bAv\.\s*', 'Av. '
    $c = $c -replace '\bAvda\.\s*', 'Avda. '
    $c = $c -replace '\bCtra\.\s*', 'Ctra. '
    $c = $c -replace '\bPol\.\s*Ind\.', 'Pol. Ind.'
    $c = $c -replace '\bS/N\b', 'S/N'
    $c = $c -replace '\s+', ' '
    return $c.Trim()
}

function Formatear-Nombre($n) {
    if (-not $n) { return '' }
    $c = $n -replace [char]0x00AE, ''
    $c = Get-TitleCase $c
    $c = $c -replace '\bItv\b', 'ITV'
    $c = $c -replace '\bSgs\b', 'SGS'
    $c = $c -replace '\bOca\b', 'OCA'
    $c = $c -replace '\bTuv\b', 'TUV'
    $c = $c -replace '\bVeiasa\b', 'VEIASA'
    $c = $c -replace '\bItvasa\b', 'ITVASA'
    $c = $c -replace '\bSitval\b', 'SITVAL'
    $c = $c -replace '\s+', ' '
    return $c.Trim()
}

function Get-OperadorLegible($operadorOriginal, $nombreEstacion, $municipio) {
    if (-not $operadorOriginal -or $operadorOriginal -eq 'Otro') {
        return "ITV de $(Get-TitleCase $municipio)"
    }
    $op = $operadorOriginal
    $opUp = $op.ToUpper()

    if ($opUp -match 'APPLUS')       { return 'Applus' }
    if ($opUp -match 'VEIASA|VERIFICACIONES INDUSTRIALES') { return 'VEIASA' }
    if ($opUp -match 'SGS|GENERAL DE SERVICIOS') { return 'SGS' }
    if ($opUp -match 'ITEVELESA')    { return 'Itevelesa' }
    if ($opUp -match 'ITVASA')       { return 'ITVASA' }
    if ($opUp -match 'SITVAL|VALENCIANA DE SERVICIOS|ASEGURAMIENTO') { return 'SITVAL' }
    if ($opUp -match 'CERTIO')       { return 'Certio' }
    if ($opUp -match 'PREVENCONTROL|REVISIONES DE VEHICULOS') { return 'Prevencontrol' }
    if ($opUp -match 'TUV|RHEINLAND|ATISAE') { return 'TUV' }
    if ($opUp -match 'DEKRA')        { return 'Dekra' }
    if ($opUp -match 'SYC|SUPERVISION') { return 'SYC' }
    if ($opUp -match 'OCA')          { return 'OCA' }

    $limpio = $op
    $limpio = $limpio -replace ',?\s*S\.?L\.?U?\.?\s*$', ''
    $limpio = $limpio -replace ',?\s*S\.?A\.?U?\.?\s*$', ''
    $limpio = $limpio.Trim().TrimEnd(',', '.', ' ')
    $limpio = Get-TitleCase $limpio
    $limpio = $limpio -replace '\bItv\b', 'ITV'
    if ($limpio.Length -lt 4) { return "ITV de $(Get-TitleCase $municipio)" }
    return $limpio.Trim()
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

function Get-TituloCorto($e) {
    $ciudadFmt = Get-TitleCase $e.ciudad
    $sufijo = "cita, tel" + [char]0x00E9 + "fono y horario 2026"

    # 1. Descriptor manual si existe
    if ($descriptores.ContainsKey($e.slug)) {
        $desc = $descriptores[$e.slug]
        return "ITV $ciudadFmt ($desc): $sufijo"
    }

    # 2. Comprobar si hay otras fichas del mismo municipio
    $enMismoMuni = $json.estaciones | Where-Object { $_.ciudad -eq $e.ciudad -and $_.slug -ne $e.slug }
    $tieneConflicto = @($enMismoMuni).Count -gt 0

    if (-not $tieneConflicto) {
        return "ITV $ciudadFmt`: $sufijo"
    }

    # 3. Descriptor automatico
    $nombre = $e.nombre -replace '(?i)^ITV\s+', ''
    $nombre = $nombre -replace '(?i)VEIASA\s+', ''
    $nombre = $nombre -replace "(?i)$([regex]::Escape($e.ciudad))\s*", ''
    $nombre = $nombre -replace '(?i)\s*(ITV|SL|SA|S\.L|S\.A)\s*$', ''
    $nombre = $nombre.Trim().TrimEnd(',', '.', ' ')
    if ($nombre.Length -lt 2) { $nombre = $e.operador }

    return "ITV $ciudadFmt ($nombre): $sufijo"
}

function Get-MetaDesc($e, $operadorLegible) {
    $ciudadFmt = Get-TitleCase $e.ciudad
    $tel = "tel" + [char]0x00E9 + "fono"
    $dir = "direcci" + [char]0x00F3 + "n"
    return "ITV en $ciudadFmt con $operadorLegible. Cita previa online, $tel directo $($e.tel), horario, $dir y precio 2026."
}

function Get-Intro($e, $operadorLegible, $nombreFmt, $direccionFmt) {
    $ciudadFmt = Get-TitleCase $e.ciudad
    $totalMuni = @($json.estaciones | Where-Object { $_.ciudad -eq $e.ciudad }).Count
    $totalCcaa = @($json.estaciones | Where-Object { $_.ccaa -match 'Andaluc' }).Count
    $dir = $direccionFmt
    if ($dir.Length -gt 60) { $dir = $dir.Substring(0,57) + '...' }

    $eS = "$nombreFmt est&aacute; operada por $operadorLegible"
    $e2 = "Se encuentra en $dir"

    if ($totalMuni -gt 1) {
        return "$eS. $e2. Es una de las $totalMuni estaciones autorizadas en $ciudadFmt y forma parte de las $totalCcaa ITVs de Andaluc&iacute;a. Cuenta con servicio de inspecci&oacute;n t&eacute;cnica para turismos, motocicletas y veh&iacute;culos industriales."
    } else {
        return "$eS. $e2. Es la estaci&oacute;n de referencia para los conductores de $ciudadFmt y forma parte de las $totalCcaa ITVs autorizadas en Andaluc&iacute;a. Ofrece inspecci&oacute;n t&eacute;cnica para turismos, motocicletas y veh&iacute;culos industriales."
    }
}

function Get-HorarioTxt($horario) {
    switch ($horario) {
        'extendido'  { return 'L-V 7:00-21:00 &middot; S 8:00-14:00' }
        'amplio'     { return 'L-V 7:45-20:15 &middot; S 8:00-13:00' }
        'continuo'   { return 'L-V 7:30-21:30 &middot; S 9:00-14:00' }
        'madrugador' { return 'L-V 6:00-21:00' }
        'finde'      { return 'L-V 8:00-20:00 &middot; S 8:30-19:00 &middot; D 8:30-14:30' }
        default      { return 'L-V 8:00-20:00 &middot; S 9:00-14:00' }
    }
}

function Get-PreciosCcaa($ccaa) {
    # Por defecto andaluza (35-50 turismo, 20-30 moto, 60-85 industrial)
    return @('35','50','20','30','60','85')
}

function Get-UrlCita($operador) {
    switch -Regex ($operador) {
        'Applus' { return 'https://www.applusiteuve.com/' }
        'SGS' { return 'https://www.sgs.es/es-es/servicios/itv' }
        'TUV|TÜV' { return 'https://www.tuvsud.com/es-es' }
        'Itevelesa' { return 'https://www.itevelesa.com/' }
        'VEIASA' { return 'https://www.veiasa.es/' }
        'SITVAL' { return 'https://www.sitval.gva.es/' }
        'ITVASA' { return 'https://www.itvasa.es/' }
        'Dekra' { return 'https://www.dekra.es/' }
        'OCA' { return 'https://www.ocaiteuve.com/' }
        default { return 'https://www.google.com/search?q=' + [uri]::EscapeDataString($operador + ' ITV cita previa') }
    }
}

function Get-5Cercanas($e, $todas) {
    $distancias = foreach ($otra in $todas) {
        if ($otra.slug -eq $e.slug) { continue }
        $d = Get-Distancia $e.lat $e.lng $otra.lat $otra.lng
        [PSCustomObject]@{
            slug   = $otra.slug
            nombre = Formatear-Nombre $otra.nombre
            ciudad = $otra.ciudad
            dist   = [Math]::Round($d / 1000, 1)
        }
    }
    return $distancias | Sort-Object dist | Select-Object -First 5
}

function Get-FaqHtml($e, $ciudadFmt) {
    $r = ""
    $r += "<h3>&iquest;Se puede pasar la ITV en $ciudadFmt sin cita previa?</h3>`n"
    $r += "<p>S&iacute;, pero es recomendable pedir cita. La espera sin cita puede superar los 60 minutos en hora punta.</p>`n"
    $r += "<h3>&iquest;Cu&aacute;nto cuesta la ITV aqu&iacute;?</h3>`n"
    $r += "<p>En $($e.ccaa) el precio orientativo es: Turismo 35-50 EUR, Moto 20-30 EUR, Industrial 60-85 EUR. Consulta el <a href=""../calculadora-precio-itv"">precio exacto en nuestra calculadora</a>.</p>`n"
    $r += "<h3>&iquest;Cu&aacute;ndo me toca pasar la ITV?</h3>`n"
    $r += "<p>Depende del tipo de veh&iacute;culo y su antig&uuml;edad. Usa nuestra <a href=""../cuando-me-toca-itv"">calculadora de periodicidad</a>.</p>`n"
    $r += "<h3>&iquest;Qu&eacute; pasa si suspendo la ITV aqu&iacute;?</h3>`n"
    $r += "<p>Puedes volver a la misma estaci&oacute;n o ir a cualquier otra autorizada de Espa&ntilde;a. La segunda inspecci&oacute;n tiene descuento si es en la misma estaci&oacute;n dentro de los 15 d&iacute;as.</p>"
    return $r
}

function Get-FaqJson($e, $ciudadFmt) {
    $q1 = [char]0x00BF + "Se puede pasar la ITV en $ciudadFmt sin cita previa?"
    $q2 = [char]0x00BF + "Cu" + [char]0x00E1 + "nto cuesta la ITV aqu" + [char]0x00ED + "?"
    $q3 = [char]0x00BF + "Cu" + [char]0x00E1 + "ndo me toca pasar la ITV?"
    $q4 = [char]0x00BF + "Qu" + [char]0x00E9 + " pasa si suspendo la ITV aqu" + [char]0x00ED + "?"
    $a1 = "S" + [char]0x00ED + ", pero es recomendable pedir cita. La espera sin cita puede superar los 60 minutos en hora punta."
    $a2 = "En $($e.ccaa) el precio orientativo es: Turismo 35-50 euros, Moto 20-30 euros, Industrial 60-85 euros."
    $a3 = "Depende del tipo de veh" + [char]0x00ED + "culo y su antig" + [char]0x00FC + "edad. Usa nuestra calculadora de periodicidad."
    $a4 = "Puedes volver a la misma estaci" + [char]0x00F3 + "n o ir a cualquier otra autorizada de Espa" + [char]0x00F1 + "a. La segunda inspecci" + [char]0x00F3 + "n tiene descuento si es en la misma estaci" + [char]0x00F3 + "n dentro de los 15 d" + [char]0x00ED + "as."

    $jsonObj = [PSCustomObject]@{
        '@context' = 'https://schema.org'
        '@type' = 'FAQPage'
        mainEntity = @(
            @{ '@type'='Question'; name=$q1; acceptedAnswer=@{ '@type'='Answer'; text=$a1 } }
            @{ '@type'='Question'; name=$q2; acceptedAnswer=@{ '@type'='Answer'; text=$a2 } }
            @{ '@type'='Question'; name=$q3; acceptedAnswer=@{ '@type'='Answer'; text=$a3 } }
            @{ '@type'='Question'; name=$q4; acceptedAnswer=@{ '@type'='Answer'; text=$a4 } }
        )
    }
    return ($jsonObj | ConvertTo-Json -Depth 10 -Compress)
}

# ============================================================
# GENERACION
# ============================================================

# Filtro por prefijo (inmune a encoding)
$nuevas = $json.estaciones | Where-Object { $_.ccaa -match 'Andaluc' -and $_.source -eq 'dgt-new' }

if ($TestMode) {
    $nuevas = $nuevas | Select-Object -First 3
}

Write-Host "Fichas a generar: $(@($nuevas).Count)" -ForegroundColor Cyan

$generadas = 0
$errores = @()

foreach ($e in $nuevas) {
    try {
        $slug = $e.slug
        $nombreFmt = Formatear-Nombre $e.nombre
        $direccionFmt = Formatear-Direccion $e.direccion
        $operadorLegible = Get-OperadorLegible $e.operador $nombreFmt $e.ciudad
        $ciudadFmt = Get-TitleCase $e.ciudad

        $titulo = Get-TituloCorto $e
        $metaDesc = Get-MetaDesc $e $operadorLegible
        $intro = Get-Intro $e $operadorLegible $nombreFmt $direccionFmt
        $horarioTxt = Get-HorarioTxt $e.horario
        $precios = Get-PreciosCcaa $e.ccaa
        $urlCita = Get-UrlCita $operadorLegible

        $telLink = ($e.tel -replace '[^0-9]', '')
        if ($telLink -notmatch '^34') { $telLink = '34' + $telLink }

        $nombreUrl = [uri]::EscapeDataString($nombreFmt)

        $cercanas = Get-5Cercanas $e $json.estaciones
        $cercanasHtml = ''
        foreach ($c in $cercanas) {
            $cercanasHtml += "<a href=""$($c.slug).html"">$($c.nombre) &middot; $($c.dist) km</a>`n"
        }

        $faqHtml = Get-FaqHtml $e $ciudadFmt
        $faqJson = Get-FaqJson $e $ciudadFmt

        $jsonLdAuto = [PSCustomObject]@{
            '@context' = 'https://schema.org'
            '@type' = 'AutomotiveBusiness'
            name = $nombreFmt
            address = @{
                '@type' = 'PostalAddress'
                streetAddress = $direccionFmt
                postalCode = $e.cp
                addressLocality = $ciudadFmt
                addressRegion = $e.ccaa
                addressCountry = 'ES'
            }
            geo = @{
                '@type' = 'GeoCoordinates'
                latitude = $e.lat
                longitude = $e.lng
            }
            url = "https://itvcheck.es/estaciones/$slug"
            telephone = $e.tel
            priceRange = [char]0x20AC + [char]0x20AC
            areaServed = @{
                '@type' = 'AdministrativeArea'
                name = $e.ccaa
            }
        }
        $jsonLdAutoStr = ($jsonLdAuto | ConvertTo-Json -Depth 10 -Compress)

        $jsonLdBreadcrumb = [PSCustomObject]@{
            '@context' = 'https://schema.org'
            '@type' = 'BreadcrumbList'
            itemListElement = @(
                @{ '@type'='ListItem'; position=1; name='Inicio'; item='https://itvcheck.es/' }
                @{ '@type'='ListItem'; position=2; name='Mapa de Estaciones ITV'; item='https://itvcheck.es/estaciones-itv' }
                @{ '@type'='ListItem'; position=3; name=$nombreFmt; item="https://itvcheck.es/estaciones/$slug" }
            )
        }
        $jsonLdBreadcrumbStr = ($jsonLdBreadcrumb | ConvertTo-Json -Depth 10 -Compress)

        $html = $plantilla
        $html = $html.Replace('{{TITULO}}', $titulo)
        $html = $html.Replace('{{META_DESC}}', $metaDesc)
        $html = $html.Replace('{{SLUG}}', $slug)
        $html = $html.Replace('{{NOMBRE}}', $nombreFmt)
        $html = $html.Replace('{{NOMBRE_URL}}', $nombreUrl)
        $html = $html.Replace('{{CIUDAD}}', $ciudadFmt)
        $html = $html.Replace('{{CCAA}}', $e.ccaa)
        $html = $html.Replace('{{OPERADOR}}', $operadorLegible)
        $html = $html.Replace('{{DIRECCION}}', $direccionFmt)
        $html = $html.Replace('{{TELEFONO}}', $e.tel)
        $html = $html.Replace('{{TELEFONO_LINK}}', $telLink)
        $html = $html.Replace('{{HORARIO_TXT}}', $horarioTxt)
        $html = $html.Replace('{{LAT}}', $e.lat)
        $html = $html.Replace('{{LNG}}', $e.lng)
        $html = $html.Replace('{{URL_CITA}}', $urlCita)
        $html = $html.Replace('{{PRECIO_TURISMO}}', "$($precios[0])-$($precios[1])")
        $html = $html.Replace('{{PRECIO_MOTO}}', "$($precios[2])-$($precios[3])")
        $html = $html.Replace('{{PRECIO_INDUSTRIAL}}', "$($precios[4])-$($precios[5])")
        $html = $html.Replace('{{INTRO}}', $intro)
        $html = $html.Replace('{{CERCANAS}}', $cercanasHtml.TrimEnd())
        $html = $html.Replace('{{FAQ_HTML}}', $faqHtml.TrimEnd())
        $html = $html.Replace('{{JSON_LD_AUTO}}', $jsonLdAutoStr)
        $html = $html.Replace('{{JSON_LD_BREADCRUMB}}', $jsonLdBreadcrumbStr)
        $html = $html.Replace('{{JSON_LD_FAQ}}', $faqJson)

        $outFile = Join-Path $estacionesDir "$slug.html"
        Set-Content -Path $outFile -Value $html -Encoding UTF8 -NoNewline

        $generadas++
        Write-Host "OK: $slug.html" -ForegroundColor Green
    } catch {
        $errores += "$($e.slug): $_"
        Write-Host "ERROR en $($e.slug): $_" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  RESUMEN LOTE 2 ANDALUCIA" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Total:     $(@($nuevas).Count)" -ForegroundColor Cyan
Write-Host "  Generadas: $generadas" -ForegroundColor Green
if ($errores.Count -gt 0) {
    Write-Host "  Errores:   $($errores.Count)" -ForegroundColor Red
    $errores | Select-Object -First 5 | ForEach-Object { Write-Host "    $_" -ForegroundColor DarkRed }
}
Write-Host "==========================================" -ForegroundColor Yellow