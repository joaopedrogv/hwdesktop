#Requires -Version 7.5
<# .SYNOPSIS
Compila todos os pacotes e só depois publica. -WhatIf simula ambas as etapas sem acessar a rede.
#>
[CmdletBinding(SupportsShouldProcess)]
param([string] $ProjectRoot, [string] $Destination, [switch] $NoClean, [switch] $NonInteractive)
$ErrorActionPreference = 'Stop'
function Write-Stage {
    param([string] $Title)
    Write-Host "`n=================================================="
    Write-Host $Title
    Write-Host "==================================================`n"
}
$stage = 'BUILD'
try {
    Import-Module (Join-Path $PSScriptRoot '..\core\Build.Automation.psm1') -Force
    $context = New-HwBuildContext -ProjectRoot $ProjectRoot
    $packages = @(Get-HwBuildPackages -Context $context)
    $options = @{ WhatIf = $WhatIfPreference }
    if ($PSBoundParameters.ContainsKey('Confirm')) { $options.Confirm = $PSBoundParameters.Confirm }
    if ($WhatIfPreference) {
        Invoke-HwBuild -Context $context -Packages $packages -Clean:(-not $NoClean) -NonInteractive:$NonInteractive @options | Out-Null
        Invoke-HwDeploy -Context $context -Destination $Destination @options
        exit 0
    }
    Write-Stage ' INICIANDO PROCESSO COMPLETO: BUILD + DEPLOY'
    Write-Host ' Este processo ira:'
    Write-Host '   1. Compilar todos os pacotes'
    Write-Host '   2. Copiar os BPLs para a rede'
    Write-Host ''
    if (-not $NonInteractive) {
        $answer = Read-Host ' Deseja continuar? (S/N)'
        if ($answer -ine 'S') { Write-Host "`nProcesso cancelado pelo usuario."; exit 0 }
    }
    Write-Stage ' ETAPA 1/2: EXECUTANDO BUILD'
    Write-Host "Inicio do build: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')`n"
    try { $result = Invoke-HwBuild -Context $context -Packages $packages -Clean:(-not $NoClean) -NonInteractive:$NonInteractive @options }
    finally { Write-Host "`nFim do build: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')`n" }
    if ($result.Status -eq 'Cancelled') { Write-Host 'Operação cancelada; publicação não iniciada.'; exit 0 }
    $stage = 'DEPLOY'
    Write-Stage ' ETAPA 2/2: EXECUTANDO DEPLOY'
    Write-Host "Build concluido com sucesso!`nIniciando copia dos arquivos para a rede...`n"
    Write-Host "Inicio do deploy: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')`n"
    try { Invoke-HwDeploy -Context $context -Destination $Destination @options }
    finally { Write-Host "`nFim do deploy: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')`n" }
    Write-Stage ' *** PROCESSO CONCLUIDO COM SUCESSO ***'
    Write-Host " Build  : OK`n Deploy : OK`n"
    Write-Host 'Todos os pacotes foram compilados e copiados'
    Write-Host 'para o diretorio de destino com sucesso.'
    exit 0
}
catch {
    Write-Stage " *** FALHA NO $stage ***"
    if ($stage -eq 'BUILD') {
        Write-Host 'O build terminou com erros.'
        Write-Host 'O deploy NAO sera executado.'
        Write-Host 'Corrija os erros de compilacao e tente novamente.'
    }
    else {
        Write-Host 'O build foi concluido com sucesso, mas houve erros ao copiar os arquivos.'
        Write-Host 'Verifique a conexao, as permissoes e se algum arquivo esta em uso.'
    }
    [Console]::Error.WriteLine($_.Exception.Message)
    exit 1
}
