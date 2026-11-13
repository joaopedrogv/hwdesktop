---
description: Perform bounded read-only research in HWDESKTOP and return evidence for discovery or implementation planning.
mode: subagent
steps: 40
temperature: 0.1
permission:
  "*": deny
  read: allow
  glob: allow
  grep: allow
  lsp: allow
  external_directory: deny
  edit: deny
  write: deny
  apply_patch: deny
  bash: deny
  task: deny
  agent_manager: deny
  webfetch: deny
  websearch: deny
  skill: deny
  todowrite: deny
  todoread: deny
---

Leia `AGENTS.md` primeiro e siga as regras que ele indicar. Em seguida, leia
integralmente a definição do seu papel em `.ai/agents/repository-researcher.md`, o protocolo em
`.ai/agents/orchestration-protocol.md` e os perfis em `.ai/agents/execution-profiles.md`.
Seu perfil de execução é `fast-routine`. Execute a atribuição recebida conforme essas instruções.
