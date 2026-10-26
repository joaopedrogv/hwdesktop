unit Teste_000001_2;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel, CBSModelUnit, IBSMunModelUnit, IBSUFModelUnit,
  CalcularTributoInputUnit, ImpostoSeletivoModelUnit;

type
  [TestFixture]
  TTeste_000001_2 = class
  private
    FJsonReader: JsonResource;
    procedure AssertCbs(const ACbs: CBSModel);
    procedure AssertIbsEstadual(const AIbsEstadual: IBSUFModel);
    procedure AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
    procedure AssertImpostoSeletivo(const AImpostoSeletivo: ImpostoSeletivoModel);
  public
    [Setup]
    procedure Setup;
    [Teardown]
    procedure TearDown;
    [Test]
    procedure TestCalcularTributos;
  end;

implementation

uses
  System.SysUtils, CalculaTributoUseCaseUnit, ROCDomainUnit, ROCItemDomainUnit, ContainerFiscalTestsUnit, SetupTestUnit;

{ TTeste_000001_2 }

procedure TTeste_000001_2.Setup;
begin
  FJsonReader := JsonResource.Create;
  ModernInitialize();
end;

procedure TTeste_000001_2.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

procedure TTeste_000001_2.TestCalcularTributos;
var
  UseCase: ICalculaTributoUseCase;
  LInputJson: CalcularTributoTestInput;
  LInput: CalcularTributoInput;
  LItem: ROCItemDomain;
  LResultado: ROCDomain;
begin
  LInputJson := FJsonReader.DeserializeObject<CalcularTributoTestInput>('entradas/calculoscorretos/Teste_000001_2.json');
  UseCase := Container.GetInstance().FiscalCalculosFactory.CreateCalculaTributoUseCase();
  try

    LInput := TCalculoInputConverter.ToInput(LInputJson);
    LResultado := UseCase.Executar(LInput);

    Assert.IsNotNull(LResultado);
    Assert.IsTrue(Length(LResultado.Objetos) > 0);

    LItem := LResultado.Objetos[0];
    Assert.IsNotNull(LItem);

    Assert.AreEqual(247.30, LItem.ValorBaseCalculoIBSCBS, 0.001);

    AssertCbs(LItem.GCBS);
    AssertIbsEstadual(LItem.GIBSUF);
    AssertIbsMunicipal(LItem.GIBSMun);
    AssertImpostoSeletivo(LItem.ImpostoSeletivoModel);
  finally
    LResultado.Free();
    LInputJson.Free;
    UseCase.FreeSafe();
  end;
end;

procedure TTeste_000001_2.AssertCbs(const ACbs: CBSModel);
begin
  Assert.IsNotNull(ACbs);
  Assert.AreEqual(8.40, ACbs.PCBS, 0.001);
  Assert.AreEqual(20.77, ACbs.VCBS, 0.001);
end;

procedure TTeste_000001_2.AssertIbsEstadual(const AIbsEstadual: IBSUFModel);
begin
  Assert.IsNotNull(AIbsEstadual);
  Assert.AreEqual(0.05, AIbsEstadual.PIBSUF, 0.001);
  Assert.AreEqual(0.12, AIbsEstadual.VIBSUF, 0.001);
end;

procedure TTeste_000001_2.AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
begin
  Assert.IsNotNull(AIbsMunicipal);
  Assert.AreEqual(0.05, AIbsMunicipal.PIBSMun, 0.001);
  Assert.AreEqual(0.12, AIbsMunicipal.VIBSMun, 0.001);
end;

procedure TTeste_000001_2.AssertImpostoSeletivo(const AImpostoSeletivo: ImpostoSeletivoModel);
begin
  Assert.IsFalse(AImpostoSeletivo.IsNull);
  Assert.AreEqual(200.00, AImpostoSeletivo.VBCIS, 0.001);
  Assert.AreEqual(13.00, AImpostoSeletivo.PIS, 0.001);
  Assert.AreEqual(21.30, AImpostoSeletivo.PISEspec, 0.001);
  Assert.AreEqual(47.30, AImpostoSeletivo.VIS, 0.001);
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_000001_2);

end.
