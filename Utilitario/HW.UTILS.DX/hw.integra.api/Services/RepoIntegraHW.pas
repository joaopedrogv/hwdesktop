unit RepoIntegraHW;

interface

uses
  uClasseConexao,
  RestApiBaseRes,
  Hw.Integra.Servicos,
  UsuarioClienteEtd,
  EstatisticaEtd,
  Config_sistema_class,
  System.Classes,
  HW.Servicos;

type
  TipoEstatisticas = (teGeral, teUsuarios, tePersonalizado, teGeralResumido, teUsuariosResumido);
  TiposEstatisticas = set of TipoEstatisticas;
  TipoFrequencia = (tfOnceOnly, tfdaily, tfWeekly, tfMonthly);

  TRepoIntegra = class(THwIntegraServicos)
  strict private
//    dbSysdba  : TConexao;
//    dados     : TConexao_OOP;
    paramsRepo: TStrings;
//    procedure CheckPrivileges(table: string); overload;
//    function ClientErrorResolve(error: string; data: TGenericData; index: Integer; fields: TArray<TTableFields>): TClientError;
  private
//    FrepoLog: TRepoLog;
//    FclientError: TClientError;
    procedure Consultar(dadosConsulta: THwServicosJSON); override;
  public
//    constructor Create(
//      banco     : string;
//      empresaId : Integer;
//      silentMode: Boolean); overload;

    constructor Create(paramsList: string; inicializarDados: Boolean = True);
    destructor Destroy; override;

    procedure Inicializar;

//    procedure HandlePermision(msg: string);
//    function CheckSchema(schema: TArray< TSchema >): Boolean;

//    procedure CheckPrivileges(); overload;
//    procedure SetDateOnline(caixaId: Integer);
//    procedure SetDateError(caixaId: Integer);
//    function GetUrlApi(): string;
//    function GetLastSincIdTable(tabela: string; side: TClientServerSide): Integer; overload;
//    function GetLastSincIdTable(tabela: string; date: TDateTime): Integer; overload;
//    function GetLastSincIdDeletedTables(side: TClientServerSide): Integer;
//    function GetUserCredentials(caixa: Integer): TUserCredentials;
//    function GetToken(): TToken;
//    function GetNFCeData(nfceId: Integer; keys: TKeyWords): TNFCeData;
//    function GetGenericData(tabela: string; caixaId, seqid, skip: Integer; keys: TKeyWords): TGenericData;
//    function GetNFCeList(caixaId, seqid, skip: Integer): TArray<TNFCe>;
//    function UpdateSeqIdGenericData(tabela: string; seqid: Integer; side: TClientServerSide): TGenericData;

//    function PostCaixa(payload: TCaixa): Boolean;
//    function PostGenericData2(data: TGenericData): Boolean;
//    function PostToken(token: TToken): Boolean;
//    function PostNFCeBkp(nfce: TNFCeData): Boolean;
//    function PostNFCe(id: Integer; nfce: TNFCe; nfceData: TNFCeData): Boolean;
//    function PostPedVenda(pedvendas: TArray<TProposta>): Boolean;

    function GetEmpresasFisicas(): TArray<Integer>;

    function GetUsuariosCliente(): TArray<TUsuarioCliente>;
    function GetUsuariosClientePorLogin(loginLastXdays: Integer): TArray<TUsuarioClienteBase>;
    function UpdateStatusWsUsuariosCliente<T: class>(users: TArray<T>): Boolean;

    function GetEstatisticas(tipos: TiposEstatisticas): TArray<TEstatistica>; overload;
    function IncEstatistica(str: string): Integer;
    function AddUserEstatistica(userName: string): Boolean;
    function UpdateStatusEnvioEstatistica(estatisticas: TArray<TEstatistica>): Boolean;

    function GetEstatisticasCustom(): TArray<TEstatisticaCustomHW>;
    function UpdateEstatisticasCustom(customs: TArray<TEstatisticaCustom>): Boolean;
//    function UpdateEstatisticaCustom(customs: TArray<TEstatisticaCustomHW>): Boolean;
    function RunEstatisticasCustom(custom: TEstatisticaCustomHW): Boolean;

//    function PostDeleted(payload: TArray<TDeleted>): Integer;

//    property repoLog: TRepoLog read FrepoLog write FrepoLog;
//    property clientError: TClientError read FclientError write FclientError;
  end;

implementation

{ TRepoIntegra }

uses
  System.SysUtils,
  System.StrUtils,
  Hw.Convert,
  hw_utils,
  hw_win_utils;

procedure TRepoIntegra.Consultar(dadosConsulta: THwServicosJSON);
begin
  inherited;
end;

constructor TRepoIntegra.Create(paramsList: string; inicializarDados: Boolean);
begin
  var splitStr := Copy(paramsList, 1, 1);
  if OnlyNumberAndLetters(splitStr, '') = splitStr then
    raise Exception.Create('TRepoIntegra.Create. Primeiro caracter do paramsList deve ser o split para a string de parametros');

  paramsRepo := NewStringList(Copy(paramsList, 2, Length(paramsList)), splitStr);

  inherited Create(StrToBoolDef(paramsRepo.Values['silent'], False));

  CodEmpresa                  := StrToInt(paramsRepo.Values['empresaId']);
//  DataBasePath                := paramsRepo.Values['databaseName'];
//  dados                       := NewClientOOP(Transacao);
//  dados.DataSet.PacketRecords := 50;

  //dbSysdba.confiBanco.Params.Values['lc_ctype'] := paramsRepo.Values['charSet'];// 'ISO8859_1';

  Self.ConfigureStr(paramsList);
//  dbSysdba.ConfigureStr(paramsList);
//  FclientError := TClientError.Create;

  if inicializarDados then
    Self.Inicializar;
end;

destructor TRepoIntegra.Destroy;
begin
  paramsRepo.Free;
  inherited;
end;

function TRepoIntegra.GetEmpresasFisicas: TArray<Integer>;
const D = 'TRepoIntegra.GetEmpresasFisicas';
begin
  try
    Result := [];

    try

      Client.Open('select e.cod_empresa, iif(coalesce(ef.cod_empresa, ed.cod_empresa_fisica) = e.cod_empresa, 1, 0) fisica from empresa e' +
                  ' left join empresa_fisica ef on ef.cod_empresa = e.cod_empresa' +
                  ' left join empdesvolv ed on ed.cod_empdes = 1').filterStr('fisica = 1');
      try
        if Client.Count = 0 then
          Client.filterClear;
        Client.First;
        while not Client.Eof do
        begin
          Result := Result + [Client.fint('cod_empresa')];

          Client.Next;
        end;


      finally
        Client.filterClear;
      end;

    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      LogError('% - %s', [D, e.Message]);
      raise E;
    end;
  end;
end;

function TRepoIntegra.GetEstatisticas(tipos: TiposEstatisticas): TArray<TEstatistica>;
const D = 'TRepoIntegra.GetEstatisticas';
var
  estatistica: TEstatistica;
begin
  try
    Result := [];

    try
      var sql := '-1';

      if (teGeral in tipos) then
        sql := sql + ', 0';
      if (teUsuarios in tipos) then
        sql := sql + ', 1';
      if (tePersonalizado in tipos) then
        sql := sql + ', 2';
      if (teGeralResumido in tipos) then
        sql := sql + ', 3';
      if (teUsuariosResumido in tipos) then
        sql := sql + ', 4';

      Client.Open('select first 100 s.dia as data, s.descricao, s.tipo, s.quantidade, s.valor from STATS s' +
        ' where s.enviado is null and s.dia < (select current_d from sp_current_ts(%d))' +
        ' and s.cod_e = %d and s.tipo in (%s) and s.enviado is null' +
        ' order by dia asc',
        [CodEmpresa, CodEmpresa, sql]);

      if Client.Last().First().DataSet.RecordCount = 0 then
        Exit;

      Result := Converter.NewArrayObj<TEstatistica>(Client.DataSet);

//      while not Client.Eof do
//      begin
//        estatistica := TEstatistica.Create;
//        estatistica := Converter.NewObj<TEstatistica>(Client.DataSet)
//
//        estatistica.data := Client.fdate('dia');
//        estatistica.descricao := Client.fstr('descricao');
//        estatistica.quantidade := Client.fint('quantidade');
//        estatistica.valor := Client.fint('valor');

//        Result := Result + [estatistica];

//        Client.next;
//      end;


    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      LogError('% - %s', [D, e.Message]);
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TRepoIntegra.GetEstatisticasCustom: TArray<TEstatisticaCustomHW>;
const D = 'TRepoIntegra.GetIdEstatisticasCustom';
var
  estatistica: TEstatisticaCustomHW;
  nextRun: TDateTime;
begin
  try
    Result := [];

    try
      Client.Open('select c.* from (' +
                  ' select * from STATS_CUSTOM' +
                  ' where cod_e = %d and frequency = 0 and lastrun is null and ativo = 1' +
                  ' union' +
                  ' select * from STATS_CUSTOM' +
                  ' where cod_e = %d and frequency > 0 and ativo = 1' +
                  ' ) as c' +
                  ' order by c.sequpdate',
                  [CodEmpresa, CodEmpresa]);

      if Client.Last().First().DataSet.RecordCount = 0 then
        Exit;

      while not Client.Eof do
      begin
        estatistica := Converter.NewObj<TEstatisticaCustomHW>(Client.DataSet);


        case TipoFrequencia(estatistica.frequency) of

          tfOnceOnly:
            nextRun := DataHoraAtual - 1;
          tfWeekly:
            nextRun := estatistica.lastRun + 7;
          tfMonthly:
            nextRun := estatistica.lastRun + 30
          else
            nextRun := estatistica.lastRun + 1;
        end;

        if nextRun < DataHoraAtual then
          Result := Result + [estatistica];

        Client.next;
      end;

    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      LogError('% - %s', [D, e.Message]);
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TRepoIntegra.GetUsuariosCliente: TArray<TUsuarioCliente>;
const D = 'TRepoIntegra.GetUsuariosCliente';
var
  user: TUsuarioCliente;
begin
  try
    Result := [];

    try

      Client.Open('select e.sigla_uf, s.data_login, col.* from colaborador col' +
        ' left join estados e on e.codigo_uf = col.codigo_uf' +
        ' left join senhas s on s.codigo = col.cod_vendedor and s.cod_empresa = col.cod_empresa' +
        ' where col.cod_empresa = %d' +
        ' and DATA_HORA_ENV_WS < DATA_HORA_ALT_WS' +
        ' union' +
        ' select e.sigla_uf, s.data_login, col.* from colaborador col' +
        ' left join estados e on e.codigo_uf = col.codigo_uf' +
        ' left join senhas s on s.codigo = col.cod_vendedor and s.cod_empresa = col.cod_empresa' +
        ' where col.cod_empresa = %d' +
        ' and data_hora_env_ws is null',
        [CodEmpresa, CodEmpresa]);

      if Client.Last().First().DataSet.RecordCount = 0 then
        Exit;

      var fieldMob := Client.DataSet.FindField('MOB') <> nil;

      while not Client.Eof do
      begin
        user := TUsuarioCliente.Create;
        //user.id := ; não precisa
        //user.empresaId := ; não precisa
        //user.clienteId := ; não precisa
        user.isFromMobile := (fieldMob and Client.fequals('MOB', 'S'));
        user.nome := Client.fstr('nome_vendedor');
        user.endereco := Client.fstr('end_vendedor');
        user.bairro := Client.fstr('bairro_vendedor');
        user.cidade := Client.fstr('cidade_vendedor');
        user.estado := Client.fstr('sigla_uf');
        user.cep := Client.fstr('cep_vendedor');
        user.fone := Client.fstr('fone_vendedor');
        user.cpf := Client.fstr('cpf_vendedor');
        user.email := Client.fstr('email');
        user.ativo := Client.fint('ativo');
        user.colaboradorId := Client.fint('cod_vendedor');
        user.dataLogin := Client.fdatet('data_login');

        if Client.fempty('dat_nasc_col') then
          user.dataNascimento := EncodeDate(2014, 1, 1)
        else
          user.dataNascimento := Client.fdate('dat_nasc_col');

        Result := Result + [user];

        Client.next;
      end;

    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      LogError('% - %s', [D, e.Message]);
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TRepoIntegra.GetUsuariosClientePorLogin(
  loginLastXdays: Integer): TArray<TUsuarioClienteBase>;
const D = 'TRepoIntegra.GetUsuariosClientePoLogin';
var
  user: TUsuarioClienteBase;
begin
  try
    Result := [];

    try

      Client.Open('select max(s.data_login) data_login, col.cod_vendedor from colaborador col' +
        ' inner join senhas s on s.codigo = col.cod_vendedor and s.cod_empresa = col.cod_empresa' +
        ' where col.cod_empresa = %d and col.ativo = 1' +
        ' and cast(s.data_login as date) > cast(col.data_hora_env_ws as date)' +
        ' group by 2',
        [CodEmpresa]);

      if Client.Last().First().DataSet.RecordCount = 0 then
        Exit;

      while not Client.Eof do
      begin
        user := TUsuarioCliente.Create;
        user.colaboradorId := Client.fint('cod_vendedor');
        user.dataLogin := Client.fdatet('data_login');

        Result := Result + [user];

        Client.next;
      end;

    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      LogError('% - %s', [D, e.Message]);
      raise E;
    end;
  end;
end;

function TRepoIntegra.IncEstatistica(str: string): Integer;
const D = 'TRepoIntegra.IncEstatistica';
begin
  try

    Result := SqlScalar('select qtde from SP_STATS_INC(''%s'', %d)', [str, CodEmpresa]).AsInteger;

    if Transacao.InTransaction then
      Transacao.Commit;

  except
    on E: Exception do
    begin
      LogError('% - %s: %s', [D, e.Message, str]);
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TRepoIntegra.AddUserEstatistica(userName: string): Boolean;
const D = 'TRepoIntegra.IncEstatisticaUser';
begin
  try

    SqlOpen('select * from sp_stats_us(''%s'', ''%s'', ''%s'', %d)',
            [userName, GetUserLoggedName, GetSerialHd, CodEmpresa]);

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;

  except
    on E: Exception do
    begin
      Result := False;
      LogError('% - %s', [D, e.Message]);
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TRepoIntegra.Inicializar;
begin
  Self.GetUrlApi;

  if not Self.GetCNPJ then
    raise Exception.Create('CNPJ não localizado para empresa ' + IntToStr(CodEmpresa));
end;

function TRepoIntegra.RunEstatisticasCustom(
  custom: TEstatisticaCustomHW): Boolean;
const D = 'TRepoIntegra.RunEstatisticasCustom';
begin
 try

    try
      if not custom.customExec.Trim.IsEmpty then
        SqlExec(StrReplace(custom.customExec, [':cod_empresa'], IntToStr(CodEmpresa)));

      if not custom.customSelect.Trim.IsEmpty then
        SqlExec(StrReplace(custom.customSelect, [':cod_empresa'], IntToStr(CodEmpresa)));

      SqlExec('update STATS_CUSTOM set LASTRUN = %s where ID = ''%s'' and COD_E = %d',
          [datet_fb(DataHoraAtual), custom.id, CodEmpresa]);

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;
    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      Result := False;
      LogError('% - %s', [D, E.Message]);
      raise Exception.Create(E.Message);
    end;
  end;
end;

//function TRepoIntegra.UpdateEstatisticaCustom(
//  customs: TArray<TEstatisticaCustomHW>): Boolean;
//const D = 'TRepoIntegra.UpdateEstatisticaCustom';
//begin
// try
//
//    try
//      for var custom in customs do
//        SqlExec('update STATS_CUSTOM set LASTRUN = ''%s'' where ID = ''%s'' and COD_E = %d',
//          [datet_fb(DataHoraAtual), custom.id, CodEmpresa]);
//
//      if Transacao.InTransaction then
//        Transacao.Commit;
//
//      Result := True;
//    finally
//      if Transacao.InTransaction then
//        Transacao.Rollback;
//    end;
//
//  except
//    on E: Exception do
//    begin
//      Result := False;
//      LogError('% - %s', [D, E.Message]);
//      raise Exception.Create(E.Message);
//    end;
//  end;
//end;

function TRepoIntegra.UpdateEstatisticasCustom(
  customs: TArray<TEstatisticaCustom>): Boolean;
const D = 'TRepoIntegra.UpdateEstatisticasCustom';
begin
 try

    try
      for var custom in customs do
      begin
        QrAux.Close;
        QrAux.SQL.Text := Format('update or insert into stats_custom (id, cod_e, name, customexec, customselect, frequency, sequpdate, ativo)' +
                                 ' values (''%s'', %d, ''%s'', :customexec, :customselect, %d, %d, %d)' +
                                 ' matching (id, cod_e)',
                                 [custom.id, CodEmpresa, custom.name, custom.frequency, custom.seqUpdate, custom.ativo]);
        QrAux.ParamByName('customexec').AsString := custom.customExec;
        QrAux.ParamByName('customselect').AsString := custom.customSelect;
        QrAux.ExecSQL;
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;
    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      Result := False;
      LogError('% - %s', [D, E.Message]);
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TRepoIntegra.UpdateStatusEnvioEstatistica(
  estatisticas: TArray<TEstatistica>): Boolean;
const D = 'TRepoIntegra.UpdateStatusEnvioEstatistica';
begin
 try

    try
      for var estatistica in estatisticas do
        SqlExec('update STATS set ENVIADO = ''S'' where DIA = %s and COD_E = %d and DESCRICAO = ''%s'' and ENVIADO is null',
          [datet_fb(estatistica.data), CodEmpresa, estatistica.descricao]);

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;
    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      Result := False;
      LogError('% - %s', [D, E.Message]);
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TRepoIntegra.UpdateStatusWsUsuariosCliente<T>(
  users: TArray<T>): Boolean;
const D = 'TRepoIntegra.UpdateStatusWsUsuariosCliente';
var
  user: T;
begin
  Result := False;
 try

    try
      for user in users do
        SqlExec('update colaborador set data_hora_env_ws = %s where cod_vendedor = %d and cod_empresa = %d',
          [ datet_fb(DataHoraAtual), (user as TUsuarioClienteBase).colaboradorId, CodEmpresa]);

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;
    finally
      if Transacao.InTransaction then
        Transacao.Rollback;
    end;

  except
    on E: Exception do
    begin
      LogError('% - %s', [D, E.Message]);
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
