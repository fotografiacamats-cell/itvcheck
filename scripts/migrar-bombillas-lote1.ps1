$base = "C:\Users\Usuario\Desktop\ITVcheck\mecanica"
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$bk = Join-Path $base "..\temp\backups\$ts"
New-Item -ItemType Directory -Path $bk -Force | Out-Null

$template = @'
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="%%METADESC%%">
<title>%%TITLESEO%% | ITVcheck</title>
<link rel="canonical" href="https://itvcheck.es/mecanica/%%SLUG%%">
<link rel="icon" type="image/png" href="/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/svg+xml" href="/favicon.svg">
<link rel="shortcut icon" href="/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Archivo:wght@500;600;700;800;900&family=IBM+Plex+Sans:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/styles-v2.css">
<link rel="stylesheet" href="/styles-editorial.css">
<script>
function loadScripts(){var s=document.createElement('script');s.src='https://www.googletagmanager.com/gtag/js?id=G-T1PZZHFJ4E';s.async=true;document.head.appendChild(s);window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('consent','default',{'ad_storage':'denied','ad_user_data':'denied','ad_personalization':'denied','analytics_storage':'denied'});gtag('js',new Date());gtag('config','G-T1PZZHFJ4E');var a=document.createElement('script');a.src='https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-7947218272068445';a.async=true;a.crossOrigin='anonymous';document.head.appendChild(a);}
if(localStorage.getItem('cookiesAceptadas')==='true'){loadScripts();}
</script>
<script type="application/ld+json">
%%SCHEMA%%
</script>
</head>
<body>

<div id="cookieBanner">
  <p>Utilizamos cookies para mejorar tu experiencia y mostrar anuncios de Google AdSense. <a href="politica-cookies">M&aacute;s informaci&oacute;n</a></p>
  <button onclick="aceptarCookies()">Aceptar</button>
  <button class="reject" onclick="rechazarCookies()">Rechazar</button>
</div>

<div class="itv-topbar">
  <div class="itv-topbar-inner">
    <span><span class="dot"></span>ITVCHECK &middot; EDICI&Oacute;N 2026</span>
    <span>MEC&Aacute;NICA &middot; BOMBILLA &middot; %%MODELOUPPER%%</span>
  </div>
</div>

<header class="itv-header">
  <div class="itv-header-inner">
    <a href="/index" class="itv-logo">
      <span class="itv-logo-mark">ITV</span>
      ITVcheck
    </a>
    <button class="itv-nav-toggle" aria-label="Abrir men&uacute;" aria-expanded="false"><span></span><span></span><span></span></button>
    <nav class="itv-nav">
      <a href="/guias">Gu&iacute;as</a>
      <a href="/estaciones-itv">Estaciones</a>
      <a href="/operadores-itv-espana">Operadores</a>
      <a href="/calculadora-precio-itv">Precios</a>
      <a href="/checklist-itv">Checklist</a>
    </nav>
  </div>
</header>

<div class="mag-issue-bar">
  <span>ITVcheck &middot; Manual de inspecci&oacute;n t&eacute;cnica</span>
  <span>BOMBILLA &middot; <strong>%%MODELOUPPER%%</strong></span>
</div>

<section class="mag-hero hero-blog">
  <div class="mag-hero-text">
    <span class="kicker">Actualizado Septiembre 2026 &middot; %%TIEMPO%% min</span>
    <h1 class="h1-inline-md">C&oacute;mo cambiar la bombilla<br>del %%MODELO%%.</h1>
    <p class="lead">%%LEAD%%</p>
    <div class="mag-hero-ctas">
      <a href="#pasos" class="btn-hero">Ver pasos &rarr;</a>
      <a href="#precios" class="btn-hero-secondary">Precios &rarr;</a>
    </div>
  </div>
  <aside class="mag-hero-aside">
    <span class="label">Datos clave</span>
    <div class="stat-row">
      <span class="n">%%HERO1N%%<small>%%HERO1S%%</small></span>
      <span class="l">%%HERO1L%%</span>
    </div>
    <div class="stat-row">
      <span class="n">%%HERO2N%%<small>%%HERO2S%%</small></span>
      <span class="l">%%HERO2L%%</span>
    </div>
    <div class="stat-row">
      <span class="n">%%HERO3N%%<small>%%HERO3S%%</small></span>
      <span class="l">%%HERO3L%%</span>
    </div>
  </aside>
</section>

<div class="mag-data-bar">
  <div>
    <span class="n">%%KPI1N%%<small>%%KPI1S%%</small></span>
    <span class="l">%%KPI1L%%</span>
  </div>
  <div>
    <span class="n">%%KPI2N%%<small>%%KPI2S%%</small></span>
    <span class="l">%%KPI2L%%</span>
  </div>
  <div>
    <span class="n">%%KPI3N%%<small>%%KPI3S%%</small></span>
    <span class="l">%%KPI3L%%</span>
  </div>
  <div>
    <span class="n">%%KPI4N%%<small>%%KPI4S%%</small></span>
    <span class="l">%%KPI4L%%</span>
  </div>
</div>

<div class="container">

<p>%%INTRO%%</p>

<div class="mag-mec-affiliate-notice">
  Esta gu&iacute;a contiene enlaces de afiliado de Amazon. Si compras a trav&eacute;s de ellos, ganamos una peque&ntilde;a comisi&oacute;n sin coste adicional para ti. <a href="/politica-afiliados">M&aacute;s informaci&oacute;n</a>.
</div>

<h2>A qu&eacute; versiones aplica esta gu&iacute;a</h2>
%%VERSIONES%%

<h2>Qu&eacute; bombilla lleva el %%MODELO%%</h2>
%%TABLABOMBILLAS%%

%%AVISOS%%

<h2>Herramientas y repuestos necesarios</h2>
<div class="mag-mec-toolbox">
  <h3>Lo que necesitas</h3>
  %%HERRAMIENTAS%%
</div>

<h2 id="pasos">Paso a paso para cambiar la bombilla</h2>
<div class="mag-mec-steps">
%%PASOS%%
</div>

<h2 id="precios">Cu&aacute;nto cuesta cambiar la bombilla del %%MODELO%%</h2>
%%TABLAPRECIOS%%

%%AMAZONCARDS%%

<h2>Los errores m&aacute;s comunes en el %%MODELO%%</h2>
%%ERRORES%%

<h2>Por qu&eacute; se funden las bombillas del %%MODELO%%</h2>
%%RAZONES%%

<div class="mag-notice-inner">
  <h3>Antes de la ITV</h3>
  <p>&iquest;Te han rechazado la ITV por una bombilla fundida? Consulta nuestra gu&iacute;a completa de luces para la ITV.</p>
  <p><a href="/guia-luces">Ver gu&iacute;a completa de luces &rarr;</a></p>
</div>

<h2>Preguntas frecuentes sobre el %%MODELO%%</h2>
%%FAQS%%

<div class="mag-notice-inner">
  <h3>Resumen r&aacute;pido</h3>
  <p>%%RESUMEN%%</p>
</div>

<div class="related-guides">
  <h3>Otras gu&iacute;as del %%MODELO%%</h3>
  %%RELATED%%
</div>

<div class="related-guides">
  <h3>Gu&iacute;as relacionadas</h3>
  <a href="/guia-luces">Gu&iacute;a completa de luces para la ITV</a>
  <a href="/checklist-itv">Checklist pre-ITV (25 puntos)</a>
  <a href="/que-pasa-si-suspendo-la-itv">Qu&eacute; hacer si suspendes la ITV</a>
  <a href="/mecanica/bombillas">Gu&iacute;a completa de bombillas</a>
</div>

<div class="mag-notice-inner">
  <h3>Sobre el autor</h3>
  <p><strong>Daniel Vega</strong>, T&eacute;cnico Superior en Automoci&oacute;n con 12 a&ntilde;os de experiencia. <a href="/autor/daniel-vega">Ver perfil del autor &rarr;</a></p>
</div>

<p><a href="/index" class="btn">&larr; Volver a la p&aacute;gina principal</a></p>

</div>

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
        <a href="/operadores-itv-espana">Operadores ITV</a>
      </div>
      <div class="itv-footer-col">
        <h4>Gu&iacute;as</h4>
        <a href="/guia-completa-itv">Gu&iacute;a completa ITV</a>
        <a href="/guias">Todas las gu&iacute;as</a>
        <a href="/blog/">Blog</a>
        <a href="/mecanica">Mec&aacute;nica DIY</a>
        <a href="/guia-luces">Luces</a>
        <a href="/guia-neumaticos">Neum&aacute;ticos</a>
        <a href="/guia-frenos">Frenos</a>
        <a href="/guia-gases">Gases</a>
        <a href="/guia-documentacion">Documentaci&oacute;n</a>
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
        <a href="/autor/daniel-vega">Daniel Vega (autor)</a>
        <a href="/contacto">Contacto</a>
        <a href="/aviso-legal">Aviso legal</a>
        <a href="/politica-cookies">Pol&iacute;tica de Cookies</a>
        <a href="/politica-privacidad">Pol&iacute;tica de Privacidad</a>
        <a href="/politica-afiliados">Afiliados</a>
      </div>
    </div>
    <div class="itv-footer-bottom">
      <span>&copy; 2026 ITVCHECK.ES</span>
      <span>MANUAL DE INSPECCI&Oacute;N &middot; EDICI&Oacute;N 2026</span>
    </div>
  </div>
</footer>

<script src="/js/nav-mobile.js" defer></script>
<script>
function toggleMenu(){var n=document.getElementById('menu');if(n)n.classList.toggle('open');}
window.onload=function(){if(localStorage.getItem('cookiesAceptadas')===null){document.getElementById('cookieBanner').style.display='block';}};
function aceptarCookies(){localStorage.setItem('cookiesAceptadas','true');loadScripts();document.getElementById('cookieBanner').style.display='none';}
function rechazarCookies(){localStorage.setItem('cookiesAceptadas','false');document.getElementById('cookieBanner').style.display='none';}
</script>
</body>
</html>
'@

# Amazon cards específicas de bombillas
$amazonCards = @'
<div class="amazon-card">
  <img src="https://m.media-amazon.com/images/I/61q6IsrY3mL._SL200_.jpg" alt="Bombilla H7 XELORD (pack de 2)" loading="lazy">
  <div class="amazon-card-body">
    <h4>Bombilla H7 XELORD (pack de 2)</h4>
    <p>Certificaci&oacute;n E-Mark, luz m&aacute;s blanca y homologada para pasar la ITV.</p>
    <a href="https://www.amazon.es/dp/B07YDD74GW?tag=itvcheck-21&linkCode=ll1" target="_blank" rel="nofollow sponsored" class="btn-amazon">Ver precio en Amazon</a>
  </div>
</div>
<div class="amazon-card">
  <img src="https://m.media-amazon.com/images/I/71Lh44paL-S._SL200_.jpg" alt="Bombilla W5W XELORD (pack de 2)" loading="lazy">
  <div class="amazon-card-body">
    <h4>Bombilla W5W XELORD (pack de 2)</h4>
    <p>12V 5W, luz blanca, homologadas para ITV.</p>
    <a href="https://www.amazon.es/dp/B092JGM388?tag=itvcheck-21&linkCode=ll1" target="_blank" rel="nofollow sponsored" class="btn-amazon">Ver precio en Amazon</a>
  </div>
</div>
<div class="amazon-card">
  <img src="https://m.media-amazon.com/images/I/810eYUofxZL._SL200_.jpg" alt="Destornilladores JOREST (40 puntas)" loading="lazy">
  <div class="amazon-card-body">
    <h4>Destornilladores JOREST (40 puntas)</h4>
    <p>Puntas de T5 a T20, mango magn&eacute;tico, ideales para el vano motor.</p>
    <a href="https://www.amazon.es/dp/B09PY8WQHJ?tag=itvcheck-21&linkCode=ll1" target="_blank" rel="nofollow sponsored" class="btn-amazon">Ver precio en Amazon</a>
  </div>
</div>
'@

# Herramientas comunes (mismo bloque para todos)
$herramientasComunes = @'
<ul>
<li><strong>Bombilla H7 halógena</strong> (idealmente dos)</li>
<li><strong>Bombilla W5W</strong> (si falla la de posici&oacute;n)</li>
<li><strong>Destornillador Torx T20</strong></li>
<li><strong>Guantes de algod&oacute;n</strong></li>
<li><strong>Linterna frontal</strong></li>
</ul>
'@

# =========================================================================
# DEFINIR FICHAS
# =========================================================================
$fichas = @()

# ---------- 1. CITROEN C3 ----------
$fichas += @{
  Archivo = "citroen-c3-cambiar-bombilla.html"
  SLUG = "citroen-c3-cambiar-bombilla"
  MODELO = "Citro&euml;n C3"
  MODELOUPPER = "CITROEN C3"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Citro&euml;n C3. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Citro&euml;n C3 (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Citro&euml;n C3 es uno de los utilitarios m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas hal&oacute;genas H7 se funden con frecuencia y provocan un rechazo seguro en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Citro&euml;n C3 es uno de los utilitarios m&aacute;s vendidos en Espa&ntilde;a, con un dise&ntilde;o muy popular y un precio competitivo. Su punto d&eacute;bil son las bombillas hal&oacute;genas H7, que se funden con frecuencia y provocan un rechazo seguro en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiar la bombilla del faro delantero del Citro&euml;n C3 (generaciones II y III, a&ntilde;os 2009-2026)."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos &uacute;ltimas generaciones del Citro&euml;n C3 comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Citro&euml;n C3 II:</strong> a&ntilde;os 2009-2016.</li>
<li><strong>Citro&euml;n C3 III:</strong> a&ntilde;os 2016-2026.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> no llevan bombillas reemplazables.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-12 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-12 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Antes de empezar:</strong> En el Citro&euml;n C3, el lado del conductor tiene menos espacio por la caja de fusibles. Apaga el motor y deja enfriar el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herramientasComunes
  PASOS = @'
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Aparca y abre el cap&oacute;</strong>
    <p>Localiza la parte trasera del faro.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Retira la tapa protectora del faro</strong>
    <p>G&iacute;rala un cuarto de vuelta en sentido antihorario.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el conector el&eacute;ctrico</strong>
    <p>Presiona la pesta&ntilde;a lateral y tira suavemente.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Suelta la grapa met&aacute;lica y extrae la bombilla</strong>
    <p>Tira recto hacia afuera.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Instala la bombilla nueva</strong>
    <p>Con guante de algod&oacute;n. <strong>No toques el cristal.</strong></p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Reconecta el conector y cierra la tapa</strong>
    <p>Hasta o&iacute;r un "clic".</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Enciende las luces y comprueba</strong>
    <p>Verifica cruce, carretera, posici&oacute;n e intermitentes.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-12 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Citro&euml;n</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos:</strong> usa guantes de algod&oacute;n.</li>
<li><strong>Forzar la bombilla:</strong> solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible:</strong> si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una:</strong> cambia las dos del mismo faro.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. El uso urbano con muchos encendidos y apagados acorta la vida de las bombillas.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Citro&euml;n C3?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-35 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Es obligatorio cambiar las dos a la vez?</h3>
<p>No, pero muy recomendable.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor sin desmontar el faro. Usa guantes de algod&oacute;n y nunca toques el cristal. Ahorro de 40-60 &euro;. Una bombilla fundida es <strong>defecto grave</strong> en la ITV."
  RELATED = '<a href="/mecanica/citroen-c3-cambiar-bateria">Cambiar la bater&iacute;a del Citro&euml;n C3</a>
  <a href="/mecanica/citroen-c4-cambiar-bombilla">Cambiar la bombilla del Citro&euml;n C4</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bombilla del Citro\u00ebn C3","description":"Gu\u00eda paso a paso para sustituir la bombilla del faro delantero del Citro\u00ebn C3.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/citroen-c3-cambiar-bombilla"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Citro\u00ebn C3","item":"https://itvcheck.es/mecanica/citroen-c3-cambiar-bombilla"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bombilla del Citro\u00ebn C3","totalTime":"PT25M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"10"},"tool":[{"@type":"HowToTool","name":"Destornillador Torx T20"},{"@type":"HowToTool","name":"Guantes de algod\u00f3n"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bombilla H7 hal\u00f3gena"},{"@type":"HowToSupply","name":"Bombilla W5W"}],"step":[{"@type":"HowToStep","name":"Aparcar y enfriar","text":"Apaga el motor y deja enfriar el faro."},{"@type":"HowToStep","name":"Abrir el cap\u00f3","text":"Localiza la tapa trasera del faro."},{"@type":"HowToStep","name":"Retirar la tapa","text":"Gira la tapa protectora."},{"@type":"HowToStep","name":"Desconectar el conector","text":"Presiona la pesta\u00f1a y retira."},{"@type":"HowToStep","name":"Extraer la bombilla","text":"Suelta la grapa y extrae."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva sin tocar el cristal."},{"@type":"HowToStep","name":"Cerrar y probar","text":"Vuelve a montar y comprueba."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bombilla lleva el Citro\u00ebn C3?","acceptedAnswer":{"@type":"Answer","text":"H7 para cruce y carretera, W5W para posici\u00f3n."}},{"@type":"Question","name":"\u00bfCu\u00e1nto tiempo se tarda?","acceptedAnswer":{"@type":"Answer","text":"25-35 minutos."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin desmontar el faro?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, desde el vano motor."}}]}
 ]
}
'@
}

# ---------- 2. CITROEN C4 ----------
$fichas += @{
  Archivo = "citroen-c4-cambiar-bombilla.html"
  SLUG = "citroen-c4-cambiar-bombilla"
  MODELO = "Citro&euml;n C4"
  MODELOUPPER = "CITROEN C4"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Citro&euml;n C4. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Citro&euml;n C4 (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El Citro&euml;n C4 es uno de los compactos m&aacute;s confortables del mercado. Sus bombillas H7 se funden con cierta frecuencia y provocan un defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "45-75"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20-30"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Citro&euml;n C4 es uno de los compactos m&aacute;s confortables del mercado y un coche popular en Espa&ntilde;a por su suspensi&oacute;n de amortiguadores hidr&aacute;ulicos y su buena relaci&oacute;n calidad-precio. Como casi todos los coches con faros hal&oacute;genos, tiene un punto d&eacute;bil: las bombillas H7 se funden con cierta frecuencia, y una bombilla fundida es un <strong>defecto grave</strong> en la ITV."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos &uacute;ltimas generaciones del Citro&euml;n C4 comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Citro&euml;n C4 II (B7):</strong> a&ntilde;os 2010-2018. Motores 1.2 PureTech, 1.6 VTi, 1.6 HDi/e-HDi.</li>
<li><strong>Citro&euml;n C4 III (C41):</strong> a&ntilde;os 2020-2026. Motores 1.2 PureTech, 1.5 BlueHDi y &euml;-C4 (el&eacute;ctrico).</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (acabados Shine y Shine Pack) no llevan bombillas reemplazables.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
<tr><td>Intermitente delantero</td><td>PY21W</td><td>4-8 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Ojo con el &euml;-C4 el&eacute;ctrico:</strong> lleva faros LED de serie. Antes de comprar una H7, verifica que tu C4 tiene faros hal&oacute;genos (mira el manual o enciende las luces y comprueba el tipo de luz).
</div>
<div class="mag-mec-warn">
  <strong>Advertencias antes de empezar:</strong><br>
  1. Enfr&iacute;a el faro 10 minutos. Las bombillas hal&oacute;genas alcanzan temperaturas superiores a 100&deg;C.<br>
  2. Nunca toques el cristal de la bombilla nueva con los dedos.<br>
  3. En el C4 II el lado del conductor est&aacute; m&aacute;s justo por la caja de fusibles.
</div>
'@
  HERRAMIENTAS = $herramientasComunes
  PASOS = @'
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Aparca y abre el cap&oacute;</strong>
    <p>Estaciona en superficie plana, con freno de mano puesto y motor apagado. Localiza la parte trasera del faro.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Retira la tapa protectora</strong>
    <p>G&iacute;rala un cuarto de vuelta en sentido antihorario. En el C4 II puede tener pesta&ntilde;as que hay que liberar con cuidado.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Localiza el conector el&eacute;ctrico</strong>
    <p>La bombilla H7 va sujeta por una grapa met&aacute;lica. El conector tiene pesta&ntilde;a de seguridad lateral.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el conector</strong>
    <p>Presiona la pesta&ntilde;a lateral y tira del conector. Nunca tires del cable.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Suelta la grapa met&aacute;lica</strong>
    <p>Presiona los dos extremos hacia dentro y sep&aacute;rala.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Extrae la bombilla fundida</strong>
    <p>Tira recto hacia afuera con un pa&ntilde;o limpio.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Instala la bombilla nueva</strong>
    <p>Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">8</span>
  <div class="mag-mec-step-body">
    <strong>Reconecta el conector</strong>
    <p>Empuja hasta o&iacute;r un "clic".</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">9</span>
  <div class="mag-mec-step-body">
    <strong>Cierra la tapa</strong>
    <p>G&iacute;rala un cuarto de vuelta en sentido horario.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">10</span>
  <div class="mag-mec-step-body">
    <strong>Enciende y comprueba</strong>
    <p>Arranca y verifica cruce, carretera, posici&oacute;n e intermitentes.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo (2 bombillas)</td><td>12-30 &euro;</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-70 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Citro&euml;n</td><td>60-95 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave. Usa guantes.</li>
<li><strong>Forzar la bombilla.</strong> Solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector.</strong> El interior del faro se raya con facilidad.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen en su desgaste.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Citro&euml;n C4?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Consulta el manual de tu versi&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos para las dos bombillas.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Es obligatorio cambiar las dos a la vez?</h3>
<p>No, pero muy recomendable.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
<h3>&iquest;Puedo poner LED?</h3>
<p>No, es modificaci&oacute;n no autorizada. Defecto grave en ITV.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor, sin desmontar el faro. Usa guantes de algod&oacute;n. Ahorro de 45-75 &euro;. Cambiar a LED es <strong>modificaci&oacute;n no autorizada</strong> y defecto grave en ITV."
  RELATED = '<a href="/mecanica/citroen-c3-cambiar-bombilla">Cambiar la bombilla del Citro&euml;n C3</a>
  <a href="/mecanica/citroen-c4-cambiar-bombilla">Cambiar la bombilla del Citro&euml;n C4</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bombilla del Citro\u00ebn C4","description":"Gu\u00eda paso a paso para sustituir la bombilla del faro delantero del Citro\u00ebn C4.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/citroen-c4-cambiar-bombilla"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Citro\u00ebn C4","item":"https://itvcheck.es/mecanica/citroen-c4-cambiar-bombilla"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bombilla del Citro\u00ebn C4","totalTime":"PT25M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"10"},"tool":[{"@type":"HowToTool","name":"Destornillador Torx T20"},{"@type":"HowToTool","name":"Guantes de algod\u00f3n"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bombilla H7 hal\u00f3gena"}],"step":[{"@type":"HowToStep","name":"Aparcar y enfriar","text":"Apaga el motor y deja enfriar el faro."},{"@type":"HowToStep","name":"Abrir el cap\u00f3","text":"Localiza la tapa trasera del faro."},{"@type":"HowToStep","name":"Retirar la tapa","text":"Gira la tapa protectora."},{"@type":"HowToStep","name":"Desconectar el conector","text":"Presiona la pesta\u00f1a y retira."},{"@type":"HowToStep","name":"Extraer la bombilla","text":"Suelta la grapa y extrae."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva sin tocar el cristal."},{"@type":"HowToStep","name":"Cerrar y probar","text":"Vuelve a montar y comprueba."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bombilla lleva el Citro\u00ebn C4?","acceptedAnswer":{"@type":"Answer","text":"H7 para cruce y carretera, W5W para posici\u00f3n."}},{"@type":"Question","name":"\u00bfCu\u00e1nto tiempo se tarda?","acceptedAnswer":{"@type":"Answer","text":"20-30 minutos para las dos bombillas."}},{"@type":"Question","name":"\u00bfPuedo poner LED?","acceptedAnswer":{"@type":"Answer","text":"No, es modificaci\u00f3n no autorizada y defecto grave en ITV."}}]}
 ]
}
'@
}

# ---------- 3. DACIA DUSTER ----------
$fichas += @{
  Archivo = "dacia-duster-cambiar-bombilla.html"
  SLUG = "dacia-duster-cambiar-bombilla"
  MODELO = "Dacia Duster"
  MODELOUPPER = "DACIA DUSTER"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Dacia Duster. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Dacia Duster (Gu&iacute;a 2026)"
  TIEMPO = "20"
  LEAD = "El Dacia Duster es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a por su relaci&oacute;n calidad-precio. Sus bombillas H7 se funden con cierta frecuencia y provocan un rechazo seguro en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Dacia Duster es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a gracias a su excelente relaci&oacute;n calidad-precio. Su punto d&eacute;bil son las bombillas hal&oacute;genas H7, que se funden con cierta frecuencia y provocan un rechazo seguro en la ITV por defecto grave. En el Duster el acceso al faro es bueno, lo que hace que sea una tarea asequible para cualquier conductor."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos generaciones del Dacia Duster comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Dacia Duster I:</strong> a&ntilde;os 2010-2017.</li>
<li><strong>Dacia Duster II:</strong> a&ntilde;os 2017-2026.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (acabados altos) no llevan bombillas reemplazables.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-12 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-12 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herramientasComunes
  PASOS = @'
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Aparca y abre el cap&oacute;</strong>
    <p>Localiza la parte trasera del faro.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Retira la tapa protectora del faro</strong>
    <p>G&iacute;rala un cuarto de vuelta.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el conector el&eacute;ctrico</strong>
    <p>Presiona la pesta&ntilde;a lateral y tira.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Suelta la grapa met&aacute;lica y extrae la bombilla</strong>
    <p>Tira recto hacia afuera.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Instala la bombilla nueva</strong>
    <p>Con guante de algod&oacute;n. <strong>No toques el cristal.</strong></p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Reconecta el conector y cierra la tapa</strong>
    <p>Hasta o&iacute;r un "clic".</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Enciende las luces y comprueba</strong>
    <p>Verifica cruce, carretera, posici&oacute;n e intermitentes.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-12 &euro;</td><td>20 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Dacia</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos:</strong> usa guantes de algod&oacute;n.</li>
<li><strong>Forzar la bombilla:</strong> solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible:</strong> si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una:</strong> cambia las dos del mismo faro.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. En el Duster, el uso por carreteras en mal estado acorta la vida de las bombillas.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Dacia Duster?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Es obligatorio cambiar las dos a la vez?</h3>
<p>No, pero muy recomendable.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor sin desmontar el faro. Usa guantes de algod&oacute;n. Ahorro de 40-60 &euro;. Una bombilla fundida es <strong>defecto grave</strong> en la ITV."
  RELATED = '<a href="/mecanica/dacia-duster-cambiar-bateria">Cambiar la bater&iacute;a del Dacia Duster</a>
  <a href="/mecanica/dacia-sandero-cambiar-bombilla">Cambiar la bombilla del Dacia Sandero</a>
  <a href="/mecanica/dacia-jogger-cambiar-bombilla">Cambiar la bombilla del Dacia Jogger</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bombilla del Dacia Duster","description":"Gu\u00eda paso a paso para sustituir la bombilla del faro delantero del Dacia Duster.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/dacia-duster-cambiar-bombilla"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Dacia Duster","item":"https://itvcheck.es/mecanica/dacia-duster-cambiar-bombilla"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bombilla del Dacia Duster","totalTime":"PT20M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"8"},"tool":[{"@type":"HowToTool","name":"Destornillador Torx T20"},{"@type":"HowToTool","name":"Guantes de algod\u00f3n"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bombilla H7 hal\u00f3gena"}],"step":[{"@type":"HowToStep","name":"Aparcar y enfriar","text":"Apaga el motor y deja enfriar el faro."},{"@type":"HowToStep","name":"Abrir el cap\u00f3","text":"Localiza la tapa trasera del faro."},{"@type":"HowToStep","name":"Retirar la tapa","text":"Gira la tapa protectora."},{"@type":"HowToStep","name":"Desconectar el conector","text":"Presiona la pesta\u00f1a y retira."},{"@type":"HowToStep","name":"Extraer la bombilla","text":"Suelta la grapa y extrae."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva sin tocar el cristal."},{"@type":"HowToStep","name":"Cerrar y probar","text":"Vuelve a montar y comprueba."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bombilla lleva el Dacia Duster?","acceptedAnswer":{"@type":"Answer","text":"H7 para cruce y carretera, W5W para posici\u00f3n."}},{"@type":"Question","name":"\u00bfCu\u00e1nto tiempo se tarda?","acceptedAnswer":{"@type":"Answer","text":"20-30 minutos."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin desmontar el faro?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, desde el vano motor."}}]}
 ]
}
'@
}

# ---------- 4. DACIA SANDERO ----------
$fichas += @{
  Archivo = "dacia-sandero-cambiar-bombilla.html"
  SLUG = "dacia-sandero-cambiar-bombilla"
  MODELO = "Dacia Sandero"
  MODELOUPPER = "DACIA SANDERO"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Dacia Sandero. Herramientas, referencias, tiempo estimado y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Dacia Sandero (Gu&iacute;a 2026)"
  TIEMPO = "15"
  LEAD = "El Dacia Sandero es el coche m&aacute;s vendido en Espa&ntilde;a a&ntilde;o tras a&ntilde;o. Una bombilla fundida es uno de los motivos m&aacute;s comunes de rechazo en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso en menos de 15 minutos."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "15"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Dacia Sandero es el coche m&aacute;s vendido en Espa&ntilde;a a&ntilde;o tras a&ntilde;o, y uno de los fallos m&aacute;s habituales que provoca un rechazo en la ITV es una bombilla fundida. Cambiarla t&uacute; mismo es una de las tareas m&aacute;s sencillas y rentables que puedes hacer: te ahorras entre 40 y 60 &euro; de mano de obra en el taller y tardas menos de 15 minutos. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones II y III, a&ntilde;os 2013-2026)."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos &uacute;ltimas generaciones del Dacia Sandero comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Dacia Sandero II:</strong> a&ntilde;os 2013-2020.</li>
<li><strong>Dacia Sandero III:</strong> a&ntilde;os 2021-2026.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> no llevan bombillas reemplazables.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-12 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-12 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro al menos 10 minutos. Las bombillas hal&oacute;genas alcanzan temperaturas superiores a 100&deg;C y puedes quemarte. Adem&aacute;s, nunca toques el cristal de la bombilla nueva con los dedos: la grasa de la piel crea un punto caliente que la funde en pocos d&iacute;as.
</div>
'@
  HERRAMIENTAS = $herramientasComunes
  PASOS = @'
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Aparca en lugar seguro y abre el cap&oacute;</strong>
    <p>Estaciona el coche en una superficie plana, con el freno de mano puesto y el motor apagado. Localiza la parte trasera del faro.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Retira la tapa protectora del faro</strong>
    <p>G&iacute;rala un cuarto de vuelta en sentido antihorario. Si est&aacute; muy dura, ayuda con un destornillador plano con cuidado.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el conector el&eacute;ctrico</strong>
    <p>Presiona la pesta&ntilde;a de seguridad y tira suavemente del conector. Nunca tires del cable.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Suelta la grapa met&aacute;lica y extrae la bombilla</strong>
    <p>Presiona los extremos hacia dentro y sep&aacute;rala. Tira de la bombilla recta hacia afuera con un trapo limpio.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Instala la bombilla nueva</strong>
    <p>Con un guante de algod&oacute;n. Localiza la pesta&ntilde;a de gu&iacute;a y col&oacute;cala en la misma posici&oacute;n. <strong>No toques el cristal.</strong></p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Reconecta el conector y cierra la tapa</strong>
    <p>Hasta o&iacute;r un "clic". Gira la tapa en sentido horario.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Enciende las luces y comprueba</strong>
    <p>Cierra el cap&oacute;, arranca y verifica cruce, carretera, posici&oacute;n e intermitentes. Si no enciende, revisa el fusible.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-12 &euro;</td><td>15 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>30-50 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Dacia</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
<p><strong>Ahorro real:</strong> Si haces el cambio t&uacute; mismo, te ahorras entre 40 y 60 &euro; por cada cambio de bombilla. Teniendo en cuenta que las bombillas hal&oacute;genas suelen fundirse cada 2-3 a&ntilde;os, es una de las tareas DIY m&aacute;s rentables.</p>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave. Usa guantes.</li>
<li><strong>Forzar la bombilla.</strong> Solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>Apretar demasiado la grapa.</strong> Puede deformar el casquillo.</li>
</ul>
'@
  RAZONES = @'
<p>Las bombillas hal&oacute;genas del Sandero (H7) tienen una vida &uacute;til media de entre 500 y 1.000 horas. Los factores que m&aacute;s influyen en su desgaste son:</p>
<ul>
<li><strong>Vibraciones:</strong> los baches y el mal estado de la carretera acortan la vida de la bombilla.</li>
<li><strong>Humedad:</strong> si la tapa protectora del faro est&aacute; mal sellada, la humedad entra y oxida los contactos.</li>
<li><strong>Tensi&oacute;n el&eacute;ctrica:</strong> si el alternador carga por encima de 14,5 V, las bombillas se funden antes.</li>
<li><strong>Encendidos frecuentes:</strong> los trayectos cortos con muchos encendidos y apagados acortan la vida &uacute;til.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Dacia Sandero?</h3>
<p>El Sandero (generaciones II y III) utiliza bombilla <strong>H7</strong> para cruce y carretera, y <strong>W5W</strong> para posici&oacute;n. Algunas versiones con faros LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>Si es tu primera vez, entre 15 y 25 minutos. Con pr&aacute;ctica, menos de 10 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;. Se accede desde el vano motor retirando la tapa protectora.</p>
<h3>&iquest;Es obligatorio cambiar las dos a la vez?</h3>
<p>No, pero muy recomendable. Notar&aacute;s un tono distinto entre las dos luces.</p>
<h3>&iquest;Qu&eacute; pasa si voy a la ITV con una bombilla fundida?</h3>
<p>Es un <strong>defecto grave</strong>. No podr&aacute;s pasar la ITV. Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor sin desmontar el faro. Usa guantes de algod&oacute;n y nunca toques el cristal. Ahorro de 40-60 &euro; por cambio. Una bombilla fundida es <strong>defecto grave</strong> en la ITV."
  RELATED = '<a href="/mecanica/dacia-sandero-cambiar-bombilla">Cambiar la bombilla del Dacia Sandero</a>
  <a href="/mecanica/dacia-duster-cambiar-bombilla">Cambiar la bombilla del Dacia Duster</a>
  <a href="/mecanica/dacia-jogger-cambiar-bombilla">Cambiar la bombilla del Dacia Jogger</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bombilla del Dacia Sandero","description":"Gu\u00eda paso a paso para sustituir la bombilla del faro delantero del Dacia Sandero.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/dacia-sandero-cambiar-bombilla"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Dacia Sandero","item":"https://itvcheck.es/mecanica/dacia-sandero-cambiar-bombilla"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bombilla del Dacia Sandero","totalTime":"PT15M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"8"},"tool":[{"@type":"HowToTool","name":"Destornillador Torx T20"},{"@type":"HowToTool","name":"Guantes de algod\u00f3n"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bombilla H7 hal\u00f3gena"}],"step":[{"@type":"HowToStep","name":"Aparcar y enfriar","text":"Apaga el motor y deja enfriar el faro."},{"@type":"HowToStep","name":"Abrir el cap\u00f3","text":"Localiza la tapa del faro trasero."},{"@type":"HowToStep","name":"Retirar la tapa","text":"Gira la tapa protectora un cuarto de vuelta."},{"@type":"HowToStep","name":"Desconectar el conector","text":"Presiona la pesta\u00f1a y retira."},{"@type":"HowToStep","name":"Extraer la bombilla","text":"Suelta la grapa met\u00e1lica y extrae."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva sin tocar el cristal."},{"@type":"HowToStep","name":"Cerrar y probar","text":"Vuelve a montar y comprueba."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bombilla lleva el Dacia Sandero?","acceptedAnswer":{"@type":"Answer","text":"H7 para cruce y carretera, W5W para posici\u00f3n."}},{"@type":"Question","name":"\u00bfCu\u00e1nto tiempo se tarda?","acceptedAnswer":{"@type":"Answer","text":"15-25 minutos."}},{"@type":"Question","name":"\u00bfQu\u00e9 pasa si voy con una fundida?","acceptedAnswer":{"@type":"Answer","text":"Es un defecto grave. No podr\u00e1s pasar la ITV."}}]}
 ]
}
'@
}

# ---------- 5. DACIA JOGGER ----------
$fichas += @{
  Archivo = "dacia-jogger-cambiar-bombilla.html"
  SLUG = "dacia-jogger-cambiar-bombilla"
  MODELO = "Dacia Jogger"
  MODELOUPPER = "DACIA JOGGER"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Dacia Jogger. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Dacia Jogger (Gu&iacute;a 2026)"
  TIEMPO = "15-25"
  LEAD = "El Dacia Jogger es uno de los coches m&aacute;s vendidos en Espa&ntilde;a desde su lanzamiento. Sus bombillas H7 se funden con cierta frecuencia y provocan un defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "15-25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Dacia Jogger es uno de los coches m&aacute;s vendidos en Espa&ntilde;a desde su lanzamiento. Su precio competitivo, su versatilidad (5 o 7 plazas) y su bajo consumo lo han convertido en un &eacute;xito. Como casi todos los coches con faros hal&oacute;genos, tiene un punto d&eacute;bil: las bombillas H7 se funden con cierta frecuencia y una bombilla fundida es un <strong>defecto grave</strong> en la ITV. La buena noticia: al compartir plataforma con el Sandero, el acceso al faro es <strong>sencillo</strong>."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para el Dacia Jogger comercializado en Espa&ntilde;a:</p>
<ul>
<li><strong>Dacia Jogger (2021-2026):</strong> motores 1.0 TCe, 1.0 ECO-G (GLP) y 1.6 Hybrid.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (acabados altos Expression y Extreme) no llevan bombillas reemplazables. Las versiones con hal&oacute;genos (Essential) s&iacute;.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-12 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-12 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Verifica antes de comprar:</strong> algunos Jogger con acabado Essential pueden llevar bombilla H4 en lugar de H7 (sistema antiguo). Mira la referencia en el manual del veh&iacute;culo antes de comprar.
</div>
'@
  HERRAMIENTAS = $herramientasComunes
  PASOS = @'
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Aparca y abre el cap&oacute;</strong>
    <p>Estaciona en superficie plana, con freno de mano y motor apagado.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Retira la tapa protectora</strong>
    <p>G&iacute;rala un cuarto de vuelta en sentido antihorario.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el conector el&eacute;ctrico</strong>
    <p>Presiona la pesta&ntilde;a lateral y tira.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Suelta la grapa y extrae la bombilla</strong>
    <p>Tira recto hacia afuera.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Instala la bombilla nueva</strong>
    <p>Con guante de algod&oacute;n. <strong>No toques el cristal.</strong></p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Reconecta el conector y cierra la tapa</strong>
    <p>Hasta o&iacute;r un "clic".</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Enciende las luces y comprueba</strong>
    <p>Verifica cruce, carretera, posici&oacute;n e intermitentes.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-15 &euro;</td><td>15-25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Dacia</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
<p><strong>Ahorro real:</strong> Si haces el cambio t&uacute; mismo, te ahorras entre 40 y 60 &euro;. En el Jogger es especialmente rentable porque es una de las tareas m&aacute;s r&aacute;pidas.</p>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave. Usa guantes.</li>
<li><strong>Forzar la bombilla.</strong> La H7 solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector interior.</strong> Es delicado.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen. El uso urbano intensivo acorta la vida &uacute;til.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Dacia Jogger?</h3>
<p>El Jogger utiliza <strong>H7</strong> para cruce y carretera, y <strong>W5W</strong> para posici&oacute;n. Verifica siempre el manual.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>15-25 minutos. Es una de las tareas m&aacute;s r&aacute;pidas del mantenimiento.</p>
<h3>&iquest;Se puede cambiar sin herramientas?</h3>
<p>Casi. Solo necesitas un destornillador Torx T20 para la tapa. Si tu Jogger tiene tapa de goma, no necesitas nada.</p>
<h3>&iquest;Es obligatorio cambiar las dos a la vez?</h3>
<p>No, pero muy recomendable.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor, muy sencillo (comparte plataforma con el Sandero). Ahorro de 40-60 &euro;. Verifica si tu Jogger lleva H7 o H4 antes de comprar."
  RELATED = '<a href="/mecanica/dacia-sandero-cambiar-bombilla">Cambiar la bombilla del Dacia Sandero</a>
  <a href="/mecanica/dacia-duster-cambiar-bombilla">Cambiar la bombilla del Dacia Duster</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bombilla del Dacia Jogger","description":"Gu\u00eda paso a paso para sustituir la bombilla del faro delantero del Dacia Jogger.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/dacia-jogger-cambiar-bombilla"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Dacia Jogger","item":"https://itvcheck.es/mecanica/dacia-jogger-cambiar-bombilla"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bombilla del Dacia Jogger","totalTime":"PT20M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"12"},"tool":[{"@type":"HowToTool","name":"Destornillador Torx T20"},{"@type":"HowToTool","name":"Guantes de algod\u00f3n"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bombilla H7 hal\u00f3gena"}],"step":[{"@type":"HowToStep","name":"Aparcar y enfriar","text":"Apaga el motor y deja enfriar el faro."},{"@type":"HowToStep","name":"Abrir el cap\u00f3","text":"Localiza la tapa trasera del faro."},{"@type":"HowToStep","name":"Retirar la tapa","text":"Gira la tapa protectora."},{"@type":"HowToStep","name":"Desconectar el conector","text":"Presiona la pesta\u00f1a y retira."},{"@type":"HowToStep","name":"Extraer la bombilla","text":"Suelta la grapa y extrae."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva sin tocar el cristal."},{"@type":"HowToStep","name":"Cerrar y probar","text":"Vuelve a montar y comprueba."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bombilla lleva el Dacia Jogger?","acceptedAnswer":{"@type":"Answer","text":"H7 para cruce y carretera, W5W para posici\u00f3n."}},{"@type":"Question","name":"\u00bfCu\u00e1nto tiempo se tarda?","acceptedAnswer":{"@type":"Answer","text":"15-25 minutos."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin herramientas?","acceptedAnswer":{"@type":"Answer","text":"Casi. Solo necesitas un destornillador Torx T20 para la tapa."}}]}
 ]
}
'@
}

# ---------- 6. FIAT 500 ----------
$fichas += @{
  Archivo = "fiat-500-cambiar-bombilla.html"
  SLUG = "fiat-500-cambiar-bombilla"
  MODELO = "Fiat 500"
  MODELOUPPER = "FIAT 500"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Fiat 500. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Fiat 500 (Gu&iacute;a 2026)"
  TIEMPO = "20"
  LEAD = "El Fiat 500 es un icono sobre ruedas y uno de los coches m&aacute;s populares en Espa&ntilde;a. Sus bombillas H7 se funden con cierta frecuencia y provocan un rechazo seguro en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Fiat 500 es un icono sobre ruedas y uno de los coches m&aacute;s populares en Espa&ntilde;a, especialmente en ciudad. Su punto d&eacute;bil, como en casi todos los coches con faros hal&oacute;genos, son las bombillas H7, que se funden con cierta frecuencia y provocan un rechazo seguro en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaci&oacute;n 312, a&ntilde;os 2007-2026)."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para el Fiat 500 comercializado en Espa&ntilde;a:</p>
<ul>
<li><strong>Fiat 500 (312):</strong> a&ntilde;os 2007-2026. Versiones 1.2, 0.9 TwinAir, 1.3 Multijet y 500e (el&eacute;ctrico).</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> no llevan bombillas reemplazables.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-12 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-12 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Antes de empezar:</strong> En el Fiat 500 el acceso al faro es bastante bueno, pero el hueco es reducido. Apaga el motor y deja enfriar el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herramientasComunes
  PASOS = @'
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Aparca y abre el cap&oacute;</strong>
    <p>Localiza la parte trasera del faro.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Retira la tapa protectora del faro</strong>
    <p>G&iacute;rala un cuarto de vuelta en sentido antihorario.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el conector el&eacute;ctrico</strong>
    <p>Presiona la pesta&ntilde;a lateral y tira suavemente.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Suelta la grapa met&aacute;lica y extrae la bombilla</strong>
    <p>Tira recto hacia afuera.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Instala la bombilla nueva</strong>
    <p>Con guante de algod&oacute;n. <strong>No toques el cristal.</strong></p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Reconecta el conector y cierra la tapa</strong>
    <p>Hasta o&iacute;r un "clic".</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Enciende las luces y comprueba</strong>
    <p>Verifica cruce, carretera, posici&oacute;n e intermitentes.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-12 &euro;</td><td>20 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Fiat</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos:</strong> usa guantes de algod&oacute;n.</li>
<li><strong>Forzar la bombilla:</strong> solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible:</strong> si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una:</strong> cambia las dos del mismo faro.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. En el 500, el uso urbano intensivo con muchos encendidos y apagados acorta la vida de las bombillas.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Fiat 500?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Es obligatorio cambiar las dos a la vez?</h3>
<p>No, pero muy recomendable.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor sin desmontar el faro. Usa guantes de algod&oacute;n y nunca toques el cristal. Ahorro de 40-60 &euro;. Una bombilla fundida es <strong>defecto grave</strong> en la ITV."
  RELATED = '<a href="/mecanica/fiat-tipo-cambiar-bombilla">Cambiar la bombilla del Fiat Tipo</a>
  <a href="/mecanica/citroen-c3-cambiar-bombilla">Cambiar la bombilla del Citro&euml;n C3</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bombilla del Fiat 500","description":"Gu\u00eda paso a paso para sustituir la bombilla del faro delantero del Fiat 500.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/fiat-500-cambiar-bombilla"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Fiat 500","item":"https://itvcheck.es/mecanica/fiat-500-cambiar-bombilla"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bombilla del Fiat 500","totalTime":"PT20M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"8"},"tool":[{"@type":"HowToTool","name":"Destornillador Torx T20"},{"@type":"HowToTool","name":"Guantes de algod\u00f3n"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bombilla H7 hal\u00f3gena"},{"@type":"HowToSupply","name":"Bombilla W5W"}],"step":[{"@type":"HowToStep","name":"Aparcar y enfriar","text":"Apaga el motor y deja enfriar el faro."},{"@type":"HowToStep","name":"Abrir el cap\u00f3","text":"Localiza la tapa trasera del faro."},{"@type":"HowToStep","name":"Retirar la tapa","text":"Gira la tapa protectora."},{"@type":"HowToStep","name":"Desconectar el conector","text":"Presiona la pesta\u00f1a y retira."},{"@type":"HowToStep","name":"Extraer la bombilla","text":"Suelta la grapa y extrae."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva sin tocar el cristal."},{"@type":"HowToStep","name":"Cerrar y probar","text":"Vuelve a montar y comprueba."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bombilla lleva el Fiat 500?","acceptedAnswer":{"@type":"Answer","text":"H7 para cruce y carretera, W5W para posici\u00f3n."}},{"@type":"Question","name":"\u00bfCu\u00e1nto tiempo se tarda?","acceptedAnswer":{"@type":"Answer","text":"20-30 minutos."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin desmontar el faro?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, desde el vano motor."}}]}
 ]
}
'@
}

# =========================================================================
# GENERAR
# =========================================================================
$generados = 0
$avisos = 0

foreach ($ficha in $fichas) {
  $destino = Join-Path $base $ficha.Archivo
  if (Test-Path $destino) {
    Copy-Item $destino (Join-Path $bk $ficha.Archivo) -Force
  }
  $html = $template
  foreach ($key in $ficha.Keys) {
    $html = $html.Replace("%%$key%%", [string]$ficha[$key])
  }
  [System.IO.File]::WriteAllText($destino, $html, [System.Text.UTF8Encoding]::new($false))
  
  $placeholders = (Select-String -Path $destino -Pattern '%%[A-Z]').Count
  $pasosOK = (Select-String -Path $destino -Pattern 'mag-mec-step-num').Count
  
  Write-Host ""
  Write-Host "=== $($ficha.Archivo) ===" -ForegroundColor Cyan
  Write-Host "  styles-v2 (debe ser 1): $((Select-String -Path $destino -Pattern 'styles-v2').Count)"
  Write-Host "  styles.css residual (debe ser 0): $((Select-String -Path $destino -Pattern 'link.*styles\.css').Count)"
  Write-Host "  mojibake (debe ser 0): $((Select-String -Path $destino -Pattern ([char]0x00C3)).Count)"
  Write-Host "  placeholders residuales (debe ser 0): $placeholders"
  Write-Host "  mag-mec-step-num encontrados: $pasosOK"
  
  if ($placeholders -gt 0) {
    Write-Host "  AVISO: quedan placeholders" -ForegroundColor Yellow
    $avisos++
  } else {
    $generados++
  }
}

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "Generados: $generados de 6" -ForegroundColor Green
Write-Host "Con avisos: $avisos" -ForegroundColor Yellow
Write-Host "Backup: $bk" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

Start-Process "http://localhost:8000/mecanica/citroen-c3-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/citroen-c4-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/dacia-duster-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/dacia-sandero-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/dacia-jogger-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/fiat-500-cambiar-bombilla.html"