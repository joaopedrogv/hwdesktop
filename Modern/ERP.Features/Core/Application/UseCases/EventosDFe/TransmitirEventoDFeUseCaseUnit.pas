unit TransmitirEventoDFeUseCaseUnit;

interface

uses
  IDataBaseConnectionUnit,
  ISessionContextUnit,
  IEventosDFeRepositoryUnit,
  IEventoDFe112150RepositoryUnit,
  IEventoDFe211130RepositoryUnit,
  IEventoDFeFiscalGatewayUnit,
  IEventoDFeTransmissaoRepositoryUnit,
  EventoDFeEnvelopeResolverUnit,
  EventoDFeEtdUnit,
  EventoDFeTransmissaoEtdUnit,
  EventoDFeTransmissaoTypesUnit;

type
  TransmitirEventoDFeUseCase = class
  private
    FConnection: IDataBaseConnection;
    FSession: ISessionContext;
    FGateway: IEventoDFeFiscalGateway;
    FEventosRepo: IEventosDFeRepository;
    FRepo112150: IEventoDFe112150Repository;
    FRepo211130: IEventoDFe211130Repository;
    FTransmissaoRepo: IEventoDFeTransmissaoRepository;
    FEnvelopeResolver: IEventoDFeEnvelopeResolver;
    function MontarRequisicao(const AEvento: EventoDFeEtd):
      TEventoDFeRequisicaoPreparo;
    procedure Concluir(const AEvento: EventoDFeEtd;
      const ATentativa: TEventoDFeTransmissaoEtd;
      const AResultado: TEventoDFeResultadoTransmissao);
  public
    constructor Create(const AConnection: IDataBaseConnection;
      const ASession: ISessionContext;
      const AGateway: IEventoDFeFiscalGateway;
      const AEventosRepository: IEventosDFeRepository;
      const AEvento112150Repository: IEventoDFe112150Repository;
      const AEvento211130Repository: IEventoDFe211130Repository;
      const ATransmissaoRepository: IEventoDFeTransmissaoRepository;
      const AEnvelopeResolver: IEventoDFeEnvelopeResolver);
    function Executar(const AEventoDFeId: string):
      TEventoDFeResultadoTransmissao;
  end;

implementation

uses
  SysUtils,
  ITransactionUnit,
  EValidacaoNegocioUnit,
  EventoDFeStatusUnit,
  StatusRegistroEnumUnit,
  TipoEventoDFeUnit,
  EventoDFe211130ItemEtdUnit,
  EventoDFeDuplicidadeValidatorUnit,
  EventoDFeConsultaDecisaoUnit,
  EventoDFeConclusaoTentativaUnit;

{ TransmitirEventoDFeUseCase }

constructor TransmitirEventoDFeUseCase.Create(const AConnection: IDataBaseConnection;
  const ASession: ISessionContext; const AGateway: IEventoDFeFiscalGateway;
  const AEventosRepository: IEventosDFeRepository;
  const AEvento112150Repository: IEventoDFe112150Repository;
  const AEvento211130Repository: IEventoDFe211130Repository;
  const ATransmissaoRepository: IEventoDFeTransmissaoRepository;
  const AEnvelopeResolver: IEventoDFeEnvelopeResolver);
begin
  FConnection := AConnection;
  FSession := ASession;
  FGateway := AGateway;
  FEventosRepo := AEventosRepository;
  FRepo112150 := AEvento112150Repository;
  FRepo211130 := AEvento211130Repository;
  FTransmissaoRepo := ATransmissaoRepository;
  FEnvelopeResolver := AEnvelopeResolver;
end;

function TransmitirEventoDFeUseCase.MontarRequisicao(
  const AEvento: EventoDFeEtd): TEventoDFeRequisicaoPreparo;
var
  LDataPrevisao: TDate;
  LItens: EventoDFe211130ItemEtdArray;
  Indice: Integer;
begin
  Result.CodEmpresa := AEvento.CodEmpresa;
  Result.ChaveDocumento := AEvento.ChaveDocumento;
  Result.TipoEvento := AEvento.TipoEvento;
  Result.NSeqEvento := AEvento.NseqEvento;
  Result.IdLote := 0;
  Result.DhEvento := 0;
  Result.Payload.DataPrevisaoEntrega := 0;
  SetLength(Result.Payload.Itens, 0);

  case AEvento.TipoEvento of
    teAtualizacaoPrevisaoEntrega:
      begin
        if not FRepo112150.ObterDataPrevisao(AEvento.Id, LDataPrevisao) then
          raise EValidacaoNegocio.Create('Dados do evento 112150 não encontrados.');

        Result.Payload.DataPrevisaoEntrega := LDataPrevisao;
      end;
    teImobilizacaoItem:
      begin
        LItens := FRepo211130.ObterItens(AEvento.Id);

        if Length(LItens) = 0 then
          raise EValidacaoNegocio.Create('Itens do evento 211130 não encontrados.');

        SetLength(Result.Payload.Itens, Length(LItens));

        for Indice := 0 to High(LItens) do
        begin
          Result.Payload.Itens[Indice].NItem := LItens[Indice].NItem;
          Result.Payload.Itens[Indice].VIBS := LItens[Indice].VIbs;
          Result.Payload.Itens[Indice].VCBS := LItens[Indice].VCbs;
          Result.Payload.Itens[Indice].QImobilizado := LItens[Indice].QImobilizado;
          Result.Payload.Itens[Indice].UImobilizado := LItens[Indice].UImobilizado;
        end;
      end;
  end;

  Result := FEnvelopeResolver.Resolver(Result);
end;

procedure TransmitirEventoDFeUseCase.Concluir(const AEvento: EventoDFeEtd;
  const ATentativa: TEventoDFeTransmissaoEtd;
  const AResultado: TEventoDFeResultadoTransmissao);
var
  LNovoStatus: TStatusEventoDFe;
begin
  if AResultado.Classe = crSemResposta then
  begin
    ConcluirTentativaEventoDFe(FConnection, FEventosRepo, FTransmissaoRepo,
      AEvento.Id, ATentativa, AResultado, seEnviando, False);
    Exit;
  end;

  if AResultado.Classe = crAutorizado then
    LNovoStatus := seAutorizado
  else
    LNovoStatus := seRejeitado;

  ConcluirTentativaEventoDFe(FConnection, FEventosRepo, FTransmissaoRepo,
    AEvento.Id, ATentativa, AResultado, LNovoStatus, True);
end;

function TransmitirEventoDFeUseCase.Executar(const AEventoDFeId: string):
  TEventoDFeResultadoTransmissao;
var
  LEvento: EventoDFeEtd;
  LAberto: TEventoDFeTransmissaoEtd;
  LUltima: TEventoDFeTransmissaoEtd;
  LTentativa: TEventoDFeTransmissaoEtd;
  LConsulta: TEventoDFeResultadoConsulta;
  LPreparacao: TEventoDFePreparacao;
  LRequisicao: TEventoDFeRequisicaoPreparo;
  LTransacao: ITransaction;
  LNseqEvento: Integer;
  LIdLote: Int64;
  LDecisao: TDecisaoConsultaEventoDFe;
begin
  LEvento := FEventosRepo.ObterPorId(AEventoDFeId, FSession.EmpresaId);

  if LEvento = nil then
    raise EValidacaoNegocio.Create('Evento DF-e não encontrado.');

  try
    if LEvento.Status = seAutorizado then
      raise EValidacaoNegocio.Create(
        'O evento não permite transmissão no estado atual.');

    if LEvento.Ativo <> saAtivo then
      raise EValidacaoNegocio.Create(
        'O evento está na lixeira; restaure-o antes de transmitir.');

    LRequisicao := MontarRequisicao(LEvento);

    LConsulta := FGateway.ConsultarSituacao(LRequisicao.Uf,
      LEvento.ChaveDocumento, LEvento.TipoEvento, LEvento.NseqEvento);

    LAberto := FTransmissaoRepo.ObterAbertaPorEvento(LEvento.Id);
    LUltima := nil;
    if LAberto = nil then
      LUltima := FTransmissaoRepo.ObterUltimaPorEvento(LEvento.Id);
    try
      LDecisao := DecidirConsultaEventoDFe(LConsulta, LEvento.NseqEvento,
        LEvento.Status, LAberto <> nil, (LAberto <> nil) or (LUltima <> nil));

      case LDecisao of
        dcSemResposta:
          raise EValidacaoNegocio.Create(
            'Não foi possível confirmar a situação do evento na SEFAZ. Tente novamente mais tarde.');

        dcEventoEmProcessamento:
          raise EValidacaoNegocio.Create(Format(
            'O evento ainda está em processamento na SEFAZ (situação %d: %s). ' +
            'Consulte a situação antes de tentar novamente.',
            [LConsulta.CStatEvento, LConsulta.XMotivoEvento]));

        dcNfeNaoApta:
          begin
            if LAberto = nil then
              raise EValidacaoNegocio.Create(Format(
                'A NF-e não permite evento: %d %s.',
                [LConsulta.CStatNFe, LConsulta.XMotivoNFe]));

            Result := ResultadoDeRejeicaoPorNfe(LConsulta);
            Concluir(LEvento, LAberto, Result);
            Exit;
          end;

        dcEventoSemTentativa:
          raise EValidacaoNegocio.Create(Format(
            'A SEFAZ já possui um evento para esta chave e tipo (sequência %d, situação %d: %s), ' +
            'mas não há tentativa local aberta. Confira o registro antes de transmitir.',
            [LConsulta.NSeqEventoEncontrado, LConsulta.CStatEvento,
             LConsulta.XMotivoEvento]));

        dcEventoAutorizado:
          begin
            Result := ResultadoDeAutorizacaoPorConsulta(LConsulta);

            if LAberto = nil then
              ConcluirEventoRejeitadoPelaConsultaEventoDFe(FConnection,
                FEventosRepo, FTransmissaoRepo, LEvento.Id, LUltima, Result)
            else
              Concluir(LEvento, LAberto, Result);

            Exit;
          end;

        dcColisao:
          begin
            if LAberto = nil then
              raise EValidacaoNegocio.Create(Format(
                'A SEFAZ já possui outro evento para esta chave e tipo (sequência %d, situação %d: %s), ' +
                'sem tentativa local aberta. Confira o registro antes de transmitir.',
                [LConsulta.NSeqEventoEncontrado, LConsulta.CStatEvento,
                 LConsulta.XMotivoEvento]));

            Result := ResultadoDeColisao(LConsulta);
            Concluir(LEvento, LAberto, Result);
            Exit;
          end;

        // Evento não registrado: segue para a transmissão.
        dcNaoRegistrado:
          ;
      end;
    finally
      LUltima.Free;
      LAberto.Free;
    end;

    LTransacao := FConnection.BeginTransaction();
    try
      try
        ValidarDuplicidadeEventoDFe(FEventosRepo, LEvento.CodEmpresa,
          LEvento.ChaveDocumento, LEvento.TipoEvento, LEvento.Id);

        LNseqEvento := FEventosRepo.GarantirNseqEvento(LEvento.Id,
          LEvento.CodEmpresa, LEvento.ChaveDocumento, LEvento.TipoEvento);
        LIdLote := FTransmissaoRepo.ProximoIdLote;
        FTransmissaoRepo.FecharTentativaAberta(LEvento.Id);

        LTransacao.Commit();
      except
        LTransacao.Rollback();
        raise;
      end;
    finally
      LTransacao.FreeTransaction();
    end;

    LRequisicao.NSeqEvento := LNseqEvento;
    LRequisicao.IdLote := LIdLote;
    LRequisicao.DhEvento := Now;

    LPreparacao := FGateway.Preparar(LRequisicao);

    if Trim(LPreparacao.ErroPreparacao) <> '' then
      raise EValidacaoNegocio.Create(LPreparacao.ErroPreparacao);

    if LPreparacao.Preparado = nil then
      raise Exception.Create('Não foi possível preparar o evento fiscal.');

    LTentativa := TEventoDFeTransmissaoEtd.Novo(LEvento.Id, LIdLote,
      LRequisicao.DhEvento);
    try
      LTentativa.XmlEnvio := LPreparacao.XmlEnvio;

      LTransacao := FConnection.BeginTransaction();
      try
        try
          FTransmissaoRepo.RegistrarTentativa(LTentativa);

          if FEventosRepo.RegistrarEnvio(LEvento.Id, LPreparacao.Ambiente,
            LRequisicao.Cnpj, LRequisicao.COrgao, LRequisicao.TpAutor,
            LRequisicao.COrgaoAutor) <> 1 then
            raise EValidacaoNegocio.Create(
              'O evento foi alterado por outra sessão e não pode ser transmitido. Recarregue o evento.');

          LTransacao.Commit();
        except
          LTransacao.Rollback();
          raise;
        end;
      finally
        LTransacao.FreeTransaction();
      end;

      Result := FGateway.Transmitir(LPreparacao.Preparado);
      Concluir(LEvento, LTentativa, Result);
    finally
      LTentativa.Free;
      LPreparacao.Preparado := nil;
    end;
  finally
    LEvento.Free;
  end;
end;

end.
