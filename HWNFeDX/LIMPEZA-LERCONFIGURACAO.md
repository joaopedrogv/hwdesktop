# Demanda 10 — refactor de `LerConfiguracao`/`IniciaNFE` com record

- Branch: `resolve-refenreces-hwnfe`.
- Projeto: `HWNFeDX\hw.nfe.dx.dpr` (DLL Win32).
- Natureza: desenho técnico. Nenhum arquivo de produção foi alterado; build/teste não autorizados.
- Decisões fechadas do desenvolvedor: refactor em `UFuncoesDll.pas`; `uFuncHwNFE.pas` só perde o
  loader; remover o export de `LerConfiguracao`; refatorar `IniciaNFE` para o record; records no
  `interface` de `UFuncoesDll.pas`; campos `string`; não reproduzir campos sem uso; assinatura
  `const AConfigLegado: TNFeConfiguracaoLegado`.

## 1. Records (interface de `UFuncoesDll.pas`, após `TEvent`)

```pascal
  TNFeCertificadoLegado = record
    CaminhoPFX: string;
    Senha: string;
    NumeroSerie: string;
  end;

  TNFeGeralLegado = record
    TipoDANFE: string;
    FormaEmissao: string;
    Logomarca: string;
    SalvarArquivos: string;
    PathSalvar: string;
    EnderecoPDF: string;
    CaminhoBanco: string;
    AguardarConsultaRet: string;
    GravarLog: string;
    Sistema: string;
    MostrarValorLiquido: string;
    CasasDecimais: string;
    LarguraCodProd: string;
  end;

  TNFeWebServiceLegado = record
    UF: string;
    Ambiente: string;
    Visualizar: string;
  end;

  TNFeConfiguracaoLegado = record
    Certificado: TNFeCertificadoLegado;
    Geral: TNFeGeralLegado;
    WebService: TNFeWebServiceLegado;
  end;
```

Campos omitidos por não terem uso vivo: `certif[3]` (DiasAviso), `geral[5]` (EnderecoRave),
`geral[8]` (CodigoEmpresa), `geral[9]` (VersaoDF), `webservice[3..6]` (Host/Porta/Usuario/Senha) e o
parâmetro `vescolhacert`.

## 2. Assinaturas

```pascal
function LerConfiguracao(const AConfigLegado: TNFeConfiguracaoLegado): WideString;

procedure IniciaNFE(const AConfigLegado: TNFeConfiguracaoLegado);
```

- `LerConfiguracao`: sem `stdcall` e sem `vescolhacert`; único chamador (`leconfigNFE`) está no mesmo
  módulo (`UAdmNFe` e `UFuncoesDll` compilam em `hw.nfe.dx.dpr`).
- `IniciaNFE`: hoje retorna `LongBool` sem nunca atribuir `Result` (`W1035`) e o chamador ignora o
  retorno; vira `procedure` (pendência P2).

## 3. Mapeamento índice → campo

| Array | Índice | Campo |
|---|---|---|
| certif | 0 | Certificado.CaminhoPFX |
| certif | 1 | Certificado.Senha |
| certif | 2 | Certificado.NumeroSerie |
| geral | 0 | Geral.TipoDANFE |
| geral | 1 | Geral.FormaEmissao |
| geral | 2 | Geral.Logomarca |
| geral | 3 | Geral.SalvarArquivos |
| geral | 4 | Geral.PathSalvar |
| geral | 6 | Geral.EnderecoPDF |
| geral | 7 | Geral.CaminhoBanco |
| geral | 10 | Geral.AguardarConsultaRet |
| geral | 11 | Geral.GravarLog |
| geral | 12 | Geral.Sistema |
| geral | 13 | Geral.MostrarValorLiquido |
| geral | 14 | Geral.CasasDecimais |
| geral | 15 | Geral.LarguraCodProd |
| webservice | 0 | WebService.UF |
| webservice | 1 | WebService.Ambiente |
| webservice | 2 | WebService.Visualizar |

## 4. Alterações em `UFuncoesDll.pas`

- Declaração `:48` e implementação `:399-443` de `LerConfiguracao` recebem a assinatura da §2.
- Corpo de `LerConfiguracao`: `IniciaNFE(AConfigLegado); vendbanco:=AConfigLegado.Geral.CaminhoBanco;`
  e certificado a partir de `AConfigLegado.Certificado`.
- `IniciaNFE` (`:285-396`): trocar cada `geral[n]`/`webservice[n]` pelo campo correspondente (§3);
  remover `ATipo` (não usado), a linha comentada de `geral[5]` e o bloco comentado de proxy
  (`webservice[3..6]`).
- Remover o bloco comentado de `vescolhacert`/`certif[2]`/`certif[3]` em `LerConfiguracao`
  (linhas 410, 416-442) — pendência P6.
- `exports`: remover `LerConfiguracao,` (linha 2969). Remover `IniciaNFE,` também — pendência P1.

## 5. Chamador `TFrmAdmNfe.leconfigNFE` (`UAdmNFe.pas:2054-2112`)

- Trocar `SetLength(certif/geral/webservice)` por um `AConfigLegado: TNFeConfiguracaoLegado` local.
- Preencher os campos da §3 a partir das mesmas expressões atuais.
- Remover as atribuições das posições sem uso: `certif[3]` (`DIAS_AVISO`), `geral[5]`
  (`NFE_ENDRELRAVE`), `geral[8]` (código da empresa), `geral[9]` (`'4.0'`), `webservice[3..6]`.
- Chamar `LerConfiguracao(AConfigLegado)`; quando `Certificado.NumeroSerie = ''`, atribuir o retorno ao
  mesmo campo (comportamento atual; o retorno é sempre `''`).
- Preservar byte a byte a linha 2056 (`//================ CONFIGURAÇÃO ...`, CP1252).
- Pendência P4: remover `certif, geral, webservice` da declaração global em `UAdmNFe.pas:123`.

## 6. Loaders mortos

- `Ativos\fonte\DLLNFe\DFeHwLibUnit.pas`: remover `TLerConfiguracao` (tipo vivo `:43` e cópia
  comentada `:66-67`), a variável `:99` e o `GetProcAddress` `:148`.
- `HWNFeDX\ArqsHw\uFuncHwNFE.pas`: remover `TLerConfiguracao` (`:11-12`), a variável `:33` e o
  `GetProcAddress` `:58`.
- Não alterar nenhuma outra função/loader dessas units.

## 7. Arquivos e encoding

| Arquivo | Encoding |
|---|---|
| `HWNFeDX\UFuncoesDll.pas` | CP1252, sem BOM, CRLF |
| `HWNFeDX\ArqsHw\UAdmNFe.pas` | CP1252, sem BOM, CRLF |
| `Ativos\fonte\DLLNFe\DFeHwLibUnit.pas` | CP1252, sem BOM, CRLF |
| `HWNFeDX\ArqsHw\uFuncHwNFE.pas` | ASCII, sem BOM, CRLF |

Cuidado: `'Homologação'`/`'Produção'` em `UFuncoesDll.pas:383-384` e `CONFIGURAÇÃO` em
`UAdmNFe.pas:2056` estão em CP1252; editar somente o operando, nunca redigitar o literal a partir
deste arquivo UTF-8.

## 8. Verificação

- Estática: sem `certif[`/`geral[`/`webservice[`/`vescolhacert`/`DIAS_AVISO` nas units alteradas;
  `exports` sem `LerConfiguracao`; sem resíduos dos loaders; bytes/CRLF/sem BOM.
- Build (requer autorização): `hw.nfe.dx.dproj`, `pkAtivos.dpk`, `PrTesteDll.dproj` na mesma revisão.
- Runtime (desenvolvedor): viewer em homologação/produção (certificado), emissão, impressão/DANFE,
  status/consulta/cancelamento/inutilização/eventos/e-mail/download, `WEBSERV_VISUALIZAR`, gravação de
  log e empresa sem número de série.

## 9. Pendências para aprovação

| ID | Pendência | Recomendação |
|---|---|---|
| P1 | Remover também `IniciaNFE,` do `exports` | remover (sem consumidor no checkout; passa a rotina interna) |
| P2 | `IniciaNFE`: `function ...: LongBool` → `procedure` | converter (`Result` nunca atribuído; chamador ignora) |
| P3 | Limpar o retorno inútil de `LerConfiguracao` (virar procedure) | deixar para depois; preservar comportamento nesta demanda |
| P4 | Remover `certif, geral, webservice` da global `UAdmNFe.pas:123` | remover (sem uso após o refactor) |
| P5 | Remover o comentário legado `UformTeste.pas:223` (`// function LerConfiguracao...`) | remover |
| P6 | Remover o bloco comentado `//{$IFNDEF ACBrNFeCAPICOM}`…`//{$ENDIF}` (410, 416-442) | remover (cita parâmetros que deixam de existir) |

## 10. Riscos

- `string` elimina o truncamento de `shortstring` (255) — benigno, mas documentado.
- Campos removidos não são lidos no código vivo; `VersaoDF` é fixado em `ve400`.
- Remover o export de `LerConfiguracao`/`IniciaNFE` assume ausência de consumidor externo ao checkout.
- Record por `const` (sem cópia); o record local do chamador é gerenciado pelo Delphi.
