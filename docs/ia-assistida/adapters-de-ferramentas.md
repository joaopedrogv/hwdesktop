# Adapters de ferramentas de IA

## Objetivo

O HWDESKTOP pode ser usado por diferentes ferramentas de IA sem tornar nenhuma delas
dona das regras do projeto. `AGENTS.md` e `.ai/` continuam sendo as fontes
canônicas; os arquivos específicos de cada ferramenta apenas traduzem caminhos,
formatos e pontos de entrada.

Detalhes de instalação, configuração local, limitações e exemplos ficam em um guia
separado por ferramenta:

- [AiderDesk](ferramentas/aider-desk.md)
- [OpenCode](ferramentas/opencode.md)
- [Codex](ferramentas/codex.md)
- [Antigravity IDE](ferramentas/antigravity.md)
- [Kilo Code](ferramentas/kilo-code.md)

## Escopo das fontes

A raiz contém .ai/ para processo e orientações gerais; Modern/.ai/ conserva os
padrões do módulo. Os adapters são instalados na raiz do HWDESKTOP e encaminham
cada Skill ou Command para sua origem. Nenhuma integração aplica a arquitetura de
Modern ao legado automaticamente.

## Mapeamento atual

| Ferramenta | Entrada do projeto | Skills | Command de feature | Agents |
|---|---|---|---|---|
| AiderDesk | ponte gerada em `.agents/rules/` | wrappers gerados em `.aider-desk/skills/` | `.aider-desk/commands/` gerado | oito perfis gerados em `.aider-desk/agents/` |
| OpenCode | `AGENTS.md` | wrappers em `.agents/skills/` | pendente | pendente |
| Codex | `AGENTS.md` | wrappers gerados em `.agents/skills/` | Skill de despacho ou linguagem natural | agente principal como Orchestrator e sete Specialists em `.codex/agents/` |
| Antigravity IDE | ponte em `.agents/rules/` | wrappers em `.agents/skills/` | `.agents/workflows/` | configuração da ferramenta |
| Kilo Code | `AGENTS.md` | wrappers gerados em `.agents/skills/` | `.kilo/commands/` gerado | sete adapters gerados em `.kilo/agents/` |

Esse quadro indica integração, não autoridade. Um adapter deve sempre encaminhar ao
artefato canônico correspondente e nunca manter uma cópia independente de regras,
conhecimento ou procedimentos.

Os cinco papéis canônicos são compartilhados. O Kilo possui sete perfis locais,
com somente dois implementadores. AiderDesk conserva oito perfis e o Codex sete
Specialists; essas outras ferramentas não foram instaladas nesta manutenção. Em todas as ferramentas
o agente principal assume o Orchestrator; o Codex gera sete Custom Agents
especialistas, sem um intermediário de orquestração. O Kilo usa delegação nativa
sem o campo específico do fork. A orquestração do AiderDesk ainda precisa ser
validada em execução. O Codex já possui integração gerada e aguarda apenas um piloto
operacional do Workflow completo. OpenCode e Antigravity permanecem como integrações
não impeditivas a serem reconciliadas. Seus diretórios de ferramenta na raiz são
locais e ignorados.

As fontes dos adapters de Kilo, AiderDesk e Codex ficam em
`_automation/ai/tool-setup/`. A automação
`_automation/ai/Sync-AIProfiles.ps1` renderiza e instala os destinos da tabela. O
componente Shared mantém `.agents/` separado porque também atende outras
ferramentas. Os diretórios gerados não são fontes de manutenção manual.

Delegar exige uma chamada observável ao mecanismo nativo da ferramenta. Para cada
tentativa de atribuição, o orquestrador invoca exatamente uma vez o Agent nomeado e
aguarda o resultado; instruir o próprio orquestrador a “agir como” o worker ou
apenas carregar sua Skill não satisfaz o protocolo. No Codex, o orquestrador é o
agente principal; Kilo e AiderDesk selecionam o perfil de orquestração como principal
na conversa. As operações determinísticas prescritas são executadas diretamente.

## Uso portátil

Uma operação pode ser solicitada em linguagem natural em qualquer ferramenta:

```text
Execute a Command implement-erp-feature para esta demanda:
...
```

Uma Skill também pode ser chamada diretamente:

```text
Use delphi-usecase-testing para criar os testes deste Use Case.
```

A Command é útil como ponto de entrada estável para uma operação maior. Ela não é
obrigatória para acessar uma Skill e não concede autorizações adicionais.

O próprio setup pode ser gerenciado por linguagem natural:

```text
Configure o setup do Kilo.
Mude para o AiderDesk.
Adicione o Codex.
Remova o setup do Kilo.
```

Essas solicitações usam a Command canônica `manage-ai-tool-setup` e nunca substituem
o script por cópias ou exclusões ad hoc.

## Modelos e perfis de execução

Os papéis e requisitos mínimos são definidos de forma portátil em `.ai/agents/`.
Cada ferramenta pode associá-los aos modelos disponíveis em sua própria
configuração. Os mapeamentos atuais são hipóteses de calibração e devem ser
reavaliados com tarefas representativas antes de se tornarem definitivos.

## Segurança e manutenção

- Templates, manifestos e mapeamentos aprovados são versionados no pacote de setup;
  destinos gerados, overrides locais, credenciais, tokens e configurações pessoais
  não são versionados.
- `.kilo/`, `.opencode/` e `.codex/` são integralmente ignorados; material ainda não
  reconciliado pertence à área de pendências, não à raiz operacional.
- Confirmações técnicas da ferramenta não substituem autorização do desenvolvedor
  para build, testes ou outras operações protegidas.
- Procedimentos mudam primeiro em `.ai/`; adapters só são atualizados quando o
  formato ou o encaminhamento da ferramenta mudar.
- Um adapter deve conter o mínimo necessário para descoberta e roteamento.

## Fontes canônicas relacionadas

- [`AGENTS.md`](../../AGENTS.md)
- [Metadata canônico](../../.ai/metadata.md)
- [Command de implementação de feature](../../.ai/commands/implement-erp-feature.md)
- [Command de gerenciamento de setup](../../.ai/commands/manage-ai-tool-setup.md)
- [Agents](../../.ai/agents/README.md)
- [Perfis de execução](../../.ai/agents/execution-profiles.md)
- [Automação dos setups](../../_automation/ai/tool-setup/README.md)
