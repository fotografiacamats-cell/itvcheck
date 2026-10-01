# ============================================================
# FIX 1 · HTML: renombrar id="mapa" → id="ccaa-operadores"
# ============================================================
$fHtml = "C:\Users\Usuario\Desktop\ITVcheck\operadores-itv-espana.html"
$c = [System.IO.File]::ReadAllText($fHtml, [System.Text.UTF8Encoding]::new($false))

# Renombrar el H2 colisionado
$c = $c.Replace('<h2 id="mapa">', '<h2 id="ccaa-operadores">')

# Arreglar también el CTA del hero que apunta a #mapa
$c = $c.Replace('href="#mapa"', 'href="#ccaa-operadores"')

[System.IO.File]::WriteAllText($fHtml, $c, [System.Text.UTF8Encoding]::new($false))
Write-Host "OK HTML: id='mapa' renombrado a 'ccaa-operadores'" -ForegroundColor Green

# ============================================================
# FIX 2 · CSS: quitar width fijo y centrado de la última columna
# ============================================================
$fCss = "C:\Users\Usuario\Desktop\ITVcheck\styles-editorial.css"
$css = [System.IO.File]::ReadAllText($fCss, [System.Text.UTF8Encoding]::new($false))

$viejo = @'
.defect-table td:last-child {
  text-align: center;
  width: 130px;
}
'@

$nuevo = @'
/* Sin width fijo: la última columna fluye. Solo se centra si es un badge. */
.defect-table td:last-child {
  text-align: left;
}
.defect-table td:last-child .badge {
  display: inline-block;
  margin: 0 auto;
}
'@

if ($css.Contains($viejo)) {
    $css = $css.Replace($viejo, $nuevo)
    [System.IO.File]::WriteAllText($fCss, $css, [System.Text.UTF8Encoding]::new($false))
    Write-Host "OK CSS: .defect-table td:last-child corregido" -ForegroundColor Green
} else {
    Write-Host "AVISO CSS: no encontré el bloque exacto. Pégame el trozo actual de .defect-table td:last-child" -ForegroundColor Yellow
}

# ============================================================
# Verificación
# ============================================================
Write-Host ""
Write-Host "--- Verificación ---" -ForegroundColor Cyan
$c2 = [System.IO.File]::ReadAllText($fHtml, [System.Text.UTF8Encoding]::new($false))
Write-Host "id='mapa' residual:        $($c2.Contains('id=""mapa""'))"
Write-Host "id='ccaa-operadores':      $($c2.Contains('id=""ccaa-operadores""'))"

$css2 = [System.IO.File]::ReadAllText($fCss, [System.Text.UTF8Encoding]::new($false))
Write-Host "width 130px residual:      $($css2.Contains('width: 130px'))"