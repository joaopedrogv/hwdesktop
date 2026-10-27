# Empacotar dependências para publicação

`pack-dependencies.ps1` prepara uma pasta local pronta para enviar ao Nextcloud. Executar no PowerShell 7.5+:

```powershell
.\_automation\dependencies\pack-dependencies.ps1 -SourcePath 'D:\temp\binarios-hwdesktop\dependencies-files' -OutputPath 'D:\temp\binarios-hwdesktop\dependencies' -Version v0001
```

A origem permanece intacta. A saída deve ser nova e separada da origem; uma pasta existente é recusada. O script monta e confere tudo numa área temporária ao lado da saída e só então disponibiliza a pasta final.

## Origem

- `build/`: todos os arquivos do conjunto de compilação, incluindo arquivos TXT selecionados pelo responsável.
- `runtime/baseline/` ou o nome antigo `runtime/third-party/`: conjunto estável, com binários de terceiros e próprios raramente alterados.
- `runtime/internal/`: binários próprios individuais.

Os grupos aceitam arquivos soltos ou uma única pasta de versão como `v0001`. Essa pasta de origem é retirada dos caminhos internos do ZIP. Os arquivos preservam seus nomes e conteúdos. Cada arquivo de `internal` recebe seu próprio ZIP e uma pasta com seu nome sem a extensão: `hw.nfe.dx.dll` vira o módulo `hw.nfe.dx`.

## Publicação produzida

```text
dependencies/
  index.json
  build/v0001/
    bundle.zip
    manifest.json
  runtime/baseline/v0001/
    bundle.zip
    manifest.json
  runtime/internal/hw.efd.dx/v0001/
    bundle.zip
    manifest.json
  runtime/internal/hw.nfe.dx/v0001/
    bundle.zip
    manifest.json
  runtime/internal/hw.utils.dx/v0001/
    bundle.zip
    manifest.json
```

`index.json` registra a composição desta base, apontando para os manifestos por caminhos relativos. Cada manifesto contém identificação, versão, nome, tamanho e SHA-256 do arquivo para download, além da relação dos arquivos do item. Manifestos não incluem caminhos locais da máquina.

Os ZIPs são reabertos e seus conteúdos conferidos. Todos os itens, inclusive módulos internos, usam o mesmo algoritmo de ZIP e conferência. Os arquivos de origem também são conferidos por hash antes de finalizar. Não são carregadas DLLs ou executados os binários. A versão indicada identifica os itens desta exportação inicial; o layout permite que os módulos evoluam em versões independentes posteriormente.

Envie a pasta `dependencies` para a pasta `hwdesktop` no armazenamento. Não envie `dependencies-files`, que é apenas a origem de preparação. A obtenção por WebDAV será uma próxima etapa.

## Testes

Os testes continuam no arquivo único:

```powershell
.\_automation\tests\verify.ps1 -Group Dependencies
```

Usam somente arquivos temporários para verificar organização, conteúdo, integridade, preservação da origem e recusa de saídas existentes/indevidas.
