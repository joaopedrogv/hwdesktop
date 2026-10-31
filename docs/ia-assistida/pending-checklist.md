# Arquitetura de IA — Checklist de pendências

Este checklist contém somente trabalhos ainda não resolvidos na estrutura canônica
de desenvolvimento assistido por IA.

Os itens estão organizados aproximadamente na ordem recomendada de execução. Uma
decisão pode resultar na criação de um artefato ou na conclusão explícita de que ele
não é necessário.

Quando uma pendência for concluída, movê-la para a seção **Pendências concluídas** no
final deste arquivo e manter sua caixa de seleção marcada. Não apagar o histórico das
decisões concluídas.

Desde 29/10/2026, modelos concretos são escolhas individuais na pasta config.
Os nomes de modelos em itens concluídos abaixo são histórico de calibração;
não constituem recomendação ou configuração vigente. O perfil local principal do
Kilo é coordinator; o nome anterior colidia com o agente nativo depreciado.

## 1. Prioridade atual — Caso Gold de atualização do `Fiscal.Calculos`

O Caso Gold possui prazo de entrega e passa a ser a prioridade atual. As
calibrações de ferramentas e demais melhorias permanecem registradas, mas não devem
interromper sua preparação e execução.

- [ ] Executar o Caso Gold real por meio do Workflow aprovado e registrar os ajustes
  necessários antes de considerar esse processo estabilizado.

## 2. Pendências não impeditivas — ferramentas de IA

Retomar esta seção depois da entrega do Caso Gold.

- [ ] Repetir, em momento oportuno, a validação operacional de `Plan`, `Apply` e
  `Check` dos setups gerados, embora o ciclo já tenha sido exercitado durante a
  criação da automação.
- [ ] Executar no Kilo Code um piloto controlado de `implement-erp-feature` e
  confirmar: modelos realmente chamados, permissões com delegação nativa no Kilo
  oficial, orquestrador no agente principal, gravação direta dos planos pelo planner,
  invocação Task explícita do Agent nomeado, estado em `.ai-runs/`, gates humanos,
  retorno estruturado e ausência de delegação aninhada.
- [ ] Validar no AiderDesk os oito perfis locais e verificar se a invocação nativa
  explícita executa o Subagent nomeado com suas próprias permissões, sem continuar
  a responsabilidade no contexto do orquestrador.
- [ ] Manter o AiderDesk em modo manual supervisionado para o Workflow de feature
  enquanto o contrato de delegação segura não estiver comprovado.
- [ ] Comparar Kilo Code e AiderDesk em uma tarefa representativa do Workflow
  completo quanto a correção, completude, latência, consumo e custo.
- [ ] Consolidar, após o piloto, os mapeamentos concretos de `fast-routine`,
  `balanced-work` e `quality-critical`, registrando somente os modelos e níveis de
  deliberação comprovados.
- [ ] Avaliar se o setup deve persistir opções locais de roteamento do OpenRouter,
  como `options.provider.only`; hoje o override local preserva o ID do modelo, mas
  não essas preferências opcionais de provider.
- [ ] Criar ou reconciliar os adapters de `workflow-orchestrator` e
  `feature-planner` e os contratos atualizados dos papéis existentes em OpenCode e
  Antigravity IDE.
- [ ] Incorporar futuramente os adapters específicos de OpenCode e Antigravity à
  automação `Sync-AIProfiles.ps1`, depois de suas configurações serem reconciliadas
  com os cinco papéis canônicos.
- [ ] Executar no Codex um piloto controlado de um Workflow completo, confirmando a
  descoberta das Commands como Skills, a invocação explícita de cada Custom Agent,
  a herança do sandbox da sessão principal, o ownership dos perfis, a gravação pelo
  planner, os gates humanos e o estado persistente.
- [ ] Reavaliar adapters estáticos para o Antigravity IDE quando a ferramenta
  disponibilizar Custom Agents de workspace adequados ao protocolo.

## 3. Outras melhorias não impeditivas

- [ ] Definir uma estratégia de compatibilidade e versionamento para fontes externas
  sincronizadas quando uma nova versão alterar schema, formato ou semântica dos
  dados, incluindo detecção, bloqueio seguro e necessidade de atualização do ERP.
- [ ] Avaliar automação por linha de comando para `ERP.IntegrationTests`, incluindo
  configuração segura de banco e infraestrutura.

## 4. Validação final

Antes de considerar a arquitetura de IA concluída:

- [ ] Verificar todas as referências entre arquivos canônicos.
- [ ] Confirmar que Rules contêm restrições, não documentação ou procedimentos.
- [ ] Confirmar que Context contém conhecimento específico útil, não explicações
  genéricas.
- [ ] Confirmar que Skills representam capacidades ou procedimentos especializados
  e reutilizáveis.
- [ ] Confirmar que Workflows representam orquestrações genuínas de múltiplas etapas.
- [ ] Confirmar que adapters não possuem conhecimento independente.
- [ ] Confirmar que a documentação humana em `docs/ia-assistida/` referencia as
  fontes canônicas sem substituí-las.
- [ ] Verificar que contextos e Skills não relacionados não são carregados por padrão.
- [ ] Remover arquivos auxiliares ou pacotes que não pertençam à distribuição
  canônica.
- [ ] Fazer uma execução piloto de `erp-feature-implementation` em uma feature real
  e registrar ajustes necessários.

## Pendências concluídas

Os itens abaixo preservam as decisões de cada etapa, inclusive opções posteriormente
substituídas. A seção de simplificação de outubro de 2026, no final do arquivo,
substitui o papel operacional separado, a dependência do fork e o planner somente
leitura descritos no histórico.

### Reconciliação da fonte da calculadora — 28/10/2026

- [x] Incorporar a confirmação do responsável de que a API substituiu a importação
  de `calculadora.db`/SQLite. Atualizar stack, sincronização, contexto fiscal,
  restrição de banco e explicação humana. Os itens históricos de stack abaixo
  descrevem decisões anteriores e não tornam o fluxo antigo vigente.
- [x] Preservar a restrição de uso de SQLite, as regras de população das tabelas
  espelho e a pendência sobre compatibilidade de fontes externas. A existência de
  componentes de versão da API não resolve, por si só, essa estratégia.

### Integração ativa do Codex

- [x] Confirmar na documentação oficial vigente que o Codex carrega `AGENTS.md`,
  descobre Skills de repositório em `.agents/skills/` e aceita Custom Agents de
  projeto em `.codex/agents/*.toml`.
- [x] Expor as Commands canônicas como Skills compartilhadas, substituindo a ideia
  de Custom Prompts locais, que estão depreciados no Codex.
- [x] Criar os nove adapters Codex para os seis papéis canônicos, com invocação
  explícita dos Specialists, proibição de delegação aninhada e sandbox somente
  leitura para researcher, planner e reviewer.
- [x] Mapear inicialmente `fast-routine` para `gpt-5.6-luna`/`low`,
  `balanced-work` para `gpt-5.6-terra`/`medium` e `quality-critical` para
  `gpt-5.6-sol`/`high`, preservando override local e calibração posterior.
- [x] Incorporar Codex a `Sync-AIProfiles.ps1` com `Plan`, `Apply`, `Check`,
  `Remove`, `Switch`, estado gerado e dependência do componente Shared.

### Correções do segundo piloto remoto do Caso Gold

- [x] Tornar a extração do pacote de conformidade compatível com o modo legado de
  passagem de argumentos nativos do PowerShell, enviando os dois arquivos ao
  `git archive` como argumentos escalares separados.
- [x] Exigir que bloqueios e falhas sejam persistidos no `state.json` antes da
  comunicação ao desenvolvedor, sem deixar a atribuição como ativa ou `issued`.
- [x] Reconciliar o leitor de evidências com o contrato real do pacote de
  conformidade, que identifica casos como `C01` e mudanças como `C01-01`, sem
  exigir o formato inexistente `CASE-001`; validar identidade, unicidade e vínculo
  estrutural sem impor ao pipeline um estilo local de identificador.
- [x] Impedir o `workflow-operator` de testar permissões por um comando auxiliar:
  ele deve invocar diretamente o script canônico atribuído, pois a negativa de um
  probe fora da allowlist não demonstra que o script esteja bloqueado.

### Correções do primeiro piloto remoto do Caso Gold

- [x] Confirmar que as tags `v0029` e `v0039` e o horário UTC foram preservados
  corretamente no estado operacional do teste.
- [x] Impedir o orquestrador de enumerar `.ai/`, abrir Skills ou scripts e carregar
  Rules de banco, Delphi ou testes durante `RECEIVED` e `PREPARING_SOURCES`.
- [x] Substituir a atribuição composta `Plan -> Acquire -> Check` por três Tasks
  sequenciais e independentes: `Acquire`, `Summary -AsJson` e `Prepare`.
- [x] Tornar `Acquire` e `Prepare` autoverificáveis, reservando `Plan` para
  diagnóstico manual e `Check` para retomada ou verificação explícita.
- [x] Configurar o operator do Kilo com terminal negado por padrão e allowlist
  somente dos três scripts canônicos, sem cadeias, redirecionamento ou segundo
  comando para consultar exit code.
- [x] Reconciliar os adapters de Kilo e AiderDesk e a documentação humana com as
  correções observadas no piloto.

### Interface remota do Caso Gold

- [x] Simplificar `update-fiscal-calculos` para exigir somente as tags exatas de
  origem e destino no fluxo normal.
- [x] Derivar automaticamente os repositórios GitHub canônicos, o diretório
  `reports/<origem>-<destino>/`, os nomes do JSON e do guia, o objetivo padrão e
  um identificador único para novas execuções.
- [x] Criar a Skill `rtc-update-inputs` e a automação
  `Acquire-RTCUpdateInputs.ps1` para aquisição Git somente leitura, fixada por
  commits e hashes dentro de `.ai-runs/<run-id>/`.
- [x] Manter credenciais fora da configuração e limitar a rede do
  `workflow-operator` aos dois repositórios embutidos no script canônico.
- [x] Fazer chamadas incompletas permanecerem em `RECEIVED`, solicitarem somente
  as tags ausentes em português brasileiro e apresentarem um exemplo pronto.
- [x] Reconciliar Workflow, Context, Skills, Agents, adapters de Kilo Code e
  AiderDesk e documentação humana com a aquisição remota.

### Fronteira de contexto da documentação humana

- [x] Definir em `AGENTS.md` que `docs/ia-assistida/` não participa do contexto de
  programação, Workflows, Commands, Skills ou delegações normais.
- [x] Permitir acesso à documentação humana somente quando o desenvolvedor colocar
  sua manutenção ou as fontes de setup explicitamente no escopo da tarefa.
- [x] Remover referências canônicas que induziam leitura do checklist ou do README
  dos setups durante operações normais.
- [x] Remover `Scripts/AI/README.md` e preservar `Scripts/AI/` somente para scripts.
- [x] Confirmar que os 12 prompts e templates ativos de Kilo e AiderDesk entram por
  `AGENTS.md` e não apontam para `docs/ia-assistida/`.

### Handoff permanente e manutenção futura

- [x] Criar um handoff versionado em português brasileiro que registre arquitetura,
  autoridade, rotas mínimas de leitura, lifecycle dos setups, manutenção por
  cenário, validações, pendências e estado verificado.
- [x] Integrar o handoff aos índices humanos sem transformá-lo em artefato canônico
  diretamente roteável nem duplicar o controle de pendências.

### Distribuição e instalação dos setups de ferramentas

- [x] Ignorar integralmente `.kilo/`, `.opencode/` e `.codex/` na raiz, preservando
  os adapters preliminares de OpenCode e Codex fora dos diretórios ativos como
  material pendente de reconciliação.
- [x] Declarar no manifesto do Kilo a allowlist de artefatos de runtime
  regeneráveis e fazer `Remove` apagá-los antes de excluir `.kilo/` quando vazio.
- [x] Manter as fontes versionadas de Agents, Commands, prompts, presets e wrappers
  de Kilo e AiderDesk em `_automation/ai/tool-setup/`, deixando seus
  destinos na raiz como artefatos gerados e ignorados.
- [x] Separar `agents.json`, `models.json`, templates e presets, mantendo nomes de
  modelos fora dos perfis e do script.
- [x] Criar override opcional `models.local.json`, ignorado pelo Git, sem permitir
  credenciais ou tokens nos mapeamentos.
- [x] Implementar `_automation/ai/Sync-AIProfiles.ps1` em PowerShell 7, sem dependências
  externas, com `Plan`, `Apply`, `Check`, `Switch`, `Remove` e `-WhatIf`.
- [x] Gerar automaticamente `projectDir`, `order.json`, IDs habilitados, modelos e
  wrappers mínimos das Skills canônicas.
- [x] Adotar manifestos `.modern-ai-setup.json`, recusar conflitos com arquivos
  desconhecidos e remover somente arquivos registrados como gerenciados.
- [x] Remover somente diretórios pertencentes aos caminhos gerenciados quando
  vazios e excluir a raiz da ferramenta apenas quando ela ficar completamente vazia.
- [x] Manter o componente Shared independente para `.agents/`, impedindo sua remoção
  enquanto Kilo ou AiderDesk estiverem instalados.
- [x] Criar a Command canônica `manage-ai-tool-setup` e adapters correspondentes
  para permitir configuração, verificação, troca e remoção por linguagem natural.
- [x] Migrar os adapters rastreados de `.kilo/`, `.aider-desk/` e `.agents/` para as
  novas fontes, instalar os setups gerados e validar estado sem drift.
- [x] Resolver a portabilidade do `projectDir` do AiderDesk calculando o caminho no
  momento da instalação, sem armazená-lo nas fontes versionadas.

### Incorporação dos handoffs de orquestração e Kilo Code

- [x] Confirmar que o fork do Kilo Code no commit `d29f800f0b` já foi instalado e
  validado pelo desenvolvedor, sem repetir essa instalação ou validação.
- [x] Exigir no protocolo canônico uma invocação nativa, explícita e observável do
  Agent nomeado exatamente uma vez por tentativa de atribuição, impedindo que o
  orquestrador apenas adote o papel ou execute sua Skill no próprio contexto.
- [x] Adotar perfis de Agent locais e versionados por ferramenta, deixando eventual
  melhoria do mecanismo de distribuição para depois da configuração dos perfis.
  Decisão posteriormente refinada: as fontes continuam locais e versionadas em
  `docs/`, enquanto os destinos das ferramentas são gerados e ignorados.
- [x] Fixar inicialmente `quality-critical` em `gemini-2.5-pro`, `balanced-work` em
  `gemini-flash-latest` e `fast-routine` em `gemini-flash-lite-latest` nos adapters
  locais de AiderDesk e Kilo Code.
- [x] Criar no AiderDesk os seis perfis locais, restringir suas permissões conforme
  os papéis canônicos e registrar todos os IDs em `order.json`.

- [x] Incorporar o modelo operacional canônico com os cinco papéis, estado
  persistente em `.ai-runs/`, contratos estruturados, gates humanos, fail-closed e
  modo manual supervisionado.
- [x] Registrar o diagnóstico de propagação de permissões do Kilo Code oficial
  `v7.4.23` e a correção do fork no commit `d29f800f0b`, sem transportar o campo
  específico `delegate` para `.ai/`.
- [x] Criar os adapters Kilo Code de `modern-workflow-orchestrator` e
  `modern-feature-planner` com separação estrita de responsabilidades.
- [x] Atualizar os adapters Kilo existentes para atribuição e retorno estruturados,
  protocolo fail-closed e proibição de comunicação direta de gates ou delegação
  aninhada.
- [x] Atualizar a Command do Kilo para iniciar ou retomar o orquestrador e recorrer
  ao modo manual supervisionado quando a delegação segura não estiver disponível.
- [x] Documentar em português o requisito do fork, a diferença entre
  `permission.task` e `delegate`, os oito perfis locais e o fallback seguro.
- [x] Conciliar o estado das demais ferramentas, mantendo AiderDesk pendente de
  validação operacional e OpenCode, Codex e Antigravity como melhorias não
  impeditivas.
- [x] Atualizar a Command do AiderDesk para exigir o orquestrador validado ou usar
  explicitamente o modo manual supervisionado, sem substituição silenciosa de
  papéis especialistas.

### Modelo operacional canônico dos agentes

- [x] Avaliar modelos comunitários de desenvolvimento dirigido por especificação,
  manager/workers, estado persistente e avaliação independente sem adotar
  integralmente um framework incompatível com o Modern.
- [x] Adotar um Workflow Orchestrator stateful e fail-closed que controla routing,
  gates, ownership, resultados e comunicação sem executar trabalho especialista.
- [x] Criar os papéis canônicos `workflow-orchestrator` e `feature-planner`, mantendo
  `repository-researcher`, `increment-implementer` e `increment-reviewer`.
- [x] Definir contratos estruturados de atribuição e retorno, estados da execução,
  correções limitadas, ownership e concorrência segura.
- [x] Permitir intervenção manual do desenvolvedor e retomada da mesma execução,
  exigindo revisão independente para arquivos alterados e nova aprovação para
  mudanças materiais.
- [x] Substituir o fallback no agente principal por modo manual supervisionado quando
  a ferramenta não puder invocar o papel necessário.
- [x] Separar o estado operacional em `.ai-runs/`, ignorado pelo Git, das instruções
  canônicas em `.ai/`.
- [x] Integrar os papéis obrigatórios, a revisão independente por incremento e a
  revisão final ao Workflow `erp-feature-implementation`.
- [x] Criar a documentação didática em português
  `docs/ia-assistida/modelo-operacional-de-agentes.md`.
- [x] Executar uma simulação de mesa com sucesso, falha de delegação, intervenção
  manual, limite de correções, falha de execução autorizada, mudança material e
  modo manual supervisionado.

### Adapters iniciais de AiderDesk, OpenCode, Codex e Antigravity

- [x] Identificar os mecanismos nativos relevantes de AiderDesk, OpenCode, Codex e
  Antigravity para Rules, Skills, Commands e Subagents.
- [x] Preservar a remoção do `.aider.conf.yml` obsoleto feita pelo desenvolvedor.
- [x] Remover de `.agents/rules/` e `.agents/workflows/` os adapters antigos que
  duplicavam conhecimento e apontavam para caminhos canônicos obsoletos.
- [x] Reservar `.agents/skills/` a wrappers mínimos compartilhados por OpenCode,
  Codex e Antigravity, mantendo o procedimento somente em `.ai/skills/`.
- [x] Criar wrappers equivalentes em `.aider-desk/skills/`, conforme o caminho de
  descoberta próprio do AiderDesk.
- [x] Mapear `implement-erp-feature` para as slash commands de AiderDesk, OpenCode e
  Antigravity, preservando a invocação portátil por linguagem natural em qualquer
  ferramenta.
- [x] Criar adapters dos três Agents canônicos para OpenCode e Codex, sem fixar
  prematuramente fornecedor, modelo ou esforço de raciocínio.
- [x] Criar a Rule de entrada e o Workflow de feature do Antigravity, reutilizando
  as Skills já expostas em `.agents/skills/`.
- [x] Registrar que Custom Agents versionados ainda não devem ser criados para o
  Antigravity IDE enquanto esse suporte não estiver disponível na ferramenta.
- [x] Reutilizar no AiderDesk a ponte de roteamento compartilhada
  `.agents/rules/00-canonical-routing.md`, sem carregar indiscriminadamente todas
  as Rules canônicas.
- [x] Configurar localmente a extensão `external-rules` com
  `{"ruleFolders": ".agents/rules"}`.
- [x] Remover a cópia redundante de roteamento em `.aider-desk/rules/`.
- [x] Configurar globalmente no AiderDesk os Subagents
  `modern-repository-researcher`, dois `modern-increment-implementer` alternativos
  e `modern-increment-reviewer`, mapeados aos três papéis canônicos. Configuração
  inicial posteriormente substituída pelos seis perfis locais versionados.
- [x] Mapear inicialmente `fast-routine` para `gemini-flash-lite-latest`,
  `balanced-work` de implementação para `minimax-m3:cloud` e
  `gemini-3.7-flash`, e revisão `balanced-work`/`quality-critical` para
  `gemini-2.5-pro`. Calibração inicial posteriormente substituída pelo mapeamento
  local unificado dos três perfis de execução.
- [x] Manter os Subagents do AiderDesk sob demanda, sem memória e sem delegação
  aninhada, com confirmação para operações de escrita dos implementadores e
  reviewer somente leitura.
- [x] Manter os System Prompts do AiderDesk como adapters mínimos para `AGENTS.md`,
  o papel canônico correspondente e `.ai/agents/execution-profiles.md`.
- [x] Manter `.ai/` como única fonte canônica e documentar os adapters em português
  em `docs/ia-assistida/adapters-de-ferramentas.md`.

### Avaliação e perfis locais do Kilo Code

- [x] Confirmar que o Kilo Code carrega `AGENTS.md` e descobre nativamente as Skills
  em `.agents/skills/`.
- [x] Configurar os cinco perfis `modern-*` como Subagents mapeados aos três papéis
  canônicos, incluindo um implementador genérico que herda o modelo principal.
- [x] Mapear inicialmente `fast-routine` para
  `google/gemini-flash-lite-latest`, implementação `balanced-work` para o modelo
  principal, `google/gemini-3.7-flash` ou `ollama/minimax-m3:cloud`, e revisão
  `balanced-work`/`quality-critical` para `google/gemini-2.5-pro`. Calibração
  posteriormente substituída pelo mapeamento local unificado.
- [x] Manter researcher e reviewer sem edição, terminal ou delegação; exigir
  confirmação para escrita e terminal dos implementadores; e bloquear acesso
  externo ao workspace e delegação aninhada.
- [x] Permitir que implementadores carreguem Skills sem transformar a confirmação
  técnica do Kilo em autorização para executar build ou testes.
- [x] Manter os prompts como adapters mínimos para `AGENTS.md`, o papel canônico e
  `.ai/agents/execution-profiles.md`.
- [x] Registrar que `steps` limita iterações agentic, não tempo ou raciocínio, e que
  o sandbox do Kilo não está disponível no Windows.

### Adapters versionados do Kilo Code

- [x] Decidir não versionar `.kilo/kilo.jsonc`, pois a configuração pode conter
  modelos, preferências locais e credenciais, e ignorar somente esse arquivo.
- [x] Versionar adapters mínimos de Agents em `.kilo/agents/` sem fixar modelos,
  permitindo que os perfis globais de mesmo nome forneçam essa configuração.
  Decisão posteriormente substituída pela fixação dos modelos nos adapters locais.
- [x] Criar o adapter da Command `implement-erp-feature` em `.kilo/commands/`,
  preservando todos os gates do Workflow canônico.
- [x] Reutilizar o carregamento nativo de `AGENTS.md` e `.agents/skills/` e não criar
  Rules independentes em `.kilo/rules/`.
- [x] Separar a documentação humana por ferramenta em
  `docs/ia-assistida/ferramentas/`, mantendo um índice comparativo geral.

### Classificação de adapters

- [x] Documentar o significado específico de `Adapters/Primary` e
  `Adapters/Secondary` no Modern.
- [x] Confirmar que ACBr e DFeDLL são dependências invocadas pela aplicação e,
  portanto, adapters Secondary assim como os repositories.
- [x] Reconciliar a documentação depois da movimentação de ACBr e DFeDLL para
  `ERP.Features/Adapters/Secondary/`.
- [x] Manter a explicação arquitetural canônica em
  `Modern/.ai/context/project-architecture.md`, com referência de localização em
  `Modern/.ai/context/project-structure.md`.
- [x] Refletir a decisão na documentação didática em português.

### Commands como pontos de entrada manuais

- [x] Decidir pela categoria canônica `.ai/commands/` para operações estáveis e
  manualmente acionáveis.
- [x] Definir que Commands encaminham para Skills ou Workflows sem duplicar seus
  procedimentos.
- [x] Manter Skills diretamente acessíveis por solicitações em linguagem natural,
  sem exigir uma Command.
- [x] Não criar `.ai/prompts/` enquanto não existir uma necessidade distinta e
  comprovada para essa categoria.
- [x] Criar a primeira Command canônica, `implement-erp-feature`, encaminhando para o
  Workflow `erp-feature-implementation`.
- [x] Registrar em `AGENTS.md` o papel de Commands e o acesso direto às Skills.

### Agents e Subagents

- [x] Adotar Agents como papéis reutilizáveis e Subagents como execuções temporárias
  de tarefas delimitadas.
- [x] Definir critérios canônicos de delegação, autoridade, paralelismo, ownership e
  síntese pelo agente principal.
- [x] Definir perfis portáveis de tarefa — `routine`, `analytical` e `critical` —
  sem vinculação a modelos ou configurações de fornecedores.
- [x] Reservar aos adapters o mapeamento de perfis para modelo, esforço de raciocínio,
  custo e mecanismos específicos.
- [x] Criar os papéis iniciais `repository-researcher`,
  `increment-implementer` e `increment-reviewer`.
- [x] Integrar inicialmente a delegação opcional ao Workflow
  `erp-feature-implementation`. Decisão posteriormente superada pela orquestração
  obrigatória desse Workflow.
- [x] Definir inicialmente execução sequencial pelo agente principal como fallback
  quando a ferramenta não oferecer Subagents. Decisão posteriormente superada pelo
  modo manual supervisionado do protocolo de orquestração.
- [x] Separar perfil da tarefa de perfil de execução.
- [x] Definir as dimensões portáveis de capacidade, deliberação, prioridade de
  latência e prioridade de custo.
- [x] Criar os presets `fast-routine`, `balanced-work` e `quality-critical`.
- [x] Associar perfis padrão e regras de elevação aos três Agents iniciais.
- [x] Classificar oito Skills de implementação mecânica para iniciar em
  `fast-routine` quando suas entradas e decisões estiverem completas, preservando
  elevação para `balanced-work` ou `quality-critical` conforme ambiguidade e risco.
- [x] Manter `increment-implementer` como papel comum dessas Skills, variando apenas
  o perfil de execução solicitado ao adapter.
- [x] Criar variantes graváveis `increment-implementer-fast` para OpenCode, Codex e
  Kilo Code, todas encaminhadas ao mesmo papel canônico e com elevação obrigatória.
- [x] Documentar o perfil global equivalente para AiderDesk e Kilo Code e o fallback
  temporário do Antigravity, sem reutilizar o `repository-researcher` somente leitura.

### Documentação humana em português

- [x] Criar `docs/ia-assistida/README.md` como guia didático da arquitetura canônica.
- [x] Documentar Rules, Context, Skills, Workflows, Commands, Agents, autorizações e
  formas de uso sem transformar `docs/` em fonte operacional para as IAs.
- [x] Criar `docs/ia-assistida/perfis-de-execucao.md` com uma explicação clara sobre
  capacidade, deliberação, latência, custo, presets, fallback e calibração.
- [x] Referenciar explicitamente os arquivos canônicos correspondentes em `.ai/`.

### Stack tecnológica

- [x] Confirmar que os 47 pacotes do ERP, incluindo `pkModern`, são compilados em
  Delphi 2006 para Win32.
- [x] Registrar que a DLL `hw.nfe.dx` é compilada no Delphi Rio 10.3.3 e reutiliza
  unidades do `Modern` sem ampliar implicitamente a compatibilidade dessas units.
- [x] Confirmar Firebird 2.5 como única versão e único banco operacional suportado
  pelo ERP, acessado por IBX atrás das abstrações próprias.
- [x] Restringir SQLite ao consumo da `calculadora.db` do SERPRO e exigir consulta e
  aprovação do desenvolvedor para qualquer novo uso.
- [x] Registrar ZeosLib como implementação atual e substituível do adapter SQLite.
- [x] Criar `Modern/.ai/context/technology-stack.md` como Context enxuto, orientado a
  decisões e sem catálogo genérico de bibliotecas.
- [x] Definir que necessidades não atendidas pela stack devem ser apresentadas ao
  desenvolvedor com alternativas e impactos antes de qualquer ampliação.

### Arquitetura de segurança

- [x] Confirmar que autenticação e seleção da empresa pertencem ao ERP legado e que
  as features tratam o `ISessionContext` como somente leitura.
- [x] Documentar a autorização na UI ou no chamador legado com `TAudit_OOP`, sem
  duplicação de permissões nos Use Cases.
- [x] Registrar o isolamento por `COD_EMPRESA` para movimentos e o uso de tabelas de
  vínculo para cadastros globais com acesso restrito.
- [x] Documentar que credenciais existentes são codificadas pelo legado e obtidas
  por `IConfiguracoesRepository`, enquanto novos tipos exigem decisão própria.
- [x] Registrar certificados A1 e A3 como parâmetros repassados ao ACBr.
- [x] Criar `Modern/.ai/context/security-architecture.md` sem duplicar as restrições da Rule
  de segurança.
- [x] Remover o Use Case desativado que continha download por HTTP fixo.

### Autorização e auditoria

- [x] Documentar `TAudit_OOP` como mecanismo canônico de permissão e auditoria.
- [x] Definir que o plano da feature apresenta ao desenvolvedor a lista completa de
  processos protegidos, auditoria e liberação gerencial.
- [x] Proibir o agente de inventar prefixos, códigos ou sequências de processo.
- [x] Registrar `MODxxx` como padrão frequente e famílias semânticas como `NFSxxx`,
  `NFCxxx` e `CLIxxx` quando estabelecidas pelo microcontexto ou legado.
- [x] Registrar `../Ativos/fonte/ProcessosSetupUnit.pas` como ponto conhecido e
  preferencial, preservando a decisão humana quando um script de versão for usado.
- [x] Definir liberação gerencial para exclusão, cancelamento e estorno; demais
  ações de risco não classificadas exigem decisão do desenvolvedor.
- [x] Classificar o conhecimento atual como Context, não Skill, enquanto o
  provisionamento de processos possuir mais de um mecanismo ativo.
- [x] Criar `Modern/.ai/context/authorization-auditing.md` e integrar o inventário de
  processos ao Workflow `erp-feature-implementation`.

### Conhecimento complementar de banco

- [x] Confirmar `CHAR(36) NOT NULL` como representação obrigatória para novas chaves
  primárias UUID pertencentes ao Modern.
- [x] Definir `GenerateNewUUID` como padrão dentro de repositories e
  `GuidService.New` fora deles, produzindo UUID textual de 36 caracteres sem chaves.
- [x] Preservar por padrão os identificadores mantidos por fontes externas, sem
  impor UUID aos dados sincronizados.
- [x] Documentar Reader, serviço de sincronização e Writer como separação
  preferencial, sem torná-la cerimônia obrigatória para operações pequenas.
- [x] Exigir `IDatabaseConnectionFactory` para conexões com bancos externos e
  adapters especializados para fontes como JSON e CSV.
- [x] Manter a transação operacional sob responsabilidade do Use Case, com `Commit`
  explícito mesmo quando a implementação também possuir auto-commit na desconexão.
- [x] Classificar repositories que controlam suas próprias transações como legado a
  ser refatorado, não como precedente para código novo.
- [x] Criar `Modern/.ai/context/data-synchronization.md` e registrar separadamente a
  pendência não bloqueadora de versionamento das fontes externas.

### Fronteira do Workflow de feature

- [x] Manter release, migration de produção, build de distribuição e publicação fora
  de `erp-feature-implementation`, cujo limite é `Ready for Release`.
- [x] Não criar antecipadamente um Workflow de preparação de release sem que o
  processo real esteja suficientemente documentado e exista demanda concreta.

### Metadata canônico

- [x] Criar `.ai/metadata.md` como especificação independente de ferramenta.
- [x] Definir `name` e `description` para todo artefato diretamente roteável.
- [x] Exigir nomes globais únicos em `kebab-case`, correspondentes ao arquivo ou ao
  diretório da Skill.
- [x] Reservar `always_apply` e `applies_to` às Rules, tornando-os mutuamente
  exclusivos e definindo ausência de escopo como relevância semântica.
- [x] Substituir o campo não canônico `globs` por `applies_to`.
- [x] Uniformizar Rules, Contexts, Skills, Workflows, Commands e Agents existentes.
- [x] Renomear Contexts conflitantes ou inconsistentes para
  `project-architecture`, `testing-strategy` e `fiscal-calculos`, atualizando suas
  referências.
- [x] Remover as antigas Rules `project-structure.md` e
  `refactoring-guidelines.md`, já cobertas pelo Context e pelas Rules canônicas.
- [x] Manter índices, READMEs, referências de Skills, checklists e documentos de
  apoio sem metadata enquanto não forem diretamente roteáveis.

### Consolidação do `AGENTS.md`

- [x] Revisar `AGENTS.md` após estabilizar o metadata canônico.
- [x] Mantê-lo como ponto de entrada e roteador enxuto, sem duplicar conhecimento ou
  procedimentos pertencentes aos artefatos canônicos.
- [x] Incluir Rules, Context, Skills, Workflows, Commands e Agents nas categorias
  efetivamente adotadas.
- [x] Definir o fluxo entre solicitação e autorização do usuário, seleção de ponto
  de entrada, carregamento de Rules e Context, uso de Skills e delegação opcional.
- [x] Preservar Skills diretamente acessíveis por linguagem natural, sem exigir uma
  Command.
- [x] Definir que seleção, Workflow, Skill ou delegação não ampliam escopo nem
  autorização.
- [x] Reconhecer explicitamente a hierarquia imposta pela ferramenta ativa, sem
  tentar substituí-la pela estrutura do repositório.

### Preparação canônica do Caso Gold de `Fiscal.Calculos`

- [x] Modelar a atualização completa entre duas versões oficiais usando o guia de
  conformidade como análise consultiva e os fontes Java exatos como verdade
  comportamental.
- [x] Criar o Workflow `fiscal-calculos-update` com estado persistente, atribuições
  explícitas, gate humano, incrementos semânticos, revisão independente, validação e
  término em `Ready for Release`.
- [x] Separar o conhecimento estável no Context `fiscal-calculos`, a preparação de
  fontes e execução de testes em Skills reutilizáveis e a sequência exclusiva no
  Workflow.
- [x] Criar snapshots imutáveis das duas tags sob `.ai-runs/`, registrar commits e
  hash do guia e manter `calculadora-rtc-mirror` estritamente somente leitura.
- [x] Exigir que o desenvolvedor classifique cada mudança como implementar, já
  atendida, não aplicável, adiada ou necessita investigação antes da programação.
- [x] Definir que testes oficiais relevantes são reproduzidos em Delphi dentro de
  `Fiscal.Calculos.Tests`, sem executar a suíte Java.
- [x] Criar a automação `Invoke-FiscalCalculosTests.ps1`, separando autorização de
  build da autorização e confirmação de infraestrutura para executar a suíte.
- [x] Criar a Command manual `update-fiscal-calculos` e adapters mínimos para Kilo
  Code e AiderDesk sem duplicar o procedimento canônico.
- [x] Criar documentação humana didática do Caso Gold e vinculá-la às fontes
  canônicas correspondentes.

### Operação automatizada da preparação de Workflows

- [x] Adotar o Agent canônico `workflow-operator` para executar automações
  determinísticas que precisam de terminal ou escrevem artefatos operacionais.
- [x] Definir `fast-routine`, proibir participação no coding, build, testes,
  delegação e atualização de `state.json`.
- [x] Manter pacote e mirror externos somente leitura e restringir efeitos graváveis
  aos artefatos declarados do run em `.ai-runs/`.
- [x] Preservar o modo manual supervisionado quando a ferramenta não conseguir
  invocar o operator com as fronteiras exigidas.
- [x] Criar os adapters locais de `modern-workflow-operator` para Kilo Code e
  AiderDesk e incluí-lo nas permissões do orquestrador.
- [x] Atualizar o Workflow do Caso Gold e a documentação humana para usar o novo
  papel sem ampliar a autorização fornecida pela Command.

### Perfis críticos exigidos pelo Caso Gold

- [x] Identificar que o Workflow fiscal solicita `repository-researcher` e
  `increment-implementer` com `quality-critical`, sem aceitar adapters mais fracos.
- [x] Criar `modern-repository-researcher-critical` para o mapeamento fiscal
  somente leitura.
- [x] Criar `modern-increment-implementer-critical` para os incrementos fiscais
  aprovados.
- [x] Mapear explicitamente papel + perfil nos orquestradores de Kilo Code e
  AiderDesk, preservando comportamento fail-closed quando a variante estiver
  indisponível.
- [x] Manter os seis papéis canônicos e representar as necessidades de capacidade
  por nove perfis locais, sem elevar o custo das tarefas comuns.
- [x] Incorporar `implementation-evidence.json` como contrato estruturado principal,
  validar sua consistência com o guia e as tags e impedir que o Workflow repita
  diff, triagem, agrupamento, análise profunda ou associação de testes oficiais.
- [x] Criar leitura seletiva por resumo, `case_id` e `change_id`, omitindo patches
  por padrão para evitar carregar integralmente o contrato estruturado nos agentes.

### Simplificação da orquestração — outubro de 2026

- [x] Remover o papel `workflow-operator` e seus templates, transferindo as
  operações determinísticas para o agente principal como `workflow-orchestrator`.
- [x] Manter scripts e Skills canônicos, estado persistente, gates humanos,
  especialistas independentes e autorizações próprias para build e testes.
- [x] Permitir ao `feature-planner` criar, revisar e verificar diretamente os
  documentos exatos atribuídos no run, sem alterar `state.json` ou produção.
- [x] Reconciliar o protocolo, os dois Workflows, os adapters compartilhados e as
  fontes dos setups Kilo, AiderDesk e Codex com o modelo simplificado.
- [x] Retirar o campo específico `delegate` do template do Kilo e manter o fork
  somente como registro histórico, com piloto do Kilo oficial ainda pendente.
- [x] Preservar escolhas locais de modelo, limite de etapas e permissões simples do
  Kilo em overrides declarados e regeneráveis, sem substituir políticas por caminho.
- [x] Corrigir o gerador e a documentação do Codex para a herança de sandbox da
  sessão principal, sem prometer isolamento próprio de filesystem por perfil.
- [x] Aplicar a atualização ao Kilo e Shared instalados e confirmar `Check` sem
  drift; conferir a geração de AiderDesk e Codex sem instalá-los neste checkout.
  A validação incluiu ownership do planner, preservação das preferências locais e
  rejeição de cinco tipos de override inválido. O piloto conversacional permanece
  na seção de pendências não impeditivas.

### Ajustes pontuais com delegação direta

- [x] Permitir atribuições mecânicas completas ao implementador `fast-routine`
  sem exigir uma Skill; registrar `Skills: none` quando nenhuma se aplicar.
- [x] Permitir ao orquestrador organizar ajustes pontuais solicitados pelo
  desenvolvedor e delegá-los diretamente, sem planner quando não houver decisão
  material pendente, com revisão independente após a implementação.
- [x] Manter a delegação direta compatível com os contratos existentes, sem criar
  uma rota adicional de ajustes no protocolo ou novas fases nos Workflows.
- [x] Preservar os gates de build/testes e a revisão independente já previstos.
- [x] Reconciliar papéis, perfis, adapters fast e documentação em português para
  eliminar o bloqueio artificial por ausência de Skill.
- [x] Revisar o escopo da correção: retirar o procedimento adicional do protocolo,
  restaurar o Workflow fiscal e os adapters de orquestração anteriores e reduzir
  `execution-profiles.md` a uma tabela e orientações curtas, sem exemplos específicos.

- [x] Em 29/10/2026, distribuir orientações gerais na raiz e específicas em Modern,
transferir o setup para _automation/ai, simplificar os perfis locais do Kilo para
sete (dois implementadores) e disponibilizar sua aplicação no menu. A conferência
dos arquivos gerados não encerra as pendências de delegação e uso real na ferramenta.
