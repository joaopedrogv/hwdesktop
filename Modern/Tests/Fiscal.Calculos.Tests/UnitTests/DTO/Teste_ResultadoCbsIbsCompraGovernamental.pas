unit Teste_ResultadoCbsIbsCompraGovernamental;

interface

uses
  DUnitX.TestFramework,
  ResultadoCbsIbsUnit,
  ReducaoAliquotaModelUnit,
  ResultadoTributacaoRegularUnit,
  DiferimentoModelUnit,
  ResultadoGrupoMonofasiaUnit,
  TributacaoCompraGovernamentalModelUnit,
  CompraGovernamentalModelUnit,
  CurrencyNullableUnit,
  DecimalCalculoUnit,
  TipoEnteGovernamentalEnumUnit,
  TipoOperacaoGovernamentalEnumUnit;

type
  [TestFixture]
  TTest_ResultadoCbsIbsCompraGovernamental = class
  public
    [Test]
    procedure teste_ResultadoSemCompraGov_PossuiCompraGovFalse;

    [Test]
    procedure teste_ResultadoComCompraGov_PossuiCompraGovTrue;

    [Test]
    procedure teste_CompraGovernamentalModel_PRedutorDefaultZero;

    [Test]
    procedure teste_CompraGovernamentalModel_NullInstance_Nula;

    [Test]
    procedure teste_BaseCalculoAusente_PreservaIsNull;

    [Test]
    procedure teste_ValoresPublicadosEmCurrency;
  end;

implementation

{ TTest_ResultadoCbsIbsCompraGovernamental }

function CriarResultado(const CompraGov: TributacaoCompraGovernamentalModel): ResultadoCbsIbs;
begin
  Result := ResultadoCbsIbs.Create(
    0,
    CurrencyNullable.Create(0),
    0,
    0,
    0,
    ReducaoAliquotaModel.NullInstance(),
    ResultadoTributacaoRegular.NullInstance(),
    CompraGov,
    DiferimentoModel.NullInstance(),
    ResultadoGrupoMonofasia.NullInstance(),
    ''
  );
end;

procedure TTest_ResultadoCbsIbsCompraGovernamental.teste_ResultadoSemCompraGov_PossuiCompraGovFalse;
var
  r: ResultadoCbsIbs;
begin
  r := CriarResultado(TributacaoCompraGovernamentalModel.NullInstance());

  Assert.IsFalse(r.PossuiCompraGov(), 'Sem compra governamental, possuiCompraGov deve ser false');
end;

procedure TTest_ResultadoCbsIbsCompraGovernamental.teste_ResultadoComCompraGov_PossuiCompraGovTrue;
var
  r: ResultadoCbsIbs;
begin
  r := CriarResultado(TributacaoCompraGovernamentalModel.Create(10, 100, 5, 50, 20, 200));

  Assert.IsTrue(r.PossuiCompraGov(), 'Com compra governamental, possuiCompraGov deve ser true');
end;

procedure TTest_ResultadoCbsIbsCompraGovernamental.teste_CompraGovernamentalModel_PRedutorDefaultZero;
var
  m: CompraGovernamentalModel;
begin
  m := CompraGovernamentalModel.Create(tegUniao, togFornecimento);

  Assert.IsFalse(m.IsNull(), 'Modelo criado nao deve ser nulo');
  Assert.AreEqual(Round(0.0000 * 1000), Round(m.PRedutor * 10000), 'pRedutor deve iniciar em ZERO por padrao');
  Assert.AreEqual(Integer(tegUniao), Integer(m.TpEnteGov), 'tpEnteGov deve ser preservado');
  Assert.AreEqual(Integer(togFornecimento), Integer(m.TpOperGov), 'tpOperGov deve ser preservado');
end;

procedure TTest_ResultadoCbsIbsCompraGovernamental.teste_CompraGovernamentalModel_NullInstance_Nula;
var
  m: CompraGovernamentalModel;
begin
  m := CompraGovernamentalModel.NullInstance();

  Assert.IsTrue(m.IsNull(), 'NullInstance deve produzir modelo nulo');
end;

procedure TTest_ResultadoCbsIbsCompraGovernamental.teste_BaseCalculoAusente_PreservaIsNull;
var
  semBase, baseZero: ResultadoCbsIbs;
begin
  semBase := ResultadoCbsIbs.Create(
    0,
    CurrencyNullable.NullInstance(),
    0, 0, 0,
    ReducaoAliquotaModel.NullInstance(),
    ResultadoTributacaoRegular.NullInstance(),
    TributacaoCompraGovernamentalModel.NullInstance(),
    DiferimentoModel.NullInstance(),
    ResultadoGrupoMonofasia.NullInstance(),
    ''
  );

  baseZero := ResultadoCbsIbs.Create(
    0,
    CurrencyNullable.Create(0),
    0, 0, 0,
    ReducaoAliquotaModel.NullInstance(),
    ResultadoTributacaoRegular.NullInstance(),
    TributacaoCompraGovernamentalModel.NullInstance(),
    DiferimentoModel.NullInstance(),
    ResultadoGrupoMonofasia.NullInstance(),
    ''
  );

  Assert.IsTrue(semBase.BaseCalculo.IsNull, 'base ausente permanece nula');
  Assert.IsFalse(baseZero.BaseCalculo.IsNull, 'base zero informada nao e ausencia');
end;

procedure TTest_ResultadoCbsIbsCompraGovernamental.teste_ValoresPublicadosEmCurrency;
var
  r: ResultadoCbsIbs;
begin
  r := ResultadoCbsIbs.Create(
    DecimalCalculo.DeTexto('0.0352492').ParaCurrency,
    CurrencyNullable.Create(1000000.00),
    1,
    DecimalCalculo.DeTexto('35249.00').ParaCurrency,
    DecimalCalculo.DeTexto('35249.00').ParaCurrency,
    ReducaoAliquotaModel.NullInstance(),
    ResultadoTributacaoRegular.NullInstance(),
    TributacaoCompraGovernamentalModel.NullInstance(),
    DiferimentoModel.NullInstance(),
    ResultadoGrupoMonofasia.NullInstance(),
    ''
  );

  Assert.AreEqual(0.0352, r.Aliquota, 0.0000001, 'aliquota publicada em Currency (4 casas)');
  Assert.AreEqual(35249.00, r.TributoCalculado, 0.0000001, 'tributo calculado em Currency');
  Assert.AreEqual(35249.00, r.TributoDevido, 0.0000001, 'tributo devido em Currency');
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_ResultadoCbsIbsCompraGovernamental);

end.
