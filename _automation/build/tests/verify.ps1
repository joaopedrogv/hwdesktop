#Requires -Version 7.5
<# .SYNOPSIS
Verifica as chamadas em um projeto temporário com compilador BAT simulado, sem Delphi ou rede.
#>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false
$engine = (Get-Process -Id $PID).Path
$commandsRoot = Split-Path -Parent $PSScriptRoot
$temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$fixture = Join-Path $temporaryBase ('hwdesktop-automation-' + [guid]::NewGuid().ToString('N'))
$project = Join-Path $fixture 'Projeto teste'
$checks = 0

function Assert-Check {
    param([bool] $Condition, [string] $Description)
    if (-not $Condition) { throw "FALHA: $Description" }
    $script:checks++
    Write-Host "[OK] $Description" -ForegroundColor Green
}

function Invoke-TestCommand {
    param([string] $Name, [string[]] $Parameters = @())
    $commandPath = Join-Path $commandsRoot $Name
    $output = @(& $engine -NoLogo -NoProfile -File $commandPath -ProjectRoot $project @Parameters 2>&1)
    [pscustomobject]@{ Code = $LASTEXITCODE; Output = $output -join "`n" }
}

try {
    foreach ($directory in @('_automation\core','_automation\config','bpl','dcp','dcu','dcu\nested','dpk Alpha','dpk Beta','dpk Reestrutura')) {
        [void][IO.Directory]::CreateDirectory((Join-Path $project $directory))
    }
    $catalog = @('pkAlpha;..\dpk Alpha;NORMAL','pkBeta;..\dpk Beta;NORMAL','pkReestrutura;..\dpk Reestrutura;SQL_RES')
    Set-Content -LiteralPath (Join-Path $project '_automation\config\package-list.txt') -Value $catalog
    Set-Content -LiteralPath (Join-Path $project '_automation\config\reestrutura-params.txt') -Value $catalog[2]
    Set-Content -LiteralPath (Join-Path $project '_automation\config\config-paths.bat') -Value '@echo off'
    $configuredTarget = Join-Path $fixture 'Publicacao configurada'
    $configValue = $configuredTarget.Replace("'", "''")
    Set-Content -LiteralPath (Join-Path $project '_automation\config\deploy.psd1') -Value "@{ Destination = '$configValue' }"
    foreach ($pair in @(@('dpk Alpha','pkAlpha'),@('dpk Beta','pkBeta'),@('dpk Reestrutura','pkReestrutura'))) {
        Set-Content -LiteralPath (Join-Path $project "$($pair[0])\$($pair[1]).dpk") -Value 'package Test; end.'
    }
    $stub = @'
@echo off
setlocal
>>"%~dp0..\..\calls.txt" echo %~1;%~3
if exist "%~dp0..\..\fail-%~1.flag" exit /b 9
>"%~dp0..\..\bpl\%~1.bpl" echo %~1
exit /b 0
'@
    Set-Content -LiteralPath (Join-Path $project '_automation\core\build-package.bat') -Value $stub -Encoding ascii
    $callsFile = Join-Path $project 'calls.txt'

    $result = Invoke-TestCommand 'build-select.ps1' @('-Packages','pkBeta,pkAlpha','-NonInteractive')
    if ($result.Code -ne 0) { throw $result.Output }
    Assert-Check ($result.Code -eq 0) 'Seleção independente, com caminhos contendo espaços'
    $calls = @(Get-Content -LiteralPath $callsFile)
    Assert-Check (($calls -join '|') -eq 'pkAlpha;NORMAL|pkBeta;NORMAL') 'Seleção preserva a ordem do catálogo'
    Assert-Check ($result.Output.Contains('PACOTES SELECIONADOS: 2') -and $result.Output.Contains('[OK] pkAlpha') -and $result.Output.Contains('RESUMO DO BUILD')) 'Seleção preserva lista, resultados por pacote e resumo'

    $result = Invoke-TestCommand 'build-reestrutura.ps1' @('-NoClean','-NonInteractive')
    Assert-Check ($result.Code -eq 0 -and (Get-Content -LiteralPath $callsFile)[-1] -eq 'pkReestrutura;SQL_RES') 'Preparação especial SQL_RES encaminhada ao núcleo existente'

    $before = Get-Content -LiteralPath $callsFile -Raw
    $result = Invoke-TestCommand 'build-all.ps1' @('-WhatIf')
    Assert-Check ($result.Code -eq 0 -and (Get-Content -LiteralPath $callsFile -Raw) -eq $before) 'Build -WhatIf não chama o compilador'
    Assert-Check (Test-Path -LiteralPath (Join-Path $project 'bpl\pkAlpha.bpl')) 'Build -WhatIf não limpa saídas'

    $result = Invoke-TestCommand 'build-all.ps1' @('-NoClean','-NonInteractive')
    Assert-Check ($result.Code -eq 0) 'Compilação de todo o catálogo executa o núcleo simulado'
    Assert-Check ($result.Output.Contains('Build: pkAlpha [Tipo: NORMAL]') -and $result.Output.Contains('BUILD CONCLUIDO COM SUCESSO!')) 'Compilação completa preserva títulos e conclusão do BAT original'

    $deployTarget = Join-Path $fixture 'Publicacao local'
    $result = Invoke-TestCommand 'deploy-all.ps1' @('-Destination',$deployTarget,'-WhatIf')
    Assert-Check ($result.Code -eq 0 -and -not (Test-Path -LiteralPath $deployTarget)) 'Deploy -WhatIf não cria nem consulta um destino remoto'
    $result = Invoke-TestCommand 'deploy-all.ps1' @('-Destination',$deployTarget)
    Assert-Check ($result.Code -eq 0 -and @(Get-ChildItem -LiteralPath $deployTarget -File).Count -eq 3) 'Publicação copia os arquivos do catálogo para um destino local de teste'
    Assert-Check ($result.Output.Contains('Copiando pkAlpha.bpl...') -and $result.Output.Contains('RESUMO DO DEPLOY') -and $result.Output.Contains('Copiados com sucesso : 3')) 'Publicação preserva cópias individuais e resumo'
    $result = Invoke-TestCommand 'deploy-all.ps1' @('-WhatIf')
    Assert-Check ($result.Code -eq 0 -and $result.Output.Contains($configuredTarget) -and -not (Test-Path -LiteralPath $configuredTarget)) 'Destino padrão vem do arquivo config/deploy.psd1'
    $result = Invoke-TestCommand 'deploy-all.ps1'
    Assert-Check ($result.Code -eq 0 -and @(Get-ChildItem -LiteralPath $configuredTarget -File).Count -eq 3) 'Publicação usa o destino configurado quando não recebe -Destination'

    Set-Content -LiteralPath (Join-Path $project 'dcu\temp.dcu') -Value 'teste'
    Set-Content -LiteralPath (Join-Path $project 'dcu\nested\keep.dcu') -Value 'preservar'
    Set-Content -LiteralPath (Join-Path $project 'dcp\pkAlpha.dcp') -Value 'teste'
    Set-Content -LiteralPath (Join-Path $project 'bpl\keep.bpl') -Value 'preservar'
    $result = Invoke-TestCommand 'clean.ps1' @('-WhatIf')
    Assert-Check ($result.Code -eq 0 -and (Test-Path -LiteralPath (Join-Path $project 'dcu\temp.dcu'))) 'Clean -WhatIf preserva arquivos'
    $result = Invoke-TestCommand 'clean.ps1'
    Assert-Check ($result.Code -eq 0 -and -not (Test-Path -LiteralPath (Join-Path $project 'dcu\temp.dcu')) -and -not (Test-Path -LiteralPath (Join-Path $project 'bpl\pkAlpha.bpl'))) 'Limpeza remove somente as saídas previstas no projeto temporário'
    Assert-Check ($result.Output.Contains('[DCP] pkAlpha.dcp') -and $result.Output.Contains('[BPL] pkAlpha.bpl') -and $result.Output.IndexOf('[DCP] pkAlpha.dcp') -lt $result.Output.IndexOf('[BPL] pkAlpha.bpl') -and $result.Output.Contains('LIMPEZA CONCLUIDA')) 'Limpeza mostra DCP/BPL na ordem original e a conclusão'
    Assert-Check ((Test-Path -LiteralPath (Join-Path $project 'bpl\keep.bpl')) -and (Test-Path -LiteralPath (Join-Path $project 'dcu\nested\keep.dcu'))) 'Limpeza preserva BPL fora do catálogo e não é recursiva nos DCUs'

    Set-Content -LiteralPath $callsFile -Value '' -NoNewline
    Set-Content -LiteralPath (Join-Path $project 'fail-pkBeta.flag') -Value 'simular falha'
    $blockedTarget = Join-Path $fixture 'Nao publicar'
    $result = Invoke-TestCommand 'build-and-deploy.ps1' @('-NoClean','-NonInteractive','-Destination',$blockedTarget)
    Assert-Check ($result.Code -ne 0 -and -not (Test-Path -LiteralPath $blockedTarget)) 'Falha no compilador impede publicação e retorna código não zero'
    Assert-Check ($result.Output.Contains('ETAPA 1/2: EXECUTANDO BUILD') -and $result.Output.Contains('O deploy NAO sera executado.')) 'Fluxo combinado preserva etapas e diagnóstico de falha'
    Assert-Check ((@(Get-Content -LiteralPath $callsFile) -join '|') -eq 'pkAlpha;NORMAL|pkBeta;NORMAL') 'Compilação para antes do pacote seguinte à falha'

    $before = Get-Content -LiteralPath $callsFile -Raw
    $result = Invoke-TestCommand 'build-select.ps1' @('-Packages','pacoteInexistente','-NonInteractive')
    Assert-Check ($result.Code -ne 0 -and (Get-Content -LiteralPath $callsFile -Raw) -eq $before) 'Seleção inválida não chama o núcleo'

    Remove-Item -LiteralPath (Join-Path $project 'fail-pkBeta.flag')
    $combinedTarget = Join-Path $fixture 'Publicacao combinada'
    $result = Invoke-TestCommand 'build-and-deploy.ps1' @('-NoClean','-NonInteractive','-Destination',$combinedTarget)
    Assert-Check ($result.Code -eq 0 -and @(Get-ChildItem -LiteralPath $combinedTarget -File).Count -eq 3) 'Compilação bem-sucedida permite a publicação do conjunto'
    Assert-Check ($result.Output.Contains('ETAPA 2/2: EXECUTANDO DEPLOY') -and $result.Output.Contains('Inicio do build:') -and $result.Output.Contains('Fim do deploy:') -and $result.Output.Contains('PROCESSO CONCLUIDO COM SUCESSO')) 'Fluxo combinado preserva horários, etapas e conclusão'
    Write-Host "`n$checks verificações concluídas em ambiente temporário." -ForegroundColor Cyan
}
finally {
    # Apaga somente o diretório exclusivo criado por esta execução, sob o temporário do sistema.
    $resolvedFixture = [IO.Path]::GetFullPath($fixture)
    $allowedPrefix = $temporaryBase.TrimEnd('\','/') + [IO.Path]::DirectorySeparatorChar
    if (-not $resolvedFixture.StartsWith($allowedPrefix, [StringComparison]::OrdinalIgnoreCase) -or
        [IO.Path]::GetFileName($resolvedFixture) -notmatch '^hwdesktop-automation-[a-f0-9]{32}$') {
        throw "Limpeza do teste recusada para caminho inesperado: $resolvedFixture"
    }
    if (Test-Path -LiteralPath $resolvedFixture) { Remove-Item -LiteralPath $resolvedFixture -Recurse -Force }
}
