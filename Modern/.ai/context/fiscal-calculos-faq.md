---
name: fiscal-calculos-faq
description: Respostas objetivas às dúvidas recorrentes de conformidade entre o Java oficial da calculadora e o espelho Delphi de Fiscal.Calculos.
---

# Fiscal.Calculos — Perguntas recorrentes

Responda por aqui antes de levar a dúvida ao desenvolvedor. Se a resposta não cobrir o
caso, pergunte citando o item e a lacuna concreta.

**1. Preciso criar um atributo `HasX` para representar campo ausente?**
Não. Ausência é o `null` do Java; no Delphi use `CurrencyNullable`/`DoubleNullable`/
`IntegerNullable`/`StringNullable` e `IsNull`. Atributo de presença só existiria por
decisão registrada, e a decisão vigente é não criá-lo.

**2. `DoubleNullable` ou `CurrencyNullable`?**
`CurrencyNullable` quando o Java tem `@Digits(fraction <= 4)` ou escala fixa 2/4 — é
exato e cobre o valor fiscal. `DoubleNullable` só como ponte declarada quando a escala
não é limitada.

**3. Posso usar `Double` no cálculo?**
Não no miolo. Use `DecimalCalculo`; `Double` apenas em fronteira com dono e incremento
registrados.

**4. Posso converter `BigDecimal` para `Double` na entrada?**
Só em fronteira legada, via `DeDouble` (15 dígitos significativos), com a perda
documentada. Se a origem já é `Currency`, use `DeCurrency` — nunca passe por `Double`.

**5. Um teste falhou com `1,34` e o oficial diz `1,35`. Ajusto o teste?**
Não. Reconcilie com o snapshot oficial e registre a divergência com dono. Ajustar a
expectativa ao resultado atual mascara o defeito.

**6. O desenho diz uma coisa e o Java outra. Qual sigo?**
O Java. Corrija o documento no mesmo incremento e registre a decisão.

**7. Preciso portar o controller, o Bean Validation e o Jackson?**
Não. São `not-applicable` no ERP. A validação vive no serviço; não há superfície HTTP no
módulo.

**8. Posso remover ou trocar a assinatura de um `Create` existente?**
Não. Preserve as sobrecargas com `Currency`/`Double` embrulhando o tipo nullable. Antes
de mudar tipo de campo de entrada, procure chamadores em `Ativos/` e `Automacao Bpl/`.

**9. Posso melhorar a mensagem de erro?**
Não. O texto é literal ao Java, inclusive pontuação, acentos e travessão.

**10. O Java itera um `Set`; preciso da mesma ordem?**
Não. Compare avisos como conjunto. A ordem determinística do Delphi é uma escolha de
implementação, desde que o conteúdo seja igual.

**11. Devo reproduzir `INSERT`/`UPDATE`/`DELETE` de tabela espelho em migração?**
Não. Dados de espelho vêm da sincronização; migração ERP trata schema e dados ERP-owned.

**12. Onde registro uma divergência estrutural aceita?**
No arquivo de decisões (`fiscal-calculos-decisions.md`) com dono e gatilho de retomada, e
no plano/desenho do incremento correspondente.
