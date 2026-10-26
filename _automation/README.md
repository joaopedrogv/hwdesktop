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

As áreas de início/integração de demandas e dependências continuam **Planejadas**. A opção **Informações do ambiente** consulta somente os caminhos locais e a versão do PowerShell.

**Sincronizar integração**, segundo item do menu, atualiza a área de integração pelo SVN e publica esse estado no Git. Usa a configuração individual `config/workflow.local.psd1` e o arquivo de segredos existente. Instruções em [workflow/README.md](workflow/README.md).

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

O BAT também encaminha esses parâmetros. Os caminhos do projeto são calculados a partir da localização do script; não é necessário abrir o terminal na raiz. O modo interativo retorna erro se entrada ou saída estiver redirecionada; `-Preview` permite a visualização nesse cenário.

Códigos de saída: `0` para encerramento normal/preview, `1` para falha de execução do menu e `2` para pré-condição não atendida detectada pelo menu/lançador. Falhas do próprio PowerShell também são propagadas pelo BAT. Em caso de erro, o BAT mantém a mensagem visível até uma tecla ser pressionada.

## Manutenção

O BAT permanece um lançador, encaminhando argumentos e o código de saída. A apresentação e a navegação ficam no PS1. Não há módulos externos, reorganização do acervo antigo ou descoberta automática de scripts para execução. O menu usa processos PowerShell separados para que os códigos de saída dos comandos não encerrem a navegação.

A seleção usa texto branco e fundo azul escuro em RGB explícito, evitando depender das cores personalizadas da paleta do terminal. As bordas utilizam caracteres retos para compatibilidade de apresentação. Ajustes das chamadas devem preservar as mensagens e as interações dos scripts originais.

As rotinas futuras deverão ter sua própria validação de contexto e parâmetros, preservando a parada segura acordada para o fluxo. A escolha de uma opção no menu não substitui essas validações.
