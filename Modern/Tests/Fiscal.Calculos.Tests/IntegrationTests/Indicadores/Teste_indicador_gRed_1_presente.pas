unit Teste_indicador_gRed_1_presente;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel,
  CalcularTributoInputUnit, ROCDomainUnit, ROCItemDomainUnit, CbsModelUnit,
  IBSUfModelUnit, IBSMunModelUnit, ReducaoAliquotaModelUnit;

type
  [TestFixture]
  TTeste_indicador_gRed_1_presente = class
  private
    FJsonReader: JsonResource;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestIndicadorGRedPresente;
  end;

implementation

uses
  SetupTestUnit, ContainerFiscalTestsUnit, CalculaTributoUseCaseUnit, SysUtils;

{ TTeste_indicador_gRed_1_presente }

procedure TTeste_indicador_gRed_1_presente.Setup;
begin
  ModernInitialize();
  FJsonReader := JsonResource.Create;
end;

procedure TTeste_indicador_gRed_1_presente.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

procedure TTeste_indicador_gRed_1_presente.TestIndicadorGRedPresente;
var
  LUseCase: ICalculaTributoUseCase;
  LInputJson: CalcularTributoTestInput;
  LInput: CalcularTributoInput;
  LResultado: ROCDomain;
  LItem: ROCItemDomain;
begin
  LInputJson := FJsonReader.DeserializeObject<CalcularTributoTestInput>('entradas/indicadores/Teste_indicador_gRed_1_presente.json');
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

        // Verifica CBS - deve ter gRed
        Assert.IsNotNull(LItem.GCBS);
        Assert.IsFalse(LItem.GCBS.GRed.IsNull, 'CBS deve conter grupo gRed pois CST 200 possui SITR_IND_GRED=1');
        Assert.IsTrue(LItem.GCBS.GRed.PRedAliq > 0, 'Percentual de redução deve estar presente e ser maior que zero');

        // Verifica IBS UF - deve ter gRed
        Assert.IsNotNull(LItem.GIBSUF);
        Assert.IsFalse(LItem.GIBSUF.GRed.IsNull, 'IBS UF deve conter grupo gRed pois CST 200 possui SITR_IND_GRED=1');
        Assert.IsTrue(LItem.GIBSUF.GRed.PRedAliq > 0, 'Percentual de redução deve estar presente e ser maior que zero');

        // Verifica IBS Mun - deve ter gRed
        Assert.IsNotNull(LItem.GIBSMun);
        Assert.IsFalse(LItem.GIBSMun.GRed.IsNull, 'IBS Mun deve conter grupo gRed pois CST 200 possui SITR_IND_GRED=1');
        Assert.IsTrue(LItem.GIBSMun.GRed.PRedAliq > 0, 'Percentual de redução deve estar presente e ser maior que zero');
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
  TDUnitX.RegisterTestFixture(TTeste_indicador_gRed_1_presente);

end.
