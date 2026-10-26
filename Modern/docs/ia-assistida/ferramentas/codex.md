# Codex

## Integração ativa com o Modern

O Codex lê `AGENTS.md` e descobre as Skills compartilhadas em `.agents/skills/`.
As Commands canônicas são expostas pelo mesmo mecanismo como Skills de despacho,
pois os Custom Prompts locais estão depreciados. Elas podem ser selecionadas pelo
nome ou acionadas por linguagem natural.

```text
Execute a Command implement-erp-feature para esta demanda:
...
```

## Instalação

As fontes versionadas ficam em `docs/ia-assistida/setups-de-ferramentas/`. Instale
ou atualize os adapters gerados com PowerShell 7:

```powershell
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Codex -Action Apply
```

O setup cria sete Custom Agents especialistas em `.codex/agents/` e registra seu estado em
`.codex/.modern-ai-setup.json`. O diretório inteiro é local, gerado e ignorado pelo
Git. Depois da instalação, inicie uma nova conversa ou reinicie o cliente para que
o Codex carregue a configuração.

## Papéis e perfis

O agente principal assume o papel canônico `workflow-orchestrator`. Os sete Custom
Agents representam os quatro papéis especialistas e suas variantes de execução:

| Perfil local | Papel canônico | Perfil de execução |
|---|---|---|
| `modern-repository-researcher` | `repository-researcher` | `fast-routine` |
| `modern-repository-researcher-critical` | `repository-researcher` | `quality-critical` |
| `modern-feature-planner` | `feature-planner` | `quality-critical` |
| `modern-increment-implementer-fast` | `increment-implementer` | `fast-routine` |
| `modern-increment-implementer` | `increment-implementer` | `balanced-work` |
| `modern-increment-implementer-critical` | `increment-implementer` | `quality-critical` |
| `modern-increment-reviewer` | `increment-reviewer` | `quality-critical` |

O mapeamento inicial usa `gpt-5.6-luna`/`low`,
`gpt-5.6-terra`/`medium` e `gpt-5.6-sol`/`high`. Esses valores são adapters
calibráveis, não requisitos canônicos. Um `models.local.json` pode substituí-los
sem alterar as fontes versionadas.

Os Custom Agents herdam o sandbox da sessão principal. A documentação oficial
atual esclarece que `sandbox_mode` dentro do arquivo de Custom Agent não substitui
essa configuração; o gerador não emite esse campo. Para o planner gravar documentos
e o implementador trabalhar, a sessão principal precisa permitir escrita no
workspace. Researcher e reviewer permanecem somente leitura por contrato; este
setup não oferece isolamento de filesystem próprio por perfil.

O planner grava e verifica somente os documentos exatos atribuídos no run. O
orquestrador mantém `state.json` e executa as operações determinísticas pelos
scripts canônicos. Build e testes preservam suas autorizações explícitas.

## Execução de um Workflow

O agente principal recebe a solicitação, ativa a Command correspondente e assume o
papel canônico `workflow-orchestrator`. Ele mantém o estado do Workflow e invoca
diretamente cada Custom Agent especialista `modern-*` pelo nome exato, uma vez por
tentativa de atribuição. Enquanto houver uma atribuição ativa, permanece no mesmo
turno e repete a espera nativa em intervalos limitados, sem exigir mensagens do
desenvolvedor para continuar e sem reler artefatos a cada timeout. Não existe um Custom Agent
intermediário `modern-workflow-orchestrator` no Codex, pois um Subagent não dispõe
da delegação aninhada necessária para chamar os Specialists. Se um Specialist não
puder ser invocado, o Workflow usa o modo manual supervisionado; o agente principal
não absorve silenciosamente o trabalho especializado.

O roteamento é fechado por papel e perfil: Agents de `fast-routine` não podem ser
registrados como `balanced-work` ou `quality-critical`. Quando não existe uma
configuração exata, o adapter usa somente a alternativa mais forte expressamente
mapeada; caso contrário, bloqueia sem reduzir capacidade silenciosamente.

Researcher e reviewer devolvem o conteúdo completo dos artefatos operacionais
solicitados para persistência literal pelo orquestrador. O planner salva diretamente
seus documentos e retorna seus caminhos e verificação. Se a escrita não estiver
disponível, a atribuição bloqueia para corrigir o acesso. `state.json`, aceitação dos
resultados e transições pertencem somente ao orquestrador.

O Orchestrator usa somente os estados definidos pelo protocolo ou por uma extensão
explícita do Workflow. Uma aprovação pendente fica em `pending_gate`, sem criar um
novo nome de estado específico do adapter.

Kilo Code e AiderDesk também usam o agente principal como orquestrador, selecionando
seu perfil local `modern-workflow-orchestrator` na conversa.

Exemplo:

```text
Use a Skill implement-erp-feature para esta demanda:
...
```

Para a atualização fiscal:

```text
Use a Skill update-fiscal-calculos com as tags v0029 e v0039.
```

## Referências

- [AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
- [Skills](https://learn.chatgpt.com/docs/build-skills)
- [Subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents)
- [Custom Prompts depreciados](https://learn.chatgpt.com/docs/custom-prompts)
