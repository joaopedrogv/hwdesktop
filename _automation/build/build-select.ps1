#Requires -Version 7.5
<# .SYNOPSIS
Compila os pacotes informados em -Packages ou selecionados pela janela gráfica, sem limpeza geral.
#>
[CmdletBinding(SupportsShouldProcess)]
param([string] $ProjectRoot, [string[]] $Packages, [switch] $List, [switch] $NonInteractive)
$ErrorActionPreference = 'Stop'
try {
    Import-Module (Join-Path $PSScriptRoot '..\core\Build.Automation.psm1') -Force
    $context = New-HwBuildContext -ProjectRoot $ProjectRoot
    $catalog = @(Get-HwBuildPackages -Context $context)
    if ($List) { $catalog | Format-Table Order,Name,BuildType,RelativePath -AutoSize; exit 0 }
    if ($NonInteractive -and -not $Packages) { throw 'Use -Packages no modo -NonInteractive.' }
    if ($WhatIfPreference -and -not $Packages) { throw 'Informe -Packages para simular a seleção sem abrir a janela gráfica.' }
    $selected = @(Select-HwBuildPackages -Packages $catalog -Names $Packages)
    if ($selected.Count -eq 0) { exit 0 }
    $options = @{ WhatIf = $WhatIfPreference }
    if ($PSBoundParameters.ContainsKey('Confirm')) { $options.Confirm = $PSBoundParameters.Confirm }
    Invoke-HwBuild -Context $context -Packages $selected -Presentation Selected -NonInteractive:$NonInteractive @options | Out-Null
    exit 0
}
catch { [Console]::Error.WriteLine($_.Exception.Message); exit 1 }
