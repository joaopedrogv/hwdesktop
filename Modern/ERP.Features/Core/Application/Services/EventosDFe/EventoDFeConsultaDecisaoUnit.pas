unit EventoDFeConsultaDecisaoUnit;

interface

uses
  EventoDFeTransmissaoTypesUnit,
  EventoDFeStatusUnit;

type
  // Classificação dos fatos da consulta à SEFAZ (tabela de decisão do desenho técnico).
  TDecisaoConsultaEventoDFe = (
    dcSemResposta,
    dcNfeNaoApta,
    dcEventoAutorizado,
    dcEventoEmProcessamento,
    dcEventoSemTentativa,
    dcColisao,
    dcNaoRegistrado);

function DecidirConsultaEventoDFe(const AConsulta: TEventoDFeResultadoConsulta;
  const ANseqEventoLocal: Integer; const AStatusLocal: TStatusEventoDFe;
  const AExisteTentativaAberta, AExisteTentativaLocal: Boolean):
  TDecisaoConsultaEventoDFe;
function ResultadoDeAutorizacaoPorConsulta(
  const AConsulta: TEventoDFeResultadoConsulta): TEventoDFeResultadoTransmissao;
function ResultadoDeRejeicaoPorNfe(
  const AConsulta: TEventoDFeResultadoConsulta): TEventoDFeResultadoTransmissao;
function ResultadoDeColisao(
  const AConsulta: TEventoDFeResultadoConsulta): TEventoDFeResultadoTransmissao;
function ResultadoEventoNaoRegistrado: TEventoDFeResultadoTransmissao;

implementation

uses
  SysUtils;

const
  CSTAT_NFE_APTA: array[0..1] of Integer = (100, 150);
  CSTAT_EVENTO_AUTORIZADO: array[0..2] of Integer = (135, 136, 155);
  // Decisão pendente do desenvolvedor: evento em processamento não é colisão; para voltar
  // à regra D5, remova o teste de CSTAT_EVENTO_NAO_CONCLUSIVO em DecidirConsultaEventoDFe.
  CSTAT_EVENTO_NAO_CONCLUSIVO: array[0..2] of Integer = (108, 109, 128);

function ResultadoTransmissaoVazio: TEventoDFeResultadoTransmissao;
begin
  Result.Classe := crSemResposta;
  Result.OrigemResultado := orNenhuma;
  Result.CStatLote := 0;
  Result.CStatEvento := 0;
  Result.XMotivo := '';
  Result.NProt := '';
  Result.DhRegEvento := 0;
  Result.XmlRetorno := '';
  Result.XmlProcEvento := '';
  Result.ErroTransporte := '';
end;

function CodigoNaLista(const ACodigo: Integer;
  const ACodigos: array of Integer): Boolean;
var
  Indice: Integer;
begin
  for Indice := Low(ACodigos) to High(ACodigos) do
    if ACodigos[Indice] = ACodigo then
      Exit(True);

  Result := False;
end;

function NfeApta(const AConsulta: TEventoDFeResultadoConsulta): Boolean;
begin
  Result := AConsulta.Respondeu and
    CodigoNaLista(AConsulta.CStatNFe, CSTAT_NFE_APTA);
end;

function EventoCompativel(const AConsulta: TEventoDFeResultadoConsulta;
  const ANseqEventoLocal: Integer): Boolean;
begin
  Result := AConsulta.EventoEncontrado and
    (AConsulta.NSeqEventoEncontrado = ANseqEventoLocal) and
    CodigoNaLista(AConsulta.CStatEvento, CSTAT_EVENTO_AUTORIZADO);
end;

function DecidirConsultaEventoDFe(const AConsulta: TEventoDFeResultadoConsulta;
  const ANseqEventoLocal: Integer; const AStatusLocal: TStatusEventoDFe;
  const AExisteTentativaAberta, AExisteTentativaLocal: Boolean):
  TDecisaoConsultaEventoDFe;
begin
  if not AConsulta.Respondeu then
    Exit(dcSemResposta);

  if not NfeApta(AConsulta) then
    Exit(dcNfeNaoApta);

  if not AConsulta.EventoEncontrado then
    Exit(dcNaoRegistrado);

  if AExisteTentativaAberta then
  begin
    if EventoCompativel(AConsulta, ANseqEventoLocal) then
      Exit(dcEventoAutorizado);

    if CodigoNaLista(AConsulta.CStatEvento, CSTAT_EVENTO_NAO_CONCLUSIVO) then
      Exit(dcEventoEmProcessamento);

    Exit(dcColisao);
  end;

  if EventoCompativel(AConsulta, ANseqEventoLocal) then
  begin
    if (AStatusLocal = seRejeitado) and AExisteTentativaLocal then
      Exit(dcEventoAutorizado);

    if AStatusLocal = seAutorizado then
      Exit(dcEventoAutorizado);

    Exit(dcEventoSemTentativa);
  end;

  Result := dcColisao;
end;

function ResultadoDeAutorizacaoPorConsulta(
  const AConsulta: TEventoDFeResultadoConsulta): TEventoDFeResultadoTransmissao;
begin
  Result := ResultadoTransmissaoVazio;
  Result.Classe := crAutorizado;
  Result.OrigemResultado := orFiscal;
  Result.CStatEvento := AConsulta.CStatEvento;
  Result.XMotivo := AConsulta.XMotivoEvento;
  Result.NProt := AConsulta.NProt;
  Result.DhRegEvento := AConsulta.DhRegEvento;
  Result.XmlProcEvento := AConsulta.XmlProcEvento;
end;

function ResultadoDeRejeicaoPorNfe(
  const AConsulta: TEventoDFeResultadoConsulta): TEventoDFeResultadoTransmissao;
begin
  Result := ResultadoTransmissaoVazio;
  Result.Classe := crRejeitado;
  Result.OrigemResultado := orFiscal;
  Result.XMotivo := Format('%d %s', [AConsulta.CStatNFe, AConsulta.XMotivoNFe]);
end;

function ResultadoDeColisao(
  const AConsulta: TEventoDFeResultadoConsulta): TEventoDFeResultadoTransmissao;
begin
  Result := ResultadoTransmissaoVazio;
  Result.Classe := crRejeitado;
  Result.OrigemResultado := orFiscal;
  Result.CStatEvento := AConsulta.CStatEvento;
  Result.XMotivo := AConsulta.XMotivoEvento;
  Result.NProt := AConsulta.NProt;
  Result.DhRegEvento := AConsulta.DhRegEvento;
  Result.XmlProcEvento := AConsulta.XmlProcEvento;
end;

function ResultadoEventoNaoRegistrado: TEventoDFeResultadoTransmissao;
begin
  Result := ResultadoTransmissaoVazio;
  Result.XMotivo := 'Evento não registrado na SEFAZ.';
end;

end.
