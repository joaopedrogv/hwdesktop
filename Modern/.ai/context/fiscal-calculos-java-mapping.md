---
name: fiscal-calculos-java-mapping
description: Tabelas de decisão para traduzir tipos, nulabilidade, arredondamento, erros e estruturas do Java oficial para o espelho Delphi de Fiscal.Calculos.
---

# Fiscal.Calculos — Mapeamento Java → Delphi

Leia este documento antes de decidir tipo, nulabilidade, contrato ou arredondamento em
`Fiscal.Calculos`. A regra obrigatória está em `../rules/fiscal-calculos-conformance.md`;
as perguntas recorrentes em `fiscal-calculos-faq.md`; as decisões datadas em
`fiscal-calculos-decisions.md`.

## 1. Tipos e nulabilidade

| Java | Delphi | Regra |
|---|---|---|
| `Integer` (sem `@NotNull`) | `IntegerNullable` | campo numérico inteiro opcional |
| `String` (sem `@NotNull`) | `StringNullable` | texto opcional |
| `Boolean` (objeto) | `BooleanNullable` | flag opcional |
| `LocalDate` / `OffsetDateTime` (opcional) | `DateAndTimeNullable` | data opcional |
| `BigDecimal` com `@Digits(fraction <= 4)` | `Currency` / `CurrencyNullable` | **padrão** para valor fiscal |
| `BigDecimal` sem escala fixa | `DecimalCalculo` | núcleo exato; não há decimal nullable hoje |
| `BigDecimal` em fronteira legada `Double` | `DeDouble` (15 dígitos) | perda documentada; ver §2.5 |
| `Double` no Java | `Double` | só espelho de fronteira, com dono |

Armadilhas:

- `CreateOrNull(0)` trata **zero como nulo**. Em campo fiscal use `Create(valor)` ou
  `NullInstance()` explicitamente: zero informado é informação.
- `Currency` guarda 4 casas exatas; `Double` é binário e perde empates (`2.015`).
- Registro não inicializado (`Default`) lê `IsNull = True`; o `Create` decide o default.

## 2. Presença × zero

| Situação | Java | Delphi |
|---|---|---|
| Campo ausente | `null` | `NullInstance()` |
| Campo presente com zero | `BigDecimal.ZERO` | `Create(0)` |
| Grupo ausente | objeto `null` | record com `RecordInstance` = `riNull` |
| Grupo presente e vazio | objeto com campos nulos | `Create()` |

Consequências observadas nesta linha de trabalho:

- `ItemCalculoInput.BaseCalculo` ausente → o serviço **calcula e preenche**; zero informado
  é comparado e pode divergir (REG-034).
- `ImpostoSeletivoInput.impostoInformado` ausente → tratado como zero **na leitura**, mas
  o ramo legado distingue ausente de zero na validação.
- `ItemCalculoInput.Quantidade` ausente → **efetiva 1**; zero informado é rejeitado.
- `ImpostoSeletivoInput.Quantidade` ausente → exigida apenas quando há alíquota ad rem.

## 3. Valores e arredondamento

| Aspecto | Regra |
|---|---|
| Tipo do núcleo | `DecimalCalculo` (base 10.000, 16 limbs) |
| Capacidade | 48 casas e 64 dígitos totais (inteiros + escala); acima disso `EDecimalCalculo` |
| Soma/subtração/multiplicação | exatas, sem arredondamento intermediário |
| Divisão | 34 dígitos significativos, HALF_EVEN; divisor zero levanta |
| Publicação | um único arredondamento: valor 2 casas, alíquota 4 casas, HALF_EVEN |
| Realimentação | o valor **publicado** entra na etapa seguinte quando o Java o publica |
| Percentual ↔ fração | deslocamento de ponto exato, não divisão por 100 arredondada |

## 4. Erros e códigos

| Aspecto | Regra |
|---|---|
| Abrangência | fatal **por item**; o documento continua e o item fica sem valor fiscal |
| Exceção | `EValidacaoRTC` com `Codigo` textual (`REG-*`) e mensagem literal |
| Saída | `ValidacaoItemOutput.Codigo` (legado `ECOD_*`) + `CodigoTexto` (`REG-*`) |
| Tradução | `TradutorErrosRtc` por inteiro (legado) e por string (RTC) |
| Observabilidade | estado do item (ex.: `INCONSISTENCIA_ENTRADA`) quando existir superfície |

## 5. Equivalentes estruturais

| Java | Delphi |
|---|---|
| `enum` com atributos e métodos | `enum` + funções no mesmo unit |
| `null` de enum | valor sentinela (`bcnUnassigned`) |
| `List<T>` | `array of T` |
| `Set<T>` sem ordem (ex.: avisos) | lista/array comparado **como conjunto** |
| DTO de entrada exclusivo de HTTP | parâmetros do serviço (adaptação) |
| `Optional`/`null` de grupo | `RecordInstance` no record do grupo |

## 6. Não aplicável ao ERP (catálogo)

- Controller, rota e serialização JSON de resposta.
- Bean Validation (`@NotNull`, `@Digits`, `@PositiveOrZero`) na borda — a validação vive
  no serviço.
- Jackson 2/3, `@JsonPropertyOrder`, `@Jacksonized`, anotações de serialização.
- `INSERT`/`UPDATE`/`DELETE` de tabela espelho — vêm da sincronização, não de migração.
- `unassociated_artifacts`, diffs e classificação do pipeline de conformidade.

## 7. Divergências estruturais aceitas (com dono)

| Divergência | Efeito | Dono / gatilho |
|---|---|---|
| `ncm` e `nbs` fundidos em `NCMouNBS` por tamanho | caso "ambos" inalcançável; natureza `bcnUnassigned` | separar no incremento de TipoDfe/nomenclatura |
| Ausência do DTO `BaseCalculoUnificadaInput` | serviço recebe parâmetros separados | aceito; sem consumidor HTTP |
| `Double` residual em `TributacaoCompraGovernamentalModel` | publicação HALF_UP e perda de dígitos | I10/I15 (resultados de CBS/IBS já publicam `Currency` desde o RC-1/I03) |
| `ArredondamentoUtilsUnit`/`NumberServiceUnit` legados sem consumidor novo | risco de reutilização | limpeza posterior, com autorização |
| Registro de `BaseCalculoUnificadaService` na factory | feito no I06 | — |
| Alíquotas internas de CBS/IBS guardam o **percentual publicado** (4 casas) e reconvertem para fração nos grupos | ramo `aliquotaDivididaPorCem` reversível; no ramo não dividido a fração perde casas acima de 6 (hoje inalcançável: `taSemAliquota` = 0 e `taAliquotaCombinada` não implementada) | I03 fechou assim para preservar t4 `3,5249`/`35.249,00`; revisar no I09 e quando o I16 trouxer `aliquotaInformada`/510001 |
| `ObterGrupoMonofasia` recebe `valorAliquotaAdRem*` onde o Java recebe `resultadoAliquota`/`resultadoAliquotaEfetiva` | possível divergência de `aliquotaAdRem` no grupo monofásico | I09 (pré-existente, exposto na revisão do RC-1/I03) |

## 8. Comentários de correspondência

```pascal
// Java: source/src/main/java/br/gov/serpro/rtc/<...>.java#<classe/metodo>
// Mapeamento: <nulabilidade | arredondamento | erro> — uma linha
// Decisão: DEC-xx
```

Obrigatório em arquivo que espelha classe Java do domínio; dispensável em utilitário
interno sem correspondente.
