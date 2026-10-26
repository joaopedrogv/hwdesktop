unit RepoHw;

interface

uses
  // BaseApiRes,
  RestApiBaseRes,
  HW.Servicos,
  ApiCloud,
  RepoLog,
  GenericDataEtd,
  UserCredentialsEtd,
  ErrorApiRes,
  uClasseConexao,
  System.SysUtils,
  System.Generics.Collections,
  SchemaEtd,
  NFCeEtd,
  NFCeDataEtd,
  TableFieldsEtd,
  PropostaEtd,
  DeletedEtd,
  CaixaEtd,
  System.Classes;

const
  CLOUD_URL_API_PROD   = 'hwcloud.homelinux.com:911/sincnfce/api';
  CLOUD_URL_API_HOM    = 'localhost:5000/api';
  CLOUD_SERV_TOKEN_API = 'cloudhw_access_token_';

type
  TPrivilegesRules  = (prSelect, prInsert, prUpdate, prDelete, prRelation, prExecute);
  TClientServerSide = (clientSide, serverSide);

  TRepoHw = class(THwServicos)
  strict private
    dbSysdba  : TConexao;
    dados     : TConexao_OOP;
    paramsRepo: TStrings;
    procedure CheckPrivileges(table: string); overload;
    procedure HandleError(
      const location: string;
      const E       : ExceptionApp); overload;
    procedure HandleError(
      const location: string;
      const E       : Exception); overload;
    procedure HandleLog(text: string); overload;
    procedure HandleLog(text: string; const args: array of const); overload;
    function ClientErrorResolve(error: string; data: TGenericData; index: Integer; fields: TArray<TTableFields>): TClientError;
  private
    FrepoLog: TRepoLog;
    FclientError: TClientError;
  public
//    constructor Create(
//      banco     : string;
//      empresaId : Integer;
//      silentMode: Boolean); overload;

    constructor Create(paramsList: string);
    destructor Destroy; override;
                                                  
    procedure HandlePermision(msg: string);
    function CheckSchema(schema: TArray< TSchema >): Boolean;

    procedure CheckPrivileges(); overload;
    procedure SetDateOnline(caixaId: Integer);
    procedure SetDateError(caixaId: Integer);
    function GetUrlApi(): string;
    function GetLastSincIdTable(tabela: string; side: TClientServerSide): Integer; overload;
    function GetLastSincIdTable(tabela: string; date: TDateTime): Integer; overload;
    function GetLastSincIdDeletedTables(side: TClientServerSide): Integer;
    function GetUserCredentials(caixa: Integer): TUserCredentials;
    function GetToken(): TToken;
    function GetNFCeData(nfceId: Integer; keys: TKeyWords): TNFCeData;
    function GetGenericData(tabela: string; caixaId, seqid, skip: Integer; keys: TKeyWords): TGenericData;
    function GetNFCeList(caixaId, seqid, skip: Integer): TArray<TNFCe>;
    function UpdateSeqIdGenericData(tabela: string; seqid: Integer; side: TClientServerSide): TGenericData;

    function PostCaixa(payload: TCaixa): Boolean;
    function PostGenericData2(data: TGenericData): Boolean;
    function PostToken(token: TToken): Boolean;
    function PostNFCeBkp(nfce: TNFCeData): Boolean;
    function PostNFCe(id: Integer; nfce: TNFCe; nfceData: TNFCeData): Boolean;
    function PostPedVenda(pedvendas: TArray<TProposta>): Boolean;

    function GetDeleted(seqid, skip: Integer): TArray<TDeleted>;
    function PostDeleted(payload: TArray<TDeleted>): Integer;

    property repoLog: TRepoLog read FrepoLog write FrepoLog;
    property clientError: TClientError read FclientError write FclientError;
  end;

implementation

uses
  System.StrUtils,
  REST.Json,
  HW.Json,
  HW.Utils.Classes.Registros_DX,
  config_sistema_class,
  sincoff_schema_class,
  hw_utils,
  hw_win_utils,
  HW.Convert,
  System.Variants,
  ConstsBase;

{ TRepoHw }

// procedure TRepoHw.ConsultaDiaria;
// var
// momentoDeConsulta: Boolean;
// begin
// if not conectar(DataBasePath, True)  then
// Exit;
//
// try
// if (not GetUrlApi) then// obtem hora do servidor no metodo GetCNPJ
// Exit;
//
// DataSearch := GetDataSearch(ServiceID);
//
// try
// momentoDeConsulta := ((DataHoraAtual - DataSearch.DataConsulta) >= 1) or // maior que 1 dia consultar
// (((DataHoraAtual - DataSearch.DataConsulta) > EncodeTime(0,30,0,0)) and (DataSearch.Status.Equals(HW_STS_CONSULTANDO))); // no intervalo de 30 minutos 1 maquina consultou e nao concluiu a consulta
//
// if not momentoDeConsulta then
// Exit;
//
// Consultar(DataSearch);
//
// finally
// if Assigned(DataSearch) then
// FreeAndNil(DataSearch);
// end;
//
// finally
// desconectar;
// end;
// end;

procedure TRepoHw.CheckPrivileges(table: string);
begin
  try
    if MatchText(table, TABS_BIDIRECIONAIS) or
       MatchText(table, TABS_NFCE) or
       MatchText(table, TABS_INTERNALS) or
       MatchText(table, OBJETOS_INTERNOS) then
      Exit;

    var err := '';
    if not dbSysdba.Banco.Connected then
      if not dbSysdba.conectar(err) then
      //if not dbSysdba.conectar(Self.DataBasePath, False) then
        raise Exception.Create('Erro ao conectar ao banco de dados para checagem de previlégios ' + err);

    dbSysdba.SqlExec('EXECUTE PROCEDURE SPDB_CHECK_PRIVILEGES(''REPL'', ''%s'')', [table]).Transaction.Commit();
  except
    on E: Exception do
      raise ExceptionApp.Create('Por favor contacte o suporte técnico. ' + e.Message, 'TRepoHw.CheckPrivileges');
  end;
end;

function TRepoHw.CheckSchema(schema: TArray<TSchema>): Boolean;
const D = 'TRepoHw.CheckSchema';
begin
  try

    //talvez otimizar a checagem do schema procurando no banco e nas tabelas internas se está de acordo, só ai se nao tiver checar as permissões
    // e no handle exception tambem poderia ver as permissoes

    var tabsapi := NewStringList();

    // lista de tabelas da api
    for var item in schema do
      tabsapi.Add(item.table);

    // lista de tabelas do banco
    var tabsdb := NewStringList();
    dados.ClientOpen('select s.tabela, s.empresas_id, e.empresa_id from SINCOFF_SCHEMA s' +
                     ' inner join SINCOFF_SCHEMA_EMP e on e.tabela = s.tabela and e.empresa_id = %d' +
                     ' where s.ativo = 1 and s.tabela not in (''NFC_EMISSOR'')', [CodEmpresa]);
    dados.first;
    while not dados.Eof do
    begin
      tabsdb.Add(dados.fstr('tabela'));

      dados.Next;
    end;

    // identificando tabelas da api que nao estao no banco
    for var tab in tabsdb do
      if tabsapi.IndexOf(tab) >= 0 then
        tabsapi.Delete(tabsapi.IndexOf(tab));

    // identificando tabelas do banco que nao estao na api
    for var item in schema do
      if tabsdb.IndexOf(item.table) >= 0 then
        tabsdb.Delete(tabsdb.IndexOf(item.table));

    // schema OK, tudo igual
    if (tabsdb.Count = 0) and (tabsapi.Count = 0) then
      Exit;

    for var item in schema do
      CheckPrivileges(item.table);

    HandleLog('Atualizando Schema e dependencias');
    repoLog.Info(ldServerClient, 'Atualizando Schema e dependencias');
    var confValue := SqlScalar('select value1_f from config_sistema where chave = ''sincoff_fill_schema_auto'' and cod_empresa = 0').AsInteger;
    try
      dbSysdba.SqlExec('update config_sistema set value1_f = 0 where chave = ''sincoff_fill_schema_auto'' and cod_empresa = 0').Transaction.Commit;
      dbSysdba.SqlExec('update SINCOFF_SCHEMA set ativo = 0');

      for var item in schema do
      begin
        if item.table.ToUpper().Trim().Equals('EMPRESA') and item.fields.Trim().IsEmpty() then
          item.fields := CAMPOS_EMPRESA;

        dbSysdba.iSQL.Close;
        dbSysdba.iSQL.SQL.Text := Format('update or insert into SINCOFF_SCHEMA (tabela, empresas_id, campos, ativo) values (''%s'', ''%d'', :campos, 1) matching (tabela)', [item.table, CodEmpresa]);
        dbSysdba.iSQL.Params[0].AsString := item.fields;
        dbSysdba.iSQL.ExecQuery;
//        dbSysdba.SqlExec('update or insert into SINCOFF_SCHEMA (tabela, empresas_id, ativo) values (''%s'', ''%d'', 1) matching (tabela)', [item.table, CodEmpresa]);
      end;

      dbSysdba.SqlExec('execute procedure spso_fill_schema(1)');
      dbSysdba.SqlExec('update config_sistema set value1_f = %d where chave = ''sincoff_fill_schema_auto'' and cod_empresa = 0', [confValue])
        .Transaction.Commit;

    except on E: Exception do
      begin
        dbSysdba.Transacao.Rollback;

        HandleError(D, E);
      end;
    end;

  except
    on E: ExceptionApp do
      HandleError(D, E);

    on E: Exception do
      HandleError(D, E);
  end;
end;

function TRepoHw.ClientErrorResolve(error: string;
  data: TGenericData;
  index: Integer;
  fields: TArray<TTableFields>): TClientError;
const msg = 'VIOLATION OF FOREIGN KEY CONSTRAINT';
begin

  clientError.errors := clientError.errors + [error];

   if (not error.ToUpper().Contains(msg)) or (not error.ToUpper().Contains(' ON TABLE ')) then
     Exit;

   error := error.ToUpper();
   while (error.Contains(msg + ' ""')) do
     error := error.Replace(msg + ' ""', string.Empty);

   var starts := error.IndexOf(msg) + Length(msg);
   var ends := error.IndexOf(' ON TABLE ');

   if (starts >= ends) or (starts <= 0) then
     Exit;

   var constraint := error.Substring(starts, (ends - starts)).Replace(msg,'').Replace('"', '').Trim();
   var str := Format('%s" ON TABLE "%s"', [constraint, data.table.ToUpper()]);

   if not error.Contains(str) then
     Exit;

   dbSysdba.ClientOOP('select a.fk_name, a.table_ref, a.fieldname,' +
                      ' (select fieldname from spdb_fields_pk(a.table_ref) b' +
                      ' where b.index_pos = a.index_pos) field_ref' +
                      ' from spdb_fields_fk(''%s'') A' +
                      ' where fk_name = ''%s''',
                      [data.table, constraint]).First;

   var idxField := 0;
   var sFields := '';
   var sValues := '';

   var list := NewStringList(data.fields.ToUpper(), ',');
   var values := NewArrayString(data.list[index].data, data.keys.separator, False);
   var registry := TGenericRecord.Create;

//
   while not dbSysdba.Client.Eof do
   begin
//     for var f in fields d
//       if f.name.Equals(dbSysdba.Client.fstr('fieldname')) then
//       begin
//         idxField := list.IndexOf(f.name);
     idxField := list.IndexOf(dbSysdba.Client.fstr('fieldname'));

     if idxField = -1 then
       Exit;

     sFields := sFields + IfThen(sFields <> '', ',') + dbSysdba.Client.fstr('field_ref');
     sValues := sValues + IfThen(sValues <> '', data.keys.separator) + values[idxField];
//       end;

     dbSysdba.Client.Next();
   end;

   registry.table := dbSysdba.Client.fstr('table_ref');
   registry.fields := sFields;
   registry.registry := TRawData.Create(sValues);
   FclientError.dataHandle := FclientError.dataHandle + [registry];

// var msg = "VIOLATION OF FOREIGN KEY CONSTRAINT";

      // //if (!text.ToUpper().Contains("VIOLATION OF FOREIGN KEY CONSTRAINT"))
      // if (!text.ToUpper().Contains(msg) || !text.ToUpper().Contains(" ON TABLE "))
      //   return;

      // var emptyMsg = "VIOLATION OF FOREIGN KEY CONSTRAINT \"\"";

      // text = text.ToUpper();
      // while (text.Contains(emptyMsg))
      //   text = text.Replace(emptyMsg, string.Empty);
      // // while (text.Contains("VIOLATION OF FOREIGN KEY CONSTRAINT \"\""))
      // //   text = text.Replace("VIOLATION OF FOREIGN KEY CONSTRAINT \"\"", "");

      // var starts = text.IndexOf(msg);
      // var ends = text.IndexOf(" ON TABLE ");

      // if (ends >= starts || starts <= 0)
      //   return;


      // var constraint = text.Substring(starts, ends).Replace(msg,"").Replace("\"", "");
      // // var tb = table
      // if (!text.Contains($@"{constraint}\"" ON TABLE \""{table}\"""))
      //   return;

      // var generic = new Generic() {
      //   fields
      // }

      // var dataSchema = await ExtractDataSchema(generic, false);

      // var dataSQL = ExtractDataSQL(dataSchema, generic.keys, item, empresaId, null, omitFields);

      //violation of FOREIGN KEY constraint "".
      //violation of FOREIGN KEY constraint "FK_SENHAS_ERP_ERP" on table "SENHAS_ERP".
      //Foreign key reference target does not exist.

end;

constructor TRepoHw.Create(paramsList: string);
begin
  var splitStr := Copy(paramsList, 1, 1);
  if OnlyNumberAndLetters(splitStr, '') = splitStr then
    raise Exception.Create('TUseCaseBase.Create. Primeiro caracter do paramsList deve ser o split para a string de parametros');

  paramsRepo := NewStringList(Copy(paramsList, 2, Length(paramsList)), splitStr);

  inherited Create(StrToBoolDef(paramsRepo.Values['silent'], False));

  CodEmpresa                  := StrToInt(paramsRepo.Values['empresaId']);
  DataBasePath                := paramsRepo.Values['databaseName'];
  dados                       := NewClientOOP(Transacao);
  dbSysdba                    := TConexao.Create();
  //dbSysdba.confiBanco.Params.Values['lc_ctype'] := paramsRepo.Values['charSet'];// 'ISO8859_1';
  dados.DataSet.PacketRecords := 50;
  Self.ConfigureStr(paramsList);
  dbSysdba.ConfigureStr(paramsList);
  FclientError := TClientError.Create;
end;

{constructor TRepoHw.Create(
  banco     : string;
  empresaId : Integer;
  silentMode: Boolean);
begin
  inherited Create(silentMode);
  CodEmpresa   := empresaId;
  DataBasePath := banco;
  dbSysdba     := TConexao.Create();
  dbSysdba.Banco.Params.Values['lc_ctype'] := 'ISO8859_1';
  dados        := NewClientOOP(Transacao);
  dados.DataSet.PacketRecords := 50;
end;       }

function TRepoHw.GetUrlApi: string;
begin
  Result := '';

  var Conf := TConfig_sistema_class.getConf('hw_cloud_api', QrAux, CodEmpresa);
  try
    UrlApi := Conf.value1_vc;
    if UrlApi.Trim.IsEmpty then
      UrlApi := IfThen(DevelopmentMode, CLOUD_URL_API_HOM, CLOUD_URL_API_PROD);

  finally
    Conf.Free;
  end;

  Result := UrlApi.Trim;


    // if Result then
    // FToken := THwClassRegistros.FromJsonString< TToken >(GetJson(CLOUD_SERV_TOKEN_API))
    // else if not Result then
    // if not SilentMod then
    // ShowErro('Não foi possivel obter a Url da API no banco de dados')
    // else
    // LogError('Url não encontrada no banco empresa %d "hw_cloud_api"', [CodEmpresa]);


end;

function TRepoHw.GetUserCredentials(caixa: Integer): TUserCredentials;
const D = 'TRepoHw.GetUserCredentials';
begin
  try
    Result := Converter.NewObj< TUserCredentials >(
      SqlOpen('select c.cod_empresa empresaid, e.cgc_emp cnpj, c.refresh_token code,' +
      ' c.cod_emissor caixaid from nfc_emissor c' +
      ' inner join empresa e on e.cod_empresa = c.cod_empresa' +
      ' where c.cod_emissor = %d  and c.cod_empresa = %d',
      [caixa, CodEmpresa]));
  except
    on E: ExceptionApp do
      HandleError(D, E);

    on E: Exception do
      HandleError(D, E);
  end;
end;

procedure TRepoHw.HandleError(const location: string; const E: Exception);
begin
  HandlePermision(E.Message);
  LogApp.Error('%s / %s', [location, E.Message]);
  HandleLog('Error-> %s / %s', [location, e.Message]);
end;

procedure TRepoHw.HandleLog(text: string; const args: array of const);
begin
  HandleLog(Format(text, args));
end;

procedure TRepoHw.HandlePermision(msg: string);
begin
  var messages := NewStringList('no permission for execute access to,' +
                                'no permission for read/select access to,' +
                                'no permission for insert/write access to', ',');
  var exists := false;
  for var m in messages do
  begin
    if msg.StartsWith(m) then
    begin
      exists := True;
      Break;
    end;
  end;

  if not exists then
    Exit;

  var firstError := NewStringList(msg)[0];

  msg := firstError;
  for var m in messages do
    msg := msg.Replace(m, '').Trim();

  if (msg.StartsWith('PROCEDURE')) then
    msg := msg.Replace('PROCEDURE', '').Trim();

  if (msg.StartsWith('TABLE')) then
    msg := msg.Replace('TABLE', '').Trim();

  if (msg.StartsWith('VIEW')) then
    msg := msg.Replace('VIEW', '').Trim();

  try
    if MatchText(msg, TABS_BIDIRECIONAIS) or
       MatchText(msg, TABS_NFCE) or
       MatchText(msg, TABS_INTERNALS) or
       MatchText(msg, OBJETOS_INTERNOS) then
    begin
      CheckPrivileges();
//      var tab := '';
//      for tab in TABS_INTERNALS do
//        dbSysdba.SqlExec('EXECUTE PROCEDURE SPDB_CHECK_PRIVILEGES(''REPL'', ''%s'')', [tab]).Transaction.Commit;
//      for tab in OBJETOS_INTERNOS do
//        dbSysdba.SqlExec('EXECUTE PROCEDURE SPDB_CHECK_PRIVILEGES(''REPL'', ''%s'')', [tab]).Transaction.Commit;
    end
    else
      dbSysdba.SqlExec('EXECUTE PROCEDURE SPDB_CHECK_PRIVILEGES(''REPL'', ''%s'')', [msg]).Transaction.Commit;
  except on E: Exception do
  end;
end;

procedure TRepoHw.HandleLog(text: string);
begin
  if Assigned(OnLog) then
    OnLog(Format('[%s]', [Self.ClassName]) + text);
end;

procedure TRepoHw.HandleError(const location: string;
  const E: ExceptionApp);
begin
  HandlePermision(E.Message);
  LogApp.Error('%s / %s - %s', [location, E.detail, E.Message]);
  HandleLog('Error-> %s / %s - %s', [location, e.detail, e.Message]);
end;

procedure TRepoHw.CheckPrivileges();
begin
  try
    var err := '';
    if not dbSysdba.Banco.Connected then
      //if not dbSysdba.conectar(Self.DataBasePath, False) then
      if not dbSysdba.conectar(err) then
        raise Exception.Create('Erro ao conectar ao banco de dados para checagem de previlégios ' + err);

    for var table in TABS_INTERNALS do
      dbSysdba.SqlExec('EXECUTE PROCEDURE SPDB_CHECK_PRIVILEGES(''REPL'', ''%s'')', [table]).Transaction.Commit();

    for var table in TABS_NFCE do
      dbSysdba.SqlExec('EXECUTE PROCEDURE SPDB_CHECK_PRIVILEGES(''REPL'', ''%s'')', [table]).Transaction.Commit();

    for var table in TABS_BIDIRECIONAIS do
      dbSysdba.SqlExec('EXECUTE PROCEDURE SPDB_CHECK_PRIVILEGES(''REPL'', ''%s'')', [table]).Transaction.Commit();

    for var table in OBJETOS_INTERNOS do
      dbSysdba.SqlExec('EXECUTE PROCEDURE SPDB_CHECK_PRIVILEGES(''REPL'', ''%s'')', [table]).Transaction.Commit();

    if dbSysdba.SqlScalar('select DADOS_OFFLINE from EMPDESVOLV where COD_EMPDES = 1').AsString <> 'C' then
      raise Exception.Create('Banco de dados não é ClientServer');

  except
    on E: Exception do
      raise ExceptionApp.Create('Por favor contacte o suporte técnico. ' + e.Message, 'TRepoHw.CheckPrivileges');
  end;
end;

destructor TRepoHw.Destroy;
begin
  dbSysdba.desconectar;
  dbSysdba.Free;
  FclientError.Free;
  paramsRepo.Free;
  inherited;
end;

function TRepoHw.GetDeleted(seqid, skip: Integer): TArray<TDeleted>;
const D = 'TRepoHw.GetDeleted';
var
  deleted: TDeleted;
begin
  HandleLog('genericdata/deleted - > seqid=%d&skip=%d', [seqid, skip]);
  var limit := 50;
  var logId := '';

  try
    Result := [];

    CheckPrivileges('SINCOFF_DEL');

    logId := repoLog.Info(ldClientServer, Format('Exclusões Tabela=SINCOFF_DEL Seq=%d Skip=%d Limit=%d', [seqid, skip, limit]));
    try

      dados.ClientOpen('select first %d skip %d * from SINCOFF_DEL where ID > %d and EMPRESA_ID IN (0, %d)',
        [limit, skip, seqid, CodEmpresa]);

      if dados.Last().First().DataSet.RecordCount = 0 then
      begin
        HandleLog('genericdata/deleted-> count=0');
        Exit;
      end;

      while not dados.Eof do
      begin
        deleted := TDeleted.Create;
        deleted.id := dados.fint('id');
        deleted.empresaId := dados.fint('empresa_id');
        deleted.table := dados.fstr('tabela');
        deleted.fieldsPK := dados.fstr('campos_pk');
        deleted.valuesPK := dados.fstr('values_pk');

        Result := Result + [deleted];

        dados.next;
      end;

      repoLog.Info(ldClientServer, Format('Exclusões Tabela=SINCOFF_DEL Seq=%d Qtde=%d', [seqid, Length(Result)]));

      HandleLog('genericdata/deleted-> count=%d', [Length(Result)]);

    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      repoLog.Error(ldClientServer, Format('Exclusões Tabela=SINCOFF_DEL - Erro=%s', [E.Message]), logId);
      raise ExceptionApp.Create('%s - Exclusões Tabela=SINCOFF_DEL SeqId %d', [e.Message, seqid], D);
    end;
  end;
end;

function TRepoHw.GetGenericData(tabela: string;
  caixaId, seqid, skip: Integer;
  keys: TKeyWords): TGenericData;
const D = 'TRepoHw.GetGenericData';
begin
  HandleLog('genericdata - > table=%s&seqid=%d&skip=%d', [tabela, seqid, skip]);
  var limit := 50;
  var logId := '';

  try
    Result      := TGenericData.Create;
    Result.list := [];

    CheckPrivileges(tabela);

    logId := repoLog.Info(ldClientServer, Format('Tabela=%s Seq=%d Skip=%d Limit=%d', [tabela, seqid, skip, limit]));

    try

      SqlExec('execute procedure SPSO_GENERICDATA(''%s'', %d, %d, %d, %d, %d, ''%s'', ''%s'', ''%s'')',
              [tabela, CodEmpresa, caixaId, limit, skip, seqid, keys.separator, keys.nullValue, keys.quote]);

      dados.ClientOpen('select * from rawdata order by id');

      if dados.DataSet.RecordCount < 2 then
      begin
        HandleLog('genericdata-> count=0');
        Exit;
      end;

      Result.keys   := keys;
      Result.table  := tabela;
      Result.fields := dados.filterStr('id = 0', [Result.table]).fstr('data');
//      Result.fields := SqlScalar('select data from rawdata where id = 0').AsString;

      dados.filterStr('id > 0').First;
      while not dados.Eof do
      begin
        Result.list := Result.list + [TRawData.Create(dados.fstr('data'))];
//        Result.list := Result.list + [TRawData.Create(dados.fstr('data'))];
        dados.next;
      end;

      repoLog.Info(ldClientServer, Format('Tabela=%s Seq=%d Qtde=%d', [tabela, seqid, Length(Result.list)]), Result.keys, Result, logId);

      HandleLog('genericdata-> count=%d', [Length(Result.list)]);

    finally
      dados.filterClear;
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      repoLog.Error(ldClientServer, Format('Tabela=%s - Erro=%s', [tabela, E.Message]), logId);
      raise ExceptionApp.Create('%s - %s SeqId %d', [e.Message, tabela, seqid], D);
    end;
  end;

end;

function TRepoHw.GetLastSincIdDeletedTables(
  side: TClientServerSide): Integer;
const D = 'TRepoHw.GetLastSincIdDeletedTables';
begin
  Result := - 1;
  try
    CheckPrivileges('SINCOFF_DEL');

    Result := SqlScalar('select seqid_sincoff from SINCOFF_SERV_IDS where tabela = ''SINCOFF_DEL'' and empresa_id = %d and side = ''%s'' ',
                        [CodEmpresa, IfThen(side = clientSide, 'C', 'S')]).AsInteger;

  except
    on E: Exception do
      raise ExceptionApp.Create('%s - Tabela SINCOFF_DEL', [e.Message], D);
  end;
end;

function TRepoHw.GetLastSincIdTable(tabela: string;
  date: TDateTime): Integer;
const L = 'TRepoHw.GetLastSincIdTable';
begin
  Result := - 1;
  try
    CheckPrivileges(tabela);

    var schemaExists := SqlScalar('select count(*) from SINCOFF_SCHEMA where tabela = %s', [tabela.QuotedString]).AsInteger > 0;
    if not schemaExists then
    begin

      if not dbSysdba.Banco.Connected  then
        if not dbSysdba.conectar(Self.DataBasePath, False) then
          raise Exception.Create('Não foi possível conectar no banco para criar objetos. Contacte o suporte técnico');

      dbSysdba.SqlExec('insert into SINCOFF_SCHEMA (tabela, empresas_id) values (%s, %s)',
        [tabela.QuotedString, CodEmpresa.ToString().QuotedString]).Transaction.Commit();
    end;

    if tabela.Equals('PEDVENDA') then
      Result := SqlScalar('select max(seqid_sincoff) from pedvenda ' +
                          ' where data_fech = %s and cod_empresa = %d and tipo = ''REQ'' and seqid_sincoff > 0',
                          [date_fb(date), CodEmpresa]).AsInteger;

  except
    on E: Exception do
    begin
      repoLog.Error(ldServerClient, Format('%s - Tabela %s', [e.Message, tabela]));
      HandleError(L, E);
    end;
  end;
end;

function TRepoHw.GetLastSincIdTable(tabela: string; side: TClientServerSide): Integer;
const L = 'TRepoHw.GetLastSincIdTable';
begin
  Result := - 1;
  try
    CheckPrivileges(tabela);

    var
    schemaExists :=
      SqlScalar('select count(*) from SINCOFF_SCHEMA where tabela = %s', [tabela.QuotedString]).AsInteger > 0;
    if not schemaExists then
    begin

        if not dbSysdba.Banco.Connected  then
          if not dbSysdba.conectar(Self.DataBasePath, False) then
            raise Exception.Create('Não foi possível conectar no banco para criar objetos. Contacte o suporte técnico');

        dbSysdba.SqlExec('insert into SINCOFF_SCHEMA (tabela, empresas_id) values (%s, %s)',
          [tabela.QuotedString, CodEmpresa.ToString().QuotedString]).Transaction.Commit();
    end;


    if MatchText(tabela, TABS_BIDIRECIONAIS) or
       MatchText(tabela, TABS_NFCE) or
       MatchText(tabela, ['NFC_EMISSOR']) then
    begin
      // obtendo sincoff das tabelas do servidor
      Result := SqlScalar('select seqid_sincoff from SINCOFF_SERV_IDS where tabela = ''%s'' and empresa_id = %d and side = ''%s'' ',
                          [tabela, CodEmpresa, IfThen(side = clientSide, 'C', 'S')]).AsInteger;
    end
    else
    begin
      var campoEmp := SqlScalar('select CAMPO_EMP from spdb_emp_key(%s)', [tabela.QuotedString]).AsString.Trim;

      Result := SqlScalar('select max(seqid_sincoff) from %s where seqid_sincoff > 0 %s',
        [tabela, IfThen(not campoEmp.IsEmpty, Format(' and %s = %d', [campoEmp, CodEmpresa]))]).AsInteger;
    end;

  except
    on E: Exception do
    begin
      repoLog.Error(ldServerClient, Format('%s - Tabela %s', [e.Message, tabela]));
      HandleError(L, E);
    end;
  end;
end;

function TRepoHw.GetNFCeData(nfceId: Integer;
  keys: TKeyWords): TNFCeData;
const D = 'TRepoHw.GetNFCeData';
begin
  var logId := '';
  try
    logId := repoLog.Info(ldClientServer, Format('Tabela=NFCE Id=%d', [nfceId]));

    SqlExec('execute procedure spso_nfce(%d, %d, ''%s'', ''%s'', ''%s'')',
            [nfceId, CodEmpresa, keys.separator, keys.nullValue, keys.quote]);

    dados.ClientOpen('select * from rawdata order by tabela, id');
    try

      var nfce := TGenericRecord.Create;
      nfce.table := 'NFCE';
      nfce.fields := dados.filterStr('tabela = ''%s'' and id = 0', [nfce.table]).fstr('data');
      nfce.registry := TRawData.Create(dados.filterStr('tabela = ''%s'' and id > 0', [nfce.table]).fstr('data'));

      if nfce.registry.data.IsEmpty then
        Exit;

      var dest := TGenericRecord.Create;
      dest.table := 'NFCE_DEST';
      dest.fields := dados.filterStr('tabela = ''%s'' and id = 0', [dest.table]).fstr('data');
      dest.registry := TRawData.Create(dados.filterStr('tabela = ''%s'' and id > 0', [dest.table]).fstr('data'));

      var itens := TGenericListRecord.Create;
      itens.table := 'NFCE_ITEM';
      itens.fields := dados.filterStr('tabela = ''%s'' and id = 0', [itens.table]).fstr('data');
      dados.filterStr('tabela = ''%s'' and id > 0', [itens.table]).First;
      while not dados.Eof do
      begin
        itens.list := itens.list + [TRawData.Create(dados.fstr('data'))];
        dados.next;
      end;

      var pags := TGenericListRecord.Create;
      pags.table := 'NFCE_PAGAMENTO';
      pags.fields := dados.filterStr('tabela = ''%s'' and id = 0', [pags.table]).fstr('data');
      dados.filterStr('tabela = ''%s'' and id > 0', [pags.table]).First;
      while not dados.Eof do
      begin
        pags.list := pags.list + [TRawData.Create(dados.fstr('data'))];
        dados.next;
      end;

      var infad := TGenericListRecord.Create;
      infad.table := 'NFCE_INFADIC';
      infad.fields := dados.filterStr('tabela = ''%s'' and id = 0', [infad.table]).fstr('data');
      dados.filterStr('tabela = ''%s'' and id > 0', [infad.table]).First;
      while not dados.Eof do
      begin
        infad.list := infad.list + [TRawData.Create(dados.fstr('data'))];
        dados.next;
      end;

      Result := TNFCeData.Create;
      Result.keys := KeyWordsClss.KeyWords();
      Result.nfce := nfce;
      if not dest.registry.data.IsEmpty then
        Result.dest := dest;
      if Length(itens.list) > 0 then
        Result.itens := itens;
      if Length(pags.list) > 0 then
        Result.pagamentos := pags;
      if Length(infad.list) > 0 then
        Result.infadicionais := infad;

      if Assigned(Result.dest) then
        repoLog.Info(ldClientServer, 'Tabela=NFCE_DEST', Result.keys, Result.dest, logId);
      if Assigned(Result.itens) and (Length(Result.itens.list) > 0) then
        repoLog.Info(ldClientServer, Format('Tabela=NFCE_ITEM Qtde=%d', [Length(Result.itens.list)]), Result.keys, Result.itens, logId);
      if Assigned(Result.pagamentos) and (Length(Result.pagamentos.list) > 0) then
        repoLog.Info(ldClientServer, Format('Tabela=NFCE_PAGAMENTO Qtde=%d', [Length(Result.pagamentos.list)]), Result.keys, Result.pagamentos, logId);
      if Assigned(Result.infadicionais) and (Length(Result.infadicionais.list) > 0) then
        repoLog.Info(ldClientServer, Format('Tabela=NFCE_INFADIC Qtde=%d', [Length(Result.infadicionais.list)]), Result.keys, Result.infadicionais, logId);

    finally
      dados.filterClear;
    end;

  except
    on E: Exception do
    begin
      repoLog.Error(ldClientServer, Format('Tabela=NFCE - Erro=%s', [E.Message]), logId);
      raise ExceptionApp.Create('%s - NFCE Id %d', [e.Message, nfceId], D);
    end;
  end;
end;

function TRepoHw.GetNFCeList(caixaId, seqid, skip: Integer): TArray<TNFCe>;
const D = 'TRepoHw.GetNFCeList';
begin
  HandleLog('nfce - > seqid=%d&skip=%d', [seqid, skip]);

  var limit := 50;

  try

    Result := Converter.NewArrayObj<TNFCe>(
      dados.ClientOpen('select first %d skip %d cod_nfce id, cod_empresa empresa_id from nfce' +
                       ' where cod_empresa = %d and cod_emissor = %d and num_nf > 0 and seqid_sincoff > %d' +
                       ' order by seqid_sincoff', [limit, skip, CodEmpresa, caixaId, seqid]));

    HandleLog('nfce-> count=%d', [Length(Result)]);
    repoLog.Info(ldClientServer, Format('Tabela=NFCE Seq=%d Skip=%d Limit=%d Count=%d', [seqid, skip, limit, Length(Result)]));
  except
    on E: Exception do
      raise ExceptionApp.Create('%s - NFCE SeqId %d', [e.Message, seqid], D);
  end;
end;

function TRepoHw.GetToken: TToken;
begin
  var
  Json := GetJSON(CLOUD_SERV_TOKEN_API);

  try
    Result := TJsonHw.ToObject< TToken >(Json, [joDateIsUTC, joDateFormatISO8601, joIgnoreEmptyStrings,
      joIgnoreEmptyArrays]);
  except
    on E: Exception do
    begin
      LogError('TRepoHw.GetLastSincGeneric %s', [E.Message]);
    end;
  end;
end;

function TRepoHw.PostCaixa(payload: TCaixa): Boolean;
const L = 'TRepoHw.PostCaixa';
begin
  Result := False;
  var msg := '';
  try
    if Assigned(payload) and (payload.serieOff > 0) then
    begin
      msg := Format('Tabela=NFC_EMISSOR Name=%s serie=%d serieOff=%d ', [payload.name, payload.serie, payload.serieOff]);

      SqlExec('update nfc_emissor set' +
              ' nome_emissor = ''%s''' +
              ' , serie_nfce = %d' +
              ' , serie_nfce_off = %d' +
              ' where cod_emissor = %d and cod_empresa = %d',
              [payload.name.Substring(0, 32),
               payload.serie,
               payload.serieOff,
               payload.id,
               payload.empresaId]);

      UpdateSeqIdGenericData('NFC_EMISSOR', payload.seqId, serverSide);

      repoLog.Info(ldServerClient, msg);
    end;

    Result := True;
  except
    on E: ExceptionApp do
    begin
      repoLog.Error(ldServerClient, Format('%s - Erro=%s', [msg, E.Message]));
      HandleError(L, E);
    end;

    on E: Exception do
    begin
      repoLog.Error(ldServerClient, Format('%s - Erro=%s', [msg, E.Message]));
      HandleError(L, E);
    end;
  end;
end;

function TRepoHw.PostDeleted(payload: TArray<TDeleted>): Integer;
const L = 'TRepoHw.PostDeleted';
type
  Param = record
    name: string;
    value: Variant;
  end;
var
  deleted: TDeleted;
  fields: TStrings;
  values: TStrings;
  fieldsProps: TArray<TTableFields>;
  params: TArray<Param>;


  function HandleFormatValue(value: string; f: TTableFields): string;
  var
    par: Param;
  begin
    case IndexText(f.ftype, ['STRING', 'VARCHAR', 'CHAR', 'BLOB 1', 'BLOB 2', 'TIMESTAMP', 'DATE', 'TIME']) of
      0..4:
        begin
          par.name := f.name;
          par.value := value;
          params := params + [par];
          Result := ':' + f.name;
        end;
      5..7:
          Result := value.QuotedString();
      else
        Result := value;
    end;
  end;

begin
  Result := 0;
  if Length(payload) = 0 then
    Exit;

//  CheckPrivileges()

  var idx := 0;
  var logId := '';
  var logerror := '';
  var fieldEmp := '';

  try

    logId := repoLog.Info(ldServerClient, Format('Tabela=SINCOFF_DEL Qtde=%d', [Length(payload)]));

    for deleted in payload do
      if deleted.fieldsPK.Equals('GUIDT') and (deleted.valuesPK.Trim.IsEmpty) then
      begin
        UpdateSeqIdGenericData('SINCOFF_DEL', deleted.id, serverSide);

        if Transacao.InTransaction then
          Transacao.Commit;
      end
      else
      begin
        logerror := Format('Exclusão Tabela=%s - Campos=%s - Valores=%s', [deleted.table, deleted.fieldsPK, deleted.valuesPK]);
        fieldEmp := SqlScalar('select CAMPO_EMP as result from spdb_emp_key(''%s'')').AsString.Trim;
        fields := NewStringList(deleted.fieldsPK.ToUpper(), ',');
        values := NewStringList(deleted.valuesPK, '¸');
        SetLength(params, 0);
        var sql := '';

        if (values.Count = 0) then
          raise Exception.Create('Valores para exclusão sem preencher');
        if (values.Count <> fields.Count) then
          raise Exception.Create('Quantidade de campos não é igual a quantidade de valores');

        for var s in fields do
          sql := sql + IfThen(not sql.IsEmpty, ',') + s.Trim().QuotedString();

        fieldsProps := Converter.NewArrayObj< TTableFields >(
          SqlOpen('select f.*, iif(f.name = ''GUIDT'', -1, f.fposition) ord from spdb_fields_all(%s) f' +
          ' where f.name in (%s) or f.ispk = 1 ' +
          ' order by ord',
          [deleted.table.ToUpper.Trim.QuotedString, sql]));

        sql := '';
        for var f in fieldsProps do
        begin
          idx := fields.IndexOf(f.name);
          if idx >= 0 then
          begin
            if (not fieldEmp.IsEmpty) and (fieldEmp.Equals(fields[idx])) and (not values[idx].Equals('0')) and (not values[idx].Equals(CodEmpresa.ToString())) then
              raise Exception.Create('Campo da empresa difere do permitido');

            if f.name.Equals('GUIDT') and values[idx].Trim.IsEmpty then
              raise Exception.Create('Campo GUID sem valor');

            sql := sql + IfThen(not sql.IsEmpty, ' and ') + Format('%s = %s', [fields[idx], HandleFormatValue(values[idx], f)]);
          end;
        end;
        if sql.IsEmpty then
          raise Exception.Create('Instrução SQL não foi possivel ser montada');

        sql := Format('delete from %s where %s', [deleted.table, sql]);

        if Length(params) > 0 then
        begin
          QrAux.Close;
          QrAux.SQL.Text := sql;

          for var i:= Low(params) to High(params) do
            QrAux.Params[i].Value := params[I].value;

          QrAux.ExecSQL;

        end
        else
          SqlExec(sql);

        UpdateSeqIdGenericData('SINCOFF_DEL', deleted.id, serverSide);

        if Transacao.InTransaction then
          Transacao.Commit;
      end;

    Result := Length(payload);

  except
    on E: ExceptionApp do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback();

      repoLog.Error(ldClientServer, Format('%s - Erro=%s', [logerror, e.Message]));
      HandleError(L, E);
    end;

    on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback();

      repoLog.Error(ldClientServer, Format('%s - Erro=%s', [logerror, e.Message]));
      HandleError(L, E);
    end;
  end;
end;

function TRepoHw.PostGenericData2(data: TGenericData): Boolean;
const L = 'TRepoHw.PostGenericData';
type
  Param = record
    name: string;
    value: Variant;
  end;
var
  params: TArray<Param>;
  fields: TArray<TTableFields>;

  function HandleFormatValue(value: string; f: TTableFields): string;
  var
    par: Param;
  begin
    case IndexText(f.ftype, ['STRING', 'VARCHAR', 'CHAR', 'BLOB 1', 'BLOB 2', 'TIMESTAMP', 'DATE', 'TIME']) of
      0..2:
        if value.Equals(data.keys.nullValue) then
          Exit('null')
        else
          Result := value.Replace(data.keys.quote, '''').Substring(0, f.fsize).QuotedString();
      3,4:
        begin
          par.name := f.name;
          if value.Equals(data.keys.nullValue) then
            par.value := Null
          else
            par.value := value.Replace(data.keys.quote, '''');

          params := params + [par];
          Result := ':' + f.name;
        end;
      5..7:
        begin
          if value.Equals(data.keys.nullValue) then
            Exit('null')
          else
            Result := value.QuotedString();
        end
      else
      begin
        if value.Equals(data.keys.nullValue) then
          Exit('null')
        else
          Result := value;
      end;
    end;
  end;

begin
  Result := False;
  var idx := -1;
  var logId := '';
  var refId := 0;
  var refField := '';
  var sqlfinal := '';
  var valuesSQL := '';
  try

    var sql := '';
    var log := '';

    for var s in NewArrayString(data.fields, ',') do
      sql := sql + IfThen(not sql.IsEmpty, ',') + s.Trim().QuotedString();

    fields := Converter.NewArrayObj< TTableFields >(
          SqlOpen('select f.*, iif(f.name = ''GUIDT'', -1, f.fposition) ord from spdb_fields_all(%s) f' +
          ' where f.name in (%s) or f.ispk = 1 ' +
          ' order by ord',
          [data.table.Trim.QuotedString, sql]));

    sql := '';

    var list := NewStringList(data.fields.ToUpper(), ',');
    var omitFields := NewStringList();
    if MatchText(data.table, TABS_BIDIRECIONAIS) or
       MatchText(data.table, TABS_NFCE) then
    begin
      omitFields.Add('SEQID_SINCOFF');
      if MatchText(data.table, ['NFCE_ITEM', 'NFCE_PAGAMENTO', 'NFCE_INFADIC', 'TRANSACAO_CARTAO']) then
        omitFields.Add('SEQID');
    end;

    if MatchText(data.table, ['NFCE', 'NFCE_DEST', 'NFCE_ITEM', 'NFCE_PAGAMENTO', 'NFCE_INFADIC']) then
    begin
      if list.IndexOf('GUIDT') = -1 then
        raise Exception.Create(Format('Campo GUID para %s não presente', [data.table]));
      if (not data.table.Equals('NFCE')) and (list.IndexOf('GUID_NFCE') = -1) then
        raise Exception.Create(Format('Campo GUID_NFCE para %s não presente', [data.table]));
      refField := IfThen(data.table.Equals('NFCE'), 'GUIDT', 'GUID_NFCE');
    end;

    logId := repoLog.Info(ldServerClient, 'Tabela=' + data.table + 'Qtde=' + Length(data.list).ToString(), data.keys, data);

    idx := 0;
    for var item in data.list do
    begin
      var soseqid := 0;
      var fieldsSql := '';
//      var
      valuesSql := '';
      var matching := '';
      var values := NewArrayString(item.data, data.keys.separator, False);

      refId := 0;
      if MatchText(data.table, ['NFCE', 'NFCE_DEST', 'NFCE_ITEM', 'NFCE_PAGAMENTO', 'NFCE_INFADIC']) then
      begin
        refId := SqlScalar('select cod_nfce from NFCE where GUIDT = ''%s''', [values[list.IndexOf(refField)]]).AsInteger;
        if (refId = 0) and (data.table.Equals('NFCE')) then
          refId := SqlScalar('select cod from incrementa_codigo(%d, ''%s'')', [CodEmpresa, 'NFCE']).AsInteger;
      end;

      SetLength(params, 0);

      for var f in fields do
      begin

        var index := list.IndexOf(f.name);

        if index >= 0 then
        begin
          if f.name.Equals('SEQID_SINCOFF') then
            soseqid := StrToIntDef(values[index], 0);

          if (f.ispk = 1) and (values[index].Equals(data.keys.nullValue)) and (omitFields.IndexOf(f.name) = -1) then
            raise ExceptionApp.Create('Registro com valor nulo em campo com chave primaria', L);

          if omitFields.IndexOf(f.name) = -1 then
          begin

            fieldsSql := fieldsSql + IfThen(not fieldsSql.IsEmpty, ',') + f.name;

            if (f.name.Equals('COD_NFCE')) and
              (MatchText(data.table, ['NFCE', 'NFCE_DEST', 'NFCE_ITEM', 'NFCE_PAGAMENTO', 'NFCE_INFADIC'])) then
              valuesSql := valuesSql + IfThen(not valuesSql.IsEmpty, ',') + refId.ToString()
            else
              valuesSql := valuesSql + IfThen(not valuesSql.IsEmpty, ',') + HandleFormatValue(values[index], f);

            if not matching.Equals('GUIDT') then
              if f.name.Equals('GUIDT') and (not MatchText(values[index].Trim, [data.keys.nullValue, ''])) then
                matching := 'GUIDT'
              else if f.ispk = 1 then
                matching := matching + IfThen(not matching.IsEmpty, ',') + f.name;
          end;

        end
        else if (f.ispk = 1) then
          raise ExceptionApp.Create('Chave primaria do objeto não está presente nos dados retornados', L);
      end;

     // var
      sqlfinal := Format('update or insert into %s (%s) values (%s) matching (%s)',
        [data.table, fieldsSql, valuesSql, matching]);

//      try
        if Length(params) > 0 then
        begin
          QrAux.Close;
          QrAux.SQL.Text := sqlfinal;

          for var i:= Low(params) to High(params) do
            QrAux.Params[i].Value := params[I].value;

          QrAux.ExecSQL;

        end
        else
          SqlExec(sqlfinal);

        // qualquer alteração nas tabelas bidirecionais nesse metodo quer dizer que foi o servidor que fez, aqui atualizar o seqid que esta no lado do servidor
        if MatchText(data.table, TABS_BIDIRECIONAIS) or
           MatchText(data.table, TABS_NFCE) then
          UpdateSeqIdGenericData(data.table, soseqid, serverSide);

        if Transacao.InTransaction then
          Transacao.Commit;

//      except on E: Exception do
//        begin
//          repoLog.Error(ldServerClient, Format('Index=%d - Erro=%s', [idx, E.Message]), logId);
//          HandleError(L, E);
//        end;
//      end;

      Inc(idx);
    end;

    Result := True;

  except
    on E: ExceptionApp do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      ClientErrorResolve(Format('Index=%d - Erro=%s', [idx, E.Message]), data, idx, fields);
      repoLog.Error(ldServerClient, Format('Index=%d - Erro=%s', [idx, E.Message]), logId);
      LogApp.Log('LastSincError', Format('Tabela=%s Campos=%s ' + sLineBreak + sqlfinal + sLineBreak + valuesSql , [data.table, data.fields]), True, True);
      HandleError(L, E);
    end;

    on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      ClientErrorResolve(Format('Index=%d - Erro=%s', [idx, E.Message]), data, idx, fields);
      repoLog.Error(ldServerClient, Format('Index=%d - Erro=%s', [idx, E.Message]), logId);
      LogApp.Log('LastSincError', Format('Tabela=%s Campos=%s ' + sLineBreak + sqlfinal + sLineBreak + valuesSql , [data.table, data.fields]), True, True);
      HandleError(L, E);
    end;
  end;
end;

function TRepoHw.PostNFCe(id: Integer; nfce: TNFCe; nfceData: TNFCeData): Boolean;
const L = 'TRepoHw.PostNFCe';
begin
  Result := False;
  try
    dados.ClientOpen('select cod_nfce, status, situacao_nfce, ped_origem_num, ped_destino_num from nfce' +
                     ' where cod_nfce = %d and cod_empresa = %d',
                     [id, CodEmpresa]);
    if not dados.IsEmpty then
    begin
      if (dados.fint('PED_ORIGEM_NUM') = 0) then
      begin
        if (dados.fint('PED_DESTINO_NUM') = 0) and (nfce.pedidoDestId > 0) then
          SqlExec('update nfce set PED_DESTINO_NUM = %d, PED_DESTINO_TIP = ''%s''' +
                  ' where cod_nfce = %d and cod_empresa = %d',
                  [nfce.pedidoDestId, nfce.pedidoDestTipo, id, CodEmpresa])
        else if (dados.fequals('status', 'Cancelada') or (dados.fmatchText('situacao_nfce', ['Cancelada', 'Inutilizada', 'Denegada']))) and
                (dados.fint('PED_DESTINO_NUM') > 0) and (nfce.pedidoDestId = 0) then
          SqlExec('update nfce set PED_DESTINO_NUM = null, PED_DESTINO_TIP = null' +
                  ' where cod_nfce = %d and cod_empresa = %d',
                  [id, CodEmpresa]);
      end;
    end;

    QrAux.Close;
    QrAux.SQL.Text := 'insert into SINCOFF_BKP (tabela, json) values (:tabela, :json)';
    QrAux.Params[0].AsString := 'NFCE';
    QrAux.Params[1].AsString := TJsonHw.ToJsonString(nfceData);
    QrAux.ExecSQL;

    if Transacao.InTransaction then
      Transacao.Commit();

    Result := True;
  except
    on E: ExceptionApp do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback();
      HandleError(L, E);
    end;

    on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback();
      HandleError(L, E);
    end;
  end;
end;

function TRepoHw.PostNFCeBkp(nfce: TNFCeData): Boolean;
const L = 'TRepoHw.PostNFCeBkp';
begin
  Result := False;

  /// Sempre que enviar uma nfce e ter sucesso essa nfce fica registrada como backup, caso o servidor altere, esse backup pode ser util

  try

    QrAux.Close;
    QrAux.SQL.Text := 'insert into SINCOFF_BKP (tabela, json) values (:tabela, :json)';
    QrAux.Params[0].AsString := 'NFCE';
    QrAux.Params[1].AsString := TJsonHw.ToJsonString(nfce);

    QrAux.ExecSQL;
    QrAux.Transaction.Commit();

    Result := True;
  except
    on E: ExceptionApp do
      HandleError(L, E);

    on E: Exception do
      HandleError(L, E);
  end;
end;

function TRepoHw.PostPedVenda(pedvendas: TArray<TProposta>): Boolean;
const L = 'TRepoHw.PostProposta';
var
  pedvenda: TProposta;
begin
  Result := False;
  if Length(pedvendas) = 0 then
    Exit;

  var idx := 0;
  var logId := '';
  try

    var dadosP := NewClientOOP(Transacao);
    try
      logId := repoLog.Info(ldServerClient, Format('Tabela=PEDVENDA - Qtde=%d', [Length(pedvendas)]));

      for idx := Low(pedvendas) to High(pedvendas) do
      begin
        pedvenda := pedvendas[idx];

        if pedvenda.COD_EMPRESA <> CodEmpresa then
          raise Exception.Create('Pedvenda recebido com codigo da empresa diferente do configurado');

        SqlExec('delete from pedvenda_prod where nped = %d and tipo = ''%s'' and cod_empresa = %d',
          [pedvenda.NPED, pedvenda.TIPO, pedvenda.COD_EMPRESA]);

        dados.ClientOpen('select * from pedvenda where nped = %d and tipo = ''%s'' and cod_empresa = %d',
          [pedvenda.NPED, pedvenda.TIPO, pedvenda.COD_EMPRESA]);

        Converter.Copy(pedvenda, dados.DataSet);

        dadosP.ClientOpen('select * from pedvenda_prod where nped = %d and tipo = ''%s'' and cod_empresa = %d',
                          [pedvenda.NPED, pedvenda.TIPO, pedvenda.COD_EMPRESA]);

        Converter.CopyAll<TPropostaProduto>(pedvenda.Produtos, dadosP.DataSet);
        if not dados.DataSet.ApplyUpdates(0) > 0 then
          Transacao.Rollback
        else if not dadosP.DataSet.ApplyUpdates(0) > 0 then
          Transacao.Rollback
        else
          Transacao.Commit;
      end;

    finally
      FreeAndNil(dadosP);
    end;

    Result := True;

  except
    on E: ExceptionApp do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback();

      repoLog.Error(ldServerClient, Format('Tabela=PEDVENDA %s %d - Erro=%s', [pedvendas[idx].TIPO, pedvendas[idx].NPED, E.Message]), logId);
      HandleError(L, E);
    end;

    on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback();

      repoLog.Error(ldServerClient, Format('Tabela=PEDVENDA %s %d - Erro=%s', [pedvendas[idx].TIPO, pedvendas[idx].NPED, E.Message]), logId);
      HandleError(L, E);
    end;
  end;
end;

function TRepoHw.PostToken(token: TToken): Boolean;
begin
  Result := SaveJSON(CLOUD_SERV_TOKEN_API, TJsonHw.ToJsonString(token, [joDateIsUTC, joDateFormatISO8601,
    joIgnoreEmptyStrings, joIgnoreEmptyArrays]))
end;

procedure TRepoHw.SetDateError(caixaId: Integer);
begin
  try
    SqlExec('update nfc_emissor set data_api_error = (select current_ts from sp_current_ts(%d))' +
            ' where cod_emissor = %d and cod_empresa = %d',
            [CodEmpresa, caixaId, CodEmpresa]).Transaction.Commit;
  except
  end;
end;

procedure TRepoHw.SetDateOnline(caixaId: Integer);
begin
  try
    SqlExec('update nfc_emissor set data_api_online = (select current_ts from sp_current_ts(%d))' +
            ' where cod_emissor = %d and cod_empresa = %d',
            [CodEmpresa, caixaId, CodEmpresa]).Transaction.Commit;
  except
  end;
end;

function TRepoHw.UpdateSeqIdGenericData(tabela: string; seqid: Integer;
  side: TClientServerSide): TGenericData;
begin
  QrAux.Close;
  QrAux.SQL.Text := 'merge into sincoff_serv_ids s' +
                    '   using (select coalesce(sf.tabela, :tabela) tabela, coalesce(sf.empresa_id, :empresa_id) empresa_id,' +
                    '            coalesce(sf.seqid_sincoff, :id) seqid_sincoff, coalesce(sf.side, :side) side from rdb$database db' +
                    '            left join SINCOFF_SERV_IDS sf on sf.tabela = :tabela and sf.empresa_id = :empresa_id and sf.side = :side) c' +
                    '   on (s.empresa_id = c.empresa_id and s.tabela = c.tabela and s.side = :side)' +
                    '   when matched then update set seqid_sincoff = iif(:id > c.seqid_sincoff, :id, c.seqid_sincoff)' +
                    '   when not matched then insert (empresa_id, tabela, side, seqid_sincoff) values (:empresa_id, :tabela, :side, :id)';
  QrAux.ParamByName('tabela').AsString      := tabela;
  QrAux.ParamByName('empresa_id').AsInteger := CodEmpresa;
  QrAux.ParamByName('id').AsInteger         := seqid;
  QrAux.ParamByName('side').AsString        := IfThen(side = clientSide, 'C', 'S');
  QrAux.ExecSQL;

  if QrAux.Transaction.InTransaction then
    QrAux.Transaction.Commit();
end;

// procedure TRepoHw.HandleUpdateToken(atoken: TToken);
// var
// updatetoken: Boolean;
// begin
// if atoken <> nil then
// begin
// if not Assigned(FToken) then
// updatetoken := True
// else if FToken.accessToken <> atoken.accessToken then
// updatetoken := True
// else
// updatetoken := False;
//
// if updatetoken then
// begin
// FToken := atoken;
// SaveJSON(CLOUD_SERV_TOKEN_API, TJson.ObjectToJsonString(FToken, [joDateIsUTC, joDateFormatISO8601,
// joIgnoreEmptyStrings, joIgnoreEmptyArrays]));
// end;
// end;

end.
