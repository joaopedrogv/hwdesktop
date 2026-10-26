unit Teste_000001_7;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel,
  CalcularTributoInputUnit, ROCDomainUnit, ROCItemDomainUnit, CbsModelUnit,
  IBSUfModelUnit, IBSMunModelUnit, TributacaoRegularModelUnit,
  ImpostoSeletivoModelUnit;

type
  [TestFixture]
  TTeste_000001_7 = class
  private
    FJsonReader: JsonResource;
    procedure AssertCbs(const ACbs: CbsModel);
    procedure AssertIbsEstadual(const AIbsEstadual: IBSUfModel);
    procedure AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
    procedure AssertTributacaoRegular(const AItem: ROCItemDomain; const AAliquotaRegularCBS: Double;
      const AValorRegularCBS: Currency; const AAliquotaRegularIBSUF: Double; const AValorRegularIBSUF: Currency;
      const AAliquotaRegularIBSMun: Double; const AValorRegularIBSMun: Currency);
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

{ TTeste_000001_7 }

procedure TTeste_000001_7.Setup;
begin
  ModernInitialize();
  FJsonReader := JsonResource.Create;
end;

procedure TTeste_000001_7.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

procedure TTeste_000001_7.TestCalcularTributos;
var
  LUseCase: ICalculaTributoUseCase;
  LInputJson: CalcularTributoTestInput;
  LInput: CalcularTributoInput;
  LResultado: ROCDomain;
  LItem: ROCItemDomain;
begin
  LInputJson := FJsonReader.DeserializeObject<CalcularTributoTestInput>('entradas/calculoscorretos/Teste_000001_7.json');
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

        AssertTributacaoRegular(LItem, 8.40, 16.80, 0.05, 0.10, 0.05, 0.10);

        Assert.IsTrue(LItem.ImpostoSeletivoModel.IsNull);
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

procedure TTeste_000001_7.AssertCbs(const ACbs: CbsModel);
begin
  Assert.IsNotNull(ACbs);
  // suspensão => sem alíquota no grupo principal
  Assert.AreEqual(0.00, ACbs.PCBS, 0.0001);
  Assert.AreEqual(0.00, ACbs.VCBS, 0.0001);
end;

procedure TTeste_000001_7.AssertIbsEstadual(const AIbsEstadual: IBSUfModel);
begin
  Assert.IsNotNull(AIbsEstadual);
  // suspensão => sem alíquota no grupo principal
  Assert.AreEqual(0.00, AIbsEstadual.PIBSUF, 0.0001);
  Assert.AreEqual(0.00, AIbsEstadual.VIBSUF, 0.0001);
end;

procedure TTeste_000001_7.AssertIbsMunicipal(const AIbsMunicipal: IBSMunModel);
begin
  Assert.IsNotNull(AIbsMunicipal);
  // suspensão => sem alíquota no grupo principal
  Assert.AreEqual(0.00, AIbsMunicipal.PIBSMun, 0.0001);
  Assert.AreEqual(0.00, AIbsMunicipal.VIBSMun, 0.0001);
end;

procedure TTeste_000001_7.AssertTributacaoRegular(const AItem: ROCItemDomain; const AAliquotaRegularCBS: Double;
  const AValorRegularCBS: Currency; const AAliquotaRegularIBSUF: Double; const AValorRegularIBSUF: Currency;
  const AAliquotaRegularIBSMun: Double; const AValorRegularIBSMun: Currency);
var
  LTR: TributacaoRegularModel;
begin
  Assert.IsTrue(AItem.PossuiTributacaoRegular);
  LTR := AItem.TributacaoRegularModel;
  Assert.IsFalse(LTR.IsNull);
  Assert.AreEqual(AAliquotaRegularCBS, LTR.PAliqEfetRegCBS, 0.0001);
  Assert.AreEqual(AValorRegularCBS, LTR.VTribRegCBS, 0.0001);
  Assert.AreEqual(AAliquotaRegularIBSUF, LTR.PAliqEfetRegIBSUF, 0.0001);
  Assert.AreEqual(AValorRegularIBSUF, LTR.VTribRegIBSUF, 0.0001);
  Assert.AreEqual(AAliquotaRegularIBSMun, LTR.PAliqEfetRegIBSMun, 0.0001);
  Assert.AreEqual(AValorRegularIBSMun, LTR.VTribRegIBSMun, 0.0001);
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_000001_7);

end.
