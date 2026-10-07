$base = "C:\Users\Usuario\Desktop\ITVcheck"
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$bk = Join-Path $base "temp\backups\$ts"
New-Item -ItemType Directory -Path $bk -Force | Out-Null

function Build-LegalPage {
  param(
    [string]$MetaDescription,
    [string]$PageTitle,
    [string]$Slug,
    [string]$TopbarSection,
    [string]$H1,
    [string]$Lead,
    [string]$Content
  )

  $html = @"
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="$MetaDescription">
<title>$PageTitle | ITVcheck</title>
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
<link rel="canonical" href="https://itvcheck.es/$Slug">
<script>
function loadScripts(){var s=document.createElement('script');s.src='https://www.googletagmanager.com/gtag/js?id=G-T1PZZHFJ4E';s.async=true;document.head.appendChild(s);window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('consent','default',{'ad_storage':'denied','ad_user_data':'denied','ad_personalization':'denied','analytics_storage':'denied'});gtag('js',new Date());gtag('config','G-T1PZZHFJ4E');var a=document.createElement('script');a.src='https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-7947218272068445';a.async=true;a.crossOrigin='anonymous';document.head.appendChild(a);}
if(localStorage.getItem('cookiesAceptadas')==='true'){loadScripts();}
</script>
<script type="application/ld+json">
{
 "@context":"https://schema.org",
 "@type":"WebPage",
 "name":"$PageTitle",
 "url":"https://itvcheck.es/$Slug",
 "inLanguage":"es-ES",
 "isPartOf":{"@type":"WebSite","name":"ITVcheck","url":"https://itvcheck.es"}
}
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
    <span>$TopbarSection</span>
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
  <span>ITVcheck &middot; Informaci&oacute;n legal</span>
  <span>$TopbarSection</span>
</div>

<section class="mag-hero">
  <div class="mag-hero-text">
    <span class="kicker">Legal &middot; Edici&oacute;n 2026</span>
    <h1 class="h1-inline">$H1</h1>
    <p class="lead">$Lead</p>
  </div>
</section>

<div class="container">

$Content

<div class="related-guides">
  <h3>P&aacute;ginas legales</h3>
  <a href="/aviso-legal">Aviso legal</a>
  <a href="/politica-privacidad">Pol&iacute;tica de privacidad</a>
  <a href="/politica-cookies">Pol&iacute;tica de cookies</a>
  <a href="/politica-afiliados">Pol&iacute;tica de afiliados</a>
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
      </div>
      <div class="itv-footer-col">
        <h4>Gu&iacute;as</h4>
        <a href="/guia-completa-itv">Gu&iacute;a completa ITV</a>
        <a href="/guias">Todas las gu&iacute;as</a>
        <a href="/blog/">Blog</a>
        <a href="/mecanica">Mec&aacute;nica DIY</a>
        <a href="/guia-luces">Luces</a>
        <a href="/guia-neumaticos">Neum&aacute;ticos</a>
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
"@

  return $html
}

# ===== AVISO LEGAL =====
$avisoContent = @'
<h2>Objeto y finalidad</h2>
<p>ITVcheck es un portal informativo sobre la Inspecci&oacute;n T&eacute;cnica de Veh&iacute;culos en Espa&ntilde;a. Los contenidos publicados tienen car&aacute;cter meramente orientativo e informativo. No sustituyen a la normativa oficial de la DGT, el BOE ni las disposiciones auton&oacute;micas aplicables.</p>

<h2>Propiedad intelectual</h2>
<p>Los contenidos de este sitio web (textos, im&aacute;genes, dise&ntilde;o gr&aacute;fico y c&oacute;digo fuente) son propiedad del titular y est&aacute;n protegidos por las leyes de propiedad intelectual. Queda prohibida su reproducci&oacute;n total o parcial sin autorizaci&oacute;n expresa.</p>

<h2>Publicidad</h2>
<p>Este sitio web puede mostrar publicidad a trav&eacute;s de Google AdSense (Google LLC). Los anunciantes son terceros ajenos al titular del sitio. ITVcheck no controla el contenido de dichos anuncios.</p>

<h2>Programa de Afiliados de Amazon</h2>
<p>ITVcheck participa en el <strong>Programa de Afiliados de Amazon EU</strong>, un programa de publicidad dise&ntilde;ado para que sitios web obtengan comisiones por publicidad al enlazar a productos de Amazon.es. Como Afiliado de Amazon, ITVcheck gana por las compras que cumplan los requisitos aplicables.</p>
<p>Los enlaces de afiliado est&aacute;n claramente identificados en las p&aacute;ginas donde aparecen, y el precio de los productos no var&iacute;a para el usuario. Puedes consultar todos los detalles en nuestra <a href="politica-afiliados">Pol&iacute;tica de Afiliados</a>.</p>

<h2>Limitaci&oacute;n de responsabilidad</h2>
<p>El titular no se hace responsable de los errores u omisiones en los contenidos, ni de los da&ntilde;os que pudieran derivarse del uso de la informaci&oacute;n aqu&iacute; publicada. Se recomienda siempre contrastar la informaci&oacute;n con fuentes oficiales antes de tomar decisiones.</p>

<h2>Legislaci&oacute;n aplicable</h2>
<p>Esta relaci&oacute;n entre el usuario y el titular se regir&aacute; por la normativa espa&ntilde;ola vigente y cualquier controversia se someter&aacute; a los Juzgados y Tribunales competentes.</p>
'@

$avisoHtml = Build-LegalPage `
  -MetaDescription "Aviso legal de ITVcheck: informaci&oacute;n sobre el titular, la propiedad intelectual, la responsabilidad, la publicidad y los enlaces de afiliado del sitio web." `
  -PageTitle "Aviso Legal" `
  -Slug "aviso-legal" `
  -TopbarSection "LEGAL &middot; AVISO LEGAL" `
  -H1 "Aviso Legal" `
  -Lead "En cumplimiento de la Ley 34/2002, de 11 de julio, de Servicios de la Sociedad de la Informaci&oacute;n y de Comercio Electr&oacute;nico (LSSI-CE), se informa de que el titular del sitio web <strong>ITVcheck</strong> es un particular con residencia en Espa&ntilde;a." `
  -Content $avisoContent

# ===== POLITICA PRIVACIDAD =====
$privContent = @'
<h2>1. Responsable del tratamiento</h2>
<p>El responsable del tratamiento de los datos recopilados en este sitio web es el titular de ITVcheck, con residencia en Espa&ntilde;a. Puedes contactar con nosotros a trav&eacute;s de <a href="mailto:soporte@itvcheck.es">soporte@itvcheck.es</a>.</p>

<h2>2. Datos que recopilamos</h2>
<p><strong>Datos de navegaci&oacute;n:</strong> Utilizamos cookies anal&iacute;ticas y publicitarias (como las de Google AdSense) para medir el tr&aacute;fico y mostrar anuncios relevantes, pero solo despu&eacute;s de que aceptes su uso. Puedes gestionarlas en nuestra <a href="politica-cookies">Pol&iacute;tica de Cookies</a>.</p>
<p><strong>Datos de afiliaci&oacute;n:</strong> Cuando haces clic en un enlace de afiliado hacia Amazon, esta plataforma instala una cookie de seguimiento en tu navegador para asociar la posible compra a nuestra cuenta. Nosotros no recibimos datos personales tuyos, sino &uacute;nicamente informaci&oacute;n agregada de las ventas realizadas. Consulta m&aacute;s informaci&oacute;n en la <a href="politica-afiliados">Pol&iacute;tica de Afiliados</a>.</p>
<p><strong>Formularios:</strong> Si decides escribirnos a trav&eacute;s de nuestro correo de contacto, recopilaremos tu direcci&oacute;n de correo electr&oacute;nico para poder responderte. No almacenamos estos datos en bases de datos propias.</p>

<h2>3. Finalidad del tratamiento</h2>
<ul>
<li>Responder a las consultas y solicitudes de los usuarios.</li>
<li>Mostrar publicidad personalizada a trav&eacute;s de terceros (Google AdSense) tras tu consentimiento.</li>
<li>Analizar el uso de la web para mejorar nuestros contenidos.</li>
<li>Gestionar el seguimiento de afiliados de Amazon.</li>
</ul>

<h2>4. Derechos del usuario</h2>
<p>Tienes derecho a acceder, rectificar, suprimir, oponerte o limitar el tratamiento de tus datos, as&iacute; como a la portabilidad de los mismos. Para ejercer estos derechos, puedes escribirnos a <a href="mailto:soporte@itvcheck.es">soporte@itvcheck.es</a>.</p>

<h2>5. Conservaci&oacute;n de datos</h2>
<p>Los datos de navegaci&oacute;n se conservan seg&uacute;n los plazos establecidos por Google Analytics y Google AdSense. Los correos electr&oacute;nicos recibidos se conservan &uacute;nicamente durante el tiempo necesario para responder a la consulta.</p>

<h2>6. Cambios en esta pol&iacute;tica</h2>
<p>Nos reservamos el derecho a modificar esta pol&iacute;tica para adaptarla a novedades legislativas o cambios en el sitio web. Te recomendamos revisarla peri&oacute;dicamente.</p>
'@

$privHtml = Build-LegalPage `
  -MetaDescription "Pol&iacute;tica de privacidad de ITVcheck: qu&eacute; datos recopilamos, c&oacute;mo los utilizamos y cu&aacute;les son tus derechos seg&uacute;n el RGPD." `
  -PageTitle "Pol&iacute;tica de Privacidad" `
  -Slug "politica-privacidad" `
  -TopbarSection "LEGAL &middot; PRIVACIDAD" `
  -H1 "Pol&iacute;tica de Privacidad" `
  -Lead "En ITVcheck nos tomamos muy en serio la protecci&oacute;n de tus datos personales. Esta pol&iacute;tica explica qu&eacute; datos recopilamos y c&oacute;mo los utilizamos, en cumplimiento del Reglamento General de Protecci&oacute;n de Datos (RGPD) y la Ley Org&aacute;nica 3/2018 (LOPDGDD)." `
  -Content $privContent

# ===== POLITICA COOKIES =====
$cookiesContent = @'
<h2>Tipos de cookies utilizadas</h2>
<table class="defect-table">
<tr><th>Cookie</th><th>Tipo</th><th>Finalidad</th><th>Duraci&oacute;n</th></tr>
<tr><td>_ga, _gid</td><td>Anal&iacute;tica (Google)</td><td>Medir el tr&aacute;fico del sitio de forma an&oacute;nima</td><td>2 a&ntilde;os / 24h</td></tr>
<tr><td>IDE, DSID</td><td>Publicidad (Google)</td><td>Mostrar anuncios personalizados de AdSense</td><td>1 a&ntilde;o</td></tr>
<tr><td>session-token, x-main</td><td>Afiliados (Amazon)</td><td>Seguimiento de clics y compras realizadas desde nuestros enlaces</td><td>24 horas</td></tr>
<tr><td>cookieconsent</td><td>T&eacute;cnica</td><td>Recordar tu preferencia sobre cookies</td><td>1 a&ntilde;o</td></tr>
</table>

<h2>Cookies de afiliados de Amazon</h2>
<p>Cuando haces clic en uno de nuestros enlaces de afiliado hacia Amazon, esta plataforma instala una cookie de seguimiento en tu navegador. Esta cookie permite a Amazon saber que has llegado desde ITVcheck y asociar la compra (si la haces) a nuestra cuenta de afiliado. La cookie tiene una duraci&oacute;n de <strong>24 horas</strong>. Si no compras nada, la cookie expira sin m&aacute;s consecuencias.</p>
<p>Para m&aacute;s informaci&oacute;n, consulta nuestra <a href="politica-afiliados">Pol&iacute;tica de Afiliados</a>.</p>

<h2>C&oacute;mo desactivar las cookies</h2>
<p>Puedes configurar tu navegador para rechazar todas las cookies o para que te avise cuando se env&iacute;e una. Ten en cuenta que algunas partes del sitio pueden no funcionar correctamente si las desactivas.</p>
<p>Tambi&eacute;n puedes desactivar la publicidad personalizada de Google en <a href="https://adssettings.google.com" target="_blank" rel="nofollow noopener">Configuraci&oacute;n de anuncios</a>.</p>
'@

$cookiesHtml = Build-LegalPage `
  -MetaDescription "Pol&iacute;tica de cookies de ITVcheck: tipos de cookies utilizadas (Google Analytics, AdSense y afiliados de Amazon), su finalidad y c&oacute;mo desactivarlas." `
  -PageTitle "Pol&iacute;tica de Cookies" `
  -Slug "politica-cookies" `
  -TopbarSection "LEGAL &middot; COOKIES" `
  -H1 "Pol&iacute;tica de Cookies" `
  -Lead "Este sitio web utiliza cookies propias y de terceros para mejorar la experiencia de navegaci&oacute;n, mostrar publicidad relevante mediante Google AdSense y gestionar el seguimiento de afiliados de Amazon. Para cumplir con el RGPD, solo cargamos estos scripts despu&eacute;s de que aceptes expl&iacute;citamente su uso." `
  -Content $cookiesContent

# ===== POLITICA AFILIADOS =====
$afiliadosContent = @'
<div class="mag-notice-inner">
  <h3>Transparencia total</h3>
  <p>En ITVcheck creemos que la transparencia es la base de la confianza. Esta p&aacute;gina explica de forma clara y sencilla c&oacute;mo se monetiza este sitio web, qu&eacute; son los enlaces de afiliado y c&oacute;mo afectan (o no) a ti como usuario.</p>
</div>

<h2>1. Participamos en el Programa de Afiliados de Amazon EU</h2>
<p>ITVcheck es participante del <strong>Programa de Afiliados de Amazon EU</strong>, un programa de publicidad dise&ntilde;ado para que sitios web como el nuestro obtengan comisiones por publicidad al enlazar a productos de <a href="https://www.amazon.es" target="_blank" rel="nofollow noopener">Amazon.es</a>.</p>
<p>Esto significa que <strong>algunos de los enlaces que encontrar&aacute;s en nuestras gu&iacute;as son enlaces de afiliado</strong>. Si haces clic en uno de ellos y compras un producto, Amazon nos paga una peque&ntilde;a comisi&oacute;n. Este pago lo realiza Amazon, <strong>nunca t&uacute;</strong>.</p>

<div class="mag-notice-inner">
  <h3>Importante</h3>
  <p>El precio que pagas por el producto es exactamente el mismo, tanto si compras a trav&eacute;s de nuestro enlace como si accedes directamente a Amazon. La comisi&oacute;n sale del margen de beneficio de Amazon, no de tu bolsillo.</p>
</div>

<h2>2. C&oacute;mo funciona un enlace de afiliado</h2>
<p>Cuando haces clic en un enlace de afiliado, Amazon instala una <strong>cookie de seguimiento</strong> en tu navegador. Esta cookie permite a Amazon saber que llegaste desde ITVcheck y asociar la compra (si la haces) a nuestra cuenta de afiliado.</p>
<p>La cookie tiene una duraci&oacute;n de <strong>24 horas</strong>. Si compras algo dentro de ese plazo, recibimos la comisi&oacute;n. Si no compras nada, no pasa nada, simplemente la cookie expira.</p>

<h3>&iquest;Qu&eacute; productos enlazamos?</h3>
<p>En nuestras gu&iacute;as recomendamos accesorios y productos que consideramos &uacute;tiles para el mantenimiento y cuidado del coche. Todos ellos son productos que hemos analizado y que, en nuestra opini&oacute;n, ofrecen una buena relaci&oacute;n calidad-precio. Algunos ejemplos:</p>
<ul>
<li>Balizas V-16 conectadas homologadas.</li>
<li>Cargadores inal&aacute;mbricos, adaptadores y gadgets para el coche.</li>
<li>Compresores de aire, kits de emergencia y botiquines.</li>
<li>Cables de carga para coches el&eacute;ctricos y accesorios de limpieza.</li>
<li>Kits de pulido de faros y productos de mantenimiento.</li>
</ul>

<h2>3. Qu&eacute; comisiones recibimos</h2>
<p>Las comisiones que Amazon paga a sus afiliados var&iacute;an seg&uacute;n la categor&iacute;a del producto. En la categor&iacute;a de <strong>automoci&oacute;n y accesorios para el coche</strong>, el porcentaje suele estar entre el <strong>3% y el 8%</strong> del precio de venta (sin IVA).</p>

<table class="defect-table">
<tr><th>Categor&iacute;a de producto</th><th>Comisi&oacute;n orientativa</th></tr>
<tr><td>Accesorios para coche y moto</td><td>3% - 8%</td></tr>
<tr><td>Herramientas y bricolaje</td><td>3% - 5%</td></tr>
<tr><td>Electr&oacute;nica y gadgets</td><td>1% - 4%</td></tr>
<tr><td>Limpieza y cuidado del hogar</td><td>3% - 5%</td></tr>
</table>

<p><em>*Los porcentajes son orientativos y est&aacute;n sujetos a las tarifas vigentes del Programa de Afiliados de Amazon EU. Consulta la web oficial de Amazon Associates para m&aacute;s informaci&oacute;n.</em></p>

<div class="mag-notice-inner">
  <h3>Dato importante</h3>
  <p>Estas comisiones nos ayudan a mantener la web gratuita y a seguir creando contenido de calidad. Sin ellas, no podr&iacute;amos dedicar el tiempo necesario a investigar, redactar y actualizar las gu&iacute;as que publicamos.</p>
</div>

<h2>4. Nuestro compromiso contigo</h2>
<p>Queremos que sepas que nuestra prioridad siempre ser&aacute;n los usuarios, no las comisiones. Por eso nos comprometemos a:</p>
<ul>
<li><strong>Recomendar solo productos que consideramos &uacute;tiles.</strong> No recomendamos nada que no usar&iacute;amos nosotros mismos.</li>
<li><strong>No alterar nuestras opiniones por motivos comerciales.</strong> Si un producto no nos convence, lo decimos, aunque tenga comisi&oacute;n.</li>
<li><strong>Identificar claramente los enlaces de afiliado.</strong> Siempre que un enlace sea de afiliado, lo indicaremos de forma visible.</li>
<li><strong>Mantener el contenido actualizado.</strong> Revisamos peri&oacute;dicamente los precios y la disponibilidad de los productos, aunque estos pueden cambiar sin previo aviso.</li>
</ul>

<h2>5. Cookies de afiliaci&oacute;n</h2>
<p>Amazon utiliza cookies para el seguimiento de los clics y las ventas generadas a trav&eacute;s de nuestros enlaces. Estas cookies son instaladas por Amazon y est&aacute;n sujetas a su propia pol&iacute;tica de privacidad.</p>
<p>Para m&aacute;s informaci&oacute;n sobre qu&eacute; cookies utilizamos y c&oacute;mo gestionarlas, consulta nuestra <a href="politica-cookies">Pol&iacute;tica de Cookies</a> y nuestra <a href="politica-privacidad">Pol&iacute;tica de Privacidad</a>.</p>

<h2>6. Identificaci&oacute;n de enlaces de afiliado</h2>
<p>En ITVcheck, todos los enlaces que dirigen a Amazon y que incluyen nuestro tag de afiliado (<code>tag=itvcheck-21</code>) son considerados enlaces de afiliado. Estos aparecen principalmente en:</p>
<ul>
<li>Las <strong>gu&iacute;as de productos recomendados</strong> (baliza V-16, gadgets, viaje largo, etc.).</li>
<li>Las <strong>secciones de accesorios</strong> dentro de las gu&iacute;as de mantenimiento.</li>
<li>Las <strong>recomendaciones espec&iacute;ficas</strong> de productos en art&iacute;culos como el de limpiar faros o el de mantenimiento de el&eacute;ctricos.</li>
</ul>
<p>Siempre que un enlace sea de afiliado, lo indicaremos con un aviso visible cerca del mismo.</p>

<h2>7. Legislaci&oacute;n aplicable</h2>
<p>Esta pol&iacute;tica de afiliados se rige por lo dispuesto en:</p>
<ul>
<li><strong>Ley 34/2002</strong> de Servicios de la Sociedad de la Informaci&oacute;n y Comercio Electr&oacute;nico (LSSI-CE).</li>
<li><strong>Ley 3/1991</strong> de Competencia Desleal, que regula las pr&aacute;cticas comerciales enga&ntilde;osas.</li>
<li><strong>Directiva 2005/29/CE</strong> sobre pr&aacute;cticas comerciales desleales en el mercado interior.</li>
<li><strong>Acuerdo Operativo del Programa de Afiliados de Amazon EU.</strong></li>
</ul>

<h2>8. Contacto</h2>
<p>Si tienes cualquier duda sobre esta pol&iacute;tica de afiliados o sobre c&oacute;mo se monetiza este sitio web, puedes contactar con nosotros a trav&eacute;s de:</p>
<p><a href="mailto:soporte@itvcheck.es">soporte@itvcheck.es</a> o a trav&eacute;s de nuestra <a href="contacto">p&aacute;gina de contacto</a>.</p>

<h2>9. Declaraci&oacute;n obligatoria de Amazon</h2>
<div class="mag-notice-inner">
  <h3>Como Afiliado de Amazon, ITVcheck gana por las compras que cumplan los requisitos aplicables.</h3>
  <p>Esta declaraci&oacute;n se realiza en cumplimiento del Acuerdo Operativo del Programa de Afiliados de Amazon EU y se aplica a todos los enlaces de afiliado presentes en este sitio web.</p>
</div>
'@

$afiliadosHtml = Build-LegalPage `
  -MetaDescription "Pol&iacute;tica de afiliados de ITVcheck: informaci&oacute;n transparente sobre el Programa de Afiliados de Amazon EU, c&oacute;mo funcionan los enlaces y las comisiones, y tus derechos como usuario." `
  -PageTitle "Pol&iacute;tica de Afiliados" `
  -Slug "politica-afiliados" `
  -TopbarSection "LEGAL &middot; AFILIADOS" `
  -H1 "Pol&iacute;tica de Afiliados" `
  -Lead "En ITVcheck creemos que la transparencia es la base de la confianza. Esta p&aacute;gina explica de forma clara y sencilla c&oacute;mo se monetiza este sitio web, qu&eacute; son los enlaces de afiliado y c&oacute;mo afectan (o no) a ti como usuario. En cumplimiento del Acuerdo Operativo de Amazon Associates y de la Ley 34/2002 (LSSI-CE)." `
  -Content $afiliadosContent

# ===== GUARDAR LOS 4 ARCHIVOS =====
$paginas = @(
  @{ Archivo = "aviso-legal.html";         Html = $avisoHtml },
  @{ Archivo = "politica-privacidad.html"; Html = $privHtml },
  @{ Archivo = "politica-cookies.html";    Html = $cookiesHtml },
  @{ Archivo = "politica-afiliados.html";  Html = $afiliadosHtml }
)

foreach ($p in $paginas) {
  $destino = Join-Path $base $p.Archivo
  Copy-Item $destino (Join-Path $bk $p.Archivo) -Force
  [System.IO.File]::WriteAllText($destino, $p.Html, [System.Text.UTF8Encoding]::new($false))

  Write-Host ""
  Write-Host "=== $($p.Archivo) ===" -ForegroundColor Cyan
  Write-Host "  styles-v2 (debe ser 1): $((Select-String -Path $destino -Pattern 'styles-v2').Count)"
  Write-Host "  styles.css (debe ser 0): $((Select-String -Path $destino -Pattern 'styles\.css').Count)"
  Write-Host "  <style> embebido (debe ser 0): $((Select-String -Path $destino -Pattern '<style>').Count)"
  Write-Host "  mojibake (debe ser 0): $((Select-String -Path $destino -Pattern ([char]0x00C3)).Count)"
}

Write-Host ""
Write-Host "Backup: $bk" -ForegroundColor Green
Write-Host ""
Start-Process "http://localhost:8000/aviso-legal.html"
Start-Process "http://localhost:8000/politica-privacidad.html"
Start-Process "http://localhost:8000/politica-cookies.html"
Start-Process "http://localhost:8000/politica-afiliados.html"