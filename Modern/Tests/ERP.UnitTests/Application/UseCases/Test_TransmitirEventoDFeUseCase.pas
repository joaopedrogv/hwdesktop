unit Test_TransmitirEventoDFeUseCase;

interface

uses
  DUnitX.TestFramework,
  ISessionContextUnit,
  StatusRegistroEnumUnit,
  EventoDFeStatusUnit,
  EventoDFeEtdUnit,
  EventoDFe211130ItemEtdUnit,
  EventoDFeTransmissaoTypesUnit,
  EventoDFeTransmissaoEtdUnit,
  TipoEventoDFeUnit,
  EventoDFeEnvelopeResolverUnit,
  TransmitirEventoDFeUseCaseUnit,
  FakeTransactionUnit,
  FakeDatabaseConnectionUnit,
  FakeEventoDFeFiscalGatewayUnit,
  StubSessionContextUnit,
  StubEventosDFeRepositoryUnit,
  StubEventoDFe112150RepositoryUnit,
  StubEventoDFe211130RepositoryUnit,
  StubEventoDFeTransmissaoRepositoryUnit,
  StubEmpresasRepositoryUnit;

type
  [TestFixture]
  TTestTransmitirEventoDFeUseCase = class
  private
    FTransactionState: TTransactionSpyState;
    FConnection: TFakeDatabaseConnection;
    FSession: ISessionContext;
    FEmpresasRepo: TEmpresasRepositoryStub;
    FEventosRepo: TEventosDFeRepositoryStub;
    FRepo112150: TEventoDFe112150RepositoryStub;
    FRepo211130: TEventoDFe211130RepositoryStub;
    FTransmissaoRepo: TEventoDFeTransmissaoRepositoryStub;
    FGateway: TEventoDFeFiscalGatewayFake;
    FResolver: IEventoDFeEnvelopeResolver;
    FUseCase: TransmitirEventoDFeUseCase;
    procedure Semear112150(const AId: string; AStatus: TStatusEventoDFe;
      ANseqEvento: Integer);
    procedure Semear211130(const AId: string; AStatus: TStatusEventoDFe;
      ANseqEvento: Integer);
    function StatusArmazenado(const AId: string): TStatusEventoDFe;
    procedure PrepararCenario112150(const AStatus: TStatusEventoDFe;
      ANseqEvento: Integer);
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveRecusarTransmitirEventoAutorizado;

    [Test]
    procedure DeveConcluirAutorizadoPelaConsultaSemEnviar;

    [Test]
    procedure DeveConcluirAutorizadoPelaConsultaAposRejeicao;

    [Test]
    procedure DeveTransmitirQuandoNfeAptaESemEvento;

    [Test]
    procedure DeveGravarXmlEnvioAntesDeTransmitir;

    [Test]
    procedure DeveConsultarAntesDePrepararSempre;

    [Test]
    procedure DeveFecharTentativaAbertaAntesDaNovaTentativa;

    [Test]
    procedure NaoDeveEnviarQuandoConsultaNaoResponde;

    [Test]
    procedure NaoDeveEnviarQuandoNfeNaoApta;

    [Test]
    procedure DeveConcluirRejeitadoQuandoNfeNaoAptaComTentativaAberta;

    [Test]
    procedure NaoDeveAutoautorizarQuandoEventoExisteSemTentativa;

    [Test]
    procedure NaoDeveEnviarQuandoSequenciaDivergir;

    [Test]
    procedure NaoDeveCriarTentativaQuandoPreparacaoFalha;

    [Test]
    procedure NaoDeveCriarTentativaQuandoUfDaEmpresaNaoIdentificada;

    [Test]
    procedure NaoDeveConcluirQuandoOGatewayNaoResponde;

    [Test]
    procedure DeveAbortarConclusaoQuandoTentativaJaConcluida;

    [Test]
    procedure DeveAbortarConclusaoQuandoEstadoEsperadoDivergiu;

    [Test]
    procedure DeveTransmitirEvento211130ComPayloadCompleto;
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
  CNPJ_DIGITOS = '11222333000181';
  IBGE_SAO_PAULO = 3550308;
  XML_ENVIO = '<evento>XML</evento>';
  XML_ENVIO_211130 = '<evento>211130</evento>';
  SERVICO_INDISPONIVEL = 'Servico indisponivel';
  NAO_REGISTRADO = 'Evento nao registrado';
  MOTIVO_NFE_NAO_APTA = 'Cancelamento homologado';

function CriarEmpresaValida: EmpresaEtd;
begin
  Result := EmpresaEtd.Create(EMPRESA_ID, CNPJ_FORMATADO, 'Empresa de teste',
    'Teste', '', '', '', '', '', '', '', '', 'Sao Paulo', 'SP',
    IBGE_SAO_PAULO, '', '');
end;

function CriarEmpresaSemUf: EmpresaEtd;
begin
  Result := EmpresaEtd.Create(EMPRESA_ID, CNPJ_FORMATADO, 'Empresa de teste',
    'Teste', '', '', '', '', '', '', '', '', 'Sao Paulo', 'SP', 0, '', '');
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

function ConsultaNfeNaoApta: TEventoDFeResultadoConsulta;
begin
  Result.Respondeu := True;
  Result.CStatNFe := 101;
  Result.XMotivoNFe := MOTIVO_NFE_NAO_APTA;
  Result.EventoEncontrado := False;
  Result.NSeqEventoEncontrado := 0;
  Result.CStatEvento := 0;
  Result.XMotivoEvento := '';
  Result.NProt := '';
  Result.DhRegEvento := 0;
  Result.XmlProcEvento := '';
  Result.ErroTransporte := '';
end;

function ResultadoAutorizado: TEventoDFeResultadoTransmissao;
begin
  Result.Classe := crAutorizado;
  Result.OrigemResultado := orFiscal;
  Result.CStatLote := 128;
  Result.CStatEvento := 135;
  Result.XMotivo := 'Evento registrado e vinculado a NF-e';
  Result.NProt := '135260000000002';
  Result.DhRegEvento := EncodeDate(2026, 11, 22);
  Result.XmlRetorno := '<retEnvEvento/>';
  Result.XmlProcEvento := '<procEventoNFe/>';
  Result.ErroTransporte := '';
end;

function ResultadoRejeitado(ACStatEvento: Integer):
  TEventoDFeResultadoTransmissao;
begin
  Result.Classe := crRejeitado;
  Result.OrigemResultado := orFiscal;
  Result.CStatLote := 128;
  Result.CStatEvento := ACStatEvento;
  Result.XMotivo := 'Evento rejeitado';
  Result.NProt := '';
  Result.DhRegEvento := 0;
  Result.XmlRetorno := '<retEnvEvento/>';
  Result.XmlProcEvento := '';
  Result.ErroTransporte := '';
end;

function ResultadoSemResposta: TEventoDFeResultadoTransmissao;
begin
  Result.Classe := crSemResposta;
  Result.OrigemResultado := orNenhuma;
  Result.CStatLote := 108;
  Result.CStatEvento := 0;
  Result.XMotivo := 'Lote em processamento';
  Result.NProt := '';
  Result.DhRegEvento := 0;
  Result.XmlRetorno := '<retEnvEvento/>';
  Result.XmlProcEvento := '';
  Result.ErroTransporte := '';
end;

{ TTestTransmitirEventoDFeUseCase }

procedure TTestTransmitirEventoDFeUseCase.Setup;
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
  FRepo112150 := TEventoDFe112150RepositoryStub.Create;
  FRepo211130 := TEventoDFe211130RepositoryStub.Create;
  FTransmissaoRepo := TEventoDFeTransmissaoRepositoryStub.Create(
    FTransactionState);
  FGateway := TEventoDFeFiscalGatewayFake.Create(FTransactionState);
  FResolver := EventoDFeEnvelopeResolver.Create(FEmpresasRepo);

  FUseCase := TransmitirEventoDFeUseCase.Create(FConnection, FSession, FGateway,
    FEventosRepo, FRepo112150, FRepo211130, FTransmissaoRepo, FResolver);
end;

procedure TTestTransmitirEventoDFeUseCase.TearDown;
begin
  FUseCase.Free;
  FGateway := nil;
  FTransmissaoRepo := nil;
  FResolver := nil;
  FSession := nil;
  FRepo211130.Free;
  FRepo112150.Free;
  FEventosRepo.Free;
  FEmpresasRepo.Free;
  FConnection.Free;
  FTransactionState.Free;
end;

procedure TTestTransmitirEventoDFeUseCase.Semear112150(const AId: string;
  AStatus: TStatusEventoDFe; ANseqEvento: Integer);
var
  LHeader: EventoDFeEtd;
begin
  LHeader := EventoDFeEtd.Create(AId, 1, fdNFe,
    teAtualizacaoPrevisaoEntrega, CHAVE_DOCUMENTO, EMPRESA_ID, saAtivo, 0, 0);
  try
    FEventosRepo.AdicionarEventoExistente(LHeader, AStatus, ANseqEvento);
  finally
    LHeader.Free;
  end;

  FRepo112150.AdicionarDataPrevisao(AId, EncodeDate(2026, 12, 1));
end;

procedure TTestTransmitirEventoDFeUseCase.Semear211130(const AId: string;
  AStatus: TStatusEventoDFe; ANseqEvento: Integer);
var
  LHeader: EventoDFeEtd;
  LItens: EventoDFe211130ItemEtdArray;
begin
  LHeader := EventoDFeEtd.Create(AId, 1, fdNFe, teImobilizacaoItem,
    CHAVE_DOCUMENTO, EMPRESA_ID, saAtivo, 0, 0);
  try
    FEventosRepo.AdicionarEventoExistente(LHeader, AStatus, ANseqEvento);
  finally
    LHeader.Free;
  end;

  SetLength(LItens, 2);
  // Semeados fora de ordem para provar que o payload segue a ordem do repositorio.
  LItens[0] := EventoDFe211130ItemEtd.Create('ITEM-2', 2, 3.25, 1.10, 7.5, 'CX');
  LItens[1] := EventoDFe211130ItemEtd.Create('ITEM-1', 1, 5, 2.20, 10, 'UN');
  FRepo211130.AdicionarItens(AId, LItens);
end;

function TTestTransmitirEventoDFeUseCase.StatusArmazenado(
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

procedure TTestTransmitirEventoDFeUseCase.PrepararCenario112150(
  const AStatus: TStatusEventoDFe; ANseqEvento: Integer);
begin
  Semear112150(ID_EVENTO, AStatus, ANseqEvento);
  FGateway.Consulta := ConsultaNfeAptaSemEvento;
  FGateway.DefinirPreparacao(XML_ENVIO, 2);
  FGateway.Resultado := ResultadoAutorizado;
end;

procedure TTestTransmitirEventoDFeUseCase.DeveRecusarTransmitirEventoAutorizado;
begin
  Semear112150(ID_EVENTO, seAutorizado, 1);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FGateway.ConsultarChamado);
  Assert.IsFalse(FGateway.PrepararChamado);
end;

procedure TTestTransmitirEventoDFeUseCase.DeveConcluirAutorizadoPelaConsultaSemEnviar;
var
  LResultado: TEventoDFeResultadoTransmissao;
begin
  Semear112150(ID_EVENTO, seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaEventoAutorizado(1);

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Classe = crAutorizado);
  Assert.IsTrue(LResultado.OrigemResultado = orFiscal);
  Assert.AreEqual('135260000000001', LResultado.NProt);
  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsFalse(FGateway.TransmitirChamado);
  Assert.IsTrue(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsTrue(FTransmissaoRepo.SalvarRespostaConcluir);
  Assert.IsTrue(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FEventosRepo.UltimoStatusEsperado = seEnviando);
  Assert.IsTrue(FEventosRepo.UltimoNovoStatus = seAutorizado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seAutorizado);
  Assert.AreEqual(0, FGateway.TransacoesAbertasEmConsultar);
end;

procedure TTestTransmitirEventoDFeUseCase.DeveTransmitirQuandoNfeAptaESemEvento;
var
  LResultado: TEventoDFeResultadoTransmissao;
begin
  PrepararCenario112150(sePendente, 0);

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Classe = crAutorizado);
  Assert.IsTrue(FGateway.ConsultarChamado);
  Assert.IsTrue(FGateway.PrepararChamado);
  Assert.IsTrue(FGateway.TransmitirChamado);
  Assert.AreEqual(1, FGateway.UltimaRequisicao.NSeqEvento);
  Assert.IsTrue(FTransmissaoRepo.RegistrarTentativaChamado);
  Assert.IsTrue(FEventosRepo.RegistrarEnvioChamado);
  Assert.AreEqual(2, FEventosRepo.UltimoAmbienteRegistrado);
  Assert.AreEqual(CNPJ_DIGITOS, FEventosRepo.UltimoCnpjRegistrado);
  Assert.AreEqual(35, FEventosRepo.UltimoCOrgaoRegistrado);
  Assert.AreEqual(1, FEventosRepo.UltimoTpAutorRegistrado);
  Assert.AreEqual(35, FEventosRepo.UltimoCOrgaoAutorRegistrado);
  Assert.AreEqual(0, FGateway.TransacoesAbertasEmConsultar);
  Assert.AreEqual(0, FGateway.TransacoesAbertasEmPreparar);
  Assert.AreEqual(0, FGateway.TransacoesAbertasEmTransmitir);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seAutorizado);
end;

procedure TTestTransmitirEventoDFeUseCase.DeveGravarXmlEnvioAntesDeTransmitir;
var
  LIndiceTentativa: Integer;
  LIndiceCommitDaTentativa: Integer;
  LIndiceTransmissao: Integer;
begin
  PrepararCenario112150(sePendente, 0);

  FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(FTransmissaoRepo.RegistrarTentativaChamado);
  Assert.AreEqual(XML_ENVIO, FTransmissaoRepo.TentativaRegistrada.XmlEnvio);
  Assert.IsTrue(FTransmissaoRepo.TentativaRegistrada.Concluida);
  Assert.IsTrue(FTransmissaoRepo.TentativaRegistrada.OrigemResultado = orFiscal);

  LIndiceTentativa := FTransactionState.IndiceDe('RegistrarTentativa');
  LIndiceCommitDaTentativa := FTransactionState.IndiceDe('Commit', 1);
  LIndiceTransmissao := FTransactionState.IndiceDe('Transmitir');

  Assert.IsTrue(LIndiceTentativa >= 0, 'A tentativa deve ter sido registrada.');
  Assert.IsTrue(LIndiceCommitDaTentativa > LIndiceTentativa,
    'O commit da tentativa deve ocorrer depois do seu registro.');
  Assert.IsTrue(LIndiceTransmissao > LIndiceCommitDaTentativa,
    'O envio deve ocorrer depois do commit da tentativa.');
  Assert.AreEqual(3, FTransactionState.Ocorrencias('Commit'));
end;

procedure TTestTransmitirEventoDFeUseCase.DeveConsultarAntesDePrepararSempre;
begin
  PrepararCenario112150(sePendente, 0);

  FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(FGateway.ConsultarChamado);
  Assert.IsTrue(FGateway.PrepararChamado);
  Assert.IsTrue(FTransactionState.IndiceDe('Consultar') <
    FTransactionState.IndiceDe('Preparar'));
end;

procedure TTestTransmitirEventoDFeUseCase.DeveFecharTentativaAbertaAntesDaNovaTentativa;
begin
  Semear112150(ID_EVENTO, seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaNfeAptaSemEvento;
  FGateway.Resultado := ResultadoRejeitado(573);

  FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(FTransmissaoRepo.FecharTentativaChamado);
  Assert.IsTrue(FTransmissaoRepo.RegistrarTentativaChamado);
  Assert.IsTrue(FTransactionState.IndiceDe('FecharTentativaAberta') <
    FTransactionState.IndiceDe('RegistrarTentativa'));
end;

procedure TTestTransmitirEventoDFeUseCase.NaoDeveEnviarQuandoConsultaNaoResponde;
begin
  Semear112150(ID_EVENTO, seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaSemResposta;

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsFalse(FGateway.TransmitirChamado);
  Assert.IsFalse(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seEnviando);
end;

procedure TTestTransmitirEventoDFeUseCase.NaoDeveEnviarQuandoNfeNaoApta;
begin
  Semear112150(ID_EVENTO, sePendente, 0);
  FGateway.Consulta := ConsultaNfeNaoApta;

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsFalse(FGateway.TransmitirChamado);
  Assert.IsFalse(FTransmissaoRepo.RegistrarTentativaChamado);
end;

procedure TTestTransmitirEventoDFeUseCase.DeveConcluirRejeitadoQuandoNfeNaoAptaComTentativaAberta;
var
  LResultado: TEventoDFeResultadoTransmissao;
begin
  Semear112150(ID_EVENTO, seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaNfeNaoApta;

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Classe = crRejeitado);
  Assert.IsTrue(LResultado.OrigemResultado = orFiscal);
  Assert.AreEqual(0, LResultado.CStatEvento);
  Assert.IsTrue(Pos('101', LResultado.XMotivo) > 0);
  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsTrue(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FEventosRepo.UltimoNovoStatus = seRejeitado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seRejeitado);
end;

procedure TTestTransmitirEventoDFeUseCase.NaoDeveAutoautorizarQuandoEventoExisteSemTentativa;
begin
  Semear112150(ID_EVENTO, sePendente, 1);
  FGateway.Consulta := ConsultaEventoAutorizado(1);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsFalse(FGateway.TransmitirChamado);
  Assert.IsFalse(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = sePendente);
end;

procedure TTestTransmitirEventoDFeUseCase.NaoDeveEnviarQuandoSequenciaDivergir;
var
  LResultado: TEventoDFeResultadoTransmissao;
begin
  Semear112150(ID_EVENTO, seEnviando, 1);
  FTransmissaoRepo.AdicionarTentativaAberta(ID_EVENTO, XML_ENVIO);
  FGateway.Consulta := ConsultaEventoAutorizado(2);

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Classe = crRejeitado);
  Assert.AreEqual(135, LResultado.CStatEvento);
  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsFalse(FGateway.TransmitirChamado);
  Assert.IsTrue(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FEventosRepo.UltimoNovoStatus = seRejeitado);
end;

procedure TTestTransmitirEventoDFeUseCase.NaoDeveCriarTentativaQuandoPreparacaoFalha;
begin
  PrepararCenario112150(sePendente, 0);
  FGateway.DefinirErroPreparacao('Certificado digital invalido.');

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsTrue(FGateway.PrepararChamado);
  Assert.IsFalse(FGateway.TransmitirChamado);
  Assert.IsFalse(FTransmissaoRepo.RegistrarTentativaChamado);
  Assert.IsFalse(FEventosRepo.RegistrarEnvioChamado);
end;

procedure TTestTransmitirEventoDFeUseCase.NaoDeveCriarTentativaQuandoUfDaEmpresaNaoIdentificada;
var
  LEmpresasSemUf: TEmpresasRepositoryStub;
  LEmpresa: EmpresaEtd;
  LResolver: IEventoDFeEnvelopeResolver;
  LUseCase: TransmitirEventoDFeUseCase;
begin
  Semear112150(ID_EVENTO, sePendente, 0);
  FGateway.Consulta := ConsultaNfeAptaSemEvento;

  LEmpresasSemUf := TEmpresasRepositoryStub.Create;
  try
    LEmpresa := CriarEmpresaSemUf;
    try
      LEmpresasSemUf.Adicionar(LEmpresa);
    finally
      LEmpresa.Free;
    end;

    LResolver := EventoDFeEnvelopeResolver.Create(LEmpresasSemUf);
    LUseCase := TransmitirEventoDFeUseCase.Create(FConnection, FSession,
      FGateway, FEventosRepo, FRepo112150, FRepo211130, FTransmissaoRepo,
      LResolver);
    try
      Assert.WillRaise(
        procedure
        begin
          LUseCase.Executar(ID_EVENTO);
        end,
        Exception
      );
    finally
      LUseCase.Free;
      LResolver := nil;
    end;
  finally
    LEmpresasSemUf.Free;
  end;

  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsFalse(FTransmissaoRepo.RegistrarTentativaChamado);
end;

procedure TTestTransmitirEventoDFeUseCase.NaoDeveConcluirQuandoOGatewayNaoResponde;
var
  LResultado: TEventoDFeResultadoTransmissao;
begin
  PrepararCenario112150(sePendente, 0);
  FGateway.Resultado := ResultadoSemResposta;

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Classe = crSemResposta);
  Assert.IsTrue(FTransmissaoRepo.SalvarRespostaChamado);
  Assert.IsFalse(FTransmissaoRepo.SalvarRespostaConcluir);
  Assert.IsFalse(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seEnviando);
end;

procedure TTestTransmitirEventoDFeUseCase.DeveAbortarConclusaoQuandoTentativaJaConcluida;
begin
  PrepararCenario112150(sePendente, 0);
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

procedure TTestTransmitirEventoDFeUseCase.DeveAbortarConclusaoQuandoEstadoEsperadoDivergiu;
begin
  PrepararCenario112150(sePendente, 0);
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

procedure TTestTransmitirEventoDFeUseCase.DeveTransmitirEvento211130ComPayloadCompleto;
var
  LRequisicao: TEventoDFeRequisicaoPreparo;
  LResultado: TEventoDFeResultadoTransmissao;
begin
  Semear211130(ID_EVENTO, sePendente, 0);
  FGateway.Consulta := ConsultaNfeAptaSemEvento;
  FGateway.DefinirPreparacao(XML_ENVIO_211130, 2);
  FGateway.Resultado := ResultadoAutorizado;

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Classe = crAutorizado);
  Assert.IsTrue(FGateway.ConsultarChamado);
  Assert.IsTrue(FGateway.PrepararChamado);
  Assert.IsTrue(FGateway.TransmitirChamado);
  Assert.IsTrue(FEventosRepo.RegistrarEnvioChamado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seAutorizado);
  Assert.AreEqual(XML_ENVIO_211130, FTransmissaoRepo.TentativaRegistrada.XmlEnvio);

  LRequisicao := FGateway.UltimaRequisicao;
  Assert.IsTrue(LRequisicao.TipoEvento = teImobilizacaoItem);
  Assert.AreEqual(2, LRequisicao.TpAutor);
  Assert.AreEqual(35, LRequisicao.COrgaoAutor);

  Assert.AreEqual(2, Length(LRequisicao.Payload.Itens));
  Assert.AreEqual(1, LRequisicao.Payload.Itens[0].NItem);
  Assert.AreEqual(Double(5), LRequisicao.Payload.Itens[0].VIBS, Double(0.0001));
  Assert.AreEqual(Double(2.20), LRequisicao.Payload.Itens[0].VCBS, Double(0.0001));
  Assert.AreEqual(Double(10), LRequisicao.Payload.Itens[0].QImobilizado, Double(0.0001));
  Assert.AreEqual('UN', LRequisicao.Payload.Itens[0].UImobilizado);
  Assert.AreEqual(2, LRequisicao.Payload.Itens[1].NItem);
  Assert.AreEqual(Double(3.25), LRequisicao.Payload.Itens[1].VIBS, Double(0.0001));
  Assert.AreEqual(Double(1.10), LRequisicao.Payload.Itens[1].VCBS, Double(0.0001));
  Assert.AreEqual(Double(7.5), LRequisicao.Payload.Itens[1].QImobilizado, Double(0.0001));
  Assert.AreEqual('CX', LRequisicao.Payload.Itens[1].UImobilizado);
end;

procedure TTestTransmitirEventoDFeUseCase.DeveConcluirAutorizadoPelaConsultaAposRejeicao;
var
  LResultado: TEventoDFeResultadoTransmissao;
  LTentativa: TEventoDFeTransmissaoEtd;
begin
  Semear112150(ID_EVENTO, seRejeitado, 1);
  FTransmissaoRepo.AdicionarTentativaConcluida(ID_EVENTO, XML_ENVIO,
    '<retEvento/>');
  FGateway.Consulta := ConsultaEventoAutorizado(1);

  LResultado := FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(LResultado.Classe = crAutorizado);
  Assert.IsTrue(LResultado.OrigemResultado = orFiscal);
  Assert.AreEqual('135260000000001', LResultado.NProt);
  Assert.IsTrue(FGateway.ConsultarChamado);
  Assert.IsFalse(FGateway.PrepararChamado);
  Assert.IsFalse(FGateway.TransmitirChamado);
  Assert.IsFalse(FTransmissaoRepo.RegistrarTentativaChamado);
  Assert.IsFalse(FEventosRepo.GarantirNseqChamado);
  Assert.IsFalse(FEventosRepo.RegistrarEnvioChamado);
  Assert.IsTrue(FTransmissaoRepo.RegistrarEvidenciaChamado);
  Assert.IsTrue(FEventosRepo.ConcluirEventoChamado);
  Assert.IsTrue(FEventosRepo.UltimoStatusEsperado = seRejeitado);
  Assert.IsTrue(FEventosRepo.UltimoNovoStatus = seAutorizado);
  Assert.IsTrue(StatusArmazenado(ID_EVENTO) = seAutorizado);

  LTentativa := FTransmissaoRepo.ObterUltimaPorEvento(ID_EVENTO);
  try
    Assert.AreEqual(135, LTentativa.CStatEvento);
    Assert.IsTrue(LTentativa.OrigemResultado = orFiscal);
    Assert.AreEqual('<procEventoNFe/>', LTentativa.XmlProcEvento);
    Assert.AreEqual(XML_ENVIO, LTentativa.XmlEnvio);
    Assert.AreEqual('<retEvento/>', LTentativa.XmlRetorno);
  finally
    LTentativa.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTransmitirEventoDFeUseCase);

end.
