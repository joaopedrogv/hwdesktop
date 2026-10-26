#Requires -Version 7.5
Set-StrictMode -Version Latest

function New-HwBuildContext {
    [CmdletBinding()]
    param([string] $ProjectRoot)
    if (-not $ProjectRoot) { $ProjectRoot = Join-Path $PSScriptRoot '..\..' }
    $root = [IO.Path]::GetFullPath($ProjectRoot)
    $automation = Join-Path $root '_automation'
    if (-not (Test-Path -LiteralPath $automation -PathType Container)) {
        throw "Área de automação não encontrada: $automation"
    }
    [pscustomobject]@{
        ProjectRoot = $root
        AutomationRoot = $automation
        ConfigRoot = Join-Path $automation 'config'
        CompilerScript = Join-Path $automation 'core\build-package.bat'
        BplRoot = Join-Path $root 'bpl'
    }
}

function Get-HwBuildPackages {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] $Context,
        [ValidateSet('package-list.txt', 'reestrutura-params.txt')]
        [string] $Catalog = 'package-list.txt'
    )
    $catalogPath = Join-Path $Context.ConfigRoot $Catalog
    $number = 0
    foreach ($line in Get-Content -LiteralPath $catalogPath -ErrorAction Stop) {
        $text = $line.Trim()
        if (-not $text -or $text.StartsWith('#')) { continue }
        $parts = $text.Split(';')
        if ($parts.Count -lt 2 -or -not $parts[1].Trim()) { throw "Linha inválida em ${catalogPath}: $text" }
        $name = $parts[0].Trim()
        if ($name -notmatch '^[A-Za-z_][A-Za-z0-9_]*$') { throw "Nome de pacote inválido: $name" }
        $type = if ($parts.Count -gt 2 -and $parts[2].Trim()) { $parts[2].Trim() } else { 'NORMAL' }
        if ($type -notin @('NORMAL', 'SQL_RES')) { throw "Tipo de build inválido para ${name}: $type" }
        $number++
        [pscustomobject]@{ Order = $number; Name = $name; RelativePath = $parts[1].Trim(); BuildType = $type }
    }
    if ($number -eq 0) { throw "Nenhum pacote encontrado em $catalogPath" }
}

function Select-HwBuildPackages {
    [CmdletBinding()]
    param([Parameter(Mandatory)] [object[]] $Packages, [string[]] $Names)
    $Names = @($Names | Where-Object { $_ } | ForEach-Object { $_.Split(',') } | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    if ($Names.Count -eq 0) {
        if (-not [Environment]::UserInteractive -or [Console]::IsInputRedirected) {
            throw 'Informe -Packages para selecionar os pacotes sem abrir a janela gráfica.'
        }
        if (-not (Get-Command Out-GridView -ErrorAction SilentlyContinue)) {
            throw 'Out-GridView não está disponível. Informe os nomes com -Packages.'
        }
        Write-HwBanner '  SELECAO DE PACOTES PARA BUILD' -Color Cyan
        foreach ($message in @('Uma janela sera aberta com a lista de pacotes.', 'Use Ctrl+Click para selecionar multiplos pacotes.', 'Use Shift+Click para selecionar um intervalo.', 'Use a caixa de busca para filtrar pacotes.', 'Clique em OK apos a selecao.')) {
            Write-Host $message -ForegroundColor Yellow
        }
        Write-Host ''
        $picked = @($Packages | Select-Object @{n='Num';e={$_.Order}}, @{n='Nome';e={$_.Name}}, @{n='Caminho';e={$_.RelativePath}}, @{n='Tipo';e={$_.BuildType}} |
            Out-GridView -Title 'Selecione os pacotes (Ctrl+Click para multiplos, Shift+Click para intervalo)' -PassThru)
        if ($picked.Count -eq 0) { Write-Host 'Nenhum pacote selecionado. Operacao cancelada.' -ForegroundColor Yellow; return }
        $Names = @($picked.Nome)
    }
    $unknown = @($Names | Where-Object { $_ -notin $Packages.Name })
    if ($unknown.Count) { throw "Pacotes não encontrados: $($unknown -join ', ')" }
    # A seleção escolhe o conjunto; a ordem continua sendo a do catálogo.
    $Packages | Where-Object Name -In $Names
}

function Assert-HwProjectPath {
    param([Parameter(Mandatory)] [string] $Path, [Parameter(Mandatory)] $Context)
    $absolute = [IO.Path]::GetFullPath($Path)
    $prefix = $Context.ProjectRoot.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
    if (-not $absolute.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "O caminho está fora do projeto informado: $absolute"
    }
    $absolute
}

function Invoke-HwClean {
    [CmdletBinding(SupportsShouldProcess)]
    param([Parameter(Mandatory)] $Context)
    $packages = @(Get-HwBuildPackages -Context $Context)
    $dcus = @()
    $outputs = [Collections.Generic.List[object]]::new()
    $dcuRoot = Join-Path $Context.ProjectRoot 'dcu'
    if (Test-Path -LiteralPath $dcuRoot -PathType Container) {
        $dcus = @(Get-ChildItem -LiteralPath $dcuRoot -Filter '*.dcu' -File)
    }
    foreach ($package in $packages) {
        foreach ($relative in @("dcp\$($package.Name).dcp", "bpl\$($package.Name).bpl")) {
            $path = Join-Path $Context.ProjectRoot $relative
            if (Test-Path -LiteralPath $path -PathType Leaf) {
                $outputs.Add([pscustomobject]@{ Path = $path; Kind = [IO.Path]::GetExtension($path).TrimStart('.').ToUpperInvariant(); Name = [IO.Path]::GetFileName($path) })
            }
        }
    }
    foreach ($path in @($dcus | ForEach-Object FullName) + @($outputs | ForEach-Object Path)) { [void](Assert-HwProjectPath -Path $path -Context $Context) }
    if (-not $PSCmdlet.ShouldProcess($Context.ProjectRoot, "Remover $($dcus.Count + $outputs.Count) DCU/DCP/BPL do escopo atual")) { return }
    if (Test-Path -LiteralPath $dcuRoot -PathType Container) {
        Write-Host 'Limpando arquivos DCU globais...'
        # Os caminhos foram conferidos acima; evita o custo do provider por arquivo.
        foreach ($file in $dcus) { [IO.File]::Delete($file.FullName) }
        Write-Host ''
    }
    Write-Host 'Limpando arquivos DCP e BPL listados em package-list.txt...'
    Write-Host ''
    foreach ($output in $outputs) {
        [IO.File]::Delete($output.Path)
        Write-Host "  [$($output.Kind)] $($output.Name)"
    }
    Write-HwBanner 'LIMPEZA CONCLUIDA'
}

function Write-HwBanner {
    param([string] $Text, [string] $Color)
    $style = @{}
    if ($Color) { $style.ForegroundColor = $Color }
    Write-Host ''
    Write-Host '==================================================' @style
    Write-Host $Text @style
    Write-Host '==================================================' @style
    Write-Host ''
}

function Invoke-HwCompilerProcess {
    param($Context, [string] $Command, [switch] $NonInteractive, [hashtable] $Environment = @{})
    $startInfo = [Diagnostics.ProcessStartInfo]::new()
    $startInfo.FileName = $env:ComSpec
    $startInfo.Arguments = '/d /s /c ' + $Command
    $startInfo.WorkingDirectory = $Context.AutomationRoot
    $startInfo.UseShellExecute = $false
    $startInfo.RedirectStandardInput = $NonInteractive
    foreach ($name in $Environment.Keys) { $startInfo.Environment[$name] = $Environment[$name] }
    $process = [Diagnostics.Process]::new()
    $process.StartInfo = $startInfo
    try {
        [void]$process.Start()
        if ($NonInteractive) { $process.StandardInput.Close() }
        $process.WaitForExit()
        return $process.ExitCode
    }
    finally { $process.Dispose() }
}

function Invoke-HwPackageCompiler {
    param([Parameter(Mandatory)] $Context, [Parameter(Mandatory)] $Package, [switch] $NonInteractive)
    $packageDir = Assert-HwProjectPath -Path ([IO.Path]::GetFullPath($Package.RelativePath, $Context.AutomationRoot)) -Context $Context
    $arguments = @($Context.CompilerScript, $Package.Name, $packageDir, $Package.BuildType)
    foreach ($argument in $arguments) {
        if ($argument -match '["%!\r\n&|<>^]') {
            throw "O compilador BAT atual não aceita este caminho/argumento: $argument"
        }
    }
    $command = '"' + (($arguments | ForEach-Object { '"' + $_ + '"' }) -join ' ')
    $command += '"'
    $compilerExitCode = Invoke-HwCompilerProcess -Context $Context -Command $command -NonInteractive:$NonInteractive
    if ($compilerExitCode -ne 0) { throw "Falha ao compilar $($Package.Name) (código $compilerExitCode)." }
}

function Invoke-HwBatchCompiler {
    param($Context, [object[]] $Packages, [switch] $NonInteractive)
    $driver = Join-Path ([IO.Path]::GetTempPath()) ('hwdesktop-build-' + [guid]::NewGuid().ToString('N') + '.cmd')
    $lines = [Collections.Generic.List[string]]::new()
    $lines.Add('@echo off')
    $lines.Add('setlocal')
    $environment = @{ HWDESKTOP_BUILD_CORE = $Context.CompilerScript; HWDESKTOP_BUILD_ROOT = $Context.AutomationRoot }
    $index = 0
    foreach ($package in $Packages) {
        $directory = [IO.Path]::GetFullPath($package.RelativePath, $Context.AutomationRoot)
        foreach ($argument in @($Context.CompilerScript, $directory)) {
            if ($argument -match '["%!\r\n&|<>^]') { throw "O compilador BAT atual não aceita este caminho: $argument" }
        }
        $key = "HWDESKTOP_BUILD_DIR_$index"
        $environment[$key] = $directory
        $lines.Add('echo ==================================================')
        $lines.Add("echo Build: $($package.Name) [Tipo: $($package.BuildType)]")
        $lines.Add('echo ==================================================')
        $lines.Add('cd /d "%HWDESKTOP_BUILD_ROOT%"')
        $lines.Add(('call "%HWDESKTOP_BUILD_CORE%" "{0}" "%{1}%" "{2}"' -f $package.Name, $key, $package.BuildType))
        $lines.Add('if errorlevel 1 (')
        $lines.Add('echo.')
        $lines.Add("echo FALHA: Build $($package.Name) nao concluido com sucesso.")
        $lines.Add('exit /b 1')
        $lines.Add(')')
        $lines.Add('echo.')
        $index++
    }
    $lines.Add('exit /b 0')
    try {
        [IO.File]::WriteAllLines($driver, $lines, [Text.Encoding]::ASCII)
        $code = Invoke-HwCompilerProcess -Context $Context -Command ('""' + $driver + '""') -NonInteractive:$NonInteractive -Environment $environment
        if ($code -ne 0) { throw "Compilacao interrompida por falha (codigo $code)." }
    }
    finally { if ([IO.File]::Exists($driver)) { [IO.File]::Delete($driver) } }
}

function Invoke-HwBuild {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)] $Context,
        [Parameter(Mandatory)] [object[]] $Packages,
        [switch] $Clean,
        [switch] $NonInteractive,
        [ValidateSet('All', 'Reestrutura', 'Selected')] [string] $Presentation = 'All'
    )
    if (-not $PSCmdlet.ShouldProcess($Context.ProjectRoot, "Compilar $($Packages.Count) pacote(s)")) {
        if ($WhatIfPreference -and $Clean) { Invoke-HwClean -Context $Context -WhatIf }
        return [pscustomobject]@{ Status = $(if ($WhatIfPreference) { 'Preview' } else { 'Cancelled' }) }
    }
    foreach ($required in @($Context.CompilerScript, (Join-Path $Context.ConfigRoot 'config-paths.bat'))) {
        if (-not (Test-Path -LiteralPath $required -PathType Leaf)) { throw "Arquivo necessário não encontrado: $required" }
    }
    foreach ($package in $Packages) {
        $directory = Assert-HwProjectPath -Path ([IO.Path]::GetFullPath($package.RelativePath, $Context.AutomationRoot)) -Context $Context
        $dpk = Join-Path $directory "$($package.Name).dpk"
        if (-not (Test-Path -LiteralPath $dpk -PathType Leaf)) { throw "DPK não encontrado: $dpk" }
    }
    if ($Clean) {
        Write-Host 'Executando limpeza dos pacotes...'
        Invoke-HwClean -Context $Context -Confirm:$false
    }
    if ($Presentation -ne 'Selected') {
        Write-Host $(if ($Presentation -eq 'Reestrutura') { 'Iniciando build do pacote...' } else { 'Iniciando build dos pacotes na ordem especificada...' })
        Write-Host ''
        Invoke-HwBatchCompiler -Context $Context -Packages $Packages -NonInteractive:$NonInteractive
        Write-HwBanner 'BUILD CONCLUIDO COM SUCESSO!'
        return [pscustomobject]@{ Status = 'Completed' }
    }
    Write-HwBanner "  PACOTES SELECIONADOS: $($Packages.Count)" -Color Cyan
    foreach ($package in $Packages) { Write-Host "  [$($package.BuildType)] $($package.Name)" -ForegroundColor White }
    Write-HwBanner '  INICIANDO BUILD' -Color Green
    $index = 0
    $successCount = 0
    $failure = $null
    foreach ($package in $Packages) {
        $index++
        Write-Host '--------------------------------------------------' -ForegroundColor DarkGray
        Write-Host "  [$index/$($Packages.Count)] Build: $($package.Name) [Tipo: $($package.BuildType)]" -ForegroundColor Cyan
        Write-Host '--------------------------------------------------' -ForegroundColor DarkGray
        Write-Host ''
        try {
            Invoke-HwPackageCompiler -Context $Context -Package $package -NonInteractive:$NonInteractive
            $successCount++
            Write-Host "`n  [OK] $($package.Name) compilado com sucesso!" -ForegroundColor Green
        }
        catch {
            $failure = $_
            Write-Host "`n  [FALHA] Erro na compilacao de $($package.Name)" -ForegroundColor Red
            Write-Host 'Build interrompido por falha.' -ForegroundColor Yellow
            break
        }
        Write-Host ''
    }
    Write-HwBanner '  RESUMO DO BUILD' -Color Cyan
    Write-Host "  Total selecionado : $($Packages.Count)" -ForegroundColor White
    Write-Host "  Sucesso           : $successCount" -ForegroundColor Green
    Write-Host "  Falhas            : $(if ($failure) { 1 } else { 0 })" -ForegroundColor $(if ($failure) { 'Red' } else { 'Green' })
    if ($failure) {
        Write-Host "`n  Pacotes com falha:`n    - $($Packages[$index - 1].Name)" -ForegroundColor Red
        Write-Host "`n  BUILD CONCLUIDO COM ERROS!" -ForegroundColor Red
        throw $failure
    }
    Write-Host "`n  BUILD CONCLUIDO COM SUCESSO!" -ForegroundColor Green
    Write-Host "`n==================================================" -ForegroundColor Cyan
    [pscustomobject]@{ Status = 'Completed' }
}

function Get-HwDefaultDeployDestination {
    [CmdletBinding()]
    param([Parameter(Mandatory)] $Context)
    $configFile = Join-Path $Context.ConfigRoot 'deploy.psd1'
    $settings = Import-PowerShellDataFile -LiteralPath $configFile -ErrorAction Stop
    if (-not $settings.ContainsKey('Destination') -or [string]::IsNullOrWhiteSpace($settings.Destination)) {
        throw "Defina Destination em $configFile ou informe -Destination."
    }
    [string]$settings.Destination
}

function Invoke-HwDeploy {
    [CmdletBinding(SupportsShouldProcess)]
    param([Parameter(Mandatory)] $Context, [string] $Destination)
    if (-not $Destination) { $Destination = Get-HwDefaultDeployDestination -Context $Context }
    if (-not [IO.Path]::IsPathFullyQualified($Destination)) { throw 'Informe um destino absoluto ou um caminho de rede UNC.' }
    $packages = @(Get-HwBuildPackages -Context $Context)
    # A simulação não consulta nem cria o destino remoto.
    if (-not $PSCmdlet.ShouldProcess($Destination, 'Copiar as BPLs disponíveis do catálogo, substituindo as existentes')) { return }
    if (-not (Test-Path -LiteralPath $Context.BplRoot -PathType Container)) { throw "Pasta de origem não encontrada: $($Context.BplRoot)" }
    if (-not [IO.Directory]::Exists($Destination)) {
        Write-Host "Criando diretorio de destino: $Destination"
        [void][IO.Directory]::CreateDirectory($Destination)
    }
    Write-Host 'Copiando BPLs listados em package-list.txt...'
    Write-Host "Origem : $($Context.BplRoot)"
    Write-Host "Destino: $Destination"
    Write-Host ''
    $copied = 0
    $missing = 0
    $failed = 0
    foreach ($package in $packages) {
        $name = "$($package.Name).bpl"
        $source = Join-Path $Context.BplRoot $name
        if (-not (Test-Path -LiteralPath $source -PathType Leaf)) {
            Write-Host "  [AVISO] $name nao encontrado na pasta de origem."
            $missing++
            continue
        }
        try {
            Write-Host "Copiando $name..."
            Copy-Item -LiteralPath $source -Destination (Join-Path $Destination $name) -Force -ErrorAction Stop
            $copied++
        }
        catch {
            Write-Host "  [ERRO] Falha ao copiar $name para o destino. $($_.Exception.Message)"
            $failed++
        }
    }
    Write-HwBanner 'RESUMO DO DEPLOY'
    Write-Host "  Copiados com sucesso : $copied"
    Write-Host "  Nao encontrados      : $missing"
    Write-Host "  Falhas de copia      : $failed"
    Write-Host '=================================================='
    if ($failed -gt 0) { throw 'ATENCAO: Houve falhas durante a copia para o destino.' }
    Write-Host 'DEPLOY CONCLUIDO COM SUCESSO!'
}

Export-ModuleMember -Function New-HwBuildContext, Get-HwBuildPackages, Select-HwBuildPackages, Invoke-HwBuild, Invoke-HwClean, Invoke-HwDeploy, Get-HwDefaultDeployDestination
