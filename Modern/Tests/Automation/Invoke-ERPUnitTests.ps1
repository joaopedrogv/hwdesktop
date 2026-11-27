[CmdletBinding()]
param(
  [switch]$BuildOnly,
  [string]$DelphiBin,
  [string]$DelphiLibPath,
  [string]$DUnitXPath,
  [string]$FastMM5Path,
  [string]$AcbrPath
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

function Resolve-AcbrPaths {
  param(
    [string]$RequestedPath,
    [string]$ConfigPath
  )

  $candidate = $RequestedPath
  $origin = '-AcbrPath'
  if (-not $candidate -and $env:ERPUNITTESTS_ACBR) {
    $candidate = $env:ERPUNITTESTS_ACBR
    $origin = 'variável de ambiente ERPUNITTESTS_ACBR'
  }

  if (-not $candidate -and (Test-Path -LiteralPath $ConfigPath -PathType Leaf)) {
    $configFile = Get-Item -LiteralPath $ConfigPath
    $settings = Import-PowerShellDataFile -LiteralPath $configFile.FullName
    $profileName = if ($settings.ContainsKey('DefaultProfile')) { $settings.DefaultProfile } else { $null }

    if ($profileName -and $settings.ContainsKey('Profiles') -and $settings.Profiles -is [hashtable] -and
      $settings.Profiles.ContainsKey($profileName)) {
      $profileSettings = $settings.Profiles[$profileName]
      if ($profileSettings -is [hashtable] -and $profileSettings.ContainsKey('ACBrRoot') -and
        $profileSettings.ContainsKey('ACBrDcuPath')) {
        $acbrRoot = [IO.Path]::GetFullPath($profileSettings.ACBrRoot, $configFile.DirectoryName)
        $candidate = [IO.Path]::GetFullPath($profileSettings.ACBrDcuPath, $acbrRoot)
        $origin = "perfil '$profileName' de $($configFile.FullName)"
      }
    }
  }

  if (-not $candidate) {
    throw 'DCUs do ACBr não configurados. Informe -AcbrPath, defina ERPUNITTESTS_ACBR ou configure DefaultProfile com ACBrRoot/ACBrDcuPath em _automation\config\build.local.psd1.'
  }
  if (-not (Test-Path -LiteralPath $candidate -PathType Container)) {
    throw "Diretório de DCUs do ACBr não encontrado ($origin): $candidate"
  }

  $unitPath = (Resolve-Path -LiteralPath $candidate).ProviderPath
  $resourcesPath = $null

  # Os DCUs do ACBr referenciam .res da árvore Fontes, que precisa entrar no resource path.
  for ($directory = Get-Item -LiteralPath $unitPath; $directory; $directory = $directory.Parent) {
    $candidateResources = Join-Path $directory.FullName 'Fontes\ACBrDFe\ACBrNFSeX'
    if (Test-Path -LiteralPath $candidateResources -PathType Container) {
      $resourcesPath = (Resolve-Path -LiteralPath $candidateResources).ProviderPath
      break
    }
  }

  return [pscustomobject]@{ UnitPath = $unitPath; ResourcesPath = $resourcesPath }
}

function Invoke-DelphiBuild {
  param(
    [string]$RsVarsPath,
    [string]$ProjectPath,
    [string[]]$Properties
  )

  # Sanitiza os caminhos removendo qualquer aspa existente
  $cleanRsVars = $RsVarsPath -replace '"', ''
  $cleanProject = $ProjectPath -replace '"', ''

  $propertyArguments = ''
  foreach ($property in $Properties) {
    $propertyArguments += " /p:$property"
  }

  # Monta o comando encadeado (executa o msbuild apenas se o rsvars carregar com sucesso)
  $cmdArguments = "/c `"call `"$cleanRsVars`" && msbuild.exe `"$cleanProject`" /t:Build /p:Config=CI /p:Platform=Win32$propertyArguments /nologo /v:minimal`""

  $process = Start-Process -FilePath $env:ComSpec -ArgumentList $cmdArguments -Wait -NoNewWindow -PassThru
  return $process.ExitCode
}

$repositoryRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).ProviderPath
$projectDirectory = Join-Path $repositoryRoot 'Tests\ERP.UnitTests'
$projectPath = Join-Path $projectDirectory 'ERPUnitTests.dproj'
$executablePath = Join-Path $projectDirectory 'Win32\CI\ERPUnitTests.exe'
$resultsDirectory = Join-Path $repositoryRoot 'Tests\TestResults'
$resultFileName = 'ERPUnitTests-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.xml'
$resultPath = Join-Path $resultsDirectory $resultFileName

if (-not (Test-Path -LiteralPath $projectPath)) {
  throw "Projeto de testes não encontrado: $projectPath"
}

$checkoutRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..\..')).ProviderPath
$acbrPaths = Resolve-AcbrPaths -RequestedPath $AcbrPath -ConfigPath (Join-Path $checkoutRoot '_automation\config\build.local.psd1')
$resolvedDelphiBin = Resolve-DelphiBin -RequestedPath $DelphiBin
$rsVarsPath = Join-Path $resolvedDelphiBin 'rsvars.bat'

Write-Host 'Compilando ERP.UnitTests (CI/Win32)...'
Write-Host "DCUs do ACBr: $($acbrPaths.UnitPath)"
if ($acbrPaths.ResourcesPath) { Write-Host "Recursos do ACBr: $($acbrPaths.ResourcesPath)" }

$projectProperties = @()
if ($DelphiLibPath) { $projectProperties += 'ERPUNITTESTS_DELPHI_LIB="' + ($DelphiLibPath -replace '"', '') + '"' }
if ($DUnitXPath) { $projectProperties += 'ERPUNITTESTS_DUNITX="' + ($DUnitXPath -replace '"', '') + '"' }
if ($FastMM5Path) { $projectProperties += 'ERPUNITTESTS_FASTMM5="' + ($FastMM5Path -replace '"', '') + '"' }
if ($acbrPaths.UnitPath) { $projectProperties += 'ERPUNITTESTS_ACBR="' + ($acbrPaths.UnitPath -replace '"', '') + '"' }
if ($acbrPaths.ResourcesPath) { $projectProperties += 'ERPUNITTESTS_ACBR_RESOURCES="' + ($acbrPaths.ResourcesPath -replace '"', '') + '"' }

$buildExitCode = Invoke-DelphiBuild -RsVarsPath $rsVarsPath -ProjectPath $projectPath -Properties $projectProperties
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

Write-Host 'Executando ERP.UnitTests...'
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
