[CmdletBinding()]
param(
  [ValidateSet('Plan', 'Acquire', 'Check')]
  [string]$Action = 'Plan',

  [Parameter(Mandatory = $true)]
  [ValidatePattern('^v\d{4}(?:-\d{4}-\d{2}-\d{2}T\d{2}-\d{2}-\d{2})?$')]
  [string]$FromTag,

  [Parameter(Mandatory = $true)]
  [ValidatePattern('^v\d{4}(?:-\d{4}-\d{2}-\d{2}T\d{2}-\d{2}-\d{2})?$')]
  [string]$ToTag,

  [Parameter(Mandatory = $true)]
  [ValidatePattern('^[A-Za-z0-9][A-Za-z0-9._-]*$')]
  [string]$RunId
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$mirrorRepositoryUrl =
  'https://github.com/hwsistemas-team/calculadora-rtc-mirror.git'
$conformityRepositoryUrl =
  'https://github.com/hwsistemas-team/calculadora-rtc-conformidade.git'

function Assert-ChildPath {
  param(
    [string]$ParentPath,
    [string]$ChildPath
  )

  $parentFullPath = [IO.Path]::GetFullPath($ParentPath).TrimEnd('\', '/')
  $childFullPath = [IO.Path]::GetFullPath($ChildPath)
  $prefix = $parentFullPath + [IO.Path]::DirectorySeparatorChar

  if (-not $childFullPath.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) {
    throw "Caminho fora do diretório operacional permitido: $childFullPath"
  }
}

function Invoke-Git {
  param(
    [string]$RepositoryPath,
    [string[]]$Arguments,
    [string]$Operation
  )

  $output = & git -C $RepositoryPath @Arguments 2>&1
  if ($LASTEXITCODE -ne 0) {
    throw "Falha Git durante '$Operation': $($output -join [Environment]::NewLine)"
  }
  return @($output)
}

function Initialize-AcquiredRepository {
  param(
    [string]$Path,
    [string]$RemoteUrl
  )

  New-Item -ItemType Directory -Path $Path -Force | Out-Null
  Invoke-Git -RepositoryPath $Path -Arguments @('init', '--quiet') `
    -Operation 'inicialização do repositório operacional' | Out-Null
  Invoke-Git -RepositoryPath $Path -Arguments @('remote', 'add', 'origin', $RemoteUrl) `
    -Operation 'configuração da origem canônica' | Out-Null
}

function Resolve-Commit {
  param(
    [string]$RepositoryPath,
    [string]$Reference
  )

  $result = @(Invoke-Git -RepositoryPath $RepositoryPath `
    -Arguments @('rev-parse', '--verify', "$Reference^{commit}") `
    -Operation "resolução de $Reference")
  return ([string]$result[0]).Trim()
}

function Get-NormalizedRemoteUrl {
  param([string]$RepositoryPath)

  $result = @(Invoke-Git -RepositoryPath $RepositoryPath `
    -Arguments @('remote', 'get-url', 'origin') `
    -Operation 'verificação da origem canônica')
  return ([string]$result[0]).Trim()
}

function Read-AcquisitionManifest {
  param([string]$Path)

  if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
    throw "Manifesto de aquisição não encontrado: $Path"
  }
  return (Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json)
}

function Assert-Acquisition {
  param(
    [string]$InputRoot,
    [string]$ExpectedFromTag,
    [string]$ExpectedToTag
  )

  $manifestPath = Join-Path $InputRoot 'manifest.json'
  $manifest = Read-AcquisitionManifest -Path $manifestPath
  $expected = @{
    schemaVersion = '1'
    mirrorRepositoryUrl = $mirrorRepositoryUrl
    conformityRepositoryUrl = $conformityRepositoryUrl
    interval = "$ExpectedFromTag-$ExpectedToTag"
    fromTag = $ExpectedFromTag
    toTag = $ExpectedToTag
  }
  foreach ($propertyName in $expected.Keys) {
    if ([string]$manifest.$propertyName -ne [string]$expected[$propertyName]) {
      throw "O manifesto de aquisição diverge em '$propertyName'."
    }
  }

  $mirrorPath = Join-Path $InputRoot 'calculadora-rtc-mirror'
  $conformityPath = Join-Path $InputRoot 'calculadora-rtc-conformidade'
  $packagePath = Join-Path $InputRoot 'package'
  $evidencePath = Join-Path $packagePath 'implementation-evidence.json'
  $guidePath = Join-Path $packagePath 'implementation-guide.md'
  foreach ($path in @($mirrorPath, $conformityPath, $packagePath)) {
    if (-not (Test-Path -LiteralPath $path -PathType Container)) {
      throw "Diretório adquirido não encontrado: $path"
    }
  }
  foreach ($path in @($evidencePath, $guidePath)) {
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
      throw "Arquivo adquirido não encontrado: $path"
    }
  }

  if ((Get-NormalizedRemoteUrl -RepositoryPath $mirrorPath) -ne $mirrorRepositoryUrl) {
    throw 'A origem do mirror adquirido diverge do repositório canônico.'
  }
  if ((Get-NormalizedRemoteUrl -RepositoryPath $conformityPath) -ne
      $conformityRepositoryUrl) {
    throw 'A origem do pacote adquirido diverge do repositório canônico.'
  }

  $fromCommit = Resolve-Commit -RepositoryPath $mirrorPath `
    -Reference "refs/tags/$ExpectedFromTag"
  $toCommit = Resolve-Commit -RepositoryPath $mirrorPath `
    -Reference "refs/tags/$ExpectedToTag"
  $conformityCommit = Resolve-Commit -RepositoryPath $conformityPath `
    -Reference 'refs/remotes/origin/acquired'
  if ($fromCommit -ne [string]$manifest.fromCommit -or
      $toCommit -ne [string]$manifest.toCommit -or
      $conformityCommit -ne [string]$manifest.conformityCommit) {
    throw 'Os commits adquiridos divergem do manifesto.'
  }

  $evidenceHash = (Get-FileHash -LiteralPath $evidencePath -Algorithm SHA256).Hash.ToLowerInvariant()
  $guideHash = (Get-FileHash -LiteralPath $guidePath -Algorithm SHA256).Hash.ToLowerInvariant()
  if ($evidenceHash -ne [string]$manifest.evidenceSha256 -or
      $guideHash -ne [string]$manifest.guideSha256) {
    throw 'Os hashes do pacote adquirido divergem do manifesto.'
  }

  $evidenceReaderPath = Join-Path $PSScriptRoot 'Read-RTCImplementationEvidence.ps1'
  $packageResults = @(& $evidenceReaderPath -Action Check -EvidencePath $evidencePath -GuidePath $guidePath -ExpectedFromTag $ExpectedFromTag -ExpectedToTag $ExpectedToTag)
  if ($packageResults.Count -ne 1) {
    throw 'O leitor de evidências não retornou um único contrato validado.'
  }
  $package = $packageResults[0]
  if ([string]$package.fromCommit -ne $fromCommit -or
      [string]$package.toCommit -ne $toCommit) {
    throw 'Os commits adquiridos divergem do pacote de conformidade.'
  }

  return [pscustomobject][ordered]@{
    manifestPath = $manifestPath
    mirrorPath = $mirrorPath
    evidencePath = $evidencePath
    guidePath = $guidePath
    conformityCommit = $conformityCommit
    fromCommit = $fromCommit
    toCommit = $toCommit
    evidenceSha256 = $evidenceHash
    guideSha256 = $guideHash
  }
}

if ($FromTag -eq $ToTag) {
  throw 'As tags de origem e destino devem ser diferentes.'
}
if ([string]::CompareOrdinal($FromTag, $ToTag) -ge 0) {
  throw 'A tag de origem deve ser anterior à tag de destino na ordenação RTC.'
}
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw 'Git não encontrado no PATH.'
}

$repositoryRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..\..')).ProviderPath
$runsRoot = Join-Path $repositoryRoot '.ai-runs'
$runRoot = Join-Path $runsRoot $RunId
$inputRoot = Join-Path $runRoot 'rtc-inputs'
$interval = "$FromTag-$ToTag"
$intervalPath = "reports/$interval"
Assert-ChildPath -ParentPath $runsRoot -ChildPath $inputRoot

$plan = [ordered]@{
  action = $Action
  runId = $RunId
  fromTag = $FromTag
  toTag = $ToTag
  interval = $interval
  mirrorRepositoryUrl = $mirrorRepositoryUrl
  conformityRepositoryUrl = $conformityRepositoryUrl
  conformityIntervalPath = $intervalPath
  inputRoot = $inputRoot
  mirrorPath = (Join-Path $inputRoot 'calculadora-rtc-mirror')
  evidencePath = (Join-Path $inputRoot 'package\implementation-evidence.json')
  guidePath = (Join-Path $inputRoot 'package\implementation-guide.md')
  manifestPath = (Join-Path $inputRoot 'manifest.json')
}

if ($Action -eq 'Plan') {
  [pscustomobject]$plan
  exit 0
}

if ($Action -eq 'Check') {
  $verified = Assert-Acquisition -InputRoot $inputRoot `
    -ExpectedFromTag $FromTag -ExpectedToTag $ToTag
  Write-Output $verified
  exit 0
}

if (Test-Path -LiteralPath $inputRoot) {
  $verified = Assert-Acquisition -InputRoot $inputRoot `
    -ExpectedFromTag $FromTag -ExpectedToTag $ToTag
  Write-Output $verified
  exit 0
}

New-Item -ItemType Directory -Path $runRoot -Force | Out-Null
$temporaryRoot = Join-Path $runRoot ('.rtc-inputs-' + [guid]::NewGuid().ToString('N'))
Assert-ChildPath -ParentPath $runRoot -ChildPath $temporaryRoot

try {
  New-Item -ItemType Directory -Path $temporaryRoot -Force | Out-Null
  $temporaryMirror = Join-Path $temporaryRoot 'calculadora-rtc-mirror'
  $temporaryConformity = Join-Path $temporaryRoot 'calculadora-rtc-conformidade'
  $temporaryPackage = Join-Path $temporaryRoot 'package'
  Initialize-AcquiredRepository -Path $temporaryMirror -RemoteUrl $mirrorRepositoryUrl
  Initialize-AcquiredRepository -Path $temporaryConformity `
    -RemoteUrl $conformityRepositoryUrl

  foreach ($tag in @($FromTag, $ToTag)) {
    Invoke-Git -RepositoryPath $temporaryMirror -Arguments @(
      'fetch', '--quiet', '--depth=1', '--no-tags', 'origin',
      "refs/tags/$tag`:refs/tags/$tag"
    ) -Operation "aquisição da tag $tag" | Out-Null
  }
  $fromCommit = Resolve-Commit -RepositoryPath $temporaryMirror `
    -Reference "refs/tags/$FromTag"
  $toCommit = Resolve-Commit -RepositoryPath $temporaryMirror `
    -Reference "refs/tags/$ToTag"

  Invoke-Git -RepositoryPath $temporaryConformity -Arguments @(
    'fetch', '--quiet', '--depth=1', '--no-tags', 'origin',
    'HEAD:refs/remotes/origin/acquired'
  ) -Operation 'aquisição do pacote de conformidade' | Out-Null
  $conformityCommit = Resolve-Commit -RepositoryPath $temporaryConformity `
    -Reference 'refs/remotes/origin/acquired'

  $packageRelativePaths = @(
    "$intervalPath/implementation-evidence.json",
    "$intervalPath/implementation-guide.md"
  )
  foreach ($packageRelativePath in $packageRelativePaths) {
    try {
      Invoke-Git -RepositoryPath $temporaryConformity -Arguments @(
        'cat-file', '-e', "$conformityCommit`:$packageRelativePath"
      ) -Operation "verificação de $packageRelativePath" | Out-Null
    }
    catch {
      throw "Pacote de conformidade ausente ou incompleto em '$intervalPath': $packageRelativePath"
    }
  }

  $archivePath = Join-Path $temporaryRoot 'package.zip'
  Invoke-Git -RepositoryPath $temporaryConformity -Arguments @(
    'archive', '--format=zip', "--output=$archivePath", $conformityCommit, '--',
    "$intervalPath/implementation-evidence.json",
    "$intervalPath/implementation-guide.md"
  ) -Operation "leitura do pacote $intervalPath" | Out-Null

  $expandedPath = Join-Path $temporaryRoot 'expanded'
  Expand-Archive -LiteralPath $archivePath -DestinationPath $expandedPath
  $expandedIntervalPath = Join-Path $expandedPath ($intervalPath -replace '/', '\')
  New-Item -ItemType Directory -Path $temporaryPackage -Force | Out-Null
  Copy-Item -LiteralPath (Join-Path $expandedIntervalPath 'implementation-evidence.json') `
    -Destination $temporaryPackage
  Copy-Item -LiteralPath (Join-Path $expandedIntervalPath 'implementation-guide.md') `
    -Destination $temporaryPackage

  $evidencePath = Join-Path $temporaryPackage 'implementation-evidence.json'
  $guidePath = Join-Path $temporaryPackage 'implementation-guide.md'
  $evidenceReaderPath = Join-Path $PSScriptRoot 'Read-RTCImplementationEvidence.ps1'
  $packageResults = @(& $evidenceReaderPath -Action Check `
    -EvidencePath $evidencePath -GuidePath $guidePath `
    -ExpectedFromTag $FromTag -ExpectedToTag $ToTag)
  if ($packageResults.Count -ne 1) {
    throw 'O leitor de evidências não retornou um único contrato validado.'
  }
  $package = $packageResults[0]
  if ([string]$package.fromCommit -ne $fromCommit -or
      [string]$package.toCommit -ne $toCommit) {
    throw 'Os commits das tags adquiridas divergem do pacote de conformidade.'
  }

  $manifest = [ordered]@{
    schemaVersion = 1
    createdAtUtc = [DateTime]::UtcNow.ToString('o')
    runId = $RunId
    mirrorRepositoryUrl = $mirrorRepositoryUrl
    conformityRepositoryUrl = $conformityRepositoryUrl
    conformityCommit = $conformityCommit
    interval = $interval
    conformityIntervalPath = $intervalPath
    fromTag = $FromTag
    fromCommit = $fromCommit
    toTag = $ToTag
    toCommit = $toCommit
    evidenceSha256 = ([string]$package.evidenceSha256).ToLowerInvariant()
    guideSha256 = ([string]$package.guideSha256).ToLowerInvariant()
  }
  $manifest | ConvertTo-Json -Depth 4 |
    Set-Content -LiteralPath (Join-Path $temporaryRoot 'manifest.json') -Encoding UTF8

  Remove-Item -LiteralPath $archivePath -Force
  Remove-Item -LiteralPath $expandedPath -Recurse -Force
  Move-Item -LiteralPath $temporaryRoot -Destination $inputRoot
  $verified = Assert-Acquisition -InputRoot $inputRoot `
    -ExpectedFromTag $FromTag -ExpectedToTag $ToTag
  Write-Output $verified
}
finally {
  if (Test-Path -LiteralPath $temporaryRoot) {
    Assert-ChildPath -ParentPath $runRoot -ChildPath $temporaryRoot
    Remove-Item -LiteralPath $temporaryRoot -Recurse -Force
  }
}
