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
    <span>MEC&Aacute;NICA &middot; BATER&Iacute;A &middot; %%MODELOUPPER%%</span>
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
  <span>BATER&Iacute;A &middot; <strong>%%MODELOUPPER%%</strong></span>
</div>

<section class="mag-hero hero-blog">
  <div class="mag-hero-text">
    <span class="kicker">Actualizado Septiembre 2026 &middot; %%TIEMPO%% min</span>
    <h1 class="h1-inline-md">C&oacute;mo cambiar la bater&iacute;a<br>del %%MODELO%%.</h1>
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

<h2>Qu&eacute; bater&iacute;a lleva el %%MODELO%%</h2>
%%TABLABATERIAS%%

%%AVISOS%%

<h2>Herramientas y repuestos necesarios</h2>
<div class="mag-mec-toolbox">
  <h3>Lo que necesitas</h3>
  %%HERRAMIENTAS%%
</div>

<h2>C&oacute;mo diagnosticar que la bater&iacute;a est&aacute; agotada</h2>
%%DIAGNOSTICO%%

<h2 id="pasos">Paso a paso para cambiar la bater&iacute;a</h2>
<div class="mag-mec-steps">
%%PASOS%%
</div>

<h2 id="precios">Cu&aacute;nto cuesta cambiar la bater&iacute;a del %%MODELO%%</h2>
%%TABLAPRECIOS%%

%%AMAZONCARDS%%

<h2>Los errores m&aacute;s comunes en el %%MODELO%%</h2>
%%ERRORES%%

<h2>Por qu&eacute; se agota la bater&iacute;a del %%MODELO%%</h2>
%%RAZONES%%

<div class="mag-notice-inner">
  <h3>Antes de la ITV</h3>
  <p>&iquest;Necesitas revisar la bater&iacute;a antes de la ITV? Consulta la gu&iacute;a completa de bater&iacute;as del sitio.</p>
  <p><a href="/mecanica/baterias">Ver gu&iacute;a completa de bater&iacute;as &rarr;</a></p>
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
  <a href="/checklist-itv">Checklist pre-ITV (25 puntos)</a>
  <a href="/que-pasa-si-suspendo-la-itv">Qu&eacute; hacer si suspendes la ITV</a>
  <a href="/guia-documentacion">Documentaci&oacute;n obligatoria para la ITV</a>
  <a href="/cuando-me-toca-itv">Calculadora de fecha de ITV</a>
  <a href="/mecanica/baterias">Gu&iacute;a completa de bater&iacute;as</a>
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

# =========================================================================
# FICHAS
# =========================================================================

$konaSchema = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del Hyundai Kona","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda auxiliar del Hyundai Kona.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/hyundai-kona-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Hyundai Kona","item":"https://itvcheck.es/mecanica/hyundai-kona-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del Hyundai Kona","totalTime":"PT30M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"120"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Llave de carraca de 13 mm"},{"@type":"HowToTool","name":"Guantes aislantes"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda AGM 12V 60-70Ah"}],"step":[{"@type":"HowToStep","name":"Apagar el motor","text":"Apaga el motor y espera 5 minutos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el vano motor, lado derecho."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo primero."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el Hyundai Kona?","acceptedAnswer":{"@type":"Answer","text":"Depende: plomo-\u00e1cido 60Ah sin ISG, EFB 60-70Ah con ISG, y AGM auxiliar 45-60Ah en h\u00edbridos y el\u00e9ctricos."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda auxiliar del Kona Electric?","acceptedAnswer":{"@type":"Answer","text":"En el vano motor, lado derecho, cubierta por una tapa."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"Entre 3 y 5 a\u00f1os, seg\u00fan uso."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, con las herramientas adecuadas. Solo necesitas llaves de 10 y 13 mm."}}]}
 ]
}
'@

$niroSchema = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del Kia Niro H\u00edbrido","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda auxiliar del Kia Niro H\u00edbrido.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/kia-niro-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Kia Niro","item":"https://itvcheck.es/mecanica/kia-niro-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del Kia Niro H\u00edbrido","totalTime":"PT30M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"120"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Guantes aislantes"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda AGM 12V 45Ah"}],"step":[{"@type":"HowToStep","name":"Apagar el coche","text":"Apaga el motor y espera 90 segundos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el maletero o bajo el asiento trasero."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el Kia Niro H\u00edbrido?","acceptedAnswer":{"@type":"Answer","text":"Bater\u00eda auxiliar AGM de 12V y 45Ah."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda auxiliar?","acceptedAnswer":{"@type":"Answer","text":"En el maletero, lado derecho, tras un panel. En algunas versiones bajo el asiento trasero."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"Entre 3 y 5 a\u00f1os, seg\u00fan uso."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, con llave de 10 mm."}}]}
 ]
}
'@

$sportageSchema = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del Kia Sportage","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda del Kia Sportage.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/kia-sportage-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Kia Sportage","item":"https://itvcheck.es/mecanica/kia-sportage-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del Kia Sportage","totalTime":"PT30M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"110"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Llave de carraca de 12 mm"},{"@type":"HowToTool","name":"Guantes aislantes"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda AGM 12V 70Ah"}],"step":[{"@type":"HowToStep","name":"Apagar el motor","text":"Apaga el motor y espera 5 minutos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el vano motor, lado izquierdo."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Retirar la brida","text":"Afloja la brida de sujeci\u00f3n."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el Kia Sportage?","acceptedAnswer":{"@type":"Answer","text":"Con ISG utiliza AGM de 12V y 70Ah. Sin ISG puede llevar convencional de 12V 60-70Ah."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda?","acceptedAnswer":{"@type":"Answer","text":"En el vano motor, lado izquierdo."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"Entre 4 y 6 a\u00f1os. Los modelos con ISG suelen necesitar cambio antes."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, con llaves de 10 y 12 mm."}}]}
 ]
}
'@

$p208Schema = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del Peugeot 208","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda del Peugeot 208.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/peugeot-208-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Peugeot 208","item":"https://itvcheck.es/mecanica/peugeot-208-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del Peugeot 208","totalTime":"PT25M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"100"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Llave de carraca de 13 mm"},{"@type":"HowToTool","name":"Guantes aislantes"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda EFB 12V 60Ah"}],"step":[{"@type":"HowToStep","name":"Apagar el motor","text":"Apaga el motor y espera 5 minutos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el vano motor, lado derecho."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el Peugeot 208?","acceptedAnswer":{"@type":"Answer","text":"El 208 I/II con Stop & Start usa EFB de 12V y 60Ah. El e-208 tiene AGM auxiliar de 12V."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda?","acceptedAnswer":{"@type":"Answer","text":"En el vano motor, lado derecho."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"4-6 a\u00f1os (convencional) o 3-5 a\u00f1os (EFB)."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, con llaves de 10 y 13 mm."}}]}
 ]
}
'@

$capturSchema = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del Renault Captur","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda del Renault Captur.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/renault-captur-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Renault Captur","item":"https://itvcheck.es/mecanica/renault-captur-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del Renault Captur","totalTime":"PT25M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"95"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Llave de carraca de 13 mm"},{"@type":"HowToTool","name":"Guantes aislantes"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda EFB 12V 60Ah"}],"step":[{"@type":"HowToStep","name":"Apagar el motor","text":"Apaga el motor y espera 5 minutos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el vano motor, lado derecho."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el Renault Captur?","acceptedAnswer":{"@type":"Answer","text":"Con Stop & Start utiliza EFB de 12V y 60Ah. Sin Stop & Start puede llevar convencional de 12V 60Ah."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda?","acceptedAnswer":{"@type":"Answer","text":"En el vano motor, lado derecho."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"Entre 4 y 6 a\u00f1os, seg\u00fan uso."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, con llaves de 10 y 13 mm."}}]}
 ]
}
'@

$amazonCards = @'
<div class="amazon-card">
  <img src="https://m.media-amazon.com/images/I/81b924-md+L._SL200_.jpg" alt="Bater&iacute;a AGM TK720" loading="lazy">
  <div class="amazon-card-body">
    <h4>Bater&iacute;a AGM TK720</h4>
    <p>Ideal para coches con Start-Stop, 12V y 72Ah, libre de mantenimiento.</p>
    <a href="https://www.amazon.es/dp/B0BW9HJ395?tag=itvcheck-21&linkCode=ll1" target="_blank" rel="nofollow sponsored" class="btn-amazon">Ver precio en Amazon</a>
  </div>
</div>
<div class="amazon-card">
  <img src="https://m.media-amazon.com/images/I/81lNUTGgNLL._SL200_.jpg" alt="Mult&iacute;metro AstroAI" loading="lazy">
  <div class="amazon-card-body">
    <h4>Mult&iacute;metro AstroAI</h4>
    <p>Voltaje, resistencia y continuidad. Imprescindible para diagnosticar la bater&iacute;a.</p>
    <a href="https://www.amazon.es/dp/B0FBGGP41Y?tag=itvcheck-21&linkCode=ll1" target="_blank" rel="nofollow sponsored" class="btn-amazon">Ver precio en Amazon</a>
  </div>
</div>
'@

# =========================================================================
# FICHAS (datos variables)
# =========================================================================

$fichas = @()

# ---------- HYUNDAI KONA ----------
$fichas += @{
  Archivo = "hyundai-kona-cambiar-bateria.html"
  SLUG = "hyundai-kona-cambiar-bateria"
  MODELO = "Hyundai Kona"
  MODELOUPPER = "HYUNDAI KONA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a del Hyundai Kona. Referencias AGM/EFB, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Hyundai Kona (Gu&iacute;a Completa 2026)"
  TIEMPO = "25-40"
  LEAD = "El Hyundai Kona es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Su bater&iacute;a auxiliar de 12V se agota cada 3-5 a&ntilde;os y, cuando falla, el coche puede no arrancar o dar errores el&eacute;ctricos. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso en 25-40 minutos."
  HERO1N = "3-5"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "80-140"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "60"; KPI1S = "Ah"; KPI1L = "Amperaje m&iacute;nimo<br>sin ISG"
  KPI2N = "EFB"; KPI2S = ""; KPI2L = "Tipo de bater&iacute;a<br>con ISG"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "5"; KPI4S = "min"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El Hyundai Kona es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a por su dise&ntilde;o llamativo, su eficiencia y su garant&iacute;a de 5 a&ntilde;os. Como todos los coches modernos con mucha electr&oacute;nica, tiene un punto d&eacute;bil: la bater&iacute;a auxiliar de 12V se agota cada 3-5 a&ntilde;os y, cuando falla, el coche puede no arrancar o dar errores el&eacute;ctricos extra&ntilde;os. En esta gu&iacute;a te explico c&oacute;mo cambiarla paso a paso, con las referencias exactas y las particularidades de este modelo."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos generaciones del Hyundai Kona comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Hyundai Kona I (OS):</strong> a&ntilde;os 2017-2023. Motores 1.0 T-GDi, 1.6 T-GDi, 1.6 CRDi, Kona Hybrid y Kona Electric.</li>
<li><strong>Hyundai Kona II (SX2):</strong> a&ntilde;os 2023-2026. Motores 1.0 T-GDi, 1.6 T-GDi, Kona Hybrid y Kona Electric.</li>
</ul>
<p>En todas las versiones hay una bater&iacute;a auxiliar de 12V: en los motores de combusti&oacute;n y mild hybrid est&aacute; en el vano motor. En el Kona Electric y Hybrid puede estar en el vano motor o en el maletero, seg&uacute;n la versi&oacute;n.</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a auxiliar</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>Kona 1.0 T-GDi (sin ISG)</td><td>Plomo-&aacute;cido est&aacute;ndar</td><td>60 Ah</td><td>60-90 &euro;</td></tr>
<tr><td>Kona 1.0/1.6 T-GDi con ISG</td><td>EFB</td><td>60-70 Ah</td><td>100-150 &euro;</td></tr>
<tr><td>Kona 1.6 CRDi con ISG</td><td>AGM o EFB</td><td>70 Ah</td><td>130-180 &euro;</td></tr>
<tr><td>Kona Hybrid</td><td>AGM auxiliar</td><td>45-60 Ah</td><td>100-150 &euro;</td></tr>
<tr><td>Kona Electric</td><td>AGM auxiliar 12V</td><td>45-60 Ah</td><td>100-150 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>C&oacute;mo saber si tu Kona tiene Start&Stop (ISG):</strong> busca un bot&oacute;n en el salpicadero con una "A" may&uacute;scula dentro de un c&iacute;rculo con flecha. Si lo tiene, tu Kona lleva bater&iacute;a EFB o AGM, no convencional.
</div>
<div class="mag-mec-danger">
  <strong>En el Kona Electric y Hybrid:</strong> NUNCA toques los cables naranjas de alta tensi&oacute;n. Solo manipulamos la bater&iacute;a auxiliar de 12V.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bater&iacute;a nueva del tipo correcto</strong></li>
<li><strong>Llave de carraca de 10 mm</strong></li>
<li><strong>Llave de carraca de 13 mm</strong></li>
<li><strong>Guantes aislantes</strong></li>
<li><strong>Cepillo de alambre</strong> (para limpiar bornes)</li>
<li><strong>Mult&iacute;metro b&aacute;sico</strong> (para diagnosticar)</li>
</ul>
'@
  DIAGNOSTICO = @'
<ul>
<li><strong>Motor apagado:</strong> 12,4-12,7 V = sana &middot; 12,0-12,3 V = al 50% &middot; &lt;11,8 V = agotada.</li>
<li><strong>Motor arrancado:</strong> debe marcar 13,8-14,4 V (en Kona Electric/Hybrid, comprueba el voltaje en modo READY).</li>
<li><strong>Arranque:</strong> no debe bajar de 9,6 V.</li>
</ul>
'@
  PASOS = @'
<div class="mag-mec-step"><strong>Paso 1 &mdash; Apaga el motor y espera 5 minutos.</strong> Apaga todas las luces, radio y accesorios.</div>
<div class="mag-mec-step"><strong>Paso 2 &mdash; Localiza la bater&iacute;a.</strong> En el Kona est&aacute; en el <strong>vano motor, lado derecho</strong>, cubierta por una tapa de pl&aacute;stico. Ret&iacute;rala para acceder.</div>
<div class="mag-mec-step"><strong>Paso 3 &mdash; Desconecta el borne NEGATIVO primero.</strong> Afloja la tuerca con la llave de 10 mm y retira el cable negro ("-"). Es CR&Iacute;TICO desconectar el negativo primero.</div>
<div class="mag-mec-step"><strong>Paso 4 &mdash; Desconecta el borne POSITIVO.</strong> Afloja la tuerca del cable rojo ("+") y ret&iacute;ralo.</div>
<div class="mag-mec-step"><strong>Paso 5 &mdash; Retira la brida de sujeci&oacute;n.</strong> Afloja los tornillos con la llave de 13 mm.</div>
<div class="mag-mec-step"><strong>Paso 6 &mdash; Extrae la bater&iacute;a vieja.</strong> S&aacute;cala sin inclinarla para evitar derrames.</div>
<div class="mag-mec-step"><strong>Paso 7 &mdash; Limpia la bandeja y los bornes.</strong> Con el cepillo de alambre.</div>
<div class="mag-mec-step"><strong>Paso 8 &mdash; Coloca la bater&iacute;a nueva.</strong> Respeta la polaridad.</div>
<div class="mag-mec-step"><strong>Paso 9 &mdash; Fija la brida.</strong> La bater&iacute;a NO debe moverse.</div>
<div class="mag-mec-step"><strong>Paso 10 &mdash; Conecta el borne POSITIVO primero.</strong> Despu&eacute;s el NEGATIVO.</div>
<div class="mag-mec-step"><strong>Paso 11 &mdash; Comprueba y resetea.</strong> Arranca el coche. Verifica luces, radio, elevalunas. Puede que tengas que resetear el reloj y las ventanillas one-touch.</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>60-180 &euro; (seg&uacute;n tipo)</td><td>25-40 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>140-260 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Hyundai</td><td>180-340 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
<p><strong>Ahorro real:</strong> 80-140 &euro; seg&uacute;n versi&oacute;n. En el Kona Electric e Hybrid el ahorro es mayor porque el concesionario cobra m&aacute;s por mano de obra especializada.</p>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Poner plomo-&aacute;cido en un Kona con ISG.</strong> Se destruye en meses.</li>
<li><strong>Tocar los cables naranjas (Electric/Hybrid).</strong> Peligro mortal.</li>
<li><strong>Desconectar primero el positivo.</strong> Riesgo de cortocircuito.</li>
<li><strong>No respetar la polaridad.</strong> Puede fundir la centralita.</li>
<li><strong>No fijar bien la brida.</strong> Vibraciones y cortocircuito.</li>
<li><strong>No resetear elevalunas.</strong> Pierden la configuraci&oacute;n one-touch.</li>
</ul>
'@
  RAZONES = @'
<ul>
<li><strong>Edad:</strong> 3-5 a&ntilde;os de vida &uacute;til media.</li>
<li><strong>Trayectos cortos:</strong> el alternador no recarga lo suficiente.</li>
<li><strong>Consumos par&aacute;sitos:</strong> la mucha electr&oacute;nica del Kona consume bater&iacute;a.</li>
<li><strong>Fr&iacute;o extremo:</strong> reduce la capacidad de arranque.</li>
<li><strong>ISG:</strong> exige m&aacute;s ciclos de carga/descarga.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Hyundai Kona?</h3>
<p>Depende: plomo-&aacute;cido 60Ah sin ISG, EFB 60-70Ah con ISG, y AGM auxiliar 45-60Ah en h&iacute;bridos y el&eacute;ctricos.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a auxiliar del Kona Electric?</h3>
<p>En el vano motor, lado derecho, cubierta por una tapa. No confundir con la bater&iacute;a de alta tensi&oacute;n, que est&aacute; bajo el suelo del coche.</p>
<h3>&iquest;Cu&aacute;nto dura?</h3>
<p>Entre 3 y 5 a&ntilde;os, seg&uacute;n uso.</p>
<h3>&iquest;Se puede cambiar sin taller?</h3>
<p>S&iacute;, con las herramientas adecuadas. Solo necesitas llaves de 10 y 13 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso una bater&iacute;a EFB en un Kona con ISG?</h3>
<p>El Stop&Start deja de funcionar y la bater&iacute;a se sulfata prematuramente.</p>
<h3>&iquest;Se puede cambiar la bater&iacute;a de alta tensi&oacute;n del Kona Electric?</h3>
<p>No es tarea DIY. La bater&iacute;a de alta tensi&oacute;n est&aacute; dise&ntilde;ada para durar toda la vida del coche (garant&iacute;a de 8 a&ntilde;os o 160.000 km) y solo la manipulan t&eacute;cnicos certificados.</p>
'@
  RESUMEN = "Bater&iacute;a auxiliar de 12V en vano motor (lado derecho). Tipo seg&uacute;n versi&oacute;n: plomo-&aacute;cido sin ISG, EFB o AGM con ISG. Desconecta negativo primero, luego positivo. Llaves de 10 y 13 mm. Ahorro de 80-140 &euro;. <strong>Nunca toques los cables naranjas</strong> en versiones el&eacute;ctricas o h&iacute;bridas."
  RELATED = '<a href="/mecanica/hyundai-tucson-cambiar-bombilla">Cambiar la bombilla del Hyundai Tucson</a>
  <a href="/mecanica/hyundai-i30-cambiar-escobillas">Cambiar las escobillas del Hyundai i30</a>'
  SCHEMA = $konaSchema
}

# ---------- KIA NIRO ----------
$fichas += @{
  Archivo = "kia-niro-cambiar-bateria.html"
  SLUG = "kia-niro-cambiar-bateria"
  MODELO = "Kia Niro H&iacute;brido"
  MODELOUPPER = "KIA NIRO"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a auxiliar del Kia Niro H&iacute;brido. Referencias AGM, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Kia Niro H&iacute;brido (Gu&iacute;a Completa 2026)"
  TIEMPO = "25-40"
  LEAD = "El Kia Niro es uno de los h&iacute;bridos m&aacute;s vendidos en Espa&ntilde;a. Su bater&iacute;a auxiliar de 12V se agota cada 3-5 a&ntilde;os y est&aacute; oculta en el maletero o bajo el asiento. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso."
  HERO1N = "3-5"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "90-150"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "45"; KPI1S = "Ah"; KPI1L = "Amperaje<br>t&iacute;pico AGM"
  KPI2N = "AGM"; KPI2S = ""; KPI2L = "Tipo obligatorio<br>(no convencional)"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "90"; KPI4S = "seg"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El Kia Niro es uno de los h&iacute;bridos m&aacute;s vendidos en Espa&ntilde;a por su eficiencia, su fiabilidad (garant&iacute;a de 7 a&ntilde;os) y su equipamiento. Tiene dos bater&iacute;as: la <strong>bater&iacute;a de alta tensi&oacute;n</strong> (la h&iacute;brida, que dura toda la vida del coche) y la <strong>bater&iacute;a auxiliar de 12V</strong>, que alimenta la electr&oacute;nica y que se agota cada 3-5 a&ntilde;os. En esta gu&iacute;a te explico c&oacute;mo cambiar la de 12V paso a paso."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos generaciones del Kia Niro comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Kia Niro I (DE):</strong> a&ntilde;os 2016-2022. Versiones Hybrid, Plug-in Hybrid y e-Niro (el&eacute;ctrico).</li>
<li><strong>Kia Niro II (SG2):</strong> a&ntilde;os 2022-2026. Versiones Hybrid, Plug-in Hybrid y EV.</li>
</ul>
<p>La ubicaci&oacute;n de la bater&iacute;a auxiliar de 12V var&iacute;a seg&uacute;n la versi&oacute;n: en el maletero (lado derecho, tras un panel) o bajo el asiento trasero. Consulta el manual de tu Niro para saber la ubicaci&oacute;n exacta.</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a auxiliar</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>Niro Hybrid (HEV)</td><td>AGM 12V</td><td>45 Ah</td><td>100-150 &euro;</td></tr>
<tr><td>Niro Plug-in (PHEV)</td><td>AGM 12V</td><td>45 Ah</td><td>100-150 &euro;</td></tr>
<tr><td>e-Niro / Niro EV</td><td>AGM 12V auxiliar</td><td>45 Ah</td><td>100-150 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-danger">
  <strong>NUNCA toques los cables naranjas de alta tensi&oacute;n.</strong> La bater&iacute;a de alta tensi&oacute;n del sistema h&iacute;brido (200-350 V) est&aacute; en otra zona y NO se toca. Solo manipulamos la bater&iacute;a auxiliar de 12V. Contacto con cables de alta tensi&oacute;n = descarga potencialmente mortal.
</div>
<div class="mag-mec-warn">
  <strong>C&oacute;mo saber si la bater&iacute;a auxiliar est&aacute; agotada:</strong> el coche no arranca (aunque las luces del cuadro funcionan), da errores el&eacute;ctricos extra&ntilde;os, o el modo EV no entra. Un mult&iacute;metro te lo confirma: por debajo de 11,8 V en reposo, la bater&iacute;a est&aacute; agotada.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bater&iacute;a AGM 12V 45Ah</strong> (no vale una convencional)</li>
<li><strong>Llave de carraca de 10 mm</strong></li>
<li><strong>Guantes aislantes</strong></li>
<li><strong>Linterna frontal</strong></li>
<li><strong>Mult&iacute;metro b&aacute;sico</strong> (para diagn&oacute;stico)</li>
</ul>
'@
  DIAGNOSTICO = @'
<ul>
<li><strong>Motor apagado:</strong> 12,4-12,7 V = sana &middot; 12,0-12,3 V = al 50% &middot; &lt;11,8 V = agotada.</li>
<li><strong>Modo READY activo:</strong> debe marcar 13,8-14,4 V.</li>
<li><strong>S&iacute;ntomas:</strong> el coche no arranca aunque las luces funcionen, errores el&eacute;ctricos, el modo EV no entra.</li>
</ul>
'@
  PASOS = @'
<div class="mag-mec-step"><strong>Paso 1 &mdash; Apaga el coche y espera 90 segundos.</strong> Pulsa el bot&oacute;n POWER en OFF. Espera al menos 90 segundos antes de desconectar la bater&iacute;a para que los sistemas electr&oacute;nicos se apaguen correctamente.</div>
<div class="mag-mec-step"><strong>Paso 2 &mdash; Localiza la bater&iacute;a auxiliar.</strong> En la mayor&iacute;a de los Niro, la bater&iacute;a est&aacute; en el <strong>maletero, lado derecho</strong>, tras un panel de pl&aacute;stico. En algunos Niro II puede estar bajo el asiento trasero.</div>
<div class="mag-mec-step"><strong>Paso 3 &mdash; Retira el panel de acceso.</strong> Retira el panel de pl&aacute;stico que cubre la bater&iacute;a. En la mayor&iacute;a de versiones se suelta con clips o con un destornillador plano.</div>
<div class="mag-mec-step"><strong>Paso 4 &mdash; Desconecta el borne NEGATIVO primero.</strong> Afloja la tuerca con la llave de 10 mm y retira el cable negro ("-"). Es CR&Iacute;TICO desconectar primero el negativo.</div>
<div class="mag-mec-step"><strong>Paso 5 &mdash; Desconecta el borne POSITIVO.</strong> Afloja la tuerca del cable rojo ("+") y ret&iacute;ralo. Col&oacute;calo alejado de cualquier parte met&aacute;lica.</div>
<div class="mag-mec-step"><strong>Paso 6 &mdash; Retira la brida de sujeci&oacute;n.</strong> Afloja los tornillos de la brida met&aacute;lica que sujeta la bater&iacute;a.</div>
<div class="mag-mec-step"><strong>Paso 7 &mdash; Extrae la bater&iacute;a vieja.</strong> S&aacute;cala con cuidado de no inclinarla. La bater&iacute;a AGM pesa unos 12-15 kg.</div>
<div class="mag-mec-step"><strong>Paso 8 &mdash; Instala la nueva bater&iacute;a AGM.</strong> Col&oacute;cala en la misma posici&oacute;n (respeta la polaridad). Vuelve a poner la brida de sujeci&oacute;n.</div>
<div class="mag-mec-step"><strong>Paso 9 &mdash; Conecta el borne POSITIVO primero.</strong> Coloca el cable rojo ("+") y aprieta. Despu&eacute;s, el NEGATIVO ("-").</div>
<div class="mag-mec-step"><strong>Paso 10 &mdash; Reconecta el tubo de ventilaci&oacute;n.</strong> La bater&iacute;a AGM tiene un tubo de ventilaci&oacute;n que debe conectarse correctamente para evacuar gases.</div>
<div class="mag-mec-step"><strong>Paso 11 &mdash; Comprueba y resetea.</strong> Arranca el coche. Verifica luces, radio, elevalunas y sistema h&iacute;brido. Puede que tengas que resetear el reloj y las ventanillas one-touch.</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>100-150 &euro; (solo la bater&iacute;a)</td><td>25-40 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>180-250 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Kia</td><td>230-320 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
<p><strong>Ahorro real:</strong> 90-150 &euro;. En los h&iacute;bridos, el concesionario cobra m&aacute;s por la mano de obra especializada.</p>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar los cables naranjas de alta tensi&oacute;n.</strong> El error m&aacute;s peligroso. Contacto = descarga mortal.</li>
<li><strong>Usar una bater&iacute;a convencional.</strong> Requiere AGM obligatoriamente.</li>
<li><strong>No esperar los 90 segundos.</strong> Puede guardar errores en la centralita.</li>
<li><strong>Desconectar primero el positivo.</strong> Siempre negativo primero.</li>
<li><strong>No conectar el tubo de ventilaci&oacute;n.</strong> La bater&iacute;a AGM lo requiere.</li>
<li><strong>No fijar bien la brida.</strong> Vibraciones y riesgo de cortocircuito.</li>
<li><strong>No resetear los elevalunas.</strong> Pierden la configuraci&oacute;n one-touch.</li>
</ul>
'@
  RAZONES = @'
<ul>
<li><strong>Edad:</strong> 3-5 a&ntilde;os de vida &uacute;til media.</li>
<li><strong>Trayectos cortos:</strong> el sistema h&iacute;brido no tiene tiempo de recargarla.</li>
<li><strong>Consumos par&aacute;sitos:</strong> componentes electr&oacute;nicos que consumen con el coche apagado.</li>
<li><strong>Paradas prolongadas:</strong> si el coche est&aacute; semanas sin usarse, se descarga.</li>
<li><strong>Calor:</strong> en verano, la temperatura acelera el envejecimiento.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Kia Niro H&iacute;brido?</h3>
<p>Bater&iacute;a auxiliar <strong>AGM de 12V y 45Ah</strong>. No es una bater&iacute;a convencional de plomo-&aacute;cido.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a auxiliar del Niro?</h3>
<p>En el maletero, lado derecho, tras un panel de pl&aacute;stico. En algunas versiones puede estar bajo el asiento trasero.</p>
<h3>&iquest;Cu&aacute;nto dura la bater&iacute;a auxiliar del Niro?</h3>
<p>Entre 3 y 5 a&ntilde;os, dependiendo del uso.</p>
<h3>&iquest;Se puede cambiar sin ir al taller?</h3>
<p>S&iacute;, con las herramientas adecuadas. Solo necesitas una llave de 10 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso una bater&iacute;a AGM?</h3>
<p>Se sulfata y falla prematuramente. Puede da&ntilde;ar el sistema de carga.</p>
<h3>&iquest;Se puede cambiar la bater&iacute;a de alta tensi&oacute;n del Niro?</h3>
<p>No es una tarea DIY. La bater&iacute;a de alta tensi&oacute;n est&aacute; dise&ntilde;ada para durar toda la vida del coche y solo la manipulan t&eacute;cnicos certificados. Si falla, es un problema grave (cubierto por garant&iacute;a de 7 a&ntilde;os).</p>
'@
  RESUMEN = "Bater&iacute;a auxiliar <strong>AGM de 12V y 45Ah</strong> obligatoriamente. Ubicada en el maletero (lado derecho) o bajo el asiento trasero, seg&uacute;n versi&oacute;n. Espera 90 segundos antes de desconectar. Negativo primero, positivo despu&eacute;s. Reconecta el tubo de ventilaci&oacute;n. <strong>Nunca toques los cables naranjas</strong> de alta tensi&oacute;n."
  RELATED = '<a href="/mecanica/kia-sportage-cambiar-bateria">Cambiar la bater&iacute;a del Kia Sportage</a>
  <a href="/mecanica/kia-sportage-cambiar-bombilla">Cambiar la bombilla del Kia Sportage</a>
  <a href="/mecanica/kia-ceed-cambiar-bombilla">Cambiar la bombilla del Kia Ceed</a>'
  SCHEMA = $niroSchema
}

# ---------- KIA SPORTAGE ----------
$fichas += @{
  Archivo = "kia-sportage-cambiar-bateria.html"
  SLUG = "kia-sportage-cambiar-bateria"
  MODELO = "Kia Sportage"
  MODELOUPPER = "KIA SPORTAGE"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a del Kia Sportage. Referencias AGM/EFB, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Kia Sportage (Gu&iacute;a 2026)"
  TIEMPO = "30"
  LEAD = "El Kia Sportage es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a. Su bater&iacute;a dura 4-6 a&ntilde;os y, cuando falla, el coche da errores el&eacute;ctricos o no arranca. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso en 30 minutos."
  HERO1N = "4-6"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "70-120"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "70"; KPI1S = "Ah"; KPI1L = "Amperaje t&iacute;pico<br>con ISG"
  KPI2N = "AGM"; KPI2S = ""; KPI2L = "Tipo requerido<br>con Stop&Start"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "5"; KPI4S = "min"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El Kia Sportage es uno de los SUV m&aacute;s vendidos en Espa&ntilde;a gracias a su buena relaci&oacute;n calidad-precio y a sus 7 a&ntilde;os de garant&iacute;a. Su bater&iacute;a tiene una vida &uacute;til media de 4 a 6 a&ntilde;os y, cuando falla, el coche puede no arrancar o dar errores el&eacute;ctricos extra&ntilde;os, especialmente en fr&iacute;o. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones QL y NQ5, a&ntilde;os 2016-2026)."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos generaciones del Kia Sportage comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Kia Sportage QL:</strong> a&ntilde;os 2016-2021.</li>
<li><strong>Kia Sportage NQ5:</strong> a&ntilde;os 2021-2026.</li>
</ul>
<p>En todas las versiones la bater&iacute;a est&aacute; en el <strong>vano motor, lado izquierdo</strong> (mirando el coche desde delante).</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>Sportage sin ISG</td><td>Plomo-&aacute;cido convencional</td><td>60-70 Ah</td><td>60-100 &euro;</td></tr>
<tr><td>Sportage con ISG</td><td>AGM o EFB</td><td>70 Ah</td><td>80-130 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Importante:</strong> Los Kia Sportage con sistema Stop&Start (ISG) llevan una bater&iacute;a <strong>AGM o EFB</strong>, no una bater&iacute;a convencional. Si tu coche tiene ISG, aseg&uacute;rate de comprar una bater&iacute;a AGM compatible. Usar una bater&iacute;a normal puede da&ntilde;ar el sistema de carga.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bater&iacute;a AGM 12V 70Ah</strong> (si tiene ISG) o convencional 12V 70Ah</li>
<li><strong>Llave de carraca de 10 mm</strong> (para los bornes)</li>
<li><strong>Llave de carraca de 12 mm</strong> (para la brida)</li>
<li><strong>Guantes aislantes</strong></li>
</ul>
'@
  DIAGNOSTICO = @'
<ul>
<li><strong>Motor apagado:</strong> 12,4-12,7 V = sana &middot; 12,0-12,3 V = al 50% &middot; &lt;11,8 V = agotada.</li>
<li><strong>Motor arrancado:</strong> debe marcar 13,8-14,4 V.</li>
<li><strong>Arranque:</strong> no debe bajar de 9,6 V.</li>
</ul>
'@
  PASOS = @'
<div class="mag-mec-step"><strong>Paso 1 &mdash; Apaga el motor y espera 5 minutos.</strong> Apaga el motor por completo, quita la llave (o pulsa el bot&oacute;n STOP) y espera al menos 5 minutos antes de desconectar la bater&iacute;a.</div>
<div class="mag-mec-step"><strong>Paso 2 &mdash; Localiza la bater&iacute;a en el vano motor.</strong> En el Kia Sportage, la bater&iacute;a est&aacute; en el <strong>vano motor, lado izquierdo</strong> (mirando el coche desde delante).</div>
<div class="mag-mec-step"><strong>Paso 3 &mdash; Desconecta el borne NEGATIVO primero.</strong> Con una llave de 10 mm, afloja la tuerca del borne <strong>negativo</strong> (cable negro, "-") y ret&iacute;ralo.</div>
<div class="mag-mec-step"><strong>Paso 4 &mdash; Desconecta el borne POSITIVO.</strong> Afloja la tuerca del borne <strong>positivo</strong> (cable rojo, "+") y ret&iacute;ralo. Que no toque ninguna parte met&aacute;lica.</div>
<div class="mag-mec-step"><strong>Paso 5 &mdash; Retira la brida de sujeci&oacute;n y extrae la bater&iacute;a.</strong> Afloja los tornillos con la llave de 12 mm y retira la brida. Saca la bater&iacute;a vieja con cuidado.</div>
<div class="mag-mec-step"><strong>Paso 6 &mdash; Instala la nueva bater&iacute;a.</strong> Col&oacute;cala respetando la polaridad. Vuelve a poner la brida y aprieta. Conecta primero el borne <strong>positivo</strong> (rojo) y despu&eacute;s el <strong>negativo</strong> (negro).</div>
<div class="mag-mec-step"><strong>Paso 7 &mdash; Comprueba el funcionamiento.</strong> Arranca el coche. Comprueba luces, radio, elevalunas, aire acondicionado. Puede que tengas que resetear el reloj y las ventanillas one-touch.</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>80-130 &euro; (solo la bater&iacute;a)</td><td>30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>150-200 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Kia</td><td>180-280 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
<p><strong>Ahorro real:</strong> 70-120 &euro;. La bater&iacute;a AGM de 70Ah es la referencia m&aacute;s com&uacute;n para el Sportage con ISG.</p>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Usar una bater&iacute;a normal en un Sportage con ISG:</strong> el Stop&Start requiere AGM o EFB. Una convencional se sulfatar&aacute; y fallar&aacute; en pocos meses.</li>
<li><strong>Desconectar primero el positivo:</strong> siempre negativo primero, positivo despu&eacute;s.</li>
<li><strong>No respetar la polaridad:</strong> puedes da&ntilde;ar la centralita y el alternador.</li>
<li><strong>Apretar demasiado los bornes:</strong> puedes deformar los terminales.</li>
<li><strong>No revisar el alternador:</strong> si la bater&iacute;a nueva se descarga r&aacute;pido, el problema puede ser el alternador. Revisa la tensi&oacute;n de carga (13,8-14,4 V).</li>
</ul>
'@
  RAZONES = @'
<ul>
<li><strong>Edad:</strong> las bater&iacute;as duran entre 4 y 6 a&ntilde;os.</li>
<li><strong>Trayectos cortos:</strong> el alternador no tiene tiempo suficiente para recargarla.</li>
<li><strong>Consumos par&aacute;sitos:</strong> algunos componentes siguen consumiendo con el coche apagado.</li>
<li><strong>Fr&iacute;o extremo:</strong> las bajas temperaturas reducen la capacidad de arranque.</li>
<li><strong>ISG:</strong> el Stop&Start exige m&aacute;s a la bater&iacute;a y acorta su vida &uacute;til.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Kia Sportage?</h3>
<p>El Kia Sportage (QL y NQ5) con ISG utiliza bater&iacute;a <strong>AGM de 12V y 70Ah</strong>. Los modelos sin ISG pueden llevar bater&iacute;a convencional de 12V 60-70Ah. Verifica siempre la referencia en el manual.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a del Kia Sportage?</h3>
<p>En el <strong>vano motor, lado izquierdo</strong>, mirando el coche desde delante.</p>
<h3>&iquest;Cu&aacute;nto dura la bater&iacute;a del Kia Sportage?</h3>
<p>Entre 4 y 6 a&ntilde;os, dependiendo del uso. Los modelos con ISG suelen necesitar cambio antes.</p>
<h3>&iquest;Se puede cambiar la bater&iacute;a sin ir al taller?</h3>
<p>S&iacute;. Es una tarea sencilla con las herramientas adecuadas. Solo necesitas llaves de 10 y 12 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso una bater&iacute;a AGM en un Sportage con ISG?</h3>
<p>El sistema Stop&Start puede dejar de funcionar y la bater&iacute;a se sulfatar&aacute; prematuramente. Adem&aacute;s, puede da&ntilde;ar el sistema de carga.</p>
'@
  RESUMEN = "Bater&iacute;a AGM de 12V y 70Ah si el Sportage tiene ISG. Ubicada en el vano motor, lado izquierdo. Negativo primero, positivo despu&eacute;s. Llaves de 10 y 12 mm. Ahorro de 70-120 &euro;. Revisa el alternador si la nueva se descarga r&aacute;pido (debe dar 13,8-14,4 V)."
  RELATED = '<a href="/mecanica/kia-sportage-cambiar-bombilla">Cambiar la bombilla del Kia Sportage</a>
  <a href="/mecanica/kia-sportage-cambiar-escobillas">Cambiar las escobillas del Kia Sportage</a>'
  SCHEMA = $sportageSchema
}

# ---------- PEUGEOT 208 ----------
$fichas += @{
  Archivo = "peugeot-208-cambiar-bateria.html"
  SLUG = "peugeot-208-cambiar-bateria"
  MODELO = "Peugeot 208"
  MODELOUPPER = "PEUGEOT 208"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a del Peugeot 208. Referencias EFB/AGM, herramientas, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Peugeot 208 (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El Peugeot 208 es uno de los utilitarios m&aacute;s vendidos en Europa. Su bater&iacute;a tiene una vida &uacute;til media de 4-6 a&ntilde;os y, cuando falla, el coche puede no arrancar o dar errores el&eacute;ctricos. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso."
  HERO1N = "4-6"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "60-100"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "60"; KPI1S = "Ah"; KPI1L = "Amperaje t&iacute;pico<br>(LN2)"
  KPI2N = "EFB"; KPI2S = ""; KPI2L = "Tipo con<br>Stop&Start"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "5"; KPI4S = "min"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El Peugeot 208 es uno de los utilitarios m&aacute;s vendidos en Europa y un habitual de las carreteras espa&ntilde;olas. Su dise&ntilde;o, su interior con el i-Cockpit y su eficiencia lo han convertido en un referente. Su bater&iacute;a tiene una vida &uacute;til media de 4 a 6 a&ntilde;os, y cuando falla, el coche puede no arrancar o dar errores el&eacute;ctricos extra&ntilde;os. En esta gu&iacute;a te explico c&oacute;mo cambiarla paso a paso (generaciones I y II, a&ntilde;os 2012-2026)."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos generaciones del Peugeot 208 comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Peugeot 208 I (A9):</strong> a&ntilde;os 2012-2019. Motores 1.0/1.2 VTi, 1.6 e-HDi.</li>
<li><strong>Peugeot 208 II (P21):</strong> a&ntilde;os 2019-2026. Motores 1.2 PureTech, 1.5 BlueHDi y e-208 (el&eacute;ctrico).</li>
</ul>
<p>En todas las versiones la bater&iacute;a est&aacute; en el <strong>vano motor, lado derecho</strong>, con una tapa de pl&aacute;stico.</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>208 I sin Stop &amp; Start</td><td>Plomo-&aacute;cido est&aacute;ndar</td><td>60 Ah (LN2)</td><td>60-90 &euro;</td></tr>
<tr><td>208 I/II con Stop &amp; Start</td><td>EFB</td><td>60 Ah (LN2)</td><td>90-140 &euro;</td></tr>
<tr><td>e-208 (el&eacute;ctrico)</td><td>AGM auxiliar 12V</td><td>45-60 Ah</td><td>100-150 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>C&oacute;mo saber si tu 208 tiene Stop&Start:</strong> busca el bot&oacute;n en el salpicadero con una "A" may&uacute;scula y flecha. Si lo tiene, tu 208 lleva bater&iacute;a EFB, no convencional.
</div>
<div class="mag-mec-danger">
  <strong>En el e-208 el&eacute;ctrico:</strong> NUNCA toques los cables naranjas de alta tensi&oacute;n. Solo manipulamos la bater&iacute;a auxiliar de 12V.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bater&iacute;a nueva del tipo correcto</strong> (EFB con Stop&Start)</li>
<li><strong>Llave de carraca de 10 mm</strong></li>
<li><strong>Llave de carraca de 13 mm</strong></li>
<li><strong>Guantes aislantes</strong></li>
<li><strong>Mult&iacute;metro b&aacute;sico</strong></li>
</ul>
'@
  DIAGNOSTICO = @'
<ul>
<li><strong>Motor apagado:</strong> 12,4-12,7 V = sana &middot; 12,0-12,3 V = al 50% &middot; &lt;11,8 V = agotada.</li>
<li><strong>Motor arrancado:</strong> debe marcar 13,8-14,4 V.</li>
<li><strong>Arranque:</strong> no debe bajar de 9,6 V.</li>
</ul>
'@
  PASOS = @'
<div class="mag-mec-step"><strong>Paso 1 &mdash; Apaga el motor y espera 5 minutos.</strong> Apaga todas las luces, radio y accesorios.</div>
<div class="mag-mec-step"><strong>Paso 2 &mdash; Localiza la bater&iacute;a.</strong> En el <strong>vano motor, lado derecho</strong>, con una tapa de pl&aacute;stico.</div>
<div class="mag-mec-step"><strong>Paso 3 &mdash; Desconecta el borne NEGATIVO primero.</strong> Afloja la tuerca con la llave de 10 mm. Es CR&Iacute;TICO desconectar el negativo primero.</div>
<div class="mag-mec-step"><strong>Paso 4 &mdash; Desconecta el borne POSITIVO.</strong> Afloja la tuerca del cable rojo.</div>
<div class="mag-mec-step"><strong>Paso 5 &mdash; Retira la brida de sujeci&oacute;n.</strong> Afloja los tornillos con la llave de 13 mm.</div>
<div class="mag-mec-step"><strong>Paso 6 &mdash; Extrae la bater&iacute;a vieja.</strong> S&aacute;cala sin inclinarla.</div>
<div class="mag-mec-step"><strong>Paso 7 &mdash; Coloca la bater&iacute;a nueva.</strong> Respeta la polaridad.</div>
<div class="mag-mec-step"><strong>Paso 8 &mdash; Fija la brida.</strong> La bater&iacute;a NO debe moverse.</div>
<div class="mag-mec-step"><strong>Paso 9 &mdash; Conecta el borne POSITIVO primero.</strong> Despu&eacute;s el NEGATIVO.</div>
<div class="mag-mec-step"><strong>Paso 10 &mdash; Comprueba el funcionamiento.</strong> Arranca y verifica. Puede que tengas que resetear el reloj y las ventanillas one-touch.</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>60-140 &euro; (seg&uacute;n tipo)</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>130-200 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Peugeot</td><td>180-280 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Poner plomo-&aacute;cido en un 208 con Stop &amp; Start.</strong> Se destruye en meses.</li>
<li><strong>Tocar los cables naranjas (e-208).</strong> Peligro mortal.</li>
<li><strong>Desconectar primero el positivo.</strong> Riesgo de cortocircuito.</li>
<li><strong>No respetar la polaridad.</strong> Puede fundir la centralita.</li>
<li><strong>No fijar bien la brida.</strong> Vibraciones y cortocircuito.</li>
<li><strong>No resetear elevalunas.</strong> Pierden la configuraci&oacute;n one-touch.</li>
</ul>
'@
  RAZONES = @'
<ul>
<li><strong>Edad:</strong> 4-6 a&ntilde;os de vida &uacute;til media.</li>
<li><strong>Trayectos cortos:</strong> el alternador no recarga lo suficiente.</li>
<li><strong>Consumos par&aacute;sitos:</strong> la mucha electr&oacute;nica del 208 consume bater&iacute;a.</li>
<li><strong>Fr&iacute;o extremo:</strong> reduce la capacidad de arranque.</li>
<li><strong>Stop &amp; Start:</strong> exige m&aacute;s ciclos de carga/descarga.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Peugeot 208?</h3>
<p>El 208 I/II con Stop &amp; Start usa <strong>EFB de 12V y 60Ah</strong>. Sin Stop &amp; Start puede llevar convencional de 12V 60Ah. El e-208 tiene AGM auxiliar de 12V.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a del 208?</h3>
<p>En el <strong>vano motor, lado derecho</strong>.</p>
<h3>&iquest;Cu&aacute;nto dura?</h3>
<p>4-6 a&ntilde;os (convencional) o 3-5 a&ntilde;os (EFB).</p>
<h3>&iquest;Se puede cambiar sin taller?</h3>
<p>S&iacute;, solo necesitas llaves de 10 y 13 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso bater&iacute;a EFB en un 208 con Stop &amp; Start?</h3>
<p>El Stop &amp; Start deja de funcionar y la bater&iacute;a se sulfata prematuramente.</p>
'@
  RESUMEN = "Bater&iacute;a <strong>EFB de 12V y 60Ah</strong> si el 208 tiene Stop&Start. Convencional de 12V 60Ah si no lo tiene. Ubicada en el vano motor, lado derecho. Negativo primero, positivo despu&eacute;s. Llaves de 10 y 13 mm. Ahorro de 60-100 &euro;."
  RELATED = '<a href="/mecanica/peugeot-208-cambiar-bombilla">Cambiar la bombilla del Peugeot 208</a>
  <a href="/mecanica/peugeot-308-cambiar-bombilla">Cambiar la bombilla del Peugeot 308</a>'
  SCHEMA = $p208Schema
}

# ---------- RENAULT CAPTUR ----------
$fichas += @{
  Archivo = "renault-captur-cambiar-bateria.html"
  SLUG = "renault-captur-cambiar-bateria"
  MODELO = "Renault Captur"
  MODELOUPPER = "RENAULT CAPTUR"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a del Renault Captur. Referencias EFB/AGM, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Renault Captur (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Renault Captur es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Su bater&iacute;a dura 4-6 a&ntilde;os y, cuando falla, el coche no arranca o da errores el&eacute;ctricos. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso en 25 minutos."
  HERO1N = "4-6"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "60-100"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "60"; KPI1S = "Ah"; KPI1L = "Amperaje t&iacute;pico<br>con Stop&Start"
  KPI2N = "EFB"; KPI2S = ""; KPI2L = "Tipo requerido<br>con Stop&Start"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "5"; KPI4S = "min"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El Renault Captur es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a gracias a su dise&ntilde;o, versatilidad y precio competitivo. Su bater&iacute;a tiene una vida &uacute;til media de 4 a 6 a&ntilde;os, y cuando falla, el coche puede no arrancar, dar errores el&eacute;ctricos o incluso fundir la bater&iacute;a en pleno invierno. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones I y II, a&ntilde;os 2013-2026)."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos generaciones del Renault Captur comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Renault Captur I:</strong> a&ntilde;os 2013-2019.</li>
<li><strong>Renault Captur II:</strong> a&ntilde;os 2019-2026.</li>
</ul>
<p>En todas las versiones la bater&iacute;a est&aacute; en el <strong>vano motor, lado derecho</strong>.</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>Captur sin Stop &amp; Start</td><td>Plomo-&aacute;cido convencional</td><td>60 Ah</td><td>60-90 &euro;</td></tr>
<tr><td>Captur con Stop &amp; Start</td><td>EFB</td><td>60 Ah</td><td>90-130 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Importante:</strong> Los Renault Captur con sistema Stop &amp; Start llevan una bater&iacute;a <strong>EFB o AGM</strong>, no una bater&iacute;a convencional. Si tu Captur tiene Stop &amp; Start, compra siempre una bater&iacute;a EFB compatible. Usar una normal puede da&ntilde;ar el sistema de carga.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bater&iacute;a EFB 12V 60Ah</strong> (si tiene Stop&Start) o convencional 12V 60Ah</li>
<li><strong>Llave de carraca de 10 mm</strong> (para los bornes)</li>
<li><strong>Llave de carraca de 13 mm</strong> (para la brida)</li>
<li><strong>Guantes aislantes</strong></li>
</ul>
'@
  DIAGNOSTICO = @'
<ul>
<li><strong>Motor apagado:</strong> 12,4-12,7 V = sana &middot; 12,0-12,3 V = al 50% &middot; &lt;11,8 V = agotada.</li>
<li><strong>Motor arrancado:</strong> debe marcar 13,8-14,4 V.</li>
<li><strong>Arranque:</strong> no debe bajar de 9,6 V.</li>
</ul>
'@
  PASOS = @'
<div class="mag-mec-step"><strong>Paso 1 &mdash; Apaga el motor y espera 5 minutos.</strong> Apaga el motor, quita la llave (o pulsa el bot&oacute;n STOP) y espera al menos 5 minutos antes de desconectar la bater&iacute;a.</div>
<div class="mag-mec-step"><strong>Paso 2 &mdash; Localiza la bater&iacute;a en el vano motor.</strong> En el Renault Captur, la bater&iacute;a est&aacute; en el <strong>vano motor, lado derecho</strong> (mirando el coche desde delante).</div>
<div class="mag-mec-step"><strong>Paso 3 &mdash; Desconecta el borne NEGATIVO primero.</strong> Con una llave de 10 mm, afloja la tuerca del borne <strong>negativo</strong> (cable negro, "-") y ret&iacute;ralo.</div>
<div class="mag-mec-step"><strong>Paso 4 &mdash; Desconecta el borne POSITIVO.</strong> Afloja la tuerca del borne <strong>positivo</strong> (cable rojo, "+") y ret&iacute;ralo. Que no toque ninguna parte met&aacute;lica.</div>
<div class="mag-mec-step"><strong>Paso 5 &mdash; Retira la brida de sujeci&oacute;n y extrae la bater&iacute;a.</strong> Afloja los tornillos con la llave de 13 mm y retira la brida. Saca la bater&iacute;a vieja con cuidado, sin inclinarla.</div>
<div class="mag-mec-step"><strong>Paso 6 &mdash; Instala la nueva bater&iacute;a.</strong> Col&oacute;cala respetando la polaridad. Vuelve a poner la brida. Conecta primero el borne <strong>positivo</strong> (rojo) y despu&eacute;s el <strong>negativo</strong> (negro).</div>
<div class="mag-mec-step"><strong>Paso 7 &mdash; Comprueba el funcionamiento.</strong> Arranca el coche y comprueba todos los sistemas. Puede que tengas que resetear el reloj y las ventanillas one-touch.</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>60-100 &euro; (solo la bater&iacute;a)</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>130-180 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Renault</td><td>180-250 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
<p><strong>Ahorro real:</strong> 60-100 &euro;. La bater&iacute;a EFB de 60Ah es la referencia m&aacute;s com&uacute;n para el Captur con Stop &amp; Start.</p>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Usar una bater&iacute;a normal en un Captur con Stop &amp; Start:</strong> se sulfatar&aacute; y fallar&aacute; en pocos meses.</li>
<li><strong>Desconectar primero el positivo:</strong> siempre negativo primero.</li>
<li><strong>No respetar la polaridad:</strong> puedes da&ntilde;ar la centralita y el alternador.</li>
<li><strong>Apretar demasiado los bornes:</strong> puedes deformar los terminales.</li>
<li><strong>No revisar el alternador:</strong> si la bater&iacute;a nueva se descarga r&aacute;pido, revisa la tensi&oacute;n de carga (13,8-14,4 V).</li>
</ul>
'@
  RAZONES = @'
<ul>
<li><strong>Edad:</strong> 4-6 a&ntilde;os de vida &uacute;til media.</li>
<li><strong>Trayectos cortos:</strong> el alternador no tiene tiempo de recargar.</li>
<li><strong>Consumos par&aacute;sitos:</strong> componentes electr&oacute;nicos que consumen con el coche apagado.</li>
<li><strong>Fr&iacute;o extremo:</strong> reduce la capacidad de arranque.</li>
<li><strong>Stop &amp; Start:</strong> exige m&aacute;s a la bater&iacute;a y acorta su vida &uacute;til.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Renault Captur?</h3>
<p>El Captur I y II con Stop &amp; Start utilizan bater&iacute;a <strong>EFB de 12V y 60Ah</strong>. Los modelos sin Stop &amp; Start pueden llevar bater&iacute;a convencional de 12V 60Ah. Verifica siempre el manual.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a del Renault Captur?</h3>
<p>En el <strong>vano motor, lado derecho</strong>, mirando el coche desde delante.</p>
<h3>&iquest;Cu&aacute;nto dura la bater&iacute;a del Captur?</h3>
<p>Entre 4 y 6 a&ntilde;os, dependiendo del uso.</p>
<h3>&iquest;Se puede cambiar la bater&iacute;a sin taller?</h3>
<p>S&iacute;. Solo necesitas llaves de 10 y 13 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso una bater&iacute;a EFB en un Captur con Stop &amp; Start?</h3>
<p>El sistema Stop &amp; Start puede dejar de funcionar y la bater&iacute;a se sulfatar&aacute; prematuramente. Puede da&ntilde;ar el sistema de carga.</p>
'@
  RESUMEN = "Bater&iacute;a <strong>EFB de 12V y 60Ah</strong> si el Captur tiene Stop&Start. Convencional de 12V 60Ah si no lo tiene. Ubicada en el vano motor, lado derecho. Negativo primero, positivo despu&eacute;s. Llaves de 10 y 13 mm. Ahorro de 60-100 &euro;."
  RELATED = '<a href="/mecanica/renault-captur-cambiar-bombilla">Cambiar la bombilla del Renault Captur</a>
  <a href="/mecanica/renault-clio-cambiar-bateria">Cambiar la bater&iacute;a del Renault Clio</a>
  <a href="/mecanica/renault-clio-cambiar-bombilla">Cambiar la bombilla del Renault Clio</a>'
  SCHEMA = $capturSchema
}

# =========================================================================
# GENERAR ARCHIVOS
# =========================================================================

$generados = 0
$errores = 0

foreach ($ficha in $fichas) {
  $destino = Join-Path $base $ficha.Archivo
  
  # Backup del original
  if (Test-Path $destino) {
    Copy-Item $destino (Join-Path $bk $ficha.Archivo) -Force
  }
  
  # Generar HTML
  $html = $template
  foreach ($key in $ficha.Keys) {
    $html = $html.Replace("%%$key%%", [string]$ficha[$key])
  }
  
  # Guardar
  [System.IO.File]::WriteAllText($destino, $html, [System.Text.UTF8Encoding]::new($false))
  
  Write-Host ""
  Write-Host "=== $($ficha.Archivo) ===" -ForegroundColor Cyan
  Write-Host "  styles-v2 (debe ser 1): $((Select-String -Path $destino -Pattern 'styles-v2').Count)"
  Write-Host "  styles.css residual (debe ser 0): $((Select-String -Path $destino -Pattern 'link.*styles\.css').Count)"
  Write-Host "  mojibake (debe ser 0): $((Select-String -Path $destino -Pattern ([char]0x00C3)).Count)"
  Write-Host "  placeholders residuales %% (debe ser 0): $((Select-String -Path $destino -Pattern '%%[A-Z]' ).Count)"
  Write-Host "  schema @graph: $((Select-String -Path $destino -Pattern '"@graph"').Count)"
  
  if ($html -match '%%[A-Z]') {
    Write-Host "  AVISO: quedan placeholders sin reemplazar" -ForegroundColor Yellow
    $script:errores++
  } else {
    $script:generados++
  }
}

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "Generados: $generados de 5" -ForegroundColor Green
Write-Host "Con avisos: $errores" -ForegroundColor Yellow
Write-Host "Backup: $bk" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# Abrir en navegador
Start-Process "http://localhost:8000/mecanica/hyundai-kona-cambiar-bateria.html"
Start-Process "http://localhost:8000/mecanica/kia-niro-cambiar-bateria.html"
Start-Process "http://localhost:8000/mecanica/kia-sportage-cambiar-bateria.html"
Start-Process "http://localhost:8000/mecanica/peugeot-208-cambiar-bateria.html"
Start-Process "http://localhost:8000/mecanica/renault-captur-cambiar-bateria.html"