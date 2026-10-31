# Kilo Code

## Integração com o HWDESKTOP

O Kilo Code carrega `AGENTS.md` e descobre Skills em `.agents/skills/`. As fontes
versionadas de seus Agents e Commands ficam em
`_automation/ai/tool-setup/tools/kilo/`; `.kilo/agents/` e
`.kilo/commands/` são destinos gerados e ignorados pelo Git.

O arquivo `/.kilo/kilo.jsonc` permanece local e ignorado porque pode conter
preferências ou dados que não pertencem aos adapters do projeto.

## Delegação nativa e histórico do fork

O Kilo Code oficial `v7.4.23` propagava as restrições do Agent pai ao filho. O fork
abaixo já foi instalado e validado pelo desenvolvedor:

- repositório: `https://github.com/joaopedrogv/kilocode`;
- branch: `fix/explicit-subagent-delegation`;
- commit de referência: `d29f800f0b`;
- laboratório: `https://github.com/joaopedrogv/kilo-delegation-lab`;
- cenário-base: commit `90d3ce9`;
- resultados: commit `37d15ad`.

Esse registro é histórico. O modelo atual usa o agente principal como orquestrador,
com permissões técnicas suficientes para suas operações e para as capacidades
herdadas pelos especialistas. Os templates não dependem mais do campo específico
`delegate` nem exigem o fork. A delegação continua usando a ferramenta nativa Task.

O desenvolvedor relatou funcionamento fluido do Kilo oficial em outro projeto com
essa topologia. Um piloto neste projeto deve confirmar o comportamento com os
adapters atualizados; esta manutenção não reinstala nem valida a extensão.

## Raiz e aplicação

Abra a raiz do HWDESKTOP. Os adapters ficam em .kilo/ e .agents/. As orientações
gerais estão em .ai/; Modern/.ai/ conserva os padrões do módulo.

No menu, use **9 — Ferramentas de IA → Aplicar / atualizar Kilo**.
Abrir o submenu não modifica arquivos. Plan e Check são somente leitura.
Apply apresenta a prévia, recusa conflitos antes da primeira escrita e confere o resultado.

```powershell
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Plan
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Apply
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Check
```

Depois da aplicação, reinicie o Kilo ou abra uma nova sessão e selecione **coordinator**.
O perfil anterior colidia com o Orchestrator nativo depreciado. A documentação
oficial explica que agentes com nomes nativos têm suas propriedades mescladas;
o nome próprio evita essa sobreposição. O papel canônico permanece workflow-orchestrator.

## Perfis locais

| Perfil | Responsabilidade |
| --- | --- |
| coordinator | Coordenação como agente principal. |
| planner | Plano e desenho técnico. |
| researcher | Pesquisa delimitada. |
| researcher-critical | Pesquisa de maior complexidade ou impacto. |
| implementer-fast | Implementação rotineira bem definida. |
| implementer | Implementação, inclusive com exigência quality-critical. |
| reviewer | Revisão independente. |

Os requisitos de capacidade são definidos pelas atribuições e perfis portáteis,
sem escolha fixa de fornecedor ou LLM. O implementer padrão atende balanced-work
e quality-critical; o rápido continua separado.

## Limites de passos

Os limites foram ampliados para comportar a coordenação e as atribuições sem as
interrupções observadas no primeiro piloto. Os valores ficam nos templates; veja a
[tabela de limites](../../../_automation/ai/README.md#limites-de-passos).
É possível definir steps por agente na configuração individual, preservada pelo
gerador. Os valores são tetos, não uma meta de consumo.

## Configuração de modelos

O arquivo individual é **_automation/config/ai-models.local.json**, ignorado.
Copie o [exemplo](../../../_automation/config/ai-models.exemplo.json) para esse
nome na mesma pasta se quiser definir modelos por perfil. O exemplo contém model
nulo em cada agente e não recomenda nomes concretos.

Sem uma preferência, o gerador omite model e preserva a escolha da ferramenta.
Subagentes sem override herdam o modelo do agente principal. Isso está descrito na
[documentação oficial](https://kilo.ai/docs/customize/custom-subagents).
Um model por agente tem prioridade sobre um mapeamento pessoal por executionProfiles;
null ou vazio pedem a omissão do campo naquele agente.

Os caminhos antigos de models.local.json continuam como fallback, quando o arquivo
novo não existir. -ModelConfig explícito tem prioridade. Nenhum arquivo pessoal é
movido ou regravado; preferências conflitantes para o mesmo nome final são recusadas.
O antigo catálogo compartilhado models.json foi removido.

## Delegação e preservação

Para cada atribuição, o coordenador chama o especialista nomeado pela Task uma vez.
Pode iniciar um grupo independente em paralelo e aguarda cada resultado antes do
trabalho dependente. Task background:true é usado quando a capacidade está
exposta; resultados chegam pelo mecanismo nativo. Sem essa capacidade, segue em
sequência, sem recorrer a varreduras de arquivos ou delegações repetidas.
A [documentação oficial](https://kilo.ai/docs/automate/tools#task-tool) descreve
foreground e background; a disponibilidade real será conferida no uso.

Tarefas delimitadas com entradas, contratos e procedimento definidos são candidatas
preferenciais a implementer-fast, incluindo Skills aplicáveis. Isso não reduz o
perfil de decisões ainda abertas nem muda a divisão ou ordem dos incrementos.
Os especialistas não delegam. Pesquisa e revisão permanecem
somente leitura; o planner grava somente os documentos exatos atribuídos no run.
Somente o coordenador atualiza state.json.

As buscas comuns no código excluem as pastas de runs. Cada atribuição identifica
a execução atual e lê seus artefatos pelos caminhos exatos. Outra execução só é
consultada por motivo identificado e com leitura delimitada; seu conteúdo é
histórico, sujeito a conferência. Não se escolhe a run mais recente por varredura.
A regra canônica está em .ai/rules/repository-safety.md.

Os acessos técnicos permitem a delegação e as operações prescritas, mas não concedem
ao coordenador autoria do conteúdo técnico nem autorização de build, testes ou SQL.
Confirmações técnicas da ferramenta não substituem o pedido do desenvolvedor.

O state mantém .modern-ai-setup.json por compatibilidade. A atualização pode remover
adapters obsoletos registrados, incluindo orchestrator.md. Arquivos desconhecidos
e kilo.jsonc são preservados. Remove usa o state e a allowlist de runtime do manifesto;
Switch aplica o alvo antes de remover os demais setups gerenciados. Shared permanece
como dependência, e pastas só são removidas quando vazias.

Check confirma a geração dos arquivos. A descoberta, modelos e delegação real são
validados no uso do Kilo. Este setup não reinstala nem valida a extensão.

[Automação e configuração](../../../_automation/ai/README.md).
[Fontes técnicas](../../../_automation/ai/tool-setup/README.md).
[Custom Subagents](https://kilo.ai/docs/customize/custom-subagents).
[Permissões](https://kilo.ai/docs/customize/agent-permissions).
