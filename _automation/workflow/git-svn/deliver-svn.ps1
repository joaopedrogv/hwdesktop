# Implementação privada; preserva a linha SVN e prepara apenas o delta GitHub.
function New-GitSvnDelivery {
    param($Context)
    $syncFile=Join-Path $Context.GitDirectory 'hwdesktop-sync\last-sync.json'
    if (-not [IO.File]::Exists($syncFile)) { throw 'Execute primeiro sync-integration.ps1 nesta ponte para registrar a base SVN/GitHub.' }
    $sync=Get-Content -LiteralPath $syncFile -Raw | ConvertFrom-Json
    foreach ($value in @($sync.svnCommit,$sync.githubCommit)) { if ($value -notmatch '^[0-9a-f]{40,64}$') { throw 'Registro da última sincronização inválido.' } }
    if ([string] $sync.svnRevision -notmatch '^[0-9]+$') { throw 'Revisão da última sincronização inválida.' }
    Initialize-DeliveryWsl $Context
    $remotes=(Invoke-DeliveryGit $Context @('config','--get-regexp','^svn-remote\..*\.url$')).Output.Trim() -split '\r?\n'
    if ($remotes.Count -ne 1 -or $remotes[0] -notmatch '^svn-remote\.(.+)\.url\s+(\S+)$') { throw 'Configure uma única origem SVN nesta ponte.' }
    $remoteName=$Matches[1]; $url=$Matches[2].TrimEnd('/')
    if (-not $url.EndsWith('/'+([string] $Context.Config.SvnUrlSuffix).Trim('/'),[StringComparison]::Ordinal)) { throw "URL SVN incorreta: $url" }
    $svnRef=[string] $Context.Config.SvnRef
    if (-not (Invoke-DeliveryGit $Context @('config','--get',"svn-remote.$remoteName.fetch")).Output.Trim().EndsWith(':'+$svnRef,[StringComparison]::Ordinal)) { throw 'SvnRef não corresponde ao mapeamento git-svn.' }
    if ((Invoke-DeliveryGit $Context @('rev-parse','--verify',$svnRef)).Output.Trim() -cne $sync.svnCommit) { throw 'A referência SVN mudou após a sincronização. Sincronize novamente antes de preparar.' }
    $message=(Invoke-DeliveryGit $Context @('log','-1','--format=%B',$sync.svnCommit)).Output
    if ($message -notmatch '(?m)^git-svn-id: (\S+)@([0-9]+) [0-9a-fA-F-]+\s*$' -or $Matches[1].TrimEnd('/') -cne $url -or $Matches[2] -ne [string] $sync.svnRevision) { throw 'A revisão registrada não corresponde à origem SVN.' }
    $mirror=Join-Path $Context.GitDirectory 'hwdesktop-sync\github.git'
    $owner=Join-Path $mirror 'hwdesktop-owner.json'
    if (-not [IO.File]::Exists($owner) -or (Get-Content -LiteralPath $owner -Raw | ConvertFrom-Json).root -ine $Context.Root) { throw 'Cache GitHub não pertence à integração. Sincronize primeiro.' }
    if ((Invoke-DeliveryGit $Context @('remote','get-url','origin') -Directory $mirror).Output.Trim() -cne $Context.Origin) { throw 'Origin do cache difere da integração.' }
    [void] (Invoke-DeliveryGit $Context @('fetch','origin',("refs/heads/"+$Context.Config.GitBranch)) -Directory $mirror -ShowOutput)
    $target=(Invoke-DeliveryGit $Context @('rev-parse','FETCH_HEAD') -Directory $mirror).Output.Trim()
    if ((Invoke-DeliveryGit $Context @('merge-base','--is-ancestor',$sync.githubCommit,$target) -Directory $mirror -AllowedCodes @(0,1)).ExitCode -ne 0) { throw 'A main GitHub não descende da base sincronizada. Não será reescrito nenhum histórico.' }
    $changes=@(Get-DeliveryChanges $Context $sync.githubCommit $target $mirror)
    if ($changes.Count -eq 0) { Write-Host 'Sem diferenças GitHub para entregar ao SVN.'; return }
    $id=[guid]::NewGuid().ToString('N')
    $run=Join-Path $Context.Cache ('run-'+$id)
    [void] (Invoke-DeliveryGit $Context @('clone','--shared','--no-checkout',$Context.Root,$run))
    [void] (Invoke-DeliveryGit $Context @('fetch','--no-tags',$mirror,$target) -Directory $run)
    [void] (Invoke-DeliveryGit $Context @('read-tree',$sync.svnCommit) -Directory $run)
    # Atualização do índice por blobs: não materializa a árvore SVN poluída.
    foreach ($change in $changes) {
        $entry=(Invoke-DeliveryGit $Context @('ls-tree','-z',$sync.svnCommit,'--',(':(literal)'+$change.Path)) -Directory $run).Output.TrimEnd([char]0)
        $old=$null
        if ($entry) {
            if ($entry -notmatch '^([0-9]+) blob ([0-9a-f]+)\t') { throw "Tipo SVN não suportado: $($change.Path)" }
            $old=@{Mode=$Matches[1];Hash=$Matches[2]}
        }
        if ($change.Status -eq 'A' -and $null -ne $old) { throw "O novo arquivo Git já existe fora do recorte SVN/GitHub: $($change.Path)" }
        if ($change.Status -ne 'A' -and $null -eq $old) { throw "Arquivo da base Git ausente na base SVN: $($change.Path)" }
        $oldBytes=if ($null -ne $old) { Get-DeliveryBlob $Context $run $old.Hash } else { [byte[]]::new(0) }
        if ($change.Status -ne 'A') {
            $githubOld=Get-DeliveryBlob $Context $run $change.OldHash
            $a=[Text.Encoding]::Latin1.GetString($oldBytes); $b=[Text.Encoding]::Latin1.GetString($githubOld)
            if (0 -notin $oldBytes -and 0 -notin $githubOld) { $a=$a.Replace("`r`n","`n"); $b=$b.Replace("`r`n","`n") }
            if ($a -cne $b) { throw "Conteúdo da base Git difere do SVN: $($change.Path). Sincronize antes da entrega." }
        }
        if ($change.Status -eq 'D') {
            [void] (Invoke-DeliveryGit $Context @('update-index','--force-remove','--',$change.Path) -Directory $run)
            Write-Host "D $($change.Path)"
            continue
        }
        $bytes=Get-DeliveryBlob $Context $run $change.Hash
        $attributes=(Invoke-DeliveryGit $Context @('check-attr',("--source="+$target),'-z','text','eol','--',$change.Path) -Directory $run).Output.Split([char]0)
        $textAttribute=$attributes[2]; $eolAttribute=$attributes[5]
        if ($textAttribute -ne 'unset' -and 0 -notin $bytes -and 0 -notin $oldBytes) {
            if ($null -ne $old) { $bytes=Convert-DeliveryLineEndings $Context $oldBytes $bytes $run }
            elseif ($eolAttribute -eq 'crlf') {
                $value=[Text.Encoding]::Latin1.GetString($bytes).Replace("`r`n","`n").Replace("`n","`r`n")
                $bytes=[Text.Encoding]::Latin1.GetBytes($value)
            } elseif ($eolAttribute -eq 'lf') {
                $bytes=[Text.Encoding]::Latin1.GetBytes([Text.Encoding]::Latin1.GetString($bytes).Replace("`r`n","`n"))
            }
        }
        $blobFile=Join-Path $run 'delivery-blob'
        [IO.File]::WriteAllBytes($blobFile,$bytes)
        $hash=(Invoke-DeliveryGit $Context @('hash-object','-w','--no-filters',$blobFile) -Directory $run).Output.Trim()
        [void] (Invoke-DeliveryGit $Context @('update-index','--add','--cacheinfo',$change.Mode,$hash,$change.Path) -Directory $run)
        Write-Host "$($change.Status) $($change.Path)"
    }
    $tree=(Invoke-DeliveryGit $Context @('write-tree') -Directory $run).Output.Trim()
    if ($tree -eq (Invoke-DeliveryGit $Context @('rev-parse',($sync.svnCommit+'^{tree}')) -Directory $run).Output.Trim()) {
        Write-Host 'A diferença era apenas de representação; não há conteúdo SVN a entregar.'
        return
    }
    foreach ($key in @('user.name','user.email')) {
        $identity=Invoke-DeliveryGit $Context @('config','--get',$key) -AllowedCodes @(0,1)
        if ($identity.ExitCode -eq 0) { [void] (Invoke-DeliveryGit $Context @('config',$key,$identity.Output.Trim()) -Directory $run) }
    }
    $userMessage=if ($Context.Message) { $Context.Message } else { "Entrega GitHub $($target.Substring(0,12))" }
    $commitMessage="$userMessage`n`nGitHub-Commit: $target`nDelivery-ID: $id"
    $commit=(Invoke-DeliveryGit $Context @('commit-tree',$tree,'-p',$sync.svnCommit,'-m',$commitMessage) -Directory $run).Output.Trim()
    $deliveryRef="refs/heads/codex/svn-delivery/$id"
    [void] (Invoke-DeliveryGit $Context @('fetch','--no-tags',$run,($commit+':'+$deliveryRef)))
    $state=[ordered]@{schemaVersion=1;id=$id;root=$Context.Root;mode='git-svn';status='prepared';githubBase=$sync.githubCommit;githubCommit=$target;svnRevision=[string] $sync.svnRevision;svnCommit=$sync.svnCommit;svnUrl=$url;deliveryRef=$deliveryRef;deliveryCommit=$commit;userMessage=$userMessage;message=$commitMessage;resultRevision=''}
    Save-DeliveryState $Context $state
    [void] (Invoke-DeliveryGit $Context @('diff','--stat',$sync.svnCommit,$commit) -ShowOutput)
    # Os objetos já pertencem à referência privada da ponte; remover apenas o clone desta execução.
    $resolved=[IO.Path]::GetFullPath($run)
    if ([IO.Path]::GetDirectoryName($resolved) -ieq [IO.Path]::GetFullPath($Context.Cache) -and (Split-Path -Leaf $resolved) -match '^run-[a-f0-9]{32}$') {
        # O clone --shared contém alternates, mas o fetch acima transferiu os objetos novos.
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
    return [pscustomobject] $state
}
