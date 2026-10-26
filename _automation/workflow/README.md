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

O modelo é `config/workflow.exemplo.psd1`. A configuração de uso é `config/workflow.local.psd1`, excluída do Git. Caminhos relativos são resolvidos a partir da pasta dessa configuração. `WorkPath` não é utilizado pela sincronização; deve apontar para o clone de desenvolvimento existente ao usar `start-demand.ps1`.

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
# Também aceita outra configuração pessoal:
.\_automation\workflow\start-demand.ps1 -Branch 'nome-da-demanda' -ConfigPath 'D:\minhas-configuracoes\workflow.local.psd1'
```

Preencha `WorkPath` na configuração pessoal com o clone Git de desenvolvimento, diferente de `IntegrationPath`. O comando não cria o clone. Usa somente `WorkPath`, `IntegrationPath` e `GitBranch`; não lê segredos nem executa SVN.

Sem `-Branch`, solicita o nome completo no terminal. Enter vazio cancela antes de qualquer operação Git. Em execução com entrada redirecionada, informe o parâmetro explicitamente.

O comando:

1. Confere `git --version`, raiz Git, ausência de alterações pendentes e operações em andamento, nome válido e ainda não existente localmente, branch principal local e remoto `origin`.
2. Executa `git fetch origin`; rejeita nome já existente no remoto e interrompe se a main local tiver commits ausentes da main remota, inclusive em caso de divergência.
3. Executa `git switch main` e atualização por `git merge --ff-only` até o commit remoto capturado no fetch. Não cria commit de merge. Os arquivos são conferidos novamente antes da troca para evitar carregar mudanças feitas durante o fetch.
4. Cria e seleciona a nova branch com `git switch --no-track -c <nome>`. Informa pasta, branch e commit da base.

Arquivos não rastreados e não ignorados bloqueiam. Arquivos ignorados, como binários locais, permanecem; se uma troca ou atualização precisasse sobrescrevê-los, ela para com erro. Para isso, as chamadas utilizam `--no-overwrite-ignore`. A atualização também desabilita autostash, preservando a regra de não guardar ou retirar mudanças automaticamente.

Não publica a branch, não cria commits, não executa reset, stash, limpeza, exclusão de branches ou preparação de dependências. A main precisa alcançar a base publicada somente por fast-forward. Branch anterior com trabalho commitado permanece disponível. Branch de demanda existente é motivo de parada, não de retomada automática.

Em falha, informa a etapa e a última operação concluída. Se a main já tiver sido selecionada ou atualizada, ela permanece nesse estado; não há rollback automático. Código de saída: `0` para sucesso/cancelamento pelo nome vazio, `1` para erro.

## Testes isolados

`tests/verify.ps1` usa repositórios Git temporários, com remoto local e SVN simulado. Não utiliza a configuração pessoal, os segredos ou os remotos reais do ERP.

`tests/verify-start-demand.ps1` usa clones e remoto Git locais temporários. Testa início de demanda, preservação de commits e arquivos, validações e falhas. Não utiliza a configuração pessoal nem acessa SVN ou GitHub.
