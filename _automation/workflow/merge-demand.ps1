#Requires -Version 7.5
<#
.SYNOPSIS
    Atualiza a main do clone e incorpora uma demanda, sem publicar o resultado.
.PARAMETER Branch
    Branch local a incorporar. O padrão é a branch atual; na main, solicita o nome.
.PARAMETER ConfigPath
    Configuração individual opcional, utilizada somente para GitBranch.
.PARAMETER WorkPath
    Clone alvo nesta execução. O padrão é o projeto do próprio script.
#>
[CmdletBinding()]
param([string] $Branch, [string] $ConfigPath, [string] $WorkPath)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-MergeProcess {
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

function Invoke-MergeDemand {
    # CommandRunner permite testar falhas sem utilizar remotos reais.
    param([string] $Branch, [string] $ConfigPath, [string] $WorkPath, [scriptblock] $CommandRunner)
    $phase = 'Conferir clone'
    $lastState = 'Nenhuma troca de branch ou atualização de arquivos foi concluída.'
    $conflict = $false
    try {
        $root = if ([string]::IsNullOrWhiteSpace($WorkPath)) {
            [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\..')).TrimEnd('\', '/')
        } else {
            $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($WorkPath).TrimEnd('\', '/')
        }
        if (-not [IO.Directory]::Exists($root)) { throw "Clone não encontrado: $root" }
        if ([IO.Directory]::Exists((Join-Path $root '.svn'))) { throw 'O merge da demanda deve ser executado em um clone somente Git, sem working copy SVN.' }
        $phase = 'Ler configuração do clone'
        $explicitConfig = -not [string]::IsNullOrWhiteSpace($ConfigPath)
        $configFile = if ($explicitConfig) { [IO.Path]::GetFullPath($ConfigPath) } else { Join-Path $root '_automation\config\workflow.local.psd1' }
        $main = 'main'
        if ([IO.File]::Exists($configFile)) {
            $config = Import-PowerShellDataFile -LiteralPath $configFile
            if ($config.ContainsKey('GitBranch')) {
                if ([string]::IsNullOrWhiteSpace([string] $config.GitBranch)) { throw 'Campo GitBranch vazio na configuração do clone.' }
                $main = [string] $config.GitBranch
            }
        }
        elseif ($explicitConfig) { throw "Configuração informada não encontrada: $configFile" }

        function Invoke-Git {
            param([string[]] $Arguments, [int[]] $AllowedCodes = @(0), [switch] $ShowOutput)
            $result = $null
            if ($null -ne $CommandRunner) { $result = & $CommandRunner $Arguments $root }
            if ($null -eq $result) { $result = Invoke-MergeProcess $Arguments $root }
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
        function Assert-Clean {
            if ((Invoke-Git @('status', '--porcelain=v1', '-z', '--untracked-files=all')).Output.Length -gt 0) {
                [void] (Invoke-Git @('status', '--short', '--untracked-files=all') -ShowOutput)
                throw 'O clone contém alterações pendentes. Conclua ou guarde seu trabalho pelas ferramentas habituais antes do merge.'
            }
        }
        function Assert-NoLocalCommits {
            param([string] $RemoteRef)
            $pending = (Invoke-Git @('rev-list', '--count', "$RemoteRef..refs/heads/$main")).Output.Trim()
            if ([long] $pending -gt 0) {
                [void] (Invoke-Git @('log', '--oneline', "$RemoteRef..refs/heads/$main") -ShowOutput)
                throw "A branch '$main' tem $pending commit(s) ausente(s) de $RemoteRef. Avalie os commits da main antes de incorporar a demanda."
            }
        }

        $phase = 'Conferir contexto'
        Write-Host "Integrar demanda`nDiretório: $root"
        [void] (Invoke-Git @('--version') -ShowOutput)
        $gitRoot = [IO.Path]::GetFullPath((Invoke-Git @('rev-parse', '--show-toplevel')).Output.Trim()).TrimEnd('\', '/')
        if (-not $root.Equals($gitRoot, [StringComparison]::OrdinalIgnoreCase)) { throw "A pasta de trabalho não é a raiz Git: $gitRoot" }
        $gitDirectory = (Invoke-Git @('rev-parse', '--absolute-git-dir')).Output.Trim()
        foreach ($operation in @('MERGE_HEAD', 'rebase-merge', 'rebase-apply', 'CHERRY_PICK_HEAD', 'REVERT_HEAD', 'sequencer')) {
            if (Test-Path -LiteralPath (Join-Path $gitDirectory $operation)) { throw "Operação Git em andamento: $operation" }
        }
        Assert-Clean
        $current = (Invoke-Git @('symbolic-ref', '--quiet', '--short', 'HEAD')).Output.Trim()
        [void] (Invoke-Git @('check-ref-format', "refs/heads/$main"))
        [void] (Invoke-Git @('rev-parse', '--verify', "refs/heads/$main^{commit}"))
        if ('origin' -notin ((Invoke-Git @('remote')).Output -split '\r?\n')) { throw 'O remoto Git origin não está configurado.' }
        # A referência local permite barrar uma main pendente antes de executar o pull.
        [void] (Invoke-Git @('rev-parse', '--verify', "refs/remotes/origin/$main^{commit}"))
        if ([string]::IsNullOrWhiteSpace($Branch)) {
            if ($current -ne $main) { $Branch = $current }
            else {
                if ([Console]::IsInputRedirected) { throw 'Na main, informe a branch da demanda pelo parâmetro -Branch.' }
                $Branch = Read-Host 'Branch da demanda a incorporar (Enter para cancelar)'
                if ([string]::IsNullOrWhiteSpace($Branch)) { Write-Host 'Merge cancelado; nenhuma troca de branch ou atualização realizada.'; return }
            }
        }
        $validName = Invoke-Git @('check-ref-format', '--branch', $Branch)
        if ($validName.Output.Trim() -cne $Branch) { throw 'Informe o nome literal da branch, sem expressões de troca de branch.' }
        if ($Branch -eq $main) { throw 'A branch da demanda deve ser diferente da branch principal.' }
        $demandCommit = (Invoke-Git @('rev-parse', '--verify', "refs/heads/$Branch^{commit}")).Output.Trim()
        Write-Host "Demanda: $Branch ($demandCommit)"
        Assert-Clean

        $phase = 'Selecionar branch principal'
        Write-Host "`nMudando para $main..."
        [void] (Invoke-Git @('switch', '--no-guess', '--no-overwrite-ignore', $main) -ShowOutput)
        $lastState = "A branch '$main' foi selecionada."
        $phase = 'Conferir commits da main'
        Assert-NoLocalCommits "refs/remotes/origin/$main"
        Assert-Clean

        $phase = 'Atualizar branch principal'
        Write-Host "`nAtualizando $main (pull --ff-only origin $main)..."
        [void] (Invoke-Git @('pull', '--ff-only', '--no-rebase', '--no-autostash', 'origin', $main) -ShowOutput)
        $lastState = "O pull da branch '$main' foi concluído."
        # FETCH_HEAD é a ponta efetivamente recebida pelo pull, sem um fetch separado.
        Assert-NoLocalCommits 'FETCH_HEAD'
        $baseCommit = (Invoke-Git @('rev-parse', 'HEAD')).Output.Trim()
        $lastState = "A branch '$main' foi atualizada para $baseCommit."
        Assert-Clean
        if ((Invoke-Git @('rev-parse', '--verify', "refs/heads/$Branch^{commit}")).Output.Trim() -ne $demandCommit) {
            throw 'A branch da demanda mudou durante a atualização. Confira o estado antes de tentar novamente.'
        }

        $phase = 'Incorporar demanda'
        Write-Host "`nIncorporando $Branch em $main..."
        # --ff mantém fast-forward quando possível, mesmo com merge.ff personalizado.
        $merge = Invoke-Git @('merge', '--no-edit', '--ff', '--no-autostash', '--no-overwrite-ignore', $Branch) @(0, 1) -ShowOutput
        if ($merge.ExitCode -ne 0) {
            $conflict = Test-Path -LiteralPath (Join-Path $gitDirectory 'MERGE_HEAD')
            if ($conflict) {
                [void] (Invoke-Git @('status', '--short') -ShowOutput)
                throw "O merge de '$Branch' foi interrompido e permanece em andamento em '$main'. Resolva os conflitos ou a falha indicada, valide e conclua o commit pelas ferramentas habituais."
            }
            throw 'O merge não foi concluído. Confira a saída Git acima antes de prosseguir.'
        }
        $lastState = "A demanda '$Branch' foi incorporada à branch '$main'."
        Write-Host "`nDemanda incorporada à $main local.`nBranch da demanda: $Branch (preservada)`nBase recebida: $baseCommit`nRevise e valide antes de publicar. Nenhum push foi executado."
    }
    catch {
        $note = if ($conflict) { 'O merge permanece em andamento; nenhuma recuperação automática foi executada.' } else { 'Não foi executado reset, stash, limpeza, exclusão de branch ou push.' }
        throw "Etapa '$phase': $($_.Exception.Message)`nEstado alcançado: $lastState`n$note"
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    try { Invoke-MergeDemand -Branch $Branch -ConfigPath $ConfigPath -WorkPath $WorkPath; exit 0 }
    catch { [Console]::Error.WriteLine($_.Exception.Message); exit 1 }
}
