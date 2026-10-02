# ============================================================
# Anadir boton hamburguesa + JS de navegacion movil a todas
# las paginas v2 con .itv-header
# ============================================================

$base = "C:\Users\Usuario\Desktop\ITVcheck"

# --- PASO 1: Anadir CSS del boton a styles-editorial.css ---
$cssPath = "$base\styles-editorial.css"
$css = [System.IO.File]::ReadAllText($cssPath, [System.Text.UTF8Encoding]::new($false))

$marcador = "NAV MOVIL"
if ($css.Contains($marcador)) {
    Write-Host "CSS: ya tiene el bloque de nav movil, saltando" -ForegroundColor Yellow
} else {
    $bloque = @'


/* ============================================================
   NAV MOVIL · Boton hamburguesa para .itv-header
   ============================================================ */

.itv-nav-toggle {
  display: none;
  width: 44px;
  height: 44px;
  background: transparent;
  border: 1.5px solid var(--ink);
  border-radius: 4px;
  cursor: pointer;
  padding: 0;
  margin-left: auto;
  position: relative;
  transition: box-shadow 0.15s;
  flex-shrink: 0;
}

.itv-nav-toggle:hover {
  box-shadow: 3px 3px 0 var(--signal);
}

.itv-nav-toggle span {
  display: block;
  width: 20px;
  height: 2px;
  background: var(--ink);
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  transition: transform 0.2s, opacity 0.2s, top 0.2s;
}

.itv-nav-toggle span:nth-child(1) { top: 14px; }
.itv-nav-toggle span:nth-child(2) { top: 21px; }
.itv-nav-toggle span:nth-child(3) { top: 28px; }

.itv-nav-toggle.open span:nth-child(1) {
  top: 21px;
  transform: translateX(-50%) rotate(45deg);
}
.itv-nav-toggle.open span:nth-child(2) {
  opacity: 0;
}
.itv-nav-toggle.open span:nth-child(3) {
  top: 21px;
  transform: translateX(-50%) rotate(-45deg);
}

@media (max-width: 900px) {
  .itv-nav-toggle {
    display: block;
  }
  .itv-header-inner {
    position: relative;
  }
  .itv-nav {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    background: var(--paper);
    border: 1px solid var(--line);
    border-top: none;
    flex-direction: column;
    gap: 0;
    padding: 8px 0;
    margin: 0;
    z-index: 500;
    box-shadow: 0 6px 20px rgba(0,0,0,0.10);
  }
  .itv-nav.open {
    display: flex;
  }
  .itv-nav a {
    padding: 16px 24px;
    border-bottom: 1px solid var(--line);
    margin: 0;
    font-size: 14px;
  }
  .itv-nav a:last-child {
    border-bottom: none;
  }
  .itv-nav a::after {
    display: none;
  }
}
'@
    $css = $css + $bloque
    [System.IO.File]::WriteAllText($cssPath, $css, [System.Text.UTF8Encoding]::new($false))
    Write-Host "OK CSS: bloque nav movil anadido" -ForegroundColor Green
}

# --- PASO 2: Crear js/nav-mobile.js ---
$jsDir = "$base\js"
if (-not (Test-Path $jsDir)) {
    New-Item -ItemType Directory -Path $jsDir | Out-Null
    Write-Host "OK: carpeta /js/ creada" -ForegroundColor Green
}

$jsPath = "$jsDir\nav-mobile.js"
$jsContent = @'
// Toggle del menu movil para .itv-header
(function () {
  function initMobileNav() {
    var toggles = document.querySelectorAll('.itv-nav-toggle');
    toggles.forEach(function (btn) {
      if (btn.dataset.navInit === '1') return;
      btn.dataset.navInit = '1';
      btn.addEventListener('click', function () {
        var headerInner = btn.closest('.itv-header-inner');
        if (!headerInner) return;
        var nav = headerInner.querySelector('.itv-nav');
        if (!nav) return;
        var isOpen = nav.classList.toggle('open');
        btn.classList.toggle('open', isOpen);
        btn.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
      });
    });
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initMobileNav);
  } else {
    initMobileNav();
  }
})();
'@
[System.IO.File]::WriteAllText($jsPath, $jsContent, [System.Text.UTF8Encoding]::new($false))
Write-Host "OK JS: /js/nav-mobile.js creado" -ForegroundColor Green

# --- PASO 3: Anadir boton + script a cada HTML v2 ---
$archivos = @(
    "index.html",
    "operadores-itv-espana.html",
    "tipos-defectos-itv.html",
    "guia-completa-itv.html",
    "checklist-itv.html",
    "estaciones-itv.html",
    "guias.html",
    "guia-luces.html",
    "guia-neumaticos.html",
    "blog\index.html",
    "blog\multa-no-pasar-itv.html",
    "blog\precio-itv-por-provincia-2026.html",
    "blog\itv-coche-mas-200000-km.html",
    "blog\itv-coche-parado-6-meses.html",
    "blog\itv-motos-ciclomotores.html"
)

$boton = '<button class="itv-nav-toggle" aria-label="Abrir men&uacute;" aria-expanded="false"><span></span><span></span><span></span></button>'
$scriptTag = '<script src="/js/nav-mobile.js" defer></script>'

foreach ($a in $archivos) {
    $ruta = "$base\$a"
    if (-not (Test-Path $ruta)) {
        Write-Host "NO EXISTE: $a" -ForegroundColor Red
        continue
    }

    $c = [System.IO.File]::ReadAllText($ruta, [System.Text.UTF8Encoding]::new($false))
    $original = $c
    $cambios = 0

    # 1. Anadir boton hamburguesa antes del <nav class="itv-nav">
    if (-not $c.Contains('itv-nav-toggle')) {
        $patron = '</a><nav class="itv-nav">'
        if ($c.Contains($patron)) {
            $c = $c.Replace($patron, '</a>' + $boton + '<nav class="itv-nav">')
            $cambios++
        }
    }

    # 2. Anadir script antes de </body>
    if (-not $c.Contains('nav-mobile.js')) {
        if ($c.Contains('</body>')) {
            $c = $c.Replace('</body>', $scriptTag + '</body>')
            $cambios++
        }
    }

    if ($c -ne $original) {
        [System.IO.File]::WriteAllText($ruta, $c, [System.Text.UTF8Encoding]::new($false))
        Write-Host "OK HTML: $a ($cambios cambios)" -ForegroundColor Green
    } else {
        Write-Host "SKIP: $a (sin cambios)" -ForegroundColor Yellow
    }
}

# --- PASO 4: Verificacion ---
Write-Host ""
Write-Host "--- Verificacion ---" -ForegroundColor Cyan

$cssCheck = [System.IO.File]::ReadAllText($cssPath, [System.Text.UTF8Encoding]::new($false))
Write-Host "CSS tiene nav-toggle:   $($cssCheck.Contains('.itv-nav-toggle'))"
Write-Host "JS existe:              $(Test-Path $jsPath)"
Write-Host ""

foreach ($a in $archivos) {
    $ruta = "$base\$a"
    if (Test-Path $ruta) {
        $c = [System.IO.File]::ReadAllText($ruta, [System.Text.UTF8Encoding]::new($false))
        $tieneBoton = $c.Contains('itv-nav-toggle')
        $tieneJs = $c.Contains('nav-mobile.js')
        Write-Host ("{0,-45} boton:{1,-8} js:{2}" -f $a, $tieneBoton, $tieneJs)
    }
}