$f = "C:\Users\Usuario\Desktop\ITVcheck\guia-completa-itv.html"

if (-not (Test-Path $f)) {
    Write-Host "ERROR: no existe $f" -ForegroundColor Red
    return
}

Copy-Item $f "$f.bak-v2" -Force

$c = [System.IO.File]::ReadAllText($f, [System.Text.UTF8Encoding]::new($false))

# 1. Quitar link a styles.css
$c = $c.Replace('<link rel="stylesheet" href="/styles.css">', '')

# 2. Quitar fuentes viejas (Outfit+Inter)
$c = $c.Replace('<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@500;700;900&family=Inter:wght@400;600&display=swap" rel="stylesheet">', '')

# 3. Añadir fuentes nuevas + styles-editorial ANTES de styles-v2
$cssNuevas = @'
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Archivo:wght@500;600;700;800;900&family=IBM+Plex+Sans:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500;600&display=swap" rel="stylesheet">
'@

# Insertar antes del </head>
$c = $c.Replace('</head>', "$cssNuevas`n<link rel=""stylesheet"" href=""/styles-v2.css"">`n<link rel=""stylesheet"" href=""/styles-editorial.css"">`n</head>")

# 4. Sustituir header + cookie + whatsapp por bloque v2
$headerV2 = @'
<div id="cookieBanner">
  <p>Utilizamos cookies para mejorar tu experiencia y mostrar anuncios de Google AdSense. <a href="politica-cookies">M&aacute;s informaci&oacute;n</a></p>
  <button onclick="aceptarCookies()">Aceptar</button>
  <button class="reject" onclick="rechazarCookies()">Rechazar</button>
  <button class="config" onclick="window.location.href='politica-cookies'">Configurar</button>
</div>

<a href="https://api.whatsapp.com/send?text=Estoy%20leyendo%20la%20gu%C3%ADa%20completa%20de%20la%20ITV%20en%20ITVcheck" target="_blank" id="whatsappBtn" aria-label="Contactar por WhatsApp">&#128172;</a>

<div class="itv-topbar">
  <div class="itv-topbar-inner">
    <span><span class="dot"></span>ITVCHECK &middot; EDICI&Oacute;N 2026</span>
    <span>GU&Iacute;A DE REFERENCIA &middot; 17 CCAA</span>
  </div>
</div>

<header class="itv-header">
  <div class="itv-header-inner">
    <a href="/index" class="itv-logo">
      <span class="itv-logo-mark">ITV</span>
      ITVcheck
    </a>
    <nav class="itv-nav">
      <a href="/guias">Gu&iacute;as</a>
      <a href="/estaciones-itv">Estaciones</a>
      <a href="/operadores-itv-espana">Operadores</a>
      <a href="/calculadora-precio-itv">Precios</a>
      <a href="/checklist-itv">Checklist</a>
    </nav>
  </div>
</header>
'@

$c = [regex]::Replace($c, '(?s)<div id="cookieBanner">.*?</header>', $headerV2, 1)

# 5. Sustituir breadcrumbs + h1 + meta-date por hero editorial
$heroV2 = @'
<div class="mag-issue-bar">
  <span>ITVcheck &middot; Manual de inspecci&oacute;n t&eacute;cnica</span>
  <span>GU&Iacute;A 01 &middot; <strong>Edici&oacute;n 2026</strong></span>
</div>

<section class="mag-hero">
  <div class="mag-hero-text">
    <span class="kicker">Actualizado Septiembre 2026 &middot; 18 min de lectura</span>
    <h1>Gu&iacute;a completa<br><em>de la ITV 2026.</em></h1>
    <p class="lead">Periodicidad seg&uacute;n tu veh&iacute;culo, precios por comunidad, documentaci&oacute;n obligatoria, proceso de inspecci&oacute;n, novedades normativas y sanciones. Todo lo que necesitas saber sobre la ITV en Espa&ntilde;a.</p>
    <div class="mag-hero-ctas">
      <a href="#periodicidad" class="btn-hero">Ver periodicidad &rarr;</a>
      <a href="cuando-me-toca-itv" class="btn-hero-secondary">Calcular mi fecha &rarr;</a>
    </div>
  </div>
  <aside class="mag-hero-aside">
    <span class="label">Cobertura de la gu&iacute;a</span>
    <div class="stat-row">
      <span class="n">17</span>
      <span class="l">Comunidades<br>+ Ceuta y Melilla</span>
    </div>
    <div class="stat-row">
      <span class="n">10</span>
      <span class="l">Tipos de veh&iacute;culo<br>cubiertos</span>
    </div>
    <div class="stat-row">
      <span class="n">6</span>
      <span class="l">Novedades<br>normativas 2026</span>
    </div>
  </aside>
</section>

<div class="mag-data-bar">
  <div>
    <span class="n">17<small>&euro;</small></span>
    <span class="l">La ITV m&aacute;s barata<br>de Espa&ntilde;a (Baleares)</span>
  </div>
  <div>
    <span class="n">52<small>&euro;</small></span>
    <span class="l">La m&aacute;s cara<br>(Pa&iacute;s Vasco)</span>
  </div>
  <div>
    <span class="n">25<small>&euro;</small></span>
    <span class="l">Diferencia entre<br>comunidades</span>
  </div>
  <div>
    <span class="n">200<small>&euro;</small></span>
    <span class="l">Multa por circular<br>con ITV caducada</span>
  </div>
</div>
'@

$c = [regex]::Replace($c, '(?s)<div class="breadcrumbs">.*?<div class="meta-date">.*?</div>\s*</div>', $heroV2, 1)

# 6. Sustituir el índice de contenidos por índice editorial
$indiceV2 = @'
<h2>&Iacute;ndice de contenidos</h2>
<ul class="mag-toc">
<li><a href="#que-es">Qu&eacute; es la ITV y por qu&eacute; es obligatoria</a></li>
<li><a href="#periodicidad">Cada cu&aacute;nto tiempo debo pasar la ITV</a></li>
<li><a href="#precios">Cu&aacute;nto cuesta la ITV en cada comunidad</a></li>
<li><a href="#documentacion">Documentaci&oacute;n necesaria para la ITV</a></li>
<li><a href="#proceso">El proceso de inspecci&oacute;n paso a paso</a></li>
<li><a href="#novedades">Novedades de la ITV en 2026</a></li>
<li><a href="#vehiculos-especiales">ITV para veh&iacute;culos especiales</a></li>
<li><a href="#preparacion">C&oacute;mo preparar tu coche antes de ir</a></li>
<li><a href="#sanciones">Sanciones por no pasar la ITV</a></li>
<li><a href="#faq">Preguntas frecuentes</a></li>
</ul>
'@

$c = [regex]::Replace($c, '(?s)<div class="indice">\s*<h3>.*?</h3>\s*<ol>.*?</ol>\s*</div>', $indiceV2, 1)

# 7. Sustituir footer
$footerV2 = @'
<footer class="itv-footer">
  <div class="itv-footer-inner">
    <div class="itv-footer-top">
      <div class="itv-footer-brand">
        <a href="/index" class="itv-logo">
          <span class="itv-logo-mark">ITV</span>
          ITVcheck
        </a>
        <p>Manual de inspecci&oacute;n t&eacute;cnica independiente sobre la ITV en Espa&ntilde;a. Gu&iacute;as t&eacute;cnicas, mapa de estaciones y datos verificados.</p>
      </div>
      <div class="itv-footer-col">
        <h4>Herramientas</h4>
        <a href="/cuando-me-toca-itv">Calculadora de fecha</a>
        <a href="/calculadora-precio-itv">Comparador de precios</a>
        <a href="/estaciones-itv">Buscador de estaciones</a>
        <a href="/checklist-itv">Checklist pre-ITV</a>
      </div>
      <div class="itv-footer-col">
        <h4>Gu&iacute;as</h4>
        <a href="/guia-completa-itv">Gu&iacute;a completa ITV</a>
        <a href="/guias">Todas las gu&iacute;as</a>
        <a href="/mecanica">Mec&aacute;nica DIY</a>
        <a href="/guia-luces">Luces</a>
        <a href="/guia-neumaticos">Neum&aacute;ticos</a>
        <a href="/seguros-coche">Seguros</a>
      </div>
      <div class="itv-footer-col">
        <h4>Novedades 2026</h4>
        <a href="/baliza-v16-obligatoria">Baliza V-16 obligatoria</a>
        <a href="/itv-camper-furgonetas">ITV para campers</a>
        <a href="/preparar-coche-viaje-largo">Viaje largo</a>
        <a href="/mantenimiento-coches-electricos">Mantenimiento el&eacute;ctricos</a>
      </div>
      <div class="itv-footer-col">
        <h4>Por CCAA</h4>
        <a href="/itv-por-comunidad">Todas las comunidades</a>
        <a href="/itv-madrid">ITV Madrid</a>
        <a href="/itv-cataluna">ITV Catalu&ntilde;a</a>
        <a href="/itv-andalucia">ITV Andaluc&iacute;a</a>
        <a href="/itv-valencia">ITV Valencia</a>
      </div>
      <div class="itv-footer-col">
        <h4>Legal</h4>
        <a href="/sobre-nosotros">Sobre nosotros</a>
        <a href="/contacto">Contacto</a>
        <a href="/aviso-legal">Aviso legal</a>
        <a href="/politica-cookies">Pol&iacute;tica de Cookies</a>
        <a href="/politica-privacidad">Pol&iacute;tica de Privacidad</a>
        <a href="/politica-afiliados">Afiliados</a>
      </div>
    </div>
    <div class="itv-footer-bottom">
      <span>&copy; 2026 ITVCHECK.ES</span>
      <span>MANUAL DE INSPECCI&Oacute;N &middot; GU&Iacute;A 01 &middot; EDICI&Oacute;N 2026</span>
    </div>
  </div>
</footer>
'@

$c = [regex]::Replace($c, '(?s)<footer>.*?</footer>', $footerV2, 1)

# 8. Guardar
[System.IO.File]::WriteAllText($f, $c, [System.Text.UTF8Encoding]::new($false))

# Verificación
Write-Host ""
Write-Host "=== RESULTADO ===" -ForegroundColor Green
Write-Host "Sin styles.css:          $(-not $c.Contains('href=""/styles.css""'))"
Write-Host "Con styles-v2.css:       $($c.Contains('styles-v2.css'))"
Write-Host "Con styles-editorial:    $($c.Contains('styles-editorial.css'))"
Write-Host "Con fuentes nuevas:      $($c.Contains('Archivo:wght@'))"
Write-Host "Con hero editorial:      $($c.Contains('mag-hero-text'))"
Write-Host "Con data-bar:            $($c.Contains('mag-data-bar'))"
Write-Host "Con indice editorial:    $($c.Contains('mag-toc'))"
Write-Host "Con footer v2:           $($c.Contains('itv-footer-top'))"
Write-Host "Mantiene periodicidad:   $($c.Contains('Tabla de periodicidad'))"
Write-Host "Mantiene precios CCAA:   $($c.Contains('Precios de la ITV por comunidad'))"
Write-Host "Mantiene FAQs:           $($c.Contains('Puedo pasar la ITV en otra comunidad'))"
Write-Host "Tamaño:                  $((Get-Item $f).Length) bytes"