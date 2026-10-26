unit Test_ReverterAutorizacaoPortalNFSeUseCase;

interface

uses
  DUnitX.TestFramework,
  ReverterAutorizacaoPortalNFSeUseCaseUnit,
  IAtualizarSituacaoNFSeServiceUnit,
  NFSeTypesUnit,
  NFSeResumoModelUnit,
  NFSeEtdUnit,
  FakeTransactionUnit,
  FakeDatabaseConnectionUnit,
  StubNFSeRepositoryUnit,
  StubTributosDFeRepositoryUnit,
  FakeAtualizarSituacaoNFSeServiceUnit;

type
  [TestFixture]
  TTestReverterAutorizacaoPortalNFSeUseCase = class
  private
    FTransactionState: TTransactionSpyState;
    FConnection: TFakeDatabaseConnection;
    FNFSeRepository: TNFSeRepositoryStub;
    FTributosRepository: TTributosDFeRepositoryStub;
    FAtualizarSituacaoService: TFakeAtualizarSituacaoNFSeService;
    FAtualizarSituacaoServiceIntf: IAtualizarSituacaoNFSeService;
    FUseCase: IReverterAutorizacaoPortalNFSeUseCase;

    function CreateResumo(
      ASituacao: SituacaoNFSeEnum;
      ANaturezaEmissao: NaturezaEmissaoNFSeEnum
    ): NFSeResumoModel;
    function CreateNFSe(ASituacao: SituacaoNFSeEnum): NFSeEtd;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveFalharQuandoNFSeNaoFoiEncontrada;

    [Test]
    procedure DeveFalharQuandoNFSeNaoEstaAutorizada;

    [Test]
    procedure DeveFalharQuandoNFSeFoiAutorizadaViaWebService;

    [Test]
    procedure DeveFalharQuandoNFSeNaoRetornaParaRascunho;

    [Test]
    procedure DeveExecutarRollbackQuandoServiceFalha;

    [Test]
    procedure DeveReverterAutorizacaoRealizadaNoPortal;
  end;

implementation

uses
  SysUtils,
  EValidacaoNegocioUnit,
  NFSeModelUnit,
  TributoDFeContextEtdUnit,
  TributoDFeOrigemEnumUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  DateAndTimeNullableUnit,
  DFeTypesUnit;

const
  NFSE_ID = 'NFSE-TESTE-1';
  EMPRESA_ID = 1;

procedure TTestReverterAutorizacaoPortalNFSeUseCase.Setup;
begin
  FTransactionState := TTransactionSpyState.Create;
  FTransactionState.TransactionId := 'TRANSACTION-TEST';

  FConnection := TFakeDatabaseConnection.Create(FTransactionState);
  FNFSeRepository := TNFSeRepositoryStub.Create;
  FTributosRepository := TTributosDFeRepositoryStub.Create;

  FAtualizarSituacaoService := TFakeAtualizarSituacaoNFSeService.Create;
  FAtualizarSituacaoServiceIntf := FAtualizarSituacaoService;

  FUseCase := ReverterAutorizacaoPortalNFSeUseCase.Create(
    FConnection,
    FNFSeRepository,
    FTributosRepository,
    FAtualizarSituacaoServiceIntf
  );
end;

procedure TTestReverterAutorizacaoPortalNFSeUseCase.TearDown;
begin
  FUseCase := nil;
  FAtualizarSituacaoServiceIntf := nil;
  FAtualizarSituacaoService := nil;

  FTributosRepository.Free;
  FNFSeRepository.Free;
  FConnection.Free;
  FTransactionState.Free;
end;

function TTestReverterAutorizacaoPortalNFSeUseCase.CreateResumo(
  ASituacao: SituacaoNFSeEnum;
  ANaturezaEmissao: NaturezaEmissaoNFSeEnum
): NFSeResumoModel;
var
  Documentos: NFSeResumoModelDocArray;
begin
  SetLength(Documentos, 0);

  Result := NFSeResumoModel.Create(
    NFSE_ID,
    EMPRESA_ID,
    ASituacao,
    ANaturezaEmissao,
    TipoAmbienteEnum(0),
    StringNullable.NullInstance(),
    IntegerNullable.NullInstance(),
    DateTimeNullable.NullInstance(),
    lytPrefeitura,
    StringNullable.NullInstance(),
    StringNullable.NullInstance(),
    StringNullable.NullInstance(),
    Int64Nullable.NullInstance(),
    StringNullable.NullInstance(),
    StringNullable.NullInstance(),
    Documentos
  );
end;

function TTestReverterAutorizacaoPortalNFSeUseCase.CreateNFSe(
  ASituacao: SituacaoNFSeEnum
): NFSeEtd;
begin
  Result := NFSeEtd.Create();
  Result.Id := NFSE_ID;
  Result.Situacao := ASituacao;
  Result.NaturezaEmissao := nemtPrestadorPortal;
end;

procedure TTestReverterAutorizacaoPortalNFSeUseCase.DeveFalharQuandoNFSeNaoFoiEncontrada;
begin
  FNFSeRepository.ResumoToReturn := CreateResumo(
    sdpsExcluido,
    nemtPrestadorPortal
  );

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(NFSE_ID, EMPRESA_ID);
    end,
    EValidacaoNegocio
  );

  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsFalse(FTransactionState.CommitCalled);
  Assert.IsFalse(FAtualizarSituacaoService.ReversaoCalled);
  Assert.IsFalse(FNFSeRepository.GetNFSeCalled);
  Assert.IsTrue(FTransactionState.TransactionDestroyed);
end;

procedure TTestReverterAutorizacaoPortalNFSeUseCase.DeveFalharQuandoNFSeNaoEstaAutorizada;
begin
  FNFSeRepository.ResumoToReturn := CreateResumo(
    sdpsRascunho,
    nemtPrestadorPortal
  );

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(NFSE_ID, EMPRESA_ID);
    end,
    EValidacaoNegocio
  );

  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsFalse(FTransactionState.CommitCalled);
  Assert.IsFalse(FAtualizarSituacaoService.ReversaoCalled);
  Assert.IsFalse(FNFSeRepository.GetNFSeCalled);
end;

procedure TTestReverterAutorizacaoPortalNFSeUseCase.DeveFalharQuandoNFSeFoiAutorizadaViaWebService;
begin
  FNFSeRepository.ResumoToReturn := CreateResumo(
    sdpsAutorizada,
    nemtPrestadorWS
  );

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(NFSE_ID, EMPRESA_ID);
    end,
    EValidacaoNegocio
  );

  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsFalse(FTransactionState.CommitCalled);
  Assert.IsFalse(FAtualizarSituacaoService.ReversaoCalled);
  Assert.IsFalse(FNFSeRepository.GetNFSeCalled);
end;

procedure TTestReverterAutorizacaoPortalNFSeUseCase.DeveFalharQuandoNFSeNaoRetornaParaRascunho;
begin
  FNFSeRepository.ResumoToReturn := CreateResumo(
    sdpsAutorizada,
    nemtPrestadorPortal
  );
  FNFSeRepository.NFSeToReturn := CreateNFSe(sdpsAutorizada);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(NFSE_ID, EMPRESA_ID);
    end,
    EValidacaoNegocio
  );

  Assert.IsTrue(FAtualizarSituacaoService.ReversaoCalled);
  Assert.IsTrue(FNFSeRepository.GetNFSeCalled);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsFalse(FTransactionState.CommitCalled);
  Assert.IsFalse(FTributosRepository.GetByIdCalled);
end;

procedure TTestReverterAutorizacaoPortalNFSeUseCase.DeveExecutarRollbackQuandoServiceFalha;
begin
  FNFSeRepository.ResumoToReturn := CreateResumo(
    sdpsAutorizada,
    nemtPrestadorPortal
  );
  FAtualizarSituacaoService.RaiseOnReversao := True;

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(NFSE_ID, EMPRESA_ID);
    end,
    Exception
  );

  Assert.IsTrue(FAtualizarSituacaoService.ReversaoCalled);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsFalse(FTransactionState.CommitCalled);
  Assert.IsFalse(FNFSeRepository.GetNFSeCalled);
end;

procedure TTestReverterAutorizacaoPortalNFSeUseCase.DeveReverterAutorizacaoRealizadaNoPortal;
var
  ResultModel: NFSeModel;
begin
  FNFSeRepository.ResumoToReturn := CreateResumo(
    sdpsAutorizada,
    nemtPrestadorPortal
  );
  FNFSeRepository.NFSeToReturn := CreateNFSe(sdpsRascunho);
  FTributosRepository.TributoToReturn := TributoDFeContextEtd.Create(
    NFSE_ID,
    tdfoNFSe,
    nil,
    nil
  );

  ResultModel := FUseCase.Executar(NFSE_ID, EMPRESA_ID);
  try
    Assert.IsNotNull(ResultModel);
    Assert.IsNotNull(ResultModel.NFSe);
    Assert.AreEqual(NFSE_ID, ResultModel.NFSe.Id);

    Assert.IsTrue(FAtualizarSituacaoService.ReversaoCalled);
    Assert.AreEqual(NFSE_ID, FAtualizarSituacaoService.LastNFSeId);
    Assert.AreEqual(EMPRESA_ID, FAtualizarSituacaoService.LastEmpresaId);

    Assert.IsTrue(FNFSeRepository.GetResumoCalled);
    Assert.IsTrue(FNFSeRepository.GetNFSeCalled);
    Assert.IsTrue(FTributosRepository.GetByIdCalled);
    Assert.AreEqual(NFSE_ID, FTributosRepository.LastId);
    Assert.AreEqual(Integer(tdfoNFSe), Integer(FTributosRepository.LastOrigem));

    Assert.IsTrue(FTransactionState.CommitCalled);
    Assert.IsFalse(FTransactionState.RollbackCalled);
  finally
    ResultModel.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestReverterAutorizacaoPortalNFSeUseCase);

end.
