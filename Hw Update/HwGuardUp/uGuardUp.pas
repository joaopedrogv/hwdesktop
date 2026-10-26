unit uGuardUp;

  /// Retorno das mensagens
  ///  0 - Sem resposta
  ///  1 - Mensagem recebida
  ///  2 - Programa em execução
  ///  99 - Erro Inesperado

interface

uses
  Forms, Messages, ExtCtrls, Controls, StdCtrls, Classes;

const
  HW_MENS_UPDATE = WM_COPYDATA;

type
  TfrmGuardUp = class(TForm)
    Panel1: TPanel;
    lbl1: TLabel;
    lblStatus: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure _hw_mens_instalar_at(var pMessage: TWMCopyData); message  HW_MENS_UPDATE;
  public
    { Public declarations }
  end;

  TGuardUpdate = class(TObject)
  private
    fAtualizacaoAtivada, fEmExecucao: Boolean;
    fPathAtualizador: string;
    fTimeSleepGuardSeconds: Integer; //Quando estiver finalizado deixar com valor de
    fTimerGuard: TTimer;
    fListaHwUp: TStringList;

    procedure _timerGuard(Sender: TObject);
    procedure _timerAtualizarHwUpdate(Sender: TObject);

    function _IsFileInUse(pArquivo: string): Boolean;
    procedure _verificarHwUpdateAtivo;
  public
    constructor create;
    procedure _Run;

    procedure _atualizarHwUpdate(pLista: WideString);

    property EmExecucao: Boolean read fEmExecucao write fEmExecucao;
  end;

var
  frmGuardUp: TfrmGuardUp;
  guard: TGuardUpdate;

implementation

uses Windows, FileCtrl, SysUtils, Registry;

{$R *.dfm}

{ TGuardUpdate }

constructor TGuardUpdate.create;
begin
  fEmExecucao := false;
  fPathAtualizador := 'HwUpdate.exe';
  fTimeSleepGuardSeconds := 5;
  fAtualizacaoAtivada := True;
  fTimerGuard := TTimer.Create(Application);
  fTimerGuard.Enabled := False;
  fTimerGuard.Interval := 1000 ;//* fTimeSleepGuardSeconds;
  fTimerGuard.OnTimer := _timerGuard;
  fListaHwUp := TStringList.Create;
end;

procedure TGuardUpdate._atualizarHwUpdate(pLista: WideString);
begin
  fListaHwUp.Text := pLista;
  fTimerGuard.Enabled := False;
  fTimerGuard.OnTimer := _timerAtualizarHwUpdate;
  fTimerGuard.Interval := 1000 * 2;
  fTimerGuard.Enabled := True;
end;

function TGuardUpdate._IsFileInUse(pArquivo: string): Boolean;
var
  HFileRes: HFILE;
begin
  Result := false;
  if not FileExists(pArquivo) then
    exit;

  try
    HFileRes := CreateFile(pchar(pArquivo), GENERIC_READ or GENERIC_WRITE, 0 {this is the trick!}, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    Result := (HFileRes = INVALID_HANDLE_VALUE);
    if not Result then
      CloseHandle(HFileRes);
  except
  end;
end;

procedure TGuardUpdate._Run;
begin
  fEmExecucao := False;
  fTimerGuard.Enabled := True;
end;

procedure TGuardUpdate._timerAtualizarHwUpdate(Sender: TObject);
var
  vLoop: Smallint;
  vFileTemp: string;
  vCopias: array of Smallint;
  I: Integer;
  vOK: Boolean;
begin
  fTimerGuard.Enabled := False;
  try
    frmGuardUp.Visible := True;

    if fListaHwUp.Count <= 2 then
    begin
      Application.MessageBox(pchar('Quantidade de Parâmetros incorretos: ' + #13 + fListaHwUp.Text), 'Atenção', 0  + 64);
      Exit;
    end;

    vLoop := 0;
    while vLoop <= 10 do
    begin
      Application.ProcessMessages;

      SetLength(vCopias, fListaHwUp.Count);
      for I := 0 to fListaHwUp.Count - 1 do
        vCopias[I] := 0;

      for I := 2 to fListaHwUp.Count - 1 do
      begin
        vFileTemp := ExtractFilePath(Application.ExeName) + ExtractFileName(fListaHwUp[I]);
        if vCopias[I] = 0 then
          if not _IsFileInUse(vFileTemp) then
            if CopyFile(pchar(fListaHwUp[i]), pchar(vFileTemp), False) then
              vCopias[I] := 1;
      end;

      vOK := True;
      for I := 2 to fListaHwUp.Count - 1 do
        if vCopias[I] = 0 then
          vOK := False;

      if vOK then
      begin
        WinExec( pchar(ExtractFilePath(Application.ExeName) + 'HwUpdate.exe HW_INSTALAR ' + fListaHwUp[1]), SW_NORMAL);
        Exit;
      end;
      Sleep(1000);

      Inc(vLoop);
    end;

    // Se sair do while quer dizer que a copia nao foi bem sucedida
    Application.MessageBox('Arquivos HwUpdate não foram substituídos. Deve ser feito manualmente', 'Atenção', 0  + 64);

  finally
    frmGuardUp.Visible := False;
    fTimerGuard.OnTimer := _timerGuard;
    fTimerGuard.Interval := 1000 * fTimeSleepGuardSeconds;
    fTimerGuard.Enabled := True;
    fEmExecucao := False;
  end;
end;

procedure TGuardUpdate._timerGuard(Sender: TObject);
begin
  if fEmExecucao then
    Exit;

  try
    fTimerGuard.Enabled := False;
    fEmExecucao := True;

    if not fAtualizacaoAtivada then
      Halt(0);
    if FindWindow('TfrmHwUpdate', nil) > 0 then
    else
    begin
      _verificarHwUpdateAtivo;
      if not fAtualizacaoAtivada then
        Halt(0);
      try
        WinExec(pchar(fPathAtualizador + ' HwGuardUp'), SW_HIDE);
      except
      end;
    end;

  finally
    fTimerGuard.Enabled := True;
    fEmExecucao := False;
  end;
end;

procedure TGuardUpdate._verificarHwUpdateAtivo;
var
  Registro: TRegistry;
begin
  try
    try
      fAtualizacaoAtivada := False;
      Registro := TRegistry.Create(KEY_READ);
      Registro.RootKey := HKEY_LOCAL_MACHINE;
      if Registro.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', False) then
        fAtualizacaoAtivada := Trim(Registro.ReadString('HwGuardUp')) <> '';
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

{ TForm3 }

procedure TfrmGuardUp.FormCreate(Sender: TObject);
var
  MyMsg: Cardinal;
  Mutex: Cardinal;
begin
  //cria um mutex usando um nome único
  MyMsg := RegisterWindowMessage('HwGuard2.OnlyOne');
  Mutex := CreateMutex(nil, True, 'Global\HwGuard2.OnlyOne');

  //verifica se houve erro na criação
  if (Mutex = 0) or (GetLastError = ERROR_ALREADY_EXISTS) then
    Halt(0); // cancela execução
  Application.ShowMainForm := False;
end;

procedure TfrmGuardUp._hw_mens_instalar_at(var pMessage: TWMCopyData);
var
  vLista: WideString;
begin
  if guard.EmExecucao then
  begin
    pMessage.Result := 2;
    Exit;
  end;

  guard.EmExecucao := True;
  try
    vLista := string(PChar(pMessage.CopyDataStruct.lpData));
    pMessage.Result := 1;
    guard._atualizarHwUpdate(vLista);
  except
    on e: exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Erro: ' + e.Message), 'Atenção', 0  + 64);
      pMessage.Result := 99;
//      guard.EmExecucao := False;
    end;
  end;
end;

end.
