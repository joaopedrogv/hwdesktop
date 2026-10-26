[CmdletBinding()]
param(
  [switch]$BuildOnly,
  [switch]$ConfirmTestInfrastructure,
  [string]$DelphiBin
)

Set-StrictMode -Version Latest

function Resolve-DelphiBin {
  param([string]$RequestedPath)

  if ($RequestedPath) {
    $resolved = Resolve-Path -LiteralPath $RequestedPath -ErrorAction Stop
    return $resolved.ProviderPath
  }

  if ($env:BDS) {
    $fromEnvironment = Join-Path $env:BDS 'bin'
    if (Test-Path -LiteralPath (Join-Path $fromEnvironment 'rsvars.bat')) {
      return (Resolve-Path -LiteralPath $fromEnvironment).ProviderPath
    }
  }

  $registryKeys = @(
    'HKCU:\Software\Embarcadero\BDS\20.0',
    'HKLM:\Software\WOW6432Node\Embarcadero\BDS\20.0'
  )

  foreach ($registryKey in $registryKeys) {
    if (Test-Path -LiteralPath $registryKey) {
      $rootDirectory = (Get-ItemProperty -LiteralPath $registryKey).RootDir
      $fromRegistry = Join-Path $rootDirectory 'bin'
      if (Test-Path -LiteralPath (Join-Path $fromRegistry 'rsvars.bat')) {
        return (Resolve-Path -LiteralPath $fromRegistry).ProviderPath
      }
    }
  }

  $studioRoot = Join-Path ${env:ProgramFiles(x86)} 'Embarcadero\Studio'
  if (Test-Path -LiteralPath $studioRoot) {
    $installation = Get-ChildItem -LiteralPath $studioRoot -Directory |
      Sort-Object { [version]$_.Name } -Descending |
      Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'bin\rsvars.bat') } |
      Select-Object -First 1

    if ($installation) {
      return (Join-Path $installation.FullName 'bin')
    }
  }

  throw 'Delphi não encontrado. Informe -DelphiBin com o diretório que contém rsvars.bat.'
}

function Invoke-DelphiBuild {
  param(
    [string]$RsVarsPath,
    [string]$ProjectPath
  )

  $cleanRsVars = $RsVarsPath -replace '"', ''
  $cleanProject = $ProjectPath -replace '"', ''
  $cmdArguments = "/c `"call `"$cleanRsVars`" && msbuild.exe `"$cleanProject`" /t:Build /p:Config=CI /p:Platform=Win32 /nologo /v:minimal`""

  $process = Start-Process -FilePath $env:ComSpec -ArgumentList $cmdArguments -Wait -NoNewWindow -PassThru
  return $process.ExitCode
}

if (-not $BuildOnly -and -not $ConfirmTestInfrastructure) {
  throw 'A execução inclui testes de integração. Confirme banco, arquivos e serviços de teste seguros e informe -ConfirmTestInfrastructure.'
}

$repositoryRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).ProviderPath
$projectDirectory = Join-Path $repositoryRoot 'Tests\Fiscal.Calculos.Tests'
$projectPath = Join-Path $projectDirectory 'FiscalCalculosTests.dproj'
$executablePath = Join-Path $projectDirectory 'Win32\CI\FiscalCalculosTests.exe'
$resultsDirectory = Join-Path $repositoryRoot 'Tests\TestResults'
$resultFileName = 'FiscalCalculosTests-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.xml'
$resultPath = Join-Path $resultsDirectory $resultFileName

if (-not (Test-Path -LiteralPath $projectPath)) {
  throw "Projeto de testes não encontrado: $projectPath"
}

$resolvedDelphiBin = Resolve-DelphiBin -RequestedPath $DelphiBin
$rsVarsPath = Join-Path $resolvedDelphiBin 'rsvars.bat'

Write-Host 'Compilando Fiscal.Calculos.Tests (CI/Win32)...'

$buildExitCode = Invoke-DelphiBuild -RsVarsPath $rsVarsPath -ProjectPath $projectPath
if ($buildExitCode -ne 0) {
  Write-Error "A compilação falhou com exit code $buildExitCode."
  exit $buildExitCode
}

if ($BuildOnly) {
  Write-Host 'Compilação concluída. A execução foi omitida por -BuildOnly.'
  exit 0
}

if (-not (Test-Path -LiteralPath $executablePath)) {
  Write-Error "Executável de testes não encontrado após a compilação: $executablePath"
  exit 1
}

New-Item -ItemType Directory -Path $resultsDirectory -Force | Out-Null

Write-Host 'Executando Fiscal.Calculos.Tests...'
& $executablePath '--hidebanner' '--consolemode:Quiet' '--exitbehavior:Continue' "--xmlfile:$resultPath"
$testExitCode = $LASTEXITCODE

if (-not (Test-Path -LiteralPath $resultPath)) {
  Write-Error "O DUnitX não gerou o resultado NUnit esperado: $resultPath"
  if ($testExitCode -eq 0) {
    exit 1
  }
  exit $testExitCode
}

Write-Host "Resultado NUnit: $resultPath"
exit $testExitCode
