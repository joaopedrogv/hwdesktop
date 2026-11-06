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

  THwNextErpContext = record
    CompanyCode: Integer;
    DatabaseName: string;
    UserName: string;
    Password: string;
  end;

function NextQueryOptions: THwNextOpenOptions;
function NextMultipleOptions(ADestroyOnClose: Boolean): THwNextOpenOptions;
function NextModalOptions: THwNextOpenOptions;

function SetNextHostContext(const AContext: THwNextErpContext): Boolean;

function OpenNextView(AOwner: TForm; const AIdentifier: string;
  const AOptions: THwNextOpenOptions): Boolean;

function CloseAllNextViews: Boolean;
function InvalidateNextViews: Boolean;
function ShutdownNextHost: Boolean;

implementation

uses
  SysUtils, Messages, ExtCtrls, Dialogs, Controls;

const
  HW_NEXT_DLL_NAME = 'hw.next.dll';
  EXPORT_API_VERSION: AnsiString = 'HwNextApiVersion';
  EXPORT_SET_CONTEXT: AnsiString = 'HwNextSetContext';
  EXPORT_OPEN_VIEW: AnsiString = 'HwNextOpenView';
  EXPORT_RESIZE_VIEW: AnsiString = 'HwNextResizeView';
  EXPORT_FOCUS_VIEW: AnsiString = 'HwNextFocusView';
  EXPORT_DESTROY_VIEW: AnsiString = 'HwNextDestroyView';
  EXPORT_CAN_CLOSE_VIEW: AnsiString = 'HwNextCanCloseView';
  EXPORT_PROCESS_KEY: AnsiString = 'HwNextProcessKey';
  EXPORT_VIEW_COUNT: AnsiString = 'HwNextViewCount';
  EXPORT_SHUTDOWN: AnsiString = 'HwNextShutdown';
  EXPORT_LAST_ERROR: AnsiString = 'HwNextLastError';

type
  // An individual window close is always user-initiated. The remaining
  // reasons are reserved for collective operations, which free MDI wrappers
  // directly instead of going through the form close event.
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
    SetContext: THwNextSetContext;
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
    function OpenView(AOwner: TForm; const AIdentifier: string;
      const AOptions: THwNextOpenOptions): Boolean;
    procedure ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
    function CreateView(AParent, ACloseTarget, AApplication: HWND;
      const AIdentifier: string; const AOptions: THwNextOpenOptions;
      AInstanceNumber: Integer): HWND;
    function ResizeView(AView: HWND; AWidth, AHeight: Integer): Boolean;
    function FocusView(AView: HWND): Boolean;
    function DestroyView(AView: HWND): Boolean;
    function CanCloseView(AView: HWND): Boolean;
    function ProcessKey(AView: HWND; const AMsg: TMsg): Boolean;
    function ViewCount: Integer;
    function Shutdown: Boolean;
    function SetContext(const AContext: THwNextErpContext): Boolean;
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
      const AIdentifier: string; const AOptions: THwNextOpenOptions;
      AInstanceNumber: Integer);
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
  Result := Assigned(AFirst) and Assigned(ASecond) and
    (TMethod(AFirst).Code = TMethod(ASecond).Code) and
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

function ValidateHostIdentifier(const AIdentifier: string;
  out AError: string): Boolean;
var
  I: Integer;
  Code: Integer;
begin
  AError := '';
  if AIdentifier = '' then
  begin
    AError := 'O identificador da tela Next n'#227'o pode ser vazio.';
    Result := False;
    Exit;
  end;
  if Length(AIdentifier) > HW_NEXT_IDENTIFIER_MAX_CHARS then
  begin
    AError := Format(
      'O identificador da tela Next deve ter no m'#225'ximo %d caracteres.',
      [HW_NEXT_IDENTIFIER_MAX_CHARS]);
    Result := False;
    Exit;
  end;
  for I := 1 to Length(AIdentifier) do
  begin
    Code := Ord(AIdentifier[I]);
    if (Code < 32) or (Code > 126) then
    begin
      AError := 'O identificador da tela Next deve conter apenas ' +
        'caracteres ASCII imprim'#237'veis.';
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

function SetNextHostContext(const AContext: THwNextErpContext): Boolean;
begin
  Result := FBridge.SetContext(AContext);
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
    raise Exception.CreateFmt(
      'A DLL hw.next.dll n'#227'o exporta a fun'#231#227'o %s.',
      [string(AName)]);
end;

procedure THwNextHostBridge.EnsureLibrary;
var
  Candidate: string;
  LoadError: DWORD;
  VersionFound: Integer;
begin
  if FLibraryHandle <> 0 then
    Exit;

  Candidate := ExtractFilePath(ParamStr(0)) + HW_NEXT_DLL_NAME;
  if FileExists(Candidate) then
    FLibraryHandle := LoadLibrary(PChar(Candidate))
  else
    FLibraryHandle := LoadLibrary(HW_NEXT_DLL_NAME);

  if FLibraryHandle = 0 then
  begin
    LoadError := GetLastError;
    raise Exception.CreateFmt(
      'N'#227'o foi poss'#237'vel carregar hw.next.dll.' + sLineBreak +
      'Caminho tentado: %s' + sLineBreak +
      'Tentativa por nome simples: %s' + sLineBreak +
      'Erro do Windows: %s',
      [Candidate, HW_NEXT_DLL_NAME, SysErrorMessage(LoadError)]);
  end;

  try
    FApi.Version := THwNextApiVersion(ResolveExport(EXPORT_API_VERSION));
    VersionFound := FApi.Version();
    if VersionFound <> HW_NEXT_VIEW_API_VERSION then
      raise Exception.CreateFmt(
        'Vers'#227'o incompat'#237'vel da interface de hw.next.dll: ' +
        'esperada %d, encontrada %d.',
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
    FApi.SetContext := THwNextSetContext(ResolveExport(EXPORT_SET_CONTEXT));
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
    Result := 'A DLL n'#227'o informou detalhes.';
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

function THwNextHostBridge.FindHostWindow(
  AWindow: HWND): TfrmHwNextHost;
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

function THwNextHostBridge.FindReusableInstance(
  const AIdentifier: string): TfrmHwNextHost;
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
    if (not Host.IsModal) and
       (Host.Options.Presentation = npMdi) and
       (Host.Options.InstancePolicy = nipSingle) and
       SameText(Host.Identifier, AIdentifier) and
       (not Host.IsClosing) then
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
    MessageDlg(AContext + sLineBreak + sLineBreak + ADetail,
      mtError, [mbOK], 0);
end;

function THwNextHostBridge.OpenView(AOwner: TForm;
  const AIdentifier: string;
  const AOptions: THwNextOpenOptions): Boolean;
var
  Host: TfrmHwNextHost;
  InstanceNumber: Integer;
  IdentifierError: string;
begin
  Result := False;
  if FOpening then
    Exit;

  // The complete host string is validated before any reuse lookup, library
  // load or wrapper construction. This rejects embedded #0, control and
  // non-ASCII characters, which a null-terminated ABI conversion would
  // otherwise truncate or alter.
  if not ValidateHostIdentifier(AIdentifier, IdentifierError) then
  begin
    ShowFailure('N'#227'o foi poss'#237'vel abrir a tela Next.', IdentifierError);
    Exit;
  end;

  if (AOwner = nil) or not AOwner.HandleAllocated then
  begin
    ShowFailure('N'#227'o foi poss'#237'vel abrir a tela Next.',
      'O formul'#225'rio principal do ERP n'#227'o est'#225' dispon'#237'vel.');
    Exit;
  end;

  if (FMdiParent <> nil) and (FMdiParent <> AOwner) then
  begin
    ShowFailure('N'#227'o foi poss'#237'vel abrir a tela Next.',
      'A tela Next j'#225' est'#225' vinculada a outra janela principal.');
    Exit;
  end;

  if (AOptions.Presentation = npModal) and
     ((AOptions.InstancePolicy <> nipMultiple) or
      (AOptions.ClosePolicy <> ncpDestroy)) then
  begin
    // A modal wrapper is always a new, own instance destroyed by the caller
    // after ShowModal. Rejecting other combinations prevents converting an
    // existing MDI instance into a modal presentation.
    ShowFailure('N'#227'o foi poss'#237'vel abrir a tela Next.',
      'A abertura modal exige m'#250'ltiplas inst'#226'ncias e destrui'#231#227'o no fechamento.');
    Exit;
  end;

  FOpening := True;
  try
    try
      EnsureLibrary;
      FMdiParent := AOwner;

      if AOptions.Presentation = npModal then
      begin
        // A modal opening always builds a new, own instance. It never reuses
        // an MDI wrapper and never converts an existing MDI instance.
        Inc(FNextInstanceNumber);
        InstanceNumber := FNextInstanceNumber;
        Host := TfrmHwNextHost.CreateHosted(AOwner, Self, AIdentifier,
          AOptions, InstanceNumber);
        try
          FInstances.Add(Host);
          if FInstances.Count = 1 then
            InstallMessageHook;
          try
            Host.ShowModal;
            Result := True;
          finally
            // ShowModal re-enables the owner and ends when the wrapper hides
            // itself. The caller frees the wrapper after the modal loop
            // returns; its destructor destroys the Rio view before removing
            // the bridge registration.
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
        Host := TfrmHwNextHost.CreateHosted(AOwner, Self, AIdentifier,
          AOptions, InstanceNumber);
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
        ShowFailure('N'#227'o foi poss'#237'vel abrir a tela Next.', E.Message);
        Result := False;
      end;
    end;
  finally
    FOpening := False;
  end;
end;

procedure THwNextHostBridge.ApplicationMessage(var Msg: TMsg;
  var Handled: Boolean);
var
  Host: TfrmHwNextHost;
  KeyMessage: TWMKey;
begin
  if Assigned(FPreviousOnMessage) and
    not SameMessageHandler(FPreviousOnMessage, ApplicationMessage) then
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
    if (FMdiParent <> nil) and FMdiParent.HandleAllocated and
      TranslateMDISysAccel(FMdiParent.ClientHandle, Msg) then
    begin
      Handled := True;
      Exit;
    end;

    if ((Msg.message = WM_KEYDOWN) or (Msg.message = WM_SYSKEYDOWN)) and
      (FMdiParent <> nil) and FMdiParent.HandleAllocated and
      IsWindowEnabled(FMdiParent.Handle) then
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
      // The message is consumed to prevent a second delivery. A modal dialog
      // must never be shown from inside the message hook.
      LogDiagnostic('Falha ao encaminhar tecla para a view Next: ' + E.Message);
      Handled := True;
    end;
  end;
end;

function THwNextHostBridge.CreateView(AParent, ACloseTarget,
  AApplication: HWND; const AIdentifier: string;
  const AOptions: THwNextOpenOptions; AInstanceNumber: Integer): HWND;
var
  Bits: Cardinal;
  IdentifierText: WideString;
begin
  Result := 0;
  if not Assigned(FApi.OpenView) then
    raise Exception.Create(
      'A interface de hw.next.dll n'#227'o foi inicializada.');
  Bits := EncodeOptions(AOptions);
  // OpenView validates the complete host string before reaching this point,
  // so the null-terminated UTF-16 buffer below carries exactly the same
  // characters that were used for the reuse lookup.
  IdentifierText := AIdentifier;
  Result := FApi.OpenView(PWideChar(IdentifierText), AParent,
    ACloseTarget, AApplication, Bits, AInstanceNumber);
  if Result = 0 then
    raise Exception.Create(LastErrorDetail);
end;

function THwNextHostBridge.ResizeView(AView: HWND; AWidth,
  AHeight: Integer): Boolean;
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

function THwNextHostBridge.ProcessKey(AView: HWND;
  const AMsg: TMsg): Boolean;
begin
  Result := False;
  if (AView = 0) or not Assigned(FApi.ProcessKey) then
    Exit;
  Result := FApi.ProcessKey(AView, AMsg.hwnd, AMsg.message, AMsg.wParam,
    AMsg.lParam) <> False;
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

function THwNextHostBridge.SetContext(
  const AContext: THwNextErpContext): Boolean;
const
  ContextFailure = 'Nao foi possivel preparar a tela Eventos RTC.';
  ContextRejected = 'O contexto da empresa nao foi aceito.';
var
  DatabaseName: WideString;
  UserName: WideString;
  Password: WideString;
begin
  Result := False;
  DatabaseName := '';
  UserName := '';
  Password := '';
  try
    // O buffer PWideChar termina em nulo; um #0 interno truncaria o valor
    // silenciosamente antes que o modulo pudesse valida-lo.
    if (Pos(#0, AContext.DatabaseName) > 0) or
       (Pos(#0, AContext.UserName) > 0) or
       (Pos(#0, AContext.Password) > 0) then
    begin
      ShowFailure(ContextFailure, ContextRejected);
      Exit;
    end;

    try
      EnsureLibrary;
    except
      on E: Exception do
      begin
        // Diagnosticos de carga, versao e exportacao nunca contem valores do contexto.
        ShowFailure(ContextFailure, E.Message);
        Exit;
      end;
    end;

    if not Assigned(FApi.SetContext) then
    begin
      ShowFailure(ContextFailure, ContextRejected);
      Exit;
    end;

    DatabaseName := AContext.DatabaseName;
    UserName := AContext.UserName;
    Password := AContext.Password;

    // O host nao armazena uma copia do contexto. O modulo possui os valores
    // recebidos e estes buffers locais sao limpos antes do retorno.
    if FApi.SetContext(AContext.CompanyCode, PWideChar(DatabaseName),
      PWideChar(UserName), PWideChar(Password)) = False then
    begin
      ShowFailure(ContextFailure, ContextRejected);
      Exit;
    end;

    Result := True;
  finally
    DatabaseName := '';
    UserName := '';
    Password := '';
  end;
end;

function THwNextHostBridge.CloseInstances(
  AReason: THwNextCloseReason): Boolean;
var
  I: Integer;
  Host: TfrmHwNextHost;
  PreviousCollectiveClose: Boolean;
begin
  FLastCloseReason := AReason;
  // Suppress the per-wrapper automatic shutdown while the collective command
  // disposes every instance. The command performs the single hook restoration,
  // module shutdown and library release after the disposal loop.
  PreviousCollectiveClose := FCollectiveClose;
  FCollectiveClose := True;
  try
    LogDiagnostic('Fechamento ' + CloseReasonName(FLastCloseReason) +
      ' de ' + IntToStr(FInstances.Count) + ' instancia(s) Next.');
    for I := FInstances.Count - 1 downto 0 do
    begin
      // A nested disposal may already have removed a registration.
      if I >= FInstances.Count then
        Continue;
      Host := TfrmHwNextHost(FInstances[I]);
      if Host.IsClosing then
        // The VCL is already releasing this wrapper; its destructor removes
        // the registration when it finishes.
        Continue;
      if Host.IsModal then
      begin
        // VCL runs the modal close query after Close returns, when the
        // bridge-wide flag has already been restored. The per-wrapper marker
        // keeps the collective intent through the deferred query and the
        // caller-owned destruction; it is never cleared before that query.
        Host.MarkCollectiveCloseRequested;
        // End the modal loop; the ShowModal caller frees the wrapper in its
        // finally block. The registration remains until that happens.
        Host.Close;
      end
      else
        // Synchronous free: the destructor destroys the Rio view before
        // removing the registration. It also releases retained-hidden
        // wrappers, whose HWND is hidden while VCL Visible is still True.
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
  // Collective user change/exit/invalidate is not an individual decision.
  // MDI wrappers are freed directly; modal wrappers still pass through
  // Host.Close/OnCloseQuery, so this flag is required.
  if FCollectiveClose or (AView = 0) then
    Exit;
  if not Assigned(FApi.CanCloseView) then
  begin
    // EnsureLibrary requires the export for version 3. This branch is a
    // defensive fail-closed guard if the API was cleared.
    LogDiagnostic('Consulta de fechamento indispon'#237'vel na interface Next.');
    Result := False;
    Exit;
  end;
  try
    Result := FApi.CanCloseView(AView) <> False;
  except
    on E: Exception do
    begin
      // Never show a second dialog from the close-query path. Keep the view
      // open and leave the diagnostic in the host log / module last error.
      LogDiagnostic('Falha ao consultar o fechamento da view Next: ' + E.Message);
      Result := False;
    end;
  end;
end;

function THwNextHostBridge.CloseAll(
  AReason: THwNextCloseReason): Boolean;
begin
  Result := CloseInstances(AReason);
  if Result then
  begin
    RestoreMessageHook;
    // Exactly one module shutdown and unload gate for the whole operation.
    Result := ReleaseLibrary;
  end;
end;

function THwNextHostBridge.Invalidate: Boolean;
begin
  Result := CloseAll(ncrInvalidate);
  if Result then
  begin
    // Force the next opening to build a new instance instead of reusing any
    // identity from the previous user session.
    FNextInstanceNumber := 0;
    FMdiParent := nil;
  end;
end;

function THwNextHostBridge.ShutdownHost: Boolean;
begin
  Result := CloseInstances(ncrShutdown);
  if not Result then
    // A modal wrapper is still registered. Leave the hook, the bridge and the
    // library in place; the caller of ShowModal still owns the wrapper.
    Exit;
  RestoreMessageHook;
  Result := ReleaseLibrary;
  // Zero instances were reached. Even when cleanup uncertainty keeps the
  // library loaded, the next opening must not reuse the previous identity.
  FNextInstanceNumber := 0;
  FMdiParent := nil;
end;

procedure THwNextHostBridge.NotifyInstanceClosed(AHost: TfrmHwNextHost);
begin
  if FInstances <> nil then
    FInstances.Remove(AHost);
  // A collective command performs the final shutdown itself. Do not unload
  // in the middle of its disposal loop.
  if FCollectiveClose then
    Exit;
  if (FInstances = nil) or (FInstances.Count = 0) then
  begin
    RestoreMessageHook;
    // The module clears its Application.Handle and releases residual views.
    // A failure keeps the library loaded and is not reported as success.
    ReleaseLibrary;
  end;
end;

function THwNextHostBridge.ReleaseLibrary: Boolean;
begin
  Result := False;
  if FLibraryHandle = 0 then
  begin
    Result := True;
    Exit;
  end;

  // A hidden wrapper still owns module resources. Never call into the module
  // or unload the library while a registered instance remains, and never
  // unload while the module still reports a live view.
  if InstanceCount > 0 then
    Exit;

  if not Shutdown then
    Exit;

  if ViewCount <> 0 then
    Exit;

  FreeLibrary(FLibraryHandle);
  FLibraryHandle := 0;
  FillChar(FApi, SizeOf(FApi), 0);
  Result := True;
end;

constructor TfrmHwNextHost.CreateHosted(AOwner: TForm;
  ABridge: THwNextHostBridge; const AIdentifier: string;
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
    // A modal presentation is a regular owned window driven by ShowModal,
    // never an MDI child and never shared with an MDI wrapper of the view.
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

  // If view creation fails, the constructor raises and the partially
  // constructed form is destroyed. The destructor releases any view already
  // created and only then removes the wrapper from the bridge registry.
  FView := FBridge.CreateView(FSurface.Handle, Handle, Application.Handle,
    FIdentifier, FOptions, AInstanceNumber);
end;

destructor TfrmHwNextHost.Destroy;
var
  Bridge: THwNextHostBridge;
begin
  Bridge := FBridge;

  // The module owns the Rio form. Destroy the view before removing the
  // registration, because reaching zero instances may unload the library.
  if (FView <> 0) and (Bridge <> nil) then
  begin
    try
      Bridge.DestroyView(FView);
    except
      on E: Exception do
        // Never propagate from the destructor; the module removes the view
        // from its registry and Shutdown retries residual views.
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
        // Lifecycle cleanup must not raise from a destructor.
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
    // Retained hide keeps fsMDIChild, the wrapper window, the panel and the
    // Rio view. VCL Visible was not changed, so this state drives the
    // re-presentation instead of the Visible property.
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
  // Collective disposal owns this wrapper until the ShowModal caller frees it.
  // VCL defers the modal close query until after CloseInstances returns, so
  // this marker, unlike the bridge-wide flag, covers the whole deferred
  // lifecycle. It must not be cleared before the close query runs.
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

procedure TfrmHwNextHost.HostCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // A collective operation already decided this wrapper's fate. The bridge
  // restores its collective flag before this deferred modal close query runs,
  // so the per-wrapper marker is the only surviving intent. Check it before
  // the module so no individual question can veto the collective close.
  if FCollectiveCloseRequested then
  begin
    CanClose := True;
    Exit;
  end;
  // The hosted view decides whether pending edits require a question. The
  // wrapper never asks by itself and never applies the policy before this
  // answer is known.
  CanClose := FBridge.CanCloseView(FView);
end;

procedure TfrmHwNextHost.HostClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if IsModal then
  begin
    // ShowModal owns the modal loop: hiding and returning mrOk ends it, and
    // the caller frees the wrapper afterwards. caFree here would destroy the
    // form inside its own modal loop and leave the caller with a dead object.
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
    // A VCL MDI child cannot be hidden through TCustomForm.Hide/SetVisible:
    // TCustomForm.VisibleChanging raises "Cannot hide an MDI Child Form" for
    // FormStyle = fsMDIChild. Cancel the structural close and hide the
    // wrapper window directly. FormStyle, the wrapper instance, the panel,
    // the Rio view and the window state are all kept, so Represent presents
    // the same instance again.
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
  Result := (FView <> 0) and
    ((AWindow = FView) or IsChild(FView, AWindow));
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
    // A live wrapper still references the bridge. If one exists at this
    // point, leave the bridge, the message hook and the loaded library to
    // process exit instead of risking a dangling reference.
  end;

end.
