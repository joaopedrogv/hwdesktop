[CmdletBinding()]
param(
  [ValidateSet('Check', 'Summary', 'Case', 'Change')]
  [string]$Action = 'Summary',

  [Parameter(Mandatory = $true)]
  [string]$EvidencePath,

  [Parameter(Mandatory = $true)]
  [string]$GuidePath,

  [string]$Id,
  [string]$ExpectedFromTag,
  [string]$ExpectedToTag,
  [switch]$IncludePatches,
  [switch]$AsJson
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Assert-Property {
  param(
    [object]$Object,
    [string]$Name,
    [string]$Location
  )

  if ($null -eq $Object -or $Object.PSObject.Properties.Name -notcontains $Name) {
    throw "Propriedade obrigatória ausente: $Location.$Name"
  }
}

function Read-GuideFrontmatter {
  param([string]$Path)

  $content = Get-Content -LiteralPath $Path -Raw
  $match = [regex]::Match($content, '\A---\r?\n(?<body>.*?)\r?\n---', 'Singleline')
  if (-not $match.Success) {
    throw "Frontmatter do guia não encontrado: $Path"
  }

  $metadata = @{}
  foreach ($line in ($match.Groups['body'].Value -split '\r?\n')) {
    if ($line -match '^([a-zA-Z0-9_]+):\s*(.*?)\s*$') {
      $metadata[$Matches[1]] = $Matches[2]
    }
  }

  return $metadata
}

function Convert-ToDateTimeOffset {
  param([object]$Value)

  if ($Value -is [DateTimeOffset]) {
    return $Value
  }
  if ($Value -is [DateTime]) {
    return [DateTimeOffset]$Value
  }
  return [DateTimeOffset]::Parse(
    [string]$Value,
    [Globalization.CultureInfo]::InvariantCulture,
    [Globalization.DateTimeStyles]::RoundtripKind
  )
}

function Convert-ChangeForOutput {
  param(
    [object]$Change,
    [switch]$WithPatches
  )

  $files = foreach ($file in @($Change.files)) {
    $hunks = foreach ($hunk in @($file.hunks)) {
      $hunkOutput = [ordered]@{
        id = $hunk.id
        header = $hunk.header
        old_start = $hunk.old_start
        old_lines = $hunk.old_lines
        new_start = $hunk.new_start
        new_lines = $hunk.new_lines
        symbol_hint = $hunk.symbol_hint
      }
      if ($WithPatches) {
        $hunkOutput.patch = $hunk.patch
      }
      [pscustomobject]$hunkOutput
    }

    [pscustomobject][ordered]@{
      path = $file.path
      git_status = $file.git_status
      change_kind = $file.change_kind
      changed_in_tags = @($file.changed_in_tags)
      symbols = @($file.symbols)
      hunks = @($hunks)
    }
  }

  return [pscustomobject][ordered]@{
    change_id = $Change.change_id
    title = $Change.title
    taxes = @($Change.taxes)
    implementation_impact = $Change.implementation_impact
    old_behavior = $Change.old_behavior
    new_behavior = $Change.new_behavior
    functional_difference = $Change.functional_difference
    behavioral_contracts = @($Change.behavioral_contracts)
    depends_on = @($Change.depends_on)
    files = @($files)
    evidence_refs = @($Change.evidence_refs)
    official_tests = @($Change.official_tests)
    suggested_regression_tests = @($Change.suggested_regression_tests)
    uncertainties = @($Change.uncertainties)
  }
}

function Write-Result {
  param([object]$Value)

  if ($AsJson) {
    $Value | ConvertTo-Json -Depth 100
  } else {
    Write-Output $Value
  }
}

$resolvedEvidencePath = (Resolve-Path -LiteralPath $EvidencePath -ErrorAction Stop).ProviderPath
$resolvedGuidePath = (Resolve-Path -LiteralPath $GuidePath -ErrorAction Stop).ProviderPath

try {
  $evidence = Get-Content -LiteralPath $resolvedEvidencePath -Raw | ConvertFrom-Json
}
catch {
  throw "implementation-evidence.json inválido: $($_.Exception.Message)"
}

foreach ($propertyName in @('schema_version', 'guide_format_version', 'metadata', 'coverage', 'cases')) {
  Assert-Property -Object $evidence -Name $propertyName -Location 'evidence'
}

if ([int]$evidence.schema_version -ne 1) {
  throw "Schema de evidência não suportado: $($evidence.schema_version)"
}
if ([int]$evidence.guide_format_version -ne 2) {
  throw "Formato de guia não suportado: $($evidence.guide_format_version)"
}

$metadata = $evidence.metadata
foreach ($propertyName in @(
  'from_tag', 'from_commit', 'to_tag', 'to_commit',
  'analysis_generated_at_utc', 'evidence_generated_at_utc',
  'pipeline_version', 'generator_commit'
)) {
  Assert-Property -Object $metadata -Name $propertyName -Location 'evidence.metadata'
}

if ($metadata.from_tag -eq $metadata.to_tag) {
  throw 'As tags de origem e destino da evidência devem ser diferentes.'
}
if ([string]::CompareOrdinal([string]$metadata.from_tag, [string]$metadata.to_tag) -ge 0) {
  throw 'A tag de origem da evidência deve ser anterior à tag de destino.'
}
if ($ExpectedFromTag -and $metadata.from_tag -ne $ExpectedFromTag) {
  throw "Tag de origem divergente: evidência=$($metadata.from_tag), esperada=$ExpectedFromTag"
}
if ($ExpectedToTag -and $metadata.to_tag -ne $ExpectedToTag) {
  throw "Tag de destino divergente: evidência=$($metadata.to_tag), esperada=$ExpectedToTag"
}
foreach ($commitProperty in @('from_commit', 'to_commit', 'generator_commit')) {
  if ([string]$metadata.$commitProperty -notmatch '^[0-9a-fA-F]{40}$') {
    throw "Commit inválido em evidence.metadata.$commitProperty"
  }
}

$guideMetadata = Read-GuideFrontmatter -Path $resolvedGuidePath
$guideRequirements = @{
  guide_format_version = [string]$evidence.guide_format_version
  evidence_schema_version = [string]$evidence.schema_version
  from_tag = [string]$metadata.from_tag
  from_commit = [string]$metadata.from_commit
  to_tag = [string]$metadata.to_tag
  to_commit = [string]$metadata.to_commit
  pipeline_version = [string]$metadata.pipeline_version
  generator_commit = [string]$metadata.generator_commit
}
foreach ($name in $guideRequirements.Keys) {
  if (-not $guideMetadata.ContainsKey($name)) {
    throw "Metadata obrigatória ausente no guia: $name"
  }
  if ([string]$guideMetadata[$name] -ne $guideRequirements[$name]) {
    throw "Metadata divergente entre guia e evidência: $name"
  }
}

$guideGeneratedAt = Convert-ToDateTimeOffset -Value $guideMetadata['generated_at_utc']
$evidenceGeneratedAt = Convert-ToDateTimeOffset -Value $metadata.evidence_generated_at_utc
if ($guideGeneratedAt.ToUniversalTime() -ne $evidenceGeneratedAt.ToUniversalTime()) {
  throw 'Data de geração divergente entre guia e evidência.'
}

$coverage = $evidence.coverage
foreach ($propertyName in @(
  'complete', 'relevant_candidates', 'covered_by_cases', 'excluded_by_triage',
  'unclassified', 'excluded_by_scope', 'production_inventory', 'official_tests'
)) {
  Assert-Property -Object $coverage -Name $propertyName -Location 'evidence.coverage'
}
if (-not [bool]$coverage.complete) {
  throw 'A cobertura do pacote de evidências não está completa.'
}
if (@($coverage.unclassified).Count -ne 0) {
  throw 'O pacote contém artefatos de produção não classificados.'
}
if ([int]$coverage.relevant_candidates -ne (
  [int]$coverage.covered_by_cases + [int]$coverage.excluded_by_triage
)) {
  throw 'A contagem de candidatos relevantes não fecha com cobertos e excluídos pela triagem.'
}
foreach ($propertyName in @('artifacts_expected', 'scenarios', 'unassociated_artifacts')) {
  Assert-Property -Object $coverage.official_tests -Name $propertyName -Location 'evidence.coverage.official_tests'
}

$inventoryGroups = @{}
foreach ($group in @($coverage.production_inventory | Group-Object disposition)) {
  $inventoryGroups[$group.Name] = $group.Count
}
foreach ($expectedDisposition in @{
  covered_by_cases = [int]$coverage.covered_by_cases
  excluded_by_triage = [int]$coverage.excluded_by_triage
  excluded_by_scope = [int]$coverage.excluded_by_scope
}.GetEnumerator()) {
  $actual = if ($inventoryGroups.ContainsKey($expectedDisposition.Key)) {
    [int]$inventoryGroups[$expectedDisposition.Key]
  } else {
    0
  }
  if ($actual -ne $expectedDisposition.Value) {
    throw "Contagem divergente no inventário de produção: $($expectedDisposition.Key)"
  }
}
$expectedInventoryCount = [int]$coverage.covered_by_cases +
  [int]$coverage.excluded_by_triage +
  [int]$coverage.excluded_by_scope
if (@($coverage.production_inventory).Count -ne $expectedInventoryCount) {
  throw 'O total do inventário de produção não fecha com suas disposições.'
}

$caseIds = @{}
$changeIds = @{}
$changes = @()
foreach ($case in @($evidence.cases)) {
  foreach ($propertyName in @('case_id', 'title', 'executive_summary', 'context_sufficient', 'changes')) {
    Assert-Property -Object $case -Name $propertyName -Location 'evidence.cases[]'
  }
  $caseId = [string]$case.case_id
  if ([string]::IsNullOrWhiteSpace($caseId)) {
    throw "case_id inválido: $($case.case_id)"
  }
  if ($caseIds.ContainsKey($caseId)) {
    throw "case_id duplicado: $($case.case_id)"
  }
  $caseIds[$caseId] = $true

  foreach ($change in @($case.changes)) {
    foreach ($propertyName in @(
      'change_id', 'title', 'implementation_impact', 'old_behavior', 'new_behavior',
      'functional_difference', 'behavioral_contracts', 'depends_on', 'files',
      'evidence_refs', 'official_tests', 'suggested_regression_tests', 'uncertainties'
    )) {
      Assert-Property -Object $change -Name $propertyName -Location "evidence.$($case.case_id).changes[]"
    }
    $changeId = [string]$change.change_id
    $caseChangePrefix = "$caseId-"
    if ([string]::IsNullOrWhiteSpace($changeId) -or
        -not $changeId.StartsWith($caseChangePrefix, [StringComparison]::Ordinal) -or
        $changeId.Length -le $caseChangePrefix.Length) {
      throw "change_id incompatível com o caso $($case.case_id): $($change.change_id)"
    }
    if ($changeIds.ContainsKey($changeId)) {
      throw "change_id duplicado: $($change.change_id)"
    }
    if ([string]$change.implementation_impact -notin @('OBRIGATORIO', 'PROVAVEL', 'VERIFICAR', 'SEM_ACAO')) {
      throw "implementation_impact inválido em $($change.change_id)"
    }
    $changeIds[$changeId] = $true
    $changes += $change
  }
}

foreach ($change in $changes) {
  $hunkIds = @{}
  foreach ($file in @($change.files)) {
    foreach ($propertyName in @('path', 'git_status', 'change_kind', 'changed_in_tags', 'symbols', 'hunks')) {
      Assert-Property -Object $file -Name $propertyName -Location "$($change.change_id).files[]"
    }
    foreach ($hunk in @($file.hunks)) {
      foreach ($propertyName in @(
        'id', 'header', 'old_start', 'old_lines', 'new_start', 'new_lines',
        'symbol_hint', 'patch'
      )) {
        Assert-Property -Object $hunk -Name $propertyName -Location "$($change.change_id).files[].hunks[]"
      }
      if ($hunkIds.ContainsKey([string]$hunk.id)) {
        throw "Hunk duplicado em $($change.change_id): $($hunk.id)"
      }
      $hunkIds[[string]$hunk.id] = $true
    }
  }
  foreach ($reference in @($change.evidence_refs)) {
    if (-not $hunkIds.ContainsKey([string]$reference)) {
      throw "Referência de evidência não resolvida em $($change.change_id): $reference"
    }
  }
  foreach ($dependency in @($change.depends_on)) {
    Assert-Property -Object $dependency -Name 'change_id' -Location "$($change.change_id).depends_on[]"
    Assert-Property -Object $dependency -Name 'reason' -Location "$($change.change_id).depends_on[]"
    if (-not $changeIds.ContainsKey([string]$dependency.change_id)) {
      throw "Dependência inexistente em $($change.change_id): $($dependency.change_id)"
    }
    if ([string]$dependency.change_id -eq [string]$change.change_id) {
      throw "Autodependência em $($change.change_id)"
    }
  }
  foreach ($test in @($change.official_tests)) {
    foreach ($propertyName in @(
      'test_file', 'method_or_scenario', 'change_ids', 'test_status', 'fixtures',
      'input_summary', 'expected_result', 'proves'
    )) {
      Assert-Property -Object $test -Name $propertyName -Location "$($change.change_id).official_tests[]"
    }
    if ([string]$test.test_status -notin @('added', 'modified', 'removed', 'unchanged')) {
      throw "Status de teste oficial inválido em $($change.change_id): $($test.test_status)"
    }
    if ([string]$change.change_id -notin @($test.change_ids)) {
      throw "Teste oficial não referencia sua mudança proprietária: $($change.change_id)"
    }
    foreach ($testChangeId in @($test.change_ids)) {
      if (-not $changeIds.ContainsKey([string]$testChangeId)) {
        throw "Teste oficial referencia change_id inexistente: $testChangeId"
      }
    }
  }
}

$evidenceHash = (Get-FileHash -LiteralPath $resolvedEvidencePath -Algorithm SHA256).Hash.ToLowerInvariant()
$guideHash = (Get-FileHash -LiteralPath $resolvedGuidePath -Algorithm SHA256).Hash.ToLowerInvariant()
$officialTestLinks = @($changes | ForEach-Object { $_.official_tests })
$officialTestScenarios = @(
  $officialTestLinks |
    ForEach-Object { ([string]$_.test_file) + '|' + ([string]$_.method_or_scenario) } |
    Sort-Object -Unique
)

$package = [pscustomobject][ordered]@{
  schemaVersion = [int]$evidence.schema_version
  guideFormatVersion = [int]$evidence.guide_format_version
  fromTag = [string]$metadata.from_tag
  fromCommit = [string]$metadata.from_commit
  toTag = [string]$metadata.to_tag
  toCommit = [string]$metadata.to_commit
  pipelineVersion = [int]$metadata.pipeline_version
  generatorCommit = [string]$metadata.generator_commit
  evidencePath = $resolvedEvidencePath
  evidenceSha256 = $evidenceHash
  guidePath = $resolvedGuidePath
  guideSha256 = $guideHash
  coverageComplete = [bool]$coverage.complete
  relevantCandidates = [int]$coverage.relevant_candidates
  coveredByCases = [int]$coverage.covered_by_cases
  excludedByTriage = [int]$coverage.excluded_by_triage
  excludedByScope = [int]$coverage.excluded_by_scope
  unclassified = @($coverage.unclassified).Count
  caseCount = @($evidence.cases).Count
  changeCount = $changes.Count
  officialTestArtifactsExpected = [int]$coverage.official_tests.artifacts_expected
  officialTestScenarios = [int]$coverage.official_tests.scenarios
  officialTestAssociations = $officialTestLinks.Count
  uniqueLinkedOfficialTests = $officialTestScenarios.Count
  unassociatedOfficialTestArtifacts = @($coverage.official_tests.unassociated_artifacts).Count
}

if ($Action -eq 'Check') {
  Write-Result -Value $package
  return
}

if ($Action -eq 'Summary') {
  $caseSummary = foreach ($case in @($evidence.cases)) {
    [pscustomobject][ordered]@{
      case_id = $case.case_id
      title = $case.title
      context_sufficient = [bool]$case.context_sufficient
      change_count = @($case.changes).Count
      change_ids = @($case.changes.change_id)
    }
  }
  $changeSummary = foreach ($change in $changes) {
    [pscustomobject][ordered]@{
      change_id = $change.change_id
      title = $change.title
      implementation_impact = $change.implementation_impact
      depends_on = @($change.depends_on | ForEach-Object { $_.change_id })
      file_count = @($change.files).Count
      official_test_count = @($change.official_tests).Count
      suggested_test_count = @($change.suggested_regression_tests).Count
      uncertainty_count = @($change.uncertainties).Count
    }
  }
  Write-Result -Value ([pscustomobject][ordered]@{
    package = $package
    cases = @($caseSummary)
    changes = @($changeSummary)
  })
  return
}

if (-not $Id) {
  throw "-Id é obrigatório para a ação $Action."
}

if ($Action -eq 'Case') {
  $selectedCase = @($evidence.cases | Where-Object { $_.case_id -eq $Id })
  if ($selectedCase.Count -ne 1) {
    throw "Caso não encontrado ou ambíguo: $Id"
  }
  $selectedChanges = foreach ($change in @($selectedCase[0].changes)) {
    Convert-ChangeForOutput -Change $change -WithPatches:$IncludePatches
  }
  Write-Result -Value ([pscustomobject][ordered]@{
    case_id = $selectedCase[0].case_id
    title = $selectedCase[0].title
    executive_summary = $selectedCase[0].executive_summary
    context_sufficient = [bool]$selectedCase[0].context_sufficient
    changes = @($selectedChanges)
  })
  return
}

$selectedChange = @($changes | Where-Object { $_.change_id -eq $Id })
if ($selectedChange.Count -ne 1) {
  throw "Mudança não encontrada ou ambígua: $Id"
}
Write-Result -Value (Convert-ChangeForOutput -Change $selectedChange[0] -WithPatches:$IncludePatches)
