unit Test_CalcularTributosNFSeService;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  CalcularTributosNFSeServiceUnit,
  ICalcularTributosNFSeServiceUnit,
  CalculoTributosNFSeInputUnit,
  CalculoTributosNFSeOutputUnit,
  NFSeModelUnit,
  NFSeEtdUnit,
  NFSeTypesUnit,
  DpsEmitirIbsCbsNacionalModelUnit,
  TipoRegraTributoDFeEnumUnit,
  StringNullableUnit,
  CurrencyNullableUnit,
  IntegerNullableUnit,
  DateAndTimeNullableUnit,
  DFeTypesUnit,
  StatusRegistroEnumUnit,
  RegraFiscalIbsCbsEtdUnit,
  IRegrasFiscaisIbsCbsRepositoryUnit,
  IResolverRegraFiscalIbsCbsServiceUnit,
  ResolverRegraFiscalIbsCbsTypesUnit,
  StubRegrasFiscaisIbsCbsRepositoryUnit,
  ICalculoBaseCalculoServiceUnit,
  ICalculadorBaseCalculoServiceUnit,
  CalcularBaseCalculoModelUnit,
  ICalculadorROCServiceUnit,
  CalcularTributoInputUnit,
  ROCDomainUnit,
  ValidacaoOutputUnit,
  ICalculoTotaisNFSeServiceUnit,
  CalculoTotaisNFSeTypes,
  TributoNFSeAproximadosOutputUnit,
  ROCItemDomainUnit,
  TributosModelUnit,
  IBSCBSModelUnit,
  ImpostoSeletivoModelUnit,
  TransferenciaCreditoModelUnit,
  AjusteCompetenciaModelUnit,
  EstornoCreditoModelUnit,
  CreditoPresumidoOperacaoModelUnit,
  CreditoPresumidoIBSZFMModelUnit,
  OperacaoConsumoModelUnit,
  ValoresTotaisDomainUnit;

type
  TResolverAutomaticoStub = class(TInterfacedObject, IResolverRegraFiscalIbsCbsService)
  private
    FExecutarChamadas: Integer;
  public
    function Executar(const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsResult;
    function Analisar(const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsAnalise;
    property ExecutarChamadas: Integer read FExecutarChamadas;
  end;

  TCalculadorBaseCalculoStub = class(TInterfacedObject, ICalculadorBaseCalculoService)
  public
    function CalculaIS(const Input: BaseCalculoISMercadoriasModel): Currency;
    function CalculaIbsCbs(const Input: BaseCalculoIbsCbsModel): Currency;
  end;

  TCalculadorROCStub = class(TInterfacedObject, ICalculadorROCService)
  public
    function Executar(const Input: CalcularTributoInput): ROCDomain;
  end;

  TCalculoTotaisStub = class(TInterfacedObject, ICalculoTotaisNFSeService)
  public
    function Executar(Input: CalculoTotaisNFSeInput): CalculoTotaisNFSeResult; overload;
    function Executar(Input: NFSeModel): CalculoTotaisNFSeResult; overload;
  end;

  [TestFixture]
  TTestCalcularTributosNFSeService = class
  private
    FRegrasRepo: TRegrasFiscaisIbsCbsRepositoryStub;
    FResolverStub: TResolverAutomaticoStub;
    FServico: ICalcularTributosNFSeService;

    function CriarRegra(const AId, ACClassTrib: string): RegraFiscalIbsCbsEtd;
    function CriarNFSe: NFSeEtd;
    function CriarModeloManual(const ANFSe: NFSeEtd; const ARegraFiscalId: string): NFSeModel;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DevePreservarRegraManualSemExecutarDeterminacaoAutomatica;
  end;

implementation

{ TResolverAutomaticoStub }

function TResolverAutomaticoStub.Analisar(
  const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsAnalise;
begin
  raise Exception.Create('Analisar não deveria ser chamado no cálculo NFS-e.');
end;

function TResolverAutomaticoStub.Executar(
  const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsResult;
begin
  Inc(FExecutarChamadas);
  Result := ResolverRegraFiscalIbsCbsResult.Create(
    rrDeterminado,
    RegraFiscalIbsCbsEtd.Create(
      'B', '', '222',
      CurrencyNullable.NullInstance(),
      CurrencyNullable.NullInstance(),
      CurrencyNullable.NullInstance(),
      IntegerNullable.NullInstance(),
      EncodeDate(2026, 1, 1),
      DateNullable.NullInstance(),
      Now, Now,
      saAtivo,
      StringNullable.NullInstance(),
      StringNullable.NullInstance(),
      nil),
    '',
    nil,
    False);
end;

{ TCalculadorBaseCalculoStub }

function TCalculadorBaseCalculoStub.CalculaIbsCbs(
  const Input: BaseCalculoIbsCbsModel): Currency;
begin
  Result := 0;
end;

function TCalculadorBaseCalculoStub.CalculaIS(
  const Input: BaseCalculoISMercadoriasModel): Currency;
begin
  Result := 0;
end;

{ TCalculadorROCStub }

function TCalculadorROCStub.Executar(const Input: CalcularTributoInput): ROCDomain;
var
  Validacoes: ValidacaoOutput;
  Itens: ROCItens;
begin
  // Resultado valido com um item: o contexto fiscal devolvido pela producao
  // precisa representar o calculo para que a regra manual possa ser observada
  // na saida do servico. CST 410 nao exige o grupo IBS/CBS.
  Validacoes := ValidacaoOutput.Create();
  SetLength(Itens, 1);
  Itens[0] := ROCItemDomain.Create(
    1,
    TributosModel.Create(
      ImpostoSeletivoModel.NullInstance(),
      IBSCBSModel.Create(
         410,
         '',
         nil,
         nil,
         TransferenciaCreditoModel.NullInstance(),
         AjusteCompetenciaModel.NullInstance(),
         EstornoCreditoModel.NullInstance(),
         CreditoPresumidoOperacaoModel.NullInstance(),
         CreditoPresumidoIBSZFMModel.NullInstance())));
  Result := ROCDomain.Create(OperacaoConsumoModel.NullInstance(), Itens, ValoresTotaisDomain.CreateVazio, Validacoes);
end;

{ TCalculoTotaisStub }

function TCalculoTotaisStub.Executar(
  Input: CalculoTotaisNFSeInput): CalculoTotaisNFSeResult;
begin
  Result := CalculoTotaisNFSeResult.Create(0, 0, 0);
end;

function TCalculoTotaisStub.Executar(
  Input: NFSeModel): CalculoTotaisNFSeResult;
begin
  Result := CalculoTotaisNFSeResult.Create(0, 0, 0);
end;

{ TTestCalcularTributosNFSeService }

function TTestCalcularTributosNFSeService.CriarRegra(
  const AId, ACClassTrib: string): RegraFiscalIbsCbsEtd;
begin
  Result := RegraFiscalIbsCbsEtd.Create(
    AId,
    '',
    ACClassTrib,
    CurrencyNullable.NullInstance(),
    CurrencyNullable.NullInstance(),
    CurrencyNullable.NullInstance(),
    IntegerNullable.NullInstance(),
    EncodeDate(2026, 1, 1),
    DateNullable.NullInstance(),
    Now,
    Now,
    saAtivo,
    StringNullable.NullInstance(),
    StringNullable.NullInstance(),
    nil);
end;

function TTestCalcularTributosNFSeService.CriarNFSe: NFSeEtd;
begin
  Result := NFSeEtd.Create();
  Result.Id := 'nfse-teste';
  Result.CodEmpresa := 1;
  Result.OpInternaId := StringNullable.Create('op-interna');
  Result.LayoutNFSe := lytNacionalComIbsCbs;
  Result.Situacao := sdpsRascunho;
  Result.NaturezaEmissao := nemtPrestadorWS;
  Result.DhEmi := DateTimeNullable.Create(EncodeDate(2026, 1, 15));
  Result.CLocPrestacao := IntegerNullable.Create(3550308);
  Result.CNBS := StringNullable.Create('123456789');
  Result.VServ := CurrencyNullable.Create(100);
  Result.VDescIncond := CurrencyNullable.NullInstance();
  Result.TpEnteGov := tgvNenhum;
  Result.TpOper := togNaoDefinido;
end;

function TTestCalcularTributosNFSeService.CriarModeloManual(
  const ANFSe: NFSeEtd; const ARegraFiscalId: string): NFSeModel;
var
  IbsCbsNacional: DpsEmitirIbsCbsNacionalModel;
begin
  IbsCbsNacional := DpsEmitirIbsCbsNacionalModel.Create(
    tctManual,
    StringNullable.Create(ARegraFiscalId),
    '',
    '',
    StringNullable.NullInstance(),
    StringNullable.NullInstance(),
    StringNullable.NullInstance(),
    CurrencyNullable.NullInstance(),
    CurrencyNullable.NullInstance(),
    CurrencyNullable.NullInstance());

  Result := NFSeModel.Create(ANFSe, IbsCbsNacional);
end;

procedure TTestCalcularTributosNFSeService.Setup;
begin
  FRegrasRepo := TRegrasFiscaisIbsCbsRepositoryStub.Create;
  FRegrasRepo.AdicionarRegra(CriarRegra('A', '111'));

  FResolverStub := TResolverAutomaticoStub.Create;
  FServico := CalcularTributosNFSeService.Create(
    nil, nil, nil,
    FRegrasRepo,
    nil, nil,
    TCalculoTotaisStub.Create,
    nil, nil, nil,
    TCalculadorROCStub.Create,
    TCalculadorBaseCalculoStub.Create,
    nil,
    FResolverStub);
end;

procedure TTestCalcularTributosNFSeService.TearDown;
begin
  FServico := nil;
  FResolverStub := nil;
  FreeAndNil(FRegrasRepo);
end;

procedure TTestCalcularTributosNFSeService.DevePreservarRegraManualSemExecutarDeterminacaoAutomatica;
var
  NFSe: NFSeEtd;
  Modelo: NFSeModel;
  Saida: CalculoTributosNFSeOutput;
  TribAprox: TributoNFSeAproximadosOutput;
begin
  Saida := nil;
  Modelo := nil;

  try
    NFSe := CriarNFSe;
    Modelo := CriarModeloManual(NFSe, 'A');
    Saida := FServico.Executar(CalculoTributosNFSeInput.Create(Modelo, True, False));
    try
      Assert.IsNotNull(Saida);
      Assert.AreEqual(0, FResolverStub.ExecutarChamadas);
      Assert.AreEqual(1, FRegrasRepo.GetByIdChamadas);
      Assert.AreEqual('A', FRegrasRepo.UltimoId);

      // A saida efetiva deve manter a regra manual e a origem manual, sem
      // substituir a escolha pela regra devolvida pelo resolvedor automatico.
      Assert.IsNotNull(Saida.TributoDFe);
      Assert.IsNotNull(Saida.TributoDFe.IbsCbs);
      Assert.AreEqual('A', Saida.TributoDFe.IbsCbs.RegraFiscalId.Value);
      Assert.IsTrue(Saida.TributoDFe.IbsCbs.TipoRegra = tctManual);
    finally
      if Saida <> nil then
      begin
        TribAprox := Saida.TribAprox;
        Saida.Free();
        if TribAprox <> nil then
          TribAprox.Free();
      end;
    end;
  finally
    if Modelo <> nil then
    begin
      Modelo.IbsCbsNacional := nil;
      Modelo.Free();
    end;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestCalcularTributosNFSeService);

end.
