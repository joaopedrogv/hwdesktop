# Operação do fluxo SVN / GitHub

Este guia descreve o ciclo com os scripts atuais. Os comandos são para PowerShell 7.5+, no Windows. Cada clone tem suas opções pessoais; apenas a integração conhece IntegrationPath.

## O que cada envio faz

| Operação | Resultado |
| --- | --- |
| git commit | Registra o trabalho no Git local. |
| git push origin <branch> | Envia os commits ao GitHub. Não modifica o SVN. |
| sync-integration.ps1 | Recebe o SVN e publica seu recorte na main do GitHub. |
| deliver-svn.ps1 | Prepara a diferença publicada na main para entrega ao SVN. |
| deliver-svn.ps1 -Commit | Confirma a preparação e cria uma revisão no servidor SVN. |

No modo tradicional, a última operação usa svn commit. No modo git-svn, usa git svn commit-diff sobre a base e o commit privado preparados pelo script. Você não precisa executar dcommit manualmente neste fluxo.

git svn dcommit também envia commits ao SVN, mas trabalha sobre a linha git-svn e pode reescrever seus commits após o envio. Não o execute na main ou nas branches compartilhadas do GitHub. A implementação usa commit-diff para entregar a diferença entre dois estados sem trocar o checkout da ponte nem reescrever o histórico GitHub. [Referência oficial](https://git-scm.com/docs/git-svn#Documentation/git-svn.txt-commit-diff).

## Primeira utilização desta implementação

O código foi desenvolvido no clone D:\Hw\githw\hwdesktop, na branch criacao-binarios. Um commit local, sozinho, ainda não está no GitHub nem no SVN.

1. Confira o commit local e suas alterações. Você pode publicar a branch como cópia remota com git push origin criacao-binarios. Isso ainda não entrega a main nem o SVN.
2. Na ponte D:\Hw\hwdesktop-integration, confira sua configuração pessoal e execute a sincronização abaixo. Isso receberá as revisões SVN posteriores a r19050.
3. No clone, integre criacao-binarios à main com merge-demand.ps1, valide o resultado e publique a main.
4. Na mesma ponte, prepare a entrega, confira o resumo e confirme com -Commit.

A ponte recebeu cópias de bootstrap dos scripts. Sua branch/checkout SVN pode continuar na revisão inicial, porque a sincronização lê a referência SVN atualizada sem fazer checkout. Se a implementação dos scripts mudar, atualize essas cópias a partir do código aprovado antes de utilizá-las. O SVN tradicional mantém sua própria cópia versionada, atualizada por svn update.

A configuração git-svn parte de _automation/config/workflow.git-svn.exemplo.psd1. A tradicional parte de workflow.exemplo.psd1. Copie apenas para o arquivo pessoal workflow.local.psd1 de cada integração; preserve segredos e configurações existentes. No modo git-svn, configure SecretsFile no arquivo pessoal e preencha SVN_USER e SVN_PASS no segredos.md indicado. Sem essa opção explícita, utiliza o cache WSL anterior. O certificado deve estar previamente conferido. OpenSslConfig é opcional e restrito ao processo.

## Ciclo de uma demanda

### 1. Atualizar a base a partir do SVN

Na integração escolhida:

~~~powershell
Set-Location 'D:\Hw\hwdesktop-integration'
.\_automation\workflow\sync-integration.ps1
~~~

Para usar a alternativa tradicional, execute o mesmo script da própria pasta D:\Hw\ERP-Master, quando ela já tiver recebido a implementação atualizada. Não há troca automática entre pastas em caso de erro.

O script faz o envio GitHub da sincronização. Não é necessário executar outro git commit ou git push nessa etapa.

### 2. Criar e desenvolver a demanda no clone

~~~powershell
Set-Location 'D:\Hw\githw\hwdesktop'
.\_automation\workflow\start-demand.ps1 -Branch 'nome-da-demanda'
.\_automation\workflow\prepare-dependencies.ps1

# Após editar e conferir os arquivos:
git status
git add .
git commit -m 'Descrição do trabalho'
~~~

Repita os commits conforme necessário. git add . inclui o diretório atual e seus descendentes; estes exemplos pressupõem a raiz do clone. Publicar a branch de trabalho é opcional para a integração local, mas permite guardá-la e compartilhá-la no GitHub:

~~~powershell
git push -u origin nome-da-demanda
~~~

### 3. Sincronizar novamente antes do merge

Volte à integração e repita sync-integration.ps1. O SVN volta a determinar a base publicada na main. Não inicie uma sincronização enquanto houver entrega SVN pendente.

### 4. Fazer merge, validar e publicar a main

No clone:

~~~powershell
Set-Location 'D:\Hw\githw\hwdesktop'
.\_automation\workflow\merge-demand.ps1 -Branch 'nome-da-demanda'

# Confira, compile e valide o resultado antes de publicar.
git status
git push origin main
~~~

O merge pode ser fast-forward e não precisar de um commit adicional. Se houver conflito, resolva no clone, prepare os arquivos resolvidos com git add e conclua com git commit. O script mantém o merge em andamento para essa resolução.

### 5. Preparar e confirmar a entrega SVN

Na MESMA integração que fez a última sincronização:

~~~powershell
Set-Location 'D:\Hw\hwdesktop-integration'
.\_automation\workflow\deliver-svn.ps1 -Message 'Entrega da demanda: descrição'
~~~

O item **Entregar ao SVN** do menu executa apenas esta preparação. Não envia ao SVN.

- Modo git-svn: informa um commit privado e a base SVN. Confira com git diff --stat <base> <entrega> e git diff <base> <entrega>. Os dois identificadores aparecem na saída. A branch e os arquivos da ponte permanecem preservados.
- Modo SVN tradicional: atualiza a main local somente por fast-forward e agenda as adições/exclusões recebidas. Confira o status dos alvos exibido pelo script e use TortoiseSVN ou svn diff <alvo> para os detalhes. As alterações ficam na working copy para revisão.

Depois da conferência:

~~~powershell
.\_automation\workflow\deliver-svn.ps1 -Commit
~~~

Isso cria UMA revisão SVN para a diferença recebida. O script imprime o número da revisão. Não execute git commit ou dcommit adicional na integração. A confirmação usa a mensagem definida na preparação.

A próxima demanda começa por uma nova sincronização SVN → GitHub. Isso incorpora a revisão da entrega e eventuais commits de outros desenvolvedores.

## Quando o script interromper

- **Alterações locais ou merge em andamento:** avalie e conclua pelas ferramentas habituais. Não há stash, reset, revert ou resolução automática.
- **main GitHub sem a base esperada:** não há force push. Confira se foi utilizada a mesma integração e se o ciclo de sincronização/merge foi respeitado.
- **Concorrência no SVN:** o commit pode ser rejeitado se alguém alterou os mesmos caminhos. No modo tradicional, faça svn update e resolva/valide pela rotina habitual. Se isso modificar o conteúdo recebido, não force a confirmação automática que exige Git limpo; conclua o commit no TortoiseSVN e registre a entrega como concluída conforme abaixo.
- **Falha de envio ou estado uncertain/publishing:** não repita o commit imediatamente. Consulte o log SVN procurando o Delivery-ID exibido; a comunicação pode ter falhado depois de o servidor aceitar o commit.
- **Modo git-svn com base SVN defasada e conflito:** preserve a branch da demanda e o commit privado mostrado. Após verificar que o SVN não recebeu a entrega, arquive o registro pendente, sincronize novamente, reconcilie a main no clone e prepare uma nova entrega.
- **Nome incompatível com a página de código do SVN Windows antigo:** o script interrompe a operação com diagnóstico. Use o cliente visual para esse caso ou atualize o cliente; o modo git-svn não usa o arquivo --targets do Windows.

O registro está em .git/hwdesktop-delivery/pending.json. Entregas anteriores confirmadas são arquivadas nessa pasta. Registros incertos bloqueiam nova publicação e a sincronização para evitar duplicidade ou sobrescrita da demanda.

Somente após conferir o log:
- Se a entrega foi aceita ou concluída manualmente, registre status = "delivered" e resultRevision = "<revisão>" no JSON. Guarde o Delivery-ID.
- Se o servidor definitivamente NÃO recebeu o commit, e a preparação continua válida e sem conflitos, altere status para "prepared" para permitir uma nova confirmação.
- Para abandonar uma preparação que não foi enviada, preserve uma cópia do JSON e retire pending.json da pasta. No modo tradicional isso não desfaz os arquivos nem o agendamento SVN; resolva a working copy antes de sincronizar. No git-svn o commit privado continua disponível.

Não remova um registro incerto sem conferir o servidor. Não há repetição ou cancelamento automático.

## Validação dos scripts

Os testes ficam em um único arquivo:

~~~powershell
.\_automation\tests\verify.ps1 -Group Delivery
~~~

Esse grupo cria repositórios Git e SVN temporários e pequenos. Usa svnadmin/svnlook do Windows e, para o modo git-svn, Ubuntu-24.04 com git-svn. Não lê seus segredos nem acessa SVN, GitHub ou Nextcloud reais.
