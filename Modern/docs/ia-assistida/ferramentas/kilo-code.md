# Kilo Code

## Integração com o Modern

O Kilo Code carrega `AGENTS.md` e descobre Skills em `.agents/skills/`. As fontes
versionadas de seus Agents e Commands ficam em
`docs/ia-assistida/setups-de-ferramentas/tools/kilo/`; `.kilo/agents/` e
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

## Instalação

Por linguagem natural:

```text
Configure o setup do Kilo.
```

Ou diretamente, com PowerShell 7:

```powershell
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Kilo -Action Plan
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Kilo -Action Apply
```

`Apply` instala o componente Shared, renderiza os oito Agents e injeta os modelos
de `docs/ia-assistida/setups-de-ferramentas/models.json`. Nomes de modelos não ficam
nos templates nem no script.

## Agents gerados

| Agent | Perfil de execução |
|---|---|
| `modern-workflow-orchestrator` | `fast-routine` |
| `modern-repository-researcher` | `fast-routine` |
| `modern-repository-researcher-critical` | `quality-critical` |
| `modern-feature-planner` | `quality-critical` |
| `modern-increment-implementer` | `balanced-work` |
| `modern-increment-implementer-fast` | `fast-routine` |
| `modern-increment-implementer-critical` | `quality-critical` |
| `modern-increment-reviewer` | `quality-critical` |

O orquestrador é o agente principal (`primary`), mantém estado em `.ai-runs/`, lê as
Skills operacionais e executa os scripts canônicos prescritos. Seus acessos técnicos
permitem a delegação sem bloquear a escrita dos implementadores por herança. O papel
continua limitando sua própria escrita aos artefatos operacionais atribuídos.

Researcher e reviewer permanecem somente leitura. O planner pode criar e editar
documentos em `.ai-runs/`, exceto `state.json`; a atribuição restringe o ownership
aos caminhos exatos do plano ou desenho. Ele salva, verifica e retorna os arquivos.
Os implementadores podem carregar Skills; os templates usam confirmação técnica
para escrita e terminal. Overrides locais podem preservar preferências do
desenvolvedor, mas nenhuma permissão técnica concede autorização de build ou testes.

O orquestrador escolhe o adapter pelo par papel + perfil. Assim, discovery fiscal
usa `modern-repository-researcher-critical` e implementação fiscal usa
`modern-increment-implementer-critical`; atribuições comuns continuam nos perfis
mais econômicos. A ausência do mapeamento exato bloqueia a atribuição, sem fallback
silencioso para um modelo inferior.

Para cada tentativa de atribuição, o orquestrador usa a ferramenta nativa Task
exatamente uma vez e aguarda o Agent nomeado. Apenas mencionar o Agent ou carregar
sua Skill no próprio orquestrador não constitui delegação. As operações
determinísticas são diretas: uma ação de script por vez, com resultado registrado
antes da próxima operação.

## Commands

Depois da instalação:

```text
/implement-erp-feature
/manage-ai-tool-setup
/update-fiscal-calculos v0029 v0039
```

## Verificação, troca e remoção

```powershell
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Kilo -Action Check
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Kilo -Action Switch
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Kilo -Action Remove
```

A remoção usa `.kilo/.modern-ai-setup.json` para os adapters e a allowlist do
manifesto para apagar `.gitignore`, `agent-manager.json`, `package.json`,
`package-lock.json` e `node_modules`, todos regeneráveis pela extensão. Qualquer
outro arquivo local é preservado. Diretórios vazios são excluídos e a raiz `.kilo/`
é removida somente quando não restar conteúdo.

## Observações operacionais

- `steps` limita iterações agentic, não tempo nem raciocínio;
- o ownership é definido pela atribuição mesmo quando o perfil principal precisa
  disponibilizar capacidades técnicas aos filhos;
- depois de `Switch` ou da remoção do setup ativo, reiniciar a ferramenta.

## Referências

- [Automação de setups](../setups-de-ferramentas/README.md)
- [Custom Subagents](https://kilo.ai/docs/customize/custom-subagents)
- [Agent Permissions](https://kilo.ai/docs/customize/agent-permissions)
- [Skills](https://kilo.ai/docs/customize/skills)
