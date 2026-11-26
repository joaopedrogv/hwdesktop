unit Teste_ValidacaoBaseLegado;

interface

uses
  DUnitX.TestFramework, JsonResourceUnit, CalculoInputTestModel, ROCDomainUnit, ROCItemDomainUnit,
  CalcularTributoInputUnit;

const
  ENTRADA_000001_1 = 'entradas/calculoscorretos/Teste_000001_1.json';
  ENTRADA_000001_2 = 'entradas/calculoscorretos/Teste_000001_2.json';

type
  [TestFixture]
  TTeste_ValidacaoBaseLegado = class
  private
    FJsonReader: JsonResource;
    function CarregarOperacao(const ARecurso: string): CalcularTributoTestInput;
    procedure Configurar(const AItem: ItemCalculoTestInput;
      const ABaseCalculo: Double; AInformarBase: Boolean;
      const ABaseCalculoIS: Double; AInformarBaseIS: Boolean;
      const AImpostoInformado: Double; AInformarImposto: Boolean);
    procedure RemoverImpostoSeletivo(const AItem: ItemCalculoTestInput);
    function Executar(const AJson: CalcularTributoTestInput): ROCDomain;
    procedure AssertValidacao(const AResultado: ROCDomain; const ACodigo, ADetalhe: string);
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure teste_SemImpostoSeletivoSemBase_Reg025;
    [Test]
    procedure teste_GrupoImpostoSeletivoSemBase_Reg023;
    [Test]
    procedure teste_BaseInconsistente_Reg026;
    [Test]
    procedure teste_BaseMenorBaseImpostoSeletivo_Reg027;
    [Test]
    procedure teste_ImpostoInformadoZero_Aceito;
    [Test]
    procedure teste_BaseIgualBaseImpostoSeletivoSemImpostoInformado_Aceito;
    [Test]
    procedure teste_BaseMaiorSemImpostoInformado_Aceito;
    [Test]
    procedure teste_FormaNfseSemImpostoSeletivo_BasePresente_Aceito;
  end;

implementation

uses
  System.SysUtils, CalculaTributoUseCaseUnit, ContainerFiscalTestsUnit, SetupTestUnit;

{ TTeste_ValidacaoBaseLegado }

procedure TTeste_ValidacaoBaseLegado.Setup;
begin
  FJsonReader := JsonResource.Create;
  ModernInitialize();
end;

procedure TTeste_ValidacaoBaseLegado.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

function TTeste_ValidacaoBaseLegado.CarregarOperacao(const ARecurso: string): CalcularTributoTestInput;
begin
  Result := FJsonReader.DeserializeObject<CalcularTributoTestInput>(ARecurso);
end;

procedure TTeste_ValidacaoBaseLegado.Configurar(const AItem: ItemCalculoTestInput;
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

procedure TTeste_ValidacaoBaseLegado.RemoverImpostoSeletivo(const AItem: ItemCalculoTestInput);
begin
  AItem.ImpostoSeletivo.Free;
  AItem.ImpostoSeletivo := nil;
end;

function TTeste_ValidacaoBaseLegado.Executar(const AJson: CalcularTributoTestInput): ROCDomain;
var
  useCase: ICalculaTributoUseCase;
  entrada: CalcularTributoInput;
begin
  useCase := Container.GetInstance().FiscalCalculosFactory.CreateCalculaTributoUseCase();
  try
    entrada := TCalculoInputConverter.ToInput(AJson);
    Result := useCase.Executar(entrada);
  finally
    useCase.FreeSafe;
  end;
end;

procedure TTeste_ValidacaoBaseLegado.AssertValidacao(const AResultado: ROCDomain;
  const ACodigo, ADetalhe: string);
var
  i: Integer;
  encontrada: Boolean;
begin
  Assert.IsFalse(AResultado.Validacoes.IsValid, 'calculo deve gerar validacao');
  encontrada := False;
  for i := 0 to High(AResultado.Validacoes.Validacoes) do
    if AResultado.Validacoes.Validacoes[i].CodigoTexto = ACodigo then
    begin
      encontrada := True;
      Assert.AreEqual(ADetalhe, AResultado.Validacoes.Validacoes[i].Detalhe,
        'mensagem da validacao ' + ACodigo);
    end;
  Assert.IsTrue(encontrada, 'validacao ' + ACodigo + ' deve estar presente');
end;

procedure TTeste_ValidacaoBaseLegado.teste_SemImpostoSeletivoSemBase_Reg025;
var
  json: CalcularTributoTestInput;
  resultado: ROCDomain;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    RemoverImpostoSeletivo(json.Itens[0]);
    json.Itens[0].SemBaseCalculo := True;

    resultado := Executar(json);
    try
      AssertValidacao(resultado, 'REG-025',
        'A base de cálculo de CBS e IBS deve ser informada quando o grupo do Imposto Seletivo não é informado');
      Assert.IsTrue((Length(resultado.Objetos) = 0) or (resultado.Objetos[0].TribCalc = nil),
        'item invalido nao deve publicar tributos');
    finally
      resultado.Free;
    end;
  finally
    json.Free;
  end;
end;

procedure TTeste_ValidacaoBaseLegado.teste_GrupoImpostoSeletivoSemBase_Reg023;
var
  json: CalcularTributoTestInput;
  resultado: ROCDomain;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    json.Itens[0].ImpostoSeletivo.SemBaseCalculoIS := True;

    resultado := Executar(json);
    try
      AssertValidacao(resultado, 'REG-023',
        'A base de cálculo do Imposto Seletivo deve ser informada quando o grupo de Imposto Seletivo é informado');
    finally
      resultado.Free;
    end;
  finally
    json.Free;
  end;
end;

procedure TTeste_ValidacaoBaseLegado.teste_BaseInconsistente_Reg026;
var
  json: CalcularTributoTestInput;
  resultado: ROCDomain;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 200, True, 187, True, 12, True);

    resultado := Executar(json);
    try
      AssertValidacao(resultado, 'REG-026',
        'A base de cálculo de CBS e IBS informada 200 difere da soma da base de cálculo do ' +
        'Imposto Seletivo 187 com o Imposto Seletivo informado 12');
    finally
      resultado.Free;
    end;
  finally
    json.Free;
  end;
end;

procedure TTeste_ValidacaoBaseLegado.teste_BaseMenorBaseImpostoSeletivo_Reg027;
var
  json: CalcularTributoTestInput;
  resultado: ROCDomain;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 100, True, 188, True, 0, False);

    resultado := Executar(json);
    try
      AssertValidacao(resultado, 'REG-027',
        'A base de cálculo de CBS e IBS informada 100 é menor que a base de cálculo do ' +
        'Imposto Seletivo 188');
    finally
      resultado.Free;
    end;
  finally
    json.Free;
  end;
end;

procedure TTeste_ValidacaoBaseLegado.teste_ImpostoInformadoZero_Aceito;
var
  json: CalcularTributoTestInput;
  resultado: ROCDomain;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 188, True, 188, True, 0, True);

    resultado := Executar(json);
    try
      Assert.IsTrue(resultado.Validacoes.IsValid);
      Assert.IsNotNull(resultado.Objetos[0].TribCalc);
      Assert.AreEqual(233.74, resultado.Objetos[0].ValorBaseCalculoIBSCBS, 0.001);
    finally
      resultado.Free;
    end;
  finally
    json.Free;
  end;
end;

procedure TTeste_ValidacaoBaseLegado.teste_BaseIgualBaseImpostoSeletivoSemImpostoInformado_Aceito;
var
  json: CalcularTributoTestInput;
  resultado: ROCDomain;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 188, True, 188, True, 0, False);

    resultado := Executar(json);
    try
      Assert.IsTrue(resultado.Validacoes.IsValid);
      Assert.IsNotNull(resultado.Objetos[0].TribCalc);
    finally
      resultado.Free;
    end;
  finally
    json.Free;
  end;
end;

procedure TTeste_ValidacaoBaseLegado.teste_BaseMaiorSemImpostoInformado_Aceito;
var
  json: CalcularTributoTestInput;
  resultado: ROCDomain;
begin
  json := CarregarOperacao(ENTRADA_000001_2);
  try
    Configurar(json.Itens[0], 200, True, 188, True, 0, False);

    resultado := Executar(json);
    try
      Assert.IsTrue(resultado.Validacoes.IsValid);
      Assert.IsNotNull(resultado.Objetos[0].TribCalc);
    finally
      resultado.Free;
    end;
  finally
    json.Free;
  end;
end;

procedure TTeste_ValidacaoBaseLegado.teste_FormaNfseSemImpostoSeletivo_BasePresente_Aceito;
var
  json: CalcularTributoTestInput;
  resultado: ROCDomain;
begin
  // A entrada oficial sem IS e sem TpDoc reproduz a forma da emissao NFS-e.
  json := CarregarOperacao(ENTRADA_000001_1);
  try
    RemoverImpostoSeletivo(json.Itens[0]);

    resultado := Executar(json);
    try
      Assert.IsTrue(resultado.Validacoes.IsValid, 'emissao NFS-e nao deve gerar validacao fatal');
      Assert.IsNotNull(resultado.Objetos[0].TribCalc);
      Assert.AreEqual(200.00, resultado.Objetos[0].ValorBaseCalculoIBSCBS, 0.001);
    finally
      resultado.Free;
    end;
  finally
    json.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_ValidacaoBaseLegado);

end.
