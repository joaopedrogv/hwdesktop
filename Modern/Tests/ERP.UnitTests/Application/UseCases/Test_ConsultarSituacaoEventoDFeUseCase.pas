unit Test_ConsultarSituacaoEventoDFeUseCase;

interface

uses
  DUnitX.TestFramework,
  ISessionContextUnit,
  StatusRegistroEnumUnit,
  EventoDFeStatusUnit,
  EventoDFeEtdUnit,
  EventoDFeTransmissaoEtdUnit,
  EventoDFeTransmissaoTypesUnit,
  TipoEventoDFeUnit,
  EventoDFeEnvelopeResolverUnit,
  EventoDFeConsultaDecisaoUnit,
  ConsultarSituacaoEventoDFeUseCaseUnit,
  FakeTransactionUnit,
  FakeDatabaseConnectionUnit,
  FakeEventoDFeFiscalGatewayUnit,
  StubSessionContextUnit,
  StubEventosDFeRepositoryUnit,
  StubEventoDFeTransmissaoRepositoryUnit,
  StubEmpresasRepositoryUnit;

type
  [TestFixture]
  TTestConsultarSituacaoEventoDFeUseCase = class
  private
    FTransactionState: TTransactionSpyState;
    FConnection: TFakeDatabaseConnection;
    FSession: ISessionContext;
    FEmpresasRepo: TEmpresasRepositoryStub;
    FEventosRepo: TEventosDFeRepositoryStub;
    FTransmissaoRepo: TEventoDFeTransmissaoRepositoryStub;
    FGateway: TEventoDFeFiscalGatewayFake;
    FResolver: IEventoDFeEnvelopeResolver;
    FUseCase: ConsultarSituacaoEventoDFeUseCase;
    procedure SemearEvento(const AStatus: TStatusEventoDFe; ANseqEvento: Integer);
    function StatusArmazenado(const AId: string): TStatusEventoDFe;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveConcluirAutorizadoPelaConsulta;

    [Test]
    procedure DeveConcluirRejeitadoQuandoEventoDivergirDaTransmissao;

    [Test]
    procedure DeveRetornarPendenteQuandoEventoNaoRegistrado;

    [Test]
    procedure NaoDeveConcluirQuandoConsultaNaoResponde;

    [Test]
    procedure NaoDeveAutoautorizarQuandoEventoExisteSemTentativa;

    [Test]
    procedure NaoDeveConsultarQuandoEnviandoSemTentativa;

    [Test]
    procedure DeveManterEnviandoQuandoEventoEmProcessamento;

    [Test]
    procedure DeveAbortarConclusaoQuandoTentativaJaConcluida;

    [Test]
    procedure DeveAbortarConclusaoQuandoEstadoEsperadoDivergiu;

    [Test]
    procedure DeveConcluirAutorizadoPelaConsultaAposRejeicao;

    [Test]
    procedure NaoDeveAutoautorizarRejeitadoSemTentativaLocal;

    [Test]
    procedure NaoDeveAlterarRejeitadoQuandoEventoNaoAutorizado;

    [Test]
    procedure NaoDeveAlterarRejeitadoQuandoEventoEncontradoDivergir;

    [Test]
    procedure DeveAbortarAutorizacaoPorConsultaQuandoEvidenciaFalhar;

    [Test]
    procedure DeveAbortarAutorizacaoPorConsultaQuandoEstadoEsperadoDivergiu;
  end;

implementation

uses
  SysUtils,
  EValidacaoNegocioUnit,
  EmpresaEtdUnit;

const
  EMPRESA_ID = 3;
  ID_EVENTO = 'EVENTO-1';
  CHAVE_DOCUMENTO = '11111111111111111111111111111111111111111111';
  CNPJ_FORMATADO = '11.222.333/0001-81';
  IBGE_SAO_PAULO = 3550308;
  XML_ENVIO = '<evento>XML</evento>';
  SERVICO_INDISPONIVEL = 'Servico indisponivel';
  MOTIVO_EVENTO_DUPLICADO = 'Rejeicao: evento duplicado';
  MOTIVO_EM_PROCESSAMENTO = 'Lote de evento em processamento';

function CriarEmpresaValida: EmpresaEtd;
begin
  Result := EmpresaEtd.Create(EMPRESA_ID, CNPJ_FORMATADO, 'Empresa de teste',
    'Teste', '', '', '', '', '', '', '', '', 'Sao Paulo', 'SP',
    IBGE_SAO_PAULO, '', '');
end;

function ConsultaSemResposta: TEventoDFeResultadoConsulta;
begin
  Result.Respondeu := False;
  Result.CStatNFe := 0;
  Result.XMotivoNFe := SERVICO_INDISPONIVEL;
  Result.EventoEncontrado := False;
  Result.NSeqEventoEncontrado := 0;
  Result.CStatEvento := 0;
  Result.XMotivoEvento := '';
  Result.NProt := '';
  Result.DhRegEvento := 0;
  Result.XmlProcEvento := '';
  Result.ErroTransporte := SERVICO_INDISPONIVEL;
end;

function ConsultaNfeAptaSemEvento: TEventoDFeResultadoConsulta;
begin
  Result.Respondeu := True;
  Result.CStatNFe := 100;
  Result.XMotivoNFe := 'Autorizado o uso da NF-e';
  Result.EventoEncontrado := False;
  Result.NSeqEventoEncontrado := 0;
  Result.CStatEvento := 0;
  Result.XMotivoEvento := '';
  Result.NProt := '';
  Result.DhRegEvento := 0;
  Result.XmlProcEvento := '';
  Result.ErroTransporte := '';
end;

function ConsultaEventoAutorizado(ANSeqEvento: Integer):
  TEventoDFeResultadoConsulta;
begin
  Result := ConsultaNfeAptaSemEvento;
  Result.EventoEncontrado := True;
  Result.NSeqEventoEncontrado := ANSeqEvento;
  Result.CStatEvento := 135;
  Result.XMotivoEvento := 'Evento registrado e vinculado a NF-e';
  Result.NProt := '135260000000001';
  Result.DhRegEvento := EncodeDate(2026, 11, 20);
  Result.XmlProcEvento := '<procEventoNFe/>';
end;

function ConsultaEventoRejeitado(ANSeqEvento, ACStatEvento: Integer):
  TEventoDFeResultadoConsulta;
begin
  Result := ConsultaNfeAptaSemEvento;
  Result.EventoEncontrado := True;
  Result.NSeqEventoEncontrado := ANSeqEvento;
  Result.CStatEvento := ACStatEvento;
  Result.XMotivoEvento := MOTIVO_EVENTO_DUPLICADO;
end;

function ConsultaEventoEmProcessamento(ANSeqEvento: Integer):
  TEventoDFeResultadoConsulta;
begin
  Result := ConsultaNfeAptaSemEvento;
  Result.EventoEncontrado := True;
  Result.NSeqEventoEncontrado := ANSeqEvento;
  Result.CStatEvento := 128;
  Result.XMotivoEvento := MOTIVO_EM_PROCESSAMENTO;
end;

{ TTestConsultarSituacaoEventoDFeUseCase }

procedure TTestConsultarSituacaoEventoDFeUseCase.Setup;
var
  LEmpresa: EmpresaEtd;
begin
  FTransactionState := TTransactionSpyState.Create;
  FConnection := TFakeDatabaseConnection.Create(FTransactionState);
  FSession := TSessionContextStub.Create(EMPRESA_ID);

  FEmpresasRepo := TEmpresasRepositoryStub.Create;
  LEmpresa := CriarEmpresaValida;
  try
    FEmpresasRepo.Adicionar(LEmpresa);
  finally
    LEmpresa.Free;
  end;

  FEventosRepo := TEventosDFeRepositoryStub.Create;
  FTransmissaoRepo := TEventoDFeTransmissaoRepositoryStub.Create(
    FTransactionState);
  FGateway := TEventoDFeFiscalGatewayFake.Create(FTransactionState);
  FResolver := EventoDFeEnvelopeResolver.Create(FEmpresasRepo);

  FUseCase := ConsultarSituacaoEventoDFeUseCase.Create(FConnection, FSession,
    FGateway, FEventosRepo, FTransmissaoRepo, FResolver);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.TearDown;
begin
  FUseCase.Free;
  FGateway := nil;
  FTransmissaoRepo := nil;
  FResolver := nil;
  FSession := nil;
  FEventosRepo.Free;
  FEmpresasRepo.Free;
  FConnection.Free;
  FTransactionState.Free;
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.SemearEvento(
  const AStatus: TStatusEventoDFe; ANseqEvento: Integer);
var
  LHeader: EventoDFeEtd;
begin
  LHeader := EventoDFeEtd.Create(ID_EVENTO, 1, fdNFe,
    teAtualizacaoPrevisaoEntrega, CHAVE_DOCUMENTO, EMPRESA_ID, saAtivo, 0, 0);
  try
    FEventosRepo.AdicionarEventoExistente(LHeader, AStatus, ANseqEvento);
  finally
    LHeader.Free;
  end;
end;

function TTestConsultarSituacaoEventoDFeUseCase.StatusArmazenado(
  const AId: string): TStatusEventoDFe;
var
  LEvento: EventoDFeEtd;
begin
  Result := sePendente;
  LEvento := FEventosRepo.ObterPorId(AId, EMPRESA_ID);
  try
    if LEvento <> nil then
      Result := LEvento.Status;
  finally
    LEvento.Free;
  end;
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.DeveConcluirAutorizadoPelaConsulta;
var
  LResultado: TEventoDFeResultadoConsultarSituacao;
begin
  SemearEvento(seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaEventoAutorizado(1);

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Decisao = dcEventoAutorizado);
  Assert.IsTrue(LResultado.StatusEvento = seAutorizado);
  Assert.AreEqual('135260000000001', LResultado.NProt);
  Assert.AreEqual('SP', FGateway.UltimaConsultaUf);
  Assert.AreEqual(0, FGateway.TransacoesAbertasEmConsultar);
  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsFalse(FGateway.TransmitirChamado);
  Assert.IsTrue(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsTrue(FTransmissaoRepo.SalvarRespostaConcluir);
  Assert.IsTrue(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FEventosRepo.UltimoStatusEsperado = seEnviando);
  Assert.IsTrue(FEventosRepo.UltimoNovoStatus = seAutorizado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seAutorizado);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.DeveConcluirRejeitadoQuandoEventoDivergirDaTransmissao;
var
  LResultado: TEventoDFeResultadoConsultarSituacao;
begin
  SemearEvento(seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaEventoRejeitado(1, 573);

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Decisao = dcColisao);
  Assert.IsTrue(LResultado.StatusEvento = seRejeitado);
  Assert.AreEqual(573, LResultado.CStatEvento);
  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsFalse(FGateway.TransmitirChamado);
  Assert.IsTrue(FTransmissaoRepo.SalvarRespostaConcluir);
  Assert.IsTrue(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FEventosRepo.UltimoNovoStatus = seRejeitado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seRejeitado);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.DeveRetornarPendenteQuandoEventoNaoRegistrado;
var
  LResultado: TEventoDFeResultadoConsultarSituacao;
  LAberta: TEventoDFeTransmissaoEtd;
begin
  SemearEvento(seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaNfeAptaSemEvento;

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Decisao = dcNaoRegistrado);
  Assert.IsTrue(LResultado.StatusEvento = sePendente);
  Assert.IsTrue(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsTrue(FTransmissaoRepo.SalvarRespostaConcluir);
  Assert.IsTrue(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FEventosRepo.UltimoNovoStatus = sePendente);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = sePendente);

  LAberta := FTransmissaoRepo.ObterAbertaPorEvento(ID_EVENTO);
  try
    Assert.IsTrue(LAberta = nil);
  finally
    LAberta.Free;
  end;
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.NaoDeveConcluirQuandoConsultaNaoResponde;
begin
  SemearEvento(seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaSemResposta;

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seEnviando);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.NaoDeveAutoautorizarQuandoEventoExisteSemTentativa;
begin
  SemearEvento(sePendente, 1);
  FGateway.Consulta := ConsultaEventoAutorizado(1);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = sePendente);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.NaoDeveConsultarQuandoEnviandoSemTentativa;
begin
  SemearEvento(seEnviando, 1);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FGateway.ConsultarChamado);
  Assert.IsFalse(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seEnviando);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.DeveManterEnviandoQuandoEventoEmProcessamento;
var
  LResultado: TEventoDFeResultadoConsultarSituacao;
begin
  SemearEvento(seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaEventoEmProcessamento(1);

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Decisao = dcEventoEmProcessamento);
  Assert.IsTrue(LResultado.StatusEvento = seEnviando);
  Assert.AreEqual(128, LResultado.CStatEvento);
  Assert.IsFalse(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seEnviando);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.DeveAbortarConclusaoQuandoTentativaJaConcluida;
begin
  SemearEvento(seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaEventoAutorizado(1);
  FTransmissaoRepo.SalvarRespostaLinhas := 0;

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.DeveAbortarConclusaoQuandoEstadoEsperadoDivergiu;
begin
  SemearEvento(seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaEventoAutorizado(1);
  FEventosRepo.ConcluirEventoLinhas := 0;

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsTrue(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.DeveConcluirAutorizadoPelaConsultaAposRejeicao;
var
  LResultado: TEventoDFeResultadoConsultarSituacao;
  LTentativa: TEventoDFeTransmissaoEtd;
begin
  SemearEvento(seRejeitado, 1);
  FTransmissaoRepo.AdicionarTentativaConcluida(ID_EVENTO, XML_ENVIO,
    '<retEvento/>');
  FGateway.Consulta := ConsultaEventoAutorizado(1);

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Decisao = dcEventoAutorizado);
  Assert.IsTrue(LResultado.StatusEvento = seAutorizado);
  Assert.AreEqual('135260000000001', LResultado.NProt);
  Assert.AreEqual('SP', FGateway.UltimaConsultaUf);
  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsFalse(FGateway.TransmitirChamado);
  Assert.IsTrue(FTransmissaoRepo.RegistrarEvidenciaChamado);
  Assert.IsFalse(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsTrue(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FEventosRepo.UltimoStatusEsperado = seRejeitado);
  Assert.IsTrue(FEventosRepo.UltimoNovoStatus = seAutorizado);
  Assert.AreEqual('135260000000001', FEventosRepo.UltimoNProt);
  Assert.AreEqual('Evento registrado e vinculado a NF-e',
    FEventosRepo.UltimoMotivo);
  Assert.IsTrue(FEventosRepo.UltimoDhRegEvento > 0);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seAutorizado);
  Assert.IsTrue(FTransactionState.CommitCalled);

  LTentativa := FTransmissaoRepo.ObterUltimaPorEvento(ID_EVENTO);
  try
    Assert.AreEqual(135, LTentativa.CStatEvento);
    Assert.IsTrue(LTentativa.OrigemResultado = orFiscal);
    Assert.AreEqual('<procEventoNFe/>', LTentativa.XmlProcEvento);
    Assert.AreEqual(XML_ENVIO, LTentativa.XmlEnvio);
    Assert.AreEqual('<retEvento/>', LTentativa.XmlRetorno);
    Assert.IsTrue(LTentativa.Concluida);
  finally
    LTentativa.Free;
  end;
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.NaoDeveAutoautorizarRejeitadoSemTentativaLocal;
begin
  SemearEvento(seRejeitado, 1);
  FGateway.Consulta := ConsultaEventoAutorizado(1);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FTransmissaoRepo.RegistrarEvidenciaChamado);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seRejeitado);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.NaoDeveAlterarRejeitadoQuandoEventoNaoAutorizado;
var
  LResultado: TEventoDFeResultadoConsultarSituacao;
begin
  SemearEvento(seRejeitado, 1);
  FTransmissaoRepo.AdicionarTentativaConcluida(ID_EVENTO, XML_ENVIO,
    '<retEvento/>');
  FGateway.Consulta := ConsultaEventoRejeitado(1, 573);

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Decisao = dcColisao);
  Assert.IsTrue(LResultado.StatusEvento = seRejeitado);
  Assert.AreEqual(573, LResultado.CStatEvento);
  Assert.IsFalse(FTransmissaoRepo.RegistrarEvidenciaChamado);
  Assert.IsFalse(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seRejeitado);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.NaoDeveAlterarRejeitadoQuandoEventoEncontradoDivergir;
var
  LResultado: TEventoDFeResultadoConsultarSituacao;
begin
  SemearEvento(seRejeitado, 1);
  FTransmissaoRepo.AdicionarTentativaConcluida(ID_EVENTO, XML_ENVIO,
    '<retEvento/>');
  FGateway.Consulta := ConsultaEventoAutorizado(2);

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Decisao = dcColisao);
  Assert.IsTrue(LResultado.StatusEvento = seRejeitado);
  Assert.IsFalse(FTransmissaoRepo.RegistrarEvidenciaChamado);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seRejeitado);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.DeveAbortarAutorizacaoPorConsultaQuandoEvidenciaFalhar;
begin
  SemearEvento(seRejeitado, 1);
  FTransmissaoRepo.AdicionarTentativaConcluida(ID_EVENTO, XML_ENVIO,
    '<retEvento/>');
  FGateway.Consulta := ConsultaEventoAutorizado(1);
  FTransmissaoRepo.RegistrarEvidenciaLinhas := 0;

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsTrue(FTransmissaoRepo.RegistrarEvidenciaChamado);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seRejeitado);
end;

procedure TTestConsultarSituacaoEventoDFeUseCase.DeveAbortarAutorizacaoPorConsultaQuandoEstadoEsperadoDivergiu;
begin
  SemearEvento(seRejeitado, 1);
  FTransmissaoRepo.AdicionarTentativaConcluida(ID_EVENTO, XML_ENVIO,
    '<retEvento/>');
  FGateway.Consulta := ConsultaEventoAutorizado(1);
  FEventosRepo.ConcluirEventoLinhas := 0;

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsTrue(FTransmissaoRepo.RegistrarEvidenciaChamado);
  Assert.IsTrue(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seRejeitado);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestConsultarSituacaoEventoDFeUseCase);

end.
