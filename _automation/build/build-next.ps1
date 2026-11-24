#Requires -Version 7.5
<#
.SYNOPSIS
Compila hw.next.dll com Delphi Rio, em Debug/Win32, no clone deste script.
#>
[CmdletBinding()]
param(
    [string] $DelphiBin = (Join-Path ${env:ProgramFiles(x86)} 'Embarcadero\Studio\20.0\bin')
)

$ErrorActionPreference = 'Stop'

try {
    $projectRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).ProviderPath
    $projectFile = Join-Path $projectRoot 'Next\Projects\hw.next.dproj'
    $dllFile = Join-Path $projectRoot 'bpl\hw.next.dll'

    if (-not (Test-Path -LiteralPath $projectFile -PathType Leaf)) {
        throw "Projeto do Next não encontrado: $projectFile"
    }

    $rsVarsFile = Join-Path $DelphiBin 'rsvars.bat'
    if (-not (Test-Path -LiteralPath $rsVarsFile -PathType Leaf)) {
        throw 'Delphi Rio não encontrado. Informe -DelphiBin com o diretório bin da instalação.'
    }

    $rsVarsFile = (Resolve-Path -LiteralPath $rsVarsFile).ProviderPath
    if ($rsVarsFile.Contains('%')) {
        throw 'O caminho do Delphi não pode conter % ao carregar rsvars.bat.'
    }

    $delphiRoot = Split-Path -Parent (Split-Path -Parent $rsVarsFile)
    $libraryPath = Join-Path $delphiRoot 'lib\win32\release'
    if (-not (Test-Path -LiteralPath (Join-Path $libraryPath 'System.dcu') -PathType Leaf)) {
        throw "Biblioteca Win32 do Delphi não encontrada: $libraryPath"
    }

    $springRoot = $env:SPRING4D_ROOT
    if ([string]::IsNullOrWhiteSpace($springRoot)) {
        [xml] $project = Get-Content -LiteralPath $projectFile -Raw
        $springRoot = $project.SelectSingleNode("//*[local-name()='SPRING4D_ROOT']").InnerText
    }

    $springRoot = [IO.Path]::GetFullPath($springRoot, (Split-Path -Parent $projectFile))
    $springDcu = Join-Path $springRoot 'Library\Delphi10Rio\Win32\Release\Spring.Container.dcu'
    if (-not (Test-Path -LiteralPath $springDcu -PathType Leaf)) {
        throw "Spring4D compilado para Delphi Rio/Win32 não encontrado. Ajuste SPRING4D_ROOT. DCU esperado: $springDcu"
    }

    # A biblioteca padrão evita incorporar os caminhos globais da IDE à linha de comando do DCC.
    $build = [Diagnostics.ProcessStartInfo]::new($env:ComSpec)
    $build.WorkingDirectory = $projectRoot
    $build.UseShellExecute = $false
    $build.Environment['HWDESKTOP_NEXT_RSVARS'] = $rsVarsFile
    $build.Environment['HWDESKTOP_NEXT_RIO_LIB'] = $libraryPath
    $build.Environment['SPRING4D_ROOT'] = $springRoot
    $build.Arguments = '/d /v:off /c call "%HWDESKTOP_NEXT_RSVARS%" && msbuild.exe Next\Projects\hw.next.dproj /t:Build /p:Config=Debug /p:Platform=Win32 /p:DCC_DebugDCUs=false "/p:DelphiLibraryPath=%HWDESKTOP_NEXT_RIO_LIB%" /nologo /v:minimal'

    Write-Host "Compilando hw.next.dll (Debug/Win32) em $projectRoot"
    $process = [Diagnostics.Process]::Start($build)
    try {
        $process.WaitForExit()
        $buildExitCode = $process.ExitCode
    }
    finally {
        $process.Dispose()
    }

    if ($buildExitCode -ne 0) {
        [Console]::Error.WriteLine("Compilação de Next falhou (código $buildExitCode).")
        exit $buildExitCode
    }

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
