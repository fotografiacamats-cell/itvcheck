# generar-fichas-universal.ps1
# Basado en generar-fichas-madrid.ps1
param(
    [Parameter(Mandatory=$true)]
    [string]$CCAA,
    [switch]$TestMode
)

$ErrorActionPreference = 'Stop'
$inv = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentCulture = $inv

$EUR  = [char]0x20AC
$AA   = [char]0x00E1
$EE   = [char]0x00E9
$II   = [char]0x00ED
$OO   = [char]0x00F3
$UU   = [char]0x00FA
$NN   = [char]0x00F1

$base = 'C:\Users\Usuario\Desktop\ITVcheck'
$jsonFile = Join-Path $base 'data\estaciones.json'
$plantillaFile = Join-Path $base 'plantilla-ficha.html'
$estacionesDir = Join-Path $base 'estaciones'

if (-not (Test-Path $jsonFile)) { throw "No encuentro $jsonFile" }
if (-not (Test-Path $plantillaFile)) { throw "No encuentro $plantillaFile" }

$json = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
$plantilla = Get-Content $plantillaFile -Raw -Encoding UTF8

# Filtro universal: CCAA específica y que NO tenga archivo HTML aún
$nuevas = $json.estaciones | Where-Object { 
    $_.ccaa -eq $CCAA -and -not (Test-Path (Join-Path $estacionesDir "$($_.slug).html"))
}

if ($TestMode) {
    $nuevas = $nuevas | Select-Object -First 2
}

Write-Host "Fichas a generar en $($CCAA): $(@($nuevas).Count)" -ForegroundColor Cyan

# --- Utilidades (idénticas a tu script de Madrid) ---
function Convertir-Slug($s) { if (-not $s) { return '' }; $formD = $s.Normalize([System.Text.NormalizationForm]::FormD); $sb = New-Object System.Text.StringBuilder; foreach ($c in $formD.ToCharArray()) { $cat = [System.Globalization.CharUnicodeInfo]::GetUnicodeCategory($c); if ($cat -ne [System.Globalization.UnicodeCategory]::NonSpacingMark) { [void]$sb.Append($c) } }; $n = $sb.ToString().ToLower().Trim(); $n = $n -replace '[^a-z0-9\s-]', ''; $n = $n -replace '\s+', '-'; $n = $n -replace '-+', '-'; return $n.Trim('-') }

function Get-Distancia($lat1, $lng1, $lat2, $lng2) { $R = 6371000.0; $dLat = ($lat2 - $lat1) * [Math]::PI / 180; $dLng = ($lng2 - $lng1) * [Math]::PI / 180; $a = [Math]::Sin($dLat/2) * [Math]::Sin($dLat/2) + [Math]::Cos($lat1 * [Math]::PI/180) * [Math]::Cos($lat2 * [Math]::PI/180) * [Math]::Sin($dLng/2) * [Math]::Sin($dLng/2); return $R * 2 * [Math]::Atan2([Math]::Sqrt($a), [Math]::Sqrt(1-$a)) }

function TitleCase-Ciudad($ciudad) { $c = (Get-Culture).TextInfo.ToTitleCase($ciudad.ToLower()); $c = $c -replace '\bDe\b', 'de' -replace '\bDel\b', 'del' -replace '\bLa\b', 'la' -replace '\bLas\b', 'las' -replace '\bEl\b', 'el' -replace '\bLos\b', 'los' -replace '\bY\b', 'y'; return $c.Substring(0,1).ToUpper() + $c.Substring(1) }

function Get-TituloCorto($e) { $ciudadFmt = TitleCase-Ciudad $e.ciudad; $enMismoMuni = $json.estaciones | Where-Object { $_.ciudad -eq $e.ciudad }; $tieneConflicto = @($enMismoMuni).Count -gt 1; $tSufijo = "cita, tel$EE" + "fono y precio 2026"; if (-not $tieneConflicto) { return "ITV $ciudadFmt`: $tSufijo" }; $nombre = $e.nombre -replace '(?i)^ITV\s+', ''; $nombre = $nombre -replace "(?i)$([regex]::Escape($e.ciudad))\s*", ''; $nombre = $nombre -replace '(?i)\s*(ITV|SL|SA|S\.L|S\.A)\s*$', ''; $nombre = $nombre -replace [char]0x00AE, ''; $nombre = $nombre.Trim(); if ($nombre.Length -lt 2) { $nombre = $e.operador }; return "ITV $ciudadFmt ($nombre): $tSufijo" }

function Get-MetaDesc($e) { $ciudadFmt = TitleCase-Ciudad $e.ciudad; return "ITV en $ciudadFmt con $($e.operador). Cita previa online, tel$EE" + "fono directo $($e.tel), horario, direcci$OO" + "n y precio 2026." }

function Get-Intro($e) { $ciudadFmt = TitleCase-Ciudad $e.ciudad; $totalMuni = @($json.estaciones | Where-Object { $_.ciudad -eq $e.ciudad }).Count; $totalCcaa = @($json.estaciones | Where-Object { $_.ccaa -eq $e.ccaa }).Count; $op = $e.operador; $dir = $e.direccion; if ($dir.Length -gt 60) { $dir = $dir.Substring(0,57) + '...' }; $eS = "$($e.nombre) est$AA operada por $op"; $e2 = "Se encuentra en $dir"; if ($totalMuni -gt 1) { return "$eS. $e2. Es una de las $totalMuni estaciones autorizadas en $ciudadFmt y forma parte de las $totalCcaa ITVs de $($e.ccaa). Cuenta con servicio de inspecci$OO" + "n t$EE" + "cnica para turismos, motocicletas y veh$II" + "culos industriales." } else { return "$eS. $e2. Es la estaci$OO" + "n de referencia para los conductores de $ciudadFmt y forma parte de las $totalCcaa ITVs autorizadas en $($e.ccaa). Ofrece inspecci$OO" + "n t$EE" + "cnica para turismos, motocicletas y veh$II" + "culos industriales." } }

function Get-HorarioTxt($horario) { switch ($horario) { 'extendido' { return 'L-V 7:00-21:00 &middot; S 8:00-14:00' } 'amplio' { return 'L-V 7:45-20:15 &middot; S 8:00-13:00' } 'continuo' { return 'L-V 7:30-21:30 &middot; S 9:00-14:00' } 'madrugador' { return 'L-V 6:00-21:00' } 'finde' { return 'L-V 8:00-20:00 &middot; S 8:30-19:00 &middot; D 8:30-14:30' } default { return 'L-V 8:00-20:00 &middot; S 9:00-14:00' } } }

function Get-PreciosCcaa($ccaa) { 
    $precios = @{ 
        'Madrid' = @('35','55','20','30','60','90'); 'Andalucía' = @('35','50','20','30','60','85'); 'Andalucia' = @('35','50','20','30','60','85'); 
        'Cataluña' = @('40','60','22','32','65','95'); 'Cataluna' = @('40','60','22','32','65','95'); 
        'Comunidad Valenciana' = @('40','55','22','32','65','90'); 'Galicia' = @('38','52','22','32','60','85'); 
        'País Vasco' = @('40','58','25','35','65','95'); 'Pais Vasco' = @('40','58','25','35','65','95'); 
        'Asturias' = @('38','55','22','32','60','85'); 'Canarias' = @('35','50','20','30','60','85'); 
        'Baleares' = @('40','60','25','35','65','95'); 'Aragón' = @('38','55','22','32','60','90'); 'Aragon' = @('38','55','22','32','60','90'); 
        'Murcia' = @('35','50','20','30','55','80'); 'Castilla y León' = @('35','48','20','30','55','80'); 'Castilla y Leon' = @('35','48','20','30','55','80'); 
        'Castilla-La Mancha' = @('35','48','20','30','55','80'); 'Extremadura' = @('35','48','20','30','55','80'); 
        'Navarra' = @('38','55','22','32','60','85'); 'La Rioja' = @('38','55','22','32','60','85'); 'Cantabria' = @('38','55','22','32','60','85'); 
        'Ceuta' = @('35','50','20','30','55','80'); 'Melilla' = @('35','50','20','30','55','80') 
    }; 
    if ($precios.ContainsKey($ccaa)) { return $precios[$ccaa] }; return @('35','55','20','30','60','90') 
}

function Get-UrlCita($operador) { switch -Regex ($operador) { 'Applus' { return 'https://www.applusiteuve.com/' } 'SGS' { return 'https://www.sgs.es/es-es/servicios/itv' } 'TUV|TÜV' { return 'https://www.tuvsud.com/es-es' } 'Itevelesa' { return 'https://www.itevelesa.com/' } 'VEIASA' { return 'https://www.veiasa.es/' } 'SITVAL' { return 'https://www.sitval.gva.es/' } 'ITVASA' { return 'https://www.itvasa.es/' } 'Dekra' { return 'https://www.dekra.es/' } 'OCA' { return 'https://www.ocaiteuve.com/' } 'Atisae' { return 'https://www.tuvsud.com/es-es' } default { return 'https://www.google.com/search?q=' + [uri]::EscapeDataString($operador + ' ITV cita previa') } } }

function Get-5Cercanas($e, $todas) { $distancias = foreach ($otra in $todas) { if ($otra.slug -eq $e.slug) { continue }; $d = Get-Distancia $e.lat $e.lng $otra.lat $otra.lng; [PSCustomObject]@{ slug = $otra.slug; nombre = $otra.nombre; ciudad = $otra.ciudad; dist = [Math]::Round($d / 1000, 1) } }; return $distancias | Sort-Object dist | Select-Object -First 5 }

function Get-FaqHtml($e, $ciudadFmt) { $qA = [char]0x00BF; $intro1 = "$qA" + "Se puede pasar la ITV en $ciudadFmt sin cita previa?"; $intro2 = "$qA" + "Cu$AA" + "nto cuesta la ITV aqu$II?"; $intro3 = "$qA" + "Cu$AA" + "ndo me toca pasar la ITV?"; $intro4 = "$qA" + "Qu$EE pasa si suspendo la ITV aqu$II?"; $r = ""; $r += "<h3>$intro1</h3>`n"; $r += "<p>S$II, pero es recomendable pedir cita. La espera sin cita puede superar los 60 minutos en hora punta.</p>`n"; $r += "<h3>$intro2</h3>`n"; $r += "<p>En $($e.ccaa) el precio orientativo es: Turismo 35-55 $EUR, Moto 20-30 $EUR, Industrial 60-90 $EUR. Consulta el <a href=""../calculadora-precio-itv"">precio exacto en nuestra calculadora</a>.</p>`n"; $r += "<h3>$intro3</h3>`n"; $r += "<p>Depende del tipo de veh$II" + "culo y su antig$UU" + "edad. Usa nuestra <a href=""../cuando-me-toca-itv"">calculadora de periodicidad</a>.</p>`n"; $r += "<h3>$intro4</h3>`n"; $r += "<p>Puedes volver a la misma estaci$OO" + "n o ir a cualquier otra autorizada de Espa$NN" + "a. La segunda inspecci$OO" + "n tiene descuento si es en la misma estaci$OO" + "n dentro de los 15 d$II" + "as.</p>"; return $r }

function Get-FaqJson($e, $ciudadFmt) { $qA = [char]0x00BF; $q1 = "$qA" + "Se puede pasar la ITV en $ciudadFmt sin cita previa?"; $q2 = "$qA" + "Cu$AA" + "nto cuesta la ITV aqu$II?"; $q3 = "$qA" + "Cu$AA" + "ndo me toca pasar la ITV?"; $q4 = "$qA" + "Qu$EE pasa si suspendo la ITV aqu$II?"; $a1 = "S$II, pero es recomendable pedir cita. La espera sin cita puede superar los 60 minutos en hora punta."; $a2 = "En $($e.ccaa) el precio orientativo es: Turismo 35-55 euros, Moto 20-30 euros, Industrial 60-90 euros."; $a3 = "Depende del tipo de veh$II" + "culo y su antig$UU" + "edad. Usa nuestra calculadora de periodicidad."; $a4 = "Puedes volver a la misma estaci$OO" + "n o ir a cualquier otra autorizada de Espa$NN" + "a. La segunda inspecci$OO" + "n tiene descuento si es en la misma estaci$OO" + "n dentro de los 15 d$II" + "as."; $json = [PSCustomObject]@{ '@context' = 'https://schema.org'; '@type' = 'FAQPage'; mainEntity = @( @{ '@type'='Question'; name=$q1; acceptedAnswer=@{ '@type'='Answer'; text=$a1 } }; @{ '@type'='Question'; name=$q2; acceptedAnswer=@{ '@type'='Answer'; text=$a2 } }; @{ '@type'='Question'; name=$q3; acceptedAnswer=@{ '@type'='Answer'; text=$a3 } }; @{ '@type'='Question'; name=$q4; acceptedAnswer=@{ '@type'='Answer'; text=$a4 } } ) }; return ($json | ConvertTo-Json -Depth 10 -Compress) }

# --- Procesar cada estacion ---
$generadas = 0
$errores = @()

foreach ($e in $nuevas) {
    try {
        $slug = $e.slug
        $titulo = Get-TituloCorto $e
        $metaDesc = Get-MetaDesc $e
        $intro = Get-Intro $e
        $ciudadFmt = TitleCase-Ciudad $e.ciudad
        $horarioTxt = Get-HorarioTxt $e.horario
        $precios = Get-PreciosCcaa $e.ccaa
        $urlCita = Get-UrlCita $e.operador
        $telLink = ($e.tel -replace '[^0-9]', '')
        if ($telLink -notmatch '^34') { $telLink = '34' + $telLink }
        $nombreUrl = [uri]::EscapeDataString($e.nombre)
        $cercanas = Get-5Cercanas $e $json.estaciones
        $cercanasHtml = ''
        foreach ($c in $cercanas) { $cercanasHtml += "<a href=""$($c.slug).html"">$($c.nombre) &middot; $($c.dist) km</a>`n" }
        $faqHtml = Get-FaqHtml $e $ciudadFmt
        $faqJson = Get-FaqJson $e $ciudadFmt

        $jsonLdAuto = [PSCustomObject]@{ '@context' = 'https://schema.org'; '@type' = 'AutomotiveBusiness'; name = $e.nombre; address = @{ '@type' = 'PostalAddress'; streetAddress = $e.direccion; postalCode = $e.cp; addressLocality = $ciudadFmt; addressRegion = $e.ccaa; addressCountry = 'ES' }; geo = @{ '@type' = 'GeoCoordinates'; latitude = $e.lat; longitude = $e.lng }; url = "https://itvcheck.es/estaciones/$slug"; telephone = $e.tel; priceRange = "$EUR$EUR"; areaServed = @{ '@type' = 'AdministrativeArea'; name = $e.ccaa } }
        $jsonLdAutoStr = ($jsonLdAuto | ConvertTo-Json -Depth 10 -Compress)

        $jsonLdBreadcrumb = [PSCustomObject]@{ '@context' = 'https://schema.org'; '@type' = 'BreadcrumbList'; itemListElement = @( @{ '@type'='ListItem'; position=1; name='Inicio'; item='https://itvcheck.es/' }; @{ '@type'='ListItem'; position=2; name='Mapa de Estaciones ITV'; item='https://itvcheck.es/estaciones-itv' }; @{ '@type'='ListItem'; position=3; name=$e.nombre; item="https://itvcheck.es/estaciones/$slug" } ) }
        $jsonLdBreadcrumbStr = ($jsonLdBreadcrumb | ConvertTo-Json -Depth 10 -Compress)

        $html = $plantilla
        $html = $html.Replace('{{TITULO}}', $titulo); $html = $html.Replace('{{META_DESC}}', $metaDesc); $html = $html.Replace('{{SLUG}}', $slug); $html = $html.Replace('{{NOMBRE}}', $e.nombre); $html = $html.Replace('{{NOMBRE_URL}}', $nombreUrl); $html = $html.Replace('{{CIUDAD}}', $ciudadFmt); $html = $html.Replace('{{CCAA}}', $e.ccaa); $html = $html.Replace('{{OPERADOR}}', $e.operador); $html = $html.Replace('{{DIRECCION}}', $e.direccion); $html = $html.Replace('{{TELEFONO}}', $e.tel); $html = $html.Replace('{{TELEFONO_LINK}}', $telLink); $html = $html.Replace('{{HORARIO_TXT}}', $horarioTxt); $html = $html.Replace('{{LAT}}', $e.lat); $html = $html.Replace('{{LNG}}', $e.lng); $html = $html.Replace('{{URL_CITA}}', $urlCita); $html = $html.Replace('{{PRECIO_TURISMO}}', "$($precios[0])-$($precios[1])"); $html = $html.Replace('{{PRECIO_MOTO}}', "$($precios[2])-$($precios[3])"); $html = $html.Replace('{{PRECIO_INDUSTRIAL}}', "$($precios[4])-$($precios[5])"); $html = $html.Replace('{{INTRO}}', $intro); $html = $html.Replace('{{CERCANAS}}', $cercanasHtml.TrimEnd()); $html = $html.Replace('{{FAQ_HTML}}', $faqHtml.TrimEnd()); $html = $html.Replace('{{JSON_LD_AUTO}}', $jsonLdAutoStr); $html = $html.Replace('{{JSON_LD_BREADCRUMB}}', $jsonLdBreadcrumbStr); $html = $html.Replace('{{JSON_LD_FAQ}}', $faqJson)

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
Write-Host "  RESUMEN GENERACION: $CCAA" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Total candidatas: $($nuevas.Count)" -ForegroundColor Cyan
Write-Host "  Generadas:        $generadas" -ForegroundColor Green
if ($errores.Count -gt 0) { Write-Host "  Errores:          $($errores.Count)" -ForegroundColor Red }
Write-Host "==========================================" -ForegroundColor Yellow