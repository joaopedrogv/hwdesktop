#Requires -Version 7.5
<#
.SYNOPSIS
    Identifica a integração SVN ou git-svn e executa a sincronização correspondente.
.PARAMETER ConfigPath
    Configuração individual; por padrão, config/workflow.local.psd1.
#>
[CmdletBinding()]
param([string] $ConfigPath = (Join-Path $PSScriptRoot '..\config\workflow.local.psd1'))

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-SyncProcess {
    param([string] $Tool, [string[]] $Arguments, [string] $Directory, [string] $InputText = '', [Text.Encoding] $OutputEncoding, [Text.Encoding] $ErrorEncoding)

    $start = [Diagnostics.ProcessStartInfo]::new()
    $start.FileName = $Tool
    $start.WorkingDirectory = $Directory
    $start.UseShellExecute = $false
    $start.CreateNoWindow = $true
    $start.RedirectStandardOutput = $true
    $start.RedirectStandardError = $true
    # Git/WSL e XML SVN emitem UTF-8, independentemente da página do console.
    $utf8Tool=[IO.Path]::GetFileNameWithoutExtension($Tool) -in @('git','wsl')
    if (-not $OutputEncoding -and ($utf8Tool -or '--xml' -in $Arguments)) { $OutputEncoding=[Text.UTF8Encoding]::new($false) }
    if (-not $ErrorEncoding -and $utf8Tool) { $ErrorEncoding=[Text.UTF8Encoding]::new($false) }
    if ($OutputEncoding) { $start.StandardOutputEncoding=$OutputEncoding }
    if ($ErrorEncoding) { $start.StandardErrorEncoding=$ErrorEncoding }
    $start.RedirectStandardInput = $InputText.Length -gt 0
    if ($start.RedirectStandardInput) { $start.StandardInputEncoding = [Text.UTF8Encoding]::new($false) }
    foreach ($argument in $Arguments) { $start.ArgumentList.Add($argument) }
    $process = [Diagnostics.Process]::new()
    $process.StartInfo = $start
    try {
        [void] $process.Start()
        $outputTask = $process.StandardOutput.ReadToEndAsync()
        $errorTask = $process.StandardError.ReadToEndAsync()
        if ($start.RedirectStandardInput) {
            $process.StandardInput.Write($InputText)
            $process.StandardInput.Close()
        }
        $process.WaitForExit()
        [pscustomobject]@{
            ExitCode = $process.ExitCode
            Output = $outputTask.GetAwaiter().GetResult()
            Error = $errorTask.GetAwaiter().GetResult()
        }
    }
    finally { $process.Dispose() }
}



function Read-GitSvnCredentials {
    param([hashtable] $Config,[string] $ConfigDirectory)
    # Sem SecretsFile explícito, preservar instalações que usam o cache do WSL.
    if (-not $Config.ContainsKey('SecretsFile')) { return $null }
    if ([string]::IsNullOrWhiteSpace([string] $Config.SecretsFile)) { throw 'Campo obrigatório não preenchido: SecretsFile' }
    $path=[IO.Path]::GetFullPath([IO.Path]::Combine($ConfigDirectory,[string] $Config.SecretsFile))
    if (-not [IO.File]::Exists($path)) { throw "Arquivo de segredos não encontrado: $path" }
    $values=@{}
    foreach ($line in [IO.File]::ReadAllLines($path)) {
        if ($line -match '^\s*(SVN_USER|SVN_PASS)\s*=(.*)$') { $values[$Matches[1]]=$Matches[2].Trim() }
    }
    foreach ($key in @('SVN_USER','SVN_PASS')) {
        if (-not $values.ContainsKey($key) -or [string]::IsNullOrWhiteSpace($values[$key])) { throw "Preencha $key no arquivo pessoal: $path" }
    }
    return [pscustomobject]@{Path=$path;UserName=$values.SVN_USER;Password=$values.SVN_PASS}
}

function New-GitSvnAskPass {
    param([string] $Cache,$Credentials)
    [void] [IO.Directory]::CreateDirectory($Cache)
    $noPrompt=Join-Path $Cache 'no-prompt.sh'
    [IO.File]::WriteAllText($noPrompt,("#!/bin/sh"+[char]10+"printf '\n'"+[char]10),[Text.UTF8Encoding]::new($false))
    if ($null -eq $Credentials) { return [pscustomobject]@{Path=$noPrompt;NoPromptPath=$noPrompt} }
    # O helper contém somente código. O segredo permanece no arquivo pessoal.
    # Perl já é dependência do git-svn. Não interpretar valores como código/comandos.
    $perl=@'
#!/usr/bin/perl
use strict;
use warnings;
my $prompt = $ARGV[0] // '';
my $key = $prompt =~ /^Username:/ ? 'SVN_USER' :
          $prompt =~ /^Password for '/ ? 'SVN_PASS' : '';
sub reject_prompt { print "\n"; exit 0; }
reject_prompt() if !$key;
open(my $file, '<', $ENV{'HWDESKTOP_SVN_SECRETS_FILE'}) or reject_prompt();
my $value;
while (my $line = <$file>) {
    $line =~ s/^\xEF\xBB\xBF//;
    if ($line =~ /^\s*\Q$key\E\s*=(.*)$/) {
        $value = $1;
        $value =~ s/^\s+|\s+$//g;
    }
}
if (defined $value) { print "$value\n"; exit 0; }
reject_prompt();
'@
    $path=Join-Path $Cache 'svn-askpass.pl'
    [IO.File]::WriteAllText($path,($perl.Replace(([string][char]13+[char]10),[string][char]10)+[char]10),[Text.UTF8Encoding]::new($false))
    return [pscustomobject]@{Path=$path;NoPromptPath=$noPrompt}
}

function Get-IntegrationClient {
    param([string] $Root, [scriptblock] $CommandRunner)
    $result = $null
    $arguments = @('config', '--get-regexp', '^svn-remote\..*\.url$')
    if ($null -ne $CommandRunner) { $result = & $CommandRunner git $arguments $Root '' }
    if ($null -eq $result) { $result = Invoke-SyncProcess git $arguments $Root }
    if ($result.ExitCode -notin @(0,1)) { throw "Não foi possível identificar a integração Git: $($result.Error)" }
    $svn = [IO.Directory]::Exists((Join-Path $Root '.svn'))
    $gitSvn = $result.ExitCode -eq 0 -and -not [string]::IsNullOrWhiteSpace($result.Output)
    if ($svn -and $gitSvn) { throw 'Integração ambígua: a pasta contém working copy SVN e configuração git-svn. Utilize pastas separadas.' }
    if ($svn) { return 'svn' }
    if ($gitSvn) { return 'git-svn' }
    throw 'A pasta não é uma integração SVN nem git-svn. Um clone somente Git não pode sincronizar a integração.'
}

function Invoke-SyncIntegration {
    param([string] $ConfigPath, [scriptblock] $CommandRunner)
    $configFile = [IO.Path]::GetFullPath($ConfigPath)
    if (-not [IO.File]::Exists($configFile)) { throw "Configuração pessoal não encontrada: $configFile" }
    $config = Import-PowerShellDataFile -LiteralPath $configFile
    if (-not $config.ContainsKey('IntegrationPath') -or [string]::IsNullOrWhiteSpace([string] $config.IntegrationPath)) {
        throw 'Campo obrigatório não preenchido: IntegrationPath'
    }
    $root = [IO.Path]::GetFullPath([IO.Path]::Combine((Split-Path -Parent $configFile), $config.IntegrationPath)).TrimEnd('\','/')
    $location = Get-Location
    if ($location.Provider.Name -ne 'FileSystem') { throw "Execute na raiz da integração: $root" }
    $current = [IO.Path]::GetFullPath($location.ProviderPath).TrimEnd('\','/')
    if (-not $root.Equals($current, [StringComparison]::OrdinalIgnoreCase)) {
        throw "O diretório atual deve ser IntegrationPath.`nAtual: $current`nEsperado: $root"
    }
    $expected = [IO.Path]::GetFullPath((Join-Path $root '_automation\workflow\sync-integration.ps1'))
    if (-not $expected.Equals([IO.Path]::GetFullPath($PSCommandPath), [StringComparison]::OrdinalIgnoreCase)) {
        throw "Utilize o script da integração, que é a fonte da verdade.`nScript executado: $PSCommandPath`nEsperado: $expected"
    }
    $gitDirResult = if ($null -ne $CommandRunner) { & $CommandRunner git @('rev-parse','--absolute-git-dir') $root '' } else { $null }
    if ($null -eq $gitDirResult) { $gitDirResult = Invoke-SyncProcess git @('rev-parse','--absolute-git-dir') $root }
    if ($gitDirResult.ExitCode -eq 0) {
        $pending = Join-Path $gitDirResult.Output.Trim() 'hwdesktop-delivery\pending.json'
        if ([IO.File]::Exists($pending) -and (Get-Content -LiteralPath $pending -Raw | ConvertFrom-Json).status -ne 'delivered') {
            throw "Existe uma entrega SVN pendente. Conclua/avalie a entrega antes de sincronizar: $pending"
        }
    }
    $mode = Get-IntegrationClient $root $CommandRunner
    Write-Host "Modo de integração: $mode"
    $implementation = Join-Path $PSScriptRoot "$mode\sync-integration.ps1"
    if (-not [IO.File]::Exists($implementation)) { throw "Implementação não encontrada: $implementation" }
    . $implementation -ConfigPath $configFile
    if ($mode -eq 'svn') { Invoke-SvnSyncIntegration -ConfigPath $configFile -CommandRunner $CommandRunner }
    else { Invoke-GitSvnSyncIntegration -ConfigPath $configFile -CommandRunner $CommandRunner }
}

if ($MyInvocation.InvocationName -ne '.') {
    try { Invoke-SyncIntegration -ConfigPath $ConfigPath; exit 0 }
    catch { [Console]::Error.WriteLine($_.Exception.Message); exit 1 }
}
