unit Teste_CalculoCbsIbsService_CadeiaDecimal;

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
  DateAndTimeNullableUnit,
  ISituacaoTributariaServiceUnit,
  SituacaoTributariaEtdUnit;

type
  TFakeCadeiaTratamentos = class(ITratamentosTributariosRepository)
  private
    FTratamento: TratamentoTributarioEtd;
  public
    constructor Create(const Tratamento: TratamentoTributarioEtd); reintroduce;
    function ObterTratamentoTributario(Id: Integer): TratamentoTributarioEtd; override;
  end;

  TFakeCadeiaClassificacao = class(IClassificacaoTributariaRepository)
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

  TFakeCadeiaAliquotaPadrao = class(IAliquotaPadraoRepository)
  private
    FValorAplicavel: Currency;
  public
    constructor Create(ValorAplicavel: Currency); reintroduce;
    function ObterAliquota(
      TipoTributo: TipoTributoEnum; const CUF, CMun: IntegerNullable; Data: TDate
    ): AliquotaResultadoModel; override;
  end;

  TFakeCadeiaPercentualReducao = class(IPercentualReducaoRepository)
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

  TFakeCadeiaSituacaoTributaria = class(TInterfacedObject, ISituacaoTributariaService)
  public
    function ConsultarSituacaoTributariaPorCodigo(
      const CST: string; IdTributo: TipoTributoEnum; Data: TDate
    ): SituacaoTributariaEtd;
  end;

  /// <summary>
  ///   Cadeia decimal de CBS/IBS no nivel de servico: base, aliquota e tributo
  ///   calculado/devido seguem em DecimalCalculo ate a publicacao em ResultadoCbsIbs.
  /// </summary>
  [TestFixture]
  TTest_CalculoCbsIbsService_CadeiaDecimal = class
  private
    FSitTribService: ISituacaoTributariaService;
    FAvaliador: IAvaliadorExpressaoAritmeticaService;
    FTratamentosTribRepo: TFakeCadeiaTratamentos;
    FClassificacoesTribRepo: TFakeCadeiaClassificacao;
    FAliquotaPadraoRepo: TFakeCadeiaAliquotaPadrao;
    FPercentualReducaoRepo: TFakeCadeiaPercentualReducao;
    FService: ICalculoCbsIbsService;

    function CriarTratamento(const ExpressaoAliquotaEfetiva: string;
      PossuiPercentualReducao: Boolean): TratamentoTributarioEtd;
    function CriarItem: ItemCalculoInput;
    procedure CriarService(AliquotaPadrao: Currency;
      const ExpressaoAliquotaEfetiva: string; PossuiPercentualReducao: Boolean);
    function CriarTratamentoMonofasico(
      const ExpressaoTributoCalculado: string): TratamentoTributarioEtd;
    function CriarItemComQuantidade(const Quantidade: CurrencyNullable): ItemCalculoInput;
    procedure CriarServiceMonofasico(const ExpressaoTributoCalculado: string);
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_CBS_Base247_30_TributoCalculadoPublicado;

    [Test]
    procedure teste_IBSUF_Base247_30_TributoCalculadoPublicado;

    [Test]
    procedure teste_AliquotaDecimal_RealimentaAliquotaEfetiva;

    [Test]
    procedure teste_Monofasia_VariacaoEAC5_Formula1;

    [Test]
    procedure teste_QuantidadeAusente_UsaEfetiva1;
  end;

implementation

{ TFakeCadeiaTratamentos }

constructor TFakeCadeiaTratamentos.Create(const Tratamento: TratamentoTributarioEtd);
begin
  inherited Create(nil);
  FTratamento := Tratamento;
end;

function TFakeCadeiaTratamentos.ObterTratamentoTributario(Id: Integer): TratamentoTributarioEtd;
begin
  Result := FTratamento;
end;

{ TFakeCadeiaClassificacao }

constructor TFakeCadeiaClassificacao.Create(const Calculo: ClassificacaoTributariaCalculoModel);
begin
  inherited Create(nil);
  FCalculo := Calculo;
end;

function TFakeCadeiaClassificacao.ObterClassificacaoTributaria(
  const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
): ClassificacaoTributariaModel;
begin
  Result := ClassificacaoTributariaModel.NullInstance();
end;

function TFakeCadeiaClassificacao.ObterClassificacaoCalculo(Id: Integer): ClassificacaoTributariaCalculoModel;
begin
  Result := FCalculo;
end;

function TFakeCadeiaClassificacao.ObterTodasEAtual(
  const CClassTribAtual: string; TipoTributo: TipoTributoEnum
): ClassificacoesTributariasEtd;
begin
  Result := nil;
end;

function TFakeCadeiaClassificacao.ObterClassificacaoCbsIbs(
  const CClassTrib: string; Data: TDate
): ClassificacaoTributariaEtd;
begin
  Result := nil;
end;

{ TFakeCadeiaAliquotaPadrao }

constructor TFakeCadeiaAliquotaPadrao.Create(ValorAplicavel: Currency);
begin
  inherited Create(nil);
  FValorAplicavel := ValorAplicavel;
end;

function TFakeCadeiaAliquotaPadrao.ObterAliquota(
  TipoTributo: TipoTributoEnum; const CUF, CMun: IntegerNullable; Data: TDate
): AliquotaResultadoModel;
begin
  Result := AliquotaResultadoModel.Create(
    CurrencyNullable.Create(FValorAplicavel),
    CurrencyNullable.NullInstance(),
    StringNullable.NullInstance()
  );
end;

{ TFakeCadeiaPercentualReducao }

constructor TFakeCadeiaPercentualReducao.Create(const Valor: CurrencyNullable);
begin
  inherited Create(nil);
  FValor := Valor;
end;

function TFakeCadeiaPercentualReducao.ObterporClassTribETributo(
  ClassificacaoTributariaId: Integer; TipoTributo: TipoTributoEnum; Data: TDate
): CurrencyNullable;
begin
  Result := FValor;
end;

function TFakeCadeiaPercentualReducao.ObterporCClassTribETributo(
  const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
): PercentualReducaoEtd;
begin
  Result := PercentualReducaoEtd.NullInstance();
end;

{ TTest_CalculoCbsIbsService_CadeiaDecimal }

procedure TTest_CalculoCbsIbsService_CadeiaDecimal.Setup;
begin
  FAvaliador := AvaliadorExpressaoAritmeticaService.Create();
  FSitTribService := TFakeCadeiaSituacaoTributaria.Create();
end;

procedure TTest_CalculoCbsIbsService_CadeiaDecimal.TearDown;
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
  FSitTribService := nil;
end;

function TTest_CalculoCbsIbsService_CadeiaDecimal.CriarTratamento(
  const ExpressaoAliquotaEfetiva: string; PossuiPercentualReducao: Boolean
): TratamentoTributarioEtd;
var
  sn: StringNullable;
  dn: DateNullable;
begin
  sn := StringNullable.NullInstance();
  dn := DateNullable.NullInstance();
  Result := TratamentoTributarioEtd.Create(
    1,
    'Tratamento da cadeia decimal de CBS/IBS',
    StringNullable.Create('aliquota'),
    StringNullable.Create(ExpressaoAliquotaEfetiva),
    'baseCalculoInformada',
    'baseCalculo*aliquotaEfetiva',
    'tributoCalculado',
    sn, sn, // percentual diferimento / valor diferimento: em branco
    False, False, PossuiPercentualReducao, False, False, False,
    0, dn
  );
end;

function TTest_CalculoCbsIbsService_CadeiaDecimal.CriarItem: ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    1, '00000000', '000001', '000',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.NullInstance(),
    CurrencyNullable.Create(247.30), // base oficial do CBS/IBS quando o IS publicado e 47,30 sobre 200,00
    CurrencyNullable.Create(1),
    'UN'
  );
end;

function TTest_CalculoCbsIbsService_CadeiaDecimal.CriarTratamentoMonofasico(
  const ExpressaoTributoCalculado: string): TratamentoTributarioEtd;
var
  sn: StringNullable;
  dn: DateNullable;
begin
  sn := StringNullable.NullInstance();
  dn := DateNullable.NullInstance();
  Result := TratamentoTributarioEtd.Create(
    1,
    'Tratamento monofasico da cadeia decimal',
    StringNullable.Create(
      '(1-pBio)*aliquotaAdRemPrincipal+pBio*aliquotaAdRemSecundaria'),
    StringNullable.Create('aliquotaAdRemSecundaria'),
    'quantidade',
    ExpressaoTributoCalculado,
    'quantidade*aliquota',
    sn, sn,
    False, False, False, False, False, True,
    0, dn
  );
end;

function TTest_CalculoCbsIbsService_CadeiaDecimal.CriarItemComQuantidade(
  const Quantidade: CurrencyNullable): ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    1, '00000000', '000001', '000',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.NullInstance(),
    CurrencyNullable.Create(0),
    Quantidade,
    'UN'
  );
end;

procedure TTest_CalculoCbsIbsService_CadeiaDecimal.CriarServiceMonofasico(
  const ExpressaoTributoCalculado: string);
begin
  FTratamentosTribRepo := TFakeCadeiaTratamentos.Create(
    CriarTratamentoMonofasico(ExpressaoTributoCalculado));
  FClassificacoesTribRepo := TFakeCadeiaClassificacao.Create(
    ClassificacaoTributariaCalculoModel.Create(
      1, '000001', 'Uniforme setorial',
      True, False, False, False, // monofasia padrao
      False));
  FAliquotaPadraoRepo := TFakeCadeiaAliquotaPadrao.Create(0);
  FPercentualReducaoRepo := TFakeCadeiaPercentualReducao.Create(CurrencyNullable.Create(10));

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

procedure TTest_CalculoCbsIbsService_CadeiaDecimal.CriarService(AliquotaPadrao: Currency;
  const ExpressaoAliquotaEfetiva: string; PossuiPercentualReducao: Boolean);
begin
  FTratamentosTribRepo := TFakeCadeiaTratamentos.Create(
    CriarTratamento(ExpressaoAliquotaEfetiva, PossuiPercentualReducao));
  FClassificacoesTribRepo := TFakeCadeiaClassificacao.Create(
    ClassificacaoTributariaCalculoModel.Create(
      1, '000001', 'Padrao',
      False, False, False, False, // monofasia padrao/reten/ret/diferimento
      False // inGrupoReducao
    ));
  FAliquotaPadraoRepo := TFakeCadeiaAliquotaPadrao.Create(AliquotaPadrao);
  FPercentualReducaoRepo := TFakeCadeiaPercentualReducao.Create(CurrencyNullable.Create(10));

  FService := CalculoCbsIbsService.Create(
    FPercentualReducaoRepo,
    nil, // aliquota referencia: nao usada em taPadrao
    FAliquotaPadraoRepo,
    nil, // aliquota ad rem produto: nao usada sem monofasia
    nil, // aliquota ad valorem servico: nao usada em taPadrao
    FTratamentosTribRepo,
    FClassificacoesTribRepo,
    FAvaliador,
    FSitTribService
  );
end;

procedure TTest_CalculoCbsIbsService_CadeiaDecimal.teste_CBS_Base247_30_TributoCalculadoPublicado;
var
  item: ItemCalculoInput;
  resultado: ResultadoCbsIbs;
begin
  // v0073 (T07 de 2027): base 247,30 e aliquota 8,40%.
  // 247,30 * 0,084 = 20,7732; o I03 arredonda uma vez para 20,77 e esse
  // valor publicado segue para o tributo devido.
  CriarService(8.4, 'aliquota', False);
  item := CriarItem;

  resultado := FService.Calcular(
    tbtCBS, 0, 0, item, TratamentoClassificacaoModel.Create(1, 1, False, False),
    0, TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegUnassigned, 0
  );

  Assert.AreEqual(247.30, resultado.BaseCalculo.Value, 0.0001);
  Assert.AreEqual(8.4, resultado.Aliquota, 0.0001);
  Assert.AreEqual(20.77, resultado.TributoCalculado, 0.0000001);
  Assert.AreEqual(20.77, resultado.TributoDevido, 0.0000001);
end;

procedure TTest_CalculoCbsIbsService_CadeiaDecimal.teste_IBSUF_Base247_30_TributoCalculadoPublicado;
var
  item: ItemCalculoInput;
  resultado: ResultadoCbsIbs;
begin
  // v0073 (T07 de 2027): base 247,30 com IBSUF de 0,05% -> 0,12365; o I03
  // publica 0,12 e esse valor segue para o tributo devido.
  CriarService(0.05, 'aliquota', False);
  item := CriarItem;

  resultado := FService.Calcular(
    tbtIBSUF, 0, 0, item, TratamentoClassificacaoModel.Create(1, 1, False, False),
    0, TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegUnassigned, 0
  );

  Assert.AreEqual(247.30, resultado.BaseCalculo.Value, 0.0001);
  Assert.AreEqual(0.05, resultado.Aliquota, 0.0001);
  Assert.AreEqual(0.12, resultado.TributoCalculado, 0.0000001);
end;

procedure TTest_CalculoCbsIbsService_CadeiaDecimal.teste_AliquotaDecimal_RealimentaAliquotaEfetiva;
var
  item: ItemCalculoInput;
  resultado: ResultadoCbsIbs;
begin
  // A aliquota calculada volta ao avaliador como DecimalCalculo (SetAliquota):
  // 0,084 * (1 - 0,10) = 0,0756 e a aliquota efetiva que multiplica 247,30.
  // 247,30 * 0,0756 = 18,69588; publicado a 2 casas = 18,70.
  CriarService(8.4, 'aliquota*(1-percentualReducao)', True);
  item := CriarItem;

  resultado := FService.Calcular(
    tbtCBS, 0, 0, item, TratamentoClassificacaoModel.Create(1, 1, False, False),
    0, TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegUnassigned, 0
  );

  Assert.AreEqual(247.30, resultado.BaseCalculo.Value, 0.0001);
  Assert.AreEqual(18.70, resultado.TributoCalculado, 0.0000001);
end;

procedure TTest_CalculoCbsIbsService_CadeiaDecimal.teste_Monofasia_VariacaoEAC5_Formula1;
var
  item: ItemCalculoInput;
  resultado: ResultadoCbsIbs;
begin
  // V0012 (TRTR 26): tributoCalculado usa variacaoPontoPercentual = 5
  // (v0073, VARIACAO_EAC), pBio = 0,30 e aliquotaAdRemSecundaria = 0,1922.
  // A expressao resulta 0,0050843764... e o I03 publica 0,01.
  CriarServiceMonofasico(
    '(variacaoPontoPercentual/100)*quantidade*(pBio/(1-pBio))*aliquotaAdRemSecundaria');
  item := CriarItemComQuantidade(CurrencyNullable.Create(1.2345));

  resultado := FService.Calcular(
    tbtCBS, 0, 0, item, TratamentoClassificacaoModel.Create(1, 1, False, False),
    0, TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegUnassigned, 0
  );

  Assert.AreEqual(1.2345, resultado.BaseCalculo.Value, 0.0001);
  Assert.AreEqual(0.01, resultado.TributoCalculado, 0.000000000001);
end;

procedure TTest_CalculoCbsIbsService_CadeiaDecimal.teste_QuantidadeAusente_UsaEfetiva1;
var
  item: ItemCalculoInput;
  resultado: ResultadoCbsIbs;
begin
  CriarService(8.4, 'aliquota', False);
  item := CriarItemComQuantidade(CurrencyNullable.NullInstance());

  resultado := FService.Calcular(
    tbtCBS, 0, 0, item, TratamentoClassificacaoModel.Create(1, 1, False, False),
    0, TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegUnassigned, 0
  );

  Assert.AreEqual(1.0, resultado.Quantidade, 0.0001,
    'quantidade ausente deve assumir 1 no calculo');
end;

{ TFakeCadeiaSituacaoTributaria }

function TFakeCadeiaSituacaoTributaria.ConsultarSituacaoTributariaPorCodigo(
  const CST: string; IdTributo: TipoTributoEnum; Data: TDate
): SituacaoTributariaEtd;
begin
  Result := SituacaoTributariaEtd.Create(1, '000', 'Integral', False, False, True, False, False, False, False,
    EncodeDate(2026, 01, 01), DateNullable.NullInstance()
  );
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_CalculoCbsIbsService_CadeiaDecimal);

end.