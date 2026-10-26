unit Teste_200002_2;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel,
  CalcularTributoInputUnit, ROCDomainUnit, ROCItemDomainUnit, CbsModelUnit,
  IBSUfModelUnit, IBSMunModelUnit, ImpostoSeletivoModelUnit,
  TributacaoRegularModelUnit;

type
  [TestFixture]
  TTeste_200002_2 = class
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

{ TTeste_200002_2 }

procedure TTeste_200002_2.Setup;
begin
  ModernInitialize();
  FJsonReader := JsonResource.Create;
end;

procedure TTeste_200002_2.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

procedure TTeste_200002_2.TestCalcularTributos;
var
  LUseCase: ICalculaTributoUseCase;
  LInputJson: CalcularTributoTestInput;
  LInput: CalcularTributoInput;
  LResultado: ROCDomain;
  LItem: ROCItemDomain;
begin
  LInputJson := FJsonReader.DeserializeObject<CalcularTributoTestInput>('entradas/calculoscorretos/Teste_200002_2.json');
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

        Assert.AreEqual(247.30, LItem.ValorBaseCalculoIBSCBS, 0.0001);

        AssertCbs(LItem.GCBS);
        AssertIbsEstadual(LItem.GIBSUF);
        AssertIbsMunicipal(LItem.GIBSMun);

        Assert.IsTrue(LItem.TributacaoRegularModel.IsNull);

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

procedure TTeste_200002_2.AssertCbs(const ACbs: CbsModel);
begin
  Assert.IsNotNull(ACbs);
  Assert.AreEqual(8.40, ACbs.PCBS, 0.0001);
  Assert.AreEqual(0.00, ACbs.VCBS, 0.0001);
end;

procedure TTeste_200002_2.AssertIbsEstadual(const AIbsEstadual: IBSUfModel);
begin
  Assert.IsNotNull(AIbsEstadual);
  Assert.AreEqual(0.05, AIbsEstadual.PIBSUF, 0.0001);
  Assert.AreEqual(0.00, AIbsEstadual.VIBSUF, 0.0001);
end;

procedure TTeste_200002_2.AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
begin
  Assert.IsNotNull(AIbsMunicipal);
  Assert.AreEqual(0.05, AIbsMunicipal.PIBSMun, 0.0001);
  Assert.AreEqual(0.00, AIbsMunicipal.VIBSMun, 0.0001);
end;

procedure TTeste_200002_2.AssertImpostoSeletivo(const AImpostoSeletivo: ImpostoSeletivoModel);
begin
  Assert.IsFalse(AImpostoSeletivo.IsNull);
  Assert.AreEqual(200.00, AImpostoSeletivo.VBCIS, 0.0001);
  Assert.AreEqual(13.00, AImpostoSeletivo.PIS, 0.0001);
  Assert.AreEqual(21.30, AImpostoSeletivo.PISEspec, 0.0001);
  Assert.AreEqual(47.30, AImpostoSeletivo.VIS, 0.0001);
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_200002_2);

end.
