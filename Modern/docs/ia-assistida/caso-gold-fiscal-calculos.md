# Caso Gold — atualização do Fiscal.Calculos

## Objetivo

O Caso Gold atualiza a reprodução Delphi da Calculadora RTC entre duas versões
oficiais. O resultado esperado não é uma tradução textual de Java para Delphi, mas
a mesma resposta observável para entradas equivalentes.

A fonte operacional é o Workflow canônico
[`fiscal-calculos-update`](../../.ai/workflows/fiscal-calculos-update.md). Esta página
explica o processo para o desenvolvedor; ela não substitui as instruções da IA.

## Fontes envolvidas

O processo usa três elementos distintos:

1. `calculadora-rtc-mirror`, que preserva os fontes oficiais por tag;
2. `calculadora-rtc-conformidade`, que produz o pacote formado por
   `implementation-evidence.json` e `implementation-guide.md` ao comparar um
   intervalo;
3. o repositório Modern, que contém `Fiscal.Calculos` e
   `Fiscal.Calculos.Tests`.

`implementation-evidence.json` é o contrato estruturado principal para os agentes.
Ele já contém cobertura do delta, `change_id`s, comportamentos anterior e novo,
contratos comportamentais, dependências, arquivos, hunks e testes oficiais
associados. `implementation-guide.md` apresenta o mesmo trabalho para revisão e
acompanhamento humano.

O Workflow não recalcula o diff, não repete triagem ou análise profunda e não tenta
associar novamente os testes. Sua responsabilidade começa no mapeamento de cada
`change_id` para o Delphi atual.

O checkout atual do mirror não precisa coincidir com o intervalo. Uma atualização
`v0029` para `v0039` continua reproduzível mesmo quando o mirror já está em `v0043`.
O Workflow não depende desse checkout: ele obtém do GitHub somente as tags e o
pacote necessários e fixa commits e hashes dentro da execução.

## Como as entradas são obtidas

A Skill
[`rtc-update-inputs`](../../.ai/skills/rtc-update-inputs/SKILL.md) usa
[`Acquire-RTCUpdateInputs.ps1`](../../Scripts/Fiscal.Calculos/Acquire-RTCUpdateInputs.ps1)
para adquirir diretamente dos dois repositórios GitHub canônicos:

- as tags exatas de origem e destino;
- `reports/<origem>-<destino>/implementation-evidence.json`;
- `reports/<origem>-<destino>/implementation-guide.md`.

O desenvolvedor não informa URLs nem caminhos locais. Git usa a autenticação já
disponível no ambiente, sem tokens em argumentos ou documentação. O resultado fica
em `.ai-runs/<run-id>/rtc-inputs/`; o manifesto registra URLs, commits e hashes.

Um run bloqueado pode ser retomado sem criar outro identificador:

```text
/update-fiscal-calculos v0029 v0039 rtc-v0029-v0039-20260828T150603Z
```

Quando a aquisição falha antes da validação final, `rtc-inputs/` não aparece. Isso
é intencional: o resultado é publicado atomicamente somente depois que tags,
commits, arquivos, hashes e contrato forem validados; o diretório temporário
incompleto é removido.

Planejar sem acessar a rede ou gravar arquivos:

```powershell
& .\Scripts\Fiscal.Calculos\Acquire-RTCUpdateInputs.ps1 `
  -Action Plan `
  -FromTag 'v0029' `
  -ToTag 'v0039' `
  -RunId 'rtc-v0029-v0039'
```

`Acquire` realiza e verifica a aquisição autorizada em uma única ação. `Plan` é
somente uma visualização manual ou diagnóstica; `Check` verifica uma aquisição
existente durante retomada ou quando solicitado. Falha de autenticação, tag ausente
e pacote de intervalo inexistente são erros diferentes; a automação não procura uma
versão próxima.

A extração envia `implementation-evidence.json` e `implementation-guide.md` ao
`git archive` como argumentos escalares separados. Assim, a aquisição mantém o
mesmo comportamento tanto no modo moderno quanto no modo `Legacy` de passagem de
argumentos nativos do PowerShell.

## Como o pacote é validado e lido

A Skill
[`rtc-implementation-evidence`](../../.ai/skills/rtc-implementation-evidence/SKILL.md)
usa
[`Read-RTCImplementationEvidence.ps1`](../../Scripts/Fiscal.Calculos/Read-RTCImplementationEvidence.ps1)
para validar a compatibilidade do guia e do JSON, a cobertura completa e as
referências internas.

O contrato atual é grande e não deve ser carregado integralmente em cada agente. A
automação oferece:

- `Check`, para validar o pacote;
- `Summary`, para obter o inventário compacto;
- `Case`, para carregar somente um `case_id`;
- `Change`, para carregar somente um `change_id`.

Os patches dos hunks são omitidos por padrão e incluídos somente quando necessários.

```powershell
& .\Scripts\Fiscal.Calculos\Read-RTCImplementationEvidence.ps1 `
  -Action Summary `
  -EvidencePath '.\.ai-runs\rtc-v0029-v0039\rtc-inputs\package\implementation-evidence.json' `
  -GuidePath '.\.ai-runs\rtc-v0029-v0039\rtc-inputs\package\implementation-guide.md' `
  -AsJson
```

## Como as duas versões ficam disponíveis

A Skill [`rtc-source-snapshots`](../../.ai/skills/rtc-source-snapshots/SKILL.md)
usa o script
[`Prepare-RTCSourceSnapshots.ps1`](../../Scripts/Fiscal.Calculos/Prepare-RTCSourceSnapshots.ps1)
para criar cópias imutáveis das tags em `.ai-runs/<run-id>/rtc-sources/`.

O script consulta o mirror adquirido, já fixado dentro da execução, e usa
`git archive`. Ele não troca branch nem cria worktree. O manifesto registra tags,
SHAs, schemas, versão do pipeline e hashes do JSON e do guia, evitando que uma
execução misture evidências de intervalos diferentes.

As cópias servem para consultar os caminhos e hunks já referenciados pelo contrato.
Elas não são usadas para fazer uma segunda comparação completa.

Você pode chamar a preparação diretamente:

```powershell
& .\Scripts\Fiscal.Calculos\Prepare-RTCSourceSnapshots.ps1 `
  -Action Plan `
  -MirrorPath '.\.ai-runs\rtc-v0029-v0039\rtc-inputs\calculadora-rtc-mirror' `
  -EvidencePath '.\.ai-runs\rtc-v0029-v0039\rtc-inputs\package\implementation-evidence.json' `
  -GuidePath '.\.ai-runs\rtc-v0029-v0039\rtc-inputs\package\implementation-guide.md' `
  -FromTag 'v0029' `
  -ToTag 'v0039' `
  -RunId 'rtc-v0029-v0039'
```

No Workflow normal, use diretamente `-Action Prepare`, que verifica o estado final
antes de retornar. `Plan` é apenas diagnóstico manual e `Check` fica para
retomadas ou verificações explícitas.

O agente principal assume `workflow-orchestrator` e executa essa preparação
diretamente pelas Skills e scripts canônicos. Mantém pacote e mirror somente
leitura e grava os artefatos declarados em `.ai-runs/<run-id>/`.

Antes de cada pesquisa, o próprio orquestrador extrai do JSON somente o `case_id`
ou `change_id` necessário. O pesquisador recebe o artefato delimitado e continua
responsável pelo mapeamento técnico para Delphi.

Durante `PREPARING_SOURCES`, o orquestrador executa três operações sequenciais:

1. `rtc-update-inputs / Acquire`;
2. `rtc-implementation-evidence / Summary -AsJson`;
3. `rtc-source-snapshots / Prepare`.

Ele lê a Skill de cada operação, executa uma ação por vez e registra o resultado
antes da próxima. Invoca diretamente o script canônico sem sondagens auxiliares de
permissão. Uma negativa de comando auxiliar não demonstra bloqueio do script.
Se a execução necessária não estiver disponível, registra o bloqueio e fornece o
comando exato para execução manual supervisionada.

Se uma atribuição bloquear ou falhar, o orquestrador primeiro persiste
`BLOCKED` ou `FAILED` no `state.json`, preserva o último estado válido, encerra
o status ativo da atribuição e registra o bloqueio e a retomada segura. Somente
depois comunica o resultado ao desenvolvedor. A mensagem nunca deve declarar um
estado diferente do arquivo persistido.

Como o domínio fiscal exige maior capacidade, o mapeamento para o Delphi usa
`modern-repository-researcher-critical` e a programação aprovada usa
`modern-increment-implementer-critical`. Ambos representam papéis canônicos já
existentes com `quality-critical`; não são novas responsabilidades no fluxo.

## Decisão humana obrigatória

O pipeline já entrega o inventário completo. Discovery mapeia cada `change_id` para
o Delphi e propõe uma decisão ao desenvolvedor:

- implementar;
- já atendido;
- não aplicável;
- adiado;
- necessita investigação.

Somente depois da aprovação o agente pode alterar produção ou testes. O plano cobre
todo o intervalo, mas a programação acontece em incrementos semânticos menores. Um
caso pode ser dividido ou agrupado quando houver dependências reais.

O planner grava e verifica diretamente `feature-plan.md` e, na atribuição posterior,
`technical-design.md`. O orquestrador recebe os caminhos, registra os resultados e
apresenta os gates ao desenvolvedor. Somente ele altera `state.json`.

## Testes de conformidade

`Fiscal.Calculos.Tests` reproduz em Delphi os testes oficiais associados a cada
`change_id`. O contrato diferencia status, fixtures, entrada, resultado esperado e
comportamento comprovado. Testes de regressão apenas sugeridos permanecem separados
dos testes oficiais. O Workflow não executa testes Java.

Testes adicionados são criados; modificados são atualizados; removidos são avaliados
quanto à exclusão ou obsolescência; inalterados preservam ou estabelecem a cobertura
equivalente. Um mesmo cenário associado a várias mudanças é implementado uma vez,
mantendo todos os vínculos de rastreabilidade.

A Skill
[`delphi-fiscal-calculos-test-runner`](../../.ai/skills/delphi-fiscal-calculos-test-runner/SKILL.md)
usa
[`Invoke-FiscalCalculosTests.ps1`](../../Tests/Automation/Invoke-FiscalCalculosTests.ps1)
com `CI/Win32` e resultado NUnit.

Criar testes não autoriza compilá-los ou executá-los. Para compilar sem executar:

```powershell
& .\Tests\Automation\Invoke-FiscalCalculosTests.ps1 -BuildOnly
```

Para executar a suíte completa, além da autorização é preciso confirmar que banco,
arquivos e serviços usados são recursos seguros de teste:

```powershell
& .\Tests\Automation\Invoke-FiscalCalculosTests.ps1 -ConfirmTestInfrastructure
```

## Como iniciar manualmente

Use a Command canônica [`update-fiscal-calculos`](../../.ai/commands/update-fiscal-calculos.md)
por linguagem natural ou pelo adapter da ferramenta:

```text
/update-fiscal-calculos v0029 v0039
```

Kilo Code e AiderDesk possuem adapters mínimos versionados nas fontes de setup. Eles
preservam a invocação explícita dos agentes e todos os gates canônicos. Se uma tag
estiver ausente, o comando permanece em `RECEIVED`, solicita somente o dado faltante
em português e mostra o exemplo acima; ele não tenta descobrir caminhos ou versões.

Para uma nova execução, o identificador é derivado do intervalo e do horário UTC.
Objetivo e restrições são opcionais. Para retomar uma execução, informe também o
`run-id` existente.

## Condição final

O processo termina em **Ready for Release** somente quando todos os `change_id`s
possuem decisão e evidência, os incrementos passaram por revisão independente e as
validações obrigatórias foram concluídas. Release, publicação, deployment, tags e
atualizações de issues ficam fora deste Workflow.
