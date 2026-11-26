unit Teste_CalculoImpostoSeletivo_Precisao;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  CalculoImpostoSeletivoServiceUnit,
  AvaliadorExpressaoAritmeticaServiceUnit,
  IAvaliadorExpressaoAritmeticaServiceUnit,
  ITratamentosTributariosRepositoryUnit,
  TratamentoTributarioEtdUnit,
  TratamentoClassificacaoModelUnit,
  AliquotaImpostoSeletivoModelUnit,
  ImpostoSeletivoModelUnit,
  ImpostoSeletivoInputUnit,
  ItemCalculoInputUnit,
  TributacaoRegularInputUnit,
  StringNullableUnit,
  CurrencyNullableUnit,
  DateAndTimeNullableUnit;

type
  TFakeTratamentosTributariosRepository = class(ITratamentosTributariosRepository)
  private
    FTratamento: TratamentoTributarioEtd;
  public
    constructor Create(const Tratamento: TratamentoTributarioEtd); reintroduce;
    function ObterTratamentoTributario(Id: Integer): TratamentoTributarioEtd; override;
  end;

  [TestFixture]
  TTest_CalculoImpostoSeletivo_Precisao = class
  private
    FAvaliador: IAvaliadorExpressaoAritmeticaService;
    FRepo: TFakeTratamentosTributariosRepository;
    FService: ICalculoImpostoSeletivoService;

    function CriarTratamento(
      const ExpressaoBaseCalculo, ExpressaoTributoCalculado, ExpressaoTributoDevido: string
    ): TratamentoTributarioEtd;

    procedure CriarService(const Tratamento: TratamentoTributarioEtd);
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_AliquotaAdValorem_DivididaPorCem_PisCorreto;

    [Test]
    procedure teste_BaseCalculoInformada_Fracionaria_Saida2Casas;

    [Test]
    procedure teste_TributoCalculado_Composto_UsaPrecisaoInterna;

    [Test]
    procedure teste_AliquotaAdValoremNula_NaoLanca;

    [Test]
    procedure teste_CadeiaDecimal_ValoresOficiais;
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

{ TTest_CalculoImpostoSeletivo_Precisao }

procedure TTest_CalculoImpostoSeletivo_Precisao.Setup;
begin
  FAvaliador := AvaliadorExpressaoAritmeticaService.Create();
end;

procedure TTest_CalculoImpostoSeletivo_Precisao.TearDown;
begin
  FService := nil;
  FRepo.Free;
  FRepo := nil;
  FAvaliador := nil;
end;

function TTest_CalculoImpostoSeletivo_Precisao.CriarTratamento(
  const ExpressaoBaseCalculo, ExpressaoTributoCalculado, ExpressaoTributoDevido: string
): TratamentoTributarioEtd;
var
  sn: StringNullable;
  dn: DateNullable;
begin
  sn := StringNullable.Create('');
  dn := DateNullable.NullInstance();
  Result := TratamentoTributarioEtd.Create(
    1, 'Tratamento de teste de precisao',
    sn, sn, // expressao aliquota / aliquota efetiva: em branco (ignoradas)
    ExpressaoBaseCalculo,
    ExpressaoTributoCalculado,
    ExpressaoTributoDevido,
    sn, sn, // percentual diferimento / valor diferimento: em branco
    False, False, False, False, False, False,
    0, dn
  );
end;

procedure TTest_CalculoImpostoSeletivo_Precisao.CriarService(const Tratamento: TratamentoTributarioEtd);
begin
  FRepo := TFakeTratamentosTributariosRepository.Create(Tratamento);
  FService := CalculoImpostoSeletivoService.Create(FRepo, FAvaliador);
end;

procedure TTest_CalculoImpostoSeletivo_Precisao.teste_AliquotaAdValorem_DivididaPorCem_PisCorreto;
var
  item: ItemCalculoInput;
  isInput: ImpostoSeletivoInput;
  tratamento: TratamentoClassificacaoModel;
  aliquota: AliquotaImpostoSeletivoModel;
  resultado: ImpostoSeletivoModel;
begin
  isInput := ImpostoSeletivoInput.Create('000', '000002', CurrencyNullable.Create(200), CurrencyNullable.Create(1), 'UN', CurrencyNullable.NullInstance());
  item := ItemCalculoInput.Create(1, '000000000', '000002', '000', isInput, TributacaoRegularInput.NullInstance());
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  aliquota := AliquotaImpostoSeletivoModel.Create(CurrencyNullable.Create(25), CurrencyNullable.Create(0), 'UN');

  CriarService(CriarTratamento('baseCalculoInformada', 'baseCalculoInformada', ''));

  resultado := FService.Calcular(item, tratamento, aliquota, 0);

  // 25 / 100 -> 0.25 -> movePointRight(2) = 25 (HALF_EVEN a 4 casas)
  Assert.AreEqual(25.0, resultado.PIS, 0.0001);
  Assert.AreEqual(200.0, resultado.VBCIS, 0.0001);
end;

procedure TTest_CalculoImpostoSeletivo_Precisao.teste_BaseCalculoInformada_Fracionaria_Saida2Casas;
var
  item: ItemCalculoInput;
  isInput: ImpostoSeletivoInput;
  tratamento: TratamentoClassificacaoModel;
  aliquota: AliquotaImpostoSeletivoModel;
  resultado: ImpostoSeletivoModel;
begin
  // baseCalculoInformada com 3 casas: sao preservadas internamente (variavel unica);
  // a saida (VBCIS) usa HALF_EVEN: 100.125 -> 100.12
  // (Teste_ArredondamentoUtils / ArredondamentoUtils.java).
  isInput := ImpostoSeletivoInput.Create('000', '000002', CurrencyNullable.Create(100.125), CurrencyNullable.Create(1), 'UN', CurrencyNullable.NullInstance());
  item := ItemCalculoInput.Create(1, '000000000', '000002', '000', isInput, TributacaoRegularInput.NullInstance());
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  aliquota := AliquotaImpostoSeletivoModel.Create(CurrencyNullable.Create(0), CurrencyNullable.Create(0), 'UN');

  CriarService(CriarTratamento('baseCalculoInformada', 'baseCalculoInformada', ''));

  resultado := FService.Calcular(item, tratamento, aliquota, 0);

  Assert.AreEqual(100.12, resultado.VBCIS, 0.0001);
end;

procedure TTest_CalculoImpostoSeletivo_Precisao.teste_TributoCalculado_Composto_UsaPrecisaoInterna;
var
  item: ItemCalculoInput;
  isInput: ImpostoSeletivoInput;
  tratamento: TratamentoClassificacaoModel;
  aliquota: AliquotaImpostoSeletivoModel;
  resultado: ImpostoSeletivoModel;
begin
  // baseCalculo*aliquotaAdValorem + quantidade*aliquotaAdRem
  // = 200*0.25 + 1*0.5 = 50.5 (conta exata; saida HALF_EVEN)
  isInput := ImpostoSeletivoInput.Create('000', '000002', CurrencyNullable.Create(200), CurrencyNullable.Create(1), 'UN', CurrencyNullable.NullInstance());
  item := ItemCalculoInput.Create(1, '000000000', '000002', '000', isInput, TributacaoRegularInput.NullInstance());
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  aliquota := AliquotaImpostoSeletivoModel.Create(CurrencyNullable.Create(25), CurrencyNullable.Create(0.5), 'UN');

  CriarService(CriarTratamento(
    'baseCalculoInformada',
    'baseCalculo*aliquotaAdValorem+quantidade*aliquotaAdRem',
    'tributoCalculado'
  ));

  resultado := FService.Calcular(item, tratamento, aliquota, 0);

  Assert.AreEqual(200.0, resultado.VBCIS, 0.0001);
  Assert.AreEqual(25.0, resultado.PIS, 0.0001);
  Assert.AreEqual(0.5, resultado.PISEspec, 0.0001);
  Assert.AreEqual(50.5, resultado.VIS, 0.0001);
  Assert.AreEqual(1.0, resultado.QTrib, 0.0001);
end;

procedure TTest_CalculoImpostoSeletivo_Precisao.teste_AliquotaAdValoremNula_NaoLanca;
var
  item: ItemCalculoInput;
  isInput: ImpostoSeletivoInput;
  tratamento: TratamentoClassificacaoModel;
  aliquota: AliquotaImpostoSeletivoModel;
  resultado: ImpostoSeletivoModel;
begin
  // Aliquota ad valorem nula nao deve lancar excecao (null-safe) e resulta em PIS = 0
  isInput := ImpostoSeletivoInput.Create('000', '000002', CurrencyNullable.Create(100), CurrencyNullable.Create(1), 'UN', CurrencyNullable.NullInstance());
  item := ItemCalculoInput.Create(1, '000000000', '000002', '000', isInput, TributacaoRegularInput.NullInstance());
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  aliquota := AliquotaImpostoSeletivoModel.Create(CurrencyNullable.NullInstance(), CurrencyNullable.NullInstance(), 'UN');

  CriarService(CriarTratamento('baseCalculoInformada', 'baseCalculoInformada', ''));

  resultado := FService.Calcular(item, tratamento, aliquota, 0);

  Assert.AreEqual(0.0, resultado.PIS, 0.0001);
  Assert.AreEqual(100.0, resultado.VBCIS, 0.0001);
end;

procedure TTest_CalculoImpostoSeletivo_Precisao.teste_CadeiaDecimal_ValoresOficiais;
var
  item: ItemCalculoInput;
  isInput: ImpostoSeletivoInput;
  tratamento: TratamentoClassificacaoModel;
  aliquota: AliquotaImpostoSeletivoModel;
  resultado: ImpostoSeletivoModel;
begin
  // v0073 (T01/T02 de 2027): BC 200, ad valorem 13 e ad rem 21,30 resultam em
  // vBCIS 200,00, pIS 13,00, adRemIS 21,30 e vIS 47,30 = 200 * 0,13 + 1 * 21,30.
  isInput := ImpostoSeletivoInput.Create('000', '000002', CurrencyNullable.Create(200), CurrencyNullable.Create(1), 'UN', CurrencyNullable.NullInstance());
  item := ItemCalculoInput.Create(1, '000000000', '000002', '000', isInput, TributacaoRegularInput.NullInstance());
  tratamento := TratamentoClassificacaoModel.Create(1, 1, False, False);
  aliquota := AliquotaImpostoSeletivoModel.Create(
    CurrencyNullable.Create(13), CurrencyNullable.Create(21.30), 'UN');

  CriarService(CriarTratamento(
    'baseCalculoInformada',
    'baseCalculo*aliquotaAdValorem+quantidade*aliquotaAdRem',
    'tributoCalculado'
  ));

  resultado := FService.Calcular(item, tratamento, aliquota, 0);

  Assert.AreEqual(200.0, resultado.VBCIS, 0.0001);
  Assert.AreEqual(13.0, resultado.PIS, 0.0001);
  Assert.AreEqual(21.30, resultado.PISEspec, 0.0001);
  Assert.AreEqual(47.30, resultado.VIS, 0.0001);
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_CalculoImpostoSeletivo_Precisao);

end.
