unit Teste_indicador_gRed_4_cst515;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel,
  CalcularTributoInputUnit, ROCDomainUnit, ROCItemDomainUnit, CbsModelUnit,
  IBSUfModelUnit, IBSMunModelUnit, ReducaoAliquotaModelUnit;

type
  [TestFixture]
  TTeste_indicador_gRed_4_cst515 = class
  private
    FJsonReader: JsonResource;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestIndicadorGRedCST515;
  end;

implementation

uses
  SetupTestUnit, ContainerFiscalTestsUnit, CalculaTributoUseCaseUnit, SysUtils;

{ TTeste_indicador_gRed_4_cst515 }

procedure TTeste_indicador_gRed_4_cst515.Setup;
begin
  ModernInitialize();
  FJsonReader := JsonResource.Create;
end;

procedure TTeste_indicador_gRed_4_cst515.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

procedure TTeste_indicador_gRed_4_cst515.TestIndicadorGRedCST515;
var
  LUseCase: ICalculaTributoUseCase;
  LInputJson: CalcularTributoTestInput;
  LInput: CalcularTributoInput;
  LResultado: ROCDomain;
  LItem: ROCItemDomain;
begin
  LInputJson := FJsonReader.DeserializeObject<CalcularTributoTestInput>('entradas/indicadores/Teste_indicador_gRed_4_cst515.json');
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

        // Verifica CBS - deve ter gRed e gDif (diferimento com redução)
        Assert.IsNotNull(LItem.GCBS);
        Assert.IsFalse(LItem.GCBS.GRed.IsNull, 'CBS deve conter grupo gRed pois CST 515 possui SITR_IND_GRED=1');
        Assert.IsTrue(LItem.GCBS.GRed.PRedAliq > 0, 'Percentual de redução deve estar presente');

        // Verifica gDif - Assumindo IsNotNull para tipos não explicitados como record
        Assert.IsFalse(LItem.GCBS.GDif.IsNull(), 'CBS deve conter grupo gDif pois CST 515 também possui diferimento');

        // Verifica IBS UF - deve ter gRed e gDif
        Assert.IsNotNull(LItem.GIBSUF);
        Assert.IsFalse(LItem.GIBSUF.GRed.IsNull(), 'IBS UF deve conter grupo gRed pois CST 515 possui SITR_IND_GRED=1');
        Assert.IsFalse(LItem.GIBSUF.GDif.IsNull(), 'IBS UF deve conter grupo gDif pois CST 515 também possui diferimento');

        // Verifica IBS Mun - deve ter gRed e gDif
        Assert.IsNotNull(LItem.GIBSMun);
        Assert.IsFalse(LItem.GIBSMun.GRed.IsNull(), 'IBS Mun deve conter grupo gRed pois CST 515 possui SITR_IND_GRED=1');
        Assert.IsFalse(LItem.GIBSMun.GDif.IsNull(), 'IBS Mun deve conter grupo gDif pois CST 515 também possui diferimento');
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
  TDUnitX.RegisterTestFixture(TTeste_indicador_gRed_4_cst515);

end.
