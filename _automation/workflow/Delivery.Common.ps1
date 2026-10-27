#Requires -Version 7.5
# Funções internas da entrega. Não executar diretamente.
Set-StrictMode -Version Latest


function Get-DeliverySvnEncoding {
    if (-not ('HwDesktop.SvnCodePage' -as [type])) {
        Add-Type -TypeDefinition 'namespace HwDesktop { public static class SvnCodePage { [System.Runtime.InteropServices.DllImport("kernel32.dll")] public static extern uint GetACP(); } }'
    }
    return [Text.Encoding]::GetEncoding([int] [HwDesktop.SvnCodePage]::GetACP(),[Text.EncoderFallback]::ExceptionFallback,[Text.DecoderFallback]::ExceptionFallback)
}

function Write-DeliverySvnTargets {
    param([string] $Path,[string[]] $Targets)
    # O SVN Windows interpreta --targets na página de código ANSI do SO.
    $encoding=Get-DeliverySvnEncoding
    try {
        $text=(@($Targets | ForEach-Object { $_+'@' }) -join [Environment]::NewLine)+[Environment]::NewLine
        [IO.File]::WriteAllText($Path,$text,$encoding)
    } catch { throw 'Um nome não é representável na codificação de --targets do SVN Windows. Use o cliente visual para esta entrega; os arquivos foram preservados.' }
}

function Invoke-DeliveryCommand {
    param($Context,[string] $Tool,[string[]] $Arguments,[string] $Directory='',[int[]] $AllowedCodes=@(0),[string] $InputText='',[switch] $ShowOutput)
    if (-not $Directory) { $Directory=$Context.Root }
    $result=$null
    if ($null -ne $Context.Runner) { $result=& $Context.Runner $Tool $Arguments $Directory $InputText }
    if ($null -eq $result) {
        if ($Tool -eq 'svn') {
            $encoding=Get-DeliverySvnEncoding
            $stdout=if ('--xml' -in $Arguments) { [Text.UTF8Encoding]::new($false) } else { $encoding }
            $result=Invoke-SyncProcess $Tool $Arguments $Directory $InputText -OutputEncoding $stdout -ErrorEncoding $encoding
        } else { $result=Invoke-SyncProcess $Tool $Arguments $Directory $InputText }
    }
    if ($ShowOutput) {
        foreach ($value in @($result.Output,$result.Error)) {
            if (-not [string]::IsNullOrWhiteSpace($value)) { if ($Context.Password) { $value=$value.Replace($Context.Password,'***') }; Write-Host $value.TrimEnd() }
        }
    }
    if ($result.ExitCode -notin $AllowedCodes) {
        $detail=($result.Error+[Environment]::NewLine+$result.Output).Trim()
        if ($Context.Password) { $detail=$detail.Replace($Context.Password,'***') }
        throw "$Tool terminou com código $($result.ExitCode).`n$detail"
    }
    return $result
}

function Invoke-DeliveryGit {
    param($Context,[string[]] $Arguments,[string] $Directory='',[int[]] $AllowedCodes=@(0),[string] $InputText='',[switch] $ShowOutput)
    Invoke-DeliveryCommand $Context git $Arguments -Directory $Directory -AllowedCodes $AllowedCodes -InputText $InputText -ShowOutput:$ShowOutput
}

function Save-DeliveryState {
    param($Context,$State)
    [IO.File]::WriteAllText($Context.StateFile,($State | ConvertTo-Json -Depth 8),[Text.UTF8Encoding]::new($false))
}

function Get-DeliveryChanges {
    param($Context,[string] $Base,[string] $Target,[string] $Directory)
    $raw=(Invoke-DeliveryGit $Context @('diff','--raw','--no-abbrev','--no-renames','-z',$Base,$Target) -Directory $Directory).Output.Split([char]0)
    $result=[Collections.Generic.List[object]]::new()
    for ($i=0;$i -lt $raw.Count -and $raw[$i];$i+=2) {
        if ($raw[$i] -notmatch '^:([0-7]{6}) ([0-7]{6}) ([0-9a-f]+) ([0-9a-f]+) ([AMDT])$') { throw 'Tipo de alteração não suportado na entrega.' }
        $record=[pscustomobject]@{OldMode=$Matches[1];Mode=$Matches[2];OldHash=$Matches[3];Hash=$Matches[4];Status=$Matches[5];Path=$raw[$i+1]}
        if ($record.Path -match '[\r\n\\]' -or $record.Path -match '(^|/)(\.git|\.svn|\.\.?)(/|$)' -or [IO.Path]::IsPathRooted($record.Path)) {
            throw "Caminho não suportado na entrega: $($record.Path)"
        }
        if ($record.Mode -notin @('000000','100644','100755') -or $record.OldMode -notin @('000000','100644','100755')) { throw "Links e submódulos exigem tratamento manual: $($record.Path)" }
        $result.Add($record)
    }
    $names=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($change in $result) {
        if (-not $names.Add($change.Path)) { throw "Mudança apenas de maiúsculas/minúsculas exige tratamento manual no SVN Windows: $($change.Path)" }
    }
    return $result.ToArray()
}

function Get-DeliveryBlob {
    param($Context,[string] $Directory,[string] $Hash)
    $start=[Diagnostics.ProcessStartInfo]::new('git')
    $start.WorkingDirectory=$Directory; $start.UseShellExecute=$false; $start.CreateNoWindow=$true
    $start.RedirectStandardOutput=$true; $start.RedirectStandardError=$true
    foreach ($arg in @('cat-file','blob',$Hash)) { $start.ArgumentList.Add($arg) }
    $process=[Diagnostics.Process]::new(); $process.StartInfo=$start
    $memory=[IO.MemoryStream]::new()
    try {
        [void] $process.Start(); $errorTask=$process.StandardError.ReadToEndAsync()
        $process.StandardOutput.BaseStream.CopyTo($memory); $process.WaitForExit()
        if ($process.ExitCode -ne 0) { throw $errorTask.GetAwaiter().GetResult() }
        return ,$memory.ToArray()
    } finally { $memory.Dispose(); $process.Dispose() }
}

function Convert-DeliveryLineEndings {
    # Usar Latin1 apenas como mapa byte/caractere; não recodifica fontes ANSI/UTF-8.
    # Mantém os terminadores de cada linha inalterada, inclusive em arquivos mistos.
    param($Context,[byte[]] $Old,[byte[]] $New,[string] $Scratch)
    if (0 -in $Old -or 0 -in $New) { return ,$New }
    $encoding=[Text.Encoding]::Latin1
    $oldText=$encoding.GetString($Old); $newText=$encoding.GetString($New)
    $oldNormalized=$oldText.Replace("`r`n","`n"); $newNormalized=$newText.Replace("`r`n","`n")
    if ($oldNormalized -ceq $newNormalized) { return ,$Old }
    function Lines([string] $Value) { return @([regex]::Matches($Value,'[^\n]*\n|[^\n]+$') | ForEach-Object Value) }
    $oldLines=@(Lines $oldText); $newLines=@(Lines $newNormalized)
    $crlf=[regex]::Matches($oldText,"`r`n").Count
    $lf=[regex]::Matches($oldText,"(?<!`r)`n").Count
    $fallback=if ($crlf -gt $lf) { "`r`n" } else { "`n" }
    $oldFile=Join-Path $Scratch 'old.txt'; $newFile=Join-Path $Scratch 'new.txt'
    [IO.File]::WriteAllBytes($oldFile,$encoding.GetBytes($oldNormalized))
    [IO.File]::WriteAllBytes($newFile,$encoding.GetBytes($newNormalized))
    $diff=(Invoke-DeliveryGit $Context @('diff','--no-index','--no-ext-diff','--no-textconv','--text','--no-color','--unified=0','--',$oldFile,$newFile) -Directory $Scratch -AllowedCodes @(0,1)).Output
    $output=[Text.StringBuilder]::new(); $cursor=0
    foreach ($hunk in [regex]::Matches($diff,'(?m)^@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))? @@')) {
        $oldCount=if ($hunk.Groups[2].Success) { [int] $hunk.Groups[2].Value } else { 1 }
        $newCount=if ($hunk.Groups[4].Success) { [int] $hunk.Groups[4].Value } else { 1 }
        $oldStart=[int] $hunk.Groups[1].Value; if ($oldCount -gt 0) { $oldStart-- }
        $newStart=[int] $hunk.Groups[3].Value; if ($newCount -gt 0) { $newStart-- }
        while ($cursor -lt $oldStart) { [void] $output.Append($oldLines[$cursor]); $cursor++ }
        for ($n=0;$n -lt $newCount;$n++) {
            $line=$newLines[$newStart+$n]
            if ($line.EndsWith("`n")) {
                $eol=$fallback
                $oldIndex=if ($n -lt $oldCount) { $oldStart+$n } else { $oldStart-1 }
                if ($oldIndex -ge 0 -and $oldIndex -lt $oldLines.Count) {
                    if ($oldLines[$oldIndex].EndsWith("`r`n")) { $eol="`r`n" }
                    elseif ($oldLines[$oldIndex].EndsWith("`n")) { $eol="`n" }
                }
                [void] $output.Append($line.Substring(0,$line.Length-1)+$eol)
            } else { [void] $output.Append($line) }
        }
        $cursor=$oldStart+$oldCount
    }
    while ($cursor -lt $oldLines.Count) { [void] $output.Append($oldLines[$cursor]); $cursor++ }
    $result=$encoding.GetBytes($output.ToString())
    if ($encoding.GetString($result).Replace("`r`n","`n") -cne $newNormalized) { throw 'Não foi possível preservar os finais de linha desta alteração.' }
    return ,$result
}

function Invoke-DeliveryWsl {
    param($Context,[string[]] $Arguments,[switch] $ShowOutput)
    Invoke-DeliveryCommand $Context wsl.exe (@('--distribution',[string] $Context.Config.WslDistribution,'--exec')+$Arguments) -ShowOutput:$ShowOutput
}

function Get-DeliveryLinuxPath {
    param($Context,[string] $Path)
    $value=(Invoke-DeliveryWsl $Context @('wslpath','-a',$Path)).Output.Trim()
    if (-not $value.StartsWith('/')) { throw 'O WSL não retornou um caminho válido.' }
    return $value
}

function Initialize-DeliveryWsl {
    param($Context)
    foreach ($key in @('WslDistribution','SvnRef')) {
        if (-not $Context.Config.ContainsKey($key) -or [string]::IsNullOrWhiteSpace([string] $Context.Config[$key])) { throw "Campo obrigatório não preenchido: $key" }
    }
    $credentials=Read-GitSvnCredentials $Context.Config $Context.ConfigDirectory
    if ($null -ne $credentials) { $Context.Password=$credentials.Password }
    [void] (Invoke-DeliveryWsl $Context @('git','svn','--version') -ShowOutput)
    $Context.LinuxRoot=Get-DeliveryLinuxPath $Context $Context.Root
    $askPass=New-GitSvnAskPass $Context.Cache $credentials
    $linuxAsk=Get-DeliveryLinuxPath $Context $askPass.Path
    $linuxNoPrompt=if ($askPass.Path -eq $askPass.NoPromptPath) { $linuxAsk } else { Get-DeliveryLinuxPath $Context $askPass.NoPromptPath }
    [void] (Invoke-DeliveryWsl $Context @('chmod','u+x',$linuxAsk,$linuxNoPrompt))
    $Context.WslEnvironment=@("GIT_ASKPASS=$linuxAsk","SSH_ASKPASS=$linuxNoPrompt")
    if ($null -ne $credentials) { $Context.WslEnvironment+="HWDESKTOP_SVN_SECRETS_FILE=$(Get-DeliveryLinuxPath $Context $credentials.Path)" }
    if ($Context.Config.ContainsKey('OpenSslConfig') -and $Context.Config.OpenSslConfig) {
        $openssl=[IO.Path]::GetFullPath([IO.Path]::Combine($Context.ConfigDirectory,$Context.Config.OpenSslConfig))
        if (-not [IO.File]::Exists($openssl)) { throw "Configuração OpenSSL não encontrada: $openssl" }
        $Context.WslEnvironment+="OPENSSL_CONF=$(Get-DeliveryLinuxPath $Context $openssl)"
    }
}

function Confirm-DeliveryPublication {
    param($Context,$State)
    if ($State.status -ne 'prepared') { throw "Entrega em estado '$($State.status)'. Confira o registro SVN antes de repetir qualquer envio. Estado: $($Context.StateFile)" }
    if ($State.mode -ne $Context.Mode -or $State.root -ine $Context.Root) { throw 'A entrega pendente pertence a outra integração.' }
    if ($Context.Message -and $Context.Message -cne $State.userMessage) { throw 'A mensagem pertence à preparação. Execute a confirmação sem alterar -Message.' }
    if ($Context.Mode -eq 'svn') {
        if ((Invoke-DeliveryGit $Context @('rev-parse','HEAD')).Output.Trim() -cne $State.githubCommit) { throw 'A main mudou depois da preparação.' }
        if ((Invoke-DeliveryGit $Context @('status','--porcelain','--untracked-files=normal')).Output.Trim()) { throw 'Há alterações Git depois da preparação. Avalie antes de confirmar.' }
        # Revalidar antes de enviar; conflitos e mudanças fora dos alvos não entram.
        $status=[xml] (Invoke-DeliveryCommand $Context svn @('status','--xml','--ignore-externals')).Output
        foreach ($entry in $status.SelectNodes('//entry')) {
            $wc=$entry.SelectSingleNode('wc-status')
            $path=$entry.GetAttribute('path').Replace('\','/'); if ($path.StartsWith('./')) { $path=$path.Substring(2) }
            if ($wc.GetAttribute('item') -eq 'conflicted' -or $wc.GetAttribute('props') -eq 'conflicted' -or $wc.GetAttribute('tree-conflicted') -eq 'true') { throw "Conflito SVN: $path" }
            if ($path -in @($State.targets) -and $null -ne $entry.SelectSingleNode('ancestor::changelist[@name="ignore-on-commit"]')) { throw "Alvo em ignore-on-commit: $path" }
        }
        $targetsFile=Join-Path $Context.Cache 'targets.txt'
        Write-DeliverySvnTargets $targetsFile @($State.targets)
        $arguments=@('commit','--depth','empty','--targets',$targetsFile,'-m',$State.message)+$Context.Authentication
    } else {
        Initialize-DeliveryWsl $Context
        if ((Invoke-DeliveryGit $Context @('rev-parse','--verify',$State.deliveryRef)).Output.Trim() -cne $State.deliveryCommit) { throw 'O commit privado da entrega foi alterado.' }
        $arguments=@('env')+$Context.WslEnvironment+@('git','-C',$Context.LinuxRoot,'-c','svn.rmdir=false','svn','commit-diff','-r',[string] $State.svnRevision,'-m',$State.message,$State.svnCommit,$State.deliveryCommit,$State.svnUrl)
    }
    # Uma falha de comunicação pode ocorrer DEPOIS do commit: não repetir às cegas.
    $State.status='publishing'; Save-DeliveryState $Context $State
    try {
        $result=if ($Context.Mode -eq 'svn') { Invoke-DeliveryCommand $Context svn $arguments -ShowOutput }
                else { Invoke-DeliveryWsl $Context $arguments -ShowOutput }
        if ($result.Output -notmatch '(?:Committed revision |Committed r)([0-9]+)') { throw 'O cliente não confirmou a revisão criada.' }
        $State.resultRevision=$Matches[1]; $State.status='delivered'
        Save-DeliveryState $Context $State
        Write-Host "Entrega concluída no SVN: r$($State.resultRevision)." -ForegroundColor Green
    } catch {
        $State.status='uncertain'; Save-DeliveryState $Context $State
        throw "O envio não teve confirmação segura. Confira o log SVN por Delivery-ID $($State.id) antes de repetir. Nenhuma nova tentativa automática foi feita.`n$($_.Exception.Message)"
    }
}

function Show-DeliveryState {
    param($Context,$State)
    Write-Host "`nEntrega $($State.id) [$($State.status)]" -ForegroundColor Cyan
    Write-Host "Modo: $($State.mode) | Base SVN: r$($State.svnRevision) | URL: $($State.svnUrl)`nGitHub: $($State.githubCommit)`nMensagem: $($State.message)"
    if ($State.mode -eq 'git-svn') {
        Write-Host "Commit privado para revisão: $($State.deliveryCommit)`nConfira com: git diff --stat $($State.svnCommit) $($State.deliveryCommit)"
    } else { Write-Host 'Confira com: svn status e svn diff' }
    if ($State.status -eq 'prepared') {
        Write-Host "Preparação concluída. Nada foi enviado ao SVN.`nApós conferir: .\_automation\workflow\deliver-svn.ps1 -Commit" -ForegroundColor Yellow
    }
}
