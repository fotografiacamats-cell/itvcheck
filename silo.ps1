# ═══════════════════════════════════════════════════════════════
# SILO INTERNAL LINKING — Añade bloques contextuales
# ═══════════════════════════════════════════════════════════════

# Mapa de relacionados por archivo
$silo = @{
  # ── REGIONALES → Hub + vecinas + guías clave ──
  "itv-andalucia.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-extremadura|ITV Extremadura","itv-murcia|ITV Murcia","itv-canarias|ITV Canarias")
  "itv-aragon.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-navarra|ITV Navarra","itv-larioja|ITV La Rioja","itv-castillayleon|ITV Castilla y León")
  "itv-asturias.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-cantabria|ITV Cantabria","itv-galicia|ITV Galicia","itv-paisvasco|ITV País Vasco")
  "itv-baleares.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-valencia|ITV Comunidad Valenciana","itv-cataluna|ITV Cataluña","itv-murcia|ITV Murcia")
  "itv-canarias.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-andalucia|ITV Andalucía","itv-melilla|ITV Melilla","itv-baleares|ITV Baleares")
  "itv-cantabria.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-asturias|ITV Asturias","itv-paisvasco|ITV País Vasco","itv-castillayleon|ITV Castilla y León")
  "itv-castillayleon.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-castillalamancha|ITV Castilla-La Mancha","itv-galicia|ITV Galicia","itv-madrid|ITV Madrid")
  "itv-castillalamancha.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-madrid|ITV Madrid","itv-castillayleon|ITV Castilla y León","itv-extremadura|ITV Extremadura")
  "itv-cataluna.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-aragon|ITV Aragón","itv-valencia|ITV Comunidad Valenciana","itv-baleares|ITV Baleares")
  "itv-ceuta.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-melilla|ITV Melilla","itv-andalucia|ITV Andalucía","itv-canarias|ITV Canarias")
  "itv-extremadura.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-andalucia|ITV Andalucía","itv-castillalamancha|ITV Castilla-La Mancha","itv-castillayleon|ITV Castilla y León")
  "itv-galicia.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-asturias|ITV Asturias","itv-cantabria|ITV Cantabria","itv-castillayleon|ITV Castilla y León")
  "itv-larioja.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-navarra|ITV Navarra","itv-paisvasco|ITV País Vasco","itv-aragon|ITV Aragón")
  "itv-madrid.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-castillalamancha|ITV Castilla-La Mancha","itv-castillayleon|ITV Castilla y León","itv-valencia|ITV Comunidad Valenciana")
  "itv-melilla.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-ceuta|ITV Ceuta","itv-andalucia|ITV Andalucía","itv-murcia|ITV Murcia")
  "itv-murcia.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-valencia|ITV Comunidad Valenciana","itv-andalucia|ITV Andalucía","itv-castillalamancha|ITV Castilla-La Mancha")
  "itv-navarra.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-paisvasco|ITV País Vasco","itv-larioja|ITV La Rioja","itv-aragon|ITV Aragón")
  "itv-paisvasco.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-navarra|ITV Navarra","itv-cantabria|ITV Cantabria","itv-larioja|ITV La Rioja")
  "itv-valencia.html" = @("itv-por-comunidad|📍 Todas las CCAA","itv-murcia|ITV Murcia","itv-cataluna|ITV Cataluña","itv-baleares|ITV Baleares")

  # ── GUÍAS DE MECÁNICA → Hub mecánica + pilar + relacionadas ──
  "guia-luces.html" = @("guias|📚 Todas las guías","guia-bombilla|💡 Cambiar la bombilla","limpiar-faros-coche|🚗 Limpiar faros","checklist-itv|✅ Checklist pre-ITV")
  "guia-bombilla.html" = @("guias|📚 Todas las guías","guia-luces|💡 Revisión de luces","limpiar-faros-coche|🚗 Limpiar faros","guia-bateria|🔋 Cambiar batería")
  "guia-bateria.html" = @("guias|📚 Todas las guías","guia-bombilla|💡 Cambiar bombilla","guia-luces|💡 Revisión de luces","checklist-itv|✅ Checklist pre-ITV")
  "guia-neumaticos.html" = @("guias|📚 Todas las guías","guia-frenos|🛑 Revisión de frenos","checklist-itv|✅ Checklist pre-ITV","preparar-coche-viaje-largo|🛣️ Viaje largo")
  "guia-frenos.html" = @("guias|📚 Todas las guías","guia-neumaticos|🛞 Neumáticos","guia-gases|💨 Prueba de gases","checklist-itv|✅ Checklist pre-ITV")
  "guia-gases.html" = @("guias|📚 Todas las guías","guia-frenos|🛑 Revisión de frenos","guia-luces|💡 Revisión de luces","checklist-itv|✅ Checklist pre-ITV")
  "guia-documentacion.html" = @("guias|📚 Todas las guías","checklist-itv|✅ Checklist pre-ITV","que-pasa-si-suspendo-la-itv|📉 Si suspendes","cuando-me-toca-itv|📅 Calculadora")
  "guia-motos.html" = @("guias|📚 Todas las guías","guia-luces|💡 Revisión de luces","guia-frenos|🛑 Revisión de frenos","guia-documentacion|📄 Documentación")

  # ── GUÍAS INFORMATIVAS → Herramientas relacionadas ──
  "que-pasa-si-suspendo-la-itv.html" = @("guias|📚 Todas las guías","checklist-itv|✅ Checklist pre-ITV","calculadora-precio-itv|💶 Precios por CCAA","cuando-me-toca-itv|📅 Calculadora")
  "como-dar-de-baja-un-coche.html" = @("guias|📚 Todas las guías","seguros-coche|🛡️ Seguros de coche","que-pasa-si-suspendo-la-itv|📉 Si suspendes","guia-documentacion|📄 Documentación")
  "seguros-coche.html" = @("guias|📚 Todas las guías","como-dar-de-baja-un-coche|🗑️ Dar de baja","que-pasa-si-suspendo-la-itv|📉 Si suspendes","guia-documentacion|📄 Documentación")

  # ── GUÍAS 2026 → Otras guías de actualidad ──
  "baliza-v16-obligatoria.html" = @("guias|📚 Todas las guías","preparar-coche-viaje-largo|🛣️ Viaje largo","mejores-gadgets-coche|🔌 Gadgets coche","checklist-itv|✅ Checklist pre-ITV")
  "itv-camper-furgonetas.html" = @("guias|📚 Todas las guías","baliza-v16-obligatoria|🚨 Baliza V-16","preparar-coche-viaje-largo|🛣️ Viaje largo","calculadora-precio-itv|💶 Precios por CCAA")
  "mejores-gadgets-coche.html" = @("guias|📚 Todas las guías","preparar-coche-viaje-largo|🛣️ Viaje largo","baliza-v16-obligatoria|🚨 Baliza V-16","mantenimiento-coches-electricos|⚡ Eléctricos")
  "preparar-coche-viaje-largo.html" = @("guias|📚 Todas las guías","baliza-v16-obligatoria|🚨 Baliza V-16","guia-neumaticos|🛞 Neumáticos","checklist-itv|✅ Checklist pre-ITV")
  "mantenimiento-coches-electricos.html" = @("guias|📚 Todas las guías","mejores-gadgets-coche|🔌 Gadgets","baliza-v16-obligatoria|🚨 Baliza V-16","preparar-coche-viaje-largo|🛣️ Viaje largo")
  "limpiar-faros-coche.html" = @("guias|📚 Todas las guías","guia-luces|💡 Revisión de luces","guia-bombilla|🔧 Cambiar bombilla","mejores-gadgets-coche|🔌 Gadgets")

  # ── HERRAMIENTAS → Otras herramientas + guías clave ──
  "cuando-me-toca-itv.html" = @("checklist-itv|✅ Checklist pre-ITV","calculadora-precio-itv|💶 Precios por CCAA","estaciones-itv|📍 Estaciones","guia-completa-itv|📚 Guía completa")
  "calculadora-precio-itv.html" = @("cuando-me-toca-itv|📅 Calculadora de fecha","estaciones-itv|📍 Estaciones","guia-completa-itv|📚 Guía completa","checklist-itv|✅ Checklist pre-ITV")
  "estaciones-itv.html" = @("cuando-me-toca-itv|📅 Calculadora de fecha","calculadora-precio-itv|💶 Precios por CCAA","itv-por-comunidad|📍 Todas las CCAA","checklist-itv|✅ Checklist pre-ITV")
  "checklist-itv.html" = @("cuando-me-toca-itv|📅 Calculadora de fecha","guia-luces|💡 Luces","guia-neumaticos|🛞 Neumáticos","guia-frenos|🛑 Frenos")
  "guia-completa-itv.html" = @("cuando-me-toca-itv|📅 Calculadora","calculadora-precio-itv|💶 Precios","checklist-itv|✅ Checklist","itv-por-comunidad|📍 Todas las CCAA")
}

# Construye el bloque HTML
function Build-SiloBlock($links) {
  $html = "`n<div class=`"related-guides`">`n<h3>📚 Enlazado interno recomendado</h3>`n"
  foreach ($l in $links) {
    $parts = $l -split '\|'
    $html += "<a href=`"$($parts[0])`">$($parts[1])</a>`n"
  }
  $html += "</div>`n"
  return $html
}

# Procesa cada archivo
$processed = 0
foreach ($file in $silo.Keys) {
  if (-not (Test-Path $file)) {
    Write-Host "❌ No encontrado: $file" -ForegroundColor Red
    continue
  }
  
  $c = Get-Content $file -Raw -Encoding UTF8
  
  # Solo si no tiene ya el bloque
  if ($c -match 'Enlazado interno recomendado') {
    Write-Host "⏭️  Ya tiene bloque: $file" -ForegroundColor Yellow
    continue
  }
  
  $block = Build-SiloBlock $silo[$file]
  
  # Inserta antes del footer
  if ($c -match '<footer') {
    $c = $c -replace '(<footer)', "$block`$1"
    Set-Content $file -Value $c -Encoding UTF8 -NoNewline
    Write-Host "✅ Añadido: $file" -ForegroundColor Green
    $processed++
  } else {
    Write-Host "⚠️  Sin footer: $file" -ForegroundColor Yellow
  }
}

Write-Host "`n🎉 Proceso completado. $processed archivos modificados." -ForegroundColor Cyan