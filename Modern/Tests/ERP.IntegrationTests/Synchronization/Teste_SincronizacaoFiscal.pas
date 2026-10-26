unit Teste_SincronizacaoFiscal;

interface

uses
  DUnitX.TestFramework, ConfigurationTestUnit, JsonResourceUnit;

type
  [TestFixture]
  TTeste_SincronizacaoFiscal = class
  private
    FJsonReader: JsonResource;
    FConfig: ConfigurationTest;
    FApiCalculadoraHabilitada: Boolean;
    FTokenApiLocal: string;
    function LocalizarArquivoConfig(const ANome: string): string;
    procedure CarregarConfigApiLocal;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure SincronizarDadosFormulario();

    [Test]
    procedure SincronizarDados();

    [Test]
    procedure SincronizarDadosCalculadoraApi();
  end;

implementation

uses
  SysUtils, Classes, System.JSON, System.IOUtils,
  SetupTestUnit, ContainerDFeUnit, UDownloadArquivosFiscaisForm, SetupUnit, IProgressObserverUnit,
  UIProgressObserverUnit, ArquivoDownloadModel, ManifestFilesModelUnit,
  AtualizacaoCalculadoraModelUnit, ConfiguracaoRtcUnit;

type
  /// <summary>
  ///   Observador de progresso de teste que acumula mensagens e erros. Nao
  ///   reencaminha OnError para o proprio callback (evita recursao) e nao
  ///   registra token; a busca por token existe apenas para asseverar o sigilo.
  /// </summary>
  TestProgressObserver = class(UIProgressObserver)
  private
    FCountErros: Integer;
    FMessages: TStringList;
    FErrors: TStringList;
    procedure LogError(const Value: string);
    procedure LogMessage(const Value: string);
    function Contem(const ALista: TStrings; const ATexto: string): Boolean;
  public
    constructor Create();
    destructor Destroy; override;
    function GetErros(): string;

    function TextoContido(const ATexto: string): Boolean;
    property CountErros: Integer read FCountErros;
  end;

{ TestProgressObserver }

constructor TestProgressObserver.Create;
begin
  inherited Create( LogMessage, nil, LogError, nil, nil, nil, nil, nil );
  FCountErros := 0;
  FMessages := TStringList.Create;
  FErrors := TStringList.Create;
end;

destructor TestProgressObserver.Destroy;
begin
  FMessages.Free;
  FErrors.Free;
  inherited;
end;

function TestProgressObserver.GetErros(): string;
begin
  Result := FErrors.Text;
end;

procedure TestProgressObserver.LogMessage(const Value: string);
begin
  FMessages.Add(Value);
end;

procedure TestProgressObserver.LogError(const Value: string);
begin
  Inc(FCountErros);
  FErrors.Add(Value);
end;

function TestProgressObserver.Contem(const ALista: TStrings; const ATexto: string): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to ALista.Count - 1 do
    if Pos(ATexto, ALista[I]) > 0 then
      Exit(True);
end;

function TestProgressObserver.TextoContido(const ATexto: string): Boolean;
begin
  Result := (ATexto <> '') and (Contem(FMessages, ATexto) or Contem(FErrors, ATexto));
end;

{ TTeste_SincronizacaoFiscal }

procedure TTeste_SincronizacaoFiscal.SincronizarDados;
var
  observer: IProgressObserver;
  updates: TArray<ArquivoDownload>;
  manifest: ManifestModel;
  I: Integer;
begin
  if not FConfig.CustomTests.Sincronizacaototal then
    Exit;

  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True', [ FConfig.DatabaseNameSinc ])
  );
  observer := TestProgressObserver.Create();//( nil, nil, nil, nil, nil, nil, nil, nil );
  try
    manifest := FJsonReader.DeserializeObject<ManifestModel>('fiscal-dist/manifest.json');

    SetLength(updates, Length(manifest.files));
    for I := Low(manifest.files) to High(manifest.files) do
      updates[I] := ArquivoDownload.Create( manifest.files[I].path, manifest.files[I].url, manifest.files[I].hash );

    ContainerDFe.GetInstance().DFeFeaturesFactory.CreateSincronizarDadosFiscaisUseCase( observer )
      .Executar( updates );

    Assert.AreEqual(0 , (observer as TestProgressObserver).CountErros, 0.0001);

  finally
    AppSetup.DatabaseConnection.Connect(
      Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True', [ FConfig.DatabaseName ])
    );
  end;
end;

procedure TTeste_SincronizacaoFiscal.SincronizarDadosCalculadoraApi;
var
  observer: IProgressObserver;
  observerSpy: TestProgressObserver;
  atualizacao: AtualizacaoCalculadoraModel;
begin
  // Fluxo da API gated: exige a flag local explicita
  // (customTests.sincronizacaoApiCalculadora em test-config.json, nao commitada
  // com valor habilitado). Nunca roda implicitamente.
  if not FApiCalculadoraHabilitada then
    Exit;

  // A aplicacao da calculadora escreve apenas no banco de teste; nunca no banco
  // operacional conectado por ModernInitialize.
  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True', [ FConfig.DatabaseNameSinc ])
  );
  try
    observer := TestProgressObserver.Create();
    observerSpy := observer as TestProgressObserver;
    try
      atualizacao := ContainerDFe.GetInstance().DFeFeaturesFactory
        .CreateObterAtualizacaoCalculadoraUseCase( observer ).Executar();

      if atualizacao.Estado = enNovaVersaoDisponivel then
        ContainerDFe.GetInstance().DFeFeaturesFactory
          .CreateSincronizarCalculadoraUseCase( observer ).Executar( atualizacao );

      // Verificacao opcional de coerencia do estado do modelo, sob a mesma flag
      // gated. Sem mensagem/UI e sem assumir a DLL: apenas verifica invariantes
      // garantidas pela regra do use case.
      if atualizacao.Estado = enNovaVersaoERP then
      begin
        Assert.IsTrue(atualizacao.VersaoRemoto <> '',
          'Estado que exige atualizacao do ERP deve informar a versao publicada superior.');
      end;

      if atualizacao.Estado = enNovaVersaoDisponivel then
      begin
        Assert.IsTrue(atualizacao.VersaoRemoto <> '',
          'Estado aplicavel deve informar a versao da calculadora.');
        Assert.IsTrue(atualizacao.Database = 'rtc-' + atualizacao.VersaoRemoto,
          'O banco do descritor aplicavel deve derivar da versao da calculadora.');
      end;

      Assert.AreEqual(0, observerSpy.CountErros,
        'O fluxo da calculadora via API nao deve reportar erro:' + observerSpy.GetErros());

      // O token local (nunca commitado) nao pode aparecer em nenhuma saida.
      Assert.IsFalse(observerSpy.TextoContido(FTokenApiLocal),
        'O token da API nunca deve aparecer na saida do observador.');
      Assert.IsFalse(observerSpy.TextoContido('Authorization'),
        'A saida nao deve expor o cabecalho Authorization.');
    finally
      observer := nil;
    end;
  finally
    AppSetup.DatabaseConnection.Connect(
      Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True', [ FConfig.DatabaseName ])
    );
  end;
end;

procedure TTeste_SincronizacaoFiscal.SincronizarDadosFormulario;
var
  form: TDownloadArquivosFiscaisForm;
begin
  // O formulario executa check+sync de arquivos e, por desenho do Inc.7, tambem
  // o fluxo da calculadora via API. Para nao exercita-lo implicitamente, exige
  // conjuntamente a flag local da API (customTests.sincronizacaoApiCalculadora):
  // o teste de fluxo completo e opt-in junto com a API.
  if not (FConfig.CustomTests.Sincronizacaototal and FApiCalculadoraHabilitada) then
    Exit;

  // A escrita ocorre apenas no banco de teste (nunca no operacional).
  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True', [ FConfig.DatabaseNameSinc ])
  );
  try
    form := TDownloadArquivosFiscaisForm.Create(nil);
    try
      form.CloseAfter := True;
      form.ShowModal;

      Assert.AreEqual(0 , form.CountErros, 0.0001);

    finally
      form.free();
    end;
  finally
    AppSetup.DatabaseConnection.Connect(
      Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True', [ FConfig.DatabaseName ])
    );
  end;
end;

function TTeste_SincronizacaoFiscal.LocalizarArquivoConfig(const ANome: string): string;
var
  Base: string;
begin
  Base := TPath.Combine(ExtractFilePath(ParamStr(0)), '..\..\resources');
  if not TDirectory.Exists(Base) then
    Base := TPath.Combine(ExtractFilePath(ParamStr(0)), '..\resources');
  if not TDirectory.Exists(Base) then
    Base := TPath.Combine(ExtractFilePath(ParamStr(0)), 'resources');
  if not TDirectory.Exists(Base) then
    Base := '';

  Result := TPath.Combine(Base, ANome);
  if not TFile.Exists(Result) then
    Result := '';
end;

procedure TTeste_SincronizacaoFiscal.CarregarConfigApiLocal;
var
  Caminho, Conteudo: string;
  Root, CustomTests, Valor: TJSONValue;
begin
  // A flag e o token da API sao locais (nunca commitados com valor habilitado).
  // Qualquer ausencia/falha de leitura mantem o fluxo da API desabilitado.
  FApiCalculadoraHabilitada := False;
  FTokenApiLocal := '';

  Caminho := LocalizarArquivoConfig('test-config.json');
  if Caminho = '' then
    Exit;

  Conteudo := TFile.ReadAllText(Caminho);
  if Conteudo = '' then
    Exit;

  Root := TJSONObject.ParseJSONValue(Conteudo);
  if not Assigned(Root) then
    Exit;

  try
    if not (Root is TJSONObject) then
      Exit;

    CustomTests := TJSONObject(Root).GetValue('customTests');
    if not (Assigned(CustomTests) and (CustomTests is TJSONObject)) then
      Exit;

    Valor := TJSONObject(CustomTests).GetValue('sincronizacaoApiCalculadora');
    if Assigned(Valor) and SameText(Valor.Value, 'true') then
      FApiCalculadoraHabilitada := True;

    Valor := TJSONObject(CustomTests).GetValue('rtcApiToken');
    if Assigned(Valor) then
      FTokenApiLocal := Trim(Valor.Value);
  finally
    Root.Free;
  end;
end;

procedure TTeste_SincronizacaoFiscal.Setup;
begin
  ModernInitialize();
  FConfig :=  GetConfig();
  FJsonReader := JsonResource.Create();

  CarregarConfigApiLocal;
end;

procedure TTeste_SincronizacaoFiscal.TearDown;
begin
  ModernShutDown();
  FJsonReader.Free();
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_SincronizacaoFiscal);

end.
