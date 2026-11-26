unit Teste_IBSTotal_VIBS;

interface

uses
  DUnitX.TestFramework,
  IBSTotalUnit,
  ROCItemDomainUnit,
  TributosModelUnit,
  IBSCBSModelUnit,
  GrupoIBSCBSModelUnit,
  IBSUFModelUnit,
  IBSMunModelUnit,
  DiferimentoModelUnit,
  DevolucaoTributosModelUnit,
  ReducaoAliquotaModelUnit,
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
  TTeste_IBSTotal_VIBS = class
  private
    function CriarItemComGrupo(const VIBS, VIBSUF, VIBSMun: Currency): ROCItemDomain;
    function CriarItemSemGrupo(): ROCItemDomain;
  public
    [Test]
    procedure teste_VIBS_SomaVIBSDosItensComGrupo;

    [Test]
    procedure teste_VIBS_ListaVaziaOuNula_TotaisZerados;
  end;

implementation

{ TTeste_IBSTotal_VIBS }

function TTeste_IBSTotal_VIBS.CriarItemComGrupo(
  const VIBS, VIBSUF, VIBSMun: Currency
): ROCItemDomain;
var
  grupo: GrupoIBSCBSModel;
  ibscbs: IBSCBSModel;
  tributos: TributosModel;
begin
  grupo := GrupoIBSCBSModel.Create(
    CurrencyNullable.NullInstance(),
    IBSUFModel.Create(0, DiferimentoModel.NullInstance(),
      DevolucaoTributosModel.NullInstance(), ReducaoAliquotaModel.NullInstance(), VIBSUF, ''),
    IBSMunModel.Create(0, DiferimentoModel.NullInstance(),
      DevolucaoTributosModel.NullInstance(), ReducaoAliquotaModel.NullInstance(), VIBSMun, ''),
    VIBS,
    nil,
    TributacaoRegularModel.NullInstance(),
    TributacaoCompraGovernamentalModel.NullInstance()
  );

  ibscbs := IBSCBSModel.Create(
    620,
    '620001',
    grupo,
    nil,
    TransferenciaCreditoModel.NullInstance(),
    AjusteCompetenciaModel.NullInstance(),
    EstornoCreditoModel.NullInstance(),
    CreditoPresumidoOperacaoModel.NullInstance(),
    CreditoPresumidoIBSZFMModel.NullInstance()
  );

  tributos := TributosModel.Create(ImpostoSeletivoModel.NullInstance(), ibscbs);

  Result := ROCItemDomain.Create(1, tributos);
end;

function TTeste_IBSTotal_VIBS.CriarItemSemGrupo: ROCItemDomain;
var
  ibscbs: IBSCBSModel;
  tributos: TributosModel;
begin
  ibscbs := IBSCBSModel.Create(
    620,
    '620001',
    nil,
    nil,
    TransferenciaCreditoModel.NullInstance(),
    AjusteCompetenciaModel.NullInstance(),
    EstornoCreditoModel.NullInstance(),
    CreditoPresumidoOperacaoModel.NullInstance(),
    CreditoPresumidoIBSZFMModel.NullInstance()
  );

  tributos := TributosModel.Create(ImpostoSeletivoModel.NullInstance(), ibscbs);

  Result := ROCItemDomain.Create(2, tributos);
end;

procedure TTeste_IBSTotal_VIBS.teste_VIBS_SomaVIBSDosItensComGrupo;
var
  detalhes: ROCItens;
  itens: array[0..3] of ROCItemDomain;
  total: IBSTotal;
  I: Integer;
begin
  itens[0] := CriarItemComGrupo(10, 4, 4);
  itens[1] := CriarItemComGrupo(5, 2, 2);
  itens[2] := ROCItemDomain.Create(3, nil);
  itens[3] := CriarItemSemGrupo();
  try
    SetLength(detalhes, Length(itens));
    for I := 0 to High(itens) do
      detalhes[I] := itens[I];

    total := IBSTotal.FromObjetos(detalhes);

    Assert.IsFalse(total.IsNull(), 'IBSTotal.FromObjetos com itens nao deve ser nulo');
    Assert.AreEqual(15.00, total.VIBS, 0.0001,
      'vIBS total deve ser a soma do vIBS dos itens com grupo (10 + 5)');
    Assert.AreEqual(6.00, total.GIBSUF.VIBSUF, 0.0001,
      'gIBSUF continua somando o vIBSUF dos itens (4 + 2)');
    Assert.AreEqual(6.00, total.GIBSMun.VIBSMun, 0.0001,
      'gIBSMun continua somando o vIBSMun dos itens (4 + 2)');
  finally
    for I := 0 to High(itens) do
      itens[I].Free();
  end;
end;

procedure TTeste_IBSTotal_VIBS.teste_VIBS_ListaVaziaOuNula_TotaisZerados;
var
  detalhes: ROCItens;
  total: IBSTotal;
begin
  total := IBSTotal.FromObjetos(nil);

  Assert.IsFalse(total.IsNull(), 'IBSTotal.FromObjetos(nil) nao deve ser nulo');
  Assert.AreEqual(0.00, total.VIBS, 0.0001, 'lista nula deve zerar o vIBS total');
  Assert.AreEqual(0.00, total.GIBSUF.VIBSUF, 0.0001, 'lista nula deve zerar o gIBSUF');
  Assert.AreEqual(0.00, total.GIBSMun.VIBSMun, 0.0001, 'lista nula deve zerar o gIBSMun');

  SetLength(detalhes, 0);
  total := IBSTotal.FromObjetos(detalhes);

  Assert.AreEqual(0.00, total.VIBS, 0.0001, 'lista vazia deve zerar o vIBS total');
  Assert.AreEqual(0.00, total.GIBSUF.VIBSUF, 0.0001, 'lista vazia deve zerar o gIBSUF');
  Assert.AreEqual(0.00, total.GIBSMun.VIBSMun, 0.0001, 'lista vazia deve zerar o gIBSMun');
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_IBSTotal_VIBS);

end.