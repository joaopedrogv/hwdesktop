unit Teste_IBSCBSTotal_GMono;

interface

uses
  DUnitX.TestFramework,
  IBSCBSTotalUnit,
  MonofasiaTotalUnit,
  ROCItemDomainUnit,
  TributosModelUnit,
  IBSCBSModelUnit,
  GrupoIBSCBSModelUnit,
  ImpostoSeletivoModelUnit,
  TributacaoRegularModelUnit,
  TributacaoCompraGovernamentalModelUnit,
  TransferenciaCreditoModelUnit,
  AjusteCompetenciaModelUnit,
  EstornoCreditoModelUnit,
  CreditoPresumidoOperacaoModelUnit,
  CreditoPresumidoIBSZFMModelUnit,
  CurrencyNullableUnit;

type
  [TestFixture]
  TTeste_IBSCBSTotal_GMono = class
  private
    function CriarItemSemMonofasia(): ROCItemDomain;
  public
    [Test]
    procedure teste_MonofasiaTotal_ListaVazia_CamposZerados;

    [Test]
    procedure teste_IBSCBSTotal_SemMonofasia_GMonoPresenteZerado;
  end;

implementation

{ TTeste_IBSCBSTotal_GMono }

function TTeste_IBSCBSTotal_GMono.CriarItemSemMonofasia: ROCItemDomain;
var
  grupo: GrupoIBSCBSModel;
  ibscbs: IBSCBSModel;
  tributos: TributosModel;
begin
  grupo := GrupoIBSCBSModel.Create(
    CurrencyNullable.NullInstance(),  // VBC nula -> sem base de calculo IBS/CBS
    nil,                            // sem IBSUF
    nil,                            // sem IBSMun
    0,                              // VIBS
    nil,                            // sem CBS
    TributacaoRegularModel.NullInstance(),
    TributacaoCompraGovernamentalModel.NullInstance()
  );

  ibscbs := IBSCBSModel.Create(
    620,
    '620001',
    grupo,
    nil,  // GIBSCBSMono nulo -> sem monofasia
    TransferenciaCreditoModel.NullInstance(),
    AjusteCompetenciaModel.NullInstance(),
    EstornoCreditoModel.NullInstance(),
    CreditoPresumidoOperacaoModel.NullInstance(),
    CreditoPresumidoIBSZFMModel.NullInstance()
  );

  tributos := TributosModel.Create(
    ImpostoSeletivoModel.NullInstance(),
    ibscbs
  );

  Result := ROCItemDomain.Create(1, tributos);
end;

procedure TTeste_IBSCBSTotal_GMono.teste_MonofasiaTotal_ListaVazia_CamposZerados;
var
  mono: MonofasiaTotal;
begin
  mono := MonofasiaTotal.FromObjetos(nil);

  // C03-01: FromObjetos nunca retorna nulo; sem monofasia os 6 campos sao 0.00.
  Assert.IsFalse(mono.IsNull(), 'MonofasiaTotal.FromObjetos vazio nao deve ser nulo');
  Assert.AreEqual(0.00, mono.VIBSMono, 0.0001);
  Assert.AreEqual(0.00, mono.VCBSMono, 0.0001);
  Assert.AreEqual(0.00, mono.VIBSMonoReten, 0.0001);
  Assert.AreEqual(0.00, mono.VCBSMonoReten, 0.0001);
  Assert.AreEqual(0.00, mono.VIBSMonoRet, 0.0001);
  Assert.AreEqual(0.00, mono.VCBSMonoRet, 0.0001);
end;

procedure TTeste_IBSCBSTotal_GMono.teste_IBSCBSTotal_SemMonofasia_GMonoPresenteZerado;
var
  detalhes: ROCItens;
  item: ROCItemDomain;
  total: IBSCBSTotal;
  mono: MonofasiaTotal;
begin
  item := CriarItemSemMonofasia();
  try
    SetLength(detalhes, 1);
    detalhes[0] := item;

    total := IBSCBSTotal.FromObjetos(detalhes);
    mono := total.GMono;

    // C03-01: gMono sempre presente (nao nulo) mesmo sem monofasia, com 6 campos 0.00.
    Assert.IsFalse(mono.IsNull(), 'GMono nao deve ser nulo sem monofasia');
    Assert.AreEqual(0.00, mono.VIBSMono, 0.0001);
    Assert.AreEqual(0.00, mono.VCBSMono, 0.0001);
    Assert.AreEqual(0.00, mono.VIBSMonoReten, 0.0001);
    Assert.AreEqual(0.00, mono.VCBSMonoReten, 0.0001);
    Assert.AreEqual(0.00, mono.VIBSMonoRet, 0.0001);
    Assert.AreEqual(0.00, mono.VCBSMonoRet, 0.0001);
  finally
    item.Free();
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_IBSCBSTotal_GMono);

end.
