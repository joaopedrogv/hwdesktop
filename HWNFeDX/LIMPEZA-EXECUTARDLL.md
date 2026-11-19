# ExecutarDLL — mapa de consumidores e plano de decisão

- Branch: `resolve-refenreces-hwnfe`.
- Escopo: `HWNFeDX\UFuncoesDll.pas` (`ExecutarDLL` declaração `:92` com `export;`, implementação `:2189`,
  export `:2855`), `UAdmNFe.pas`, `hw.nfe.dx.dpr`, ERP e app de teste.
- Nenhuma alteração de código; build/teste não executados.

## 1. Consumidores diretos (dentro do DLL)

| Chamada | Método | Chamadores | Estado |
|---|---|---|---|
| `:356` `'Validar'` | `TFrmAdmNfe.btnValidarXMLClick` | — | **MORTO**: a chamada está dentro do bloco comentado `{` `:346-357`; o botão apenas abre o site da SEFAZ (`:342`). |
| `:524` `'Cancelar'` | `TFrmAdmNfe.CancelarNFE` (`:507`) | `EnviarNFeHW` (`dpr:595`, `tpop=3`); no viewer `btnCancNFClick` está comentado (`UAdmNFe.pas:186`) | **VIVO** no ERP legado (< 4.0) |
| `:1159` `'Consulta'` | `TFrmAdmNfe.enviaEvento` (`:986`) | `EnviarEvento` (`dpr:1015`, `tpop=1`, ramo não-EPEC) | **VIVO** no ERP legado (< 4.0) |
| `:2020` `'Imprimir'` | `TFrmAdmNfe.ImprimirNFe` (`:2017`) | `btnImprimirClick` (`UAdmNFe.pas:322`, viewer F8); `EnviarNFeHW` (`dpr:562/591`, `tpop=1/2`) | **VIVO**: viewer e ERP legado |
| `:2028` `'ImprimirEvento'` | `TFrmAdmNfe.ImprimirEvento` (`:2025`) | `EnviarEvento` (`dpr:1030`, `tpop=2`, ramo não-EPEC) | **VIVO** no ERP legado (< 4.0) |

O export `ExecutarDLL` em si **não tem chamador** no ERP; só cargas mortas em
`Ativos\fonte\DLLNFe\DFeHwLibUnit.pas:48,69,98,146` e `HWNFeDX\ArqsHw\uFuncHwNFE.pas:16-17,34,58`
(app de teste). `UformTeste.pas:230,748` está comentado.

## 2. Cadeias por export (quem alcança `ExecutarDLL`)

| Export | Caminho | Consumidores no ERP | Classificação |
|---|---|---|---|
| `VisualizaNFe` (`dpr:1317`) | `dpr:521 ShowModal` → `btnImprimirClick` → `ImprimirNFe` → `ExecutarDLL('Imprimir')` | `uClassesNotasFiscais.pas:7586` (`TNFCab.abreShiftF12`) ← `uCadNF.pas:9707,20213`; `UPrincipalCxl.pas:1183` | **VIVO** (viewer) |
| `EnviarNFeHW` (`dpr:1318`) | `dpr:562`/`:591` → `ImprimirNFe`; `dpr:595` → `CancelarNFE` | `uClassesNotasFiscais.pas:28481` (envio), `:22300` (impressão), `:14240` (cancelamento); acionados por `uCadNF.pas:8317,9812,19914,6545` e telas CCIA | **VIVO** no ramo `< 4.0` |
| `EnviarEvento` (`dpr:1327`) | `dpr:1015` → `enviaEvento` (tpop 1); `dpr:1030` → `ImprimirEvento` (tpop 2) | `uClassesNotasFiscais_nfe.pas:266,458,489,514,523`; acionados por `uCadNF.pas:6541,6546,6551,6553,6564,6729` | **VIVO** no ramo `< 4.0` |

Fora da cadeia (não usam `ExecutarDLL`): `ConsultaSefazOr`, `ConsNFEDLL` (corpo comentado/no-op),
`EnviarEmailNFe`, `NFDestinadas`, `NFDownload` (corpo comentado/no-op), `ValidaChaveNFe`, os exports
NFSe, `SendMailByACBr`, `hw_LerXMLNFe`, `nfse_get_regime_especial_trib`,
`ConsisteInscricaoEstadual`.

Os ramos `tpop=4` de `EnviarEvento` (manifestação do destinatário) **não** usam `ExecutarDLL` e não
dependem desta remoção.

## 3. O que precisa sair se `ExecutarDLL` for removido de fato

- Viewer: `btnImprimir`/`btnImprimirClick` (ou apenas a chamada a `ImprimirNFe`) e o caminho
  `VisualizaNFe` → F8.
- ERP legado (`< 4.0`): consumidores de `EnviarNFeHW` (envio/impressão/cancelamento) e de
  `EnviarEvento` tpop 1/2, listados na tabela; e os métodos `CancelarNFE`, `enviaEvento` (ramo
  não-EPEC), `ImprimirNFe`, `ImprimirEvento`.
- Por fim: implementação/declaração/export de `ExecutarDLL` e as cargas do wrapper.
- `ExecutarDLL('Validar')` não exige remoção de consumidor: é comentário morto (`UAdmNFe.pas:346-357`).

## 4. Opções

| Opção | Escopo | Impacto | Risco |
|---|---|---|---|
| **A. Superfície pública apenas** | Remover `export;` (`:92`) + entrada do `exports`; remover cargas mortas do wrapper/app de teste; remover o bloco comentado de `Validar` | Remove API morta; viewer e ERP legado continuam funcionando | Baixo; muda a tabela de exports (ordinais) |
| **B. Remover o viewer F8** | Remover `btnImprimir`/handler (ou só a chamada) mantendo `ImprimirNFe` para `EnviarNFeHW` | Perde a impressão pelo viewer; ERP legado continua | Médio; feature visível |
| **C. Remover o legado < 4.0** | Remover os consumidores de `EnviarNFeHW` e `EnviarEvento` tpop 1/2; depois os 4 métodos e `ExecutarDLL` | Perde cancelamento/impressão/eventos pelo caminho 3.10; `tpop=4` permanece | Alto; decisão de produto sobre suporte a 3.10 |
| **D. Refatorar o dispatcher** | Substituir `ExecutarDLL(vtipoOP)` por métodos específicos e migrar os consumidores | Mantém features; elimina o genérico | Médio; mais arquitetural |

## 5. Decisões necessárias

1. O ERP ainda precisa do caminho **NFe 3.10** (`GetVersaoNFe <> vnf400`) para envio, impressão,
   cancelamento e eventos? Se não, a opção C é viável; se sim, C fica bloqueada.
2. O viewer ainda precisa do botão **F8 Imprimir DANFE** (opção B)?
3. Preferimos A (só API morta) agora, C (remover o legado) ou D (refatorar)?

**Recomendação:** começar por **A** (seguro e imediato: export + cargas mortas + comentário `Validar`).
Se o produto confirmar o fim do suporte 3.10, executar **C** em demanda própria, removendo os
consumidores por cadeia (viewer F8 + `EnviarNFeHW` + `EnviarEvento` tpop 1/2) e, por último, os métodos
e `ExecutarDLL`.

## 6. Consumidores por método (remoção dos quatro métodos legados)

| Método | Chamador direto | Export que o alcança | Consumidores na aplicação | O que precisa sair junto |
|---|---|---|---|---|
| `CancelarNFE` (`UAdmNFe.pas:507`) | `EnviarNFeHW` (`dpr:595`, `tpop=3`) — única chamada viva; `btnCancNFClick` tem a chamada comentada (`UAdmNFe.pas:186`) | `EnviarNFeHW` | `uClassesNotasFiscais.pas:14240` (`TNFCab.cancelarNotaFiscal`) ← `uCadNF.pas:19914` (`SpeedButton6Click`), `uCadNF_PendCanc.pas:58`, `uCadNF.pas:6545` (`BitBtn158Click`) | Ramo `tpop=3` de `EnviarNFeHW` e os call sites de cancelamento legado; o restante de `EnviarNFeHW` (envio `tpop=1`) permanece |
| `enviaEvento` (`:986`) | `EnviarEvento` (`dpr:1015`, `tpop=1`, ramo não-EPEC) | `EnviarEvento` | `uClassesNotasFiscais_nfe.pas:266` (`EnviarEPEC`), `:458` (`_enviarCancelamento`), `:489` (`_enviarCC_e`) ← `uCadNF.pas:6541,6551`, `uClassesNotasFiscais.pas:28447` | Ramo `tpop=1` de `EnviarEvento` e os call sites de CC-e/cancelamento legado; `tpop=3` (e-mail) e `tpop=4` (manifestação) permanecem |
| `ImprimirNFe` (`:2017`) | `btnImprimirClick` (`:322-325`, **botão F8 visível no viewer**) e `EnviarNFeHW` (`dpr:562` `tpop=1`, `dpr:591` `tpop=2`) | `VisualizaNFe` e `EnviarNFeHW` | Viewer: `uClassesNotasFiscais.pas:7586` ← `uCadNF.pas:9707,20213`; `UPrincipalCxl.pas:1183`. Legado: `uClassesNotasFiscais.pas:22300` ← `uCadNF.pas:9812`, `UcadVeiculosCCIA`, `UMovVeiculosCCIA`, `uCadEstMotosCCIA` | Botão/handler F8; ramo `tpop=2`; a chamada de impressão no `tpop=1` (o envio de `tpop=1` permanece) |
| `ImprimirEvento` (`:2025`) | `EnviarEvento` (`dpr:1030`, `tpop=2`, ramo não-EPEC) | `EnviarEvento` | `uClassesNotasFiscais_nfe.pas:523` (`_imprimirEvento`) ← `uCadNF.pas:6546,6553,6564` | Ramo `tpop=2` de `EnviarEvento` e os call sites de impressão de evento legado |

Observações:

- O `tpop=4` de `EnviarEvento` (manifestação do destinatário) e o `tpop=3` (e-mail de evento) **não**
  chamam `ExecutarDLL`. O `tpop=4` permanece (tem consumidor); o `tpop=3` perdeu o consumidor na
  parte 1 e pode sair junto com os ramos 1/2.
- O `tpop=1` de `EnviarNFeHW` (envio) continua usando `enviaNFe`/`GeraNFe`; só a parte de impressão sai.
- O `ExecutarDLL('Validar')` é comentário morto (`UAdmNFe.pas:346-357`); não tem consumidor.
- Sem os quatro métodos, `ExecutarDLL` fica sem chamadores vivos (só o comentário); aí sim removem-se
  declaração (`:92`, incluindo `export;`), implementação (`:2189`), `exports` (`:2855`) e as cargas do
  wrapper/app de teste.

## 7. Estado do desmonte (partes 1 a 4 aplicadas; DLL compilada)

Verificado no working tree em 18/11/2026 (alterações não commitadas):

- `Automacao Bpl\fonte\uClassesNotasFiscais.pas` — `TNFCab.cancelarNotaFiscal` (`:14131`): removida a
  chamada `EnviarNFeHW(..., '3', ...)`; o bloco de NF 55/emissão própria agora apenas aborta com
  "Nota Fiscal não cancelada no Web Service" (`:14230-14239`).
- `Automacao Bpl\fonte\uClassesNotasFiscais.pas` — `imprimeNotaFiscal` (`:22247`): fora do 4.0 aborta
  com "Nota fiscal muito antiga, utilize o módulo 3.1" (`:22289-22292`) em vez de `EnviarNFeHW('2')`.
- `Automacao Bpl\fonte\uClassesNotasFiscais.pas` — `enviarNotaFiscalEletronica` (`:28371`): guarda
  `GetVersaoNFe <> vnf400` no início (`:28390-28395`); o EPEC agora usa só a condição 4.0
  (`nfe_tpemis='4'` e sem `nfe_dpec_nregdpec`) e a autorização/impressão passou a chamar `dllNFe`
  direto (`:28443-28449`).
- `Automacao Bpl\fonte\uClassesNotasFiscais.pas` — `cadNfpeloComando` (`:12762`): `EnviarNFeHW` `:12800`
  substituído por `raise Exception.Create('Nota fiscal muito antiga')`; o método continua sem chamador.
- `Automacao Bpl\fonte\uClassesNotasFiscais_nfe.pas` — removidos os ramos legados
  (`versaoNFe <> vnf400`) de `EnviarEPEC`, `_enviarCC_e`, `_enviarCancelamento`, `_enviarEmailEvento`
  e `_imprimirEvento`; o caminho 4.0 (`dllNFe.*`) foi preservado. O EPEC 4.0 já era enviado por
  `dllNFe.AutorizarNFe`, então não houve troca de comportamento.

### Parte 3 aplicada (limpeza de código morto)

Ajustes pequenos anteriores (aplicados pelo desenvolvedor): `vTemp` removido de `cancelarNotaFiscal`
e `Result := False` no ramo legado de `imprimeNotaFiscal`.

- `uClassesNotasFiscais.pas`: removidos declaração e implementação de `TNFCab.cadNfpeloComando`
  (sem chamador); `cadNfpeloComandoAbreTela` e seus 4 chamadores intactos.
- `hw.nfe.dx.dpr`: removida a função `EnviarNFeHW` e sua entrada do `exports`; removidos os ramos
  `tpop=1/2/3` de `EnviarEvento` (fica só `tpop=4`).
- `UAdmNFe.pas`: removidos `CancelarNFE`, `enviaEvento`, `ImprimirEvento` e `enviaEventoEmail`
  (declarações e implementações). Mantidos `enviaNFe` (chamado em `btnCriarEnviarClick`),
  `ImprimirNFe` (F8), `enviaeventoNFeDestinadas` e `ExecutarDLL`.
- `uFuncHwNFE.pas` e `DFeHwLibUnit.pas`: removidos tipo, variável e `GetProcAddress` de
  `EnviarNFeHW` (o bloco legado comentado do `DFeHwLibUnit` ficou).
- `UformTeste.pas`: removidas as chamadas `EnviarNFeHW` e `EnviarEvento` 1/2/3, os imports
  correspondentes e o import quebrado de `GeraChaveNFe`; handlers mantidos (vazios).
- Build DLL: exit 0; `bpl\hw.nfe.dx.dll` 68.946.390 bytes (19/11/2026 08:20:59); `tdump` sem
  `EnviarNFeHW` e com `EnviarEvento`/`VisualizaNFe`/`ExecutarDLL`.
- Revisão independente: sem achados bloqueantes; os `major` são consequências do escopo aprovado
  (ver decisão pendente e nota de release).

### Consumidores restantes

| Símbolo | Situação |
|---|---|
| `EnviarNFeHW` | removido; restam apenas comentários (`UClassesVeiculosCCIA.pas:7658`, bloco legado do `DFeHwLibUnit`) |
| `EnviarEvento` `tpop=4` | vivo em `uClassesNotasFiscais_nfe.pas:1269,1327,1493,1707` |
| EPEC 4.0 | via `dllNFe.AutorizarNFe` / `nfe_evento_*` (não usa `ExecutarDLL`) |
| `ImprimirNFe` | removido (era o F8 do viewer) |
| `ExecutarDLL` | removido (declaração, implementação, `exports` e cargas) |

### Decisão pendente do desenvolvedor

`EnviarEvento` retorna `True` para `tpop` diferente de `4` (ramos 1/2/3 removidos): um chamador
externo que ainda passe 1/2/3 recebe sucesso sem evento enviado/impresso/cancelado. Opções: manter e
documentar em release notes, ou adicionar `else Result := False`.

Nota de release: a tabela de exports mudou (remoção de `EnviarNFeHW` e ordinais). A DLL só deve ser
publicada junto com o ERP 4.0; executáveis antigos que importem o símbolo estaticamente falham ao
carregar.

### Parte 4 aplicada (F8 + `ImprimirNFe` + `ExecutarDLL`)

- `UAdmNFe.pas`/`.dfm`: removidos `btnImprimir`, `btnImprimirClick`, `ImprimirNFe` e o bloco
  comentado de `Validar`; `vChaveNF` saiu da declaração de variáveis.
- `UFuncoesDll.pas`: removidos declaração (`export;`), implementação, `exports` e as variáveis
  `vTipoOP`/`vAux`, que ficaram sem uso.
- `DFeHwLibUnit.pas`/`uFuncHwNFE.pas`: removidos tipo, variável e `GetProcAddress` de `ExecutarDLL`.
- `UformTeste.pas`: removidos os comentários remanescentes de `ExecutarDLL`.
- Build DLL: exit 0; `bpl\hw.nfe.dx.dll` 68.936.722 bytes (19/11/2026 10:06:37); binário sem
  `ExecutarDLL`/`ImprimirNFe` e com `GeraNFe`/`verificarStatusWeb`/`TerminaNFE`/`ConsultaCadastro`.
- Revisão independente: sem bloqueantes. Notas: perda do F8 "Imprimir DANFE" (resta o botão de PDF);
  export table alterada (publicar junto com o ERP 4.0); `TabOrder` 5 vago (cosmético); o bloco
  comentado de `TEvent.btExecutarClick` cita `vAux`/`vtipoOP` e não compilaria se fosse reativado.

## 8. Nova decisão (2026-11-19): remover `enviaNFe` e os botões F2/F3

Decisão do desenvolvedor: remover `TFrmAdmNfe.enviaNFe` e, por consequência, `btnCriarEnviarClick`
(botão "(F2) Enviar NFe"); remover também `btnStatusServClick` (botão "(F3) Status Serviço").

### Impacto

- `enviaNFe`: declaração `UAdmNFe.pas:92`; implementação `:971-1667`; único chamador
  `btnCriarEnviarClick` (`:247`).
- `btnStatusServClick` (`:310-316`) chama `verificarStatusWeb('S')` (`:315`).
- Não há `ShortCut`/`VK_F2`/`VK_F3`; F2/F3 são apenas texto do caption.

Cascata:

| Símbolo | Situação após a remoção | Ação |
|---|---|---|
| `GeraNFe` | chamadas `:1627,:1641` estavam em `enviaNFe` | remover função (`UFuncoesDll.pas:757-2123`), decl `:80`, export `:2547` e cargas |
| `verificarStatusWeb` | chamadas `:315,:1056`; a de `:1056` está em `enviaNFe` | remover função (`:470-732`), decl `:79`, export `:2548` e cargas |
| `TerminaNFE` | continua chamado por `FormClose` (`:1702`) | manter função/export; cargas dos wrappers removidas |
| `vultstatus` | escrito por `verificarStatusWeb`/`enviaNFe`, lido por `GeraNFe` | remover (`UFuncoesDll.pas:100`) |
| `GeraChaveNFe` | usado em `UAdmNFe:466,755` e `uGerarChaveNFe:137` | manter |
| vars `UAdmNFe:113-119` | sem uso fora de `enviaNFe` | remover `tIde`, `temit`, `tdest`, `temVeic`, `veiculo`, `ttotal`, `ttipo`, `tretirada`, `tentrega`, `tExporta`, `DDadTransp`, `tProd`, `DDadosdup`, `DdadosCupom`, `vNLote`, `vTipoOP`, `vresposta`, `vItemDI` (manter `x`, `i`) |
| `ArrayBi` | `UAdmNFe:11` só serve à var `:115`; `uFuncHwNFE:6` só a `TGeraNFe`; `dpr:480` já sem uso | remover os três |

### Ordem proposta

1. UI/viewer: remover `btnStatusServ`/handler, `btnCriarEnviar`/handler, `enviaNFe` e as vars órfãs.
2. DLL: remover `GeraNFe`, `verificarStatusWeb` (funções e exports), `vultstatus` e as cargas nos
   wrappers; `TerminaNFE` fica.
3. Build DLL; `pkAtivos`/`PrTesteDll` e smoke quando autorizado.

### Efeito visível

O viewer perde "Enviar NFe" (F2) e "Status Serviço" (F3). O envio de NFe no 4.0 é feito pelo ERP via
`dllNFe`; `FormClose` continua chamando `TerminaNFE`.

### Exports resultantes

Saem `GeraNFe` e `verificarStatusWeb`. Permanecem `TerminaNFE`, `ConsultaCadastro` e os exports MDFe
da unit; no `.dpr`, `VisualizaNFe`, `EnviarEvento` e os demais não mudam.

### Execução (partes 1 e 2 aplicadas)

**Parte 1** (`UAdmNFe.pas`/`.dfm`): removidos os dois botões/handlers, `enviaNFe` (697 linhas), o
comentário `//  enviaNFe` e as vars que ficaram sem uso. Desvio necessário: `ArrayBi`, `DDadTransp` e
`tProd,DDadosdup,DdadosCupom` ficaram porque `UFuncoesDll.GeraNFe` (ainda presente) usa `ArrayBi` na
assinatura e `DDadosdup`/`DDadTransp` no corpo; `x`/`i` ficaram sem uso. Build intermediário: exit 0
(68.903.802 bytes, 15:15:30) — **não publicar** (o `GeraNFe` exportado podia falhar).

**Parte 2** (5 arquivos, +1/−1.664):

- `UFuncoesDll.pas`: removidos `GeraNFe`/`verificarStatusWeb` (declaração, implementação e exports),
  `vultstatus`, `UAdmNFe` do `uses` e o comentário `// result:=vresposta`. Exports restantes na época:
  `TerminaNFE`, `ConsultaCadastro` e os 6 MDFe (os dois primeiros saíram na limpeza final).
- `uFuncHwNFE.pas`/`DFeHwLibUnit.pas`: removidos `TverificarStatusWeb` e `TGeraNFe` (tipos, vars e
  `GetProcAddress`); as cargas de `TerminaNFE` também foram removidas depois (3 linhas por unit).
- `UAdmNFe.pas`: `ArrayBi` removido e o bloco de vars reduzido a `FrmAdmNfe`.
- `hw.nfe.dx.dpr`: removido `ArrayBi` e o `type` vazio (necessário para compilar).
- Build: exit 0; `bpl\hw.nfe.dx.dll` 68.825.912 bytes (19/11/2026 15:48:31).
- Revisão independente: sem bloqueantes/graves.

**Limpeza final de código morto (aplicada)** — 2 arquivos, 66 remoções:

- `UFuncoesDll.pas`: removidos `getCampoPipe`, `strIn` e `Split` (declarações e implementações), as
  vars `OpenDialog1`, `Form`, `Button1`, `Edit1`, `Label1`, `MemoResp`, `j`, `Resultado`, `vcaminho`,
  `vendbanco`, `vcodempresa` e as atribuições órfãs em `LerConfiguracao`.
- `UformTeste.pas`: removidos o tipo `ArrayBi` e os comentários de `GeraNFe`/`verificarStatusWeb`.
- **`VerificarSVC` mantido** (chamador vivo em `UConfcontingencia.pas:59`).
- Build: exit 0; `bpl\hw.nfe.dx.dll` 68.824.725 bytes (19/11/2026 16:07:31).
- Revisão independente: sem bloqueantes; confirmado no diff que as duas linhas removidas de
  `LerConfiguracao` eram leituras puras (não atribuíam `Result`).
- Resíduo conhecido, fora de escopo: `TNFeGeralLegado.CaminhoBanco` ficou write-only (`UAdmNFe:974`).

**Limpeza final (CaminhoBanco, `destroyDLLNfe`, cosméticos e exports)** — 4 arquivos, +2/−23:

- `UFuncoesDll.pas`: removidos o campo `TNFeGeralLegado.CaminhoBanco`, os `uses` Vcl sem uso
  (`Vcl.StdCtrls`, `Vcl.Buttons`, `Vcl.Dialogs`, `Vcl.Graphics`) e os comentários
  `// result:=vresposta`; removido `export;` da declaração **e** da implementação de
  `ConsultaCadastro`; `TerminaNFE` e `ConsultaCadastro` saíram do `exports` (funções mantidas).
- `UAdmNFe.pas`: removida a atribuição de `CaminhoBanco` e o `var i` sem uso em `btnValidarXMLClick`.
- `uFuncHwNFE.pas`: removido `destroyDLLNfe` (sem chamador); `carregaDLLNfe` mantido.
- `UformTeste.pas`: removido o comentário `//destroyDLLNfe;`.
- Build: exit 0; `bpl\hw.nfe.dx.dll` 68.824.642 bytes (19/11/2026 19:04:51).
- Export table conferida com `tdump -e`: `TerminaNFE` e `ConsultaCadastro` ausentes; os 6 MDFe
  exportados. As duas funções continuam compiladas e chamadas internamente (`UAdmNFe.FormClose`,
  `UFormconsCad`).
- Revisão independente: sem bloqueantes.

### Pendências finais

1. Compilar `PrTesteDll` (o `pkAtivos` já foi compilado e o visual do `FrmAdmNfe` conferido pelo
   desenvolvedor).
2. Release notes: exports `EnviarNFeHW`, `ExecutarDLL`, `GeraNFe`, `verificarStatusWeb`, `TerminaNFE`
   e `ConsultaCadastro` removidos; F2/F3/F8 removidos; publicar apenas com o ERP 4.0.
