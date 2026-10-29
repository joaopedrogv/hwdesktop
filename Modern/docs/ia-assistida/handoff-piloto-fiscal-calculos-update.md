# Handoff — piloto do Workflow `fiscal-calculos-update`

## 1. Recorte e resultado

Este documento registra o piloto iniciado na quarta-feira, 26 de agosto de 2026,
às 19:11, com a primeira execução de `update-fiscal-calculos`, até a conclusão
material do planejamento do intervalo `v0029` → `v0039`.

O run válido é:

```text
rtc-v0029-v0039-20260828T152807Z
```

Seus artefatos estão em
`.ai-runs/rtc-v0029-v0039-20260828T152807Z/`. O `state.json` registra:

```text
current_state: AWAITING_DISPOSITION_APPROVAL
last_valid_state: PLANNING
plan_revision: 4
known_blockers: []
next_permitted_transition: TECHNICAL_DESIGN
```

Há uma distinção importante:

- materialmente, o gate foi concluído: as 13 perguntas foram respondidas, os 42
  `change_id`s têm disposição única e o plano está pronto;
- formalmente, o estado persistido ainda aguarda a aprovação explícita da revisão
  final do `feature-plan.md`.

O próximo agente não deve repetir aquisição, snapshots, discovery ou planejamento.
Ele deve reconhecer ou obter a aprovação explícita da revisão 4, persistir a
decisão e então transicionar para `TECHNICAL_DESIGN`.

Este é um handoff humano em português. A fonte operacional canônica continua sendo
`AGENTS.md` e os artefatos em `.ai/`.

## 2. Fluxo validado

```text
/update-fiscal-calculos v0029 v0039 [run-id opcional]
        ↓
RECEIVED
        ↓
PREPARING_SOURCES
  1. rtc-update-inputs / Acquire
  2. rtc-implementation-evidence / Summary -AsJson
  3. rtc-source-snapshots / Prepare
        ↓
DISCOVERING
  C01...C12: seleção limitada + mapeamento read-only no Delphi
        ↓
PLANNING
  feature-planner / quality-critical
        ↓
AWAITING_DISPOSITION_APPROVAL
  respostas humanas + 42 disposições reconciliadas
        ↓
aprovação explícita da revisão final
        ↓
TECHNICAL_DESIGN
```

O piloto não autorizou nem realizou alterações em produção ou testes, build ou
execução de testes.

## 3. Primeira execução e simplificação da Command

Na primeira tentativa, com OpenRouter, a Command esperava tags, diretório local do
`calculadora-rtc-mirror`, caminhos locais da evidência e do guia e um identificador
de run. O agente tentou enumerar diretórios e `.ai-runs`, sondou caminhos prováveis,
encontrou bloqueios de permissão e respondeu em inglês.

A interface foi simplificada. Para um run novo, somente as tags exatas são
obrigatórias:

```text
/update-fiscal-calculos v0029 v0039
```

O terceiro argumento é reservado à retomada de um run conhecido:

```text
/update-fiscal-calculos v0029 v0039 rtc-v0029-v0039-20260828T152807Z
```

A Command agora:

- deriva objetivo e identificador de run;
- obtém as fontes dos dois repositórios GitHub canônicos;
- deriva `reports/<origem>-<destino>/` e os nomes padronizados do pacote;
- não enumera runs, não procura mirrors locais e não adivinha tags;
- se faltar uma tag, permanece em `RECEIVED` e pergunta somente o valor ausente,
  com exemplo compacto em português brasileiro;
- exige que toda comunicação visível ao desenvolvedor seja em português brasileiro.

Foram criados a Skill `rtc-update-inputs` e o script canônico
`Scripts/Fiscal.Calculos/Acquire-RTCUpdateInputs.ps1`.

## 4. Falhas do piloto e correções incorporadas

### 4.1 Atribuições agregadas e leitura ampla

O orquestrador inicialmente leu material desnecessário e tentou reunir planejamento,
aquisição e verificação. `PREPARING_SOURCES` passou a exigir três atribuições
sequenciais e independentes: `Acquire`, `Summary -AsJson` e `Prepare`.

O Orchestrator conserva estado, routing e comunicação. O `workflow-operator` lê a
Skill selecionada e executa somente o script da atribuição.

### 4.2 Compatibilidade de `git archive` com PowerShell

Os dois caminhos do pacote foram inicialmente passados ao `git archive` como um
único argumento. Isso ocorreu com passagem legada de argumentos nativos. O script
foi corrigido para usar argumentos escalares independentes e validado com
`$PSNativeCommandArgumentPassing = 'Legacy'`.

Essa tentativa também revelou estado inconsistente: a resposta dizia `BLOCKED`,
mas o JSON ainda conservava a atribuição como `issued`. O protocolo passou a
exigir, antes de comunicar a falha:

- preservar o último estado válido;
- persistir `BLOCKED` ou `FAILED`;
- encerrar terminalmente a atribuição;
- registrar bloqueio e retomada segura;
- interromper a fase afetada.

### 4.3 Validador incompatível com o pacote real

O leitor local exigia `CASE-000`, mas o contrato real usa `C01` e `C01-01`.
O pacote estava correto; a regra local era inventada. A validação passou a exigir
propriedades estruturais — valor não vazio, unicidade e vínculo coerente do change
com seu caso — sem impor estilo textual não definido no schema.

A aquisição publica seus artefatos atomicamente. Portanto, nas tentativas que
falharam antes da validação final, era correto existir apenas `state.json`, sem
`rtc-inputs/` parcial.

### 4.4 Sondagem indevida de permissão

Antes de preparar snapshots, o operador executou um comando auxiliar para testar a
permissão de terminal. A sondagem não constava da allowlist e sua negação foi
interpretada incorretamente como bloqueio global.

O papel e os adapters foram corrigidos para proibir sondagens: o operador invoca
diretamente e uma única vez o script canônico; somente a negação dessa invocação
exata conta como bloqueio. Scripts canônicos não podem ser substituídos por comandos
ad hoc.

Depois de corrigida a configuração da ferramenta, foi possível dizer na mesma
conversa que o problema estava resolvido e retomar. O `run-id` explícito é
especialmente necessário em outra conversa, quando o contexto não identifica o run
ou quando há mais de um candidato.

## 5. Preparação de fontes concluída

As três atribuições do run definitivo terminaram como `completed`:

| Papel / perfil | Skill / ação |
|---|---|
| `workflow-operator` / `fast-routine` | `rtc-update-inputs` / `Acquire` |
| `workflow-operator` / `fast-routine` | `rtc-implementation-evidence` / `Summary -AsJson` |
| `workflow-operator` / `fast-routine` | `rtc-source-snapshots` / `Prepare` |

Identidades fixadas:

| Item | Identidade |
|---|---|
| Origem `v0029` | `f7319e8ff1508ad62c44d69eff0a0b942bef6241` |
| Destino `v0039` | `50f3f8decf0d1d84453b5d221b31c365dc9e541f` |
| Pacote de conformidade | `bcbd6b191d4eb53695de09cc61ab029fe7ebbfbf` |
| SHA-256 da evidência | `859014426e4e452bb2b8866d503e9eabb26a7a2e62800bf6445060f3ff48a8f3` |
| SHA-256 do guia | `031f9a6fb16c17f481a1be49480f45cdffef9a4d5c9b2e0df342925a42b9a8b5` |

O pacote validado contém 12 casos e 42 mudanças. A cobertura registra 256 itens
relevantes, sendo 53 cobertos e 203 excluídos por triagem, 156 exclusões por escopo
e zero item de produção sem classificação. Há 84 cenários oficiais, 100 associações
e 82 testes oficiais únicos vinculados.

Os snapshots `from/v0029/` e `to/v0039/` foram preparados sob o run, sem trocar
checkout, criar worktree ou alterar repositório remoto.

## 6. Discovery, limite de etapas e retomada

Para cada caso C01 a C12, o operador selecionou somente a evidência necessária e o
`repository-researcher`, com `quality-critical`, fez o mapeamento read-only no
Delphi. Os resultados estão em `discovery-C01.md` a `discovery-C12.md`.

C01 a C08 foram concluídos; C09 sofreu erro transitório do modelo. A ferramenta
atingiu o limite máximo de etapas e encerrou o turno com resumo textual. Esse limite
é uma proteção por turno, não falha do Workflow: a persistência permitiu continuar.

Antes da retomada, o agente reconciliou o `state.json` e complementou C01 a C08
com arquivos inspecionados, distinção entre evidência e inferência e critérios de
aceitação. A retomada da sessão original de C09 falhou novamente; uma nova tentativa
limitada concluiu o caso. C10, C11 e C12 foram então processados pelo mesmo contrato.

Resultado final: `discovery_complete: true`, 12 artefatos presentes e nenhum caso
pendente.

## 7. Planejamento e decisões humanas

O `feature-planner` produziu o plano completo, mas não possuía escrita. Ele
entregou o conteúdo inline e o Orchestrator, autorizado a persistir artefatos
operacionais do run, gravou `feature-plan.md`.

O plano inicial tinha disposições compostas e 13 perguntas. As decisões foram
incorporadas em três rodadas:

- **Q1:** implementar somente `IRedutorCompraGovernamentalRepository`, port e
  adapter com vigência; sem Service.
- **Q2:** saídas continuam com 2/4 casas conforme o Java; cálculos internos de Base,
  CBS/IBS e IS usam 8 casas.
- **Q3:** `NumberService` é compartilhado intencionalmente com `ERP.Features`;
  HALF_EVEN repercute nos dois consumidores.
- **Q4:** conformar
  `TratamentoClassificacaoRepository.ObterTratamentoClassificacaoModel` ao Java
  `buscarTratamentoClassificacao`.
- **Q5:** C04-02 e C04-03 são N/A no Modern.
- **Q6a:** C06-01 é N/A porque o tipo Java não é utilizado.
- **Q6b:** C06-02/03/04 serão Use Cases internos, um por método de `NfseService`.
- **Q7:** C10-04 e C10-07 são N/A.
- **Q8:** C11-01, serialização XML, fica fora deste Workflow.
- **Q9:** pedágio, C05-04 e C12, fica fora do update Modern.
- **Q10:** `0` e `0,00` são equivalentes; permanece `0`.
- **Q11:** C08-04 passa a `implement`, propagando `gCompraGov` e `pRedutor`
  para cálculo e saída `oper`.
- **Q12:** manter `PreparacaoCalculoServiceInterUnit`. Após aprovação, o
  desenvolvedor remove manualmente `PreparacaoCalculoServiceClassUnit`, valida e
  confirma; uma revisão independente é obrigatória antes de continuar.
- **Q13:** reativar `Teste_totais_1.pas` conforme o teste Java.

Disposição final, sem sobreposição:

| Disposição | Quantidade |
|---|---:|
| `implement` | 20 |
| `already-satisfied` | 5 |
| `not-applicable` | 16 |
| `deferred` | 1 |
| `needs-investigation` | 0 |
| **Total** | **42** |

O único adiado é C07-01.

## 8. Incrementos definidos

1. **INC-01 — arredondamento e precisão:** C05-01/02/03; fundacional e de alto
   risco.
2. **INC-02 — entrada e validações:** C02-01/02 e conformidade C08-01/02/03.
3. **INC-03 — compra governamental IBS/CBS:** C01-01 a C01-06 e lado de cálculo de
   C08-04; depende de INC-01.
4. **INC-04 — saída ROC:** C04-01 e lado de saída de C08-04; depende de INC-03.
5. **INC-05 — memória e layout:** C09-04, conformidade C03/C09 e reativação de
   `Teste_totais_1.pas`.
6. **INC-06 — indicadores/classificação:** C06-02/03/04/05.

Testes acompanham cada incremento. A reprodução Delphi dos testes oficiais,
revisões independentes, build e execução de `Fiscal.Calculos.Tests` preservam
suas autorizações próprias.

## 9. Regra canônica criada após o plano

Foi criada `.ai/rules/fiscal-calculos.md`, aplicável somente a
`Fiscal.Calculos/**`. Ela determina:

- novo arquivo Delphi com correspondência direta mantém o nome simples Java e
  acrescenta apenas `Unit` ao arquivo e à unit;
- o tipo Delphi principal mantém o nome Java e seus sufixos semânticos;
- se a correspondência exata for tecnicamente impossível, incluir comentário curto:

```pascal
// Java: source/src/main/java/.../CompraGovernamentalDomain.java
```

- não renomear retroativamente; cada rename deve constar individualmente do desenho
  técnico e atualizar declaração, `uses` e projetos;
- todo novo arquivo de produção deve entrar, no mesmo incremento, em
  `package/pkModern.dpk` e `package/pkModern.bdsproj`;
- toda produção de `Fiscal.Calculos/` permanece Delphi 2006.

`.ai/rules/coding-standards.md` referencia a Rule especializada, que prevalece
nesse escopo. Por decisão explícita, o Workflow não foi alterado para duplicar as
regras e não foi criado `Fiscal.Calculos/AGENTS.md`.

## 10. Marcos versionados

| Commit | Resultado |
|---|---|
| `8ec6be5` | aquisição GitHub, Skill, script e interface simplificada |
| `94bc6c9` | atribuições sequenciais e validações refinadas |
| `82938f2` | persistência fail-closed e correção de `git archive` |
| `e5b3f9d` | retomada por run-id e validação estrutural dos IDs |
| `f69ac8a` | invocação direta, sem sondagens de permissão |
| `2d7d75e` | Rule Fiscal.Calculos, nomes Java e registro em pkModern |

As correções alcançaram artefatos canônicos, scripts, adapters de AiderDesk e Kilo
Code e documentação humana. Adapters continuam sem autoridade própria.

## 11. Artefatos para continuação

Canônicos principais:

- `AGENTS.md`;
- `.ai/commands/update-fiscal-calculos.md`;
- `.ai/workflows/fiscal-calculos-update.md`;
- `../.ai/agents/orchestration-protocol.md`;
- `../.ai/agents/workflow-orchestrator.md` e `workflow-operator.md`;
- `.ai/context/fiscal-calculos-context.md`;
- `.ai/rules/fiscal-calculos.md` e `coding-standards.md`;
- Skills `rtc-update-inputs`, `rtc-implementation-evidence`,
  `rtc-source-snapshots` e `delphi-fiscal-calculos-test-runner`.

Operacionais:

- `state.json`, `feature-plan.md` e `evidence-summary.json`;
- `discovery-C01.md` a `discovery-C12.md`;
- manifests e fontes sob `rtc-inputs/` e `rtc-sources/`.

`.ai-runs/` é operacional e não versionado; não é documentação canônica.

## 12. Procedimento exato de retomada

1. Retomar o run exato:

   ```text
   /update-fiscal-calculos v0029 v0039 rtc-v0029-v0039-20260828T152807Z
   ```

2. Ler somente seu `state.json` e o `feature-plan.md` revisão 4.
3. Não repetir preparação, discovery ou planning.
4. Obter ou reconhecer a aprovação explícita da revisão final.
5. Persistir a aprovação e transicionar para `TECHNICAL_DESIGN`.
6. Produzir o desenho técnico preservando os seis incrementos e a etapa manual Q12.
7. Aplicar `.ai/rules/fiscal-calculos.md` antes de criar ou renomear arquivos e
   prever os dois registros de `pkModern`.
8. Só implementar com autorização. Build e execução de testes continuam separados.

## 13. Pontos de atenção não bloqueadores

- Limite de etapas encerra um turno, não o Workflow; persista e continue.
- Especialista sem escrita pode devolver artefato inline; o Orchestrator pode
  persistir o artefato operacional.
- Erro transitório deve usar retomada da sessão quando possível e nova tentativa
  limitada quando a retomada falhar repetidamente.
- Negação de comando auxiliar não prova bloqueio do script canônico; não sondar.
- Q12 exige intervenção real e revisão; a aprovação geral não a cumpre.

O plano revisão 4 está pronto. O próximo marco é sua aprovação formal, se ainda não
registrada, seguida de `TECHNICAL_DESIGN` — não implementação imediata.
