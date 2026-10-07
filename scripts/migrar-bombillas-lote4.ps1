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

$amazonCardsH7 = @'
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

$amazonCardsHIR2 = @'
<div class="amazon-card">
  <img src="https://m.media-amazon.com/images/I/61q6IsrY3mL._SL200_.jpg" alt="Bombilla HIR2 9012 hal&oacute;gena" loading="lazy">
  <div class="amazon-card-body">
    <h4>Bombilla HIR2 (9012) hal&oacute;gena</h4>
    <p>Bombilla hal&oacute;gena de alta eficiencia para cruce y carretera. Compatible con el Toyota C-HR.</p>
    <a href="https://www.amazon.es/s?k=bombilla+HIR2+9012&tag=itvcheck-21&linkCode=ll1" target="_blank" rel="nofollow sponsored" class="btn-amazon">Ver precio en Amazon</a>
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

# ---------- SEAT ARONA ----------
$fichas += @{
  Archivo = "seat-arona-cambiar-bombilla.html"
  SLUG = "seat-arona-cambiar-bombilla"
  MODELO = "SEAT Arona"
  MODELOUPPER = "SEAT ARONA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del SEAT Arona. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del SEAT Arona (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El SEAT Arona es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "45-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20-30"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El SEAT Arona es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a por su dise&ntilde;o juvenil y su buena din&aacute;mica. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. Comparte plataforma con el Ibiza y el Polo, as&iacute; que el proceso es muy similar. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (a&ntilde;os 2017-2026)."
  VERSIONES = @'
<ul>
<li><strong>SEAT Arona (KJ):</strong> a&ntilde;os 2017-2026. Motores 1.0 TSI, 1.0 MPI, 1.5 TSI y 1.6 TDI.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (FR, Xcellence, algunos Style) no llevan bombillas reemplazables. Las de hal&oacute;genos (Reference, Style b&aacute;sico) s&iacute;.</p>
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
  <strong>Antes de empezar:</strong> Enfr&iacute;a el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos. El Arona tiene un vano motor compacto: ten paciencia y usa linterna.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana con freno de mano y motor apagado.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Localiza el conector|La H7 va sujeta por grapa met&aacute;lica. El conector tiene pesta&ntilde;a de seguridad.',
    'Desconecta el conector|Presiona la pesta&ntilde;a y tira del conector.',
    'Suelta la grapa|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla|Tira recto hacia afuera.',
    'Instala la nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector|Hasta o&iacute;r un "clic".',
    'Cierra la tapa|Un cuarto de vuelta en sentido horario.',
    'Verifica las luces|Cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo (2 bombillas)</td><td>12-30 &euro;</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-70 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial SEAT</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos:</strong> usa guantes de algod&oacute;n.</li>
<li><strong>Forzar la bombilla:</strong> solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible:</strong> si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una:</strong> cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa:</strong> entra humedad y se empa&ntilde;an los faros.</li>
<li><strong>Rascar el reflector interior:</strong> se raya con facilidad.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen. El uso urbano intensivo acorta la vida &uacute;til.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el SEAT Arona?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Puedo poner LED?</h3>
<p>No, es modificaci&oacute;n no autorizada. Defecto grave en ITV.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor. Ahorro de 45-70 &euro;. Cambiar a LED es <strong>modificaci&oacute;n no autorizada</strong>."
  RELATED = '<a href="/mecanica/seat-arona-cambiar-bombilla">Cambiar la bombilla del SEAT Arona</a>
  <a href="/mecanica/seat-ibiza-cambiar-bombilla">Cambiar la bombilla del SEAT Ibiza</a>
  <a href="/mecanica/seat-ateca-cambiar-bombilla">Cambiar la bombilla del SEAT Ateca</a>'
  SCHEMA = New-Schema -tipo "SEAT Arona" -slug "seat-arona-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el SEAT Arona?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfPuedo poner LED?|No, es modificaci\u00f3n no autorizada.'
  )
}

# ---------- SEAT ATECA ----------
$fichas += @{
  Archivo = "seat-ateca-cambiar-bombilla.html"
  SLUG = "seat-ateca-cambiar-bombilla"
  MODELO = "SEAT Ateca"
  MODELOUPPER = "SEAT ATECA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del SEAT Ateca. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del SEAT Ateca (Gu&iacute;a 2026)"
  TIEMPO = "20"
  LEAD = "El SEAT Ateca es uno de los SUV compactos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-65"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El SEAT Ateca es uno de los SUV compactos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. El acceso al faro es relativamente bueno, lo que hace que sea una tarea asequible. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (a&ntilde;os 2016-2026)."
  VERSIONES = @'
<ul>
<li><strong>SEAT Ateca (5FP):</strong> a&ntilde;os 2016-2026. Motores 1.0 TSI, 1.5 TSI, 2.0 TSI y 1.6/2.0 TDI.</li>
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
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla|Tira recto hacia afuera con cuidado.',
    'Instala la nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>20 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial SEAT</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
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
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. El calor del motor y el uso urbano intensivo acortan la vida de las bombillas.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el SEAT Ateca?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso relativamente bueno desde el vano motor. Ahorro de 40-65 &euro;."
  RELATED = '<a href="/mecanica/seat-ateca-cambiar-bombilla">Cambiar la bombilla del SEAT Ateca</a>
  <a href="/mecanica/seat-arona-cambiar-bombilla">Cambiar la bombilla del SEAT Arona</a>
  <a href="/mecanica/seat-leon-cambiar-bombilla">Cambiar la bombilla del SEAT Le&oacute;n</a>'
  SCHEMA = New-Schema -tipo "SEAT Ateca" -slug "seat-ateca-cambiar-bombilla" -tiempo "PT20M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el SEAT Ateca?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- SEAT IBIZA ----------
$fichas += @{
  Archivo = "seat-ibiza-cambiar-bombilla.html"
  SLUG = "seat-ibiza-cambiar-bombilla"
  MODELO = "SEAT Ibiza"
  MODELOUPPER = "SEAT IBIZA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del SEAT Ibiza. Herramientas, referencias, tiempo estimado y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del SEAT Ibiza (Gu&iacute;a 2026)"
  TIEMPO = "20"
  LEAD = "El SEAT Ibiza es uno de los coches m&aacute;s vendidos en Espa&ntilde;a a&ntilde;o tras a&ntilde;o. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El SEAT Ibiza es uno de los coches m&aacute;s vendidos en Espa&ntilde;a a&ntilde;o tras a&ntilde;o, y uno de los fallos m&aacute;s habituales que provoca un rechazo en la ITV es una bombilla fundida. Cambiarla t&uacute; mismo es una de las tareas m&aacute;s sencillas y rentables que puedes hacer: te ahorras entre 40 y 60 &euro; de mano de obra. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones 6J y 6F, a&ntilde;os 2008-2026)."
  VERSIONES = @'
<ul>
<li><strong>SEAT Ibiza IV (6J):</strong> a&ntilde;os 2008-2017.</li>
<li><strong>SEAT Ibiza V (6F):</strong> a&ntilde;os 2017-2026.</li>
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
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro al menos 10 minutos. En el Ibiza el espacio es reducido, especialmente en el lado del conductor.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana con freno de mano y motor apagado.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a de seguridad lateral y tira.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla fundida|Tira recto hacia afuera.',
    'Instala la nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-12 &euro;</td><td>20 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial SEAT</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos:</strong> el error m&aacute;s grave.</li>
<li><strong>Forzar la bombilla:</strong> solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible:</strong> si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una:</strong> cambia las dos del mismo faro.</li>
<li><strong>Apretar demasiado la grapa:</strong> puede deformar el casquillo.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. El uso urbano intensivo acorta la vida de las bombillas.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el SEAT Ibiza?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor, algo justo en el lado del conductor. Ahorro de 40-60 &euro;."
  RELATED = '<a href="/mecanica/seat-ibiza-cambiar-bateria">Cambiar la bater&iacute;a del SEAT Ibiza</a>
  <a href="/mecanica/seat-ibiza-cambiar-bombilla">Cambiar la bombilla del SEAT Ibiza</a>
  <a href="/mecanica/seat-arona-cambiar-bombilla">Cambiar la bombilla del SEAT Arona</a>'
  SCHEMA = New-Schema -tipo "SEAT Ibiza" -slug "seat-ibiza-cambiar-bombilla" -tiempo "PT20M" -coste "8" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el SEAT Ibiza?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- SEAT LEON ----------
$fichas += @{
  Archivo = "seat-leon-cambiar-bombilla.html"
  SLUG = "seat-leon-cambiar-bombilla"
  MODELO = "SEAT Le&oacute;n"
  MODELOUPPER = "SEAT LEON"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del SEAT Le&oacute;n. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del SEAT Le&oacute;n (Gu&iacute;a 2026)"
  TIEMPO = "20"
  LEAD = "El SEAT Le&oacute;n es uno de los compactos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El SEAT Le&oacute;n es uno de los compactos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones 5F y 6F, a&ntilde;os 2012-2026). El espacio en el vano motor es especialmente reducido en el lado del conductor."
  VERSIONES = @'
<ul>
<li><strong>SEAT Le&oacute;n III (5F):</strong> a&ntilde;os 2012-2020.</li>
<li><strong>SEAT Le&oacute;n IV (6F):</strong> a&ntilde;os 2020-2026.</li>
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
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro 10 minutos. En el Le&oacute;n el espacio es especialmente reducido en el lado del conductor. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y tira recto.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-12 &euro;</td><td>20 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial SEAT</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
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
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el SEAT Le&oacute;n?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso justo en el lado del conductor. Ahorro de 40-60 &euro;."
  RELATED = '<a href="/mecanica/seat-leon-cambiar-bombilla">Cambiar la bombilla del SEAT Le&oacute;n</a>
  <a href="/mecanica/seat-ibiza-cambiar-bombilla">Cambiar la bombilla del SEAT Ibiza</a>
  <a href="/mecanica/seat-arona-cambiar-bombilla">Cambiar la bombilla del SEAT Arona</a>'
  SCHEMA = New-Schema -tipo "SEAT Le\u00f3n" -slug "seat-leon-cambiar-bombilla" -tiempo "PT20M" -coste "8" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el SEAT Le\u00f3n?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- SKODA FABIA ----------
$fichas += @{
  Archivo = "skoda-fabia-cambiar-bombilla.html"
  SLUG = "skoda-fabia-cambiar-bombilla"
  MODELO = "Skoda Fabia"
  MODELOUPPER = "SKODA FABIA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Skoda Fabia. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Skoda Fabia (Gu&iacute;a 2026)"
  TIEMPO = "20"
  LEAD = "El Skoda Fabia es uno de los utilitarios m&aacute;s fiables y vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Skoda Fabia es uno de los utilitarios m&aacute;s fiables y vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones II y III, a&ntilde;os 2007-2026). El acceso al faro es relativamente bueno."
  VERSIONES = @'
<ul>
<li><strong>Skoda Fabia II:</strong> a&ntilde;os 2007-2014.</li>
<li><strong>Skoda Fabia III:</strong> a&ntilde;os 2014-2026.</li>
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
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla|Tira recto hacia afuera.',
    'Instala la nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-12 &euro;</td><td>20 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Skoda</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
  ERRORES = @'
<ul>
<li><strong>Tocar el cristal con los dedos:</strong> usa guantes de algod&oacute;n.</li>
<li><strong>Forzar la bombilla:</strong> solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible:</strong> si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una:</strong> cambia las dos del mismo faro.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. El uso urbano intensivo acorta la vida de las bombillas.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Skoda Fabia?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso desde el vano motor, relativamente bueno. Ahorro de 40-60 &euro;."
  RELATED = '<a href="/mecanica/skoda-fabia-cambiar-bombilla">Cambiar la bombilla del Skoda Fabia</a>
  <a href="/mecanica/skoda-octavia-cambiar-bombilla">Cambiar la bombilla del Skoda Octavia</a>'
  SCHEMA = New-Schema -tipo "Skoda Fabia" -slug "skoda-fabia-cambiar-bombilla" -tiempo "PT20M" -coste "8" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Skoda Fabia?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- SKODA OCTAVIA ----------
$fichas += @{
  Archivo = "skoda-octavia-cambiar-bombilla.html"
  SLUG = "skoda-octavia-cambiar-bombilla"
  MODELO = "Skoda Octavia"
  MODELOUPPER = "SKODA OCTAVIA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Skoda Octavia. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Skoda Octavia (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Skoda Octavia es uno de los coches m&aacute;s vendidos en Espa&ntilde;a, especialmente entre taxistas. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Skoda Octavia es uno de los coches m&aacute;s vendidos en Espa&ntilde;a, especialmente entre taxistas y conductores profesionales por su fiabilidad y amplitud. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones III y IV, a&ntilde;os 2012-2026)."
  VERSIONES = @'
<ul>
<li><strong>Skoda Octavia III:</strong> a&ntilde;os 2012-2020.</li>
<li><strong>Skoda Octavia IV:</strong> a&ntilde;os 2020-2026.</li>
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
  <strong>Antes de empezar:</strong> El Octavia tiene mejor acceso que la mayor&iacute;a de compactos, pero sigue siendo ajustado. Apaga el motor y deja enfriar el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro. Ver&aacute;s una tapa de goma o pl&aacute;stico.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla|Tira recto hacia afuera.',
    'Instala la nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Skoda</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
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
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. En los Octavia con muchos kil&oacute;metros (taxis), el desgaste es m&aacute;s acusado.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Skoda Octavia?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-35 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso relativamente bueno desde el vano motor. Ahorro de 40-70 &euro;."
  RELATED = '<a href="/mecanica/skoda-octavia-cambiar-bombilla">Cambiar la bombilla del Skoda Octavia</a>
  <a href="/mecanica/skoda-fabia-cambiar-bombilla">Cambiar la bombilla del Skoda Fabia</a>'
  SCHEMA = New-Schema -tipo "Skoda Octavia" -slug "skoda-octavia-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Skoda Octavia?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-35 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- VW GOLF ----------
$fichas += @{
  Archivo = "volkswagen-golf-cambiar-bombilla.html"
  SLUG = "volkswagen-golf-cambiar-bombilla"
  MODELO = "Volkswagen Golf"
  MODELOUPPER = "VOLKSWAGEN GOLF"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Volkswagen Golf. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Volkswagen Golf (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Volkswagen Golf es uno de los compactos m&aacute;s vendidos de Europa. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "50-80"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Volkswagen Golf es uno de los compactos m&aacute;s vendidos de Europa y un habitual de las carreteras espa&ntilde;olas. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. El proceso es algo m&aacute;s complicado que en otros coches porque el acceso al faro est&aacute; muy justo, especialmente en el lado del conductor. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones VII y VIII, a&ntilde;os 2012-2026)."
  VERSIONES = @'
<ul>
<li><strong>Volkswagen Golf VII:</strong> a&ntilde;os 2012-2019.</li>
<li><strong>Volkswagen Golf VIII:</strong> a&ntilde;os 2019-2026.</li>
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
  <strong>Atenci&oacute;n:</strong> El Golf VII y VIII tienen un sistema de sujeci&oacute;n de la bombilla bastante peculiar. En algunos casos necesitar&aacute;s desmontar parcialmente el parachoques para acceder al faro, especialmente en el lado del conductor. Consulta el manual antes de empezar.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta o suelta las pesta&ntilde;as con cuidado.',
    'Desconecta el conector|Presiona la pesta&ntilde;a de seguridad lateral y tira.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla|Tira recto hacia afuera con cuidado.',
    'Instala la nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>50-70 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial VW</td><td>70-100 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
  ERRORES = @'
<ul>
<li><strong>Forzar la tapa sin desmontar accesorios:</strong> puedes romper las pesta&ntilde;as.</li>
<li><strong>Tocar el cristal con los dedos:</strong> usa guantes de algod&oacute;n.</li>
<li><strong>No revisar el fusible:</strong> si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una:</strong> cambia las dos del mismo faro.</li>
<li><strong>No apretar bien la tapa:</strong> entra humedad y empa&ntilde;a el faro.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. En el Golf, el calor del motor y el poco espacio contribuyen al envejecimiento prematuro.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Volkswagen Golf?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el parachoques?</h3>
<p>En muchos casos s&iacute;. En otros hay que desmontar parcialmente el parachoques.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso complicado, en algunos casos requiere soltar el parachoques. Ahorro de 50-80 &euro;."
  RELATED = '<a href="/mecanica/volkswagen-golf-cambiar-bateria">Cambiar la bater&iacute;a del Volkswagen Golf</a>
  <a href="/mecanica/volkswagen-golf-cambiar-escobillas">Cambiar las escobillas del Volkswagen Golf</a>
  <a href="/mecanica/volkswagen-golf-cambiar-bombilla">Cambiar la bombilla del Volkswagen Golf</a>'
  SCHEMA = New-Schema -tipo "Volkswagen Golf" -slug "volkswagen-golf-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Volkswagen Golf?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar el parachoques?|En muchos casos s\u00ed.'
  )
}

# ---------- VW POLO ----------
$fichas += @{
  Archivo = "volkswagen-polo-cambiar-bombilla.html"
  SLUG = "volkswagen-polo-cambiar-bombilla"
  MODELO = "Volkswagen Polo"
  MODELOUPPER = "VOLKSWAGEN POLO"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Volkswagen Polo. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Volkswagen Polo (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Volkswagen Polo es uno de los utilitarios m&aacute;s vendidos de Europa. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-70"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Volkswagen Polo es uno de los utilitarios m&aacute;s vendidos de Europa. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. El acceso al faro en el Polo es algo justo, sobre todo en el lado del conductor. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones 6R, 6C y AW, a&ntilde;os 2009-2026)."
  VERSIONES = @'
<ul>
<li><strong>VW Polo V (6R):</strong> a&ntilde;os 2009-2017.</li>
<li><strong>VW Polo V (6C):</strong> a&ntilde;os 2014-2017 (restyling).</li>
<li><strong>VW Polo VI (AW):</strong> a&ntilde;os 2017-2026.</li>
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
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro 10 minutos. En el Polo, el lado del conductor tiene menos espacio por la caja de fusibles y el filtro del aire.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla|Tira recto hacia afuera.',
    'Instala la nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>40-65 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial VW</td><td>60-90 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
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
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. El uso urbano intensivo acorta la vida de las bombillas.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Volkswagen Polo?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso justo en el lado del conductor. Ahorro de 40-70 &euro;."
  RELATED = '<a href="/mecanica/volkswagen-polo-cambiar-bombilla">Cambiar la bombilla del Volkswagen Polo</a>
  <a href="/mecanica/volkswagen-golf-cambiar-bombilla">Cambiar la bombilla del Volkswagen Golf</a>
  <a href="/mecanica/volkswagen-t-roc-cambiar-bombilla">Cambiar la bombilla del Volkswagen T-Roc</a>'
  SCHEMA = New-Schema -tipo "Volkswagen Polo" -slug "volkswagen-polo-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Volkswagen Polo?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- VW T-ROC ----------
$fichas += @{
  Archivo = "volkswagen-t-roc-cambiar-bombilla.html"
  SLUG = "volkswagen-t-roc-cambiar-bombilla"
  MODELO = "Volkswagen T-Roc"
  MODELOUPPER = "VOLKSWAGEN T-ROC"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Volkswagen T-Roc. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Volkswagen T-Roc (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Volkswagen T-Roc es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "50-80"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Volkswagen T-Roc es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. El acceso al faro est&aacute; algo justo, especialmente en el lado del conductor. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (a&ntilde;os 2017-2026)."
  VERSIONES = @'
<ul>
<li><strong>Volkswagen T-Roc (A11):</strong> a&ntilde;os 2017-2026. Motores 1.0 TSI, 1.5 TSI, 2.0 TSI y 1.6/2.0 TDI.</li>
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
  <strong>Antes de empezar:</strong> Apaga el motor y deja enfriar el faro 10 minutos. En el T-Roc, el lado del conductor tiene menos espacio por el dep&oacute;sito del limpiaparabrisas y la caja de fusibles.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira suavemente.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla|Tira recto hacia afuera.',
    'Instala la nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>8-15 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>50-70 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial VW</td><td>70-100 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
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
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. El uso urbano intensivo acorta la vida de las bombillas.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Volkswagen T-Roc?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor, aunque en el lado del conductor cuesta m&aacute;s.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso justo en el lado del conductor. Ahorro de 50-80 &euro;."
  RELATED = '<a href="/mecanica/volkswagen-t-roc-cambiar-bombilla">Cambiar la bombilla del Volkswagen T-Roc</a>
  <a href="/mecanica/volkswagen-golf-cambiar-bombilla">Cambiar la bombilla del Volkswagen Golf</a>
  <a href="/mecanica/volkswagen-tiguan-cambiar-bombilla">Cambiar la bombilla del Volkswagen Tiguan</a>'
  SCHEMA = New-Schema -tipo "Volkswagen T-Roc" -slug "volkswagen-t-roc-cambiar-bombilla" -tiempo "PT25M" -coste "10" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Volkswagen T-Roc?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- VW TIGUAN ----------
$fichas += @{
  Archivo = "volkswagen-tiguan-cambiar-bombilla.html"
  SLUG = "volkswagen-tiguan-cambiar-bombilla"
  MODELO = "Volkswagen Tiguan"
  MODELOUPPER = "VOLKSWAGEN TIGUAN"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Volkswagen Tiguan. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Volkswagen Tiguan (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El Volkswagen Tiguan es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "55-90"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20-30"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Volkswagen Tiguan es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones 5N, AD1 y CT, a&ntilde;os 2007-2026). Si tu Tiguan lleva faros Full LED o bi-xen&oacute;n, no tiene bombillas reemplazables."
  VERSIONES = @'
<ul>
<li><strong>Volkswagen Tiguan I (5N):</strong> a&ntilde;os 2007-2016.</li>
<li><strong>Volkswagen Tiguan II (AD1):</strong> a&ntilde;os 2016-2023.</li>
<li><strong>Volkswagen Tiguan III (CT):</strong> a&ntilde;os 2023-2026. Solo versiones con faros hal&oacute;genos (los acabados altos llevan LED).</li>
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
  <strong>Atenci&oacute;n:</strong> El Tiguan tiene un vano motor compacto. El lado del conductor suele tener menos espacio por la caja de fusibles. Si vas a cambiar solo una bombilla, empieza por el lado del acompa&ntilde;ante para coger pr&aacute;ctica.
</div>
'@
  HERRAMIENTAS = $herrComunes
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Localiza el conector el&eacute;ctrico|La H7 va sujeta por grapa met&aacute;lica con pesta&ntilde;a lateral.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira del conector, nunca del cable.',
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
<tr><td>Taller gen&eacute;rico</td><td>50-80 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial VW</td><td>70-110 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
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
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen. El calor del motor y el poco espacio contribuyen al envejecimiento prematuro.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Volkswagen Tiguan?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Las versiones LED o bi-xen&oacute;n no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos. El lado del conductor suele ser el m&aacute;s complicado.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, en la mayor&iacute;a de versiones se accede desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso ajustado en el lado del conductor. Ahorro de 55-90 &euro;."
  RELATED = '<a href="/mecanica/volkswagen-tiguan-cambiar-bombilla">Cambiar la bombilla del Volkswagen Tiguan</a>
  <a href="/mecanica/volkswagen-golf-cambiar-bombilla">Cambiar la bombilla del Volkswagen Golf</a>
  <a href="/mecanica/volkswagen-t-roc-cambiar-bombilla">Cambiar la bombilla del Volkswagen T-Roc</a>'
  SCHEMA = New-Schema -tipo "Volkswagen Tiguan" -slug "volkswagen-tiguan-cambiar-bombilla" -tiempo "PT25M" -coste "15" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Volkswagen Tiguan?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- TOYOTA C-HR (HIR2) ----------
$fichas += @{
  Archivo = "toyota-chr-cambiar-bombilla.html"
  SLUG = "toyota-chr-cambiar-bombilla"
  MODELO = "Toyota C-HR"
  MODELOUPPER = "TOYOTA C-HR"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Toyota C-HR. Referencias HIR2, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Toyota C-HR (Gu&iacute;a 2026)"
  TIEMPO = "25-40"
  LEAD = "El Toyota C-HR es uno de los SUV h&iacute;bridos m&aacute;s vendidos en Espa&ntilde;a. Detalle importante: las versiones con faros hal&oacute;genos usan <strong>bombillas HIR2</strong> (no H7), m&aacute;s caras y menos comunes. Una bombilla fundida es defecto grave en la ITV."
  HERO1N = "HIR2"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "60-100"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "25-40"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "HIR2"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "800-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Toyota C-HR es uno de los SUV h&iacute;bridos m&aacute;s vendidos en Espa&ntilde;a por su dise&ntilde;o rompedor y eficiencia. Pero tiene un detalle que sorprende a muchos propietarios: las versiones con faros hal&oacute;genos usan <strong>bombillas HIR2</strong> (9012), no H7. La HIR2 da m&aacute;s luz pero es m&aacute;s cara. Una fundida es <strong>defecto grave</strong> en la ITV. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (a&ntilde;os 2016-2023)."
  VERSIONES = @'
<ul>
<li><strong>Toyota C-HR (AX10):</strong> a&ntilde;os 2016-2023. Motores 1.2 Turbo, 1.8 Hybrid y 2.0 Hybrid.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (mayor&iacute;a de acabados altos) no tienen bombillas reemplazables: en caso de fallo hay que sustituir el m&oacute;dulo LED completo. Las versiones con faros hal&oacute;genos (acabados de acceso) s&iacute; llevan HIR2 reemplazable.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce y carretera</td><td>HIR2 (9012) 55W</td><td>15-30 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
<tr><td>Intermitente delantero</td><td>PY21W</td><td>4-8 &euro; unidad</td></tr>
<tr><td>Faro LED (acabados altos)</td><td>No reemplazable</td><td>M&oacute;dulo completo 600-1.200 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Verifica la referencia:</strong> Antes de comprar, mira la etiqueta del faro o el manual de tu C-HR. La HIR2 <strong>no es una H7</strong>, aunque el casquillo es parecido. Si compras H7 por error, no encajar&aacute; en el portal&aacute;mparas.
</div>
<div class="mag-mec-warn">
  <strong>Advertencias:</strong> Enfr&iacute;a el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos. El vano motor del C-HR es compacto y el acceso al faro del conductor es especialmente ajustado.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bombilla HIR2 (9012)</strong> (idealmente dos)</li>
<li><strong>Bombilla W5W</strong> (si falla la de posici&oacute;n)</li>
<li><strong>Destornillador Torx T20</strong></li>
<li><strong>Guantes de algod&oacute;n</strong> (imprescindibles)</li>
<li><strong>Linterna frontal</strong></li>
</ul>
'@
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y localiza la parte trasera del faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Localiza el conector el&eacute;ctrico|La HIR2 va sujeta con grapa met&aacute;lica y pesta&ntilde;a lateral.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira del conector, nunca del cable.',
    'Suelta la grapa met&aacute;lica|Presiona los dos extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla fundida|Tira recto hacia afuera con un pa&ntilde;o limpio.',
    'Instala la bombilla nueva|La HIR2 tiene una pesta&ntilde;a de gu&iacute;a muy espec&iacute;fica. <strong>No toques el cristal.</strong>',
    'Reconecta el conector|Empuja hasta o&iacute;r un "clic".',
    'Cierra la tapa protectora|Aseg&uacute;rate de que la junta de goma sella bien.',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo (2 bombillas HIR2)</td><td>30-60 &euro;</td><td>25-40 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>70-110 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Toyota</td><td>100-160 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsHIR2
  ERRORES = @'
<ul>
<li><strong>Comprar bombilla H7 por error.</strong> La HIR2 tiene un casquillo distinto. No encajar&aacute;.</li>
<li><strong>Tocar el cristal con los dedos.</strong> El error m&aacute;s grave. Usa guantes.</li>
<li><strong>Forzar la bombilla.</strong> La HIR2 solo entra en una posici&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No sellar bien la tapa.</strong> Entra humedad y se empa&ntilde;an los faros.</li>
</ul>
'@
  RAZONES = @'
<p>Las HIR2 del C-HR tienen una vida &uacute;til de 800-1.200 horas, algo superior a las H7 convencionales. Los factores que m&aacute;s influyen son las vibraciones, la tensi&oacute;n el&eacute;ctrica, los encendidos frecuentes y el calor del vano motor (el sistema h&iacute;brido tambi&eacute;n genera calor).</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Toyota C-HR?</h3>
<p>Las versiones con faros hal&oacute;genos del C-HR (AX10) usan <strong>HIR2</strong> (tambi&eacute;n conocida como 9012) para cruce y carretera. Las versiones Full LED no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>25-40 minutos. El lado del conductor es el m&aacute;s complicado.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor retirando la tapa protectora.</p>
<h3>&iquest;Puedo cambiar la bombilla si mi C-HR es h&iacute;brido?</h3>
<p>S&iacute;, siempre que tenga faros hal&oacute;genos. El sistema h&iacute;brido no interfiere con el alumbrado. No toques los cables naranjas de alta tensi&oacute;n.</p>
'@
  RESUMEN = "Bombilla <strong>HIR2 (9012)</strong> para cruce y carretera (no H7), <strong>W5W</strong> para posici&oacute;n. Acceso ajustado en el lado del conductor. Ahorro de 60-100 &euro;. Las versiones LED no llevan bombillas reemplazables."
  RELATED = '<a href="/mecanica/toyota-chr-cambiar-escobillas">Cambiar las escobillas del Toyota C-HR</a>
  <a href="/mecanica/toyota-corolla-cambiar-bateria">Cambiar la bater&iacute;a del Toyota Corolla</a>'
  SCHEMA = New-Schema -tipo "Toyota C-HR" -slug "toyota-chr-cambiar-bombilla" -tiempo "PT30M" -coste "25" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva HIR2 sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Toyota C-HR?|HIR2 (9012) para cruce y carretera en versiones hal\u00f3genas. Las LED no llevan bombillas reemplazables.',
    '\u00bfCu\u00e1nto tiempo se tarda?|25-40 minutos.',
    '\u00bfPuedo cambiar la bombilla si mi C-HR es h\u00edbrido?|S\u00ed, siempre que tenga faros hal\u00f3genos.'
  )
}

# ---------- FIAT TIPO ----------
$fichas += @{
  Archivo = "fiat-tipo-cambiar-bombilla.html"
  SLUG = "fiat-tipo-cambiar-bombilla"
  MODELO = "Fiat Tipo"
  MODELOUPPER = "FIAT TIPO"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Fiat Tipo. Referencias H7, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Fiat Tipo (Gu&iacute;a 2026)"
  TIEMPO = "20"
  LEAD = "El Fiat Tipo es uno de los compactos m&aacute;s vendidos en Espa&ntilde;a por su relaci&oacute;n calidad-precio. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. Esta gu&iacute;a te explica c&oacute;mo cambiarlas paso a paso."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "20"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Fiat Tipo es uno de los compactos m&aacute;s vendidos en Espa&ntilde;a por su excelente relaci&oacute;n calidad-precio. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. En el Tipo el acceso al faro es bastante bueno. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaci&oacute;n 356, a&ntilde;os 2016-2026)."
  VERSIONES = @'
<ul>
<li><strong>Fiat Tipo (356):</strong> a&ntilde;os 2016-2026. Motores 1.4, 1.0 FireFly, 1.3 MultiJet y 1.6 MultiJet.</li>
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
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa met&aacute;lica|Presiona los extremos hacia dentro y sep&aacute;rala.',
    'Extrae la bombilla|Tira recto hacia afuera.',
    'Instala la nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong> Vuelve a colocar la grapa.',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende las luces y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-12 &euro;</td><td>20 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Fiat</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsH7
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
<h3>&iquest;Qu&eacute; bombilla lleva el Fiat Tipo?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>20-30 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso c&oacute;modo desde el vano motor. Ahorro de 40-60 &euro;."
  RELATED = '<a href="/mecanica/fiat-tipo-cambiar-bombilla">Cambiar la bombilla del Fiat Tipo</a>
  <a href="/mecanica/fiat-500-cambiar-bombilla">Cambiar la bombilla del Fiat 500</a>'
  SCHEMA = New-Schema -tipo "Fiat Tipo" -slug "fiat-tipo-cambiar-bombilla" -tiempo "PT20M" -coste "8" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Fiat Tipo?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|20-30 minutos.',
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
Write-Host "Generados: $generados de 12" -ForegroundColor Green
Write-Host "Con avisos: $avisos" -ForegroundColor Yellow
Write-Host "Backup: $bk" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

Start-Process "http://localhost:8000/mecanica/seat-arona-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/seat-ateca-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/seat-ibiza-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/seat-leon-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/skoda-fabia-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/skoda-octavia-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/volkswagen-golf-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/volkswagen-polo-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/volkswagen-t-roc-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/volkswagen-tiguan-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/toyota-chr-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/fiat-tipo-cambiar-bombilla.html"