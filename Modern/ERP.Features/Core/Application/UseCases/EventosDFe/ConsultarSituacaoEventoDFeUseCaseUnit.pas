unit ConsultarSituacaoEventoDFeUseCaseUnit;

interface

uses
  IDataBaseConnectionUnit,
  ISessionContextUnit,
  IEventosDFeRepositoryUnit,
  IEventoDFeFiscalGatewayUnit,
  IEventoDFeTransmissaoRepositoryUnit,
  EventoDFeEnvelopeResolverUnit,
  EventoDFeEtdUnit,
  EventoDFeTransmissaoEtdUnit,
  EventoDFeTransmissaoTypesUnit,
  EventoDFeStatusUnit,
  EventoDFeConsultaDecisaoUnit;

type
  TEventoDFeResultadoConsultarSituacao = record
    Decisao: TDecisaoConsultaEventoDFe;
    StatusEvento: TStatusEventoDFe;
    CStatEvento: Integer;
    XMotivo: string;
    NProt: string;
    DhRegEvento: TDateTime;
  end;

  ConsultarSituacaoEventoDFeUseCase = class
  private
    FConnection: IDataBaseConnection;
    FSession: ISessionContext;
    FGateway: IEventoDFeFiscalGateway;
    FEventosRepo: IEventosDFeRepository;
    FTransmissaoRepo: IEventoDFeTransmissaoRepository;
    FEnvelopeResolver: IEventoDFeEnvelopeResolver;
    function MontarRequisicao(const AEvento: EventoDFeEtd):
      TEventoDFeRequisicaoPreparo;
  public
    constructor Create(const AConnection: IDataBaseConnection;
      const ASession: ISessionContext;
      const AGateway: IEventoDFeFiscalGateway;
      const AEventosRepository: IEventosDFeRepository;
      const ATransmissaoRepository: IEventoDFeTransmissaoRepository;
      const AEnvelopeResolver: IEventoDFeEnvelopeResolver);
    function Executar(const AEventoDFeId: string):
      TEventoDFeResultadoConsultarSituacao;
  end;

implementation

uses
  SysUtils,
  StatusRegistroEnumUnit,
  TipoEventoDFeUnit,
  EValidacaoNegocioUnit,
  EventoDFeConclusaoTentativaUnit;

{ ConsultarSituacaoEventoDFeUseCase }

constructor ConsultarSituacaoEventoDFeUseCase.Create(
  const AConnection: IDataBaseConnection; const ASession: ISessionContext;
  const AGateway: IEventoDFeFiscalGateway;
  const AEventosRepository: IEventosDFeRepository;
  const ATransmissaoRepository: IEventoDFeTransmissaoRepository;
  const AEnvelopeResolver: IEventoDFeEnvelopeResolver);
begin
  FConnection := AConnection;
  FSession := ASession;
  FGateway := AGateway;
  FEventosRepo := AEventosRepository;
  FTransmissaoRepo := ATransmissaoRepository;
  FEnvelopeResolver := AEnvelopeResolver;
end;

function ConsultarSituacaoEventoDFeUseCase.MontarRequisicao(
  const AEvento: EventoDFeEtd): TEventoDFeRequisicaoPreparo;
begin
  Result.CodEmpresa := AEvento.CodEmpresa;
  Result.ChaveDocumento := AEvento.ChaveDocumento;
  Result.TipoEvento := AEvento.TipoEvento;
  Result.NSeqEvento := AEvento.NseqEvento;
  Result.IdLote := 0;
  Result.DhEvento := 0;
  Result.Uf := '';
  Result.Cnpj := '';
  Result.COrgao := 0;
  Result.TpAutor := 0;
  Result.COrgaoAutor := 0;
  Result.Payload.DataPrevisaoEntrega := 0;
  SetLength(Result.Payload.Itens, 0);

  Result := FEnvelopeResolver.Resolver(Result);
end;

function ConsultarSituacaoEventoDFeUseCase.Executar(
  const AEventoDFeId: string): TEventoDFeResultadoConsultarSituacao;
var
  LEvento: EventoDFeEtd;
  LAberto: TEventoDFeTransmissaoEtd;
  LUltima: TEventoDFeTransmissaoEtd;
  LConsulta: TEventoDFeResultadoConsulta;
  LRequisicao: TEventoDFeRequisicaoPreparo;
  LTransmissao: TEventoDFeResultadoTransmissao;
  LDecisao: TDecisaoConsultaEventoDFe;
  LConcluivel: Boolean;
  LNovoStatus: TStatusEventoDFe;
begin
  LEvento := FEventosRepo.ObterPorId(AEventoDFeId, FSession.EmpresaId);

  if LEvento = nil then
    raise EValidacaoNegocio.Create('Evento DF-e não encontrado.');

  try
    if LEvento.Ativo <> saAtivo then
      raise EValidacaoNegocio.Create(
        'O evento está na lixeira; restaure-o antes de consultar a situação.');

    if not TipoEventoDFeSuportado(TipoEventoDFeCodigo(LEvento.TipoEvento)) then
      raise EValidacaoNegocio.Create(
        'Tipo de evento DF-e não suportado para consulta de situação.');

    LConcluivel := LEvento.Status in [seEnviando, seRejeitado];
    LAberto := nil;
    LUltima := nil;

    try
      if LConcluivel then
      begin
        LAberto := FTransmissaoRepo.ObterAbertaPorEvento(LEvento.Id);

        if (LAberto = nil) and (LEvento.Status = seEnviando) then
          raise EValidacaoNegocio.Create(Format(
            'O evento não possui transmissão em andamento (situação %s). ' +
            'Recarregue o evento.', [StatusEventoDFeParaTexto(LEvento.Status)]));
      end;

      if (LAberto = nil) and (LEvento.Status = seRejeitado) then
        LUltima := FTransmissaoRepo.ObterUltimaPorEvento(LEvento.Id);

      LRequisicao := MontarRequisicao(LEvento);

      LConsulta := FGateway.ConsultarSituacao(LRequisicao.Uf,
        LEvento.ChaveDocumento, LEvento.TipoEvento, LEvento.NseqEvento);

      LDecisao := DecidirConsultaEventoDFe(LConsulta, LEvento.NseqEvento,
        LEvento.Status, LAberto <> nil, (LAberto <> nil) or (LUltima <> nil));

      if LDecisao = dcSemResposta then
        raise EValidacaoNegocio.Create(
          'Não foi possível confirmar a situação do evento na SEFAZ. Tente novamente mais tarde.');

      if LDecisao = dcEventoSemTentativa then
        raise EValidacaoNegocio.Create(
          'A SEFAZ já possui este evento, mas não há transmissão registrada por este sistema. ' +
          'Confira a chave e a sequência.');

      Result.Decisao := LDecisao;
      Result.StatusEvento := LEvento.Status;
      Result.CStatEvento := LConsulta.CStatEvento;
      Result.XMotivo := LConsulta.XMotivoEvento;
      Result.NProt := LConsulta.NProt;
      Result.DhRegEvento := LConsulta.DhRegEvento;

      if LDecisao = dcNfeNaoApta then
      begin
        Result.CStatEvento := 0;
        Result.XMotivo := Format('%d %s',
          [LConsulta.CStatNFe, LConsulta.XMotivoNFe]);
        Result.NProt := '';
        Result.DhRegEvento := 0;
      end;

      if (LDecisao = dcEventoAutorizado) and (LEvento.Status = seRejeitado) and
        (LAberto = nil) then
      begin
        LTransmissao := ResultadoDeAutorizacaoPorConsulta(LConsulta);
        ConcluirEventoRejeitadoPelaConsultaEventoDFe(FConnection, FEventosRepo,
          FTransmissaoRepo, LEvento.Id, LUltima, LTransmissao);
        Result.StatusEvento := seAutorizado;
        Exit;
      end;

      if (not LConcluivel) or (LAberto = nil) or
        (LDecisao = dcEventoEmProcessamento) then
        Exit;

      case LDecisao of
        dcEventoAutorizado:
          begin
            LTransmissao := ResultadoDeAutorizacaoPorConsulta(LConsulta);
            LNovoStatus := seAutorizado;
          end;
        dcNfeNaoApta:
          begin
            LTransmissao := ResultadoDeRejeicaoPorNfe(LConsulta);
            LNovoStatus := seRejeitado;
          end;
        dcColisao:
          begin
            LTransmissao := ResultadoDeColisao(LConsulta);
            LNovoStatus := seRejeitado;
          end;
        dcNaoRegistrado:
          begin
            LTransmissao := ResultadoEventoNaoRegistrado;
            LNovoStatus := sePendente;
          end;
      else
        Exit;
      end;

      ConcluirTentativaEventoDFe(FConnection, FEventosRepo, FTransmissaoRepo,
        LEvento.Id, LAberto, LTransmissao, LNovoStatus, True);
      Result.StatusEvento := LNovoStatus;
    finally
      LUltima.Free;
      LAberto.Free;
    end;
  finally
    LEvento.Free;
  end;
end;

end.
