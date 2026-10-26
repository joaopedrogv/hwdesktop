[CmdletBinding()]
param(
  [ValidateSet('Plan', 'Prepare', 'Check')]
  [string]$Action = 'Plan',

  [Parameter(Mandatory = $true)]
  [string]$MirrorPath,

  [Parameter(Mandatory = $true)]
  [string]$GuidePath,

  [Parameter(Mandatory = $true)]
  [string]$EvidencePath,

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

function Invoke-GitReadOnly {
  param(
    [string]$RepositoryPath,
    [string[]]$Arguments
  )

  $output = & git -C $RepositoryPath @Arguments 2>&1
  if ($LASTEXITCODE -ne 0) {
    throw "Git falhou ao consultar o mirror: $($output -join [Environment]::NewLine)"
  }

  return @($output)
}

function Resolve-TagCommit {
  param(
    [string]$RepositoryPath,
    [string]$Tag
  )

  $reference = "refs/tags/$Tag^{commit}"
  $lines = @(Invoke-GitReadOnly -RepositoryPath $RepositoryPath -Arguments @(
    'rev-parse', '--verify', $reference
  ))
  return ([string]$lines[0]).Trim()
}

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

function Read-Manifest {
  param([string]$Path)

  if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
    throw "Manifesto de snapshots não encontrado: $Path"
  }

  return (Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json)
}

function Assert-SnapshotState {
  param(
    [string]$SnapshotRoot,
    [string]$ExpectedFromTag,
    [string]$ExpectedFromCommit,
    [string]$ExpectedToTag,
    [string]$ExpectedToCommit,
    [string]$ExpectedGuideHash,
    [string]$ExpectedEvidenceHash
  )

  $manifestPath = Join-Path $SnapshotRoot 'manifest.json'
  $manifest = Read-Manifest -Path $manifestPath

  $expected = @{
    fromTag = $ExpectedFromTag
    fromCommit = $ExpectedFromCommit
    toTag = $ExpectedToTag
    toCommit = $ExpectedToCommit
    guideSha256 = $ExpectedGuideHash
    evidenceSha256 = $ExpectedEvidenceHash
  }

  foreach ($propertyName in $expected.Keys) {
    if ([string]$manifest.$propertyName -ne [string]$expected[$propertyName]) {
      throw "O manifesto existente diverge em '$propertyName'."
    }
  }

  foreach ($relativePath in @(
    (Join-Path 'from' $ExpectedFromTag),
    (Join-Path 'to' $ExpectedToTag)
  )) {
    $snapshotPath = Join-Path $SnapshotRoot $relativePath
    if (-not (Test-Path -LiteralPath $snapshotPath -PathType Container)) {
      throw "Snapshot esperado não encontrado: $snapshotPath"
    }
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

$resolvedMirrorPath = (Resolve-Path -LiteralPath $MirrorPath -ErrorAction Stop).ProviderPath
$resolvedGuidePath = (Resolve-Path -LiteralPath $GuidePath -ErrorAction Stop).ProviderPath
$resolvedEvidencePath = (Resolve-Path -LiteralPath $EvidencePath -ErrorAction Stop).ProviderPath

$evidenceReaderPath = Join-Path $PSScriptRoot 'Read-RTCImplementationEvidence.ps1'
if (-not (Test-Path -LiteralPath $evidenceReaderPath -PathType Leaf)) {
  throw "Leitor canônico de evidências não encontrado: $evidenceReaderPath"
}
$packageResults = @(& $evidenceReaderPath `
  -Action Check `
  -EvidencePath $resolvedEvidencePath `
  -GuidePath $resolvedGuidePath `
  -ExpectedFromTag $FromTag `
  -ExpectedToTag $ToTag)
if ($packageResults.Count -ne 1) {
  throw 'O leitor de evidências não retornou um único contrato validado.'
}
$package = $packageResults[0]

$mirrorRootLines = @(Invoke-GitReadOnly -RepositoryPath $resolvedMirrorPath -Arguments @(
  'rev-parse', '--show-toplevel'
))
$mirrorRoot = ([string]$mirrorRootLines[0]).Trim()
$resolvedMirrorRoot = (Resolve-Path -LiteralPath $mirrorRoot -ErrorAction Stop).ProviderPath

if ($resolvedMirrorPath.TrimEnd('\', '/') -ne $resolvedMirrorRoot.TrimEnd('\', '/')) {
  throw "MirrorPath deve apontar para a raiz do repositório: $resolvedMirrorRoot"
}

$fromCommit = Resolve-TagCommit -RepositoryPath $resolvedMirrorRoot -Tag $FromTag
$toCommit = Resolve-TagCommit -RepositoryPath $resolvedMirrorRoot -Tag $ToTag
if ($fromCommit -ne $package.fromCommit) {
  throw "O commit da tag $FromTag no mirror diverge da evidência estruturada."
}
if ($toCommit -ne $package.toCommit) {
  throw "O commit da tag $ToTag no mirror diverge da evidência estruturada."
}
$guideHash = $package.guideSha256
$evidenceHash = $package.evidenceSha256

$repositoryRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).ProviderPath
$runsRoot = Join-Path $repositoryRoot '.ai-runs'
$runRoot = Join-Path $runsRoot $RunId
$snapshotRoot = Join-Path $runRoot 'rtc-sources'
Assert-ChildPath -ParentPath $runsRoot -ChildPath $snapshotRoot

$plan = [ordered]@{
  action = $Action
  runId = $RunId
  mirrorPath = $resolvedMirrorRoot
  guidePath = $resolvedGuidePath
  guideSha256 = $guideHash
  evidencePath = $resolvedEvidencePath
  evidenceSha256 = $evidenceHash
  evidenceSchemaVersion = $package.schemaVersion
  guideFormatVersion = $package.guideFormatVersion
  pipelineVersion = $package.pipelineVersion
  generatorCommit = $package.generatorCommit
  fromTag = $FromTag
  fromCommit = $fromCommit
  toTag = $ToTag
  toCommit = $toCommit
  snapshotRoot = $snapshotRoot
}

if ($Action -eq 'Plan') {
  [pscustomobject]$plan
  exit 0
}

if ($Action -eq 'Check') {
  Assert-SnapshotState `
    -SnapshotRoot $snapshotRoot `
    -ExpectedFromTag $FromTag `
    -ExpectedFromCommit $fromCommit `
    -ExpectedToTag $ToTag `
    -ExpectedToCommit $toCommit `
    -ExpectedGuideHash $guideHash `
    -ExpectedEvidenceHash $evidenceHash

  Write-Host "Snapshots verificados: $snapshotRoot"
  exit 0
}

if (Test-Path -LiteralPath $snapshotRoot) {
  Assert-SnapshotState `
    -SnapshotRoot $snapshotRoot `
    -ExpectedFromTag $FromTag `
    -ExpectedFromCommit $fromCommit `
    -ExpectedToTag $ToTag `
    -ExpectedToCommit $toCommit `
    -ExpectedGuideHash $guideHash `
    -ExpectedEvidenceHash $evidenceHash

  Write-Host "Snapshots já preparados e compatíveis: $snapshotRoot"
  exit 0
}

New-Item -ItemType Directory -Path $runRoot -Force | Out-Null
$temporaryRoot = Join-Path $runRoot ('.rtc-snapshot-' + [guid]::NewGuid().ToString('N'))
Assert-ChildPath -ParentPath $runRoot -ChildPath $temporaryRoot

try {
  $temporarySnapshots = Join-Path $temporaryRoot 'rtc-sources'
  New-Item -ItemType Directory -Path $temporarySnapshots -Force | Out-Null

  foreach ($source in @(
    @{ Side = 'from'; Tag = $FromTag; Commit = $fromCommit },
    @{ Side = 'to'; Tag = $ToTag; Commit = $toCommit }
  )) {
    $sideRoot = Join-Path $temporarySnapshots $source.Side
    $destination = Join-Path $sideRoot $source.Tag
    $archivePath = Join-Path $temporaryRoot ($source.Side + '.zip')
    New-Item -ItemType Directory -Path $destination -Force | Out-Null

    Invoke-GitReadOnly -RepositoryPath $resolvedMirrorRoot -Arguments @(
      'archive', '--format=zip', "--output=$archivePath", $source.Commit
    ) | Out-Null

    Expand-Archive -LiteralPath $archivePath -DestinationPath $destination
  }

  $manifest = [ordered]@{
    schemaVersion = 1
    createdAtUtc = [DateTime]::UtcNow.ToString('o')
    runId = $RunId
    mirrorPath = $resolvedMirrorRoot
    guidePath = $resolvedGuidePath
    guideSha256 = $guideHash
    evidencePath = $resolvedEvidencePath
    evidenceSha256 = $evidenceHash
    evidenceSchemaVersion = $package.schemaVersion
    guideFormatVersion = $package.guideFormatVersion
    pipelineVersion = $package.pipelineVersion
    generatorCommit = $package.generatorCommit
    fromTag = $FromTag
    fromCommit = $fromCommit
    toTag = $ToTag
    toCommit = $toCommit
  }

  $manifest | ConvertTo-Json -Depth 4 |
    Set-Content -LiteralPath (Join-Path $temporarySnapshots 'manifest.json') -Encoding UTF8

  Move-Item -LiteralPath $temporarySnapshots -Destination $snapshotRoot
  Assert-SnapshotState `
    -SnapshotRoot $snapshotRoot `
    -ExpectedFromTag $FromTag `
    -ExpectedFromCommit $fromCommit `
    -ExpectedToTag $ToTag `
    -ExpectedToCommit $toCommit `
    -ExpectedGuideHash $guideHash `
    -ExpectedEvidenceHash $evidenceHash
  Write-Host "Snapshots preparados: $snapshotRoot"
}
finally {
  if (Test-Path -LiteralPath $temporaryRoot) {
    Assert-ChildPath -ParentPath $runRoot -ChildPath $temporaryRoot
    Remove-Item -LiteralPath $temporaryRoot -Recurse -Force
  }
}
