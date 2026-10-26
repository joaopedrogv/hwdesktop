#Requires -Version 7.5
<# .SYNOPSIS
Compila o catálogo reestrutura-params.txt. Preserva a limpeza geral atual; use -NoClean para evitá-la.
#>
[CmdletBinding(SupportsShouldProcess)]
param([string] $ProjectRoot, [switch] $NoClean, [switch] $NonInteractive)
$ErrorActionPreference = 'Stop'
try {
    Import-Module (Join-Path $PSScriptRoot '..\core\Build.Automation.psm1') -Force
    $context = New-HwBuildContext -ProjectRoot $ProjectRoot
    $packages = @(Get-HwBuildPackages -Context $context -Catalog 'reestrutura-params.txt')
    $options = @{ WhatIf = $WhatIfPreference }
    if ($PSBoundParameters.ContainsKey('Confirm')) { $options.Confirm = $PSBoundParameters.Confirm }
    Invoke-HwBuild -Context $context -Packages $packages -Presentation Reestrutura -Clean:(-not $NoClean) -NonInteractive:$NonInteractive @options | Out-Null
    exit 0
}
catch { [Console]::Error.WriteLine($_.Exception.Message); exit 1 }
