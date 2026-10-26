#Requires -Version 7.5
<# .SYNOPSIS
Compila todos os pacotes, na ordem do catálogo. Use -NoClean para preservar as saídas.
#>
[CmdletBinding(SupportsShouldProcess)]
param([string] $ProjectRoot, [switch] $NoClean, [switch] $NonInteractive)
$ErrorActionPreference = 'Stop'
try {
    Import-Module (Join-Path $PSScriptRoot '..\core\Build.Automation.psm1') -Force
    $context = New-HwBuildContext -ProjectRoot $ProjectRoot
    $packages = @(Get-HwBuildPackages -Context $context)
    $options = @{ WhatIf = $WhatIfPreference }
    if ($PSBoundParameters.ContainsKey('Confirm')) { $options.Confirm = $PSBoundParameters.Confirm }
    Invoke-HwBuild -Context $context -Packages $packages -Clean:(-not $NoClean) -NonInteractive:$NonInteractive @options | Out-Null
    exit 0
}
catch { [Console]::Error.WriteLine($_.Exception.Message); exit 1 }
