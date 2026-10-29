#Requires -Version 7.5
<#
.SYNOPSIS
    Central interativa das automações do HWDESKTOP.
.DESCRIPTION
    Apresenta Build / Deploy, sincronização, início e merge de demandas,
    dependências, preparação de entrega SVN, informações locais e banco de dados.
.PARAMETER Preview
    Exibe a tela inicial sem aguardar entrada ou alterar o terminal.
.PARAMETER NoColor
    Desativa cores e usa bordas ASCII para terminais com recursos limitados.
#>
[CmdletBinding()]
param(
    [switch] $Preview,
    [switch] $NoColor,
    [ValidateSet('Main', 'Build', 'Database', 'AI')] [string] $Section = 'Main'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-MenuTransition {
    param(
        [int] $SelectedIndex,
        [ConsoleKeyInfo] $Key,
        [int] $ItemCount
    )

    $action = 'None'
    switch ($Key.Key) {
        'DownArrow' { $SelectedIndex = ($SelectedIndex + 1) % $ItemCount }
        'UpArrow' {
            if ($SelectedIndex -le 0) { $SelectedIndex = $ItemCount - 1 }
            else { $SelectedIndex-- }
        }
        'Home' { $SelectedIndex = 0 }
        'End' { $SelectedIndex = $ItemCount - 1 }
        'Enter' { if ($SelectedIndex -ge 0) { $action = 'Open' } }
        'Escape' { $action = 'Exit' }
        default {
            if ($Key.KeyChar -in @('0', 'q', 'Q')) {
                $action = 'Exit'
            }
            elseif ($Key.KeyChar -ge '1' -and $Key.KeyChar -le '9') {
                $index = [int]::Parse([string] $Key.KeyChar) - 1
                if ($index -ge 0 -and $index -lt $ItemCount) {
                    $SelectedIndex = $index
                }
            }
        }
    }

    [pscustomobject]@{ SelectedIndex = $SelectedIndex; Action = $action }
}

function Write-MenuScreen {
    param(
        [object[]] $Items,
        [int] $SelectedIndex,
        [string] $ProjectRoot,
        [string[]] $Details = @(),
        [string] $DetailTitle,
        [switch] $Plain,
        [switch] $Refresh,
        [switch] $BuildSection,
        [switch] $DatabaseSection,
        [switch] $AiSection
    )

    $width = 88
    $compact = $false
    if (-not [Console]::IsOutputRedirected) {
        try {
            $width = [Math]::Clamp([Console]::WindowWidth - 2, 40, 98)
            $compact = [Console]::WindowHeight -lt (15 + 3 * $Items.Count)
        }
        catch { $width = 78 }
    }
    $innerWidth = $width - 4
    $escape = [char] 27
    if ($Refresh) { [Console]::Write("${escape}[2J${escape}[H") }

    $palette = @{
        Reset = ''; Accent = ''; Muted = ''; Title = ''; Selected = ''
    }
    $border = @{ TopLeft = '+'; TopRight = '+'; BottomLeft = '+'; BottomRight = '+'; Horizontal = '-'; Vertical = '|' }
    if (-not $Plain) {
        $palette.Reset = $PSStyle.Reset
        $palette.Accent = $PSStyle.Foreground.BrightCyan
        $palette.Muted = $PSStyle.Foreground.BrightBlack
        $palette.Title = "$($PSStyle.Bold)$($PSStyle.Foreground.BrightWhite)"
        $palette.Selected = "$($PSStyle.Background.FromRgb(24, 45, 74))$($PSStyle.Foreground.FromRgb(255, 255, 255))$($PSStyle.Bold)"
        $border = @{ TopLeft = '┌'; TopRight = '┐'; BottomLeft = '└'; BottomRight = '┘'; Horizontal = '─'; Vertical = '│' }
    }

    function Write-Row {
        param([string] $Text = '', [string] $Style = '')
        if ($Text.Length -gt $innerWidth) { $Text = $Text.Substring(0, $innerWidth - 3) + '...' }
        [Console]::WriteLine(" $($palette.Accent)$($border.Vertical)$($palette.Reset) $Style$($Text.PadRight($innerWidth))$($palette.Reset) $($palette.Accent)$($border.Vertical)$($palette.Reset)")
    }

    [Console]::WriteLine()
    [Console]::WriteLine(" $($palette.Accent)$($border.TopLeft)$($border.Horizontal * ($width - 2))$($border.TopRight)$($palette.Reset)")
    Write-Row 'HWDESKTOP  /  AUTOMAÇÕES' $palette.Title
    Write-Row $(if ($AiSection) { 'Ferramentas de IA' } elseif ($DatabaseSection) { 'Banco de dados' } elseif ($BuildSection) { 'Build / Deploy' } else { 'Ambiente de desenvolvimento' }) $palette.Muted
    if (-not $compact) { Write-Row }
    Write-Row "Projeto: $ProjectRoot" $palette.Muted
    if (-not $compact) { Write-Row "PowerShell $($PSVersionTable.PSVersion)" $palette.Muted }
    Write-Row

    if ($DetailTitle) {
        Write-Row $DetailTitle $palette.Title
        Write-Row
        foreach ($line in $Details) { Write-Row $line }
        Write-Row
        Write-Row 'Esc / Backspace: voltar    0 / Q: sair' $palette.Muted
    }
    else {
        for ($i = 0; $i -lt $Items.Count; $i++) {
            $item = $Items[$i]
            $marker = if ($i -eq $SelectedIndex) { '>' } else { ' ' }
            $style = if ($i -eq $SelectedIndex) { $palette.Selected } else { '' }
            Write-Row "$marker $($i + 1)  $($item.Label)  [$($item.Status)]" $style
            if (-not $compact) { Write-Row "     $($item.Description)" $palette.Muted }
            Write-Row
        }
        Write-Row 'Setas ou número: selecionar    Enter: abrir' $palette.Accent
        Write-Row $(if ($BuildSection -or $DatabaseSection -or $AiSection) { 'Esc / Backspace: voltar    0 / Q: sair' } else { '0 / Esc / Q: sair' }) $palette.Muted
        Write-Row
        Write-Row 'Escolha uma opção. Abrir o menu não inicia operações.' $palette.Muted
    }

    [Console]::WriteLine(" $($palette.Accent)$($border.BottomLeft)$($border.Horizontal * ($width - 2))$($border.BottomRight)$($palette.Reset)")
}

function Invoke-MenuScript {
    param([string] $Engine, [string] $ScriptPath, [string[]] $Arguments = @(), [switch] $Plain, [switch] $Sta)
    $hasDiagnostic = $false
    $engineArguments = @('-NoLogo', '-NoProfile')
    if ($Sta) { $engineArguments += '-STA' }
    $engineArguments += @('-File', $ScriptPath)
    & $Engine @engineArguments @Arguments 2>&1 | ForEach-Object {
        if ($_ -is [System.Management.Automation.ErrorRecord]) {
            if (-not $hasDiagnostic) {
                Write-Host ''
                if ($Plain) {
                    Write-Host ('=' * 64)
                    Write-Host '  ATENÇÃO — CONFIRA O MOTIVO ABAIXO'
                    Write-Host ('=' * 64)
                }
                else {
                    Write-Host ('=' * 64) -ForegroundColor Yellow
                    Write-Host '  ATENÇÃO — CONFIRA O MOTIVO ABAIXO' -ForegroundColor White
                    Write-Host ('=' * 64) -ForegroundColor Yellow
                }
                $hasDiagnostic = $true
            }
            if ($Plain) { Write-Host $_.ToString() }
            else { Write-Host $_.ToString() -ForegroundColor Yellow }
        }
        else { $_ | Out-Host }
    }
    $commandExitCode = $LASTEXITCODE
    if ($hasDiagnostic) {
        if ($Plain) { Write-Host ('=' * 64) }
        else { Write-Host ('=' * 64) -ForegroundColor Yellow }
        Write-Host ''
    }
    return $commandExitCode
}

function Invoke-MenuCommand {
    param([Parameter(Mandatory)] $Item, [Parameter(Mandatory)] [string] $ProjectRoot, [switch] $Plain)
    [Console]::CursorVisible = $true
    [Console]::TreatControlCAsInput = $false
    $previousNativePreference = $PSNativeCommandUseErrorActionPreference
    try {
        [Console]::Write("$([char]27)[2J$([char]27)[H")
        if ($Item.Id -eq 'sync') {
            $commandArguments = @()
            $scriptPath = Join-Path $PSScriptRoot 'workflow\sync-integration.ps1'
        }
        elseif ($Item.Id -eq 'start') {
            $commandArguments = @('-Gui')
            $scriptPath = Join-Path $PSScriptRoot 'workflow\start-demand.ps1'
        }
        elseif ($Item.Id -eq 'integrate') {
            $commandArguments = @()
            $scriptPath = Join-Path $PSScriptRoot 'workflow\merge-demand.ps1'
        }
        elseif ($Item.Id -eq 'deliver') {
            $commandArguments = @()
            $scriptPath = Join-Path $PSScriptRoot 'workflow\deliver-svn.ps1'
        }
        elseif ($Item.Id -eq 'schema') {
            $commandArguments = @()
            $scriptPath = Join-Path $PSScriptRoot 'database\export-schema.ps1'
        }
        elseif ($Item.Id -in @('ai-plan', 'ai-apply', 'ai-check')) {
            $commandArguments = @('-Tool', 'Kilo', '-Action', $Item.Id.Substring(3))
            $scriptPath = Join-Path $PSScriptRoot 'ai\Sync-AIProfiles.ps1'
        }
        elseif ($Item.Id -eq 'dependencies') {
            $commandArguments = @()
            $scriptPath = Join-Path $PSScriptRoot 'workflow\prepare-dependencies.ps1'
        }
        else {
            $commandArguments = @('-ProjectRoot', $ProjectRoot)
            $scriptPath = Join-Path $PSScriptRoot "build\$($Item.ScriptName)"
        }
        $engine = (Get-Process -Id $PID).Path
        $PSNativeCommandUseErrorActionPreference = $false
        $operationExitCode = Invoke-MenuScript -Engine $engine -ScriptPath $scriptPath -Arguments $commandArguments -Plain:$Plain -Sta:($Item.Id -eq 'start')
        if ($operationExitCode -ne 0) { Write-Host "`nA operação terminou com erro (código $operationExitCode)." -ForegroundColor Red }
    }
    catch { Write-Host "`n$($_.Exception.Message)" -ForegroundColor Red }
    finally {
        $PSNativeCommandUseErrorActionPreference = $previousNativePreference
        [void](Read-Host 'Pressione Enter para voltar ao menu')
        [Console]::TreatControlCAsInput = $true
        [Console]::CursorVisible = $false
    }
}

function Invoke-AutomationMenu {
    param([switch] $Preview, [switch] $NoColor, [string] $Section)

    $projectRoot = Split-Path -Parent $PSScriptRoot
    $mainItems = @(
        [pscustomobject]@{ Label = 'Build / Deploy'; Description = 'Compilar, limpar e publicar BPLs.'; Status = 'Disponível'; Id = 'build' }
        [pscustomobject]@{ Label = 'Sincronizar integração'; Description = 'Atualizar pelo SVN e publicar seu estado no Git.'; Status = 'Disponível'; Id = 'sync' }
        [pscustomobject]@{ Label = 'Iniciar demanda'; Description = 'Atualizar a base Git e criar a branch de trabalho.'; Status = 'Disponível'; Id = 'start' }
        [pscustomobject]@{ Label = 'Integrar demanda'; Description = 'Atualizar a main e incorporar a demanda local, sem push.'; Status = 'Disponível'; Id = 'integrate' }
        [pscustomobject]@{ Label = 'Preparar dependências'; Description = 'Obter build em dcp e runtime em bpl pelo Nextcloud.'; Status = 'Disponível'; Id = 'dependencies' }
        [pscustomobject]@{ Label = 'Entregar ao SVN'; Description = 'Preparar a entrega; commit SVN por chamada separada com -Commit.'; Status = 'Disponível'; Id = 'deliver' }
        [pscustomobject]@{ Label = 'Informações do ambiente'; Description = 'Consultar caminhos e a versão do PowerShell.'; Status = 'Disponível'; Id = 'environment' }
        [pscustomobject]@{ Label = 'Banco de dados'; Description = 'Ferramentas da base de referência.'; Status = 'Disponível'; Id = 'database' }
        [pscustomobject]@{ Label = 'Ferramentas de IA'; Description = 'Planejar, aplicar e conferir o setup local do Kilo.'; Status = 'Disponível'; Id = 'ai' }
    )
    $buildItems = @(
        [pscustomobject]@{ Label = 'Compilar todos'; Description = 'Limpeza geral e compilação do catálogo completo.'; Status = 'Disponível'; Id = 'all'; ScriptName = 'build-all.ps1' }
        [pscustomobject]@{ Label = 'Compilar selecionados'; Description = 'Escolher pacotes pela janela de seleção.'; Status = 'Disponível'; Id = 'select'; ScriptName = 'build-select.ps1' }
        [pscustomobject]@{ Label = 'Compilar reestruturação'; Description = 'Catálogo específico e preparação SQL_RES atual.'; Status = 'Disponível'; Id = 'reestrutura'; ScriptName = 'build-reestrutura.ps1' }
        [pscustomobject]@{ Label = 'Limpar saídas'; Description = 'DCUs globais e DCPs/BPLs do catálogo.'; Status = 'Disponível'; Id = 'clean'; ScriptName = 'clean.ps1' }
        [pscustomobject]@{ Label = 'Publicar BPLs'; Description = 'Copiar as BPLs disponíveis para o destino.'; Status = 'Disponível'; Id = 'deploy'; ScriptName = 'deploy-all.ps1' }
        [pscustomobject]@{ Label = 'Compilar e publicar'; Description = 'Publicar após a compilação terminar com sucesso.'; Status = 'Disponível'; Id = 'combined'; ScriptName = 'build-and-deploy.ps1' }
    )
    $databaseItems = @(
        [pscustomobject]@{ Label = 'Atualizar schema'; Description = 'Extrair metadados da base configurada, sem aplicar migrações.'; Status = 'Disponível'; Id = 'schema' }
    )
    $aiItems = @(
        [pscustomobject]@{ Label = 'Visualizar setup do Kilo'; Description = 'Conferir o plano de instalação sem alterar arquivos.'; Status = 'Disponível'; Id = 'ai-plan' }
        [pscustomobject]@{ Label = 'Aplicar / atualizar Kilo'; Description = 'Aplicar os adapters na raiz e conferir o resultado.'; Status = 'Disponível'; Id = 'ai-apply' }
        [pscustomobject]@{ Label = 'Verificar setup do Kilo'; Description = 'Identificar diferenças sem modificar a instalação.'; Status = 'Disponível'; Id = 'ai-check' }
    )
    $items = if ($Section -eq 'Build') { $buildItems } elseif ($Section -eq 'Database') { $databaseItems } elseif ($Section -eq 'AI') { $aiItems } else { $mainItems }
    $plain = $NoColor -or [Console]::IsOutputRedirected -or (Test-Path Env:NO_COLOR)

    if ($Preview) {
        Write-MenuScreen -Items $items -SelectedIndex -1 -ProjectRoot $projectRoot -Plain:$plain -BuildSection:($Section -eq 'Build') -DatabaseSection:($Section -eq 'Database') -AiSection:($Section -eq 'AI')
        return 0
    }

    if ([Console]::IsInputRedirected -or [Console]::IsOutputRedirected) {
        [Console]::Error.WriteLine('Abra menu.bat em um terminal interativo. Para visualizar sem interação, use -Preview.')
        return 2
    }

    $originalTitle = [Console]::Title
    $originalCursorVisible = [Console]::CursorVisible
    $originalControlCAsInput = [Console]::TreatControlCAsInput
    $selectedIndex = -1
    $detailItem = $null
    try {
        [Console]::Title = 'HWDESKTOP | Automações'
        [Console]::CursorVisible = $false
        [Console]::TreatControlCAsInput = $true
        while ($true) {
            if ($null -ne $detailItem) {
                $details = if ($detailItem.Id -eq 'environment') {
                    @(
                        "Projeto: $projectRoot"
                        "Automações: $PSScriptRoot"
                        "PowerShell: $($PSVersionTable.PSVersion)"
                        ''
                        'Esta consulta não modifica o projeto.'
                    )
                }
                else {
                    @(
                        'Esta rotina ainda não está disponível neste menu.'
                        'Será habilitada em uma próxima etapa.'
                        ''
                        'Nenhuma operação foi executada.'
                    )
                }
                Write-MenuScreen -Items $items -SelectedIndex $selectedIndex -ProjectRoot $projectRoot -Plain:$plain -Refresh -DetailTitle $detailItem.Label -Details $details
            }
            else {
                Write-MenuScreen -Items $items -SelectedIndex $selectedIndex -ProjectRoot $projectRoot -Plain:$plain -Refresh -BuildSection:($Section -eq 'Build') -DatabaseSection:($Section -eq 'Database') -AiSection:($Section -eq 'AI')
            }

            $key = [Console]::ReadKey($true)
            if (($key.Modifiers -band [ConsoleModifiers]::Control) -and $key.Key -eq [ConsoleKey]::C) { return 0 }
            if ($null -ne $detailItem) {
                if ($key.KeyChar -in @('0', 'q', 'Q')) { return 0 }
                if ($key.Key -in @([ConsoleKey]::Escape, [ConsoleKey]::Backspace)) {
                    $detailItem = $null
                    $selectedIndex = -1
                }
                continue
            }

            if ($Section -in @('Build', 'Database', 'AI') -and $key.Key -in @([ConsoleKey]::Escape, [ConsoleKey]::Backspace)) {
                $Section = 'Main'; $items = $mainItems; $selectedIndex = -1
                continue
            }
            $transition = Get-MenuTransition -SelectedIndex $selectedIndex -Key $key -ItemCount $items.Count
            $selectedIndex = $transition.SelectedIndex
            if ($transition.Action -eq 'Exit') { return 0 }
            if ($transition.Action -eq 'Open') {
                if ($Section -in @('Build', 'Database', 'AI') -or $items[$selectedIndex].Id -in @('sync', 'start', 'dependencies', 'integrate', 'deliver')) {
                    Invoke-MenuCommand -Item $items[$selectedIndex] -ProjectRoot $projectRoot -Plain:$plain
                    $selectedIndex = -1
                }
                elseif ($items[$selectedIndex].Id -eq 'build') {
                    $Section = 'Build'; $items = $buildItems; $selectedIndex = -1
                }
                elseif ($items[$selectedIndex].Id -eq 'database') {
                    $Section = 'Database'; $items = $databaseItems; $selectedIndex = -1
                }
                elseif ($items[$selectedIndex].Id -eq 'ai') {
                    $Section = 'AI'; $items = $aiItems; $selectedIndex = -1
                }
                else { $detailItem = $items[$selectedIndex] }
            }
        }
    }
    finally {
        [Console]::Write($PSStyle.Reset)
        [Console]::CursorVisible = $originalCursorVisible
        [Console]::TreatControlCAsInput = $originalControlCAsInput
        [Console]::Title = $originalTitle
        [Console]::WriteLine()
    }
}

try {
    $menuExitCode = Invoke-AutomationMenu -Preview:$Preview -NoColor:$NoColor -Section $Section
    exit $menuExitCode
}
catch {
    [Console]::Error.WriteLine("Não foi possível abrir o menu: $($_.Exception.Message)")
    exit 1
}
