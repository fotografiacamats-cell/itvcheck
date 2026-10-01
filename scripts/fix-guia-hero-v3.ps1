$f = "C:\Users\Usuario\Desktop\ITVcheck\guia-completa-itv.html"

$c = [System.IO.File]::ReadAllText($f, [System.Text.UTF8Encoding]::new($false))

$patron = '(?s)<div class="breadcrumbs">.*?</div>\s*<h1>.*?</h1>\s*<div class="meta-date">.*?</div>'

if (-not ($c -match $patron)) {
    Write-Host "ERROR: patrón no matchea" -ForegroundColor Red
    return
}

Write-Host "Match encontrado. Longitud: $($matches[0].Length) chars" -ForegroundColor Green

$heroV2 = @'
<div class="mag-issue-bar">
  <span>ITVcheck &middot; Manual de inspecci&oacute;n t&eacute;cnica</span>
  <span>GU&Iacute;A 01 &middot; <strong>Edici&oacute;n 2026</strong></span>
</div>

<section class="mag-hero">
  <div class="mag-hero-text">
    <span class="kicker">Actualizado Septiembre 2026 &middot; 18 min de lectura</span>
    <h1>Gu&iacute;a completa<br><em>de la ITV 2026.</em></h1>
    <p class="lead">Periodicidad seg&uacute;n tu veh&iacute;culo, precios por comunidad, documentaci&oacute;n obligatoria, proceso de inspecci&oacute;n, novedades normativas y sanciones. Todo lo que necesitas saber sobre la ITV en Espa&ntilde;a.</p>
    <div class="mag-hero-ctas">
      <a href="#periodicidad" class="btn-hero">Ver periodicidad &rarr;</a>
      <a href="cuando-me-toca-itv" class="btn-hero-secondary">Calcular mi fecha &rarr;</a>
    </div>
  </div>
  <aside class="mag-hero-aside">
    <span class="label">Cobertura de la gu&iacute;a</span>
    <div class="stat-row">
      <span class="n">17</span>
      <span class="l">Comunidades<br>+ Ceuta y Melilla</span>
    </div>
    <div class="stat-row">
      <span class="n">10</span>
      <span class="l">Tipos de veh&iacute;culo<br>cubiertos</span>
    </div>
    <div class="stat-row">
      <span class="n">6</span>
      <span class="l">Novedades<br>normativas 2026</span>
    </div>
  </aside>
</section>

<div class="mag-data-bar">
  <div>
    <span class="n">17<small>&euro;</small></span>
    <span class="l">La ITV m&aacute;s barata<br>de Espa&ntilde;a (Baleares)</span>
  </div>
  <div>
    <span class="n">52<small>&euro;</small></span>
    <span class="l">La m&aacute;s cara<br>(Pa&iacute;s Vasco)</span>
  </div>
  <div>
    <span class="n">25<small>&euro;</small></span>
    <span class="l">Diferencia entre<br>comunidades</span>
  </div>
  <div>
    <span class="n">200<small>&euro;</small></span>
    <span class="l">Multa por circular<br>con ITV caducada</span>
  </div>
</div>
'@

$c = $c -replace $patron, $heroV2

[System.IO.File]::WriteAllText($f, $c, [System.Text.UTF8Encoding]::new($false))

Write-Host ""
Write-Host "=== VERIFICACION ===" -ForegroundColor Green
Write-Host "Hero editorial:    $($c.Contains('mag-hero-text'))"
Write-Host "Data-bar:          $($c.Contains('mag-data-bar'))"
Write-Host "Sin breadcrumbs:   $(-not $c.Contains('class=""breadcrumbs""'))"
Write-Host "Sin meta-date:     $(-not $c.Contains('class=""meta-date""'))"
Write-Host "Tamaño final:      $((Get-Item $f).Length) bytes"