#Requires -Version 7.5
<# .SYNOPSIS
Limpa DCUs globais e os DCPs/BPLs do catálogo. Use -WhatIf para conferir sem excluir.
#>
[CmdletBinding(SupportsShouldProcess)]
param([string] $ProjectRoot)
$ErrorActionPreference = 'Stop'
try {
    Import-Module (Join-Path $PSScriptRoot '..\core\Build.Automation.psm1') -Force
    $context = New-HwBuildContext -ProjectRoot $ProjectRoot
    $options = @{ WhatIf = $WhatIfPreference }
    if ($PSBoundParameters.ContainsKey('Confirm')) { $options.Confirm = $PSBoundParameters.Confirm }
    Invoke-HwClean -Context $context @options
    exit 0
}
catch { [Console]::Error.WriteLine($_.Exception.Message); exit 1 }
