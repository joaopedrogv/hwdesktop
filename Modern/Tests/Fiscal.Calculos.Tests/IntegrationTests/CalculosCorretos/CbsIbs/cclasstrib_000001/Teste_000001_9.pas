unit Teste_000001_9;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel, ROCDomainUnit, ROCItemDomainUnit;

const
  ENTRADA_000001_1 = 'entradas/calculoscorretos/Teste_000001_1.json';
  ENTRADA_000001_2 = 'entradas/calculoscorretos/Teste_000001_2.json';

type
  [TestFixture]
  TTeste_000001_9 = class
  private
    FJsonReader: JsonResource;
    function CarregarOperacao(const ARecurso: string): CalcularTributoTestInput;
    procedure Configurar(const AItem: ItemCalculoTestInput;
      const ABaseCalculo: Double; AInformarBase: Boolean;
      const ABaseCalculoIS: Double; AInformarBaseIS: Boolean;
      const AImpostoInformado: Double; AInformarImposto: Boolean);
    function CalcularBaseCalculoIbsCbs(const AJson: CalcularTributoTestInput): Currency;
  public
    [Setup]
    procedure Setup;
    [Teardown]
    procedure TearDown;
    [Test]
    procedure testEntradaConsistente;
    [Test]
    procedure testBaseCalculoDerivadaComImpostoInformado;
    [Test]
    procedure testBaseCalculoDerivadaSemImpostoInformado;
    [Test]
    procedure testBaseCalculoMaiorSemImpostoInformado;
    [Test]
    procedure testBaseCalculoIgualBaseCalculoIsSemImpostoInformado;
    [Test]
    procedure testImpostoInformadoZero;
    [Test]
    procedure testValoresComCasasDecimais;
    [Test]
    procedure testItemSemImpostoSeletivoComBaseCalculo;
  end;

implementation

uses
  System.SysUtils, CalculaTributoUseCaseUnit, CalcularTributoInputUnit, ContainerFiscalTestsUnit, SetupTestUnit;

{ TTeste_000001_9 }

procedure TTeste_000001_9.Setup;
begin
  FJsonReader := JsonResource.Create;
  ModernInitialize();
end;

procedure TTeste_000001_9.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

function TTeste_000001_9.CarregarOperacao(const ARecurso: string): CalcularTributoTestInput;
begin
  Result := FJsonReader.DeserializeObject<CalcularTributoTestInput>(ARecurso);
end;

procedure TTeste_000001_9.Configurar(const AItem: ItemCalculoTestInput;
  const ABaseCalculo: Double; AInformarBase: Boolean;
  const ABaseCalculoIS: Double; AInformarBaseIS: Boolean;
  const AImpostoInformado: Double; AInformarImposto: Boolean);
begin
  AItem.SemBaseCalculo := not AInformarBase;
  if AInformarBase then
    AItem.BaseCalculo := ABaseCalculo;

  AItem.ImpostoSeletivo.SemBaseCalculoIS := not AInformarBaseIS;
  if AInformarBaseIS then
    AItem.ImpostoSeletivo.BaseCalculo := ABaseCalculoIS;

  AItem.ImpostoSeletivo.SemImpostoInformado := not AInformarImposto;
  if AInformarImposto then
    AItem.ImpostoSeletivo.ImpostoInformado := AImpostoInformado;
end;

function TTeste_000001_9.CalcularBaseCalculoIbsCbs(const AJson: CalcularTributoTestInput): Currency;
var
  useCase: ICalculaTributoUseCase;
  entrada: CalcularTributoInput;
  resultado: ROCDomain;
begin
  useCase := Container.GetInstance().FiscalCalculosFactory.CreateCalculaTributoUseCase();
  try
    entrada := TCalculoInputConverter.ToInput(AJson);
    resultado := useCase.Executar(entrada);
    try
      Assert.IsNotNull(resultado);
      Assert.IsNotNull(resultado.Objetos);
      Assert.IsTrue(Length(resultado.Objetos) > 0);
      Assert.IsNotNull(resultado.Objetos[0]);
      Assert.IsTrue(resultado.Validacoes.IsValid, 'calculo oficial nao deve gerar validacao');
      Result := resultado.Objetos[0].ValorBaseCalculoIBSCBS;
    finally
      resultado.Free;
    end;
  finally
    useCase.FreeSafe;
  end;
end;

procedure TTeste_000001_9.testEntradaConsistente;
var
  json: CalcularTributoTestInput;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 200, True, 188, True, 12, True);
    Assert.AreEqual(233.74, CalcularBaseCalculoIbsCbs(json), 0.001);
  finally
    json.Free;
  end;
end;

procedure TTeste_000001_9.testBaseCalculoDerivadaComImpostoInformado;
var
  json: CalcularTributoTestInput;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 0, False, 188, True, 12, True);
    Assert.AreEqual(233.74, CalcularBaseCalculoIbsCbs(json), 0.001);
  finally
    json.Free;
  end;
end;

procedure TTeste_000001_9.testBaseCalculoDerivadaSemImpostoInformado;
var
  json: CalcularTributoTestInput;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 0, False, 188, True, 0, False);
    Assert.AreEqual(233.74, CalcularBaseCalculoIbsCbs(json), 0.001);
  finally
    json.Free;
  end;
end;

procedure TTeste_000001_9.testBaseCalculoMaiorSemImpostoInformado;
var
  json: CalcularTributoTestInput;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 200, True, 188, True, 0, False);
    Assert.AreEqual(245.74, CalcularBaseCalculoIbsCbs(json), 0.001);
  finally
    json.Free;
  end;
end;

procedure TTeste_000001_9.testBaseCalculoIgualBaseCalculoIsSemImpostoInformado;
var
  json: CalcularTributoTestInput;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 188, True, 188, True, 0, False);
    Assert.AreEqual(233.74, CalcularBaseCalculoIbsCbs(json), 0.001);
  finally
    json.Free;
  end;
end;

procedure TTeste_000001_9.testImpostoInformadoZero;
var
  json: CalcularTributoTestInput;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 188, True, 188, True, 0, True);
    Assert.AreEqual(233.74, CalcularBaseCalculoIbsCbs(json), 0.001);
  finally
    json.Free;
  end;
end;

procedure TTeste_000001_9.testValoresComCasasDecimais;
var
  json: CalcularTributoTestInput;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 200.50, True, 188.25, True, 12.25, True);
    Assert.AreEqual(234.02, CalcularBaseCalculoIbsCbs(json), 0.001);
  finally
    json.Free;
  end;
end;

procedure TTeste_000001_9.testItemSemImpostoSeletivoComBaseCalculo;
var
  json: CalcularTributoTestInput;
begin
  json := CarregarOperacao(ENTRADA_000001_1);
  try
    Assert.AreEqual(200.00, CalcularBaseCalculoIbsCbs(json), 0.001);
  finally
    json.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_000001_9);

end.
