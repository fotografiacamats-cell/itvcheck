$base = "C:\Users\Usuario\Desktop\ITVcheck"
$destino = Join-Path $base "mantenimiento-coches-electricos.html"
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$bk = Join-Path $base "temp\backups\$ts"
New-Item -ItemType Directory -Path $bk -Force | Out-Null
Copy-Item $destino (Join-Path $bk "mantenimiento-coches-electricos.html") -Force

$html = @'
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Gu&iacute;a completa de mantenimiento para coches el&eacute;ctricos e h&iacute;bridos en 2026: la regla del 20-80, cuidado de la bater&iacute;a, carga r&aacute;pida, qu&eacute; revisan en la ITV y accesorios imprescindibles.">
<title>Mantenimiento de Coches El&eacute;ctricos e H&iacute;bridos 2026: Gu&iacute;a Completa | ITVcheck</title>
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
<link rel="canonical" href="https://itvcheck.es/mantenimiento-coches-electricos">
<script>
function loadScripts(){var s=document.createElement('script');s.src='https://www.googletagmanager.com/gtag/js?id=G-T1PZZHFJ4E';s.async=true;document.head.appendChild(s);window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('consent','default',{'ad_storage':'denied','ad_user_data':'denied','ad_personalization':'denied','analytics_storage':'denied'});gtag('js',new Date());gtag('config','G-T1PZZHFJ4E');var a=document.createElement('script');a.src='https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-7947218272068445';a.async=true;a.crossOrigin='anonymous';document.head.appendChild(a);}
if(localStorage.getItem('cookiesAceptadas')==='true'){loadScripts();}
</script>
<script type="application/ld+json">
{
 "@context":"https://schema.org",
 "@type":"Article",
 "headline":"Mantenimiento de Coches El&eacute;ctricos e H&iacute;bridos 2026: Gu&iacute;a Completa",
 "description":"Gu&iacute;a completa de mantenimiento para coches el&eacute;ctricos e h&iacute;bridos: regla del 20-80, cuidado de la bater&iacute;a, ITV espec&iacute;fica y accesorios imprescindibles.",
 "datePublished":"2026-07-01",
 "dateModified":"2026-10-03",
 "author":{"@type":"Person","name":"Daniel Vega","jobTitle":"T&eacute;cnico Superior en Automoci&oacute;n","url":"https://itvcheck.es/autor/daniel-vega"},
 "publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},
 "mainEntityOfPage":{"@type":"WebPage","@id":"https://itvcheck.es/mantenimiento-coches-electricos"}
}
</script>
<script type="application/ld+json">
{
 "@context":"https://schema.org",
 "@type":"FAQPage",
 "mainEntity":[
 {"@type":"Question","name":"\u00bfCada cu\u00e1nto pasa la ITV un coche el\u00e9ctrico o h\u00edbrido?","acceptedAnswer":{"@type":"Answer","text":"Exactamente igual que un coche de combusti\u00f3n: primera ITV a los 4 a\u00f1os, cada 2 a\u00f1os hasta los 10, y anualmente despu\u00e9s. La \u00fanica diferencia est\u00e1 en las pruebas que se realizan."}},
 {"@type":"Question","name":"\u00bfQu\u00e9 revisan en la ITV de un coche el\u00e9ctrico?","acceptedAnswer":{"@type":"Answer","text":"Adem\u00e1s de los controles habituales, se revisan visualmente la bater\u00eda de tracci\u00f3n, el cableado de alta tensi\u00f3n y el puerto de carga."}},
 {"@type":"Question","name":"\u00bfCu\u00e1l es la regla del 20-80 para la bater\u00eda de un coche el\u00e9ctrico?","acceptedAnswer":{"@type":"Answer","text":"Es la norma b\u00e1sica de conservaci\u00f3n: limitar la carga diaria al 80% y evitar que descienda del 20%. Someter las celdas a estados de carga extremos acelera la degradaci\u00f3n de la bater\u00eda."}},
 {"@type":"Question","name":"\u00bfEs malo usar siempre la carga r\u00e1pida en un coche el\u00e9ctrico?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed. El uso recurrente de la carga ultrarr\u00e1pida en corriente continua (DC) es uno de los factores que m\u00e1s aceleran el envejecimiento t\u00e9rmico de la bater\u00eda."}},
 {"@type":"Question","name":"\u00bfQu\u00e9 accesorios son imprescindibles para un coche el\u00e9ctrico?","acceptedAnswer":{"@type":"Answer","text":"Un cable de carga Tipo 2 de 7 metros y 22 kW, una funda impermeable para el puerto de carga y un limpiador espec\u00edfico para interiores y exteriores."}}
 ]
}
</script>
</head>
<body>

<div id="cookieBanner">
  <p>Utilizamos cookies para mejorar tu experiencia y mostrar anuncios de Google AdSense. <a href="politica-cookies">M&aacute;s informaci&oacute;n</a></p>
  <button onclick="aceptarCookies()">Aceptar</button>
  <button class="reject" onclick="rechazarCookies()">Rechazar</button>
</div>

<a href="https://api.whatsapp.com/send?text=Estoy%20consultando%20el%20mantenimiento%20de%20coches%20el%C3%A9ctricos%20con%20ITVcheck" target="_blank" id="whatsappBtn" aria-label="Contactar por WhatsApp">&#128172;</a>

<div class="itv-topbar">
  <div class="itv-topbar-inner">
    <span><span class="dot"></span>ITVCHECK &middot; EDICI&Oacute;N 2026</span>
    <span>GU&Iacute;A 18 &middot; EL&Eacute;CTRICOS E H&Iacute;BRIDOS</span>
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
  <span>GU&Iacute;A 18 &middot; <strong>Edici&oacute;n 2026</strong></span>
</div>

<section class="mag-hero hero-blog">
  <div class="mag-hero-text">
    <span class="kicker">Actualizado Octubre 2026 &middot; 8 min de lectura</span>
    <h1 class="h1-inline">Mantenimiento <em>de un el&eacute;ctrico.</em></h1>
    <p class="lead">Los el&eacute;ctricos no necesitan cambios de aceite, pero s&iacute; exigen cuidados espec&iacute;ficos. La <strong>regla del 20-80</strong> alarga la vida de la bater&iacute;a, la carga r&aacute;pida recurrente la acorta, y desde 2026 la ITV revisa bater&iacute;a, cableado de alta tensi&oacute;n y puerto de carga. Aqu&iacute; tienes lo que de verdad importa.</p>
    <div class="mag-hero-ctas">
      <a href="#regla" class="btn-hero">La regla del 20-80 &rarr;</a>
      <a href="#itv" class="btn-hero-secondary">Qu&eacute; revisa la ITV &rarr;</a>
    </div>
  </div>
  <aside class="mag-hero-aside">
    <span class="label">Datos clave</span>
    <div class="stat-row">
      <span class="n">20-80<small>%</small></span>
      <span class="l">Rango &oacute;ptimo<br>de carga diaria</span>
    </div>
    <div class="stat-row">
      <span class="n">4<small>a&ntilde;os</small></span>
      <span class="l">Primera ITV<br>igual que un gasolina</span>
    </div>
    <div class="stat-row">
      <span class="n">3<small>a&ntilde;os</small></span>
      <span class="l">Plazo UE para<br>nueva ITV de el&eacute;ctricos</span>
    </div>
  </aside>
</section>

<div class="mag-data-bar">
  <div>
    <span class="n">20-80<small>%</small></span>
    <span class="l">Rango &oacute;ptimo<br>de carga diaria</span>
  </div>
  <div>
    <span class="n">4<small>a&ntilde;os</small></span>
    <span class="l">Primera ITV<br>obligatoria</span>
  </div>
  <div>
    <span class="n">2<small>a&ntilde;os</small></span>
    <span class="l">Intervalo hasta<br>los 10 a&ntilde;os</span>
  </div>
  <div>
    <span class="n">3<small>a&ntilde;os</small></span>
    <span class="l">Plazo UE para<br>nueva ITV de el&eacute;ctricos</span>
  </div>
</div>

<div class="container">

<p>Los coches el&eacute;ctricos e h&iacute;bridos han dejado de ser una rareza para convertirse en una parte fundamental del parque m&oacute;vil espa&ntilde;ol. Uno de cada cinco coches nuevos matriculados en Europa ya dispone de conexi&oacute;n para recarga. Pero este cambio tecnol&oacute;gico trae consigo una serie de dudas sobre su mantenimiento: &iquest;se degrada la bater&iacute;a? &iquest;Es malo cargar siempre al 100%? &iquest;Qu&eacute; revisan en la ITV de un el&eacute;ctrico? En esta gu&iacute;a respondemos a todas estas preguntas con datos de fuentes como <strong>El Pa&iacute;s Motor</strong>, <strong>Renault</strong>, <strong>Applus ITV</strong> y la <strong>DGT</strong>.</p>

<div class="mag-notice-inner">
  <h3>Aviso de afiliaci&oacute;n</h3>
  <p>Esta gu&iacute;a contiene enlaces de afiliado de Amazon. Si compras a trav&eacute;s de ellos, ganamos una peque&ntilde;a comisi&oacute;n sin coste adicional para ti. <a href="politica-afiliados">M&aacute;s informaci&oacute;n &rarr;</a></p>
</div>

<h2 id="regla">La regla del 20-80: el cuidado esencial de la bater&iacute;a</h2>

<p>La bater&iacute;a es el componente m&aacute;s caro y delicado de un coche el&eacute;ctrico. Su sustituci&oacute;n puede suponer una cifra equivalente a buena parte del valor residual del veh&iacute;culo. La buena noticia es que, con unos h&aacute;bitos sencillos, puedes alargar significativamente su vida &uacute;til.</p>

<p>La norma b&aacute;sica de conservaci&oacute;n es la conocida como <strong>regla del 20-80</strong>: limitar la carga diaria al 80% y evitar que descienda del 20%. Someter las celdas a estados de carga extremos de forma prolongada incrementa severamente el estr&eacute;s qu&iacute;mico interno, lo que acelera la degradaci&oacute;n de la bater&iacute;a.</p>

<div class="mag-notice-inner">
  <h3>Matiz importante</h3>
  <p>La tecnolog&iacute;a de tu bater&iacute;a condiciona la aplicaci&oacute;n de esta regla. Las bater&iacute;as de <strong>NMC</strong> (N&iacute;quel-Manganeso-Cobalto) sufren especialmente en los extremos, por lo que la regla del 20-80 es m&aacute;s estricta. En cambio, las de <strong>LFP</strong> (Litio-Ferrofosfato) requieren cargas peri&oacute;dicas al 100% para que el sistema de gesti&oacute;n (BMS) equilibre el estado de carga real de cada celda. Consulta el manual de tu veh&iacute;culo para saber qu&eacute; tipo de bater&iacute;a monta.</p>
</div>

<h3>Los 6 mandamientos para cuidar la bater&iacute;a</h3>

<ol>
<li><strong>Regla del 20-80:</strong> limita la carga diaria al 80% y evita bajar del 20%.</li>
<li><strong>Modera la carga r&aacute;pida:</strong> reserva la carga DC para viajes largos.</li>
<li><strong>Gesti&oacute;n t&eacute;rmica:</strong> evita el sol directo y el calor extremo.</li>
<li><strong>No dejes el coche al 0%:</strong> si no vas a usar el veh&iacute;culo durante semanas, d&eacute;jalo en torno al 50%.</li>
<li><strong>Carga completa cuando toque:</strong> si vas a hacer un viaje largo, cargar al 100% tiene todo el sentido.</li>
<li><strong>Preacondicionamiento:</strong> en invierno, usa la funci&oacute;n de precalentamiento de la bater&iacute;a si tu coche la tiene.</li>
</ol>

<div class="ad-slot"><ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-7947218272068445" data-ad-slot="0987654321" data-ad-format="auto" data-full-width-responsive="true"></ins></div>

<h2 id="itv">La ITV de un coche el&eacute;ctrico o h&iacute;brido: qu&eacute; cambia</h2>

<p>La ITV de un coche el&eacute;ctrico es obligatoria exactamente igual que para cualquier coche de combusti&oacute;n. El calendario se mantiene invariable: <strong>primera inspecci&oacute;n a los 4 a&ntilde;os, cada 2 a&ntilde;os hasta los 10, y anualmente despu&eacute;s</strong>.</p>

<h3>Qu&eacute; se revisa igual que en un gasolina</h3>

<p>La ITV de un coche electrificado revisa elementos comunes a cualquier turismo: identificaci&oacute;n, matr&iacute;cula, alumbrado, neum&aacute;ticos, frenos, suspensi&oacute;n, direcci&oacute;n, carrocer&iacute;a, cinturones, visibilidad y documentaci&oacute;n.</p>

<h3>Qu&eacute; se revisa de forma espec&iacute;fica</h3>

<ul>
<li><strong>Bater&iacute;a de tracci&oacute;n:</strong> comprobaci&oacute;n visual de la carcasa en busca de golpes, deformaciones o signos de sobrecalentamiento.</li>
<li><strong>Cableado de alta tensi&oacute;n:</strong> verificaci&oacute;n del estado visible de los cables naranjas, protecciones y fijaciones.</li>
<li><strong>Puerto de carga:</strong> comprobaci&oacute;n de que el conector no tiene holgura y est&aacute; en buen estado.</li>
<li><strong>Sistemas ADAS:</strong> las nuevas normativas europeas incorporar&aacute;n la verificaci&oacute;n de sensores, c&aacute;maras y radares.</li>
</ul>

<div class="mag-notice-inner">
  <h3>Cambio normativo en 2026</h3>
  <p>La Uni&oacute;n Europea ha aprobado una actualizaci&oacute;n de la normativa de ITV que har&aacute; obligatorias comprobaciones espec&iacute;ficas en bater&iacute;as de alta tensi&oacute;n, cableado y sistemas ADAS. Los pa&iacute;ses tienen tres a&ntilde;os para implantar las medidas. En la pr&aacute;ctica, si la carcasa de tu bater&iacute;a presenta golpes o el conector de carga tiene holgura, la ITV podr&aacute; marcarlo como <strong>defecto grave</strong>.</p>
</div>

<h2>Accesorios imprescindibles para tu el&eacute;ctrico o h&iacute;brido</h2>

<p>Si acabas de comprar un el&eacute;ctrico o h&iacute;brido, o si vas a hacer un viaje largo, estos accesorios te ahorrar&aacute;n m&aacute;s de un disgusto:</p>

<h3>Cable de carga Tipo 2 (Mode 3) &mdash; 7 metros, 22 kW</h3>
<p>Si tu wallbox no tiene cable integrado o necesitas cargar en puntos p&uacute;blicos, un cable de carga Tipo 2 es imprescindible. El modelo de <strong>bokman</strong> ofrece 7 metros de longitud, 22 kW de potencia, trif&aacute;sico y con certificaci&oacute;n T&Uuml;V.</p>

<h3>Funda impermeable para puerto de carga</h3>
<p>La lluvia, el polvo y la humedad pueden da&ntilde;ar el puerto de carga de tu veh&iacute;culo. Esta funda impermeable, fabricada en PVC transparente de alta resistencia, protege el conector mientras cargas el coche, incluso bajo lluvia intensa.</p>

<h3>Kit de limpieza interior y exterior</h3>
<p>El <strong>Pack de Limpieza GxDetail</strong> incluye productos espec&iacute;ficos para el interior y exterior de veh&iacute;culos el&eacute;ctricos. Los materiales veganos y las pantallas t&aacute;ctiles de estos coches requieren limpiadores suaves que no da&ntilde;en las superficies.</p>

<!-- AMAZON-CARDS-BLOCK -->
<div class="afiliados-aviso">Enlace de afiliado &middot; Si compras, ganamos una comisi&oacute;n sin coste para ti.</div>
<div class="amazon-card">
  <div style="width:140px;height:140px;background:#F1F5F9;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:42px;">&#128722;</div>
  <div class="amazon-card-body">
    <h4>bokman Cable de Carga Tipo 2 (7 m, 22 kW)</h4>
    <p>Trif&aacute;sico, con certificaci&oacute;n T&Uuml;V. Compatible con puntos de carga p&uacute;blicos y wallbox sin cable integrado.</p>
    <a href="https://www.amazon.es/dp/B0CKSG4G98?tag=itvcheck-21&linkCode=ll1" target="_blank" rel="nofollow sponsored" class="btn-amazon">Ver precio en Amazon</a>
  </div>
</div>
<div class="amazon-card">
  <div style="width:140px;height:140px;background:#F1F5F9;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:42px;">&#128722;</div>
  <div class="amazon-card-body">
    <h4>Funda Impermeable para Puerto de Carga</h4>
    <p>PVC transparente de alta resistencia. Protege el conector mientras cargas, incluso bajo lluvia intensa.</p>
    <a href="https://www.amazon.es/dp/B09Q825SRR?tag=itvcheck-21&linkCode=ll1" target="_blank" rel="nofollow sponsored" class="btn-amazon">Ver precio en Amazon</a>
  </div>
</div>
<div class="amazon-card">
  <div style="width:140px;height:140px;background:#F1F5F9;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:42px;">&#128722;</div>
  <div class="amazon-card-body">
    <h4>Pack de Limpieza GxDetail</h4>
    <p>Productos espec&iacute;ficos para el interior y exterior de el&eacute;ctricos. Suaves con pantallas t&aacute;ctiles y materiales veganos.</p>
    <a href="https://www.amazon.es/dp/B0BPMT7TQL?tag=itvcheck-21&linkCode=ll1" target="_blank" rel="nofollow sponsored" class="btn-amazon">Ver precio en Amazon</a>
  </div>
</div>
<!-- /AMAZON-CARDS-BLOCK -->

<h2>Preguntas frecuentes sobre el mantenimiento de el&eacute;ctricos</h2>

<h3>&iquest;Cada cu&aacute;nto pasa la ITV un coche el&eacute;ctrico o h&iacute;brido?</h3>
<p>Exactamente igual que un coche de combusti&oacute;n: primera ITV a los 4 a&ntilde;os, cada 2 a&ntilde;os hasta los 10, y anualmente despu&eacute;s.</p>

<h3>&iquest;Qu&eacute; revisan en la ITV de un coche el&eacute;ctrico?</h3>
<p>Adem&aacute;s de los controles habituales, se revisan visualmente la bater&iacute;a de tracci&oacute;n, el cableado de alta tensi&oacute;n y el puerto de carga.</p>

<h3>&iquest;Cu&aacute;l es la regla del 20-80 para la bater&iacute;a de un coche el&eacute;ctrico?</h3>
<p>Es la norma b&aacute;sica de conservaci&oacute;n: limitar la carga diaria al 80% y evitar que descienda del 20%.</p>

<h3>&iquest;Es malo usar siempre la carga r&aacute;pida en un coche el&eacute;ctrico?</h3>
<p>S&iacute;. El uso recurrente de la carga ultrarr&aacute;pida en corriente continua (DC) es uno de los factores que m&aacute;s aceleran el envejecimiento t&eacute;rmico de la bater&iacute;a.</p>

<h3>&iquest;Qu&eacute; accesorios son imprescindibles para un coche el&eacute;ctrico?</h3>
<p>Un cable de carga Tipo 2, una funda impermeable para el puerto de carga y un limpiador espec&iacute;fico para interiores y exteriores.</p>

<h3>&iquest;Los coches el&eacute;ctricos tienen menos mantenimiento que los de combusti&oacute;n?</h3>
<p>S&iacute;, en general. Al tener menos piezas m&oacute;viles, el mantenimiento es m&aacute;s sencillo y econ&oacute;mico. Sin embargo, existen otros costes que pueden aparecer con el tiempo, como la sustituci&oacute;n o mantenimiento de componentes electr&oacute;nicos.</p>

<div class="mag-notice-inner">
  <h3>Resumen r&aacute;pido</h3>
  <p>La bater&iacute;a de un el&eacute;ctrico se cuida con la <strong>regla del 20-80</strong> (excepto LFP, que requiere cargas al 100% peri&oacute;dicas), moderando la carga r&aacute;pida y evitando extremos prolongados. La ITV de un el&eacute;ctrico sigue el mismo calendario que un gasolina, pero desde 2026 la UE exige revisi&oacute;n espec&iacute;fica de bater&iacute;a de tracci&oacute;n, cableado naranja y puerto de carga. Con golpes en la carcasa o conector con holgura, defecto grave.</p>
</div>

<div class="related-guides">
  <h3>Gu&iacute;as relacionadas</h3>
  <a href="/itv-coches-electricos">ITV para coches el&eacute;ctricos: qu&eacute; revisan</a>
  <a href="/baliza-v16-obligatoria">Baliza V-16 conectada: obligatoria y comparativa</a>
  <a href="/preparar-coche-viaje-largo">Preparar el coche para un viaje largo</a>
  <a href="/mejores-gadgets-coche">Los mejores gadgets para el coche en 2026</a>
  <a href="/guia-completa-itv">Gu&iacute;a completa de la ITV</a>
  <a href="/checklist-itv">Checklist pre-ITV (25 puntos)</a>
</div>

<div class="mag-notice-inner">
  <h3>Sobre el autor</h3>
  <p><strong>Daniel Vega</strong>, T&eacute;cnico Superior en Automoci&oacute;n con 12 a&ntilde;os de experiencia en inspecci&oacute;n y mantenimiento de veh&iacute;culos. Especialista en inspecci&oacute;n t&eacute;cnica y mec&aacute;nica DIY. <a href="/autor/daniel-vega">Ver perfil del autor &rarr;</a></p>
</div>

<div class="other-ccaa">
  <h3>ITV por comunidades</h3>
  <a href="/itv-madrid">ITV Madrid</a>
  <a href="/itv-cataluna">ITV Catalu&ntilde;a</a>
  <a href="/itv-andalucia">ITV Andaluc&iacute;a</a>
  <a href="/itv-valencia">ITV Comunidad Valenciana</a>
  <a href="/itv-por-comunidad">Ver todas las CCAA &rarr;</a>
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
      <span>MANUAL DE INSPECCI&Oacute;N &middot; GU&Iacute;A 18 &middot; EDICI&Oacute;N 2026</span>
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

[System.IO.File]::WriteAllText($destino, $html, [System.Text.UTF8Encoding]::new($false))

Write-Host ""
Write-Host "OK. Backup: $bk" -ForegroundColor Green
Write-Host "Guardado: $destino" -ForegroundColor Green
Write-Host ""
Write-Host "Verificacion:" -ForegroundColor Cyan
Write-Host "  styles-v2 (debe ser 1): $((Select-String -Path $destino -Pattern 'styles-v2').Count)"
Write-Host "  styles.css (debe ser 0): $((Select-String -Path $destino -Pattern 'styles\.css').Count)"
Write-Host "  <style> embebido (debe ser 0): $((Select-String -Path $destino -Pattern '<style>').Count)"
Write-Host "  mojibake (debe ser 0): $((Select-String -Path $destino -Pattern ([char]0x00C3)).Count)"
Write-Host "  GUIA 18 (debe ser 3): $((Select-String -Path $destino -Pattern 'GU&Iacute;A\s+18').Count)"
Write-Host ""
Start-Process "http://localhost:8000/mantenimiento-coches-electricos.html"