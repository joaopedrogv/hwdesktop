# Antigravity IDE

## Integração com o Modern

O Antigravity usa a Rule sempre ativa
`.agents/rules/00-canonical-routing.md` para encaminhar o agente a `AGENTS.md` e
`.ai/`. As Skills em `.agents/skills/` são descobertas nativamente.

## Workflow

Depois de informar a demanda na conversa, iniciar a feature com:

```text
/implement-erp-feature
```

O arquivo `.agents/workflows/implement-erp-feature.md` encaminha para a Command
canônica e preserva seus gates de aprovação.

## Agents

O Antigravity IDE pode executar delegações temporárias e paralelas. No momento da
decisão registrada, Custom Agents versionados em `.agents/agents/` ainda não
estavam disponíveis na IDE, embora o formato já existisse no Antigravity 2.0 e na
CLI. Até nova avaliação, os papéis canônicos são executados pelo agente principal
ou por delegações temporárias.

Rule, Skills e Workflow não fixam modelo; a seleção pertence à sessão da
ferramenta.

Enquanto Custom Agents de workspace não forem adotados, `fast-routine` deve ser
executado por uma delegação temporária gravável ou em uma sessão configurada com um
modelo leve compatível. Se a ferramenta não permitir essa seleção de forma segura,
usar o implementador principal como fallback; não reutilizar um pesquisador somente
leitura para implementar a Skill.

## Referências

- [Rules](https://antigravity.google/docs/ide/rules/)
- [Skills](https://antigravity.google/docs/skills/)
- [Workflows](https://antigravity.google/docs/ide/workflows/)
