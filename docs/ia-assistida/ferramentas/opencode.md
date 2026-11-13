# OpenCode

## Integração com o HWDESKTOP

O OpenCode lê `AGENTS.md` nativamente e descobre as Skills compartilhadas em
`.agents/skills/`.

O setup gera os sete perfis em `.opencode/agents/` e os três comandos em
`.opencode/commands/` a partir das mesmas fontes Markdown do Kilo. O
`coordinator` seleciona os especialistas pelos nomes locais. Cada perfil remete
a `AGENTS.md` e à definição do papel em `.ai/agents/`.

## Setup

Na raiz do clone, execute:

```powershell
./_automation/ai/Sync-AIProfiles.ps1 -Tool OpenCode -Action Plan
./_automation/ai/Sync-AIProfiles.ps1 -Tool OpenCode -Action Apply
./_automation/ai/Sync-AIProfiles.ps1 -Tool OpenCode -Action Check
```

As três ações também estão no menu **Ferramentas de IA**. Arquivos locais que
coincidem com o conteúdo gerado são adotados. O plano aponta conflitos quando há
diferenças em arquivos ainda não gerenciados. O Git ignora `.opencode/`.

Reinicie o OpenCode após aplicar e selecione `coordinator`. Para escolher modelos
por agente, use `opencodeAgents` em `_automation/config/ai-models.local.json`.
Sem um modelo definido ali, a seleção fica a cargo do OpenCode.

Os perfis usam o formato Markdown compatível já usado neste projeto. A migração
para a sintaxe nativa de permissões do V2 pode ser feita separadamente.

## Material preliminar preservado

Os adapters antigos foram movidos para
`docs/ia-assistida/pendencias-de-integracao/opencode/`. Eles servem somente como
evidência para a futura reconciliação e não devem ser copiados manualmente para
`.opencode/`.

## Referências

- [Agents](https://opencode.ai/docs/agents/)
- [Commands](https://opencode.ai/docs/commands/)
- [Skills](https://opencode.ai/docs/skills/)
