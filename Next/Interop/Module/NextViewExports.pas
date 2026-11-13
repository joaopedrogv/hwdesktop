unit NextViewExports;

interface

implementation

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Forms, Vcl.Controls, HwNextViewApi, NextBaseForm,
  NextViewCatalog, NextSetup, NextAuthorizationBridge;

const
  KnownOptionsMask: Cardinal = HW_NEXT_OPT_KNOWN;
  ContextRejectedMessage = 'O contexto da empresa nao foi aceito.';

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

procedure ValidateIdentifier(const AIdentifier: string);
var
  I: Integer;
  Code: Integer;
begin
  if AIdentifier = '' then
    raise Exception.Create('O identificador do formulário Next não pode ser vazio.');
  if Length(AIdentifier) > HW_NEXT_IDENTIFIER_MAX_CHARS then
    raise Exception.CreateFmt(
      'O identificador do formulário Next deve ter no máximo %d caracteres.',
      [HW_NEXT_IDENTIFIER_MAX_CHARS]);
  for I := 1 to Length(AIdentifier) do
  begin
    Code := Ord(AIdentifier[I]);
    if (Code < 32) or (Code > 126) then
      raise Exception.Create(
        'O identificador do formulário Next deve conter apenas caracteres ASCII imprimíveis.');
  end;
end;

function RequireView(AView: HWND): TfrmNextBase;
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
    Result := TfrmNextBase(Views[I]);
    if Result.Handle = AView then
      Exit;
  end;
  raise Exception.Create('A tela Next não está aberta.');
end;

function HwNextApiVersion: Integer; stdcall;
begin
  Result := HW_NEXT_VIEW_API_VERSION;
end;

function HwNextSetContext(ACompanyCode: Integer;
  AUserLogin, ADatabaseName, ADatabaseUserName,
  ADatabasePassword: PWideChar): LongBool; stdcall;
var
  UserLogin: string;
  DatabaseName: string;
  DatabaseUserName: string;
  DatabasePassword: string;
  View: TfrmNextBase;
  I: Integer;
  IdentityChanged: Boolean;
begin
  Result := False;
  ClearError;
  UserLogin := '';
  DatabaseName := '';
  DatabaseUserName := '';
  DatabasePassword := '';
  try
    try
      try
        if AUserLogin <> nil then
          UserLogin := AUserLogin;
        if ADatabaseName <> nil then
          DatabaseName := ADatabaseName;
        if ADatabaseUserName <> nil then
          DatabaseUserName := ADatabaseUserName;
        if ADatabasePassword <> nil then
          DatabasePassword := ADatabasePassword;

        if ACompanyCode <= 0 then
          raise Exception.Create(ContextRejectedMessage);
        if UserLogin = '' then
          raise Exception.Create(ContextRejectedMessage);
        if DatabaseName = '' then
          raise Exception.Create(ContextRejectedMessage);
        if DatabaseUserName = '' then
          raise Exception.Create(ContextRejectedMessage);
        if DatabasePassword = '' then
          raise Exception.Create(ContextRejectedMessage);

        IdentityChanged := not NextSetupInstance.HasContext;
        if not IdentityChanged then
          IdentityChanged :=
            (NextSetupInstance.SessionContext.EmpresaId <> ACompanyCode) or
            (NextSetupInstance.SessionContext.UsuarioLogin <> UserLogin);

        // A identidade e aplicada mesmo com telas abertas. Em um banco ja
        // configurado, o Setup preserva adaptador, container e a instancia de
        // sessao, atualizando somente empresa e login.
        NextSetupInstance.SetContext(ACompanyCode, UserLogin, DatabaseName,
          DatabaseUserName, DatabasePassword);
      except
        RecordError(ContextRejectedMessage);
        Exit;
      end;

      // A identidade ja foi publicada e nao e desfeita por falhas de limpeza.
      Result := True;

      if IdentityChanged then
      begin
        // Toda tela registrada, inclusive oculta, descarta o resultado da
        // identidade anterior. Uma falha bloqueia o descarregamento do modulo
        // e desabilita a tela afetada, mas as demais continuam sendo processadas.
        for I := 0 to Views.Count - 1 do
        begin
          View := TfrmNextBase(Views[I]);
          try
            View.ResetForSessionChange;
          except
            on E: Exception do
            begin
              CleanupIncomplete := True;
              RecordError(E.Message);
              try
                View.Enabled := False;
              except
              end;
            end;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        // Falha inesperada depois da identidade: a sessao nova permanece
        // aplicada e o descarregamento fica bloqueado.
        CleanupIncomplete := True;
        if LastErrorText = '' then
          RecordError(E.Message);
      end;
    end;
  finally
    UserLogin := '';
    DatabaseName := '';
    DatabaseUserName := '';
    DatabasePassword := '';
  end;
end;

function HwNextOpenView(AIdentifier: PWideChar; AParent, ACloseTarget,
  AApplication: HWND; AOptions: Cardinal; AInstanceNumber: Integer): HWND; stdcall;
var
  Identifier: string;
  View: TfrmNextBase;
  ClientRect: TRect;
  InitialBinding: Boolean;
  OriginalError: string;
begin
  Result := 0;
  ClearError;
  View := nil;
  InitialBinding := False;
  try
    if AIdentifier = nil then
      raise Exception.Create('O identificador do formulário Next não foi informado.');
    Identifier := AIdentifier;
    ValidateIdentifier(Identifier);
    if (AOptions and not KnownOptionsMask) <> 0 then
      raise Exception.Create('As opções de abertura do formulário Next são inválidas.');
    if (AOptions and HW_NEXT_OPT_MODAL) <> 0 then
      if ((AOptions and HW_NEXT_OPT_MULTIPLE) = 0) or
        ((AOptions and HW_NEXT_OPT_DESTROY) = 0) then
        raise Exception.Create(
          'A abertura modal exige múltiplas instâncias e destruição no fechamento.');
    if AInstanceNumber <= 0 then
      raise Exception.Create('O número da instância Next deve ser positivo.');
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

    View := NextViewCreate(Identifier, AParent);
    View.InitializeNextView(Identifier, AInstanceNumber, ACloseTarget,
      (AOptions and HW_NEXT_OPT_DESTROY) <> 0);
    GetClientRect(AParent, ClientRect);
    View.SetBounds(0, 0, ClientRect.Right, ClientRect.Bottom);
    Views.Add(View);
    View.Show;
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
  View: TfrmNextBase;
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
  View: TfrmNextBase;
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
  View: TfrmNextBase;
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

function HwNextCanCloseView(AView: HWND): LongBool; stdcall;
var
  View: TfrmNextBase;
begin
  Result := False;
  ClearError;
  try
    View := RequireView(AView);
    Result := View.ConfirmClose;
  except
    on E: Exception do
    begin
      RecordError(E.Message);
      Result := False;
    end;
  end;
end;

function HwNextViewCount: Integer; stdcall;
begin
  Result := Views.Count;
end;

function HwNextShutdown: LongBool; stdcall;
var
  View: TfrmNextBase;
begin
  Result := False;
  ClearError;
  try
    while Views.Count > 0 do
    begin
      View := TfrmNextBase(Views[Views.Count - 1]);
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
    // O callback pertence ao host: a biblioteca nao o mantem depois de
    // encerrar as telas, antes de liberar a conexao compartilhada.
    NextAuthorizationBridge.SetAuthorizationCallback(nil);
    // Cada tela devolveu seu leitor ao ser liberada. Somente depois disso o
    // adaptador libera a conexao compartilhada que os leitores utilizavam.
    NextSetupInstance.Release;
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

function HwNextSetAuthorizationCallback(
  ACallback: THwNextAuthorizationCallback): LongBool; stdcall;
begin
  // O host informa o callback na carga e o remove antes de descarregar a
  // biblioteca; a ponte apenas guarda o ponteiro e nao assume sua propriedade.
  NextAuthorizationBridge.SetAuthorizationCallback(ACallback);
  Result := True;
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
  HwNextSetContext name 'HwNextSetContext',
  HwNextOpenView name 'HwNextOpenView',
  HwNextResizeView name 'HwNextResizeView',
  HwNextFocusView name 'HwNextFocusView',
  HwNextDestroyView name 'HwNextDestroyView',
  HwNextCanCloseView name 'HwNextCanCloseView',
  HwNextProcessKey name 'HwNextProcessKey',
  HwNextViewCount name 'HwNextViewCount',
  HwNextShutdown name 'HwNextShutdown',
  HwNextSetAuthorizationCallback name 'HwNextSetAuthorizationCallback',
  HwNextLastError name 'HwNextLastError';

initialization
  Views := TList.Create;

finalization
  // A descarga do modulo nao deixa ponteiro para o callback do host.
  NextAuthorizationBridge.SetAuthorizationCallback(nil);
  while Views.Count > 0 do
  begin
    TfrmNextBase(Views[Views.Count - 1]).Free;
    Views.Delete(Views.Count - 1);
  end;
  Views.Free;
  Application.Handle := 0;

end.
