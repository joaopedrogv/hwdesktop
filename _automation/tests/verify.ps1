#Requires -Version 7.5
<#
.SYNOPSIS
    Testes das automações: build, sincronização, início de demanda e menu.
.DESCRIPTION
    Usa pastas temporárias e remotos Git locais. Delivery usa SVN local real e git-svn/WSL; os demais grupos simulam serviços.
    Não lê configurações pessoais ou segredos nem opera nos projetos reais.
.PARAMETER Group
    All executa tudo. Grupos: Build, Sync, SyncGitSvn, GitSvnAuth, ProcessEncoding, Start, Merge, Menu, Dependencies, Delivery.
#>
[CmdletBinding()]
param([ValidateSet('All', 'Build', 'Sync', 'Start', 'Menu', 'Dependencies', 'Merge', 'SyncGitSvn', 'Delivery', 'GitSvnAuth', 'ProcessEncoding')] [string] $Group = 'All')

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
        [void] [IO.Directory]::CreateDirectory((Join-Path $root '.svn'))
        $providerDirectory = Join-Path (Split-Path -Parent $syncScript) 'svn'
        [void] [IO.Directory]::CreateDirectory($providerDirectory)
        Copy-Item -LiteralPath (Join-Path $automationRoot 'workflow/svn/sync-integration.ps1') -Destination (Join-Path $providerDirectory 'sync-integration.ps1')
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
        Assert-Check (@($area.State.Calls | Where-Object { $_.Tool -eq 'git' -and $_.Arguments[0] -eq 'config' -and $_.Arguments[-1] -match '^user\.(name|email)$' }).Count -eq 0 -and -not (Test-Called $area git pull) -and -not (Test-Called $area git merge)) 'Não acrescenta validação de autoria, pull ou merge'
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

function Test-Dependencies {
    $scriptPath = Join-Path $automationRoot 'dependencies\pack-dependencies.ps1'
    $temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture = Join-Path $temporaryBase ('hwdesktop-pack-' + [guid]::NewGuid().ToString('N'))
    $inputRoot = Join-Path $fixture 'dependencies-files'
    $outputRoot = Join-Path $fixture 'dependencies'
    try {
        foreach ($relative in @('build/v0001', 'runtime/third-party', 'runtime/internal')) {
            [void][IO.Directory]::CreateDirectory((Join-Path $inputRoot $relative))
        }
        foreach ($relative in @('build/v0001/alpha.dcp', 'build/v0001/beta com espacos.dcp', 'runtime/third-party/vendor.dll', 'runtime/third-party/own-stable.exe', 'runtime/internal/hw.alpha.dll', 'runtime/internal/hw.beta.dll')) {
            [IO.File]::WriteAllText((Join-Path $inputRoot $relative), "conteudo de teste: $relative")
        }
        [IO.File]::WriteAllBytes((Join-Path $inputRoot 'build/v0001/dcp.txt'), [byte[]]@(1))
        $before = @(Get-ChildItem -LiteralPath $inputRoot -Recurse -File | Get-FileHash -Algorithm SHA256 | Sort-Object Path | ForEach-Object { "$($_.Path)=$($_.Hash)" })
        . $scriptPath -SourcePath $inputRoot -OutputPath $outputRoot
        Invoke-PackDependencies -SourcePath $inputRoot -OutputPath $outputRoot -Version 'v0001' 6>&1 | Out-Null
        Assert-Check ([IO.File]::Exists((Join-Path $outputRoot 'index.json'))) 'Publicação local gera índice sem acessar WebDAV'
        $zip = [IO.Compression.ZipFile]::OpenRead((Join-Path $outputRoot 'build/v0001/bundle.zip'))
        try {
            $names = @($zip.Entries | ForEach-Object FullName)
            Assert-Check ($names.Count -eq 3 -and 'dcp.txt' -in $names -and 'beta com espacos.dcp' -in $names -and -not ($names -match '^v0001/')) 'Build inclui todos os arquivos e normaliza a pasta de versão já existente'
        }
        finally { $zip.Dispose() }
        $zip = [IO.Compression.ZipFile]::OpenRead((Join-Path $outputRoot 'runtime/baseline/v0001/bundle.zip'))
        try { Assert-Check ($zip.Entries.Count -eq 2) 'Baseline agrupa os estáveis próprios e de terceiros sem reclassificar arquivos' }
        finally { $zip.Dispose() }
        Assert-Check ([IO.File]::Exists((Join-Path $outputRoot 'runtime/internal/hw.alpha/v0001/bundle.zip')) -and [IO.File]::Exists((Join-Path $outputRoot 'runtime/internal/hw.beta/v0001/bundle.zip'))) 'Cada binário interno recebe seu ZIP na pasta do módulo e da versão'
        $index = Get-Content -LiteralPath (Join-Path $outputRoot 'index.json') -Raw | ConvertFrom-Json
        $manifests = @($index.build, $index.runtime.baseline) + @($index.runtime.internal)
        $valid = $true
        foreach ($relative in $manifests) {
            $manifestPath = Join-Path $outputRoot $relative
            $manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
            $artifact = Join-Path (Split-Path -Parent $manifestPath) $manifest.artifact.path
            if ((Get-FileHash -LiteralPath $artifact -Algorithm SHA256).Hash.ToLowerInvariant() -ne $manifest.artifact.sha256 -or [IO.FileInfo]::new($artifact).Length -ne $manifest.artifact.size) { $valid = $false }
            if ($manifest.artifact.path -cne 'bundle.zip') { $valid = $false }
            $zip = [IO.Compression.ZipFile]::OpenRead($artifact)
            try {
                if ($zip.Entries.Count -ne @($manifest.files).Count) { $valid = $false }
                foreach ($entry in $zip.Entries) {
                    $record = @($manifest.files | Where-Object { $_.path -ceq $entry.FullName })
                    $stream = $entry.Open()
                    $sha = [Security.Cryptography.SHA256]::Create()
                    try { $hash = [Convert]::ToHexString($sha.ComputeHash($stream)).ToLowerInvariant() }
                    finally { $stream.Dispose(); $sha.Dispose() }
                    if ($record.Count -ne 1 -or $hash -ne $record[0].sha256 -or $entry.Length -ne $record[0].size) { $valid = $false }
                    $sourceDirectory = switch ($manifest.id) {
                        'build' { Join-Path $inputRoot 'build/v0001' }
                        'baseline' { Join-Path $inputRoot 'runtime/third-party' }
                        default { Join-Path $inputRoot 'runtime/internal' }
                    }
                    $original = Join-Path $sourceDirectory $entry.FullName
                    if ((Get-FileHash -LiteralPath $original -Algorithm SHA256).Hash.ToLowerInvariant() -ne $hash) { $valid = $false }
                }
            }
            finally { $zip.Dispose() }
            if ([IO.File]::ReadAllText($manifestPath).Contains($inputRoot)) { $valid = $false }
        }
        Assert-Check ($valid -and $manifests.Count -eq 4) 'Todos os itens usam ZIPs com conteúdo original, hashes/tamanhos válidos e caminhos relativos'
        Assert-Check (@(Get-ChildItem -LiteralPath $outputRoot -Recurse -File -Filter *.dll).Count -eq 0) 'Publicação não deixa DLLs soltas ao lado dos ZIPs'
        $after = @(Get-ChildItem -LiteralPath $inputRoot -Recurse -File | Get-FileHash -Algorithm SHA256 | Sort-Object Path | ForEach-Object { "$($_.Path)=$($_.Hash)" })
        Assert-Check (($before -join '|') -ceq ($after -join '|')) 'Empacotamento preserva todos os arquivos de origem byte a byte'

        $indexHash = (Get-FileHash -LiteralPath (Join-Path $outputRoot 'index.json')).Hash
        $failed = $false
        try { Invoke-PackDependencies $inputRoot $outputRoot 'v0001' 6>&1 | Out-Null } catch { $failed = $true }
        Assert-Check ($failed -and (Get-FileHash -LiteralPath (Join-Path $outputRoot 'index.json')).Hash -eq $indexHash) 'Saída existente é recusada sem substituir uma publicação'
        $nested = Join-Path $inputRoot 'output'
        $failed = $false
        try { Invoke-PackDependencies $inputRoot $nested 'v0001' 6>&1 | Out-Null } catch { $failed = $true }
        Assert-Check ($failed -and -not [IO.Directory]::Exists($nested)) 'Saída dentro da origem é recusada sem criar pastas'
        $failed = $false
        try { Invoke-PackDependencies $inputRoot $inputRoot 'v0001' 6>&1 | Out-Null } catch { $failed = $true }
        Assert-Check $failed 'Origem e saída iguais são recusadas'
        $failed = $false
        try { Invoke-PackDependencies $inputRoot (Join-Path $fixture 'invalid-version') '../fora' 6>&1 | Out-Null } catch { $failed = $true }
        Assert-Check ($failed -and -not [IO.Directory]::Exists((Join-Path $fixture 'invalid-version'))) 'Versão não pode conter travessia de diretórios'

        $duplicate = Join-Path $inputRoot 'runtime/internal/outro/hw.alpha.dll'
        [void][IO.Directory]::CreateDirectory((Split-Path -Parent $duplicate))
        [IO.File]::WriteAllText($duplicate, 'outro arquivo de mesmo modulo')
        $failed = $false
        try { Invoke-PackDependencies $inputRoot (Join-Path $fixture 'duplicate') 'v0001' 6>&1 | Out-Null } catch { $failed = $true }
        Assert-Check ($failed -and -not [IO.Directory]::Exists((Join-Path $fixture 'duplicate'))) 'Módulos duplicados são recusados sem sobrescrever arquivos'
        [IO.File]::Delete($duplicate)

        $missing = Join-Path $fixture 'missing-source'
        [void][IO.Directory]::CreateDirectory((Join-Path $missing 'build'))
        [IO.File]::WriteAllText((Join-Path $missing 'build/a.dcp'), 'a')
        $failed = $false
        try { Invoke-PackDependencies $missing (Join-Path $fixture 'missing-output') 'v0001' 6>&1 | Out-Null } catch { $failed = $true }
        Assert-Check ($failed -and -not [IO.Directory]::Exists((Join-Path $fixture 'missing-output'))) 'Conjunto obrigatório ausente interrompe antes de publicar'
        Assert-Check (@(Get-ChildItem -LiteralPath $fixture -Directory | Where-Object Name -Like '*.staging-*').Count -eq 0) 'Não deixa áreas de publicação temporárias após concluir ou recusar entradas'
    }
    finally {
        $resolved = [IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase, [StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -like 'hwdesktop-pack-*' -and [IO.Directory]::Exists($resolved)) {
            Remove-Item -LiteralPath $resolved -Recurse -Force
        }
    }
}

function Test-PrepareDependencies {
    $temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture = Join-Path $temporaryBase ('hwdesktop-prepare-' + [guid]::NewGuid().ToString('N'))
    $payload = Join-Path $fixture 'source'
    $remote = Join-Path $fixture 'remote'
    $pack = Join-Path $automationRoot 'dependencies\pack-dependencies.ps1'
    $prepare = Join-Path $automationRoot 'workflow\prepare-dependencies.ps1'

    function New-ClientArea {
        param([string] $Name)
        $root = Join-Path $fixture $Name
        foreach ($relative in @('.git', '_automation/config', 'bpl')) { [void] [IO.Directory]::CreateDirectory((Join-Path $root $relative)) }
        [IO.File]::WriteAllText((Join-Path $root 'bpl/preservar.rpt'), 'arquivo local fora dos pacotes')
        $config = Join-Path $root '_automation/config/dependencies.local.psd1'
        [IO.File]::WriteAllText($config, "@{ WebDavUrl='https://nextcloud.invalid/remote.php/dav/files/test'; RemoteDirectory='hwdesktop/dependencies'; SecretsFile='segredos.md' }")
        [IO.File]::WriteAllText((Join-Path $root '_automation/config/segredos.md'), "NEXTCLOUD_USER=test" + [Environment]::NewLine + "NEXTCLOUD_PASS=ficticia=abc:123")
        $state = @{ Calls = [Collections.Generic.List[string]]::new(); FailPath = ''; ChangePath = '' }
        $remoteRoot = $remote
        $download = {
            param($Relative, $Destination)
            $state.Calls.Add($Relative)
            if ($Relative -eq $state.FailPath) { throw 'Falha simulada ficticia=abc:123' }
            [IO.File]::Copy((Join-Path $remoteRoot $Relative), $Destination, $true)
            if ($state.ChangePath -and $Relative.EndsWith('/bundle.zip')) {
                [IO.File]::WriteAllText($state.ChangePath, 'alteracao concorrente')
            }
        }.GetNewClosure()
        [pscustomobject]@{ Root = $root; Config = $config; State = $state; Download = $download }
    }
    function Invoke-TestPrepare {
        param($Area, [scriptblock] $ApplyFile)
        $log = [Collections.Generic.List[string]]::new()
        $errorText = ''
        $Area.State.Calls.Clear()
        try {
            Invoke-PrepareDependencies -WorkPath $Area.Root -ConfigPath $Area.Config -DownloadFile $Area.Download -ApplyFile $ApplyFile 6>&1 | ForEach-Object { $log.Add([string] $_) }
        }
        catch { $errorText = $_.Exception.Message }
        [pscustomobject]@{ Success = ($errorText -eq ''); Error = $errorText; Log = ($log -join [Environment]::NewLine) }
    }
    try {
        foreach ($relative in @('build', 'runtime/baseline', 'runtime/internal')) { [void] [IO.Directory]::CreateDirectory((Join-Path $payload $relative)) }
        foreach ($relative in @('build/a.dcp', 'build/b.dcp', 'runtime/baseline/vendor.dll', 'runtime/baseline/stable.exe', 'runtime/internal/hw.alpha.dll', 'runtime/internal/hw.beta.dll')) {
            [IO.File]::WriteAllText((Join-Path $payload $relative), "original $relative")
            [IO.File]::SetLastWriteTime((Join-Path $payload $relative), [datetime]::new(2023, 2, 3, 10, 20, 30))
        }
        . $pack -SourcePath $payload -OutputPath $remote
        Invoke-PackDependencies $payload $remote 'v0001' 6>&1 | Out-Null
        . $prepare
        $area = New-ClientArea 'clone'
        $result = Invoke-TestPrepare $area
        if (-not $result.Success) { throw $result.Error }
        Assert-Check ([IO.File]::ReadAllText((Join-Path $area.Root 'dcp/a.dcp')) -eq 'original build/a.dcp') 'Build do repositório remoto é aplicado em dcp'
        Assert-Check ([IO.File]::ReadAllText((Join-Path $area.Root 'bpl/vendor.dll')) -eq 'original runtime/baseline/vendor.dll' -and [IO.File]::ReadAllText((Join-Path $area.Root 'bpl/hw.alpha.dll')) -eq 'original runtime/internal/hw.alpha.dll') 'Baseline e módulos internos usam o mesmo fluxo ZIP e são aplicados em bpl'
        Assert-Check (@($area.State.Calls | Where-Object { $_.EndsWith('bundle.zip') }).Count -eq 4 -and [IO.File]::Exists((Join-Path $area.Root '_automation/temp/dependencies/last-applied.json'))) 'Primeira execução obtém os quatro pacotes e registra a composição aplicada'
        $datesPreserved = $true
        foreach ($pair in @(@('build/a.dcp','dcp/a.dcp'), @('runtime/baseline/vendor.dll','bpl/vendor.dll'), @('runtime/internal/hw.alpha.dll','bpl/hw.alpha.dll'))) {
            if ([IO.File]::GetLastWriteTime((Join-Path $area.Root $pair[1])) -ne [IO.File]::GetLastWriteTime((Join-Path $payload $pair[0]))) { $datesPreserved = $false }
        }
        Assert-Check $datesPreserved 'Extração e aplicação preservam a data histórica do ZIP em build, baseline e módulo interno'
        $dateFile = Join-Path $area.Root 'bpl/vendor.dll'
        [IO.File]::SetLastWriteTimeUtc($dateFile, [datetime]::UtcNow)
        $result = Invoke-TestPrepare $area -ApplyFile { throw 'Não deveria recopiar conteúdo idêntico' }
        Assert-Check ($result.Success -and [IO.File]::GetLastWriteTime($dateFile) -eq [IO.File]::GetLastWriteTime((Join-Path $payload 'runtime/baseline/vendor.dll')) -and @($area.State.Calls | Where-Object { $_.EndsWith('bundle.zip') }).Count -eq 0) 'Corrige somente a data de arquivo já aplicado sem recopiar conteúdo nem baixar ZIP do cache'
        Assert-Check ([IO.File]::ReadAllText((Join-Path $area.Root 'bpl/preservar.rpt')) -eq 'arquivo local fora dos pacotes') 'Arquivos que não pertencem aos pacotes permanecem intactos'
        $timestamp = [IO.File]::GetLastWriteTimeUtc((Join-Path $area.Root 'bpl/vendor.dll'))
        $result = Invoke-TestPrepare $area
        Assert-Check ($result.Success -and @($area.State.Calls | Where-Object { $_.EndsWith('bundle.zip') }).Count -eq 0 -and [IO.File]::GetLastWriteTimeUtc((Join-Path $area.Root 'bpl/vendor.dll')) -eq $timestamp) 'Reexecução confere a composição sem baixar ZIPs ou copiar arquivos já corretos'
        [IO.File]::WriteAllText((Join-Path $area.Root 'dcp/a.dcp'), 'versao local antiga')
        $result = Invoke-TestPrepare $area
        Assert-Check ($result.Success -and @($area.State.Calls | Where-Object { $_.EndsWith('bundle.zip') }).Count -eq 0 -and [IO.File]::ReadAllText((Join-Path $area.Root 'dcp/a.dcp')) -eq 'original build/a.dcp') 'Arquivo diferente é sobrescrito sem confirmação usando o cache validado'
        $indexPath = Join-Path $remote 'index.json'
        $originalIndex = [IO.File]::ReadAllText($indexPath)
        $index = $originalIndex | ConvertFrom-Json
        $buildManifestPath = Join-Path $remote $index.build
        $buildManifest = Get-Content -LiteralPath $buildManifestPath -Raw | ConvertFrom-Json
        $buildArchive = Join-Path (Split-Path -Parent $buildManifestPath) 'bundle.zip'
        $cacheArchive = Join-Path $area.Root ("_automation/temp/dependencies/cache/" + $buildManifest.artifact.sha256 + '.zip')
        [IO.File]::WriteAllText($cacheArchive, 'cache corrompido')
        [IO.File]::WriteAllText((Join-Path $area.Root 'dcp/a.dcp'), 'antigo novamente')
        $result = Invoke-TestPrepare $area
        Assert-Check ($result.Success -and @($area.State.Calls | Where-Object { $_.EndsWith('bundle.zip') }).Count -eq 1) 'Cache corrompido é baixado novamente antes da aplicação'
        $area.State.FailPath = 'index.json'
        $result = Invoke-TestPrepare $area
        Assert-Check (-not $result.Success -and -not $result.Error.Contains('ficticia=abc:123') -and -not $result.Log.Contains('ficticia=abc:123')) 'Falha de transporte mascara a senha e não exibe credenciais'
        $area.State.FailPath = ''

        $index.build = '../outside.json'
        [IO.File]::WriteAllText($indexPath, (ConvertTo-Json $index -Depth 10))
        $bad = New-ClientArea 'index-invalido'
        $result = Invoke-TestPrepare $bad
        Assert-Check (-not $result.Success -and $bad.State.Calls.Count -eq 1 -and -not [IO.Directory]::Exists((Join-Path $bad.Root 'dcp'))) 'Referência com travessia no índice é recusada antes de baixar manifestos ou aplicar arquivos'
        [IO.File]::WriteAllText($indexPath, $originalIndex)
        $index = $originalIndex | ConvertFrom-Json
        $moduleManifestPath = Join-Path $remote $index.runtime.internal[0]
        $originalManifest = [IO.File]::ReadAllText($moduleManifestPath)
        $manifest = $originalManifest | ConvertFrom-Json
        $manifest.files[0].path = '../outside.dll'
        [IO.File]::WriteAllText($moduleManifestPath, (ConvertTo-Json $manifest -Depth 10))
        $bad = New-ClientArea 'manifesto-invalido'
        $result = Invoke-TestPrepare $bad
        Assert-Check (-not $result.Success -and @($bad.State.Calls | Where-Object { $_.EndsWith('bundle.zip') }).Count -eq 0 -and -not [IO.Directory]::Exists((Join-Path $bad.Root 'dcp'))) 'Destino com travessia no manifesto é recusado sem baixar pacotes ou alterar destinos'
        [IO.File]::WriteAllText($moduleManifestPath, $originalManifest)

        $originalArchive = [IO.File]::ReadAllBytes($buildArchive)
        [IO.File]::WriteAllBytes($buildArchive, [byte[]]($originalArchive + [byte] 1))
        $bad = New-ClientArea 'zip-corrompido'
        $result = Invoke-TestPrepare $bad
        Assert-Check (-not $result.Success -and -not [IO.Directory]::Exists((Join-Path $bad.Root 'dcp')) -and -not [IO.File]::Exists((Join-Path $bad.Root 'bpl/vendor.dll'))) 'ZIP com tamanho/hash divergente interrompe antes de aplicar qualquer arquivo'
        [IO.File]::WriteAllBytes($buildArchive, $originalArchive)

        $moduleArchive = Join-Path (Split-Path -Parent $moduleManifestPath) 'bundle.zip'
        $originalModuleArchive = [IO.File]::ReadAllBytes($moduleArchive)
        [IO.File]::Delete($moduleArchive)
        $zip = [IO.Compression.ZipFile]::Open($moduleArchive, [IO.Compression.ZipArchiveMode]::Create)
        try {
            $entry = $zip.CreateEntry('../outside.dll')
            $writer = [IO.StreamWriter]::new($entry.Open())
            try { $writer.Write('nao deve ser extraido') } finally { $writer.Dispose() }
        }
        finally { $zip.Dispose() }
        $manifest = $originalManifest | ConvertFrom-Json
        $manifest.artifact.size = [IO.FileInfo]::new($moduleArchive).Length
        $manifest.artifact.sha256 = (Get-FileHash -LiteralPath $moduleArchive -Algorithm SHA256).Hash.ToLowerInvariant()
        [IO.File]::WriteAllText($moduleManifestPath, (ConvertTo-Json $manifest -Depth 10))
        $bad = New-ClientArea 'zip-traversal'
        $result = Invoke-TestPrepare $bad
        Assert-Check (-not $result.Success -and -not [IO.Directory]::Exists((Join-Path $bad.Root 'dcp')) -and -not [IO.File]::Exists((Join-Path $bad.Root 'outside.dll'))) 'Travessia dentro do ZIP é rejeitada mesmo com hash externo válido'
        [IO.File]::WriteAllBytes($moduleArchive, $originalModuleArchive)
        [IO.File]::WriteAllText($moduleManifestPath, $originalManifest)

        $manifest = $originalManifest | ConvertFrom-Json
        $manifest.files[0].path = 'vendor.dll'
        [IO.File]::WriteAllText($moduleManifestPath, (ConvertTo-Json $manifest -Depth 10))
        $bad = New-ClientArea 'destino-duplicado'
        $result = Invoke-TestPrepare $bad
        Assert-Check (-not $result.Success -and $result.Error.Contains('Destino repetido') -and -not [IO.Directory]::Exists((Join-Path $bad.Root 'dcp'))) 'Itens diferentes não podem anunciar o mesmo destino de runtime'
        [IO.File]::WriteAllText($moduleManifestPath, $originalManifest)

        $a = Join-Path $area.Root 'dcp/a.dcp'
        $b = Join-Path $area.Root 'dcp/b.dcp'
        [IO.File]::WriteAllText($a, 'anterior A')
        [IO.File]::WriteAllText($b, 'anterior B')
        [IO.File]::SetLastWriteTimeUtc($a, [datetime]::new(2024, 5, 6, 7, 8, 9, [DateTimeKind]::Utc).AddTicks(12345))
        [IO.File]::SetLastWriteTimeUtc($b, [datetime]::new(2025, 6, 7, 8, 9, 10, [DateTimeKind]::Utc).AddTicks(67890))
        $previousTimeA = [IO.File]::GetLastWriteTimeUtc($a)
        $previousTimeB = [IO.File]::GetLastWriteTimeUtc($b)
        $copyState = @{ Count = 0 }
        $failCopy = {
            param($Source, $Destination)
            $copyState.Count++
            if ($copyState.Count -eq 2) { [IO.File]::WriteAllText($Destination, 'copia parcial'); throw 'falha de copia simulada' }
            [IO.File]::Copy($Source, $Destination, $true)
        }.GetNewClosure()
        $result = Invoke-TestPrepare $area -ApplyFile $failCopy
        Assert-Check (-not $result.Success -and [IO.File]::ReadAllText($a) -eq 'anterior A' -and [IO.File]::ReadAllText($b) -eq 'anterior B') 'Falha durante a aplicação restaura inclusive o arquivo que ficou parcialmente copiado'
        Assert-Check ([IO.File]::GetLastWriteTimeUtc($a) -eq $previousTimeA -and [IO.File]::GetLastWriteTimeUtc($b) -eq $previousTimeB) 'Restauração após cópia parcial preserva também as datas anteriores dos dois arquivos'
        $result = Invoke-TestPrepare $area
        Assert-Check ($result.Success -and [IO.File]::ReadAllText($b) -eq 'original build/b.dcp') 'Após a falha corrigida, nova execução conclui normalmente sem perguntas'

        $concurrent = New-ClientArea 'alteracao-concorrente'
        [void] [IO.Directory]::CreateDirectory((Join-Path $concurrent.Root 'dcp'))
        $concurrent.State.ChangePath = Join-Path $concurrent.Root 'dcp/a.dcp'
        [IO.File]::WriteAllText($concurrent.State.ChangePath, 'antes')
        $result = Invoke-TestPrepare $concurrent
        Assert-Check (-not $result.Success -and [IO.File]::ReadAllText($concurrent.State.ChangePath) -eq 'alteracao concorrente' -and -not [IO.File]::Exists((Join-Path $concurrent.Root 'bpl/vendor.dll'))) 'Alteração local durante o download é preservada antes de qualquer aplicação'
        $svn = New-ClientArea 'pasta-svn'
        [void] [IO.Directory]::CreateDirectory((Join-Path $svn.Root '.svn'))
        $result = Invoke-TestPrepare $svn
        Assert-Check (-not $result.Success -and $svn.State.Calls.Count -eq 0) 'Pasta SVN não recebe dependências nem exige conhecer um IntegrationPath'
        Assert-Check (@(Get-ChildItem -LiteralPath (Join-Path $area.Root '_automation/temp/dependencies') -Directory -Filter 'run-*').Count -eq 0) 'Remove áreas temporárias e mantém somente cache e registro da aplicação'
    }
    finally {
        $resolved = [IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase, [StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -match '^hwdesktop-prepare-[a-f0-9]{32}$' -and [IO.Directory]::Exists($resolved)) {
            Remove-Item -LiteralPath $resolved -Recurse -Force
        }
    }
}

function Test-Merge {
    $temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture = Join-Path $temporaryBase ('hwdesktop-merge-' + [guid]::NewGuid().ToString('N'))
    $scriptPath = Join-Path $automationRoot 'workflow\merge-demand.ps1'
    . $scriptPath
    function Invoke-TestGit {
        param([string] $Directory, [string[]] $Arguments)
        $result = Invoke-MergeProcess $Arguments $Directory
        if ($result.ExitCode -ne 0) { throw "Git do teste: $($result.Error) $($result.Output)" }
        return $result.Output.TrimEnd()
    }
    function Save-TestCommit {
        param([string] $Root, [string] $Name, [string] $Content)
        [IO.File]::WriteAllText((Join-Path $Root $Name), $Content)
        [void] (Invoke-TestGit $Root @('add', '--', $Name))
        [void] (Invoke-TestGit $Root @('commit', '-m', "Alterar $Name"))
        return Invoke-TestGit $Root @('rev-parse', 'HEAD')
    }
    function New-MergeArea {
        param([string] $Name)
        $base = Join-Path $fixture $Name
        $publisher = Join-Path $base 'Publicador'
        $root = Join-Path $base 'Clone de trabalho'
        $origin = Join-Path $base 'origin.git'
        [void] [IO.Directory]::CreateDirectory($publisher)
        [void] (Invoke-TestGit $base @('init', '--bare', '--initial-branch=main', $origin))
        [void] (Invoke-TestGit $publisher @('init', '--initial-branch=main'))
        [void] (Invoke-TestGit $publisher @('config', 'user.name', 'Teste merge'))
        [void] (Invoke-TestGit $publisher @('config', 'user.email', 'teste@example.invalid'))
        [void] (Invoke-TestGit $publisher @('remote', 'add', 'origin', $origin))
        [IO.File]::WriteAllLines((Join-Path $publisher '.gitignore'), [string[]] @('bpl/','_automation/'))
        [void] (Save-TestCommit $publisher 'fonte.pas' 'base')
        [void] (Invoke-TestGit $publisher @('add', '.gitignore'))
        [void] (Invoke-TestGit $publisher @('commit', '-m', 'Exclusoes locais'))
        [void] (Invoke-TestGit $publisher @('push', 'origin', 'main'))
        [void] (Invoke-TestGit $base @('clone', $origin, $root))
        [void] (Invoke-TestGit $root @('config', 'user.name', 'Teste merge'))
        [void] (Invoke-TestGit $root @('config', 'user.email', 'teste@example.invalid'))
        [void] (Invoke-TestGit $root @('switch', '-c', 'demanda/local'))
        $demand = Save-TestCommit $root 'demanda.txt' 'somente no clone'
        $copy = Join-Path $root '_automation/workflow/merge-demand.ps1'
        [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $copy))
        [IO.File]::Copy($scriptPath, $copy)
        $state = @{ Calls = [Collections.Generic.List[object]]::new(); FailPull = $false; ChangeAfterPull = $false }
        $nativeProcess = (Get-Command Invoke-MergeProcess -CommandType Function).ScriptBlock
        $runner = {
            param($Arguments, $Directory)
            $state.Calls.Add([pscustomobject]@{ Arguments = @($Arguments); Directory = $Directory })
            if ($state.FailPull -and $Arguments[0] -eq 'pull') {
                return [pscustomobject]@{ ExitCode=1; Output=''; Error='Falha de pull simulada' }
            }
            if ($state.ChangeAfterPull -and $Arguments[0] -eq 'pull') {
                $result = & $nativeProcess $Arguments $Directory
                [IO.File]::AppendAllText((Join-Path $Directory 'fonte.pas'), 'mudou durante o pull')
                return $result
            }
            return $null
        }.GetNewClosure()
        [pscustomobject]@{ Root=$root; Publisher=$publisher; Origin=$origin; Script=$copy; State=$state; Runner=$runner; Demand=$demand }
    }
    function Invoke-TestMerge {
        param($Area, [string] $Branch = '', [string] $WorkPath = '', [string] $ConfigPath = '')
        $Area.State.Calls.Clear()
        $log = [Collections.Generic.List[string]]::new()
        $failure = ''
        . $Area.Script -Branch $Branch -WorkPath $WorkPath -ConfigPath $ConfigPath
        try {
            Invoke-MergeDemand -Branch $Branch -WorkPath $WorkPath -ConfigPath $ConfigPath -CommandRunner $Area.Runner 6>&1 | ForEach-Object { $log.Add([string] $_) }
        }
        catch { $failure = $_.Exception.Message }
        [pscustomobject]@{ Success=($failure -eq ''); Error=$failure; Log=($log -join [Environment]::NewLine) }
    }
    function Test-MergeCalled {
        param($Area, [string] $Name)
        return @($Area.State.Calls | Where-Object { $_.Arguments[0] -eq $Name }).Count -gt 0
    }

    try {
        $area = New-MergeArea 'principal'
        $remote = Save-TestCommit $area.Publisher 'svn.txt' 'mudanca SVN publicada'
        [void] (Invoke-TestGit $area.Publisher @('push', 'origin', 'main'))
        [void] [IO.Directory]::CreateDirectory((Join-Path $area.Root 'bpl'))
        [IO.File]::WriteAllText((Join-Path $area.Root 'bpl/local.dll'), 'binario ignorado')
        [void] (Invoke-TestGit $area.Root @('config', 'pull.rebase', 'true'))
        [void] (Invoke-TestGit $area.Root @('config', 'merge.ff', 'only'))
        $result = Invoke-TestMerge $area
        Assert-Check $result.Success 'Usa a branch atual e o próprio clone, sem configuração ou caminhos cruzados'
        Assert-Check ((Invoke-TestGit $area.Root @('branch','--show-current')) -eq 'main' -and [IO.File]::Exists((Join-Path $area.Root 'svn.txt')) -and [IO.File]::Exists((Join-Path $area.Root 'demanda.txt'))) 'Atualiza a main com a nova base publicada e incorpora a demanda local'
        $parents = (Invoke-TestGit $area.Root @('rev-list','--parents','-n','1','HEAD')) -split ' '
        Assert-Check ($parents.Count -eq 3 -and $parents[1] -eq $remote -and $parents[2] -eq $area.Demand) 'Divergência entre base e demanda gera commit de merge com os dois históricos'
        Assert-Check ((Invoke-TestGit $area.Root @('rev-parse','demanda/local')) -eq $area.Demand) 'Branch da demanda e seus commits sem push são preservados'
        Assert-Check ((Invoke-TestGit $area.Origin @('rev-parse','main')) -eq $remote) 'Merge não publica a main nem a branch da demanda'
        Assert-Check ((Invoke-TestGit $area.Root @('status','--porcelain')) -eq '' -and [IO.File]::ReadAllText((Join-Path $area.Root 'bpl/local.dll')) -eq 'binario ignorado') 'Conclui com worktree limpo e preserva binários ignorados sem colisão'
        $commands = @($area.State.Calls | ForEach-Object { $_.Arguments[0] })
        $pullCalls = @($area.State.Calls | Where-Object { $_.Arguments[0] -eq 'pull' })
        Assert-Check ($pullCalls.Count -eq 1 -and '--ff-only' -in $pullCalls[0].Arguments -and '--no-rebase' -in $pullCalls[0].Arguments -and $pullCalls[0].Arguments[-2] -eq 'origin' -and $pullCalls[0].Arguments[-1] -eq 'main' -and 'fetch' -notin $commands) 'Usa um pull --ff-only origin main, sem fetch separado ou rebase'
        Assert-Check (@($commands | Where-Object { $_ -in @('reset','stash','clean','push','rebase') }).Count -eq 0 -and $result.Log.Contains('Revise e valide antes de publicar')) 'Não executa recuperação ou publicação e orienta a validação manual'

        $dirty = New-MergeArea 'pendencias'
        [IO.File]::AppendAllText((Join-Path $dirty.Root 'fonte.pas'), 'pendente')
        $result = Invoke-TestMerge $dirty
        Assert-Check (-not $result.Success -and -not (Test-MergeCalled $dirty 'switch') -and (Invoke-TestGit $dirty.Root @('branch','--show-current')) -eq 'demanda/local' -and $result.Log.Contains('fonte.pas')) 'Mudança local bloqueia antes da troca e exibe o arquivo'
        [void] (Invoke-TestGit $dirty.Root @('add','fonte.pas'))
        $indexBefore = Invoke-TestGit $dirty.Root @('diff','--cached')
        $result = Invoke-TestMerge $dirty
        Assert-Check (-not $result.Success -and -not (Test-MergeCalled $dirty 'pull') -and (Invoke-TestGit $dirty.Root @('diff','--cached')) -eq $indexBefore) 'Índice preparado é preservado e impede atualização'
        [void] (Invoke-TestGit $dirty.Root @('restore','--staged','--worktree','fonte.pas'))
        [IO.File]::WriteAllText((Join-Path $dirty.Root 'novo.txt'), 'nao versionado')
        $result = Invoke-TestMerge $dirty
        Assert-Check (-not $result.Success -and -not (Test-MergeCalled $dirty 'switch') -and [IO.File]::Exists((Join-Path $dirty.Root 'novo.txt'))) 'Arquivo não rastreado e não ignorado bloqueia sem exclusão'
        [IO.File]::Delete((Join-Path $dirty.Root 'novo.txt'))
        foreach ($name in @('inexistente','@{-1}','main')) {
            $result = Invoke-TestMerge $dirty -Branch $name
            Assert-Check (-not $result.Success -and -not (Test-MergeCalled $dirty 'switch')) "Branch inválida ou inadequada é recusada: $name"
        }
        $result = Invoke-TestMerge $dirty -ConfigPath (Join-Path $dirty.Root 'ausente.psd1')
        Assert-Check (-not $result.Success -and $dirty.State.Calls.Count -eq 0) 'Configuração explicitamente inexistente é recusada antes de executar Git'
        [void] [IO.Directory]::CreateDirectory((Join-Path $dirty.Root '.svn'))
        $result = Invoke-TestMerge $dirty
        Assert-Check (-not $result.Success -and $dirty.State.Calls.Count -eq 0) 'Working copy SVN é recusada sem exigir IntegrationPath'
        [IO.Directory]::Delete((Join-Path $dirty.Root '.svn'))
        [void] (Invoke-TestGit $dirty.Root @('remote','remove','origin'))
        $result = Invoke-TestMerge $dirty
        Assert-Check (-not $result.Success -and -not (Test-MergeCalled $dirty 'switch')) 'Ausência de origin bloqueia antes da troca'

        $ahead = New-MergeArea 'main-pendente'
        [void] (Invoke-TestGit $ahead.Root @('switch','main'))
        $pending = Save-TestCommit $ahead.Root 'main-local.txt' 'commit sem push na main'
        [void] (Invoke-TestGit $ahead.Root @('switch','demanda/local'))
        $result = Invoke-TestMerge $ahead
        Assert-Check (-not $result.Success -and -not (Test-MergeCalled $ahead 'pull') -and (Invoke-TestGit $ahead.Root @('branch','--show-current')) -eq 'main' -and (Invoke-TestGit $ahead.Root @('rev-parse','main')) -eq $pending) 'Main com commit sem push é selecionada e bloqueia antes do pull, preservando o commit'
        [void] (Invoke-TestGit $ahead.Root @('update-ref','refs/remotes/origin/main',$pending))
        $result = Invoke-TestMerge $ahead -Branch 'demanda/local'
        Assert-Check (-not $result.Success -and (Test-MergeCalled $ahead 'pull') -and -not (Test-MergeCalled $ahead 'merge') -and (Invoke-TestGit $ahead.Root @('rev-parse','HEAD')) -eq $pending) 'Reconferência após pull barra main ainda à frente da base efetivamente recebida'

        $fail = New-MergeArea 'falha-pull'
        $fail.State.FailPull = $true
        $result = Invoke-TestMerge $fail
        Assert-Check (-not $result.Success -and (Invoke-TestGit $fail.Root @('branch','--show-current')) -eq 'main' -and -not (Test-MergeCalled $fail 'merge') -and (Invoke-TestGit $fail.Root @('rev-parse','demanda/local')) -eq $fail.Demand -and $result.Error.Contains('Estado alcançado')) 'Falha de pull interrompe antes do merge e informa a main selecionada, preservando a demanda'
        $fail.State.FailPull = $false
        $fail.State.ChangeAfterPull = $true
        $result = Invoke-TestMerge $fail -Branch 'demanda/local'
        Assert-Check (-not $result.Success -and -not (Test-MergeCalled $fail 'merge') -and [IO.File]::ReadAllText((Join-Path $fail.Root 'fonte.pas')).Contains('mudou durante')) 'Mudança local durante pull é preservada e impede o merge'

        $conflict = New-MergeArea 'conflito'
        [void] (Save-TestCommit $conflict.Root 'fonte.pas' 'demanda')
        $published = Save-TestCommit $conflict.Publisher 'fonte.pas' 'SVN'
        [void] (Invoke-TestGit $conflict.Publisher @('push','origin','main'))
        $result = Invoke-TestMerge $conflict
        Assert-Check (-not $result.Success -and [IO.File]::Exists((Join-Path $conflict.Root '.git/MERGE_HEAD')) -and (Invoke-TestGit $conflict.Root @('diff','--name-only','--diff-filter=U')) -eq 'fonte.pas') 'Conflito mantém merge em andamento e arquivos para resolução manual'
        Assert-Check ((Invoke-TestGit $conflict.Root @('branch','--show-current')) -eq 'main' -and (Invoke-TestGit $conflict.Origin @('rev-parse','main')) -eq $published -and $result.Error.Contains('Resolva os conflitos')) 'Conflito informa como continuar e não publica o resultado'
        $result = Invoke-TestMerge $conflict -Branch 'demanda/local'
        Assert-Check (-not $result.Success -and -not (Test-MergeCalled $conflict 'switch') -and -not (Test-MergeCalled $conflict 'pull') -and [IO.File]::Exists((Join-Path $conflict.Root '.git/MERGE_HEAD'))) 'Nova execução não interfere em merge em andamento'

        $ff = New-MergeArea 'fast-forward'
        [void] (Invoke-TestGit $ff.Root @('switch','main'))
        $result = Invoke-TestMerge $ff -Branch 'demanda/local'
        Assert-Check ($result.Success -and (Invoke-TestGit $ff.Root @('rev-parse','HEAD')) -eq $ff.Demand) 'Branch explícita a partir da main é incorporada por fast-forward'
        $result = Invoke-TestMerge $ff -Branch 'demanda/local'
        Assert-Check (-not $result.Success -and -not (Test-MergeCalled $ff 'pull')) 'Reexecução após merge não publicado reconhece a pendência da main'
        $engine = (Get-Process -Id $PID).Path
        $output = @(& $engine -NoLogo -NoProfile -File $ff.Script -Branch 'demanda/local' 2>&1)
        Assert-Check ($LASTEXITCODE -eq 1 -and ($output -join ' ').Contains('commit(s)')) 'Entrada independente retorna código 1 com o motivo da interrupção'
    }
    finally {
        $resolved = [IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase, [StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -match '^hwdesktop-merge-[a-f0-9]{32}$' -and [IO.Directory]::Exists($resolved)) {
            Remove-Item -LiteralPath $resolved -Recurse -Force
        }
    }
}


function Test-SyncGitSvn {
    $temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture = Join-Path $temporaryBase ('hwdesktop-dual-sync-'+[guid]::NewGuid().ToString('N'))
    $source = Join-Path $automationRoot 'workflow/sync-integration.ps1'
    . $source
    function TestGit {
        param([string] $Directory,[string[]] $Arguments)
        $r = Invoke-SyncProcess git $Arguments $Directory
        if ($r.ExitCode -ne 0) { throw "Git do teste: $($r.Error) $($r.Output)" }
        return $r.Output.TrimEnd()
    }
    $root = Join-Path $fixture 'Ponte SVN'
    $publisher = Join-Path $fixture 'Publicador GitHub'
    $origin = Join-Path $fixture 'origin.git'
    $url = 'https://servidor.invalid/svn/hwsistemas/Projeto_Fiscal40'
    function Save-SvnRevision {
        param([string] $Revision)
        [void] (TestGit $root @('add','--all','--force','.'))
        $message = "Base SVN "+$Revision+[Environment]::NewLine+[Environment]::NewLine+"git-svn-id: $url@$Revision 985b6d82-50e3-384c-aa2a-157267a88f1d"
        [void] (TestGit $root @('commit','-m',$message))
        $hash = TestGit $root @('rev-parse','HEAD')
        [void] (TestGit $root @('update-ref','refs/remotes/svn/git-svn',$hash))
        return $hash
    }
    function Invoke-TestDualSync {
        $state.Calls.Clear()
        $failure = ''; $log = [Collections.Generic.List[string]]::new()
        Push-Location $root
        try {
            . $entry
            Invoke-SyncIntegration -ConfigPath $config -CommandRunner $runner 6>&1 | ForEach-Object { $log.Add([string] $_) }
        } catch { $failure = $_.Exception.Message } finally { Pop-Location }
        [pscustomobject]@{Success=($failure -eq '');Error=$failure;Log=($log -join [Environment]::NewLine)}
    }
    try {
        foreach ($folder in @($root,$publisher)) {
            [void] [IO.Directory]::CreateDirectory($folder)
            [void] (TestGit $folder @('init','--initial-branch=main'))
            [void] (TestGit $folder @('config','user.name','Teste local'))
            [void] (TestGit $folder @('config','user.email','teste@example.invalid'))
            [void] (TestGit $folder @('config','core.autocrlf','false'))
            foreach ($name in @('Modern','Unix','assets','estranho','Legacy')) { [void] [IO.Directory]::CreateDirectory((Join-Path $folder $name)) }
            [IO.File]::WriteAllLines((Join-Path $folder '.gitignore'),[string[]]@('/*','!/.gitignore','!/Modern/','!/Unix/','!/assets/','!/Legacy/','_automation/'))
            [IO.File]::WriteAllText((Join-Path $folder 'Modern/.gitattributes'),"*.pas text eol=crlf")
            [IO.File]::WriteAllText((Join-Path $folder 'Unix/.gitattributes'),"*.pas text eol=lf")
            [IO.File]::WriteAllText((Join-Path $folder 'Modern/inalterado.pas'),"linha um"+[char]13+[char]10+"linha dois"+[char]10)
            [IO.File]::WriteAllText((Join-Path $folder 'Modern/remover.pas'),'remover')
            [IO.File]::WriteAllText((Join-Path $folder 'Legacy/padrao-proprio.pas'),"legado"+[char]13+[char]10+"misto"+[char]10)
            [IO.File]::WriteAllText((Join-Path $folder 'Unix/mesma-extensao.pas'),"unix"+[char]10)
            [IO.File]::WriteAllBytes((Join-Path $folder 'assets/binario.dll'),[byte[]]@(0,255,13,10,0,10,128))
            [IO.File]::WriteAllText((Join-Path $folder 'estranho/projeto.pas'),"fora do GitHub"+[char]13+[char]10)
        }
        [void] (TestGit $fixture @('init','--bare','--initial-branch=main',$origin))
        [void] (TestGit $publisher @('remote','add','origin',$origin))
        [void] (TestGit $publisher @('add','.'))
        [void] (TestGit $publisher @('commit','-m','Base GitHub independente'))
        [void] (TestGit $publisher @('push','origin','main'))
        $initialGithub = TestGit $publisher @('rev-parse','HEAD')
        [IO.File]::WriteAllText((Join-Path $root '.git/info/attributes'),'* -text')
        $initialSvn = Save-SvnRevision '19050'
        [void] (TestGit $root @('config','svn-remote.svn.url',$url))
        [void] (TestGit $root @('config','svn-remote.svn.fetch',':refs/remotes/svn/git-svn'))
        [void] (TestGit $root @('remote','add','origin',$origin))
        $entry = Join-Path $root '_automation/workflow/sync-integration.ps1'
        [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $entry))
        Copy-Item -LiteralPath $source -Destination $entry
        foreach ($mode in @('svn','git-svn')) {
            $folder = Join-Path (Split-Path -Parent $entry) $mode
            [void] [IO.Directory]::CreateDirectory($folder)
            Copy-Item -LiteralPath (Join-Path $automationRoot "workflow/$mode/sync-integration.ps1") -Destination (Join-Path $folder 'sync-integration.ps1')
        }
        $config = Join-Path $root '_automation/config/workflow.local.psd1'
        [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $config))
        $rootValue = $root.Replace("'","''")
        [IO.File]::WriteAllText($config,"@{ IntegrationPath='$rootValue'; GitBranch='main'; SvnUrlSuffix='/svn/hwsistemas/Projeto_Fiscal40'; WslDistribution='Ubuntu-simulado'; SvnRef='refs/remotes/svn/git-svn' }")
        $fakePassword='fixture-password==\literal'
        $configured=[IO.File]::ReadAllText($config).TrimEnd().TrimEnd('}')
        [IO.File]::WriteAllText($config,($configured+"; SecretsFile='segredos.md' }"))
        [IO.File]::WriteAllText((Join-Path (Split-Path -Parent $config) 'segredos.md'),("SVN_USER=fixture-svn-user"+[Environment]::NewLine+"SVN_PASS="+$fakePassword+[Environment]::NewLine))
        $state = @{ Calls=[Collections.Generic.List[object]]::new(); FailWsl=$false; FailPush=$false }
        $processInvoker=(Get-Command Invoke-SyncProcess -CommandType Function).ScriptBlock
        $runner = {
            param($Tool,$Arguments,$Directory,$InputText)
            $state.Calls.Add([pscustomobject]@{Tool=$Tool;Arguments=@($Arguments);Directory=$Directory})
            if ($Tool -eq 'wsl.exe') {
                if ($state.FailWsl) { return [pscustomobject]@{ExitCode=1;Output='';Error='WSL indisponível simulado'} }
                $output = if ('wslpath' -in $Arguments) { '/simulated/'+$Arguments[-1].Replace('\','/') } else { 'git-svn simulado' }
                return [pscustomobject]@{ExitCode=0;Output=$output;Error=''}
            }
            if ($Tool -eq 'svn') { throw 'Modo git-svn não deve chamar o cliente SVN do Windows.' }
            if ($state.FailPush -and $Arguments[0] -eq 'push') { return [pscustomobject]@{ExitCode=1;Output='';Error='Push rejeitado simulado'} }
            if ($Tool -eq 'git') {
                $previousEncoding=[Console]::OutputEncoding
                try {
                    [Console]::OutputEncoding=[Text.Encoding]::GetEncoding(850)
                    return & $processInvoker $Tool $Arguments $Directory $InputText
                } finally { [Console]::OutputEncoding=$previousEncoding }
            }
            return $null
        }.GetNewClosure()

        Assert-Check ((Get-IntegrationClient $root $runner) -eq 'git-svn') 'Identifica git-svn por configuração, sem confundir um clone Git comum'
        $first = Invoke-TestDualSync
        if (-not $first.Success) { throw $first.Error }
        $authenticated=@($state.Calls | Where-Object { $_.Tool -eq 'wsl.exe' -and 'fetch' -in $_.Arguments -and 'fixture-svn-user' -in $_.Arguments })
        Assert-Check ($authenticated.Count -eq 1 -and -not (($authenticated[0].Arguments -join ' ').Contains($fakePassword))) 'Sincronização encaminha usuário/askpass do arquivo pessoal, sem senha em argumentos'
        Assert-Check ((TestGit $origin @('rev-parse','main')) -eq $initialGithub) 'Diferenças somente de CRLF/mistas não criam commit artificial no GitHub'
        Assert-Check ((TestGit $origin @('rev-parse','main:Legacy/padrao-proprio.pas')) -eq (TestGit $root @('rev-parse','HEAD:Legacy/padrao-proprio.pas'))) 'Pasta sem gitattributes mantém sua representação mista já existente, sem normalização coletiva'
        Assert-Check ((TestGit $root @('rev-parse','HEAD')) -eq $initialSvn -and [IO.File]::ReadAllText((Join-Path $root 'Modern/inalterado.pas')).Contains([string][char]13)) 'Linha SVN e seus finais de linha permanecem intactos'
        $cache = Join-Path $root '.git/hwdesktop-sync'
        Assert-Check (@(Get-ChildItem -LiteralPath $cache -Directory -Filter 'run-*').Count -eq 0) 'Preparação temporária privada é removida após sucesso'

        [IO.File]::WriteAllText((Join-Path $root 'Modern/novo [ação].pas'),"nova demanda"+[char]13+[char]10)
        [IO.File]::Delete((Join-Path $root 'Modern/remover.pas'))
        # Evitar adicionar a instalação local da automação à revisão SVN simulada.
        [void] (TestGit $root @('add','--all','--','Modern'))
        $message = "Atualizacao SVN"+[Environment]::NewLine+[Environment]::NewLine+"git-svn-id: $url@19055 985b6d82-50e3-384c-aa2a-157267a88f1d"
        [void] (TestGit $root @('commit','-m',$message))
        $newSvn = TestGit $root @('rev-parse','HEAD')
        [void] (TestGit $root @('update-ref','refs/remotes/svn/git-svn',$newSvn))
        [IO.File]::WriteAllText((Join-Path $root 'Modern/novo [ação].pas'),'alteracao local preservada')
        [IO.File]::WriteAllText((Join-Path $root 'Modern/nao-versionado.pas'),'nao publicar')
        $second = Invoke-TestDualSync
        if (-not $second.Success) { throw $second.Error }
        $newGithub = TestGit $origin @('rev-parse','main')
        Assert-Check ((TestGit $origin @('rev-parse','main^')) -eq $initialGithub -and (TestGit $origin @('log','-1','--format=%s','main')).Contains('r19055')) 'Novo commit preserva a ancestralidade GitHub e registra a revisão SVN'
        $published = TestGit $origin @('ls-tree','-r','--name-only','main')
        Assert-Check ($published.Contains('novo') -and -not $published.Contains('remover.pas') -and -not $published.Contains('estranho/') -and -not $published.Contains('nao-versionado')) 'Publica adições e exclusões SVN respeitando o filtro e ignorando arquivos locais novos'
        $diff = TestGit $origin @('diff','--name-only',"$initialGithub..$newGithub")
        Assert-Check (-not $diff.Contains('inalterado.pas') -and -not $diff.Contains('mesma-extensao.pas') -and -not $diff.Contains('binario.dll')) 'Atributos por área preservam arquivos inalterados, padrões diferentes e binários'
        Assert-Check ((TestGit $origin @('show','main:Modern/novo [ação].pas')) -eq 'nova demanda' -and [IO.File]::ReadAllText((Join-Path $root 'Modern/novo [ação].pas')) -eq 'alteracao local preservada') 'Usa os blobs recebidos do SVN e não sobrescreve alterações locais da ponte'
        $again = Invoke-TestDualSync
        Assert-Check ($again.Success -and (TestGit $origin @('rev-parse','main')) -eq $newGithub) 'Reexecução idêntica não cria commit vazio'
        # Reproduzir o estado já publicado com um nome UTF-8 lido como OEM 850.
        [void] (TestGit $publisher @('fetch','origin'))
        [void] (TestGit $publisher @('merge','--ff-only','origin/main'))
        $correctName='Modern/novo [ação].pas'
        $badName=[Text.Encoding]::GetEncoding(850).GetString([Text.Encoding]::UTF8.GetBytes($correctName))
        [void] (TestGit $publisher @('mv','--',$correctName,$badName))
        [void] (TestGit $publisher @('commit','-m','Nome incorreto simulado'))
        [void] (TestGit $publisher @('push','origin','main'))
        $badCommit=TestGit $origin @('rev-parse','main')
        $repaired=Invoke-TestDualSync
        if (-not $repaired.Success) { throw $repaired.Error }
        $fixed=TestGit $origin @('rev-parse','main')
        Assert-Check ((TestGit $origin @('rev-parse','main^')) -eq $badCommit) 'Repara nome já publicado com commit normal, preservando o commit anterior'
        Assert-Check ((TestGit $origin @('rev-parse',($fixed+'^{tree}'))) -eq (TestGit $origin @('rev-parse',($newGithub+'^{tree}')))) 'Repetir a sincronização restaura exatamente a árvore correta anterior à corrupção do nome'
        $newGithub=$fixed

        $state.FailWsl = $true
        $failed = Invoke-TestDualSync
        Assert-Check (-not $failed.Success -and (TestGit $origin @('rev-parse','main')) -eq $newGithub) 'Indisponibilidade WSL interrompe sem publicar nem trocar automaticamente de cliente'
        $state.FailWsl = $false
        [void] [IO.Directory]::CreateDirectory((Join-Path $root '.svn'))
        $ambiguous = Invoke-TestDualSync
        Assert-Check (-not $ambiguous.Success -and @($state.Calls | Where-Object Tool -eq 'wsl.exe').Count -eq 0) 'Pasta com dois tipos de metadados é recusada antes de executar WSL'
        [IO.Directory]::Delete((Join-Path $root '.svn'))
        [void] [IO.Directory]::CreateDirectory((Join-Path $publisher '.svn'))
        Assert-Check ((Get-IntegrationClient $publisher) -eq 'svn') 'Pasta SVN com Git permanece no modo tradicional sem depender de WSL'
        [IO.Directory]::Delete((Join-Path $publisher '.svn'))
        $ordinary = $false
        try { [void] (Get-IntegrationClient $publisher) } catch { $ordinary = $true }
        Assert-Check $ordinary 'Clone somente Git não é tratado como integração'

        [IO.File]::WriteAllText((Join-Path $root 'Modern/novo [ação].pas'),'proxima revisao')
        [void] (TestGit $root @('add','--','Modern'))
        $message = "Outra SVN"+[Environment]::NewLine+[Environment]::NewLine+"git-svn-id: $url@19056 985b6d82-50e3-384c-aa2a-157267a88f1d"
        [void] (TestGit $root @('commit','-m',$message))
        [void] (TestGit $root @('update-ref','refs/remotes/svn/git-svn',(TestGit $root @('rev-parse','HEAD'))))
        $state.FailPush = $true
        $failed = Invoke-TestDualSync
        $retained = @(Get-ChildItem -LiteralPath $cache -Directory -Filter 'run-*')
        Assert-Check (-not $failed.Success -and $retained.Count -eq 1 -and (TestGit $origin @('rev-parse','main')) -eq $newGithub) 'Push rejeitado preserva a preparação e seu commit para revisão, sem alterar remoto'
    }
    finally {
        $resolved = [IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase,[StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -match '^hwdesktop-dual-sync-[a-f0-9]{32}$' -and [IO.Directory]::Exists($resolved)) { Remove-Item -LiteralPath $resolved -Recurse -Force }
    }
}



function Test-Delivery {
    $temporaryBase=[IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture=Join-Path $temporaryBase ('hwdesktop-delivery-'+[guid]::NewGuid().ToString('N'))
    [void] [IO.Directory]::CreateDirectory($fixture)
    . (Join-Path $automationRoot 'workflow\sync-integration.ps1')
    . (Join-Path $automationRoot 'workflow\Delivery.Common.ps1')
    function Run([string] $Tool,[string[]] $Arguments,[string] $Directory=$fixture) {
        $result=Invoke-SyncProcess $Tool $Arguments $Directory
        if ($result.ExitCode -ne 0) { throw "$Tool $($Arguments -join ' '): $($result.Error) $($result.Output)" }
        return $result.Output.Trim()
    }
    function WriteFile([string] $Directory,[string] $Path,[string] $Text) {
        $file=Join-Path $Directory $Path
        [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $file))
        [IO.File]::WriteAllText($file,$Text,[Text.UTF8Encoding]::new($false))
    }
    function Install([string] $Directory) {
        foreach ($relative in @('sync-integration.ps1','deliver-svn.ps1','Delivery.Common.ps1','svn\sync-integration.ps1','svn\deliver-svn.ps1','git-svn\sync-integration.ps1','git-svn\deliver-svn.ps1')) {
            $dest=Join-Path $Directory ("_automation\workflow\"+$relative)
            [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $dest))
            [IO.File]::Copy((Join-Path $automationRoot ("workflow\"+$relative)),$dest)
        }
        [void] [IO.Directory]::CreateDirectory((Join-Path $Directory '_automation\config'))
    }
    function InvokeEntry([string] $Directory,[switch] $Commit,[scriptblock] $Runner) {
        Push-Location $Directory
        try {
            . (Join-Path $Directory '_automation\workflow\deliver-svn.ps1') -Commit:$Commit
            Invoke-DeliverSvn -ConfigPath (Join-Path $Directory '_automation\config\workflow.local.psd1') -Commit:$Commit -CommandRunner $Runner | Out-Host
        } finally { Pop-Location }
    }
    try {
        foreach ($mode in @('svn','git-svn')) {
            $area=Join-Path $fixture $mode; [void] [IO.Directory]::CreateDirectory($area)
            $repository=Join-Path $area 'repository'
            [void] (Run svnadmin @('create','--compatible-version','1.9',$repository))
            $winUrl=([uri] ($repository.Replace('\','/')+'/')).AbsoluteUri.TrimEnd('/')
            [void] (Run svn @('mkdir',($winUrl+'/trunk'),'-m','trunk','--non-interactive'))
            $seed=Join-Path $area 'seed'
            [void] (Run svn @('checkout',($winUrl+'/trunk'),$seed,'--non-interactive'))
            WriteFile $seed 'Modern/.gitattributes' "*.pas text eol=crlf`n"
            WriteFile $seed 'Unix/.gitattributes' "*.pas text eol=lf`n"
            WriteFile $seed 'Modern/change.pas' "antes`r`nmeio`nfinal`r`n"
            WriteFile $seed 'Modern/keep.pas' "intacto`r`n"
            WriteFile $seed 'Modern/delete.pas' "remover`r`n"
            WriteFile $seed 'Unix/file.pas' "unix`n"
            WriteFile $seed 'foreign/keep.txt' "outro projeto`r`n"
            WriteFile $seed '.gitignore' "_automation/`nforeign/`n.svn/`n"
            [IO.File]::WriteAllBytes((Join-Path $seed 'Modern/test.dll'),[byte[]]@(0,255,1,128,10))
            [void] (Run svn @('add','--force','.','--non-interactive') $seed)
            [void] (Run svn @('commit','-m','base','--non-interactive') $seed)
            [void] (Run svn @('update','--non-interactive') $seed)
            $revision=([xml] (Run svn @('info','--xml','.') $seed)).info.entry.revision
            $root=Join-Path $area 'integration'
            if ($mode -eq 'svn') {
                [void] (Run svn @('checkout',($winUrl+'/trunk'),$root,'--non-interactive'))
            } else {
                [void] (Run svn @('export',($winUrl+'/trunk'),$root,'--non-interactive'))
            }
            [void] (Run git @('init','-b','main',$root))
            [void] (Run git @('config','user.name','Delivery Test') $root)
            [void] (Run git @('config','user.email','test@example.invalid') $root)
            [void] (Run git @('config','core.autocrlf','false') $root)
            if ($mode -eq 'git-svn') {
                WriteFile $root '.git/info/attributes' "* -text`n"
                [void] (Run git @('add','--force','--','.gitignore','Modern','Unix','foreign') $root)
                $linuxRepository=(Run wsl.exe @('--distribution','Ubuntu-24.04','--exec','wslpath','-a',$repository))
                $url='file://'+$linuxRepository+'/trunk'
                $uuid=([xml] (Run svn @('info','--xml','.') $seed)).info.entry.repository.uuid
                $msg="Base`n`ngit-svn-id: "+$url+'@'+$revision+' '+$uuid
                [void] (Run git @('commit','-m',$msg) $root)
                $svnBase=Run git @('rev-parse','HEAD') $root
                [void] (Run git @('config','svn-remote.svn.url',$url) $root)
                [void] (Run git @('config','svn-remote.svn.fetch',':refs/remotes/svn/git-svn') $root)
                [void] (Run git @('update-ref','refs/remotes/svn/git-svn',$svnBase) $root)
            } else {
                [void] (Run git @('add','--','.gitignore','Modern','Unix') $root)
                [void] (Run git @('commit','-m','Base GitHub') $root)
            }
            $origin=Join-Path $area 'origin.git'; [void] (Run git @('init','--bare',$origin))
            $publisher=Join-Path $area 'work'
            if ($mode -eq 'git-svn') {
                [void] (Run git @('clone',$root,$publisher))
                [IO.File]::Delete((Join-Path $publisher 'foreign/keep.txt'))
                [void] (Run git @('rm','--cached','--','foreign/keep.txt') $publisher)
                [void] (Run git @('add','--renormalize','--','Modern','Unix') $publisher)
            } else { [void] (Run git @('clone',$root,$publisher)) }
            [void] (Run git @('config','user.name','Delivery Test') $publisher)
            [void] (Run git @('config','user.email','test@example.invalid') $publisher)
            if ($mode -eq 'git-svn') { [void] (Run git @('commit','-m','Recorte GitHub') $publisher) }
            [void] (Run git @('remote','set-url','origin',$origin) $publisher)
            [void] (Run git @('push','origin','main') $publisher)
            [void] (Run git @('remote','add','origin',$origin) $root)
            $githubBase=Run git @('rev-parse','HEAD') $publisher
            if ($mode -eq 'git-svn') {
                $cache=Join-Path $root '.git/hwdesktop-sync'; [void] [IO.Directory]::CreateDirectory($cache)
                $mirror=Join-Path $cache 'github.git'
                [void] (Run git @('clone','--bare',$origin,$mirror))
                WriteFile $mirror 'hwdesktop-owner.json' (@{root=$root}|ConvertTo-Json)
                WriteFile $cache 'last-sync.json' (@{svnRevision=$revision;svnCommit=$svnBase;githubCommit=$githubBase}|ConvertTo-Json)
            }
            Install $root
            $config="@{ IntegrationPath = '"+$root.Replace("'","''")+"'; GitBranch='main'; SvnUrlSuffix='/trunk'; SecretsFile='segredos.md'; WslDistribution='Ubuntu-24.04'; SvnRef='refs/remotes/svn/git-svn' }"
            WriteFile $root '_automation/config/workflow.local.psd1' $config
            WriteFile $root '_automation/config/segredos.md' "SVN_USER=test`nSVN_PASS=test`n"
            WriteFile $publisher 'Modern/change.pas' "depois`nmeio`nfinal`n"
            [IO.File]::Delete((Join-Path $publisher 'Modern/delete.pas'))
            WriteFile $publisher 'new/sub/novo [ação]@.txt' "novo`n"
            WriteFile $publisher 'Unix/file.pas' "unix novo`n"
            [IO.File]::WriteAllBytes((Join-Path $publisher 'Modern/test.dll'),[byte[]]@(0,254,2,129,10))
            [void] (Run git @('add','--all') $publisher); [void] (Run git @('commit','-m','Demanda') $publisher)
            [void] (Run git @('push','origin','main') $publisher)
            $target=Run git @('rev-parse','HEAD') $publisher
            $bridgeHead=Run git @('rev-parse','HEAD') $root
            if ($mode -eq 'git-svn') { WriteFile $root 'Modern/local.pas' 'nao entregar' }
            $statusCalls=[Collections.Generic.List[object]]::new()
            $listingRunner={
                param($Tool,$Arguments,$Directory,$InputText)
                if($Tool -eq 'svn' -and $Arguments[0] -eq 'status' -and '--xml' -notin $Arguments){$statusCalls.Add(@($Arguments))}
                return $null
            }.GetNewClosure()
            InvokeEntry $root -Runner $listingRunner
            $stateFile=Join-Path $root '.git/hwdesktop-delivery/pending.json'
            $state=Get-Content -LiteralPath $stateFile -Raw | ConvertFrom-Json
            Assert-Check ($state.status -eq 'prepared' -and $state.githubCommit -eq $target) "$mode prepara a ponta publicada, sem enviar SVN"
            if($mode -eq 'svn'){
                Assert-Check ($statusCalls.Count -gt 0 -and @($statusCalls | Where-Object { '--depth' -notin $_ -or 'empty' -notin $_ -or '--' -notin $_ }).Count -eq 0) 'Resumo SVN consulta somente alvos explícitos e não percorre a pasta inteira'
                $shown=@($statusCalls | ForEach-Object { $separator=[Array]::IndexOf($_,'--'); $_[($separator+1)..($_.Count-1)] })
                $expected=@($state.targets | ForEach-Object { $_+'@' })
                Assert-Check (@(Compare-Object $shown $expected).Count -eq 0) 'Resumo SVN mostra exatamente os alvos preparados, sem arquivos locais alheios'
            }
            Assert-Check ((Run svnlook @('youngest',$repository)) -eq $revision) "$mode preparação não cria revisão SVN"
            InvokeEntry $root
            $again=Get-Content -LiteralPath $stateFile -Raw | ConvertFrom-Json
            Assert-Check ($again.id -eq $state.id) "$mode reexecução apresenta a mesma entrega pendente"
            if ($mode -eq 'svn') {
                $svnStatus=Run svn @('status') $root
                Assert-Check ($svnStatus -match '(?m)^A\s+new' -and $svnStatus -match '(?m)^D\s+Modern\\delete.pas') 'SVN agenda automaticamente arquivos novos, diretórios pais e exclusões'
                WriteFile $root 'foreign/keep.txt' "alteracao local fora da entrega`r`n"
            } else {
                Assert-Check ((Run git @('rev-parse','HEAD') $root) -eq $bridgeHead -and [IO.File]::Exists((Join-Path $root 'Modern/local.pas'))) 'git-svn preserva branch e arquivos locais da ponte'
                $oldBlob=Get-DeliveryBlob @{Root=$root} $root (Run git @('rev-parse',($state.deliveryCommit+':Modern/change.pas')) $root)
                Assert-Check ([Text.Encoding]::UTF8.GetString($oldBlob) -ceq "depois`r`nmeio`nfinal`r`n") 'Alteração em arquivo misto preserva terminadores das linhas existentes'
                Assert-Check ((Run git @('rev-parse',($state.deliveryCommit+':Modern/keep.pas')) $root) -eq (Run git @('rev-parse',($svnBase+':Modern/keep.pas')) $root)) 'Arquivo inalterado mantém exatamente o blob SVN'
                $failureRunner={ param($Tool,$Arguments,$Directory,$InputText)
                    if ($Tool -eq 'wsl.exe' -and 'commit-diff' -in $Arguments) { return [pscustomobject]@{ExitCode=1;Output='';Error='Falha de comunicação simulada'} }
                    return $null
                }
                $blocked=$false
                try { InvokeEntry $root -Commit -Runner $failureRunner } catch { $blocked=$_.Exception.Message.Contains('confirmação segura') }
                $uncertain=Get-Content -LiteralPath $stateFile -Raw | ConvertFrom-Json
                Assert-Check ($blocked -and $uncertain.status -eq 'uncertain') 'Falha de envio preserva a entrega e exige conferência do log SVN'
                $blocked=$false
                try { InvokeEntry $root -Commit } catch { $blocked=$_.Exception.Message.Contains('Confira o registro SVN') }
                Assert-Check $blocked 'Estado incerto impede uma repetição automática do commit'
                # Somente a simulação falhou antes do envio; restaurar a fixture para testar o cliente real.
                $state.status='prepared'; WriteFile (Split-Path -Parent $stateFile) (Split-Path -Leaf $stateFile) ($state|ConvertTo-Json -Depth 8)
            }
            InvokeEntry $root -Commit
            $done=Get-Content -LiteralPath $stateFile -Raw | ConvertFrom-Json
            Assert-Check ($done.status -eq 'delivered' -and [int] $done.resultRevision -gt [int] $revision) "$mode confirma e cria uma única revisão SVN"
            [void] (Run svn @('update','--non-interactive') $seed)
            Assert-Check ([IO.File]::Exists((Join-Path $seed 'new/sub/novo [ação]@.txt')) -and -not [IO.File]::Exists((Join-Path $seed 'Modern/delete.pas'))) "$mode entrega adição Unicode/com @ e exclusão"
            Assert-Check ([IO.File]::ReadAllText((Join-Path $seed 'foreign/keep.txt')) -ceq "outro projeto`r`n") "$mode preserva projetos SVN fora do GitHub e alterações locais fora dos alvos"
            Assert-Check (([IO.File]::ReadAllBytes((Join-Path $seed 'Modern/test.dll')) -join ',') -eq '0,254,2,129,10') "$mode entrega binários sem recodificação"
            Assert-Check ((Run git @('rev-parse','main') $origin) -eq $target) "$mode não reescreve nem publica o histórico GitHub"
        }
    } finally {
        $resolved=[IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase,[StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -match '^hwdesktop-delivery-[a-f0-9]{32}$' -and [IO.Directory]::Exists($resolved)) { Remove-Item -LiteralPath $resolved -Recurse -Force }
    }
}


function Test-GitSvnAuth {
    . (Join-Path $automationRoot 'workflow/sync-integration.ps1')
    . (Join-Path $automationRoot 'workflow/Delivery.Common.ps1')
    $temporaryBase=[IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture=Join-Path $temporaryBase ('hwdesktop-svn-auth-'+[guid]::NewGuid().ToString('N'))
    [void] [IO.Directory]::CreateDirectory($fixture)
    try {
        Assert-Check ($null -eq (Read-GitSvnCredentials @{} $fixture)) 'Sem SecretsFile, preserva o modo anterior de cache WSL'
        $config=@{SecretsFile='segredos.md';WslDistribution='Ubuntu-24.04';SvnRef='refs/remotes/svn/git-svn'}
        $secretPath=Join-Path $fixture 'segredos.md'
        [IO.File]::WriteAllText($secretPath,"SVN_USER=ficticio"+[Environment]::NewLine+"SVN_PASS=")
        $blocked=$false
        try { [void] (Read-GitSvnCredentials $config $fixture) } catch { $blocked=$_.Exception.Message.Contains('SVN_PASS') }
        Assert-Check $blocked 'Senha vazia interrompe com instrução para preencher SVN_PASS'
        $fakePassword='ficticio==\&$literal''✓'
        $fakeUser='svn-user-ficticio'
        [IO.File]::WriteAllText($secretPath,("SVN_PASS=valor-anterior"+[char]13+[char]10+"SVN_USER="+$fakeUser+[char]13+[char]10+"SVN_PASS="+$fakePassword+[char]13+[char]10),[Text.UTF8Encoding]::new($true))
        $credentials=Read-GitSvnCredentials $config $fixture
        Assert-Check ($credentials.Password -ceq $fakePassword -and $credentials.UserName -ceq $fakeUser) 'Arquivo com BOM/CRLF preserva senha com igual, barra, aspas e Unicode'
        $askPass=New-GitSvnAskPass (Join-Path $fixture 'cache') $credentials
        Assert-Check (-not [IO.File]::ReadAllText($askPass.Path).Contains($fakePassword)) 'Helper gerado contém código, sem cópia da senha'
        $linuxFile=(Invoke-SyncProcess wsl.exe @('--distribution','Ubuntu-24.04','--exec','wslpath','-a',$secretPath) $fixture).Output.Trim()
        $linuxHelper=(Invoke-SyncProcess wsl.exe @('--distribution','Ubuntu-24.04','--exec','wslpath','-a',$askPass.Path) $fixture).Output.Trim()
        $promptCode='print Git::prompt($ARGV[0], 1);'
        function Prompt([string] $Text) {
            $parameters=@('--distribution','Ubuntu-24.04','--exec','env',("GIT_ASKPASS="+$linuxHelper),("HWDESKTOP_SVN_SECRETS_FILE="+$linuxFile),'perl','-MGit','-e',$promptCode,$Text)
            $result=Invoke-SyncProcess wsl.exe $parameters $fixture
            if ($result.ExitCode -ne 0) { throw "Consulta local do helper falhou: $($result.ExitCode)" }
            return $result.Output.TrimEnd([char]13,[char]10)
        }
        [void] (Invoke-SyncProcess wsl.exe @('--distribution','Ubuntu-24.04','--exec','chmod','u+x',$linuxHelper) $fixture)
        Assert-Check ((Prompt "Password for 'ficticio': ") -ceq $fakePassword) 'Prompt real do Git/Perl recebe a senha do arquivo sem interpretação como comando'
        Assert-Check ((Prompt 'Username: ') -ceq $fakeUser) 'Prompt real recebe o usuário configurado'
        Assert-Check ([string]::IsNullOrEmpty((Prompt 'Certificate problem. (R)eject or accept?'))) 'Helper não aceita certificado automaticamente'
        Assert-Check ([string]::IsNullOrEmpty((Prompt 'Password: '))) 'Helper não fornece senha SVN a um prompt de certificado de cliente'
        $calls=[Collections.Generic.List[object]]::new()
        $runner={
            param($Tool,$Arguments,$Directory,$InputText)
            $calls.Add(@($Arguments))
            $output=if ('wslpath' -in $Arguments) { '/simulado/caminho' } else { 'git-svn simulado' }
            [pscustomobject]@{ExitCode=0;Output=$output;Error=''}
        }.GetNewClosure()
        $context=@{Root=$fixture;Config=$config;ConfigDirectory=$fixture;Cache=(Join-Path $fixture 'delivery');Password='';Runner=$runner}
        Initialize-DeliveryWsl $context
        $arguments=(@($calls | ForEach-Object { $_ }) -join ' ')
        Assert-Check (-not $arguments.Contains($fakePassword) -and -not ($context.WslEnvironment -join ' ').Contains($fakePassword) -and $context.Password -ceq $fakePassword) 'Entrega configura o arquivo pessoal, sem senha em argumentos ou variáveis de ambiente'
    } finally {
        $resolved=[IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase,[StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -match '^hwdesktop-svn-auth-[a-f0-9]{32}$') { Remove-Item -LiteralPath $resolved -Recurse -Force }
    }
}


function Test-ProcessEncoding {
    $temporaryBase=[IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $fixture=Join-Path $temporaryBase ('hwdesktop-encoding-'+[guid]::NewGuid().ToString('N'))
    [void] [IO.Directory]::CreateDirectory($fixture)
    $previousEncoding=[Console]::OutputEncoding
    try {
        . (Join-Path $automationRoot 'workflow/sync-integration.ps1')
        foreach ($arguments in @(@('init','-b','main'),@('config','core.autocrlf','false'))) {
            $result=Invoke-SyncProcess git $arguments $fixture
            if ($result.ExitCode -ne 0) { throw $result.Error }
        }
        $name='Conciliação Bancária - Cópia.rpt'
        [IO.File]::WriteAllBytes((Join-Path $fixture $name),[byte[]]@(0,193,231,227,255))
        $result=Invoke-SyncProcess git @('add','--',$name) $fixture
        if ($result.ExitCode -ne 0) { throw $result.Error }
        foreach ($provider in @('sync-integration.ps1','svn/sync-integration.ps1')) {
            . (Join-Path $automationRoot ('workflow/'+$provider))
            foreach ($codePage in @(850,1252)) {
                try {
                    [Console]::OutputEncoding=[Text.Encoding]::GetEncoding($codePage)
                    $result=Invoke-SyncProcess git @('ls-files','-z') $fixture
                } finally { [Console]::OutputEncoding=$previousEncoding }
                Assert-Check ($result.ExitCode -eq 0 -and $result.Output -ceq ($name+[char]0)) "$provider lê nomes Git em UTF-8 com console $codePage"
            }
        }
        . (Join-Path $automationRoot 'workflow/sync-integration.ps1')
        try {
            [Console]::OutputEncoding=[Text.Encoding]::GetEncoding(850)
            $result=Invoke-SyncProcess wsl.exe @('--distribution','Ubuntu-24.04','--exec','printf','%s',$name) $fixture
        } finally { [Console]::OutputEncoding=$previousEncoding }
        Assert-Check ($result.ExitCode -eq 0 -and $result.Output -ceq $name) 'Saída WSL UTF-8 independe da página de código 850 do terminal'
    } finally {
        [Console]::OutputEncoding=$previousEncoding
        $resolved=[IO.Path]::GetFullPath($fixture)
        if ($resolved.StartsWith($temporaryBase,[StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -match '^hwdesktop-encoding-[a-f0-9]{32}$') { Remove-Item -LiteralPath $resolved -Recurse -Force }
    }
}

$sections = @(
    @{ Group='ProcessEncoding'; Title='UTF-8 com páginas de código Windows distintas'; Action={ Test-ProcessEncoding } }
    @{ Group='GitSvnAuth'; Title='Credenciais fictícias git-svn'; Action={ Test-GitSvnAuth } }
    @{ Group='Delivery'; Title='Entrega GitHub/SVN em repositórios temporários'; Action={ Test-Delivery } }
    @{ Group='Build'; Title='Compilação e publicação simuladas'; Action={ Test-Build } }
    @{ Group='Sync'; Title='Sincronização SVN/Git isolada'; Action={ Test-Sync } }
    @{ Group='SyncGitSvn'; Title='Sincronização git-svn isolada'; Action={ Test-SyncGitSvn } }
    @{ Group='Start'; Title='Início de demanda em clones locais'; Action={ Test-Start } }
    @{ Group='Merge'; Title='Merge de demandas em clones locais'; Action={ Test-Merge } }
    @{ Group='Dependencies'; Title='Empacotamento de dependências'; Action={ Test-Dependencies } }
    @{ Group='Dependencies'; Title='Preparação de dependências'; Action={ Test-PrepareDependencies } }
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
