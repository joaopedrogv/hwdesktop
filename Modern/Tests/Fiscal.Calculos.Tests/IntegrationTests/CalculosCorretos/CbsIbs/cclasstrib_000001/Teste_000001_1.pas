unit Teste_000001_1;

interface

uses
  DUnitX.TestFramework,
  TributosModelUnit, CBSModelUnit, IBSMunModelUnit, IBSUFModelUnit, JsonResourceUnit;

type
  [TestFixture]
  TTest_000001_1 = class
  private
    FJsonService: JsonResource;

    procedure AssertCbs(const ACbs: CBSModel);
    procedure AssertIbsEstadual(const AIbsEstadual: IBSUFModel);
    procedure AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestCalcularTributos();
  end;

implementation

uses
  System.SysUtils,
  System.IOUtils,
  REST.Json,
  ContainerFiscalTestsUnit,
  CalculaTributoUseCaseUnit,
  CalcularTributoInputUnit,
  ROCDomainUnit,
  ROCItemDomainUnit,
  FiscalCalculosFactoryUnit, SetupTestUnit, CalculoInputTestModel;

{ TTest_000001_1 }

procedure TTest_000001_1.Setup;
begin
  ModernInitialize();
  FJsonService := JsonResource.Create();
end;

procedure TTest_000001_1.TearDown;
begin
  FJsonService.Free();
  ModernShutDown();
end;

procedure TTest_000001_1.TestCalcularTributos;
var
  UseCase: ICalculaTributoUseCase;
  InputJson: CalcularTributoTestInput;
  Input: CalcularTributoInput;
  Resultado: ROCDomain;
//  JsonContent: string;
//  ResourcePath: string;
begin       {
  // Localiza o arquivo JSON de entrada baseado no caminho relativo esperado
  ResourcePath := TPath.Combine(ExtractFilePath(ParamStr(0)), '..\..\Tests\resources\Entradas\CalculosCorretos\Teste_000001_1.json');
  if not TFile.Exists(ResourcePath) then
    ResourcePath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'resources\Entradas\CalculosCorretos\Teste_000001_1.json');

  if not TFile.Exists(ResourcePath) then
    Assert.Fail('Arquivo de entrada não encontrado: ' + ResourcePath);

  JsonContent := TFile.ReadAllText(ResourcePath);
           }
  // Deserialização do Input usando REST.Json (disponível no Delphi Rio)
  //Input := TJson.JsonToObject<CalcularTributoInput>(JsonContent);
  InputJson := FJsonService.DeserializeObject<CalcularTributoTestInput>('Entradas\CalculosCorretos\Teste_000001_1.json');
  try
    Input := TCalculoInputConverter.ToInput(InputJson);

    // Obtém o UseCase via Container e Factory
    UseCase := Container.GetInstance().FiscalCalculosFactory.CreateCalculaTributoUseCase();
    try
      // Executa o cálculo
      Resultado := UseCase.Executar(Input);
      try
        Assert.IsNotNull(Resultado);
        Assert.IsNotNull(Resultado.Objetos);
        Assert.IsTrue(Length(Resultado.Objetos) > 0);

        // Asserts baseados nos valores do arquivo Java original
        Assert.AreEqual(200.0, Resultado.Objetos[0].ValorBaseCalculoIBSCBS, 0.0001);

        AssertCbs(Resultado.Objetos[0].gCBS);
        AssertIbsEstadual(Resultado.Objetos[0].GIBSUF);
        AssertIbsMunicipal(Resultado.Objetos[0].GIBSMun);
      finally
        Resultado.Free();
      end;
    finally
      UseCase.FreeSafe();
    end;
  finally
    InputJson.Free();
  end;
end;

procedure TTest_000001_1.AssertCbs(const ACbs: CBSModel);
begin
  Assert.IsNotNull(ACbs);
  Assert.AreEqual(0.90, ACbs.PCBS, 0.0001);
  Assert.AreEqual(1.80, ACbs.VCBS, 0.0001);
end;

procedure TTest_000001_1.AssertIbsEstadual(const AIbsEstadual: IBSUFModel);
begin
  Assert.IsNotNull(AIbsEstadual);
  Assert.AreEqual(0.10, AIbsEstadual.PIBSUF, 0.0001);
  Assert.AreEqual(0.20, AIbsEstadual.VIBSUF, 0.0001);
end;

procedure TTest_000001_1.AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
begin
  Assert.IsNotNull(AIbsMunicipal);
  Assert.AreEqual(0.0, AIbsMunicipal.PIBSMun, 0.0001);
  Assert.AreEqual(0.0, AIbsMunicipal.VIBSMun, 0.0001);
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_000001_1);

end.
