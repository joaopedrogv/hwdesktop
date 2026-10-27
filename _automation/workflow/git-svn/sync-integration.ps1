#Requires -Version 7.5
[CmdletBinding()]
param([string] $ConfigPath = (Join-Path $PSScriptRoot '..\..\config\workflow.local.psd1'))

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Export-GitSvnBlobs {
    # Preservar os blobs SVN; o Git do destino aplica os atributos durante a preparação.
    param([string] $Root, [string] $Destination, [object[]] $Records)
    if ($Records.Count -eq 0) { return }
    $start = [Diagnostics.ProcessStartInfo]::new()
    $start.FileName = 'git'; $start.WorkingDirectory = $Root; $start.UseShellExecute = $false; $start.CreateNoWindow = $true
    $start.RedirectStandardInput = $true; $start.RedirectStandardOutput = $true; $start.RedirectStandardError = $true
    $start.ArgumentList.Add('cat-file'); $start.ArgumentList.Add('--batch')
    $process = [Diagnostics.Process]::new(); $process.StartInfo = $start
    try {
        [void] $process.Start()
        $errors = $process.StandardError.ReadToEndAsync()
        $stream = $process.StandardOutput.BaseStream
        $buffer = [byte[]]::new(65536)
        foreach ($record in $Records) {
            $path = [IO.Path]::GetFullPath((Join-Path $Destination $record.Path))
            if (-not $path.StartsWith($Destination + [IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)) { throw "Caminho fora da preparação: $($record.Path)" }
            if ($record.Mode -notin @('100644','100755')) { throw "Tipo não suportado na publicação: $($record.Path)" }
            $process.StandardInput.WriteLine($record.Hash); $process.StandardInput.Flush()
            $header = [Text.StringBuilder]::new()
            while (($value = $stream.ReadByte()) -ge 0 -and $value -ne 10) { [void] $header.Append([char] $value) }
            $parts = $header.ToString().Split(' ')
            if ($parts.Count -ne 3 -or $parts[0] -ne $record.Hash -or $parts[1] -ne 'blob') { throw "Resposta inválida ao ler $($record.Path)" }
            $remaining = [long] $parts[2]
            [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $path))
            $file = [IO.File]::Create($path)
            try {
                while ($remaining -gt 0) {
                    $read = $stream.Read($buffer,0,[int] [Math]::Min($remaining,$buffer.Length))
                    if ($read -le 0) { throw "Leitura incompleta: $($record.Path)" }
                    $file.Write($buffer,0,$read); $remaining -= $read
                }
            } finally { $file.Dispose() }
            if ($stream.ReadByte() -ne 10) { throw 'Resposta binária incompleta do Git.' }
        }
        $process.StandardInput.Close(); $process.WaitForExit()
        if ($process.ExitCode -ne 0) { throw $errors.GetAwaiter().GetResult() }
    } finally {
        if ($process.Id -and -not $process.HasExited) { $process.Kill() }
        $process.Dispose()
    }
}

function Invoke-GitSvnSyncIntegration {
    param([string] $ConfigPath, [scriptblock] $CommandRunner)
    $phase = 'Ler configuração git-svn'
    $run = ''; $keepRun = $false; $password = ''
    try {
        $configFile = [IO.Path]::GetFullPath($ConfigPath)
        $config = Import-PowerShellDataFile -LiteralPath $configFile
        foreach ($key in @('IntegrationPath','GitBranch','SvnUrlSuffix','WslDistribution','SvnRef')) {
            if (-not $config.ContainsKey($key) -or [string]::IsNullOrWhiteSpace([string] $config[$key])) { throw "Campo obrigatório não preenchido: $key" }
        }
        $configDirectory = Split-Path -Parent $configFile
        $credentials = Read-GitSvnCredentials $config $configDirectory
        if ($null -ne $credentials) { $password=$credentials.Password }
        $root = [IO.Path]::GetFullPath([IO.Path]::Combine($configDirectory,$config.IntegrationPath)).TrimEnd('\','/')
        $branch = [string] $config.GitBranch; $svnRef = [string] $config.SvnRef
        $distribution = [string] $config.WslDistribution
        $suffix = '/' + ([string] $config.SvnUrlSuffix).Trim('/')

        function Invoke-Client {
            param([string] $Tool,[string[]] $Arguments,[string] $Directory=$root,[int[]] $AllowedCodes=@(0),[string] $InputText='',[switch] $ShowOutput)
            $result = $null
            if ($null -ne $CommandRunner) { $result = & $CommandRunner $Tool $Arguments $Directory $InputText }
            if ($null -eq $result) { $result = Invoke-SyncProcess $Tool $Arguments $Directory $InputText }

            if ($ShowOutput) {
                foreach ($content in @($result.Output,$result.Error)) { if (-not [string]::IsNullOrWhiteSpace($content)) { if ($password) { $content=$content.Replace($password,'***') }; Write-Host $content.TrimEnd() } }
            }
            if ($result.ExitCode -notin $AllowedCodes) {
                $detail=($result.Error+[Environment]::NewLine+$result.Output).Trim()
                if ($password) { $detail=$detail.Replace($password,'***') }
                throw "$Tool terminou com código $($result.ExitCode).`n$detail"
            }
            return $result
        }
        function Git {
            param([string[]] $Arguments,[string] $Directory=$root,[int[]] $AllowedCodes=@(0),[string] $InputText='',[switch] $ShowOutput)
            return Invoke-Client git $Arguments -Directory $Directory -AllowedCodes $AllowedCodes -InputText $InputText -ShowOutput:$ShowOutput
        }
        function Wsl {
            param([string[]] $Arguments,[switch] $ShowOutput)
            return Invoke-Client wsl.exe (@('--distribution',$distribution,'--exec')+$Arguments) -ShowOutput:$ShowOutput
        }
        function Get-LinuxPath {
            param([string] $Path)
            return (Wsl @('wslpath','-a',$Path)).Output.Trim()
        }

        $phase = 'Conferir contexto git-svn'
        Write-Host "Sincronizar integração git-svn`nDiretório: $root"
        [void] (Git @('--version') -ShowOutput)
        if ([IO.Path]::GetFullPath((Git @('rev-parse','--show-toplevel')).Output.Trim()).TrimEnd('\','/') -ine $root) { throw 'IntegrationPath deve ser a raiz Git.' }
        [void] (Git @('check-ref-format',"refs/heads/$branch")); [void] (Git @('check-ref-format',$svnRef))
        $gitDirectory = [IO.Path]::GetFullPath((Git @('rev-parse','--absolute-git-dir')).Output.Trim()).TrimEnd('\','/')
        if (-not $gitDirectory.StartsWith($root+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)) { throw 'A integração deve possuir seus metadados Git dentro da própria pasta.' }
        foreach ($operation in @('MERGE_HEAD','rebase-merge','rebase-apply','CHERRY_PICK_HEAD','REVERT_HEAD','sequencer')) {
            if (Test-Path -LiteralPath (Join-Path $gitDirectory $operation)) { throw "Operação Git em andamento: $operation" }
        }
        $remotes = @((Git @('config','--get-regexp','^svn-remote\..*\.url$')).Output.Trim() -split '\r?\n')
        if ($remotes.Count -ne 1 -or $remotes[0] -notmatch '^svn-remote\.(.+)\.url\s+(\S+)$') { throw 'Configure uma única origem SVN nesta ponte.' }
        $remoteName=$Matches[1]; $svnUrl=$Matches[2].TrimEnd('/')
        if (-not $svnUrl.EndsWith($suffix,[StringComparison]::Ordinal)) { throw "URL SVN diferente da integração configurada: $svnUrl" }
        if (-not (Git @('config','--get',"svn-remote.$remoteName.fetch")).Output.Trim().EndsWith(":"+$svnRef,[StringComparison]::Ordinal)) { throw 'SvnRef não corresponde ao mapeamento git-svn.' }
        $origin = (Git @('remote','get-url','origin')).Output.Trim()
        if ([string]::IsNullOrWhiteSpace($origin)) { throw 'Configure o remoto origin do GitHub na integração.' }
        if ($origin -match '^https?://[^/]*@') { throw 'Use origin sem credenciais embutidas na URL.' }
        [void] (Wsl @('git','svn','--version') -ShowOutput)
        $linuxRoot = Get-LinuxPath $root
        if (-not $linuxRoot.StartsWith('/')) { throw 'O WSL não retornou um caminho Linux válido.' }
        $cache = Join-Path $gitDirectory 'hwdesktop-sync'
        [void] [IO.Directory]::CreateDirectory($cache)
        $askPass = New-GitSvnAskPass $cache $credentials
        $linuxAskPass = Get-LinuxPath $askPass.Path
        $linuxNoPrompt = if ($askPass.Path -eq $askPass.NoPromptPath) { $linuxAskPass } else { Get-LinuxPath $askPass.NoPromptPath }
        [void] (Wsl @('chmod','u+x',$linuxAskPass,$linuxNoPrompt))
        $environment = @("GIT_ASKPASS=$linuxAskPass","SSH_ASKPASS=$linuxNoPrompt")
        $svnAuthOptions = @()
        if ($null -ne $credentials) {
            $environment += "HWDESKTOP_SVN_SECRETS_FILE=$(Get-LinuxPath $credentials.Path)"
            $svnAuthOptions = @('--username',$credentials.UserName,'--no-auth-cache')
        }
        if ($config.ContainsKey('OpenSslConfig') -and -not [string]::IsNullOrWhiteSpace([string] $config.OpenSslConfig)) {
            $openssl = [IO.Path]::GetFullPath([IO.Path]::Combine($configDirectory,$config.OpenSslConfig))
            if (-not [IO.File]::Exists($openssl)) { throw "Configuração OpenSSL não encontrada: $openssl" }
            $environment += "OPENSSL_CONF=$(Get-LinuxPath $openssl)"
        }
        $phase = 'Receber revisões SVN'
        Write-Host "`nRecebendo revisões pelo git-svn; arquivos locais e branch atual preservados..."
        [void] (Wsl (@('env')+$environment+@('git','-C',$linuxRoot,'svn','fetch','-R',$remoteName)+$svnAuthOptions) -ShowOutput)
        $svnCommit = (Git @('rev-parse','--verify',"$svnRef^{commit}")).Output.Trim()
        $message = (Git @('log','-1','--format=%B',$svnCommit)).Output
        if ($message -notmatch '(?m)^git-svn-id: (\S+)@([0-9]+) [0-9a-fA-F-]+\s*$') { throw 'A referência SVN não possui identificação de revisão válida.' }
        $revisionUrl=$Matches[1]; $revision=$Matches[2]
        if ($revisionUrl.TrimEnd('/') -cne $svnUrl) { throw 'A referência recebida pertence a outra URL SVN.' }
        Write-Host "Base recebida: SVN r$revision ($svnCommit)"

        $phase = 'Preparar destino GitHub'
        $mirror = Join-Path $cache 'github.git'; $owner = Join-Path $mirror 'hwdesktop-owner.json'
        if ([IO.Directory]::Exists($mirror)) {
            if (-not [IO.File]::Exists($owner) -or ((Get-Content -LiteralPath $owner -Raw | ConvertFrom-Json).root -ine $root)) { throw 'Cache GitHub existente não pertence a esta automação.' }
            if ((Git @('remote','get-url','origin') -Directory $mirror).Output.Trim() -cne $origin) { throw 'O origin do cache difere do origin da integração.' }
        } else {
            [void] (Git @('init','--bare',$mirror))
            [IO.File]::WriteAllText($owner,(@{root=$root}|ConvertTo-Json),[Text.UTF8Encoding]::new($false))
            [void] (Git @('remote','add','origin',$origin) -Directory $mirror)
        }
        [void] (Git @('fetch','origin',"+refs/heads/${branch}:refs/heads/$branch") -Directory $mirror -ShowOutput)
        [void] (Git @('symbolic-ref','HEAD',"refs/heads/$branch") -Directory $mirror)
        $parent = (Git @('rev-parse',"refs/heads/$branch") -Directory $mirror).Output.Trim()
        $run = Join-Path $cache ('run-'+[guid]::NewGuid().ToString('N'))
        [void] (Git @('clone','--shared','--no-checkout',$mirror,$run))
        [void] (Git @('read-tree',$parent) -Directory $run)
        [void] (Git @('config','core.autocrlf','true') -Directory $run)
        $records = [Collections.Generic.List[object]]::new()
        foreach ($entry in (Git @('ls-tree','-r','-z',$svnCommit)).Output.Split([char]0)) {
            if (-not $entry) { continue }
            if ($entry -notmatch '^([0-9]+) blob ([0-9a-f]+)\t(.+)$') { throw 'Tipo de objeto SVN não suportado.' }
            $records.Add([pscustomobject]@{Mode=$Matches[1];Hash=$Matches[2];Path=$Matches[3]})
        }
        if (@($records | Where-Object { $_.Path -ceq '.gitignore' }).Count -ne 1) { throw 'A base SVN deve conter .gitignore na raiz para delimitar a publicação.' }
        $ignores = @($records | Where-Object { [IO.Path]::GetFileName($_.Path) -ceq '.gitignore' })
        Export-GitSvnBlobs $root $run $ignores
        $inputPaths = (($records.Path -join [char]0)+[char]0)
        $ignoredOutput = (Git @('check-ignore','-z','--stdin') -Directory $run -AllowedCodes @(0,1) -InputText $inputPaths).Output
        $ignored = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
        foreach ($path in $ignoredOutput.Split([char]0)) { if ($path) { [void] $ignored.Add($path) } }
        $selected = @($records | Where-Object { -not $ignored.Contains($_.Path) })
        $unique = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
        foreach ($record in $selected) { if (-not $unique.Add($record.Path)) { throw "Caminhos que diferem apenas em maiúsculas/minúsculas: $($record.Path)" } }
        Write-Host "Arquivos SVN selecionados para o GitHub: $($selected.Count)"
        Export-GitSvnBlobs $root $run $selected
        $phase = 'Registrar estado SVN no GitHub'
        [void] (Git @('add','--all','--','.') -Directory $run)
        [void] (Git @('diff','--cached','--stat') -Directory $run -ShowOutput)
        $difference = Git @('diff','--cached','--quiet') -Directory $run -AllowedCodes @(0,1)
        if ($difference.ExitCode -eq 1) {
            foreach ($key in @('user.name','user.email')) {
                $identity = Git @('config','--get',$key) -AllowedCodes @(0,1)
                if ($identity.ExitCode -eq 0) { [void] (Git @('config',$key,$identity.Output.Trim()) -Directory $run) }
            }
            [void] (Git @('commit','-m',"Sincronizacao SVN r$revision") -Directory $run -ShowOutput)
        } else { Write-Host 'Sem diferenças para registrar; nenhum commit criado.' }
        $commit = (Git @('rev-parse','HEAD') -Directory $run).Output.Trim()
        $phase = 'Publicar GitHub'; $keepRun = $true
        [void] (Git @('push',$origin,"HEAD:refs/heads/$branch") -Directory $run -ShowOutput)
        $state = @{schemaVersion=1;svnRevision=$revision;svnCommit=$svnCommit;githubParent=$parent;githubCommit=$commit}
        [IO.File]::WriteAllText((Join-Path $cache 'last-sync.json'),($state|ConvertTo-Json),[Text.UTF8Encoding]::new($false))
        $keepRun = $false
        Write-Host "`nSincronização concluída: SVN r$revision publicada em origin/$branch.`nA branch e os arquivos locais da linha SVN permaneceram preservados."
    } catch {
        $retained = if ($keepRun -and $run) { "`nCommit e preparação preservados em: $run" } else { '' }
        throw "Etapa '$phase': $($_.Exception.Message)$retained`nNenhum dcommit, reset da linha SVN ou push forçado foi executado."
    } finally {
        if ($run -and -not $keepRun -and [IO.Directory]::Exists($run)) {
            $expected = [IO.Path]::GetFullPath((Join-Path $gitDirectory 'hwdesktop-sync')).TrimEnd('\','/')
            if ([IO.Path]::GetDirectoryName($run) -ieq $expected -and (Split-Path -Leaf $run) -match '^run-[a-f0-9]{32}$') { Remove-Item -LiteralPath $run -Recurse -Force }
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    [Console]::Error.WriteLine('Execute a entrada comum workflow/sync-integration.ps1 na raiz da integração.')
    exit 1
}
