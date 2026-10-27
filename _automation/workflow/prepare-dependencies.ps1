#Requires -Version 7.5
<#
.SYNOPSIS
    Obtém as dependências no Nextcloud e aplica build em dcp e runtime em bpl.
.PARAMETER WorkPath
    Clone alvo nesta execução. Por padrão, usa o projeto do próprio script.
.PARAMETER ConfigPath
    Configuração individual dependencies.local.psd1 do clone alvo.
#>
[CmdletBinding()]
param([string] $WorkPath, [string] $ConfigPath)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function ConvertTo-DependencyPath {
    param([string] $Path)
    $value = $Path.Replace('\', '/')
    if ([string]::IsNullOrWhiteSpace($value) -or $value.StartsWith('/')) { throw "Caminho relativo inválido: $Path" }
    foreach ($part in $value.Split('/')) {
        if ($part -in @('', '.', '..') -or $part.EndsWith('.') -or $part.EndsWith(' ') -or
            $part.IndexOfAny([IO.Path]::GetInvalidFileNameChars()) -ge 0 -or $part.Contains(':')) {
            throw "Caminho relativo inválido: $Path"
        }
    }
    return $value
}

function Assert-DependencyLocalPath {
    param([string] $Root, [string] $Path)
    $full = [IO.Path]::GetFullPath($Path)
    if (-not $full.StartsWith($Root + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Destino fora do clone: $full"
    }
    $current = $Root
    foreach ($part in [IO.Path]::GetRelativePath($Root, $full).Split([IO.Path]::DirectorySeparatorChar)) {
        $current = Join-Path $current $part
        if ((Test-Path -LiteralPath $current) -and ((Get-Item -LiteralPath $current -Force).Attributes -band [IO.FileAttributes]::ReparsePoint)) {
            throw "Destino com redirecionamento de diretório/arquivo não permitido: $current"
        }
    }
}

function Get-DependencyHash {
    param([string] $Path)
    if ([IO.Directory]::Exists($Path)) { throw "Destino de arquivo ocupado por uma pasta: $Path" }
    if (-not [IO.File]::Exists($Path)) { return '' }
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}

function Read-DependencySecrets {
    param([string] $Path)
    if (-not [IO.File]::Exists($Path)) { throw "Arquivo de segredos não encontrado: $Path" }
    $values = @{}
    foreach ($line in [IO.File]::ReadAllLines($Path)) {
        if ($line -match '^\s*(NEXTCLOUD_USER|NEXTCLOUD_PASS)\s*=(.*)$') { $values[$Matches[1]] = $Matches[2].Trim() }
    }
    foreach ($key in @('NEXTCLOUD_USER', 'NEXTCLOUD_PASS')) {
        if (-not $values.ContainsKey($key) -or [string]::IsNullOrWhiteSpace($values[$key])) { throw "Chave ausente ou vazia no arquivo de segredos: $key" }
    }
    return $values
}

function Invoke-PrepareDependencies {
    # As substituições abaixo são internas aos testes; a entrada CLI usa HTTP e cópia normais.
    param([string] $WorkPath, [string] $ConfigPath, [scriptblock] $DownloadFile, [scriptblock] $ApplyFile)
    $phase = 'Conferir clone'
    $password = ''
    $client = $null
    $run = ''
    $keepRun = $false
    try {
        $sourceRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\..')).TrimEnd('\', '/')
        if ([string]::IsNullOrWhiteSpace($WorkPath)) {
            if ([IO.Directory]::Exists((Join-Path $sourceRoot '.svn'))) {
                if ([Console]::IsInputRedirected) { throw 'Informe -WorkPath com o clone Git a preparar, ou abra o menu desse clone.' }
                $WorkPath = Read-Host 'Diretório do clone Git de trabalho (Enter para cancelar)'
                if ([string]::IsNullOrWhiteSpace($WorkPath)) { Write-Host 'Preparação cancelada.'; return }
            }
            else { $WorkPath = $sourceRoot }
        }
        $root = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($WorkPath).TrimEnd('\', '/')
        if (-not [IO.Directory]::Exists($root) -or -not (Test-Path -LiteralPath (Join-Path $root '.git'))) { throw "Clone Git não encontrado: $root" }
        if ([IO.Directory]::Exists((Join-Path $root '.svn'))) { throw 'Preparar dependências deve atuar num clone somente Git, sem working copy SVN.' }

        $phase = 'Ler configuração'
        $configFile = if ([string]::IsNullOrWhiteSpace($ConfigPath)) { Join-Path $root '_automation\config\dependencies.local.psd1' } else { [IO.Path]::GetFullPath($ConfigPath) }
        if (-not [IO.File]::Exists($configFile)) { throw "Configuração não encontrada: $configFile. Copie dependencies.exemplo.psd1 para dependencies.local.psd1." }
        $config = Import-PowerShellDataFile -LiteralPath $configFile
        foreach ($key in @('WebDavUrl', 'RemoteDirectory', 'SecretsFile')) {
            if (-not $config.ContainsKey($key) -or [string]::IsNullOrWhiteSpace([string] $config[$key])) { throw "Campo obrigatório vazio: $key" }
        }
        $baseUri = [uri] ([string] $config.WebDavUrl).TrimEnd('/')
        if (-not $baseUri.IsAbsoluteUri -or $baseUri.Scheme -ne 'https' -or $baseUri.UserInfo -or $baseUri.Query -or $baseUri.Fragment) {
            throw 'WebDavUrl deve ser uma URL HTTPS sem credenciais, query ou fragmento.'
        }
        $remoteDirectory = ConvertTo-DependencyPath ([string] $config.RemoteDirectory).Trim('/')
        $secretsFile = [IO.Path]::GetFullPath([IO.Path]::Combine((Split-Path -Parent $configFile), $config.SecretsFile))
        $secrets = Read-DependencySecrets $secretsFile
        $password = $secrets.NEXTCLOUD_PASS
        if ($null -eq $DownloadFile) {
            $handler = [Net.Http.HttpClientHandler]::new()
            $handler.AllowAutoRedirect = $false
            $client = [Net.Http.HttpClient]::new($handler)
            $client.Timeout = [TimeSpan]::FromMinutes(10)
            $token = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($secrets.NEXTCLOUD_USER + ':' + $password))
            $client.DefaultRequestHeaders.Authorization = [Net.Http.Headers.AuthenticationHeaderValue]::new('Basic', $token)
        }

        $temporary = Join-Path $root '_automation\temp\dependencies'
        $cache = Join-Path $temporary 'cache'
        Assert-DependencyLocalPath $root $cache
        [void] [IO.Directory]::CreateDirectory($cache)
        $run = Join-Path $temporary ('run-' + [guid]::NewGuid().ToString('N'))
        [void] [IO.Directory]::CreateDirectory($run)

        function Receive-Dependency {
            param([string] $Relative, [string] $Destination)
            $relativePath = ConvertTo-DependencyPath $Relative
            if ($null -ne $DownloadFile) { & $DownloadFile $relativePath $Destination; return }
            $encoded = (($remoteDirectory + '/' + $relativePath).Split('/') | ForEach-Object { [uri]::EscapeDataString($_) }) -join '/'
            $uri = [uri] ($baseUri.AbsoluteUri.TrimEnd('/') + '/' + $encoded)
            $response = $null
            try {
                $response = $client.GetAsync($uri, [Net.Http.HttpCompletionOption]::ResponseHeadersRead).GetAwaiter().GetResult()
                if (-not $response.IsSuccessStatusCode) { throw "Falha no download de $relativePath (HTTP $([int] $response.StatusCode))." }
                $stream = $response.Content.ReadAsStreamAsync().GetAwaiter().GetResult()
                $file = [IO.File]::Create($Destination)
                try { $stream.CopyTo($file) }
                finally { $file.Dispose(); $stream.Dispose() }
            }
            finally { if ($null -ne $response) { $response.Dispose() } }
        }
        function Read-RemoteJson {
            param([string] $Relative, [string] $Name)
            $path = Join-Path $run $Name
            Receive-Dependency $Relative $path
            return [IO.File]::ReadAllText($path) | ConvertFrom-Json
        }

        Write-Host ("Preparar dependências" + [Environment]::NewLine + "Clone: $root")
        $phase = 'Ler composição publicada'
        $index = Read-RemoteJson 'index.json' 'index.json'
        if ($index.schemaVersion -ne 1) { throw 'Versão de índice não suportada.' }
        $requests = [Collections.Generic.List[object]]::new()
        $requests.Add(@{ Reference = [string] $index.build; Target = 'dcp' })
        $requests.Add(@{ Reference = [string] $index.runtime.baseline; Target = 'bpl' })
        foreach ($reference in @($index.runtime.internal)) { $requests.Add(@{ Reference = [string] $reference; Target = 'bpl' }) }
        $items = [Collections.Generic.List[object]]::new()
        $destinations = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
        $counter = 0
        foreach ($request in $requests) {
            $reference = ConvertTo-DependencyPath $request.Reference
            $manifest = Read-RemoteJson $reference ("manifest-$counter.json")
            $counter++
            if ($manifest.schemaVersion -ne 1 -or [string]::IsNullOrWhiteSpace([string] $manifest.id) -or [string]::IsNullOrWhiteSpace([string] $manifest.version)) {
                throw "Manifesto inválido: $reference"
            }
            if ($manifest.artifact.path -cne 'bundle.zip' -or [string] $manifest.artifact.sha256 -notmatch '^[a-fA-F0-9]{64}$' -or [long] $manifest.artifact.size -lt 0) {
                throw "Artefato inválido: $reference"
            }
            $files = [Collections.Generic.List[object]]::new()
            if (@($manifest.files).Count -eq 0) { throw "Manifesto sem arquivos: $reference" }
            foreach ($record in @($manifest.files)) {
                $name = ConvertTo-DependencyPath ([string] $record.path)
                if ([string] $record.sha256 -notmatch '^[a-fA-F0-9]{64}$' -or [long] $record.size -lt 0) { throw "Registro de arquivo inválido: $name" }
                $destination = [IO.Path]::GetFullPath((Join-Path (Join-Path $root $request.Target) $name))
                Assert-DependencyLocalPath $root $destination
                if (-not $destinations.Add($destination)) { throw "Destino repetido entre as dependências: $destination" }
                $files.Add([pscustomobject]@{
                    Name = $name; Hash = ([string] $record.sha256).ToLowerInvariant(); Size = [long] $record.size
                    Destination = $destination; PreviousHash = (Get-DependencyHash $destination)
                    PreviousWriteTimeUtc = [IO.File]::GetLastWriteTimeUtc($destination)
                    Staged = ''; Backup = ''; WriteTimeUtc = $null
                })
            }
            $relativeParent = ($reference -split '/') | Select-Object -SkipLast 1
            $bundle = (@($relativeParent) + @('bundle.zip')) -join '/'
            $items.Add([pscustomobject]@{
                Id = [string] $manifest.id; Version = [string] $manifest.version; Reference = $reference
                Bundle = $bundle; Hash = ([string] $manifest.artifact.sha256).ToLowerInvariant()
                Size = [long] $manifest.artifact.size; Files = $files
            })
        }

        $phase = 'Baixar e conferir pacotes'
        $plan = [Collections.Generic.List[object]]::new()
        $counter = 0
        foreach ($item in $items) {

            $archive = Join-Path $cache ($item.Hash + '.zip')
            Assert-DependencyLocalPath $root $archive
            if (-not [IO.File]::Exists($archive) -or [IO.FileInfo]::new($archive).Length -ne $item.Size -or (Get-DependencyHash $archive) -ne $item.Hash) {
                Write-Host "[DOWNLOAD] $($item.Id) $($item.Version)"
                $download = Join-Path $run ("download-$counter.zip")
                Receive-Dependency $item.Bundle $download
                if ([IO.FileInfo]::new($download).Length -ne $item.Size -or (Get-DependencyHash $download) -ne $item.Hash) { throw "Tamanho ou SHA-256 divergente: $($item.Bundle)" }
                [IO.File]::Move($download, $archive, $true)
            }
            else { Write-Host "[CACHE] $($item.Id) $($item.Version)" }
            $unpack = Join-Path $run ("files-$counter")
            $counter++
            [void] [IO.Directory]::CreateDirectory($unpack)
            $records = [Collections.Generic.Dictionary[string, object]]::new([StringComparer]::OrdinalIgnoreCase)
            foreach ($record in $item.Files) { $records.Add($record.Name, $record) }
            $seen = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
            $zip = [IO.Compression.ZipFile]::OpenRead($archive)
            try {
                if ($zip.Entries.Count -ne $item.Files.Count) { throw "Quantidade de arquivos divergente: $($item.Id)" }
                foreach ($entry in $zip.Entries) {
                    $name = ConvertTo-DependencyPath $entry.FullName
                    if (-not $records.ContainsKey($name) -or -not $seen.Add($name)) { throw "Arquivo inesperado ou repetido no ZIP: $name" }
                    $record = $records[$name]
                    if ($entry.Length -ne $record.Size) { throw "Tamanho divergente dentro do ZIP: $name" }
                    $staged = [IO.Path]::GetFullPath((Join-Path $unpack $name))
                    Assert-DependencyLocalPath $unpack $staged
                    [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $staged))
                    $inputStream = $entry.Open()
                    $outputStream = [IO.File]::Create($staged)
                    try { $inputStream.CopyTo($outputStream) }
                    finally { $outputStream.Dispose(); $inputStream.Dispose() }
                    if ((Get-DependencyHash $staged) -ne $record.Hash) { throw "SHA-256 divergente dentro do ZIP: $name" }
                    # O ZIP registra hora local, com a precisão suportada pelo formato.
                    [IO.File]::SetLastWriteTime($staged, $entry.LastWriteTime.DateTime)
                    $record.WriteTimeUtc = [IO.File]::GetLastWriteTimeUtc($staged)
                    $record.Staged = $staged
                    if ($record.PreviousHash -ne $record.Hash -or $record.PreviousWriteTimeUtc -ne $record.WriteTimeUtc) { $plan.Add($record) }
                }
            }
            finally { $zip.Dispose() }
        }

        $phase = 'Preparar aplicação'
        $backupRoot = Join-Path $run 'backup'
        [void] [IO.Directory]::CreateDirectory($backupRoot)
        $counter = 0
        foreach ($record in $plan) {
            Assert-DependencyLocalPath $root $record.Destination
            if ((Get-DependencyHash $record.Destination) -ne $record.PreviousHash -or [IO.File]::GetLastWriteTimeUtc($record.Destination) -ne $record.PreviousWriteTimeUtc) { throw "Arquivo local mudou durante a preparação: $($record.Destination). Nada foi aplicado." }
            if ($record.PreviousHash) {
                $record.Backup = Join-Path $backupRoot ([string] $counter)
                [IO.File]::Copy($record.Destination, $record.Backup, $false)
            }
            $counter++
        }
        $phase = 'Aplicar dependências'
        $journal = [Collections.Generic.List[object]]::new()
        try {
            foreach ($record in $plan) {
                [void] [IO.Directory]::CreateDirectory((Split-Path -Parent $record.Destination))
                $journal.Add($record) # Registrar antes: uma cópia com falha pode deixar arquivo parcial.
                if ($record.PreviousHash -ne $record.Hash) {
                    if ($null -ne $ApplyFile) { & $ApplyFile $record.Staged $record.Destination }
                    else { [IO.File]::Copy($record.Staged, $record.Destination, $true) }
                }
                [IO.File]::SetLastWriteTimeUtc($record.Destination, $record.WriteTimeUtc)
                if ((Get-DependencyHash $record.Destination) -ne $record.Hash) { throw "Falha na conferência do arquivo aplicado: $($record.Name)" }
                $label = if ($record.PreviousHash -ne $record.Hash) { '[APLICADO]' } else { '[DATA]' }
                Write-Host ($label + ' ' + [IO.Path]::GetRelativePath($root, $record.Destination))
            }
            $state = [ordered]@{
                schemaVersion = 1; appliedAtUtc = [DateTime]::UtcNow.ToString('o')
                items = @($items | ForEach-Object { [ordered]@{ id = $_.Id; version = $_.Version; manifest = $_.Reference; sha256 = $_.Hash } })
            }
            $stateFile = Join-Path $temporary 'last-applied.json'
            Assert-DependencyLocalPath $root $stateFile
            $stateTemp = Join-Path $run 'last-applied.json'
            [IO.File]::WriteAllText($stateTemp, (ConvertTo-Json $state -Depth 8), [Text.UTF8Encoding]::new($false))
            [IO.File]::Move($stateTemp, $stateFile, $true)
        }
        catch {
            $failure = $_.Exception.Message
            $rollbackErrors = [Collections.Generic.List[string]]::new()
            for ($i = $journal.Count - 1; $i -ge 0; $i--) {
                $record = $journal[$i]
                try {
                    if ($record.Backup) {
                        [IO.File]::Copy($record.Backup, $record.Destination, $true)
                        [IO.File]::SetLastWriteTimeUtc($record.Destination, $record.PreviousWriteTimeUtc)
                    }
                    elseif ([IO.File]::Exists($record.Destination)) { [IO.File]::Delete($record.Destination) }
                }
                catch { $rollbackErrors.Add($record.Destination) }
            }
            if ($rollbackErrors.Count -gt 0) {
                $keepRun = $true
                throw "$failure. A restauração ficou incompleta; cópias anteriores preservadas em $backupRoot. Arquivos: $($rollbackErrors -join ', ')"
            }
            throw "$failure. Os arquivos alterados nesta execução foram restaurados."
        }
        Write-Host ([Environment]::NewLine + "Dependências preparadas: $($plan.Count) arquivo(s) aplicado(s) ou com data ajustada. Build em dcp; runtime em bpl.")
    }
    catch {
        $message = $_.Exception.Message
        if ($password) { $message = $message.Replace($password, '***') }
        throw "Etapa '$phase': $message"
    }
    finally {
        if ($null -ne $client) { $client.Dispose() }
        if ($run -and -not $keepRun -and [IO.Directory]::Exists($run)) {
            $expectedParent = Join-Path $root '_automation\temp\dependencies'
            if ([IO.Path]::GetDirectoryName($run).Equals($expectedParent, [StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $run) -match '^run-[a-f0-9]{32}$') {
                Remove-Item -LiteralPath $run -Recurse -Force
            }
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    try { Invoke-PrepareDependencies -WorkPath $WorkPath -ConfigPath $ConfigPath; exit 0 }
    catch { [Console]::Error.WriteLine($_.Exception.Message); exit 1 }
}
