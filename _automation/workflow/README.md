# Scripts do fluxo de demandas

## Sincronizar integração

A entrada comum requer PowerShell 7.5+ e Git no PATH. Identifica o modo pelos metadados da pasta, sem exigir um campo de seleção: .svn encaminha para workflow/svn/sync-integration.ps1; configuração svn-remote encaminha para workflow/git-svn/sync-integration.ps1. Uma pasta com ambos os tipos é recusada. Um clone somente Git também é recusado. O modo tradicional requer SVN no PATH e não consulta WSL/git-svn. **O diretório atual deve ser exatamente `IntegrationPath`**, e o script executado deve ser o arquivo `_automation/workflow/sync-integration.ps1` dessa integração. A chamada direta do PS1 a partir de outra pasta, inclusive uma subpasta ou `WorkPath`, provoca erro antes de ler os segredos ou executar Git/SVN. Estar na integração e chamar uma cópia do script localizada em outro lugar também é rejeitado.

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

## Operação SVN tradicional

1. Confere diretório atual e origem do próprio script. Depois consulta `git --version` e `svn --version`, confere raiz Git, branch configurada, URL SVN e existência de `origin`. Não muda o diretório para contornar essa validação.
2. Interrompe diante de operação Git em andamento, conflito, índice Git previamente preparado ou mudanças locais SVN fora da changelist `ignore-on-commit`. Conflitos nessa changelist também interrompem. Diferenças Git não preparadas são permitidas.
3. Executa `svn update`, confere seu resultado e obtém a revisão e a relação de arquivos versionados com **`svn info --xml --depth infinity .` após o update**. Essa consulta lê os metadados da working copy.
4. Executa `git fetch origin` e `git reset --soft refs/remotes/origin/main` (ou a branch configurada). O reset conserva arquivos e índice; o commit seguinte tem como pai a ponta remota recebida. Não compara históricos para bloquear branches à frente/divergentes. No remoto inicialmente vazio, omite o reset e faz a primeira publicação.
5. Executa `git add .` na raiz e retira do índice, com `git rm --cached`, todos os arquivos ausentes da relação SVN. A retirada é exibida e não apaga arquivos locais. Os caminhos são enviados por entrada padrão, com separação NUL e interpretação literal, para suportar muitos nomes, espaços, acentos e colchetes. Se houver diferenças, cria **`Sincronizacao SVN r<revisao>`**. Sem diferenças, não cria commit vazio.
6. Executa push normal para a branch configurada, sem força. Uma alteração concorrente no GitHub pode fazer esse push ser rejeitado; o script para e mantém os arquivos e o commit local.

**O SVN é a fonte da verdade desta operação.** O novo commit representa somente seus arquivos versionados, dentro do escopo Git. Um arquivo presente na pasta, mas ausente do controle SVN, sai do próximo estado Git mesmo que já tenha sido commitado/publicado. Sua cópia local permanece. Arquivos locais novos e não versionados pelo SVN também não são publicados. O próprio `.gitignore` deve estar no SVN; não existem exceções para conteúdo exclusivo do Git. Os commits remotos permanecem como ancestrais do novo commit. Commits exclusivamente locais podem sair da linha principal pelo reset soft, com arquivos preservados.

`ignore-on-commit` dispensa o bloqueio por alterações locais SVN; não cria uma exclusão Git. A inclusão segue o `.gitignore` e o rastreamento Git existente, limitada aos arquivos versionados pelo SVN. Uma regra de ignore não retira, por si só, um arquivo já rastreado no Git e ainda versionado no SVN.

O script não troca branches, não aplica arquivos Git sobre a pasta SVN, não resolve conflitos e não executa limpeza, revert, reset hard, merge, rebase ou push forçado. Não verifica autoria Git previamente. Não altera o clone de desenvolvimento, não compila, não entrega commit SVN e não obtém dependências.

## Operação git-svn

Use config/workflow.git-svn.exemplo.psd1 como modelo da configuração individual workflow.local.psd1 da ponte. Contém IntegrationPath, GitBranch, SvnUrlSuffix, SvnRef, WslDistribution e OpenSslConfig opcional. O modo git-svn não lê o arquivo de segredos SVN: utiliza a autenticação e a confiança do certificado preparadas manualmente no cliente Ubuntu. A autenticação GitHub continua sendo a do Git do Windows.

O remoto origin da ponte deve apontar para o repositório GitHub existente. A configuração svn-remote continua apontando para o SVN. O script exige uma origem SVN e confere URL e mapeamento de SvnRef antes de receber revisões. Não inicializa uma ponte nem importa o histórico completo.

1. Identifica e valida a própria integração, seus metadados e a disponibilidade do git-svn na distribuição configurada.
2. Executa git svn fetch pelo WSL. Recebe revisões nos metadados, sem checkout/rebase, sem trocar a branch ativa e sem alterar os arquivos locais. Usa a referência SVN recebida como fonte do conteúdo, inclusive se houver arquivos locais novos ou modificados; eles são preservados e não publicados.
3. Obtém a main do GitHub num cache Git privado dentro de .git/hwdesktop-sync/github.git e cria uma preparação temporária independente. Os dois históricos não são unidos por merge.
4. Lê os caminhos versionados da revisão SVN, aplica o .gitignore dessa revisão e exporta somente os blobs selecionados. O .gitignore da raiz é obrigatório. Um arquivo já rastreado no GitHub mantém a semântica normal de rastreamento do Git; adicionar uma regra de ignore não o remove automaticamente.
5. Prepara o índice a partir da main existente e aplica os atributos presentes nas áreas incluídas. A normalização automática de texto do destino Git usa core.autocrlf=true; regras .gitattributes específicas dos caminhos têm precedência. A configuração local * -text da linha SVN não é copiada para o destino. Binários seguem o tratamento do Git e seus atributos. Arquivos SVN fora do escopo Git não são materializados na preparação, exceto pequenos arquivos .gitignore usados na seleção.
6. Cria Sincronizacao SVN r<revisao> somente se houver diferenças e publica por push normal. O novo commit descende da main GitHub recebida; nenhum commit do histórico publicado é reescrito.

A branch atual e a árvore de arquivos da ponte podem continuar exibindo sua revisão anterior: fetch atualiza a referência SVN, não o checkout. A publicação é baseada nessa referência recebida. Não confundir a branch interna com a main compartilhada no GitHub.

A configuração OpenSslConfig aponta somente para um perfil já preparado pelo responsável, convertido para caminho WSL e utilizado no processo git-svn. O script não muda a configuração global do Ubuntu, não desativa a validação de certificado e não aceita certificados automaticamente. Prompts inesperados de certificado/autenticação são recusados por um helper local sem credenciais, evitando espera indefinida; prepare ou renove a autenticação manualmente no WSL antes de repetir.

O cache e os registros ficam sob .git, fora do versionamento. last-sync.json registra revisão/commit SVN e pai/commit GitHub publicados. A preparação temporária é removida após sucesso. Em rejeição de push, mantém o repositório temporário e informa seu caminho, com o commit preservado para revisão. Não faz troca automática para o SVN tradicional; a alternativa é executar a entrada comum na outra pasta de integração.

Esta operação é somente SVN → GitHub. A entrega GitHub → SVN permanece uma etapa posterior, a implementar com os dois modos. Não executa dcommit, commit SVN, build ou alterações nos clones de trabalho.

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

## Integrar demanda

Depois de concluir os commits da demanda, execute a sincronização no diretório de integração. Em seguida, no clone de trabalho, abra **Integrar demanda** no menu ou execute:

~~~powershell
.\_automation\workflow\merge-demand.ps1
# Informar uma branch local explicitamente, inclusive quando já estiver na main:
.\_automation\workflow\merge-demand.ps1 -Branch 'nome-da-demanda'
~~~

Sem parâmetro, usa a branch atual como demanda e guarda seu nome antes de selecionar a principal. Se já estiver na main, solicita o nome da demanda; Enter vazio cancela. Com entrada redirecionada, informe -Branch quando estiver na main. O alvo padrão é o clone do próprio script, independentemente do terminal. Aceita -WorkPath para indicar outro clone naquela execução; pastas SVN são recusadas. Não lê segredos nem exige IntegrationPath.

A configuração pessoal é opcional: utiliza apenas GitBranch de config/workflow.local.psd1, com padrão main. Também aceita -ConfigPath explícito; arquivo explícito ausente ou GitBranch vazio provoca erro. Nenhuma configuração pessoal é criada ou alterada.

O comando:

1. Confere raiz Git, remoto origin, branch da demanda local, main e ausência de operação Git em andamento. Mudanças em arquivos rastreados, índice preparado e arquivos novos não ignorados bloqueiam antes de trocar de branch.
2. Seleciona a main. Se ela tiver commits ausentes da referência origin/main conhecida pelo clone, interrompe antes do pull. Os commits locais da demanda são permitidos e não precisam estar publicados.
3. Executa git pull --ff-only origin main, sem fetch separado, sem rebase ou autostash. Em erro, interrompe antes do merge. Reconferir a main contra FETCH_HEAD impede que o pull permita uma main ainda à frente da base efetivamente recebida. A referência usada antes do pull é a última conhecida localmente; ela não é uma consulta atual ao servidor.
4. Confere novamente o worktree e a ponta da demanda. Faz git merge --no-edit, permitindo fast-forward ou criando um commit de merge quando necessário. As saídas Git são preservadas.
5. Informa que o resultado está na main local e deve ser revisado e validado antes da publicação.

O script não verifica se o SVN foi sincronizado recentemente: recebe a base publicada em origin. A sincronização continua sendo uma etapa explícita anterior.

Em conflito, encerra com código 1 e mantém o merge em andamento na main para resolução, validação e conclusão do commit pelas ferramentas habituais. Não execute novamente para concluir esse merge: uma operação já em andamento é motivo de parada. Após falha do pull ou bloqueio por commits pendentes, a main pode permanecer selecionada; o diagnóstico informa o estado alcançado. Não há reset, stash, limpeza ou rollback automático.

A branch da demanda permanece disponível. Não executa SVN, build, push ou exclusão de branches. Depois de um merge bem-sucedido, a main contém a entrega local ainda não publicada; uma nova execução será bloqueada pela checagem de commits pendentes até que você avalie e publique o resultado.

Códigos de saída: 0 para sucesso/cancelamento pelo nome vazio; 1 para erro. Testes no arquivo único: .\_automation\tests\verify.ps1 -Group Merge.

## Testes isolados

Todos os testes estão em `_automation/tests/verify.ps1`. Sem parâmetros, executa a suíte completa; `-Group Sync` seleciona a sincronização e `-Group Start` seleciona o início de demanda, no mesmo arquivo. Usa clones e remoto Git locais temporários e SVN simulado. O grupo SyncGitSvn usa uma base pequena com Git real e transporte WSL/SVN simulado, cobrindo atributos, filtros, histórico e falhas. O grupo Dependencies cobre empacotamento e preparação, usando pacotes e transporte simulados em pastas temporárias. Não utiliza configurações pessoais, segredos, servidor SVN, GitHub ou Nextcloud reais.


## Entregar ao SVN

Execute na raiz da integração que fez a última sincronização:

~~~powershell
.\_automation\workflow\deliver-svn.ps1 -Message 'Entrega da demanda'
# Depois de conferir a preparação:
.\_automation\workflow\deliver-svn.ps1 -Commit
~~~

O menu **Entregar ao SVN** executa somente a preparação. [Guia operacional completo](GUIA-OPERACIONAL.md): sequência da demanda, commit Git, push GitHub, confirmação SVN e tratamento de falhas.

A entrada pública confere IntegrationPath e a origem do próprio script. Identifica o modo pelos mesmos metadados da sincronização e chama svn/deliver-svn.ps1 ou git-svn/deliver-svn.ps1. Delivery.Common.ps1 contém apenas as funções internas compartilhadas.

No SVN tradicional, exige main e Git limpo, valida alterações SVN, recebe a main remota com um fetch e fast-forward sobre a ponta capturada. Agenda apenas arquivos recebidos e seus diretórios pais. A confirmação usa svn commit --depth empty com uma lista explícita de arquivos/diretórios; mudanças locais fora desses alvos não entram no commit. Entradas ignore-on-commit não são removidas da lista de proteção: se um alvo da entrega estiver nela, a preparação/confirmação interrompe. O arquivo --targets usa a página de código do cliente Windows; nomes não representáveis causam parada explícita.

No git-svn, exige last-sync.json da sincronização desta ponte e main descendente da base GitHub registrada. Não materializa a árvore SVN inteira. Aplica somente o delta GitHub sobre os objetos da árvore SVN, preservando as outras áreas. Para os arquivos textuais existentes, mantém os terminadores das linhas inalteradas e o padrão local nas linhas modificadas, inclusive em arquivos mistos. Binários marcados -text ou com NUL não sofrem conversão. Arquivos novos seguem eol explícito do caminho; sem regra, conservam os bytes Git. Encoding ANSI/UTF-8 é preservado sem recodificação.

Cria uma referência privada codex/svn-delivery/<id> para revisão, sem alterar branch/checkout. A confirmação usa git svn commit-diff, base numérica SVN e URL já conferidas. Não faz dcommit, rebase ou push GitHub. A autenticação e o perfil OpenSSL seguem o mesmo modelo da sincronização git-svn, restrito ao processo.

O registro .git/hwdesktop-delivery/pending.json mantém a ponta GitHub, base SVN, mensagem, alvos/commit privado e estado. Uma entrega pendente bloqueia sincronização. Repetir a preparação mostra a mesma entrega. Uma falha durante o envio passa para uncertain e impede repetição automática, pois o servidor pode ter aceitado o commit antes da queda da comunicação. Entregas confirmadas são arquivadas quando uma nova preparação começa. Confira o procedimento do guia antes de alterar um registro.

Teste específico no arquivo único: .\_automation\tests\verify.ps1 -Group Delivery. Usa Git e SVN reais apenas em repositórios locais temporários, mais git-svn do Ubuntu-24.04 para a confirmação local. Não usa servidores ou credenciais reais.


### Credenciais SVN no modo git-svn

Configure SecretsFile = 'segredos.md' no workflow.local.psd1 da integração. O caminho é relativo à pasta da configuração; também pode ser absoluto. O arquivo pessoal deve conter SVN_USER e SVN_PASS preenchidos. O exemplo git-svn já inclui essa opção.

Sincronização e entrega usam essas credenciais pelo GIT_ASKPASS do git-svn. O helper gerado contém apenas código e lê o arquivo pessoal no momento da autenticação. A senha não é embutida em argumentos, variáveis de ambiente ou outro arquivo; segue apenas pela resposta privada do prompt. No fetch, o comando informa o usuário explicitamente e utiliza --no-auth-cache. Na entrega, commit-diff usa os prompts suportados pelo cliente; não aceita essas duas opções. O cache existente e a política de armazenamento do cliente podem continuar participando da autenticação.

Prompts de certificado e outros prompts desconhecidos não recebem a senha. A confiança do certificado continua sendo preparada manualmente. Configuração OpenSslConfig e opções TLS continuam restritas ao processo.

Sem SecretsFile explícito, instalações anteriores continuam usando o cache WSL, sem mudança automática da configuração pessoal. Quando SecretsFile é informado e uma chave está vazia/ausente, o script interrompe antes de acessar o SVN, indicando o campo a preencher. A configuração pessoal da ponte em uso foi ajustada para utilizar seu próprio segredos.md.

Teste direcionado: verify.ps1 -Group GitSvnAuth. Usa credenciais fictícias e chamadas locais do Git/Perl; não acessa SVN ou GitHub.
