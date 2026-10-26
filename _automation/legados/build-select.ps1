# =========================================================
# BUILD SELECT - Selecao Interativa de Pacotes
# =========================================================
param(
    [string]$ScriptDir
)

# Se nao foi passado o diretorio, usa o diretorio do script
if (-not $ScriptDir) {
    $ScriptDir = $PSScriptRoot
}

# Garante que termina com barra
if (-not $ScriptDir.EndsWith('\')) {
    $ScriptDir += '\'
}
# Write-Host "Diretorio de trabalho: $ScriptDir" -ForegroundColor Yellow

# Caminhos dos arquivos
$orderFile = Join-Path $ScriptDir "config\package-list.txt"
$buildScript = Join-Path $ScriptDir "core\build-package.bat"

# =========================================================
# 1. Validar arquivos
# =========================================================
if (-not (Test-Path $orderFile)) {
    Write-Host "Erro: Arquivo de ordem nao encontrado: $orderFile" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $buildScript)) {
    Write-Host "Erro: Script de build nao encontrado: $buildScript" -ForegroundColor Red
    exit 1
}

# =========================================================
# 2. Ler e parsear o build_order.txt
# =========================================================
$packages = @()
$lineNumber = 0

Get-Content $orderFile | ForEach-Object {
    $line = $_.Trim()
    $lineNumber++

    # Ignora linhas vazias e comentarios
    if ([string]::IsNullOrWhiteSpace($line) -or $line.StartsWith('#')) {
        return
    }

    # Divide por ;
    $parts = $line -split ';'

    $name = $parts[0].Trim()
    $path = if ($parts.Length -gt 1) { $parts[1].Trim() } else { "" }
    $type = if ($parts.Length -gt 2) { $parts[2].Trim() } else { "NORMAL" }

    if ([string]::IsNullOrWhiteSpace($name)) {
        return
    }

    # Cria objeto com as informacoes
    $packages += [PSCustomObject]@{
        Num  = $packages.Count + 1
        Nome = $name
        Caminho = $path
        Tipo = $type
    }
}

if ($packages.Count -eq 0) {
    Write-Host "Erro: Nenhum pacote encontrado no arquivo de ordem." -ForegroundColor Red
    exit 1
}

# =========================================================
# 3. Exibir GridView para selecao
# =========================================================
Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  SELECAO DE PACOTES PARA BUILD" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Uma janela sera aberta com a lista de pacotes." -ForegroundColor Yellow
Write-Host "Use Ctrl+Click para selecionar multiplos pacotes." -ForegroundColor Yellow
Write-Host "Use Shift+Click para selecionar um intervalo." -ForegroundColor Yellow
Write-Host "Use a caixa de busca para filtrar pacotes." -ForegroundColor Yellow
Write-Host "Clique em OK apos a selecao." -ForegroundColor Yellow
Write-Host ""

$selected = $packages | Out-GridView -Title "Selecione os pacotes (Ctrl+Click para multiplos, Shift+Click para intervalo)" -PassThru

if (-not $selected -or $selected.Count -eq 0) {
    Write-Host ""
    Write-Host "Nenhum pacote selecionado. Operacao cancelada." -ForegroundColor Yellow
    exit 0
}

# =========================================================
# 4. Confirmar selecao
# =========================================================
Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  PACOTES SELECIONADOS: $($selected.Count)" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

$selected | ForEach-Object {
    Write-Host "  [$($_.Tipo)] $($_.Nome)" -ForegroundColor White
}

Write-Host ""
# $confirm = Read-Host "Deseja iniciar a compilacao? (S/N)"
$confirm = 'S'

if ($confirm -ne 'S' -and $confirm -ne 's') {
    Write-Host ""
    Write-Host "Operacao cancelada pelo usuario." -ForegroundColor Yellow
    exit 0
}

# =========================================================
# 5. Executar build dos pacotes selecionados
# =========================================================
Write-Host ""
Write-Host "==================================================" -ForegroundColor Green
Write-Host "  INICIANDO BUILD" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green
Write-Host ""

$total = $selected.Count
$current = 0
$successCount = 0
$failCount = 0
$failedPackages = @()

# Define o working directory como a pasta _deploy (onde o script esta)
$workingDir = $ScriptDir.TrimEnd('\')

foreach ($pkg in $selected) {
    $current++

    Write-Host "--------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "  [$current/$total] Build: $($pkg.Nome) [Tipo: $($pkg.Tipo)]" -ForegroundColor Cyan
    Write-Host "--------------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""

    # Chama o build_package.bat DEFININDO O WORKING DIRECTORY
    # $arguments = "/c `"$buildScript`" `"$($pkg.Nome)`" `"$($pkg.Caminho)`" `"$($pkg.Tipo)`""
    $arguments = @(
        "/c",
        $buildScript,
        $pkg.Nome,
        "`"$($pkg.Caminho)`"",
        $pkg.Tipo
    )

    $process = Start-Process -FilePath "cmd.exe" `
                             -ArgumentList $arguments `
                             -WorkingDirectory $workingDir `
                             -Wait `
                             -PassThru `
                             -NoNewWindow

    if ($process.ExitCode -eq 0) {
        Write-Host ""
        Write-Host "  [OK] $($pkg.Nome) compilado com sucesso!" -ForegroundColor Green
        $successCount++
    } else {
        Write-Host ""
        Write-Host "  [FALHA] Erro na compilacao de $($pkg.Nome)" -ForegroundColor Red
        $failCount++
        $failedPackages += $pkg.Nome

        Write-Host ""
        # $retry = Read-Host "Deseja continuar com os proximos pacotes? (S/N)"
        $retry = 'N'
        if ($retry -ne 'S' -and $retry -ne 's') {
            Write-Host ""
            # Write-Host "Build interrompido pelo usuario." -ForegroundColor Yellow
            Write-Host "Build interrompido por falha." -ForegroundColor Yellow
            break
        }
    }

    Write-Host ""
}

# =========================================================
# 6. Resumo final
# =========================================================
Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  RESUMO DO BUILD" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Total selecionado : $total" -ForegroundColor White
Write-Host "  Sucesso           : $successCount" -ForegroundColor Green
Write-Host "  Falhas            : $failCount" -ForegroundColor $(if ($failCount -gt 0) { "Red" } else { "Green" })
Write-Host ""

if ($failCount -gt 0) {
    Write-Host "  Pacotes com falha:" -ForegroundColor Red
    $failedPackages | ForEach-Object {
        Write-Host "    - $_" -ForegroundColor Red
    }
    Write-Host ""
}

if ($failCount -eq 0) {
    Write-Host "  BUILD CONCLUIDO COM SUCESSO!" -ForegroundColor Green
} else {
    Write-Host "  BUILD CONCLUIDO COM ERROS!" -ForegroundColor Red
}

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan