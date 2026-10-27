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

- **Setas para cima/baixo**, **Home/End** ou **1 a 6** selecionam uma opção.
- **Enter** abre a opção selecionada. Ao abrir o menu, nenhuma opção está selecionada; Enter sozinho não inicia uma ação.
- **Esc**, **0** ou **Q** encerram o menu na tela inicial.
- Nos detalhes, **Esc/Backspace** retornam à tela inicial, novamente sem seleção; **0/Q** encerram.
- Não há execução automática por temporizador.
- **Ctrl+C** encerra o menu. Em janelas baixas, a apresentação fica compacta para preservar a navegação.

## Operações disponíveis

As áreas de integração de demandas e dependências continuam **Planejadas**. A opção **Informações do ambiente** consulta somente os caminhos locais e a versão do PowerShell.

**Sincronizar integração**, segundo item do menu, atualiza a área de integração pelo SVN e publica esse estado no Git. Usa a configuração individual `config/workflow.local.psd1` e o arquivo de segredos existente. Instruções em [workflow/README.md](workflow/README.md).

**Iniciar demanda**, terceiro item, solicita o nome da nova branch, atualiza a main e cria a branch no próprio clone Git. Não exige `IntegrationPath` ou `WorkPath` na configuração do clone. Pelo menu da integração, solicita qual clone preparar naquela execução; não mantém lista de clones na configuração. A sincronização SVN anterior permanece separada; este comando não publica a branch nem obtém binários. Instruções em [workflow/README.md](workflow/README.md#iniciar-demanda).

**Build / Deploy**, primeiro item do menu, abre seis comandos PS1 independentes em `build/`: compilar todos, compilar selecionados, compilar reestruturação, limpar, publicar e compilar/publicar. Selecionar uma ação e pressionar Enter chama seu comando diretamente. Não há pergunta adicional de limpeza, destino ou escolha de modo. As interações próprias dos originais permanecem: seleção gráfica de pacotes e confirmação S/N de compilar/publicar. O destino vem de `config/deploy.psd1`. Exemplos e parâmetros estão em [build/README.md](build/README.md).

Os scripts antigos foram movidos pelo responsável para `legados`. Os comandos de compilação compartilham `core/Build.Automation.psm1`, e a compilação de cada pacote ainda usa `core/build-package.bat`, preservando a lógica especial `SQL_RES`. O acesso ao Nextcloud permanece planejado. A proteção do menu não altera o comportamento dos BATs antigos abertos diretamente.

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

# Opcional: executar somente uma área (Build, Sync, Start ou Menu)
.\_automation\tests\verify.ps1 -Group Start
```

A suíte cobre compilação/publicação simuladas, sincronização, início de demanda, lançador e diagnósticos do menu. Usa somente pastas temporárias, remoto Git local e compilador/SVN simulados. Não lê configurações pessoais ou segredos, não compila o ERP nem publica na rede ou nos remotos reais. Os grupos ficam separados dentro do mesmo arquivo para evitar interferência entre suas funções auxiliares. O resultado mostra a contagem por área e o total; uma falha interrompe com código de saída 1.
