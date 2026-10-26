#Requires -Version 7.5
<#
.SYNOPSIS
    Atualiza o clone de desenvolvimento e cria a branch de uma demanda.
.PARAMETER Branch
    Nome completo da nova branch. Sem o parâmetro, solicita o nome no terminal.
.PARAMETER ConfigPath
    Configuração individual que contém WorkPath, IntegrationPath e GitBranch.
#>
[CmdletBinding()]
param(
    [string] $Branch,
    [string] $ConfigPath = (Join-Path $PSScriptRoot '..\config\workflow.local.psd1')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-DemandProcess {
    param([string[]] $Arguments, [string] $Directory)
    $start = [Diagnostics.ProcessStartInfo]::new()
    $start.FileName = 'git'
    $start.WorkingDirectory = $Directory
    $start.UseShellExecute = $false
    $start.CreateNoWindow = $true
    $start.RedirectStandardOutput = $true
    $start.RedirectStandardError = $true
    foreach ($argument in $Arguments) { $start.ArgumentList.Add($argument) }
    $process = [Diagnostics.Process]::new()
    $process.StartInfo = $start
    try {
        [void] $process.Start()
        $outputTask = $process.StandardOutput.ReadToEndAsync()
        $errorTask = $process.StandardError.ReadToEndAsync()
        $process.WaitForExit()
        [pscustomobject]@{
            ExitCode = $process.ExitCode
            Output = $outputTask.GetAwaiter().GetResult()
            Error = $errorTask.GetAwaiter().GetResult()
        }
    }
    finally { $process.Dispose() }
}

function Invoke-StartDemand {
    # CommandRunner permite simular falhas nos testes com repositórios temporários.
    param([string] $Branch, [string] $ConfigPath, [scriptblock] $CommandRunner)
    $phase = 'Ler configuração'
    $lastState = 'Nenhuma troca de branch ou atualização de arquivos foi concluída.'
    try {
        $configFile = [IO.Path]::GetFullPath($ConfigPath)
        if (-not [IO.File]::Exists($configFile)) {
            throw "Configuração pessoal não encontrada: $configFile. Copie config/workflow.exemplo.psd1 para workflow.local.psd1."
        }
        $config = Import-PowerShellDataFile -LiteralPath $configFile
        foreach ($key in @('WorkPath', 'IntegrationPath', 'GitBranch')) {
            if (-not $config.ContainsKey($key) -or [string]::IsNullOrWhiteSpace([string] $config[$key])) {
                throw "Campo obrigatório não preenchido: $key"
            }
        }
        $configDirectory = Split-Path -Parent $configFile
        $root = [IO.Path]::GetFullPath([IO.Path]::Combine($configDirectory, $config.WorkPath)).TrimEnd('\', '/')
        $integration = [IO.Path]::GetFullPath([IO.Path]::Combine($configDirectory, $config.IntegrationPath)).TrimEnd('\', '/')
        if ($root.Equals($integration, [StringComparison]::OrdinalIgnoreCase)) { throw 'WorkPath deve ser diferente de IntegrationPath.' }
        if (-not [IO.Directory]::Exists($root)) { throw "Clone de desenvolvimento não encontrado: $root. Prepare o clone e ajuste WorkPath." }
        $main = [string] $config.GitBranch

        if ([string]::IsNullOrWhiteSpace($Branch)) {
            if ([Console]::IsInputRedirected) { throw 'Informe o nome da nova branch pelo parâmetro -Branch.' }
            $Branch = Read-Host 'Nome da nova branch (Enter para cancelar)'
            if ([string]::IsNullOrWhiteSpace($Branch)) {
                Write-Host 'Início da demanda cancelado; nenhuma operação Git executada.'
                return
            }
        }

        function Invoke-Git {
            param([string[]] $Arguments, [int[]] $AllowedCodes = @(0), [switch] $ShowOutput)
            $result = $null
            if ($null -ne $CommandRunner) { $result = & $CommandRunner $Arguments $root }
            if ($null -eq $result) { $result = Invoke-DemandProcess $Arguments $root }
            if ($ShowOutput) {
                foreach ($content in @($result.Output, $result.Error)) {
                    if (-not [string]::IsNullOrWhiteSpace($content)) { Write-Host $content.TrimEnd() }
                }
            }
            if ($result.ExitCode -notin $AllowedCodes) {
                throw "Git terminou com código $($result.ExitCode).`n$(($result.Error + "`n" + $result.Output).Trim())"
            }
            return $result
        }

        function Assert-WorkTreeClean {
            $status = (Invoke-Git @('status', '--porcelain=v1', '-z', '--untracked-files=all')).Output
            if ($status.Length -gt 0) {
                [void] (Invoke-Git @('status', '--short', '--untracked-files=all') -ShowOutput)
                throw 'O clone de desenvolvimento contém alterações pendentes. Conclua seu trabalho antes de iniciar outra demanda.'
            }
        }

        $phase = 'Conferir contexto'
        Write-Host "Iniciar demanda`nDiretório: $root`nNova branch: $Branch"
        [void] (Invoke-Git @('--version') -ShowOutput)
        $gitRoot = (Invoke-Git @('rev-parse', '--show-toplevel')).Output.Trim()
        $gitRoot = [IO.Path]::GetFullPath($gitRoot).TrimEnd('\', '/')
        if (-not $root.Equals($gitRoot, [StringComparison]::OrdinalIgnoreCase)) { throw "WorkPath não é a raiz Git: $gitRoot" }
        $gitDirectory = (Invoke-Git @('rev-parse', '--absolute-git-dir')).Output.Trim()
        foreach ($operation in @('MERGE_HEAD', 'rebase-merge', 'rebase-apply', 'CHERRY_PICK_HEAD', 'REVERT_HEAD', 'sequencer')) {
            if (Test-Path -LiteralPath (Join-Path $gitDirectory $operation)) { throw "Operação Git em andamento: $operation" }
        }
        Assert-WorkTreeClean
        [void] (Invoke-Git @('check-ref-format', "refs/heads/$main"))
        $validName = Invoke-Git @('check-ref-format', '--branch', $Branch)
        # check-ref-format --branch expande expressões como @{-1}; exigir nome literal.
        if ($validName.Output.Trim() -cne $Branch) { throw 'Informe o nome literal da nova branch, sem expressões de troca de branch.' }
        if ((Invoke-Git @('show-ref', '--verify', '--quiet', "refs/heads/$Branch") @(0, 1)).ExitCode -eq 0) {
            throw "A branch local '$Branch' já existe. Nenhuma branch existente será reutilizada."
        }
        [void] (Invoke-Git @('rev-parse', '--verify', "refs/heads/$main^{commit}"))
        $remotes = (Invoke-Git @('remote')).Output -split '\r?\n'
        if ('origin' -notin $remotes) { throw 'O remoto Git origin não está configurado.' }

        $phase = 'Obter base remota'
        Write-Host "`nObtendo as referências de origin (fetch)..."
        [void] (Invoke-Git @('fetch', 'origin') -ShowOutput)
        if ((Invoke-Git @('show-ref', '--verify', '--quiet', "refs/remotes/origin/$Branch") @(0, 1)).ExitCode -eq 0) {
            throw "A branch '$Branch' já existe em origin. Escolha outro nome ou retome o trabalho pelas ferramentas habituais."
        }
        $remoteCommit = (Invoke-Git @('rev-parse', '--verify', "refs/remotes/origin/$main^{commit}")).Output.Trim()
        $localCommit = (Invoke-Git @('rev-parse', '--verify', "refs/heads/$main^{commit}")).Output.Trim()
        $canAdvance = Invoke-Git @('merge-base', '--is-ancestor', $localCommit, $remoteCommit) @(0, 1)
        if ($canAdvance.ExitCode -ne 0) {
            throw "A branch '$main' tem commits que não estão em origin/$main. Avalie esses commits antes de iniciar a demanda; nenhuma atualização da main foi feita."
        }
        Assert-WorkTreeClean

        $phase = 'Atualizar branch principal'
        Write-Host "`nMudando para $main..."
        [void] (Invoke-Git @('switch', '--no-guess', '--no-overwrite-ignore', $main) -ShowOutput)
        $lastState = "A branch '$main' foi selecionada."
        Write-Host "Atualizando $main por fast-forward até origin/$main ($remoteCommit)..."
        # Usar o commit capturado no fetch garante a base mesmo com fetch concorrente.
        [void] (Invoke-Git @('merge', '--ff-only', '--no-autostash', '--no-overwrite-ignore', $remoteCommit) -ShowOutput)
        $lastState = "A branch '$main' foi atualizada para $remoteCommit."
        $baseCommit = (Invoke-Git @('rev-parse', 'HEAD')).Output.Trim()
        if ($baseCommit -ne $remoteCommit) { throw 'A main local não corresponde à base remota obtida. Confira o estado antes de prosseguir.' }
        Assert-WorkTreeClean

        $phase = 'Criar branch da demanda'
        Write-Host "`nCriando branch $Branch..."
        [void] (Invoke-Git @('switch', '--no-track', '--no-overwrite-ignore', '-c', $Branch) -ShowOutput)
        $lastState = "A branch '$Branch' foi criada sobre $baseCommit."
        Write-Host "`nDemanda iniciada.`nDiretório: $root`nBranch: $Branch`nBase: origin/$main — $baseCommit"
    }
    catch {
        throw "Etapa '$phase': $($_.Exception.Message)`nEstado alcançado: $lastState`nA execução foi interrompida; nenhum reset, stash, limpeza ou exclusão de branch foi realizado."
    }
}

# Dot-sourcing carrega as funções para testes sem iniciar uma demanda.
if ($MyInvocation.InvocationName -ne '.') {
    try {
        Invoke-StartDemand -Branch $Branch -ConfigPath $ConfigPath
        exit 0
    }
    catch {
        [Console]::Error.WriteLine($_.Exception.Message)
        exit 1
    }
}
