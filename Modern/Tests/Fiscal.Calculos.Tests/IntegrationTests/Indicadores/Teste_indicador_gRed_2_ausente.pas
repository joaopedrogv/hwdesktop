unit Teste_indicador_gRed_2_ausente;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel,
  CalcularTributoInputUnit, ROCDomainUnit, ROCItemDomainUnit, CbsModelUnit,
  IBSUfModelUnit, IBSMunModelUnit;

type
  [TestFixture]
  TTeste_indicador_gRed_2_ausente = class
  private
    FJsonReader: JsonResource;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestIndicadorGRedAusente;
  end;

implementation

uses
  SetupTestUnit, ContainerFiscalTestsUnit, CalculaTributoUseCaseUnit, SysUtils;

{ TTeste_indicador_gRed_2_ausente }

procedure TTeste_indicador_gRed_2_ausente.Setup;
begin
  ModernInitialize();
  FJsonReader := JsonResource.Create;
end;

procedure TTeste_indicador_gRed_2_ausente.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

procedure TTeste_indicador_gRed_2_ausente.TestIndicadorGRedAusente;
var
  LUseCase: ICalculaTributoUseCase;
  LInputJson: CalcularTributoTestInput;
  LInput: CalcularTributoInput;
  LResultado: ROCDomain;
  LItem: ROCItemDomain;
begin
  LInputJson := FJsonReader.DeserializeObject<CalcularTributoTestInput>('entradas/indicadores/Teste_indicador_gRed_2_ausente.json');
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

        // Verifica CBS - NÃO deve ter gRed
        Assert.IsNotNull(LItem.GCBS);
        Assert.IsTrue(LItem.GCBS.GRed.IsNull, 'CBS NÃO deve conter grupo gRed pois CST 000 possui SITR_IND_GRED=0');

        // Verifica IBS UF - NÃO deve ter gRed
        Assert.IsNotNull(LItem.GIBSUF);
        Assert.IsTrue(LItem.GIBSUF.GRed.IsNull, 'IBS UF NÃO deve conter grupo gRed pois CST 000 possui SITR_IND_GRED=0');

        // Verifica IBS Mun - NÃO deve ter gRed
        Assert.IsNotNull(LItem.GIBSMun);
        Assert.IsTrue(LItem.GIBSMun.GRed.IsNull, 'IBS Mun NÃO deve conter grupo gRed pois CST 000 possui SITR_IND_GRED=0');
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
  TDUnitX.RegisterTestFixture(TTeste_indicador_gRed_2_ausente);

end.
