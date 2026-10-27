# Scripts do fluxo de demandas

## Sincronizar integração

Requer PowerShell 7.5+, Git e SVN no PATH. **O diretório atual deve ser exatamente `IntegrationPath`**, e o script executado deve ser o arquivo `_automation/workflow/sync-integration.ps1` dessa integração. A chamada direta do PS1 a partir de outra pasta, inclusive uma subpasta ou `WorkPath`, provoca erro antes de ler os segredos ou executar Git/SVN. Estar na integração e chamar uma cópia do script localizada em outro lugar também é rejeitado.

O `menu.bat` aberto na própria `_automation` pelo Explorer inicia o menu na raiz do projeto ao qual pertence. Assim, o BAT da integração atende à regra, enquanto o BAT do WorkPath continua no projeto de trabalho e não pode sincronizar a integração. Se o BAT da integração for chamado de um terminal no WorkPath ou em outra pasta, esse diretório é preservado e a sincronização continua bloqueada.

Abra **Sincronizar integração** no menu iniciado a partir dessa raiz, ou execute:

```powershell
Set-Location 'D:\Hw\ERP-Master' # IntegrationPath da sua configuração
.\_automation\workflow\sync-integration.ps1
# Outra configuração pessoal:
.\_automation\workflow\sync-integration.ps1 -ConfigPath 'D:\minhas-configuracoes\workflow.local.psd1'
```

## Configuração individual

Para a integração, use `config/workflow.exemplo.psd1` como modelo de `config/workflow.local.psd1`, excluído do Git. Ele contém somente os dados da própria integração: `IntegrationPath`, `GitBranch`, `SvnUrlSuffix` e `SecretsFile`. Não precisa conhecer os clones de trabalho. Caminhos relativos são resolvidos a partir da pasta dessa configuração.

Nos clones Git, a configuração do início de demanda é opcional. O modelo `config/workflow.work.exemplo.psd1` contém apenas `GitBranch`. Sem arquivo pessoal, utiliza `main`. Não copie nem preencha dados de integração ou segredos SVN nos clones para usar esse comando.

`SecretsFile` aponta para o arquivo individual existente, com `SVN_USER=...` e `SVN_PASS=...`, uma chave por linha. O script não altera esse arquivo nem verifica suas regras de exclusão. As credenciais SVN são passadas ao cliente, sem impressão da senha. O cliente SVN instalado recebe a senha como argumento do processo; ela pode ser inspecionada por ferramentas locais com acesso ao processo. A autenticação Git é a já configurada na máquina; não há usuário/senha Git neste arquivo.

## Operação

1. Confere diretório atual e origem do próprio script. Depois consulta `git --version` e `svn --version`, confere raiz Git, branch configurada, URL SVN e existência de `origin`. Não muda o diretório para contornar essa validação.
2. Interrompe diante de operação Git em andamento, conflito, índice Git previamente preparado ou mudanças locais SVN fora da changelist `ignore-on-commit`. Conflitos nessa changelist também interrompem. Diferenças Git não preparadas são permitidas.
3. Executa `svn update`, confere seu resultado e obtém a revisão e a relação de arquivos versionados com **`svn info --xml --depth infinity .` após o update**. Essa consulta lê os metadados da working copy.
4. Executa `git fetch origin` e `git reset --soft refs/remotes/origin/main` (ou a branch configurada). O reset conserva arquivos e índice; o commit seguinte tem como pai a ponta remota recebida. Não compara históricos para bloquear branches à frente/divergentes. No remoto inicialmente vazio, omite o reset e faz a primeira publicação.
5. Executa `git add .` na raiz e retira do índice, com `git rm --cached`, todos os arquivos ausentes da relação SVN. A retirada é exibida e não apaga arquivos locais. Os caminhos são enviados por entrada padrão, com separação NUL e interpretação literal, para suportar muitos nomes, espaços, acentos e colchetes. Se houver diferenças, cria **`Sincronizacao SVN r<revisao>`**. Sem diferenças, não cria commit vazio.
6. Executa push normal para a branch configurada, sem força. Uma alteração concorrente no GitHub pode fazer esse push ser rejeitado; o script para e mantém os arquivos e o commit local.

**O SVN é a fonte da verdade desta operação.** O novo commit representa somente seus arquivos versionados, dentro do escopo Git. Um arquivo presente na pasta, mas ausente do controle SVN, sai do próximo estado Git mesmo que já tenha sido commitado/publicado. Sua cópia local permanece. Arquivos locais novos e não versionados pelo SVN também não são publicados. O próprio `.gitignore` deve estar no SVN; não existem exceções para conteúdo exclusivo do Git. Os commits remotos permanecem como ancestrais do novo commit. Commits exclusivamente locais podem sair da linha principal pelo reset soft, com arquivos preservados.

`ignore-on-commit` dispensa o bloqueio por alterações locais SVN; não cria uma exclusão Git. A inclusão segue o `.gitignore` e o rastreamento Git existente, limitada aos arquivos versionados pelo SVN. Uma regra de ignore não retira, por si só, um arquivo já rastreado no Git e ainda versionado no SVN.

O script não troca branches, não aplica arquivos Git sobre a pasta SVN, não resolve conflitos e não executa limpeza, revert, reset hard, merge, rebase ou push forçado. Não verifica autoria Git previamente. Não altera o clone de desenvolvimento, não compila, não entrega commit SVN e não obtém dependências.

## Iniciar demanda

Execute primeiro a sincronização da integração pelo comando anterior. Depois, abra **Iniciar demanda** no menu ou execute:

```powershell
.\_automation\workflow\start-demand.ps1 -Branch 'nome-da-demanda'
# Opcional: preparar outro clone nessa execução, sem persistir seu caminho:
.\_automation\workflow\start-demand.ps1 -WorkPath 'D:\Hw\meu-clone' -Branch 'nome-da-demanda'
# Também aceita outra configuração pessoal:
.\_automation\workflow\start-demand.ps1 -Branch 'nome-da-demanda' -ConfigPath 'D:\minhas-configuracoes\workflow.local.psd1'
```

Sem `-WorkPath`, o comando usa a raiz do projeto onde o próprio script está localizado. Não depende do diretório do terminal para descobrir qual clone usar. O clone já deve existir. Arquivos `workflow.local.psd1` antigos podem ter seus campos `WorkPath` e `IntegrationPath` removidos; o início da demanda ignora esses campos. Não lê segredos nem executa SVN.

Quando o próprio script está numa working copy SVN, como na integração, pede o diretório do clone a preparar, ou aceita `-WorkPath`. Esse caminho vale apenas para aquela execução e não é guardado em arquivo. A configuração padrão é lida do clone alvo, não da integração. É possível preparar qualquer quantidade de clones independentes, inclusive alternar o alvo a cada execução. Uma pasta com `.svn` é rejeitada como alvo de desenvolvimento, sem comparação com um `IntegrationPath` configurado.

`-ConfigPath`, quando informado, seleciona explicitamente o arquivo de opções Git; se esse arquivo não existir, a execução é interrompida. A sincronização continua exclusiva da integração, com as validações próprias já existentes.

Sem `-Branch`, solicita o nome completo no terminal. Enter vazio cancela antes de qualquer operação Git. Em execução com entrada redirecionada, informe o parâmetro explicitamente.

O comando:

1. Identifica o próprio clone ou o alvo indicado nesta execução e lê sua opção `GitBranch` (padrão `main`). Confere `git --version`, raiz Git, ausência de alterações pendentes e operações em andamento, nome válido e ainda não existente localmente, branch principal local e remoto `origin`.
2. Executa `git fetch origin`; rejeita nome já existente no remoto e interrompe se a main local tiver commits ausentes da main remota, inclusive em caso de divergência.
3. Executa `git switch main` e atualização por `git merge --ff-only` até o commit remoto capturado no fetch. Não cria commit de merge. Os arquivos são conferidos novamente antes da troca para evitar carregar mudanças feitas durante o fetch.
4. Cria e seleciona a nova branch com `git switch --no-track -c <nome>`. Informa pasta, branch e commit da base.

Arquivos não rastreados e não ignorados bloqueiam. Arquivos ignorados, como binários locais, permanecem; se uma troca ou atualização precisasse sobrescrevê-los, ela para com erro. Para isso, as chamadas utilizam `--no-overwrite-ignore`. A atualização também desabilita autostash, preservando a regra de não guardar ou retirar mudanças automaticamente.

Não publica a branch, não cria commits, não executa reset, stash, limpeza, exclusão de branches ou preparação de dependências. A main precisa alcançar a base publicada somente por fast-forward. Branch anterior com trabalho commitado permanece disponível. Branch de demanda existente é motivo de parada, não de retomada automática.

Em falha, informa a etapa e a última operação concluída. Se a main já tiver sido selecionada ou atualizada, ela permanece nesse estado; não há rollback automático. Código de saída: `0` para sucesso/cancelamento pelo nome vazio, `1` para erro.

## Preparar dependências

Abra **Preparar dependências** no menu do clone ou execute no PowerShell 7.5+:

```powershell
.\_automation\workflow\prepare-dependencies.ps1
# Opcional: indicar o clone ou uma configuração pessoal específica.
.\_automation\workflow\prepare-dependencies.ps1 -WorkPath 'D:\Hw\meu-clone'
.\_automation\workflow\prepare-dependencies.ps1 -ConfigPath 'D:\minhas-configuracoes\dependencies.local.psd1'
```

O alvo padrão é o projeto do próprio script, independentemente do diretório do terminal. Aceita somente clone Git sem working copy SVN. Se o próprio script estiver na integração SVN, solicita o clone daquela execução, como no início de demanda. Não exige IntegrationPath, cadastro de clones ou configuração SVN.

Copie `config/dependencies.exemplo.psd1` para `config/dependencies.local.psd1`, individual e ignorado pelo Git. Configure:

- `WebDavUrl`: base WebDAV HTTPS da conta; nesta instalação, `https://drive.hwsistemasti.com.br/remote.php/dav/files/hw`.
- `RemoteDirectory`: `hwdesktop/dependencies`, onde está o índice publicado.
- `SecretsFile`: arquivo pessoal com `NEXTCLOUD_USER=...` e `NEXTCLOUD_PASS=...`, uma chave por linha. Um caminho relativo parte da pasta da configuração; o padrão é `segredos.md`.

Usa a senha de aplicativo já criada. As credenciais são lidas em memória para autenticar os downloads, sem argumentos de processo ou impressão da senha. Não há senha Git nesta configuração.

O comando lê o `index.json` remoto e os manifestos referenciados para obter a composição atual. Aplica **build em `dcp`** e **baseline e módulos internos em `bpl`**, preservando os caminhos relativos de cada arquivo.

**Arquivos existentes com conteúdo diferente são sobrescritos sem confirmação.** A data de modificação registrada no ZIP é preservada. Se o conteúdo já for idêntico e apenas a data estiver diferente, ajusta somente a data, exibindo `[DATA]`, sem recopiar o arquivo. Arquivos já corretos em conteúdo e data não são reaplicados; arquivos que não constam nos manifestos não são excluídos. Portanto, este comando prepara as dependências declaradas, mas não limpa arquivos de versões anteriores.

Todos os pacotes usam o mesmo fluxo: download, conferência de tamanho e SHA-256, leitura do ZIP, conferência dos arquivos extraídos e aplicação. Os pacotes necessários são preparados antes de alterar qualquer destino. Caminhos fora das pastas esperadas, destinos duplicados e ZIPs divergentes interrompem a execução. Se um arquivo local mudar durante a preparação, a operação para antes de aplicar.

Os ZIPs conferidos ficam em `_automation/temp/dependencies/cache`, identificados pelo SHA-256. A reexecução consulta a composição remota e confere conteúdo e datas dos arquivos locais. Os ZIPs fornecem as datas e são obtidos do cache validado ou baixados quando ausentes ou inválidos. As datas seguem a hora local e a precisão registradas no formato ZIP. O registro local `last-applied.json` fica na mesma área temporária ignorada pelo Git; não substitui o índice remoto.

Antes da cópia, guarda os arquivos que serão substituídos. Em falha durante a aplicação, tenta restaurar seu conteúdo e sua data de modificação e remover apenas os arquivos novos daquela execução. Se a restauração falhar, informa onde preservou as cópias anteriores. Não executa os binários, não compila, não altera branches, não cria commits e não envia arquivos ao Nextcloud.

Códigos de saída: `0` para sucesso/cancelamento pela escolha de clone vazia, `1` para erro.

## Testes isolados

Todos os testes estão em `_automation/tests/verify.ps1`. Sem parâmetros, executa a suíte completa; `-Group Sync` seleciona a sincronização e `-Group Start` seleciona o início de demanda, no mesmo arquivo. Usa clones e remoto Git locais temporários e SVN simulado. O grupo Dependencies cobre empacotamento e preparação, usando pacotes e transporte simulados em pastas temporárias. Não utiliza configurações pessoais, segredos, servidor SVN, GitHub ou Nextcloud reais.
