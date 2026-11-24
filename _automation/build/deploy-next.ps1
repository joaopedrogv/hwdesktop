#Requires -Version 7.5
<# .SYNOPSIS
Copia hw.next.dll do clone para o destino de publicação configurado.
#>
[CmdletBinding(SupportsShouldProcess)]
param([string] $ProjectRoot, [string] $Destination)

$ErrorActionPreference = 'Stop'
try {
    Import-Module (Join-Path $PSScriptRoot '..\core\Build.Automation.psm1') -Force
    $context = New-HwBuildContext -ProjectRoot $ProjectRoot
    $source = Join-Path $context.BplRoot 'hw.next.dll'
    if (-not (Test-Path -LiteralPath $source -PathType Leaf)) {
        throw "DLL do Next não encontrada em $source. Execute Compilar Next primeiro."
    }

    if (-not $Destination) { $Destination = Get-HwDefaultDeployDestination -Context $context }
    if (-not [IO.Path]::IsPathFullyQualified($Destination)) {
        throw 'Informe um destino absoluto ou um caminho de rede UNC.'
    }

    $target = Join-Path $Destination 'hw.next.dll'
    if (-not $PSCmdlet.ShouldProcess($target, 'Publicar a DLL do Next')) { exit 0 }
    if (Test-Path -LiteralPath $target -PathType Container) {
        throw "O caminho de destino da DLL é um diretório: $target"
    }

    Write-Host "Origem: $source"
    Write-Host "Destino: $target"
    [void][IO.Directory]::CreateDirectory($Destination)
    Copy-Item -LiteralPath $source -Destination $target -Force
    Write-Host 'Publicação de Next concluída.'
    exit 0
}
catch { [Console]::Error.WriteLine($_.Exception.Message); exit 1 }
