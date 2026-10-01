$f = "C:\Users\Usuario\Desktop\ITVcheck\operadores-itv-espana.html"

$c = [System.IO.File]::ReadAllText($f, [System.Text.UTF8Encoding]::new($false))

# 1. Hero verde → tarjeta ink con borde y sombra ámbar
$c = $c.Replace(
    '.op-hero{background:linear-gradient(135deg,#10B981 0%,#059669 100%);color:#fff;padding:32px;border-radius:12px;margin:20px 0 30px;}',
    '.op-hero{background:var(--ink);color:var(--paper);padding:36px 40px;border-radius:4px;margin:24px 0 32px;box-shadow:8px 8px 0 var(--signal);}'
)

# 2. Hover del CTA → ámbar oscuro
$c = $c.Replace(
    '.op-cta:hover{background:#059669;}',
    '.op-cta:hover{background:var(--signal-dark);color:var(--paper);}'
)

# 3. Borde verde bajo títulos → borde ámbar
$c = $c.Replace(
    '.op-grupo h3{color:var(--signal-dark);border-bottom:2px solid #10B981;padding-bottom:6px;}',
    '.op-grupo h3{color:var(--signal-dark);border-bottom:2px solid var(--signal);padding-bottom:6px;}'
)

# 4. Reparar h1 dentro del hero (necesita color paper)
$c = $c.Replace('.op-hero h1{color:#fff;', '.op-hero h1{color:var(--paper);')

# 5. CTA base con ink
$c = $c.Replace(
    '.op-cta{display:inline-block;padding:10px 20px;background:#10B981;color:#fff;text-decoration:none;border-radius:8px;font-weight:700;margin-top:8px;}',
    '.op-cta{display:inline-block;padding:12px 22px;background:var(--ink);color:var(--paper);text-decoration:none;border-radius:4px;font-weight:600;margin-top:12px;font-family:var(--font-mono);font-size:12px;letter-spacing:0.08em;text-transform:uppercase;}'
)

[System.IO.File]::WriteAllText($f, $c, [System.Text.UTF8Encoding]::new($false))

Write-Host "OK: verdes eliminados de operadores-itv-espana" -ForegroundColor Green
$count = ([regex]::Matches($c, '#10B981|#059669|#047857|var\(--ve\)')).Count
Write-Host "Restos de verde: $count"