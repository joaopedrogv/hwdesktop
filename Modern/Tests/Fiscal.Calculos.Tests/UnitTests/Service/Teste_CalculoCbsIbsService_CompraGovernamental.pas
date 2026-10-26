unit Teste_CalculoCbsIbsService_CompraGovernamental;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  CalculoCbsIbsServiceUnit,
  AvaliadorExpressaoAritmeticaServiceUnit,
  IAvaliadorExpressaoAritmeticaServiceUnit,
  ITratamentosTributariosRepositoryUnit,
  TratamentoTributarioEtdUnit,
  IClassificacaoTributariaRepositoryUnit,
  ClassificacaoTributariaCalculoModelUnit,
  ClassificacaoTributariaModelUnit,
  ClassificacaoTributariaEtdUnit,
  IAliquotaPadraoRepositoryUnit,
  AliquotaResultadoModelUnit,
  IPercentualReducaoRepositoryUnit,
  PercentualReducaoEtdUnit,
  TipoTributoEnumUnit,
  ItemCalculoInputUnit,
  ImpostoSeletivoInputUnit,
  TributacaoRegularInputUnit,
  TratamentoClassificacaoModelUnit,
  ResultadoCbsIbsUnit,
  TipoEnteGovernamentalEnumUnit,
  StringNullableUnit,
  CurrencyNullableUnit,
  IntegerNullableUnit,
  DateAndTimeNullableUnit, ISituacaoTributariaServiceUnit, SituacaoTributariaEtdUnit;

type
  TFakeTratamentosTributariosRepository = class(ITratamentosTributariosRepository)
  private
    FTratamento: TratamentoTributarioEtd;
  public
    constructor Create(const Tratamento: TratamentoTributarioEtd); reintroduce;
    function ObterTratamentoTributario(Id: Integer): TratamentoTributarioEtd; override;
  end;

  TFakeClassificacaoTributariaRepository = class(IClassificacaoTributariaRepository)
  private
    FCalculo: ClassificacaoTributariaCalculoModel;
  public
    constructor Create(const Calculo: ClassificacaoTributariaCalculoModel); reintroduce;
    function ObterClassificacaoTributaria(
      const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
    ): ClassificacaoTributariaModel; override;
    function ObterClassificacaoCalculo(Id: Integer): ClassificacaoTributariaCalculoModel; override;
    function ObterTodasEAtual(
      const CClassTribAtual: string; TipoTributo: TipoTributoEnum
    ): ClassificacoesTributariasEtd; override;
    function ObterClassificacaoCbsIbs(
      const CClassTrib: string; Data: TDate
    ): ClassificacaoTributariaEtd; override;
  end;

  TFakeAliquotaPadraoRepository = class(IAliquotaPadraoRepository)
  private
    FValorAplicavel: Currency;
  public
    constructor Create(ValorAplicavel: Currency); reintroduce;
    function ObterAliquota(
      TipoTributo: TipoTributoEnum; const CUF, CMun: IntegerNullable; Data: TDate
    ): AliquotaResultadoModel; override;
  end;

  TFakePercentualReducaoRepository = class(IPercentualReducaoRepository)
  private
    FValor: CurrencyNullable;
  public
    constructor Create(const Valor: CurrencyNullable); reintroduce;
    function ObterporClassTribETributo(
      ClassificacaoTributariaId: Integer; TipoTributo: TipoTributoEnum; Data: TDate
    ): CurrencyNullable; override;
    function ObterporCClassTribETributo(
      const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
    ): PercentualReducaoEtd; override;
  end;

  TFakeSituacaoTributariaService = class(TInterfacedObject, ISituacaoTributariaService)
  public
    function ConsultarSituacaoTributariaPorCodigo(const CST: string; IdTributo: TipoTributoEnum; Data: TDate): SituacaoTributariaEtd;
  end;

  [TestFixture]
  TTest_CalculoCbsIbsService_CompraGovernamental = class
  private
    FSitTribService: ISituacaoTributariaService;
    FAvaliador: IAvaliadorExpressaoAritmeticaService;
    FTratamentosTribRepo: TFakeTratamentosTributariosRepository;
    FClassificacoesTribRepo: TFakeClassificacaoTributariaRepository;
    FAliquotaPadraoRepo: TFakeAliquotaPadraoRepository;
    FPercentualReducaoRepo: TFakePercentualReducaoRepository;
    FService: ICalculoCbsIbsService;

    function CriarTratamento(): TratamentoTributarioEtd;
    function CriarCalculo(): ClassificacaoTributariaCalculoModel;
    function CriarItem(const TemTributacaoRegular: Boolean): ItemCalculoInput;
    procedure CriarService();
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_CBS_ComCompraGov_PopulaPAliqCBSVTribCBS;

    [Test]
    procedure teste_IBSUF_ComCompraGov_PopulaPAliqIBSUFVTribIBSUF;

    [Test]
    procedure teste_IBSMun_ComCompraGov_PopulaPAliqIBSMunVTribIBSMun;

    [Test]
    procedure teste_SemTpEnteGov_CompraGovernamentalNula;

    [Test]
    procedure teste_TributacaoRegular_ComCompraGov_NaoSuprimeGrupoReducao;

    [Test]
    procedure teste_PRedutorCompraGov_AplicadoNaAliquotaEfetiva;
  end;

implementation

{ TFakeTratamentosTributariosRepository }

constructor TFakeTratamentosTributariosRepository.Create(const Tratamento: TratamentoTributarioEtd);
begin
  inherited Create(nil);
  FTratamento := Tratamento;
end;

function TFakeTratamentosTributariosRepository.ObterTratamentoTributario(Id: Integer): TratamentoTributarioEtd;
begin
  Result := FTratamento;
end;

{ TFakeClassificacaoTributariaRepository }

constructor TFakeClassificacaoTributariaRepository.Create(const Calculo: ClassificacaoTributariaCalculoModel);
begin
  inherited Create(nil);
  FCalculo := Calculo;
end;

function TFakeClassificacaoTributariaRepository.ObterClassificacaoTributaria(
  const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
): ClassificacaoTributariaModel;
begin
  Result := ClassificacaoTributariaModel.NullInstance();
end;

function TFakeClassificacaoTributariaRepository.ObterClassificacaoCalculo(Id: Integer): ClassificacaoTributariaCalculoModel;
begin
  Result := FCalculo;
end;

function TFakeClassificacaoTributariaRepository.ObterTodasEAtual(
  const CClassTribAtual: string; TipoTributo: TipoTributoEnum
): ClassificacoesTributariasEtd;
begin
  Result := nil;
end;

function TFakeClassificacaoTributariaRepository.ObterClassificacaoCbsIbs(
  const CClassTrib: string; Data: TDate
): ClassificacaoTributariaEtd;
begin
  Result := nil;
end;

{ TFakeAliquotaPadraoRepository }

constructor TFakeAliquotaPadraoRepository.Create(ValorAplicavel: Currency);
begin
  inherited Create(nil);
  FValorAplicavel := ValorAplicavel;
end;

function TFakeAliquotaPadraoRepository.ObterAliquota(
  TipoTributo: TipoTributoEnum; const CUF, CMun: IntegerNullable; Data: TDate
): AliquotaResultadoModel;
begin
  // Aliquota padrao de referencia; valor aplicavel = referencia quando nao ha padrao.
  Result := AliquotaResultadoModel.Create(
    CurrencyNullable.Create(FValorAplicavel),
    CurrencyNullable.NullInstance(),
    StringNullable.NullInstance()
  );
end;

{ TFakePercentualReducaoRepository }

constructor TFakePercentualReducaoRepository.Create(const Valor: CurrencyNullable);
begin
  inherited Create(nil);
  FValor := Valor;
end;

function TFakePercentualReducaoRepository.ObterporClassTribETributo(
  ClassificacaoTributariaId: Integer; TipoTributo: TipoTributoEnum; Data: TDate
): CurrencyNullable;
begin
  Result := FValor;
end;

function TFakePercentualReducaoRepository.ObterporCClassTribETributo(
  const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
): PercentualReducaoEtd;
begin
  Result := PercentualReducaoEtd.NullInstance();
end;

{ TTest_CalculoCbsIbsService_CompraGovernamental }

procedure TTest_CalculoCbsIbsService_CompraGovernamental.Setup;
begin
  FAvaliador := AvaliadorExpressaoAritmeticaService.Create();
  FSitTribService := TFakeSituacaoTributariaService.Create();
end;

procedure TTest_CalculoCbsIbsService_CompraGovernamental.TearDown;
begin
  FService := nil;
  FPercentualReducaoRepo.Free;
  FAliquotaPadraoRepo.Free;
  FClassificacoesTribRepo.Free;
  FTratamentosTribRepo.Free;
  FPercentualReducaoRepo := nil;
  FAliquotaPadraoRepo := nil;
  FClassificacoesTribRepo := nil;
  FTratamentosTribRepo := nil;
  FAvaliador := nil;
end;

function TTest_CalculoCbsIbsService_CompraGovernamental.CriarTratamento: TratamentoTributarioEtd;
var
  sn: StringNullable;
  dn: DateNullable;
begin
  // Expressao de aliquota efetiva com redutor de compra governamental,
  // conforme expressao real do banco v0039.
  sn := StringNullable.NullInstance();
  dn := DateNullable.NullInstance();
  Result := TratamentoTributarioEtd.Create(
    1,
    'Tratamento compra governamental',
    StringNullable.Create('aliquota'),
    StringNullable.Create('aliquota*(1-percentualReducao)*(1-pRedutorCompraGov/100)'),
    'baseCalculoInformada',
    'baseCalculo*aliquotaEfetiva',
    'tributoCalculado',
    sn, sn, // percentual diferimento / valor diferimento: em branco
    False, False, True, False, False, False,
    0, dn
  );
end;

function TTest_CalculoCbsIbsService_CompraGovernamental.CriarCalculo: ClassificacaoTributariaCalculoModel;
begin
  Result := ClassificacaoTributariaCalculoModel.Create(
    1, '000001', 'Padrao',
    False, False, False, False, // monofasia padrao/reten/ret/diferimento
    True // inGrupoReducao
  );
end;

function TTest_CalculoCbsIbsService_CompraGovernamental.CriarItem(const TemTributacaoRegular: Boolean): ItemCalculoInput;
var
  tributacaoRegular: TributacaoRegularInput;
begin
  if TemTributacaoRegular then
    tributacaoRegular := TributacaoRegularInput.Create('500', '000001')
  else
    tributacaoRegular := TributacaoRegularInput.NullInstance();

  Result := ItemCalculoInput.Create(
    1, '00000000', '000001', '000',
    ImpostoSeletivoInput.NullInstance(),
    tributacaoRegular,
    1000, // base calculo
    1,    // quantidade
    'UN'
  );
end;

procedure TTest_CalculoCbsIbsService_CompraGovernamental.CriarService;
begin
  FTratamentosTribRepo := TFakeTratamentosTributariosRepository.Create(CriarTratamento());
  FClassificacoesTribRepo := TFakeClassificacaoTributariaRepository.Create(CriarCalculo());
  FAliquotaPadraoRepo := TFakeAliquotaPadraoRepository.Create(25); // 25% -> 0.25 apos dividirPorCem
  FPercentualReducaoRepo := TFakePercentualReducaoRepository.Create(CurrencyNullable.Create(10)); // 10% -> 0.1

  // Repositorios nao utilizados no caminho de aliquota padrao (taPadrao):
  // aliquotaReferencia, aliquotaAdRemProduto e aliquotaAdValoremServico ficam nil.
  FService := CalculoCbsIbsService.Create(
    FPercentualReducaoRepo,
    nil,
    FAliquotaPadraoRepo,
    nil,
    nil,
    FTratamentosTribRepo,
    FClassificacoesTribRepo,
    FAvaliador,
    FSitTribService
  );
end;

procedure TTest_CalculoCbsIbsService_CompraGovernamental.teste_CBS_ComCompraGov_PopulaPAliqCBSVTribCBS;
var
  item: ItemCalculoInput;
  tratamento: TratamentoClassificacaoModel;
  resultado: ResultadoCbsIbs;
begin
  item := CriarItem(False);
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  CriarService();

  resultado := FService.Calcular(
    tbtCBS, 0, 0, item, tratamento, 0,
    TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegUniao, 50
  );

  // Aliquota efetiva = 0.25 * (1-0.1) * (1-50/100) = 0.1125.
  // Aliquota de compra gov = 0.1125 * 100 (movePointRight(2)) = 11.25; valor = 1000 * 0.1125 = 112.5.
  Assert.IsTrue(resultado.PossuiCompraGov(), 'CBS com compra gov deve possuir grupo de compra governamental');
  Assert.AreEqual(11.25, resultado.CompraGovernamental.PAliqCBS, 0.0001, 'pAliqCBS deve ser a aliquota efetiva deslocada 2 casas');
  Assert.AreEqual(112.5, resultado.CompraGovernamental.VTribCBS, 0.0001, 'vTribCBS deve ser o tributo devido');
  Assert.AreEqual(0, resultado.CompraGovernamental.PAliqIBSUF, 0.0001, 'pAliqIBSUF deve ser zero para CBS');
  Assert.AreEqual(0, resultado.CompraGovernamental.VTribIBSUF, 0.0001);
  Assert.AreEqual(0, resultado.CompraGovernamental.PAliqIBSMun, 0.0001);
  Assert.AreEqual(0, resultado.CompraGovernamental.VTribIBSMun, 0.0001);
end;

procedure TTest_CalculoCbsIbsService_CompraGovernamental.teste_IBSUF_ComCompraGov_PopulaPAliqIBSUFVTribIBSUF;
var
  item: ItemCalculoInput;
  tratamento: TratamentoClassificacaoModel;
  resultado: ResultadoCbsIbs;
begin
  item := CriarItem(False);
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  CriarService();

  resultado := FService.Calcular(
    tbtIBSUF, 0, 0, item, tratamento, 0,
    TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegEstado, 50
  );

  Assert.IsTrue(resultado.PossuiCompraGov());
  Assert.AreEqual(11.25, resultado.CompraGovernamental.PAliqIBSUF, 0.0001, 'pAliqIBSUF deve ser a aliquota efetiva deslocada 2 casas');
  Assert.AreEqual(112.5, resultado.CompraGovernamental.VTribIBSUF, 0.0001);
  Assert.AreEqual(0, resultado.CompraGovernamental.PAliqCBS, 0.0001, 'pAliqCBS deve ser zero para IBS UF');
  Assert.AreEqual(0, resultado.CompraGovernamental.VTribCBS, 0.0001);
  Assert.AreEqual(0, resultado.CompraGovernamental.PAliqIBSMun, 0.0001);
  Assert.AreEqual(0, resultado.CompraGovernamental.VTribIBSMun, 0.0001);
end;

procedure TTest_CalculoCbsIbsService_CompraGovernamental.teste_IBSMun_ComCompraGov_PopulaPAliqIBSMunVTribIBSMun;
var
  item: ItemCalculoInput;
  tratamento: TratamentoClassificacaoModel;
  resultado: ResultadoCbsIbs;
begin
  item := CriarItem(False);
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  CriarService();

  resultado := FService.Calcular(
    tbtIBSMun, 0, 0, item, tratamento, 0,
    TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegMunicipio, 50
  );

  Assert.IsTrue(resultado.PossuiCompraGov());
  Assert.AreEqual(11.25, resultado.CompraGovernamental.PAliqIBSMun, 0.0001, 'pAliqIBSMun deve ser a aliquota efetiva deslocada 2 casas');
  Assert.AreEqual(112.5, resultado.CompraGovernamental.VTribIBSMun, 0.0001);
  Assert.AreEqual(0, resultado.CompraGovernamental.PAliqCBS, 0.0001);
  Assert.AreEqual(0, resultado.CompraGovernamental.VTribCBS, 0.0001);
  Assert.AreEqual(0, resultado.CompraGovernamental.PAliqIBSUF, 0.0001, 'pAliqIBSUF deve ser zero para IBS Mun');
  Assert.AreEqual(0, resultado.CompraGovernamental.VTribIBSUF, 0.0001);
end;

procedure TTest_CalculoCbsIbsService_CompraGovernamental.teste_SemTpEnteGov_CompraGovernamentalNula;
var
  item: ItemCalculoInput;
  tratamento: TratamentoClassificacaoModel;
  resultado: ResultadoCbsIbs;
begin
  item := CriarItem(False);
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  CriarService();

  resultado := FService.Calcular(
    tbtCBS, 0, 0, item, tratamento, 0,
    TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegUnassigned, 0
  );

  Assert.IsFalse(resultado.PossuiCompraGov(), 'Sem tpEnteGov, o grupo de compra governamental deve ser nulo');
end;

procedure TTest_CalculoCbsIbsService_CompraGovernamental.teste_TributacaoRegular_ComCompraGov_NaoSuprimeGrupoReducao;
var
  item: ItemCalculoInput;
  tratamento: TratamentoClassificacaoModel;
  resultado: ResultadoCbsIbs;
begin
  item := CriarItem(True);
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  CriarService();

  resultado := FService.Calcular(
    tbtCBS, 0, 0, item, tratamento, 0,
    TratamentoClassificacaoModel.NullInstance(), True,
    EncodeDate(2027, 1, 1), tegUniao, 50
  );

  // Com tributacao regular + compra gov, o grupo de reducao NAO deve ser suprimido
  // (comportamento v0039), a desoneracao e gerada e os tributos devidos zerados.
  Assert.IsFalse(resultado.GrupoReducao.IsNull(), 'Grupo de reducao nao deve ser suprimido com tributacao regular + compra gov');
  Assert.AreEqual(11.25, resultado.GrupoReducao.PAliqEfet, 0.0001, 'pAliqEfet deve refletir a aliquota efetiva com redutor');
  Assert.AreEqual(10, resultado.GrupoReducao.PRedAliq, 0.0001, 'pRedAliq deve refletir o percentual de reducao');
  Assert.IsFalse(resultado.TributacaoRegular.IsNull(), 'Tributacao regular (desoneracao) deve ser gerada');
  Assert.AreEqual(0, resultado.TributoDevido, 0.0001, 'Tributo devido deve ser zerado sob tributacao regular');
  Assert.IsTrue(resultado.PossuiCompraGov());
end;

procedure TTest_CalculoCbsIbsService_CompraGovernamental.teste_PRedutorCompraGov_AplicadoNaAliquotaEfetiva;
var
  item: ItemCalculoInput;
  tratamento: TratamentoClassificacaoModel;
  semRedutor: ResultadoCbsIbs;
  comRedutor: ResultadoCbsIbs;
begin
  item := CriarItem(False);
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  CriarService();

  // pRedutor = 0: aliquota efetiva = 0.25 * 0.9 = 0.225 -> pAliqCBS = 22.5
  semRedutor := FService.Calcular(
    tbtCBS, 0, 0, item, tratamento, 0,
    TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegUniao, 0
  );

  // pRedutor = 50: aliquota efetiva = 0.25 * 0.9 * 0.5 = 0.1125 -> pAliqCBS = 11.25
  comRedutor := FService.Calcular(
    tbtCBS, 0, 0, item, tratamento, 0,
    TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegUniao, 50
  );

  Assert.AreEqual(22.5, semRedutor.CompraGovernamental.PAliqCBS, 0.0001, 'Sem redutor, aliquota efetiva deve ser 0.225 -> 22.5');
  Assert.AreEqual(11.25, comRedutor.CompraGovernamental.PAliqCBS, 0.0001, 'Com redutor de 50%, aliquota efetiva deve ser 0.1125 -> 11.25');
end;

{ TFakeSituacaoTributariaService }

function TFakeSituacaoTributariaService.ConsultarSituacaoTributariaPorCodigo(const CST: string;
  IdTributo: TipoTributoEnum; Data: TDate): SituacaoTributariaEtd;
begin
  Result := SituacaoTributariaEtd.Create(1, '000', 'Integral', False, False, True, False, False, False, False,
    EncodeDate(2026, 01, 01), DateNullable.NullInstance()
  );
end;

Initialization
  TDUnitX.RegisterTestFixture(TTest_CalculoCbsIbsService_CompraGovernamental);

end.
