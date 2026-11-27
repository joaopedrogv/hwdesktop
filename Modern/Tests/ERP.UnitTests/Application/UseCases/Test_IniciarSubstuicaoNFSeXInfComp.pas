unit Test_IniciarSubstuicaoNFSeXInfComp;

interface

uses
  DUnitX.TestFramework,
  IniciarSubstuicaoNFSeUseCaseUnit,
  IConfiguracaoNFSeServiceUnit,
  ConfiguracaoNFSeModelUnit,
  NFSeModelUnit,
  NFSeEtdUnit,
  NFSeTypesUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  CurrencyNullableUnit,
  DateAndTimeNullableUnit,
  TipoComunsUnit,
  CertificadoDigitalConfigUnit,
  WebServiceDFeModelUnit,
  StubConfiguracaoNFSeServiceUnit,
  StubNFSeRepositoryUnit,
  StubTributosDFeRepositoryUnit,
  TributoDFeContextEtdUnit,
  TributoDFeOrigemEnumUnit;

type
  [TestFixture]
  TTestIniciarSubstuicaoNFSeXInfComp = class
  private
    FNFSeRepository: TNFSeRepositoryStub;
    FTributosRepository: TTributosDFeRepositoryStub;
    FConfiguracaoService: TStubConfiguracaoNFSeService;
    FConfiguracaoServiceIntf: IConfiguracaoNFSeService;
    FUseCase: IIniciarSubstuicaoNFSeUseCase;

    function CriarConfiguracao: ConfiguracaoNFSeModel;
    function CriarNFSeBase(const AXInfComp: string): NFSeEtd;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveCopiarXInfCompDaNFSeSubstituida;

    [Test]
    procedure DeveManterXInfCompVazioQuandoBaseNaoPossuiTexto;

    [Test]
    procedure DevePreservarDemaisCamposDaNFSeBase;
  end;

implementation

uses
  SysUtils;

const
  NFSE_ID = 'NFSE-SUBSTITUICAO';
  EMPRESA_ID = 1;

procedure TTestIniciarSubstuicaoNFSeXInfComp.Setup;
begin
  FNFSeRepository := TNFSeRepositoryStub.Create;
  FTributosRepository := TTributosDFeRepositoryStub.Create;
  FConfiguracaoService := TStubConfiguracaoNFSeService.Create(CriarConfiguracao);
  FConfiguracaoServiceIntf := FConfiguracaoService;

  FUseCase := IniciarSubstuicaoNFSeUseCase.Create(
    FNFSeRepository,
    FTributosRepository,
    FConfiguracaoServiceIntf
  );
end;

procedure TTestIniciarSubstuicaoNFSeXInfComp.TearDown;
begin
  FUseCase := nil;
  FConfiguracaoServiceIntf := nil;
  FConfiguracaoService := nil;
  FTributosRepository.Free;
  FNFSeRepository.Free;
end;

function TTestIniciarSubstuicaoNFSeXInfComp.CriarConfiguracao: ConfiguracaoNFSeModel;
begin
  Result := ConfiguracaoNFSeModel.Create(
    '1',
    False,
    False,
    True,
    False,
    False,
    False,
    3550308,
    raNaoDefinido,
    0,
    StringNullable.NullInstance(),
    osnNaoDefinido,
    CurrencyNullable.NullInstance(),
    lytNacionalSemIbsCbs,
    CertificadoDigitalConfig.Create('', '', '', ''),
    WebServiceDFeModel.Create(False, 3550308, '', '', '', '', False, False, 0, 0, 0, 0),
    OpcoesDiscriminacaoModel.Create(False, False, sLineBreak),
    OpcoesImpressaoModel.Create(False, ''),
    DateTimeNullable.NullInstance(),
    False
  );
end;

function TTestIniciarSubstuicaoNFSeXInfComp.CriarNFSeBase(const AXInfComp: string): NFSeEtd;
begin
  Result := NFSeEtd.Create();
  Result.Id := NFSE_ID;
  Result.CodEmpresa := EMPRESA_ID;
  Result.CodCliente := IntegerNullable.Create(10);
  Result.LayoutNFSe := lytNacionalSemIbsCbs;
  Result.Situacao := sdpsAutorizada;
  Result.NaturezaEmissao := nemtPrestadorWS;
  Result.XDescServ := StringNullable.Create('Servico prestado');
  Result.XInfComp := StringNullable.CreateOrNull(AXInfComp);
end;

procedure TTestIniciarSubstuicaoNFSeXInfComp.DeveCopiarXInfCompDaNFSeSubstituida;
var
  ResultModel: NFSeModel;
const
  TEXTO = 'Informacoes complementares digitadas';
begin
  FNFSeRepository.NFSeToReturn := CriarNFSeBase(TEXTO);
  FTributosRepository.TributoToReturn := TributoDFeContextEtd.Create(NFSE_ID, tdfoNFSe, nil, nil);

  ResultModel := FUseCase.Executar(NFSE_ID, EMPRESA_ID);
  try
    Assert.IsNotNull(ResultModel);
    Assert.IsNotNull(ResultModel.NFSe);
    Assert.IsFalse(ResultModel.NFSe.XInfComp.IsNull);
    Assert.AreEqual(TEXTO, ResultModel.NFSe.XInfComp.Value);
  finally
    ResultModel.Free;
  end;
end;

procedure TTestIniciarSubstuicaoNFSeXInfComp.DeveManterXInfCompVazioQuandoBaseNaoPossuiTexto;
var
  ResultModel: NFSeModel;
begin
  FNFSeRepository.NFSeToReturn := CriarNFSeBase('');
  FTributosRepository.TributoToReturn := TributoDFeContextEtd.Create(NFSE_ID, tdfoNFSe, nil, nil);

  ResultModel := FUseCase.Executar(NFSE_ID, EMPRESA_ID);
  try
    Assert.IsNotNull(ResultModel);
    Assert.IsNotNull(ResultModel.NFSe);
    Assert.IsTrue(ResultModel.NFSe.XInfComp.IsNull);
    Assert.AreEqual('', ResultModel.NFSe.XInfComp.Value);
  finally
    ResultModel.Free;
  end;
end;

procedure TTestIniciarSubstuicaoNFSeXInfComp.DevePreservarDemaisCamposDaNFSeBase;
var
  ResultModel: NFSeModel;
begin
  FNFSeRepository.NFSeToReturn := CriarNFSeBase('Texto complementar');
  FTributosRepository.TributoToReturn := TributoDFeContextEtd.Create(NFSE_ID, tdfoNFSe, nil, nil);

  ResultModel := FUseCase.Executar(NFSE_ID, EMPRESA_ID);
  try
    Assert.IsNotNull(ResultModel);
    Assert.IsNotNull(ResultModel.NFSe);
    Assert.AreEqual(EMPRESA_ID, ResultModel.NFSe.CodEmpresa);
    Assert.AreEqual(10, ResultModel.NFSe.CodCliente.Value);
    Assert.IsTrue(ResultModel.NFSe.LayoutNFSe = lytNacionalSemIbsCbs);
    Assert.AreEqual('Servico prestado', ResultModel.NFSe.XDescServ.Value);
  finally
    ResultModel.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestIniciarSubstuicaoNFSeXInfComp);

end.
