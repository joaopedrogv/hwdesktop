unit Teste_000001_6;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel,
  CalcularTributoInputUnit, ROCDomainUnit, ROCItemDomainUnit, CbsModelUnit,
  IBSUfModelUnit, IBSMunModelUnit, ImpostoSeletivoModelUnit;

type
  [TestFixture]
  TTeste_000001_6 = class
  private
    FJsonReader: JsonResource;
    procedure AssertCbs(const ACbs: CbsModel);
    procedure AssertIbsEstadual(const AIbsEstadual: IBSUfModel);
    procedure AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
    procedure AssertImpostoSeletivo(const AImpostoSeletivo: ImpostoSeletivoModel);
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestCalcularTributos;
  end;

implementation

uses
  SetupTestUnit, ContainerFiscalTestsUnit, CalculaTributoUseCaseUnit, SysUtils;

{ TTeste_000001_6 }

procedure TTeste_000001_6.Setup;
begin
  ModernInitialize();
  FJsonReader := JsonResource.Create;
end;

procedure TTeste_000001_6.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

procedure TTeste_000001_6.TestCalcularTributos;
var
  LUseCase: ICalculaTributoUseCase;
  LInputJson: CalcularTributoTestInput;
  LInput: CalcularTributoInput;
  LResultado: ROCDomain;
  LItem: ROCItemDomain;
begin
  LInputJson := FJsonReader.DeserializeObject<CalcularTributoTestInput>('entradas/calculoscorretos/Teste_000001_6.json');
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

        Assert.AreEqual(210.54, LItem.ValorBaseCalculoIBSCBS, 0.0001);

        AssertCbs(LItem.GCBS);
        AssertIbsEstadual(LItem.GIBSUF);
        AssertIbsMunicipal(LItem.GIBSMun);
        AssertImpostoSeletivo(LItem.ImpostoSeletivoModel);
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

procedure TTeste_000001_6.AssertCbs(const ACbs: CbsModel);
begin
  Assert.IsNotNull(ACbs);
  Assert.AreEqual(8.40, ACbs.PCBS, 0.0001);
  Assert.AreEqual(17.69, ACbs.VCBS, 0.0001);
end;

procedure TTeste_000001_6.AssertIbsEstadual(const AIbsEstadual: IBSUfModel);
begin
  Assert.IsNotNull(AIbsEstadual);
  Assert.AreEqual(0.05, AIbsEstadual.PIBSUF, 0.0001);
  Assert.AreEqual(0.11, AIbsEstadual.VIBSUF, 0.0001);
end;

procedure TTeste_000001_6.AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
begin
  Assert.IsNotNull(AIbsMunicipal);
  Assert.AreEqual(0.05, AIbsMunicipal.PIBSMun, 0.0001);
  Assert.AreEqual(0.11, AIbsMunicipal.VIBSMun, 0.0001);
end;

procedure TTeste_000001_6.AssertImpostoSeletivo(const AImpostoSeletivo: ImpostoSeletivoModel);
begin
  Assert.IsFalse(AImpostoSeletivo.IsNull);
  Assert.AreEqual(200.00, AImpostoSeletivo.VBCIS, 0.0001);
  Assert.AreEqual(5.27, AImpostoSeletivo.PIS, 0.0001);
  Assert.AreEqual(0.00, AImpostoSeletivo.PISEspec, 0.0001);
  Assert.AreEqual(10.54, AImpostoSeletivo.VIS, 0.0001);
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_000001_6);

end.
