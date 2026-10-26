#Requires -Version 7.5
<# .SYNOPSIS
Copia as BPLs disponíveis do catálogo para -Destination ou para o destino atual da automação antiga.
#>
[CmdletBinding(SupportsShouldProcess)]
param([string] $ProjectRoot, [string] $Destination)
$ErrorActionPreference = 'Stop'
try {
    Import-Module (Join-Path $PSScriptRoot '..\core\Build.Automation.psm1') -Force
    $context = New-HwBuildContext -ProjectRoot $ProjectRoot
    $options = @{ WhatIf = $WhatIfPreference }
    if ($PSBoundParameters.ContainsKey('Confirm')) { $options.Confirm = $PSBoundParameters.Confirm }
    Invoke-HwDeploy -Context $context -Destination $Destination @options
    exit 0
}
catch { [Console]::Error.WriteLine($_.Exception.Message); exit 1 }
