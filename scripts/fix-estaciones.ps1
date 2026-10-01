$f = "C:\Users\Usuario\Desktop\ITVcheck\estaciones-itv.html"

if (-not (Test-Path $f)) {
    Write-Host "ERROR: no existe $f" -ForegroundColor Red
    return
}

Copy-Item $f "$f.bak-v2" -Force

$c = [System.IO.File]::ReadAllText($f, [System.Text.UTF8Encoding]::new($false))

# 1. Quitar styles.css
$c = $c.Replace('<link rel="stylesheet" href="/styles.css">', '')

# 2. Quitar fuentes viejas (Outfit + Inter)
$c = $c.Replace('<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@500;700;900&family=Inter:wght@400;600&display=swap" rel="stylesheet">', '')

# 3. Añadir fuentes nuevas + CSS v2 + editorial antes de </head>
$cssNuevas = @'
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Archivo:wght@500;600;700;800;900&family=IBM+Plex+Sans:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/styles-v2.css">
<link rel="stylesheet" href="/styles-editorial.css">
'@
$c = $c.Replace('</head>', "$cssNuevas`n</head>")

# 4. Sustituir cookie + whatsapp + toast + header
$headerV2 = @'
<div id="cookieBanner">
  <p>Utilizamos cookies para mejorar tu experiencia y mostrar anuncios de Google AdSense. <a href="politica-cookies">M&aacute;s informaci&oacute;n</a></p>
  <button onclick="aceptarCookies()">Aceptar</button>
  <button class="reject" onclick="rechazarCookies()">Rechazar</button>
  <button class="config" onclick="window.location.href='politica-cookies'">Configurar</button>
</div>

<a href="https://api.whatsapp.com/send?text=Estoy%20buscando%20una%20estaci%C3%B3n%20de%20ITV%20con%20ITVcheck" target="_blank" id="whatsappBtn" aria-label="Contactar por WhatsApp">&#128172;</a>

<div id="toast"></div>

<div class="itv-topbar">
  <div class="itv-topbar-inner">
    <span><span class="dot"></span>ITVCHECK &middot; EDICI&Oacute;N 2026</span>
    <span>MAPA INTERACTIVO &middot; 192 ESTACIONES</span>
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

# 5. Sustituir breadcrumbs + h1 + meta-date + p intro por hero editorial
$heroV2 = @'
<div class="mag-issue-bar">
  <span>ITVcheck &middot; Manual de inspecci&oacute;n t&eacute;cnica</span>
  <span>HERRAMIENTA 02 &middot; <strong>Edici&oacute;n 2026</strong></span>
</div>

<section class="mag-hero">
  <div class="mag-hero-text">
    <span class="kicker">Actualizado Octubre 2026 &middot; Mapa interactivo</span>
    <h1>Mapa de estaciones<br><em>de ITV en Espa&ntilde;a.</em></h1>
    <p class="lead">192 estaciones verificadas en las 17 comunidades aut&oacute;nomas. Filtra por ciudad, comunidad, operador o tipo de veh&iacute;culo. Consulta tel&eacute;fono directo, horario en tiempo real, c&oacute;mo llegar y pide cita previa en un clic.</p>
    <div class="mag-hero-ctas">
      <a href="#mapa" class="btn-hero">Explorar el mapa &rarr;</a>
      <a href="operadores-itv-espana" class="btn-hero-secondary">Ver operadores &rarr;</a>
    </div>
  </div>
  <aside class="mag-hero-aside">
    <span class="label">Cobertura del mapa</span>
    <div class="stat-row">
      <span class="n">192</span>
      <span class="l">Estaciones<br>verificadas</span>
    </div>
    <div class="stat-row">
      <span class="n">19</span>
      <span class="l">Comunidades<br>cubiertas</span>
    </div>
    <div class="stat-row">
      <span class="n">11</span>
      <span class="l">Operadores<br>documentados</span>
    </div>
  </aside>
</section>
'@

$c = [regex]::Replace($c, '(?s)<div class="breadcrumbs">.*?<p>Explora el <strong>mapa interactivo</strong>.*?</p>', $heroV2, 1)

# 6. Limpiar emojis de los H3 sueltos
$c = $c.Replace('<h3>🔍 Filtrar estaciones</h3>', '<h3>Filtrar estaciones</h3>')
$c = $c.Replace('<h3>📚 Guías relacionadas</h3>', '<h3>Gu&iacute;as relacionadas</h3>')
$c = $c.Replace('<h3>📍 ITV por comunidades</h3>', '<h3>ITV por comunidades</h3>')
$c = $c.Replace('<h2>&#128506;&#65039; Todas las estaciones de ITV en Espa&ntilde;a (192)</h2>', '<h2>Todas las estaciones de ITV en Espa&ntilde;a (192)</h2>')
$c = $c.Replace('<h3>📚 Enlazado interno recomendado</h3>', '<h3>Enlazado interno</h3>')

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
      <span>MANUAL DE INSPECCI&Oacute;N &middot; HERRAMIENTA 02 &middot; EDICI&Oacute;N 2026</span>
    </div>
  </div>
</footer>
'@

$c = [regex]::Replace($c, '(?s)<footer>.*?</footer>', $footerV2, 1)

# Guardar
[System.IO.File]::WriteAllText($f, $c, [System.Text.UTF8Encoding]::new($false))

# Verificación
Write-Host ""
Write-Host "=== RESULTADO ===" -ForegroundColor Green
Write-Host "Sin styles.css:          $(-not $c.Contains('href=""/styles.css""'))"
Write-Host "Con styles-v2.css:       $($c.Contains('styles-v2.css'))"
Write-Host "Con styles-editorial:    $($c.Contains('styles-editorial.css'))"
Write-Host "Con fuentes nuevas:      $($c.Contains('Archivo:wght@'))"
Write-Host "Con hero editorial:      $($c.Contains('mag-hero-text'))"
Write-Host "Con footer v2:           $($c.Contains('itv-footer-top'))"
Write-Host "Mantiene Leaflet:        $($c.Contains('leaflet.min.js'))"
Write-Host "Mantiene 192 estaciones: $($c.Contains('ITV Alcorcón'))"
Write-Host "Mantiene filtros:        $($c.Contains('id=""busqueda""'))"
Write-Host "Mantiene array JS:       $($c.Contains('var estaciones ='))"
Write-Host "Mantiene indice CCAA:    $($c.Contains('indice-estaciones-ccaa'))"
Write-Host "Tamaño:                  $((Get-Item $f).Length) bytes"