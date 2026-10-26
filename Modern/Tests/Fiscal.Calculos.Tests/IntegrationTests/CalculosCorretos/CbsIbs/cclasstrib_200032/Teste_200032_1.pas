unit Teste_200032_1;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel,
  CalcularTributoInputUnit, ROCDomainUnit, ROCItemDomainUnit, CbsModelUnit,
  IBSUfModelUnit, IBSMunModelUnit, ReducaoAliquotaModelUnit,
  ImpostoSeletivoModelUnit, TributacaoRegularModelUnit;

type
  [TestFixture]
  TTeste_200032_1 = class
  private
    FJsonReader: JsonResource;
    procedure AssertCbs(const ACbs: CbsModel);
    procedure AssertIbsEstadual(const AIbsEstadual: IBSUfModel);
    procedure AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
    procedure AssertGrupoReducao(const AGrupoReducao: ReducaoAliquotaModel; const AAliquotaEfetiva, AReducao: Double);
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

{ TTeste_200032_1 }

procedure TTeste_200032_1.Setup;
begin
  ModernInitialize();
  FJsonReader := JsonResource.Create;
end;

procedure TTeste_200032_1.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

procedure TTeste_200032_1.TestCalcularTributos;
var
  LUseCase: ICalculaTributoUseCase;
  LInputJson: CalcularTributoTestInput;
  LInput: CalcularTributoInput;
  LResultado: ROCDomain;
  LItem: ROCItemDomain;
begin
  LInputJson := FJsonReader.DeserializeObject<CalcularTributoTestInput>('entradas/calculoscorretos/Teste_200032_1.json');
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

        Assert.AreEqual(200.00, LItem.ValorBaseCalculoIBSCBS, 0.0001);

        AssertCbs(LItem.GCBS);
        AssertIbsEstadual(LItem.GIBSUF);
        AssertIbsMunicipal(LItem.GIBSMun);

        Assert.IsTrue(LItem.ImpostoSeletivoModel.IsNull);
        Assert.IsTrue(LItem.TributacaoRegularModel.IsNull);
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

procedure TTeste_200032_1.AssertCbs(const ACbs: CbsModel);
begin
  Assert.IsNotNull(ACbs);
  Assert.AreEqual(0.90, ACbs.PCBS, 0.0001);
  Assert.AreEqual(0.72, ACbs.VCBS, 0.0001);
  AssertGrupoReducao(ACbs.GRed, 0.36, 60);
end;

procedure TTeste_200032_1.AssertIbsEstadual(const AIbsEstadual: IBSUfModel);
begin
  Assert.IsNotNull(AIbsEstadual);
  Assert.AreEqual(0.10, AIbsEstadual.PIBSUF, 0.0001);
  Assert.AreEqual(0.08, AIbsEstadual.VIBSUF, 0.0001);
  AssertGrupoReducao(AIbsEstadual.GRed, 0.04, 60);
end;

procedure TTeste_200032_1.AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
begin
  Assert.IsNotNull(AIbsMunicipal);
  Assert.AreEqual(0.00, AIbsMunicipal.PIBSMun, 0.0001);
  Assert.AreEqual(0.00, AIbsMunicipal.VIBSMun, 0.0001);
  AssertGrupoReducao(AIbsMunicipal.GRed, 0.00, 60);
end;

procedure TTeste_200032_1.AssertGrupoReducao(const AGrupoReducao: ReducaoAliquotaModel; const AAliquotaEfetiva, AReducao: Double);
begin
  Assert.IsFalse(AGrupoReducao.IsNull);
  Assert.AreEqual(AReducao, AGrupoReducao.PRedAliq, 0.0001);
  Assert.AreEqual(AAliquotaEfetiva, AGrupoReducao.PAliqEfet, 0.0001);
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_200032_1);

end.
