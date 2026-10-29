# Handoff e guia de manutenção da arquitetura de IA

> Continuidade em 28/10/2026: o responsável incorporou este trabalho ao chat de
> [Contexto e decisões do HWDESKTOP](D:/Hw/ai-docs/hwdesktop/README.md). O
> [mapa de manutenção de IA no Modern](D:/Hw/ai-docs/hwdesktop/ferramentas-e-processos/ia-no-modern/README.md)
> referencia estas fontes e o handoff recebido. Este guia conserva o histórico de
> consolidação; o checklist apresenta as pendências, e `.ai/` permanece canônica
> para as orientações técnicas. Durante programação, siga a fronteira de leitura
> definida em `AGENTS.md`.

## Finalidade

Este documento permite retomar a manutenção da arquitetura de desenvolvimento
assistido por IA do Modern sem depender do histórico das conversas que a criaram.
Ele registra o desenho consolidado, indica as fontes autorizativas, explica como
alterar cada parte e separa estado permanente de arquivos locais gerados.

Este é um documento humano de apoio, escrito em português brasileiro. Ele não é
uma instrução canônica diretamente roteável e não substitui `AGENTS.md`, `.ai/` ou
os artefatos selecionados para uma tarefa.

## Distribuição vigente desde 29/10/2026

O trabalho começa pelo AGENTS.md da raiz do HWDESKTOP. .ai/ contém processo,
metadados, agentes e procedimentos comuns; Modern/AGENTS.md seleciona as regras,
contextos e Skills específicos em Modern/.ai/ para o escopo do módulo.
O setup está em _automation/ai/Sync-AIProfiles.ps1, suas fontes técnicas em
_automation/ai/tool-setup/ e a aplicação do Kilo está acessível no menu.
Os adapters e os novos runs ficam na raiz. Guias e evidências do Caso Gold
permanecem em Modern/docs/ia-assistida/. Os relatos datados abaixo são preservados
como histórico e não substituem as fontes vigentes.

## Resultado consolidado

O repositório possui uma arquitetura de instruções independente de ferramenta:

- `AGENTS.md` é a porta de entrada e o roteador do repositório;
- `.ai/` contém Rules, Context, Skills, Workflows, Commands e papéis de Agents;
- `docs/ia-assistida/` explica a arquitetura para desenvolvedores;
- `_automation/ai/tool-setup/` contém as fontes versionadas dos
  adapters de Kilo, AiderDesk e Codex;
- `_automation/ai/Sync-AIProfiles.ps1` instala, verifica, troca e remove os setups;
- `.agents/`, `.aider-desk/`, `.kilo/`, `.opencode/` e `.codex/` são diretórios
  locais ignorados pelo Git;
- Codex possui setup ativo gerado; OpenCode e Antigravity continuam como integrações
  não impeditivas a serem reconciliadas antes de receberem setup ativo.

O objetivo maior permanece permitir que diferentes ferramentas de IA trabalhem com
as mesmas regras, conhecimento, procedimentos e papéis, sem fazer de uma IDE,
provider ou modelo a fonte de verdade do projeto.

## Autoridade e idioma

A ordem operacional dentro do repositório é:

1. a hierarquia de instruções imposta pela ferramenta ativa;
2. o pedido, o escopo e as autorizações do desenvolvedor;
3. `AGENTS.md`, que define o roteamento do projeto;
4. os artefatos canônicos selecionados em `.ai/`;
5. adapters específicos da ferramenta, apenas como tradução técnica.

A documentação humana, os exemplos e o material pendente ficam fora dessa cadeia
operacional. Eles não fornecem Rules, Context, procedimentos, autorização ou
routing para programação.

Selecionar uma Command, Workflow, Skill ou Agent não amplia a autorização concedida
pelo desenvolvedor.

As instruções canônicas destinadas às IAs permanecem em inglês, de forma operacional
e enxuta. A documentação didática permanece em português brasileiro. Termos de
domínio, nomes legados e convenções Delphi seguem as regras próprias do projeto.

## Fronteira de contexto para programação

Durante programação normal, execução do Workflow de feature, uso de Commands ou
Skills e delegação entre Agents, a AI não carrega nem usa `docs/ia-assistida/`.
Essa restrição está centralizada em `AGENTS.md` e, portanto, alcança todos os papéis
e adapters sem precisar ser duplicada em seus cabeçalhos.

O diretório humano só entra no contexto quando o desenvolvedor solicita
explicitamente manutenção da documentação ou das fontes versionadas dos setups.
Executar uma operação já definida de setup não exige sua leitura: a Command
`manage-ai-tool-setup` chama diretamente `_automation/ai/Sync-AIProfiles.ps1`.

Os prompts e templates ativos de Kilo, AiderDesk e Codex devem ser verificados: todos
encaminham para `AGENTS.md` e `.ai/`, e nenhum encaminha para
`docs/ia-assistida/`.

O script possui uma dependência mecânica de
`_automation/ai/tool-setup/`, onde estão seus JSONs e templates. Essa
leitura é feita pelo PowerShell e não injeta a documentação humana no contexto do
modelo. Se no futuro o diretório `docs/ia-assistida/` precisar conter somente
documentos, essas fontes deverão ser movidas para um local técnico ainda a definir.

## Rota mínima para manutenção desta arquitetura

Esta seção se aplica somente quando o desenvolvedor pede manutenção da arquitetura
de IA, da documentação humana ou das fontes dos setups. Não usar este handoff como
contexto inicial para programação normal ou execução do Workflow de feature.

Para qualquer tarefa normal no repositório, a AI começa somente por `AGENTS.md` e
segue seu roteamento seletivo. Ela não deve carregar `docs/ia-assistida/`.

Para uma tarefa de manutenção desta arquitetura:

1. ler `AGENTS.md` completamente;
2. identificar o resultado solicitado e a autorização existente;
3. ler `.ai/metadata.md` quando for selecionar ou manter artefatos canônicos;
4. carregar todas as Rules aplicáveis, inclusive as marcadas com
   `always_apply: true`;
5. carregar somente o Context necessário;
6. ler completamente cada Workflow, Command, Skill ou Agent selecionado;
7. usar evidência do repositório em vez de inventar convenções.

Para manter especificamente esta arquitetura, começar por:

1. este documento;
2. `AGENTS.md`;
3. `.ai/metadata.md`;
4. `docs/ia-assistida/README.md`;
5. `docs/ia-assistida/pending-checklist.md`;
6. somente então os arquivos da categoria ou ferramenta afetada.

Para manter somente os setups de ferramentas, a leitura mínima é:

1. `.ai/commands/manage-ai-tool-setup.md`;
2. `_automation/ai/tool-setup/README.md`;
3. o manifesto da ferramenta em `_automation/ai/tool-setup/tools/<ferramenta>/`;
4. `_automation/ai/Sync-AIProfiles.ps1`;
5. o guia em `docs/ia-assistida/ferramentas/`.

## Mapa das fontes

| Local | Responsabilidade | Autoridade |
|---|---|---|
| `AGENTS.md` | entrada, categorias, routing e carregamento | canônica |
| `.ai/metadata.md` | formato e identidade dos artefatos roteáveis | canônica |
| `.ai/rules/` | restrições obrigatórias | canônica |
| `.ai/context/` | conhecimento comprovado do Modern | canônica quando selecionada |
| `.ai/skills/` | procedimentos especializados reutilizáveis | canônica quando selecionada |
| `.ai/workflows/` | sequência, gates e branches de operações maiores | canônica quando selecionada |
| `.ai/commands/` | pontos de entrada manuais e dispatch | canônica quando selecionada |
| `.ai/agents/` | papéis, protocolo e perfis portáteis | canônica quando selecionada |
| `docs/ia-assistida/pending-checklist.md` | pendências e histórico de decisões concluídas | controle de evolução |
| `docs/ia-assistida/` | explicação didática em português | apoio humano |
| `_automation/ai/tool-setup/` | fontes específicas de adapters suportados | fonte versionada de instalação |
| `_automation/ai/Sync-AIProfiles.ps1` | implementação do ciclo dos setups | automação canônica da operação |
| diretórios `.agents/` e das ferramentas | resultado instalado e estado local | gerado, nunca fonte de manutenção |
| `pendencias-de-integracao/` | adapters antigos ainda não reconciliados | evidência, não configuração ativa |

## Como escolher a categoria correta

Use uma Rule para uma obrigação ou proibição aplicável ao trabalho. Use Context para
conhecimento do projeto que ajuda uma decisão, mas não é um procedimento. Use Skill
para uma capacidade especializada, repetível e delimitada. Use Workflow para uma
operação genuinamente multietapa com gates ou branches. Use Command como ponto de
entrada estável que encaminha para uma Skill ou Workflow. Use Agent para definir uma
responsabilidade delegável com entradas, limites e saída.

Não transforme documentação explicativa em Rule. Não copie um procedimento de uma
Skill para um Agent. Não copie o Workflow para uma Command. Não coloque conhecimento
do Modern em adapters de ferramenta.

Todo artefato diretamente roteável deve possuir frontmatter com `name` e
`description` conforme `.ai/metadata.md`. O nome precisa ser globalmente único,
usar `kebab-case` e corresponder ao arquivo ou diretório da Skill. Somente Rules
podem declarar `always_apply` ou `applies_to`.

## Workflow de feature consolidado

O Workflow `.ai/workflows/erp-feature-implementation.md` aceita um pedido informal
ou um plano preparado. O caminho do pedido informal conduz:

```text
pedido informal
      ↓
discovery por pesquisa somente leitura
      ↓
plano obrigatório e modelo conceitual
      ↓
aprovação humana
      ↓
desenho técnico e schema físico, quando aplicável
      ↓
implementação incremental por Use Case
      ↓
testes do incremento e revisão independente
      ↓
branch opcional de UI
      ↓
validação final
      ↓
Ready for Release
```

Desde 29/10/2026, um plano preparado pode ser adotado como `feature-plan.md` após
conferência de cobertura pelo planner. Origem, versão e evidência de aprovação
ficam registradas no run. A aprovação explícita já existente vale para o escopo
inalterado; apenas lacunas, novas decisões ou mudanças materiais retornam ao
desenvolvedor. Com entradas suficientes, a conferência e o desenho técnico podem
ocorrer na mesma atribuição, sem repetir o planejamento. O protocolo canônico
preserva ownership, pesquisa por especialista e autorizações separadas.

O Workflow não realiza release, publicação, deployment, empacotamento, alteração de
versão ou incorporação da migration ao histórico de produção. Criar testes não
autoriza executá-los. `ERP.UnitTests` usa `delphi-test-runner` somente com
autorização explícita; integration tests exigem configuração e autorização próprias.

## Modelo operacional de Agents

Os cinco papéis canônicos são workflow-orchestrator, repository-researcher,
feature-planner, increment-implementer e increment-reviewer. O agente principal
assume a orquestração e executa as operações determinísticas prescritas; os
especialistas conservam pesquisa, planejamento, implementação e revisão.

No Kilo, os nomes locais são coordinator, planner, researcher, researcher-critical,
implementer, implementer-fast e reviewer. O implementer atende balanced-work e
quality-critical. A distinção por incremento permanece no protocolo, não no nome
do perfil. Os outros clientes conservam os perfis declarados em suas fontes.

Os perfis de execução portáteis são `fast-routine`, `balanced-work` e
`quality-critical`. Os requisitos ficam em `.ai/agents/execution-profiles.md`; os
modelos concretos são escolhas individuais em _automation/config/ai-models.local.json.

Em um Workflow orquestrado, delegar exige uma chamada nativa, explícita e observável
ao Agent nomeado exatamente uma vez por tentativa. O orquestrador não pode apenas
carregar o prompt ou a Skill e executar a responsabilidade no próprio contexto. Se
a ferramenta não suportar a delegação necessária, usar o modo manual supervisionado
de `.ai/agents/orchestration-protocol.md`.

## Estrutura dos setups de ferramentas

### Componentes

O componente `Shared` instala em `.agents/`:

- a ponte de routing em `.agents/rules/`;
- wrappers mínimos das Skills em `.agents/skills/`;
- adapters das Commands como Skills em `.agents/skills/`;
- o ponto de entrada do Workflow em `.agents/workflows/`.

Kilo, AiderDesk e Codex dependem de Shared. Remover apenas uma ferramenta não remove
`.agents/`. Remover `All` processa Kilo, AiderDesk, Codex e Shared nessa ordem. Remover
Shared isoladamente é recusado enquanto existir state instalado de uma dependente.

O Kilo recebe Agents e Commands em `.kilo/`. O AiderDesk recebe perfis, ordem,
Commands e wrappers de Skills em `.aider-desk/`. O Codex recebe Custom Agents TOML
em `.codex/agents/` e usa as Commands expostas como Skills compartilhadas. Os três
setups são descritos por
manifestos e usam o inventário comum de `agents.json`.

### Modelos e dados variáveis

Modelos concretos são individuais, em _automation/config/ai-models.local.json.
O exemplo versionado ai-models.exemplo.json, na mesma pasta, não contém escolhas
concretas. O gerador não usa catálogo compartilhado. Sem override, perfis do Kilo
são emitidos sem model, e subagentes herdam a escolha do principal.
IDs, ordem, presets, permissões e templates continuam nas fontes do setup.
projectDir é calculado a partir do checkout. Nomes locais antigos são aceitos
como aliases e os arquivos pessoais antigos continuam como fallback de leitura.

### Estados e ownership

Cada componente instalado grava `.modern-ai-setup.json` no próprio diretório. O
state registra os arquivos gerenciados e permite distinguir atualização, drift,
conflito e remoção segura.

O script não sobrescreve um arquivo conflitante sem ownership conhecido. Na
remoção, apaga arquivos do state e apenas os artefatos declarados explicitamente em
`disposablePaths`. Diretórios desconhecidos ou arquivos locais são preservados.

No Kilo, a allowlist descartável inclui os arquivos de runtime Node e
`node_modules`, que a extensão recria. No AiderDesk, extensões, tasks, históricos,
prompts ou outras configurações locais não pertencem ao setup gerenciado e são
preservados. A raiz de uma ferramenta só é apagada quando fica vazia.

O ciclo de remoção é idempotente: repetir `Remove` com states ausentes não deve
falhar. Coleções de caminhos gerenciados podem estar vazias.

### Comandos operacionais

```powershell
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Plan
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Apply
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Check
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Remove -WhatIf
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Remove
./_automation/ai/Sync-AIProfiles.ps1 -Tool AiderDesk -Action Switch
./_automation/ai/Sync-AIProfiles.ps1 -Tool All -Action Remove
```

O script exige PowerShell 7. `Plan` não modifica. `Apply` é idempotente. `Check`
retorna `2` quando encontra drift. Antes de uma mutação, usar `Plan` ou `-WhatIf`
conforme a operação. Depois de remover ou trocar a ferramenta ativa, reiniciá-la.

A mesma operação pode ser solicitada em linguagem natural por meio da Command
`manage-ai-tool-setup`, por exemplo: “Configure o setup do Kilo” ou “Remova todos os
setups”. A linguagem natural não amplia o escopo além da ferramenta e da ação
pedidas.

## Manutenção por cenário

### Alterar uma regra ou conhecimento do Modern

1. editar primeiro a Rule ou o Context em `.ai/`;
2. manter o texto operacional, verificável e sem conteúdo específico de ferramenta;
3. atualizar a explicação correspondente em `docs/ia-assistida/` quando a mudança
   afetar o entendimento do desenvolvedor;
4. revisar referências e metadata;
5. não editar os adapters gerados.

### Criar ou alterar uma Skill

1. manter o procedimento em `.ai/skills/<nome>/SKILL.md`;
2. respeitar metadata, escopo, entradas, saídas, autorizações e exclusões;
3. manter exemplos auxiliares em `references/` somente quando necessários;
4. atualizar o inventário humano de Skills;
5. executar `Apply` para regenerar wrappers das ferramentas instaladas;
6. conferir que o wrapper aponta para a Skill e não copia seu procedimento.

### Alterar um papel ou o Workflow

1. alterar a responsabilidade em `.ai/agents/` ou a orquestração em
   `.ai/workflows/`;
2. preservar separação entre orquestrador e especialistas;
3. atualizar templates somente quando a tradução técnica da ferramenta mudar;
4. atualizar `agents.json` quando nome, perfil, ID, ordem ou preset mudarem;
5. aplicar e verificar os setups instalados.

### Trocar um modelo

1. ajustar a configuração individual _automation/config/ai-models.local.json;
2. usar o exemplo versionado da pasta config como estrutura, sem catálogos de LLM;
3. manter modelos fora de templates, prompts canônicos e código do gerador;
4. executar Plan, Apply e Check para a ferramenta escolhida;
5. validar o resultado no uso da ferramenta e registrar dificuldades concretas.

### Adicionar suporte a uma ferramenta

1. confirmar por evidência como a ferramenta carrega Rules, Skills, Commands e
   Agents;
2. reconciliar os cinco papéis canônicos e suas permissões;
3. criar fontes mínimas em `_automation/ai/tool-setup/tools/<ferramenta>/`;
4. adicionar manifesto e renderer à automação;
5. documentar os campos da configuração individual sem fixar modelos compartilhados;
6. ignorar integralmente o destino local na raiz;
7. declarar `disposablePaths` somente para artefatos comprovadamente regeneráveis;
8. documentar instalação, limitações, delegação e remoção;
9. testar `Plan`, `Apply`, `Check`, `Remove`, repetição de `Remove` e conflitos;
10. só então retirar o status de pendente.

OpenCode possui material preliminar em
`docs/ia-assistida/pendencias-de-integracao/`. Esse material não deve ser copiado
diretamente para a raiz: pode conter modelos, permissões e formatos antigos. O
material preliminar do Codex também é histórico e foi substituído pelas fontes
ativas em `_automation/ai/tool-setup/tools/codex/`.

## Checklist de revisão após mudanças

- confirmar que a mudança ocorreu na fonte correta;
- confirmar que `.ai/` não recebeu detalhes de IDE, provider ou modelo;
- validar nomes e unicidade do metadata;
- verificar referências entre Commands, Workflows, Skills e Agents;
- confirmar que adapters continuam mínimos e sem conhecimento independente;
- validar JSONs e a sintaxe de `Sync-AIProfiles.ps1`;
- usar `Plan` antes de instalar e `Check` depois de aplicar;
- usar `-WhatIf` antes de remoções ou trocas;
- testar idempotência quando a lógica de lifecycle mudar;
- executar `git diff --check` e revisar `git status`;
- atualizar a documentação humana e o checklist quando houver decisão nova.

Builds ou testes Delphi não fazem parte da validação desta estrutura documental e
não devem ser executados sem a autorização correspondente.

## Pendências conhecidas

O estado autoritativo das pendências está em
`docs/ia-assistida/pending-checklist.md`. As linhas principais no encerramento
deste handoff são:

- piloto completo do Workflow no Kilo;
- validação dos nove perfis e da delegação real no AiderDesk;
- comparação operacional entre Kilo e AiderDesk;
- calibração posterior dos modelos por evidência;
- piloto operacional do Workflow completo no Codex;
- reconciliação e automação futura de OpenCode e Antigravity;
- estratégia de versionamento de fontes externas sincronizadas;
- execução real e calibração do Caso Gold por meio de `fiscal-calculos-update`;
- automação ainda não definida para `ERP.IntegrationTests`;
- validação final da arquitetura em uma feature real.

Não copiar esta lista para controlar execução. Atualizar somente o checklist de
evolução e manter itens concluídos na seção final, com a caixa marcada.

## Estado verificado no encerramento

Em 24 de agosto de 2026:

- o handoff e os ajustes de fronteira estavam versionados no commit `8212e70`, e o
  repositório estava limpo antes deste refinamento final;
- os commits de referência mais recentes eram `7c92497` para a distribuição dos
  setups, `18501d7` para a limpeza e integração dos diretórios de ferramenta e
  `91af57d` para a correção idempotente de coleção vazia;
- `Remove -Tool All` concluiu com exit code `0` e uma repetição imediata também
  concluiu com `0`;
- `.agents/` e `.kilo/` estavam ausentes após a remoção;
- `.aider-desk/` permanecia somente com extensões, tasks, históricos e outros dados
  locais deliberadamente não gerenciados;
- `.opencode/` e `.codex/` estavam ausentes;
- nenhum setup de Kilo ou AiderDesk estava instalado ao final daquela validação.
- `.ai/` não possuía caminhos ignorados; o checklist e `temporary/` estavam em
  `docs/ia-assistida/`, sendo `temporary/` integralmente ignorado.

Esse bloco é uma fotografia, não uma configuração desejada permanente. Para saber o
estado atual, verificar a existência dos states `.modern-ai-setup.json` ou executar
`Plan` e `Check` conforme a operação pretendida.

## Extensão posterior — Caso Gold do Fiscal.Calculos

Em 24 de agosto de 2026 foi adicionada a preparação canônica do Caso Gold e, em 25
de agosto, ela foi reconciliada com o pacote estruturado produzido pelo pipeline:

- Workflow `Modern/.ai/workflows/fiscal-calculos-update.md`;
- Command manual `Modern/.ai/commands/update-fiscal-calculos.md`;
- snapshots imutáveis por tag com `rtc-source-snapshots` e
  `Scripts/Fiscal.Calculos/Prepare-RTCSourceSnapshots.ps1`;
- validação e leitura seletiva de `implementation-evidence.json` com
  `rtc-implementation-evidence` e
  `Scripts/Fiscal.Calculos/Read-RTCImplementationEvidence.ps1`;
- automação autorizada de `Fiscal.Calculos.Tests` com
  `delphi-fiscal-calculos-test-runner` e
  `Tests/Automation/Invoke-FiscalCalculosTests.ps1`;
- adapters mínimos de Command para Kilo Code e AiderDesk nas fontes de setup;
- exposição das Commands como Skills e nove Custom Agents para Codex nas fontes de
  setup adicionadas posteriormente.

O guia humano detalhado é `docs/ia-assistida/caso-gold-fiscal-calculos.md`. A
pendência impeditiva restante é executar o intervalo real pelo Workflow, registrar
evidências e calibrar o processo. As automações Delphi não foram executadas durante
esta preparação porque compilação e testes exigem autorização separada.

Em 25 de agosto de 2026 foi criado `workflow-operator` para automatizar a validação
do pacote e a preparação dos snapshots sem ampliar as permissões do orquestrador.
Seus adapters locais usam `fast-routine`, não participam do coding, não executam
build ou testes e limitam a escrita aos efeitos canônicos em `.ai-runs/`.

Em 28 de agosto de 2026 a entrada do Caso Gold foi simplificada para exigir somente
as tags de origem e destino. A Skill `rtc-update-inputs` e
`Scripts/Fiscal.Calculos/Acquire-RTCUpdateInputs.ps1` passaram a obter dos dois
repositórios GitHub canônicos as tags e o pacote padronizado, fixando URLs, commits,
hashes e caminhos locais dentro do run. O operador possui rede somente para essa
aquisição Git de leitura; chamadas incompletas permanecem em `RECEIVED` e solicitam
as tags ausentes em português brasileiro.

O primeiro piloto dessa interface mostrou carregamento excessivo de Rules e Skills,
agrupamento indevido de várias ações em uma Task e interrupção do subagente por
confirmação técnica. O fluxo foi então restringido a contexto mínimo e a três
atribuições sequenciais de uma ação: `Acquire`, `Summary -AsJson` e `Prepare`.
No Kilo, `bash` passou a negar tudo por padrão e liberar somente os três scripts
canônicos como comandos únicos.

Na mesma data foram adicionadas variantes `quality-critical` de researcher e
implementer para que o Caso Gold não seja bloqueado por falta do perfil exigido. O
orquestrador mapeia explicitamente papel + perfil para o Agent correspondente e não
aceita fallback silencioso para uma configuração inferior.

O segundo piloto alcançou corretamente a atribuição `Acquire`, mas revelou que o
modo legado de passagem de argumentos nativos do PowerShell podia unir os dois
arquivos do pacote em um único argumento do `git archive`. A automação passou a
enviá-los como argumentos escalares separados e foi validada nesse modo. O mesmo
piloto mostrou divergência entre a mensagem `BLOCKED` e o `state.json` ainda em
`PREPARING_SOURCES`; o protocolo e os adapters agora exigem persistir o estado
excepcional e encerrar a atribuição ativa antes da comunicação.

No piloto seguinte, a aquisição chegou à validação atômica do pacote e expôs uma
restrição incorreta no leitor local: ele esperava `CASE-001`, enquanto o contrato
publicado usa `C01` para casos e `C01-01` para mudanças. O leitor e o exemplo da
Skill foram reconciliados com os identificadores reais. A validação preserva os IDs
fornecidos pelo pipeline e exige identidade não vazia, unicidade e vínculo
estrutural entre caso e mudança, sem inventar um estilo local. O pacote externo não
precisou ser alterado.

O piloto seguinte concluiu `Acquire` e `Summary -AsJson`, mas o operator tentou
um comando auxiliar para testar a permissão do terminal antes de `Prepare`. A
allowlist negou corretamente esse probe, que não era um dos scripts canônicos, mas
o agente interpretou a negativa como indisponibilidade global. O papel e os
adapters agora proíbem probes: o script atribuído deve ser chamado diretamente, e
somente a negativa dessa invocação exata caracteriza bloqueio de permissão.

## Prompt de retomada sugerido para manutenção da arquitetura

Este prompt serve somente para manter a arquitetura de IA, seus setups ou sua
documentação. Não usá-lo para desenvolver features do ERP.

Uma conversa de manutenção pode começar com:

```text
Leia AGENTS.md e docs/ia-assistida/handoff-e-guia-de-manutencao.md por completo.
Depois leia .ai/metadata.md, docs/ia-assistida/pending-checklist.md e somente os
artefatos canônicos relevantes para esta demanda. Preserve .ai/ como fonte
canônica, trate os diretórios das ferramentas como gerados e não amplie minhas
autorizações.

Minha demanda é: ...
```

Se a tarefa tratar apenas dos setups, acrescentar:

```text
Use a Command canônica manage-ai-tool-setup e a automação
_automation/ai/Sync-AIProfiles.ps1. Faça preview antes de qualquer mutação.
```
