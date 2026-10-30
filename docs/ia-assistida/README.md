# Desenvolvimento assistido por IA no HWDESKTOP

## Continuidade da documentação

Em 28/10/2026, o responsável transferiu a continuidade deste trabalho para o chat
que mantém [Contexto e decisões do HWDESKTOP](D:/Hw/ai-docs/hwdesktop/README.md).
O [mapa de Modern](D:/Hw/ai-docs/hwdesktop/produto/modern.md) relaciona o contexto
global e estas fontes. Os caminhos externos correspondem ao ambiente atual.

As fontes técnicas são .ai/ na raiz para o processo geral e Modern/.ai/ para o
módulo. Esta área é a explicação humana geral; o guia de Modern permanece em
Modern/docs/ia-assistida/. O repositório documental registra contexto,
decisões e justificativas sem manter cópias concorrentes das regras. Esta
continuidade não concede autorização para implementar features, executar builds,
testes ou aplicar setups que não tenham sido solicitados.

## Objetivo

Este guia explica, em português brasileiro, como o repositório organiza instruções,
conhecimento e automações para desenvolvimento assistido por IA.

Ele é destinado a desenvolvedores. Os arquivos em `.ai/` são escritos de forma
enxuta e operacional para consumo pelos agentes.

> A fonte canônica utilizada pelas IAs é `.ai/`. Esta documentação explica essa
> estrutura, mas não substitui as instruções canônicas.

Para retomar a manutenção desta arquitetura em uma nova conversa ou ferramenta,
comece pelo [handoff e guia de manutenção](handoff-e-guia-de-manutencao.md). Ele
registra o desenho consolidado, as rotas mínimas de leitura, os procedimentos de
alteração e o estado verificado no encerramento da implementação.

O piloto real do Caso Gold, desde a primeira execução da Command até o plano pronto
para desenho técnico, está registrado no
[handoff do Workflow `fiscal-calculos-update`](../../Modern/docs/ia-assistida/handoff-piloto-fiscal-calculos-update.md).

## Princípio central

A arquitetura é independente de fornecedor, IDE ou agente.

`AGENTS.md` funciona como porta de entrada. A partir dele, a ferramenta localiza em
`.ai/` somente o material necessário para a tarefa.

Configurações específicas de Codex, outra IDE ou outro agente são adapters. Elas
devem apontar para o conteúdo canônico, sem manter regras próprias ou cópias
divergentes.

### Como o roteamento acontece

O pedido do desenvolvedor define o objetivo, o escopo e as autorizações. O
`AGENTS.md` identifica um ponto de entrada explicitamente solicitado — como Command,
Workflow ou Skill — ou seleciona o artefato que corresponde naturalmente à tarefa.

Depois disso, o agente carrega as Rules aplicáveis, somente o Context necessário e
as Skills exigidas naquele momento. Um Workflow coordena etapas e aprovações; uma
Command apenas encaminha para uma Skill ou Workflow; um Agent permite delegar uma
responsabilidade delimitada sem ampliar a autorização.

As instruções são cumulativas. Uma exceção somente prevalece quando estiver
documentada explicitamente. A estrutura canônica também não tenta substituir a
hierarquia imposta pela ferramenta utilizada: instruções de sistema, organização e
usuário continuam sendo respeitadas na prioridade definida por ela.

## Metadata canônico

Os artefatos diretamente selecionáveis começam com um pequeno bloco YAML. O formato
e a semântica independentes de ferramenta estão definidos em
[`metadata.md`](../../.ai/metadata.md).

`name` é o identificador estável e único do artefato. Ele usa `kebab-case` e
corresponde ao nome do arquivo — ou ao diretório da Skill. `description` informa ao
agente para que serve o artefato e quando ele é relevante.

Somente Rules possuem metadata de escopo:

- `always_apply: true` torna a Rule aplicável a todas as tarefas do seu escopo;
- `applies_to` contém padrões relativos à raiz que mantém a Rule (HWDESKTOP ou Modern);
- a ausência dos dois campos indica aplicação por relevância semântica.

`always_apply` e `applies_to` não podem coexistir. O antigo campo `globs` não faz
parte do formato canônico. Contexts, Skills, Workflows, Commands e Agents são
selecionados pelo pedido, por sua descrição e pelo roteamento canônico, sem campos
específicos de IDE, modelo ou fornecedor.

READMEs, índices, referências internas de Skills, checklists e documentos de apoio
não precisam de metadata porque não são artefatos diretamente roteáveis.

## Mapa da estrutura

| Categoria | Responsabilidade | Exemplo |
|---|---|---|
| Rules | Restrições obrigatórias | compatibilidade Delphi, banco, segurança |
| Context | Conhecimento específico do projeto | arquitetura, testes, integração de UI |
| Skills | Procedimentos especializados reutilizáveis | gerar Entity, criar teste de Use Case |
| Workflows | Orquestração de várias etapas | implementar uma feature completa |
| Commands | Pontos de entrada manuais | iniciar implementação de feature |
| Agents | Papéis reutilizáveis para orquestração e delegação | orquestrar, planejar, implementar, revisar |

O roteamento geral está definido em
[`AGENTS.md`](../../AGENTS.md).

## Alcance das orientações

Trabalhe pela raiz do HWDESKTOP. O AGENTS.md geral carrega regras comuns e encaminha
para Modern/AGENTS.md quando necessário. Arquitetura hexagonal, convenções de
entidades, UI e projetos de testes permanecem restritos ao módulo. Fora dele,
o agente preserva os contratos, o comportamento aprovado e a arquitetura existente.

A [Rule compartilhada](../../.ai/rules/repository-safety.md#legacy-references-and-local-changes)
orienta avaliar a qualidade dos exemplos legados antes de reutilizá-los. Código
novo ou alterado deve ser claro e compatível, evitando propagar problemas concretos
dos exemplos. Melhorias locais cabem no escopo aprovado; alterações de comportamento
ou contrato além do aprovado e refatorações amplas precisam de definição própria.
Esse critério não impõe a arquitetura de Modern ao legado nem acrescenta uma etapa
ao workflow.

O setup está no menu **Ferramentas de IA**, com visualização, aplicação/atualização
e verificação do Kilo. O guia de instalação está em
[ferramentas/kilo-code.md](ferramentas/kilo-code.md).

## Rules

Rules dizem o que deve ou não deve acontecer. Elas não são tutoriais e não devem
conter procedimentos extensos.

As regras gerais são [repository-safety](../../.ai/rules/repository-safety.md) e
[database-safety](../../.ai/rules/database-safety.md). Exemplos específicos de Modern:

- [arquitetura](../../Modern/.ai/rules/architecture.md);
- [padrões de código](../../Modern/.ai/rules/coding-standards.md);
- [compatibilidade Delphi](../../Modern/.ai/rules/delphi-compatibility.md);
- [banco de dados](../../Modern/.ai/rules/database.md);
- [segurança](../../Modern/.ai/rules/security.md);
- [testes](../../Modern/.ai/rules/testing.md).

As Rules são cumulativas. Uma Rule especializada não elimina outra, salvo quando uma
exceção estiver documentada explicitamente.

## Context

Context é carregado conforme a área atingida. A visão técnica comum está em
[HWDESKTOP](../../.ai/context/hwdesktop-overview.md); padrões e integrações de
Modern estão no [guia do módulo](../../Modern/docs/ia-assistida/README.md).

## Skills

Skills descrevem como executar uma capacidade especializada e recorrente.

Uma Skill pode ser acionada diretamente por linguagem natural:

```text
Gere uma entidade Delphi a partir deste CREATE TABLE.
```

O agente deve reconhecer a correspondência com
[`sql-table-to-delphi-entity`](../../Modern/.ai/skills/sql-table-to-delphi-entity/SKILL.md).

Também é possível nomeá-la explicitamente:

```text
Use a Skill delphi-usecase-testing para criar os testes deste Use Case.
```

Uma Command não é necessária para usar uma Skill.

### Skills disponíveis

| Skill | Finalidade |
|---|---|
| [`database-migration`](../../.ai/skills/database-migration/SKILL.md) | migrations do `pkReestrutura` |
| [`sql-table-to-delphi-entity`](../../Modern/.ai/skills/sql-table-to-delphi-entity/SKILL.md) | gerar Entity a partir de SQL aprovado |
| [`sql-table-to-delphi-metadata`](../../Modern/.ai/skills/sql-table-to-delphi-metadata/SKILL.md) | gerar `EntityMetadata` |
| [`delphi-record-encapsulation`](../../.ai/skills/delphi-record-encapsulation/SKILL.md) | encapsular records existentes |
| [`delphi-entity-validation`](../../Modern/.ai/skills/delphi-entity-validation/SKILL.md) | Validation Factories |
| [`delphi-dataset-grid`](../../Modern/.ai/skills/delphi-dataset-grid/SKILL.md) | datasets baseados em `TDataSetGrid` |
| [`delphi-cadastro-form-scaffold`](../../Modern/.ai/skills/delphi-cadastro-form-scaffold/SKILL.md) | cadastro com base selecionada, infraestrutura compartilhada e MVP quando aplicável |
| [`delphi-ui-form-validation`](../../Modern/.ai/skills/delphi-ui-form-validation/SKILL.md) | projetar validação na UI, diretamente ou pelo feedback da View/Presenter |
| [`delphi-usecase-testing`](../../Modern/.ai/skills/delphi-usecase-testing/SKILL.md) | testes unitários isolados de Use Cases |
| [`delphi-test-runner`](../../Modern/.ai/skills/delphi-test-runner/SKILL.md) | executar `ERP.UnitTests` quando autorizado |
| [`rtc-update-inputs`](../../Modern/.ai/skills/rtc-update-inputs/SKILL.md) | obter do GitHub as tags e o pacote RTC exatos para uma execução |
| [`rtc-implementation-evidence`](../../Modern/.ai/skills/rtc-implementation-evidence/SKILL.md) | validar e ler seletivamente o contrato estruturado da atualização RTC |
| [`rtc-source-snapshots`](../../Modern/.ai/skills/rtc-source-snapshots/SKILL.md) | preparar snapshots das versões oficiais já adquiridas |
| [`delphi-fiscal-calculos-test-runner`](../../Modern/.ai/skills/delphi-fiscal-calculos-test-runner/SKILL.md) | compilar ou executar `Fiscal.Calculos.Tests` com autorização própria |

## Workflows

Um Workflow coordena várias etapas, decisões humanas, Skills e handoffs.

O primeiro Workflow canônico é
[`erp-feature-implementation`](../../.ai/workflows/erp-feature-implementation.md).

O Workflow aceita duas entradas. Para um pedido ainda sem plano, o fluxo é:

```text
descrição informal
      ↓
discovery
      ↓
plano obrigatório
      ↓
aprovação humana
      ↓
desenho técnico
      ↓
incrementos por Use Case
      ↓
UI opcional
      ↓
validação
      ↓
Ready for Release
```

Para um plano já elaborado, o planner preserva seu conteúdo em
`feature-plan.md` no run, registra a versão da fonte e a aprovação recebida e confere
a cobertura necessária. Se o plano estiver completo para o escopo e aprovado, segue
para `technical-design.md`; essa conferência pode ocorrer na mesma atribuição, sem
refazer o planejamento nem pedir a mesma aprovação. A pesquisa de repositório fica
limitada às evidências ausentes ou desatualizadas. Lacunas reais e decisões novas
voltam ao desenvolvedor, preservando o que já foi decidido.

Forneça o caminho ou conteúdo do plano e uma aprovação que identifique a versão e o
escopo. Um desenho funcional pode servir como plano quando tiver a cobertura
necessária; seu nome ou sua origem em outra conversa não o aprova automaticamente.
O original permanece somente leitura, e mudanças posteriores não alteram
silenciosamente o plano adotado no run.

O Workflow termina em `Ready for Release`. Release, publicação, build de
distribuição e incorporação da migration ao histórico de produção pertencem a outro
processo.

O Caso Gold possui o Workflow especializado
[`fiscal-calculos-update`](../../Modern/.ai/workflows/fiscal-calculos-update.md). Ele compara
o contrato estruturado do pipeline com o Delphi atual, exige que o desenvolvedor
classifique cada `change_id`, implementa incrementos semânticos e reproduz em Delphi
os testes oficiais já associados. O Workflow não recalcula o diff nem repete a
triagem do repositório de conformidade. Consulte o guia didático
[Caso Gold — atualização do Fiscal.Calculos](../../Modern/docs/ia-assistida/caso-gold-fiscal-calculos.md).

## Commands

Commands são pontos de entrada estáveis e manualmente acionáveis. Elas encaminham
para uma Skill ou Workflow sem copiar seu procedimento.

As Commands atuais incluem:

- [`implement-erp-feature`](../../.ai/commands/implement-erp-feature.md) — inicia
  ou retoma o Workflow canônico de feature;
- [`manage-ai-tool-setup`](../../.ai/commands/manage-ai-tool-setup.md) — planeja,
  aplica, verifica, troca ou remove os adapters gerados de uma ferramenta.
- [`update-fiscal-calculos`](../../Modern/.ai/commands/update-fiscal-calculos.md) — inicia
  ou retoma uma atualização entre duas tags oficiais da Calculadora RTC.

Exemplo portátil:

```text
Execute a Command implement-erp-feature para esta demanda:

Precisamos permitir...
```

Cada ferramenta poderá oferecer uma sintaxe diferente: slash command, item de
paleta, arquivo de prompt ou apenas linguagem natural. O adapter faz essa tradução.

Invocar `implement-erp-feature` inicia ou retoma o `workflow-orchestrator`, que
seleciona discovery/planejamento ou a adoção de um plano preparado pelos papéis
especialistas. A Command respeita a aprovação já estabelecida para a versão e o
escopo recebidos; sua invocação isolada não aprova a implementação nem autoriza
automaticamente a execução de testes.

O setup de uma ferramenta também pode ser solicitado diretamente:

```text
Configure o setup do Kilo.
Mude para o AiderDesk.
Adicione o Codex.
Remova o setup do Kilo.
```

Essas solicitações usam `_automation/ai/Sync-AIProfiles.ps1`. As fontes versionadas dos
adapters ficam em `_automation/ai/tool-setup/`; os diretórios das
ferramentas na raiz são destinos gerados e ignorados.

## Agents e Subagents

Um Agent é um papel reutilizável com responsabilidade, limites, entradas e contrato
de saída.

Um Subagent é uma execução temporária desse papel para uma tarefa delimitada.

Os papéis atuais são:

- [`workflow-orchestrator`](../../.ai/agents/workflow-orchestrator.md): estado,
  routing, delegações, gates, automações canônicas e comunicação, assumidos pelo
  agente principal da conversa;
- [`repository-researcher`](../../.ai/agents/repository-researcher.md): pesquisa
  somente leitura;
- [`feature-planner`](../../.ai/agents/feature-planner.md): criação ou adoção do plano
  e desenho técnico após aprovação, gravados diretamente nos arquivos atribuídos
  do run;
- [`increment-implementer`](../../.ai/agents/increment-implementer.md): programação
  de um incremento aprovado;
- [`increment-reviewer`](../../.ai/agents/increment-reviewer.md): revisão
  independente de um incremento ou da feature integrada.

Em um Workflow orquestrado, o `workflow-orchestrator` permanece responsável por:

- comunicação com o desenvolvedor;
- estado e transições do Workflow;
- atribuições e seleção do perfil mínimo seguro;
- gates de aprovação;
- limites e ownership das delegações;
- registro dos resultados estruturados;
- status final baseado em revisão e validação independentes.

O orquestrador não pesquisa o código, não cria o plano, não programa e não revisa.
Essas responsabilidades pertencem aos agentes especialistas. Se uma delegação
falhar, o orquestrador interrompe a fase e informa o desenvolvedor; ele nunca assume
silenciosamente o trabalho ausente.

Uma ferramenta sem suporte a Subagents utiliza o modo manual supervisionado: o
orquestrador produz o handoff completo da próxima atribuição, o desenvolvedor chama
o papel necessário em outra sessão ou ferramenta e devolve seu resultado.

O protocolo completo e sua aplicação prática estão explicados em
[Modelo operacional dos agentes](modelo-operacional-de-agentes.md). A fonte
canônica é
[`orchestration-protocol.md`](../../.ai/agents/orchestration-protocol.md).

Para entender a seleção de capacidade, raciocínio, latência e custo, consulte
[Perfis de execução](perfis-de-execucao.md).

Para os caminhos, comandos e perfis específicos de AiderDesk, OpenCode, Codex,
Antigravity IDE e Kilo Code, consulte
[Adapters de ferramentas](adapters-de-ferramentas.md).

## Autorizações

A arquitetura diferencia intenção, implementação e execução:

- pedir análise ou discovery não autoriza alteração de código;
- aprovar o plano da feature autoriza somente o escopo aprovado;
- criar testes não autoriza compilá-los ou executá-los;
- `ERP.UnitTests` só é executado quando solicitado ou autorizado;
- integration tests exigem autorização e configuração próprias;
- `Fiscal.Calculos.Tests` usa automação própria e só executa após confirmação da
  infraestrutura segura de teste;
- delegar uma tarefa não amplia seu escopo ou autorização.

## Como usar no dia a dia

### Tarefa especializada

```text
Crie a Validation Factory desta entidade.
```

O agente localiza e usa a Skill correspondente.

### Feature completa

```text
Execute implement-erp-feature para a seguinte demanda:
...
```

O agente inicia discovery, apresenta o plano e aguarda aprovação. Se receber um
plano já elaborado e aprovado para o escopo, faz a conferência de entrada e segue
para o desenho técnico, solicitando somente esclarecimentos ou decisões faltantes.

### Skill explícita

```text
Use delphi-record-encapsulation neste record.
```

### Execução de testes

```text
Execute os ERP.UnitTests usando a automação canônica.
```

Essa solicitação constitui autorização para a execução suportada pela Skill
`delphi-test-runner`.

## Material específico de Modern

O [guia do módulo](../../Modern/docs/ia-assistida/README.md) descreve stack,
segurança, sincronização e o piloto de View/Presenter. O Caso Gold e seu histórico
permanecem em Modern/docs/ia-assistida/.

## Pendências e evolução

As decisões ainda abertas e o histórico das concluídas estão em
[`pending-checklist.md`](pending-checklist.md).

Quando uma pendência é concluída, ela é movida para o final daquele arquivo com a
caixa de seleção marcada. Isso preserva o histórico das decisões arquiteturais.
