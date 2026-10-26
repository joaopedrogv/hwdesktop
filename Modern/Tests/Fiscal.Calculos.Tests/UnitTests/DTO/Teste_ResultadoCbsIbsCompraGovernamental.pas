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
  DoubleNullableUnit,
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
  end;

implementation

{ TTest_ResultadoCbsIbsCompraGovernamental }

function CriarResultado(const CompraGov: TributacaoCompraGovernamentalModel): ResultadoCbsIbs;
begin
  Result := ResultadoCbsIbs.Create(
    0,
    DoubleNullable.Create(0),
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

initialization
  TDUnitX.RegisterTestFixture(TTest_ResultadoCbsIbsCompraGovernamental);

end.
