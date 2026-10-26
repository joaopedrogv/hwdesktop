unit uServiceLess;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Data.DB, Data.SqlExpr,
  Data.DbxSqlite;

type

  TConSqlite = class
  private
    con: TSQLConnection;
    Fquery: TSQLQuery;
  public
    constructor Create(dbName: string);
    destructor Destroy; override;

    property query: TSQLQuery read Fquery write Fquery;
  end;

  OneInstance = class
  public
    class function Create(id, name: string): Boolean;
    class function Valid(id, name: string; update: Boolean = True): Boolean;
  end;

  TfrmNFCServiceLess = class(TForm)
    TimerCkeck: TTimer;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    Enviarcontingnciasagora1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    SincronizarcomoCloudagora1: TMenuItem;
    N2: TMenuItem;
    EmpresaECaixaMenu: TMenuItem;
    VisualizarLogdeSincronizaoNFCe1: TMenuItem;
    N3: TMenuItem;
    TimerClose: TTimer;
    TimerCkeckUrgency: TTimer;
    TimerOneInstance: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TimerCkeckTimer(Sender: TObject);
    procedure TimerCkeckUrgencyTimer(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Enviarcontingnciasagora1Click(Sender: TObject);
    procedure SincronizarcomoCloudagora1Click(Sender: TObject);
    procedure VisualizarLogdeSincronizaoNFCe1Click(Sender: TObject);
    procedure TimerCloseTimer(Sender: TObject);
    procedure TimerOneInstanceTimer(Sender: TObject);
  private
    { Private declarations }

    MutexId: string;
    MutexString: string;
    CodigoEmpresa: Integer;
    caixaId: Integer;
    Token: string;
    MilisecondsCeck: Integer;
    LastCloudSinc: TDateTime;
    procedure EnviarContingencias(silent: Boolean = True);
    procedure SincronizarCloud(silent: Boolean = True);

    procedure TrimAppMemorySize;
  public
    { Public declarations }
  end;

var
  frmNFCServiceLess: TfrmNFCServiceLess;

implementation

uses
  hw_utils,
  hw_win_utils,
  System.StrUtils;

function nfce_serviceless_enviar_contingencias(CodigoEmpresa: Longint; token: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_retorna_ultimo_erro: WideString; stdcall; external 'hw.nfe.dx.dll';
function cloud_sinc(paramsList: WideString): Longint; stdcall; external 'hw.utils.dx.dll';
function cloud_view_log(paramsList: WideString): Longint; stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

procedure TfrmNFCServiceLess.EnviarContingencias(silent: Boolean);
begin
  if TimerClose.Enabled then
    Exit;

  if not TimerCkeck.Enabled then
    Exit;

  TimerCkeck.Enabled := False;
  try
    TrayIcon1.Visible := True;
    TrayIcon1.Hint := Format('Hw NFCe ServiceLess - Enviando contingências - Caixa %s', [caixaId.ToString().PadLeft(3, '0')]);
    try

      if nfce_serviceless_enviar_contingencias(CodigoEmpresa, WideString(Token)) <> 1 then // caso o
      begin
        var err := string(nfce_client_retorna_ultimo_erro);
        LogApp.Log('HWNFCeServiceLess_Contingencias', err);
        if not silent then
          ShowErro(err);
      end;

    except on E: Exception do
      begin
        LogApp.Log('HWNFCeServiceLess_Contingencias', e.Message);
        if not silent then
          ShowErro(e.Message);
      end;
    end;

  finally
    TrayIcon1.Hint := Format('Hw NFCe ServiceLess - Ocioso - Caixa %s', [caixaId.ToString().PadLeft(3, '0')]);
    TimerCkeck.Enabled := True;
  end;
end;

procedure TfrmNFCServiceLess.Enviarcontingnciasagora1Click(Sender: TObject);
begin
  EnviarContingencias(False);
end;

procedure TfrmNFCServiceLess.FormCreate(Sender: TObject);
var
  MyMsg: Cardinal;
  Mutex: Cardinal;
begin
  MutexId := TGuid.NewGuid.ToString().Replace('{', '').Replace('}','').ToLower();

  if not ParamApp.Exists('LESS') then
    Halt(0);

  if not ParamApp.Exists('cnpj') then
    Halt(0);

  if not ParamApp.Exists('empresaId') then
    Halt(0);

  if not ParamApp.Exists('caixaId') then
    Halt(0);

  var isLog := '';
  if ParamApp.Exists('LOGSINCNFCE') then
    isLog := 'LOGSINCNFCE' + ParamApp.Value('host');

  if not ParamApp.Value('urgency').ToLower.Equals('true') then
  begin

    //cria um mutex usando um nome único
    {
    MyMsg := RegisterWindowMessage(PWideChar('HwNFCeServiceLess.OnlyOne.' + ParamApp.Value('cnpj') + isLog + ParamApp.Value('caixaId') ));
    Mutex := CreateMutex(nil, True, PWideChar('Global\HwNFCeServiceLess.OnlyOne.' + ParamApp.Value('cnpj') + isLog + ParamApp.Value('caixaId')));

    //verifica se houve erro na criação
    if (Mutex = 0) or (GetLastError = ERROR_ALREADY_EXISTS) then
    begin
      LogApp.LogR('HWNFCeServiceLess_Status', 'if (Mutex = 0) or (GetLastError = ERROR_ALREADY_EXISTS) then - ' + sLineBreak +
                                              'Global\HwNFCeServiceLess.OnlyOne.' + ParamApp.Value('cnpj') + isLog + ParamApp.Value('caixaId'));

      Halt(0); // cancela execução
    end;
    }
    MutexString := 'HwNFCeServiceLess.OnlyOne.' + ParamApp.Value('cnpj') + isLog + ParamApp.Value('caixaId');
    MyMsg := RegisterWindowMessage(PWideChar(MutexString));
    Mutex := CreateMutex(nil, True, PWideChar('Global\' + MutexString));

    //verifica se houve erro na criação
    if (Mutex = 0) or (GetLastError = ERROR_ALREADY_EXISTS) then
    begin
      LogApp.Log('HWNFCeServiceLess_Status', 'if (Mutex = 0) or (GetLastError = ERROR_ALREADY_EXISTS) then - ' + sLineBreak +
                                             'Global\' + MutexString);

      Halt(0); // cancela execução
    end;

    if FileExists(ExtractFilePath(Application.ExeName) + 'sqlite3.dll') then
      if not OneInstance.Create(MutexId, MutexString) then
      begin
        LogApp.Log('HWNFCeServiceLess_Status', 'if not OneInstance.Create(MutexId, MutexString) then - ' + sLineBreak +
                                               'Id: ' + MutexId + sLineBreak +
                                               'Name: ' + MutexString);
        Halt(0);
      end;

  end;

  MilisecondsCeck := 0;

  CodigoEmpresa := -1;
  TryStrToInt(ParamApp.Value('empresaId'), CodigoEmpresa);
  if CodigoEmpresa = -1 then
  begin
    LogApp.Log('HWNFCeServiceLess_Status', 'Não iniciado, falta parametro "empresaId"');
    Halt(0);
  end;

  caixaId := -1;
  TryStrToInt(ParamApp.Value('caixaId'), caixaId);
  if caixaId = -1 then
  begin
    LogApp.Log('HWNFCeServiceLess_Status', 'Não iniciado, falta parametro "caixaId"');
    Halt(0);
  end;

  Token := caixaId.ToString();

  var minutos := IniConf.ReadInt('ServiceLess', 'IntervaloMinutos', 10);

  if minutos < 1  then //menor que 60 segundos
    minutos := 1
  else if minutos > 10  then // maior que 10 minutos
    minutos := 10;

  MilisecondsCeck := minutos * 60 * 1000;

  Application.ShowMainForm := False;

  //pametro vai abrir o log apenas e finalizar quando fechar a tela
  if ParamApp.Exists('LOGSINCNFCE') then
  begin
    TrayIcon1.Visible := False;
    TimerCkeck.Enabled := False;
    cloud_view_log(WideString(Format(';cnpj=%s;empresaId=%d;caixaId=%d', [ParamApp.Value('cnpj'), CodigoEmpresa, caixaId])));
    Halt(0);
  end;

  if ParamApp.Value('urgency').ToLower.Equals('true') then
  begin
    TrayIcon1.Visible := False;
    TimerCkeck.Enabled := False;
    cloud_sinc(WideString(Format(';cnpj=%s;empresaId=%d;caixaId=%d;urgency=true', [ParamApp.Value('cnpj'), CodigoEmpresa, caixaId])));
    Halt(0);
  end;

  LogApp.LogR('HWNFCeServiceLess_Status', 'Iniciando');

  if IniConf.ReadStr('ServiceLess', 'EnviarContingencias') = '' then
    IniConf.Write('ServiceLess', 'EnviarContingencias', 'S');

  if IniConf.ReadStr('ServiceLess', 'NFCeOffline') = '' then
    IniConf.Write('ServiceLess', 'NFCeOffline', 'N');

  EmpresaECaixaMenu.Caption := Format('>> Empresa %s - Caixa %s - Min %d <<',
    [CodigoEmpresa.ToString().PadLeft(3, '0'), caixaId.ToString().PadLeft(3, '0'), minutos]);

  TrayIcon1.Visible := True;
  TrayIcon1.BalloonHint := Format('Hw NFCe ServiceLess - Caixa %s', [caixaId.ToString().PadLeft(3, '0')]);
  TrayIcon1.Hint := Format('Hw NFCe ServiceLess - Ocioso - Caixa %s', [caixaId.ToString().PadLeft(3, '0')]);
  TimerCkeck.Interval := 10 * 1000;
//  TimerCkeck.Interval := 100 * 1000;
  TimerCkeck.Enabled  := True;
//  TimerCkeckUrgency.Enabled  := True;
  TimerOneInstance.Interval := 60 * 1000;
  TimerOneInstance.Enabled := FileExists(ExtractFilePath(Application.ExeName) + 'sqlite3.dll');
  LastCloudSinc := Now - EncodeTime(1, 0, 0, 0);
end;

procedure TfrmNFCServiceLess.Sair1Click(Sender: TObject);
begin
//   Halt(0);
//  Application.Terminate;
  TimerCkeck.Enabled := False;
  TimerCkeckUrgency.Enabled := False;
  TimerOneInstance.Enabled := False;
  TimerClose.Enabled := True;
end;

procedure TfrmNFCServiceLess.SincronizarCloud(silent: Boolean);
type
  CloudParams = record
    databaseName: string;
    charSet: string;
    empresaId: string;
    caixaId: string;
  end;
var
  cloudP: CloudParams;
begin
  if TimerClose.Enabled then
    Exit;

  if not TimerCkeck.Enabled then
    Exit;

  var dif := Now - LastCloudSinc;
  if dif < EncodeTime(0, 0, 59, 0) then
    Exit;

  TimerCkeck.Enabled := False;
  try
    TrayIcon1.Visible := True;
    TrayIcon1.Hint := Format('Hw NFCe ServiceLess - Sincronizando com o Cloud - Caixa %s', [caixaId.ToString().PadLeft(3, '0')]);
    try
      var s:= Format(';silent=%s;empresaId=%d;caixaId=%d',[IfThen(silent, 'true', 'false'), CodigoEmpresa, caixaId]);

      cloud_sinc(WideString(s));

    except on E: Exception do
      begin
        LogApp.Log('HWNFCeServiceLess_Sincronizacao', e.Message);
        if not silent then
          ShowErro(e.Message);
      end;
    end;

  finally
    TrayIcon1.Hint := Format('Hw NFCe ServiceLess - Ocioso - Caixa %s', [caixaId.ToString().PadLeft(3, '0')]);
    TimerCkeck.Enabled := True;
  end;
end;

procedure TfrmNFCServiceLess.SincronizarcomoCloudagora1Click(
  Sender: TObject);
begin
  SincronizarCloud(False);
end;

procedure TfrmNFCServiceLess.TimerCkeckTimer(Sender: TObject);
begin
  if TimerClose.Enabled then
    Exit;

  if (IniConf.ReadStr('ServiceLess', 'EnviarContingencias') = 'N') and
     (IniConf.ReadStr('ServiceLess', 'NFCeOffline') <> 'S') then
    Application.Terminate
  else
  begin
    TimerCkeck.Interval := MilisecondsCeck;

    LogApp.LogR('HWNFCeServiceLess_Status',
      Format('Contingencias=%s SincNFCeOffline=%s Empresa=%d Caixa=%d Intervalo=%s',
             [IfThen(IniConf.ReadStr('ServiceLess', 'EnviarContingencias') <> 'N', 'Sim', 'Nao'),
              IfThen(IniConf.ReadStr('ServiceLess', 'NFCeOffline') = 'S', 'Sim', 'Nao'),
              CodigoEmpresa, caixaId, Trunc(MilisecondsCeck / (60 * 1000)).ToString() + 'min']));


    if (IniConf.ReadStr('ServiceLess', 'EnviarContingencias') <> 'N') then
      EnviarContingencias();

    if (IniConf.ReadStr('ServiceLess', 'NFCeOffline') = 'S') then
      SincronizarCloud();
  end;

  TrimAppMemorySize;
end;

procedure TfrmNFCServiceLess.TimerCkeckUrgencyTimer(Sender: TObject);
begin
  if TimerClose.Enabled then
    Exit;

  if (IniConf.ReadStr('ServiceLess', 'EnviarContingencias') = 'N') and
     (IniConf.ReadStr('ServiceLess', 'NFCeOffline') <> 'S') then
  begin
    Application.Terminate;
    Exit;
  end
  else if (IniConf.ReadStr('ServiceLess', 'NFCeOffline') <> 'S') then
    Exit;

  try
    var fileName := ExtractFilePath(Application.ExeName) + 'NFCeOffline_runsinc.now';
    var count := 0;

    if FileExists(fileName) then
    begin
      DeleteFile(fileName);

      while FileExists(fileName) do
      begin
        DeleteFile(fileName);

        count := count + 1;

        if not FileExists(fileName) then
          Break
        else
        begin
          if count >= 5 then
            Exit
          else
            Sleep(100);
        end;
      end;

      SincronizarCloud(True);

    end;

  except on E: Exception do
    begin
      LogApp.Log('NFCeOffline_runsinc.now.log', e.Message, True, True);
    end;
  end;
end;

procedure TfrmNFCServiceLess.TimerCloseTimer(Sender: TObject);
begin
  if TimerCkeck.Enabled then
    Exit;

  //KillProcess(Application.Handle);
  CreateProcessSimple(
    Format('%s%s killtask handle=%s',
          [ExtractFilePath(Application.ExeName), 'HWNFCServiceLess.exe', cardinal(Application.Handle).ToString()]));

//  Halt(0);
end;

procedure TfrmNFCServiceLess.TimerOneInstanceTimer(Sender: TObject);
begin

  if not TimerOneInstance.Enabled then
    Exit;

  if not OneInstance.Valid(MutexId, MutexString) then
  begin
    LogApp.Log('HWNFCeServiceLess_Status', '(TimerOneInstanceTimer) if not OneInstance.Create(MutexId, MutexString) then - ' + sLineBreak +
                                           'Id: ' + MutexId + sLineBreak +
                                           'Name: ' + MutexString);
  end;
end;

procedure TfrmNFCServiceLess.TrimAppMemorySize;
var
  MainHandle : THandle;
begin
  //LIBERA MEMORIA NAO UTILIZADA, SEMELHANTE AO GARBAGE COLECTOR
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, False, GetCurrentProcessID) ;
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
    CloseHandle(MainHandle) ;

    if IniConf.ReadStr('TrimAppMemorySize', 'Log', 'N') = 'S' then
      LogApp.Log('TrimAppMemorySize', 'Rodando', True, True);
  except on E: Exception do
    begin
     if IniConf.ReadStr('TrimAppMemorySize', 'Log', 'N') = 'S' then
        LogApp.Log('TrimAppMemorySizeErro', E.Message);
    end;
  end;
  Application.ProcessMessages;
end;

procedure TfrmNFCServiceLess.VisualizarLogdeSincronizaoNFCe1Click(
  Sender: TObject);
begin
  CreateProcessSimple(
    Format('%s%s LESS LOGSINCNFCE host=client cnpj=%s empresaId=%s caixaId=%s',
          [ExtractFilePath(Application.ExeName), 'HWNFCServiceLess.exe',
           ParamApp.Value('cnpj'), ParamApp.Value('empresaId'), ParamApp.Value('caixaId')]));
end;

//  cloud_view_log(WideString(Format(';empresaId=%d;caixaId=%d',
//    [CodigoEmpresa, caixaId])));



{ OneInstance }

class function OneInstance.Create(id, name: string):  Boolean;
var
  con: TConSqlite;
begin

  if id.Trim.IsEmpty or name.Trim.IsEmpty then
    raise Exception.Create('(OneInstance.Create) Id or Name empty');

  con := TConSqlite.Create('oneinstance');
  try
    con.query.Close;
    con.query.SQL.Text :=  'select handleid from connections where runingat < datetime(''now'', ''-15 minutes'')';
    con.query.Open;

    while not con.query.Eof do
    begin
      var ihndl := Cardinal(con.query.FieldByName('handleid').AsInteger);
      KillProcess(ihndl);

      con.query.Next;
    end;

    con.query.Close;
    con.query.SQL.Text := 'delete from connections where runingat < datetime(''now'', ''-15 minutes'')';
    con.query.ExecSQL();

    con.query.Close;
    con.query.SQL.Text := Format('select name from connections where name = %s and id <> %s',
                                 [name.QuotedString, id.QuotedString]);
    con.query.Open;

    if con.query.FieldByName('name').AsString.Trim.Equals(name.Trim) then
      Exit(False);

    con.query.Close;
    con.query.SQL.Text := Format('select name from connections where name = %s and id = %s',
                                 [name.QuotedString, id.QuotedString]);
    con.query.Open;

    if con.query.IsEmpty then
    begin
      con.query.Close;
      con.query.SQL.Text := Format('insert into connections (id, name, handleid) values (%s, %s, %s)',
                                  [id.QuotedString, name.QuotedString, cardinal(Application.Handle).ToString()]);
      con.query.ExecSQL;
    end
    else
    begin
      con.query.Close;
      con.query.SQL.Text := Format('update connections set runingat = datetime(''now'') where id = %s and name = %s',
                                   [id.QuotedString, name.QuotedString]);
      con.query.ExecSQL;
    end;

    Result := True;

  finally
    con.Free;
  end;
end;

class function OneInstance.Valid(id, name: string;
  update: Boolean): Boolean;
var
  con: TConSqlite;
begin

  if id.Trim.IsEmpty or name.Trim.IsEmpty then
    raise Exception.Create('(OneInstance.Create) Id or Name empty');

  con := TConSqlite.Create('oneinstance');
  try
    con.query.Close;
    con.query.SQL.Text := Format('select name from connections where name = %s and id <> %s and runingat > datetime(''now'', ''-15 minutes'')',
                                 [name.QuotedString, id.QuotedString]);
    con.query.Open;

    if con.query.FieldByName('name').AsString.Trim.Equals(name.Trim) then
      Exit(False);

    con.query.Close;
    con.query.SQL.Text :=  'select handleid from connections where runingat < datetime(''now'', ''-15 minutes'')';
    con.query.Open;

    while not con.query.Eof do
    begin
      var ihndl := Cardinal(con.query.FieldByName('handleid').AsInteger);
      KillProcess(ihndl);

      con.query.Next;
    end;

    con.query.Close;
    con.query.SQL.Text :=  Format('delete from connections where runingat < datetime(''now'', ''-15 minutes'')',
                                  [name.QuotedString, id.QuotedString]);
    con.query.ExecSQL();

    con.query.Close;
    con.query.SQL.Text := Format('select name from connections where id = %s and name = %s',
                                 [id.QuotedString, name.QuotedString]);
    con.query.Open;

    if con.query.IsEmpty then
      Exit(False);

    if update then
    begin
      con.query.Close;
      con.query.SQL.Text := Format('update connections set runingat = datetime(''now'') where id = %s and name = %s',
                                   [id.QuotedString, name.QuotedString]);
      con.query.ExecSQL;
    end;

    Result := True;

  finally
    con.Free;
  end;
end;

{ TConSqlite }

constructor TConSqlite.Create(dbName: string);
var
  lfile: TextFile;
begin
  con := TSQLConnection.Create(nil);
  query := TSQLQuery.Create(nil);

  con.DriverName := 'Sqlite';
  con.Params.Values['Database'] := ExtractFilePath(Application.ExeName) + '\' + dbName + '.db';
  con.Params.Values['DriverUnit'] := 'Data.DbxSqlite';
  con.Params.Values['DriverPackageLoader'] := 'TDBXSqliteDriverLoader,DBXSqliteDriver260.bpl';
  con.Params.Values['MetaDataPackageLoader'] := 'TDBXSqliteMetaDataCommandFactory,DbxSqliteDriver260.bpl';
  con.Params.Values['FailIfMissing'] := 'True';

  Fquery.SQLConnection := con;

  if not FileExists(con.Params.Values['Database']) then
  begin
    AssignFile(lfile, con.Params.Values['Database']);
    try
      Rewrite(lfile);
    finally
      CloseFile(lfile);
    end;

    con.Connected := True;
    con.ExecuteDirect('CREATE TABLE connections (' +
                      ' id        STRING (36) PRIMARY KEY' +
                      ' NOT NULL,' +
                      ' name STRING      NOT NULL,' +
                      ' runingat  DATETIME    DEFAULT (CURRENT_TIMESTAMP),' +
                      ' handleid BIGINT' +
                      ' )');
    con.ExecuteDirect('CREATE INDEX name_idx ON connections ( name )');

  end
  else
    con.Connected := True;
end;

destructor TConSqlite.Destroy;
begin
  if Fquery.Active then
    Fquery.Close;

  if con.Connected then
    con.Connected := False;


  query.Free;
  con.Free;

  inherited;
end;

end.
