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
    $titulo = $parts[0]
    $cuerpo = $parts[1]
    $html += @"
<div class="mag-mec-step">
  <span class="mag-mec-step-num">$n</span>
  <div class="mag-mec-step-body">
    <strong>$titulo</strong>
    <p>$cuerpo</p>
  </div>
</div>

"@
    $n++
  }
  return $html.TrimEnd()
}

function New-Schema {
  param($tipo,$modelo,$slug,$slugSimple,$tiempo,$coste,$pasosParaSchema,$faqs)
  $stepsJson = ""
  $n = 1
  foreach ($p in $pasosParaSchema) {
    $parts = $p -split '\|',2
    $stepsJson += "{`"@type`":`"HowToStep`",`"name`":`"$($parts[0])`",`"text`":`"$($parts[1])`"},"
    $n++
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

# ---------- 1. FORD FOCUS ----------
$fichas += @{
  Archivo = "ford-focus-cambiar-bombilla.html"
  SLUG = "ford-focus-cambiar-bombilla"
  MODELO = "Ford Focus"
  MODELOUPPER = "FORD FOCUS"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Ford Focus. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Ford Focus (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Ford Focus es uno de los compactos m&aacute;s vendidos en Europa. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Ford Focus es uno de los compactos m&aacute;s vendidos en Europa y un habitual de las carreteras espa&ntilde;olas. Su punto d&eacute;bil son las bombillas hal&oacute;genas H7, que se funden con cierta frecuencia y provocan un rechazo seguro en la ITV por defecto grave. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones III y IV, a&ntilde;os 2011-2026). El acceso al faro es bastante justo, especialmente en el lado del conductor."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos &uacute;ltimas generaciones del Ford Focus comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Ford Focus III:</strong> a&ntilde;os 2011-2018.</li>
<li><strong>Ford Focus IV:</strong> a&ntilde;os 2018-2026.</li>
</ul>
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
  <strong>Antes de empezar:</strong> En el Focus III y IV el acceso al faro est&aacute; muy justo, especialmente en el lado del conductor por la caja de fusibles y el dep&oacute;sito del l&iacute;quido limpiaparabrisas. En algunos casos necesitar&aacute;s soltar el parachoques parcialmente. Apaga el motor y deja enfriar el faro 10 minutos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana. Abre el cap&oacute; y localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario o suelta las pesta&ntilde;as con cuidado.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a de seguridad lateral y tira suavemente del conector.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala. Tira de la bombilla recta hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n, col&oacute;cala en la misma posici&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Empuja hasta o&iacute;r un "clic". Coloca la tapa protectora.',
    'Enciende y comprueba|Arranca el coche y verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Ford</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Forzar la tapa sin desmontar accesorios:</strong> puedes romper las pesta&ntilde;as.</li>
<li><strong>Tocar el cristal con los dedos:</strong> usa guantes de algod&oacute;n.</li>
<li><strong>No revisar el fusible:</strong> si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una:</strong> cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa:</strong> entra humedad y se empa&ntilde;an los faros.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. En el Focus, el calor del motor y el poco espacio contribuyen al envejecimiento prematuro.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Ford Focus?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el parachoques?</h3>
<p>En muchos casos s&iacute;, retirando la tapa trasera del faro. En el lado del conductor puede ser necesario soltar el parachoques parcialmente.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave</strong>. Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso justo en el lado del conductor. Ahorro de 40-70 &euro;. Una bombilla fundida es <strong>defecto grave</strong> en la ITV."
  RELATED = '<a href="/mecanica/ford-puma-cambiar-bombilla">Cambiar la bombilla del Ford Puma</a>
  <a href="/mecanica/ford-fiesta-cambiar-escobillas">Cambiar las escobillas del Ford Fiesta</a>'
  SCHEMA = New-Schema -tipo "Ford Focus" -slug "ford-focus-cambiar-bombilla" -slugSimple "ford-focus-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Ford Focus?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar el parachoques?|En muchos casos s\u00ed.'
  )
}

# ---------- 2. FORD PUMA ----------
$fichas += @{
  Archivo = "ford-puma-cambiar-bombilla.html"
  SLUG = "ford-puma-cambiar-bombilla"
  MODELO = "Ford Puma"
  MODELOUPPER = "FORD PUMA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Ford Puma. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Ford Puma (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El Ford Puma es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "45-75"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20-30"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Ford Puma es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a por su dise&ntilde;o deportivo, su din&aacute;mica &aacute;gil y su maletero MegaBox. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarlas (J2K, a&ntilde;os 2019-2026)."
  VERSIONES = @'
<ul>
<li><strong>Ford Puma (J2K):</strong> a&ntilde;os 2019-2026. Motores 1.0 EcoBoost (mild hybrid), 1.5 EcoBoost ST y 1.5 EcoBlue di&eacute;sel.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (Titanium, ST-Line X, ST) no llevan bombillas reemplazables. Las de hal&oacute;genos (Trend, Titanium b&aacute;sico) s&iacute;.</p>
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
  <strong>Antes de empezar:</strong> Enfr&iacute;a el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos. El vano motor del Puma es compacto, ten paciencia y usa linterna.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira del conector, nunca del cable.',
    'Suelta la grapa met&aacute;lica|Presiona los dos extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla fundida|Tira recto hacia afuera con un pa&ntilde;o limpio.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector|Empuja hasta o&iacute;r un "clic".',
    'Cierra la tapa|G&iacute;rala un cuarto de vuelta en sentido horario.',
    'Enciende y comprueba|Arranca y verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo (2 bombillas)</td><td>12-30 &euro;</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-70 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Ford</td><td>60-95 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla.</strong> Solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector.</strong> El interior del faro se raya con facilidad.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen. El uso urbano intensivo acorta la vida &uacute;til.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Ford Puma?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Puedo poner LED?</h3>
<p>No, es modificaci&oacute;n no autorizada. Defecto grave en ITV.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor. Ahorro de 45-75 &euro;. Cambiar a LED es <strong>modificaci&oacute;n no autorizada</strong>."
  RELATED = '<a href="/mecanica/ford-focus-cambiar-bombilla">Cambiar la bombilla del Ford Focus</a>
  <a href="/mecanica/ford-fiesta-cambiar-escobillas">Cambiar las escobillas del Ford Fiesta</a>'
  SCHEMA = New-Schema -tipo "Ford Puma" -slug "ford-puma-cambiar-bombilla" -slugSimple "ford-puma-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Ford Puma?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfPuedo poner LED?|No, es modificaci\u00f3n no autorizada.'
  )
}

# ---------- 3. HONDA CIVIC ----------
$fichas += @{
  Archivo = "honda-civic-cambiar-bombilla.html"
  SLUG = "honda-civic-cambiar-bombilla"
  MODELO = "Honda Civic"
  MODELOUPPER = "HONDA CIVIC"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Honda Civic. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Honda Civic (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Honda Civic es uno de los compactos m&aacute;s fiables del mercado. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Honda Civic es uno de los compactos m&aacute;s fiables del mercado. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarlas (generaciones FK y FL, a&ntilde;os 2012-2026). El acceso al faro es algo justo, sobre todo en el lado del conductor."
  VERSIONES = @'
<ul>
<li><strong>Honda Civic FK:</strong> a&ntilde;os 2012-2017.</li>
<li><strong>Honda Civic FL:</strong> a&ntilde;os 2017-2026.</li>
</ul>
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
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa met&aacute;lica y extrae|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Honda</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
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
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Honda Civic?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave</strong>. Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor, algo justo en el lado del conductor. Ahorro de 40-70 &euro;."
  RELATED = '<a href="/mecanica/honda-civic-cambiar-bombilla">Cambiar la bombilla del Honda Civic</a>'
  SCHEMA = New-Schema -tipo "Honda Civic" -slug "honda-civic-cambiar-bombilla" -slugSimple "honda-civic-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Honda Civic?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 4. HYUNDAI BAYON ----------
$fichas += @{
  Archivo = "hyundai-bayon-cambiar-bombilla.html"
  SLUG = "hyundai-bayon-cambiar-bombilla"
  MODELO = "Hyundai Bayon"
  MODELOUPPER = "HYUNDAI BAYON"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Hyundai Bayon. Referencias H7, herramientas, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Hyundai Bayon (Gu&iacute;a 2026)"
  TIEMPO = "15-25"
  LEAD = "El Hyundai Bayon es el SUV urbano m&aacute;s peque&ntilde;o de Hyundai y uno de los m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "15-25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Hyundai Bayon es el SUV urbano m&aacute;s peque&ntilde;o de Hyundai y uno de los coches m&aacute;s vendidos en Espa&ntilde;a desde 2021. Comparte plataforma con el i20, y el acceso al faro es sencillo. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (a&ntilde;os 2021-2026)."
  VERSIONES = @'
<ul>
<li><strong>Hyundai Bayon (2021-2026):</strong> motores 1.0 T-GDi (100 CV) y 1.0 T-GDi 48V mild-hybrid (100 y 120 CV).</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (Klass, Style) no llevan bombillas reemplazables. Las de hal&oacute;genos (Essence) s&iacute;.</p>
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
  <strong>Antes de empezar:</strong> Enfr&iacute;a el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos. El Bayon comparte plataforma con el i20 (BC3), as&iacute; que el proceso es muy similar.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y abre el cap&oacute;.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa met&aacute;lica y extrae la bombilla|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-15 &euro;</td><td>15-25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Hyundai</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla.</strong> Solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector.</strong> Es delicado.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Hyundai Bayon?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>15-25 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor, muy sencillo. Ahorro de 40-60 &euro;."
  RELATED = '<a href="/mecanica/hyundai-tucson-cambiar-bombilla">Cambiar la bombilla del Hyundai Tucson</a>
  <a href="/mecanica/hyundai-kona-cambiar-bateria">Cambiar la bater&iacute;a del Hyundai Kona</a>'
  SCHEMA = New-Schema -tipo "Hyundai Bayon" -slug "hyundai-bayon-cambiar-bombilla" -slugSimple "hyundai-bayon-cambiar-bombilla" -tiempo "PT20M" -coste "12" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Hyundai Bayon?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|15-25 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 5. HYUNDAI TUCSON ----------
$fichas += @{
  Archivo = "hyundai-tucson-cambiar-bombilla.html"
  SLUG = "hyundai-tucson-cambiar-bombilla"
  MODELO = "Hyundai Tucson"
  MODELOUPPER = "HYUNDAI TUCSON"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Hyundai Tucson. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Hyundai Tucson (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Hyundai Tucson es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. El acceso es complicado y puede requerir desmontar la caja del filtro de aire."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "50-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Hyundai Tucson es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. El acceso al faro est&aacute; muy justo, especialmente en el lado del conductor, donde puede ser necesario desmontar la caja del filtro de aire. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones TL y NX4, a&ntilde;os 2015-2026)."
  VERSIONES = @'
<ul>
<li><strong>Hyundai Tucson TL:</strong> a&ntilde;os 2015-2020.</li>
<li><strong>Hyundai Tucson NX4:</strong> a&ntilde;os 2020-2026.</li>
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
  <strong>Atenci&oacute;n:</strong> En el lado del conductor puede ser necesario desmontar la caja del filtro de aire para acceder a la tapa del faro. Si no te ves seguro, acude a un taller. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bombilla H7 hal&oacute;gena</strong> (idealmente dos)</li>
<li><strong>Bombilla W5W</strong></li>
<li><strong>Destornillador de estrella</strong></li>
<li><strong>Guantes de algod&oacute;n</strong></li>
<li><strong>Linterna frontal</strong></li>
</ul>
'@
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y abre el cap&oacute;.',
    'Desmonta la caja del filtro de aire (lado conductor)|Afloja los tornillos de la tapa y ret&iacute;rala. En algunos modelos tambi&eacute;n hay que soltar el tubo de admisi&oacute;n.',
    'Retira la tapa protectora del faro|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a de seguridad lateral y tira.',
    'Suelta la grapa met&aacute;lica y extrae la bombilla|Presiona los extremos hacia dentro y sep&aacute;rala. Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic". Cierra la tapa protectora.',
    'Vuelve a montar la caja del filtro y prueba|Aprieta los tornillos. Arranca y verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-60 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Hyundai</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Forzar la tapa sin desmontar la caja del filtro:</strong> puedes romper las pesta&ntilde;as o rayar el faro.</li>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No apretar bien los tornillos del filtro:</strong> puede provocar entradas de aire no filtrado.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. En el Tucson, el calor del motor y el poco espacio contribuyen al envejecimiento prematuro.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Hyundai Tucson?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos, seg&uacute;n el lado del faro.</p>
<h3>&iquest;Se puede cambiar sin desmontar la caja del filtro?</h3>
<p>En el lado del conductor normalmente no. En el del acompa&ntilde;ante a veces s&iacute;.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso complicado en el lado del conductor (puede requerir desmontar caja del filtro). Ahorro de 50-70 &euro;."
  RELATED = '<a href="/mecanica/hyundai-tucson-cambiar-escobillas">Cambiar las escobillas del Hyundai Tucson</a>
  <a href="/mecanica/hyundai-kona-cambiar-bateria">Cambiar la bater&iacute;a del Hyundai Kona</a>
  <a href="/mecanica/hyundai-bayon-cambiar-bombilla">Cambiar la bombilla del Hyundai Bayon</a>'
  SCHEMA = New-Schema -tipo "Hyundai Tucson" -slug "hyundai-tucson-cambiar-bombilla" -slugSimple "hyundai-tucson-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Desmontar caja de filtro|Afloja tornillos y retira.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Hyundai Tucson?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar la caja del filtro?|En el lado del conductor normalmente no.'
  )
}

# ---------- 6. KIA CEED ----------
$fichas += @{
  Archivo = "kia-ceed-cambiar-bombilla.html"
  SLUG = "kia-ceed-cambiar-bombilla"
  MODELO = "Kia Ceed"
  MODELOUPPER = "KIA CEED"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Kia Ceed. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Kia Ceed (Gu&iacute;a 2026)"
  TIEMPO = "20"
  LEAD = "El Kia Ceed es uno de los compactos m&aacute;s vendidos en Espa&ntilde;a por su garant&iacute;a de 7 a&ntilde;os. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Kia Ceed es uno de los compactos m&aacute;s vendidos en Espa&ntilde;a gracias a su garant&iacute;a de 7 a&ntilde;os y su buena relaci&oacute;n calidad-precio. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. El acceso al faro es bueno, as&iacute; que es una tarea asequible. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones JD y CD, a&ntilde;os 2012-2026)."
  VERSIONES = @'
<ul>
<li><strong>Kia Ceed JD:</strong> a&ntilde;os 2012-2018.</li>
<li><strong>Kia Ceed CD:</strong> a&ntilde;os 2018-2026.</li>
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
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa met&aacute;lica y extrae|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-12 &euro;</td><td>20 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Kia</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
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
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Kia Ceed?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor, sencillo. Ahorro de 40-60 &euro;."
  RELATED = '<a href="/mecanica/kia-sportage-cambiar-bombilla">Cambiar la bombilla del Kia Sportage</a>
  <a href="/mecanica/kia-sportage-cambiar-bateria">Cambiar la bater&iacute;a del Kia Sportage</a>
  <a href="/mecanica/kia-niro-cambiar-bateria">Cambiar la bater&iacute;a del Kia Niro</a>'
  SCHEMA = New-Schema -tipo "Kia Ceed" -slug "kia-ceed-cambiar-bombilla" -slugSimple "kia-ceed-cambiar-bombilla" -tiempo "PT20M" -coste "8" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Kia Ceed?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- 7. KIA SPORTAGE ----------
$fichas += @{
  Archivo = "kia-sportage-cambiar-bombilla.html"
  SLUG = "kia-sportage-cambiar-bombilla"
  MODELO = "Kia Sportage"
  MODELOUPPER = "KIA SPORTAGE"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Kia Sportage. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Kia Sportage (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El Kia Sportage es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "45-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20-30"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Kia Sportage es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a gracias a su buena relaci&oacute;n calidad-precio y su garant&iacute;a de 7 a&ntilde;os. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones SL, QL y NQ5, a&ntilde;os 2010-2026)."
  VERSIONES = @'
<ul>
<li><strong>Kia Sportage III (SL):</strong> a&ntilde;os 2010-2015.</li>
<li><strong>Kia Sportage IV (QL):</strong> a&ntilde;os 2016-2021.</li>
<li><strong>Kia Sportage V (NQ5):</strong> a&ntilde;os 2021-2026. Solo versiones con faros hal&oacute;genos.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> no llevan bombillas reemplazables. Si falla el m&oacute;dulo LED, hay que sustituirlo completo (500-1.000 &euro;).</p>
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
  <strong>Verifica la referencia exacta:</strong> algunas versiones del Sportage IV y V pueden llevar bombillas diferentes seg&uacute;n el mercado y el acabado. Mira la etiqueta de la bombilla vieja o consulta el manual antes de comprar.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y abre el cap&oacute;.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Localiza el conector el&eacute;ctrico|Dentro del faro, la H7 va sujeta con grapa met&aacute;lica y pesta&ntilde;a lateral.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira del conector, nunca del cable.',
    'Suelta la grapa met&aacute;lica|Presiona los dos extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla fundida|Tira recto hacia afuera con un pa&ntilde;o limpio.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector|Empuja hasta o&iacute;r un "clic".',
    'Cierra la tapa|G&iacute;rala un cuarto de vuelta en sentido horario.',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo (2 bombillas)</td><td>12-30 &euro;</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-70 &euro;</td><td>45-60 minutos</td></tr>
<tr><td>Concesionario oficial Kia</td><td>60-100 &euro;</td><td>1-2 horas (con cita)</td></tr>
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
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes, humedad y calor del vano motor influyen en su desgaste.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Kia Sportage?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Puedo poner LED?</h3>
<p>No, es modificaci&oacute;n no autorizada. Defecto grave en ITV.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor sin desmontar el faro. Ahorro de 45-70 &euro;. Cambiar a LED es <strong>modificaci&oacute;n no autorizada</strong>."
  RELATED = '<a href="/mecanica/kia-sportage-cambiar-bateria">Cambiar la bater&iacute;a del Kia Sportage</a>
  <a href="/mecanica/kia-sportage-cambiar-escobillas">Cambiar las escobillas del Kia Sportage</a>
  <a href="/mecanica/kia-ceed-cambiar-bombilla">Cambiar la bombilla del Kia Ceed</a>'
  SCHEMA = New-Schema -tipo "Kia Sportage" -slug "kia-sportage-cambiar-bombilla" -slugSimple "kia-sportage-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Kia Sportage?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfPuedo poner LED?|No, es modificaci\u00f3n no autorizada.'
  )
}

# ---------- 8. MG ZS ----------
$fichas += @{
  Archivo = "mg-zs-cambiar-bombilla.html"
  SLUG = "mg-zs-cambiar-bombilla"
  MODELO = "MG ZS"
  MODELOUPPER = "MG ZS"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del MG ZS. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del MG ZS (Gu&iacute;a 2026)"
  TIEMPO = "20"
  LEAD = "El MG ZS es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a por su excelente relaci&oacute;n calidad-precio. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El MG ZS es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a por su excelente relaci&oacute;n calidad-precio. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (a&ntilde;os 2017-2026)."
  VERSIONES = @'
<ul>
<li><strong>MG ZS (2017-2026):</strong> versiones gasolina 1.0 T-GDi, 1.5 VTi y el&eacute;ctrico ZS EV.</li>
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
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa met&aacute;lica y extrae|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>20 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial MG</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
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
<p>Vida &uacute;til media de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el MG ZS?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, se accede desde el vano motor.</p>
<h3>&iquest;Es obligatorio cambiar las dos?</h3>
<p>No, pero muy recomendable.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor sin desmontar el faro. Ahorro de 40-60 &euro;."
  RELATED = '<a href="/mecanica/mg-zs-cambiar-bombilla">Cambiar la bombilla del MG ZS</a>'
  SCHEMA = New-Schema -tipo "MG ZS" -slug "mg-zs-cambiar-bombilla" -slugSimple "mg-zs-cambiar-bombilla" -tiempo "PT20M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el MG ZS?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, se accede desde el vano motor.'
  )
}

# ---------- 9. NISSAN JUKE ----------
$fichas += @{
  Archivo = "nissan-juke-cambiar-bombilla.html"
  SLUG = "nissan-juke-cambiar-bombilla"
  MODELO = "Nissan Juke"
  MODELOUPPER = "NISSAN JUKE"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Nissan Juke. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Nissan Juke (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El Nissan Juke es uno de los SUV urbanos m&aacute;s reconocibles por su dise&ntilde;o con faros divididos. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "45-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20-30"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Nissan Juke es uno de los SUV urbanos m&aacute;s reconocibles por su dise&ntilde;o con faros divididos. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones F15 y F16, a&ntilde;os 2010-2026)."
  VERSIONES = @'
<ul>
<li><strong>Nissan Juke I (F15):</strong> a&ntilde;os 2010-2019. Motores 1.5 dCi, 1.6, 1.6 DIG-T y 1.6 Nismo.</li>
<li><strong>Nissan Juke II (F16):</strong> a&ntilde;os 2019-2026. Motores 1.0 DIG-T, 1.6 h&iacute;brido y 1.5 dCi.</li>
</ul>
<p>Si tu Juke tiene faros <strong>Full LED</strong> (versiones altas del Juke II), no hay bombillas reemplazables. En caso de fallo, hay que sustituir el m&oacute;dulo completo (500-900 &euro;).</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>6-15 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
<tr><td>Intermitente delantero</td><td>PY21W (en faro superior)</td><td>4-8 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Ojo con el dise&ntilde;o del Juke I:</strong> el frontal tiene 4 focos divididos (2 superiores con intermitentes y posici&oacute;n; 2 inferiores con cruce y carretera). Verifica cu&aacute;l tiene la bombilla fundida antes de comprar. En el Juke II el dise&ntilde;o es m&aacute;s convencional.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y localiza la parte trasera del faro.',
    'Retira la tapa protectora|En el Juke I es de goma con pesta&ntilde;as, en el Juke II de pl&aacute;stico con clips. G&iacute;rala un cuarto de vuelta.',
    'Localiza el conector el&eacute;ctrico|La H7 va sujeta por grapa met&aacute;lica con pesta&ntilde;a lateral.',
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
<tr><td>Hacerlo t&uacute; mismo (2 bombillas)</td><td>12-30 &euro;</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Nissan</td><td>60-95 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave.</li>
<li><strong>Equivocarte de faro.</strong> El Juke I tiene 4 focos divididos, es f&aacute;cil confundirse. Enciende las luces y comprueba visualmente cu&aacute;l no enciende.</li>
<li><strong>Forzar la bombilla.</strong> La H7 solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si la nueva no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
</ul>
'@
  RAZONES = @'
<p>Las bombillas H7 del Juke tienen una vida &uacute;til de 500-1.000 horas. Los factores que m&aacute;s influyen son las vibraciones (suspensi&oacute;n firme), la tensi&oacute;n el&eacute;ctrica, los encendidos frecuentes y la humedad que puede entrar si las tapas no sellan bien.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Nissan Juke?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, se accede desde el vano motor retirando la tapa protectora.</p>
<h3>&iquest;Puedo poner bombillas LED?</h3>
<p>No, salvo que el coche saliera de f&aacute;brica con faros LED homologados. Es <strong>modificaci&oacute;n no autorizada</strong>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Ojo con el Juke I: 4 focos divididos en el frontal. Acceso desde el vano motor. Ahorro de 45-70 &euro;."
  RELATED = '<a href="/mecanica/nissan-qashqai-cambiar-bombilla">Cambiar la bombilla del Nissan Qashqai</a>
  <a href="/mecanica/nissan-qashqai-cambiar-escobillas">Cambiar las escobillas del Nissan Qashqai</a>'
  SCHEMA = New-Schema -tipo "Nissan Juke" -slug "nissan-juke-cambiar-bombilla" -slugSimple "nissan-juke-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Nissan Juke?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfPuedo poner bombillas LED?|No, es modificaci\u00f3n no autorizada.'
  )
}

# ---------- 10. NISSAN QASHQAI ----------
$fichas += @{
  Archivo = "nissan-qashqai-cambiar-bombilla.html"
  SLUG = "nissan-qashqai-cambiar-bombilla"
  MODELO = "Nissan Qashqai"
  MODELOUPPER = "NISSAN QASHQAI"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Nissan Qashqai. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Nissan Qashqai (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Nissan Qashqai es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a y Europa. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Nissan Qashqai es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a y Europa. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. El acceso al faro est&aacute; algo justo, especialmente en el lado del conductor. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones J11 y J12, a&ntilde;os 2014-2026)."
  VERSIONES = @'
<ul>
<li><strong>Nissan Qashqai J11:</strong> a&ntilde;os 2014-2021.</li>
<li><strong>Nissan Qashqai J12:</strong> a&ntilde;os 2021-2026.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> no llevan bombillas reemplazables.</p>
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
  <strong>Antes de empezar:</strong> En el Qashqai J11 el espacio es especialmente reducido en ambos lados. En el J12 el acceso ha mejorado, pero sigue siendo ajustado. Apaga el motor y deja enfriar el faro 10 minutos antes de empezar.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a de seguridad lateral y tira.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala. Tira de la bombilla recta hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic". Coloca la tapa protectora.',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Nissan</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Forzar la tapa del faro:</strong> puedes romper las pesta&ntilde;as.</li>
<li><strong>Tocar el cristal con los dedos:</strong> usa guantes de algod&oacute;n.</li>
<li><strong>No revisar el fusible:</strong> si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una:</strong> cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa:</strong> entra humedad y se empa&ntilde;an los faros.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. En el Qashqai, el calor del motor y el poco espacio contribuyen al envejecimiento prematuro.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Nissan Qashqai?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor retirando la tapa protectora.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso justo, especialmente en el lado del conductor. Ahorro de 40-70 &euro;."
  RELATED = '<a href="/mecanica/nissan-qashqai-cambiar-escobillas">Cambiar las escobillas del Nissan Qashqai</a>
  <a href="/mecanica/nissan-juke-cambiar-bombilla">Cambiar la bombilla del Nissan Juke</a>'
  SCHEMA = New-Schema -tipo "Nissan Qashqai" -slug "nissan-qashqai-cambiar-bombilla" -slugSimple "nissan-qashqai-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Nissan Qashqai?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
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

Start-Process "http://localhost:8000/mecanica/ford-focus-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/ford-puma-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/honda-civic-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/hyundai-bayon-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/hyundai-tucson-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/kia-ceed-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/kia-sportage-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/mg-zs-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/nissan-juke-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/nissan-qashqai-cambiar-bombilla.html"