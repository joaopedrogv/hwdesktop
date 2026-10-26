#Requires -Version 7.5
<# .SYNOPSIS
Testa Git real com remoto local e SVN simulado, somente em diretórios temporários.
#>
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '..\sync-integration.ps1')
$temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$fixture = Join-Path $temporaryBase ('hwdesktop-sync-' + [guid]::NewGuid().ToString('N'))
$checks = 0

function Assert-Check {
    param([bool] $Condition, [string] $Description)
    if (-not $Condition) { throw "FALHA: $Description" }
    $script:checks++
    Write-Host "[OK] $Description" -ForegroundColor Green
}

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
    [IO.File]::WriteAllText((Join-Path $root '.gitignore'), "config/`n")
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
    $state = @{
        Updated = $false; BeforeRevision = '19038'; AfterRevision = '19040'
        Url = 'https://servidor.invalid/svn/hwsistemas/Projeto_Fiscal40'
        BeforeStatus = '<status><target path="."></target></status>'
        AfterStatus = '<status><target path="."></target></status>'
        UpdateAction = $null; FailUpdate = $false; FailPush = $false; FailFetch = $false
        Calls = [Collections.Generic.List[object]]::new()
        AllCalls = [Collections.Generic.List[object]]::new()
        ResetPreservedFiles = $true; UpdateArguments = @()
    }
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
                $result = Invoke-SyncProcess $Tool $Arguments $Directory
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
                $output = "<info><entry kind='dir' revision='$revision'><url>$url</url></entry></info>"
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
    [pscustomobject]@{ Root = $root; Origin = $origin; Base = $base; Config = $configFile; State = $state; Runner = $runner }
}

function Invoke-TestSync {
    param($Area)
    $Area.State.Calls.Clear()
    $Area.State.Updated = $false
    $log = [Collections.Generic.List[string]]::new()
    $failure = ''
    try {
        Invoke-SyncIntegration -ConfigPath $Area.Config -CommandRunner $Area.Runner 6>&1 | ForEach-Object { $log.Add([string] $_) }
    }
    catch { $failure = $_.Exception.Message }
    [pscustomobject]@{ Success = ($failure -eq ''); Error = $failure; Log = ($log -join "`n") }
}

function Test-Called {
    param($Area, [string] $Tool, [string] $Command)
    return @($Area.State.Calls | Where-Object { $_.Tool -eq $Tool -and $_.Arguments[0] -eq $Command }).Count -gt 0
}

try {
    [void] [IO.Directory]::CreateDirectory($fixture)
    $area = New-TestArea 'principal'
    $initialHead = Invoke-TestGit $area.Root @('rev-parse', 'HEAD')
    $development = Join-Path $area.Base 'Desenvolvimento'
    [void] (Invoke-TestGit $area.Base @('clone', $area.Origin, $development))
    [void] (Invoke-TestGit $development @('config', 'user.name', 'Teste remoto'))
    [void] (Invoke-TestGit $development @('config', 'user.email', 'remoto@example.invalid'))
    [IO.File]::WriteAllText((Join-Path $development 'fonte.pas'), "conteudo somente Git`n")
    [IO.File]::WriteAllText((Join-Path $development 'somente-remoto.txt'), "arquivo somente Git`n")
    [void] (Invoke-TestGit $development @('add', '.'))
    [void] (Invoke-TestGit $development @('commit', '-m', 'Commit remoto que deve permanecer no historico'))
    [void] (Invoke-TestGit $development @('push', 'origin', 'main'))
    $remoteHead = Invoke-TestGit $development @('rev-parse', 'HEAD')
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
    Write-Host "`n$checks verificações concluídas. Somente Git temporário e SVN simulado."
}
finally {
    $resolved = [IO.Path]::GetFullPath($fixture)
    if ($resolved.StartsWith($temporaryBase, [StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -like 'hwdesktop-sync-*' -and (Test-Path -LiteralPath $resolved)) {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
