#Requires -Version 7.5
<#
.SYNOPSIS
    Atualiza a integração pelo SVN e publica esse estado no Git.
.DESCRIPTION
    O SVN determina o conteúdo. Fetch e reset --soft preservam os arquivos
    e preparam o próximo commit sobre a main remota. Nunca usa push forçado.
.PARAMETER ConfigPath
    Configuração pessoal; por padrão, config/workflow.local.psd1.
#>
[CmdletBinding()]
param(
    [string] $ConfigPath = (Join-Path $PSScriptRoot '..\config\workflow.local.psd1')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-SyncProcess {
    param([string] $Tool, [string[]] $Arguments, [string] $Directory, [string] $InputText = '')

    $start = [Diagnostics.ProcessStartInfo]::new()
    $start.FileName = $Tool
    $start.WorkingDirectory = $Directory
    $start.UseShellExecute = $false
    $start.CreateNoWindow = $true
    $start.RedirectStandardOutput = $true
    $start.RedirectStandardError = $true
    $start.RedirectStandardInput = $InputText.Length -gt 0
    if ($start.RedirectStandardInput) { $start.StandardInputEncoding = [Text.UTF8Encoding]::new($false) }
    foreach ($argument in $Arguments) { $start.ArgumentList.Add($argument) }
    $process = [Diagnostics.Process]::new()
    $process.StartInfo = $start
    try {
        [void] $process.Start()
        $outputTask = $process.StandardOutput.ReadToEndAsync()
        $errorTask = $process.StandardError.ReadToEndAsync()
        if ($start.RedirectStandardInput) {
            $process.StandardInput.Write($InputText)
            $process.StandardInput.Close()
        }
        $process.WaitForExit()
        [pscustomobject]@{
            ExitCode = $process.ExitCode
            Output = $outputTask.GetAwaiter().GetResult()
            Error = $errorTask.GetAwaiter().GetResult()
        }
    }
    finally { $process.Dispose() }
}

function Read-SyncSecrets {
    param([string] $Path)
    if (-not [IO.File]::Exists($Path)) { throw "Arquivo de segredos não encontrado: $Path" }
    $values = @{}
    foreach ($line in [IO.File]::ReadAllLines($Path)) {
        if ($line -match '^\s*(SVN_USER|SVN_PASS)\s*=(.*)$') {
            $values[$Matches[1]] = $Matches[2].Trim()
        }
    }
    foreach ($key in @('SVN_USER', 'SVN_PASS')) {
        if (-not $values.ContainsKey($key) -or [string]::IsNullOrWhiteSpace($values[$key])) {
            throw "Chave $key ausente ou vazia no arquivo de segredos."
        }
    }
    return $values
}

function Assert-SyncSvnStatus {
    param([xml] $Status)
    $problems = [Collections.Generic.List[string]]::new()
    foreach ($entry in $Status.SelectNodes('//entry')) {
        $state = $entry.SelectSingleNode('wc-status')
        if ($null -eq $state) { continue }
        $item = $state.GetAttribute('item')
        $props = $state.GetAttribute('props')
        $conflict = $item -eq 'conflicted' -or $props -eq 'conflicted' -or $state.GetAttribute('tree-conflicted') -eq 'true'
        $ignoredChangelist = $null -ne $entry.SelectSingleNode('ancestor::changelist[@name="ignore-on-commit"]')
        $changed = $item -notin @('normal', 'none', 'unversioned', 'ignored', 'external') -or $props -eq 'modified'
        if ($conflict -or ($changed -and -not $ignoredChangelist)) {
            $problems.Add("$($entry.GetAttribute('path')) [$item; propriedades: $props]")
        }
    }
    if ($problems.Count -gt 0) {
        throw "O SVN tem alterações locais ou conflitos que exigem avaliação:`n$($problems -join "`n")"
    }
}

function Invoke-SyncIntegration {
    # CommandRunner é uma substituição interna usada somente pelos testes isolados.
    param([string] $ConfigPath, [scriptblock] $CommandRunner)

    $phase = 'Ler configuração'
    $password = ''
    try {
        $configFile = [IO.Path]::GetFullPath($ConfigPath)
        if (-not [IO.File]::Exists($configFile)) {
            throw "Configuração pessoal não encontrada: $configFile. Copie config/workflow.exemplo.psd1 para workflow.local.psd1."
        }
        $config = Import-PowerShellDataFile -LiteralPath $configFile
        foreach ($key in @('IntegrationPath', 'GitBranch', 'SvnUrlSuffix', 'SecretsFile')) {
            if (-not $config.ContainsKey($key) -or [string]::IsNullOrWhiteSpace([string] $config[$key])) {
                throw "Campo obrigatório não preenchido: $key"
            }
        }
        $configDirectory = Split-Path -Parent $configFile
        $root = [IO.Path]::GetFullPath([IO.Path]::Combine($configDirectory, $config.IntegrationPath)).TrimEnd('\', '/')
        if (-not [IO.Directory]::Exists($root)) { throw "Diretório de integração não encontrado: $root" }
        $branch = [string] $config.GitBranch
        $suffix = '/' + ([string] $config.SvnUrlSuffix).Trim('/')
        $secretsPath = [IO.Path]::GetFullPath([IO.Path]::Combine($configDirectory, $config.SecretsFile))
        $secrets = Read-SyncSecrets $secretsPath
        $password = $secrets.SVN_PASS

        function Protect-Text {
            param([string] $Text)
            if ($password) { return $Text.Replace($password, '***') }
            return $Text
        }

        function Invoke-Client {
            param([string] $Tool, [string[]] $Arguments, [int[]] $AllowedCodes = @(0), [switch] $ShowOutput, [string] $InputText = '')
            $result = $null
            if ($null -ne $CommandRunner) { $result = & $CommandRunner $Tool $Arguments $root $InputText }
            if ($null -eq $result) { $result = Invoke-SyncProcess $Tool $Arguments $root $InputText }
            if ($ShowOutput) {
                foreach ($content in @($result.Output, $result.Error)) {
                    if (-not [string]::IsNullOrWhiteSpace($content)) { Write-Host (Protect-Text $content.TrimEnd()) }
                }
            }
            if ($result.ExitCode -notin $AllowedCodes) {
                $details = ("$($result.Error)`n$($result.Output)").Trim()
                throw (Protect-Text "$Tool terminou com código $($result.ExitCode).`n$details")
            }
            return $result
        }

        function Get-SvnInfo {
            param([switch] $IncludeFiles)
            $arguments = if ($IncludeFiles) { @('info', '--xml', '--depth', 'infinity', '.') } else { @('info', '--xml', '.') }
            [xml] $info = (Invoke-Client svn $arguments).Output
            $entry = $info.SelectSingleNode('/info/entry')
            if ($null -eq $entry) { throw 'svn info não retornou os dados do diretório de integração.' }
            $url = $entry.SelectSingleNode('url').InnerText.TrimEnd('/')
            if (-not $url.EndsWith($suffix, [StringComparison]::Ordinal)) {
                throw "URL SVN diferente da integração configurada: $url. Final esperado: $suffix"
            }
            $revision = $entry.GetAttribute('revision')
            if ($revision -notmatch '^\d+$') { throw 'svn info não retornou um número de revisão válido.' }
            $files = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
            if ($IncludeFiles) {
                foreach ($file in $info.SelectNodes('/info/entry[@kind="file"]')) {
                    $path = [IO.Path]::GetFullPath([IO.Path]::Combine($root, $file.GetAttribute('path')))
                    if (-not $path.StartsWith($root + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
                        throw "svn info retornou arquivo fora da integração: $path"
                    }
                    [void] $files.Add([IO.Path]::GetRelativePath($root, $path).Replace('\', '/'))
                }
            }
            [pscustomobject]@{ Url = $url; Revision = $revision; Files = $files }
        }

        $phase = 'Conferir contexto'
        Write-Host "Sincronizar integração`nDiretório: $root"
        [void] (Invoke-Client git @('--version') -ShowOutput)
        [void] (Invoke-Client svn @('--version') -ShowOutput)
        $gitRoot = (Invoke-Client git @('rev-parse', '--show-toplevel')).Output.Trim()
        $gitRoot = [IO.Path]::GetFullPath($gitRoot).TrimEnd('\', '/')
        if (-not $root.Equals($gitRoot, [StringComparison]::OrdinalIgnoreCase)) {
            throw "A pasta configurada não é a raiz Git: $gitRoot"
        }
        $activeBranch = (Invoke-Client git @('symbolic-ref', '--quiet', '--short', 'HEAD')).Output.Trim()
        if ($activeBranch -ne $branch) { throw "Branch ativa: $activeBranch. Esperada: $branch. Nenhuma troca será feita automaticamente." }
        $gitDirectory = (Invoke-Client git @('rev-parse', '--absolute-git-dir')).Output.Trim()
        foreach ($operation in @('MERGE_HEAD', 'rebase-merge', 'rebase-apply', 'CHERRY_PICK_HEAD', 'REVERT_HEAD', 'sequencer')) {
            if (Test-Path -LiteralPath (Join-Path $gitDirectory $operation)) { throw "Operação Git em andamento: $operation" }
        }
        $status = (Invoke-Client git @('status', '--porcelain=v1', '-z')).Output.Split([char] 0)
        for ($i = 0; $i -lt $status.Length; $i++) {
            $record = $status[$i]
            if ($record.Length -lt 3) { continue }
            $xy = $record.Substring(0, 2)
            if ($xy -in @('DD', 'AU', 'UD', 'UA', 'DU', 'AA', 'UU')) { throw "Conflito Git: $($record.Substring(3))" }
            if ($xy[0] -notin @(' ', '?', '!')) { throw "O índice Git já contém alterações preparadas: $($record.Substring(3)). Conclua ou retire essa preparação antes de sincronizar." }
            if ($xy.Contains('R') -or $xy.Contains('C')) { $i++ }
        }
        $svnInfo = Get-SvnInfo
        Write-Host "SVN: $($svnInfo.Url) — revisão $($svnInfo.Revision)"
        Assert-SyncSvnStatus ([xml] (Invoke-Client svn @('status', '--xml', '.')).Output)
        $remotes = (Invoke-Client git @('remote')).Output -split '\r?\n'
        if ('origin' -notin $remotes) { throw 'O remoto Git origin não está configurado.' }

        $phase = 'Atualizar SVN'
        Write-Host "`nAtualizando SVN..."
        [void] (Invoke-Client svn @('update', '--non-interactive', '--username', $secrets.SVN_USER, '--password', $password, '.') -ShowOutput)
        Assert-SyncSvnStatus ([xml] (Invoke-Client svn @('status', '--xml', '.')).Output)
        $phase = 'Obter revisão e arquivos versionados pelo SVN'
        $svnInfo = Get-SvnInfo -IncludeFiles
        Write-Host "Revisão SVN após o update: $($svnInfo.Revision)"
        Write-Host "Arquivos versionados pelo SVN: $($svnInfo.Files.Count)"

        $phase = 'Obter referência Git remota'
        Write-Host "`nObtendo origin/$branch (fetch)..."
        [void] (Invoke-Client git @('fetch', 'origin') -ShowOutput)
        $remoteRef = "refs/remotes/origin/$branch"
        $remote = Invoke-Client git @('rev-parse', '--verify', '--quiet', $remoteRef) @(0, 1)
        if ($remote.ExitCode -eq 0) {
            $phase = 'Posicionar Git preservando os arquivos SVN'
            Write-Host "Posicionando $branch em origin/$branch com reset --soft; arquivos preservados."
            [void] (Invoke-Client git @('reset', '--soft', $remoteRef) -ShowOutput)
        }
        else {
            $heads = (Invoke-Client git @('ls-remote', '--heads', 'origin')).Output
            if (-not [string]::IsNullOrWhiteSpace($heads)) { throw "O remoto contém branches, mas origin/$branch não foi encontrada. Confira a branch configurada." }
            Write-Host 'Remoto sem branches: primeira publicação, sem reset.'
        }

        $phase = 'Registrar estado SVN no Git'
        Write-Host "`nPreparando o estado atual dos arquivos (git add .)..."
        [void] (Invoke-Client git @('add', '--', '.') -ShowOutput)
        # O estado físico da pasta pode incluir arquivos que nunca pertenceram ao SVN.
        # Retirá-los somente do índice registra a exclusão sem apagar arquivos locais.
        $outsideSvn = [Collections.Generic.List[string]]::new()
        $indexedFiles = (Invoke-Client git @('ls-files', '-z')).Output.Split([char] 0)
        foreach ($path in $indexedFiles) {
            if ($path.Length -gt 0 -and -not $svnInfo.Files.Contains($path)) { $outsideSvn.Add($path) }
        }
        if ($outsideSvn.Count -gt 0) {
            Write-Host "`nRetirando do índice Git $($outsideSvn.Count) arquivo(s) fora do SVN; arquivos locais preservados:"
            $paths = ($outsideSvn -join [char] 0) + [char] 0
            [void] (Invoke-Client git @('--literal-pathspecs', 'rm', '--cached', '--pathspec-from-file=-', '--pathspec-file-nul') -InputText $paths -ShowOutput)
        }
        [void] (Invoke-Client git @('diff', '--cached', '--stat') -ShowOutput)
        $difference = Invoke-Client git @('diff', '--cached', '--quiet') @(0, 1)
        if ($difference.ExitCode -eq 1) {
            $message = "Sincronizacao SVN r$($svnInfo.Revision)"
            Write-Host "Commit: $message"
            [void] (Invoke-Client git @('commit', '-m', $message) -ShowOutput)
        }
        else { Write-Host 'Sem diferenças para registrar; nenhum commit criado.' }

        $phase = 'Publicar Git'
        Write-Host "`nPublicando $branch em origin (push normal)..."
        [void] (Invoke-Client git @('push', 'origin', "HEAD:refs/heads/$branch") -ShowOutput)
        Write-Host "`nSincronização concluída. Base SVN r$($svnInfo.Revision), publicada em origin/$branch."
    }
    catch {
        $message = $_.Exception.Message
        if ($password) { $message = $message.Replace($password, '***') }
        throw "Etapa '$phase': $message`nA execução foi interrompida. Nenhum revert, limpeza ou push forçado foi realizado."
    }
}

# Dot-sourcing carrega as funções para testes, sem executar a sincronização.
if ($MyInvocation.InvocationName -ne '.') {
    try {
        Invoke-SyncIntegration -ConfigPath $ConfigPath
        exit 0
    }
    catch {
        [Console]::Error.WriteLine($_.Exception.Message)
        exit 1
    }
}
