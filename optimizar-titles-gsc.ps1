# optimizar-titles-gsc.ps1
# Optimiza titles y metas de las 10 paginas con 0 clics pero miles de impresiones
# Usa entidades HTML para evitar problemas de encoding

$ErrorActionPreference = 'Stop'
$base = 'C:\Users\Usuario\Desktop\ITVcheck'

# Diccionario: archivo -> @{ Title = "..."; Desc = "..." }
$optimizaciones = @{
    'estaciones\itv-sevilla-este.html' = @{
        Title = 'ITV Sevilla Este: Cita Previa, Tel&eacute;fono y Precio 2026'
        Desc = 'Pasa la ITV en Sevilla Este sin esperas. Consulta el tel&eacute;fono directo, horario actualizado y pide cita previa online en 2 minutos.'
    }
    'estaciones\itv-a-coruna.html' = @{
        Title = 'ITV A Coru&ntilde;a: Cita Previa, Tel&eacute;fono y Precio 2026'
        Desc = 'Gu&iacute;a completa de la ITV en A Coru&ntilde;a. Precios actualizados, tel&eacute;fono de contacto y c&oacute;mo pedir cita previa hoy.'
    }
    'estaciones\itv-sevilla-sur.html' = @{
        Title = 'ITV Sevilla Sur: Cita Previa, Tel&eacute;fono y Horario 2026'
        Desc = 'Toda la informaci&oacute;n de la ITV Sevilla Sur. Pide cita previa, consulta el tel&eacute;fono oficial y los horarios de atenci&oacute;n.'
    }
    'estaciones\itv-santander.html' = @{
        Title = 'ITV Santander: Horario, Tel&eacute;fono y Cita Previa 2026'
        Desc = '&iquest;Buscas la ITV en Santander? Consulta horarios, tel&eacute;fonos y c&oacute;mo pedir cita previa en las estaciones de Cantabria.'
    }
    'estaciones\itv-pontevedra.html' = @{
        Title = 'ITV Pontevedra: Cita Previa, Tel&eacute;fono y Precio 2026'
        Desc = 'Informaci&oacute;n de la ITV en Pontevedra. Precios 2026, horarios, tel&eacute;fonos y c&oacute;mo pedir cita previa sin esperas.'
    }
    'estaciones\itv-miller-bajo.html' = @{
        Title = 'ITV Miller Bajo (Las Palmas): Cita, Tel&eacute;fono y Horario'
        Desc = 'Pasa la ITV en Miller Bajo sin esperas. Tel&eacute;fono directo, horario actualizado 2026 y c&oacute;mo pedir cita en Applus.'
    }
    'estaciones\itv-santiago.html' = @{
        Title = 'ITV Santiago de Compostela: Cita, Tel&eacute;fono y Precio 2026'
        Desc = 'Toda la informaci&oacute;n de la ITV en Santiago. Consulta el tel&eacute;fono, horario, precio actualizado y pide cita previa online.'
    }
    'estaciones\itv-gijon.html' = @{
        Title = 'ITV Gij&oacute;n: Precio, Horario y Cita en Trema&ntilde;es y Gij&oacute;n II'
        Desc = 'Informaci&oacute;n de las ITV en Gij&oacute;n (Trema&ntilde;es y Gij&oacute;n II). Precios 2026, horarios, tel&eacute;fonos y cita previa.'
    }
    'estaciones\itv-ferrol.html' = @{
        Title = 'ITV Ferrol: Horario 2026, Tel&eacute;fono y Cita Previa'
        Desc = 'Pasa la ITV en Ferrol sin esperas. Consulta el horario, tel&eacute;fono y c&oacute;mo solicitar cita previa en la estaci&oacute;n.'
    }
    'tipos-defectos-itv.html' = @{
        Title = 'Defectos ITV 2026: Qu&eacute; significa cada c&oacute;digo (04.01, 08.03...)'
        Desc = 'Aprende a interpretar el informe de la ITV. Qu&eacute; significan los defectos leves, graves y muy graves (c&oacute;digos 04.01, 08.03, etc.).'
    }
}

$resumen = @()

foreach($relPath in $optimizaciones.Keys) {
    $filePath = Join-Path $base $relPath
    if(-not (Test-Path $filePath)) {
        Write-Host "  SKIP: $relPath (no existe)" -ForegroundColor DarkGray
        continue
    }
    
    $data = $optimizaciones[$relPath]
    $html = Get-Content $filePath -Raw -Encoding UTF8
    
    # Reemplazar title
    $titleNuevo = $data.Title
    $html = $html -replace '(?s)<title>.*?</title>', "<title>$titleNuevo | ITVcheck.es</title>"
    
    # Reemplazar meta description
    $descNueva = $data.Desc
    $html = $html -replace '(?s)<meta name="description" content="[^"]*">', "<meta name=`"description`" content=`"$descNueva`">"
    
    Set-Content -Path $filePath -Value $html -Encoding UTF8 -NoNewline
    
    $resumen += [PSCustomObject]@{
        Archivo = $relPath
        Title = $data.Title
    }
    
    Write-Host "  OK: $relPath" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== RESUMEN ===" -ForegroundColor Cyan
$resumen | Format-Table -AutoSize
Write-Host "Total paginas optimizadas: $($resumen.Count)" -ForegroundColor Green