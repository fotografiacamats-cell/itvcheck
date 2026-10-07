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

$herrComunes = @'
<ul>
<li><strong>Bombilla H7 hal&oacute;gena</strong> (idealmente dos)</li>
<li><strong>Bombilla W5W</strong> (si falla la de posici&oacute;n)</li>
<li><strong>Destornillador Torx T20</strong></li>
<li><strong>Guantes de algod&oacute;n</strong></li>
<li><strong>Linterna frontal</strong></li>
</ul>
'@

function New-Pasos {
  param([string[]]$Items)
  $html = ""
  $n = 1
  foreach ($item in $Items) {
    $parts = $item -split '\|',2
    $html += @"
<div class="mag-mec-step">
  <span class="mag-mec-step-num">$n</span>
  <div class="mag-mec-step-body">
    <strong>$($parts[0])</strong>
    <p>$($parts[1])</p>
  </div>
</div>

"@
    $n++
  }
  return $html.TrimEnd()
}

function New-Schema {
  param($tipo,$slug,$tiempo,$coste,$pasosParaSchema,$faqs)
  $stepsJson = ""
  foreach ($p in $pasosParaSchema) {
    $parts = $p -split '\|',2
    $stepsJson += "{`"@type`":`"HowToStep`",`"name`":`"$($parts[0])`",`"text`":`"$($parts[1])`"},"
  }
  $stepsJson = $stepsJson.TrimEnd(',')

  $faqsJson = ""
  foreach ($f in $faqs) {
    $parts = $f -split '\|',2
    $faqsJson += "{`"@type`":`"Question`",`"name`":`"$($parts[0])`",`"acceptedAnswer`":{`"@type`":`"Answer`",`"text`":`"$($parts[1])`"}},"
  }
  $faqsJson = $faqsJson.TrimEnd(',')

  return @"
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bombilla del $tipo","description":"Gu\u00eda paso a paso para sustituir la bombilla del faro delantero del $tipo.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/$slug"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"$tipo","item":"https://itvcheck.es/mecanica/$slug"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bombilla del $tipo","totalTime":"$tiempo","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"$coste"},"tool":[{"@type":"HowToTool","name":"Destornillador Torx T20"},{"@type":"HowToTool","name":"Guantes de algod\u00f3n"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bombilla H7 hal\u00f3gena"},{"@type":"HowToSupply","name":"Bombilla W5W"}],"step":[$stepsJson]},
  {"@type":"FAQPage","mainEntity":[$faqsJson]}
 ]
}
"@
}

# =========================================================================
# FICHAS
# =========================================================================
$fichas = @()

# ---------- 1. OPEL ASTRA ----------
$fichas += @{
  Archivo = "opel-astra-cambiar-bombilla.html"
  SLUG = "opel-astra-cambiar-bombilla"
  MODELO = "Opel Astra"
  MODELOUPPER = "OPEL ASTRA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Opel Astra. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Opel Astra (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Opel Astra es uno de los compactos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Opel Astra es uno de los compactos m&aacute;s vendidos en Espa&ntilde;a y un coche muy habitual en las carreteras. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones J y K, a&ntilde;os 2009-2026). El acceso al faro es aceptable pero ajustado en el lado del conductor."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos &uacute;ltimas generaciones del Opel Astra comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Opel Astra J:</strong> a&ntilde;os 2009-2015.</li>
<li><strong>Opel Astra K:</strong> a&ntilde;os 2015-2026.</li>
</ul>
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
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro 10 minutos. En el Astra K, el lado del conductor tiene menos espacio por el dep&oacute;sito del limpiaparabrisas. Las versiones con faros LED o bi-xen&oacute;n no llevan bombillas reemplazables.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora del faro|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica y extrae la bombilla|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Opel</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos:</strong> usa guantes de algod&oacute;n.</li>
<li><strong>Forzar la bombilla:</strong> solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible:</strong> si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una:</strong> cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa:</strong> entra humedad y se empa&ntilde;an los faros.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. El uso urbano intensivo con muchos encendidos y apagados acorta la vida de las bombillas.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Opel Astra?</h3>
<p>Las versiones hal&oacute;genas del Astra J y K usan <strong>H7</strong> para cruce y carretera, y <strong>W5W</strong> para posici&oacute;n. Las versiones con faros LED o bi-xen&oacute;n no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor, ajustado en el lado del conductor. Ahorro de 40-70 &euro;."
  RELATED = '<a href="/mecanica/opel-astra-cambiar-bombilla">Cambiar la bombilla del Opel Astra</a>
  <a href="/mecanica/opel-mokka-cambiar-bombilla">Cambiar la bombilla del Opel Mokka</a>
  <a href="/mecanica/opel-grandland-cambiar-bombilla">Cambiar la bombilla del Opel Grandland</a>'
  SCHEMA = New-Schema -tipo "Opel Astra" -slug "opel-astra-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Opel Astra?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 2. OPEL GRANDLAND ----------
$fichas += @{
  Archivo = "opel-grandland-cambiar-bombilla.html"
  SLUG = "opel-grandland-cambiar-bombilla"
  MODELO = "Opel Grandland"
  MODELOUPPER = "OPEL GRANDLAND"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Opel Grandland. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Opel Grandland (Gu&iacute;a 2026)"
  TIEMPO = "25-40"
  LEAD = "El Opel Grandland (antes Grandland X) es uno de los SUV compactos m&aacute;s vendidos. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "55-90"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25-40"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Opel Grandland (antes Grandland X) es uno de los SUV compactos m&aacute;s vendidos en Espa&ntilde;a por su confort, equipamiento y buena relaci&oacute;n calidad-precio. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones X y actual, a&ntilde;os 2017-2026)."
  VERSIONES = @'
<ul>
<li><strong>Opel Grandland X (2017-2021):</strong> motores 1.2 Turbo, 1.6 Turbo, 1.5/1.6 di&eacute;sel y 1.6 Hybrid4 (PHEV).</li>
<li><strong>Opel Grandland (2021-2026):</strong> motores 1.2 Turbo, 1.5 di&eacute;sel y 1.6 Hybrid (PHEV).</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (Ultimate, Innovation) no llevan bombillas reemplazables.</p>
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
  <strong>Atenci&oacute;n:</strong> En el Grandland el espacio es ajustado por el dise&ntilde;o compacto del vano motor. En el lado del conductor puede ser necesaria una linterna y paciencia. En el Grandland Hybrid (PHEV), <strong>nunca toques los cables naranjas de alta tensi&oacute;n</strong>.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Localiza el conector el&eacute;ctrico|La H7 va sujeta por grapa met&aacute;lica con pesta&ntilde;a de seguridad lateral.',
    'Desconecta el conector|Presiona la pesta&ntilde;a y tira del conector, nunca del cable.',
    'Suelta la grapa met&aacute;lica|Presiona los dos extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla fundida|Tira recto hacia afuera con un pa&ntilde;o limpio.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector|Empuja hasta o&iacute;r un "clic".',
    'Cierra la tapa protectora|Aseg&uacute;rate de que la junta de goma sella bien.',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo (2 bombillas)</td><td>12-30 &euro;</td><td>25-40 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>50-80 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Opel</td><td>70-110 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla.</strong> La H7 solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector interior.</strong> Es muy delicado.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes, humedad y calor del vano motor influyen.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Opel Grandland?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Puedo cambiar la bombilla si mi Grandland es h&iacute;brido?</h3>
<p>Solo si tiene faros hal&oacute;genos. Si tiene LED, no hay bombillas reemplazables. <strong>Nunca toques los cables naranjas</strong>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso ajustado, especialmente en el lado del conductor. Ahorro de 55-90 &euro;. En el h&iacute;brido, <strong>nunca toques los cables naranjas</strong>."
  RELATED = '<a href="/mecanica/opel-grandland-cambiar-bombilla">Cambiar la bombilla del Opel Grandland</a>
  <a href="/mecanica/opel-mokka-cambiar-bombilla">Cambiar la bombilla del Opel Mokka</a>
  <a href="/mecanica/opel-astra-cambiar-bombilla">Cambiar la bombilla del Opel Astra</a>'
  SCHEMA = New-Schema -tipo "Opel Grandland" -slug "opel-grandland-cambiar-bombilla" -tiempo "PT30M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Opel Grandland?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 3. OPEL MOKKA ----------
$fichas += @{
  Archivo = "opel-mokka-cambiar-bombilla.html"
  SLUG = "opel-mokka-cambiar-bombilla"
  MODELO = "Opel Mokka"
  MODELOUPPER = "OPEL MOKKA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Opel Mokka. Referencias H7, herramientas, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Opel Mokka (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El Opel Mokka es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "45-75"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20-30"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Opel Mokka es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Su dise&ntilde;o llamativo y su equipamiento lo han convertido en un &eacute;xito comercial. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. El acceso al faro es ajustado, especialmente en el lado del conductor. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones A y B, a&ntilde;os 2012-2026)."
  VERSIONES = @'
<ul>
<li><strong>Opel Mokka A (2012-2019):</strong> motores 1.4, 1.6, 1.7 CDTi y 1.6 CDTi.</li>
<li><strong>Opel Mokka B (2020-2026):</strong> motores 1.2 Turbo, 1.5 di&eacute;sel y Mokka-e (el&eacute;ctrico).</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> o <strong>IntelliLux LED</strong> no llevan bombillas reemplazables.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Antes de empezar:</strong> En el Mokka el acceso al faro izquierdo es muy ajustado por la caja de fusibles. Apaga el motor y deja enfriar el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa y extrae la bombilla|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende y comprueba|Verifica todas las luces.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>12-30 &euro;</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>45-70 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Opel</td><td>65-100 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla.</strong> Solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector interior.</strong> Se raya con facilidad.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Opel Mokka?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso ajustado en el lado del conductor. Ahorro de 45-75 &euro;."
  RELATED = '<a href="/mecanica/opel-mokka-cambiar-bombilla">Cambiar la bombilla del Opel Mokka</a>
  <a href="/mecanica/opel-astra-cambiar-bombilla">Cambiar la bombilla del Opel Astra</a>
  <a href="/mecanica/opel-grandland-cambiar-bombilla">Cambiar la bombilla del Opel Grandland</a>'
  SCHEMA = New-Schema -tipo "Opel Mokka" -slug "opel-mokka-cambiar-bombilla" -tiempo "PT25M" -coste "15" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Opel Mokka?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 4. PEUGEOT 2008 ----------
$fichas += @{
  Archivo = "peugeot-2008-cambiar-bombilla.html"
  SLUG = "peugeot-2008-cambiar-bombilla"
  MODELO = "Peugeot 2008"
  MODELOUPPER = "PEUGEOT 2008"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Peugeot 2008. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Peugeot 2008 (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Peugeot 2008 es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Peugeot 2008 es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a por su dise&ntilde;o y su buena relaci&oacute;n calidad-precio. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones I y II, a&ntilde;os 2013-2026). En el 2008 II el faro est&aacute; muy pegado a la aleta, el acceso es limitado."
  VERSIONES = @'
<ul>
<li><strong>Peugeot 2008 I:</strong> a&ntilde;os 2013-2019.</li>
<li><strong>Peugeot 2008 II:</strong> a&ntilde;os 2019-2026. Incluye versi&oacute;n e-2008 (el&eacute;ctrico).</li>
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
  <strong>Antes de empezar:</strong> En el Peugeot 2008 II el faro est&aacute; muy pegado a la aleta, por lo que el acceso es limitado. En el e-2008 el&eacute;ctrico, <strong>nunca toques los cables naranjas</strong>. Apaga el motor y deja enfriar el faro 10 minutos antes de empezar.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica y extrae la bombilla|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Peugeot</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla.</strong> Solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Peugeot 2008?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso limitado en el 2008 II (faro pegado a la aleta). Ahorro de 40-70 &euro;. En el e-2008, <strong>nunca toques los cables naranjas</strong>."
  RELATED = '<a href="/mecanica/peugeot-2008-cambiar-bombilla">Cambiar la bombilla del Peugeot 2008</a>
  <a href="/mecanica/peugeot-208-cambiar-bombilla">Cambiar la bombilla del Peugeot 208</a>
  <a href="/mecanica/peugeot-308-cambiar-bombilla">Cambiar la bombilla del Peugeot 308</a>'
  SCHEMA = New-Schema -tipo "Peugeot 2008" -slug "peugeot-2008-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Peugeot 2008?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 5. PEUGEOT 208 ----------
$fichas += @{
  Archivo = "peugeot-208-cambiar-bombilla.html"
  SLUG = "peugeot-208-cambiar-bombilla"
  MODELO = "Peugeot 208"
  MODELOUPPER = "PEUGEOT 208"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Peugeot 208. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Peugeot 208 (Gu&iacute;a 2026)"
  TIEMPO = "20"
  LEAD = "El Peugeot 208 es uno de los utilitarios m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Peugeot 208 es uno de los utilitarios m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones I y II, a&ntilde;os 2012-2026). El acceso al faro es algo justo, especialmente en el lado del acompa&ntilde;ante."
  VERSIONES = @'
<ul>
<li><strong>Peugeot 208 I:</strong> a&ntilde;os 2012-2019.</li>
<li><strong>Peugeot 208 II:</strong> a&ntilde;os 2019-2026. Incluye versi&oacute;n e-208 (el&eacute;ctrico).</li>
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
  <strong>Antes de empezar:</strong> En el Peugeot 208 el acceso al faro derecho puede ser complicado por la presencia de la caja de fusibles y el dep&oacute;sito del l&iacute;quido limpiaparabrisas. En el e-208 el&eacute;ctrico, <strong>nunca toques los cables naranjas</strong>. Apaga el motor y deja enfriar el faro 10 minutos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica y extrae la bombilla|Tira recto hacia afuera con un pa&ntilde;o limpio.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-12 &euro;</td><td>20 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Peugeot</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla.</strong> Solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. El uso urbano intensivo acorta la vida de las bombillas.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Peugeot 208?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso algo justo en el lado del acompa&ntilde;ante. Ahorro de 40-60 &euro;. En el e-208, <strong>nunca toques los cables naranjas</strong>."
  RELATED = '<a href="/mecanica/peugeot-208-cambiar-bateria">Cambiar la bater&iacute;a del Peugeot 208</a>
  <a href="/mecanica/peugeot-208-cambiar-bombilla">Cambiar la bombilla del Peugeot 208</a>
  <a href="/mecanica/peugeot-2008-cambiar-bombilla">Cambiar la bombilla del Peugeot 2008</a>'
  SCHEMA = New-Schema -tipo "Peugeot 208" -slug "peugeot-208-cambiar-bombilla" -tiempo "PT20M" -coste "8" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Peugeot 208?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 6. PEUGEOT 308 ----------
$fichas += @{
  Archivo = "peugeot-308-cambiar-bombilla.html"
  SLUG = "peugeot-308-cambiar-bombilla"
  MODELO = "Peugeot 308"
  MODELOUPPER = "PEUGEOT 308"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Peugeot 308. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Peugeot 308 (Gu&iacute;a 2026)"
  TIEMPO = "25-35"
  LEAD = "El Peugeot 308 es uno de los compactos m&aacute;s vendidos en Europa. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "50-80"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25-35"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Peugeot 308 es uno de los compactos m&aacute;s vendidos en Europa. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones II T9 y III P5, a&ntilde;os 2013-2026). El lado del conductor es el m&aacute;s complicado por el poco espacio."
  VERSIONES = @'
<ul>
<li><strong>Peugeot 308 II (T9):</strong> a&ntilde;os 2013-2021. Motores 1.2 PureTech y 1.5/1.6 BlueHDi.</li>
<li><strong>Peugeot 308 III (P5):</strong> a&ntilde;os 2021-2026. Solo versiones con faros hal&oacute;genos (GT y GT Pack llevan Full LED).</li>
</ul>
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
  <strong>Antes de empezar:</strong> El lado del conductor es el m&aacute;s complicado por el dep&oacute;sito del l&iacute;quido limpiaparabrisas y la caja de fusibles. Ten paciencia y usa linterna. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana.',
    'Retira la tapa protectora del faro|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Localiza el conector el&eacute;ctrico|La H7 va sujeta con grapa met&aacute;lica y pesta&ntilde;a lateral.',
    'Desconecta el conector|Presiona la pesta&ntilde;a y tira del conector, nunca del cable.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla fundida|Tira recto hacia afuera con un pa&ntilde;o limpio.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector|Empuja hasta o&iacute;r un "clic".',
    'Cierra la tapa protectora|Aseg&uacute;rate de que la junta de goma sella bien.',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo (2 bombillas)</td><td>12-30 &euro;</td><td>25-35 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>45-70 &euro;</td><td>45-60 minutos</td></tr>
<tr><td>Concesionario oficial Peugeot</td><td>65-95 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla.</strong> La H7 solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector interior.</strong> Es muy delicado.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. Los encendidos frecuentes acortan la vida &uacute;til.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Peugeot 308?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-35 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Puedo poner LED?</h3>
<p>No, es modificaci&oacute;n no autorizada. Defecto grave en ITV.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso complicado en el lado del conductor. Ahorro de 50-80 &euro;. Cambiar a LED es <strong>modificaci&oacute;n no autorizada</strong>."
  RELATED = '<a href="/mecanica/peugeot-208-cambiar-bombilla">Cambiar la bombilla del Peugeot 208</a>
  <a href="/mecanica/peugeot-2008-cambiar-bombilla">Cambiar la bombilla del Peugeot 2008</a>'
  SCHEMA = New-Schema -tipo "Peugeot 308" -slug "peugeot-308-cambiar-bombilla" -tiempo "PT30M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Peugeot 308?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-35 minutos.',
    '\u00bfPuedo poner LED?|No, es modificaci\u00f3n no autorizada.'
  )
}

# ---------- 7. RENAULT AUSTRAL ----------
$fichas += @{
  Archivo = "renault-austral-cambiar-bombilla.html"
  SLUG = "renault-austral-cambiar-bombilla"
  MODELO = "Renault Austral"
  MODELOUPPER = "RENAULT AUSTRAL"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Renault Austral. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Renault Austral (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El Renault Austral es uno de los SUV compactos m&aacute;s recientes de Renault. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "55-90"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20-30"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Renault Austral es uno de los SUV compactos m&aacute;s recientes de Renault y una apuesta fuerte por la hibridaci&oacute;n. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. El Austral comparte plataforma con el Nissan Qashqai, as&iacute; que el acceso al faro es ajustado pero factible. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (a&ntilde;os 2022-2026)."
  VERSIONES = @'
<ul>
<li><strong>Renault Austral (2022-2026):</strong> motores 1.2 TCe mild-hybrid, 1.3 TCe mild-hybrid y 1.2 E-Tech full hybrid.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (Techno, Iconic, Esprit Alpine) no llevan bombillas reemplazables. Las versiones con hal&oacute;genos (Evolution) s&iacute;.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Antes de empezar:</strong> El Austral comparte plataforma con el Nissan Qashqai J12, as&iacute; que el acceso al faro es similar. Apaga el motor y deja enfriar el faro 10 minutos. En las versiones h&iacute;bridas, <strong>nunca toques los cables naranjas</strong> de alta tensi&oacute;n.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa y extrae la bombilla|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>12-30 &euro;</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>50-80 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Renault</td><td>70-110 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla.</strong> Solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector interior.</strong> Se raya con facilidad.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen. El Austral h&iacute;brido no tiene motor de arranque tradicional, lo que reduce vibraciones pero no la frecuencia de encendido de luces.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Renault Austral?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso ajustado por plataforma compartida con Qashqai. Ahorro de 55-90 &euro;. En h&iacute;bridos, <strong>nunca toques los cables naranjas</strong>."
  RELATED = '<a href="/mecanica/renault-austral-cambiar-bombilla">Cambiar la bombilla del Renault Austral</a>
  <a href="/mecanica/renault-captur-cambiar-bombilla">Cambiar la bombilla del Renault Captur</a>
  <a href="/mecanica/renault-clio-cambiar-bombilla">Cambiar la bombilla del Renault Clio</a>'
  SCHEMA = New-Schema -tipo "Renault Austral" -slug "renault-austral-cambiar-bombilla" -tiempo "PT25M" -coste "15" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Renault Austral?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 8. RENAULT CAPTUR ----------
$fichas += @{
  Archivo = "renault-captur-cambiar-bombilla.html"
  SLUG = "renault-captur-cambiar-bombilla"
  MODELO = "Renault Captur"
  MODELOUPPER = "RENAULT CAPTUR"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Renault Captur. Referencias H7, herramientas, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Renault Captur (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El Renault Captur es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "55-90"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20-30"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Renault Captur es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones I J87 y II JB, a&ntilde;os 2013-2026). El acceso al faro es algo ajustado, especialmente en el lado del conductor."
  VERSIONES = @'
<ul>
<li><strong>Renault Captur I (J87):</strong> a&ntilde;os 2013-2019. Motores 0.9 TCe, 1.2 TCe, 1.5 dCi.</li>
<li><strong>Renault Captur II (JB):</strong> a&ntilde;os 2019-2026. Motores 1.0 TCe, 1.3 TCe, 1.5 Blue dCi, 1.6 E-Tech Hybrid.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (Intens, Initiale Paris, RS Line) no llevan bombillas reemplazables. Las versiones con hal&oacute;genos (Life, Zen) s&iacute;.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Antes de empezar:</strong> El Captur comparte plataforma con el Clio IV y V. Apaga el motor y deja enfriar el faro 10 minutos. En versiones h&iacute;bridas, <strong>nunca toques los cables naranjas</strong>.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa y extrae la bombilla|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica todas las luces.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>12-30 &euro;</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>50-80 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Renault</td><td>70-110 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla.</strong> Solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector interior.</strong> Se raya con facilidad.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Renault Captur?</h3>
<p>Las versiones hal&oacute;genas usan <strong>H7</strong> para cruce y carretera, y <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso algo justo en el lado del conductor. Ahorro de 55-90 &euro;. En h&iacute;bridos, <strong>nunca toques los cables naranjas</strong>."
  RELATED = '<a href="/mecanica/renault-captur-cambiar-bateria">Cambiar la bater&iacute;a del Renault Captur</a>
  <a href="/mecanica/renault-captur-cambiar-bombilla">Cambiar la bombilla del Renault Captur</a>
  <a href="/mecanica/renault-clio-cambiar-bombilla">Cambiar la bombilla del Renault Clio</a>'
  SCHEMA = New-Schema -tipo "Renault Captur" -slug "renault-captur-cambiar-bombilla" -tiempo "PT25M" -coste "15" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Renault Captur?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 9. RENAULT CLIO ----------
$fichas += @{
  Archivo = "renault-clio-cambiar-bombilla.html"
  SLUG = "renault-clio-cambiar-bombilla"
  MODELO = "Renault Clio"
  MODELOUPPER = "RENAULT CLIO"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Renault Clio. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Renault Clio (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El Renault Clio es uno de los coches m&aacute;s vendidos en Europa. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "45-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20-30"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Renault Clio es uno de los coches m&aacute;s vendidos en Europa. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones III X85, IV X98 y V BJA, a&ntilde;os 2005-2026). El acceso al faro es c&oacute;modo, salvo en el lado del conductor que tiene menos espacio."
  VERSIONES = @'
<ul>
<li><strong>Renault Clio III (X85):</strong> a&ntilde;os 2005-2012.</li>
<li><strong>Renault Clio IV (X98):</strong> a&ntilde;os 2012-2019. Motores 1.2 TCe, 1.5 dCi.</li>
<li><strong>Renault Clio V (BJA):</strong> a&ntilde;os 2019-2026. Motores 1.0 SCe, 1.0 TCe, 1.5 Blue dCi y E-Tech h&iacute;brido.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> del Clio V no llevan bombillas reemplazables.</p>
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
  <strong>Antes de empezar:</strong> En el Clio IV y V, el acceso al faro izquierdo es m&aacute;s ajustado por el dep&oacute;sito del l&iacute;quido limpiaparabrisas. Apaga el motor y deja enfriar el faro 10 minutos. En el Clio E-Tech h&iacute;brido, <strong>nunca toques los cables naranjas</strong>.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla fundida|Tira recto hacia afuera con un pa&ntilde;o limpio.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector|Empuja hasta o&iacute;r un "clic".',
    'Cierra la tapa protectora|Aseg&uacute;rate de que la junta sella bien.',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo (2 bombillas)</td><td>12-30 &euro;</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Renault</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla.</strong> La H7 solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector interior.</strong> Se raya con facilidad.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen. El uso urbano intensivo acorta la vida &uacute;til.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Renault Clio?</h3>
<p>Las versiones hal&oacute;genas usan <strong>H7</strong> para cruce y carretera, y <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Puedo cambiar la bombilla de un Clio E-Tech h&iacute;brido?</h3>
<p>Si tu versi&oacute;n tiene faros hal&oacute;genos s&iacute;. Si tiene LED, no hay bombillas reemplazables. <strong>Nunca toques los cables naranjas</strong>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso c&oacute;modo salvo en el lado del conductor. Ahorro de 45-70 &euro;. En h&iacute;bridos, <strong>nunca toques los cables naranjas</strong>."
  RELATED = '<a href="/mecanica/renault-clio-cambiar-bateria">Cambiar la bater&iacute;a del Renault Clio</a>
  <a href="/mecanica/renault-clio-cambiar-escobillas">Cambiar las escobillas del Renault Clio</a>
  <a href="/mecanica/renault-clio-cambiar-bombilla">Cambiar la bombilla del Renault Clio</a>'
  SCHEMA = New-Schema -tipo "Renault Clio" -slug "renault-clio-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Renault Clio?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 10. RENAULT MEGANE ----------
$fichas += @{
  Archivo = "renault-megane-cambiar-bombilla.html"
  SLUG = "renault-megane-cambiar-bombilla"
  MODELO = "Renault Megane"
  MODELOUPPER = "RENAULT MEGANE"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Renault Megane. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Renault Megane (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Renault Megane es uno de los compactos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Renault Megane es uno de los compactos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones III y IV, a&ntilde;os 2008-2026). El acceso al faro est&aacute; muy justo, especialmente en las versiones con faros bi-xen&oacute;n."
  VERSIONES = @'
<ul>
<li><strong>Renault Megane III:</strong> a&ntilde;os 2008-2016.</li>
<li><strong>Renault Megane IV:</strong> a&ntilde;os 2016-2026. Incluye versi&oacute;n E-Tech Plug-in.</li>
</ul>
<p>Las versiones con faros <strong>LED</strong> o <strong>bi-xen&oacute;n</strong> no llevan bombillas reemplazables.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Atenci&oacute;n:</strong> En el Megane III el acceso al faro est&aacute; muy justo por el dep&oacute;sito del l&iacute;quido limpiaparabrisas y el filtro del aire. En algunos casos es necesario soltar parcialmente el parachoques. Apaga el motor y deja enfriar el faro 10 minutos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora del faro|G&iacute;rala un cuarto de vuelta o suelta las pesta&ntilde;as con cuidado.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica y extrae la bombilla|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Renault</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Forzar la tapa sin desmontar accesorios:</strong> puedes romper las pesta&ntilde;as o rayar el faro.</li>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. En el Megane, el calor del motor y el poco espacio contribuyen al envejecimiento prematuro.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Renault Megane?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED o bi-xen&oacute;n no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el parachoques?</h3>
<p>En muchos casos s&iacute;. En el lado del conductor puede ser necesario soltar el parachoques parcialmente.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso complicado en el lado del conductor. Ahorro de 40-70 &euro;. Las versiones con bi-xen&oacute;n o LED no llevan bombillas reemplazables."
  RELATED = '<a href="/mecanica/renault-megane-cambiar-bombilla">Cambiar la bombilla del Renault Megane</a>
  <a href="/mecanica/renault-clio-cambiar-bombilla">Cambiar la bombilla del Renault Clio</a>
  <a href="/mecanica/renault-captur-cambiar-bombilla">Cambiar la bombilla del Renault Captur</a>'
  SCHEMA = New-Schema -tipo "Renault Megane" -slug "renault-megane-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Renault Megane?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar el parachoques?|En muchos casos s\u00ed.'
  )
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
  Write-Host "  mag-mec-step-num: $pasosOK"
  
  if ($placeholders -gt 0) { $avisos++ } else { $generados++ }
}

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "Generados: $generados de 10" -ForegroundColor Green
Write-Host "Con avisos: $avisos" -ForegroundColor Yellow
Write-Host "Backup: $bk" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

Start-Process "http://localhost:8000/mecanica/opel-astra-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/opel-grandland-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/opel-mokka-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/peugeot-2008-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/peugeot-208-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/peugeot-308-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/renault-austral-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/renault-captur-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/renault-clio-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/renault-megane-cambiar-bombilla.html"