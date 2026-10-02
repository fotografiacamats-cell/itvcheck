# ============================================================
# GENERADOR DE PAGINAS CCAA v2
# Lee temp/extraccion-ccaa.json + datos editoriales manuales
# Produce 18 archivos v2 en temp/ccaas-v2/
# ============================================================

$base = "C:\Users\Usuario\Desktop\ITVcheck"
$jsonPath = "$base\temp\extraccion-ccaa.json"
$outDir = "$base\temp\ccaas-v2"
if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force | Out-Null }

$extra = [System.IO.File]::ReadAllText($jsonPath, [System.Text.UTF8Encoding]::new($false)) | ConvertFrom-Json

# ============================================================
# DATOS EDITORIALES MANUALES POR CCAA
# ============================================================
$manual = @{
    'itv-andalucia' = @{
        nombre='Andaluc&iacute;a'; em='Andaluc&iacute;a'
        intro='Andaluc&iacute;a es la comunidad m&aacute;s barata de Espa&ntilde;a para pasar la ITV, gracias a la gesti&oacute;n p&uacute;blica de VEIASA y las tarifas reguladas por la Junta.'
        peculiaridad='<h2>Peculiaridades de Andaluc&iacute;a</h2><ul><li><strong>Tarifa regulada:</strong> todas las estaciones cobran lo mismo.</li><li><strong>Descuento del 10%</strong> si adelantas la cita.</li><li><strong>VEIASA</strong> es empresa p&uacute;blica de la Junta y gestiona el 100%.</li></ul>'
        faq_extra_q='&iquest;Por qu&eacute; la ITV es tan barata en Andaluc&iacute;a?'
        faq_extra_a='Porque el sistema es de tarifa regulada y VEIASA es empresa p&uacute;blica de la Junta. No hay competencia entre operadores, y la Junta fija precios bajos como servicio p&uacute;blico.'
    }
    'itv-aragon' = @{
        nombre='Arag&oacute;n'; em='Arag&oacute;n'
        intro='Arag&oacute;n tiene tarifas reguladas y un mercado gestionado principalmente por SGS. Es una de las comunidades con menos operadores, lo que limita la comparaci&oacute;n de precios.'
        peculiaridad='<h2>Peculiaridades de Arag&oacute;n</h2><ul><li><strong>Tarifa regulada</strong> por el Gobierno de Arag&oacute;n.</li><li><strong>SGS</strong> es el operador dominante en la regi&oacute;n.</li><li>Precios en la media nacional (~49&euro; gasolina).</li></ul>'
        faq_extra_q='&iquest;Cu&aacute;ntas estaciones hay en Arag&oacute;n?'
        faq_extra_a='Arag&oacute;n cuenta con unas 14 estaciones repartidas principalmente entre Zaragoza, Huesca y Teruel, con SGS como operador principal.'
    }
    'itv-asturias' = @{
        nombre='Asturias'; em='Asturias'
        intro='Asturias tiene una empresa p&uacute;blica propia, ITVASA, que gestiona el servicio en todo el Principado. Es una de las comunidades con menos estaciones por kil&oacute;metro cuadrado.'
        peculiaridad='<h2>Peculiaridades de Asturias</h2><ul><li><strong>ITVASA</strong> es empresa p&uacute;blica del Principado.</li><li>Precio &uacute;nico para todos los veh&iacute;culos: ~45&euro;.</li><li>Solo 5 estaciones en toda la comunidad.</li></ul>'
        faq_extra_q='&iquest;Qui&eacute;n gestiona la ITV en Asturias?'
        faq_extra_a='ITVASA, empresa p&uacute;blica del Principado de Asturias, gestiona el 100% de las estaciones de la comunidad.'
    }
    'itv-baleares' = @{
        nombre='Baleares'; em='Baleares'
        intro='Baleares tiene un modelo especial: el precio var&iacute;a por isla y hay competencia entre Itevelesa y SGS en algunas zonas. Las tarifas son moderadas en comparaci&oacute;n con la media nacional.'
        peculiaridad='<h2>Peculiaridades de Baleares</h2><ul><li><strong>Precio por isla:</strong> Mallorca, Menorca, Ibiza y Formentera tienen tarifas propias.</li><li><strong>Itevelesa y SGS</strong> compiten en algunas islas.</li><li>Precios moderados: ~35-48&euro; gasolina.</li></ul>'
        faq_extra_q='&iquest;Cambia el precio de la ITV seg&uacute;n la isla?'
        faq_extra_a='S&iacute;. Cada isla tiene su propia tarifa regulada. Mallorca suele ser la m&aacute;s barata, mientras que las islas menores tienen precios superiores por el coste log&iacute;stico.'
    }
    'itv-canarias' = @{ nombre='Canarias'; em='Canarias'
        intro='Canarias tiene una particularidad fiscal: el IVA es del 7% en lugar del 21% peninsular. Eso reduce el precio final de la ITV respecto a la media nacional.'
        peculiaridad='<h2>Peculiaridades de Canarias</h2><ul><li><strong>IVA reducido del 7%</strong> (en lugar del 21%).</li><li><strong>SGS y Applus</strong> son los operadores principales.</li><li>Precios m&aacute;s bajos que la media por el IVA.</li></ul>'
        faq_extra_q='&iquest;Por qu&eacute; la ITV es m&aacute;s barata en Canarias?'
        faq_extra_a='Porque el IVA aplicable es del 7% (r&eacute;gimen fiscal especial de Canarias) en lugar del 21% peninsular. El tipo impositivo reduce directamente el precio final del servicio.'
    }
    'itv-cantabria' = @{
        nombre='Cantabria'; em='Cantabria'
        intro='Cantabria es una de las comunidades con precios m&aacute;s altos de Espa&ntilde;a, con tarifas reguladas y solo Itevelesa como operador principal.'
        peculiaridad='<h2>Peculiaridades de Cantabria</h2><ul><li><strong>Tarifa regulada alta:</strong> ~55&euro; gasolina.</li><li><strong>Itevelesa</strong> es el operador principal.</li><li>Solo 4 estaciones en la comunidad.</li></ul>'
        faq_extra_q='&iquest;Por qu&eacute; la ITV es tan cara en Cantabria?'
        faq_extra_a='Porque el Gobierno de Cantabria fija tarifas altas y solo hay 4 estaciones, lo que limita la competencia entre operadores.'
    }
    'itv-castillalamancha' = @{
        nombre='Castilla-La Mancha'; em='Castilla-La Mancha'
        intro='Castilla-La Mancha tiene tarifas reguladas con dos operadores principales (SGS y T&Uuml;V S&Uuml;D). Es una comunidad extensa con estaciones repartidas por las 5 provincias.'
        peculiaridad='<h2>Peculiaridades de Castilla-La Mancha</h2><ul><li><strong>SGS y T&Uuml;V S&Uuml;D</strong> compiten por zonas.</li><li>Tarifa regulada por la Junta.</li><li>12 estaciones en toda la comunidad.</li></ul>'
        faq_extra_q='&iquest;Cu&aacute;ntas estaciones hay en Castilla-La Mancha?'
        faq_extra_a='Unas 12 estaciones repartidas entre Toledo, Albacete, Ciudad Real, Cuenca y Guadalajara, gestionadas por SGS y T&Uuml;V S&Uuml;D.'
    }
    'itv-castillayleon' = @{
        nombre='Castilla y Le&oacute;n'; em='Castilla y Le&oacute;n'
        intro='Castilla y Le&oacute;n tiene tarifa regulada e Itevelesa como operador principal. Es una de las comunidades m&aacute;s extensas, con precios en la media-alta nacional.'
        peculiaridad='<h2>Peculiaridades de Castilla y Le&oacute;n</h2><ul><li><strong>Itevelesa</strong> es el operador dominante.</li><li>Tarifa regulada por la Junta.</li><li>8 estaciones repartidas por las 9 provincias.</li></ul>'
        faq_extra_q='&iquest;Qu&eacute; operador gestiona la ITV en Castilla y Le&oacute;n?'
        faq_extra_a='Itevelesa gestiona la mayor&iacute;a de las estaciones de Castilla y Le&oacute;n, con algunas adicionales de otros operadores menores.'
    }
    'itv-cataluna' = @{
        nombre='Catalu&ntilde;a'; em='Catalu&ntilde;a'
        intro='Catalu&ntilde;a es una de las comunidades m&aacute;s complejas: tiene tarifas m&aacute;ximas reguladas, 3 operadores compitiendo y una de las redes de estaciones m&aacute;s densas de Espa&ntilde;a.'
        peculiaridad='<h2>Peculiaridades de Catalu&ntilde;a</h2><ul><li><strong>3 operadores compitiendo:</strong> Applus, T&Uuml;V S&Uuml;D e Itevelesa.</li><li><strong>Tarifa m&aacute;xima regulada</strong> por la Generalitat.</li><li>16 estaciones en toda la comunidad.</li><li>Segunda inspecci&oacute;n con tarifa reducida.</li></ul>'
        faq_extra_q='&iquest;Puedo elegir operador en Catalu&ntilde;a?'
        faq_extra_a='S&iacute;. Puedes pasar la ITV en cualquier estaci&oacute;n catalana autorizada, sea de Applus, T&Uuml;V S&Uuml;D o Itevelesa. Los precios son similares porque hay una tarifa m&aacute;xima regulada.'
    }
    'itv-ceuta' = @{
        nombre='Ceuta'; em='Ceuta'
        intro='Ceuta tiene un mercado muy peque&ntilde;o con solo 2 estaciones gestionadas por Itevelesa bajo concesi&oacute;n &uacute;nica. Los precios son de los m&aacute;s altos de Espa&ntilde;a.'
        peculiaridad='<h2>Peculiaridades de Ceuta</h2><ul><li><strong>Solo 2 estaciones</strong> en la ciudad aut&oacute;noma.</li><li><strong>Itevelesa</strong> tiene la concesi&oacute;n &uacute;nica.</li><li>Precios altos por falta de competencia.</li></ul>'
        faq_extra_q='&iquest;Por qu&eacute; la ITV es tan cara en Ceuta?'
        faq_extra_a='Porque solo hay 2 estaciones y una &uacute;nica concesi&oacute;n. Sin competencia, los precios se mantienen altos.'
    }
    'itv-extremadura' = @{
        nombre='Extremadura'; em='Extremadura'
        intro='Extremadura es una de las comunidades m&aacute;s baratas de Espa&ntilde;a. Con Dekra como operador principal y tarifas mixtas (p&uacute;blica y privada), los precios son muy competitivos.'
        peculiaridad='<h2>Peculiaridades de Extremadura</h2><ul><li><strong>Dekra</strong> es el operador principal.</li><li>Tarifas mixtas: parte p&uacute;blica, parte privada.</li><li>Precios desde ~33&euro; gasolina, de los m&aacute;s bajos.</li></ul>'
        faq_extra_q='&iquest;Qui&eacute;n gestiona la ITV en Extremadura?'
        faq_extra_a='Dekra es el operador principal, aunque la Junta de Extremadura mantiene cierto control sobre las tarifas del servicio.'
    }
    'itv-galicia' = @{
        nombre='Galicia'; em='Galicia'
        intro='Galicia tiene una empresa p&uacute;blica propia (SYC) que gestiona el 100% del servicio. Es una de las comunidades donde la segunda inspecci&oacute;n es gratuita si vuelves en plazo.'
        peculiaridad='<h2>Peculiaridades de Galicia</h2><ul><li><strong>SYC</strong> es empresa p&uacute;blica de la Xunta.</li><li><strong>Segunda inspecci&oacute;n gratuita</strong> si vuelves en plazo.</li><li>11 estaciones repartidas por las 4 provincias.</li></ul>'
        faq_extra_q='&iquest;Es gratuita la segunda inspecci&oacute;n en Galicia?'
        faq_extra_a='S&iacute;, si vuelves dentro del plazo establecido tras una ITV desfavorable, la segunda inspecci&oacute;n no tiene coste en Galicia.'
    }
    'itv-larioja' = @{
        nombre='La Rioja'; em='La Rioja'
        intro='La Rioja tiene 3 operadores compitiendo (T&Uuml;V S&Uuml;D, Itevelesa y SGS) en una comunidad muy peque&ntilde;a con solo 4 estaciones.'
        peculiaridad='<h2>Peculiaridades de La Rioja</h2><ul><li><strong>3 operadores</strong> en solo 4 estaciones.</li><li>Tarifas reguladas por el Gobierno de La Rioja.</li><li>Precios moderados: ~41,80&euro; gasolina.</li></ul>'
        faq_extra_q='&iquest;Qu&eacute; operadores hay en La Rioja?'
        faq_extra_a='T&Uuml;V S&Uuml;D, Itevelesa y SGS compiten en las 4 estaciones de La Rioja.'
    }
    'itv-melilla' = @{
        nombre='Melilla'; em='Melilla'
        intro='Melilla tiene un mercado muy reducido con solo 2 estaciones gestionadas por Ivesur, el operador local. La concesi&oacute;n &uacute;nica mantiene los precios en la media-alta nacional.'
        peculiaridad='<h2>Peculiaridades de Melilla</h2><ul><li><strong>Solo 2 estaciones</strong> en la ciudad aut&oacute;noma.</li><li><strong>Ivesur</strong> es el operador local &uacute;nico.</li><li>Precios similares a Ceuta.</li></ul>'
        faq_extra_q='&iquest;Qu&eacute; operador gestiona la ITV en Melilla?'
        faq_extra_a='Ivesur es el operador autorizado en Melilla. Gestiona las 2 estaciones de la ciudad aut&oacute;noma.'
    }
    'itv-murcia' = @{
        nombre='Murcia'; em='Murcia'
        intro='Murcia es, junto con Madrid, la &uacute;nica comunidad con tarifas liberalizadas. Cada estaci&oacute;n fija su precio, y T&Uuml;V S&Uuml;D es el operador principal.'
        peculiaridad='<h2>Peculiaridades de Murcia</h2><ul><li><strong>Tarifas liberalizadas</strong> como Madrid.</li><li><strong>T&Uuml;V S&Uuml;D</strong> es el operador principal.</li><li>La horquilla de precios puede superar los 15&euro;.</li></ul>'
        faq_extra_q='&iquest;Puedo ahorrar comparando estaciones en Murcia?'
        faq_extra_a='S&iacute;. Al tener tarifas liberalizadas, cada estaci&oacute;n fija su precio. Comparar antes de reservar puede ahorrarte entre 10 y 15 euros.'
    }
    'itv-navarra' = @{
        nombre='Navarra'; em='Navarra'
        intro='Navarra tiene un modelo mixto con T&Uuml;V S&Uuml;D e Itasua como operadores. Las tarifas son reguladas y est&aacute;n en la media-alta nacional.'
        peculiaridad='<h2>Peculiaridades de Navarra</h2><ul><li><strong>Modelo mixto:</strong> T&Uuml;V S&Uuml;D + Itasua.</li><li>Tarifa regulada por el Gobierno de Navarra.</li><li>5 estaciones en toda la comunidad.</li></ul>'
        faq_extra_q='&iquest;Qu&eacute; operadores hay en Navarra?'
        faq_extra_a='T&Uuml;V S&Uuml;D e Itasua gestionan las 5 estaciones de Navarra bajo tarifa regulada.'
    }
    'itv-paisvasco' = @{
        nombre='Pa&iacute;s Vasco'; em='Pa&iacute;s Vasco'
        intro='Pa&iacute;s Vasco es la comunidad m&aacute;s cara de Espa&ntilde;a. Su sistema &uacute;nico de tarifas indexadas al IPC hace que los precios suban autom&aacute;ticamente cada a&ntilde;o con la inflaci&oacute;n.'
        peculiaridad='<h2>Peculiaridades del Pa&iacute;s Vasco</h2><ul><li><strong>Tarifas indexadas al IPC:</strong> suben cada 1 de enero seg&uacute;n la inflaci&oacute;n.</li><li><strong>Itevelesa e Itasua</strong> son los operadores.</li><li>Precio m&aacute;s alto de Espa&ntilde;a: ~59,46&euro; gasolina.</li></ul>'
        faq_extra_q='&iquest;Por qu&eacute; la ITV es tan cara en Pa&iacute;s Vasco?'
        faq_extra_a='Porque las tarifas se actualizan autom&aacute;ticamente seg&uacute;n el IPC interanual de octubre. En a&ntilde;os de inflaci&oacute;n alta, suben significativamente. Es el &uacute;nico sistema de este tipo en Espa&ntilde;a.'
    }
    'itv-valencia' = @{
        nombre='Comunidad Valenciana'; em='Comunidad Valenciana'
        intro='La Comunidad Valenciana tiene una empresa p&uacute;blica propia (SITVAL) y es la comunidad con la ITV m&aacute;s barata para coches el&eacute;ctricos (25,05&euro;).'
        peculiaridad='<h2>Peculiaridades de la Comunidad Valenciana</h2><ul><li><strong>SITVAL</strong> es empresa p&uacute;blica de la Generalitat.</li><li><strong>ITV el&eacute;ctrica m&aacute;s barata de Espa&ntilde;a:</strong> 25,05&euro;.</li><li>20 estaciones repartidas por las 3 provincias.</li></ul>'
        faq_extra_q='&iquest;Por qu&eacute; la ITV de el&eacute;ctricos es tan barata en Valencia?'
        faq_extra_a='SITVAL aplica una tarifa reducida espec&iacute;fica para veh&iacute;culos el&eacute;ctricos, con la que es la comunidad m&aacute;s barata de Espa&ntilde;a para este tipo de veh&iacute;culos.'
    }
}

# ============================================================
# PLANTILLA HTML
# ============================================================
$template = @'
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="{{META_DESC}}">
<title>{{TITLE}}</title>
<link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>&#128663;</text></svg>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Archivo:wght@500;600;700;800;900&family=IBM+Plex+Sans:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/styles-v2.css">
<link rel="stylesheet" href="/styles-editorial.css">
<link rel="canonical" href="https://itvcheck.es/{{SLUG}}">
<style>
.ccaa-estaciones{background:var(--paper-2);border:1px solid var(--line);border-left:3px solid var(--signal);border-radius:0 4px 4px 0;padding:32px 40px;margin:40px 0;}
.ccaa-estaciones h2{font-family:var(--font-display);font-size:26px;font-weight:800;letter-spacing:-0.02em;color:var(--ink);margin:0 0 8px;padding:0;border:none;}
.ccaa-estaciones .lead{font-size:14px;color:var(--ink-3);margin-bottom:24px;}
.ccaa-estaciones ul{list-style:none;margin:0;padding:0;columns:2;column-gap:32px;}
.ccaa-estaciones li{padding:8px 0;border-bottom:1px dashed var(--line);font-size:14px;break-inside:avoid;}
.ccaa-estaciones li a{color:var(--ink);font-weight:600;text-decoration:none;}
.ccaa-estaciones li a:hover{color:var(--signal-dark);}
.ccaa-estaciones li .op{color:var(--ink-3);font-family:var(--font-mono);font-size:11px;letter-spacing:0.03em;}
.ccaa-estaciones .footer-cta{margin-top:20px;}
.ccaa-estaciones .footer-cta a{color:var(--signal-dark);font-family:var(--font-mono);font-size:12px;font-weight:600;letter-spacing:0.08em;text-transform:uppercase;text-decoration:none;}
.ccaa-estaciones .footer-cta a:hover{text-decoration:underline;}
@media (max-width:700px){.ccaa-estaciones{padding:24px;}.ccaa-estaciones ul{columns:1;}}
</style>
<script>
function loadScripts(){var s=document.createElement('script');s.src='https://www.googletagmanager.com/gtag/js?id=G-T1PZZHFJ4E';s.async=true;document.head.appendChild(s);window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('consent','default',{'ad_storage':'denied','ad_user_data':'denied','ad_personalization':'denied','analytics_storage':'denied'});gtag('js',new Date());gtag('config','G-T1PZZHFJ4E');var a=document.createElement('script');a.src='https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-7947218272068445';a.async=true;a.crossOrigin='anonymous';document.head.appendChild(a);}
if(localStorage.getItem('cookiesAceptadas')==='true'){loadScripts();}
</script>
<script type="application/ld+json">
{"@context":"https://schema.org","@type":"Article","headline":"ITV en {{NOMBRE}} 2026: precios, estaciones y consejos","description":"{{META_DESC}}","author":{"@type":"Person","name":"Daniel Vega","url":"https://itvcheck.es/autor/daniel-vega","jobTitle":"T\u00e9cnico Superior en Automoci\u00f3n"},"publisher":{"@type":"Organization","name":"ITVcheck","url":"https://itvcheck.es"},"datePublished":"2026-10-02","dateModified":"2026-10-02"}
</script>
<script type="application/ld+json">
{"@context":"https://schema.org","@type":"FAQPage","mainEntity":[{{FAQ_JSON}}]}
</script>
<script type="application/ld+json">
{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Inicio","item":"https://itvcheck.es/"},{"@type":"ListItem","position":2,"name":"ITV por comunidad","item":"https://itvcheck.es/itv-por-comunidad"},{"@type":"ListItem","position":3,"name":"ITV {{NOMBRE}}"}]}
</script>
</head>
<body>
<div id="cookieBanner"><p>Utilizamos cookies para mejorar tu experiencia y mostrar anuncios de Google AdSense. <a href="politica-cookies">M&aacute;s informaci&oacute;n</a></p><button onclick="aceptarCookies()">Aceptar</button><button class="reject" onclick="rechazarCookies()">Rechazar</button></div>
<a href="https://api.whatsapp.com/send?text=Estoy%20consultando%20la%20ITV%20en%20{{NOMBRE_URL}}%20con%20ITVcheck" target="_blank" id="whatsappBtn" aria-label="Contactar por WhatsApp">&#128172;</a>
<div class="itv-topbar"><div class="itv-topbar-inner"><span><span class="dot"></span>ITVCHECK &middot; EDICI&Oacute;N 2026</span><span>{{TOPBAR_RIGHT}}</span></div></div>
<header class="itv-header"><div class="itv-header-inner"><a href="/index" class="itv-logo"><span class="itv-logo-mark">ITV</span>ITVcheck</a><button class="itv-nav-toggle" aria-label="Abrir men&uacute;" aria-expanded="false"><span></span><span></span><span></span></button><nav class="itv-nav"><a href="/guias">Gu&iacute;as</a><a href="/estaciones-itv">Estaciones</a><a href="/operadores-itv-espana">Operadores</a><a href="/calculadora-precio-itv">Precios</a><a href="/checklist-itv">Checklist</a></nav></div></header>
<div class="mag-issue-bar"><span>ITVcheck &middot; Manual de inspecci&oacute;n t&eacute;cnica</span><span>{{ISSUE_RIGHT}}</span></div>
<section class="mag-hero hero-blog">
  <div class="mag-hero-text">
    <span class="kicker">Actualizado Octubre 2026 &middot; 8 min de lectura</span>
    <h1 class="h1-inline">La ITV <em>en {{EM}}.</em></h1>
    <p class="lead">{{INTRO}}</p>
    <div class="mag-hero-ctas"><a href="#precios" class="btn-hero">Ver precios &rarr;</a><a href="/calculadora-precio-itv" class="btn-hero-secondary">Comparar con otras CCAA &rarr;</a></div>
  </div>
  <aside class="mag-hero-aside">
    <span class="label">Datos clave</span>
    <div class="stat-row"><span class="n">{{KPI1_N}}</span><span class="l">{{KPI1_L}}</span></div>
    <div class="stat-row"><span class="n">{{KPI2_N}}</span><span class="l">{{KPI2_L}}</span></div>
    <div class="stat-row"><span class="n">{{KPI3_N}}</span><span class="l">{{KPI3_L}}</span></div>
  </aside>
</section>
<div class="mag-data-bar">
  <div><span class="n">{{BAR1_N}}<small>{{BAR1_U}}</small></span><span class="l">{{BAR1_L}}</span></div>
  <div><span class="n">{{BAR2_N}}<small>{{BAR2_U}}</small></span><span class="l">{{BAR2_L}}</span></div>
  <div><span class="n">{{BAR3_N}}<small>{{BAR3_U}}</small></span><span class="l">{{BAR3_L}}</span></div>
  <div><span class="n">{{BAR4_N}}<small>{{BAR4_U}}</small></span><span class="l">{{BAR4_L}}</span></div>
</div>
<div class="container">
{{PECULIARIDAD}}
<h2 id="precios">Precios orientativos 2026</h2>
<p>Tarifas de referencia para turismos y motocicletas en {{NOMBRE}}. Los precios pueden variar seg&uacute;n la estaci&oacute;n.</p>
<table class="defect-table">
<tr><th>Tipo de veh&iacute;culo</th><th>Precio orientativo</th></tr>
{{PRECIOS_ROWS}}
</table>
<h2>Operadores autorizados en {{NOMBRE}}</h2>
<ul>{{OPERADORES_LIST}}</ul>
<div class="mag-notice-inner">
  <h3>&iquest;Quieres pasar la ITV en otra comunidad?</h3>
  <p>Puedes pasar la ITV en cualquier estaci&oacute;n autorizada de Espa&ntilde;a, sin importar d&oacute;nde est&eacute; matriculado el coche.</p>
  <a href="/calculadora-precio-itv">Ver comparador de precios por CCAA &rarr;</a>
</div>
<h2>Preguntas frecuentes sobre la ITV en {{NOMBRE}}</h2>
{{FAQ_HTML}}
<div class="mag-notice-inner">
  <h3>Resumen r&aacute;pido</h3>
  <p>{{RESUMEN}}</p>
</div>
<div class="related-guides">
  <h3>Gu&iacute;as relacionadas</h3>
  <a href="/guia-luces">Qu&eacute; revisar en las luces antes de la ITV</a>
  <a href="/guia-neumaticos">Revisi&oacute;n de neum&aacute;ticos: el dibujo m&iacute;nimo legal</a>
  <a href="/guia-frenos">C&oacute;mo revisar los frenos en casa</a>
  <a href="/guia-documentacion">Documentaci&oacute;n obligatoria para la ITV</a>
  <a href="/que-pasa-si-suspendo-la-itv">Qu&eacute; hacer si suspendes la ITV</a>
  <a href="/como-interpretar-informe-itv">C&oacute;mo interpretar el informe de la ITV</a>
</div>
<div class="ccaa-estaciones">
  <h2>Estaciones de ITV en {{NOMBRE}} ({{NUM_EST}})</h2>
  <p class="lead">Cada estaci&oacute;n tiene su ficha con tel&eacute;fono, horario, ubicaci&oacute;n, precio orientativo y bot&oacute;n de cita previa.</p>
  <ul>{{ESTACIONES_LIST}}</ul>
  <p class="footer-cta"><a href="/estaciones-itv">Ver mapa completo de estaciones &rarr;</a></p>
</div>
<div class="related-guides">
  <h3>Otras comunidades aut&oacute;nomas</h3>
  {{OTRAS_CCAA}}
  <a href="/itv-por-comunidad">Ver todas las CCAA &rarr;</a>
</div>
<p><a href="/index" class="btn">&larr; Volver a la p&aacute;gina principal</a></p>
</div>
<footer class="itv-footer">
  <div class="itv-footer-inner">
    <div class="itv-footer-top">
      <div class="itv-footer-brand"><a href="/index" class="itv-logo"><span class="itv-logo-mark">ITV</span>ITVcheck</a><p>Manual de inspecci&oacute;n t&eacute;cnica independiente sobre la ITV en Espa&ntilde;a. Gu&iacute;as t&eacute;cnicas, mapa de estaciones y datos verificados.</p></div>
      <div class="itv-footer-col"><h4>Herramientas</h4><a href="/cuando-me-toca-itv">Calculadora de fecha</a><a href="/calculadora-precio-itv">Comparador de precios</a><a href="/estaciones-itv">Buscador de estaciones</a><a href="/checklist-itv">Checklist pre-ITV</a></div>
      <div class="itv-footer-col"><h4>Gu&iacute;as</h4><a href="/guia-completa-itv">Gu&iacute;a completa ITV</a><a href="/guias">Todas las gu&iacute;as</a><a href="/blog/">Blog</a><a href="/mecanica">Mec&aacute;nica DIY</a><a href="/guia-luces">Luces</a><a href="/guia-neumaticos">Neum&aacute;ticos</a></div>
      <div class="itv-footer-col"><h4>Novedades 2026</h4><a href="/baliza-v16-obligatoria">Baliza V-16 obligatoria</a><a href="/itv-camper-furgonetas">ITV para campers</a><a href="/preparar-coche-viaje-largo">Viaje largo</a><a href="/mantenimiento-coches-electricos">Mantenimiento el&eacute;ctricos</a></div>
      <div class="itv-footer-col"><h4>Por CCAA</h4><a href="/itv-por-comunidad">Todas las comunidades</a><a href="/itv-madrid">ITV Madrid</a><a href="/itv-cataluna">ITV Catalu&ntilde;a</a><a href="/itv-andalucia">ITV Andaluc&iacute;a</a><a href="/itv-valencia">ITV Valencia</a></div>
      <div class="itv-footer-col"><h4>Legal</h4><a href="/sobre-nosotros">Sobre nosotros</a><a href="/contacto">Contacto</a><a href="/aviso-legal">Aviso legal</a><a href="/politica-cookies">Pol&iacute;tica de Cookies</a><a href="/politica-privacidad">Pol&iacute;tica de Privacidad</a><a href="/politica-afiliados">Afiliados</a></div>
    </div>
    <div class="itv-footer-bottom"><span>&copy; 2026 ITVCHECK.ES</span><span>MANUAL DE INSPECCI&Oacute;N &middot; {{FOOTER_META}}</span></div>
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

# ============================================================
# GENERACION
# ============================================================
$ordenCCAA = @('itv-andalucia','itv-aragon','itv-asturias','itv-baleares','itv-canarias','itv-cantabria','itv-castillalamancha','itv-castillayleon','itv-cataluna','itv-ceuta','itv-extremadura','itv-galicia','itv-larioja','itv-melilla','itv-murcia','itv-navarra','itv-paisvasco','itv-valencia')
$ccaa01 = 1

foreach ($slug in $ordenCCAA) {
    if (-not $manual.ContainsKey($slug)) { Write-Host "Sin datos manuales: $slug" -ForegroundColor Red; continue }
    $m = $manual[$slug]
    $e = $extra.$slug

    $numEst = [int]$e.num_estaciones
    $ccaaNum = "{0:D2}" -f $ccaa01

    # KPI aside (3 datos)
    $kpi1N = "$numEst"; $kpi1L = "Estaciones en<br>$($m.nombre)"

    # KPIs genericamente generados
    $kpi1N = "$numEst"; $kpi1L = "Estaciones de ITV<br>en $($m.nombre)"
    $kpi2N = "$($e.operadores.Count)"; $kpi2L = "Operadores<br>detectados"
    $kpi3N = "2026"; $kpi3L = "Datos<br>actualizados"

    # BAR (4 KPIs - genericos, se pueden refinar despues)
    $bar1N = "$numEst"; $bar1U = ""; $bar1L = "Estaciones autorizadas<br>en la comunidad"
    $bar2N = "$($e.operadores.Count)"; $bar2U = ""; $bar2L = "Operadores activos<br>en la regi&oacute;n"
    $bar3N = "2"; $bar3U = "a&ntilde;os"; $bar3L = "Periodicidad ITV<br>entre 4 y 10 a&ntilde;os"
    $bar4N = "200"; $bar4U = "&euro;"; $bar4L = "Multa por ITV<br>caducada"

    # Precios rows
    $preciosRows = "<tr><td>Turismo gasolina</td><td>Consultar estaci&oacute;n</td></tr><tr><td>Turismo di&eacute;sel</td><td>Consultar estaci&oacute;n</td></tr><tr><td>Motocicleta</td><td>Consultar estaci&oacute;n</td></tr>"
    if ($e.precios_raw.Count -gt 0) {
        $preciosRows = ""
        $unicos = $e.precios_raw | Select-Object -Unique | Select-Object -First 5
        foreach ($p in $unicos) {
            $preciosRows += "<tr><td>Tarifa detectada</td><td>$p</td></tr>"
        }
    }

    # Operadores lista
    $operadoresList = ""
    foreach ($op in $e.operadores) {
        $operadoresList += "<li><strong>$op</strong></li>"
    }
    if ($operadoresList -eq "") { $operadoresList = "<li>Consultar operadores autorizados</li>" }

    # FAQ
    $faqHtml = "<h3>&iquest;Cu&aacute;ntas estaciones de ITV hay en $($m.nombre)?</h3><p>Actualmente hay <strong>$numEst estaciones</strong> autorizadas en la comunidad.</p>"
    $faqHtml += "<h3>&iquest;Puedo pasar la ITV en $($m.nombre) si mi coche est&aacute; matriculado en otra comunidad?</h3><p>S&iacute;. No hay limitaci&oacute;n territorial: puedes pasar la ITV en cualquier estaci&oacute;n autorizada de Espa&ntilde;a.</p>"
    if ($m.faq_extra_q) {
        $faqHtml += "<h3>$($m.faq_extra_q)</h3><p>$($m.faq_extra_a)</p>"
    }

    # FAQ JSON (schema)
    $faqJson = '{"@type":"Question","name":"\u00bfCu\u00e1ntas estaciones de ITV hay en ' + $m.nombre.Replace('&aacute;','a').Replace('&eacute;','e').Replace('&iacute;','i').Replace('&oacute;','o').Replace('&uacute;','u').Replace('&ntilde;','n') + '?","acceptedAnswer":{"@type":"Answer","text":"Actualmente hay ' + $numEst + ' estaciones autorizadas."}}'
    $faqJson += ',{"@type":"Question","name":"\u00bfPuedo pasar la ITV en otra comunidad?","acceptedAnswer":{"@type":"Answer","text":"S\u00ed, no hay limitaci\u00f3n territorial."}}'

    # Estaciones list
    $estList = ""
    foreach ($st in $e.estaciones) {
        $url = $st.url -replace '^estaciones/', '/estaciones/'
        $estList += "<li><a href=`"$url`">$($st.nombre)</a></li>`n"
    }
    if ($estList -eq "") { $estList = "<li>Consultar mapa de estaciones</li>" }

    # Otras CCAA
    $otras = ""
    foreach ($otro in $ordenCCAA) {
        if ($otro -ne $slug) {
            $nombreOtro = $manual[$otro].nombre
            $otras += "<a href=`"/$otro`">ITV $nombreOtro</a>`n"
        }
    }

    # Resumen
    $resumen = "En $($m.nombre) hay <strong>$numEst estaciones</strong> de ITV. "
    $resumen += $m.intro
    $resumen += " Puedes pasar la ITV en cualquier estaci&oacute;n autorizada, tambi&eacute;n si tu coche est&aacute; matriculado en otra comunidad."

    # Meta desc y title
    $metaDesc = "ITV en $nombrePlano 2026: precios, estaciones, operadores y consejos para ahorrar. GuÃ­a actualizada."
    $nombrePlano = $m.nombre; $nombrePlano = $nombrePlano.Replace('&aacute;','Ã¡').Replace('&eacute;','Ã©').Replace('&iacute;','Ã­').Replace('&oacute;','Ã³').Replace('&uacute;','Ãº').Replace('&ntilde;','Ã±'); $title = "ITV $nombrePlano 2026: Precios, Estaciones y Consejos | ITVcheck"

    # Reemplazos
    $html = $template
    $html = $html.Replace('{{SLUG}}', $slug)
    $html = $html.Replace('{{NOMBRE}}', $m.nombre)
    $nombreUrl = $m.nombre; $nombreUrl = $nombreUrl.Replace('&aacute;','a').Replace('&eacute;','e').Replace('&iacute;','i').Replace('&oacute;','o').Replace('&uacute;','u').Replace('&ntilde;','n'); $html = $html.Replace('{{NOMBRE_URL}}', $nombreUrl)
    $html = $html.Replace('{{EM}}', $m.em)
    $html = $html.Replace('{{META_DESC}}', $metaDesc)
    $html = $html.Replace('{{TITLE}}', $title)
    $html = $html.Replace('{{INTRO}}', $m.intro)
    $html = $html.Replace('{{PECULIARIDAD}}', $m.peculiaridad)
    $html = $html.Replace('{{KPI1_N}}', $kpi1N).Replace('{{KPI1_L}}', $kpi1L)
    $html = $html.Replace('{{KPI2_N}}', $kpi2N).Replace('{{KPI2_L}}', $kpi2L)
    $html = $html.Replace('{{KPI3_N}}', $kpi3N).Replace('{{KPI3_L}}', $kpi3L)
    $html = $html.Replace('{{BAR1_N}}', $bar1N).Replace('{{BAR1_U}}', $bar1U).Replace('{{BAR1_L}}', $bar1L)
    $html = $html.Replace('{{BAR2_N}}', $bar2N).Replace('{{BAR2_U}}', $bar2U).Replace('{{BAR2_L}}', $bar2L)
    $html = $html.Replace('{{BAR3_N}}', $bar3N).Replace('{{BAR3_U}}', $bar3U).Replace('{{BAR3_L}}', $bar3L)
    $html = $html.Replace('{{BAR4_N}}', $bar4N).Replace('{{BAR4_U}}', $bar4U).Replace('{{BAR4_L}}', $bar4L)
    $html = $html.Replace('{{PRECIOS_ROWS}}', $preciosRows)
    $html = $html.Replace('{{OPERADORES_LIST}}', $operadoresList)
    $html = $html.Replace('{{FAQ_HTML}}', $faqHtml)
    $html = $html.Replace('{{FAQ_JSON}}', $faqJson)
    $html = $html.Replace('{{RESUMEN}}', $resumen)
    $html = $html.Replace('{{NUM_EST}}', $numEst)
    $html = $html.Replace('{{ESTACIONES_LIST}}', $estList)
    $html = $html.Replace('{{OTRAS_CCAA}}', $otras)
    $nombreUpper = $m.nombre; $nombreUpper = $nombreUpper.Replace('&aacute;','A').Replace('&eacute;','E').Replace('&iacute;','I').Replace('&oacute;','O').Replace('&uacute;','U').Replace('&ntilde;','N') | ForEach-Object { $_.ToUpper() }; $html = $html.Replace('{{TOPBAR_RIGHT}}', "CCAA $ccaaNum &middot; $nombreUpper")
    $html = $html.Replace('{{ISSUE_RIGHT}}', "CCAA $ccaaNum &middot; <strong>$($m.nombre)</strong>")
    $html = $html.Replace('{{FOOTER_META}}', "CCAA $ccaaNum")

    $outFile = "$outDir\$slug.html"
    [System.IO.File]::WriteAllText($outFile, $html, [System.Text.UTF8Encoding]::new($false))
    Write-Host "OK: $slug.html ($numEst estaciones)" -ForegroundColor Green
    $ccaa01++
}

Write-Host ""
Write-Host "18 archivos generados en: $outDir" -ForegroundColor Cyan
Write-Host "Abre 3 al azar en el navegador para verificar." -ForegroundColor Yellow