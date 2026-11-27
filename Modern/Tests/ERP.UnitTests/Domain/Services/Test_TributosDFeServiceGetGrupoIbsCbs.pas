unit Test_TributosDFeServiceGetGrupoIbsCbs;

interface

uses
  DUnitX.TestFramework,
  TributosDFeSerivceUnit,
  TributosDFeServiceTypes,
  TributoDFeContextEtdUnit,
  TributoDFeIbsCbsEtdUnit,
  TributoDFeOrigemEnumUnit,
  ROCItemDomainUnit,
  TributosModelUnit,
  IBSCBSModelUnit,
  ImpostoSeletivoModelUnit,
  TransferenciaCreditoModelUnit,
  AjusteCompetenciaModelUnit,
  EstornoCreditoModelUnit,
  CreditoPresumidoOperacaoModelUnit,
  CreditoPresumidoIBSZFMModelUnit,
  StringNullableUnit,
  TipoRegraTributoDFeEnumUnit;

type
  [TestFixture]
  TTestTributosDFeServiceGetGrupoIbsCbs = class
  private
    function CriarInput: TributoDFeContextInput;
    function CriarItem(ACst: Integer): ROCItemDomain;
  public
    [Test]
    procedure DeveRetornarSemGrupoIbsCbsQuandoGIBSCBSForNulo;

    [Test]
    procedure DeveManterComportamentoDoCst410SemGrupoIbsCbs;
  end;

implementation

function TTestTributosDFeServiceGetGrupoIbsCbs.CriarInput: TributoDFeContextInput;
begin
  Result := TributoDFeContextInput.Create(
    'NFSE-TESTE',
    StringNullable.NullInstance(),
    tctAutomatica,
    False,
    tdfoNFSe
  );
end;

function TTestTributosDFeServiceGetGrupoIbsCbs.CriarItem(ACst: Integer): ROCItemDomain;
begin
  Result := ROCItemDomain.Create(
    1,
    TributosModel.Create(
      ImpostoSeletivoModel.NullInstance(),
      IBSCBSModel.Create(
        ACst,
        '',
        nil,
        nil,
        TransferenciaCreditoModel.NullInstance(),
        AjusteCompetenciaModel.NullInstance(),
        EstornoCreditoModel.NullInstance(),
        CreditoPresumidoOperacaoModel.NullInstance(),
        CreditoPresumidoIBSZFMModel.NullInstance()
      )
    )
  );
end;

procedure TTestTributosDFeServiceGetGrupoIbsCbs.DeveRetornarSemGrupoIbsCbsQuandoGIBSCBSForNulo;
var
  Item: ROCItemDomain;
  Tributo: TributoDFeContextEtd;
begin
  Item := CriarItem(500);
  try
    Tributo := TributosDFeSerivce.Create(CriarInput, Item);
    try
      Assert.IsNotNull(Tributo);
      Assert.IsNotNull(Tributo.IbsCbs);
      Assert.IsNull(Tributo.IbsCbs.GIbsCbs);
      Assert.AreEqual('500', Tributo.IbsCbs.Cst);
    finally
      Tributo.Free;
    end;
  finally
    Item.Free;
  end;
end;

procedure TTestTributosDFeServiceGetGrupoIbsCbs.DeveManterComportamentoDoCst410SemGrupoIbsCbs;
var
  Item: ROCItemDomain;
  Tributo: TributoDFeContextEtd;
begin
  Item := CriarItem(410);
  try
    Tributo := TributosDFeSerivce.Create(CriarInput, Item);
    try
      Assert.IsNotNull(Tributo);
      Assert.IsNotNull(Tributo.IbsCbs);
      Assert.IsNull(Tributo.IbsCbs.GIbsCbs);
      Assert.AreEqual('410', Tributo.IbsCbs.Cst);
    finally
      Tributo.Free;
    end;
  finally
    Item.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTributosDFeServiceGetGrupoIbsCbs);

end.
