#Requires -Version 7.5
[CmdletBinding()]
param(
    [string] $ProjectRoot = (Join-Path $PSScriptRoot '..\..'),
    [string] $ConfigPath,
    [string] $Profile,
    [ValidateSet('Debug', 'Release')]
    [string] $Configuration = 'Release',
    [string] $DelphiBin = (Join-Path ${env:ProgramFiles(x86)} 'Embarcadero\Studio\20.0\bin')
)

$ErrorActionPreference = 'Stop'

try {
    $projectRoot = (Resolve-Path -LiteralPath $ProjectRoot).ProviderPath
    $projectFile = Join-Path $projectRoot 'HWNFeDX\hw.nfe.dx.dproj'
    if (-not (Test-Path -LiteralPath $projectFile -PathType Leaf)) {
        throw "Projeto da DLL não encontrado: $projectFile"
    }

    if (-not $PSBoundParameters.ContainsKey('ConfigPath')) {
        $ConfigPath = Join-Path $projectRoot '_automation\config\build.local.psd1'
    }
    if (-not (Test-Path -LiteralPath $ConfigPath -PathType Leaf)) {
        throw "Configuração de build não encontrada: $ConfigPath. Copie build.exemplo.psd1 para build.local.psd1."
    }

    $configFile = Get-Item -LiteralPath $ConfigPath
    $settings = Import-PowerShellDataFile -LiteralPath $configFile.FullName
    if (-not $PSBoundParameters.ContainsKey('Profile')) {
        $Profile = $settings.DefaultProfile
    }
    if (-not $settings.Profiles -or $Profile -notmatch '^[a-zA-Z0-9][a-zA-Z0-9_-]*\z' -or -not $settings.Profiles.ContainsKey($Profile)) {
        throw "Perfil de build inválido: '$Profile'. Configure DefaultProfile ou informe -Profile. Disponíveis: $($settings.Profiles.Keys -join ', ')."
    }

    $selected = $settings.Profiles[$Profile]
    $acbrRoot = [IO.Path]::GetFullPath($selected.ACBrRoot, $configFile.DirectoryName)
    $acbrDcus = [IO.Path]::GetFullPath($selected.ACBrDcuPath, $acbrRoot)
    foreach ($unitFile in @('ACBrNFe.dcu', 'ACBrNFSeX.dcu')) {
        if (-not (Test-Path -LiteralPath (Join-Path $acbrDcus $unitFile) -PathType Leaf)) {
            throw "DCUs do ACBr para Rio/Win32 não encontrados em $acbrDcus. Arquivo esperado: $unitFile."
        }
    }

    $acbrSources = Join-Path $acbrRoot 'Fontes'
    $resourceDirectories = @(
        'ACBrDFe\ACBrNFe'
        'ACBrDFe\ACBrNFe\DANFE\NFe\Fortes'
        'ACBrDFe\ACBrNFe\DANFE\NFCe\Fortes'
        'ACBrDFe\ACBrNFSe'
        'ACBrDFe\ACBrNFSe\DANFSE\Fortes'
        'ACBrDFe\ACBrNFSeX'
        'ACBrDFe\ACBrNFSeX\DANFSE\Fortes'
        'ACBrDFe\ACBrMDFe'
        'ACBrDFe\ACBrMDFe\DAMDFE\Fortes'
        'ACBrSerial'
    ) | ForEach-Object { Join-Path $acbrSources $_ }
    $nfseResource = Join-Path $acbrSources 'ACBrDFe\ACBrNFSeX\ACBrNFSeXServicos.res'
    if (-not (Test-Path -LiteralPath $nfseResource -PathType Leaf)) {
        throw "Recurso de serviços da NFS-e não encontrado: $nfseResource"
    }

    $unitDirectories = @($acbrDcus)
    foreach ($path in $settings.AdditionalUnitPaths) {
        $unitDirectories += [IO.Path]::GetFullPath($path, $configFile.DirectoryName)
    }
    foreach ($path in $unitDirectories + $resourceDirectories) {
        if ($path.Contains(';') -or -not (Test-Path -LiteralPath $path -PathType Container)) {
            throw "Caminho de build inválido: $path"
        }
    }

    $rsVarsFile = (Get-Item -LiteralPath (Join-Path $DelphiBin 'rsvars.bat')).FullName
    $delphiRoot = Split-Path -Parent (Split-Path -Parent $rsVarsFile)
    $libraryPath = Join-Path $delphiRoot 'lib\win32\release'
    if ($rsVarsFile.Contains('%') -or -not (Test-Path -LiteralPath (Join-Path $libraryPath 'System.dcu') -PathType Leaf)) {
        throw "Instalação do Delphi Rio/Win32 inválida: $DelphiBin"
    }

    $outputDirectory = [IO.Path]::GetFullPath(($settings.OutputDirectory ?? 'bpl'), $projectRoot)
    $dcuOutput = Join-Path (Split-Path -Parent $projectFile) "output\$Profile\$Configuration\dcu"
    [IO.Directory]::CreateDirectory($outputDirectory) | Out-Null
    [IO.Directory]::CreateDirectory($dcuOutput) | Out-Null

    $build = [Diagnostics.ProcessStartInfo]::new($env:ComSpec)
    $build.WorkingDirectory = $projectRoot
    $build.UseShellExecute = $false
    $build.Environment['HWDESKTOP_NFE_RSVARS'] = $rsVarsFile
    $build.Environment['HWDESKTOP_NFE_RIO_LIB'] = $libraryPath
    $build.Environment['HWDESKTOP_NFE_CONFIG'] = $Configuration
    $build.Environment['HwNfeDxUnitPath'] = $unitDirectories -join ';'
    $build.Environment['HwNfeDxResourcePath'] = $resourceDirectories -join ';'
    $build.Environment['HwNfeDxDcuOutput'] = $dcuOutput
    $build.Environment['HwNfeDxExeOutput'] = $outputDirectory
    $build.Arguments = '/d /v:off /c call "%HWDESKTOP_NFE_RSVARS%" && msbuild.exe HWNFeDX\hw.nfe.dx.dproj /t:Build /p:HwNfeDxBuild=true /p:Config=%HWDESKTOP_NFE_CONFIG% /p:Platform=Win32 /p:DCC_DebugDCUs=false "/p:DelphiLibraryPath=%HWDESKTOP_NFE_RIO_LIB%" /nologo /v:minimal'

    Write-Host "Compilando hw.nfe.dx.dll ($Configuration/Win32), perfil $Profile"
    Write-Host "DCUs do ACBr: $acbrDcus"
    $process = [Diagnostics.Process]::Start($build)
    try {
        $process.WaitForExit()
        $buildExitCode = $process.ExitCode
    }
    finally {
        $process.Dispose()
    }

    if ($buildExitCode -ne 0) {
        throw "A compilação de hw.nfe.dx.dll falhou (código $buildExitCode)."
    }

    $dllFile = Join-Path $outputDirectory 'hw.nfe.dx.dll'
    if (-not (Test-Path -LiteralPath $dllFile -PathType Leaf)) {
        throw "O build terminou sem gerar a DLL esperada: $dllFile"
    }

    Write-Host "DLL compilada: $dllFile"
    exit 0
}
catch {
    [Console]::Error.WriteLine($_.Exception.Message)
    exit 1
}
