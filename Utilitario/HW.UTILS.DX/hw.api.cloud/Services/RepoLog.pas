unit RepoLog;

interface

uses
  GenericDataEtd,
  uClasseConexao,
  System.SysUtils,
  System.Classes;

type
  LogDirection = (ldServerClient, ldClientServer);
  LogLevel = (llError, llWarning, llInfo);


  TRepoLog = class
  strict private
    con: TConexao;
    function Log(level: LogLevel; direction: LogDirection; text: string; keys: TKeyWords; generic: TGenericRecord; gList: TGenericListRecord; logId: string = ''): string;
  private
    FcaixaId: Integer;
    FCnpj: string;
    FOnError: TNotifyEvent;

  public
    constructor Create(caixaId: Integer; cnpj: string);
    destructor Destroy; override;

    function Info(direction: LogDirection; text: string): string; overload;
    function Info(direction: LogDirection; text: string; keys: TKeyWords; generic: TGenericRecord; logId: string = ''): string; overload;
    function Info(direction: LogDirection; text: string; keys: TKeyWords; generic: TGenericListRecord; logId: string = ''): string; overload;
    function Error(direction: LogDirection; text: string; logId: string = ''): string;
    procedure CheckAndClearLogData;

    property OnError: TNotifyEvent read FOnError write FOnError;
  end;

implementation

uses
  System.DateUtils,
  HW.Json,
  Variants,
  hw_utils,
  hw_win_utils,
  logmessage_class,
  logmessage_table_class,
  logmessage_values_class;

{ TRepoLog }

procedure TRepoLog.CheckAndClearLogData;
begin
//  var data := VarToStr(RegistroWin.Read(Self.ClassName, 'LastClearLog', ''));
  var lastChek := VarToStr(RegistroWin.Read(Self.ClassName, 'LastClearLog', ''));

//  var lastChek := FormatDateTime('yyyy-MM-dd', Date - 1);

//  if not data.IsEmpty then
//    lastChek := StrToDateDef(data, lastChek, fs);

  if lastChek >= FormatDateTime('yyyy-MM-dd', Date) then
    Exit;

    try
      if not con.Banco.Connected then
      begin
        var err := '';
        if not con.ConfigureStr(';loggeral=N').conectar(IniConf.ReadStr('Banco', 'LogNFCeOff'), '', '', err) then
          Exit;
      end;

      try

        con.SqlExec('delete from LOGMESSAGE where CREATEDAT <= ''%s 23:59:59'' and CNPJ >= ''''', [date_fb(Date - 7, False)]);

        RegistroWin.Write(Self.ClassName, 'LastClearLog', FormatDateTime('yyyy-MM-dd', Date));

      except on E: Exception do
        begin
          LogApp.Log('LogNFCeOff', 'TRepoLog.CheckAndClearLogData Erro: ' + e.Message);
        end;
      end;

    finally
      if con.Transacao.InTransaction then
        con.Transacao.Commit;
    end;
end;

constructor TRepoLog.Create(caixaId: Integer; cnpj: string);
begin
  FcaixaId := caixaId;
  FCnpj := cnpj;
  con := TConexao.Create();
end;

function TRepoLog.Info(direction: LogDirection; text: string;
  keys: TKeyWords; generic: TGenericRecord; logId: string): string;
begin
  Result := Log(llInfo, direction, text, keys, generic, nil, logId);
//
//  TThread.CreateAnonymousThread(
//  procedure
//  begin
//    var con := TConexao.Create();
//    try
//      var err := '';
//      if not con.conectar(IniConf.ReadStr('Banco', 'LogNFCeOff'), '', '', err) then
//        Exit;
//
//      try
//
//        var log := TLogmessage_class.Create;
//        log.id := TGUID.NewGuid.ToString();
//        log.cnpj := Fcnpj;
//        log.direction := Ord(direction);
//        log.level_ := Ord(llInfo);
//        log.source := 'Terminal ' + FcaixaId.ToString();
//        log.text.Text := text;
//
//        con.SqlExec(log.SQLMotor().SQLInsert);
//
//        if Assigned(generic) and Assigned(generic.registry)then
//        begin
//          var logT := Tlogmessage_table_class.Create;
//          logT.log_id := log.id;
//          logT.tabela := generic.table.ToUpper();
//          if Assigned(keys) then
//            logT.keys := TJsonHw.ToJsonString(keys);
//          logT.campos.Text := generic.fields;
//
//          var logV := TLogmessage_values_class.Create;
//          logV.log_id := log.id;
//          logV.seq := 0;
//          logV.data.Text := generic.registry.data;
//
//          con.SqlExec(logT.SQLMotor().SQLInsert);
//          con.SqlExec(logV.SQLMotor().SQLInsert);
//        end;
//
//      except on E: Exception do
//        begin
//          LogApp.Log('LogNFCeOff', 'TRepoLog.Info Erro: ' + e.Message);
//        end;
//      end;
//
//    finally
//      if con.Transacao.InTransaction then
//        con.Transacao.Commit;
//      con.desconectar;
//      con.Free;
//    end;
//
//
//  end).Start();

end;

destructor TRepoLog.Destroy;
begin
  if Assigned(con) then
  begin
    con.desconectar;
    if con.Banco.Connected then
      con.Banco.ForceClose;
    FreeAndNil(con);
  end;

  inherited;
end;

function TRepoLog.Error(direction: LogDirection; text, logId: string): string;
begin
  Result := Log(llError, direction, text, nil, nil, nil, logId);
  if Assigned(FOnError) then
    FOnError(Self);
end;

function TRepoLog.Info(direction: LogDirection; text: string): string;
begin
  Result := Log(llInfo, direction, text, nil, nil, nil);
end;

function TRepoLog.Info(direction: LogDirection; text: string;
  keys: TKeyWords; generic: TGenericListRecord; logId: string): string;
begin
  Result := Log(llInfo, direction, text, keys, nil, generic, logId);
end;

function TRepoLog.Log(level: LogLevel; direction: LogDirection;
  text: string; keys: TKeyWords; generic: TGenericRecord;
  gList: TGenericListRecord; logId: string): string;
var
  guid: string;
begin
  guid := TGUID.NewGuid.ToString().ToLower().Replace('{', '').Replace('}', '');
  Result := guid;

//  TThread.CreateAnonymousThread(
//  procedure
//  begin
    //var con := TConexao.Create();
    try
      if not con.Banco.Connected then
      begin
        var err := '';
        if not con.ConfigureStr(';loggeral=N').conectar(IniConf.ReadStr('Banco', 'LogNFCeOff'), '', '', err) then
          Exit;
      end;

      try

        var log := TLogmessage_class.Create;
        log.id := guid;
        log.cnpj := Fcnpj;
        log.direction := Ord(direction);
        log.level_ := Ord(level);
        log.source := 'Terminal ' + FcaixaId.ToString().PadLeft(3, '0');
        log.text.Text := text;
        log.log_id := logId;

        con.SqlExec(log.SQLMotor().SQLInsert);

        if Assigned(generic) and Assigned(generic.registry) then// and (not generic.table.Trim.IsEmpty) then
        begin
          var logT := Tlogmessage_table_class.Create;
          logT.log_id := log.id;
          logT.tabela := generic.table.ToUpper();
          if Assigned(keys) then
            logT.keys := TJsonHw.ToJsonString(keys);
          logT.campos.Text := generic.fields;

          var logV := TLogmessage_values_class.Create;
          logV.log_id := log.id;
          logV.seq := 0;
          logV.data.Text := generic.registry.data;

          con.SqlExec(logT.SQLMotor().SQLInsert);
          con.SqlExec(logV.SQLMotor().SQLInsert);
        end;

        if Assigned(gList) and (not gList.table.Trim.IsEmpty) and Assigned(gList.list) then//and (Length(gList.list) > 0) then
        begin
          var gLogT := Tlogmessage_table_class.Create;
          gLogT.log_id := log.id;
          gLogT.tabela := gList.table.ToUpper();
          if Assigned(keys) then
            gLogT.keys := TJsonHw.ToJsonString(keys);
          gLogT.campos.Text := gList.fields;
          con.SqlExec(gLogT.SQLMotor().SQLInsert);

          var gLogV := TLogmessage_values_class.Create;

          for var I := Low(gList.list) to High(gList.list) do
          begin
            gLogV := TLogmessage_values_class.Create;
            gLogV.log_id := log.id;
            gLogV.seq := I;
            gLogV.data.Text := gList.list[I].data;

            con.SqlExec(gLogV.SQLMotor().SQLInsert);
          end
        end;

      except on E: Exception do
        begin
          LogApp.Log('LogNFCeOff', 'TRepoLog.Log Erro: ' + e.Message);
        end;
      end;

    finally
      if con.Transacao.InTransaction then
        con.Transacao.Commit;
//      con.desconectar;
//      con.Free;
    end;


//  end).Start();
end;

end.
