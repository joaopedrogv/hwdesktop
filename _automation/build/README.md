# Comandos independentes de compilação e implantação

Requerem PowerShell 7.5+. Abra `..\menu.bat` e escolha **Build / Deploy** ou execute cada PS1 diretamente. Não carregue estes arquivos por dot-sourcing: eles são pontos de entrada e encerram com código `0` (conclusão/cancelamento/simulação) ou `1` (falha).

| Comando | Comportamento |
| --- | --- |
| `build-all.ps1` | Compila o catálogo completo; faz limpeza geral antes, como o BAT atual. |
| `build-select.ps1` | Compila os pacotes escolhidos, sem limpeza geral; usa a ordem do catálogo. |
| `build-reestrutura.ps1` | Usa `reestrutura-params.txt`; mantém a limpeza geral atual antes de compilar. |
| `clean.ps1` | Remove DCUs do primeiro nível de `dcu` e os DCPs/BPLs do catálogo geral. |
| `deploy-all.ps1` | Copia as BPLs disponíveis do catálogo para o destino indicado ou configurado. |
| `build-and-deploy.ps1` | Executa compilação completa e publica somente após seu sucesso. |

## Parâmetros opcionais para testes por linha de comando

Exemplos a partir da raiz do repositório:

```powershell
.\_automation\build\build-all.ps1 -WhatIf
.\_automation\build\build-select.ps1 -List
.\_automation\build\build-select.ps1 -Packages pkModern,pkAtivos -WhatIf
.\_automation\build\build-reestrutura.ps1 -WhatIf
.\_automation\build\clean.ps1 -WhatIf
.\_automation\build\deploy-all.ps1 -WhatIf
.\_automation\build\build-and-deploy.ps1 -WhatIf
```

`-WhatIf` continua disponível somente como parâmetro opcional do PowerShell; não há modo de visualização no menu nem pergunta para escolher modos. O parâmetro não compila, não remove arquivos, não executa a configuração BAT e não acessa/cria o destino de publicação. A seleção simulada exige `-Packages` para não abrir a janela gráfica.

## Execução real

```powershell
.\_automation\build\build-all.ps1 -NoClean
.\_automation\build\build-select.ps1
.\_automation\build\build-select.ps1 -Packages pkModern,pkAtivos
.\_automation\build\build-reestrutura.ps1 -NoClean
.\_automation\build\deploy-all.ps1 -Destination '\\servidor\distribuicao\versao\software'
```

- `-ProjectRoot` é opcional e identifica explicitamente outro checkout. Sem ele, a raiz é calculada pela localização do módulo; o diretório atual do terminal não determina o projeto.
- `-NoClean` preserva as saídas antes de `build-all`, `build-reestrutura` e `build-and-deploy`.
- `-NonInteractive` nos comandos de compilação fecha a entrada do núcleo BAT, evitando suas pausas/perguntas de erro. Em `build-select`, exige `-Packages`; em `build-and-deploy`, permite uma chamada automatizada sem a confirmação S/N. No uso normal, a confirmação do fluxo combinado e as interações do núcleo são preservadas.
- Para uso via `pwsh -File`, passe vários nomes como um único argumento separado por vírgulas, por exemplo `-Packages 'pkModern,pkAtivos'`.
- `-Confirm` permite solicitar a confirmação padrão do PowerShell nas operações; na combinação, compilação e publicação são etapas distintas.

## Compatibilidade com a implementação existente

Os novos pontos de entrada compartilham `..\core\Build.Automation.psm1`. A compilação de cada pacote ainda utiliza **`..\core\build-package.bat`**, preservando `SQL_RES`, manifesto, CRC e preparação de recursos. Mantenha esse BAT e o diretório `config` ao retirar futuramente os lançadores antigos da raiz. O núcleo necessita de `config\config-paths.bat` com os valores já usados no ambiente.

O formato de `package-list.txt` e `reestrutura-params.txt` permanece igual. Os caminhos do catálogo são resolvidos contra `_automation`, mantendo sua interpretação atual. As verificações de entrada falham antes da limpeza se não encontrarem a configuração, o núcleo ou um DPK esperado.

O destino padrão fica em **`config/deploy.psd1`**, na chave `Destination`, inicialmente com o valor da automação antiga. Atualize esse arquivo para mudar o padrão ou use **`-Destination`** para uma execução específica. A publicação mostra origem e destino sem acrescentar uma pergunta no menu. Os scripts e o módulo não fixam o caminho de rede. A cópia continua substituindo arquivos existentes. Como no script atual, BPLs ausentes são contadas e avisadas; são as falhas de cópia que produzem erro. Essa etapa não publica dependências no Nextcloud.

O núcleo BAT exige que os argumentos não contenham aspas, `%`, `!`, quebras de linha ou metacaracteres de comando; os novos chamadores recusam esses valores. Caminhos com espaços são suportados. Essa limitação pode ser removida numa futura substituição do núcleo.

Compilação completa/reestruturação usa um único processo CMD para chamar o núcleo na ordem do catálogo, com um arquivo temporário removido ao final. Os caminhos são enviados por variáveis de ambiente do processo para preservar espaços e caracteres Unicode. A seleção mantém suas mensagens e o resultado por pacote. A limpeza mostra cada `[DCP]`/`[BPL]` removido na ordem do catálogo; os DCUs continuam restritos ao primeiro nível. A publicação mostra cada cópia e o resumo; o fluxo combinado conserva etapas, horários, confirmação e mensagens de falha. Os títulos da compilação geral usam a cor normal; as cores do build selecionado seguem o PS1 original.

## Menu

O menu principal chama os mesmos PS1 em processos PowerShell separados e mantém a seleção vazia ao voltar. Não pergunta se deve limpar, não solicita destino e não oferece V/E/cancelar. São aplicados os padrões dos originais e a configuração de destino. A seleção de pacotes continua usando a janela gráfica existente. Uma falha retorna ao menu após a mensagem, sem encadear outra operação automaticamente. A pausa final fica no retorno ao menu, mantendo a saída visível.

## Verificação isolada

```powershell
.\_automation\tests\verify.ps1 -Group Build
```

Esse grupo do arquivo único de testes usa um projeto temporário, um compilador BAT simulado e cópia local. Não usa Delphi, a configuração real, os binários do ERP ou a rede. Testa seleção/ordem, encaminhamento `SQL_RES`, simulação, escopo da limpeza, cópia, interrupção em falha e preservação das mensagens principais de cada operação. Sem `-Group`, o mesmo arquivo executa todos os testes das automações. A compilação real e a publicação no ambiente da empresa continuam pendentes de avaliação do responsável.
