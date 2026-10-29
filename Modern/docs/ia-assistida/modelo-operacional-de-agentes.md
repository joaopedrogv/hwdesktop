# Modelo operacional dos agentes

## Finalidade

Este documento explica como os agentes trabalham em conjunto durante um Workflow
do Modern. Ele é uma referência didática para o desenvolvedor; as instruções
operacionais usadas pelas IAs permanecem em:

- [`orchestration-protocol.md`](../../.ai/agents/orchestration-protocol.md);
- [`workflow-orchestrator.md`](../../.ai/agents/workflow-orchestrator.md);
- [`feature-planner.md`](../../.ai/agents/feature-planner.md);
- [`erp-feature-implementation.md`](../../.ai/workflows/erp-feature-implementation.md).

O modelo combina práticas consolidadas de desenvolvimento dirigido por
especificação, manager/workers, estado persistente e avaliação independente. Ele não
depende de Codex, Kilo Code, AiderDesk, OpenCode ou qualquer fornecedor específico.

## Princípio central

O agente principal da conversa controla o Workflow, executa as operações canônicas
determinísticas e delega o trabalho dos agentes especialistas.

```text
Desenvolvedor
      ↓
Workflow Orchestrator
      ├── Repository Researcher
      ├── Feature Planner
      ├── Increment Implementer
      └── Increment Reviewer
```

O orquestrador sabe qual etapa deve acontecer, qual papel deve executá-la, quais
entradas devem ser fornecidas e qual resultado é esperado. Ele não precisa ter a
capacidade nem a autorização do papel chamado.

Essa separação preserva contextos próprios para pesquisa, planejamento, programação
e revisão. Aquisição de fontes, seleção de evidências e preparação de snapshots são
operações diretas do orquestrador, executadas pelos scripts canônicos.

## Papéis

### `workflow-orchestrator`

Controla:

- o estado da execução;
- a próxima transição permitida;
- as atribuições aos especialistas;
- os perfis de execução solicitados;
- os gates humanos;
- o ownership dos arquivos;
- os resultados recebidos;
- a comunicação com o desenvolvedor;
- o status final do Workflow.

Ele lê a Skill operacional aplicável, executa uma ação de script por vez e registra
comando, resultado e evidências. Mantém as entradas externas somente leitura e os
efeitos nos locais declarados pelo procedimento. Também pode executar um runner
canônico de build ou testes quando houver autorização explícita e infraestrutura
de teste confirmada. A avaliação técnica de falhas continua com os especialistas.

Ele não pesquisa o código, não cria o plano, não programa e não revisa. Normalmente
utiliza `fast-routine` para estado e operações determinísticas. As permissões
técnicas do perfil principal precisam permitir as operações e a delegação; elas
não concedem ao orquestrador ownership de arquivos de produção.

### `repository-researcher`

Responde perguntas delimitadas usando evidências do repositório. Trabalha somente
em leitura e separa fatos verificados de inferências. Questões independentes podem
ser pesquisadas em paralelo.

### `feature-planner`

Recebe a demanda e os resultados dos pesquisadores. Produz:

1. o plano completo da feature para aprovação humana;
2. depois da aprovação, o desenho técnico necessário para implementação.

Quando recebe um plano preparado, confere sua cobertura, preserva a versão aprovada
em `feature-plan.md` e explicita somente complementos, lacunas ou mudanças propostas.
Com evidências e aprovação suficientes, pode produzir o desenho técnico na mesma
atribuição. O orquestrador registra a origem e a aprovação; não recria o plano.
Decisões funcionais aprovadas não voltam à discussão sem um motivo concreto.

É o papel que normalmente exige maior capacidade, pois trata modelo conceitual,
Use Cases, limites arquiteturais, persistência, segurança, testes, riscos e divisão
dos incrementos. Por isso começa em `quality-critical`.

O planner grava e verifica diretamente os documentos atribuídos, normalmente
`feature-plan.md` e `technical-design.md` dentro do run. A atribuição informa os
caminhos exatos. Ele não altera `state.json`, produção, testes ou migrações. Se a
gravação for negada, retorna o bloqueio para corrigir a configuração; copiar planos
inline pelo orquestrador deixa de ser o procedimento normal.

### `increment-implementer`

Implementa uma única atribuição aprovada, com arquivos e limites explícitos. Pode
usar Skills especializadas. Seu perfil varia entre `fast-routine`, `balanced-work` e
`quality-critical` conforme a complexidade real do incremento.

O implementador não muda o plano, não amplia o escopo e não executa build ou testes
sem autorização expressa.

### `increment-reviewer`

Revisa de forma independente e somente leitura:

- cada incremento depois que sua escrita terminou;
- a feature integrada antes da validação final.

O reviewer não corrige o código durante a mesma atribuição. Uma correção é devolvida
ao implementador e depois revisada novamente.

## Fluxo de uma feature

Caminho de uma demanda ainda sem plano:

```text
Demanda informal
      ↓
Researcher coleta evidências
      ↓
Planner cria modelo conceitual e plano
      ↓
APROVAÇÃO DO DESENVOLVEDOR
      ↓
Planner cria o desenho técnico
      ↓
Implementer entrega um incremento
      ↓
Reviewer avalia o incremento
      ├── aprovado → próximo incremento
      ├── correção → Implementer → Reviewer
      └── mudança material → nova aprovação
      ↓
Reviewer avalia a feature integrada
      ↓
Validações autorizadas
      ↓
Ready for Release
```

Um plano preparado entra pela conferência do planner. Se completo para o escopo e
com aprovação explícita da versão recebida, passa ao desenho técnico; se houver
lacunas, somente elas são complementadas ou submetidas à aprovação. A pesquisa
continua com o researcher, limitada às evidências necessárias. O run registra a
versão adotada e não acompanha alterações externas silenciosamente.

O limite continua sendo `Ready for Release`. O Workflow não autoriza publicação,
release, distribuição ou migration de produção.

## Atribuições verificáveis

Um pedido já definido pelo desenvolvedor pode ser delegado diretamente ao
implementador solicitado, com revisão posterior. A ausência de uma Skill não
impede a tarefa; o planner participa quando houver decisões materiais pendentes.
Isso não cria um procedimento adicional no protocolo de orquestração.

O orquestrador não envia pedidos genéricos. Cada chamada informa:

- execução e fase;
- papel chamado;
- objetivo e escopo aprovado;
- evidências e arquivos de entrada;
- fontes canônicas aplicáveis;
- ownership e alterações permitidas;
- perfil de execução;
- presença ou ausência de autorização para build e testes;
- saída esperada;
- situações que obrigam o agente a parar.

O especialista devolve status, evidências, arquivos lidos ou alterados, validações,
decisões locais, desvios, riscos e próximo passo necessário. Isso permite ao
orquestrador verificar se o contrato foi atendido sem refazer o trabalho técnico.

### A chamada precisa realmente acontecer

Preparar uma atribuição não é o mesmo que delegá-la. Em cada tentativa, o
orquestrador precisa chamar explicitamente, uma única vez, o Agent configurado para
o papel por meio do mecanismo nativo da ferramenta e aguardar aquele resultado.

Por exemplo, no Kilo Code essa ação é uma chamada ao Agent nomeado pela ferramenta
Task. No AiderDesk é uma chamada ao Subagent habilitado. A sintaxe pertence ao
adapter, mas o comportamento é sempre o mesmo.

Não contam como delegação:

- pedir ao orquestrador que “aja como” o implementador;
- apenas mencionar o nome do worker;
- carregar a Skill destinada ao worker no contexto do orquestrador;
- executar o procedimento e somente descrever que outro Agent o teria realizado.

Se a chamada não aparecer de forma observável, executar um Agent diferente ou for
recusada, a fase falha fechada. O orquestrador não tenta completar o trabalho por
conta própria.

## Falha segura

Se o Subagent não for chamado, o modelo solicitado estiver indisponível, a permissão
for insuficiente ou a tarefa falhar, a fase para.

```text
Falha na delegação
      ↓
Preservar último estado válido
      ↓
Registrar a causa
      ↓
Informar o desenvolvedor
```

O orquestrador não assume a tarefa. Isso é essencial para que uma falha de routing
não permaneça oculta até a análise posterior de custo ou consumo de tokens.

## Intervenção do desenvolvedor e retomada

Uma execução bloqueada ou com falha não precisa ser descartada. O desenvolvedor
pode:

- corrigir a configuração da ferramenta ou do modelo;
- preparar o ambiente necessário;
- esclarecer um requisito;
- corrigir código ou testes;
- implementar manualmente a parte ausente.

Depois disso, ele solicita a continuação da mesma execução. O orquestrador registra
o que foi alterado e escolhe a retomada segura:

| Intervenção | Retomada |
|---|---|
| configuração de agente ou modelo | repetir a mesma delegação |
| ambiente de build ou teste | repetir somente a execução já autorizada |
| nova evidência ou requisito esclarecido | devolver ao researcher ou planner |
| código, teste, schema, migration ou UI alterado manualmente | enviar a mudança para revisão independente |
| mudança material no plano ou desenho | retornar ao gate de aprovação |

A implementação manual do desenvolvedor é válida e não precisa ser refeita por um
Subagent. Entretanto, ela não é considerada automaticamente revisada. Também não
cria por consequência uma nova autorização para executar testes, publicar ou fazer
release.

## Ferramentas sem Subagents

A estrutura continua portátil por meio do modo manual supervisionado:

1. o orquestrador prepara o handoff completo da próxima atribuição;
2. ele para sem executar o trabalho;
3. o desenvolvedor chama o papel em outra sessão ou ferramenta;
4. o resultado é devolvido ao orquestrador;
5. o Workflow continua do estado preservado.

Portabilidade, portanto, não significa que um único agente acumula todos os papéis.
Significa que os mesmos contratos podem ser transportados entre ferramentas.

## Estado persistente

As instruções canônicas permanecem em `.ai/`. O estado temporário de cada execução
fica separado em `.ai-runs/<run-id>/`, ignorado pelo Git:

```text
.ai-runs/<run-id>/
├── state.json
├── discovery.md
├── feature-plan.md
├── technical-design.md
├── increments/
├── final-review.md
├── validation.md
└── handoff.md
```

Somente o orquestrador altera `state.json`. Um documento que deva permanecer no
projeto é promovido explicitamente para um local aprovado, como `docs/features/`;
arquivos operacionais incompletos não se tornam documentação permanente por padrão.

Ao retomar um run antigo, preservam-se as atribuições concluídas e seus resultados.
A nova distribuição de responsabilidades vale para as operações restantes, sem
repetir trabalho aceito ou reescrever os registros históricos.

## Custos e modelos

O routing canônico descreve capacidade, deliberação, latência e custo, não nomes de
modelos:

| Trabalho | Perfil inicial |
|---|---|
| Estado, routing e handoffs | `fast-routine` |
| Pesquisa localizada | `fast-routine` |
| Pesquisa transversal | `balanced-work` |
| Plano e desenho técnico | `quality-critical` |
| Skill mecânica com entradas completas | `fast-routine` |
| Implementação normal | `balanced-work` |
| Revisão normal | `balanced-work` |
| Revisão de alto risco | `quality-critical` |

Cada adapter traduz esses perfis para os modelos disponíveis em sua ferramenta. Uma
configuração mais forte pode ser escolhida; uma configuração insuficiente não pode
ser usada silenciosamente.

## Concorrência

Pesquisa independente pode ocorrer em paralelo. Escrita é sequencial por padrão.
Dois implementadores só podem trabalhar simultaneamente quando o plano comprovar que
as dependências e os arquivos não se sobrepõem.

Workers não criam outros Subagents. O reviewer começa depois que o implementador
encerrou a atribuição de escrita.

## Relação com as Skills

Uma Skill continua acessível diretamente por linguagem natural. Dentro do Workflow,
o orquestrador atribui a atividade ao `increment-implementer` e informa a Skill que
deve ser carregada quando a atividade é implementação. Skills operacionais
prescritas pelo Workflow são executadas diretamente pelo orquestrador.

A Skill define como executar uma capacidade especializada. Ela não substitui:

- o planejamento da feature;
- a aprovação humana;
- o papel que possui a atribuição;
- as Rules aplicáveis;
- a autorização separada para build ou testes.
