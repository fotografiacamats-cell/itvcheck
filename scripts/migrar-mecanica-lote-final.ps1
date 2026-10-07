$base = "C:\Users\Usuario\Desktop\ITVcheck\mecanica"
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$bk = Join-Path $base "..\temp\backups\$ts"
New-Item -ItemType Directory -Path $bk -Force | Out-Null

$templateBombilla = @'
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

$templateBateria = @'
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

$amazonCardsBombilla = @'
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

$amazonCardsBateria = @'
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

$herrBombilla = @'
<ul>
<li><strong>Bombilla H7 hal&oacute;gena</strong> (idealmente dos)</li>
<li><strong>Bombilla W5W</strong></li>
<li><strong>Destornillador Torx T20</strong></li>
<li><strong>Guantes de algod&oacute;n</strong></li>
<li><strong>Linterna frontal</strong></li>
</ul>
'@

$herrBombillaAudiBmw = @'
<ul>
<li><strong>Bombilla H7 hal&oacute;gena</strong> (idealmente dos)</li>
<li><strong>Bombilla W5W</strong></li>
<li><strong>Destornillador Torx T20 y T25</strong></li>
<li><strong>Llave de carraca de 10 mm</strong></li>
<li><strong>Guantes de algod&oacute;n</strong></li>
<li><strong>Linterna frontal</strong></li>
</ul>
'@

$herrBateria = @'
<ul>
<li><strong>Bater&iacute;a nueva (tipo correcto)</strong></li>
<li><strong>Llave de carraca de 10 mm</strong> (bornes)</li>
<li><strong>Llave de carraca de 13 mm</strong> (brida)</li>
<li><strong>Guantes aislantes</strong></li>
<li><strong>Cepillo de alambre</strong></li>
<li><strong>Esc&aacute;ner OBD</strong> (OBDeleven o similar, obligatorio en Golf VII/VIII)</li>
<li><strong>Mult&iacute;metro b&aacute;sico</strong></li>
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
  param($tipo,$slug,$tiempo,$coste,$pasosParaSchema,$faqs,$tipoAccion)
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
  {"@type":"Article","headline":"C\u00f3mo cambiar la $tipoAccion del $tipo","description":"Gu\u00eda paso a paso para sustituir la $tipoAccion del $tipo.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/$slug"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"$tipo","item":"https://itvcheck.es/mecanica/$slug"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la $tipoAccion del $tipo","totalTime":"$tiempo","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"$coste"},"tool":[{"@type":"HowToTool","name":"Destornillador Torx T20"},{"@type":"HowToTool","name":"Guantes aislantes"},{"@type":"HowToTool","name":"Linterna frontal"}],"step":[$stepsJson]},
  {"@type":"FAQPage","mainEntity":[$faqsJson]}
 ]
}
"@
}

# =========================================================================
# FICHAS
# =========================================================================
$fichas = @()

# ---------- AUDI Q3 (bombilla, dificultad alta) ----------
$fichas += @{
  Archivo = "audi-q3-cambiar-bombilla.html"
  TemplateTipo = "bombilla"
  SLUG = "audi-q3-cambiar-bombilla"
  MODELO = "Audi Q3"
  MODELOUPPER = "AUDI Q3"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Audi Q3. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Audi Q3 (Gu&iacute;a 2026)"
  TIEMPO = "30-45"
  LEAD = "El Audi Q3 es uno de los SUV premium m&aacute;s vendidos en Espa&ntilde;a. Ojo: en el Q3 el cambio de bombilla es m&aacute;s complicado que en un coche generalista, porque hay que soltar parcialmente el paso de rueda o el parachoques."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "80-150"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Alta"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "30-45"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Audi Q3 es uno de los SUV premium m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. <strong>Pero ojo: en el Q3 el cambio de bombilla es m&aacute;s complicado que en un coche generalista.</strong> En muchas versiones es necesario soltar parcialmente el paso de rueda o el parachoques. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones 8U y F3, a&ntilde;os 2011-2026)."
  VERSIONES = @'
<ul>
<li><strong>Audi Q3 I (8U):</strong> a&ntilde;os 2011-2018.</li>
<li><strong>Audi Q3 II (F3):</strong> a&ntilde;os 2018-2026. Solo versiones con faros hal&oacute;genos (los acabados altos llevan LED o Matrix LED).</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong>, <strong>Matrix LED</strong> o <strong>bi-xen&oacute;n</strong> no llevan bombillas reemplazables.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>8-18 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>8-18 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-danger">
  <strong>Advertencia importante:</strong> En el Audi Q3 8U, el acceso al faro est&aacute; muy limitado. En muchos casos hay que <strong>soltar el paso de rueda o desmontar parcialmente el parachoques</strong> para poder acceder a la tapa trasera del faro. Si no te ves seguro, acude a un taller.
</div>
<div class="mag-mec-warn">
  <strong>Advertencias:</strong> Enfr&iacute;a el faro 10 minutos. Nunca toques el cristal de la bombilla nueva con los dedos. Ten cuidado con los clips de pl&aacute;stico del parachoques: se rompen con facilidad si fuerzas.
</div>
'@
  HERRAMIENTAS = $herrBombillaAudiBmw
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza el acceso al faro. Ver&aacute;s que el espacio es muy limitado.',
    'Retira el paso de rueda (si es necesario)|Afloja los tornillos Torx que sujetan el paso de rueda delantero. Sep&aacute;ralo con cuidado para acceder al faro.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa y extrae la bombilla|Tira recto hacia afuera con cuidado.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Vuelve a montar el paso de rueda y prueba|Verifica todas las luces.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>16-35 &euro;</td><td>30-45 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>100-160 &euro;</td><td>1-2 horas</td></tr>
<tr><td>Concesionario oficial Audi</td><td>150-230 &euro;</td><td>2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsBombilla
  ERRORES = @'
<ul>
<li><strong>Forzar el paso de rueda.</strong> Puedes romper las grapas.</li>
<li><strong>Tocar el cristal con los dedos.</strong> Usa guantes de algod&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No volver a apretar bien los tornillos.</strong> Vibraciones y ruidos.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. En el Q3, el dise&ntilde;o premium y el poco espacio aceleran el envejecimiento de la bombilla.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Audi Q3?</h3>
<p>Las versiones hal&oacute;genas del Q3 8U y F3 usan <strong>H7</strong> para cruce y carretera, y <strong>W5W</strong> para posici&oacute;n. Las versiones con faros LED o xen&oacute;n no llevan bombillas reemplazables.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>30-45 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el parachoques?</h3>
<p>En muchos casos hay que soltar el paso de rueda parcialmente. Depende del motor y del a&ntilde;o.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Dificultad ALTA: suele requerir soltar el paso de rueda parcialmente. Ahorro de 80-150 &euro;. Si no te ves seguro, mejor taller."
  RELATED = '<a href="/mecanica/audi-a3-cambiar-bombilla">Cambiar la bombilla del Audi A3</a>
  <a href="/mecanica/audi-q3-cambiar-bombilla">Cambiar la bombilla del Audi Q3</a>'
  SCHEMA = New-Schema -tipo "Audi Q3" -slug "audi-q3-cambiar-bombilla" -tiempo "PT35M" -coste "20" -tipoAccion "bombilla" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Soltar paso de rueda|Afloja los tornillos Torx y separa el paso de rueda.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Montar paso de rueda|Vuelve a fijar el paso de rueda.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Audi Q3?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|30-45 minutos.',
    '\u00bfSe puede cambiar sin desmontar el parachoques?|En muchos casos hay que soltar el paso de rueda parcialmente.'
  )
}

# ---------- BMW X1 (bombilla, dificultad alta) ----------
$fichas += @{
  Archivo = "bmw-x1-cambiar-bombilla.html"
  TemplateTipo = "bombilla"
  SLUG = "bmw-x1-cambiar-bombilla"
  MODELO = "BMW X1"
  MODELOUPPER = "BMW X1"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del BMW X1. Referencias H7, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del BMW X1 (Gu&iacute;a 2026)"
  TIEMPO = "35-50"
  LEAD = "El BMW X1 es uno de los SUV premium m&aacute;s vendidos en Espa&ntilde;a. Ojo: el cambio de bombilla en el X1 es complicado, y en muchas versiones requiere soltar el paso de rueda o el parachoques."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "100-180"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Alta"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "35-50"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El BMW X1 es uno de los SUV premium m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. <strong>Pero el proceso de cambio es complicado.</strong> En muchas versiones es necesario soltar parcialmente el paso de rueda o el parachoques. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones E84, F48 y U11, a&ntilde;os 2009-2026)."
  VERSIONES = @'
<ul>
<li><strong>BMW X1 I (E84):</strong> a&ntilde;os 2009-2015.</li>
<li><strong>BMW X1 II (F48):</strong> a&ntilde;os 2015-2022.</li>
<li><strong>BMW X1 III (U11):</strong> a&ntilde;os 2022-2026. Solo versiones con faros hal&oacute;genos (los acabados altos llevan LED).</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> o <strong>bi-xen&oacute;n</strong> no llevan bombillas reemplazables.</p>
'@
  TABLABOMBILLAS = @'
<table class="defect-table">
<tr><th>Funci&oacute;n</th><th>Tipo de bombilla</th><th>Precio orientativo</th></tr>
<tr><td>Luz de cruce</td><td>H7 (55W, 12V)</td><td>8-18 &euro; unidad</td></tr>
<tr><td>Luz de carretera</td><td>H7 (55W, 12V)</td><td>8-18 &euro; unidad</td></tr>
<tr><td>Luz de posici&oacute;n</td><td>W5W (5W, 12V)</td><td>2-5 &euro; unidad</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-danger">
  <strong>Muy importante:</strong> En el BMW X1 (especialmente en el E84) el acceso al faro es especialmente complicado. En muchos casos hay que soltar el paso de rueda y parte del parachoques. <strong>Si no te ves seguro, acude al taller</strong>: el ahorro no compensa el riesgo de romper un clip del parachoques.
</div>
'@
  HERRAMIENTAS = $herrBombillaAudiBmw
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Localiza el acceso al faro. En el X1 el espacio es muy limitado.',
    'Retira los tornillos del paso de rueda|Afloja los tornillos Torx que sujetan el paso de rueda delantero. Sep&aacute;ralo con cuidado.',
    'Retira la tapa protectora del faro|G&iacute;rala un cuarto de vuelta.',
    'Desconecta el conector el&eacute;ctrico|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa met&aacute;lica y extrae la bombilla|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Vuelve a montar el paso de rueda y prueba|Verifica todas las luces.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>16-35 &euro;</td><td>35-50 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>120-180 &euro;</td><td>1-2 horas</td></tr>
<tr><td>Concesionario oficial BMW</td><td>180-280 &euro;</td><td>2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsBombilla
  ERRORES = @'
<ul>
<li><strong>Forzar el paso de rueda.</strong> Puedes romper las grapas.</li>
<li><strong>Tocar el cristal con los dedos.</strong> Usa guantes de algod&oacute;n.</li>
<li><strong>No revisar el fusible.</strong> Si no enciende, revisa el fusible.</li>
<li><strong>Cambiar solo una.</strong> Cambia las dos del mismo faro.</li>
<li><strong>No volver a apretar bien los tornillos.</strong> Vibraciones y ruidos.</li>
</ul>
'@
  RAZONES = @'
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, humedad y tensi&oacute;n el&eacute;ctrica influyen. El dise&ntilde;o premium y el poco espacio en el vano motor aceleran el envejecimiento de la bombilla.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el BMW X1?</h3>
<p>Las versiones hal&oacute;genas del X1 E84 y F48 usan <strong>H7</strong> para cruce y carretera, y <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>35-50 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el paso de rueda?</h3>
<p>En algunos casos s&iacute;, pero en la mayor&iacute;a no. Depende del motor y del a&ntilde;o.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Dificultad ALTA: suele requerir soltar el paso de rueda. Ahorro de 100-180 &euro;. Si no te ves seguro, mejor taller."
  RELATED = '<a href="/mecanica/bmw-serie-1-cambiar-bombilla">Cambiar la bombilla del BMW Serie 1</a>
  <a href="/mecanica/bmw-x1-cambiar-bombilla">Cambiar la bombilla del BMW X1</a>'
  SCHEMA = New-Schema -tipo "BMW X1" -slug "bmw-x1-cambiar-bombilla" -tiempo "PT40M" -coste "20" -tipoAccion "bombilla" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Soltar paso de rueda|Afloja los tornillos Torx y separa el paso de rueda.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Montar paso de rueda|Vuelve a fijar el paso de rueda.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el BMW X1?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|35-50 minutos.',
    '\u00bfSe puede cambiar sin desmontar el paso de rueda?|En la mayor\u00eda de casos no.'
  )
}

# ---------- KIA STONIC (bombilla, fácil) ----------
$fichas += @{
  Archivo = "kia-stonic-cambiar-bombilla.html"
  TemplateTipo = "bombilla"
  SLUG = "kia-stonic-cambiar-bombilla"
  MODELO = "Kia Stonic"
  MODELOUPPER = "KIA STONIC"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bombilla del faro delantero del Kia Stonic. Referencias H7, herramientas, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bombilla del Kia Stonic (Gu&iacute;a 2026)"
  TIEMPO = "15-25"
  LEAD = "El Kia Stonic es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a. Sus bombillas H7 se funden con frecuencia y una fundida es defecto grave en la ITV. La buena noticia: comparte plataforma con el Kia Rio, el acceso es sencillo."
  HERO1N = "H7"; HERO1S = ""; HERO1L = "Tipo de bombilla<br>para cruce y carretera"
  HERO2N = "40-60"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "15-25"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "H7"; KPI2S = ""; KPI2L = "Bombilla principal<br>(cruce/carretera)"
  KPI3N = "W5W"; KPI3S = ""; KPI3L = "Bombilla posici&oacute;n<br>y diurnas"
  KPI4N = "500-1k"; KPI4S = "h"; KPI4L = "Vida &uacute;til media<br>de la bombilla"
  INTRO = "El Kia Stonic es uno de los SUV urbanos m&aacute;s vendidos en Espa&ntilde;a gracias a su dise&ntilde;o y su garant&iacute;a de 7 a&ntilde;os. Sus bombillas H7 se funden con frecuencia y una fundida es <strong>defecto grave</strong> en la ITV. La buena noticia: comparte plataforma con el Kia Rio (YB), as&iacute; que el acceso al faro es <strong>sencillo</strong>. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (a&ntilde;os 2017-2026)."
  VERSIONES = @'
<ul>
<li><strong>Kia Stonic I (2017-2020):</strong> motores 1.2, 1.0 T-GDi, 1.4 y 1.6 CRDi.</li>
<li><strong>Kia Stonic II (2020-2026):</strong> motores 1.0 T-GDi mild-hybrid y 1.0 T-GDi.</li>
</ul>
<p>Las versiones con faros <strong>Full LED</strong> (GT-Line y algunos Drive) no llevan bombillas reemplazables.</p>
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
  <strong>Verifica antes de comprar:</strong> el Stonic comparte plataforma con el Kia Rio (YB). Aun as&iacute;, verifica el tipo exacto en el manual del veh&iacute;culo. Apaga el motor y deja enfriar el faro 10 minutos.
</div>
'@
  HERRAMIENTAS = $herrBombilla
  PASOS = New-Pasos -Items @(
    'Aparca y abre el cap&oacute;|Estaciona en superficie plana y abre el cap&oacute;.',
    'Retira la tapa protectora|G&iacute;rala un cuarto de vuelta en sentido antihorario.',
    'Desconecta el conector|Presiona la pesta&ntilde;a lateral y tira.',
    'Suelta la grapa y extrae la bombilla|Tira recto hacia afuera.',
    'Instala la bombilla nueva|Con guante de algod&oacute;n. <strong>No toques el cristal.</strong>',
    'Reconecta el conector y cierra la tapa|Hasta o&iacute;r un "clic".',
    'Enciende y comprueba|Verifica cruce, carretera, posici&oacute;n e intermitentes.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>6-15 &euro;</td><td>15-25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>35-55 &euro;</td><td>30-60 minutos</td></tr>
<tr><td>Concesionario oficial Kia</td><td>50-80 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCardsBombilla
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
<p>Vida &uacute;til de 500-1.000 horas. Vibraciones, tensi&oacute;n el&eacute;ctrica, encendidos frecuentes y humedad influyen. El uso urbano intensivo acorta la vida &uacute;til.</p>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bombilla lleva el Kia Stonic?</h3>
<p><strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n.</p>
<h3>&iquest;Cu&aacute;nto tiempo se tarda?</h3>
<p>15-25 minutos.</p>
<h3>&iquest;Se puede cambiar sin desmontar el faro?</h3>
<p>S&iacute;, desde el vano motor.</p>
<h3>&iquest;Qu&eacute; pasa si voy con una fundida?</h3>
<p><strong>Defecto grave.</strong> Consulta el <a href="/checklist-itv">checklist ITV</a>.</p>
'@
  RESUMEN = "Bombilla <strong>H7</strong> para cruce y carretera, <strong>W5W</strong> para posici&oacute;n. Acceso c&oacute;modo desde el vano motor. Ahorro de 40-60 &euro;."
  RELATED = '<a href="/mecanica/kia-sportage-cambiar-bombilla">Cambiar la bombilla del Kia Sportage</a>
  <a href="/mecanica/kia-ceed-cambiar-bombilla">Cambiar la bombilla del Kia Ceed</a>'
  SCHEMA = New-Schema -tipo "Kia Stonic" -slug "kia-stonic-cambiar-bombilla" -tiempo "PT20M" -coste "12" -tipoAccion "bombilla" -pasosParaSchema @(
    'Aparcar y enfriar|Apaga el motor y deja enfriar el faro.',
    'Abrir el cap\u00f3|Localiza la tapa trasera del faro.',
    'Retirar la tapa|Gira la tapa protectora.',
    'Desconectar el conector|Presiona la pesta\u00f1a y retira.',
    'Extraer la bombilla|Suelta la grapa y extrae.',
    'Instalar la nueva|Coloca la nueva sin tocar el cristal.',
    'Cerrar y probar|Vuelve a montar y comprueba.'
  ) -faqs @(
    '\u00bfQu\u00e9 bombilla lleva el Kia Stonic?|H7 para cruce y carretera, W5W para posici\u00f3n.',
    '\u00bfCu\u00e1nto tiempo se tarda?|15-25 minutos.',
    '\u00bfSe puede cambiar sin desmontar el faro?|S\u00ed, desde el vano motor.'
  )
}

# ---------- VW GOLF (batería) ----------
$fichas += @{
  Archivo = "volkswagen-golf-cambiar-bateria.html"
  TemplateTipo = "bateria"
  SLUG = "volkswagen-golf-cambiar-bateria"
  MODELO = "Volkswagen Golf"
  MODELOUPPER = "VOLKSWAGEN GOLF"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a del Volkswagen Golf. Referencias EFB/AGM, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Volkswagen Golf (Gu&iacute;a 2026)"
  TIEMPO = "30-45"
  LEAD = "El Volkswagen Golf es un referente entre los compactos europeos. Ojo: en el Golf VII y VIII hay que <strong>registrar la bater&iacute;a nueva con OBD</strong>, un paso cr&iacute;tico que muchos talleres olvidan y que acorta la vida de la bater&iacute;a si no se hace."
  HERO1N = "3-5"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "90-150"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "30-45"; KPI1S = "min"; KPI1L = "Tiempo estimado<br>de la tarea"
  KPI2N = "EFB/AGM"; KPI2S = ""; KPI2L = "Tipo de bater&iacute;a<br>con Start&Stop"
  KPI3N = "OBD"; KPI3S = ""; KPI3L = "Registro obligatorio<br>en Golf VII/VIII"
  KPI4N = "68-70"; KPI4S = "Ah"; KPI4L = "Amperaje<br>t&iacute;pico EFB"
  INTRO = "El Volkswagen Golf es un referente entre los compactos europeos y un coche muy popular en Espa&ntilde;a. Su punto d&eacute;bil es el&eacute;ctrico: la bater&iacute;a auxiliar de 12V dura entre 3 y 5 a&ntilde;os en los modelos con Start&Stop (la mayor&iacute;a desde el Golf VII), y cuando falla, el coche puede no arrancar o dar errores el&eacute;ctricos. En esta gu&iacute;a te explicamos c&oacute;mo cambiarla paso a paso, incluyendo el <strong>registro con OBD</strong> (paso cr&iacute;tico en el Golf VII y VIII)."
  VERSIONES = @'
<ul>
<li><strong>Volkswagen Golf VI:</strong> a&ntilde;os 2008-2012. Motores 1.4 TSI, 1.6/2.0 TDI.</li>
<li><strong>Volkswagen Golf VII:</strong> a&ntilde;os 2012-2019. Motores 1.2/1.4/1.5 TSI, 1.6/2.0 TDI, e-Golf.</li>
<li><strong>Volkswagen Golf VIII:</strong> a&ntilde;os 2019-2026. Motores 1.0/1.5 TSI, 2.0 TDI, GTE (h&iacute;brido enchufable) y e-Golf.</li>
</ul>
<p>El Golf VII y VIII tienen un <strong>sistema de gesti&oacute;n inteligente de bater&iacute;a (BMS)</strong>. La bater&iacute;a nueva hay que <strong>registrarla con un esc&aacute;ner OBD</strong> para que el sistema de carga ajuste los par&aacute;metros. Si no se registra, la bater&iacute;a dura menos.</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Motorizaci&oacute;n</th><th>Tipo de bater&iacute;a</th><th>Amperaje (Ah)</th><th>Precio</th></tr>
<tr><td>1.4 TSI / 1.2 TSI sin Start&amp;Stop</td><td>Plomo-&aacute;cido est&aacute;ndar</td><td>60 Ah</td><td>60-90 &euro;</td></tr>
<tr><td>1.4 TSI / 1.6 TDI con Start&amp;Stop</td><td>EFB</td><td>68-70 Ah</td><td>100-150 &euro;</td></tr>
<tr><td>2.0 TDI con Start&amp;Stop</td><td>AGM o EFB</td><td>70-80 Ah</td><td>130-200 &euro;</td></tr>
<tr><td>Golf GTE (h&iacute;brido enchufable)</td><td>AGM auxiliar</td><td>45-60 Ah</td><td>120-180 &euro;</td></tr>
<tr><td>e-Golf (el&eacute;ctrico)</td><td>Bater&iacute;a 12V auxiliar</td><td>45-50 Ah</td><td>100-150 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-danger">
  <strong>Muy importante en el Golf VII y VIII:</strong> despu&eacute;s de instalar la bater&iacute;a nueva, hay que <strong>registrarla con OBD</strong> (VCDS, OBDeleven o similar). Si no se registra, el sistema de carga sigue tratando la bater&iacute;a nueva como la vieja y no ajusta los par&aacute;metros, acortando su vida &uacute;til entre un 30% y un 50%.
</div>
<div class="mag-mec-warn">
  <strong>C&oacute;mo saber si tu Golf tiene Start&Stop:</strong> busca un bot&oacute;n en el salpicadero con una "A" may&uacute;scula dentro de un c&iacute;rculo con flecha. Si lo tiene, tu Golf lleva bater&iacute;a EFB o AGM, no convencional.
</div>
'@
  HERRAMIENTAS = $herrBateria
  DIAGNOSTICO = @'
<ul>
<li><strong>Motor apagado:</strong> 12,4-12,7 V = sana &middot; 12,0-12,3 V = al 50% &middot; &lt;11,8 V = agotada.</li>
<li><strong>Motor arrancado:</strong> debe marcar 13,8-14,4 V. Si marca menos de 13,2 V, el alternador falla.</li>
<li><strong>Arranque:</strong> no debe bajar de 9,6 V. Si baja m&aacute;s, la bater&iacute;a no tiene capacidad de arranque.</li>
</ul>
'@
  PASOS = New-Pasos -Items @(
    'Apaga el motor y espera 5 minutos|Apaga todas las luces, radio y accesorios. Espera 5 minutos para que los sistemas electr&oacute;nicos se apaguen correctamente.',
    'Localiza la bater&iacute;a|En el Golf la bater&iacute;a est&aacute; en el vano motor, lado izquierdo, cubierta por una tapa de pl&aacute;stico. Retira la tapa para acceder.',
    'Desconecta el borne NEGATIVO primero|Afloja la tuerca con la llave de 10 mm y retira el cable negro ("-"). Es CR&Iacute;TICO desconectar el negativo primero.',
    'Desconecta el borne POSITIVO|Afloja la tuerca del cable rojo ("+") y ret&iacute;ralo. Col&oacute;calo alejado de cualquier parte met&aacute;lica.',
    'Retira la brida de sujeci&oacute;n|Afloja los tornillos con la llave de 13 mm y retira la brida.',
    'Extrae la bater&iacute;a vieja|Suj&eacute;tala por las asas. Mantenla nivelada para evitar derrames de &aacute;cido.',
    'Limpia la bandeja y los bornes|Con el cepillo de alambre, limpia cualquier resto de sulfato de los terminales del coche.',
    'Coloca la bater&iacute;a nueva|Aseg&uacute;rate de que la polaridad coincide. Si no coincide, has comprado el modelo incorrecto.',
    'Fija la brida|Vuelve a colocar la brida y aprieta los tornillos. La bater&iacute;a NO debe moverse.',
    'Conecta el borne POSITIVO primero|Coloca el cable rojo ("+") y aprieta la tuerca. Despu&eacute;s, el NEGATIVO ("-").',
    'REGISTRA LA BATER&Iacute;A NUEVA CON OBD|Obligatorio en el Golf VII y VIII. Conecta el esc&aacute;ner OBD (OBDeleven, VCDS), accede al m&oacute;dulo 19 (Gateway) y sigue: Adaptaci&oacute;n - Bater&iacute;a - Cambiar capacidad/tipo - Guardar.',
    'Comprueba y resetea|Arranca el coche. Verifica luces, radio, elevalunas y aire acondicionado. Puede que tengas que resetear el reloj y las ventanillas one-touch.'
  )
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo (con OBD)</td><td>60-200 &euro;</td><td>30-45 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>150-280 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial VW</td><td>200-350 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
<p><strong>Ahorro real:</strong> 90-150 &euro; seg&uacute;n versi&oacute;n. Si no tienes esc&aacute;ner OBD y tu Golf es VII/VIII, un taller puede cobrarte 30-50 &euro; solo por el registro. Un esc&aacute;ner OBDeleven cuesta 60-100 &euro; y te sirve para muchas m&aacute;s cosas.</p>
'@
  AMAZONCARDS = $amazonCardsBateria
  ERRORES = @'
<ul>
<li><strong>No registrar la bater&iacute;a nueva (Golf VII/VIII).</strong> El error m&aacute;s caro. La bater&iacute;a dura menos.</li>
<li><strong>Poner plomo-&aacute;cido en un Golf con Start&amp;Stop.</strong> Se destruye en meses.</li>
<li><strong>Desconectar primero el positivo.</strong> Riesgo de cortocircuito.</li>
<li><strong>No respetar la polaridad.</strong> Invertir bornes puede fundir la centralita.</li>
<li><strong>Apretar demasiado los bornes.</strong> Deformas los terminales.</li>
<li><strong>No fijar bien la brida.</strong> Vibraciones y riesgo de cortocircuito interno.</li>
<li><strong>No resetear los elevalunas one-touch.</strong> Resetea subi&eacute;ndolos y manteni&eacute;ndolos 3 segundos arriba.</li>
</ul>
'@
  RAZONES = @'
<ul>
<li><strong>Edad:</strong> 3-5 a&ntilde;os en modelos con Start&amp;Stop, 4-6 a&ntilde;os sin.</li>
<li><strong>Trayectos cortos:</strong> el alternador no tiene tiempo de recargar.</li>
<li><strong>Consumos par&aacute;sitos:</strong> componentes electr&oacute;nicos que consumen con el coche apagado.</li>
<li><strong>Fr&iacute;o extremo:</strong> reduce la capacidad de arranque.</li>
<li><strong>Start&amp;Stop:</strong> exige m&aacute;s ciclos de carga/descarga y acorta la vida.</li>
<li><strong>Mucha electr&oacute;nica:</strong> el Golf tiene m&aacute;s sistemas el&eacute;ctricos que la media.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Volkswagen Golf?</h3>
<p>Depende de la versi&oacute;n: 60Ah plomo-&aacute;cido sin Start&amp;Stop, EFB 68-70Ah con Start&amp;Stop, y AGM 70-80Ah en los TDI m&aacute;s potentes. Verifica en el manual o mira la etiqueta de la bater&iacute;a actual.</p>
<h3>&iquest;Es obligatorio registrar la bater&iacute;a nueva?</h3>
<p>En el Golf VII y VIII, s&iacute;. El sistema BMS (Battery Management System) necesita saber que hay una bater&iacute;a nueva para ajustar los par&aacute;metros de carga. Si no se registra, la bater&iacute;a dura menos. En el Golf VI no es necesario.</p>
<h3>&iquest;Cu&aacute;nto dura la bater&iacute;a del Golf?</h3>
<p>Entre 3 y 5 a&ntilde;os en modelos con Start&amp;Stop, 4-6 a&ntilde;os sin. Depende mucho del uso.</p>
<h3>&iquest;Se puede cambiar la bater&iacute;a sin ir al taller?</h3>
<p>S&iacute;, es una tarea asequible con las herramientas adecuadas. El &uacute;nico obst&aacute;culo es el registro con OBD en los Golf VII/VIII, pero puedes hacerlo t&uacute; mismo con un OBDeleven.</p>
<h3>&iquest;Qu&eacute; esc&aacute;ner OBD necesito para registrar la bater&iacute;a?</h3>
<p>Los m&aacute;s usados son OBDeleven (60-100 &euro;) y VCDS (300+ &euro;). OBDeleven es la opci&oacute;n m&aacute;s popular por precio y facilidad de uso.</p>
'@
  RESUMEN = "Bater&iacute;a <strong>EFB o AGM de 68-70Ah</strong> si el Golf tiene Start&Stop. <strong>Registro con OBD obligatorio</strong> en Golf VII y VIII (paso cr&iacute;tico). Negativo primero, positivo despu&eacute;s. Ahorro de 90-150 &euro;. Sin registro, la bater&iacute;a dura un 30-50% menos."
  RELATED = '<a href="/mecanica/volkswagen-golf-cambiar-bombilla">Cambiar la bombilla del Volkswagen Golf</a>
  <a href="/mecanica/volkswagen-golf-cambiar-escobillas">Cambiar las escobillas del Volkswagen Golf</a>'
  SCHEMA = New-Schema -tipo "Volkswagen Golf" -slug "volkswagen-golf-cambiar-bateria" -tiempo "PT35M" -coste "120" -tipoAccion "bater\u00eda" -pasosParaSchema @(
    'Apagar el motor|Apaga el motor y espera 5 minutos.',
    'Localizar la bater\u00eda|En el vano motor, lado izquierdo.',
    'Desconectar negativo|Afloja la tuerca del borne negativo primero.',
    'Desconectar positivo|Afloja la tuerca del borne positivo.',
    'Retirar la brida|Afloja la brida de sujeci\u00f3n.',
    'Instalar la nueva|Coloca la nueva y conecta positivo primero.',
    'Registrar con OBD|Registra la bater\u00eda nueva con OBDeleven o VCDS.',
    'Comprobar|Arranca el coche y verifica.'
  ) -faqs @(
    '\u00bfQu\u00e9 bater\u00eda lleva el Volkswagen Golf?|EFB o AGM de 68-70Ah si tiene Start&Stop. Verifica en el manual.',
    '\u00bfEs obligatorio registrar la bater\u00eda nueva?|En el Golf VII y VIII s\u00ed. El sistema BMS necesita saber que es nueva.',
    '\u00bfQu\u00e9 esc\u00e1ner OBD necesito?|OBDeleven (60-100\u20ac) o VCDS (300+\u20ac). OBDeleven es el m\u00e1s popular.'
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
  if ($ficha.TemplateTipo -eq "bateria") {
    $template = $templateBateria
  } else {
    $template = $templateBombilla
  }
  $html = $template
  foreach ($key in $ficha.Keys) {
    if ($key -eq 'TemplateTipo') { continue }
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
Write-Host "Generados: $generados de 4" -ForegroundColor Green
Write-Host "Con avisos: $avisos" -ForegroundColor Yellow
Write-Host "Backup: $bk" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

Start-Process "http://localhost:8000/mecanica/audi-q3-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/bmw-x1-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/kia-stonic-cambiar-bombilla.html"
Start-Process "http://localhost:8000/mecanica/volkswagen-golf-cambiar-bateria.html"