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
# AMAZON CARDS
# =========================================================================
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
# DEFINIR FICHAS
# =========================================================================
$fichas = @()

# ---------- 1. RENAULT CLIO ----------
$fichas += @{
  Archivo = "renault-clio-cambiar-bateria.html"
  SLUG = "renault-clio-cambiar-bateria"
  MODELO = "Renault Clio"
  MODELOUPPER = "RENAULT CLIO"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a del Renault Clio. Referencias EFB/AGM, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Renault Clio (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Renault Clio es uno de los coches m&aacute;s vendidos en Europa. Su bater&iacute;a dura 4-6 a&ntilde;os y, cuando falla, el coche no arranca o da errores el&eacute;ctricos. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso en 25 minutos."
  HERO1N = "4-6"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "60-100"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "60"; KPI1S = "Ah"; KPI1L = "Amperaje t&iacute;pico<br>(LN2)"
  KPI2N = "EFB"; KPI2S = ""; KPI2L = "Tipo con<br>Stop&Start"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "5"; KPI4S = "min"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El Renault Clio es uno de los coches m&aacute;s vendidos en Europa y un habitual de las carreteras espa&ntilde;olas. Su bater&iacute;a tiene una vida &uacute;til media de 4 a 6 a&ntilde;os, y cuando falla, el coche puede no arrancar, dar errores el&eacute;ctricos o quedarse tirado en el peor momento. En esta gu&iacute;a te explicamos paso a paso c&oacute;mo cambiarla (generaciones III, IV y V, a&ntilde;os 2005-2026)."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las tres generaciones del Renault Clio comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Renault Clio III:</strong> a&ntilde;os 2005-2012.</li>
<li><strong>Renault Clio IV:</strong> a&ntilde;os 2012-2019.</li>
<li><strong>Renault Clio V:</strong> a&ntilde;os 2019-2026.</li>
</ul>
<p>En todas las versiones la bater&iacute;a est&aacute; en el <strong>vano motor, lado derecho</strong> (mirando el coche desde delante).</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>Clio III/IV/V sin Stop &amp; Start</td><td>Plomo-&aacute;cido convencional</td><td>60 Ah (LN2)</td><td>60-90 &euro;</td></tr>
<tr><td>Clio IV/V con Stop &amp; Start</td><td>EFB</td><td>60 Ah (LN2)</td><td>90-140 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>Importante:</strong> Los Renault Clio con sistema Stop &amp; Start llevan bater&iacute;a <strong>EFB o AGM</strong>, no convencional. Si tu Clio tiene Stop &amp; Start, compra siempre una bater&iacute;a EFB compatible. Usar una normal puede da&ntilde;ar el sistema de carga.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bater&iacute;a 12V 60Ah LN2</strong> (EFB si tiene Stop&Start)</li>
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
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Apaga el motor y espera 5 minutos</strong>
    <p>Apaga el motor y espera al menos 5 minutos antes de desconectar la bater&iacute;a para que los sistemas electr&oacute;nicos se apaguen correctamente.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Localiza la bater&iacute;a</strong>
    <p>En el Renault Clio, la bater&iacute;a est&aacute; en el vano motor, lado derecho (mirando el coche desde delante).</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne negativo primero</strong>
    <p>Con una llave de 10 mm, afloja la tuerca del borne negativo (cable negro, "-") y ret&iacute;ralo. Es fundamental desconectar primero el negativo.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne positivo</strong>
    <p>Afloja la tuerca del borne positivo (cable rojo, "+") y ret&iacute;ralo. Que no toque ninguna parte met&aacute;lica del coche.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Retira la brida y extrae la bater&iacute;a</strong>
    <p>Afloja los tornillos de la brida met&aacute;lica con la llave de 13 mm y ret&iacute;rala. Saca la bater&iacute;a vieja con cuidado, sin inclinarla.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Instala la nueva bater&iacute;a</strong>
    <p>Coloca la nueva respetando la polaridad. Vuelve a poner la brida. Conecta primero el borne positivo (rojo) y despu&eacute;s el negativo (negro). Aprieta bien las tuercas.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Comprueba el funcionamiento</strong>
    <p>Arranca el coche y comprueba todos los sistemas (luces, radio, elevalunas). Es posible que tengas que resetear el reloj y las ventanillas one-touch.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>60-100 &euro; (solo la bater&iacute;a)</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>130-180 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Renault</td><td>180-250 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
<p><strong>Ahorro real:</strong> 60-100 &euro;. La bater&iacute;a EFB de 60Ah es la referencia m&aacute;s com&uacute;n para el Clio con Stop &amp; Start.</p>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Usar una bater&iacute;a normal en un Clio con Stop &amp; Start:</strong> se sulfatar&aacute; y fallar&aacute; en pocos meses.</li>
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
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Renault Clio?</h3>
<p>El Clio III, IV y V con Stop &amp; Start utilizan bater&iacute;a <strong>EFB de 12V y 60Ah (LN2)</strong>. Los modelos sin Stop &amp; Start pueden llevar bater&iacute;a convencional de 12V 60Ah.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a del Renault Clio?</h3>
<p>En el <strong>vano motor, lado derecho</strong>, mirando el coche desde delante.</p>
<h3>&iquest;Cu&aacute;nto dura la bater&iacute;a del Clio?</h3>
<p>Entre 4 y 6 a&ntilde;os, dependiendo del uso.</p>
<h3>&iquest;Se puede cambiar la bater&iacute;a sin taller?</h3>
<p>S&iacute;. Solo necesitas llaves de 10 y 13 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso una bater&iacute;a EFB en un Clio con Stop &amp; Start?</h3>
<p>El sistema Stop &amp; Start puede dejar de funcionar y la bater&iacute;a se sulfatar&aacute; prematuramente.</p>
'@
  RESUMEN = "Bater&iacute;a <strong>EFB de 12V y 60Ah (LN2)</strong> si el Clio tiene Stop&Start. Convencional de 12V 60Ah si no lo tiene. Ubicada en el vano motor, lado derecho. Negativo primero, positivo despu&eacute;s. Llaves de 10 y 13 mm. Ahorro de 60-100 &euro;."
  RELATED = '<a href="/mecanica/renault-clio-cambiar-bombilla">Cambiar la bombilla del Renault Clio</a>
  <a href="/mecanica/renault-clio-cambiar-escobillas">Cambiar las escobillas del Renault Clio</a>
  <a href="/mecanica/renault-captur-cambiar-bateria">Cambiar la bater&iacute;a del Renault Captur</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del Renault Clio","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda del Renault Clio.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/renault-clio-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Renault Clio","item":"https://itvcheck.es/mecanica/renault-clio-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del Renault Clio","totalTime":"PT25M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"90"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Llave de carraca de 13 mm"},{"@type":"HowToTool","name":"Guantes aislantes"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda 12V 60Ah LN2"}],"step":[{"@type":"HowToStep","name":"Apagar el motor","text":"Apaga el motor y espera 5 minutos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el vano motor, lado derecho."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el Renault Clio?","acceptedAnswer":{"@type":"Answer","text":"EFB de 12V y 60Ah (LN2) si tiene Stop & Start. Convencional de 12V 60Ah si no lo tiene."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda?","acceptedAnswer":{"@type":"Answer","text":"En el vano motor, lado derecho."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"Entre 4 y 6 a\u00f1os, dependiendo del uso."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, solo necesitas llaves de 10 y 13 mm."}}]}
 ]
}
'@
}

# ---------- 2. SEAT IBIZA ----------
$fichas += @{
  Archivo = "seat-ibiza-cambiar-bateria.html"
  SLUG = "seat-ibiza-cambiar-bateria"
  MODELO = "SEAT Ibiza"
  MODELOUPPER = "SEAT IBIZA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a del SEAT Ibiza. Referencias EFB/AGM, herramientas, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del SEAT Ibiza (Gu&iacute;a 2026)"
  TIEMPO = "20-30"
  LEAD = "El SEAT Ibiza es uno de los coches m&aacute;s vendidos en Espa&ntilde;a. Su bater&iacute;a dura 4-6 a&ntilde;os y, cuando falla, el coche no arranca o da errores el&eacute;ctricos. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso."
  HERO1N = "4-6"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "60-100"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "60"; KPI1S = "Ah"; KPI1L = "Amperaje t&iacute;pico<br>(LN2)"
  KPI2N = "EFB"; KPI2S = ""; KPI2L = "Tipo con<br>Stop&Start"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "5"; KPI4S = "min"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El SEAT Ibiza es uno de los coches m&aacute;s vendidos en Espa&ntilde;a a&ntilde;o tras a&ntilde;o. Su dise&ntilde;o deportivo, su fiabilidad y su buena relaci&oacute;n calidad-precio lo han convertido en un referente del segmento B. Su bater&iacute;a tiene una vida &uacute;til media de 4 a 6 a&ntilde;os, y cuando falla, el coche puede no arrancar o dar errores el&eacute;ctricos extra&ntilde;os. En esta gu&iacute;a te explicamos c&oacute;mo cambiarla (generaciones 6J y 6F, a&ntilde;os 2008-2026)."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos generaciones del SEAT Ibiza comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>SEAT Ibiza IV (6J):</strong> a&ntilde;os 2008-2017. Motores 1.0, 1.2 TSI, 1.4, 1.6 TDI.</li>
<li><strong>SEAT Ibiza V (6F):</strong> a&ntilde;os 2017-2026. Motores 1.0 TSI, 1.0 MPI, 1.5 TSI, 1.6 TDI.</li>
</ul>
<p>En todas las versiones la bater&iacute;a est&aacute; en el <strong>vano motor, lado derecho</strong>.</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>Ibiza 6J sin Stop &amp; Start</td><td>Plomo-&aacute;cido convencional</td><td>60 Ah (LN2)</td><td>60-90 &euro;</td></tr>
<tr><td>Ibiza 6J/6F con Stop &amp; Start</td><td>EFB</td><td>60 Ah (LN2)</td><td>90-140 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-warn">
  <strong>C&oacute;mo saber si tu Ibiza tiene Start&Stop:</strong> busca el bot&oacute;n en el salpicadero con una "A" may&uacute;scula y flecha. Si lo tiene, tu Ibiza lleva bater&iacute;a EFB, no convencional.
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
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Apaga el motor y espera 5 minutos</strong>
    <p>Apaga luces, radio y accesorios. Espera al menos 5 minutos antes de desconectar la bater&iacute;a.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Localiza la bater&iacute;a</strong>
    <p>Est&aacute; en el vano motor, lado derecho (mirando el coche desde delante).</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne negativo primero</strong>
    <p>Afloja la tuerca con la llave de 10 mm. Es CR&Iacute;TICO desconectar el negativo primero.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne positivo</strong>
    <p>Afloja la tuerca del cable rojo ("+") y ret&iacute;ralo.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Retira la brida de sujeci&oacute;n</strong>
    <p>Afloja los tornillos con la llave de 13 mm.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Extrae la bater&iacute;a vieja</strong>
    <p>S&aacute;cala sin inclinarla.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Coloca la bater&iacute;a nueva</strong>
    <p>Respeta la polaridad.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">8</span>
  <div class="mag-mec-step-body">
    <strong>Fija la brida</strong>
    <p>La bater&iacute;a NO debe moverse.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">9</span>
  <div class="mag-mec-step-body">
    <strong>Conecta el borne positivo primero</strong>
    <p>Despu&eacute;s el negativo.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">10</span>
  <div class="mag-mec-step-body">
    <strong>Comprueba el funcionamiento</strong>
    <p>Arranca y verifica. Puede que tengas que resetear el reloj y las ventanillas one-touch.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>60-140 &euro; (seg&uacute;n tipo)</td><td>20-30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>130-200 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial SEAT</td><td>180-280 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Poner plomo-&aacute;cido en un Ibiza con Stop &amp; Start.</strong> Se destruye en meses.</li>
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
<li><strong>Consumos par&aacute;sitos:</strong> la electr&oacute;nica del Ibiza consume bater&iacute;a.</li>
<li><strong>Fr&iacute;o extremo:</strong> reduce la capacidad de arranque.</li>
<li><strong>Stop &amp; Start:</strong> exige m&aacute;s ciclos de carga/descarga.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el SEAT Ibiza?</h3>
<p>El Ibiza 6J/6F con Stop &amp; Start usa <strong>EFB de 12V y 60Ah</strong>. Sin Stop &amp; Start puede llevar convencional de 12V 60Ah.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a del Ibiza?</h3>
<p>En el <strong>vano motor, lado derecho</strong>.</p>
<h3>&iquest;Cu&aacute;nto dura?</h3>
<p>4-6 a&ntilde;os (convencional) o 3-5 a&ntilde;os (EFB).</p>
<h3>&iquest;Se puede cambiar sin taller?</h3>
<p>S&iacute;, solo necesitas llaves de 10 y 13 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso bater&iacute;a EFB en un Ibiza con Stop &amp; Start?</h3>
<p>El Stop &amp; Start deja de funcionar y la bater&iacute;a se sulfata prematuramente.</p>
'@
  RESUMEN = "Bater&iacute;a <strong>EFB de 12V y 60Ah</strong> si el Ibiza tiene Stop&Start. Convencional de 12V 60Ah si no lo tiene. Ubicada en el vano motor, lado derecho. Negativo primero, positivo despu&eacute;s. Llaves de 10 y 13 mm. Ahorro de 60-100 &euro;."
  RELATED = '<a href="/mecanica/seat-ibiza-cambiar-bombilla">Cambiar la bombilla del SEAT Ibiza</a>
  <a href="/mecanica/seat-leon-cambiar-bombilla">Cambiar la bombilla del SEAT Le&oacute;n</a>
  <a href="/mecanica/seat-arona-cambiar-bombilla">Cambiar la bombilla del SEAT Arona</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del SEAT Ibiza","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda del SEAT Ibiza.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/seat-ibiza-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"SEAT Ibiza","item":"https://itvcheck.es/mecanica/seat-ibiza-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del SEAT Ibiza","totalTime":"PT25M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"100"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Llave de carraca de 13 mm"},{"@type":"HowToTool","name":"Guantes aislantes"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda EFB 12V 60Ah"}],"step":[{"@type":"HowToStep","name":"Apagar el motor","text":"Apaga el motor y espera 5 minutos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el vano motor, lado derecho."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el SEAT Ibiza?","acceptedAnswer":{"@type":"Answer","text":"EFB de 12V y 60Ah si tiene Stop & Start. Convencional de 12V 60Ah si no lo tiene."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda?","acceptedAnswer":{"@type":"Answer","text":"En el vano motor, lado derecho."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"4-6 a\u00f1os (convencional) o 3-5 a\u00f1os (EFB)."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, solo necesitas llaves de 10 y 13 mm."}}]}
 ]
}
'@
}

# ---------- 3. TOYOTA COROLLA ----------
$fichas += @{
  Archivo = "toyota-corolla-cambiar-bateria.html"
  SLUG = "toyota-corolla-cambiar-bateria"
  MODELO = "Toyota Corolla H&iacute;brido"
  MODELOUPPER = "TOYOTA COROLLA"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a de 12V del Toyota Corolla H&iacute;brido. Referencias AGM, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Toyota Corolla H&iacute;brido (Gu&iacute;a 2026)"
  TIEMPO = "30"
  LEAD = "El Toyota Corolla es el coche h&iacute;brido m&aacute;s vendido en Espa&ntilde;a. Su sistema h&iacute;brido es extremadamente fiable, pero la bater&iacute;a auxiliar de 12V tiene una vida &uacute;til limitada de entre 3 y 5 a&ntilde;os. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso."
  HERO1N = "3-5"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "80-120"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "50"; KPI1S = "Ah"; KPI1L = "Amperaje<br>t&iacute;pico AGM"
  KPI2N = "AGM"; KPI2S = ""; KPI2L = "Tipo obligatorio<br>(no convencional)"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "90"; KPI4S = "seg"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El Toyota Corolla es el coche h&iacute;brido m&aacute;s vendido en Espa&ntilde;a. Su sistema h&iacute;brido es extremadamente fiable, pero la bater&iacute;a auxiliar de 12V tiene una vida &uacute;til limitada de entre 3 y 5 a&ntilde;os. Cuando falla, el coche puede no arrancar o dar errores extra&ntilde;os. En esta gu&iacute;a te explicamos c&oacute;mo cambiarla (generaci&oacute;n E210, a&ntilde;os 2019-2026)."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las versiones del Toyota Corolla H&iacute;brido comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Toyota Corolla E210:</strong> a&ntilde;os 2019-2026. Versiones sed&aacute;n, hatchback y Touring Sports.</li>
<li>Motorizaciones: 1.8 Hybrid (122 CV) y 2.0 Hybrid (180-196 CV).</li>
</ul>
<p>La bater&iacute;a de 12V est&aacute; en el <strong>maletero, lado derecho</strong>, tras un panel de pl&aacute;stico.</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a auxiliar</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>Corolla 1.8 Hybrid</td><td>AGM LN1 12V</td><td>50 Ah</td><td>100-150 &euro;</td></tr>
<tr><td>Corolla 2.0 Hybrid</td><td>AGM LN1 12V</td><td>50 Ah</td><td>100-150 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-danger">
  <strong>MUY IMPORTANTE:</strong> El Corolla H&iacute;brido lleva una bater&iacute;a <strong>AGM</strong>, no una de plomo-&aacute;cido convencional. Usar el tipo incorrecto puede da&ntilde;ar el sistema de carga. <strong>Nunca toques los cables naranjas de alta tensi&oacute;n</strong> (descarga potencialmente mortal).
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bater&iacute;a AGM LN1 12V 50Ah</strong> (no vale una convencional)</li>
<li><strong>Llave de carraca de 10 mm</strong></li>
<li><strong>Guantes aislantes</strong></li>
<li><strong>Linterna frontal</strong></li>
<li><strong>Mult&iacute;metro b&aacute;sico</strong></li>
</ul>
'@
  DIAGNOSTICO = @'
<ul>
<li><strong>Motor apagado:</strong> 12,4-12,7 V = sana &middot; 12,0-12,3 V = al 50% &middot; &lt;11,8 V = agotada.</li>
<li><strong>Modo READY activo:</strong> debe marcar 13,8-14,4 V.</li>
<li><strong>S&iacute;ntomas:</strong> el coche no entra en READY, el multimedia se reinicia, los elevalunas no funcionan.</li>
</ul>
'@
  PASOS = @'
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Apaga el coche y espera 90 segundos</strong>
    <p>Apaga el motor por completo (bot&oacute;n POWER en OFF). Espera al menos 90 segundos antes de desconectar la bater&iacute;a para que los sistemas electr&oacute;nicos se apaguen correctamente.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Localiza la bater&iacute;a en el maletero</strong>
    <p>En el Corolla H&iacute;brido la bater&iacute;a de 12V est&aacute; en el maletero, lado derecho, detr&aacute;s de un panel de pl&aacute;stico.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne negativo primero</strong>
    <p>Con una llave de 10 mm, afloja el borne negativo (cable negro, "-") y ret&iacute;ralo.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne positivo</strong>
    <p>Afloja el borne positivo (cable rojo, "+") y ret&iacute;ralo.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Retira la brida de sujeci&oacute;n</strong>
    <p>Afloja los tornillos de la brida met&aacute;lica con la llave de 10 mm y saca la bater&iacute;a vieja con cuidado.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Instala la nueva bater&iacute;a AGM</strong>
    <p>Coloca la nueva bater&iacute;a. Conecta primero el borne positivo y despu&eacute;s el negativo. Aprieta bien las tuercas. Reconecta el tubo de ventilaci&oacute;n.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Comprueba el funcionamiento</strong>
    <p>Arranca el coche. Comprueba luces, radio, elevalunas. Puede que tengas que resetear el reloj y las ventanillas one-touch.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>80-120 &euro;</td><td>30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>150-200 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Toyota</td><td>200-280 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Usar una bater&iacute;a convencional:</strong> requiere AGM obligatoriamente.</li>
<li><strong>No esperar los 90 segundos:</strong> puede guardar errores en la centralita.</li>
<li><strong>Desconectar primero el positivo:</strong> siempre negativo primero.</li>
<li><strong>No conectar el tubo de ventilaci&oacute;n:</strong> la bater&iacute;a AGM lo requiere.</li>
<li><strong>Tocar los cables naranjas de alta tensi&oacute;n:</strong> descarga potencialmente mortal.</li>
</ul>
'@
  RAZONES = @'
<ul>
<li><strong>Edad:</strong> 3-5 a&ntilde;os de vida &uacute;til media.</li>
<li><strong>Trayectos cortos:</strong> el sistema h&iacute;brido no tiene tiempo de recargarla.</li>
<li><strong>Consumos par&aacute;sitos:</strong> la electr&oacute;nica del Corolla consume con el coche apagado.</li>
<li><strong>Paradas prolongadas:</strong> si el coche est&aacute; semanas sin usarse, se descarga.</li>
<li><strong>Calor:</strong> en verano, la temperatura acelera el envejecimiento.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Toyota Corolla H&iacute;brido?</h3>
<p>Bater&iacute;a <strong>AGM LN1 de 12V y 50Ah</strong>, con CCA m&iacute;nimo de 295A.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a?</h3>
<p>En el <strong>maletero, lado derecho</strong>, tras un panel de pl&aacute;stico.</p>
<h3>&iquest;Cu&aacute;nto dura?</h3>
<p>Entre 3 y 5 a&ntilde;os.</p>
<h3>&iquest;Se puede cambiar sin taller?</h3>
<p>S&iacute;. Solo necesitas una llave de 10 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso AGM?</h3>
<p>Se sulfatar&aacute; y fallar&aacute; prematuramente. Puede da&ntilde;ar el sistema de carga.</p>
'@
  RESUMEN = "Bater&iacute;a auxiliar <strong>AGM LN1 de 12V y 50Ah</strong> obligatoriamente. Ubicada en el maletero, lado derecho, tras un panel. Espera 90 segundos antes de desconectar. Negativo primero, positivo despu&eacute;s. Reconecta el tubo de ventilaci&oacute;n. <strong>Nunca toques los cables naranjas</strong> de alta tensi&oacute;n."
  RELATED = '<a href="/mecanica/toyota-corolla-cambiar-bateria">Cambiar la bater&iacute;a del Toyota Corolla</a>
  <a href="/mecanica/toyota-yaris-cambiar-bateria">Cambiar la bater&iacute;a del Toyota Yaris</a>
  <a href="/mecanica/toyota-rav4-cambiar-bateria">Cambiar la bater&iacute;a del Toyota RAV4</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del Toyota Corolla H\u00edbrido","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda de 12V del Toyota Corolla H\u00edbrido.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/toyota-corolla-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Toyota Corolla","item":"https://itvcheck.es/mecanica/toyota-corolla-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del Toyota Corolla H\u00edbrido","totalTime":"PT30M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"120"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Guantes aislantes"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda AGM LN1 12V 50Ah"}],"step":[{"@type":"HowToStep","name":"Apagar el coche","text":"Apaga el motor y espera 90 segundos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el maletero, lado derecho, tras el panel."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva bater\u00eda AGM y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el Toyota Corolla H\u00edbrido?","acceptedAnswer":{"@type":"Answer","text":"Bater\u00eda AGM LN1 de 12V y 50Ah, con CCA m\u00ednimo de 295A."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda?","acceptedAnswer":{"@type":"Answer","text":"En el maletero, lado derecho, tras un panel de pl\u00e1stico."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"Entre 3 y 5 a\u00f1os."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, solo necesitas una llave de 10 mm."}}]}
 ]
}
'@
}

# ---------- 4. TOYOTA RAV4 ----------
$fichas += @{
  Archivo = "toyota-rav4-cambiar-bateria.html"
  SLUG = "toyota-rav4-cambiar-bateria"
  MODELO = "Toyota RAV4 H&iacute;brido"
  MODELOUPPER = "TOYOTA RAV4"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a de 12V del Toyota RAV4 H&iacute;brido. Referencias AGM, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Toyota RAV4 H&iacute;brido (Gu&iacute;a 2026)"
  TIEMPO = "30"
  LEAD = "El Toyota RAV4 es el SUV h&iacute;brido m&aacute;s vendido en Espa&ntilde;a. Su sistema h&iacute;brido es muy duradero, pero la bater&iacute;a auxiliar de 12V se agota a los 3-5 a&ntilde;os. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso."
  HERO1N = "3-5"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "80-130"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "Media"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "55"; KPI1S = "Ah"; KPI1L = "Amperaje<br>t&iacute;pico AGM"
  KPI2N = "AGM"; KPI2S = ""; KPI2L = "Tipo obligatorio<br>(no convencional)"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "90"; KPI4S = "seg"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El Toyota RAV4 es el SUV h&iacute;brido m&aacute;s vendido en Espa&ntilde;a y uno de los coches m&aacute;s fiables del mercado. Su sistema h&iacute;brido es extremadamente duradero, pero la bater&iacute;a auxiliar de 12V tiene una vida &uacute;til de 3 a 5 a&ntilde;os. En esta gu&iacute;a te explicamos c&oacute;mo cambiarla (generaciones XA40 y XA50, a&ntilde;os 2013-2026). A diferencia de la mayor&iacute;a de coches, la bater&iacute;a est&aacute; en el maletero."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos generaciones del Toyota RAV4 H&iacute;brido comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Toyota RAV4 XA40:</strong> a&ntilde;os 2013-2018. Versiones 2.5 Hybrid.</li>
<li><strong>Toyota RAV4 XA50:</strong> a&ntilde;os 2018-2026. Versiones 2.5 Hybrid y 2.5 Hybrid AWD-i.</li>
</ul>
<p>La bater&iacute;a de 12V est&aacute; en el <strong>maletero, lado derecho</strong>, tras un panel de pl&aacute;stico.</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a auxiliar</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>RAV4 Hybrid XA40 (2013-2018)</td><td>AGM 12V</td><td>55 Ah</td><td>100-160 &euro;</td></tr>
<tr><td>RAV4 Hybrid XA50 (2018-2026)</td><td>AGM 12V</td><td>55 Ah</td><td>100-160 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-danger">
  <strong>MUY IMPORTANTE:</strong> El RAV4 H&iacute;brido lleva bater&iacute;a <strong>AGM</strong>. Nunca uses una bater&iacute;a convencional. <strong>Nunca toques los cables naranjas de alta tensi&oacute;n:</strong> pueden causar una descarga el&eacute;ctrica mortal.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bater&iacute;a AGM 12V 55Ah</strong></li>
<li><strong>Llave de carraca de 10 mm</strong></li>
<li><strong>Guantes aislantes</strong></li>
<li><strong>Linterna frontal</strong></li>
<li><strong>Mult&iacute;metro b&aacute;sico</strong></li>
</ul>
'@
  DIAGNOSTICO = @'
<ul>
<li><strong>Motor apagado:</strong> 12,4-12,7 V = sana &middot; 12,0-12,3 V = al 50% &middot; &lt;11,8 V = agotada.</li>
<li><strong>Modo READY activo:</strong> debe marcar 13,8-14,4 V.</li>
<li><strong>S&iacute;ntomas:</strong> el coche no entra en READY, el multimedia se reinicia, los elevalunas no funcionan.</li>
</ul>
'@
  PASOS = @'
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Apaga el coche y espera 90 segundos</strong>
    <p>Permite que los sistemas electr&oacute;nicos se apaguen correctamente antes de desconectar la bater&iacute;a.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Localiza la bater&iacute;a en el maletero</strong>
    <p>Est&aacute; en el maletero, lado derecho, detr&aacute;s de un panel de pl&aacute;stico.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne negativo primero</strong>
    <p>Afloja la tuerca con llave de 10 mm y retira el cable negro ("-").</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne positivo</strong>
    <p>Afloja la tuerca del cable rojo ("+") y ret&iacute;ralo con cuidado.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Retira la brida y extrae la bater&iacute;a</strong>
    <p>Afloja la brida met&aacute;lica. Saca la bater&iacute;a vieja sin inclinarla.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Instala la nueva bater&iacute;a AGM</strong>
    <p>Conecta primero el borne positivo y despu&eacute;s el negativo. Reconecta el tubo de ventilaci&oacute;n.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Comprueba el funcionamiento</strong>
    <p>Arranca y verifica luces, radio y elevalunas. Resetea el reloj y ventanillas one-touch si es necesario.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>100-140 &euro;</td><td>30 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>180-230 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Toyota</td><td>230-320 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Usar una bater&iacute;a convencional:</strong> requiere AGM obligatoriamente.</li>
<li><strong>No esperar los 90 segundos:</strong> puede guardar errores en la centralita.</li>
<li><strong>Desconectar primero el positivo:</strong> siempre negativo primero.</li>
<li><strong>No conectar el tubo de ventilaci&oacute;n:</strong> la bater&iacute;a AGM lo requiere.</li>
<li><strong>No fijar bien la brida:</strong> vibraciones y riesgo de cortocircuito.</li>
<li><strong>Tocar los cables naranjas de alta tensi&oacute;n:</strong> peligro mortal.</li>
</ul>
'@
  RAZONES = @'
<ul>
<li><strong>Edad:</strong> 3-5 a&ntilde;os de vida &uacute;til media.</li>
<li><strong>Trayectos cortos:</strong> el sistema h&iacute;brido no recarga lo suficiente.</li>
<li><strong>Consumos par&aacute;sitos:</strong> la electr&oacute;nica del RAV4 consume con el coche apagado.</li>
<li><strong>Paradas prolongadas:</strong> si el coche est&aacute; semanas sin usarse, se descarga.</li>
<li><strong>Calor:</strong> en verano, la temperatura acelera el envejecimiento.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Toyota RAV4 H&iacute;brido?</h3>
<p><strong>AGM de 12V y 55Ah</strong>. Verifica siempre el manual de tu versi&oacute;n.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a?</h3>
<p>En el <strong>maletero, lado derecho</strong>, tras un panel de pl&aacute;stico.</p>
<h3>&iquest;Cu&aacute;nto dura?</h3>
<p>Entre 3 y 5 a&ntilde;os.</p>
<h3>&iquest;Se puede cambiar sin taller?</h3>
<p>S&iacute;, solo necesitas una llave de 10 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso AGM?</h3>
<p>Se sulfatar&aacute; y fallar&aacute; prematuramente. Puede da&ntilde;ar el sistema de carga.</p>
'@
  RESUMEN = "Bater&iacute;a <strong>AGM de 12V y 55Ah</strong> obligatoriamente. Ubicada en el maletero, lado derecho, tras un panel. Espera 90 segundos antes de desconectar. Negativo primero, positivo despu&eacute;s. Reconecta el tubo de ventilaci&oacute;n. <strong>Nunca toques los cables naranjas</strong> de alta tensi&oacute;n."
  RELATED = '<a href="/mecanica/toyota-yaris-cambiar-bateria">Cambiar la bater&iacute;a del Toyota Yaris</a>
  <a href="/mecanica/toyota-corolla-cambiar-bateria">Cambiar la bater&iacute;a del Toyota Corolla</a>
  <a href="/mecanica/toyota-yaris-cross-cambiar-bateria">Cambiar la bater&iacute;a del Toyota Yaris Cross</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del Toyota RAV4 H\u00edbrido","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda de 12V del Toyota RAV4 H\u00edbrido.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/toyota-rav4-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Toyota RAV4","item":"https://itvcheck.es/mecanica/toyota-rav4-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del Toyota RAV4 H\u00edbrido","totalTime":"PT30M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"130"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Guantes aislantes"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda AGM 12V 55Ah"}],"step":[{"@type":"HowToStep","name":"Apagar el coche","text":"Apaga el motor y espera 90 segundos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el maletero, lado derecho."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva bater\u00eda AGM y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el Toyota RAV4 H\u00edbrido?","acceptedAnswer":{"@type":"Answer","text":"AGM de 12V y 55Ah."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda?","acceptedAnswer":{"@type":"Answer","text":"En el maletero, lado derecho."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"Entre 3 y 5 a\u00f1os."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, solo necesitas una llave de 10 mm."}}]}
 ]
}
'@
}

# ---------- 5. TOYOTA YARIS ----------
$fichas += @{
  Archivo = "toyota-yaris-cambiar-bateria.html"
  SLUG = "toyota-yaris-cambiar-bateria"
  MODELO = "Toyota Yaris H&iacute;brido"
  MODELOUPPER = "TOYOTA YARIS"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a de 12V del Toyota Yaris H&iacute;brido. Referencias AGM, herramientas y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Toyota Yaris H&iacute;brido (Gu&iacute;a 2026)"
  TIEMPO = "25"
  LEAD = "El Toyota Yaris H&iacute;brido es uno de los coches m&aacute;s vendidos en Espa&ntilde;a. Su sistema h&iacute;brido es fiable, pero la bater&iacute;a auxiliar de 12V se agota a los 3-5 a&ntilde;os. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso."
  HERO1N = "3-5"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "70-110"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "45"; KPI1S = "Ah"; KPI1L = "Amperaje<br>t&iacute;pico AGM"
  KPI2N = "AGM"; KPI2S = ""; KPI2L = "Tipo obligatorio<br>(no convencional)"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "90"; KPI4S = "seg"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El Toyota Yaris H&iacute;brido es uno de los coches m&aacute;s vendidos en Espa&ntilde;a y un referente en eficiencia. Su sistema h&iacute;brido es extremadamente fiable, pero la bater&iacute;a auxiliar de 12V (la que alimenta la electr&oacute;nica) tiene una vida &uacute;til limitada de entre 3 y 5 a&ntilde;os. En esta gu&iacute;a te explicamos c&oacute;mo cambiarla (generaciones XP130 y XP210, a&ntilde;os 2011-2026)."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos generaciones del Toyota Yaris H&iacute;brido comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Toyota Yaris XP130:</strong> a&ntilde;os 2011-2020. Versiones 1.5 Hybrid.</li>
<li><strong>Toyota Yaris XP210:</strong> a&ntilde;os 2020-2026. Versiones 1.5 Hybrid (4&ordf; generaci&oacute;n).</li>
</ul>
<p>La bater&iacute;a de 12V est&aacute; en el <strong>vano motor, lado izquierdo</strong>.</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a auxiliar</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>Yaris Hybrid XP130 (2011-2020)</td><td>AGM 12V</td><td>45 Ah</td><td>90-140 &euro;</td></tr>
<tr><td>Yaris Hybrid XP210 (2020-2026)</td><td>AGM 12V</td><td>45 Ah</td><td>90-140 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-danger">
  <strong>MUY IMPORTANTE:</strong> El Yaris H&iacute;brido lleva una bater&iacute;a <strong>AGM</strong>, no una de plomo-&aacute;cido convencional. Usar el tipo incorrecto puede da&ntilde;ar el sistema de carga. <strong>Nunca toques los cables naranjas de alta tensi&oacute;n</strong>.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bater&iacute;a AGM 12V 45Ah</strong></li>
<li><strong>Llave de carraca de 10 mm</strong></li>
<li><strong>Guantes aislantes</strong></li>
<li><strong>Linterna frontal</strong></li>
<li><strong>Mult&iacute;metro b&aacute;sico</strong></li>
</ul>
'@
  DIAGNOSTICO = @'
<ul>
<li><strong>Motor apagado:</strong> 12,4-12,7 V = sana &middot; 12,0-12,3 V = al 50% &middot; &lt;11,8 V = agotada.</li>
<li><strong>Modo READY activo:</strong> debe marcar 13,8-14,4 V.</li>
<li><strong>S&iacute;ntomas:</strong> el coche no entra en READY, el multimedia se reinicia, los elevalunas no funcionan.</li>
</ul>
'@
  PASOS = @'
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Apaga el coche y espera 90 segundos</strong>
    <p>Espera antes de desconectar la bater&iacute;a para que los sistemas electr&oacute;nicos se apaguen correctamente.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Localiza la bater&iacute;a</strong>
    <p>En el Yaris H&iacute;brido, la bater&iacute;a de 12V est&aacute; en el vano motor, lado izquierdo.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne negativo primero</strong>
    <p>Afloja la tuerca con llave de 10 mm y ret&iacute;ralo.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne positivo</strong>
    <p>Afloja la tuerca y ret&iacute;ralo con cuidado.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Retira la brida y extrae la bater&iacute;a</strong>
    <p>Saca la bater&iacute;a vieja sin inclinarla.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Instala la nueva bater&iacute;a AGM</strong>
    <p>Conecta primero el borne positivo y despu&eacute;s el negativo. Reconecta el tubo de ventilaci&oacute;n.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Comprueba el funcionamiento</strong>
    <p>Arranca el coche y verifica luces, radio y elevalunas.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>70-100 &euro;</td><td>25 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>130-170 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Toyota</td><td>170-250 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Usar una bater&iacute;a convencional:</strong> requiere AGM obligatoriamente.</li>
<li><strong>No esperar los 90 segundos:</strong> puede guardar errores en la centralita.</li>
<li><strong>Desconectar primero el positivo:</strong> siempre negativo primero.</li>
<li><strong>No conectar el tubo de ventilaci&oacute;n:</strong> la bater&iacute;a AGM lo requiere.</li>
<li><strong>Tocar los cables naranjas:</strong> peligro mortal.</li>
</ul>
'@
  RAZONES = @'
<ul>
<li><strong>Edad:</strong> 3-5 a&ntilde;os de vida &uacute;til media.</li>
<li><strong>Trayectos cortos:</strong> el sistema h&iacute;brido no recarga lo suficiente.</li>
<li><strong>Consumos par&aacute;sitos:</strong> la electr&oacute;nica del Yaris consume con el coche apagado.</li>
<li><strong>Paradas prolongadas:</strong> si el coche est&aacute; semanas sin usarse, se descarga.</li>
<li><strong>Calor:</strong> en verano, la temperatura acelera el envejecimiento.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Toyota Yaris H&iacute;brido?</h3>
<p><strong>AGM de 12V y 45Ah</strong>. Verifica siempre el manual de tu versi&oacute;n.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a?</h3>
<p>En el <strong>vano motor, lado izquierdo</strong>.</p>
<h3>&iquest;Cu&aacute;nto dura?</h3>
<p>Entre 3 y 5 a&ntilde;os.</p>
<h3>&iquest;Se puede cambiar sin taller?</h3>
<p>S&iacute;, solo necesitas una llave de 10 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso AGM?</h3>
<p>Se sulfatar&aacute; y fallar&aacute; prematuramente. Puede da&ntilde;ar el sistema de carga.</p>
'@
  RESUMEN = "Bater&iacute;a <strong>AGM de 12V y 45Ah</strong> obligatoriamente. Ubicada en el vano motor, lado izquierdo. Espera 90 segundos antes de desconectar. Negativo primero, positivo despu&eacute;s. Reconecta el tubo de ventilaci&oacute;n. <strong>Nunca toques los cables naranjas</strong> de alta tensi&oacute;n."
  RELATED = '<a href="/mecanica/toyota-yaris-cambiar-escobillas">Cambiar las escobillas del Toyota Yaris</a>
  <a href="/mecanica/toyota-yaris-cross-cambiar-bateria">Cambiar la bater&iacute;a del Toyota Yaris Cross</a>
  <a href="/mecanica/toyota-corolla-cambiar-bateria">Cambiar la bater&iacute;a del Toyota Corolla</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del Toyota Yaris H\u00edbrido","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda de 12V del Toyota Yaris H\u00edbrido.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/toyota-yaris-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Toyota Yaris","item":"https://itvcheck.es/mecanica/toyota-yaris-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del Toyota Yaris H\u00edbrido","totalTime":"PT25M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"100"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Guantes aislantes"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda AGM 12V 45Ah"}],"step":[{"@type":"HowToStep","name":"Apagar el coche","text":"Apaga el motor y espera 90 segundos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el vano motor, lado izquierdo."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva bater\u00eda AGM y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el Toyota Yaris H\u00edbrido?","acceptedAnswer":{"@type":"Answer","text":"AGM de 12V y 45Ah."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda?","acceptedAnswer":{"@type":"Answer","text":"En el vano motor, lado izquierdo."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"Entre 3 y 5 a\u00f1os."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, solo necesitas una llave de 10 mm."}}]}
 ]
}
'@
}

# ---------- 6. TOYOTA YARIS CROSS ----------
$fichas += @{
  Archivo = "toyota-yaris-cross-cambiar-bateria.html"
  SLUG = "toyota-yaris-cross-cambiar-bateria"
  MODELO = "Toyota Yaris Cross H&iacute;brido"
  MODELOUPPER = "TOYOTA YARIS CROSS"
  METADESC = "Gu&iacute;a paso a paso para cambiar la bater&iacute;a auxiliar del Toyota Yaris Cross H&iacute;brido. Referencias AGM, herramientas, dificultad, precios y errores comunes. Actualizado 2026."
  TITLESEO = "C&oacute;mo Cambiar la Bater&iacute;a del Toyota Yaris Cross H&iacute;brido (Gu&iacute;a 2026)"
  TIEMPO = "25-35"
  LEAD = "El Toyota Yaris Cross es uno de los SUV urbanos h&iacute;bridos m&aacute;s vendidos en Espa&ntilde;a. Su sistema h&iacute;brido es duradero, pero la bater&iacute;a auxiliar de 12V se agota cada 4-6 a&ntilde;os. Esta gu&iacute;a te explica c&oacute;mo cambiarla paso a paso."
  HERO1N = "4-6"; HERO1S = "a&ntilde;os"; HERO1L = "Vida &uacute;til media<br>de la bater&iacute;a"
  HERO2N = "90-140"; HERO2S = "&euro;"; HERO2L = "Ahorro medio<br>vs taller"
  HERO3N = "F&aacute;cil"; HERO3S = ""; HERO3L = "Dificultad<br>de la tarea"
  KPI1N = "45"; KPI1S = "Ah"; KPI1L = "Amperaje<br>t&iacute;pico AGM"
  KPI2N = "AGM"; KPI2S = ""; KPI2L = "Tipo obligatorio<br>(no convencional)"
  KPI3N = "10"; KPI3S = "mm"; KPI3L = "Llave principal<br>para los bornes"
  KPI4N = "90"; KPI4S = "seg"; KPI4L = "Espera antes<br>de desconectar"
  INTRO = "El Toyota Yaris Cross es uno de los SUV urbanos h&iacute;bridos m&aacute;s vendidos en Espa&ntilde;a por su eficiencia (consumos reales de 4,5 L/100 km), su fiabilidad y su alta demanda en el mercado de segunda mano. Su sistema h&iacute;brido es extremadamente duradero, pero tiene una bater&iacute;a auxiliar de 12V (la que alimenta la electr&oacute;nica y permite arrancar el sistema h&iacute;brido) que se agota cada 4-6 a&ntilde;os. En esta gu&iacute;a te explicamos c&oacute;mo cambiarla paso a paso."
  VERSIONES = @'
<p>Esta gu&iacute;a es v&aacute;lida para las dos generaciones del Toyota Yaris Cross comercializadas en Espa&ntilde;a:</p>
<ul>
<li><strong>Toyota Yaris Cross (XP210/MXPJ):</strong> a&ntilde;os 2021-2024. Motor 1.5 Hybrid (sistema h&iacute;brido de 5&ordf; generaci&oacute;n).</li>
<li><strong>Toyota Yaris Cross restyling (2024-2026):</strong> Motores 1.5 Hybrid y 1.5 Hybrid 130.</li>
</ul>
<p>El Yaris Cross es siempre h&iacute;brido (no hay versi&oacute;n de gasolina pura ni di&eacute;sel en Espa&ntilde;a). La bater&iacute;a auxiliar de 12V est&aacute; en el <strong>vano motor, lado izquierdo</strong>.</p>
'@
  TABLABATERIAS = @'
<table class="defect-table">
<tr><th>Versi&oacute;n</th><th>Tipo de bater&iacute;a auxiliar</th><th>Amperaje</th><th>Precio</th></tr>
<tr><td>Yaris Cross 1.5 Hybrid (todos los acabados)</td><td>AGM 12V</td><td>45 Ah</td><td>100-150 &euro;</td></tr>
<tr><td>Yaris Cross 1.5 Hybrid 130 (2024+)</td><td>AGM 12V</td><td>45 Ah</td><td>100-150 &euro;</td></tr>
</table>
'@
  AVISOS = @'
<div class="mag-mec-danger">
  <strong>NUNCA toques los cables naranjas de alta tensi&oacute;n.</strong> El sistema h&iacute;brido del Yaris Cross trabaja a 177-222 V (o m&aacute;s). La bater&iacute;a de alta tensi&oacute;n est&aacute; bajo el asiento trasero, NO se toca. Solo manipulamos la bater&iacute;a auxiliar de 12V del vano motor.
</div>
<div class="mag-mec-warn">
  <strong>C&oacute;mo saber si la bater&iacute;a auxiliar est&aacute; agotada:</strong> el coche no entra en modo READY al pulsar el bot&oacute;n POWER, las luces del cuadro parpadean, o el sistema multimedia se reinicia solo. Un mult&iacute;metro te lo confirma: por debajo de 11,8 V en reposo, la bater&iacute;a est&aacute; agotada.
</div>
'@
  HERRAMIENTAS = @'
<ul>
<li><strong>Bater&iacute;a AGM 12V 45Ah</strong> (no vale una convencional)</li>
<li><strong>Llave de carraca de 10 mm</strong></li>
<li><strong>Guantes aislantes</strong></li>
<li><strong>Linterna frontal</strong></li>
<li><strong>Mult&iacute;metro b&aacute;sico</strong></li>
</ul>
'@
  DIAGNOSTICO = @'
<ul>
<li><strong>Motor apagado:</strong> 12,4-12,7 V = sana &middot; 12,0-12,3 V = al 50% &middot; &lt;11,8 V = agotada.</li>
<li><strong>Modo READY activo:</strong> debe marcar 13,8-14,4 V.</li>
<li><strong>S&iacute;ntomas:</strong> el coche no entra en READY, el multimedia se reinicia, los elevalunas no funcionan.</li>
</ul>
'@
  PASOS = @'
<div class="mag-mec-step">
  <span class="mag-mec-step-num">1</span>
  <div class="mag-mec-step-body">
    <strong>Apaga el coche y espera 90 segundos</strong>
    <p>Pulsa el bot&oacute;n POWER en OFF. Espera al menos 90 segundos antes de desconectar la bater&iacute;a para que los sistemas electr&oacute;nicos se apaguen correctamente.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">2</span>
  <div class="mag-mec-step-body">
    <strong>Localiza la bater&iacute;a auxiliar</strong>
    <p>En el Yaris Cross est&aacute; en el vano motor, lado izquierdo, cubierta por una tapa de pl&aacute;stico. Ret&iacute;rala para acceder.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">3</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne negativo primero</strong>
    <p>Afloja la tuerca con la llave de 10 mm y retira el cable negro ("-"). Es CR&Iacute;TICO desconectar el negativo primero.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">4</span>
  <div class="mag-mec-step-body">
    <strong>Desconecta el borne positivo</strong>
    <p>Afloja la tuerca del cable rojo ("+") y ret&iacute;ralo. Col&oacute;calo alejado de cualquier parte met&aacute;lica.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">5</span>
  <div class="mag-mec-step-body">
    <strong>Retira la brida de sujeci&oacute;n</strong>
    <p>Afloja los tornillos de la brida met&aacute;lica que sujeta la bater&iacute;a.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">6</span>
  <div class="mag-mec-step-body">
    <strong>Extrae la bater&iacute;a vieja</strong>
    <p>S&aacute;cala con cuidado sin inclinarla. La bater&iacute;a AGM de 45Ah pesa unos 10-12 kg.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">7</span>
  <div class="mag-mec-step-body">
    <strong>Instala la nueva bater&iacute;a AGM</strong>
    <p>Col&oacute;cala en la misma posici&oacute;n (respeta la polaridad). Vuelve a poner la brida de sujeci&oacute;n.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">8</span>
  <div class="mag-mec-step-body">
    <strong>Conecta el borne positivo primero</strong>
    <p>Coloca el cable rojo ("+") y aprieta. Despu&eacute;s, el negativo ("-").</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">9</span>
  <div class="mag-mec-step-body">
    <strong>Reconecta el tubo de ventilaci&oacute;n</strong>
    <p>La bater&iacute;a AGM tiene un tubo de ventilaci&oacute;n que debe conectarse correctamente.</p>
  </div>
</div>
<div class="mag-mec-step">
  <span class="mag-mec-step-num">10</span>
  <div class="mag-mec-step-body">
    <strong>Comprueba y resetea</strong>
    <p>Pulsa el bot&oacute;n POWER y verifica que entra en modo READY. Comprueba luces, radio, elevalunas y sistema h&iacute;brido. Puede que tengas que resetear el reloj y las ventanillas one-touch.</p>
  </div>
</div>
'@
  TABLAPRECIOS = @'
<table class="defect-table">
<tr><th>Opci&oacute;n</th><th>Precio</th><th>Tiempo</th></tr>
<tr><td>Hacerlo t&uacute; mismo</td><td>100-150 &euro; (solo la bater&iacute;a)</td><td>25-35 minutos</td></tr>
<tr><td>Taller gen&eacute;rico</td><td>180-240 &euro;</td><td>1 hora</td></tr>
<tr><td>Concesionario oficial Toyota</td><td>230-320 &euro;</td><td>1-2 horas (con cita)</td></tr>
</table>
<p><strong>Ahorro real:</strong> 90-140 &euro;. En h&iacute;bridos, el concesionario cobra m&aacute;s por mano de obra especializada, as&iacute; que el ahorro es mayor.</p>
'@
  AMAZONCARDS = $amazonCards
  ERRORES = @'
<ul>
<li><strong>Tocar los cables naranjas de alta tensi&oacute;n.</strong> El error m&aacute;s peligroso. Descarga mortal.</li>
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
<li><strong>Edad:</strong> 4-6 a&ntilde;os de vida &uacute;til media.</li>
<li><strong>Trayectos cortos:</strong> el sistema h&iacute;brido no tiene tiempo de recargarla.</li>
<li><strong>Consumos par&aacute;sitos:</strong> la electr&oacute;nica del Yaris Cross (multimedia, telem&aacute;tica) consume con el coche apagado.</li>
<li><strong>Paradas prolongadas:</strong> si el coche est&aacute; semanas sin usarse, se descarga.</li>
<li><strong>Calor:</strong> en verano, la temperatura acelera el envejecimiento.</li>
</ul>
'@
  FAQS = @'
<h3>&iquest;Qu&eacute; bater&iacute;a lleva el Toyota Yaris Cross?</h3>
<p>Bater&iacute;a auxiliar <strong>AGM de 12V y 45Ah</strong>. No es una bater&iacute;a convencional de plomo-&aacute;cido.</p>
<h3>&iquest;D&oacute;nde est&aacute; la bater&iacute;a auxiliar del Yaris Cross?</h3>
<p>En el vano motor, lado izquierdo, cubierta por una tapa de pl&aacute;stico.</p>
<h3>&iquest;Cu&aacute;nto dura la bater&iacute;a auxiliar del Yaris Cross?</h3>
<p>Entre 4 y 6 a&ntilde;os, dependiendo del uso.</p>
<h3>&iquest;Se puede cambiar sin ir al taller?</h3>
<p>S&iacute;, con las herramientas adecuadas. Solo necesitas una llave de 10 mm.</p>
<h3>&iquest;Qu&eacute; pasa si no uso una bater&iacute;a AGM?</h3>
<p>Se sulfata y falla prematuramente. Puede da&ntilde;ar el sistema de carga.</p>
<h3>&iquest;Se puede cambiar la bater&iacute;a de alta tensi&oacute;n del Yaris Cross?</h3>
<p>No es tarea DIY. La bater&iacute;a de alta tensi&oacute;n est&aacute; bajo el asiento trasero, dise&ntilde;ada para durar toda la vida del coche y solo la manipulan t&eacute;cnicos certificados. Toyota la cubre con garant&iacute;a de 10 a&ntilde;os (con revisiones anuales).</p>
'@
  RESUMEN = "Bater&iacute;a auxiliar <strong>AGM de 12V y 45Ah</strong> obligatoriamente. Ubicada en el vano motor, lado izquierdo. Espera 90 segundos antes de desconectar. Negativo primero, positivo despu&eacute;s. Reconecta el tubo de ventilaci&oacute;n. <strong>Nunca toques los cables naranjas</strong> de alta tensi&oacute;n."
  RELATED = '<a href="/mecanica/toyota-yaris-cambiar-bateria">Cambiar la bater&iacute;a del Toyota Yaris</a>
  <a href="/mecanica/toyota-corolla-cambiar-bateria">Cambiar la bater&iacute;a del Toyota Corolla</a>
  <a href="/mecanica/toyota-rav4-cambiar-bateria">Cambiar la bater&iacute;a del Toyota RAV4</a>'
  SCHEMA = @'
{
 "@context":"https://schema.org",
 "@graph":[
  {"@type":"Article","headline":"C\u00f3mo cambiar la bater\u00eda del Toyota Yaris Cross H\u00edbrido","description":"Gu\u00eda paso a paso para sustituir la bater\u00eda auxiliar del Toyota Yaris Cross H\u00edbrido.","datePublished":"2025-06-01","dateModified":"2026-10-04","author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n","url":"https://itvcheck.es/autor/daniel-vega"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mecanica/toyota-yaris-cross-cambiar-bateria"}},
  {"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"Mec\u00e1nica DIY","item":"https://itvcheck.es/mecanica"},{"@type":"ListItem","position":3,"name":"Toyota Yaris Cross","item":"https://itvcheck.es/mecanica/toyota-yaris-cross-cambiar-bateria"}]},
  {"@type":"HowTo","name":"C\u00f3mo cambiar la bater\u00eda del Toyota Yaris Cross H\u00edbrido","totalTime":"PT30M","estimatedCost":{"@type":"MonetaryAmount","currency":"EUR","value":"110"},"tool":[{"@type":"HowToTool","name":"Llave de carraca de 10 mm"},{"@type":"HowToTool","name":"Guantes aislantes"},{"@type":"HowToTool","name":"Linterna frontal"}],"supply":[{"@type":"HowToSupply","name":"Bater\u00eda AGM 12V 45Ah"}],"step":[{"@type":"HowToStep","name":"Apagar el coche","text":"Apaga el motor y espera 90 segundos."},{"@type":"HowToStep","name":"Localizar la bater\u00eda","text":"En el vano motor, lado izquierdo."},{"@type":"HowToStep","name":"Desconectar negativo","text":"Afloja la tuerca del borne negativo."},{"@type":"HowToStep","name":"Desconectar positivo","text":"Afloja la tuerca del borne positivo."},{"@type":"HowToStep","name":"Instalar la nueva","text":"Coloca la nueva bater\u00eda AGM y conecta positivo primero."},{"@type":"HowToStep","name":"Comprobar","text":"Arranca el coche y verifica."}]},
  {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"\u00bfQu\u00e9 bater\u00eda lleva el Toyota Yaris Cross?","acceptedAnswer":{"@type":"Answer","text":"AGM de 12V y 45Ah."}},{"@type":"Question","name":"\u00bfD\u00f3nde est\u00e1 la bater\u00eda?","acceptedAnswer":{"@type":"Answer","text":"En el vano motor, lado izquierdo."}},{"@type":"Question","name":"\u00bfCu\u00e1nto dura?","acceptedAnswer":{"@type":"Answer","text":"Entre 4 y 6 a\u00f1os."}},{"@type":"Question","name":"\u00bfSe puede cambiar sin taller?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, solo necesitas una llave de 10 mm."}}]}
 ]
}
'@
}

# =========================================================================
# GENERAR
# =========================================================================
$generados = 0
$errores = 0

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
    Write-Host "  AVISO: quedan placeholders sin reemplazar" -ForegroundColor Yellow
    $errores++
  } else {
    $generados++
  }
}

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "Generados: $generados de 6" -ForegroundColor Green
Write-Host "Con avisos: $errores" -ForegroundColor Yellow
Write-Host "Backup: $bk" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Abrir los 6
Start-Process "http://localhost:8000/mecanica/renault-clio-cambiar-bateria.html"
Start-Process "http://localhost:8000/mecanica/seat-ibiza-cambiar-bateria.html"
Start-Process "http://localhost:8000/mecanica/toyota-corolla-cambiar-bateria.html"
Start-Process "http://localhost:8000/mecanica/toyota-rav4-cambiar-bateria.html"
Start-Process "http://localhost:8000/mecanica/toyota-yaris-cambiar-bateria.html"
Start-Process "http://localhost:8000/mecanica/toyota-yaris-cross-cambiar-bateria.html"