# ============================================================
# Mover .h1-inline de los <style> internos a styles-editorial.css
# y limpiar los 5 artículos de blog
# ============================================================

$base = "C:\Users\Usuario\Desktop\ITVcheck"

# --- PASO 1: Añadir variantes a styles-editorial.css ---
$cssPath = "$base\styles-editorial.css"
$css = [System.IO.File]::ReadAllText($cssPath, [System.Text.UTF8Encoding]::new($false))

$marcador = "VARIANTES DE HERO PARA BLOG"
if ($css.Contains($marcador)) {
    Write-Host "CSS: ya tiene las variantes, saltando" -ForegroundColor Yellow
} else {
    $bloque = @'


/* ============================================================
   VARIANTES DE HERO PARA BLOG Y GUÍAS
   ============================================================ */

/* Hero con aside más estrecho para artículos de blog (H1 en 1 línea) */
.mag-hero.hero-blog {
  grid-template-columns: 1fr 280px;
  gap: 40px;
}

/* H1 en 1 línea — blog, titulares medios (~50-60 caracteres) */
.mag-hero-text h1.h1-inline {
  font-size: 56px;
  line-height: 1.05;
  letter-spacing: -0.02em;
  max-width: none;
  white-space: nowrap;
}

/* H1 en 1 línea — titulares largos (~70-90 caracteres) */
.mag-hero-text h1.h1-inline-md {
  font-size: 46px;
  line-height: 1.05;
  letter-spacing: -0.02em;
  max-width: none;
  white-space: nowrap;
}

/* H1 en 1 línea — titulares extra largos (~90+ caracteres) */
.mag-hero-text h1.h1-inline-sm {
  font-size: 40px;
  line-height: 1.08;
  letter-spacing: -0.015em;
  max-width: none;
  white-space: nowrap;
}

.mag-hero-text h1.h1-inline em,
.mag-hero-text h1.h1-inline-md em,
.mag-hero-text h1.h1-inline-sm em {
  font-style: normal;
  background: linear-gradient(transparent 60%, var(--signal) 60%);
  padding: 0 4px;
}

@media (max-width: 1100px) {
  .mag-hero-text h1.h1-inline { font-size: 46px; }
  .mag-hero-text h1.h1-inline-md { font-size: 40px; }
  .mag-hero-text h1.h1-inline-sm { font-size: 36px; }
}

@media (max-width: 900px) {
  .mag-hero.hero-blog { grid-template-columns: 1fr; }
  .mag-hero-text h1.h1-inline,
  .mag-hero-text h1.h1-inline-md,
  .mag-hero-text h1.h1-inline-sm {
    font-size: 34px;
    white-space: normal;
  }
}
'@
    $css = $css + $bloque
    [System.IO.File]::WriteAllText($cssPath, $css, [System.Text.UTF8Encoding]::new($false))
    Write-Host "OK CSS: variantes anadidas a styles-editorial.css" -ForegroundColor Green
}

# --- PASO 2: Quitar <style> interno de los 5 HTML ---
$archivos = @(
    "blog\multa-no-pasar-itv.html",
    "blog\precio-itv-por-provincia-2026.html",
    "blog\itv-coche-mas-200000-km.html",
    "blog\itv-coche-parado-6-meses.html",
    "blog\itv-motos-ciclomotores.html"
)

foreach ($a in $archivos) {
    $ruta = "$base\$a"
    if (-not (Test-Path $ruta)) {
        Write-Host "NO EXISTE: $a" -ForegroundColor Red
        continue
    }

    $c = [System.IO.File]::ReadAllText($ruta, [System.Text.UTF8Encoding]::new($false))
    $original = $c

    # Quitar el bloque <style>...</style> que contiene .h1-inline
    $regex = '(?s)<style>\s*/\* Hero variante blog.*?</style>\s*'
    $c = [regex]::Replace($c, $regex, '')

    # Anadir clase hero-blog al section mag-hero
    $c = $c.Replace('<section class="mag-hero">', '<section class="mag-hero hero-blog">')

    if ($c -ne $original) {
        [System.IO.File]::WriteAllText($ruta, $c, [System.Text.UTF8Encoding]::new($false))
        Write-Host "OK HTML: $a" -ForegroundColor Green
    } else {
        Write-Host "SKIP: $a (sin cambios)" -ForegroundColor Yellow
    }
}

# --- PASO 3: Verificacion ---
Write-Host ""
Write-Host "--- Verificacion ---" -ForegroundColor Cyan

$cssCheck = [System.IO.File]::ReadAllText($cssPath, [System.Text.UTF8Encoding]::new($false))
Write-Host "CSS tiene h1-inline:       $($cssCheck.Contains('.mag-hero-text h1.h1-inline'))"
Write-Host "CSS tiene hero-blog:       $($cssCheck.Contains('.mag-hero.hero-blog'))"

Write-Host ""
foreach ($a in $archivos) {
    $ruta = "$base\$a"
    if (Test-Path $ruta) {
        $c = [System.IO.File]::ReadAllText($ruta, [System.Text.UTF8Encoding]::new($false))
        $tieneStyle = $c.Contains('<style>')
        $tieneHeroBlog = $c.Contains('class="mag-hero hero-blog"')
        Write-Host ("{0,-45} style:{1,-8} hero-blog:{2}" -f $a, $tieneStyle, $tieneHeroBlog)
    }
}