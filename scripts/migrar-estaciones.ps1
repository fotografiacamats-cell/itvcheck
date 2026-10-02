param(
    [int]$Sample = 0,
    [switch]$Apply,
    [switch]$Verbose
)

$base = "C:\Users\Usuario\Desktop\ITVcheck"
$estDir = Join-Path $base "estaciones"
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$bakDir = Join-Path $base "temp\backups\$timestamp"
New-Item -ItemType Directory -Path $bakDir -Force | Out-Null

# Plantilla v2 (basada en alcorcon.html migrado)
function Build-V2Estacion {
    param($d)

    $slug = $d.Slug
    $name = $d.Name
    $loc  = $d.Localidad
    $ccaa = $d.CCAA
    $op   = $d.Operador
    $hor  = $d.Horario
    $dir  = $d.Direccion
    $lat  = $d.Lat
    $lng  = $d.Lng
    $tel  = $d.Telefono
    $tUrl = $d.UrlCita
    $pTur = $d.PrecioTurismo
    $pMot = $d.PrecioMoto
    $pInd = $d.PrecioIndustrial
    $cercanas = $d.Cercanas

    # Boton llamar
    $telHref = if ($tel) { "tel:$tel" } else { "tel:" }
    $telMostrar = if ($tel) { $tel -replace '(\d{3})(\d{3})(\d{3})', '$1 $2 $3' } else { "" }

    # Estaciones cercanas HTML
    $cercanasHtml = ""
    foreach ($c in $cercanas) {
        $nombre = $c.Nombre
        $slugRel = $c.Slug -replace '\.html$',''
        $dist = $c.Distancia
        $cercanasHtml += "    <a href=`"$slugRel.html`">$nombre &middot; $dist</a>`n"
    }

    $html = @"
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="$name - Direcci&oacute;n, tel&eacute;fono, horario, precio y c&oacute;mo llegar. Estaci&oacute;n de ITV en $loc ($ccaa), operada por $op.">
<title>$name - Tel&eacute;fono, Horario, Precio y C&oacute;mo Llegar | ITVcheck</title>
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'%3E%3Crect width='100' height='100' fill='%2314171C'/%3E%3Ctext x='50' y='72' font-family='Archivo,sans-serif' font-size='52' font-weight='900' fill='%23FFB800' text-anchor='middle'%3EITV%3C/text%3E%3C/svg%3E">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Archivo:wght@500;600;700;800;900&family=IBM+Plex+Sans:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../styles-v2.css">
<link rel="canonical" href="https://itvcheck.es/estaciones/$slug">
<script type="application/ld+json">
{"@context":"https://schema.org","@type":"AutomotiveBusiness","name":"$name","address":{"@type":"PostalAddress","streetAddress":"$dir","postalCode":"","addressLocality":"$loc","addressRegion":"$ccaa","addressCountry":"ES"},"geo":{"@type":"GeoCoordinates","latitude":$lat,"longitude":$lng},"url":"https://itvcheck.es/estaciones/$slug","openingHoursSpecification":[{"@type":"OpeningHoursSpecification","dayOfWeek":["Monday","Tuesday","Wednesday","Thursday","Friday"],"opens":"08:00","closes":"20:00"},{"@type":"OpeningHoursSpecification","dayOfWeek":"Saturday","opens":"09:00","closes":"14:00"}],"priceRange":"&euro;&euro;","areaServed":{"@type":"AdministrativeArea","name":"$ccaa"}}
</script>
<script type="application/ld+json">
{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mapa de Estaciones ITV","item":"https://itvcheck.es/estaciones-itv"},{"@type":"ListItem","position":3,"name":"$name","item":"https://itvcheck.es/estaciones/$slug"}]}
</script>
</head>
<body>

<div class="itv-topbar"><div class="itv-topbar-inner"><span><span class="dot"></span>ITVCHECK &middot; EDICI&Oacute;N 2026</span><span>192 ESTACIONES MAPEADAS</span></div></div>

<header class="itv-header">
  <div class="itv-header-inner">
    <a href="../index" class="itv-logo">
      <span class="itv-logo-mark">ITV</span>
      ITVcheck
    </a>
    <nav class="itv-nav">
      <a href="../guias">Gu&iacute;as</a>
      <a href="../estaciones-itv">Estaciones</a>
      <a href="../operadores-itv-espana">Operadores</a>
      <a href="../calculadora-precio-itv">Precios</a>
      <a href="../checklist-itv">Checklist</a>
    </nav>
  </div>
</header>

<div class="container">
  <div class="breadcrumbs">
    <a href="../index">Inicio</a> &raquo; <a href="../estaciones-itv">Mapa</a> &raquo; <span>$name</span>
  </div>

  <div class="est-hero">
    <h1>$name</h1>
    <div class="sub">$loc &middot; $ccaa &middot; Operada por <strong>$op</strong></div>
  </div>

  <div class="est-datos">
    <div class="fila"><span class="label">Tel&eacute;fono</span><span class="valor">$telMostrar</span></div>
    <div class="fila"><span class="label">Horario</span><span class="valor">$hor</span></div>
    <div class="fila"><span class="label">Direcci&oacute;n</span><span class="valor">$dir</span></div>
    <div class="fila"><span class="label">Operador</span><span class="valor">$op</span></div>
  </div>

  <div class="est-botones">
    <a href="$telHref" class="btn-llamar">Llamar</a>
    <a href="https://www.google.com/maps/dir/?api=1&destination=$lat,$lng" target="_blank" rel="nofollow noopener" class="btn-ruta">C&oacute;mo llegar</a>
    <a href="$tUrl" target="_blank" rel="nofollow noopener" class="btn-cita">Pedir cita previa online</a>
    <a href="https://api.whatsapp.com/send?text=$name%20itvcheck.es" target="_blank" rel="nofollow noopener" class="btn-wsp">Compartir por WhatsApp</a>
  </div>

  <div class="est-alerta">
    <strong>Aviso:</strong> el horario es orientativo seg&uacute;n el operador. Confirma por tel&eacute;fono antes de desplazarte.
  </div>

  <div class="est-precio">
    <strong>Precio orientativo de la ITV en $ccaa</strong>
    Turismo: $pTur &euro; &middot; Moto: $pMot &euro; &middot; Industrial: $pInd &euro;
    <div style="margin-top:10px;font-size:13px;">Consulta el <a href="../calculadora-precio-itv">precio exacto por comunidad</a> con las tarifas actualizadas.</div>
  </div>

  <h2>Ubicaci&oacute;n</h2>
  <div class="est-mapa">
    <iframe src="https://www.google.com/maps?q=$lat,$lng&hl=es&z=16&output=embed" loading="lazy" referrerpolicy="no-referrer-when-downgrade" allowfullscreen></iframe>
  </div>

  <div class="est-info-block">
    <h2>Documentaci&oacute;n necesaria</h2>
    <ul>
      <li>Permiso de circulaci&oacute;n (original)</li>
      <li>Tarjeta de inspecci&oacute;n t&eacute;cnica (ficha t&eacute;cnica)</li>
      <li>Justificante del seguro en vigor</li>
      <li>DNI o NIE del titular o persona autorizada</li>
      <li>Justificante del IVTM (si la estaci&oacute;n lo requiere)</li>
    </ul>
  </div>

  <div class="est-info-block">
    <h2>Qu&eacute; revisar antes de ir</h2>
    <ul>
      <li><strong>Luces:</strong> posici&oacute;n, cruce, carretera, intermitentes, freno, matr&iacute;cula</li>
      <li><strong>Neum&aacute;ticos:</strong> profundidad m&iacute;nima 1,6 mm, sin cortes</li>
      <li><strong>Frenos:</strong> frenado uniforme y freno de mano que retiene</li>
      <li><strong>Direcci&oacute;n:</strong> sin holguras ni ruidos an&oacute;malos</li>
      <li><strong>Emisiones:</strong> sin testigo de motor encendido</li>
      <li><strong>Limpiaparabrisas:</strong> escobillas en buen estado</li>
    </ul>
    <p style="margin-top:16px;"><a href="../checklist-itv">Ver checklist completo pre-ITV &rarr;</a></p>
  </div>

  <div class="est-cercanas">
    <h3>Estaciones cercanas</h3>
$cercanasHtml  </div>

  <div class="est-info-block">
    <h2>Preguntas frecuentes</h2>
    <h3>&iquest;Se puede pasar la ITV en $loc sin cita previa?</h3>
    <p>S&iacute;, pero es recomendable pedir cita. La espera sin cita puede superar los 60 minutos en hora punta.</p>
    <h3>&iquest;Cu&aacute;nto cuesta la ITV aqu&iacute;?</h3>
    <p>En $ccaa el precio orientativo es: Turismo $pTur &euro;, Moto $pMot &euro;, Industrial $pInd &euro;. Consulta el <a href="../calculadora-precio-itv">precio exacto en nuestra calculadora</a>.</p>
    <h3>&iquest;Cu&aacute;ndo me toca pasar la ITV?</h3>
    <p>Depende del tipo de veh&iacute;culo y su antig&uuml;edad. Usa nuestra <a href="../cuando-me-toca-itv">calculadora de periodicidad</a>.</p>
    <h3>&iquest;Qu&eacute; pasa si suspendo la ITV aqu&iacute;?</h3>
    <p>Puedes volver a la misma estaci&oacute;n o ir a cualquier otra autorizada de Espa&ntilde;a. La segunda inspecci&oacute;n tiene descuento si es en la misma estaci&oacute;n dentro de los 15 d&iacute;as.</p>
  </div>

  <div class="related-guides">
    <h3>Enlaces &uacute;tiles</h3>
    <a href="../estaciones-itv">Mapa completo de estaciones</a>
    <a href="../calculadora-precio-itv">Precios por comunidad</a>
    <a href="../cuando-me-toca-itv">Cu&aacute;ndo me toca la ITV</a>
    <a href="../checklist-itv">Checklist pre-ITV</a>
    <a href="../que-pasa-si-suspendo-la-itv">Qu&eacute; hacer si suspendes</a>
  </div>

  <p style="text-align:center;margin-top:40px;"><a href="../index" class="btn btn-secondary">&larr; Volver al inicio</a></p>
</div>

<footer class="itv-footer">
  <div class="itv-footer-inner">
    <div class="itv-footer-top">
      <div class="itv-footer-brand">
        <a href="../index" class="itv-logo">
          <span class="itv-logo-mark">ITV</span>
          ITVcheck
        </a>
        <p>Portal informativo independiente sobre la ITV en Espa&ntilde;a. Gu&iacute;as t&eacute;cnicas, mapa de estaciones y datos actualizados.</p>
      </div>
      <div class="itv-footer-col">
        <h4>Secciones</h4>
        <a href="../guias">Gu&iacute;as</a>
        <a href="../estaciones-itv">Estaciones</a>
        <a href="../operadores-itv-espana">Operadores</a>
        <a href="../calculadora-precio-itv">Precios</a>
      </div>
      <div class="itv-footer-col">
        <h4>Herramientas</h4>
        <a href="../cuando-me-toca-itv">Calculadora ITV</a>
        <a href="../checklist-itv">Checklist</a>
        <a href="../estaciones-itv">Mapa interactivo</a>
      </div>
      <div class="itv-footer-col">
        <h4>Legal</h4>
        <a href="../aviso-legal">Aviso legal</a>
        <a href="../politica-privacidad">Privacidad</a>
        <a href="../politica-cookies">Cookies</a>
        <a href="../politica-afiliados">Afiliados</a>
      </div>
    </div>
    <div class="itv-footer-bottom">
      <span>&copy; 2026 ITVCHECK.ES</span>
      <span>ESTACI&Oacute;N &middot; $ccaa &middot; EDICI&Oacute;N 2026</span>
    </div>
  </div>
</footer>

</body>
</html>
"@
    return $html
}

function Extract-Datos {
    param($content, $slug)

    $d = @{ Slug = $slug }

    # H1 Nombre
    if ($content -match '<h1>([^<]+)</h1>') { $d.Name = $matches[1] } else { return $null }

    # Sub: localidad · CCAA · Operada por X
    if ($content -match '<div class="sub">[^<]*?(.+?)\s*&middot;\s*(.+?)\s*&middot;\s*Operada por <strong>([^<]+)</strong>') {
        $d.Localidad = $matches[1].Trim()
        $d.CCAA = $matches[2].Trim()
        $d.Operador = $matches[3]
    } else { return $null }

    # Coordenadas
    if ($content -match '"latitude":(-?[\d.]+),"longitude":(-?[\d.]+)') {
        $d.Lat = $matches[1]; $d.Lng = $matches[2]
    } else { return $null }

    # Telefono (puede estar vacío)
    if ($content -match 'href="tel:(\d[\d\s]*)"') { $d.Telefono = ($matches[1] -replace '\s','') } else { $d.Telefono = "" }

    # Horario
    if ($content -match 'Horario:</span><span class="valor">([^<]+)</span>') { $d.Horario = $matches[1] }
    elseif ($content -match 'Horario</span><span class="valor">([^<]+)</span>') { $d.Horario = $matches[1] }
    else { return $null }

    # Direccion
    if ($content -match 'Direcci&oacute;n:</span><span class="valor">([^<]+)</span>') { $d.Direccion = $matches[1] }
    elseif ($content -match 'Direcci&oacute;n</span><span class="valor">([^<]+)</span>') { $d.Direccion = $matches[1] }
    else { return $null }

    # Precios
    if ($content -match 'Turismo:\s*([\d\-]+)\s*&euro;\s*&middot;\s*Moto:\s*([\d\-]+)\s*&euro;\s*&middot;\s*Industrial:\s*([\d\-]+)\s*&euro;') {
        $d.PrecioTurismo = $matches[1]
        $d.PrecioMoto = $matches[2]
        $d.PrecioIndustrial = $matches[3]
    } else { return $null }

    # URL cita
    $m = [regex]::Match($content, 'class="btn-cita"[^>]*?href="([^"]+)"')
    if (-not $m.Success) { $m = [regex]::Match($content, 'href="([^"]+)"[^>]*?class="btn-cita"') }
    if ($m.Success) { $d.UrlCita = $m.Groups[1].Value } else { $d.UrlCita = "" }

    # Estaciones cercanas
    $cercanas = @()
    $matchesC = [regex]::Matches($content, '<a href="(itv-[^"]+)">[^<]*?([^<]+?)\s*(?:<span[^>]*>)?\(([^)]+)\)')
    foreach ($mc in $matchesC) {
        $cercanas += @{
            Slug = $mc.Groups[1].Value
            Nombre = $mc.Groups[2].Value.Trim()
            Distancia = $mc.Groups[3].Value
        }
    }
    $d.Cercanas = $cercanas

    return $d
}

# ===== MAIN =====
$fichas = Get-ChildItem $estDir -Filter "*.html" | Where-Object {
    if ($_.Name -eq "itv-alcorcon.html") { return $false }
    $cc = Get-Content $_.FullName -Raw
    return ($cc -notmatch 'styles-v2\.css')
}

if ($Sample -gt 0) {
    $fichas = $fichas | Get-Random -Count $Sample
}

Write-Host "=== Migrador de Estaciones v1 -> v2 ===" -ForegroundColor Cyan
Write-Host "Fichas a procesar: $($fichas.Count)" -ForegroundColor Yellow
Write-Host "Modo: $(if ($Apply) {'APLICAR'} else {'DRY-RUN'})" -ForegroundColor Yellow
Write-Host ""

$ok = 0
$fail = 0
$fallos = @()

foreach ($f in $fichas) {
    $slug = $f.BaseName
    Write-Host "- $slug" -ForegroundColor White -NoNewline

    try {
        $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.UTF8Encoding]::new($false))
        $d = Extract-Datos $content $slug

        if ($null -eq $d) {
            Write-Host " SKIP (extracción fallida)" -ForegroundColor Red
            $fail++
            $fallos += $slug
            continue
        }

        $newHtml = Build-V2Estacion $d
        $kb = [math]::Round([System.Text.Encoding]::UTF8.GetByteCount($newHtml)/1KB, 1)

        if ($kb -lt 9 -or $kb -gt 30) {
            Write-Host " SKIP (tamaño raro: $kb KB)" -ForegroundColor Yellow
            $fail++
            $fallos += $slug
            continue
        }

        Write-Host " OK ($kb KB, $($d.Cercanas.Count) cercanas)" -ForegroundColor Green
        $ok++

        if ($Apply) {
            Copy-Item $f.FullName (Join-Path $bakDir "$slug.v1.bak.html") -Force
            [System.IO.File]::WriteAllText($f.FullName, $newHtml, [System.Text.UTF8Encoding]::new($false))
        }
    } catch {
        Write-Host " ERROR: $($_.Exception.Message)" -ForegroundColor Red
        $fail++
        $fallos += $slug
    }
}

Write-Host ""
Write-Host "=== RESUMEN ===" -ForegroundColor Cyan
Write-Host "OK:   $ok"
Write-Host "FAIL: $fail"

if ($fallos.Count -gt 0 -and $fallos.Count -le 20) {
    Write-Host "`nFichas con problemas:" -ForegroundColor Yellow
    $fallos | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
}

if ($Apply) {
    Write-Host "`nBackups en: $bakDir" -ForegroundColor Cyan
    Write-Host "Ficheros de backup: $((Get-ChildItem $bakDir).Count)" -ForegroundColor Cyan
} else {
    Write-Host "`nEsto ha sido DRY-RUN. No se ha modificado nada." -ForegroundColor Yellow
    Write-Host "Para aplicar: ejecuta el mismo script con -Apply" -ForegroundColor Yellow
}