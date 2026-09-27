param([switch]$Apply)

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

# Catalogo de productos
$P = @{
    H7       = @{ Asin="B07YDD74GW"; Img="61q6IsrY3mL"; Titulo="Bombilla H7 XELORD (pack de 2)";        Desc="Certificacion E-Mark, luz mas blanca y homologada para pasar la ITV." }
    W5W      = @{ Asin="B092JGM388"; Img="71Lh44paL-S"; Titulo="Bombilla W5W XELORD (pack de 2)";        Desc="12V 5W, luz blanca, homologadas para ITV." }
    TORX     = @{ Asin="B09PY8WQHJ"; Img="810eYUofxZL"; Titulo="Destornilladores JOREST (40 puntas)";    Desc="Puntas de T5 a T20, mango magnetico, ideales para el vano motor." }
    AGM      = @{ Asin="B0BW9HJ395"; Img="81b924-md+L"; Titulo="Bateria AGM TK720";                       Desc="Ideal para coches con Start-Stop, 12V y 72Ah, libre de mantenimiento." }
    EFB      = @{ Asin="B01EWOJW1M"; Img="51cXLCsTTSL"; Titulo="Bateria EFB Tudor TL700";                Desc="Tecnologia EFB para Start-Stop basico, 12V y 70Ah." }
    MULTI    = @{ Asin="B0FBGGP41Y"; Img="81lNUTGgNLL"; Titulo="Multimetro AstroAI";                       Desc="Voltaje, resistencia y continuidad. Imprescindible para diagnosticar." }
    GUANTES  = @{ Asin="B09CD3LX6R"; Img="81CrLjXu2wL"; Titulo="Guantes Ansell";                           Desc="Resistentes a aceites y grasas con palma antideslizante." }
    LINTERNA = @{ Asin="B0D3VDXB19"; Img="61Bp4JwkWzL"; Titulo="Linterna frontal Blukar";                  Desc="Recargable por USB, 8 modos de luz, perfecta para el vano motor." }
    ESCOB600 = @{ Asin="B00G27RSPU"; Img="51mrJmFOepL"; Titulo="Escobilla Bosch Aerotwin 600mm";          Desc="Doble goma, sin ruidos ni rayas, compatible con gancho en J." }
    ESCOB650 = @{ Asin="B002ZRQ4AG"; Img="61QXDaUXK-L"; Titulo="Escobilla Bosch Aerotwin 650mm";          Desc="Barrido uniforme y duradero, la opcion premium." }
    FRENOS   = @{ Asin="B0025KOQYY"; Img="";            Titulo="Limpiador de Frenos";                      Desc="Elimina polvo, grasa y residuos de discos y pastillas." }
    INFLADOR = @{ Asin="B0C1YKQYQ9"; Img="";            Titulo="Inflador de Neumaticos 12V";               Desc="Comprueba y ajusta la presion en cualquier lugar." }
    ADITIVO  = @{ Asin="B07ZDPXTM1"; Img="";            Titulo="Aditivo limpiador de inyectores";          Desc="Reduce emisiones y mejora la combustion antes de la ITV." }
    FAROS    = @{ Asin="B0B56LW37L"; Img="";            Titulo="Kit de pulido de faros";                   Desc="Recupera la transparencia de los faros amarillentos." }
}

# Reglas de mapeo por patron de nombre de archivo (case-insensitive)
$REGLAS = @(
    @{ Patron = "cambiar-bombilla";       Productos = @($P.H7, $P.W5W, $P.TORX) }
    @{ Patron = "cambiar-bateria";        Productos = @($P.AGM, $P.MULTI) }
    @{ Patron = "cambiar-escobillas";     Productos = @($P.ESCOB600, $P.ESCOB650) }
    @{ Patron = "guia-luces";             Productos = @($P.H7, $P.W5W, $P.GUANTES) }
    @{ Patron = "guia-bombilla";          Productos = @($P.H7, $P.W5W, $P.TORX) }
    @{ Patron = "guia-bateria";           Productos = @($P.AGM, $P.MULTI) }
    @{ Patron = "guia-frenos";            Productos = @($P.FRENOS, $P.GUANTES) }
    @{ Patron = "guia-neumaticos";        Productos = @($P.INFLADOR, $P.GUANTES) }
    @{ Patron = "guia-gases";             Productos = @($P.ADITIVO, $P.GUANTES) }
    @{ Patron = "limpiar-faros-coche";    Productos = @($P.FAROS, $P.GUANTES) }
)

function Build-Cards($productos) {
    $html = "`n<!-- AMAZON-CARDS-BLOCK -->`n"
    $html += "<div class=`"afiliados-aviso`">Enlace de afiliado · Si compras, ganamos una comision sin coste para ti.</div>`n"
    foreach ($prod in $productos) {
        $imgUrl = "https://m.media-amazon.com/images/I/" + $prod.Img + "._SL200_.jpg"
        $link = "https://www.amazon.es/dp/" + $prod.Asin + "?tag=itvcheck-21"
        $html += "<div class=`"amazon-card`">`n"
        if ($prod.Img -ne "") {
            $html += "  <img src=`"$imgUrl`" alt=`"$($prod.Titulo)`" loading=`"lazy`">`n"
        } else {
            $html += "  <div style=`"width:140px;height:140px;background:#F1F5F9;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:42px;`">🛒</div>`n"
        }
        $html += "  <div class=`"amazon-card-body`">`n"
        $html += "    <h4>$($prod.Titulo)</h4>`n"
        $html += "    <p>$($prod.Desc)</p>`n"
        $html += "    <a href=`"$link`" target=`"_blank`" rel=`"nofollow sponsored`" class=`"btn-amazon`">Ver precio en Amazon</a>`n"
        $html += "  </div>`n"
        $html += "</div>`n"
    }
    $html += "<!-- /AMAZON-CARDS-BLOCK -->`n"
    return $html
}

# Archivos a excluir explicitamente
$EXCLUIR = @(
    "404.html", "index.html", "mecanica.html", "guias.html",
    "itv-por-comunidad.html", "aviso-legal.html", "politica-cookies.html",
    "politica-privacidad.html", "politica-afiliados.html", "sobre-nosotros.html",
    "contacto.html", "calculadora-precio-itv.html", "cuando-me-toca-itv.html",
    "estaciones-itv.html", "indice-precios-itv-2026.html"
)

$totalArchivos = 0
$totalTarjetas = 0
$saltados = 0
$sinPatron = 0

Get-ChildItem -Recurse -Filter *.html | Where-Object {
    $EXCLUIR -notcontains $_.Name -and $_.DirectoryName -notmatch "scripts"
} | ForEach-Object {
    $nombre = $_.Name.ToLower()

    # Buscar patron aplicable
    $regla = $REGLAS | Where-Object { $nombre -like ("*" + $_.Patron + "*") } | Select-Object -First 1

    if (-not $regla) {
        $sinPatron++
        return
    }

    $content = Get-Content $_.FullName -Raw -Encoding UTF8

    if ($content -match "AMAZON-CARDS-BLOCK") {
        $saltados++
        return
    }

    $block = Build-Cards $regla.Productos
    $match = [regex]::Match($content, "(?s)(</h2>.*?</p>)")

    if ($match.Success) {
        $insertPos = $match.Index + $match.Length
        $nuevo = $content.Substring(0, $insertPos) + $block + $content.Substring($insertPos)

        if ($Apply) {
            Set-Content -Path $_.FullName -Value $nuevo -NoNewline -Encoding UTF8
            Write-Host "  OK: $($_.Name) ($($regla.Productos.Count) tarjetas)" -ForegroundColor Green
        } else {
            Write-Host "  [DRY] $($_.Name) ($($regla.Productos.Count) tarjetas)" -ForegroundColor Cyan
        }

        $totalArchivos++
        $totalTarjetas += $regla.Productos.Count
    } else {
        Write-Host "  SIN H2: $($_.Name)" -ForegroundColor Yellow
    }
}

Write-Host ""
if ($Apply) { Write-Host "=== APLICADO ===" -ForegroundColor Cyan }
else { Write-Host "=== DRY-RUN ===" -ForegroundColor Cyan }
Write-Host "Archivos modificados:  $totalArchivos"
Write-Host "Archivos ya tenian:    $saltados"
Write-Host "Sin patron aplicable:  $sinPatron"
Write-Host "Tarjetas insertadas:   $totalTarjetas"
