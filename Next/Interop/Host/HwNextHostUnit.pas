// Delphi 2006
unit HwNextHostUnit;

interface

uses
  Windows, Forms;

function OpenNextView(AMdiParent: TForm): Boolean;

implementation

uses
  SysUtils, Messages, ExtCtrls, Dialogs, Controls,
  HwNextViewApi;

const
  HW_NEXT_DLL_NAME = 'hw.next.dll';
  EXPORT_API_VERSION: AnsiString = 'HwNextApiVersion';
  EXPORT_CREATE_VIEW: AnsiString = 'HwNextCreateView';
  EXPORT_RESIZE_VIEW: AnsiString = 'HwNextResizeView';
  EXPORT_FOCUS_VIEW: AnsiString = 'HwNextFocusView';
  EXPORT_DESTROY_VIEW: AnsiString = 'HwNextDestroyView';
  EXPORT_PROCESS_KEY: AnsiString = 'HwNextProcessKey';
  EXPORT_VIEW_COUNT: AnsiString = 'HwNextViewCount';
  EXPORT_SHUTDOWN: AnsiString = 'HwNextShutdown';
  EXPORT_LAST_ERROR: AnsiString = 'HwNextLastError';

type
  THwNextApi = record
    Version: THwNextApiVersion;
    CreateView: THwNextCreateView;
    ResizeView: THwNextResizeView;
    FocusView: THwNextFocusView;
    DestroyView: THwNextDestroyView;
    ProcessKey: THwNextProcessKey;
    ViewCount: THwNextViewCount;
    Shutdown: THwNextShutdown;
    LastError: THwNextLastError;
  end;

  THwNextHostBridge = class(TObject)
  private
    FLibraryHandle: HMODULE;
    FApi: THwNextApi;
    FPreviousOnMessage: TMessageEvent;
    FOpenViewCount: Integer;
    FNextInstanceNumber: Integer;
    FOpening: Boolean;
    FMdiParent: TForm;
    FHookInstalled: Boolean;
    procedure EnsureLibrary;
    function ResolveExport(const AName: AnsiString): Pointer;
    function LastErrorDetail: string;
    procedure InstallMessageHook;
    procedure RestoreMessageHook;
    function FindHostWindow(AWindow: HWND): TForm;
    procedure ShowFailure(const AContext, ADetail: string);
  public
    function OpenView(AMdiParent: TForm): Boolean;
    procedure ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
    function CreateView(AParent, ACloseTarget, AApplication: HWND;
      AInstanceNumber: Integer): HWND;
    function ResizeView(AView: HWND; AWidth, AHeight: Integer): Boolean;
    function FocusView(AView: HWND): Boolean;
    function DestroyView(AView: HWND): Boolean;
    function ProcessKey(AView: HWND; const AMsg: TMsg): Boolean;
    function ViewCount: Integer;
    function Shutdown: Boolean;
    procedure NotifyViewClosed;
    procedure ReleaseLibrary;
    property OpenViewCount: Integer read FOpenViewCount;
  end;

  TfrmHwNextHost = class(TForm)
  private
    FBridge: THwNextHostBridge;
    FSurface: TPanel;
    FView: HWND;
    FViewCounted: Boolean;
    procedure SurfaceResize(Sender: TObject);
    procedure HostActivate(Sender: TObject);
    procedure HostCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure HostClose(Sender: TObject; var Action: TCloseAction);
  public
    constructor CreateHosted(AMdiParent: TForm; ABridge: THwNextHostBridge;
      AInstanceNumber: Integer);
    destructor Destroy; override;
    function OwnsWindow(AWindow: HWND): Boolean;
    function ProcessKey(const AMsg: TMsg): Boolean;
    property ViewHandle: HWND read FView;
    property ViewCounted: Boolean read FViewCounted write FViewCounted;
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

function OpenNextView(AMdiParent: TForm): Boolean;
begin
  Result := FBridge.OpenView(AMdiParent);
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
    FApi.CreateView := THwNextCreateView(ResolveExport(EXPORT_CREATE_VIEW));
    FApi.ResizeView := THwNextResizeView(ResolveExport(EXPORT_RESIZE_VIEW));
    FApi.FocusView := THwNextFocusView(ResolveExport(EXPORT_FOCUS_VIEW));
    FApi.DestroyView := THwNextDestroyView(ResolveExport(EXPORT_DESTROY_VIEW));
    FApi.ProcessKey := THwNextProcessKey(ResolveExport(EXPORT_PROCESS_KEY));
    FApi.ViewCount := THwNextViewCount(ResolveExport(EXPORT_VIEW_COUNT));
    FApi.Shutdown := THwNextShutdown(ResolveExport(EXPORT_SHUTDOWN));
    FApi.LastError := THwNextLastError(ResolveExport(EXPORT_LAST_ERROR));
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

function THwNextHostBridge.FindHostWindow(AWindow: HWND): TForm;
var
  I: Integer;
  Host: TfrmHwNextHost;
begin
  Result := nil;
  if FMdiParent = nil then
    Exit;
  for I := 0 to FMdiParent.MDIChildCount - 1 do
    if FMdiParent.MDIChildren[I] is TfrmHwNextHost then
    begin
      Host := TfrmHwNextHost(FMdiParent.MDIChildren[I]);
      if Host.OwnsWindow(AWindow) then
      begin
        Result := Host;
        Exit;
      end;
    end;
end;

procedure THwNextHostBridge.ShowFailure(const AContext, ADetail: string);
begin
  if ADetail = '' then
    MessageDlg(AContext, mtError, [mbOK], 0)
  else
    MessageDlg(AContext + sLineBreak + sLineBreak + ADetail,
      mtError, [mbOK], 0);
end;

function THwNextHostBridge.OpenView(AMdiParent: TForm): Boolean;
var
  Host: TfrmHwNextHost;
  InstanceNumber: Integer;
begin
  Result := False;
  if FOpening then
    Exit;

  if (AMdiParent = nil) or not AMdiParent.HandleAllocated then
  begin
    ShowFailure('N'#227'o foi poss'#237'vel abrir a tela Next.',
      'O formul'#225'rio principal do ERP n'#227'o est'#225' dispon'#237'vel.');
    Exit;
  end;

  if (FMdiParent <> nil) and (FMdiParent <> AMdiParent) then
  begin
    ShowFailure('N'#227'o foi poss'#237'vel abrir a tela Next.',
      'A tela Next j'#225' est'#225' vinculada a outra janela principal.');
    Exit;
  end;

  FOpening := True;
  try
    try
      EnsureLibrary;
      FMdiParent := AMdiParent;
      Inc(FNextInstanceNumber);
      InstanceNumber := FNextInstanceNumber;
      Host := TfrmHwNextHost.CreateHosted(AMdiParent, Self, InstanceNumber);
      try
        Inc(FOpenViewCount);
        Host.ViewCounted := True;
        if FOpenViewCount = 1 then
          InstallMessageHook;
        Host.Show;
        Result := True;
      except
        Host.Free;
        raise;
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

  Host := TfrmHwNextHost(FindHostWindow(Msg.hwnd));
  if Host = nil then
    Exit;

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
  AApplication: HWND; AInstanceNumber: Integer): HWND;
begin
  Result := 0;
  if not Assigned(FApi.CreateView) then
    raise Exception.Create(
      'A interface de hw.next.dll n'#227'o foi inicializada.');
  Result := FApi.CreateView(AParent, ACloseTarget, AApplication,
    AInstanceNumber);
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

procedure THwNextHostBridge.NotifyViewClosed;
begin
  if FOpenViewCount > 0 then
    Dec(FOpenViewCount);
  if FOpenViewCount = 0 then
  begin
    RestoreMessageHook;
    // The module clears its Application.Handle and releases residual views.
    // A failure keeps the library loaded; the result is not presented as
    // success and no dialog is shown from the destruction path.
    Shutdown;
  end;
end;

procedure THwNextHostBridge.ReleaseLibrary;
begin
  if FLibraryHandle = 0 then
    Exit;

  if not Shutdown then
    Exit;

  // Never unload while a host wrapper can still call the module.
  if FOpenViewCount > 0 then
    Exit;

  if ViewCount <> 0 then
    Exit;

  FreeLibrary(FLibraryHandle);
  FLibraryHandle := 0;
  FillChar(FApi, SizeOf(FApi), 0);
end;

constructor TfrmHwNextHost.CreateHosted(AMdiParent: TForm;
  ABridge: THwNextHostBridge; AInstanceNumber: Integer);
begin
  inherited CreateNew(AMdiParent);
  FBridge := ABridge;
  Caption := Format('Eventos DFe - Next %d', [AInstanceNumber]);
  Position := poDefault;
  Width := 680;
  Height := 470;
  Constraints.MinWidth := 440;
  Constraints.MinHeight := 350;
  OnActivate := HostActivate;
  OnCloseQuery := HostCloseQuery;
  OnClose := HostClose;
  FormStyle := fsMDIChild;

  FSurface := TPanel.Create(Self);
  FSurface.Parent := Self;
  FSurface.Align := alClient;
  FSurface.BevelOuter := bvNone;
  FSurface.Caption := '';
  FSurface.OnResize := SurfaceResize;

  // If view creation fails, the constructor raises and the partially
  // constructed form is destroyed; Destroy releases any view already created
  // and the owned surface before the wrapper window disappears.
  FView := FBridge.CreateView(FSurface.Handle, Handle, AMdiParent.Handle,
    AInstanceNumber);
end;

destructor TfrmHwNextHost.Destroy;
begin
  if (FView <> 0) and (FBridge <> nil) then
  begin
    try
      FBridge.DestroyView(FView);
    except
      on E: Exception do
        // Never propagate from the destructor; the module removes the view
        // from its registry and Shutdown retries residual views.
        LogDiagnostic('Falha ao liberar a view Next no destructor: ' + E.Message);
    end;
    FView := 0;
  end;

  if FViewCounted and (FBridge <> nil) then
  begin
    FViewCounted := False;
    try
      FBridge.NotifyViewClosed;
    except
      on E: Exception do
        // Lifecycle cleanup must not raise from a destructor.
        LogDiagnostic('Falha ao notificar o fechamento da view Next: ' + E.Message);
    end;
  end;

  inherited Destroy;
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
  CanClose := True;
end;

procedure TfrmHwNextHost.HostClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
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
    FBridge.RestoreMessageHook;
    FBridge.ReleaseLibrary;
    // A live wrapper still references the bridge. If it exists at this point,
    // leave the bridge and library to process exit instead of risking a
    // dangling reference.
    if FBridge.OpenViewCount = 0 then
      FreeAndNil(FBridge);
  end;

end.
