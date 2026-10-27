# Implementação privada; chamada por workflow/deliver-svn.ps1.
function New-SvnDelivery {
    param($Context)
    $root=$Context.Root; $branch=[string] $Context.Config.GitBranch
    if ((Invoke-DeliveryGit $Context @('branch','--show-current')).Output.Trim() -cne $branch) { throw "Selecione $branch na integração SVN antes da entrega." }
    if ((Invoke-DeliveryGit $Context @('status','--porcelain','--untracked-files=normal')).Output.Trim()) { throw 'A integração Git tem alterações locais. Sincronize/avalie antes de receber a demanda.' }
    $status=[xml] (Invoke-DeliveryCommand $Context svn @('status','--xml','--ignore-externals')).Output
    Assert-SyncSvnStatus $status
    $info=[xml] (Invoke-DeliveryCommand $Context svn @('info','--xml','.')).Output
    $url=[string] $info.info.entry.url
    if (-not $url.TrimEnd('/').EndsWith('/'+([string] $Context.Config.SvnUrlSuffix).Trim('/'),[StringComparison]::Ordinal)) { throw "URL SVN incorreta: $url" }
    $base=(Invoke-DeliveryGit $Context @('rev-parse','HEAD')).Output.Trim()
    [void] (Invoke-DeliveryGit $Context @('fetch','origin',("refs/heads/"+$branch)) -ShowOutput)
    $target=(Invoke-DeliveryGit $Context @('rev-parse','FETCH_HEAD')).Output.Trim()
    if ((Invoke-DeliveryGit $Context @('merge-base','--is-ancestor',$base,$target) -AllowedCodes @(0,1)).ExitCode -ne 0) { throw 'A main local tem commits ausentes da main recebida. Não é possível atualizar por fast-forward.' }
    $changes=@(Get-DeliveryChanges $Context $base $target $root)
    if ($changes.Count -eq 0) { Write-Host 'Sem arquivos novos para entregar ao SVN.'; return }
    $candidates=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($change in $changes) {
        $path=$change.Path
        while ($path) {
            [void] $candidates.Add($path)
            $absolute=Join-Path $root $path
            if (Test-Path -LiteralPath $absolute) {
                if ((Get-Item -LiteralPath $absolute -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Link/reparse point não suportado: $path" }
            }
            $separator=$path.LastIndexOf('/')
            $path=if ($separator -gt 0) { $path.Substring(0,$separator) } else { '' }
        }
    }
    function TargetStatus {
        $entries=[Collections.Generic.List[object]]::new()
        # Lotes pequenos respeitam o limite da linha de comando do Windows.
        $paths=@($candidates)
        for ($i=0;$i -lt $paths.Count;$i+=20) {
            $last=[Math]::Min($i+19,$paths.Count-1)
            $args=@('status','--xml','--no-ignore','--depth','empty','--')+@($paths[$i..$last] | ForEach-Object { $_+'@' })
            $xml=[xml] (Invoke-DeliveryCommand $Context svn $args).Output
            foreach ($entry in $xml.SelectNodes('//entry')) { $entries.Add($entry) }
        }
        return $entries.ToArray()
    }
    $id=[guid]::NewGuid().ToString('N')
    $userMessage=if ($Context.Message) { $Context.Message } else { "Entrega GitHub $($target.Substring(0,12))" }
    $state=[ordered]@{schemaVersion=1;id=$id;root=$root;mode='svn';status='preparing';githubBase=$base;githubCommit=$target;svnRevision=[string] $info.info.entry.revision;svnUrl=$url;userMessage=$userMessage;message=("$userMessage`n`nGitHub-Commit: $target`nDelivery-ID: $id");targets=@();resultRevision=''}
    Save-DeliveryState $Context $state
    # Receber a ponta capturada; não há segundo acesso à rede nem merge não trivial.
    [void] (Invoke-DeliveryGit $Context @('merge','--ff-only','--no-autostash','--no-overwrite-ignore',$target) -ShowOutput)
    $entries=@(TargetStatus)
    $states=@{}
    foreach ($entry in $entries) {
        $path=$entry.GetAttribute('path').Replace('\','/'); if ($path.StartsWith('./')) { $path=$path.Substring(2) }
        if ($null -ne $entry.SelectSingleNode('ancestor::changelist[@name="ignore-on-commit"]')) { throw "Alvo da entrega está em ignore-on-commit: $path" }
        $states[$path]=$entry.SelectSingleNode('wc-status').GetAttribute('item')
    }
    $adds=@($changes | Where-Object { $_.Status -ne 'D' } | ForEach-Object Path)
    $deletes=@($changes | Where-Object { $_.Status -eq 'D' -and $states[$_.Path] -eq 'missing' } | ForEach-Object Path)
    foreach ($operation in @(@{Name='add';Paths=$adds},@{Name='delete';Paths=$deletes})) {
        if ($operation.Paths.Count -eq 0) { continue }
        $file=Join-Path $Context.Cache ($operation.Name+'-targets.txt')
        Write-DeliverySvnTargets $file @($operation.Paths)
        $args=if ($operation.Name -eq 'add') { @('add','--force','--parents','--depth','empty','--no-ignore','--targets',$file) }
              else { @('delete','--force','--keep-local','--targets',$file) }
        [void] (Invoke-DeliveryCommand $Context svn $args -ShowOutput)
    }
    $targets=[Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($entry in @(TargetStatus)) {
        $path=$entry.GetAttribute('path').Replace('\','/'); if ($path.StartsWith('./')) { $path=$path.Substring(2) }
        $wc=$entry.SelectSingleNode('wc-status')
        if ($wc.GetAttribute('item') -in @('added','modified','deleted','replaced') -or $wc.GetAttribute('props') -eq 'modified') { [void] $targets.Add($path) }
        elseif ($wc.GetAttribute('item') -notin @('normal','none')) { throw "Estado SVN inesperado após preparar: $path [$($wc.GetAttribute('item'))]" }
    }
    if ($targets.Count -eq 0) { $state.status='delivered'; Save-DeliveryState $Context $state; Write-Host 'A atualização Git não produziu alterações SVN.'; return }
    $state.targets=@($targets | Sort-Object); $state.status='prepared'
    Save-DeliveryState $Context $state
    [void] (Invoke-DeliveryCommand $Context svn @('status','--ignore-externals') -ShowOutput)
    return [pscustomobject] $state
}
