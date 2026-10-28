# Automações do HWDESKTOP

## Abrir o menu

No Explorer, selecione `menu.bat` e pressione Enter, ou dê duplo clique.
O BAT localiza o PowerShell moderno e abre `menu.ps1` sem carregar o perfil pessoal.

Requisitos:

- Windows e **PowerShell 7.5 ou superior**, disponível no `PATH` ou em `%ProgramFiles%\PowerShell\7\pwsh.exe`.
- Terminal interativo; Windows Terminal é recomendado para melhor apresentação.
- Permissão para executar scripts conforme a política da máquina. O lançador não altera essa política nem requer privilégios de administrador.

O Windows PowerShell 5.1 (`powershell.exe`) não atende ao requisito. O lançador usa `pwsh.exe` e mostra uma orientação se não o encontrar; não instala programas automaticamente.

## Navegação

- **Setas para cima/baixo**, **Home/End** ou **1 a 7** selecionam uma opção no menu principal. O submenu Build / Deploy tem seis opções.
- **Enter** abre a opção selecionada. Ao abrir o menu, nenhuma opção está selecionada; Enter sozinho não inicia uma ação.
- **Esc**, **0** ou **Q** encerram o menu na tela inicial.
- Nos detalhes, **Esc/Backspace** retornam à tela inicial, novamente sem seleção; **0/Q** encerram.
- Não há execução automática por temporizador.
- **Ctrl+C** encerra o menu. Em janelas baixas, a apresentação fica compacta para preservar a navegação.

## Operações disponíveis

| Item | Operação | Resultado |
| --- | --- | --- |
| 1 | Build / Deploy | Compilar, limpar ou publicar BPLs pelos seis comandos independentes. |
| 2 | Sincronizar integração | Atualizar a base SVN e publicar seu recorte na main do GitHub. |
| 3 | Iniciar demanda | Atualizar a main do clone e criar uma branch; entradas por janelas gráficas no menu. |
| 4 | Integrar demanda | Incorporar a branch na main local, para revisão e validação, sem push. |
| 5 | Preparar dependências | Obter os pacotes Nextcloud e aplicar build em dcp e runtime em bpl. |
| 6 | Entregar ao SVN | Preparar as mudanças da main publicada; commit SVN por chamada separada com -Commit. |
| 7 | Informações do ambiente | Consultar os caminhos locais e a versão do PowerShell, sem alterações. |

**Integrar demanda**, quarto item, atualiza a main do clone com pull por fast-forward e incorpora a branch da demanda. Não faz push: o resultado aguarda sua revisão e validação. Faça antes a sincronização no diretório de integração. Instruções em [workflow/README.md](workflow/README.md#integrar-demanda). A opção **Informações do ambiente** consulta somente os caminhos locais e a versão do PowerShell.

**Sincronizar integração**, segundo item do menu, atualiza a área de integração pelo SVN e publica esse estado no Git. Usa a configuração individual `config/workflow.local.psd1` e o arquivo de segredos existente. Instruções em [workflow/README.md](workflow/README.md).

**Iniciar demanda**, terceiro item, abre uma janela para informar o nome completo da nova branch, atualiza a main e cria a branch no próprio clone Git. Não exige `IntegrationPath` ou `WorkPath` na configuração do clone. Pelo menu da integração SVN, abre primeiro uma janela para selecionar o clone daquela execução; não mantém lista de clones na configuração. Cancelar a seleção, cancelar a entrada ou deixar o nome vazio encerra antes de qualquer operação Git. O menu inicia essa ação em modo STA para as janelas, evitando depender da digitação no terminal integrado do VS Code ou Antigravity. A chamada direta com `-WorkPath` e `-Branch` continua disponível, sem janelas. A sincronização SVN anterior permanece separada; este comando não publica a branch nem obtém binários. Instruções em [workflow/README.md](workflow/README.md#iniciar-demanda).

**Build / Deploy**, primeiro item do menu, abre seis comandos PS1 independentes em `build/`: compilar todos, compilar selecionados, compilar reestruturação, limpar, publicar e compilar/publicar. Selecionar uma ação e pressionar Enter chama seu comando diretamente. Não há pergunta adicional de limpeza, destino ou escolha de modo. As interações próprias dos originais permanecem: seleção gráfica de pacotes e confirmação S/N de compilar/publicar. O destino vem de `config/deploy.psd1`. Exemplos e parâmetros estão em [build/README.md](build/README.md).

Os scripts antigos foram movidos pelo responsável para `legados`. Os comandos de compilação compartilham `core/Build.Automation.psm1`, e a compilação de cada pacote ainda usa `core/build-package.bat`, preservando a lógica especial `SQL_RES`. **Preparar dependências**, quinto item, baixa do Nextcloud os pacotes necessários e aplica build em `dcp` e runtime em `bpl`, sobrescrevendo arquivos diferentes sem confirmação. Usa a configuração individual `config/dependencies.local.psd1` e as chaves NEXTCLOUD_USER/NEXTCLOUD_PASS do arquivo de segredos. Instruções em [workflow/README.md](workflow/README.md#preparar-dependências). A proteção do menu não altera o comportamento dos BATs antigos abertos diretamente.

**Entregar ao SVN**, sexto item, executa **somente a preparação**, na integração que fez a última sincronização, depois do merge, validação e publicação da main no GitHub. No SVN tradicional, recebe as mudanças e agenda inclusões e exclusões; no git-svn, prepara um commit privado para revisão, preservando o checkout da ponte.

Depois de conferir a preparação, confirme o envio separadamente na raiz da mesma integração:

```powershell
.\_automation\workflow\deliver-svn.ps1 -Commit
```

No modo tradicional, a confirmação utiliza `svn commit` com alvos explícitos; na ponte, `git svn commit-diff`. Essa chamada também atualiza o controle local da entrega. Se quiser definir a mensagem antes de preparar, utilize `deliver-svn.ps1 -Message 'Entrega da demanda'`. O menu não envia a entrega automaticamente.

Uma preparação pendente bloqueia nova sincronização; repetir a preparação mostra a mesma entrega. Um commit manual pelo TortoiseSVN não atualiza esse controle automaticamente. Para esse caso ou uma falha de comunicação durante o envio, consulte o [guia operacional](workflow/GUIA-OPERACIONAL.md) antes de retomar. [Detalhes da entrega nos dois modos](workflow/README.md#entregar-ao-svn).

## Sequência do workflow

1. Na integração, **Sincronizar integração**.
2. No clone, **Iniciar demanda**, **Preparar dependências** e desenvolver.
3. Antes do merge, sincronizar novamente a integração.
4. No clone, **Integrar demanda**, revisar, validar e publicar a main.
5. Na mesma integração, **Entregar ao SVN**, conferir e confirmar com `-Commit`.

Build / Deploy pode ser usado conforme a necessidade da demanda. O [guia operacional completo](workflow/GUIA-OPERACIONAL.md) apresenta os comandos e o tratamento de falhas.

## Opções de execução

```powershell
# Abrir o menu diretamente no PowerShell 7.5+
.\_automation\menu.ps1

# Visualizar a tela inicial sem aguardar teclas
pwsh -NoLogo -NoProfile -File .\_automation\menu.ps1 -Preview

# Modo sem cores e com bordas ASCII
.\_automation\menu.ps1 -NoColor

# Abrir diretamente o grupo de compilação
.\_automation\menu.ps1 -Section Build
```

O BAT também encaminha esses parâmetros. Quando aberto na própria pasta `_automation`, como acontece pelo Explorer, inicia o PowerShell na raiz do projeto ao qual esse BAT pertence. Chamadas a partir de outros diretórios preservam o diretório de origem. Para **Sincronizar integração**, utilize o menu da integração: a ação exige diretório atual igual a `IntegrationPath` e o script dessa integração. O BAT do WorkPath usa a raiz do próprio WorkPath, sem redirecionar para a integração; chamar o BAT da integração a partir de um terminal no WorkPath também continua sujeito ao bloqueio. As demais ações mantêm seus critérios próprios. O modo interativo retorna erro se entrada ou saída estiver redirecionada; `-Preview` permite a visualização nesse cenário.

Códigos de saída: `0` para encerramento normal/preview, `1` para falha de execução do menu e `2` para pré-condição não atendida detectada pelo menu/lançador. Falhas do próprio PowerShell também são propagadas pelo BAT. Em caso de erro, o BAT mantém a mensagem visível até uma tecla ser pressionada.

## Manutenção

O BAT permanece um lançador, encaminhando argumentos e o código de saída. A apresentação e a navegação ficam no PS1. Não há módulos externos, reorganização do acervo antigo ou descoberta automática de scripts para execução. O menu usa processos PowerShell separados para que os códigos de saída dos comandos não encerrem a navegação.

A seleção usa texto branco e fundo azul escuro em RGB explícito, evitando depender das cores personalizadas da paleta do terminal. As bordas utilizam caracteres retos para compatibilidade de apresentação. Ajustes das chamadas devem preservar as mensagens e as interações dos scripts originais.

Diagnósticos enviados pelos comandos ao menu aparecem em bloco separado, com título **ATENÇÃO — CONFIRA O MOTIVO ABAIXO**, separadores e texto amarelo. Etapa, motivo, arquivos e demais detalhes são preservados. Em `-NoColor`, o bloco mantém título e separadores sem aplicar cor ao diagnóstico. O código de saída continua sendo propagado.

As rotinas futuras deverão ter sua própria validação de contexto e parâmetros, preservando a parada segura acordada para o fluxo. A escolha de uma opção no menu não substitui essas validações.

## Testes

Todos os testes ficam em um único arquivo: **`tests/verify.ps1`**. Novas verificações devem ser acrescentadas nele, sem criar arquivos de teste por comando.

```powershell
# Executar todos os testes
.\_automation\tests\verify.ps1

# Opcional: executar somente uma área
.\_automation\tests\verify.ps1 -Group Start
```

A suíte cobre compilação/publicação simuladas, sincronização, início e merge de demandas, empacotamento e preparação de dependências, entrega, autenticação, codificação, lançador e diagnósticos do menu. Grupos disponíveis: `Build`, `Sync`, `SyncGitSvn`, `Start`, `Merge`, `Menu`, `Dependencies`, `Delivery`, `GitSvnAuth` e `ProcessEncoding`. Sem parâmetro, executa todos.

Usa ambientes temporários, remotos Git locais e serviços simulados; Delivery utiliza SVN local real e git-svn pelo WSL. Não lê configurações pessoais ou segredos, não compila o ERP nem publica na rede ou nos remotos reais. As entradas gráficas do início de demanda são simuladas nos testes; a apresentação no terminal do usuário requer sua avaliação. Os grupos ficam separados dentro do mesmo arquivo. O resultado mostra a contagem por área e o total; uma falha interrompe com código de saída 1.

## Modos de sincronização

A mesma entrada workflow/sync-integration.ps1 identifica SVN tradicional ou git-svn pelos metadados da integração. As implementações ficam separadas em workflow/svn e workflow/git-svn. O modo SVN permanece independente de WSL. O modo git-svn prepara uma publicação privada, respeitando filtros e atributos por caminho e preservando a linha SVN. Modelos individuais e comportamento em [workflow/README.md](workflow/README.md).

## Empacotar dependências

`dependencies/pack-dependencies.ps1` gera a estrutura local para publicação no Nextcloud a partir dos arquivos separados pelo responsável. Agrupa build e runtime/baseline em ZIPs e mantém runtime/internal por módulo e versão. Instruções em [dependencies/README.md](dependencies/README.md). Os testes estão no arquivo único, grupo `Dependencies`.

O fluxo completo, incluindo commit, push e entrega SVN, está em [workflow/GUIA-OPERACIONAL.md](workflow/GUIA-OPERACIONAL.md). A entrega está disponível no menu e pelo script workflow/deliver-svn.ps1; -Commit confirma uma preparação já conferida.
