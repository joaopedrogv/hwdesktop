---
name: fiscal-calculos-conformance
description: Conformidade do espelho Delphi de Fiscal.Calculos com a implementação Java oficial da calculadora, abrangendo tipos, nulabilidade, arredondamento, contratos e códigos de erro.
applies_to:
  - "Fiscal.Calculos/**"
---

# Fiscal.Calculos — Conformidade com o Java

Regras obrigatórias do espelho Delphi de `Fiscal.Calculos` em relação ao código Java
oficial da calculadora. As tabelas de decisão, exemplos e justificativas estão em
`../context/fiscal-calculos-java-mapping.md`; as perguntas recorrentes em
`../context/fiscal-calculos-faq.md`; as decisões datadas em
`../context/fiscal-calculos-decisions.md`.

## Regras

1. **O Java é a fonte de verdade.** Quando o código Java e o desenho/documento divergem,
   o Java prevalece e o documento é corrigido. Divergência aceita exige decisão
   registrada, com dono — nunca improviso local.
2. **Nulabilidade espelha o Java.** Campo ou grupo sem `@NotNull` é representado por tipo
   `Nullable`. **Não se cria atributo de presença** (`HasX`, flag booleana) para
   substituir o `null` do Java.
3. **Tipo de valor fiscal.** `BigDecimal` com `@Digits(fraction <= 4)` ou escala fixa
   2/4 → `Currency` (obrigatório) ou `CurrencyNullable` (quando o Java admite nulo).
   Escala não limitada ou intermediário exato → `DecimalCalculo`.
4. **`Double` é proibido no miolo fiscal.** Ele só aparece em fronteira declarada, com
   dono e incremento registrados.
5. **Um único arredondamento por número publicado**, HALF_EVEN. O valor publicado
   realimenta a etapa seguinte quando o Java o publica.
6. **Contratos externos são preservados.** Sobrecargas `Create` com `Currency`/`Double`
   nunca são removidas: elas embrulham o tipo nullable. Mudar tipo de campo de entrada
   obriga a verificar os chamadores legados (`Ativos/`, `Automacao Bpl/`).
7. **Erro fiscal é fatal por item.** Erros que invalidam valor usam `EValidacaoRTC`; o
   item fica sem valor fiscal e o documento prossegue. Código textual `REG-*` e código
   legado `ECOD_*` coexistem.
8. **Mensagens são literais.** Texto, pontuação, acentuação e travessão seguem exatamente
   o Java; não se "melhora" a redação.
9. **Superfícies não aplicáveis não se portam.** Controller/HTTP, Bean Validation,
   Jackson e DML de tabela espelho são `not-applicable` no ERP, salvo decisão explícita.
10. **Divergência estrutural aceita é registrada** com dono e gatilho de retomada; a
    limitação fica visível no plano, no desenho e no arquivo de decisões.

## Comentários de correspondência

Todo arquivo do módulo que espelha uma classe Java declara, no topo:

```pascal
// Java: <caminho/relativo/ao/snapshot>#<classe ou método>
// Mapeamento: <uma linha sobre nulabilidade/arredondamento/erro, quando não óbvio>
// Decisão: <id do arquivo de decisões, quando houver>
```

O comentário é rastreabilidade, não substituto destas regras.
