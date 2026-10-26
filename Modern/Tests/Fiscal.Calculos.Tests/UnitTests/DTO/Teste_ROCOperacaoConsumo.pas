unit Teste_ROCOperacaoConsumo;

interface

uses
  DUnitX.TestFramework,
  ROCDomainUnit,
  ValoresTotaisDomainUnit,
  ValidacaoOutputUnit,
  OperacaoConsumoModelUnit,
  CompraGovernamentalModelUnit,
  TipoEnteGovernamentalEnumUnit,
  TipoOperacaoGovernamentalEnumUnit;

type
  [TestFixture]
  TTeste_ROCOperacaoConsumo = class
  public
    [Test]
    procedure teste_OperPreenchido_PrimeiroCampo;

    [Test]
    procedure teste_OperNulo_Omitido;

    [Test]
    procedure teste_GCompraGov_Propagado_TpEnteGov_TpOperGov_PRedutor;

    [Test]
    procedure teste_OperacaoConsumoModel_NullInstance_Nula;
  end;

implementation

uses
  System.SysUtils;

{ TTeste_ROCOperacaoConsumo }

procedure TTeste_ROCOperacaoConsumo.teste_OperPreenchido_PrimeiroCampo;
var
  rocOper: ROCDomain;
  oper: OperacaoConsumoModel;
begin
  oper := OperacaoConsumoModel.Create(
    CompraGovernamentalModel.Create(tegEstado, togFornecimento, 50.00)
  );

  rocOper := ROCDomain.Create(
    oper,
    nil,
    ValoresTotaisDomain.FromObjetos(nil),
    ValidacaoOutput.Create()
  );
  try
    Assert.IsFalse(rocOper.Oper.IsNull(), 'Oper preenchido nao deve ser nulo');
    Assert.IsFalse(rocOper.Oper.GCompraGov.IsNull(), 'gCompraGov deve estar preenchido');
  finally
    rocOper.Free();
  end;
end;

procedure TTeste_ROCOperacaoConsumo.teste_OperNulo_Omitido;
var
  rocOper: ROCDomain;
begin
  rocOper := ROCDomain.Create(
    OperacaoConsumoModel.NullInstance(),
    nil,
    ValoresTotaisDomain.FromObjetos(nil),
    ValidacaoOutput.Create()
  );
  try
    Assert.IsTrue(rocOper.Oper.IsNull(), 'Oper nulo deve permanecer nulo/omitido');
  finally
    rocOper.Free();
  end;
end;

procedure TTeste_ROCOperacaoConsumo.teste_GCompraGov_Propagado_TpEnteGov_TpOperGov_PRedutor;
var
  rocOper: ROCDomain;
begin
  rocOper := ROCDomain.Create(
    OperacaoConsumoModel.Create(
      CompraGovernamentalModel.Create(tegEstado, togFornecimento, 50.00)
    ),
    nil,
    ValoresTotaisDomain.FromObjetos(nil),
    ValidacaoOutput.Create()
  );
  try
    Assert.IsFalse(rocOper.Oper.GCompraGov.IsNull(), 'gCompraGov deve ser propagado');
    Assert.AreEqual(Integer(tegEstado), Integer(rocOper.Oper.GCompraGov.TpEnteGov), 'tpEnteGov propagado');
    Assert.AreEqual(Integer(togFornecimento), Integer(rocOper.Oper.GCompraGov.TpOperGov), 'tpOperGov propagado');
    Assert.AreEqual(50.00, rocOper.Oper.GCompraGov.PRedutor, 0.0001, 'pRedutor propagado');
  finally
    rocOper.Free();
  end;
end;

procedure TTeste_ROCOperacaoConsumo.teste_OperacaoConsumoModel_NullInstance_Nula;
var
  oper: OperacaoConsumoModel;
begin
  oper := OperacaoConsumoModel.NullInstance();

  Assert.IsTrue(oper.IsNull(), 'NullInstance deve produzir modelo nulo');
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_ROCOperacaoConsumo);

end.
