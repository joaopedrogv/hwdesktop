#Requires -Version 7.5
<#
.SYNOPSIS
    Extrai os metadados da base de referência, sem executar migrações.
.PARAMETER ConfigPath
    Configuração individual; padrão: _automation/config/database.local.psd1.
#>
[CmdletBinding()]
param([string]$ConfigPath)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-ExportSchema {
    param([string]$ConfigPath)
    $root = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\..'))
    $configFile = if ($ConfigPath) { [IO.Path]::GetFullPath($ConfigPath) } else { Join-Path $root '_automation\config\database.local.psd1' }
    if (-not [IO.File]::Exists($configFile)) { throw 'Configuração ausente. Copie database.exemplo.psd1 para database.local.psd1 e preencha os caminhos.' }
    $config = Import-PowerShellDataFile -LiteralPath $configFile
    foreach ($key in @('Database','IsqlPath','Charset','SecretsFile')) {
        if (-not $config.ContainsKey($key) -or [string]::IsNullOrWhiteSpace($config[$key])) { throw "Campo obrigatório na configuração: $key" }
    }
    if (-not [IO.File]::Exists($config.IsqlPath)) { throw 'isql não encontrado no IsqlPath configurado.' }
    if ($config.Charset -notin @('WIN1252','UTF8')) { throw 'Charset de extração suportado: WIN1252 ou UTF8.' }
    [Text.Encoding]::RegisterProvider([Text.CodePagesEncodingProvider]::Instance)
    $encoding = if ($config.Charset -eq 'WIN1252') {
        [Text.Encoding]::GetEncoding(1252,[Text.EncoderExceptionFallback]::new(),[Text.DecoderExceptionFallback]::new())
    } else { [Text.UTF8Encoding]::new($false,$true) }
    $secretsFile = if ([IO.Path]::IsPathRooted($config.SecretsFile)) { $config.SecretsFile } else { Join-Path $root $config.SecretsFile }
    $secrets = @{}
    foreach ($line in [IO.File]::ReadAllLines($secretsFile)) {
        if ($line -match '^\s*(FIREBIRD_USER|FIREBIRD_PASS)\s*=(.*)$') { $secrets[$Matches[1]] = $Matches[2].Trim() }
    }
    foreach ($key in @('FIREBIRD_USER','FIREBIRD_PASS')) {
        if (-not $secrets.ContainsKey($key) -or [string]::IsNullOrWhiteSpace($secrets[$key])) { throw "Chave ausente ou vazia em segredos.md: $key" }
    }

    $schemaRoot = Join-Path $root 'scripts\database\schema'
    $run = Join-Path $schemaRoot ('.export-'+[Guid]::NewGuid().ToString('N'))
    $process = $null
    try {
        [IO.Directory]::CreateDirectory($run) | Out-Null
        $raw = Join-Path $run 'raw.sql'
        $start = [Diagnostics.ProcessStartInfo]::new()
        $start.FileName = $config.IsqlPath
        $start.UseShellExecute = $false
        $start.CreateNoWindow = $true
        $start.RedirectStandardInput = $true
        $start.RedirectStandardOutput = $true
        $start.RedirectStandardError = $true
        $start.StandardOutputEncoding = $encoding
        $start.StandardErrorEncoding = $encoding
        foreach ($argument in @('-b','-x','-ch',$config.Charset,'-d','HWDESKTOP_REFERENCE','-o',$raw,$config.Database)) { $start.ArgumentList.Add($argument) }
        $start.Environment['ISC_USER'] = $secrets.FIREBIRD_USER
        $start.Environment['ISC_PASSWORD'] = $secrets.FIREBIRD_PASS
        $process = [Diagnostics.Process]::new()
        $process.StartInfo = $start
        Write-Host 'Extraindo metadados; nenhuma migração será executada...'
        $null = $process.Start()
        $stdout = $process.StandardOutput.ReadToEndAsync()
        $stderr = $process.StandardError.ReadToEndAsync()
        $process.StandardInput.Close()
        if (-not $process.WaitForExit(60000)) { $process.Kill(); $process.WaitForExit(); throw 'A extração excedeu 60 segundos. A referência anterior foi preservada.' }
        $output = $stdout.GetAwaiter().GetResult()
        $errorText = $stderr.GetAwaiter().GetResult()
        foreach ($value in @($secrets.FIREBIRD_PASS,$secrets.FIREBIRD_USER,$config.Database)) {
            $output = $output.Replace($value,'[oculto]')
            $errorText = $errorText.Replace($value,'[oculto]')
        }
        if ($process.ExitCode -ne 0 -or $errorText.Trim()) { throw ("Falha na extração (código {0}). {1} {2}" -f $process.ExitCode,$errorText.Trim(),$output.Trim()) }
        if (-not [IO.File]::Exists($raw) -or [IO.FileInfo]::new($raw).Length -eq 0) { throw 'Extração vazia; a referência anterior foi preservada.' }
        $ddl = $encoding.GetString([IO.File]::ReadAllBytes($raw))
        $lf = ([char]10).ToString()
        $cr = ([char]13).ToString()
        $ddl = $ddl.Replace($cr+$cr+$lf,$lf).Replace($cr+$lf,$lf)
        $ddl = $ddl.Replace($config.Database,'HWDESKTOP_REFERENCE')
        if ($config.Database -match '^(?:[^:]+:)?([A-Za-z]:\\.+)$') { $ddl = $ddl.Replace($Matches[1],'HWDESKTOP_REFERENCE') }
        $tables = [regex]::Matches($ddl,'(?im)^\s*CREATE\s+(GLOBAL\s+TEMPORARY\s+)?TABLE\s+').Count
        $views = [regex]::Matches($ddl,'(?im)^\s*CREATE\s+VIEW\s+').Count
        if ($tables -eq 0) { throw 'Nenhuma definição de tabela foi extraída; a referência anterior foi preservada.' }
        $utf8 = [Text.UTF8Encoding]::new($false)
        $staged = Join-Path $run 'schema.sql'
        [IO.File]::WriteAllText($staged,$ddl,$utf8)
        $destination = Join-Path $schemaRoot 'schema.sql'
        $changed = -not [IO.File]::Exists($destination) -or
            (Get-FileHash -LiteralPath $staged -Algorithm SHA256).Hash -ne (Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash
        $erpVersion = if ($config.ContainsKey('ErpVersion') -and $config.ErpVersion) { $config.ErpVersion } else { 'Não informada' }
        $clientVersion = [Diagnostics.FileVersionInfo]::GetVersionInfo($config.IsqlPath).FileVersion
        $receipt = @"
# Referência do esquema do HWDESKTOP

[Schema disponível](schema.sql). Última extração: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz').

## Origem

- Nome lógico: HWDESKTOP_REFERENCE; conexão física na configuração pessoal.
- Cliente isql: $clientVersion.
- Versão do ERP declarada na configuração: $erpVersion.
- Extração: charset $($config.Charset), arquivo final UTF-8 sem BOM e LF.
- Definições no arquivo: $tables tabelas e $views views.

O responsável atualiza previamente essa base pelo ERP. Este comando não executa
migrações, não verifica os logs dessa atualização e não consulta registros de clientes.
A versão do cliente não comprova a versão do servidor.
As contagens são das declarações exportadas, não testes das rotinas.

## Comentários e uso

A exportação preserva os metadados retornados pelo Firebird, inclusive descrições
que ainda existirem na base. O responsável mantém a base sem os comentários antigos,
que foram informados como incompletos e desatualizados. Não há filtro automático
de COMMENT ON neste comando.

Leia somente os objetos pertinentes. O DDL é referência gerada, não uma migração
a executar automaticamente. Mantenha separadas as alterações pendentes da demanda.

[Procedimento](../README.md).
"@
        [IO.File]::WriteAllText((Join-Path $run 'README.md'),$receipt.Replace($cr+$lf,$lf)+$lf,$utf8)
        if ($changed) { [IO.File]::Move($staged,$destination,$true) }
        [IO.File]::Move((Join-Path $run 'README.md'),(Join-Path $schemaRoot 'README.md'),$true)
        Write-Host $(if ($changed) { 'Schema atualizado.' } else { 'Schema sem diferenças; identificação da extração atualizada.' }) -ForegroundColor Green
        Write-Host "$tables tabelas; $views views. Destino: scripts/database/schema/schema.sql"
    } finally {
        if ($process) { $process.Dispose() }
        if ($run -and [IO.Directory]::Exists($run)) {
            foreach ($name in @('raw.sql','schema.sql','README.md')) {
                $file = Join-Path $run $name
                if ([IO.File]::Exists($file)) { [IO.File]::Delete($file) }
            }
            [IO.Directory]::Delete($run,$false)
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    try { Invoke-ExportSchema -ConfigPath $ConfigPath }
    catch { Write-Host ("Falha ao extrair schema: "+$_.Exception.Message) -ForegroundColor Red; exit 1 }
}
