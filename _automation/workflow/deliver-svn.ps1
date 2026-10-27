#Requires -Version 7.5
<#
.SYNOPSIS
    Prepara a main publicada no GitHub para entrega ao SVN.
.PARAMETER Commit
    Confirma uma entrega já preparada e envia uma revisão ao SVN.
.PARAMETER Message
    Mensagem definida na preparação; por padrão, identifica o commit GitHub.
#>
[CmdletBinding()]
param(
    [string] $ConfigPath=(Join-Path $PSScriptRoot '..\config\workflow.local.psd1'),
    [string] $Message='',
    [switch] $Commit
)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
. (Join-Path $PSScriptRoot 'sync-integration.ps1') -ConfigPath $ConfigPath
. (Join-Path $PSScriptRoot 'Delivery.Common.ps1')

function Invoke-DeliverSvn {
    param([string] $ConfigPath,[string] $Message='',[switch] $Commit,[scriptblock] $CommandRunner)
    $phase='Conferir integração'
    try {
        $configFile=[IO.Path]::GetFullPath($ConfigPath)
        $config=Import-PowerShellDataFile -LiteralPath $configFile
        foreach ($key in @('IntegrationPath','GitBranch','SvnUrlSuffix')) {
            if (-not $config.ContainsKey($key) -or [string]::IsNullOrWhiteSpace([string] $config[$key])) { throw "Campo obrigatório não preenchido: $key" }
        }
        $root=[IO.Path]::GetFullPath([IO.Path]::Combine((Split-Path -Parent $configFile),$config.IntegrationPath)).TrimEnd('\','/')
        if ((Get-Location).Provider.Name -ne 'FileSystem' -or [IO.Path]::GetFullPath((Get-Location).ProviderPath).TrimEnd('\','/') -ine $root) { throw "Execute na raiz de IntegrationPath: $root" }
        if ([IO.Path]::GetFullPath($PSCommandPath) -ine (Join-Path $root '_automation\workflow\deliver-svn.ps1')) { throw 'Utilize o script pertencente à própria integração.' }
        $mode=Get-IntegrationClient $root $CommandRunner
        $context=@{Root=$root;Mode=$mode;Config=$config;ConfigDirectory=(Split-Path -Parent $configFile);Runner=$CommandRunner;Password='';Message=$Message;Authentication=@()}
        $gitDir=[IO.Path]::GetFullPath((Invoke-DeliveryGit $context @('rev-parse','--absolute-git-dir')).Output.Trim()).TrimEnd('\','/')
        if (-not $gitDir.StartsWith($root+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)) { throw 'A integração deve ter seus metadados Git dentro da própria pasta.' }
        if ([IO.Path]::GetFullPath((Invoke-DeliveryGit $context @('rev-parse','--show-toplevel')).Output.Trim()).TrimEnd('\','/') -ine $root) { throw 'IntegrationPath deve ser a raiz Git.' }
        foreach ($operation in @('MERGE_HEAD','rebase-merge','rebase-apply','CHERRY_PICK_HEAD','REVERT_HEAD','sequencer')) {
            if (Test-Path -LiteralPath (Join-Path $gitDir $operation)) { throw "Operação Git em andamento: $operation" }
        }
        $context.GitDirectory=$gitDir; $context.Cache=Join-Path $gitDir 'hwdesktop-delivery'
        $context.StateFile=Join-Path $context.Cache 'pending.json'
        [void] [IO.Directory]::CreateDirectory($context.Cache)
        [void] (Invoke-DeliveryGit $context @('check-ref-format',"refs/heads/$($config.GitBranch)"))
        $context.Origin=(Invoke-DeliveryGit $context @('remote','get-url','origin')).Output.Trim()
        if (-not $context.Origin -or $context.Origin -match '^https?://[^/]*@') { throw 'Configure origin sem credenciais embutidas na URL.' }
        if ($mode -eq 'svn') {
            $processImplementation=(Get-Command Invoke-SyncProcess -CommandType Function).ScriptBlock
            . (Join-Path $PSScriptRoot 'svn\sync-integration.ps1')
            # Reutilizar validação/segredos SVN sem substituir o executor comum da entrega.
            Set-Item -Path Function:Invoke-SyncProcess -Value $processImplementation
            if (-not $config.ContainsKey('SecretsFile')) { throw 'Campo obrigatório: SecretsFile' }
            $secrets=Read-SyncSecrets ([IO.Path]::GetFullPath([IO.Path]::Combine($context.ConfigDirectory,$config.SecretsFile)))
            $context.Password=$secrets.SVN_PASS
            $context.Authentication=@('--non-interactive','--username',$secrets.SVN_USER,'--password',$secrets.SVN_PASS)
        }
        if ([IO.File]::Exists($context.StateFile)) {
            $state=Get-Content -LiteralPath $context.StateFile -Raw | ConvertFrom-Json
            if ($state.status -ne 'delivered') {
                if ($state.root -ine $root -or $state.mode -ne $mode) { throw 'O registro pendente pertence a outra integração.' }
                if ($Commit) { $phase='Enviar entrega preparada'; Confirm-DeliveryPublication $context $state }
                elseif ($state.status -ne 'prepared') { throw "Entrega em estado '$($state.status)'. Confira $($context.StateFile) antes de retomar." }
                Show-DeliveryState $context $state
                return
            }
        }
        if ($Commit) { throw 'Não existe entrega preparada. Execute primeiro sem -Commit.' }
        if ([IO.File]::Exists($context.StateFile)) {
            $previous=Get-Content -LiteralPath $context.StateFile -Raw | ConvertFrom-Json
            if ($previous.id -notmatch '^[a-f0-9]{32}$') { throw 'Identificador do registro anterior inválido.' }
            $archive=Join-Path $context.Cache ($previous.id+'.json')
            if (-not [IO.File]::Exists($archive)) { [IO.File]::Copy($context.StateFile,$archive) }
        }
        $phase='Preparar entrega'
        . (Join-Path $PSScriptRoot "$mode\deliver-svn.ps1")
        $state=if ($mode -eq 'svn') { New-SvnDelivery $context } else { New-GitSvnDelivery $context }
        if ($null -ne $state) { Show-DeliveryState $context $state }
    } catch {
        $detail=$_.Exception.Message
        if ($null -ne (Get-Variable context -ErrorAction SilentlyContinue) -and $context.Password) { $detail=$detail.Replace($context.Password,'***') }
        throw "Etapa '$phase': $detail`nA execução parou. Nenhum push, reset ou revert automático foi feito."
    }
}
if ($MyInvocation.InvocationName -ne '.') {
    try { Invoke-DeliverSvn -ConfigPath $ConfigPath -Message $Message -Commit:$Commit; exit 0 }
    catch { [Console]::Error.WriteLine($_.Exception.Message); exit 1 }
}
