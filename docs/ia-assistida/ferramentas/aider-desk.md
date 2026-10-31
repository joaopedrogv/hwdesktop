# AiderDesk

## Integração com o Modern

O AiderDesk usa `.ai/` como fonte canônica. As fontes versionadas de seus perfis,
Commands e wrappers ficam em
`_automation/ai/tool-setup/tools/aider-desk/`; a pasta
`.aider-desk/` contém somente o setup instalado e arquivos locais da ferramenta.

O plugin `external-rules` continua sendo um pré-requisito local e deve apontar para:

```json
{"ruleFolders": ".agents/rules"}
```

A ponte em `.agents/rules/` é instalada pelo componente Shared. Os wrappers em
`.aider-desk/skills/` referenciam as Skills canônicas sem copiar seus procedimentos.

## Instalação

Por linguagem natural:

```text
Configure o setup do AiderDesk.
```

Ou diretamente, com PowerShell 7:

```powershell
./_automation/ai/Sync-AIProfiles.ps1 -Tool AiderDesk -Action Plan
./_automation/ai/Sync-AIProfiles.ps1 -Tool AiderDesk -Action Apply
```

`Apply` instala primeiro o componente Shared, renderiza os oito perfis, gera
`order.json`, calcula `enabledSubagentIds`, injeta os modelos e preenche `projectDir`
com a raiz real do workspace. O caminho absoluto não é mais versionado.

## Perfis gerados

| Perfil | Perfil de execução |
|---|---|
| `coordinator` | `fast-routine` |
| `researcher` | `fast-routine` |
| `researcher-critical` | `quality-critical` |
| `planner` | `quality-critical` |
| `implementer` | `balanced-work` |
| `implementer-fast` | `fast-routine` |
| `implementer-critical` | `quality-critical` |
| `reviewer` | `quality-critical` |

Modelos e providers são escolhas individuais, em
_automation/config/ai-models.local.json ou em arquivo fornecido por -ModelConfig.
Os campos exigidos devem ser configurados quando este cliente for solicitado;
não há catálogo compartilhado nem escolha padrão versionada.

Researcher e reviewer são somente leitura. O planner possui edição e criação de
arquivos sujeitas à confirmação e deve usá-las apenas nos documentos exatos
atribuídos dentro do run. Não altera `state.json`. O AiderDesk não oferece neste
preset a mesma política por caminho do Kilo; a atribuição e o prompt delimitam o
ownership. Implementadores podem ativar Skills e possuem escrita e terminal
sujeitos à confirmação. Todos os workers são Subagents sob demanda, sem memória
e sem delegação aninhada.

O orquestrador é o perfil principal. Ele mantém estado, routing e gates, pode ativar
Skills operacionais e executar os scripts prescritos com confirmação de terminal.
Chama somente os sete workers habilitados. Para cada atribuição especialista, usa
`subagents---run_task` exatamente uma vez e aguarda o resultado; carregar uma Skill
especialista no próprio orquestrador não constitui delegação.

O worker é selecionado pelo par papel + perfil. O Caso Gold encaminha pesquisa e
implementação fiscal para as variantes `quality-critical`; trabalhos comuns
continuam nos perfis mais econômicos. Um mapeamento ausente bloqueia a atribuição em
vez de escolher silenciosamente um modelo inferior.

## Commands

Depois da instalação:

```text
/implement-erp-feature "descrição informal da feature"
/manage-ai-tool-setup "verifique o setup do AiderDesk"
/update-fiscal-calculos "v0029 v0039"
```

As fontes dessas Commands ficam no pacote versionado e os arquivos em
`.aider-desk/commands/` são gerados.

## Verificação, troca e remoção

```powershell
./_automation/ai/Sync-AIProfiles.ps1 -Tool AiderDesk -Action Check
./_automation/ai/Sync-AIProfiles.ps1 -Tool AiderDesk -Action Switch
./_automation/ai/Sync-AIProfiles.ps1 -Tool AiderDesk -Action Remove
```

A remoção afeta somente arquivos registrados em
`.aider-desk/.modern-ai-setup.json`. Diretórios vazios pertencentes aos arquivos
gerenciados são excluídos. A raiz `.aider-desk/` só é excluída se ficar totalmente
vazia; tasks, extensões ou outros arquivos locais são preservados.

## Referências

- [Automação de setups](../../../_automation/ai/tool-setup/README.md)
- [Comandos do AiderDesk](https://aiderdesk.hotovo.com/docs/features/custom-commands)
- [Agent Profiles](https://aiderdesk.hotovo.com/docs/agent-mode/agent-profiles)
