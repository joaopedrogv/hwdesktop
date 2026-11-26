unit Teste_CasosFixosArredondamento;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  CalculoCbsIbsServiceUnit,
  AvaliadorExpressaoAritmeticaServiceUnit,
  IAvaliadorExpressaoAritmeticaServiceUnit,
  TratamentoTributarioEtdUnit,
  ClassificacaoTributariaCalculoModelUnit,
  TipoTributoEnumUnit,
  ItemCalculoInputUnit,
  ImpostoSeletivoInputUnit,
  TributacaoRegularInputUnit,
  TratamentoClassificacaoModelUnit,
  ResultadoCbsIbsUnit,
  TipoEnteGovernamentalEnumUnit,
  StringNullableUnit,
  CurrencyNullableUnit,
  DateAndTimeNullableUnit,
  ISituacaoTributariaServiceUnit,
  Teste_CalculoCbsIbsService_CadeiaDecimal;

type
  /// <summary>
  ///   Casos fixos oficiais de arredondamento de CBS/IBS no nivel de servico.
  ///   Cada valor publicado deve ser a unica rodada do numero que segue na conta.
  /// </summary>
  [TestFixture]
  TTest_CasosFixosArredondamento = class
  private
    FSitTribService: ISituacaoTributariaService;
    FAvaliador: IAvaliadorExpressaoAritmeticaService;
    FTratamentosTribRepo: TFakeCadeiaTratamentos;
    FClassificacoesTribRepo: TFakeCadeiaClassificacao;
    FAliquotaPadraoRepo: TFakeCadeiaAliquotaPadrao;
    FPercentualReducaoRepo: TFakeCadeiaPercentualReducao;
    FService: ICalculoCbsIbsService;

    procedure LiberarService;
    procedure Configurar(AliquotaPadrao, PercentualReducao: Currency;
      PossuiReducao, InGrupoReducao: Boolean;
      const ExpressaoAliquotaEfetiva, ExpressaoTributoDevido: string);
    function Calcular(TipoTributo: TipoTributoEnum; BaseCalculo: Currency): ResultadoCbsIbs;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_t1_EmpateParaOPar;

    [Test]
    procedure teste_t2_VIbsSomaDasPartesPublicadas;

    [Test]
    procedure teste_t3_TotaisSomaDosItensPublicados;

    [Test]
    procedure teste_t4_ValorPelaAliquotaEfetivaPublicada;

    [Test]
    procedure teste_issueTotalCbsSomaDosItens;

    [Test]
    procedure teste_BaseNegativaPequenaZeradaAntesDoTributo;
  end;

implementation

{ TTest_CasosFixosArredondamento }

procedure TTest_CasosFixosArredondamento.Setup;
begin
  FAvaliador := AvaliadorExpressaoAritmeticaService.Create();
  FSitTribService := TFakeCadeiaSituacaoTributaria.Create();
end;

procedure TTest_CasosFixosArredondamento.TearDown;
begin
  LiberarService;
  FAvaliador := nil;
  FSitTribService := nil;
end;

procedure TTest_CasosFixosArredondamento.LiberarService;
begin
  FService := nil;
  FreeAndNil(FPercentualReducaoRepo);
  FreeAndNil(FAliquotaPadraoRepo);
  FreeAndNil(FClassificacoesTribRepo);
  FreeAndNil(FTratamentosTribRepo);
end;

procedure TTest_CasosFixosArredondamento.Configurar(AliquotaPadrao, PercentualReducao: Currency;
  PossuiReducao, InGrupoReducao: Boolean;
  const ExpressaoAliquotaEfetiva, ExpressaoTributoDevido: string);
var
  tratamento: TratamentoTributarioEtd;
  expressaoEfetiva: StringNullable;
  expressaoTributo: string;
begin
  LiberarService;

  if ExpressaoAliquotaEfetiva = '' then
  begin
    expressaoEfetiva := StringNullable.Create('aliquota');
    expressaoTributo := 'baseCalculo*aliquotaEfetiva';
  end
  else
  begin
    expressaoEfetiva := StringNullable.Create(ExpressaoAliquotaEfetiva);
    expressaoTributo := 'baseCalculo*aliquotaEfetiva';
  end;

  tratamento := TratamentoTributarioEtd.Create(
    1,
    'Caso fixo de arredondamento de CBS/IBS',
    StringNullable.Create('aliquota'),
    expressaoEfetiva,
    'baseCalculoInformada',
    expressaoTributo,
    ExpressaoTributoDevido,
    StringNullable.NullInstance(),
    StringNullable.NullInstance(),
    False, False, PossuiReducao, False, False, False,
    0, DateNullable.NullInstance()
  );

  FTratamentosTribRepo := TFakeCadeiaTratamentos.Create(tratamento);
  FClassificacoesTribRepo := TFakeCadeiaClassificacao.Create(
    ClassificacaoTributariaCalculoModel.Create(
      1, '000001', 'Padrao',
      False, False, False, False,
      InGrupoReducao
    )
  );
  FAliquotaPadraoRepo := TFakeCadeiaAliquotaPadrao.Create(AliquotaPadrao);
  FPercentualReducaoRepo := TFakeCadeiaPercentualReducao.Create(CurrencyNullable.Create(PercentualReducao));

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

function TTest_CasosFixosArredondamento.Calcular(TipoTributo: TipoTributoEnum;
  BaseCalculo: Currency): ResultadoCbsIbs;
var
  item: ItemCalculoInput;
begin
  item := ItemCalculoInput.Create(
    1, '00000000', '000001', '000',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.NullInstance(),
    CurrencyNullable.Create(BaseCalculo),
    CurrencyNullable.Create(1),
    'UN'
  );

  Result := FService.Calcular(
    TipoTributo, 0, 0, item, TratamentoClassificacaoModel.Create(1, 1, False, False),
    0, TratamentoClassificacaoModel.NullInstance(), False,
    EncodeDate(2027, 1, 1), tegUnassigned, 0
  );
end;

procedure TTest_CasosFixosArredondamento.teste_t1_EmpateParaOPar;
var
  cbs, ibsUf: ResultadoCbsIbs;
begin
  // T1: base 25,00 em 2026; CBS 0,90% e IBSUF 0,10%.
  // 25,00 * 0,009 = 0,225 -> HALF_EVEN publica 0,22 (empate para o par).
  Configurar(0.90, 0, False, False, '', 'tributoCalculado');
  cbs := Calcular(tbtCBS, 25.00);
  Assert.AreEqual(0.22, cbs.TributoCalculado, 0.0000001, 'vCBS publicado');
  Assert.AreEqual(0.22, cbs.TributoDevido, 0.0000001, 'vCBS devido');

  // 25,00 * 0,001 = 0,025 -> HALF_EVEN publica 0,02.
  Configurar(0.10, 0, False, False, '', 'tributoCalculado');
  ibsUf := Calcular(tbtIBSUF, 25.00);
  Assert.AreEqual(0.02, ibsUf.TributoCalculado, 0.0000001, 'vIBSUF publicado');
  Assert.AreEqual(0.02, ibsUf.TributoDevido, 0.0000001, 'vIBSUF devido');
end;

procedure TTest_CasosFixosArredondamento.teste_t2_VIbsSomaDasPartesPublicadas;
var
  cbs, ibsUf, ibsMun: ResultadoCbsIbs;
begin
  // T2: base 12,00 em 2027; CBS 8,80%, IBSUF 0,05% e IBSMun 0,05%.
  Configurar(8.80, 0, False, False, '', 'tributoCalculado');
  cbs := Calcular(tbtCBS, 12.00);
  Assert.AreEqual(1.06, cbs.TributoDevido, 0.0000001, 'vCBS 12,00 * 8,80%');

  Configurar(0.05, 0, False, False, '', 'tributoCalculado');
  ibsUf := Calcular(tbtIBSUF, 12.00);
  ibsMun := Calcular(tbtIBSMun, 12.00);
  Assert.AreEqual(0.01, ibsUf.TributoDevido, 0.0000001, 'vIBSUF publicado');
  Assert.AreEqual(0.01, ibsMun.TributoDevido, 0.0000001, 'vIBSMun publicado');
  Assert.AreEqual(0.02, ibsUf.TributoDevido + ibsMun.TributoDevido, 0.0000001,
    'vIBS e a soma das partes publicadas');
end;

procedure TTest_CasosFixosArredondamento.teste_t3_TotaisSomaDosItensPublicados;
var
  item1, item2: ResultadoCbsIbs;
begin
  // T3: dois itens de 14,00 em 2026 com CBS de 0,90%.
  // 14,00 * 0,009 = 0,126 -> publica 0,13 por item; total 0,26.
  Configurar(0.90, 0, False, False, '', 'tributoCalculado');
  item1 := Calcular(tbtCBS, 14.00);
  item2 := Calcular(tbtCBS, 14.00);
  Assert.AreEqual(0.13, item1.TributoDevido, 0.0000001, 'vCBS do item 1');
  Assert.AreEqual(0.13, item2.TributoDevido, 0.0000001, 'vCBS do item 2');
  Assert.AreEqual(0.26, item1.TributoDevido + item2.TributoDevido, 0.0000001,
    'total e a soma dos itens publicados');
end;

procedure TTest_CasosFixosArredondamento.teste_t4_ValorPelaAliquotaEfetivaPublicada;
var
  resultado: ResultadoCbsIbs;
begin
  // T4: base 1.000.000,00; CBS 8,8123% com reducao de 60%.
  // 8,8123 * 0,40 = 3,52492 -> publica 3,5249; 1.000.000,00 * 0,035249 = 35.249,00.
  Configurar(8.8123, 60, True, True,
    'aliquota*(1-percentualReducao)', 'tributoCalculado');
  resultado := Calcular(tbtCBS, 1000000.00);

  Assert.AreEqual(1000000.00, resultado.BaseCalculo.Value, 0.0001, 'vBC');
  Assert.AreEqual(8.8123, resultado.Aliquota, 0.0001, 'pCBS');
  Assert.IsFalse(resultado.GrupoReducao.IsNull(), 'gRed presente');
  Assert.AreEqual(3.5249, resultado.GrupoReducao.PAliqEfet, 0.0001, 'pAliqEfet');
  Assert.AreEqual(35249.00, resultado.TributoCalculado, 0.0001, 'vCBS calculado');
  Assert.AreEqual(35249.00, resultado.TributoDevido, 0.0001, 'vCBS devido');
end;

procedure TTest_CasosFixosArredondamento.teste_issueTotalCbsSomaDosItens;
var
  item1, item2: ResultadoCbsIbs;
begin
  // Issue: itens de 2.315,79 e 690,52 em 2026 com CBS de 0,90%.
  Configurar(0.90, 0, False, False, '', 'tributoCalculado');
  item1 := Calcular(tbtCBS, 2315.79);
  item2 := Calcular(tbtCBS, 690.52);
  Assert.AreEqual(20.84, item1.TributoDevido, 0.0000001, 'vCBS do item 1');
  Assert.AreEqual(6.21, item2.TributoDevido, 0.0000001, 'vCBS do item 2');
  Assert.AreEqual(27.05, item1.TributoDevido + item2.TributoDevido, 0.0000001,
    'total da CBS');

  // IBSUF de 0,10%: 2,32 e 0,69; total 3,01.
  Configurar(0.10, 0, False, False, '', 'tributoCalculado');
  item1 := Calcular(tbtIBSUF, 2315.79);
  item2 := Calcular(tbtIBSUF, 690.52);
  Assert.AreEqual(2.32, item1.TributoDevido, 0.0000001, 'vIBSUF do item 1');
  Assert.AreEqual(0.69, item2.TributoDevido, 0.0000001, 'vIBSUF do item 2');
  Assert.AreEqual(3.01, item1.TributoDevido + item2.TributoDevido, 0.0000001,
    'total do IBSUF');
end;

procedure TTest_CasosFixosArredondamento.teste_BaseNegativaPequenaZeradaAntesDoTributo;
var
  resultado: ResultadoCbsIbs;
begin
  // Java CalculoCbsIbsService:370-380: -0,005 arredonda para 0,00 e e esse
  // valor que segue para o tributo calculado.
  Configurar(0.90, 0, False, False, '', 'tributoCalculado');
  resultado := Calcular(tbtCBS, -0.005);

  Assert.AreEqual(0.00, resultado.BaseCalculo.Value, 0.0000001, 'base publicada');
  Assert.AreEqual(0.00, resultado.TributoCalculado, 0.0000001, 'tributo calculado');
  Assert.AreEqual(0.00, resultado.TributoDevido, 0.0000001, 'tributo devido');
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_CasosFixosArredondamento);

end.