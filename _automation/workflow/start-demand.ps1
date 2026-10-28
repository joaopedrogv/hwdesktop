#Requires -Version 7.5
<#
.SYNOPSIS
    Atualiza o clone de desenvolvimento e cria a branch de uma demanda.
.PARAMETER Branch
    Nome completo da nova branch. Sem o parâmetro, solicita o nome no terminal
    ou na janela ativada por -Gui.
.PARAMETER ConfigPath
    Configuração opcional do clone alvo, utilizada somente para GitBranch.
.PARAMETER WorkPath
    Clone alvo nesta execução. Por padrão, usa o projeto do próprio script.
    Quando o script pertence à integração SVN, solicita o clone; com -Gui,
    utiliza uma janela de seleção de pasta.
.PARAMETER Gui
    Usa janelas para selecionar o clone e informar a branch. Requer Windows e
    PowerShell iniciado com -STA; o menu fornece essas opções automaticamente.
#>
[CmdletBinding()]
param(
    [string] $Branch,
    [string] $ConfigPath,
    [string] $WorkPath,
    [switch] $Gui
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Read-DemandInput {
    param(
        [ValidateSet('WorkPath', 'Branch')] [string] $Kind,
        [switch] $Gui,
        [string] $InitialDirectory
    )

    if (-not $Gui) {
        if ([Console]::IsInputRedirected) {
            if ($Kind -eq 'WorkPath') { throw 'Informe -WorkPath com o clone Git a preparar, ou execute pelo menu do próprio clone.' }
            throw 'Informe o nome da nova branch pelo parâmetro -Branch.'
        }
        $prompt = if ($Kind -eq 'WorkPath') { 'Diretório do clone Git de trabalho (Enter para cancelar)' }
                  else { 'Nome da nova branch (Enter para cancelar)' }
        return Read-Host $prompt
    }

    if (-not $IsWindows) { throw 'A entrada gráfica requer Windows. Informe -WorkPath e -Branch para executar sem janelas.' }
    if ([Threading.Thread]::CurrentThread.GetApartmentState() -ne 'STA') {
        throw 'Para usar -Gui, inicie o PowerShell com -STA ou utilize Iniciar demanda no menu.'
    }
    if ($Kind -eq 'WorkPath') {
        Add-Type -AssemblyName System.Windows.Forms
        $dialog = [Windows.Forms.FolderBrowserDialog]::new()
        try {
            $dialog.Description = 'HWDESKTOP — Selecione o clone Git de trabalho'
            $dialog.UseDescriptionForTitle = $true
            $dialog.ShowNewFolderButton = $false
            $dialog.SelectedPath = $InitialDirectory
            if ($dialog.ShowDialog() -eq [Windows.Forms.DialogResult]::OK) { return $dialog.SelectedPath }
            return ''
        }
        finally { $dialog.Dispose() }
    }

    Add-Type -AssemblyName Microsoft.VisualBasic
    Add-Type -AssemblyName Microsoft.VisualBasic.Forms
    return [Microsoft.VisualBasic.Interaction]::InputBox(
        'Informe o nome completo da nova branch. Cancelar ou deixar vazio encerra sem iniciar a demanda.',
        'HWDESKTOP — Iniciar demanda',
        ''
    )
}

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
    param([string] $Branch, [string] $ConfigPath, [string] $WorkPath, [switch] $Gui,
          [scriptblock] $CommandRunner, [scriptblock] $InputReader)
    $phase = 'Definir clone de desenvolvimento'
    $lastState = 'Nenhuma troca de branch ou atualização de arquivos foi concluída.'
    try {
        $sourceRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\..')).TrimEnd('\', '/')
        function Read-Input {
            param([string] $Kind)
            if ($null -ne $InputReader) { return & $InputReader $Kind }
            Read-DemandInput -Kind $Kind -Gui:$Gui -InitialDirectory (Split-Path -Parent $sourceRoot)
        }
        if ([string]::IsNullOrWhiteSpace($WorkPath)) {
            if ([IO.Directory]::Exists((Join-Path $sourceRoot '.svn'))) {
                $WorkPath = Read-Input 'WorkPath'
                if ([string]::IsNullOrWhiteSpace($WorkPath)) {
                    Write-Host 'Início da demanda cancelado; nenhuma operação Git executada.'
                    return
                }
            }
            else { $WorkPath = $sourceRoot }
        }
        $root = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($WorkPath).TrimEnd('\', '/')
        if (-not [IO.Directory]::Exists($root)) { throw "Clone de desenvolvimento não encontrado: $root. Prepare o clone antes de iniciar a demanda." }
        if ([IO.Directory]::Exists((Join-Path $root '.svn'))) { throw "A pasta '$root' é uma working copy SVN. Selecione um clone somente Git para a demanda." }

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

        if ([string]::IsNullOrWhiteSpace($Branch)) {
            $Branch = Read-Input 'Branch'
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
        if (-not $root.Equals($gitRoot, [StringComparison]::OrdinalIgnoreCase)) { throw "A pasta de trabalho não é a raiz Git: $gitRoot" }
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
        Invoke-StartDemand -Branch $Branch -ConfigPath $ConfigPath -WorkPath $WorkPath -Gui:$Gui
        exit 0
    }
    catch {
        [Console]::Error.WriteLine($_.Exception.Message)
        exit 1
    }
}
