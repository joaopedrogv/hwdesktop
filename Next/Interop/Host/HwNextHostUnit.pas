// Delphi 2006
unit HwNextHostUnit;

interface

uses
  Windows, Classes, Forms, HwNextViewApi;

type
  THwNextPresentation = (npMdi, npModal);
  THwNextInstancePolicy = (nipSingle, nipMultiple);
  THwNextClosePolicy = (ncpHide, ncpDestroy);

  THwNextOpenOptions = record
    Presentation: THwNextPresentation;
    InstancePolicy: THwNextInstancePolicy;
    ClosePolicy: THwNextClosePolicy;
    DisplayTitle: string;
  end;

  THwNextDatabaseConfig = record
    DatabaseName: string;
    DatabaseUserName: string;
    DatabasePassword: string;
  end;

function NextQueryOptions: THwNextOpenOptions;
function NextMultipleOptions(ADestroyOnClose: Boolean): THwNextOpenOptions;
function NextModalOptions: THwNextOpenOptions;

function SetNextHostSession(ACompanyCode: Integer; const AUserLogin: string): Boolean;
function InicializarNext(const AConfig: THwNextDatabaseConfig): Boolean;

function OpenNextView(AOwner: TForm; const AIdentifier: string; const AOptions: THwNextOpenOptions): Boolean;

function CloseAllNextViews: Boolean;
function InvalidateNextViews: Boolean;
function ShutdownNextHost: Boolean;

implementation

uses
  SysUtils, Messages, ExtCtrls, Dialogs, Controls, HwNextAuthorizationUnit;

const
  HW_NEXT_DLL_NAME = 'hw.next.dll';
  EXPORT_API_VERSION: AnsiString = 'HwNextApiVersion';
  EXPORT_SET_SESSION: AnsiString = 'HwNextSetSession';
  EXPORT_INITIALIZE: AnsiString = 'HwNextInitialize';
  EXPORT_IS_AVAILABLE: AnsiString = 'HwNextIsAvailable';
  EXPORT_OPEN_VIEW: AnsiString = 'HwNextOpenView';
  EXPORT_RESIZE_VIEW: AnsiString = 'HwNextResizeView';
  EXPORT_FOCUS_VIEW: AnsiString = 'HwNextFocusView';
  EXPORT_DESTROY_VIEW: AnsiString = 'HwNextDestroyView';
  EXPORT_CAN_CLOSE_VIEW: AnsiString = 'HwNextCanCloseView';
  EXPORT_PROCESS_KEY: AnsiString = 'HwNextProcessKey';
  EXPORT_VIEW_COUNT: AnsiString = 'HwNextViewCount';
  EXPORT_SHUTDOWN: AnsiString = 'HwNextShutdown';
  EXPORT_LAST_ERROR: AnsiString = 'HwNextLastError';
  EXPORT_SET_AUTHORIZATION_CALLBACK_V2: AnsiString = 'HwNextSetAuthorizationCallbackV2';

type
  // O fechamento individual e sempre ncrUser; os demais motivos pertencem as operacoes coletivas.
  THwNextCloseReason = (ncrUser, ncrCollective, ncrInvalidate, ncrShutdown);

  THwNextApi = record
    Version: THwNextApiVersion;
    OpenView: THwNextOpenView;
    ResizeView: THwNextResizeView;
    FocusView: THwNextFocusView;
    DestroyView: THwNextDestroyView;
    CanCloseView: THwNextCanCloseView;
    ProcessKey: THwNextProcessKey;
    ViewCount: THwNextViewCount;
    Shutdown: THwNextShutdown;
    LastError: THwNextLastError;
    SetSession: THwNextSetSession;
    Initialize: THwNextInitialize;
    IsAvailable: THwNextIsAvailable;
    SetAuthorizationCallbackV2: THwNextSetAuthorizationCallbackV2;
  end;

  TfrmHwNextHost = class;

  THwNextHostBridge = class(TObject)
  private
    FLibraryHandle: HMODULE;
    FApi: THwNextApi;
    FPreviousOnMessage: TMessageEvent;
    FInstances: TList;
    FNextInstanceNumber: Integer;
    FOpening: Boolean;
    FCollectiveClose: Boolean;
    FLastCloseReason: THwNextCloseReason;
    FMdiParent: TForm;
    FHookInstalled: Boolean;
    constructor Create;
    destructor Destroy; override;
    procedure EnsureLibrary;
    function ResolveExport(const AName: AnsiString): Pointer;
    function LastErrorDetail: string;
    procedure InstallMessageHook;
    procedure RestoreMessageHook;
    function FindHostWindow(AWindow: HWND): TfrmHwNextHost;
    function FindReusableInstance(const AIdentifier: string): TfrmHwNextHost;
    function GetInstanceCount: Integer;
    procedure ShowFailure(const AContext, ADetail: string);
    function CloseInstances(AReason: THwNextCloseReason): Boolean;
  public
    function OpenView(AOwner: TForm; const AIdentifier: string; const AOptions: THwNextOpenOptions): Boolean;
    procedure ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
    function CreateView(AParent, ACloseTarget, AApplication: HWND;
      const AIdentifier: string; const AOptions: THwNextOpenOptions; AInstanceNumber: Integer): HWND;
    function ResizeView(AView: HWND; AWidth, AHeight: Integer): Boolean;
    function FocusView(AView: HWND): Boolean;
    function DestroyView(AView: HWND): Boolean;
    function CanCloseView(AView: HWND): Boolean;
    function ProcessKey(AView: HWND; const AMsg: TMsg): Boolean;
    function ViewCount: Integer;
    function Shutdown: Boolean;
    function SetSession(ACompanyCode: Integer; const AUserLogin: string): Boolean;
    function Initialize(const AConfig: THwNextDatabaseConfig): Boolean;
    function CloseAll(AReason: THwNextCloseReason): Boolean;
    function Invalidate: Boolean;
    function ShutdownHost: Boolean;
    procedure NotifyInstanceClosed(AHost: TfrmHwNextHost);
    function ReleaseLibrary: Boolean;
    property InstanceCount: Integer read GetInstanceCount;
  end;

  TfrmHwNextHost = class(TForm)
  private
    FBridge: THwNextHostBridge;
    FSurface: TPanel;
    FView: HWND;
    FIdentifier: string;
    FOptions: THwNextOpenOptions;
    FIsClosing: Boolean;
    FRetainedHidden: Boolean;
    FCollectiveCloseRequested: Boolean;
    procedure SurfaceResize(Sender: TObject);
    procedure HostActivate(Sender: TObject);
    procedure HostCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure HostClose(Sender: TObject; var Action: TCloseAction);
    function GetIsModal: Boolean;
  public
    constructor CreateHosted(AOwner: TForm; ABridge: THwNextHostBridge;
      const AIdentifier: string; const AOptions: THwNextOpenOptions; AInstanceNumber: Integer);
    destructor Destroy; override;
    procedure Represent;
    procedure MarkCollectiveCloseRequested;
    function OwnsWindow(AWindow: HWND): Boolean;
    function ProcessKey(const AMsg: TMsg): Boolean;
    property Identifier: string read FIdentifier;
    property Options: THwNextOpenOptions read FOptions;
    property IsModal: Boolean read GetIsModal;
    property IsClosing: Boolean read FIsClosing;
  end;

var
  FBridge: THwNextHostBridge;

function SameMessageHandler(const AFirst, ASecond: TMessageEvent): Boolean;
begin
  Result := Assigned(AFirst) and Assigned(ASecond) and (TMethod(AFirst).Code = TMethod(ASecond).Code) and
    (TMethod(AFirst).Data = TMethod(ASecond).Data);
end;

procedure LogDiagnostic(const AText: string);
begin
  OutputDebugString(PChar('HwNextHostUnit: ' + AText));
end;

function CloseReasonName(AReason: THwNextCloseReason): string;
begin
  case AReason of
    ncrCollective: Result := 'collective';
    ncrInvalidate: Result := 'invalidate';
    ncrShutdown: Result := 'shutdown';
  else
    Result := 'user';
  end;
end;

function ValidateHostIdentifier(const AIdentifier: string; out AError: string): Boolean;
var
  I: Integer;
  Code: Integer;
begin
  AError := '';
  if AIdentifier = '' then
  begin
    AError := 'O identificador da tela Next não pode ser vazio.';
    Result := False;
    Exit;
  end;
  if Length(AIdentifier) > HW_NEXT_IDENTIFIER_MAX_CHARS then
  begin
    AError := Format('O identificador da tela Next deve ter no máximo %d caracteres.',
      [HW_NEXT_IDENTIFIER_MAX_CHARS]);
    Result := False;
    Exit;
  end;
  for I := 1 to Length(AIdentifier) do
  begin
    Code := Ord(AIdentifier[I]);
    if (Code < 32) or (Code > 126) then
    begin
      AError := 'O identificador da tela Next deve conter apenas ' + 'caracteres ASCII imprimíveis.';
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

function EncodeOptions(const AOptions: THwNextOpenOptions): Cardinal;
begin
  Result := 0;
  if AOptions.Presentation = npModal then
    Result := Result or HW_NEXT_OPT_MODAL;
  if AOptions.InstancePolicy = nipMultiple then
    Result := Result or HW_NEXT_OPT_MULTIPLE;
  if AOptions.ClosePolicy = ncpDestroy then
    Result := Result or HW_NEXT_OPT_DESTROY;
end;

function NextQueryOptions: THwNextOpenOptions;
begin
  Result.Presentation := npMdi;
  Result.InstancePolicy := nipSingle;
  Result.ClosePolicy := ncpHide;
  Result.DisplayTitle := '';
end;

function NextMultipleOptions(ADestroyOnClose: Boolean): THwNextOpenOptions;
begin
  Result.Presentation := npMdi;
  Result.InstancePolicy := nipMultiple;
  if ADestroyOnClose then
    Result.ClosePolicy := ncpDestroy
  else
    Result.ClosePolicy := ncpHide;
  Result.DisplayTitle := '';
end;

function NextModalOptions: THwNextOpenOptions;
begin
  Result.Presentation := npModal;
  Result.InstancePolicy := nipMultiple;
  Result.ClosePolicy := ncpDestroy;
  Result.DisplayTitle := '';
end;

function OpenNextView(AOwner: TForm; const AIdentifier: string;
  const AOptions: THwNextOpenOptions): Boolean;
begin
  Result := FBridge.OpenView(AOwner, AIdentifier, AOptions);
end;

function CloseAllNextViews: Boolean;
begin
  Result := FBridge.CloseAll(ncrCollective);
end;

function InvalidateNextViews: Boolean;
begin
  Result := FBridge.Invalidate;
end;

function ShutdownNextHost: Boolean;
begin
  Result := FBridge.ShutdownHost;
end;

function SetNextHostSession(ACompanyCode: Integer; const AUserLogin: string): Boolean;
begin
  Result := FBridge.SetSession(ACompanyCode, AUserLogin);
end;

function InicializarNext(const AConfig: THwNextDatabaseConfig): Boolean;
begin
  Result := FBridge.Initialize(AConfig);
end;

constructor THwNextHostBridge.Create;
begin
  inherited Create;
  FInstances := TList.Create;
end;

destructor THwNextHostBridge.Destroy;
begin
  FInstances.Free;
  inherited Destroy;
end;

function THwNextHostBridge.ResolveExport(const AName: AnsiString): Pointer;
begin
  Result := GetProcAddress(FLibraryHandle, PAnsiChar(AName));
  if Result = nil then
    raise Exception.CreateFmt('A DLL hw.next.dll não exporta a função %s.', [string(AName)]);
end;

procedure THwNextHostBridge.EnsureLibrary;
var
  Candidate: string;
  LoadError: DWORD;
  VersionFound: Integer;
begin
  if FLibraryHandle <> 0 then
  begin
    // HwNextShutdown limpa o callback sem descarregar a biblioteca; uma liberacao anormal pode deixar a DLL carregada
    // sem o callback do host, e este caminho garante o registro.
    if not Assigned(FApi.SetSession) or not Assigned(FApi.Initialize) or not Assigned(FApi.IsAvailable) then
      raise Exception.Create('A interface de hw.next.dll não expõe a sessão do Next.');
    if not Assigned(FApi.SetAuthorizationCallbackV2) then
      raise Exception.Create(
        'A interface de hw.next.dll não expôe o registro do callback ' + 'de autorização.');
    if FApi.SetAuthorizationCallbackV2(@HwNextAuthorizeV2) = False then
      raise Exception.Create('A DLL hw.next.dll não aceitou o callback de autorização.');
    Exit;
  end;

  Candidate := ExtractFilePath(ParamStr(0)) + HW_NEXT_DLL_NAME;
  if FileExists(Candidate) then
    FLibraryHandle := LoadLibrary(PChar(Candidate))
  else
    FLibraryHandle := LoadLibrary(HW_NEXT_DLL_NAME);

  if FLibraryHandle = 0 then
  begin
    LoadError := GetLastError;
    raise Exception.CreateFmt(
      'Não foi possível carregar hw.next.dll.' + sLineBreak + 'Caminho tentado: %s' + sLineBreak +
        'Tentativa por nome simples: %s' + sLineBreak + 'Erro do Windows: %s',
      [Candidate, HW_NEXT_DLL_NAME, SysErrorMessage(LoadError)]);
  end;

  try
    FApi.Version := THwNextApiVersion(ResolveExport(EXPORT_API_VERSION));
    VersionFound := FApi.Version();
    if VersionFound <> HW_NEXT_VIEW_API_VERSION then
      raise Exception.CreateFmt(
        'Versão incompatível da interface de hw.next.dll: ' + 'esperada %d, encontrada %d.',
        [HW_NEXT_VIEW_API_VERSION, VersionFound]);
    FApi.OpenView := THwNextOpenView(ResolveExport(EXPORT_OPEN_VIEW));
    FApi.ResizeView := THwNextResizeView(ResolveExport(EXPORT_RESIZE_VIEW));
    FApi.FocusView := THwNextFocusView(ResolveExport(EXPORT_FOCUS_VIEW));
    FApi.DestroyView := THwNextDestroyView(ResolveExport(EXPORT_DESTROY_VIEW));
    FApi.CanCloseView := THwNextCanCloseView(ResolveExport(EXPORT_CAN_CLOSE_VIEW));
    FApi.ProcessKey := THwNextProcessKey(ResolveExport(EXPORT_PROCESS_KEY));
    FApi.ViewCount := THwNextViewCount(ResolveExport(EXPORT_VIEW_COUNT));
    FApi.Shutdown := THwNextShutdown(ResolveExport(EXPORT_SHUTDOWN));
    FApi.LastError := THwNextLastError(ResolveExport(EXPORT_LAST_ERROR));
    FApi.SetSession := THwNextSetSession(ResolveExport(EXPORT_SET_SESSION));
    FApi.Initialize := THwNextInitialize(ResolveExport(EXPORT_INITIALIZE));
    FApi.IsAvailable := THwNextIsAvailable(ResolveExport(EXPORT_IS_AVAILABLE));
    // A consulta de autorizacao pertence ao host; falha no registro desfaz a carga da biblioteca.
    FApi.SetAuthorizationCallbackV2 :=
      THwNextSetAuthorizationCallbackV2(ResolveExport(EXPORT_SET_AUTHORIZATION_CALLBACK_V2));
    if FApi.SetAuthorizationCallbackV2(@HwNextAuthorizeV2) = False then
      raise Exception.Create('A DLL hw.next.dll não aceitou o callback de autorização.');
  except
    FreeLibrary(FLibraryHandle);
    FLibraryHandle := 0;
    FillChar(FApi, SizeOf(FApi), 0);
    raise;
  end;
end;

function THwNextHostBridge.LastErrorDetail: string;
var
  Buffer: array[0..HW_NEXT_ERROR_CAPACITY - 1] of WideChar;
  Detail: WideString;
begin
  Result := '';
  if Assigned(FApi.LastError) then
  begin
    Buffer[0] := #0;
    FApi.LastError(@Buffer[0], HW_NEXT_ERROR_CAPACITY);
    if Buffer[0] <> #0 then
    begin
      Detail := WideString(PWideChar(@Buffer[0]));
      Result := string(Detail);
    end;
  end;
  if Result = '' then
    Result := 'A DLL não informou detalhes.';
end;

procedure THwNextHostBridge.InstallMessageHook;
begin
  if FHookInstalled then
    Exit;
  if SameMessageHandler(Application.OnMessage, ApplicationMessage) then
  begin
    FHookInstalled := True;
    Exit;
  end;
  FPreviousOnMessage := Application.OnMessage;
  Application.OnMessage := ApplicationMessage;
  FHookInstalled := True;
end;

procedure THwNextHostBridge.RestoreMessageHook;
begin
  if not FHookInstalled then
    Exit;
  FHookInstalled := False;
  if SameMessageHandler(Application.OnMessage, ApplicationMessage) then
    Application.OnMessage := FPreviousOnMessage;
  FPreviousOnMessage := nil;
end;

function THwNextHostBridge.FindHostWindow(AWindow: HWND): TfrmHwNextHost;
var
  I: Integer;
begin
  Result := nil;
  if FInstances = nil then
    Exit;
  for I := 0 to FInstances.Count - 1 do
    if TfrmHwNextHost(FInstances[I]).OwnsWindow(AWindow) then
    begin
      Result := TfrmHwNextHost(FInstances[I]);
      Exit;
    end;
end;

function THwNextHostBridge.FindReusableInstance(const AIdentifier: string): TfrmHwNextHost;
var
  I: Integer;
  Host: TfrmHwNextHost;
begin
  Result := nil;
  if FInstances = nil then
    Exit;
  for I := 0 to FInstances.Count - 1 do
  begin
    Host := TfrmHwNextHost(FInstances[I]);
    if (not Host.IsModal) and (Host.Options.Presentation = npMdi) and
      (Host.Options.InstancePolicy = nipSingle) and
      SameText(Host.Identifier, AIdentifier) and (not Host.IsClosing) then
    begin
      Result := Host;
      Exit;
    end;
  end;
end;

function THwNextHostBridge.GetInstanceCount: Integer;
begin
  if FInstances = nil then
    Result := 0
  else
    Result := FInstances.Count;
end;

procedure THwNextHostBridge.ShowFailure(const AContext, ADetail: string);
begin
  if ADetail = '' then
    MessageDlg(AContext, mtError, [mbOK], 0)
  else
    MessageDlg(AContext + sLineBreak + sLineBreak + ADetail, mtError, [mbOK], 0);
end;

function THwNextHostBridge.OpenView(AOwner: TForm; const AIdentifier: string;
  const AOptions: THwNextOpenOptions): Boolean;
var
  Host: TfrmHwNextHost;
  InstanceNumber: Integer;
  IdentifierError: string;
begin
  Result := False;
  if FOpening then
    Exit;

  // A string completa e validada antes de qualquer reuso, carga ou construcao: um #0 interno seria truncado pela
  // conversao terminada em nulo da ABI.
  if not ValidateHostIdentifier(AIdentifier, IdentifierError) then
  begin
    ShowFailure('Não foi possível abrir a tela Next.', IdentifierError);
    Exit;
  end;

  if (AOwner = nil) or not AOwner.HandleAllocated then
  begin
    ShowFailure('Não foi possível abrir a tela Next.',
      'O formulário principal do ERP não está disponível.');
    Exit;
  end;

  if (FMdiParent <> nil) and (FMdiParent <> AOwner) then
  begin
    ShowFailure('Não foi possível abrir a tela Next.',
      'A tela Next já está vinculada a outra janela principal.');
    Exit;
  end;

  if (AOptions.Presentation = npModal) and ((AOptions.InstancePolicy <> nipMultiple) or
    (AOptions.ClosePolicy <> ncpDestroy)) then
  begin
    // A abertura modal sempre cria instancia propria, liberada pelo chamador; outras combinacoes converteriam uma
    // instancia MDI existente em modal.
    ShowFailure('Não foi possível abrir a tela Next.',
      'A abertura modal exige múltiplas instâncias e destruição no fechamento.');
    Exit;
  end;

  FOpening := True;
  try
    try
      EnsureLibrary;
      if not Assigned(FApi.IsAvailable) then
      begin
        ShowFailure('Não foi possível abrir a tela Next.',
          'A interface de hw.next.dll não expõe a disponibilidade do Next.');
        Exit;
      end;
      if FApi.IsAvailable() = False then
      begin
        ShowFailure('Não foi possível abrir a tela Next.', LastErrorDetail);
        Exit;
      end;
      FMdiParent := AOwner;

      if AOptions.Presentation = npModal then
      begin
        Inc(FNextInstanceNumber);
        InstanceNumber := FNextInstanceNumber;
        Host := TfrmHwNextHost.CreateHosted(AOwner, Self, AIdentifier, AOptions, InstanceNumber);
        try
          FInstances.Add(Host);
          if FInstances.Count = 1 then
            InstallMessageHook;
          try
            Host.ShowModal;
            Result := True;
          finally
            // ShowModal termina quando a janela se oculta; o chamador libera o wrapper depois do loop modal.
            FreeAndNil(Host);
          end;
        except
          Host.Free;
          raise;
        end;
      end
      else
      begin
        if AOptions.InstancePolicy = nipSingle then
        begin
          Host := FindReusableInstance(AIdentifier);
          if Host <> nil then
          begin
            Host.Represent;
            Result := True;
            Exit;
          end;
        end;

        Inc(FNextInstanceNumber);
        InstanceNumber := FNextInstanceNumber;
        Host := TfrmHwNextHost.CreateHosted(AOwner, Self, AIdentifier, AOptions, InstanceNumber);
        try
          FInstances.Add(Host);
          if FInstances.Count = 1 then
            InstallMessageHook;
          Host.Show;
          Result := True;
        except
          Host.Free;
          raise;
        end;
      end;
    except
      on E: Exception do
      begin
        ShowFailure('Não foi possível abrir a tela Next.', E.Message);
        Result := False;
      end;
    end;
  finally
    FOpening := False;
  end;
end;

procedure THwNextHostBridge.ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
var
  Host: TfrmHwNextHost;
  KeyMessage: TWMKey;
begin
  if Assigned(FPreviousOnMessage) and not SameMessageHandler(FPreviousOnMessage, ApplicationMessage) then
  begin
    FPreviousOnMessage(Msg, Handled);
    if Handled then
      Exit;
  end;

  if (Msg.message < WM_KEYFIRST) or (Msg.message > WM_KEYLAST) then
    Exit;

  Host := FindHostWindow(Msg.hwnd);
  if Host = nil then
    Exit;

  if not Host.IsModal then
  begin
    if (FMdiParent <> nil) and FMdiParent.HandleAllocated and TranslateMDISysAccel(FMdiParent.ClientHandle, Msg) then
    begin
      Handled := True;
      Exit;
    end;

    if ((Msg.message = WM_KEYDOWN) or (Msg.message = WM_SYSKEYDOWN)) and
      (FMdiParent <> nil) and FMdiParent.HandleAllocated and IsWindowEnabled(FMdiParent.Handle) then
    begin
      KeyMessage.Msg := Msg.message;
      KeyMessage.CharCode := Word(Msg.wParam);
      KeyMessage.Unused := Word(Msg.wParam shr 16);
      KeyMessage.KeyData := Msg.lParam;
      KeyMessage.Result := 0;
      if FMdiParent.IsShortCut(KeyMessage) then
      begin
        Handled := True;
        Exit;
      end;
    end;
  end;

  try
    Handled := Host.ProcessKey(Msg);
  except
    on E: Exception do
    begin
      // A mensagem e consumida para impedir uma segunda entrega; dialogo modal nunca deve ser aberto dentro do hook de
      // mensagens.
      LogDiagnostic('Falha ao encaminhar tecla para a view Next: ' + E.Message);
      Handled := True;
    end;
  end;
end;

function THwNextHostBridge.CreateView(AParent, ACloseTarget, AApplication: HWND; const AIdentifier: string;
  const AOptions: THwNextOpenOptions; AInstanceNumber: Integer): HWND;
var
  Bits: Cardinal;
  IdentifierText: WideString;
begin
  Result := 0;
  if not Assigned(FApi.OpenView) then
    raise Exception.Create('A interface de hw.next.dll não foi inicializada.');
  Bits := EncodeOptions(AOptions);
  // OpenView ja validou a string; o buffer UTF-16 terminado em nulo abaixo carrega os mesmos caracteres usados na busca
  // por reuso.
  IdentifierText := AIdentifier;
  Result := FApi.OpenView(PWideChar(IdentifierText), AParent, ACloseTarget, AApplication, Bits, AInstanceNumber);
  if Result = 0 then
    raise Exception.Create(LastErrorDetail);
end;

function THwNextHostBridge.ResizeView(AView: HWND; AWidth, AHeight: Integer): Boolean;
begin
  Result := False;
  if (AView = 0) or not Assigned(FApi.ResizeView) then
    Exit;
  try
    Result := FApi.ResizeView(AView, AWidth, AHeight) <> False;
  except
    Result := False;
  end;
end;

function THwNextHostBridge.FocusView(AView: HWND): Boolean;
begin
  Result := False;
  if (AView = 0) or not Assigned(FApi.FocusView) then
    Exit;
  try
    Result := FApi.FocusView(AView) <> False;
  except
    Result := False;
  end;
end;

function THwNextHostBridge.DestroyView(AView: HWND): Boolean;
begin
  Result := False;
  if (AView = 0) or not Assigned(FApi.DestroyView) then
    Exit;
  try
    Result := FApi.DestroyView(AView) <> False;
    if not Result then
      LogDiagnostic('Falha ao destruir a view Next: ' + LastErrorDetail);
  except
    on E: Exception do
    begin
      LogDiagnostic('Falha ao destruir a view Next: ' + E.Message);
      Result := False;
    end;
  end;
end;

function THwNextHostBridge.ProcessKey(AView: HWND; const AMsg: TMsg): Boolean;
begin
  Result := False;
  if (AView = 0) or not Assigned(FApi.ProcessKey) then
    Exit;
  Result := FApi.ProcessKey(AView, AMsg.hwnd, AMsg.message, AMsg.wParam, AMsg.lParam) <> False;
end;

function THwNextHostBridge.ViewCount: Integer;
begin
  Result := 0;
  if (FLibraryHandle = 0) or not Assigned(FApi.ViewCount) then
    Exit;
  try
    Result := FApi.ViewCount();
  except
    Result := -1;
  end;
end;

function THwNextHostBridge.Shutdown: Boolean;
begin
  Result := False;
  if (FLibraryHandle = 0) or not Assigned(FApi.Shutdown) then
    Exit;
  try
    Result := FApi.Shutdown() <> False;
    if not Result then
      LogDiagnostic('HwNextShutdown retornou False; a DLL permanece carregada.');
  except
    on E: Exception do
    begin
      LogDiagnostic('HwNextShutdown falhou: ' + E.Message);
      Result := False;
    end;
  end;
end;

function THwNextHostBridge.SetSession(ACompanyCode: Integer; const AUserLogin: string): Boolean;
const
  SessionFailure = 'Não foi possível publicar a sessão do Next.';
var
  UserLogin: WideString;
begin
  Result := False;
  UserLogin := '';
  try
    // O buffer PWideChar termina em nulo; um #0 interno truncaria o valor silenciosamente.
    if (ACompanyCode <= 0) or (Trim(AUserLogin) = '') or (Pos(#0, AUserLogin) > 0) then
    begin
      ShowFailure(SessionFailure, '');
      Exit;
    end;

    try
      EnsureLibrary;
    except
      on E: Exception do
      begin
        // Diagnosticos de carga, versao e exportacao nunca contem a identidade recebida.
        ShowFailure(SessionFailure, E.Message);
        Exit;
      end;
    end;

    if not Assigned(FApi.SetSession) then
    begin
      ShowFailure(SessionFailure, 'A interface de hw.next.dll não expõe a sessão do Next.');
      Exit;
    end;

    UserLogin := AUserLogin;
    if FApi.SetSession(ACompanyCode, PWideChar(UserLogin)) = False then
    begin
      ShowFailure(SessionFailure, LastErrorDetail);
      Exit;
    end;

    Result := True;
  finally
    UserLogin := '';
  end;
end;

function THwNextHostBridge.Initialize(const AConfig: THwNextDatabaseConfig): Boolean;
const
  InitializationFailure = 'Não foi possível inicializar o Next.';
var
  DatabaseName: WideString;
  DatabaseUserName: WideString;
  DatabasePassword: WideString;
begin
  Result := False;
  DatabaseName := '';
  DatabaseUserName := '';
  DatabasePassword := '';
  try
    // Os buffers PWideChar terminam em nulo; um #0 interno truncaria o valor silenciosamente. A mensagem nunca repete
    // nome de banco, usuario ou senha.
    if (Pos(#0, AConfig.DatabaseName) > 0) or (Pos(#0, AConfig.DatabaseUserName) > 0) or
      (Pos(#0, AConfig.DatabasePassword) > 0) then
    begin
      ShowFailure(InitializationFailure, 'A configuração do banco não foi aceita.');
      Exit;
    end;

    try
      EnsureLibrary;
    except
      on E: Exception do
      begin
        ShowFailure(InitializationFailure, E.Message);
        Exit;
      end;
    end;

    if not Assigned(FApi.Initialize) then
    begin
      ShowFailure(InitializationFailure, 'A interface de hw.next.dll não expõe a inicialização do Next.');
      Exit;
    end;

    DatabaseName := AConfig.DatabaseName;
    DatabaseUserName := AConfig.DatabaseUserName;
    DatabasePassword := AConfig.DatabasePassword;

    if FApi.Initialize(PWideChar(DatabaseName), PWideChar(DatabaseUserName),
      PWideChar(DatabasePassword)) = False then
    begin
      ShowFailure(InitializationFailure, LastErrorDetail);
      Exit;
    end;

    Result := True;
  finally
    DatabaseName := '';
    DatabaseUserName := '';
    DatabasePassword := '';
  end;
end;

function THwNextHostBridge.CloseInstances(AReason: THwNextCloseReason): Boolean;
var
  I: Integer;
  Host: TfrmHwNextHost;
  PreviousCollectiveClose: Boolean;
begin
  FLastCloseReason := AReason;
  // Suprime o encerramento automatico por wrapper durante o comando coletivo, que faz a unica restauracao do hook, o
  // shutdown e a liberacao da biblioteca.
  PreviousCollectiveClose := FCollectiveClose;
  FCollectiveClose := True;
  try
    LogDiagnostic('Fechamento ' + CloseReasonName(FLastCloseReason) +
      ' de ' + IntToStr(FInstances.Count) + ' instancia(s) Next.');
    for I := FInstances.Count - 1 downto 0 do
    begin
      // Um descarte aninhado pode ja ter removido um registro.
      if I >= FInstances.Count then
        Continue;
      Host := TfrmHwNextHost(FInstances[I]);
      if Host.IsClosing then
        // O VCL ja esta liberando este wrapper; o destructor remove o registro quando terminar.
        Continue;
      if Host.IsModal then
      begin
        // O VCL so executa a consulta de fechamento modal depois que Close retorna, quando o flag do bridge ja foi
        // restaurado. O marcador por wrapper mantem a intencao coletiva ate essa consulta.
        Host.MarkCollectiveCloseRequested;
        // Encerra o loop modal; o chamador de ShowModal libera o wrapper no finally.
        Host.Close;
      end
      else
        // Liberacao sincrona: o destructor destroi a view Rio antes de remover o registro, inclusive para wrappers
        // ocultos com Visible ainda True.
        Host.Free;
    end;
    Result := FInstances.Count = 0;
  finally
    FCollectiveClose := PreviousCollectiveClose;
  end;
end;

function THwNextHostBridge.CanCloseView(AView: HWND): Boolean;
begin
  Result := True;
  // Troca de usuario, saida e invalidacao sao decisoes coletivas: wrappers MDI sao liberados direto, mas os modais
  // ainda passam por OnCloseQuery.
  if FCollectiveClose or (AView = 0) then
    Exit;
  if not Assigned(FApi.CanCloseView) then
  begin
    // Guarda defensiva: falha fechada se a API foi limpa.
    LogDiagnostic('Consulta de fechamento indisponível na interface Next.');
    Result := False;
    Exit;
  end;
  try
    Result := FApi.CanCloseView(AView) <> False;
  except
    on E: Exception do
    begin
      // Nunca abrir um segundo dialogo no caminho da consulta de fechamento; manter a view aberta e registrar apenas no
      // log.
      LogDiagnostic('Falha ao consultar o fechamento da view Next: ' + E.Message);
      Result := False;
    end;
  end;
end;

function THwNextHostBridge.CloseAll(AReason: THwNextCloseReason): Boolean;
begin
  Result := CloseInstances(AReason);
  if Result then
  begin
    RestoreMessageHook;
    // Uma unica parada do modulo e liberacao para a operacao inteira.
    Result := ReleaseLibrary;
  end;
end;

function THwNextHostBridge.Invalidate: Boolean;
begin
  Result := CloseAll(ncrInvalidate);
  if Result then
  begin
    // Forca a proxima abertura a criar nova instancia, sem reutilizar a identidade da sessao anterior.
    FNextInstanceNumber := 0;
    FMdiParent := nil;
  end;
end;

function THwNextHostBridge.ShutdownHost: Boolean;
begin
  Result := CloseInstances(ncrShutdown);
  if not Result then
    // Um wrapper modal ainda esta registrado: manter hook, bridge e biblioteca; o chamador de ShowModal ainda possui o
    // wrapper.
    Exit;
  RestoreMessageHook;
  Result := ReleaseLibrary;
  // Chegou a zero instancias. Mesmo com a biblioteca carregada por limpeza incompleta, a proxima abertura nao reutiliza
  // a identidade anterior.
  FNextInstanceNumber := 0;
  FMdiParent := nil;
end;

procedure THwNextHostBridge.NotifyInstanceClosed(AHost: TfrmHwNextHost);
begin
  if FInstances <> nil then
    FInstances.Remove(AHost);
  // O fechamento individual da ultima tela nao encerra a sessao Next: modulo, contexto do login e conexao preguicosa
  // permanecem para a proxima abertura. Apenas os comandos coletivos ou a finalizacao do host descarregam a DLL.
  if FCollectiveClose then
    Exit;
  if (FInstances = nil) or (FInstances.Count = 0) then
    RestoreMessageHook;
end;

function THwNextHostBridge.ReleaseLibrary: Boolean;
begin
  Result := False;
  if FLibraryHandle = 0 then
  begin
    Result := True;
    Exit;
  end;

  // Um wrapper oculto ainda possui recursos do modulo: nao chamar o modulo nem descarregar a biblioteca enquanto houver
  // instancia registrada ou view viva.
  if InstanceCount > 0 then
    Exit;

  if not Shutdown then
    Exit;

  if ViewCount <> 0 then
    Exit;

  // O callback pertence ao host e nao sobrevive a descarga da biblioteca; a proxima abertura o registra novamente.
  if Assigned(FApi.SetAuthorizationCallbackV2) then
    FApi.SetAuthorizationCallbackV2(nil);

  FreeLibrary(FLibraryHandle);
  FLibraryHandle := 0;
  FillChar(FApi, SizeOf(FApi), 0);
  Result := True;
end;

constructor TfrmHwNextHost.CreateHosted(AOwner: TForm; ABridge: THwNextHostBridge; const AIdentifier: string;
  const AOptions: THwNextOpenOptions; AInstanceNumber: Integer);
begin
  inherited CreateNew(AOwner);
  FBridge := ABridge;
  FIdentifier := AIdentifier;
  FOptions := AOptions;
  if Trim(AOptions.DisplayTitle) <> '' then
    Caption := AOptions.DisplayTitle
  else
    Caption := Format('%s - Next %d', [AIdentifier, AInstanceNumber]);
  Width := 680;
  Height := 470;
  Constraints.MinWidth := 440;
  Constraints.MinHeight := 350;
  OnActivate := HostActivate;
  OnCloseQuery := HostCloseQuery;
  OnClose := HostClose;

  if AOptions.Presentation = npModal then
  begin
    // A apresentacao modal e uma janela propria conduzida por ShowModal, nunca um filho MDI nem o wrapper MDI da view.
    FormStyle := fsNormal;
    BorderStyle := bsSizeable;
    BorderIcons := [biSystemMenu];
    Position := poMainFormCenter;
  end
  else
  begin
    FormStyle := fsMDIChild;
    Position := poDefault;
  end;

  FSurface := TPanel.Create(Self);
  FSurface.Parent := Self;
  FSurface.Align := alClient;
  FSurface.BevelOuter := bvNone;
  FSurface.Caption := '';
  FSurface.OnResize := SurfaceResize;

  // Se a criacao da view falhar, o construtor propaga e o destructor libera a view ja criada antes de remover o wrapper
  // do registro do bridge.
  FView := FBridge.CreateView(FSurface.Handle, Handle, Application.Handle, FIdentifier, FOptions, AInstanceNumber);
end;

destructor TfrmHwNextHost.Destroy;
var
  Bridge: THwNextHostBridge;
begin
  Bridge := FBridge;

  // O modulo possui o form Rio: destruir a view antes de remover o registro, porque chegar a zero instancias pode
  // descarregar a biblioteca.
  if (FView <> 0) and (Bridge <> nil) then
  begin
    try
      Bridge.DestroyView(FView);
    except
      on E: Exception do
        // Nao propagar do destructor; o Shutdown tenta liberar views residuais.
        LogDiagnostic('Falha ao liberar a view Next no destructor: ' + E.Message);
    end;
    FView := 0;
  end;

  if Bridge <> nil then
  begin
    try
      Bridge.NotifyInstanceClosed(Self);
    except
      on E: Exception do
        // A limpeza de ciclo de vida nao pode propagar excecao.
        LogDiagnostic('Falha ao notificar o fechamento da view Next: ' + E.Message);
    end;
  end;

  inherited Destroy;
end;

procedure TfrmHwNextHost.Represent;
begin
  if IsModal then
    Exit;
  if FRetainedHidden then
  begin
    // O modo oculto retido mantem fsMDIChild, a janela, o painel e a view Rio. O VCL Visible nao mudou, por isso este
    // estado conduz a reapresentacao.
    FRetainedHidden := False;
    ShowWindow(Handle, SW_SHOW);
  end
  else if not Visible then
    Show;
  if WindowState = wsMinimized then
    WindowState := wsNormal;
  BringToFront;
  if CanFocus then
    SetFocus;
  if FView <> 0 then
    FBridge.FocusView(FView);
end;

procedure TfrmHwNextHost.MarkCollectiveCloseRequested;
begin
  // O fechamento coletivo possui este wrapper ate o chamador de ShowModal libera-lo. O VCL adia a consulta modal, entao
  // este marcador cobre o ciclo inteiro e nao pode ser limpo antes dela.
  FCollectiveCloseRequested := True;
end;

procedure TfrmHwNextHost.SurfaceResize(Sender: TObject);
begin
  if FView <> 0 then
    FBridge.ResizeView(FView, FSurface.ClientWidth, FSurface.ClientHeight);
end;

procedure TfrmHwNextHost.HostActivate(Sender: TObject);
begin
  if FView <> 0 then
    FBridge.FocusView(FView);
end;

procedure TfrmHwNextHost.HostCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // A operacao coletiva ja decidiu o destino do wrapper. O bridge restaura o flag coletivo antes desta consulta adiada,
  // portanto so o marcador por wrapper sobrevive; checa-lo antes do modulo impede um veto individual.
  if FCollectiveCloseRequested then
  begin
    CanClose := True;
    Exit;
  end;
  // A view decide se ha edicao pendente que exige pergunta; o wrapper nunca pergunta sozinho nem aplica a politica
  // antes dessa resposta.
  CanClose := FBridge.CanCloseView(FView);
end;

procedure TfrmHwNextHost.HostClose(Sender: TObject; var Action: TCloseAction);
begin
  if IsModal then
  begin
    // ShowModal conduz o loop modal: ocultar e retornar mrOk o encerra, e o chamador libera o wrapper depois. caFree
    // aqui deixaria o objeto morto.
    ModalResult := mrOk;
    Action := caHide;
    Exit;
  end;

  if FOptions.ClosePolicy = ncpDestroy then
  begin
    FIsClosing := True;
    Action := caFree;
  end
  else
  begin
    // Um filho MDI do VCL nao pode ser ocultado por Hide/SetVisible: VisibleChanging gera "Cannot hide an MDI Child
    // Form". Cancelar o fechamento estrutural e ocultar a janela mantem FormStyle, painel e view para Represent.
    FIsClosing := False;
    FRetainedHidden := True;
    Action := caNone;
    ShowWindow(Handle, SW_HIDE);
  end;
end;

function TfrmHwNextHost.GetIsModal: Boolean;
begin
  Result := FOptions.Presentation = npModal;
end;

function TfrmHwNextHost.OwnsWindow(AWindow: HWND): Boolean;
begin
  Result := (FView <> 0) and ((AWindow = FView) or IsChild(FView, AWindow));
end;

function TfrmHwNextHost.ProcessKey(const AMsg: TMsg): Boolean;
begin
  Result := (FView <> 0) and FBridge.ProcessKey(FView, AMsg);
end;

initialization
  FBridge := THwNextHostBridge.Create;

finalization
  if FBridge <> nil then
  begin
    if FBridge.InstanceCount = 0 then
    begin
      FBridge.RestoreMessageHook;
      FBridge.ReleaseLibrary;
      FreeAndNil(FBridge);
    end;
    // Um wrapper vivo ainda referencia o bridge: nesse caso, deixar bridge, hook e biblioteca para o encerramento do
    // processo.
  end;

end.
