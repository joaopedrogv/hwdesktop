[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [ValidateSet('Kilo', 'AiderDesk', 'Codex', 'Shared', 'All')]
    [string]$Tool = 'All',

    [ValidateSet('Plan', 'Apply', 'Check', 'Remove', 'Switch')]
    [string]$Action = 'Plan',

    [string]$ModelConfig
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'

if ($PSVersionTable.PSVersion.Major -lt 7) {
    throw 'Sync-AIProfiles.ps1 requires PowerShell 7 or newer (pwsh).'
}

$script:RepositoryRoot = [IO.Path]::GetFullPath(
    (Join-Path $PSScriptRoot '..\..')
).TrimEnd([IO.Path]::DirectorySeparatorChar, [IO.Path]::AltDirectorySeparatorChar)
$script:SetupSourceRoot = Join-Path $script:RepositoryRoot 'docs\ia-assistida\setups-de-ferramentas'
$script:Utf8NoBom = New-Object Text.UTF8Encoding($false)
$script:HadDrift = $false

function Read-JsonFile {
    param([Parameter(Mandatory = $true)][string]$Path)

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Required JSON file not found: $Path"
    }

    try {
        return Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json
    }
    catch {
        throw "Invalid JSON file '$Path': $($_.Exception.Message)"
    }
}

function Normalize-Content {
    param([AllowEmptyString()][string]$Content)

    if ($null -eq $Content) {
        return ''
    }

    return ($Content -replace "`r`n", "`n" -replace "`r", "`n")
}

function Complete-Content {
    param([AllowEmptyString()][string]$Content)

    $normalized = Normalize-Content $Content
    if (-not $normalized.EndsWith("`n")) {
        $normalized += "`n"
    }
    return $normalized
}

function Resolve-SafeRepositoryPath {
    param([Parameter(Mandatory = $true)][string]$RelativePath)

    if ([string]::IsNullOrWhiteSpace($RelativePath) -or
        [IO.Path]::IsPathRooted($RelativePath)) {
        throw "Repository destination must be a non-empty relative path: '$RelativePath'"
    }

    $candidate = [IO.Path]::GetFullPath(
        (Join-Path $script:RepositoryRoot ($RelativePath -replace '/', [IO.Path]::DirectorySeparatorChar))
    )
    $prefix = $script:RepositoryRoot + [IO.Path]::DirectorySeparatorChar

    if (-not $candidate.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Destination escapes the repository root: '$RelativePath'"
    }

    return $candidate
}

function Resolve-SafeSourcePath {
    param([Parameter(Mandatory = $true)][string]$RelativePath)

    if ([string]::IsNullOrWhiteSpace($RelativePath) -or
        [IO.Path]::IsPathRooted($RelativePath)) {
        throw "Setup source must be a non-empty relative path: '$RelativePath'"
    }

    $candidate = [IO.Path]::GetFullPath(
        (Join-Path $script:SetupSourceRoot ($RelativePath -replace '/', [IO.Path]::DirectorySeparatorChar))
    )
    $prefix = [IO.Path]::GetFullPath($script:SetupSourceRoot).TrimEnd(
        [IO.Path]::DirectorySeparatorChar,
        [IO.Path]::AltDirectorySeparatorChar
    ) + [IO.Path]::DirectorySeparatorChar

    if (-not $candidate.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Source escapes the setup source root: '$RelativePath'"
    }

    return $candidate
}

function Convert-ToRepositoryRelativePath {
    param([Parameter(Mandatory = $true)][string]$FullPath)

    $rootUri = New-Object Uri(($script:RepositoryRoot.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar))
    $pathUri = New-Object Uri([IO.Path]::GetFullPath($FullPath))
    $relative = [Uri]::UnescapeDataString($rootUri.MakeRelativeUri($pathUri).ToString())
    return ($relative -replace '\\', '/')
}

function Get-ToolSetupPath {
    param([Parameter(Mandatory = $true)][string]$ToolName)

    switch ($ToolName) {
        'Kilo' { return 'tools/kilo/setup.json' }
        'AiderDesk' { return 'tools/aider-desk/setup.json' }
        'Codex' { return 'tools/codex/setup.json' }
        'Shared' { return 'shared/setup.json' }
        default { throw "Unsupported setup tool: $ToolName" }
    }
}

function Get-ToolPackageRelativeRoot {
    param([Parameter(Mandatory = $true)][string]$ToolName)

    switch ($ToolName) {
        'Kilo' { return 'tools/kilo' }
        'AiderDesk' { return 'tools/aider-desk' }
        'Codex' { return 'tools/codex' }
        'Shared' { return 'shared' }
        default { throw "Unsupported setup tool: $ToolName" }
    }
}

function Get-SetupDefinition {
    param([Parameter(Mandatory = $true)][string]$ToolName)

    $definition = Read-JsonFile (Resolve-SafeSourcePath (Get-ToolSetupPath $ToolName))
    if ($definition.schemaVersion -ne 1 -or $definition.tool -ne $ToolName) {
        throw "Unexpected setup schema or tool name for $ToolName."
    }

    $toolRoot = Resolve-SafeRepositoryPath $definition.toolRoot
    Resolve-SafeRepositoryPath $definition.stateFile | Out-Null

    $disposableProperty = $definition.PSObject.Properties['disposablePaths']
    if ($null -ne $disposableProperty) {
        $toolPrefix = $toolRoot.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
        $seenDisposablePaths = @{}
        foreach ($relativePath in @($disposableProperty.Value)) {
            if ($relativePath -isnot [string] -or [string]::IsNullOrWhiteSpace($relativePath)) {
                throw "Disposable paths for $ToolName must be non-empty strings."
            }
            $fullPath = Resolve-SafeRepositoryPath $relativePath
            if (-not $fullPath.StartsWith($toolPrefix, [StringComparison]::OrdinalIgnoreCase)) {
                throw "Disposable path escapes the $ToolName tool root: '$relativePath'"
            }
            if ($seenDisposablePaths.ContainsKey($relativePath)) {
                throw "Setup definition contains a duplicate disposable path: '$relativePath'"
            }
            $seenDisposablePaths[$relativePath] = $true
        }
    }
    return $definition
}

function Merge-JsonObject {
    param(
        [Parameter(Mandatory = $true)]$Base,
        [Parameter(Mandatory = $true)]$Override
    )

    foreach ($property in $Override.PSObject.Properties) {
        $existing = $Base.PSObject.Properties[$property.Name]
        if ($null -ne $existing -and
            $null -ne $existing.Value -and
            $null -ne $property.Value -and
            $existing.Value -is [PSCustomObject] -and
            $property.Value -is [PSCustomObject]) {
            Merge-JsonObject -Base $existing.Value -Override $property.Value
        }
        else {
            $Base | Add-Member -MemberType NoteProperty -Name $property.Name `
                -Value $property.Value -Force
        }
    }
}

function Get-ModelConfiguration {
    $defaultPath = Resolve-SafeSourcePath 'models.json'
    $configuration = Read-JsonFile $defaultPath

    $overridePath = $null
    if (-not [string]::IsNullOrWhiteSpace($ModelConfig)) {
        $overridePath = [IO.Path]::GetFullPath(
            $(if ([IO.Path]::IsPathRooted($ModelConfig)) {
                $ModelConfig
            }
            else {
                Join-Path $script:RepositoryRoot $ModelConfig
            })
        )
    }
    else {
        $candidate = Resolve-SafeSourcePath 'models.local.json'
        if (Test-Path -LiteralPath $candidate -PathType Leaf) {
            $overridePath = $candidate
        }
    }

    if ($null -ne $overridePath) {
        $override = Read-JsonFile $overridePath
        Merge-JsonObject -Base $configuration -Override $override
    }

    if ($configuration.schemaVersion -ne 1) {
        throw 'Unsupported models.json schema version.'
    }

    return $configuration
}

function Get-AgentsConfiguration {
    $configuration = Read-JsonFile (Resolve-SafeSourcePath 'agents.json')
    if ($configuration.schemaVersion -ne 1) {
        throw 'Unsupported agents.json schema version.'
    }

    $names = @($configuration.agents | ForEach-Object { $_.name })
    if (($names | Sort-Object -Unique).Count -ne $names.Count) {
        throw 'agents.json contains duplicate Agent names.'
    }
    foreach ($agent in @($configuration.agents)) {
        if ([string]$agent.name -notmatch '^modern-[a-z0-9-]+$') {
            throw "Invalid Agent name in agents.json: '$($agent.name)'"
        }
        if (-not (Test-Path -LiteralPath (Join-Path $script:RepositoryRoot ".ai\agents\$($agent.canonicalRole).md") -PathType Leaf)) {
            throw "Canonical Agent role not found: '$($agent.canonicalRole)'"
        }
        $parsedId = [guid]::Empty
        if (-not [guid]::TryParse([string]$agent.aiderDesk.id, [ref]$parsedId)) {
            throw "Invalid AiderDesk Agent ID: '$($agent.aiderDesk.id)'"
        }
    }

    $ids = @($configuration.agents | ForEach-Object { $_.aiderDesk.id })
    if (($ids | Sort-Object -Unique).Count -ne $ids.Count) {
        throw 'agents.json contains duplicate AiderDesk IDs.'
    }

    $orders = @($configuration.agents | ForEach-Object { [int]$_.aiderDesk.order })
    if (($orders | Sort-Object -Unique).Count -ne $orders.Count) {
        throw 'agents.json contains duplicate AiderDesk order positions.'
    }
    if ((($orders | Sort-Object) -join ',') -cne ((0..($orders.Count - 1)) -join ',')) {
        throw 'AiderDesk order positions must be contiguous and start at zero.'
    }

    return $configuration
}

function Get-ExecutionProfileMapping {
    param(
        [Parameter(Mandatory = $true)]$Models,
        [Parameter(Mandatory = $true)][string]$ExecutionProfile,
        [Parameter(Mandatory = $true)][string]$ToolProperty
    )

    $profileProperty = $Models.executionProfiles.PSObject.Properties[$ExecutionProfile]
    if ($null -eq $profileProperty) {
        throw "No model mapping exists for execution profile '$ExecutionProfile'."
    }

    $toolMapping = $profileProperty.Value.PSObject.Properties[$ToolProperty]
    if ($null -eq $toolMapping -or [string]::IsNullOrWhiteSpace($toolMapping.Value.model)) {
        throw "No model mapping exists for '$ExecutionProfile' and '$ToolProperty'."
    }
    if ([string]$toolMapping.Value.model -notmatch '^[A-Za-z0-9._:/@+-]+$') {
        throw "Unsafe or invalid model identifier for '$ExecutionProfile' and '$ToolProperty'."
    }

    return $toolMapping.Value
}

function Add-ExpectedFile {
    param(
        [Parameter(Mandatory = $true)][hashtable]$Files,
        [Parameter(Mandatory = $true)][string]$Destination,
        [Parameter(Mandatory = $true)][AllowEmptyString()][string]$Content
    )

    $fullPath = Resolve-SafeRepositoryPath $Destination
    $relative = Convert-ToRepositoryRelativePath $fullPath
    if ($Files.ContainsKey($relative)) {
        throw "Setup renders the same destination more than once: $relative"
    }

    $Files[$relative] = Complete-Content $Content
}

function Add-StaticFiles {
    param(
        [Parameter(Mandatory = $true)]$Definition,
        [Parameter(Mandatory = $true)][string]$ToolName,
        [Parameter(Mandatory = $true)][hashtable]$Files
    )

    $packageRoot = Get-ToolPackageRelativeRoot $ToolName
    foreach ($item in @($Definition.staticFiles)) {
        $sourceRelative = "$packageRoot/$($item.source)"
        $sourcePath = Resolve-SafeSourcePath $sourceRelative
        if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
            throw "Static setup source not found: $sourceRelative"
        }
        Add-ExpectedFile -Files $Files -Destination $item.destination `
            -Content (Get-Content -LiteralPath $sourcePath -Raw)
    }
}

function Get-CanonicalSkillFrontmatter {
    param([Parameter(Mandatory = $true)][string]$SkillFile)

    $content = Normalize-Content (Get-Content -LiteralPath $SkillFile -Raw)
    $match = [regex]::Match($content, '\A---\n.*?\n---', [Text.RegularExpressions.RegexOptions]::Singleline)
    if (-not $match.Success) {
        throw "Canonical Skill has no valid frontmatter: $SkillFile"
    }
    return $match.Value
}

function Add-SkillWrappers {
    param(
        [Parameter(Mandatory = $true)][hashtable]$Files,
        [Parameter(Mandatory = $true)][string]$DestinationRoot
    )

    $templatePath = Resolve-SafeSourcePath 'shared/templates/skill-wrapper.md.tpl'
    $template = Get-Content -LiteralPath $templatePath -Raw
    $skillRoot = Resolve-SafeRepositoryPath '.ai/skills'

    foreach ($skillDirectory in @(Get-ChildItem -LiteralPath $skillRoot -Directory | Sort-Object Name)) {
        $canonicalFile = Join-Path $skillDirectory.FullName 'SKILL.md'
        if (-not (Test-Path -LiteralPath $canonicalFile -PathType Leaf)) {
            continue
        }

        $content = $template.Replace('{{canonicalFrontmatter}}',
            (Get-CanonicalSkillFrontmatter $canonicalFile))
        $content = $content.Replace('{{skillName}}', $skillDirectory.Name)
        if ($content -match '{{[^}]+}}') {
            throw "Unresolved Skill wrapper token for '$($skillDirectory.Name)'."
        }

        Add-ExpectedFile -Files $Files `
            -Destination "$DestinationRoot/$($skillDirectory.Name)/SKILL.md" `
            -Content $content
    }
}

function Add-CommandSkillWrappers {
    param(
        [Parameter(Mandatory = $true)][hashtable]$Files,
        [Parameter(Mandatory = $true)][string]$DestinationRoot
    )

    $templatePath = Resolve-SafeSourcePath 'shared/templates/command-skill-wrapper.md.tpl'
    $template = Get-Content -LiteralPath $templatePath -Raw
    $commandRoot = Resolve-SafeRepositoryPath '.ai/commands'

    foreach ($commandFile in @(Get-ChildItem -LiteralPath $commandRoot -File -Filter '*.md' | Sort-Object Name)) {
        $content = Normalize-Content (Get-Content -LiteralPath $commandFile.FullName -Raw)
        $frontmatter = [regex]::Match(
            $content,
            '\A---\n.*?\n---',
            [Text.RegularExpressions.RegexOptions]::Singleline
        )
        if (-not $frontmatter.Success) {
            throw "Canonical Command has no valid frontmatter: $($commandFile.FullName)"
        }

        $commandName = [IO.Path]::GetFileNameWithoutExtension($commandFile.Name)
        $rendered = $template.Replace('{{canonicalFrontmatter}}', $frontmatter.Value)
        $rendered = $rendered.Replace('{{commandName}}', $commandName)
        if ($rendered -match '{{[^}]+}}') {
            throw "Unresolved Command Skill wrapper token for '$commandName'."
        }

        Add-ExpectedFile -Files $Files `
            -Destination "$DestinationRoot/$commandName/SKILL.md" `
            -Content $rendered
    }
}

function Add-KiloAgents {
    param(
        [Parameter(Mandatory = $true)]$Definition,
        [Parameter(Mandatory = $true)]$Agents,
        [Parameter(Mandatory = $true)]$Models,
        [Parameter(Mandatory = $true)][hashtable]$Files
    )

    foreach ($agent in @($Agents.agents)) {
        $templatePath = Resolve-SafeSourcePath $agent.kiloTemplate
        if (-not (Test-Path -LiteralPath $templatePath -PathType Leaf)) {
            throw "Kilo Agent template not found: $($agent.kiloTemplate)"
        }

        $mapping = Get-ExecutionProfileMapping -Models $Models `
            -ExecutionProfile $agent.executionProfile -ToolProperty 'kilo'
        $content = (Get-Content -LiteralPath $templatePath -Raw).Replace(
            '{{model}}', [string]$mapping.model
        )
        # Preserve explicitly declared local per-Agent choices independently of
        # canonical role/permission changes in the templates.
        $localAgents = $Models.PSObject.Properties['kiloAgents']
        if ($null -ne $localAgents) {
            if ($localAgents.Value -isnot [PSCustomObject]) {
                throw 'kiloAgents must be an object indexed by Agent name.'
            }
            foreach ($entry in $localAgents.Value.PSObject.Properties) {
                if ($entry.Name -notin @($Agents.agents | ForEach-Object { $_.name })) {
                    throw "Unknown local Kilo Agent: '$($entry.Name)'"
                }
            }
            $localAgent = $localAgents.Value.PSObject.Properties[[string]$agent.name]
            if ($null -ne $localAgent) {
                if ($localAgent.Value -isnot [PSCustomObject]) {
                    throw "Local Kilo settings must be an object: '$($agent.name)'"
                }
                foreach ($setting in $localAgent.Value.PSObject.Properties) {
                    if ($setting.Name -eq 'model') {
                        if ([string]$setting.Value -notmatch '^[A-Za-z0-9._:/@+-]+$') {
                            throw "Invalid local Kilo model for '$($agent.name)'."
                        }
                        $content = [regex]::Replace($content, '(?m)^model: [^\r\n]+',
                            ('model: ' + [string]$setting.Value))
                    }
                    elseif ($setting.Name -eq 'steps') {
                        if ([string]$setting.Value -notmatch '^[1-9][0-9]*$' -or
                            [long]$setting.Value -gt [int]::MaxValue) {
                            throw "Invalid local Kilo steps for '$($agent.name)'."
                        }
                        $content = [regex]::Replace($content, '(?m)^steps: [0-9]+',
                            ('steps: ' + [string]$setting.Value))
                    }
                    elseif ($setting.Name -eq 'permissions') {
                        if ($setting.Value -isnot [PSCustomObject]) {
                            throw "Local Kilo permissions must be an object: '$($agent.name)'"
                        }
                        foreach ($permission in $setting.Value.PSObject.Properties) {
                            if ($permission.Name -notin @('edit', 'write', 'apply_patch', 'bash') -or
                                [string]$permission.Value -notin @('allow', 'ask', 'deny')) {
                                throw "Invalid local Kilo permission for '$($agent.name)'."
                            }
                            $pattern = '(?m)^  ' + [regex]::Escape($permission.Name) + ': (allow|ask|deny)\r?$'
                            if (-not [regex]::IsMatch($content, $pattern)) {
                                throw "Local permission cannot replace a scoped Kilo policy: '$($agent.name)/$($permission.Name)'"
                            }
                            $content = [regex]::Replace($content, $pattern,
                                ('  ' + $permission.Name + ': ' + [string]$permission.Value))
                        }
                    }
                    else {
                        throw "Unsupported local Kilo Agent setting: '$($setting.Name)'"
                    }
                }
            }
        }
        if ($content -match '{{[^}]+}}') {
            throw "Unresolved Kilo template token for '$($agent.name)'."
        }

        Add-ExpectedFile -Files $Files `
            -Destination "$($Definition.agentDestination)/$($agent.name).md" `
            -Content $content
    }
}

function ConvertTo-OrderedCopy {
    param($InputObject)

    if ($null -eq $InputObject) {
        return $null
    }
    if ($InputObject -is [PSCustomObject]) {
        $copy = [ordered]@{}
        foreach ($property in $InputObject.PSObject.Properties) {
            $copy[$property.Name] = ConvertTo-OrderedCopy $property.Value
        }
        return $copy
    }
    if ($InputObject -is [Collections.IEnumerable] -and $InputObject -isnot [string]) {
        return @($InputObject | ForEach-Object { ConvertTo-OrderedCopy $_ })
    }
    return $InputObject
}

function Add-AiderDeskAgents {
    param(
        [Parameter(Mandatory = $true)]$Definition,
        [Parameter(Mandatory = $true)]$Agents,
        [Parameter(Mandatory = $true)]$Models,
        [Parameter(Mandatory = $true)][hashtable]$Files
    )

    $packageRoot = Get-ToolPackageRelativeRoot 'AiderDesk'
    $presetPath = Resolve-SafeSourcePath "$packageRoot/$($Definition.presetFile)"
    $presetConfiguration = Read-JsonFile $presetPath
    $workerIds = @($Agents.agents | Where-Object { -not $_.aiderDesk.primary } |
        Sort-Object { [int]$_.aiderDesk.order } | ForEach-Object { $_.aiderDesk.id })

    foreach ($agent in @($Agents.agents | Sort-Object { [int]$_.aiderDesk.order })) {
        $presetProperty = $presetConfiguration.presets.PSObject.Properties[$agent.aiderDesk.preset]
        if ($null -eq $presetProperty) {
            throw "Unknown AiderDesk preset '$($agent.aiderDesk.preset)'."
        }
        $preset = $presetProperty.Value
        $mapping = Get-ExecutionProfileMapping -Models $Models `
            -ExecutionProfile $agent.executionProfile -ToolProperty 'aiderDesk'
        if ([string]::IsNullOrWhiteSpace($mapping.provider)) {
            throw "AiderDesk provider is missing for '$($agent.executionProfile)'."
        }
        if ([string]$mapping.provider -notmatch '^[A-Za-z0-9._:/@+-]+$') {
            throw "Unsafe or invalid AiderDesk provider for '$($agent.executionProfile)'."
        }

        $promptPath = Resolve-SafeSourcePath $agent.aiderDesk.promptFile
        $prompt = (Normalize-Content (Get-Content -LiteralPath $promptPath -Raw)).Trim()
        $isPrimary = [bool]$agent.aiderDesk.primary

        $profile = [ordered]@{
            id = [string]$agent.aiderDesk.id
            name = [string]$agent.name
            provider = [string]$mapping.provider
            model = [string]$mapping.model
            maxIterations = [int]$agent.aiderDesk.maxIterations
            minTimeBetweenToolCalls = 0
            toolApprovals = ConvertTo-OrderedCopy $preset.toolApprovals
            toolSettings = ConvertTo-OrderedCopy $preset.toolSettings
            includeContextFiles = $false
            includeRepoMap = $false
            usePowerTools = $true
            useAiderTools = $false
            useTodoTools = [bool]$preset.useTodoTools
            useSubagents = [bool]$preset.useSubagents
            useTaskTools = $false
            useMemoryTools = $false
            useSkillsTools = [bool]$preset.useSkillsTools
            useExtensionTools = $true
            disabledExtensionTools = @()
            customInstructions = $(if ($isPrimary) { $prompt } else { '' })
            enabledServers = @()
            subagent = [ordered]@{
                enabled = (-not $isPrimary)
                systemPrompt = $(if ($isPrimary) { '' } else { $prompt })
                invocationMode = 'on-demand'
                color = '#3368a8'
                description = ''
                contextMemory = 'off'
            }
            enabledSubagentIds = $(if ($isPrimary) { $workerIds } else { @() })
            projectDir = $script:RepositoryRoot
        }

        $json = $profile | ConvertTo-Json -Depth 30
        Add-ExpectedFile -Files $Files `
            -Destination "$($Definition.agentDestination)/$($agent.name)/config.json" `
            -Content $json
    }

    $order = [ordered]@{}
    foreach ($agent in @($Agents.agents | Sort-Object { [int]$_.aiderDesk.order })) {
        $order[[string]$agent.aiderDesk.id] = [int]$agent.aiderDesk.order
    }
    Add-ExpectedFile -Files $Files `
        -Destination "$($Definition.agentDestination)/order.json" `
        -Content ($order | ConvertTo-Json -Depth 5)
}

function ConvertTo-TomlBasicString {
    param([Parameter(Mandatory = $true)][string]$Value)

    return '"' + $Value.Replace('\', '\\').Replace('"', '\"') + '"'
}

function Add-CodexAgents {
    param(
        [Parameter(Mandatory = $true)]$Definition,
        [Parameter(Mandatory = $true)]$Agents,
        [Parameter(Mandatory = $true)]$Models,
        [Parameter(Mandatory = $true)][hashtable]$Files
    )

    foreach ($agent in @($Agents.agents)) {
        $codexProperty = $agent.PSObject.Properties['codex']
        if ($null -eq $codexProperty) {
            continue
        }
        $codex = $codexProperty.Value

        $mapping = Get-ExecutionProfileMapping -Models $Models `
            -ExecutionProfile $agent.executionProfile -ToolProperty 'codex'
        if ([string]$mapping.reasoningEffort -notin @('low', 'medium', 'high', 'xhigh', 'max', 'ultra')) {
            throw "Invalid Codex reasoning effort for '$($agent.executionProfile)'."
        }

        $promptPath = Resolve-SafeSourcePath ([string]$codex.promptFile)
        if (-not (Test-Path -LiteralPath $promptPath -PathType Leaf)) {
            throw "Codex Agent prompt not found: '$($codex.promptFile)'"
        }
        $prompt = (Normalize-Content (Get-Content -LiteralPath $promptPath -Raw)).Trim()
        if ($prompt.Contains('"""')) {
            throw "Codex Agent prompt contains an unsupported TOML multiline delimiter: '$($agent.name)'"
        }

        $toml = @(
            'name = ' + (ConvertTo-TomlBasicString ([string]$agent.name))
            'description = ' + (ConvertTo-TomlBasicString ([string]$codex.description))
            'model = ' + (ConvertTo-TomlBasicString ([string]$mapping.model))
            'model_reasoning_effort = ' + (ConvertTo-TomlBasicString ([string]$mapping.reasoningEffort))
            'developer_instructions = """'
            $prompt
            '"""'
        ) -join "`n"

        Add-ExpectedFile -Files $Files `
            -Destination "$($Definition.agentDestination)/$($agent.name).toml" `
            -Content $toml
    }
}

function Get-ExpectedSetup {
    param(
        [Parameter(Mandatory = $true)][string]$ToolName,
        [Parameter(Mandatory = $true)]$Agents,
        [Parameter(Mandatory = $true)]$Models
    )

    $definition = Get-SetupDefinition $ToolName
    $files = @{}
    Add-StaticFiles -Definition $definition -ToolName $ToolName -Files $files

    switch ([string]$definition.renderer) {
        'kilo-agents' {
            Add-KiloAgents -Definition $definition -Agents $Agents -Models $Models -Files $files
        }
        'aider-desk-agents' {
            Add-AiderDeskAgents -Definition $definition -Agents $Agents -Models $Models -Files $files
        }
        'codex-agents' {
            Add-CodexAgents -Definition $definition -Agents $Agents -Models $Models -Files $files
        }
        'shared' { }
        default { throw "Unsupported renderer '$($definition.renderer)' for $ToolName." }
    }

    if ($null -ne $definition.PSObject.Properties['skillWrapperDestination']) {
        Add-SkillWrappers -Files $files -DestinationRoot $definition.skillWrapperDestination
    }
    if ($null -ne $definition.PSObject.Properties['commandSkillWrapperDestination']) {
        Add-CommandSkillWrappers -Files $files `
            -DestinationRoot $definition.commandSkillWrapperDestination
    }

    return [pscustomobject]@{
        Tool = $ToolName
        Definition = $definition
        Files = $files
    }
}

function Get-StatePaths {
    param($State)

    if ($null -eq $State) {
        return @()
    }
    return @($State.files | ForEach-Object {
        if ($_ -is [string]) { $_ } else { $_.path }
    })
}

function Get-InstalledState {
    param([Parameter(Mandatory = $true)][string]$ToolName)

    $definition = Get-SetupDefinition $ToolName
    $statePath = Resolve-SafeRepositoryPath $definition.stateFile
    if (-not (Test-Path -LiteralPath $statePath -PathType Leaf)) {
        return $null
    }
    $state = Read-JsonFile $statePath
    if ($state.schemaVersion -ne 1 -or $state.tool -ne $ToolName) {
        throw "Invalid setup state for ${ToolName}: $statePath"
    }

    $toolRoot = Resolve-SafeRepositoryPath $definition.toolRoot
    $toolPrefix = $toolRoot.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
    $seenPaths = @{}
    foreach ($relativePath in @(Get-StatePaths $state)) {
        $fullPath = Resolve-SafeRepositoryPath $relativePath
        if (-not $fullPath.StartsWith($toolPrefix, [StringComparison]::OrdinalIgnoreCase)) {
            throw "Managed state path escapes the $ToolName tool root: '$relativePath'"
        }
        if ($seenPaths.ContainsKey($relativePath)) {
            throw "Managed state contains a duplicate path: '$relativePath'"
        }
        $seenPaths[$relativePath] = $true
    }
    return $state
}

function Test-FileContentEqual {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][AllowEmptyString()][string]$Expected
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        return $false
    }
    $actual = Normalize-Content (Get-Content -LiteralPath $Path -Raw)
    $normalizedExpected = Normalize-Content $Expected
    if ($actual -ceq $normalizedExpected) {
        return $true
    }
    if ([IO.Path]::GetExtension($Path) -ieq '.json') {
        try {
            return Test-DeepEquivalent -Left ($actual | ConvertFrom-Json) `
                -Right ($normalizedExpected | ConvertFrom-Json)
        }
        catch {
            return $false
        }
    }
    return $false
}

function Test-DeepEquivalent {
    param($Left, $Right)

    if ($null -eq $Left -or $null -eq $Right) {
        return ($null -eq $Left -and $null -eq $Right)
    }

    $leftIsObject = $Left -is [PSCustomObject]
    $rightIsObject = $Right -is [PSCustomObject]
    if ($leftIsObject -or $rightIsObject) {
        if (-not ($leftIsObject -and $rightIsObject)) { return $false }
        $leftNames = @($Left.PSObject.Properties.Name | Sort-Object)
        $rightNames = @($Right.PSObject.Properties.Name | Sort-Object)
        if (($leftNames -join "`n") -cne ($rightNames -join "`n")) { return $false }
        foreach ($name in $leftNames) {
            if (-not (Test-DeepEquivalent -Left $Left.PSObject.Properties[$name].Value `
                -Right $Right.PSObject.Properties[$name].Value)) {
                return $false
            }
        }
        return $true
    }

    $leftIsCollection = $Left -is [Collections.IEnumerable] -and $Left -isnot [string]
    $rightIsCollection = $Right -is [Collections.IEnumerable] -and $Right -isnot [string]
    if ($leftIsCollection -or $rightIsCollection) {
        if (-not ($leftIsCollection -and $rightIsCollection)) { return $false }
        $leftItems = @($Left)
        $rightItems = @($Right)
        if ($leftItems.Count -ne $rightItems.Count) { return $false }
        for ($index = 0; $index -lt $leftItems.Count; $index++) {
            if (-not (Test-DeepEquivalent -Left $leftItems[$index] -Right $rightItems[$index])) {
                return $false
            }
        }
        return $true
    }

    return ([string]$Left) -ceq ([string]$Right)
}

function Get-SetupPlan {
    param([Parameter(Mandatory = $true)]$ExpectedSetup)

    $state = Get-InstalledState $ExpectedSetup.Tool
    $managedPaths = @(Get-StatePaths $state)
    $managedLookup = @{}
    foreach ($path in $managedPaths) { $managedLookup[$path] = $true }
    $items = New-Object Collections.Generic.List[object]

    foreach ($relative in @($ExpectedSetup.Files.Keys | Sort-Object)) {
        $fullPath = Resolve-SafeRepositoryPath $relative
        if (-not (Test-Path -LiteralPath $fullPath)) {
            $status = 'Create'
        }
        elseif (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
            $status = 'Conflict'
        }
        elseif (Test-FileContentEqual -Path $fullPath -Expected $ExpectedSetup.Files[$relative]) {
            $status = $(if ($managedLookup.ContainsKey($relative)) { 'Unchanged' } else { 'Adopt' })
        }
        elseif ($managedLookup.ContainsKey($relative)) {
            $status = 'Update'
        }
        else {
            $status = 'Conflict'
        }
        $items.Add([pscustomobject]@{ Status = $status; Path = $relative })
    }

    foreach ($relative in @($managedPaths | Where-Object {
        -not $ExpectedSetup.Files.ContainsKey($_)
    } | Sort-Object)) {
        $items.Add([pscustomobject]@{ Status = 'RemoveStale'; Path = $relative })
    }

    $statePath = [string]$ExpectedSetup.Definition.stateFile
    if ($null -eq $state) {
        $items.Add([pscustomobject]@{ Status = 'CreateState'; Path = $statePath })
    }

    return [pscustomobject]@{
        State = $state
        Items = $items.ToArray()
    }
}

function Show-Plan {
    param(
        [Parameter(Mandatory = $true)][string]$ToolName,
        [Parameter(Mandatory = $true)]$Plan
    )

    Write-Host "[$ToolName]"
    foreach ($item in @($Plan.Items)) {
        Write-Host ('  {0,-12} {1}' -f $item.Status, $item.Path)
    }
    if ($Plan.Items.Count -eq 0) {
        Write-Host '  Up to date'
    }
}

function Get-ContentHash {
    param([Parameter(Mandatory = $true)][string]$Content)

    $bytes = $script:Utf8NoBom.GetBytes((Normalize-Content $Content))
    $sha = [Security.Cryptography.SHA256]::Create()
    try {
        return ([BitConverter]::ToString($sha.ComputeHash($bytes))).Replace('-', '').ToLowerInvariant()
    }
    finally {
        $sha.Dispose()
    }
}

function Write-AtomicTextFile {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][AllowEmptyString()][string]$Content
    )

    $directory = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $directory -PathType Container)) {
        [IO.Directory]::CreateDirectory($directory) | Out-Null
    }

    $temporary = Join-Path $directory ('.modern-ai-setup-' + [guid]::NewGuid().ToString('N') + '.tmp')
    try {
        [IO.File]::WriteAllText($temporary, (Complete-Content $Content), $script:Utf8NoBom)
        Move-Item -LiteralPath $temporary -Destination $Path -Force
    }
    finally {
        if (Test-Path -LiteralPath $temporary -PathType Leaf) {
            Remove-Item -LiteralPath $temporary -Force
        }
    }
}

function Get-OtherOwners {
    param(
        [Parameter(Mandatory = $true)][string]$RelativePath,
        [Parameter(Mandatory = $true)][string]$ExcludingTool
    )

    $owners = New-Object Collections.Generic.List[string]
    foreach ($candidate in @('Kilo', 'AiderDesk', 'Codex', 'Shared')) {
        if ($candidate -eq $ExcludingTool) { continue }
        $state = Get-InstalledState $candidate
        if ($null -ne $state -and (Get-StatePaths $state) -contains $RelativePath) {
            $owners.Add($candidate)
        }
    }
    return $owners.ToArray()
}

function Remove-ManagedFile {
    param(
        [Parameter(Mandatory = $true)][string]$ToolName,
        [Parameter(Mandatory = $true)][string]$RelativePath
    )

    $owners = @(Get-OtherOwners -RelativePath $RelativePath -ExcludingTool $ToolName)
    if ($owners.Count -gt 0) {
        Write-Host "  Preserve     $RelativePath (owned by $($owners -join ', '))"
        return
    }

    $fullPath = Resolve-SafeRepositoryPath $RelativePath
    if (Test-Path -LiteralPath $fullPath -PathType Leaf) {
        if ($PSCmdlet.ShouldProcess($relativePath, 'Remove managed AI setup file')) {
            Remove-Item -LiteralPath $fullPath -Force
        }
    }
}

function Remove-DisposablePath {
    param(
        [Parameter(Mandatory = $true)][string]$ToolName,
        [Parameter(Mandatory = $true)]$Definition,
        [Parameter(Mandatory = $true)][string]$RelativePath
    )

    $toolRoot = Resolve-SafeRepositoryPath $Definition.toolRoot
    $toolPrefix = $toolRoot.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
    $fullPath = Resolve-SafeRepositoryPath $RelativePath
    if (-not $fullPath.StartsWith($toolPrefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Disposable path escapes the $ToolName tool root: '$RelativePath'"
    }

    if (Test-Path -LiteralPath $fullPath) {
        if ($PSCmdlet.ShouldProcess($RelativePath, 'Remove explicitly disposable AI tool artifact')) {
            Remove-Item -LiteralPath $fullPath -Recurse -Force
        }
    }
}

function Remove-EmptyManagedDirectories {
    param(
        [Parameter(Mandatory = $true)][string]$RootRelativePath,
        [AllowEmptyCollection()][string[]]$ManagedRelativePaths = @()
    )

    $root = Resolve-SafeRepositoryPath $RootRelativePath
    if (-not (Test-Path -LiteralPath $root -PathType Container)) {
        return
    }

    $candidateLookup = @{}
    foreach ($relativePath in @($ManagedRelativePaths)) {
        $parent = Split-Path -Parent (Resolve-SafeRepositoryPath $relativePath)
        while (-not [string]::IsNullOrWhiteSpace($parent) -and
            $parent.StartsWith($root + [IO.Path]::DirectorySeparatorChar,
                [StringComparison]::OrdinalIgnoreCase)) {
            $candidateLookup[$parent] = $true
            $parent = Split-Path -Parent $parent
        }
    }

    foreach ($directory in @($candidateLookup.Keys | Sort-Object Length -Descending)) {
        if ((Test-Path -LiteralPath $directory -PathType Container) -and
            @(Get-ChildItem -LiteralPath $directory -Force).Count -eq 0) {
            if ($PSCmdlet.ShouldProcess($directory, 'Remove empty managed AI setup directory')) {
                Remove-Item -LiteralPath $directory
            }
        }
    }

    if ((Test-Path -LiteralPath $root -PathType Container) -and
        @(Get-ChildItem -LiteralPath $root -Force).Count -eq 0) {
        if ($PSCmdlet.ShouldProcess($root, 'Remove empty AI tool directory')) {
            Remove-Item -LiteralPath $root
        }
    }
}

function Apply-Setup {
    param([Parameter(Mandatory = $true)]$ExpectedSetup)

    $plan = Get-SetupPlan $ExpectedSetup
    Show-Plan -ToolName $ExpectedSetup.Tool -Plan $plan
    $conflicts = @($plan.Items | Where-Object { $_.Status -eq 'Conflict' })
    if ($conflicts.Count -gt 0) {
        $paths = $conflicts.Path -join ', '
        throw "Refusing to overwrite unmanaged or invalid destinations: $paths"
    }

    foreach ($item in @($plan.Items | Where-Object {
        $_.Status -in @('Create', 'Update')
    })) {
        $fullPath = Resolve-SafeRepositoryPath $item.Path
        if ($PSCmdlet.ShouldProcess($item.Path, 'Write generated AI setup file')) {
            Write-AtomicTextFile -Path $fullPath -Content $ExpectedSetup.Files[$item.Path]
        }
    }

    foreach ($item in @($plan.Items | Where-Object { $_.Status -eq 'RemoveStale' })) {
        Remove-ManagedFile -ToolName $ExpectedSetup.Tool -RelativePath $item.Path
    }

    $stateNeedsWrite = $null -eq $plan.State -or @($plan.Items | Where-Object {
        $_.Status -in @('Create', 'Update', 'Adopt', 'RemoveStale', 'CreateState')
    }).Count -gt 0
    if ($stateNeedsWrite) {
        $stateEntries = @($ExpectedSetup.Files.Keys | Sort-Object | ForEach-Object {
            [ordered]@{
                path = $_
                sha256 = Get-ContentHash $ExpectedSetup.Files[$_]
            }
        })
        $state = [ordered]@{
            schemaVersion = 1
            tool = $ExpectedSetup.Tool
            generatedAtUtc = [DateTime]::UtcNow.ToString('o')
            files = $stateEntries
        }
        $statePath = Resolve-SafeRepositoryPath $ExpectedSetup.Definition.stateFile
        if ($PSCmdlet.ShouldProcess($ExpectedSetup.Definition.stateFile, 'Write AI setup state')) {
            Write-AtomicTextFile -Path $statePath -Content ($state | ConvertTo-Json -Depth 10)
        }
    }
}

function Check-Setup {
    param([Parameter(Mandatory = $true)]$ExpectedSetup)

    $plan = Get-SetupPlan $ExpectedSetup
    Show-Plan -ToolName $ExpectedSetup.Tool -Plan $plan
    $driftItems = @($plan.Items | Where-Object {
        $_.Status -notin @('Unchanged')
    })
    if ($driftItems.Count -gt 0) {
        $script:HadDrift = $true
    }
}

function Remove-Setup {
    param([Parameter(Mandatory = $true)][string]$ToolName)

    if ($ToolName -eq 'Shared') {
        $dependents = @(@('Kilo', 'AiderDesk', 'Codex') | Where-Object {
            $null -ne (Get-InstalledState $_)
        })
        if ($dependents.Count -gt 0) {
            throw "Shared setup is still required by: $($dependents -join ', '). Remove them first."
        }
    }

    $definition = Get-SetupDefinition $ToolName
    $state = Get-InstalledState $ToolName
    Write-Host "[$ToolName]"
    $managedPaths = @()
    if ($null -eq $state) {
        Write-Host '  Not installed; no state-managed files were found.'
    }
    else {
        $managedPaths = @(Get-StatePaths $state)
        foreach ($relativePath in @($managedPaths | Sort-Object -Descending)) {
            Write-Host "  Remove       $relativePath"
            Remove-ManagedFile -ToolName $ToolName -RelativePath $relativePath
        }

        $statePath = Resolve-SafeRepositoryPath $definition.stateFile
        if (Test-Path -LiteralPath $statePath -PathType Leaf) {
            if ($PSCmdlet.ShouldProcess($definition.stateFile, 'Remove AI setup state')) {
                Remove-Item -LiteralPath $statePath -Force
            }
        }
    }

    $disposableProperty = $definition.PSObject.Properties['disposablePaths']
    $disposablePaths = $(if ($null -eq $disposableProperty) {
        @()
    } else {
        @($disposableProperty.Value)
    })
    foreach ($relativePath in @($disposablePaths | Sort-Object -Descending)) {
        Write-Host "  Dispose      $relativePath"
        Remove-DisposablePath -ToolName $ToolName -Definition $definition `
            -RelativePath $relativePath
    }

    Remove-EmptyManagedDirectories -RootRelativePath $definition.toolRoot `
        -ManagedRelativePaths @($managedPaths + $disposablePaths)
}

function Get-RequestedTools {
    param([Parameter(Mandatory = $true)][string]$RequestedTool)

    if ($RequestedTool -eq 'All') {
        return @('Shared', 'Kilo', 'AiderDesk', 'Codex')
    }
    if ($RequestedTool -in @('Kilo', 'AiderDesk', 'Codex')) {
        return @('Shared', $RequestedTool)
    }
    return @('Shared')
}

if (-not (Test-Path -LiteralPath (Join-Path $script:RepositoryRoot 'AGENTS.md') -PathType Leaf) -or
    -not (Test-Path -LiteralPath (Join-Path $script:RepositoryRoot '.ai') -PathType Container)) {
    throw "The script must run against the Modern repository root. Resolved root: $script:RepositoryRoot"
}

$agents = Get-AgentsConfiguration
$models = Get-ModelConfiguration

if ($Action -eq 'Switch' -and $Tool -notin @('Kilo', 'AiderDesk', 'Codex')) {
    throw 'Switch requires -Tool Kilo, AiderDesk, or Codex.'
}

switch ($Action) {
    'Plan' {
        foreach ($toolName in @(Get-RequestedTools $Tool)) {
            $expected = Get-ExpectedSetup -ToolName $toolName -Agents $agents -Models $models
            Show-Plan -ToolName $toolName -Plan (Get-SetupPlan $expected)
        }
    }
    'Check' {
        foreach ($toolName in @(Get-RequestedTools $Tool)) {
            $expected = Get-ExpectedSetup -ToolName $toolName -Agents $agents -Models $models
            Check-Setup $expected
        }
    }
    'Apply' {
        foreach ($toolName in @(Get-RequestedTools $Tool)) {
            $expected = Get-ExpectedSetup -ToolName $toolName -Agents $agents -Models $models
            Apply-Setup $expected
        }
    }
    'Remove' {
        if ($Tool -eq 'All') {
            foreach ($toolName in @('Kilo', 'AiderDesk', 'Codex', 'Shared')) {
                Remove-Setup $toolName
            }
        }
        else {
            Remove-Setup $Tool
        }
    }
    'Switch' {
        foreach ($toolName in @('Shared', $Tool)) {
            $expected = Get-ExpectedSetup -ToolName $toolName -Agents $agents -Models $models
            Apply-Setup $expected
        }
        foreach ($otherTool in @('Kilo', 'AiderDesk', 'Codex')) {
            if ($otherTool -ne $Tool -and $null -ne (Get-InstalledState $otherTool)) {
                Remove-Setup $otherTool
            }
        }
        Write-Host "Restart the active AI tool after switching setups."
    }
}

if ($Action -eq 'Check' -and $script:HadDrift) {
    exit 2
}
