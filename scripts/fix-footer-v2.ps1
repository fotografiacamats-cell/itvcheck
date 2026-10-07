$base = "C:\Users\Usuario\Desktop\ITVcheck"
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$bk = Join-Path $base "temp\backups\$ts"
New-Item -ItemType Directory -Path $bk -Force | Out-Null

# Bloque HERRAMIENTAS actual
$herrViejo = @'
<div class="itv-footer-col">
        <h4>Herramientas</h4>
        <a href="/cuando-me-toca-itv">Calculadora de fecha</a>
        <a href="/calculadora-precio-itv">Comparador de precios</a>
        <a href="/estaciones-itv">Buscador de estaciones</a>
        <a href="/checklist-itv">Checklist pre-ITV</a>
      </div>
'@

$herrNuevo = @'
<div class="itv-footer-col">
        <h4>Herramientas</h4>
        <a href="/cuando-me-toca-itv">Calculadora de fecha</a>
        <a href="/calculadora-precio-itv">Comparador de precios</a>
        <a href="/estaciones-itv">Buscador de estaciones</a>
        <a href="/checklist-itv">Checklist pre-ITV</a>
        <a href="/operadores-itv-espana">Operadores ITV</a>
      </div>
'@

# Bloque GUÍAS actual
$guiasViejo = @'
<div class="itv-footer-col">
        <h4>Gu&iacute;as</h4>
        <a href="/guia-completa-itv">Gu&iacute;a completa ITV</a>
        <a href="/guias">Todas las gu&iacute;as</a>
        <a href="/blog/">Blog</a>
        <a href="/mecanica">Mec&aacute;nica DIY</a>
        <a href="/guia-luces">Luces</a>
        <a href="/guia-neumaticos">Neum&aacute;ticos</a>
      </div>
'@

$guiasNuevo = @'
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
'@

# Bloque LEGAL actual
$legalViejo = @'
<div class="itv-footer-col">
        <h4>Legal</h4>
        <a href="/sobre-nosotros">Sobre nosotros</a>
        <a href="/contacto">Contacto</a>
        <a href="/aviso-legal">Aviso legal</a>
        <a href="/politica-cookies">Pol&iacute;tica de Cookies</a>
        <a href="/politica-privacidad">Pol&iacute;tica de Privacidad</a>
        <a href="/politica-afiliados">Afiliados</a>
      </div>
'@

$legalNuevo = @'
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
'@

$modificados = 0
$sinCambio = 0
$errores = @()

# Recorrer todas las páginas HTML del sitio
Get-ChildItem -Path $base -Recurse -Filter *.html | Where-Object {
  $_.FullName -notmatch '\\temp\\' -and
  $_.FullName -notmatch '\\scripts\\' -and
  $_.FullName -notmatch '\\estaciones\\'  # estaciones tienen su propio footer (schema AutomotiveBusiness)
} | ForEach-Object {
  $f = $_.FullName
  $contenido = [System.IO.File]::ReadAllText($f, [System.Text.UTF8Encoding]::new($false))

  # Solo procesar páginas v2
  if ($contenido -notmatch 'styles-v2\.css') { return }

  $original = $contenido
  $contenido = $contenido.Replace($herrViejo, $herrNuevo)
  $contenido = $contenido.Replace($guiasViejo, $guiasNuevo)
  $contenido = $contenido.Replace($legalViejo, $legalNuevo)

  if ($contenido -ne $original) {
    # Backup
    $rel = $f.Substring($base.Length + 1)
    $bkFile = Join-Path $bk $rel
    New-Item -ItemType Directory -Path (Split-Path $bkFile) -Force | Out-Null
    Copy-Item $f $bkFile -Force

    [System.IO.File]::WriteAllText($f, $contenido, [System.Text.UTF8Encoding]::new($false))
    $script:modificados++
    Write-Host "OK  $rel" -ForegroundColor Green
  } else {
    $script:sinCambio++
  }
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Paginas modificadas: $modificados" -ForegroundColor Green
Write-Host "Paginas sin cambios: $sinCambio" -ForegroundColor Yellow
Write-Host "Backup: $bk" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

# Verificacion cruzada en 3 muestras
Write-Host ""
Write-Host "Verificacion en muestras:" -ForegroundColor Cyan
$muestras = @("baliza-v16-obligatoria.html", "seguros-coche.html", "aviso-legal.html", "guia-completa-itv.html")
foreach ($m in $muestras) {
  $f = Join-Path $base $m
  if (Test-Path $f) {
    $op = (Select-String -Path $f -Pattern 'Operadores ITV').Count
    $au = (Select-String -Path $f -Pattern 'Daniel Vega \(autor\)').Count
    $fr = (Select-String -Path $f -Pattern '>Frenos<').Count
    Write-Host "  $m  |  Operadores: $op  |  Autor: $au  |  Frenos: $fr"
  }
}