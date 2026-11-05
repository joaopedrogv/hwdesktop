unit HwNextViewExportsUnit;

interface

implementation

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Forms, Vcl.Controls, HwNextViewApi, HwNextValidationFormUnit;

var
  Views: TList;
  LastErrorText: UnicodeString;
  UiThread: Cardinal;
  HostApplication: HWND;
  CleanupIncomplete: Boolean;

procedure ClearError;
begin
  LastErrorText := '';
end;

procedure RecordError(const AMessage: string);
begin
  LastErrorText := AMessage;
end;

procedure ClearModuleBinding;
begin
  Application.Handle := 0;
  UiThread := 0;
  HostApplication := 0;
end;

function RequireView(AView: HWND): TfrmHwNextValidation;
var
  I: Integer;
begin
  Result := nil;
  if Views.Count = 0 then
    raise Exception.Create('A tela Next não está aberta.');
  if GetCurrentThreadId <> UiThread then
    raise Exception.Create('A tela Next deve ser acessada pela thread visual que a criou.');
  for I := 0 to Views.Count - 1 do
  begin
    Result := TfrmHwNextValidation(Views[I]);
    if Result.Handle = AView then
      Exit;
  end;
  raise Exception.Create('A tela Next não está aberta.');
end;

function HwNextApiVersion: Integer; stdcall;
begin
  Result := HW_NEXT_VIEW_API_VERSION;
end;

function HwNextCreateView(AParent, ACloseTarget, AApplication: HWND;
  AInstanceNumber: Integer): HWND; stdcall;
var
  View: TfrmHwNextValidation;
  ClientRect: TRect;
  InitialBinding: Boolean;
  OriginalError: string;
begin
  Result := 0;
  ClearError;
  View := nil;
  InitialBinding := False;
  try
    if not IsWindow(AParent) or not IsWindow(ACloseTarget) or
      not IsWindow(AApplication) then
      raise Exception.Create('A janela hospedeira não está disponível.');
    if GetWindowThreadProcessId(AParent, nil) <> GetCurrentThreadId then
      raise Exception.Create('A janela hospedeira e o módulo devem usar a mesma thread visual.');
    if Views.Count = 0 then
    begin
      InitialBinding := True;
      UiThread := GetCurrentThreadId;
      HostApplication := AApplication;
      Application.Handle := AApplication;
    end
    else if (UiThread <> GetCurrentThreadId) or
      (HostApplication <> AApplication) then
      raise Exception.Create('O módulo Next usa uma única aplicação e thread visual.');

    View := TfrmHwNextValidation.CreateParented(AParent);
    View.InitializeView(ACloseTarget, AInstanceNumber);
    GetClientRect(AParent, ClientRect);
    View.SetBounds(0, 0, ClientRect.Right, ClientRect.Bottom);
    Views.Add(View);
    try
      View.Show;
    except
      Views.Remove(View);
      raise;
    end;
    Result := View.Handle;
  except
    on E: Exception do
    begin
      OriginalError := E.Message;
      if View <> nil then
      begin
        Views.Remove(View);
        try
          View.Free;
        except
          CleanupIncomplete := True;
        end;
        View := nil;
      end;
      if InitialBinding and (Views.Count = 0) then
      begin
        try
          ClearModuleBinding;
        except
          CleanupIncomplete := True;
        end;
      end;
      RecordError(OriginalError);
      Result := 0;
    end;
  end;
end;

function HwNextResizeView(AView: HWND; AWidth, AHeight: Integer): LongBool; stdcall;
var
  View: TfrmHwNextValidation;
begin
  Result := False;
  ClearError;
  try
    View := RequireView(AView);
    if (AWidth < 0) or (AHeight < 0) then
      raise Exception.Create('As dimensões da tela Next não podem ser negativas.');
    View.SetBounds(0, 0, AWidth, AHeight);
    Result := True;
  except
    on E: Exception do
      RecordError(E.Message);
  end;
end;

function HwNextFocusView(AView: HWND): LongBool; stdcall;
begin
  Result := False;
  ClearError;
  try
    RequireView(AView).FocusView;
    Result := True;
  except
    on E: Exception do
      RecordError(E.Message);
  end;
end;

function HwNextDestroyView(AView: HWND): LongBool; stdcall;
var
  View: TfrmHwNextValidation;
begin
  Result := False;
  ClearError;
  try
    View := RequireView(AView);
    Views.Remove(View);
    try
      View.Free;
      Result := True;
    except
      on E: Exception do
      begin
        CleanupIncomplete := True;
        RecordError(E.Message);
      end;
    end;
  except
    on E: Exception do
      RecordError(E.Message);
  end;
end;

function HwNextProcessKey(AView, ATarget: HWND; AMessage: Cardinal;
  AWParam: WPARAM; ALParam: LPARAM): LongBool; stdcall;
var
  View: TfrmHwNextValidation;
  Control: TWinControl;
  Target: HWND;
  Msg: TMsg;
  Handled: Boolean;
begin
  Result := False;
  ClearError;
  View := nil;

  // Only an unknown view or a foreign target rejects the message before any
  // processing. The host then leaves the key to its normal path.
  try
    View := RequireView(AView);
    if (AMessage < WM_KEYFIRST) or (AMessage > WM_KEYLAST) or
      ((ATarget <> View.Handle) and not IsChild(View.Handle, ATarget)) then
      Exit;
  except
    on E: Exception do
    begin
      RecordError(E.Message);
      Exit;
    end;
  end;

  // The view and target are accepted. Any failure from here is recorded but
  // reported as handled, so the host never delivers the same key twice.
  try
    Target := ATarget;
    Control := FindControl(Target);
    while (Control = nil) and (Target <> 0) and (Target <> View.Handle) do
    begin
      Target := GetParent(Target);
      Control := FindControl(Target);
    end;

    FillChar(Msg, SizeOf(Msg), 0);
    Msg.hwnd := ATarget;
    Msg.message := AMessage;
    Msg.wParam := AWParam;
    Msg.lParam := ALParam;
    Msg.time := GetMessageTime;
    GetCursorPos(Msg.pt);

    // Preprocess and route through the Rio VCL exactly once; no additional
    // message loop, message pump or private queue is created in this module.
    Handled := False;
    if Control <> nil then
    begin
      Handled := Control.PreProcessMessage(Msg);
      if not Handled then
        Handled := Control.Perform(CN_BASE + AMessage, AWParam, ALParam) <> 0;
    end;

    if not Handled then
    begin
      TranslateMessage(Msg);
      DispatchMessageW(Msg);
    end;
    Result := True;
  except
    on E: Exception do
    begin
      RecordError(E.Message);
      Result := True;
    end;
  end;
end;

function HwNextViewCount: Integer; stdcall;
begin
  Result := Views.Count;
end;

function HwNextShutdown: LongBool; stdcall;
var
  View: TfrmHwNextValidation;
begin
  Result := False;
  ClearError;
  try
    while Views.Count > 0 do
    begin
      View := TfrmHwNextValidation(Views[Views.Count - 1]);
      Views.Delete(Views.Count - 1);
      try
        View.Free;
      except
        on E: Exception do
        begin
          CleanupIncomplete := True;
          RecordError(E.Message);
        end;
      end;
    end;
    if CleanupIncomplete then
    begin
      if LastErrorText = '' then
        RecordError('A limpeza anterior da tela Next não foi concluída; a biblioteca não pode ser descarregada.');
      Exit;
    end;
    ClearModuleBinding;
    Result := True;
  except
    on E: Exception do
    begin
      CleanupIncomplete := True;
      RecordError(E.Message);
    end;
  end;
end;

function HwNextLastError(ABuffer: PWideChar; ACapacity: Integer): Integer; stdcall;
var
  Count: Integer;
begin
  Result := Length(LastErrorText);
  if (ABuffer = nil) or (ACapacity <= 0) then
    Exit;
  if ACapacity > Result then
    Count := Result
  else
    Count := ACapacity - 1;
  if Count > 0 then
    Move(LastErrorText[1], ABuffer^, Count * SizeOf(WideChar));
  ABuffer[Count] := #0;
end;

exports
  HwNextApiVersion name 'HwNextApiVersion',
  HwNextCreateView name 'HwNextCreateView',
  HwNextResizeView name 'HwNextResizeView',
  HwNextFocusView name 'HwNextFocusView',
  HwNextDestroyView name 'HwNextDestroyView',
  HwNextProcessKey name 'HwNextProcessKey',
  HwNextViewCount name 'HwNextViewCount',
  HwNextShutdown name 'HwNextShutdown',
  HwNextLastError name 'HwNextLastError';

initialization
  Views := TList.Create;

finalization
  while Views.Count > 0 do
  begin
    TfrmHwNextValidation(Views[Views.Count - 1]).Free;
    Views.Delete(Views.Count - 1);
  end;
  Views.Free;
  Application.Handle := 0;

end.
