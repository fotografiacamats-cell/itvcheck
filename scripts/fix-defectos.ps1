$f = "C:\Users\Usuario\Desktop\ITVcheck\tipos-defectos-itv.html"

if (-not (Test-Path $f)) {
    Write-Host "ERROR: no existe $f" -ForegroundColor Red
    return
}

Copy-Item $f "$f.bak-v2" -Force

$c = [System.IO.File]::ReadAllText($f, [System.Text.UTF8Encoding]::new($false))

# 1. Quitar el <style>...</style> embebido
$c = [regex]::Replace($c, '(?s)<style>\s*\.badge\s*\{.*?</style>', '')

# 2. Quitar link a styles.css (dejar solo styles-v2 y editorial)
$c = $c.Replace('<link rel="stylesheet" href="/styles.css">', '')

# 3. Añadir styles-editorial.css si no está
if (-not $c.Contains('styles-editorial.css')) {
    $c = $c.Replace('<link rel="stylesheet" href="/styles-v2.css">', '<link rel="stylesheet" href="/styles-v2.css">' + "`n" + '<link rel="stylesheet" href="/styles-editorial.css">')
}

# 4. Sustituir el header viejo por v2 (mantener logo/nav)
$headerV2 = @'
<div class="itv-topbar"><div class="itv-topbar-inner"><span><span class="dot"></span>ITVCHECK &middot; EDICI&Oacute;N 2026</span><span>GU&Iacute;A DE REFERENCIA &middot; 200+ DEFECTOS</span></div></div>

<header class="itv-header">
  <div class="itv-header-inner">
    <a href="/index" class="itv-logo">
      <span class="itv-logo-mark">ITV</span>
      ITVcheck
    </a>
    <nav class="itv-nav">
      <a href="/guias">Gu&iacute;as</a>
      <a href="/estaciones-itv">Estaciones</a>
      <a href="/operadores-itv-espana">Operadores</a>
      <a href="/calculadora-precio-itv">Precios</a>
      <a href="/checklist-itv">Checklist</a>
    </nav>
  </div>
</header>
'@

$c = [regex]::Replace($c, '(?s)<div class="itv-topbar">.*?</header>', $headerV2, 1)

# 5. Sustituir el h1 + meta-date por hero editorial
$hero = @'
<div class="mag-issue-bar">
  <span>ITVcheck &middot; Manual de inspecci&oacute;n t&eacute;cnica</span>
  <span>GU&Iacute;A 03 &middot; <strong>Edici&oacute;n 2026</strong></span>
</div>

<section class="mag-hero">
  <div class="mag-hero-text">
    <span class="kicker">Actualizado Octubre 2026 &middot; 14 min de lectura</span>
    <h1>Defectos en la ITV:<br><em>gu&iacute;a completa 2026.</em></h1>
    <p class="lead">Los 200+ defectos que puede marcar el inspector, organizados en las 11 categor&iacute;as oficiales. Gravedad, c&oacute;mo revisarlos, cu&aacute;nto cuestan y c&oacute;mo reclamar. Basado en el Real Decreto 920/2017.</p>
    <div class="mag-hero-ctas">
      <a href="#niveles" class="btn-hero">Ver los 3 niveles &rarr;</a>
      <a href="#categorias" class="btn-hero-secondary">Ir a los 200+ defectos &rarr;</a>
    </div>
  </div>
  <aside class="mag-hero-aside">
    <span class="label">Datos clave</span>
    <div class="stat-row">
      <span class="n">200+</span>
      <span class="l">Defectos<br>catalogados</span>
    </div>
    <div class="stat-row">
      <span class="n">11</span>
      <span class="l">Categor&iacute;as<br>oficiales</span>
    </div>
    <div class="stat-row">
      <span class="n">2</span>
      <span class="l">Meses<br>para subsanar</span>
    </div>
  </aside>
</section>
'@

$c = [regex]::Replace($c, '(?s)<h1>Defectos en la ITV.*?14 min de lectura</div>', $hero, 1)

# 6. Sustituir el bloque de stat-box por barra de datos
$dataBar = @'
<div class="mag-data-bar">
  <div>
    <span class="n">+80<small>%</small></span>
    <span class="l">Rechazos concentrados<br>en 4 &aacute;reas</span>
  </div>
  <div>
    <span class="n">~30<small>%</small></span>
    <span class="l">Fallos<br>de alumbrado</span>
  </div>
  <div>
    <span class="n">2<small>meses</small></span>
    <span class="l">Plazo tras<br>desfavorable</span>
  </div>
  <div>
    <span class="n">200<small>&euro;</small></span>
    <span class="l">Multa por<br>ITV caducada</span>
  </div>
</div>
'@

$c = [regex]::Replace($c, '(?s)<div class="stat-box">\s*<strong>\+80%</strong>.*?</div>\s*<div class="stat-box">\s*<strong>200 &euro;</strong>\s*multa por ITV caducada\s*</div>', $dataBar, 1)

# 7. Sustituir el índice de contenidos por índice editorial
$toc = @'
<h2>&Iacute;ndice de contenidos</h2>
<ul class="mag-toc">
<li><a href="#niveles">Los 3 niveles de defecto y sus consecuencias</a></li>
<li><a href="#codigos">Tabla de c&oacute;digos oficiales por categor&iacute;a</a></li>
<li><a href="#categorias">Los 200+ defectos por categor&iacute;a oficial</a></li>
<li><a href="#frecuentes">Los defectos m&aacute;s frecuentes en Espa&ntilde;a</a></li>
<li><a href="#costes">Cu&aacute;nto cuesta reparar cada defecto</a></li>
<li><a href="#subsanacion">Qu&eacute; hacer si suspendes: proceso paso a paso</a></li>
<li><a href="#reclamacion">C&oacute;mo reclamar un defecto injustificado</a></li>
<li><a href="#faq">Preguntas frecuentes</a></li>
</ul>
'@

$c = [regex]::Replace($c, '(?s)<h2>&Iacute;ndice de contenidos</h2>\s*<ul>.*?</ul>', $toc, 1)

# 8. Sustituir el footer viejo por v2
$footerV2 = @'
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
        <a href="/mecanica">Mec&aacute;nica DIY</a>
        <a href="/guia-luces">Luces</a>
        <a href="/guia-neumaticos">Neum&aacute;ticos</a>
        <a href="/seguros-coche">Seguros</a>
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
      <span>MANUAL DE INSPECCI&Oacute;N &middot; GU&Iacute;A 03 &middot; EDICI&Oacute;N 2026</span>
    </div>
  </div>
</footer>
'@

$c = [regex]::Replace($c, '(?s)<footer>.*?</footer>', $footerV2, 1)

# Guardar
[System.IO.File]::WriteAllText($f, $c, [System.Text.UTF8Encoding]::new($false))

# Verificación
Write-Host ""
Write-Host "=== RESULTADO ===" -ForegroundColor Green
Write-Host "Sin styles.css:          $(-not $c.Contains('href=""/styles.css""'))"
Write-Host "Con styles-v2.css:       $($c.Contains('styles-v2.css'))"
Write-Host "Con styles-editorial:    $($c.Contains('styles-editorial.css'))"
Write-Host "Con hero editorial:      $($c.Contains('mag-hero-text'))"
Write-Host "Con data-bar:            $($c.Contains('mag-data-bar'))"
Write-Host "Con footer v2:           $($c.Contains('itv-footer-top'))"
Write-Host "Sin style embebido:      $(-not $c.Contains('.badge-leve {'))"
Write-Host "Mantiene 200+ defectos:  $($c.Contains('Corrosi&oacute;n estructural'))"
Write-Host "Mantiene FAQs:           $($c.Contains('Puedo pasar la ITV con el testigo'))"
Write-Host "Tamaño:                  $((Get-Item $f).Length) bytes"