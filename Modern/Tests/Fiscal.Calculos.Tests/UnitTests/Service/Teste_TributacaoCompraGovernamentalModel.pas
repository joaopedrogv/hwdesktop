unit Teste_TributacaoCompraGovernamentalModel;

interface

uses
  DUnitX.TestFramework,
  TributacaoCompraGovernamentalModelUnit,
  CurrencyNullableUnit,
  TipoEnteGovernamentalEnumUnit;

type
  [TestFixture]
  TTest_TributacaoCompraGovernamentalModel = class
  public
    [Test]
    procedure teste_GetValoresEfetivos_AntesDe2027_SemRateio;

    [Test]
    procedure teste_GetValoresEfetivos_Uniao_ConcentraNaCBS;

    [Test]
    procedure teste_GetValoresEfetivos_Estados_TransfereParaUF;

    [Test]
    procedure teste_GetValoresEfetivos_Municipios_TransfereParaMunicipio;

    [Test]
    procedure teste_GetValoresEfetivos_ConsorcioPublico_TransfereParaMunicipio;

    [Test]
    procedure teste_GetValoresEfetivos_ComiteGestorIbs_TransfereParaMunicipio;

    [Test]
    procedure teste_GetValoresEfetivos_DistritoFederal_TransfereParaUF;

    [Test]
    procedure teste_GetValoresEfetivos_EnteNulo_RetornaNulo;

    [Test]
    procedure teste_ZerarValores_ZeraTodosCampos;

    [Test]
    procedure teste_GetValoresEfetivos_DataNula_LancaExcecao;

    [Test]
    procedure teste_GetValoresEfetivos_TransferenciaNula_LancaExcecao;
  end;

implementation

uses
  System.SysUtils;

{ TTest_TributacaoCompraGovernamentalModel }

function CriarBase: TributacaoCompraGovernamentalModel;
begin
  // PAliqIBSUF=10, VTribIBSUF=100, PAliqIBSMun=5, VTribIBSMun=50, PAliqCBS=20, VTribCBS=200
  Result := TributacaoCompraGovernamentalModel.Create(10, 100, 5, 50, 20, 200);
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_GetValoresEfetivos_AntesDe2027_SemRateio;
var
  efetivo: TributacaoCompraGovernamentalModel;
begin
  efetivo := CriarBase.GetValoresEfetivos(
    tegEstado, CurrencyNullable.Create(10), EncodeDate(2026, 12, 31)
  );

  Assert.IsFalse(efetivo.IsNull());
  Assert.AreEqual(20.00, efetivo.PAliqCBS, 0.0001, 'CBS deve permanecer inalterada antes de 2027');
  Assert.AreEqual(200.00, efetivo.VTribCBS, 0.0001);
  Assert.AreEqual(10.00, efetivo.PAliqIBSUF, 0.0001);
  Assert.AreEqual(5.00, efetivo.PAliqIBSMun, 0.0001);
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_GetValoresEfetivos_Uniao_ConcentraNaCBS;
var
  efetivo: TributacaoCompraGovernamentalModel;
begin
  efetivo := CriarBase.GetValoresEfetivos(
    tegUniao, CurrencyNullable.Create(10), EncodeDate(2027, 1, 1)
  );

  Assert.IsFalse(efetivo.IsNull());
  Assert.AreEqual(35.00, efetivo.PAliqCBS, 0.0001, 'Uniao deve concentrar tudo na CBS');
  Assert.AreEqual(350.00, efetivo.VTribCBS, 0.0001);
  Assert.AreEqual(0, efetivo.PAliqIBSUF, 0.0001, 'IBS UF deve zerar');
  Assert.AreEqual(0, efetivo.VTribIBSUF, 0.0001);
  Assert.AreEqual(0, efetivo.PAliqIBSMun, 0.0001, 'IBS Mun deve zerar');
  Assert.AreEqual(0, efetivo.VTribIBSMun, 0.0001);
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_GetValoresEfetivos_Estados_TransfereParaUF;
var
  efetivo: TributacaoCompraGovernamentalModel;
begin
  // transferencia de 10% em 2029: 2.00 de aliquota e 20.00 de tributo saem da CBS
  efetivo := CriarBase.GetValoresEfetivos(
    tegEstado, CurrencyNullable.Create(10), EncodeDate(2029, 1, 1)
  );

  Assert.IsFalse(efetivo.IsNull());
  Assert.AreEqual(18.00, efetivo.PAliqCBS, 0.0001, 'CBS deve ser reduzida pela transferencia');
  Assert.AreEqual(180.00, efetivo.VTribCBS, 0.0001);
  Assert.AreEqual(17.00, efetivo.PAliqIBSUF, 0.0001, 'UF deve receber transferencia + município');
  Assert.AreEqual(170.00, efetivo.VTribIBSUF, 0.0001);
  Assert.AreEqual(0, efetivo.PAliqIBSMun, 0.0001, 'IBS Mun deve zerar');
  Assert.AreEqual(0, efetivo.VTribIBSMun, 0.0001);
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_GetValoresEfetivos_Municipios_TransfereParaMunicipio;
var
  efetivo: TributacaoCompraGovernamentalModel;
begin
  efetivo := CriarBase.GetValoresEfetivos(
    tegMunicipio, CurrencyNullable.Create(10), EncodeDate(2029, 1, 1)
  );

  Assert.IsFalse(efetivo.IsNull());
  Assert.AreEqual(18.00, efetivo.PAliqCBS, 0.0001);
  Assert.AreEqual(180.00, efetivo.VTribCBS, 0.0001);
  Assert.AreEqual(0, efetivo.PAliqIBSUF, 0.0001, 'IBS UF deve zerar');
  Assert.AreEqual(0, efetivo.VTribIBSUF, 0.0001);
  Assert.AreEqual(17.00, efetivo.PAliqIBSMun, 0.0001, 'Município deve receber transferencia + UF');
  Assert.AreEqual(170.00, efetivo.VTribIBSMun, 0.0001);
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_GetValoresEfetivos_ConsorcioPublico_TransfereParaMunicipio;
var
  efetivo: TributacaoCompraGovernamentalModel;
begin
  // Consorcio Publico se comporta como municipio no rateio (espelho de cenariosMunicipioPorAno)
  efetivo := CriarBase.GetValoresEfetivos(
    tegConsorcioPublico, CurrencyNullable.Create(10), EncodeDate(2029, 1, 1)
  );

  Assert.IsFalse(efetivo.IsNull());
  Assert.AreEqual(18.00, efetivo.PAliqCBS, 0.0001);
  Assert.AreEqual(180.00, efetivo.VTribCBS, 0.0001);
  Assert.AreEqual(0, efetivo.PAliqIBSUF, 0.0001, 'IBS UF deve zerar');
  Assert.AreEqual(0, efetivo.VTribIBSUF, 0.0001);
  Assert.AreEqual(17.00, efetivo.PAliqIBSMun, 0.0001, 'Consorcio Publico deve receber no municipio');
  Assert.AreEqual(170.00, efetivo.VTribIBSMun, 0.0001);
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_GetValoresEfetivos_ComiteGestorIbs_TransfereParaMunicipio;
var
  efetivo: TributacaoCompraGovernamentalModel;
begin
  // Comite Gestor do IBS se comporta como municipio no rateio (espelho de cenariosMunicipioPorAno)
  efetivo := CriarBase.GetValoresEfetivos(
    tegComiteGestorIbs, CurrencyNullable.Create(10), EncodeDate(2029, 1, 1)
  );

  Assert.IsFalse(efetivo.IsNull());
  Assert.AreEqual(18.00, efetivo.PAliqCBS, 0.0001);
  Assert.AreEqual(180.00, efetivo.VTribCBS, 0.0001);
  Assert.AreEqual(0, efetivo.PAliqIBSUF, 0.0001, 'IBS UF deve zerar');
  Assert.AreEqual(0, efetivo.VTribIBSUF, 0.0001);
  Assert.AreEqual(17.00, efetivo.PAliqIBSMun, 0.0001, 'Comite Gestor do IBS deve receber no municipio');
  Assert.AreEqual(170.00, efetivo.VTribIBSMun, 0.0001);
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_GetValoresEfetivos_DistritoFederal_TransfereParaUF;
var
  efetivo: TributacaoCompraGovernamentalModel;
begin
  // DF se comporta como estado no rateio (espelho de cenariosEstadoPorAno)
  efetivo := CriarBase.GetValoresEfetivos(
    tegDistritoFederal, CurrencyNullable.Create(10), EncodeDate(2029, 1, 1)
  );

  Assert.IsFalse(efetivo.IsNull());
  Assert.AreEqual(18.00, efetivo.PAliqCBS, 0.0001, 'CBS deve ser reduzida pela transferencia');
  Assert.AreEqual(180.00, efetivo.VTribCBS, 0.0001);
  Assert.AreEqual(17.00, efetivo.PAliqIBSUF, 0.0001, 'DF deve receber no Estado');
  Assert.AreEqual(170.00, efetivo.VTribIBSUF, 0.0001);
  Assert.AreEqual(0, efetivo.PAliqIBSMun, 0.0001, 'IBS Mun deve zerar');
  Assert.AreEqual(0, efetivo.VTribIBSMun, 0.0001);
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_GetValoresEfetivos_EnteNulo_RetornaNulo;
var
  efetivo: TributacaoCompraGovernamentalModel;
begin
  efetivo := CriarBase.GetValoresEfetivos(
    tegUnassigned, CurrencyNullable.Create(10), EncodeDate(2029, 1, 1)
  );

  Assert.IsTrue(efetivo.IsNull(), 'Ente nulo deve retornar dominio nulo');
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_ZerarValores_ZeraTodosCampos;
var
  m: TributacaoCompraGovernamentalModel;
begin
  m := CriarBase;
  m.ZerarValores();

  Assert.AreEqual(0, m.PAliqCBS, 0.0001);
  Assert.AreEqual(0, m.VTribCBS, 0.0001);
  Assert.AreEqual(0, m.PAliqIBSUF, 0.0001);
  Assert.AreEqual(0, m.VTribIBSUF, 0.0001);
  Assert.AreEqual(0, m.PAliqIBSMun, 0.0001);
  Assert.AreEqual(0, m.VTribIBSMun, 0.0001);
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_GetValoresEfetivos_DataNula_LancaExcecao;
begin
  Assert.WillRaise(
    procedure
    begin
      CriarBase.GetValoresEfetivos(tegUniao, CurrencyNullable.Create(10), 0);
    end,
    Exception);
end;

procedure TTest_TributacaoCompraGovernamentalModel.teste_GetValoresEfetivos_TransferenciaNula_LancaExcecao;
begin
  Assert.WillRaise(
    procedure
    begin
      CriarBase.GetValoresEfetivos(tegUniao, CurrencyNullable.NullInstance(), EncodeDate(2029, 1, 1));
    end,
    Exception);
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_TributacaoCompraGovernamentalModel);

end.
