# Fontes do setup de ferramentas

Este diretório contém manifestos, templates e arquivos técnicos para gerar os
adapters locais. .ai/ e Modern/.ai/ são as fontes canônicas de processo e regras;
os diretórios gerados não são fontes de manutenção manual.

## Organização

- agents.json: nomes locais, papéis, perfis de capacidade, IDs e participação por cliente.
- shared/: pontes, wrappers e entradas compartilhadas.
- tools/: fontes específicas de Kilo, AiderDesk e Codex.
- Configurações individuais ficam em _automation/config/ai-models.local.json.
- O exemplo versionado é [ai-models.exemplo.json](../../config/ai-models.exemplo.json).

Não há catálogo ou escolhas concretas de LLMs compartilhadas. O antigo models.json
foi retirado. Requisitos de capacidade ficam em .ai/agents/execution-profiles.md;
modelos e providers são escolhas locais dos desenvolvedores.

## Operação

Use somente _automation/ai/Sync-AIProfiles.ps1. As ações são Plan, Apply, Check,
Remove e Switch. Apply instala a dependência Shared e o cliente solicitado, sem
remover outros clientes. Switch aplica e confere o destino antes de remover os
demais setups gerenciados. Remove opera por ownership e pela allowlist declarada
no manifesto; nunca amplia essa lista por inferência.

Antes de mutações, confira a prévia. Apply faz preflight de todos os componentes
antes da primeira escrita e verifica o resultado. Check retorna 2 para drift.
Arquivos desconhecidos não são sobrescritos ou apagados; conflitos interrompem.
Shared não pode ser removido enquanto houver clientes que dependem dele.

A descoberta de Commands e Skills abrange .ai/ e Modern/.ai/. Cada wrapper aponta
para o arquivo canônico exato, sem copiar seu procedimento. Nomes duplicados são recusados.
projectDir e destinos são calculados a partir do checkout; caminhos absolutos não
são fixados nas fontes. Manifestos validam fontes e destinos dentro do projeto.

## Modelos e preferências individuais

No Kilo, a ausência de model deixa a escolha com a ferramenta. Subagentes sem
override herdam o modelo do agente principal. Modelos definidos em kiloAgents
são aplicados por perfil; null ou vazio omitem o campo. Podem coexistir escolhas
por executionProfiles, com a preferência por agente tendo prioridade.

kiloAgents aceita model, steps e as permissões locais simples já suportadas para
edit, write, apply_patch e bash. O gerador não permite que essa preferência substitua
uma política por caminho. Nenhuma preferência técnica altera gates ou ownership.

-ModelConfig explícito tem prioridade. Sem ele, a resolução procura:
1. _automation/config/ai-models.local.json;
2. _automation/ai/tool-setup/models.local.json;
3. Modern/docs/ia-assistida/setups-de-ferramentas/models.local.json.

Arquivos pessoais não são movidos ou regravados. Nomes antigos de agentes são
aceitos como aliases, inclusive orchestrator para coordinator. Configurações
conflitantes para o mesmo perfil final são recusadas antes de escrever.
Não inclua credenciais, tokens ou segredos nessa configuração.

AiderDesk e Codex, quando solicitados, precisam de seus próprios modelos e parâmetros
individuais. A aplicação do Kilo não aplica nem remove esses clientes.

## Perfis e controle local

O Kilo gera coordinator, planner, researcher, researcher-critical, implementer,
implementer-fast e reviewer. implementer atende balanced-work e quality-critical;
a escolha do modelo deve satisfazer a capacidade exigida pela atribuição.

Os papéis canônicos conservam seus nomes e contratos. O planner grava somente os
documentos atribuídos; o coordenador controla state.json e os gates; pesquisa e
revisão são somente leitura. A confirmação técnica não amplia a autorização do trabalho.

O state mantém .modern-ai-setup.json para reconhecer ownership de instalações antigas.
Reinicie a ferramenta após aplicar ou trocar o setup. O uso real confirma descoberta
e delegação; o gerador valida apenas os arquivos e a configuração.

[Uso e comandos](../README.md).
[Guia de manutenção](../../../docs/ia-assistida/handoff-e-guia-de-manutencao.md).
