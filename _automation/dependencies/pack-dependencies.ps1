#Requires -Version 7.5
<#
.SYNOPSIS
    Prepara uma pasta de dependências pronta para publicar, sem acessar WebDAV.
.PARAMETER SourcePath
    Pasta curada com build, runtime/third-party (ou baseline) e runtime/internal.
.PARAMETER OutputPath
    Nova pasta dependencies. Deve não existir; a origem permanece intacta.
.PARAMETER Version
    Versão inicial de cada conjunto e módulo, por padrão v0001.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)] [string] $SourcePath,
    [Parameter(Mandatory)] [string] $OutputPath,
    [ValidatePattern('^[A-Za-z0-9][A-Za-z0-9._-]*$')] [string] $Version = 'v0001'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-PayloadFiles {
    param([string] $Directory)
    if (-not [IO.Directory]::Exists($Directory)) { throw "Pasta de origem ausente: $Directory" }
    # Aceita a base já colocada numa única pasta de versão, sem duplicá-la no ZIP.
    $entries = @(Get-ChildItem -LiteralPath $Directory -Force)
    if ($entries.Count -eq 1 -and $entries[0].PSIsContainer -and $entries[0].Name -match '^v\d+$') {
        $Directory = $entries[0].FullName
    }
    $files = @(Get-ChildItem -LiteralPath $Directory -Recurse -File -Force | Sort-Object FullName)
    if ($files.Count -eq 0) { throw "Pasta de origem vazia: $Directory" }
    [pscustomobject]@{ Root = $Directory; Files = $files }
}

function Get-FileRecord {
    param([string] $Path, [string] $Name)
    [ordered]@{
        path = $Name
        size = [IO.FileInfo]::new($Path).Length
        sha256 = (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
    }
}

function Write-Manifest {
    param([string] $Path, $Data)
    $json = ConvertTo-Json -InputObject $Data -Depth 12
    [IO.File]::WriteAllText($Path, $json + [Environment]::NewLine, [Text.UTF8Encoding]::new($false))
}

function Invoke-PackDependencies {
    param([string] $SourcePath, [string] $OutputPath, [ValidatePattern('^[A-Za-z0-9][A-Za-z0-9._-]*$')] [string] $Version)
    $source = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($SourcePath).TrimEnd('\', '/')
    $output = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputPath).TrimEnd('\', '/')
    $separator = [IO.Path]::DirectorySeparatorChar
    if ($output.Equals($source, [StringComparison]::OrdinalIgnoreCase) -or
        $output.StartsWith($source + $separator, [StringComparison]::OrdinalIgnoreCase) -or
        $source.StartsWith($output + $separator, [StringComparison]::OrdinalIgnoreCase)) {
        throw 'A saída deve ser separada da origem, sem conter ou ser contida por ela.'
    }
    if (Test-Path -LiteralPath $output) { throw "A saída já existe e não será substituída: $output" }
    if (-not [IO.Directory]::Exists($source)) { throw "Origem não encontrada: $source" }

    $build = Get-PayloadFiles (Join-Path $source 'build')
    $baselinePath = Join-Path $source 'runtime\baseline'
    if (-not [IO.Directory]::Exists($baselinePath)) { $baselinePath = Join-Path $source 'runtime\third-party' }
    $baseline = Get-PayloadFiles $baselinePath
    $internal = Get-PayloadFiles (Join-Path $source 'runtime\internal')
    $modules = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($file in $internal.Files) {
        if (-not $modules.Add($file.BaseName)) { throw "Nome de módulo repetido na origem: $($file.BaseName)" }
    }

    $parent = Split-Path -Parent $output
    [void] [IO.Directory]::CreateDirectory($parent)
    $stage = $output + '.staging-' + [guid]::NewGuid().ToString('N')
    $stage = [IO.Path]::GetFullPath($stage)
    if (-not $stage.StartsWith($parent.TrimEnd('\', '/') + $separator, [StringComparison]::OrdinalIgnoreCase)) {
        throw 'Área temporária fora do diretório de saída.'
    }
    try {
        [void] [IO.Directory]::CreateDirectory($stage)
        $allSourceRecords = [Collections.Generic.List[object]]::new()
        $index = [ordered]@{ schemaVersion = 1; build = ''; runtime = [ordered]@{ baseline = ''; internal = @() } }

        $groups = [Collections.Generic.List[object]]::new()
        $groups.Add(@{ Id = 'build'; Kind = 'build'; Relative = 'build'; Payload = $build })
        $groups.Add(@{ Id = 'baseline'; Kind = 'baseline'; Relative = 'runtime/baseline'; Payload = $baseline })
        foreach ($file in $internal.Files) {
            $groups.Add(@{
                Id = $file.BaseName; Kind = 'internal'; Relative = "runtime/internal/$($file.BaseName)"
                Payload = @{ Root = $file.DirectoryName; Files = @($file) }
            })
        }
        # Todos os itens, inclusive módulos individuais, usam o mesmo algoritmo ZIP.
        foreach ($group in $groups) {
            $relative = "$($group.Relative)/$Version"
            $directory = Join-Path $stage $relative
            [void] [IO.Directory]::CreateDirectory($directory)
            $zipPath = Join-Path $directory 'bundle.zip'
            $records = [Collections.Generic.List[object]]::new()
            $zip = [IO.Compression.ZipFile]::Open($zipPath, [IO.Compression.ZipArchiveMode]::Create)
            try {
                foreach ($file in $group.Payload.Files) {
                    $name = [IO.Path]::GetRelativePath($group.Payload.Root, $file.FullName).Replace('\', '/')
                    $record = Get-FileRecord $file.FullName $name
                    $records.Add($record)
                    $allSourceRecords.Add(@{ Source = $file.FullName; Record = $record })
                    [void] [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $file.FullName, $name, [IO.Compression.CompressionLevel]::Optimal)
                }
            }
            finally { $zip.Dispose() }
            # Conferir o conteúdo real do ZIP, não apenas sua lista de nomes.
            $zip = [IO.Compression.ZipFile]::OpenRead($zipPath)
            try {
                if ($zip.Entries.Count -ne $records.Count) { throw "Quantidade divergente no pacote $relative" }
                foreach ($entry in $zip.Entries) {
                    $record = $records | Where-Object { $_.path -ceq $entry.FullName } | Select-Object -First 1
                    $stream = $entry.Open()
                    $sha = [Security.Cryptography.SHA256]::Create()
                    try { $hash = [Convert]::ToHexString($sha.ComputeHash($stream)).ToLowerInvariant() }
                    finally { $stream.Dispose(); $sha.Dispose() }
                    if ($null -eq $record -or $hash -ne $record.sha256 -or $entry.Length -ne $record.size) {
                        throw "Conteúdo divergente no pacote: $($entry.FullName)"
                    }
                }
            }
            finally { $zip.Dispose() }
            $manifest = [ordered]@{
                schemaVersion = 1; id = $group.Id; version = $Version
                artifact = (Get-FileRecord $zipPath 'bundle.zip'); files = @($records.ToArray())
            }
            Write-Manifest (Join-Path $directory 'manifest.json') $manifest
            $manifestPath = "$relative/manifest.json"
            switch ($group.Kind) {
                'build' { $index.build = $manifestPath }
                'baseline' { $index.runtime.baseline = $manifestPath }
                'internal' { $index.runtime.internal += $manifestPath }
            }
            Write-Host "$($group.Id): $($records.Count) arquivo(s) em $relative/bundle.zip"
        }

        # Uma edição da origem durante o empacotamento não deve produzir uma base anunciada.
        foreach ($item in $allSourceRecords) {
            $current = Get-FileRecord $item.Source $item.Record.path
            if ($current.sha256 -ne $item.Record.sha256 -or $current.size -ne $item.Record.size) {
                throw "A origem mudou durante o empacotamento: $($item.Source)"
            }
        }
        Write-Manifest (Join-Path $stage 'index.json') $index
        # A área temporária foi criada ao lado da saída; mover não toca na origem.
        if (Test-Path -LiteralPath $output) { throw "A saída passou a existir e não será substituída: $output" }
        [IO.Directory]::Move($stage, $output)
        Write-Host "`nDependências prontas para publicação: $output"
        Write-Host "Total: $($allSourceRecords.Count) arquivo(s) de origem; nenhuma alteração na origem."
    }
    finally {
        $expectedPrefix = $output + '.staging-'
        if ($stage.StartsWith($expectedPrefix, [StringComparison]::OrdinalIgnoreCase) -and
            (Split-Path -Leaf $stage) -match '\.staging-[a-f0-9]{32}$' -and [IO.Directory]::Exists($stage)) {
            Remove-Item -LiteralPath $stage -Recurse -Force
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    try { Invoke-PackDependencies -SourcePath $SourcePath -OutputPath $OutputPath -Version $Version; exit 0 }
    catch { [Console]::Error.WriteLine("Falha ao preparar publicação: $($_.Exception.Message)"); exit 1 }
}
