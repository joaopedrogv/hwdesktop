# Setups de ferramentas de IA

## Objetivo

Este diretório contém as fontes versionadas dos adapters instalados em ferramentas
de IA. Os destinos `.kilo/`, `.aider-desk/`, `.codex/` e `.agents/` são artefatos gerados e
não são fontes canônicas.

Responsabilidades:

- `.ai/` — regras, contexto, Skills, Workflows, Commands e papéis canônicos;
- `setups-de-ferramentas/` — manifestos, modelos, prompts, templates e arquivos
  estáticos específicos de ferramentas;
- `Scripts/AI/Sync-AIProfiles.ps1` — validação, renderização, instalação, verificação
  e remoção segura;
- diretórios das ferramentas na raiz — material instalado e ignorado pelo Git.

Os adapters referenciam `.ai/`; o script não copia procedimentos canônicos para os
perfis.

Para entender decisões, lifecycle, ownership, cenários de manutenção e o estado
verificado desta estrutura, consulte também o
[handoff e guia de manutenção](../handoff-e-guia-de-manutencao.md).

## Arquivos principais

- `agents.json` — nomes, papéis, perfis de execução, IDs, ordem e participação dos
  Agents em cada ferramenta; omitir uma configuração específica exclui o perfil
  apenas daquela ferramenta;
- `models.json` — modelos aprovados por perfil de execução e ferramenta;
- `models.local.json` — override opcional, local e ignorado;
- `models.local.example.json` — exemplo sem configuração obrigatória;
- `shared/` — ponte de routing, Workflow compartilhado e template de wrappers de
  Skills;
- `tools/kilo/` — templates de Agents e Command do Kilo;
- `tools/aider-desk/` — presets, prompts e Command do AiderDesk.
- `tools/codex/` — prompts dos Specialists e manifesto dos Custom Agents do Codex.

Um manifesto de ferramenta também pode declarar `disposablePaths`. Essa lista é
uma allowlist de artefatos de runtime comprovadamente regeneráveis pela própria
ferramenta; ela não aceita caminhos inferidos durante a remoção.

Modelos, providers e caminhos absolutos não ficam nos templates. O script injeta os
modelos a partir de `models.json` e calcula `projectDir` a partir do repositório em
que está sendo executado.

## Uso direto

A automação requer PowerShell 7 ou superior (`pwsh`).

O modo padrão apenas apresenta o plano:

```powershell
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Kilo -Action Plan
```

Instalar ou atualizar:

```powershell
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Kilo -Action Apply
./Scripts/AI/Sync-AIProfiles.ps1 -Tool AiderDesk -Action Apply
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Codex -Action Apply
```

Verificar diferenças; o exit code é `2` quando existe drift:

```powershell
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Kilo -Action Check
```

Trocar para outra ferramenta, instalando o destino antes de remover o setup
anterior:

```powershell
./Scripts/AI/Sync-AIProfiles.ps1 -Tool AiderDesk -Action Switch
```

Remover os arquivos gerenciados e os artefatos regeneráveis declarados pelo
manifesto:

```powershell
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Kilo -Action Remove
```

Usar `-WhatIf` para simular uma ação mutável. `All` abrange Shared, Kilo,
AiderDesk e Codex. O componente `Shared` é instalado como dependência e não é removido ao
remover uma ferramenta individual.

## Uso por uma IA

Solicitações em linguagem natural são encaminhadas pela Command canônica
`manage-ai-tool-setup`, por exemplo:

```text
Configure o setup do Kilo.
Adicione o AiderDesk.
Mude para o AiderDesk.
Remova o setup do Kilo.
Verifique o setup do Kilo.
```

Configurar e adicionar significam `Apply` e não removem outras ferramentas. Mudar
significa `Switch`. Remover afeta somente o setup nomeado. Uma IA sem terminal deve
fornecer o comando exato em vez de afirmar que aplicou o setup.

No Codex, as Commands canônicas também são expostas como Skills em
`.agents/skills/`, porque Skills são o mecanismo atual recomendado para instruções
reutilizáveis. O agente principal assume o papel canônico de
`workflow-orchestrator` e invoca diretamente os Custom Agents especialistas em
`.codex/agents/`; abrir uma nova conversa ou reiniciar o cliente garante que os
arquivos recém-gerados sejam descobertos. Kilo Code e AiderDesk também mantêm o
orquestrador no agente principal, por meio do perfil local selecionado.

O planner possui ownership dos documentos exatos atribuídos dentro do run e os
grava diretamente. O orquestrador executa as operações canônicas determinísticas;
researcher e reviewer continuam somente leitura. O setup não gera um operator.

Os implementadores fast de Kilo, AiderDesk e Codex também aceitam ajustes mecânicos
descritos na atribuição sem exigir uma Skill. Os perfis orientam a escolha do Agent;
as responsabilidades e autorizações permanecem nos papéis e Workflows canônicos.

## Segurança

- caminhos de fonte e destino devem permanecer dentro do repositório;
- arquivos desconhecidos nunca são sobrescritos nem removidos;
- cada setup grava `.modern-ai-setup.json` com os arquivos que gerencia;
- `Remove` também apaga somente os artefatos regeneráveis enumerados em
  `disposablePaths`; no Kilo são `.gitignore`, `agent-manager.json`, `package.json`,
  `package-lock.json` e `node_modules` dentro de `.kilo/`;
- arquivos compartilhados preservam outros owners conhecidos;
- remoção exclui diretórios internos vazios e o diretório da ferramenta somente se
  ele ficar completamente vazio;
- o componente Shared não pode ser removido enquanto Kilo, AiderDesk ou Codex estiverem
  instalados;
- modelos locais não podem conter credenciais ou tokens;
- depois de `Switch` ou da remoção da ferramenta ativa, reiniciar a ferramenta.

## Override local de modelos

Copiar `models.local.example.json` para `models.local.json` e declarar somente as
entradas que precisam substituir `models.json`. O merge é feito por propriedade.
Também é possível fornecer outro arquivo explicitamente:

```powershell
./Scripts/AI/Sync-AIProfiles.ps1 -Tool Kilo -Action Apply `
  -ModelConfig caminho/para/models.local.json
```

O arquivo de override não deve ser versionado.

Para preservar escolhas locais diferentes entre Agents do Kilo, `models.local.json`
também aceita `kiloAgents`, indexado pelo nome exato do perfil. Cada entrada admite
`model`, `steps` e, opcionalmente, `permissions` com valores `allow`, `ask` ou `deny`
para `edit`, `write`, `apply_patch` e `bash`. Permissões locais só substituem
políticas simples; o script rejeita a substituição de uma política por caminho,
como a do planner. Exemplo:

```json
{
  "schemaVersion": 1,
  "kiloAgents": {
    "modern-feature-planner": {
      "model": "google/gemini-2.5-pro",
      "steps": 100
    }
  }
}
```

Esses campos são preferências técnicas locais e não alteram os gates nem o ownership
canônico. O gerador rejeita nomes de Agents e propriedades desconhecidos. Os limites
e permissões não são lidos de volta automaticamente dos destinos gerados.
