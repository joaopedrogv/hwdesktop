#Requires -Version 7.5
<#
.SYNOPSIS
    Testes das automações: build, sincronização, início de demanda e menu.
.DESCRIPTION
    Usa somente pastas temporárias, compilador/SVN simulados e remoto Git local.
    Não lê configurações pessoais ou segredos nem opera nos projetos reais.
.PARAMETER Group
    All executa tudo. Opcionalmente: Build, Sync, Start ou Menu.
#>
[CmdletBinding()]
param([ValidateSet('All', 'Build', 'Sync', 'Start', 'Menu')] [string] $Group = 'All')

$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false
$automationRoot = Split-Path -Parent $PSScriptRoot
$script:checks = 0

function Assert-Check {
    param([bool] $Condition, [string] $Description)
    if (-not $Condition) { throw "FALHA: $Description" }
    $script:checks++
    Write-Host "[OK] $Description" -ForegroundColor Green
}

function Test-Build {
    $ErrorActionPreference = 'Stop'
    $PSNativeCommandUseErrorActionPreference = $false
    $engine = (Get-Process -Id $PID).Path
    $commandsRoot = Join-Path $automationRoot 'build'
    $temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture = Join-Path $temporaryBase ('hwdesktop-automation-' + [guid]::NewGuid().ToString('N'))
    $project = Join-Path $fixture 'Projeto teste'




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
}

function Test-Sync {
    $ErrorActionPreference = 'Stop'
    $syncSource = [IO.Path]::GetFullPath((Join-Path $automationRoot 'workflow\sync-integration.ps1'))
    . $syncSource
    $temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture = Join-Path $temporaryBase ('hwdesktop-sync-' + [guid]::NewGuid().ToString('N'))




    function Invoke-TestGit {
        param([string] $Directory, [string[]] $Arguments)
        $result = Invoke-SyncProcess git $Arguments $Directory
        if ($result.ExitCode -ne 0) { throw "Git do teste: $($result.Error) $($result.Output)" }
        return $result.Output.TrimEnd()
    }

    function New-TestArea {
        param([string] $Name, [switch] $Empty)
        $base = Join-Path $fixture $Name
        $root = Join-Path $base 'Integracao com espacos'
        $origin = Join-Path $base 'origin.git'
        [void] [IO.Directory]::CreateDirectory($root)
        [void] (Invoke-TestGit $base @('init', '--bare', '--initial-branch=main', $origin))
        [void] (Invoke-TestGit $root @('init', '--initial-branch=main'))
        [void] (Invoke-TestGit $root @('config', 'user.name', 'Teste local'))
        [void] (Invoke-TestGit $root @('config', 'user.email', 'teste@example.invalid'))
        [void] (Invoke-TestGit $root @('config', 'core.autocrlf', 'false'))
        [void] (Invoke-TestGit $root @('remote', 'add', 'origin', $origin))
        [IO.File]::WriteAllText((Join-Path $root '.gitignore'), "config/`n_automation/`n")
        [IO.File]::WriteAllText((Join-Path $root 'fonte.pas'), "estado inicial`n")
        [IO.File]::WriteAllText((Join-Path $root 'remover.txt'), "remover pelo SVN`n")
        [IO.File]::WriteAllText((Join-Path $root 'local.ini'), "inicial`n")
        if (-not $Empty) {
            [void] (Invoke-TestGit $root @('add', '.'))
            [void] (Invoke-TestGit $root @('commit', '-m', 'Base do teste'))
            [void] (Invoke-TestGit $root @('push', 'origin', 'main'))
        }
        $configDirectory = Join-Path $root 'config'
        [void] [IO.Directory]::CreateDirectory($configDirectory)
        $configFile = Join-Path $configDirectory 'workflow.local.psd1'
        $rootValue = $root.Replace("'", "''")
        [IO.File]::WriteAllText($configFile, "@{ IntegrationPath='$rootValue'; GitBranch='main'; SvnUrlSuffix='/svn/hwsistemas/Projeto_Fiscal40'; SecretsFile='segredos.md' }")
        [IO.File]::WriteAllText((Join-Path $configDirectory 'segredos.md'), "SVN_USER=usuario-ficticio`nSVN_PASS=senha=ficticia\teste`n")
        $syncScript = Join-Path $root '_automation\workflow\sync-integration.ps1'
        [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $syncScript))
        Copy-Item -LiteralPath $syncSource -Destination $syncScript
        $state = @{
            Updated = $false; BeforeRevision = '19038'; AfterRevision = '19040'
            Url = 'https://servidor.invalid/svn/hwsistemas/Projeto_Fiscal40'
            BeforeStatus = '<status><target path="."></target></status>'
            AfterStatus = '<status><target path="."></target></status>'
            UpdateAction = $null; FailUpdate = $false; FailPush = $false; FailFetch = $false
            Calls = [Collections.Generic.List[object]]::new()
            AllCalls = [Collections.Generic.List[object]]::new()
            ResetPreservedFiles = $true; UpdateArguments = @()
            AfterFiles = @('.gitignore', 'fonte.pas', 'remover.txt', 'local.ini')
            FailInventory = $false
        }
        $nativeProcess = ${function:Invoke-SyncProcess}
        $runner = {
            param($Tool, $Arguments, $Directory)
            $state.Calls.Add([pscustomobject]@{ Tool = $Tool; Arguments = @($Arguments) })
            $state.AllCalls.Add([pscustomobject]@{ Tool = $Tool; Arguments = @($Arguments) })
            $output = ''; $errorText = ''; $code = 0
            if ($Tool -eq 'git') {
                if (($state.FailPush -and $Arguments[0] -eq 'push') -or ($state.FailFetch -and $Arguments[0] -eq 'fetch')) {
                    return [pscustomobject]@{ ExitCode = 1; Output = ''; Error = 'Falha remota simulada' }
                }
                if ($Arguments[0] -eq 'reset') {
                    $before = [IO.File]::ReadAllBytes((Join-Path $Directory 'fonte.pas'))
                    $result = & $nativeProcess $Tool $Arguments $Directory
                    $after = [IO.File]::ReadAllBytes((Join-Path $Directory 'fonte.pas'))
                    $state.ResetPreservedFiles = [Convert]::ToBase64String($before) -eq [Convert]::ToBase64String($after)
                    return $result
                }
                return $null # Git real, somente no fixture e seu remoto local.
            }
            switch ($Arguments[0]) {
                '--version' { $output = 'svn, version 1.9.6 (simulado)' }
                'info' {
                    $revision = if ($state.Updated) { $state.AfterRevision } else { $state.BeforeRevision }
                    $url = [Security.SecurityElement]::Escape($state.Url)
                    $entries = "<entry kind='dir' path='.' revision='$revision'><url>$url</url></entry>"
                    if ($Arguments -contains '--depth') {
                        if ($state.FailInventory) { return [pscustomobject]@{ ExitCode = 1; Output = ''; Error = 'Inventário SVN indisponível (simulado)' } }
                        foreach ($path in $state.AfterFiles) {
                            $escapedPath = [Security.SecurityElement]::Escape($path)
                            $entries += "<entry kind='file' path='$escapedPath' revision='$revision'/>"
                        }
                    }
                    $output = "<info>$entries</info>"
                }
                'status' { $output = if ($state.Updated) { $state.AfterStatus } else { $state.BeforeStatus } }
                'update' {
                    $state.UpdateArguments = @($Arguments)
                    if ($state.FailUpdate) {
                        $code = 1; $errorText = 'Falha simulada com senha=ficticia\teste'
                    }
                    else {
                        if ($null -ne $state.UpdateAction) { & $state.UpdateAction $Directory }
                        $state.Updated = $true
                        $output = "Updated to revision $($state.AfterRevision)."
                    }
                }
                default { throw "Comando SVN inesperado no teste: $($Arguments[0])" }
            }
            [pscustomobject]@{ ExitCode = $code; Output = $output; Error = $errorText }
        }.GetNewClosure()
        [pscustomobject]@{ Root = $root; Origin = $origin; Base = $base; Config = $configFile; State = $state; Runner = $runner; SyncScript = $syncScript }
    }

    function Invoke-TestSync {
        param($Area, [string] $Directory = $Area.Root, [string] $ScriptPath = $Area.SyncScript)
        $Area.State.Calls.Clear()
        $Area.State.Updated = $false
        $log = [Collections.Generic.List[string]]::new()
        $failure = ''
        Push-Location -LiteralPath $Directory
        try {
            # Carregar a cópia da própria integração temporária, sem bypass da validação.
            . $ScriptPath
            Invoke-SyncIntegration -ConfigPath $Area.Config -CommandRunner $Area.Runner 6>&1 | ForEach-Object { $log.Add([string] $_) }
        }
        catch { $failure = $_.Exception.Message }
        finally { Pop-Location }
        [pscustomobject]@{ Success = ($failure -eq ''); Error = $failure; Log = ($log -join "`n") }
    }

    function Test-Called {
        param($Area, [string] $Tool, [string] $Command)
        return @($Area.State.Calls | Where-Object { $_.Tool -eq $Tool -and $_.Arguments[0] -eq $Command }).Count -gt 0
    }

    try {
        [void] [IO.Directory]::CreateDirectory($fixture)
        $area = New-TestArea 'principal'
        # Mesmo caso relatado: arquivo local já commitado e publicado, ausente do SVN.
        $gitOnlyFile = 'só Git [teste] com espaços.txt'
        [IO.File]::WriteAllText((Join-Path $area.Root $gitOnlyFile), "preservar fisicamente`n")
        [void] (Invoke-TestGit $area.Root @('add', '--', $gitOnlyFile))
        [void] (Invoke-TestGit $area.Root @('commit', '-m', 'Arquivo somente Git, presente na integracao'))
        [void] (Invoke-TestGit $area.Root @('push', 'origin', 'main'))
        [IO.File]::WriteAllText((Join-Path $area.Root 'novo-local-nao-svn.txt'), "nao publicar`n")
        [IO.File]::WriteAllText((Join-Path $area.Root 'excluido-svn-recriado.txt'), "copia local de arquivo excluido no SVN`n")
        [void] (Invoke-TestGit $area.Root @('add', 'excluido-svn-recriado.txt'))
        [void] (Invoke-TestGit $area.Root @('commit', '-m', 'Arquivo anteriormente sincronizado, depois excluido no SVN'))
        [void] (Invoke-TestGit $area.Root @('push', 'origin', 'main'))
        $initialHead = Invoke-TestGit $area.Root @('rev-parse', 'HEAD')
        $development = Join-Path $area.Base 'Desenvolvimento'
        [void] (Invoke-TestGit $area.Base @('clone', $area.Origin, $development))
        $result = Invoke-TestSync $area -Directory $development
        Assert-Check (-not $result.Success -and $result.Error.Contains('O diretório atual deve ser IntegrationPath') -and $area.State.Calls.Count -eq 0) 'Execução do WorkPath é rejeitada antes de qualquer comando Git ou SVN'
        $result = Invoke-TestSync $area -Directory (Split-Path -Parent $area.Config)
        Assert-Check (-not $result.Success -and $result.Error.Contains('O diretório atual deve ser IntegrationPath') -and $area.State.Calls.Count -eq 0) 'Subpasta da integração também é rejeitada: exige a raiz exata'
        $workScript = Join-Path $development '_automation\workflow\sync-integration.ps1'
        [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $workScript))
        Copy-Item -LiteralPath $syncSource -Destination $workScript
        $result = Invoke-TestSync $area -ScriptPath $workScript
        Assert-Check (-not $result.Success -and $result.Error.Contains('Utilize o script da integração') -and $area.State.Calls.Count -eq 0) 'Cópia do script no WorkPath é rejeitada mesmo com terminal na integração'
        $secretsFile = Join-Path (Split-Path -Parent $area.Config) 'segredos.md'
        $savedSecrets = [IO.File]::ReadAllText($secretsFile)
        [IO.File]::Delete($secretsFile)
        $result = Invoke-TestSync $area -Directory $development
        Assert-Check (-not $result.Success -and $result.Error.Contains('O diretório atual deve ser IntegrationPath')) 'Local incorreto é rejeitado antes de tentar ler segredos'
        [IO.File]::WriteAllText($secretsFile, $savedSecrets)
        $engine = (Get-Process -Id $PID).Path
        $cli = Invoke-SyncProcess $engine @('-NoLogo', '-NoProfile', '-File', $area.SyncScript, '-ConfigPath', $area.Config) $development
        Assert-Check ($cli.ExitCode -eq 1 -and $cli.Error.Contains('atual deve ser IntegrationPath')) 'Entrada independente também retorna código 1 quando chamada de outro terminal/diretório'
        $cli = Invoke-SyncProcess $engine @('-NoLogo', '-NoProfile', '-File', $workScript, '-ConfigPath', $area.Config) $area.Root
        Assert-Check ($cli.ExitCode -eq 1 -and $cli.Error.Contains('Utilize o script da integra')) 'Entrada independente rejeita script externo mesmo com diretório atual correto'
        [void] (Invoke-TestGit $development @('config', 'user.name', 'Teste remoto'))
        [void] (Invoke-TestGit $development @('config', 'user.email', 'remoto@example.invalid'))
        [IO.File]::WriteAllText((Join-Path $development 'fonte.pas'), "conteudo somente Git`n")
        [IO.File]::WriteAllText((Join-Path $development 'somente-remoto.txt'), "arquivo somente Git`n")
        [void] (Invoke-TestGit $development @('add', '.'))
        [void] (Invoke-TestGit $development @('commit', '-m', 'Commit remoto que deve permanecer no historico'))
        [void] (Invoke-TestGit $development @('push', 'origin', 'main'))
        $remoteHead = Invoke-TestGit $development @('rev-parse', 'HEAD')
        $area.State.AfterFiles = @('.gitignore', 'fonte.pas', 'local.ini', 'novo-svn.txt')
        $area.State.UpdateAction = {
            param($Directory)
            [IO.File]::WriteAllText((Join-Path $Directory 'fonte.pas'), "estado SVN atualizado`n")
            [IO.File]::WriteAllText((Join-Path $Directory 'novo-svn.txt'), "novo pelo SVN`n")
            [IO.File]::Delete((Join-Path $Directory 'remover.txt'))
        }
        $result = Invoke-TestSync $area
        if (-not $result.Success) { throw "$($result.Error)`n$($result.Log)" }
        Assert-Check $result.Success 'Sincroniza com a main remota à frente, sem comparar ou mesclar históricos'
        Assert-Check ($area.State.ResetPreservedFiles -and [IO.File]::ReadAllText((Join-Path $area.Root 'fonte.pas')) -eq "estado SVN atualizado`n") 'Reset soft preserva os bytes recebidos do SVN'
        Assert-Check ((Invoke-TestGit $area.Root @('rev-parse', 'HEAD^')) -eq $remoteHead) 'Novo commit tem como pai o último commit remoto'
        Assert-Check ((Invoke-TestGit $area.Root @('log', '--format=%s', '-1')) -eq 'Sincronizacao SVN r19040') 'Mensagem usa revisão de svn info após o update, não a revisão inicial'
        $history = Invoke-TestGit $area.Origin @('rev-list', 'main')
        Assert-Check ($history.Contains($initialHead) -and $history.Contains($remoteHead)) 'Todos os commits remotos anteriores continuam no histórico publicado'
        $files = Invoke-TestGit $area.Origin @('ls-tree', '-r', '--name-only', 'main')
        Assert-Check ($files.Contains('novo-svn.txt') -and -not $files.Contains('remover.txt') -and -not $files.Contains('somente-remoto.txt')) 'Inclusões e exclusões representam os arquivos SVN, incluindo diferença somente remota'
        Assert-Check (-not $files.Contains('config/')) 'Preparação respeita o filtro Git do fixture'
        $publishedNames = (Invoke-TestGit $area.Origin @('ls-tree', '-r', '--name-only', '-z', 'main')).Split([char] 0)
        Assert-Check ($gitOnlyFile -notin $publishedNames -and [IO.File]::ReadAllText((Join-Path $area.Root $gitOnlyFile)) -eq "preservar fisicamente`n") 'Arquivo já publicado somente no Git sai do commit, com nome especial e conteúdo local preservados'
        Assert-Check ('novo-local-nao-svn.txt' -notin $publishedNames -and [IO.File]::Exists((Join-Path $area.Root 'novo-local-nao-svn.txt'))) 'Arquivo local não versionado pelo SVN não entra na publicação'
        Assert-Check ('excluido-svn-recriado.txt' -notin $publishedNames -and [IO.File]::Exists((Join-Path $area.Root 'excluido-svn-recriado.txt'))) 'Arquivo excluído do SVN sai do Git mesmo com cópia física restante'
        Assert-Check ('.gitignore' -in $publishedNames -and $result.Log.Contains('fora do SVN')) 'gitignore versionado pelo SVN permanece, e as retiradas são informadas'
        $passwordIndex = [Array]::IndexOf($area.State.UpdateArguments, '--password')
        Assert-Check ($passwordIndex -gt 0 -and $area.State.UpdateArguments[$passwordIndex + 1] -eq 'senha=ficticia\teste' -and -not $result.Log.Contains('senha=ficticia\teste')) 'Credenciais com igual e barra são encaminhadas sem impressão'
        Assert-Check (-not (Test-Called $area git config) -and -not (Test-Called $area git pull) -and -not (Test-Called $area git merge)) 'Não acrescenta validação de autoria, pull ou merge'
        $head = Invoke-TestGit $area.Root @('rev-parse', 'HEAD')
        $result = Invoke-TestSync $area
        Assert-Check ($result.Success -and (Invoke-TestGit $area.Root @('rev-parse', 'HEAD')) -eq $head -and -not (Test-Called $area git commit)) 'Nova sincronização sem diferenças não cria commit vazio'

        $area.State.UpdateAction = $null
        $area.State.BeforeStatus = '<status><target path="."></target><changelist name="ignore-on-commit"><entry path="arquivo-local.ini"><wc-status item="modified" props="none"/></entry></changelist></status>'
        $area.State.AfterStatus = $area.State.BeforeStatus
        $result = Invoke-TestSync $area
        Assert-Check $result.Success 'ignore-on-commit não bloqueia mesmo com arquivo ausente do índice Git'
        $area.State.BeforeStatus = '<status><target path="."><entry path="fonte.pas"><wc-status item="modified" props="none"/></entry></target></status>'
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and -not (Test-Called $area svn update) -and -not (Test-Called $area git reset)) 'Alteração SVN fora da changelist interrompe antes do update/reset'
        $area.State.BeforeStatus = '<status><changelist name="ignore-on-commit"><entry path="local.ini"><wc-status item="conflicted" props="none"/></entry></changelist></status>'
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and -not (Test-Called $area svn update)) 'Conflito SVN interrompe inclusive em ignore-on-commit'
        $area.State.BeforeStatus = '<status><target path="."></target></status>'
        $area.State.AfterStatus = '<status><target path="."><entry path="fonte.pas"><wc-status item="normal" props="none" tree-conflicted="true"/></entry></target></status>'
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and (Test-Called $area svn update) -and -not (Test-Called $area git fetch)) 'Conflito criado pelo update interrompe antes das operações Git'
        $area.State.AfterStatus = $area.State.BeforeStatus
        $area.State.Url += '/bpl'
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and $result.Error.Contains('Final esperado:') -and -not (Test-Called $area svn update)) 'URL da subpasta bpl não é aceita como main SVN'
        $area.State.Url = $area.State.Url.Substring(0, $area.State.Url.Length - 4)

        [void] (Invoke-TestGit $area.Root @('switch', '-c', 'demanda'))
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and -not (Test-Called $area svn update)) 'Branch diferente da main interrompe sem trocar de branch'
        [void] (Invoke-TestGit $area.Root @('switch', 'main'))
        [IO.File]::WriteAllText((Join-Path $area.Root 'local.ini'), "mudanca preparada`n")
        [void] (Invoke-TestGit $area.Root @('add', 'local.ini'))
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and -not (Test-Called $area svn update)) 'Índice previamente preparado é preservado e interrompe a sincronização'
        [void] (Invoke-TestGit $area.Root @('reset', '--', 'local.ini'))
        # Commit apenas local para produzir histórico divergente do remoto.
        [void] (Invoke-TestGit $area.Root @('add', 'local.ini'))
        [void] (Invoke-TestGit $area.Root @('commit', '-m', 'Commit local de fixture'))
        [void] (Invoke-TestGit $development @('pull', '--ff-only'))
        [IO.File]::WriteAllText((Join-Path $development 'local.ini'), "mudanca remota`n")
        [void] (Invoke-TestGit $development @('add', '.'))
        [void] (Invoke-TestGit $development @('commit', '-m', 'Segundo commit remoto preservado'))
        [void] (Invoke-TestGit $development @('push', 'origin', 'main'))
        $remoteHead = Invoke-TestGit $development @('rev-parse', 'HEAD')
        $result = Invoke-TestSync $area
        Assert-Check ($result.Success -and (Invoke-TestGit $area.Root @('rev-parse', 'HEAD^')) -eq $remoteHead -and (Invoke-TestGit $area.Root @('show', 'HEAD:local.ini')) -eq 'mudanca preparada') 'Históricos divergentes: preserva arquivos atuais e acrescenta commit sobre a ponta remota'

        $area.State.FailUpdate = $true
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and -not (Test-Called $area git fetch) -and -not $result.Error.Contains('senha=ficticia\teste') -and -not $result.Log.Contains('senha=ficticia\teste')) 'Falha SVN interrompe e mascara senha até no diagnóstico simulado'
        $area.State.FailUpdate = $false
        $area.State.FailPush = $true
        [IO.File]::WriteAllText((Join-Path $area.Root 'fonte.pas'), "mudanca SVN para publicar`n")
        $beforePush = Invoke-TestGit $area.Origin @('rev-parse', 'main')
        $result = Invoke-TestSync $area
        $localCommit = Invoke-TestGit $area.Root @('rev-parse', 'HEAD')
        Assert-Check (-not $result.Success -and $localCommit -ne $beforePush -and (Invoke-TestGit $area.Origin @('rev-parse', 'main')) -eq $beforePush -and [IO.File]::ReadAllText((Join-Path $area.Root 'fonte.pas')) -eq "mudanca SVN para publicar`n") 'Falha de push mantém commit local e conteúdo SVN, sem modificar remoto'
        $area.State.FailPush = $false
        $result = Invoke-TestSync $area
        Assert-Check ($result.Success -and (Invoke-TestGit $area.Root @('rev-parse', 'HEAD')) -eq (Invoke-TestGit $area.Origin @('rev-parse', 'main'))) 'Reexecução após falha de push publica o estado preservado'
        $area.State.FailFetch = $true
        $area.State.UpdateAction = {
            param($Directory)
            [IO.File]::WriteAllText((Join-Path $Directory 'fonte.pas'), "SVN atualizado antes da falha de fetch`n")
        }
        $head = Invoke-TestGit $area.Root @('rev-parse', 'HEAD')
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and -not (Test-Called $area git reset) -and (Invoke-TestGit $area.Root @('rev-parse', 'HEAD')) -eq $head -and [IO.File]::ReadAllText((Join-Path $area.Root 'fonte.pas')) -eq "SVN atualizado antes da falha de fetch`n") 'Falha de fetch preserva o update SVN e não reposiciona a main local'
        $area.State.FailFetch = $false
        $area.State.UpdateAction = $null
        $area.State.FailInventory = $true
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and -not (Test-Called $area git fetch) -and -not (Test-Called $area git add)) 'Falha ao obter inventário SVN interrompe antes de preparar ou retirar arquivos Git'
        $area.State.FailInventory = $false
        $gitDirectory = Invoke-TestGit $area.Root @('rev-parse', '--absolute-git-dir')
        $mergeMarker = Join-Path $gitDirectory 'MERGE_HEAD'
        [IO.File]::WriteAllText($mergeMarker, "$head`n")
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and -not (Test-Called $area svn update) -and [IO.File]::Exists($mergeMarker)) 'Merge em andamento interrompe sem alterar a operação existente'
        [IO.File]::Delete($mergeMarker)
        [void] (Invoke-TestGit $area.Root @('remote', 'remove', 'origin'))
        $result = Invoke-TestSync $area
        Assert-Check (-not $result.Success -and -not (Test-Called $area svn update)) 'Falta de origin interrompe antes do update SVN'

        $empty = New-TestArea 'primeira-publicacao' -Empty
        $result = Invoke-TestSync $empty
        Assert-Check ($result.Success -and -not (Test-Called $empty git reset) -and (Invoke-TestGit $empty.Origin @('log', '-1', '--format=%s', 'main')) -eq 'Sincronizacao SVN r19040') 'Remoto vazio recebe primeira publicação com revisão SVN'
        $allCalls = @($area.State.AllCalls) + @($empty.State.AllCalls)
        $unsafeCalls = @($allCalls | Where-Object { $_.Tool -eq 'git' -and ($_.Arguments -contains '--force' -or $_.Arguments -contains '--hard' -or $_.Arguments[0] -in @('clean', 'restore', 'checkout', 'switch', 'rebase', 'merge', 'pull')) })
        Assert-Check ($unsafeCalls.Count -eq 0) 'Todas as sincronizações testadas usam somente reset soft e push normal, sem aplicar conteúdo Git sobre a pasta'

    }
    finally {
        $resolved = [IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase, [StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -like 'hwdesktop-sync-*' -and (Test-Path -LiteralPath $resolved)) {
            Remove-Item -LiteralPath $resolved -Recurse -Force
        }
    }
}

function Test-Start {
    $ErrorActionPreference = 'Stop'
    $PSNativeCommandUseErrorActionPreference = $false
    $scriptPath = [IO.Path]::GetFullPath((Join-Path $automationRoot 'workflow\start-demand.ps1'))
    . $scriptPath
    $temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture = Join-Path $temporaryBase ('hwdesktop-start-demand-' + [guid]::NewGuid().ToString('N'))




    function Invoke-TestGit {
        param([string] $Directory, [string[]] $Arguments)
        $result = Invoke-DemandProcess $Arguments $Directory
        if ($result.ExitCode -ne 0) { throw "Git do teste: $($result.Error) $($result.Output)" }
        return $result.Output.TrimEnd()
    }

    function New-TestArea {
        param([string] $Name)
        $base = Join-Path $fixture $Name
        $publisher = Join-Path $base 'Publicador'
        $root = Join-Path $base 'Trabalho Git'
        $integration = Join-Path $base 'Integracao SVN'
        $origin = Join-Path $base 'origin.git'
        foreach ($directory in @($publisher, $integration, (Join-Path $base 'config'))) { [void] [IO.Directory]::CreateDirectory($directory) }
        [IO.File]::WriteAllText((Join-Path $integration 'preservar.txt'), 'integracao sem alteracoes')
        [void] (Invoke-TestGit $base @('init', '--bare', '--initial-branch=main', $origin))
        [void] (Invoke-TestGit $publisher @('init', '--initial-branch=main'))
        [void] (Invoke-TestGit $publisher @('config', 'user.name', 'Teste de demandas'))
        [void] (Invoke-TestGit $publisher @('config', 'user.email', 'teste@example.invalid'))
        [void] (Invoke-TestGit $publisher @('remote', 'add', 'origin', $origin))
        [IO.File]::WriteAllText((Join-Path $publisher '.gitignore'), "bpl/`n*.local`n_automation/`n")
        [IO.File]::WriteAllText((Join-Path $publisher 'fonte.pas'), "base inicial`n")
        [void] (Invoke-TestGit $publisher @('add', '.'))
        [void] (Invoke-TestGit $publisher @('commit', '-m', 'Base inicial'))
        [void] (Invoke-TestGit $publisher @('push', 'origin', 'main'))
        [void] (Invoke-TestGit $base @('clone', $origin, $root))
        [void] (Invoke-TestGit $root @('config', 'user.name', 'Teste local'))
        [void] (Invoke-TestGit $root @('config', 'user.email', 'local@example.invalid'))
        $configFile = Join-Path $root '_automation\config\workflow.local.psd1'
        $startScript = Join-Path $root '_automation\workflow\start-demand.ps1'
        $integrationScript = Join-Path $integration '_automation\workflow\start-demand.ps1'
        $integrationConfig = Join-Path $integration '_automation\config\workflow.local.psd1'
        foreach ($directory in @((Split-Path -Parent $configFile), (Split-Path -Parent $startScript), (Split-Path -Parent $integrationScript), (Split-Path -Parent $integrationConfig), (Join-Path $integration '.svn'))) { [void] [IO.Directory]::CreateDirectory($directory) }
        Copy-Item -LiteralPath $scriptPath -Destination $startScript
        Copy-Item -LiteralPath $scriptPath -Destination $integrationScript
        # Nenhum caminho cruzado: a configuração do clone contém somente GitBranch.
        [IO.File]::WriteAllText($configFile, "@{ GitBranch='main' }")
        # A configuração da integração não conhece clones; não deve ser lida pelo start.
        $integrationValue = $integration.Replace("'", "''")
        [IO.File]::WriteAllText($integrationConfig, "@{ IntegrationPath='$integrationValue'; GitBranch='main-da-integracao-nao-usar' }")
        $state = @{
            Calls = [Collections.Generic.List[object]]::new()
            AllCalls = [Collections.Generic.List[object]]::new()
            FailFetch = $false; FailCreate = $false; ChangeAfterFetch = $false
        }
        $nativeProcess = ${function:Invoke-DemandProcess}
        $runner = {
            param($Arguments, $Directory)
            $call = [pscustomobject]@{ Arguments = @($Arguments); Directory = $Directory }
            $state.Calls.Add($call)
            $state.AllCalls.Add($call)
            if (($state.FailFetch -and $Arguments[0] -eq 'fetch') -or ($state.FailCreate -and $Arguments[0] -eq 'switch' -and '-c' -in $Arguments)) {
                return [pscustomobject]@{ ExitCode = 1; Output = ''; Error = 'Falha simulada' }
            }
            if ($state.ChangeAfterFetch -and $Arguments[0] -eq 'fetch') {
                $result = & $nativeProcess $Arguments $Directory
                [IO.File]::AppendAllText((Join-Path $Directory 'fonte.pas'), "alteracao concorrente`n")
                return $result
            }
            return $null
        }.GetNewClosure()
        [pscustomobject]@{ Base = $base; Root = $root; Publisher = $publisher; Origin = $origin; Integration = $integration; Config = $configFile; State = $state; Runner = $runner; StartScript = $startScript; IntegrationScript = $integrationScript; IntegrationConfig = $integrationConfig }
    }

    function Invoke-TestStart {
        param($Area, [string] $Branch = 'demanda/nova', [string] $ConfigPath = $Area.Config, [string] $WorkPath = '')
        $Area.State.Calls.Clear()
        $log = [Collections.Generic.List[string]]::new()
        $failure = ''
        $locationAfter = ''
        Push-Location -LiteralPath $Area.Integration
        try {
            . $Area.StartScript -Branch $Branch -ConfigPath $ConfigPath -WorkPath $WorkPath
            Invoke-StartDemand -ConfigPath $ConfigPath -Branch $Branch -WorkPath $WorkPath -CommandRunner $Area.Runner 6>&1 | ForEach-Object { $log.Add([string] $_) }
        }
        catch { $failure = $_.Exception.Message }
        finally { $locationAfter = (Get-Location).ProviderPath; Pop-Location }
        [pscustomobject]@{ Success = ($failure -eq ''); Error = $failure; Log = ($log -join "`n"); LocationAfter = $locationAfter }
    }

    function Test-Called {
        param($Area, [string] $Command)
        return @($Area.State.Calls | Where-Object { $_.Arguments[0] -eq $Command }).Count -gt 0
    }

    try {
        [void] [IO.Directory]::CreateDirectory($fixture)
        $area = New-TestArea 'principal'
        [void] (Invoke-TestGit $area.Root @('switch', '-c', 'demanda/anterior'))
        [IO.File]::WriteAllText((Join-Path $area.Root 'trabalho-anterior.txt'), "commit anterior preservado`n")
        [void] (Invoke-TestGit $area.Root @('add', '.'))
        [void] (Invoke-TestGit $area.Root @('commit', '-m', 'Trabalho da demanda anterior'))
        $previousHead = Invoke-TestGit $area.Root @('rev-parse', 'HEAD')
        [IO.File]::WriteAllText((Join-Path $area.Publisher 'fonte.pas'), "base publicada atualizada`n")
        [void] (Invoke-TestGit $area.Publisher @('add', '.'))
        [void] (Invoke-TestGit $area.Publisher @('commit', '-m', 'Base SVN simulada atualizada'))
        [void] (Invoke-TestGit $area.Publisher @('push', 'origin', 'main'))
        $remoteHead = Invoke-TestGit $area.Publisher @('rev-parse', 'HEAD')
        [void] [IO.Directory]::CreateDirectory((Join-Path $area.Root 'bpl'))
        [IO.File]::WriteAllText((Join-Path $area.Root 'bpl\dependencia.dll'), 'binario local preservado')
        $result = Invoke-TestStart $area
        if (-not $result.Success) { throw "$($result.Error)`n$($result.Log)" }
        Assert-Check $result.Success 'Inicia demanda no próprio clone com somente GitBranch configurada, sem IntegrationPath ou WorkPath'
        Assert-Check ($result.LocationAfter -eq $area.Integration -and @($area.State.Calls | Where-Object { $_.Directory -ne $area.Root }).Count -eq 0) 'Chamado de IntegrationPath, executa Git somente no WorkPath e preserva o diretório do terminal'
        Assert-Check ((Invoke-TestGit $area.Root @('branch', '--show-current')) -eq 'demanda/nova' -and (Invoke-TestGit $area.Root @('rev-parse', 'HEAD')) -eq $remoteHead) 'Nova branch fica ativa exatamente na base recebida de origin/main'
        Assert-Check ((Invoke-TestGit $area.Root @('rev-parse', 'main')) -eq $remoteHead -and (Invoke-TestGit $area.Root @('rev-parse', 'demanda/anterior')) -eq $previousHead) 'Main avança por fast-forward e a branch anterior mantém seus commits'
        Assert-Check ((Invoke-TestGit $area.Root @('show', 'HEAD:fonte.pas')) -eq 'base publicada atualizada' -and (Invoke-TestGit $area.Root @('rev-list', '--count', 'main..HEAD')) -eq '0') 'Usa os arquivos publicados, sem criar commit adicional'
        Assert-Check ([IO.File]::ReadAllText((Join-Path $area.Root 'bpl\dependencia.dll')) -eq 'binario local preservado') 'Arquivos ignorados que não colidem não bloqueiam e são preservados'
        Assert-Check (-not (Invoke-TestGit $area.Origin @('for-each-ref', '--format=%(refname)', 'refs/heads')).Contains('demanda/nova')) 'Branch criada fica somente local, sem push'
        Assert-Check ($result.Log.Contains($area.Root) -and $result.Log.Contains('demanda/nova') -and $result.Log.Contains($remoteHead)) 'Resumo informa pasta, branch e commit da base'
        Assert-Check ([IO.File]::ReadAllText((Join-Path $area.Integration 'preservar.txt')) -eq 'integracao sem alteracoes') 'Pasta de integração permanece intocada'

        $result = Invoke-TestStart $area
        Assert-Check (-not $result.Success -and -not (Test-Called $area fetch)) 'Branch local existente interrompe antes do fetch'
        foreach ($invalid in @('nome com espacos', '@{-1}')) {
            $result = Invoke-TestStart $area $invalid
            Assert-Check (-not $result.Success -and -not (Test-Called $area fetch)) "Nome inválido ou expressão de troca é rejeitado: $invalid"
        }
        $originalSource = [IO.File]::ReadAllText((Join-Path $area.Root 'fonte.pas'))
        [IO.File]::AppendAllText((Join-Path $area.Root 'fonte.pas'), "mudanca nao preparada`n")
        $result = Invoke-TestStart $area 'demanda/bloqueada'
        Assert-Check (-not $result.Success -and -not (Test-Called $area fetch) -and [IO.File]::ReadAllText((Join-Path $area.Root 'fonte.pas')).Contains('mudanca nao preparada')) 'Alterações não preparadas são preservadas e bloqueiam antes do fetch'
        [void] (Invoke-TestGit $area.Root @('add', 'fonte.pas'))
        $result = Invoke-TestStart $area 'demanda/bloqueada'
        Assert-Check (-not $result.Success -and (Invoke-TestGit $area.Root @('diff', '--cached', '--name-only')).Contains('fonte.pas')) 'Preparação existente no índice é preservada e bloqueia'
        [void] (Invoke-TestGit $area.Root @('reset', '--', 'fonte.pas')) # Somente fixture.
        [IO.File]::WriteAllText((Join-Path $area.Root 'fonte.pas'), $originalSource)
        [IO.File]::WriteAllText((Join-Path $area.Root 'novo.txt'), 'trabalho nao rastreado')
        $result = Invoke-TestStart $area 'demanda/bloqueada'
        Assert-Check (-not $result.Success -and -not (Test-Called $area fetch) -and [IO.File]::Exists((Join-Path $area.Root 'novo.txt'))) 'Arquivo não rastreado e não ignorado bloqueia sem ser apagado'
        [IO.File]::Delete((Join-Path $area.Root 'novo.txt'))
        $gitDirectory = Invoke-TestGit $area.Root @('rev-parse', '--absolute-git-dir')
        $marker = Join-Path $gitDirectory 'MERGE_HEAD'
        [IO.File]::WriteAllText($marker, "$remoteHead`n")
        $result = Invoke-TestStart $area 'demanda/bloqueada'
        Assert-Check (-not $result.Success -and -not (Test-Called $area fetch) -and [IO.File]::Exists($marker)) 'Merge em andamento bloqueia sem mexer na operação'
        [IO.File]::Delete($marker)
        [void] (Invoke-TestGit $area.Publisher @('branch', 'demanda/remota'))
        [void] (Invoke-TestGit $area.Publisher @('push', 'origin', 'demanda/remota'))
        $result = Invoke-TestStart $area 'demanda/remota'
        Assert-Check (-not $result.Success -and (Test-Called $area fetch) -and -not (Test-Called $area switch)) 'Branch remota existente é detectada após o fetch e antes de trocar de branch'
        $area.State.FailFetch = $true
        $result = Invoke-TestStart $area 'demanda/bloqueada'
        Assert-Check (-not $result.Success -and -not (Test-Called $area switch) -and (Invoke-TestGit $area.Root @('branch', '--show-current')) -eq 'demanda/nova') 'Falha de fetch preserva a branch ativa e não cria a demanda'
        $area.State.FailFetch = $false
        $area.State.ChangeAfterFetch = $true
        $result = Invoke-TestStart $area 'demanda/bloqueada'
        Assert-Check (-not $result.Success -and -not (Test-Called $area switch) -and [IO.File]::ReadAllText((Join-Path $area.Root 'fonte.pas')).Contains('alteracao concorrente')) 'Mudança de arquivos durante o fetch interrompe antes de trocar de branch'
        $area.State.ChangeAfterFetch = $false
        [IO.File]::WriteAllText((Join-Path $area.Root 'fonte.pas'), $originalSource)
        $area.State.FailCreate = $true
        $result = Invoke-TestStart $area 'demanda/bloqueada'
        Assert-Check (-not $result.Success -and $result.Error.Contains('foi atualizada para') -and (Invoke-TestGit $area.Root @('branch', '--show-current')) -eq 'main') 'Falha na criação informa que a main já foi atualizada, sem rollback automático'
        $area.State.FailCreate = $false

        $savedConfig = [IO.File]::ReadAllText($area.Config)
        [IO.File]::WriteAllText($area.Config, "@{ WorkPath='Z:\nao-existe'; IntegrationPath='Z:\tambem-nao-existe'; GitBranch='main' }")
        $result = Invoke-TestStart $area 'demanda/sem-dependencias-locais'
        Assert-Check ($result.Success -and @($area.State.Calls | Where-Object { $_.Directory -ne $area.Root }).Count -eq 0) 'Campos antigos de caminhos cruzados são ignorados, mesmo quando inválidos'
        [IO.File]::WriteAllText($area.Config, "@{ GitBranch='' }")
        $result = Invoke-TestStart $area
        Assert-Check (-not $result.Success -and $result.Error.Contains('GitBranch') -and $area.State.Calls.Count -eq 0) 'GitBranch explicitamente vazia interrompe antes de executar Git'
        [IO.File]::WriteAllText($area.Config, $savedConfig)
        $result = Invoke-TestStart $area -WorkPath $area.Integration
        Assert-Check (-not $result.Success -and $result.Error.Contains('working copy SVN') -and $area.State.Calls.Count -eq 0) 'Pasta SVN não pode ser alvo da demanda, sem precisar comparar IntegrationPath'
        [IO.File]::Delete($area.Config)
        $result = Invoke-TestStart $area 'demanda/sem-configuracao' -ConfigPath ''
        Assert-Check ($result.Success -and (Invoke-TestGit $area.Root @('branch', '--show-current')) -eq 'demanda/sem-configuracao') 'Sem arquivo pessoal, usa main no próprio clone'
        [IO.File]::WriteAllText($area.Config, $savedConfig)
        $result = Invoke-TestStart $area -ConfigPath (Join-Path $area.Base 'config-nao-existe.psd1')
        Assert-Check (-not $result.Success -and $area.State.Calls.Count -eq 0) 'ConfigPath explicitamente inexistente é diagnosticado antes de executar Git'
        [void] (Invoke-TestGit $area.Root @('remote', 'remove', 'origin'))
        $result = Invoke-TestStart $area 'demanda/bloqueada'
        Assert-Check (-not $result.Success -and -not (Test-Called $area switch)) 'Falta de origin interrompe antes de trocar de branch'
        [void] (Invoke-TestGit $area.Root @('remote', 'add', 'origin', $area.Origin))
        $engine = (Get-Process -Id $PID).Path
        Push-Location -LiteralPath $area.Integration
        try { $cliOutput = @(& $engine -NoLogo -NoProfile -File $area.IntegrationScript -WorkPath $area.Root -Branch 'demanda/cli' 2>&1) }
        finally { Pop-Location }
        Assert-Check ($LASTEXITCODE -eq 0 -and (Invoke-TestGit $area.Root @('branch', '--show-current')) -eq 'demanda/cli') 'Script da integração recebe clone por execução e lê somente a configuração desse clone'
        $cliOutput = @(& $engine -NoLogo -NoProfile -File $area.StartScript -Branch 'demanda/cli' 2>&1)
        Assert-Check ($LASTEXITCODE -eq 1 -and ($cliOutput -join "`n").Contains('já existe')) 'Entrada independente devolve código 1 e diagnóstico para branch existente'
        $cliOutput = @(& $engine -NoLogo -NoProfile -File $area.IntegrationScript -WorkPath $area.Integration -Branch 'demanda/nao-criar' 2>&1)
        Assert-Check ($LASTEXITCODE -eq 1 -and ($cliOutput -join "`n").Contains('working copy SVN')) 'Entrada independente rejeita a própria integração como alvo'
        $cliOutput = @('' | & $engine -NoLogo -NoProfile -File $area.IntegrationScript -Branch 'demanda/sem-alvo' 2>&1)
        Assert-Check ($LASTEXITCODE -eq 1 -and ($cliOutput -join "`n").Contains('Informe -WorkPath')) 'Integração sem seleção de clone não inicia demanda no próprio diretório'

        $firstHead = Invoke-TestGit $area.Root @('rev-parse', 'HEAD')
        $integrationConfigBefore = [IO.File]::ReadAllText($area.IntegrationConfig)
        $secondRoot = Join-Path $area.Base 'Segundo clone independente'
        [void] (Invoke-TestGit $area.Base @('clone', $area.Origin, $secondRoot))
        $secondScript = Join-Path $secondRoot '_automation\workflow\start-demand.ps1'
        [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $secondScript))
        Copy-Item -LiteralPath $scriptPath -Destination $secondScript
        $cliOutput = @(& $engine -NoLogo -NoProfile -File $secondScript -Branch 'demanda/cli' 2>&1)
        Assert-Check ($LASTEXITCODE -eq 0 -and (Invoke-TestGit $secondRoot @('branch', '--show-current')) -eq 'demanda/cli') 'Segundo clone funciona sem configuração nem referência à integração, com a mesma branch local do primeiro'
        $cliOutput = @(& $engine -NoLogo -NoProfile -File $area.IntegrationScript -WorkPath $secondRoot -Branch 'demanda/central-segundo' 2>&1)
        Assert-Check ($LASTEXITCODE -eq 0 -and (Invoke-TestGit $secondRoot @('branch', '--show-current')) -eq 'demanda/central-segundo') 'Uma integração pode escolher um segundo clone na próxima execução, sem lista de WorkPaths'
        Assert-Check ((Invoke-TestGit $area.Root @('rev-parse', 'HEAD')) -eq $firstHead -and [IO.File]::ReadAllText($area.IntegrationConfig) -eq $integrationConfigBefore) 'Vários clones não mudam a configuração da integração nem o trabalho dos demais'

        $ahead = New-TestArea 'main-com-trabalho-local'
        [IO.File]::WriteAllText((Join-Path $ahead.Root 'somente-local.txt'), 'commit que nao pode ser perdido')
        [void] (Invoke-TestGit $ahead.Root @('add', '.'))
        [void] (Invoke-TestGit $ahead.Root @('commit', '-m', 'Commit exclusivo da main local'))
        $aheadHead = Invoke-TestGit $ahead.Root @('rev-parse', 'HEAD')
        [void] (Invoke-TestGit $ahead.Root @('switch', '-c', 'demanda/atual'))
        $result = Invoke-TestStart $ahead
        Assert-Check (-not $result.Success -and -not (Test-Called $ahead switch) -and (Invoke-TestGit $ahead.Root @('rev-parse', 'main')) -eq $aheadHead) 'Main somente à frente interrompe sem remover seus commits ou trocar de branch'
        [IO.File]::WriteAllText((Join-Path $ahead.Publisher 'somente-remoto.txt'), 'outro commit remoto')
        [void] (Invoke-TestGit $ahead.Publisher @('add', '.'))
        [void] (Invoke-TestGit $ahead.Publisher @('commit', '-m', 'Commit remoto divergente'))
        [void] (Invoke-TestGit $ahead.Publisher @('push', 'origin', 'main'))
        $result = Invoke-TestStart $ahead
        Assert-Check (-not $result.Success -and -not (Test-Called $ahead switch) -and (Invoke-TestGit $ahead.Root @('branch', '--show-current')) -eq 'demanda/atual') 'Históricos divergentes interrompem antes da troca de branch'

        $collision = New-TestArea 'colisao-de-binario-ignorado'
        [void] [IO.Directory]::CreateDirectory((Join-Path $collision.Root 'bpl'))
        [IO.File]::WriteAllText((Join-Path $collision.Root 'bpl\dep.dll'), 'binario local importante')
        [void] [IO.Directory]::CreateDirectory((Join-Path $collision.Publisher 'bpl'))
        [IO.File]::WriteAllText((Join-Path $collision.Publisher 'bpl\dep.dll'), 'conteudo remoto')
        [void] (Invoke-TestGit $collision.Publisher @('add', '-f', 'bpl/dep.dll'))
        [void] (Invoke-TestGit $collision.Publisher @('commit', '-m', 'Novo caminho versionado antes ignorado'))
        [void] (Invoke-TestGit $collision.Publisher @('push', 'origin', 'main'))
        $beforeCollision = Invoke-TestGit $collision.Root @('rev-parse', 'main')
        $result = Invoke-TestStart $collision
        Assert-Check (-not $result.Success -and [IO.File]::ReadAllText((Join-Path $collision.Root 'bpl\dep.dll')) -eq 'binario local importante' -and (Invoke-TestGit $collision.Root @('rev-parse', 'main')) -eq $beforeCollision) 'Arquivo ignorado que seria sobrescrito interrompe o fast-forward e é preservado'
        $allCalls = @($area.State.AllCalls) + @($ahead.State.AllCalls) + @($collision.State.AllCalls)
        $unsafe = @($allCalls | Where-Object { $_.Arguments[0] -in @('reset', 'stash', 'clean', 'push', 'commit', 'clone') -or $_.Arguments -contains '--force' -or $_.Arguments -contains '--discard-changes' })
        Assert-Check ($unsafe.Count -eq 0 -and @($allCalls | Where-Object { $_.Directory -notin @($area.Root, $ahead.Root, $collision.Root) }).Count -eq 0) 'O comando opera somente nos clones de trabalho, sem reset, stash, limpeza, publicação ou criação de commits'

    }
    finally {
        $resolved = [IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase, [StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -like 'hwdesktop-start-demand-*' -and (Test-Path -LiteralPath $resolved)) {
            Remove-Item -LiteralPath $resolved -Recurse -Force
        }
    }
}

function Test-MenuLauncher {
    $ErrorActionPreference = 'Stop'
    $automation = $automationRoot
    $temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture = Join-Path $temporaryBase ('hwdesktop-menu-' + [guid]::NewGuid().ToString('N'))




    function Invoke-Launcher {
        param([string] $Launcher, [string] $Directory)
        $start = [Diagnostics.ProcessStartInfo]::new()
        $start.FileName = $env:ComSpec
        $start.Arguments = '/d /s /c ""' + $Launcher + '" -Preview -NoColor"'
        $start.WorkingDirectory = $Directory
        $start.UseShellExecute = $false
        $start.CreateNoWindow = $true
        $start.RedirectStandardOutput = $true
        $start.RedirectStandardError = $true
        $start.RedirectStandardInput = $true
        $process = [Diagnostics.Process]::new()
        $process.StartInfo = $start
        try {
            [void] $process.Start()
            $process.StandardInput.Close() # Evitar espera por pause se houver falha.
            $outputTask = $process.StandardOutput.ReadToEndAsync()
            $errorTask = $process.StandardError.ReadToEndAsync()
            $process.WaitForExit()
            [pscustomobject]@{ Code = $process.ExitCode; Output = $outputTask.GetAwaiter().GetResult(); Error = $errorTask.GetAwaiter().GetResult() }
        }
        finally { $process.Dispose() }
    }

    function Test-Directory {
        param($Result, [string] $Expected)
        return "CURRENT_DIRECTORY=$Expected" -in ($Result.Output -split '\r?\n')
    }

    try {
        $integration = Join-Path $fixture 'Integracao com espacos'
        $work = Join-Path $fixture 'Trabalho Git'
        $other = Join-Path $fixture 'Outro diretorio'
        [void] [IO.Directory]::CreateDirectory($other)
        foreach ($root in @($integration, $work)) {
            $directory = Join-Path $root '_automation'
            [void] [IO.Directory]::CreateDirectory($directory)
            Copy-Item -LiteralPath (Join-Path $automation 'menu.bat') -Destination (Join-Path $directory 'menu.bat')
            Copy-Item -LiteralPath (Join-Path $automation 'menu.ps1') -Destination (Join-Path $directory 'menu-real.ps1')
        $probe = @'
param([switch] $Preview, [switch] $NoColor)
Write-Output ('CURRENT_DIRECTORY=' + (Get-Location).ProviderPath)
Write-Output "PREVIEW=$Preview;NOCOLOR=$NoColor"
& (Join-Path $PSScriptRoot 'menu-real.ps1') -Preview:$Preview -NoColor:$NoColor
exit $LASTEXITCODE
'@
            [IO.File]::WriteAllText((Join-Path $directory 'menu.ps1'), $probe)
        }
        $integrationLauncher = Join-Path $integration '_automation\menu.bat'
        $workLauncher = Join-Path $work '_automation\menu.bat'
        $result = Invoke-Launcher $integrationLauncher (Join-Path $integration '_automation')
        if ($result.Code -ne 0) { throw "$($result.Error)`n$($result.Output)" }
        Assert-Check (Test-Directory $result $integration) 'BAT aberto na própria _automation usa a raiz da integração'
        Assert-Check ($result.Output.Contains('PREVIEW=True;NOCOLOR=True') -and $result.Output.Contains('Build / Deploy')) 'Encaminha parâmetros e abre o menu real em preview sem executar operações'
        $result = Invoke-Launcher $integrationLauncher $integration
        Assert-Check ($result.Code -eq 0 -and (Test-Directory $result $integration)) 'Chamada a partir da raiz da integração mantém a raiz'
        $result = Invoke-Launcher $workLauncher (Join-Path $work '_automation')
        Assert-Check ($result.Code -eq 0 -and (Test-Directory $result $work)) 'BAT do clone Git usa a própria raiz, sem redirecionar para integração'
        $result = Invoke-Launcher $integrationLauncher $work
        Assert-Check ($result.Code -eq 0 -and (Test-Directory $result $work)) 'BAT da integração chamado de WorkPath preserva WorkPath para a validação rejeitar'
        $result = Invoke-Launcher $integrationLauncher $other
        Assert-Check ($result.Code -eq 0 -and (Test-Directory $result $other)) 'Chamada de outro terminal não muda automaticamente para a integração'

    }
    finally {
        $resolved = [IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase, [StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -like 'hwdesktop-menu-*' -and (Test-Path -LiteralPath $resolved)) {
            Remove-Item -LiteralPath $resolved -Recurse -Force
        }
    }
}

function Test-MenuDiagnostics {
    $ErrorActionPreference = 'Stop'
    $PSNativeCommandUseErrorActionPreference = $false
    $menuFile = Join-Path $automationRoot 'menu.ps1'
    $ast = [Management.Automation.Language.Parser]::ParseFile($menuFile, [ref] $null, [ref] $null)
    $definition = $ast.Find({ param($node) $node -is [Management.Automation.Language.FunctionDefinitionAst] -and $node.Name -eq 'Invoke-MenuScript' }, $true)
    # Carrega somente o helper real, sem executar o menu interativo.
    . ([scriptblock]::Create($definition.Extent.Text))
    $engine = (Get-Process -Id $PID).Path
    $temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture = Join-Path $temporaryBase ('hwdesktop-diagnostics-' + [guid]::NewGuid().ToString('N'))




    try {
        [void] [IO.Directory]::CreateDirectory($fixture)
        $failureScript = Join-Path $fixture 'falha.ps1'
    $child = @'
Write-Output 'SAIDA_NORMAL_PRESERVADA'
[Console]::Error.WriteLine("Etapa 'Conferir contexto': ALTERACOES_LOCAIS`n_automation\README.md [modified]`n_automation\menu.bat [modified]`nEXECUCAO_INTERROMPIDA")
exit 1
'@
        [IO.File]::WriteAllText($failureScript, $child)
        foreach ($plain in @($true, $false)) {
            $captured = @(Invoke-MenuScript -Engine $engine -ScriptPath $failureScript -Plain:$plain 6>&1)
            $text = $captured -join "`n"
            Assert-Check ($captured[-1] -eq 1) "Propaga código da falha, modo sem cores: $plain"
            Assert-Check ($text.Contains('CONFIRA O MOTIVO ABAIXO') -and $text.Contains(('=' * 64))) "Diagnóstico tem título e separadores, modo sem cores: $plain"
            Assert-Check ($text.Contains('ALTERACOES_LOCAIS') -and $text.Contains('_automation\README.md [modified]') -and $text.Contains('_automation\menu.bat [modified]') -and $text.Contains('EXECUCAO_INTERROMPIDA')) "Preserva motivo, etapa e todos os arquivos, modo sem cores: $plain"
            Assert-Check ($text.Split('CONFIRA O MOTIVO ABAIXO').Length -eq 2) "Emite um único destaque para diagnóstico de várias linhas, modo sem cores: $plain"
            $yellowMessages = @($captured | Where-Object { $_ -is [System.Management.Automation.InformationRecord] -and $_.MessageData.ForegroundColor -eq [ConsoleColor]::Yellow })
            Assert-Check (($plain -and $yellowMessages.Count -eq 0) -or (-not $plain -and $yellowMessages.Count -gt 0)) "Aplica destaque amarelo somente quando cores estão habilitadas, modo sem cores: $plain"
        }
        $successScript = Join-Path $fixture 'sucesso.ps1'
        [IO.File]::WriteAllText($successScript, "Write-Output 'OPERACAO_OK'`nexit 0")
        $captured = @(Invoke-MenuScript -Engine $engine -ScriptPath $successScript -Plain 6>&1)
        Assert-Check ($captured[-1] -eq 0 -and -not (($captured -join "`n").Contains('CONFIRA O MOTIVO ABAIXO'))) 'Execução sem diagnóstico preserva código zero e não mostra aviso'

    }
    finally {
        $resolved = [IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase, [StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -like 'hwdesktop-diagnostics-*' -and (Test-Path -LiteralPath $resolved)) {
            Remove-Item -LiteralPath $resolved -Recurse -Force
        }
    }
}

$sections = @(
    @{ Group='Build'; Title='Compilação e publicação simuladas'; Action={ Test-Build } }
    @{ Group='Sync'; Title='Sincronização SVN/Git isolada'; Action={ Test-Sync } }
    @{ Group='Start'; Title='Início de demanda em clones locais'; Action={ Test-Start } }
    @{ Group='Menu'; Title='Lançador do menu'; Action={ Test-MenuLauncher } }
    @{ Group='Menu'; Title='Diagnósticos do menu'; Action={ Test-MenuDiagnostics } }
)
try {
    foreach ($section in $sections) {
        if ($Group -ne 'All' -and $Group -ne $section.Group) { continue }
        Write-Host "`n=== $($section.Title) ===" -ForegroundColor Cyan
        $before = $script:checks
        & $section.Action
        Write-Host "$($script:checks - $before) verificações concluídas neste grupo." -ForegroundColor Cyan
    }
    Write-Host "`nConcluído: $script:checks verificações. Somente ambiente temporário." -ForegroundColor Green
    exit 0
}
catch {
    [Console]::Error.WriteLine("Testes interrompidos: $($_.Exception.Message)")
    exit 1
}
