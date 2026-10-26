unit Teste_ItemDuplicadoSemErro;

interface

uses
  DUnitX.TestFramework,
  JsonResourceUnit;

type
  [TestFixture]
  TTest_ItemDuplicadoSemErro = class
  private
    FJsonService: JsonResource;
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
  System.SysUtils,
  ContainerFiscalTestsUnit,
  CalculaTributoUseCaseUnit,
  CalcularTributoInputUnit,
  ROCDomainUnit,
  FiscalCalculosFactoryUnit,
  SetupTestUnit,
  CalculoInputTestModel;

{ TTest_ItemDuplicadoSemErro }

procedure TTest_ItemDuplicadoSemErro.Setup;
begin
  FJsonService := JsonResource.Create();
  ModernInitialize();
end;

procedure TTest_ItemDuplicadoSemErro.TearDown;
begin
  FreeAndNil(FJsonService);
  ModernShutDown();
end;

procedure TTest_ItemDuplicadoSemErro.TestCalcularTributos;
var
  UseCase: ICalculaTributoUseCase;
  InputJson: CalcularTributoTestInput;
  Input: CalcularTributoInput;
  Resultado: ROCDomain;
  segundoItem: ItemCalculoTestInput;
  items: TArray<ItemCalculoTestInput>;
begin
  // Reutiliza o cenario valido de Teste_000001_1 e duplica o item com o mesmo numero.
  // C08-01: itens com o mesmo `numero` nao devem interromper o calculo (ItemDuplicadoException removida).
  InputJson := FJsonService.DeserializeObject<CalcularTributoTestInput>('Entradas\CalculosCorretos\Teste_000001_1.json');
  try
    Assert.IsNotNull(InputJson, 'Cenario de entrada nao carregado');
    Assert.IsTrue(Length(InputJson.Itens) = 1, 'Cenario base deve conter um unico item');

    SetLength(items, 2);
    items[0] := InputJson.Itens[0];
    InputJson.Itens := items;
    segundoItem := ItemCalculoTestInput.Create();
    segundoItem.Numero := InputJson.Itens[0].Numero;
    segundoItem.NCM := InputJson.Itens[0].NCM;
    segundoItem.CST := InputJson.Itens[0].CST;
    segundoItem.cClassTrib := InputJson.Itens[0].cClassTrib;
    segundoItem.BaseCalculo := InputJson.Itens[0].BaseCalculo;
    segundoItem.Quantidade := InputJson.Itens[0].Quantidade;
    segundoItem.Unidade := InputJson.Itens[0].Unidade;
    InputJson.Itens[1] := segundoItem;

    Input := TCalculoInputConverter.ToInput(InputJson);
  finally
    InputJson.Free();
  end;

  UseCase := Container.GetInstance().FiscalCalculosFactory.CreateCalculaTributoUseCase();
  try
    Resultado := UseCase.Executar(Input);
    try
      Assert.IsNotNull(Resultado);
      Assert.AreEqual(2, Length(Resultado.Objetos),
        'Dois itens com o mesmo numero devem ser processados sem ItemDuplicadoException');
    finally
      Resultado.Free();
    end;
  finally
    UseCase.FreeSafe();
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_ItemDuplicadoSemErro);

end.
