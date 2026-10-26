# Desenvolvimento assistido por IA no Modern

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
[handoff do Workflow `fiscal-calculos-update`](handoff-piloto-fiscal-calculos-update.md).

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

- `always_apply: true` torna a Rule aplicável a todas as tarefas;
- `applies_to` contém uma lista de padrões relativos ao repositório;
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

## Rules

Rules dizem o que deve ou não deve acontecer. Elas não são tutoriais e não devem
conter procedimentos extensos.

Exemplos:

- [arquitetura](../../.ai/rules/architecture.md);
- [padrões de código](../../.ai/rules/coding-standards.md);
- [compatibilidade Delphi](../../.ai/rules/delphi-compatibility.md);
- [banco de dados](../../.ai/rules/database.md);
- [segurança](../../.ai/rules/security.md);
- [testes](../../.ai/rules/testing.md).

As Rules são cumulativas. Uma Rule especializada não elimina outra, salvo quando uma
exceção estiver documentada explicitamente.

## Context

Context explica como o projeto realmente funciona quando esse conhecimento não é
óbvio apenas pela leitura de um arquivo isolado.

Exemplos:

- [arquitetura do projeto](../../.ai/context/project-architecture.md);
- [estrutura dos módulos](../../.ai/context/project-structure.md);
- [stack tecnológica](../../.ai/context/technology-stack.md);
- [sincronização e importação de dados](../../.ai/context/data-synchronization.md);
- [arquitetura de segurança](../../.ai/context/security-architecture.md);
- [autorização e auditoria](../../.ai/context/authorization-auditing.md);
- [estratégia de testes](../../.ai/context/testing-strategy.md);
- [integração da UI Modern com o legado](../../.ai/context/ui-integration.md);
- [particularidades do Fiscal.Calculos](../../.ai/context/fiscal-calculos.md).

Um agente deve carregar somente o Context relevante. Uma tarefa restrita ao domínio
não precisa consumir todo o material de UI, por exemplo.

### Stack tecnológica e sua evolução

O [Context de stack tecnológica](../../.ai/context/technology-stack.md) registra
somente escolhas que afetam decisões de implementação:

- os 47 pacotes do ERP, incluindo `pkModern`, usam Delphi 2006 e Win32;
- a DLL `hw.nfe.dx` usa Delphi Rio 10.3.3 e compartilha units do `Modern`;
- Firebird 2.5 é o único banco operacional suportado e usa IBX por trás das
  abstrações próprias de conexão e transação;
- SQLite é exclusivo da `calculadora.db` do SERPRO;
- ZeosLib é a implementação atual e substituível do adapter SQLite.

O Context não cataloga todas as bibliotecas presentes nos projetos. Tecnologias
especializadas permanecem explicadas no Context ou na Skill correspondente.

Espera-se que novas features utilizem a stack atual. Se uma necessidade não puder
ser atendida dessa forma, o agente não escolhe sozinho uma nova tecnologia nem
amplia a fronteira do Delphi Rio. Ele apresenta a limitação, alternativas e impactos
ao desenvolvedor, que decide se o caso deve permanecer na stack atual, ser atendido
pela DLL Rio ou justificar uma evolução explícita.

### Banco, UUID e sincronização externa

Novas chaves primárias definidas como UUID usam `CHAR(36) NOT NULL`. O valor é
textual, tem 36 caracteres e não contém chaves `{}`. Dentro de um repository, o
padrão é usar `GenerateNewUUID`; fora dele, `GuidService.New`.

Essa decisão não significa que toda chave primária nova deva ser UUID. Dados
mantidos por fontes oficiais ou externas preservam, por padrão, o identificador da
origem — inclusive identificadores inteiros, naturais ou de domínio. Campos legados
chamados `UUID` ou `GUID` também não devem ser usados como precedente sem verificar
sua função real, porque o legado não possui uma convenção uniforme confiável.

O fluxo preferencial de sincronização separa um Reader da fonte, um serviço de
sincronização e um Writer do ERP. Readers de JSON e CSV usam adapters próprios;
quando a fonte é outro banco, sua conexão passa por `IDatabaseConnectionFactory`.
O Writer utiliza a conexão Firebird operacional e a transação controlada pelo Use
Case. Interfaces Reader/Writer são preferidas, mas podem ser dispensadas quando uma
operação pequena não se beneficiar dessa separação no desenho aprovado.

O comportamento atual está descrito no
[Context de sincronização e importação](../../.ai/context/data-synchronization.md),
e as obrigações ficam na [Rule de banco](../../.ai/rules/database.md). Ainda existe
uma pendência não bloqueadora para definir como detectar e tratar versões externas
que alterem schema ou formato de maneira incompatível.

### Segurança, autorização e auditoria

O `Modern` participa da segurança do ERP, mas não autentica o usuário nem escolhe a
empresa ativa. Essas responsabilidades pertencem ao login legado, que preenche o
`ISessionContext`. As features usam esse contexto como somente leitura.

As permissões são verificadas na UI ou no ponto de chamada legado por meio de
`TAudit_OOP`; elas não são repetidas nos Use Cases. A UI valida a autorização antes
da operação e preserva o registro de sucesso ou falha depois dela. Uma chamada à DLL
Rio não elimina essa responsabilidade do chamador.

Cada ação protegida precisa constar do plano da feature. O desenvolvedor recebe uma
lista contendo a finalidade, tipo de ação, auditoria e necessidade de liberação
gerencial. O agente não inventa códigos como `MODxxx`, `NFSxxx`, `NFCxxx` ou
`CLIxxx`: o prefixo, a sequência e o mecanismo de registro são aprovados pelo
desenvolvedor.

Como padrão, exclusão, cancelamento e estorno exigem liberação gerencial. Inclusão,
edição, salvamento, pesquisa, visualização e impressão não exigem. Ações diferentes
ou de risco precisam de decisão explícita.

Movimentos pertencentes a uma empresa usam `COD_EMPRESA`. Cadastros podem ser
globais; quando um cadastro global precisa de acesso restrito, uma tabela de vínculo
define as empresas autorizadas. O agente deve verificar o modelo existente antes de
presumir o escopo dos dados.

Credenciais existentes são codificadas pelo legado e obtidas por
`IConfiguracoesRepository`. Como ainda não há um padrão único para novos tipos de
credencial, qualquer armazenamento novo deve ser decidido com o desenvolvedor.
Certificados A1 e A3 são configurados pelo ERP e repassados ao ACBr.

Os detalhes canônicos estão em
[Arquitetura de segurança](../../.ai/context/security-architecture.md) e
[Autorização e auditoria](../../.ai/context/authorization-auditing.md). As restrições
obrigatórias permanecem na [Rule de segurança](../../.ai/rules/security.md).

### Como o Modern classifica adapters

Para código novo, `Primary` e `Secondary` descrevem a direção da interação, não a
tecnologia usada:

- um adapter `Primary` recebe uma solicitação externa e aciona um Use Case ou input
  port;
- um adapter `Secondary` implementa uma dependência acionada pela aplicação, como
  repository, banco, arquivo, e-mail ou serviço externo.

Os repositories, readers e writers existentes seguem essa classificação. ACBr e
DFeDLL também ficam em `ERP.Features/Adapters/Secondary/`: a aplicação usa o ACBr
para envio de e-mail e transmissão de NFS-e e invoca, por meio de DFeDLL, operações
exportadas pela DLL legada. Em ambos os casos, o fluxo parte da aplicação em direção
a uma dependência externa.

O fato de uma operação ser exportada por outra DLL não transforma o adapter que a
importa em `Primary`. Para uma integração nova de saída, o padrão preferencial é
definir um contrato pertencente à aplicação e implementá-lo em `Secondary`. A
explicação operacional completa está no
[Context de arquitetura](../../.ai/context/project-architecture.md), com o mapa de pastas no
[Context de estrutura do projeto](../../.ai/context/project-structure.md).

## Skills

Skills descrevem como executar uma capacidade especializada e recorrente.

Uma Skill pode ser acionada diretamente por linguagem natural:

```text
Gere uma entidade Delphi a partir deste CREATE TABLE.
```

O agente deve reconhecer a correspondência com
[`sql-table-to-delphi-entity`](../../.ai/skills/sql-table-to-delphi-entity/SKILL.md).

Também é possível nomeá-la explicitamente:

```text
Use a Skill delphi-usecase-testing para criar os testes deste Use Case.
```

Uma Command não é necessária para usar uma Skill.

### Skills disponíveis

| Skill | Finalidade |
|---|---|
| [`database-migration`](../../.ai/skills/database-migration/SKILL.md) | migrations do `pkReestrutura` |
| [`sql-table-to-delphi-entity`](../../.ai/skills/sql-table-to-delphi-entity/SKILL.md) | gerar Entity a partir de SQL aprovado |
| [`sql-table-to-delphi-metadata`](../../.ai/skills/sql-table-to-delphi-metadata/SKILL.md) | gerar `EntityMetadata` |
| [`delphi-record-encapsulation`](../../.ai/skills/delphi-record-encapsulation/SKILL.md) | encapsular records existentes |
| [`delphi-entity-validation`](../../.ai/skills/delphi-entity-validation/SKILL.md) | Validation Factories |
| [`delphi-dataset-grid`](../../.ai/skills/delphi-dataset-grid/SKILL.md) | datasets baseados em `TDataSetGrid` |
| [`delphi-cadastro-form-scaffold`](../../.ai/skills/delphi-cadastro-form-scaffold/SKILL.md) | scaffold de cadastro com `TfrmCadPadraoM` |
| [`delphi-ui-form-validation`](../../.ai/skills/delphi-ui-form-validation/SKILL.md) | projetar validação na UI |
| [`delphi-usecase-testing`](../../.ai/skills/delphi-usecase-testing/SKILL.md) | testes unitários isolados de Use Cases |
| [`delphi-test-runner`](../../.ai/skills/delphi-test-runner/SKILL.md) | executar `ERP.UnitTests` quando autorizado |
| [`rtc-update-inputs`](../../.ai/skills/rtc-update-inputs/SKILL.md) | obter do GitHub as tags e o pacote RTC exatos para uma execução |
| [`rtc-implementation-evidence`](../../.ai/skills/rtc-implementation-evidence/SKILL.md) | validar e ler seletivamente o contrato estruturado da atualização RTC |
| [`rtc-source-snapshots`](../../.ai/skills/rtc-source-snapshots/SKILL.md) | preparar snapshots das versões oficiais já adquiridas |
| [`delphi-fiscal-calculos-test-runner`](../../.ai/skills/delphi-fiscal-calculos-test-runner/SKILL.md) | compilar ou executar `Fiscal.Calculos.Tests` com autorização própria |

## Workflows

Um Workflow coordena várias etapas, decisões humanas, Skills e handoffs.

O primeiro Workflow canônico é
[`erp-feature-implementation`](../../.ai/workflows/erp-feature-implementation.md).

Seu fluxo é:

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

O Workflow termina em `Ready for Release`. Release, publicação, build de
distribuição e incorporação da migration ao histórico de produção pertencem a outro
processo.

O Caso Gold possui o Workflow especializado
[`fiscal-calculos-update`](../../.ai/workflows/fiscal-calculos-update.md). Ele compara
o contrato estruturado do pipeline com o Delphi atual, exige que o desenvolvedor
classifique cada `change_id`, implementa incrementos semânticos e reproduz em Delphi
os testes oficiais já associados. O Workflow não recalcula o diff nem repete a
triagem do repositório de conformidade. Consulte o guia didático
[Caso Gold — atualização do Fiscal.Calculos](caso-gold-fiscal-calculos.md).

## Commands

Commands são pontos de entrada estáveis e manualmente acionáveis. Elas encaminham
para uma Skill ou Workflow sem copiar seu procedimento.

As Commands atuais incluem:

- [`implement-erp-feature`](../../.ai/commands/implement-erp-feature.md) — inicia
  ou retoma o Workflow canônico de feature;
- [`manage-ai-tool-setup`](../../.ai/commands/manage-ai-tool-setup.md) — planeja,
  aplica, verifica, troca ou remove os adapters gerados de uma ferramenta.
- [`update-fiscal-calculos`](../../.ai/commands/update-fiscal-calculos.md) — inicia
  ou retoma uma atualização entre duas tags oficiais da Calculadora RTC.

Exemplo portátil:

```text
Execute a Command implement-erp-feature para esta demanda:

Precisamos permitir...
```

Cada ferramenta poderá oferecer uma sintaxe diferente: slash command, item de
paleta, arquivo de prompt ou apenas linguagem natural. O adapter faz essa tradução.

Invocar `implement-erp-feature` inicia ou retoma o `workflow-orchestrator`, que
encaminha discovery e planejamento aos papéis especialistas. Isso não aprova
previamente a implementação nem autoriza automaticamente a execução de testes.

O setup de uma ferramenta também pode ser solicitado diretamente:

```text
Configure o setup do Kilo.
Mude para o AiderDesk.
Adicione o Codex.
Remova o setup do Kilo.
```

Essas solicitações usam `Scripts/AI/Sync-AIProfiles.ps1`. As fontes versionadas dos
adapters ficam em `docs/ia-assistida/setups-de-ferramentas/`; os diretórios das
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
- [`feature-planner`](../../.ai/agents/feature-planner.md): plano completo para
  aprovação e desenho técnico posterior, gravados diretamente nos arquivos
  atribuídos do run;
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

O agente inicia discovery, apresenta o plano e aguarda aprovação.

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

## Pendências e evolução

As decisões ainda abertas e o histórico das concluídas estão em
[`pending-checklist.md`](pending-checklist.md).

Quando uma pendência é concluída, ela é movida para o final daquele arquivo com a
caixa de seleção marcada. Isso preserva o histórico das decisões arquiteturais.
