param([switch]$Apply)

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

function Build-Cards($productos) {
    $html = "`n<!-- AMAZON-CARDS-BLOCK -->`n"
    $html += "<div class=`"afiliados-aviso`">Enlace de afiliado · Si compras, ganamos una comision sin coste para ti.</div>`n"
    foreach ($p in $productos) {
        $imgUrl = "https://m.media-amazon.com/images/I/" + $p.Img + "._SL200_.jpg"
        $link = "https://www.amazon.es/dp/" + $p.Asin + "?tag=itvcheck-21"
        $html += "<div class=`"amazon-card`">`n"
        $html += "  <img src=`"$imgUrl`" alt=`"$($p.Titulo)`" loading=`"lazy`">`n"
        $html += "  <div class=`"amazon-card-body`">`n"
        $html += "    <h4>$($p.Titulo)</h4>`n"
        $html += "    <p>$($p.Desc)</p>`n"
        $html += "    <a href=`"$link`" target=`"_blank`" rel=`"nofollow sponsored`" class=`"btn-amazon`">Ver precio en Amazon</a>`n"
        $html += "  </div>`n"
        $html += "</div>`n"
    }
    $html += "<!-- /AMAZON-CARDS-BLOCK -->`n"
    return $html
}

$paginas = @()

$paginas += @{
    Archivo = "mecanica\bombillas.html"
    Productos = @(
        @{ Asin="B07YDD74GW"; Img="61q6IsrY3mL"; Titulo="Bombilla H7 XELORD (pack de 2)"; Desc="Certificacion E-Mark, luz mas blanca y homologada para pasar la ITV." },
        @{ Asin="B092JGM388"; Img="71Lh44paL-S"; Titulo="Bombilla W5W XELORD (pack de 2)"; Desc="12V 5W, luz blanca, homologadas para ITV." },
        @{ Asin="B09PY8WQHJ"; Img="810eYUofxZL"; Titulo="Destornilladores JOREST (40 puntas)"; Desc="Puntas de T5 a T20, mango magnetico, ideales para el vano motor." }
    )
}

$paginas += @{
    Archivo = "mecanica\baterias.html"
    Productos = @(
        @{ Asin="B0BW9HJ395"; Img="81b924-md+L"; Titulo="Bateria AGM TK720"; Desc="Ideal para coches con Start-Stop, 12V y 72Ah, libre de mantenimiento." },
        @{ Asin="B0FBGGP41Y"; Img="81lNUTGgNLL"; Titulo="Multimetro AstroAI"; Desc="Mide voltaje, resistencia y continuidad. Imprescindible para diagnosticar la bateria." }
    )
}

$paginas += @{
    Archivo = "mecanica\escobillas.html"
    Productos = @(
        @{ Asin="B00G27RSPU"; Img="51mrJmFOepL"; Titulo="Escobilla Bosch Aerotwin 600mm"; Desc="Doble goma, sin ruidos ni rayas, compatible con gancho en J." },
        @{ Asin="B002ZRQ4AG"; Img="61QXDaUXK-L"; Titulo="Escobilla Bosch Aerotwin 650mm"; Desc="Barrido uniforme y duradero, la opcion premium." }
    )
}

$paginas += @{
    Archivo = "mecanica\fusibles.html"
    Productos = @(
        @{ Asin="B0FBGGP41Y"; Img="81lNUTGgNLL"; Titulo="Multimetro AstroAI"; Desc="Voltaje, resistencia y continuidad. Imprescindible para diagnosticar fusibles." },
        @{ Asin="B09CD3LX6R"; Img="81CrLjXu2wL"; Titulo="Guantes Ansell"; Desc="Resistentes a aceites y grasas con palma antideslizante." }
    )
}

$totalTarjetas = 0
$archivosModificados = 0

foreach ($pag in $paginas) {
    $archivo = $pag.Archivo
    if (-not (Test-Path $archivo)) {
        Write-Host "  SKIP (no existe): ${archivo}" -ForegroundColor Yellow
        continue
    }

    $content = Get-Content $archivo -Raw -Encoding UTF8

    if ($content -match "AMAZON-CARDS-BLOCK") {
        Write-Host "  SKIP (ya tiene tarjetas): ${archivo}" -ForegroundColor Yellow
        continue
    }

    $block = Build-Cards $pag.Productos

    $match = [regex]::Match($content, "(?s)(</h2>.*?</p>)")

    if ($match.Success) {
        $insertPos = $match.Index + $match.Length
        $nuevo = $content.Substring(0, $insertPos) + $block + $content.Substring($insertPos)

        if ($Apply) {
            Set-Content -Path $archivo -Value $nuevo -NoNewline -Encoding UTF8
            Write-Host "  APLICADO: ${archivo} ($($pag.Productos.Count) tarjetas)" -ForegroundColor Green
        } else {
            Write-Host "  [DRY-RUN] ${archivo}: $($pag.Productos.Count) tarjetas" -ForegroundColor Cyan
        }

        $totalTarjetas += $pag.Productos.Count
        $archivosModificados++
    } else {
        Write-Host "  ERROR: no se encontro patron </h2>...</p> en ${archivo}" -ForegroundColor Red
    }
}

Write-Host ""
if ($Apply) { Write-Host "=== APLICADO ===" -ForegroundColor Cyan }
else { Write-Host "=== DRY-RUN ===" -ForegroundColor Cyan }
Write-Host "Archivos modificados: $archivosModificados"
Write-Host "Tarjetas insertadas: $totalTarjetas"
