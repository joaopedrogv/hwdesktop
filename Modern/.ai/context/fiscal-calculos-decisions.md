---
name: fiscal-calculos-decisions
description: Registro datado das decisões de conformidade entre o Java oficial da calculadora e o espelho Delphi de Fiscal.Calculos, com alternativas descartadas, consequências e dono.
---

# Fiscal.Calculos — Registro de decisões

Decisões tomadas em demandas de atualização da calculadora. Cada entrada registra o
motivo, o que foi descartado, a consequência e o dono. A rationale ampla permanece no
repositório "Contexto e decisões"; aqui fica o índice operacional que o agente precisa
para não repetir a pergunta.

| ID | Data | Decisão | Alternativa descartada | Consequência / dono |
|---|---|---|---|---|
| DEC-01 | 2026-11-25 | Núcleo numérico em `DecimalCalculo` interno ao módulo: exato até 48 casas e 64 dígitos, divisão 34 dígitos HALF_EVEN, um único arredondamento por número publicado | manter `Double` com divergência documentada; usar `Currency` em todo o núcleo; biblioteca externa | base de I01–I03; overflow/excesso de escala levanta, nunca trunca |
| DEC-02 | 2026-11-26 | Nulabilidade espelha o Java: `CurrencyNullable` no lugar de atributos de presença; removido `HasBaseCalculo` | `HasX: Boolean` (flags); `DoubleNullable` para todo `BigDecimal` | contratos de entrada (base do item e do IS, `impostoInformado`, quantidades); F1 preserva sobrecargas legadas |
| DEC-03 | 2026-11-26 | Sobrecargas `Create` com `Currency`/`Double` são preservadas, embrulhando o tipo nullable | atualizar os chamadores legados | `pkFiscal`/`pkNFConsumidor` compilam com as sobrecargas (verificado em 2026-11-26, exit 0); verificar chamadores antes de mudar tipo |
| DEC-04 | 2026-11-26 | Código de erro textual `REG-*` flui até a validação: `CodigoTexto` com `Codigo = 0`, overload por string na interface `ITradutorErrosRTC` e mensagem literal (detalhe da exceção; se vazio, a descrição literal do `ProblemType`); `ECOD_*` permanece inteiro | mapear `REG-034` para inteiro; publicar só a mensagem; prefixar `[RTC]`/colchetes no caminho textual | dono: código de erro/observabilidade; concluída no I06; I07 preserva `CodigoTexto` em validações não fatais e no `GetOperacaoOutput`; `EValidacaoRTC.Codigo` deixa de ser interno |
| DEC-05 | 2026-11-26 | `ResultadoCbsIbs` publica `Aliquota`/`TributoCalculado`/`TributoDevido` em `Currency` e `BaseCalculo` em `CurrencyNullable` | manter `Double` e converter na fronteira | dono: publicação de CBS/IBS (I03); consumidores convertem uma vez |
| DEC-06 | 2026-11-25 | Erro fiscal é fatal por item: `EValidacaoRTC`, item sem valor fiscal, documento prossegue | abortar o documento inteiro; acumular e continuar calculando | base do modelo de erro; `CalculadorROCService` converte e devolve `nil` |
| DEC-07 | 2026-11-26 | `ncm` e `nbs` serão campos independentes; o parser por tamanho fica só no chamador | manter `NCMouNBS` fundido | dono: incremento de TipoDfe/nomenclatura; caso "ambos" hoje inalcançável |
| DEC-08 | 2026-11-26 | `DeDouble`/`ParaDouble` usam representação decimal curta (15 dígitos significativos) nas fronteiras legadas | 17 dígitos (perde o empate `2.015`); proibir `Double` na fronteira | perda documentada acima de 15 significativos; origem `Currency` usa `DeCurrency` |

## Como registrar uma nova decisão

1. Acrescente a linha com o próximo `DEC-xx`, data e o incremento que a motivou.
2. Registre a alternativa descartada — é o que evita a reabertura da discussão.
3. Aponte a consequência prática (contrato, tipo, teste) e o dono.
4. Se a decisão for um MUST, atualize `../rules/fiscal-calculos-conformance.md` no mesmo
   passo; se for uma resposta recorrente, acrescente ao `fiscal-calculos-faq.md`.
