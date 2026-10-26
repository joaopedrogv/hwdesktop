unit Teste_indicador_gRed_3_tributacaoRegular;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel,
  CalcularTributoInputUnit, ROCDomainUnit, ROCItemDomainUnit, CbsModelUnit,
  IBSUfModelUnit, IBSMunModelUnit, TributacaoRegularModelUnit;

type
  [TestFixture]
  TTeste_indicador_gRed_3_tributacaoRegular = class
  private
    FJsonReader: JsonResource;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestIndicadorGRedComTributacaoRegular;
  end;

implementation

uses
  SetupTestUnit, ContainerFiscalTestsUnit, CalculaTributoUseCaseUnit, SysUtils;

{ TTeste_indicador_gRed_3_tributacaoRegular }

procedure TTeste_indicador_gRed_3_tributacaoRegular.Setup;
begin
  ModernInitialize();
  FJsonReader := JsonResource.Create;
end;

procedure TTeste_indicador_gRed_3_tributacaoRegular.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

procedure TTeste_indicador_gRed_3_tributacaoRegular.TestIndicadorGRedComTributacaoRegular;
var
  LUseCase: ICalculaTributoUseCase;
  LInputJson: CalcularTributoTestInput;
  LInput: CalcularTributoInput;
  LResultado: ROCDomain;
  LItem: ROCItemDomain;
begin
  LInputJson := FJsonReader.DeserializeObject<CalcularTributoTestInput>('entradas/indicadores/Teste_indicador_gRed_3_tributacaoRegular.json');
  try
    LInput := TCalculoInputConverter.ToInput(LInputJson);

    LUseCase := Container.GetInstance().FiscalCalculosFactory.CreateCalculaTributoUseCase();
    try
      LResultado := LUseCase.Executar(LInput);
      try
        Assert.IsNotNull(LResultado);
        Assert.IsNotNull(LResultado.Objetos);
        Assert.IsTrue(Length(LResultado.Objetos) > 0);

        LItem := LResultado.Objetos[0];
        Assert.IsNotNull(LItem);

        // Verifica que existe tributação regular
        Assert.IsFalse(LItem.TributacaoRegularModel.IsNull, 'Deve conter grupo de tributação regular');

        // Verifica CBS - NÃO deve ter gRed devido à tributação regular
        Assert.IsNotNull(LItem.GCBS);
        Assert.IsTrue(LItem.GCBS.GRed.IsNull, 'CBS NÃO deve conter grupo gRed quando há tributação regular');

        // Verifica IBS UF - NÃO deve ter gRed devido à tributação regular
        Assert.IsNotNull(LItem.GIBSUF);
        Assert.IsTrue(LItem.GIBSUF.GRed.IsNull, 'IBS UF NÃO deve conter grupo gRed quando há tributação regular');

        // Verifica IBS Mun - NÃO deve ter gRed devido à tributação regular
        Assert.IsNotNull(LItem.GIBSMun);
        Assert.IsTrue(LItem.GIBSMun.GRed.IsNull, 'IBS Mun NÃO deve conter grupo gRed quando há tributação regular');
      finally
        LResultado.Free;
      end;
    finally
      LUseCase.FreeSafe();
    end;
  finally
    LInputJson.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_indicador_gRed_3_tributacaoRegular);

end.
