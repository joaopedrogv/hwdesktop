# Configurações
$CaminhoDados = ".\Tests\ERP.IntegrationTests\resources\fiscal-dist\content"
$ArquivoManifesto = ".\Tests\ERP.IntegrationTests\resources\fiscal-dist\manifest.json"
$UrlBase = "file://D:\Hw\ERP-Release\Modern\Tests\ERP.IntegrationTests\resources\fiscal-dist\content\"

# Verifica se a pasta existe
if (-not (Test-Path $CaminhoDados)) {
    Write-Host "ERRO: A pasta '$CaminhoDados' não foi encontrada!" -ForegroundColor Red
    Write-Host "Caminho atual do script: $(Get-Location)" -ForegroundColor Yellow
    pause
    exit
}

Write-Host "Lendo arquivos em: $(Resolve-Path $CaminhoDados)" -ForegroundColor Green

# CORREÇÃO 1: Usar \* no caminho para o -Include funcionar
# CORREÇÃO 2: Excluir o próprio manifest.json da lista (-Exclude)
$Arquivos = Get-ChildItem -Path "$CaminhoDados\*" -Include *.csv, *.db, *.json, *.zip -File -Exclude "manifest.json"

# Mostra quantos arquivos encontrou (Debug)
Write-Host "Arquivos encontrados: $($Arquivos.Count)" -ForegroundColor Cyan
foreach ($f in $Arquivos) {
    Write-Host "  - $($f.Name)" -ForegroundColor Gray
}

$ListaArquivos = @()

foreach ($Arquivo in $Arquivos) {
    Write-Host "Processando: $($Arquivo.Name)..." -ForegroundColor Gray

    # Calcular Hash
    $HashInfo = Get-FileHash -Path $Arquivo.FullName -Algorithm SHA256

    # CORREÇÃO 3: Usar LastWriteTime em vez de Get-Date -File
    $DataAtualizacao = $Arquivo.LastWriteTime.ToString("o")

    # Preparar objeto
    $Objeto = [PSCustomObject]@{
        path = $Arquivo.Name
        size = $Arquivo.Length
        hash = $HashInfo.Hash
        url  = "$UrlBase$($Arquivo.Name)"
        updated = $DataAtualizacao
    }

    $ListaArquivos += $Objeto
}

# Criar o Manifesto Final
$ManifestoFinal = [PSCustomObject]@{
    version = "1.0." + (Get-Date -Format "yyyyMMdd")
    generated_at = (Get-Date).ToString("o")
    files = $ListaArquivos
}

# Salvar JSON
$ManifestoFinal | ConvertTo-Json -Depth 10 | Set-Content -Path $ArquivoManifesto -Encoding UTF8

Write-Host "Manifesto gerado com sucesso!" -ForegroundColor Green
Write-Host "Local: $(Resolve-Path $ArquivoManifesto)" -ForegroundColor Green
pause