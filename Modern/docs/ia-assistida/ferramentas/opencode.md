# OpenCode

## Integração com o Modern

O OpenCode lê `AGENTS.md` nativamente e descobre as Skills compartilhadas em
`.agents/skills/`.

A integração específica ainda não foi reconciliada com os cinco papéis canônicos
nem incorporada à automação de setups. Por isso, `.opencode/` é um diretório local
inteiramente ignorado e não contém configuração versionada ativa.

## Material preliminar preservado

Os adapters antigos foram movidos para
`docs/ia-assistida/pendencias-de-integracao/opencode/`. Eles servem somente como
evidência para a futura reconciliação e não devem ser copiados manualmente para
`.opencode/`.

Antes da reativação será necessário verificar o formato atual do OpenCode, mapear
`workflow-orchestrator` e `feature-planner`, revisar modelos e permissões, e criar o
respectivo pacote em `docs/ia-assistida/setups-de-ferramentas/`.

## Referências

- [Agents](https://opencode.ai/docs/agents/)
- [Commands](https://opencode.ai/docs/commands/)
- [Skills](https://opencode.ai/docs/skills/)
