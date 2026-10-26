param(
    [Parameter(Mandatory=$true, HelpMessage="Diretório base para calcular os caminhos relativos (geralmente o diretório do .dpr ou .dpk).")]
    [string]$DprDirectory,

    [Parameter(Mandatory=$true, HelpMessage="Diretório onde a busca por arquivos .pas será realizada. Pode ser absoluto ou relativo ao DprDirectory.")]
    [string]$SearchDirectory,

    [Parameter(Mandatory=$false, HelpMessage="Arquivo de saída para a lista de unidades.")]
    [string]$OutputFile = (Join-Path $PSScriptRoot "temp-dpr.txt"),

    [Parameter(Mandatory=$false, HelpMessage="Lista de caminhos relativos (a partir do SearchDirectory) a serem excluídos.")]
    [string[]]$ExcludeFolders = @(),

    [Parameter(Mandatory=$false, HelpMessage="Lista de subcaminhos específicos para INCLUIR (relativos ao SearchDirectory).")]
    [string[]]$IncludeSubpaths = @(),

    [Parameter(Mandatory=$false, HelpMessage="Habilita o output de debug no console para ver as decisões de filtro.")]
    [switch]$EnableDebug
)

# Pastas de IA/Configurações excluídas automaticamente (assumindo que estejam na raiz do SearchDirectory)
$ExcludeFolders += ".ai", ".ai-runs", ".aider-desk", ".kilo", ".vscode", ".AI.Calibration"

# === RESOLUÇÃO DE CAMINHOS ===
try {
    $dprDir = Resolve-Path $DprDirectory -ErrorAction Stop

    if (-not [System.IO.Path]::IsPathRooted($SearchDirectory)) {
        $SearchDirectory = Join-Path $dprDir $SearchDirectory
    }
    $searchDir = Resolve-Path $SearchDirectory -ErrorAction Stop
}
catch {
    Write-Error "Erro ao resolver caminho: $($_.Exception.Message)"
    exit 1
}

# === FUNÇÕES AUXILIARES ===

function Get-RelativePath {
    param([string]$AbsolutePath, [string]$RelativeTo)
    $basePath = (Resolve-Path $RelativeTo).ProviderPath
    $fullPath = (Resolve-Path $AbsolutePath).ProviderPath
    $relativePath = [System.IO.Path]::GetRelativePath($basePath, $fullPath)
    return $relativePath -replace '/', '\'
}

function Test-IncludedPath {
    param(
        [string]$FilterPath,
        [string[]]$IncludeList
    )
    foreach ($includePath in $IncludeList) {
        $cleanInclude = $includePath.Trim() -replace '/', '\'
        if ([string]::IsNullOrWhiteSpace($cleanInclude)) { continue }

        # Match estrito de prefixo relativo ao SearchDirectory
        if ($FilterPath.StartsWith($cleanInclude + '\', [StringComparison]::OrdinalIgnoreCase) -or
            $FilterPath.Equals($cleanInclude, [StringComparison]::OrdinalIgnoreCase)) {
            return $true
        }
    }
    return $false
}

function Test-ExcludedFolder {
    param(
        [string]$FilterPath,
        [string[]]$ExcludeList
    )
    foreach ($excludeItem in $ExcludeList) {
        # Limpeza: remove espaços acidentais e normaliza separadores
        $cleanExclude = $excludeItem.Trim() -replace '/', '\'
        if ([string]::IsNullOrWhiteSpace($cleanExclude)) { continue }

        # Match estrito de prefixo relativo ao SearchDirectory
        # Isso garante que "ERP.UnitTests" NÃO mate "Tests\ERP.UnitTests"
        if ($FilterPath.StartsWith($cleanExclude + '\', [StringComparison]::OrdinalIgnoreCase) -or
            $FilterPath.Equals($cleanExclude, [StringComparison]::OrdinalIgnoreCase)) {
            return $true
        }
    }
    return $false
}

function Test-FileFilter-Debug {
    param(
        [PSCustomObject]$FileObj,
        [string[]]$IncludeList,
        [string[]]$ExcludeList,
        [bool]$ShowDebug = $false
    )

    $relPath    = $FileObj.RelativePath
    $filterPath = $FileObj.FilterPath
    $unitName   = $FileObj.UnitName

    $isIncluded = Test-IncludedPath -FilterPath $filterPath -IncludeList $IncludeList
    $isExcluded = Test-ExcludedFolder -FilterPath $filterPath -ExcludeList $ExcludeList

    $shouldInclude = if ($isIncluded) { $true } elseif ($isExcluded) { $false } else { $true }

    if ($ShowDebug) {
        $status = if ($shouldInclude) { "✅ INCLUIR" } else { "🚫 EXCLUIR" }
        $reason = if ($isIncluded) { "(forçado por INCLUDE)" }
                  elseif ($isExcluded) { "(pasta excluída)" }
                  else { "(padrão)" }

        Write-Host "[$status] $reason" -ForegroundColor $(if ($shouldInclude) { "Green" } else { "Red" })
        Write-Host "   📄 $unitName" -ForegroundColor Gray
        Write-Host "   📍 Output: $relPath" -ForegroundColor DarkGray
        Write-Host "   🔍 Filter: $filterPath" -ForegroundColor Cyan
        Write-Host ""
    }

    return $shouldInclude
}

# === EXECUÇÃO PRINCIPAL ===

$pasFiles = Get-ChildItem -Path $searchDir.Path -Filter *.pas -Recurse | ForEach-Object {
    # RelativePath: relativo ao DprDirectory (para o output no .dpr)
    $relativeFilePath = Get-RelativePath -AbsolutePath $_.FullName -RelativeTo $dprDir

    # FilterPath: relativo ao SearchDirectory (para as regras de include/exclude)
    # Como é relativo à raiz da busca, NUNCA terá "..\" no início, simplificando tudo.
    $filterPath = Get-RelativePath -AbsolutePath $_.FullName -RelativeTo $searchDir

    return [PSCustomObject]@{
        FullName     = $_.FullName
        RelativePath = $relativeFilePath
        FilterPath   = $filterPath
        UnitName     = $_.BaseName
    }
} | Where-Object {
    Test-FileFilter-Debug -FileObj $_ -IncludeList $IncludeSubpaths -ExcludeList $ExcludeFolders -ShowDebug $EnableDebug.IsPresent
} | ForEach-Object {
    "  $($_.UnitName) in '$($_.RelativePath)',"
}

# Garante que o diretório de saída existe
$outputDir = Split-Path $OutputFile -Parent
if ($outputDir -and -not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

# Salva o resultado
$pasFiles | Out-File -FilePath $OutputFile -Encoding UTF8
Write-Host "✅ Arquivo gerado: $OutputFile" -ForegroundColor Green
Write-Host "📦 Total de unidades encontradas: $($pasFiles.Count)" -ForegroundColor Cyan