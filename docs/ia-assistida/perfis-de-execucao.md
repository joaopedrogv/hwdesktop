# Perfis de execução de Agents e Subagents

## Por que estes perfis existem

Escolher apenas “um modelo forte” ou “um modelo barato” é insuficiente.

Uma tarefa possui necessidades independentes:

- capacidade mínima do modelo;
- profundidade de raciocínio;
- tolerância ao tempo de resposta;
- prioridade de custo;
- risco de uma resposta incorreta.

Os perfis de execução descrevem essas necessidades sem citar fornecedor ou modelo.
Cada adapter traduz o perfil para as opções disponíveis na ferramenta utilizada.

A definição operacional canônica está em
[`.ai/agents/execution-profiles.md`](../../.ai/agents/execution-profiles.md).

O arquivo canônico contém uma tabela curta e orientações de escolha. Esta página
desenvolve os conceitos para consulta humana. Perfis são orientação para configurar
e escolher Agents, sem acrescentar etapas ou gates ao atendimento de uma tarefa.
Uma escolha explícita do desenvolvedor deve ser respeitada; dificuldades concretas
devem ser informadas pelo agente.

## Perfil da tarefa versus perfil de execução

São conceitos diferentes.

### Perfil da tarefa

Descreve a natureza do trabalho:

- `routine`: determinístico, delimitado e de baixo risco;
- `analytical`: exige interpretação, comparação ou revisão;
- `critical`: envolve alto impacto, ambiguidade ou decisões difíceis de reverter.

### Perfil de execução

Descreve os recursos necessários para realizar a tarefa:

- capacidade do modelo;
- deliberação/raciocínio;
- prioridade de latência;
- prioridade de custo.

```text
perfil da tarefa
      ↓
perfil de execução necessário
      ↓
adapter da ferramenta
      ↓
modelo e configuração concretos
```

## As quatro dimensões

### 1. Capacidade

É o piso de competência necessário.

| Valor | Uso |
|---|---|
| `efficient` | trabalho focado, mecânico e completamente especificado |
| `general` | programação normal e interpretação local |
| `advanced` | arquitetura, domínio complexo, segurança, fiscal ou decisões transversais |

Capacidade não é o mesmo que raciocínio. Aumentar o esforço de raciocínio de um
modelo não garante que ele adquira conhecimentos, precisão ou capacidade que não
possui.

### 2. Deliberação

É a profundidade de raciocínio esperada.

| Valor | Uso |
|---|---|
| `light` | seguir instruções completas e padrões estabelecidos |
| `standard` | comparar evidências e tomar decisões locais |
| `deep` | explorar ambiguidades, riscos e efeitos transversais |

Um modelo avançado pode usar deliberação leve em uma tarefa simples. Uma tarefa
crítica pode exigir simultaneamente capacidade avançada e deliberação profunda.

### 3. Prioridade de latência

Representa quanto tempo estamos dispostos a aceitar em troca de qualidade.

| Valor | Uso |
|---|---|
| `interactive` | feedback rápido durante a programação |
| `balanced` | equilíbrio entre rapidez e qualidade |
| `flexible` | aceita maior duração quando a qualidade é prioritária |

Esses valores não são SLAs. O tempo real depende do modelo, ferramenta, tamanho do
contexto e operações externas.

### 4. Prioridade de custo

| Valor | Uso |
|---|---|
| `cost_sensitive` | minimizar custo sem violar capacidade e segurança |
| `balanced` | equilibrar custo, latência e qualidade |
| `quality_first` | priorizar correção e redução de risco |

Custo nunca pode justificar uma configuração abaixo da capacidade mínima da tarefa.

## Presets canônicos

### `fast-routine`

```yaml
capability: efficient
deliberation: light
latency: interactive
cost: cost_sensitive
```

Usar quando:

- as entradas estão completas;
- existe procedimento estabelecido ou uma transformação local totalmente definida;
- a tarefa é mecânica e facilmente verificável;
- uma falha é simples de detectar e corrigir.

Exemplos:

- localizar arquivos e referências;
- extrair nomes ou estruturas;
- validar links e formatação;
- executar uma transformação mecânica bem especificada.

Uma Skill não é requisito para usar o implementador fast. A escolha considera a
tarefa solicitada, sem depender de um catálogo de cenários ou do perfil usado em
trabalhos anteriores. Os exemplos desta página são apenas ilustrativos.

### `balanced-work`

```yaml
capability: general
deliberation: standard
latency: balanced
cost: balanced
```

Usar para:

- implementação normal de código;
- interpretação de padrões locais;
- aplicação de Skills com alguma decisão contextual;
- criação de testes;
- revisão de incrementos comuns.

Esse é o perfil padrão do `increment-implementer` e do
`increment-reviewer`.

### `quality-critical`

```yaml
capability: advanced
deliberation: deep
latency: flexible
cost: quality_first
```

Usar quando a tarefa envolver:

- arquitetura entre camadas;
- segurança, autenticação ou autorização;
- comportamento fiscal;
- desenho ou alteração sensível de schema;
- transações e ownership;
- contratos públicos;
- risco para dados de produção;
- erros difíceis ou caros de detectar.

Mesmo com esse perfil, decisões materiais continuam pertencendo ao papel especialista
apropriado e aos gates de aprovação humana. O orquestrador não passa a tomar a
decisão apenas porque utiliza uma configuração mais capaz.

## Skills que começam em `fast-routine`

A lista abaixo cobre procedimentos especializados já disponíveis; ela não limita
as tarefas mecânicas que o perfil fast pode receber diretamente.

As seguintes Skills foram classificadas para iniciar em `fast-routine` quando
recebem entradas completas e executam apenas a transformação já estabelecida:

- `delphi-record-encapsulation`;
- `sql-table-to-delphi-entity`;
- `sql-table-to-delphi-metadata`;
- `delphi-entity-validation`;
- `delphi-dataset-grid`;
- `delphi-cadastro-form-scaffold`;
- `delphi-ui-form-validation`;
- `database-migration`.

Essa classificação não torna todo uso dessas Skills mecânico. Cada Skill contém
suas condições de entrada e elevação. Por exemplo, validações precisam ter regras
já definidas, o scaffold precisa ter seus contratos e componentes conhecidos, e
uma migration precisa partir de uma alteração física previamente aprovada.

Se surgir interpretação de negócio, ambiguidade de integração ou desvio do padrão,
o trabalho sobe para `balanced-work`. Decisões de schema, alterações destrutivas,
risco para dados de produção e outras fronteiras críticas exigem
`quality-critical` e continuam sujeitas à aprovação humana.

O papel continua sendo `increment-implementer`; o que muda é o perfil de execução
solicitado ao adapter. O modelo concreto permanece uma configuração específica de
cada ferramenta.

## Perfis dos Agents atuais

| Agent | Perfil padrão | Quando alterar |
|---|---|---|
| `workflow-orchestrator` | `fast-routine` | elevar apenas se houver ambiguidade real na própria orquestração; a elevação não autoriza trabalho especialista |
| `repository-researcher` | `fast-routine` | usar `balanced-work` quando houver evidências conflitantes ou pesquisa transversal |
| `feature-planner` | `quality-critical` | usar `balanced-work` somente quando a atribuição comprovar baixo risco e ausência de fronteiras críticas |
| `increment-implementer` | `balanced-work` | usar `fast-routine` apenas em trabalho mecânico; tarefas críticas exigem atribuição explícita e revisão equivalente |
| `increment-reviewer` | `balanced-work` | usar `quality-critical` para schema, segurança, fiscal, transações, arquitetura ou revisão integrada de alto risco |

Nos setups atuais de Kilo Code e AiderDesk, `repository-researcher` possui variantes
`fast-routine` e `quality-critical`. `increment-implementer` possui variantes
`fast-routine`, `balanced-work` e `quality-critical`. Essas variantes são adapters
do mesmo papel canônico e permitem cumprir exatamente o perfil solicitado pelo
Workflow sem elevar todas as tarefas comuns.

## Como um adapter deve mapear os perfis

Um adapter conhece os modelos e controles oferecidos pela ferramenta. Ele deve:

1. identificar quais opções atendem à capacidade mínima;
2. mapear a deliberação para o controle equivalente de raciocínio;
3. considerar prioridade de latência e custo;
4. verificar suporte às ferramentas necessárias;
5. escolher a configuração concreta;
6. usar fallback seguro quando não houver correspondência exata.

Regras de fallback:

- é permitido escolher uma configuração superior;
- não é permitido reduzir silenciosamente capacidade ou deliberação;
- se não houver configuração segura, retornar a atribuição como bloqueada;
- se o Workflow exigir separação de papéis e não houver Subagents, usar o modo
  manual supervisionado;
- o orquestrador nunca executa silenciosamente o papel ausente;
- registrar aproximações relevantes no adapter.

## Exemplos de decisão

### Pesquisa simples

```text
Tarefa: localizar exemplos de TDataSetGrid no mesmo microcontexto
Perfil da tarefa: routine
Execução: fast-routine
```

### Implementação orientada por Skill

```text
Tarefa: gerar metadata para uma Entity e tabela aprovadas
Perfil da tarefa: routine/analytical
Execução: fast-routine ou balanced-work
```

A escolha depende da clareza das entradas e da necessidade de resolver mapeamentos
ambíguos.

### Revisão de transação

```text
Tarefa: revisar commit, rollback e ownership de um novo Use Case
Perfil da tarefa: critical
Execução: quality-critical
```

## Como evitar configurações inadequadas

Não assumir que:

- mais raciocínio sempre produz melhor resultado;
- um modelo econômico com raciocínio máximo equivale a um modelo avançado;
- toda tarefa de código exige o perfil mais caro;
- latência pode ser garantida apenas pelo perfil;
- o mesmo mapeamento continuará ideal após trocar modelo ou fornecedor.

O adapter deve ser calibrado com tarefas reais do projeto. Compare:

- sucesso da tarefa;
- correção e completude;
- evidências apresentadas;
- problemas encontrados na revisão;
- latência;
- consumo de recursos;
- custo.

Uma configuração só deve ser rebaixada quando avaliações representativas mostrarem
que o nível de qualidade e segurança continua atendido.

## Resumo prático

```text
fast-routine
→ rápido, econômico, mecânico e verificável

balanced-work
→ programação e análise normais

quality-critical
→ qualidade máxima para riscos altos
```

O perfil declara a necessidade. O adapter escolhe a tecnologia concreta.
