unit Test_SincronizarDadosFiscaisSemCalculadora;

interface

uses
  Classes,
  System.SysUtils,
  StrUtils,
  DUnitX.TestFramework,
  IProgressObserverUnit,
  IDownloadServiceUnit,
  IDataBaseConnectionUnit,
  ISincronizadorNCMsSICOMEXServiceUnit,
  ISincronizadorTabelaIbptServiceUnit,
  ISincronizadorFiscalNFSeServiceUnit,
  ISincronizarDadosFiscaisUseCaseUnit,
  ArquivoDownloadModel,
  ArquivosSICOMEXInputUnit,
  ConfiguracaoEtdUnit,
  FakeDatabaseConnectionUnit,
  FakeTransactionUnit,
  FakeConfiguracoesRepositoryUnit;

type
  /// <summary>
  ///   Spy de IProgressObserver que acumula mensagens e erros para assercao.
  ///   Nao registra token; apenas o conteudo recebido do use case.
  /// </summary>
  TFakeObserverFiscal = class(TInterfacedObject, IProgressObserver)
  private
    FMessages: TStringList;
    FErrors: TStringList;

    function ListaContem(const ALista: TStrings; const ATexto: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    procedure OnMessage(const Message: string);
    procedure OnWarning(const Warning: string);
    procedure OnError(const Error: string);
    procedure OnProgress(Progress: Integer);
    procedure OnCounter(Current, Total: Integer);
    procedure OnStart;
    procedure OnComplete;
    procedure OnCancel;
    procedure CancelRequest;
    function IsCancellationRequested: Boolean;

    function MensagemContem(const ATexto: string): Boolean;
    function ErroContem(const ATexto: string): Boolean;

    property Messages: TStringList read FMessages;
    property Errors: TStringList read FErrors;
  end;

  /// <summary>
  ///   Fake funcional de IDownloadService: registra cada destino pedido e cria o
  ///   arquivo no destino (o use case verifica FileExists). Chamadas de
  ///   infraestrutura nao usadas pelo fluxo falham de forma explicita.
  /// </summary>
  TFakeDownloadService = class(TInterfacedObject, IDownloadService)
  private
    FDestinos: TStringList;
    FArquivosCriados: TStringList;
  public
    constructor Create;
    destructor Destroy; override;

    function DownloadFile(const URL: string; const DestPath: string): TDownloadResult;
    function DownloadFileToMemory(const URL: string): TBytes;
    function GetFileSize(const URL: string): Int64;

    function FoiBaixado(const ANomeArquivo: string): Boolean;
    function TotalDownloads: Integer;
  end;

  /// <summary>
  ///   Spy de ISincronizadorNCMsSICOMEXService. Nao reproduz regra de negocio;
  ///   apenas registra a chamada e devolve o resultado configurado.
  /// </summary>
  TFakeSincronizadorNCM = class(TInterfacedObject, ISincronizadorNCMsSICOMEXService)
  private
    FChamado: Boolean;
    FResultado: Boolean;
  public
    constructor Create;

    function Executar(const Input: ArquivosSICOMEXInput): Boolean;
    procedure ConfigurarResultado(const AResultado: Boolean);

    property Chamado: Boolean read FChamado;
  end;

  /// <summary>
  ///   Spy de ISincronizadorTabelaIbptService.
  /// </summary>
  TFakeSincronizadorIbpt = class(TInterfacedObject, ISincronizadorTabelaIbptService)
  private
    FChamado: Boolean;
    FResultado: Boolean;
  public
    constructor Create;

    function Executar(const Input: SincronizadorTabelaIbptInput): Boolean;
    procedure ConfigurarResultado(const AResultado: Boolean);

    property Chamado: Boolean read FChamado;
  end;

  /// <summary>
  ///   Spy de ISincronizadorFiscalNFSeService.
  /// </summary>
  TFakeSincronizadorNFSe = class(TInterfacedObject, ISincronizadorFiscalNFSeService)
  private
    FChamado: Boolean;
    FResultado: Boolean;
  public
    constructor Create;

    function Executar(const FileName: string): Boolean;
    procedure ConfigurarResultado(const AResultado: Boolean);

    property Chamado: Boolean read FChamado;
  end;

  [TestFixture]
  TTestSincronizarDadosFiscaisSemCalculadora = class
  private
    FTransactionState: TTransactionSpyState;
    FConnection: TFakeDatabaseConnection;
    FConfigRepo: TFakeConfiguracoesRepository;
    FObserver: TFakeObserverFiscal;
    FObserverIntf: IProgressObserver;
    FDownloader: TFakeDownloadService;
    FDownloaderIntf: IDownloadService;
    FSincNCM: TFakeSincronizadorNCM;
    FSincNCMIntf: ISincronizadorNCMsSICOMEXService;
    FSincIbpt: TFakeSincronizadorIbpt;
    FSincIbptIntf: ISincronizadorTabelaIbptService;
    FSincNFSe: TFakeSincronizadorNFSe;
    FSincNFSeIntf: ISincronizadorFiscalNFSeService;
    FUseCase: ISincronizarDadosFiscaisUseCase;

    function HashGravadoPara(const ANome: string): Boolean;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveIgnorarCalculadoraDbSemDownloadNemHash;

    [Test]
    procedure DeveManterFluxoIbptComCalculadoraDbNoLote;

    [Test]
    procedure DeveManterFluxoNFSeComCalculadoraDbNoLote;

    [Test]
    procedure DeveManterFluxoNCMsComCalculadoraDbNoLote;
  end;

implementation

uses
  SincronizarDadosFiscaisUseCaseUnit;

const
  NOME_CALCULADORA = 'calculadora.db';
  CHAVE_MANIFESTO = 'fiscal_dist_manifest';
  URL_ARQUIVOS = 'https://arquivos.exemplo.test/';

{ TFakeObserverFiscal }

constructor TFakeObserverFiscal.Create;
begin
  inherited Create;
  FMessages := TStringList.Create;
  FErrors := TStringList.Create;
end;

destructor TFakeObserverFiscal.Destroy;
begin
  FMessages.Free;
  FErrors.Free;
  inherited;
end;

function TFakeObserverFiscal.ListaContem(const ALista: TStrings; const ATexto: string): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to ALista.Count - 1 do
    if Pos(ATexto, ALista[I]) > 0 then
      Exit(True);
end;

procedure TFakeObserverFiscal.OnMessage(const Message: string);
begin
  FMessages.Add(Message);
end;

procedure TFakeObserverFiscal.OnWarning(const Warning: string);
begin
  // Nao usado pelo fluxo de manifesto; mantido para cumprir o contrato.
end;

procedure TFakeObserverFiscal.OnError(const Error: string);
begin
  FErrors.Add(Error);
end;

procedure TFakeObserverFiscal.OnProgress(Progress: Integer);
begin
  // Nao usado pelo fluxo de manifesto.
end;

procedure TFakeObserverFiscal.OnCounter(Current, Total: Integer);
begin
  // Nao usado pelo fluxo de manifesto.
end;

procedure TFakeObserverFiscal.OnStart;
begin
  // Nao usado pelo fluxo de manifesto.
end;

procedure TFakeObserverFiscal.OnComplete;
begin
  // Nao usado pelo fluxo de manifesto.
end;

procedure TFakeObserverFiscal.OnCancel;
begin
  // Nao usado pelo fluxo de manifesto.
end;

procedure TFakeObserverFiscal.CancelRequest;
begin
  // Nao usado pelo fluxo de manifesto.
end;

function TFakeObserverFiscal.IsCancellationRequested: Boolean;
begin
  Result := False;
end;

function TFakeObserverFiscal.MensagemContem(const ATexto: string): Boolean;
begin
  Result := ListaContem(FMessages, ATexto);
end;

function TFakeObserverFiscal.ErroContem(const ATexto: string): Boolean;
begin
  Result := ListaContem(FErrors, ATexto);
end;

{ TFakeDownloadService }

constructor TFakeDownloadService.Create;
begin
  inherited Create;
  FDestinos := TStringList.Create;
  FArquivosCriados := TStringList.Create;
end;

destructor TFakeDownloadService.Destroy;
var
  I: Integer;
begin
  for I := 0 to FArquivosCriados.Count - 1 do
    if FileExists(FArquivosCriados[I]) then
      DeleteFile(FArquivosCriados[I]);

  FArquivosCriados.Free;
  FDestinos.Free;
  inherited;
end;

function TFakeDownloadService.DownloadFile(const URL, DestPath: string): TDownloadResult;
var
  Arquivo: TFileStream;
begin
  FDestinos.Add(DestPath);

  Result.Success := True;
  Result.FilePath := DestPath;
  Result.ErrorMessage := '';
  Result.FileSize := 0;

  try
    Arquivo := TFileStream.Create(DestPath, fmCreate);
    try
      FArquivosCriados.Add(DestPath);
    finally
      Arquivo.Free;
    end;
  except
    on E: Exception do
    begin
      Result.Success := False;
      Result.FilePath := '';
      Result.ErrorMessage := 'TFakeDownloadService: falha ao criar o destino - ' + E.Message;
    end;
  end;
end;

function TFakeDownloadService.DownloadFileToMemory(const URL: string): TBytes;
begin
  raise Exception.Create('TFakeDownloadService: DownloadFileToMemory nao suportado no cenario.');
end;

function TFakeDownloadService.GetFileSize(const URL: string): Int64;
begin
  raise Exception.Create('TFakeDownloadService: GetFileSize nao suportado no cenario.');
end;

function TFakeDownloadService.FoiBaixado(const ANomeArquivo: string): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to FDestinos.Count - 1 do
    // EndsText(ASubText, AText) => AText termina com ASubText; consulta se o
    // destino baixado termina com o nome de arquivo procurado.
    if EndsText(ANomeArquivo, FDestinos[I]) then
      Exit(True);
end;

function TFakeDownloadService.TotalDownloads: Integer;
begin
  Result := FDestinos.Count;
end;

{ TFakeSincronizadorNCM }

constructor TFakeSincronizadorNCM.Create;
begin
  inherited Create;
  FChamado := False;
  FResultado := True;
end;

function TFakeSincronizadorNCM.Executar(const Input: ArquivosSICOMEXInput): Boolean;
begin
  FChamado := True;
  Result := FResultado;
end;

procedure TFakeSincronizadorNCM.ConfigurarResultado(const AResultado: Boolean);
begin
  FResultado := AResultado;
end;

{ TFakeSincronizadorIbpt }

constructor TFakeSincronizadorIbpt.Create;
begin
  inherited Create;
  FChamado := False;
  FResultado := True;
end;

function TFakeSincronizadorIbpt.Executar(const Input: SincronizadorTabelaIbptInput): Boolean;
begin
  FChamado := True;
  Result := FResultado;
end;

procedure TFakeSincronizadorIbpt.ConfigurarResultado(const AResultado: Boolean);
begin
  FResultado := AResultado;
end;

{ TFakeSincronizadorNFSe }

constructor TFakeSincronizadorNFSe.Create;
begin
  inherited Create;
  FChamado := False;
  FResultado := True;
end;

function TFakeSincronizadorNFSe.Executar(const FileName: string): Boolean;
begin
  FChamado := True;
  Result := FResultado;
end;

procedure TFakeSincronizadorNFSe.ConfigurarResultado(const AResultado: Boolean);
begin
  FResultado := AResultado;
end;

{ TTestSincronizarDadosFiscaisSemCalculadora }

procedure TTestSincronizarDadosFiscaisSemCalculadora.Setup;
begin
  FTransactionState := TTransactionSpyState.Create;
  FConnection := TFakeDatabaseConnection.Create(FTransactionState);
  FConfigRepo := TFakeConfiguracoesRepository.Create;

  FObserver := TFakeObserverFiscal.Create;
  FObserverIntf := FObserver;

  FDownloader := TFakeDownloadService.Create;
  FDownloaderIntf := FDownloader;

  FSincNCM := TFakeSincronizadorNCM.Create;
  FSincNCMIntf := FSincNCM;

  FSincIbpt := TFakeSincronizadorIbpt.Create;
  FSincIbptIntf := FSincIbpt;

  FSincNFSe := TFakeSincronizadorNFSe.Create;
  FSincNFSeIntf := FSincNFSe;

  FUseCase := SincronizarDadosFiscaisUseCase.Create(
    FConnection,
    FConfigRepo,
    FObserverIntf,
    FDownloaderIntf,
    FSincNCMIntf,
    FSincIbptIntf,
    FSincNFSeIntf
  );
end;

procedure TTestSincronizarDadosFiscaisSemCalculadora.TearDown;
begin
  // Interfacas: soltar por nil (referencia contada) antes de liberar as classes
  // concretas e o estado externo de transacao.
  FUseCase := nil;
  FObserverIntf := nil;
  FDownloaderIntf := nil;
  FSincNCMIntf := nil;
  FSincIbptIntf := nil;
  FSincNFSeIntf := nil;

  FObserver := nil;
  FDownloader := nil;
  FSincNCM := nil;
  FSincIbpt := nil;
  FSincNFSe := nil;

  FConnection.Free;
  FConfigRepo.Free;
  FTransactionState.Free;
end;

function TTestSincronizarDadosFiscaisSemCalculadora.HashGravadoPara(const ANome: string): Boolean;
var
  Config: ConfiguracaoEtd;
begin
  Result := False;

  Config := FConfigRepo.GetByKey(CHAVE_MANIFESTO, 0);
  try
    if Assigned(Config) and Assigned(Config.ValorStrings) then
      Result := Config.ValorStrings.Values[ANome] <> '';
  finally
    Config.Free;
  end;
end;

procedure TTestSincronizarDadosFiscaisSemCalculadora.DeveIgnorarCalculadoraDbSemDownloadNemHash;
var
  Input: ArquivosDownloadInput;
begin
  Input := [
    ArquivoDownload.Create(NOME_CALCULADORA, URL_ARQUIVOS + NOME_CALCULADORA, 'hash-calc')
  ];

  FUseCase.Executar(Input);

  Assert.AreEqual(0, FDownloader.TotalDownloads, 'calculadora.db nao deve ser baixado.');
  Assert.IsTrue(FObserver.MensagemContem(NOME_CALCULADORA),
    'Deve registrar log informativo do arquivo ignorado.');
  Assert.IsFalse(FSincNCM.Chamado, 'O fluxo NCM nao deve ser acionado por calculadora.db.');
  Assert.IsFalse(FSincIbpt.Chamado, 'O fluxo IBPT nao deve ser acionado por calculadora.db.');
  Assert.IsFalse(FSincNFSe.Chamado, 'O fluxo NFSe nao deve ser acionado por calculadora.db.');
  Assert.AreEqual(0, FObserver.Errors.Count, 'Ignorar calculadora.db nao deve reportar erro.');
  Assert.IsFalse(HashGravadoPara(NOME_CALCULADORA), 'Nao deve gravar hash de calculadora.db.');
end;

procedure TTestSincronizarDadosFiscaisSemCalculadora.DeveManterFluxoIbptComCalculadoraDbNoLote;
var
  Input: ArquivosDownloadInput;
begin
  FSincIbpt.ConfigurarResultado(True);

  Input := [
    ArquivoDownload.Create(NOME_CALCULADORA, URL_ARQUIVOS + NOME_CALCULADORA, 'hash-calc'),
    ArquivoDownload.Create('ibpt-sp.csv', URL_ARQUIVOS + 'ibpt-sp.csv', 'hash-ibpt')
  ];

  FUseCase.Executar(Input);

  Assert.AreEqual(1, FDownloader.TotalDownloads, 'Somente o arquivo IBPT deve ser baixado.');
  Assert.IsTrue(FDownloader.FoiBaixado('ibpt-sp.csv'), 'O arquivo IBPT deve ser baixado.');
  Assert.IsFalse(FDownloader.FoiBaixado(NOME_CALCULADORA), 'calculadora.db nao deve ser baixado.');
  Assert.IsTrue(FSincIbpt.Chamado, 'O fluxo IBPT deve permanecer ativo.');
  Assert.IsFalse(FSincNCM.Chamado, 'O fluxo NCM nao deve ser acionado.');
  Assert.IsFalse(FSincNFSe.Chamado, 'O fluxo NFSe nao deve ser acionado.');
  Assert.IsTrue(HashGravadoPara('ibpt-sp.csv'), 'O hash do arquivo IBPT deve ser gravado.');
  Assert.IsFalse(HashGravadoPara(NOME_CALCULADORA), 'Nao deve gravar hash de calculadora.db.');
  Assert.AreEqual(0, FObserver.Errors.Count, 'Nao deve reportar erro.');
end;

procedure TTestSincronizarDadosFiscaisSemCalculadora.DeveManterFluxoNFSeComCalculadoraDbNoLote;
var
  Input: ArquivosDownloadInput;
begin
  FSincNFSe.ConfigurarResultado(True);

  Input := [
    ArquivoDownload.Create(NOME_CALCULADORA, URL_ARQUIVOS + NOME_CALCULADORA, 'hash-calc'),
    ArquivoDownload.Create('nfs-ctribnac.csv', URL_ARQUIVOS + 'nfs-ctribnac.csv', 'hash-nfse')
  ];

  FUseCase.Executar(Input);

  Assert.AreEqual(1, FDownloader.TotalDownloads, 'Somente o arquivo NFSe deve ser baixado.');
  Assert.IsTrue(FDownloader.FoiBaixado('nfs-ctribnac.csv'), 'O arquivo NFSe deve ser baixado.');
  Assert.IsFalse(FDownloader.FoiBaixado(NOME_CALCULADORA), 'calculadora.db nao deve ser baixado.');
  Assert.IsTrue(FSincNFSe.Chamado, 'O fluxo NFSe deve permanecer ativo.');
  Assert.IsFalse(FSincNCM.Chamado, 'O fluxo NCM nao deve ser acionado.');
  Assert.IsFalse(FSincIbpt.Chamado, 'O fluxo IBPT nao deve ser acionado.');
  Assert.IsTrue(HashGravadoPara('nfs-ctribnac.csv'), 'O hash do arquivo NFSe deve ser gravado.');
  Assert.IsFalse(HashGravadoPara(NOME_CALCULADORA), 'Nao deve gravar hash de calculadora.db.');
  Assert.AreEqual(0, FObserver.Errors.Count, 'Nao deve reportar erro.');
end;

procedure TTestSincronizarDadosFiscaisSemCalculadora.DeveManterFluxoNCMsComCalculadoraDbNoLote;
var
  Input: ArquivosDownloadInput;
begin
  FSincNCM.ConfigurarResultado(True);

  Input := [
    ArquivoDownload.Create(NOME_CALCULADORA, URL_ARQUIVOS + NOME_CALCULADORA, 'hash-calc'),
    ArquivoDownload.Create('ncm-vigentes.json', URL_ARQUIVOS + 'ncm-vigentes.json', 'hash-ncm')
  ];

  FUseCase.Executar(Input);

  Assert.AreEqual(3, FDownloader.TotalDownloads, 'Os 3 arquivos NCM devem ser baixados.');
  Assert.IsTrue(FDownloader.FoiBaixado('ncm-historica.json'), 'O arquivo NCM historico deve ser baixado.');
  Assert.IsTrue(FDownloader.FoiBaixado('ncm-futura.json'), 'O arquivo NCM futuro deve ser baixado.');
  Assert.IsTrue(FDownloader.FoiBaixado('ncm-vigentes.json'), 'O arquivo NCM vigente deve ser baixado.');
  Assert.IsFalse(FDownloader.FoiBaixado(NOME_CALCULADORA), 'calculadora.db nao deve ser baixado.');
  Assert.IsTrue(FSincNCM.Chamado, 'O fluxo NCM deve permanecer ativo.');
  Assert.IsFalse(FSincIbpt.Chamado, 'O fluxo IBPT nao deve ser acionado.');
  Assert.IsFalse(FSincNFSe.Chamado, 'O fluxo NFSe nao deve ser acionado.');
  Assert.IsTrue(HashGravadoPara('ncm-vigentes.json'), 'O hash do arquivo NCM deve ser gravado.');
  Assert.IsFalse(HashGravadoPara(NOME_CALCULADORA), 'Nao deve gravar hash de calculadora.db.');
  Assert.AreEqual(0, FObserver.Errors.Count, 'Nao deve reportar erro.');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestSincronizarDadosFiscaisSemCalculadora);

end.
