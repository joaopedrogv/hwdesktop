# Setup de ferramentas de IA

O menu oferece **9 — Ferramentas de IA**, com visualização, aplicação e verificação
do Kilo. O gerador canônico é Sync-AIProfiles.ps1 neste diretório.

## Uso direto pela raiz

```powershell
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Plan
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Apply
./_automation/ai/Sync-AIProfiles.ps1 -Tool Kilo -Action Check
```

PowerShell 7 ou superior; o menu mantém o requisito já definido de 7.5.
Plan e Check não escrevem; Check retorna 2 se houver diferenças. Apply confere
todos os componentes antes da primeira escrita, recusa conflitos e verifica o resultado.
-WhatIf simula a aplicação. Uma reexecução idêntica não regrava o state.

## Configuração individual de modelos

O projeto não mantém catálogo vigente de LLMs nem modelos padrão compartilhados.

- Arquivo individual: **_automation/config/ai-models.local.json**, ignorado pelo Git.
- Exemplo versionado: [ai-models.exemplo.json](../config/ai-models.exemplo.json).
- Arquivo explícito opcional: -ModelConfig, relativo à raiz ou absoluto.

Sem definição individual, o gerador do Kilo omite model. A escolha permanece na
configuração da ferramenta; subagentes sem override herdam o modelo do agente
principal. Para escolher por perfil, copie o exemplo para o arquivo individual
e preencha model somente onde desejar. O exemplo contém null, sem fornecedores
ou nomes concretos de modelos.

model nulo ou vazio significa não forçar uma escolha naquele perfil. Uma preferência
em kiloAgents tem prioridade sobre um mapeamento individual em executionProfiles.
Os perfis de capacidade continuam definidos no protocolo; cada desenvolvedor escolhe
modelos adequados a esses requisitos, sem uma tabela de compatibilidade mantida no projeto.

Se o arquivo novo não existir, o gerador consulta _automation/ai/tool-setup/models.local.json
e depois Modern/docs/ia-assistida/setups-de-ferramentas/models.local.json.
Ele não move nem regrava arquivos pessoais. -ModelConfig explícito tem prioridade.
Outros clientes exigem seus próprios mapeamentos e parâmetros individuais quando solicitados.

## Fontes e perfis

AGENTS.md e .ai/ na raiz mantêm o processo comum; Modern/AGENTS.md e Modern/.ai/
mantêm as orientações do módulo. tool-setup/ contém manifestos e templates.
O gerador descobre Commands e Skills nos dois níveis, aponta para a fonte exata e
recusa nomes duplicados. A raiz deriva da localização do script.

| Perfil local | Responsabilidade |
| --- | --- |
| coordinator | Coordenar o Workflow como agente principal. |
| planner | Preparar/adotar o plano e produzir o desenho técnico. |
| researcher | Pesquisa delimitada. |
| researcher-critical | Pesquisa de maior complexidade ou impacto. |
| implementer-fast | Alterações rotineiras bem definidas. |
| implementer | Implementação que exige capacidade para trabalho crítico. |
| reviewer | Revisão independente. |

coordinator evita a colisão com o Orchestrator nativo depreciado do Kilo.
O papel canônico continua sendo workflow-orchestrator.
-Tool Kilo instala somente Kilo e Shared; os demais clientes não são alterados.

## Limites de passos

Os limites compartilhados do Kilo ficam nos templates dos perfis:

| Perfil | Steps |
| --- | ---: |
| coordinator | 200 |
| planner | 100 |
| implementer | 100 |
| implementer-fast | 60 |
| researcher | 40 |
| researcher-critical | 80 |
| reviewer | 80 |

São tetos de iterações, não quantidades de incrementos ou consumo obrigatório.
O aumento evita interrupções prematuras; não acelera cada chamada ao modelo.
Uma escolha individual de steps em kiloAgents no arquivo de configuração prevalece
sobre o template. Preserve essa preferência; não edite o perfil gerado esperando
que a alteração sobreviva à reaplicação do setup.

## Distribuição das tarefas

O coordenador pode executar atribuições independentes em paralelo dentro do
incremento aprovado, com responsabilidade exclusiva por arquivos e dependências
resolvidas. Ele usa implementer-fast para tarefas delimitadas de procedimento e
entradas definidos, inclusive Skills; decisões abertas exigem o perfil apropriado.
A divisão, ordem e revisão dos incrementos permanecem as mesmas.

No Kilo, Task em background é usado quando essa capacidade está disponível; o
retorno inicial não significa conclusão. Sem essa capacidade, a execução segue
sequencial. Somente o coordenador atualiza state.json, registrando os resultados
um por vez e preservando as atribuições ainda ativas.

## Preservação e validação

Os destinos .kilo/ e .agents/ e os novos runs .ai-runs/ ficam na raiz, ignorados.
O state conserva .modern-ai-setup.json para reconhecer instalações anteriores.
Adapters obsoletos registrados podem ser removidos; arquivos desconhecidos e
kilo.jsonc são preservados. Nomes antigos nas configurações são aceitos como aliases;
preferências conflitantes para o mesmo perfil final interrompem a aplicação.

Reinicie o Kilo e selecione **coordinator** após aplicar. Check valida os arquivos;
a descoberta e delegação real são verificadas no uso. O setup não autoriza
implementação, build, testes, SQL ou publicação.

[Guia humano do Kilo](../../docs/ia-assistida/ferramentas/kilo-code.md).
[Contrato de gerenciamento](../../.ai/commands/manage-ai-tool-setup.md).
[Testes isolados](../tests/verify.ps1): grupo AISetup, sem rede ou credenciais reais.
