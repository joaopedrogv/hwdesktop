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
| 8 | `leCertificadoNFe` | **aplicado (completo)** | DLL + wrapper ERP + app de teste |
| 9 | `ConsultaCadastro` | **preservar** (decisão do desenvolvedor) | feature do viewer mantida |
| 10 | `LerConfiguracao` (refactor com record) | **aplicado — DLL compilada; pkAtivos/PrTesteDll e teste pendentes** | `LIMPEZA-LERCONFIGURACAO.md` |
| 11 | `InutilizarNFe` | **aplicado — DLL compilada; teste pendente** | função + export + botão + form apagados |
| 12 | `BuscaTroca` (helper sem chamadores) | **proposto — próximo** | `UFuncoesDll.pas`; confirmar histórico |
| 13 | `GeraChaveNFe` | backlog | feature/forms + chamadas em `UAdmNFe` |
| 14 | cargas mortas do wrapper (`ExecutarDLL`, `GeraNFe`, `verificarStatusWeb`, `TerminaNFE`) | backlog | exports permanecem; limpar tipo/var/GetProcAddress |
| — | `LerConfiguracao` + `IniciaNFE` | preservar por enquanto | usadas por `leconfigNFE`, que atende o viewer |
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

## Demanda 8 — `leCertificadoNFe` (aplicada)

- Removidos declaração (49), implementação (515-518) e export (2980) de `UFuncoesDll.pas` (7 linhas).
- Removidas as referências no wrapper do ERP (`DFeHwLibUnit.pas`): `TleCertificadoNFe` (tipo live e
  cópia comentada), variável e `GetProcAddress` — 4 linhas.
- Removidas as referências no app de teste/DLL (`uFuncHwNFE.pas`): tipo, variável e `GetProcAddress` —
  3 linhas.
- Removido o comentário remanescente em `UformTeste.pas` (`// function leCertificadoNFe...`).
- Não havia chamadas no ERP, nos C# ou no app de teste.
- Bytes: `UFuncoesDll.pas` 129.600 → 129.405; `DFeHwLibUnit.pas` 12.692 → 12.469;
  `uFuncHwNFE.pas` 3.786 → 3.611. Encoding preservado (CP1252/CRLF).

## Demanda 9 — `ConsultaCadastro` (preservada)

Decisão do desenvolvedor (2026-11-18): a feature continua no viewer; não será removida. O export, o
formulário e o botão permanecem.

## Demanda 10 — `LerConfiguracao` (em planejamento — refactor com records)

**Contexto real (corrigindo a unidade):** a implementação de `LerConfiguracao` está em
`HWNFeDX\UFuncoesDll.pas` (declaração `:48`, implementação `:399-443`, export `:2969`), não em
`uFuncHwNFE.pas` — este apenas carrega o ponteiro. O único chamador é `TFrmAdmNfe.leconfigNFE`
(`UAdmNFe.pas:2054-2112`). `LerConfiguracao` chama `IniciaNFE(certif, geral, webservice)`
(`UFuncoesDll.pas:285-396`, export `:2970`).

**Mapeamento atual (cada posição → campo do record)**

`certif: array[0..3] of shortstring`
0 CaminhoPFX, 1 Senha, 2 NumeroSerie, 3 DiasAviso.

`geral: array[0..15]`
0 TipoDANFE, 1 FormaEmissao, 2 Logomarca, 3 SalvarArquivos, 4 PathSalvar, 5 EnderecoRave,
6 EnderecoPDF, 7 CaminhoBanco, 8 CodigoEmpresa, 9 VersaoDF, 10 AguardarConsultaRet,
11 GravarLog, 12 Sistema, 13 MostrarValorLiquido, 14 CasasDecimais, 15 LarguraCodProd.

`webservice: array[0..6]`
0 UF, 1 Ambiente, 2 Visualizar, 3 Host, 4 Porta, 5 Usuario, 6 Senha.

`vescolhacert: WideString` → `EscolhaCertificado` ('N'/'S'; no código vivo atual não é usado — só no
bloco comentado).

**Decisões aprovadas (2026-11-18):** refactor em `UFuncoesDll.pas`; `uFuncHwNFE.pas` só perde o
loader; remover os exports de `LerConfiguracao` e `IniciaNFE`; `IniciaNFE` recebe o record; records no
interface de `UFuncoesDll.pas`; campos `string`; não reproduzir campos sem uso; assinatura
`const AConfigLegado: TNFeConfiguracaoLegado`. P1/P2/P4/P5/P6 aplicados; P3 adiado. Desenho completo:
`HWNFeDX/LIMPEZA-LERCONFIGURACAO.md`.

**Resultado (2026-11-18):**

- `UFuncoesDll.pas`: records `TNFeCertificadoLegado`/`TNFeGeralLegado`/`TNFeWebServiceLegado`/
  `TNFeConfiguracaoLegado` no interface; `LerConfiguracao(const AConfigLegado): WideString`;
  `procedure IniciaNFE(const AConfigLegado)`; mapeamento de todos os índices; remoção do bloco
  comentado de `vescolhacert`/`certif` e do proxy; `exports` sem `LerConfiguracao`/`IniciaNFE`.
- `UAdmNFe.pas`: `leconfigNFE` com record local, sem `SetLength` e sem as posições sem uso; globais
  `certif/geral/webservice` removidas (mantido `DDadTransp`).
- `DFeHwLibUnit.pas` e `uFuncHwNFE.pas`: loaders removidos; `UformTeste.pas` sem o comentário de
  `LerConfiguracao`.
- **Build da DLL:** `msbuild HWNFeDX\hw.nfe.dx.dproj /t:Build /p:Config=Debug /p:Platform=Win32
  /p:DCC_ForceExecute=true` — exit 0; `bpl\hw.nfe.dx.dll` com 69.043.794 bytes (18/11/2026 11:18).
- **Revisão independente:** sem achados bloqueantes/graves; um menor de cobertura de build
  (`pkAtivos`/`PrTesteDll` não compilados — autorização era só da DLL).
- **Pendente:** compilar `pkAtivos`/`PrTesteDll` quando autorizado e executar o roteiro runtime do
  viewer (certificado, emissão, DANFE, eventos, e-mail, download, log, `WEBSERV_VISUALIZAR`).

## Demanda 11 — `InutilizarNFe` (aplicada)

**Contexto:** era o último export de viewer cuja feature já estava **oculta e desabilitada** na tela —
`btnInutilizar` com `Visible=False` e `Enabled=False`, sem código que a habilitasse.

**Removido**

- `UFuncoesDll.pas`: `function InutilizarNFe(...)` (implementação-only) e a entrada do `exports`.
- `UAdmNFe.pas`: campo `btnInutilizar`, declaração/implementação de `btnInutilizarClick` e
  `UInutilizarNFE` do `uses`.
- `UAdmNFe.dfm`: objeto `btnInutilizar`.
- `hw.nfe.dx.dpr` e `hw.nfe.dx.dproj`: referências a `UInutilizarNFE`.
- Arquivos `UInutilizarNFE.pas` e `UInutilizarNFE.dfm` apagados.
- `UformTeste.pas`: comentário legado de `InutilizarNFe`.

**Verificação**

- Nenhuma ocorrência de `InutilizarNFe`/`UInutilizarNFE`/`FrmInutilizarNFes`/`btnInutilizar` no código
  rastreado; `TClassNfe.inutilizaNFe` (método distinto) permanece.
- Encoding: CP1252/ASCII, sem BOM, CRLF; `.dproj` mantém o BOM UTF-8. Bytes: `UFuncoesDll.pas`
  128.075 (430 altos), `UAdmNFe.pas` 99.541 (134), `UAdmNFe.dfm` 162.934 (ASCII),
  `hw.nfe.dx.dpr` 71.476 (25), `.dproj` 98.737 (BOM), `UformTeste.pas` 51.266 (84).

**Build (DLL, autorizado)**

- `msbuild HWNFeDX\hw.nfe.dx.dproj /t:Build /p:Config=Debug /p:Platform=Win32 /p:DCC_ForceExecute=true`
  — exit 0, sem erros.
- `bpl\hw.nfe.dx.dll` = 68.963.447 bytes (18/11/2026 12:01:49); `tdump` confirma `InutilizarNFe` fora
  da tabela de exports e `GeraNFe`/`ConsultaCadastro` presentes.

**Revisão independente:** sem achados bloqueantes/graves. Menores tratados: `LIMPEZA.md` atualizado;
DCU órfão `Win32\Debug\UInutilizarNFE.dcu` removido. Aceito: gap de `TabOrder` (2) no `TabSheet1` —
cosmético; o IDE pode renumerar ao salvar. Observação: remoção de export muda a tabela pública
(inclusive ordinais) — registrar em release notes.

**Pendente:** compilar `pkAtivos`/`PrTesteDll` quando autorizado e smoke do viewer (abrir
`FrmAdmNfe`, emissão/impressão).

**Próximos candidatos:** `BuscaTroca` em `UFuncoesDll.pas` (ficou sem chamadores) e as cargas mortas
do wrapper para `ExecutarDLL`, `GeraNFe`, `verificarStatusWeb` e `TerminaNFE`.

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
- **Comentários legados com `VerificaSCAN` removidos (2026-11-18):** blocos comentados dos métodos
  `tentarSCAN` em `uClassesNotasFiscais.pas` (25 linhas), `UClassesVeiculosCCIA.pas` (22) e
  `UClassesPend.pas` (22). Os métodos permanecem como stubs (`Result := False; Exit;`); não há mais
  `VerificaSCAN`/`VerificarSCAN` no código da aplicação.
