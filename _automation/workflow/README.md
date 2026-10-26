# Sincronização da integração

Requer PowerShell 7.5+, Git e SVN no PATH. Abra **Sincronizar integração** no menu ou execute:

```powershell
pwsh -NoLogo -NoProfile -File D:\Hw\ERP-Master\_automation\workflow\sync-integration.ps1
# Outra configuração pessoal:
.\_automation\workflow\sync-integration.ps1 -ConfigPath 'D:\minhas-configuracoes\workflow.local.psd1'
```

## Configuração individual

O modelo é `config/workflow.exemplo.psd1`. A configuração de uso é `config/workflow.local.psd1`, excluída do Git. Caminhos relativos são resolvidos a partir da pasta dessa configuração. `WorkPath` fica reservado às próximas etapas e não é utilizado aqui.

`SecretsFile` aponta para o arquivo individual existente, com `SVN_USER=...` e `SVN_PASS=...`, uma chave por linha. O script não altera esse arquivo nem verifica suas regras de exclusão. As credenciais SVN são passadas ao cliente, sem impressão da senha. O cliente SVN instalado recebe a senha como argumento do processo; ela pode ser inspecionada por ferramentas locais com acesso ao processo. A autenticação Git é a já configurada na máquina; não há usuário/senha Git neste arquivo.

## Operação

1. Consulta `git --version` e `svn --version`, confere raiz Git, branch configurada, URL SVN e existência de `origin`.
2. Interrompe diante de operação Git em andamento, conflito, índice Git previamente preparado ou mudanças locais SVN fora da changelist `ignore-on-commit`. Conflitos nessa changelist também interrompem. Diferenças Git não preparadas são permitidas.
3. Executa `svn update`, confere seu resultado e obtém a revisão e a relação de arquivos versionados com **`svn info --xml --depth infinity .` após o update**. Essa consulta lê os metadados da working copy.
4. Executa `git fetch origin` e `git reset --soft refs/remotes/origin/main` (ou a branch configurada). O reset conserva arquivos e índice; o commit seguinte tem como pai a ponta remota recebida. Não compara históricos para bloquear branches à frente/divergentes. No remoto inicialmente vazio, omite o reset e faz a primeira publicação.
5. Executa `git add .` na raiz e retira do índice, com `git rm --cached`, todos os arquivos ausentes da relação SVN. A retirada é exibida e não apaga arquivos locais. Os caminhos são enviados por entrada padrão, com separação NUL e interpretação literal, para suportar muitos nomes, espaços, acentos e colchetes. Se houver diferenças, cria **`Sincronizacao SVN r<revisao>`**. Sem diferenças, não cria commit vazio.
6. Executa push normal para a branch configurada, sem força. Uma alteração concorrente no GitHub pode fazer esse push ser rejeitado; o script para e mantém os arquivos e o commit local.

**O SVN é a fonte da verdade desta operação.** O novo commit representa somente seus arquivos versionados, dentro do escopo Git. Um arquivo presente na pasta, mas ausente do controle SVN, sai do próximo estado Git mesmo que já tenha sido commitado/publicado. Sua cópia local permanece. Arquivos locais novos e não versionados pelo SVN também não são publicados. O próprio `.gitignore` deve estar no SVN; não existem exceções para conteúdo exclusivo do Git. Os commits remotos permanecem como ancestrais do novo commit. Commits exclusivamente locais podem sair da linha principal pelo reset soft, com arquivos preservados.

`ignore-on-commit` dispensa o bloqueio por alterações locais SVN; não cria uma exclusão Git. A inclusão segue o `.gitignore` e o rastreamento Git existente, limitada aos arquivos versionados pelo SVN. Uma regra de ignore não retira, por si só, um arquivo já rastreado no Git e ainda versionado no SVN.

O script não troca branches, não aplica arquivos Git sobre a pasta SVN, não resolve conflitos e não executa limpeza, revert, reset hard, merge, rebase ou push forçado. Não verifica autoria Git previamente. Não altera o clone de desenvolvimento, não compila, não entrega commit SVN e não obtém dependências.

## Testes isolados

`tests/verify.ps1` usa repositórios Git temporários, com remoto local e SVN simulado. Não utiliza a configuração pessoal, os segredos ou os remotos reais do ERP.
