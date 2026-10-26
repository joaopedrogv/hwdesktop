#Requires -Version 7.5
<# .SYNOPSIS
Testa o início de demandas em clones temporários, com remoto Git local, sem SVN.
#>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false
$scriptPath = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\start-demand.ps1'))
. $scriptPath
$temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$fixture = Join-Path $temporaryBase ('hwdesktop-start-demand-' + [guid]::NewGuid().ToString('N'))
$checks = 0

function Assert-Check {
    param([bool] $Condition, [string] $Description)
    if (-not $Condition) { throw "FALHA: $Description" }
    $script:checks++
    Write-Host "[OK] $Description" -ForegroundColor Green
}

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
    [IO.File]::WriteAllText((Join-Path $publisher '.gitignore'), "bpl/`n*.local`n")
    [IO.File]::WriteAllText((Join-Path $publisher 'fonte.pas'), "base inicial`n")
    [void] (Invoke-TestGit $publisher @('add', '.'))
    [void] (Invoke-TestGit $publisher @('commit', '-m', 'Base inicial'))
    [void] (Invoke-TestGit $publisher @('push', 'origin', 'main'))
    [void] (Invoke-TestGit $base @('clone', $origin, $root))
    [void] (Invoke-TestGit $root @('config', 'user.name', 'Teste local'))
    [void] (Invoke-TestGit $root @('config', 'user.email', 'local@example.invalid'))
    $configFile = Join-Path $base 'config\workflow.local.psd1'
    # Sem SVN nem SecretsFile: esse comando usa apenas as configurações Git.
    [IO.File]::WriteAllText($configFile, "@{ WorkPath='..\Trabalho Git'; IntegrationPath='..\Integracao SVN'; GitBranch='main' }")
    $state = @{
        Calls = [Collections.Generic.List[object]]::new()
        AllCalls = [Collections.Generic.List[object]]::new()
        FailFetch = $false; FailCreate = $false; ChangeAfterFetch = $false
    }
    $runner = {
        param($Arguments, $Directory)
        $call = [pscustomobject]@{ Arguments = @($Arguments); Directory = $Directory }
        $state.Calls.Add($call)
        $state.AllCalls.Add($call)
        if (($state.FailFetch -and $Arguments[0] -eq 'fetch') -or ($state.FailCreate -and $Arguments[0] -eq 'switch' -and '-c' -in $Arguments)) {
            return [pscustomobject]@{ ExitCode = 1; Output = ''; Error = 'Falha simulada' }
        }
        if ($state.ChangeAfterFetch -and $Arguments[0] -eq 'fetch') {
            $result = Invoke-DemandProcess $Arguments $Directory
            [IO.File]::AppendAllText((Join-Path $Directory 'fonte.pas'), "alteracao concorrente`n")
            return $result
        }
        return $null
    }.GetNewClosure()
    [pscustomobject]@{ Base = $base; Root = $root; Publisher = $publisher; Origin = $origin; Integration = $integration; Config = $configFile; State = $state; Runner = $runner }
}

function Invoke-TestStart {
    param($Area, [string] $Branch = 'demanda/nova')
    $Area.State.Calls.Clear()
    $log = [Collections.Generic.List[string]]::new()
    $failure = ''
    try { Invoke-StartDemand -ConfigPath $Area.Config -Branch $Branch -CommandRunner $Area.Runner 6>&1 | ForEach-Object { $log.Add([string] $_) } }
    catch { $failure = $_.Exception.Message }
    [pscustomobject]@{ Success = ($failure -eq ''); Error = $failure; Log = ($log -join "`n") }
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
    Assert-Check $result.Success 'Inicia demanda em clone existente com caminhos relativos e espaços, sem configuração SVN'
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
    [IO.File]::WriteAllText($area.Config, "@{ WorkPath=''; IntegrationPath='..\Integracao SVN'; GitBranch='main' }")
    $result = Invoke-TestStart $area
    Assert-Check (-not $result.Success -and $result.Error.Contains('WorkPath') -and $area.State.Calls.Count -eq 0) 'WorkPath vazio produz orientação antes de executar Git'
    [IO.File]::WriteAllText($area.Config, "@{ WorkPath='..\Integracao SVN'; IntegrationPath='..\Integracao SVN'; GitBranch='main' }")
    $result = Invoke-TestStart $area
    Assert-Check (-not $result.Success -and $area.State.Calls.Count -eq 0) 'Pasta de integração não pode ser usada como WorkPath'
    [IO.File]::WriteAllText($area.Config, $savedConfig)
    [void] (Invoke-TestGit $area.Root @('remote', 'remove', 'origin'))
    $result = Invoke-TestStart $area 'demanda/bloqueada'
    Assert-Check (-not $result.Success -and -not (Test-Called $area switch)) 'Falta de origin interrompe antes de trocar de branch'
    [void] (Invoke-TestGit $area.Root @('remote', 'add', 'origin', $area.Origin))
    $engine = (Get-Process -Id $PID).Path
    $cliOutput = @(& $engine -NoLogo -NoProfile -File $scriptPath -ConfigPath $area.Config -Branch 'demanda/cli' 2>&1)
    Assert-Check ($LASTEXITCODE -eq 0 -and (Invoke-TestGit $area.Root @('branch', '--show-current')) -eq 'demanda/cli') 'Entrada independente funciona em processo separado com configuração explícita'
    $cliOutput = @(& $engine -NoLogo -NoProfile -File $scriptPath -ConfigPath $area.Config -Branch 'demanda/cli' 2>&1)
    Assert-Check ($LASTEXITCODE -eq 1 -and ($cliOutput -join "`n").Contains('já existe')) 'Entrada independente devolve código 1 e diagnóstico para branch existente'

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
    Write-Host "`n$checks verificações concluídas. Somente repositórios temporários e remoto local."
}
finally {
    $resolved = [IO.Path]::GetFullPath($fixture)
    if ($resolved.StartsWith($temporaryBase, [StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -like 'hwdesktop-start-demand-*' -and (Test-Path -LiteralPath $resolved)) {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
