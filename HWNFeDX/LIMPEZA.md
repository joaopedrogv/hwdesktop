# Limpeza do hw.nfe.dx — registro da demanda

- Branch de trabalho: `resolve-refenreces-hwnfe` (nome real no checkout).
- Projeto: `HWNFeDX\hw.nfe.dx.dpr` (DLL `hw.nfe.dx.dll`).
- Auditoria base: `.ai-runs/nfe-dx-export-audit/findings.md` (102 exports).
- Regra da série: **uma remoção por demanda**, do mais simples para o mais complexo; a remoção
  completa é **implementação → declaração → export**, com o chamador interno tratado junto.
- Escopo futuro: código morto, formulários não usados e refactor de funções genéricas com flags.
- Observação: `.vscode/settings.json` está modificado no working tree, sem relação com a limpeza.

## Fluxo por demanda

1. Identificar o caso, o export, a declaração/implementação e **todos** os chamadores.
2. Remover implementação e declaração; tratar o chamador; remover o export por último.
3. Compilar a DLL; o desenvolvedor testa o ERP.
4. Registrar o resultado e seguir para o próximo.

## Andamento

| # | Caso | Status | Observação |
|---|---|---|---|
| 1 | `hw_LerXMLNFeSaida` | **aplicado (completo)** | função no `.dpr` + export |
| 2 | `status` | **aplicado (completo)** | função + export |
| 3 | `VerificarSCAN` | **aplicado (completo)** | função + declaração + export + `LerSCAN` morto |
| 4 | `verificarRecibolote` | **aplicado (completo)** | função + declaração + export + `Button3Click` + botão "(F10)" |
| 5 | `EnviarEmailNFSe` | **aplicado (completo)** | função no `.dpr` + export + declaração/handler/botão do app de teste |
| 6 | `nfce_anexos_csharp`, `NFSeCallCriarAnexosCSharp` | **aplicado (completo)** | variantes sem buffer; buffers preservadas |
| 7 | `nfe_anexos_csharp` | **aplicado (completo)** | variante sem buffer NFe; buffer preservada |
| 8 | `leCertificadoNFe` | **proposto — próximo** | sem nenhuma chamada no repo; app só carrega |
| 9 | `LerConfiguracao` + `IniciaNFE` | preservar por enquanto | usadas por `leconfigNFE`, que atende o viewer |
| 10 | `InutilizarNFe`, `ConsultaCadastro`, `GeraChaveNFe` | backlog | dependem de features/forms do viewer |
| — | `nfce_serv_*` | preservar | usados pelos EXEs de serviço |
| — | variantes `*CSharpBuffer` e exports ativos | preservar | usados por C#/ERP |

## Demanda 1 — `hw_LerXMLNFeSaida` (aplicada)

- Implementação: `HWNFeDX\hw.nfe.dx.dpr:1363-1375`; export: `:1434`.
- Sem chamador; `AddNFeInDBFromXMLSaida` continua usado em `UClasseNFe.pas:4702`.
- Removidos 15 linhas do `.dpr`; bytes 74.256 → 73.910; 25 bytes altos, CP1252/CRLF, sem BOM.

## Demanda 2 — `status` (aplicada)

- Implementação: `UFuncoesDll.pas:571-575`; export: `:3039`; implementação-only, sem chamadas.
- Removidos 8 linhas; bytes 131.506 → 131.311; 446 bytes altos, CP1252/CRLF, sem BOM.

## Demanda 3 — `VerificarSCAN` (aplicada)

- Export `:3037`; declaração `:58`; implementação `:2757-2775`; único chamador
  `TFrmAdmNfe.LerSCAN` (`UAdmNFe.pas:104,2128-2132`), sem chamador.
- Removidos: export, declaração/implementação (21 linhas) + `LerSCAN` (7 linhas).
- `UFuncoesDll.pas`: 131.311 → 131.294 (export) → 130.694 (função); 446 bytes altos.
- `UAdmNFe.pas`: 101.211 → 101.072; 137 bytes altos, CRLF.
- Resta o comentário `// VerificarSCAN;` em `UConfcontingencia.pas:58`.

## Demanda 4 — `verificarRecibolote` (aplicada)

- Declaração `UFuncoesDll.pas:55`; implementação `:874-904`; export `:3017`.
- Único chamador: `TFrmAdmNfe.Button3Click` (`UAdmNFe.pas:441-450`), botão
  "(F10)Cons. Recibo de Lote" (`UAdmNFe.dfm:2491-2499`).
- Removidos: declaração + implementação (33 linhas), `Button3`/handler (13 linhas) e objeto DFM
  (9 linhas).
- `UFuncoesDll.pas`: 130.671 → 129.600; 439 bytes altos (7 bytes CP1252 saíram com a função).
- `UAdmNFe.pas`: 101.072 → 100.688; 137 altos. `UAdmNFe.dfm`: 163.436 → 163.213; ASCII.
- **Mudança de comportamento:** botão "(F10)Cons. Recibo de Lote" removido do viewer.

## Demanda 5 — `EnviarEmailNFSe` (aplicada)

- Implementação: `HWNFeDX\hw.nfe.dx.dpr:881-965`; export: `:1412`.
- Sem chamador no `.dpr`/units da DLL; único consumidor era o app de teste `PrTesteDll`
  (`UformTeste.pas:264,872`).
- Removidos: função + export (87 linhas no `.dpr`); no app de teste, a declaração `external`
  (`:264`), o handler `TfrmTestes_DFe.BitBtn39Click` (`:861-883`) e o campo/botão `BitBtn39`
  ("ImprimirNFSe") — 27 linhas no `.pas` e 9 no `.dfm`.
- `.dpr`: 73.910 → 71.546; 25 bytes altos, CP1252/CRLF.
- `UformTeste.pas`: 52.798 → 51.890; 84 altos. `UformTeste.dfm`: 26.433 → 26.203; ASCII.
- `EnviarEmailNFSeUseCaseUnit` (Modern) permanece; é outro símbolo.
- **Mudança de comportamento:** botão "ImprimirNFSe" do app de teste removido.

## Demanda 6 — `nfce_anexos_csharp` e `NFSeCallCriarAnexosCSharp` (aplicada)

- Removidas as variantes **sem buffer** e suas entradas de export:
  - `HWNFeDX\NFC\fontes\hw.nfce.dx.pas`: `function nfce_anexos_csharp(...)` (419-431) e o export.
  - `HWNFeDX\Modern\Exports\DFeDLLExport.pas`: `function NFSeCallCriarAnexosCSharp(...)` (210-225) e o export.
- Nenhum chamador no ERP/DLL; as variantes **buffer** continuam e chamam `nfce_anexos` /
  `NFSeCallCriarAnexos` diretamente.
- `hw.nfce.dx.pas`: 11.750 → 11.378 bytes; 1 byte alto, CP1252/CRLF.
- `DFeDLLExport.pas`: 9.635 → 9.161; 10 bytes altos, CP1252/CRLF.
- Sem mudança de comportamento para as variantes buffer nem para os C# fornecidos.

## Demanda 7 — `nfe_anexos_csharp` (aplicada)

- Implementação-only: `HWNFeDX\NF\hw.nfe.export.dx.pas:351-363`; export: `:459`; sem chamador.
- Removidos o bloco da função e a entrada do `exports` (15 linhas).
- `nfe_anexos_csharp_buffer` permanece e chama `nfe_anexos` diretamente.
- Bytes: 11.763 → 11.394; 1 byte alto, CP1252/CRLF.
- Sem mudança de comportamento para a variante buffer nem para os C# fornecidos.

## Demanda 8 — `leCertificadoNFe` (proposta)

**Por que é o próximo:** é o único export restante sem **nenhuma** chamada no repositório. A aplicação
apenas carrega o ponteiro em `DFeHwLibUnit` (nunca chama), e o projeto da DLL não usa a função.

**Evidências**

- Declaração: `HWNFeDX\UFuncoesDll.pas:49`.
- Implementação: `UFuncoesDll.pas:515-518`.
- Export: `UFuncoesDll.pas:2980`.
- Carga sem uso no ERP: `Ativos\fonte\DLLNFe\DFeHwLibUnit.pas:106,158`; nenhuma chamada.
- No app de teste/DLL: apenas declaração/carga (`uFuncHwNFE.pas:13,37,65`), sem chamada.
- Nenhum dos projetos C# usa.

**Ajustes necessários**

1. Remover a declaração `function leCertificadoNFe: WideString; stdcall;` (linha 49).
2. Remover o bloco de implementação (515-518).
3. Remover `leCertificadoNFe,` do `exports` (2980).
4. Remover a referência no wrapper do ERP: `TleCertificadoNFe` (45), `leCertificadoNFe` (106) e o
   `GetProcAddress` (158) em `Ativos\fonte\DLLNFe\DFeHwLibUnit.pas`.
5. Remover as referências equivalentes no app de teste/DLL: `TleCertificadoNFe` (13),
   `leCertificadoNFe` (37) e o `GetProcAddress` (65) em `HWNFeDX\ArqsHw\uFuncHwNFE.pas`.
6. Compilar a DLL; o ERP não é afetado (não há chamada).

**Risco residual:** consumidor externo desconhecido; não há evidência no ERP, nos C# ou no app de
teste. O wrapper do ERP manterá uma carga morta até a limpeza do app.

## Limpeza de referências residuais (2026-11-18)

Ao revisar as remoções anteriores, foram encontradas referências mortas no código da aplicação/app de
teste:

- `Ativos\fonte\DLLNFe\DFeHwLibUnit.pas`: removidos `TStatus`/`Status` e as linhas comentadas de
  `VerificaSCAN` (7 linhas); não existia `GetProcAddress('status')`.
- `HWNFeDX\ArqsHw\uFuncHwNFE.pas`: removidos `TStatus`/`Status`, `TVerificaSCAN`/`VerificaSCAN` e o
  `GetProcAddress('VerificaSCAN')` (5 linhas).
- `HWNFeDX\ArqsHw\UformTeste.pas/.dfm`: removidos o handler `BitBtn5Click` (única chamada a
  `VerificaSCAN`) e o botão "Verifica SCAN" (`BitBtn5`), além do comentário de `Status`
  (8 linhas no `.pas`, 9 no `.dfm`).
- Sem resíduos para `hw_LerXMLNFeSaida`, `verificarRecibolote`, `EnviarEmailNFSe`,
  `nfce_anexos_csharp`, `NFSeCallCriarAnexosCSharp` e `nfe_anexos_csharp` no ERP.
- **Comentários legados pré-existentes** com `VerificaSCAN` (nome que nunca foi export) permanecem em
  blocos `{ ... }` de `uClassesNotasFiscais.pas`, `UClassesVeiculosCCIA.pas` e `UClassesPend.pas`;
  não são referências às remoções desta série — avaliar remoção numa limpeza de comentários.
