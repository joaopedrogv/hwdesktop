unit EventoDFeConclusaoTentativaUnit;

interface

uses
  IDataBaseConnectionUnit,
  IEventosDFeRepositoryUnit,
  IEventoDFeTransmissaoRepositoryUnit,
  EventoDFeTransmissaoEtdUnit,
  EventoDFeTransmissaoTypesUnit,
  EventoDFeStatusUnit;

procedure ConcluirTentativaEventoDFe(const AConnection: IDataBaseConnection;
  const AEventosRepository: IEventosDFeRepository;
  const ATransmissaoRepository: IEventoDFeTransmissaoRepository;
  const AEventoId: string; const ATentativa: TEventoDFeTransmissaoEtd;
  const AResultado: TEventoDFeResultadoTransmissao;
  const ANovoStatus: TStatusEventoDFe; const AConcluirEvento: Boolean);
procedure ConcluirEventoRejeitadoPelaConsultaEventoDFe(
  const AConnection: IDataBaseConnection;
  const AEventosRepository: IEventosDFeRepository;
  const ATransmissaoRepository: IEventoDFeTransmissaoRepository;
  const AEventoId: string; const ATentativa: TEventoDFeTransmissaoEtd;
  const AResultado: TEventoDFeResultadoTransmissao);

implementation

uses
  SysUtils,
  ITransactionUnit,
  EValidacaoNegocioUnit;

const
  TAMANHO_MAXIMO_XMOTIVO = 255;
  MSG_TENTATIVA_ALTERADA = 'O evento já foi concluído por outra sessão. Recarregue o evento.';
  MSG_ESTADO_ALTERADO = 'O estado do evento foi alterado por outra sessão. Recarregue o evento.';

procedure ConcluirTentativaEventoDFe(const AConnection: IDataBaseConnection;
  const AEventosRepository: IEventosDFeRepository;
  const ATransmissaoRepository: IEventoDFeTransmissaoRepository;
  const AEventoId: string; const ATentativa: TEventoDFeTransmissaoEtd;
  const AResultado: TEventoDFeResultadoTransmissao;
  const ANovoStatus: TStatusEventoDFe; const AConcluirEvento: Boolean);
var
  LTransacao: ITransaction;
  LMotivo: string;
begin
  ATentativa.CStatLote := AResultado.CStatLote;
  ATentativa.CStatEvento := AResultado.CStatEvento;
  ATentativa.OrigemResultado := AResultado.OrigemResultado;
  ATentativa.XmlRetorno := AResultado.XmlRetorno;
  ATentativa.XmlProcEvento := AResultado.XmlProcEvento;

  LTransacao := AConnection.BeginTransaction();
  try
    try
      if ATransmissaoRepository.SalvarResposta(ATentativa,
        AConcluirEvento) <> 1 then
        raise EValidacaoNegocio.Create(MSG_TENTATIVA_ALTERADA);

      if AConcluirEvento then
      begin
        // XMOTIVO é VARCHAR(255); o motivo devolvido ao chamador permanece integral.
        LMotivo := Copy(AResultado.XMotivo, 1, TAMANHO_MAXIMO_XMOTIVO);

        if AEventosRepository.ConcluirEvento(AEventoId, seEnviando,
          ANovoStatus, LMotivo, AResultado.NProt,
          AResultado.DhRegEvento) <> 1 then
          raise EValidacaoNegocio.Create(MSG_ESTADO_ALTERADO);
      end;

      LTransacao.Commit();
    except
      LTransacao.Rollback();
      raise;
    end;
  finally
    LTransacao.FreeTransaction();
  end;
end;

procedure ConcluirEventoRejeitadoPelaConsultaEventoDFe(
  const AConnection: IDataBaseConnection;
  const AEventosRepository: IEventosDFeRepository;
  const ATransmissaoRepository: IEventoDFeTransmissaoRepository;
  const AEventoId: string; const ATentativa: TEventoDFeTransmissaoEtd;
  const AResultado: TEventoDFeResultadoTransmissao);
var
  LTransacao: ITransaction;
  LMotivo: string;
begin
  ATentativa.CStatEvento := AResultado.CStatEvento;
  ATentativa.OrigemResultado := AResultado.OrigemResultado;
  ATentativa.XmlProcEvento := AResultado.XmlProcEvento;

  LTransacao := AConnection.BeginTransaction();
  try
    try
      if ATransmissaoRepository.RegistrarEvidenciaConsulta(ATentativa) <> 1 then
        raise EValidacaoNegocio.Create(MSG_TENTATIVA_ALTERADA);

      LMotivo := Copy(AResultado.XMotivo, 1, TAMANHO_MAXIMO_XMOTIVO);

      if AEventosRepository.ConcluirEvento(AEventoId, seRejeitado, seAutorizado,
        LMotivo, AResultado.NProt, AResultado.DhRegEvento) <> 1 then
        raise EValidacaoNegocio.Create(MSG_ESTADO_ALTERADO);

      LTransacao.Commit();
    except
      LTransacao.Rollback();
      raise;
    end;
  finally
    LTransacao.FreeTransaction();
  end;
end;

end.
