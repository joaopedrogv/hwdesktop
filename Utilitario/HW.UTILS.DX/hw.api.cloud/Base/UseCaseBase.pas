unit UseCaseBase;

interface

uses
  RepoHw,
  ApiCloud,
  RepoLog,
  ErrorApiRes,
  Hw.Types,
  System.SysUtils,
  GenericDataEtd,
  System.Classes;

type
  TUseCaseBase = class
  private
    FLogError: TLogText;
    FLog: TLogText;
    Fkeys: TKeyWords;

    procedure repoLog_error_event(Sender: TObject);
  protected
    caixaId  : Integer;
    silent   : Boolean;
    api      : TApiCloud;
    repo     : TRepoHw;
    repoLog  : TRepoLog;
    paramsUC : TStrings;
//    paramsList

    function InitUseCase(checkAllPrivileges: Boolean = True): Boolean;
    procedure HandleError(
      const location: string;
      const E       : ExceptionApp); overload;
    procedure HandleError(
      const location: string;
      const E       : Exception); overload;
    procedure HandleLog(text: string); overload;
    procedure HandleLog(text: string; const args: array of const); overload;
    function GetLastSeqId(fields, text, separator: string): Integer;
  public
//    constructor Create(
//      banco     : string;
//      empresaId : Integer;
//      caixa     : Integer;
//      silentMode: Boolean); overload;
    constructor Create(paramsList: string);
    destructor Destroy; override;

    property OnError: TLogText read FLogError write FLogError;
    property OnLog: TLogText read FLog write FLog;
    property keys: TKeyWords read Fkeys write Fkeys;
  end;

implementation

uses
  hw_utils,
  hw_win_utils;

{ TUseCaseBase }

{constructor TUseCaseBase.Create(
  banco     : string;
  empresaId : Integer;
  caixa     : Integer;
  silentMode: Boolean);
begin
  silent    := silentMode;
  caixaId   := caixa;
  repo      := TRepoHw.Create(banco, empresaId, silentMode);
  api       := TApiCloud.Create();
  repo.ConfigureStr(banco);
end;                 }

constructor TUseCaseBase.Create(paramsList: string);
begin
  var splitStr := Copy(paramsList, 1, 1);
  if OnlyNumberAndLetters(splitStr, '') = splitStr then
    raise Exception.Create('TUseCaseBase.Create. Primeiro caracter do paramsList deve ser o split para a string de parametros');

  paramsUC  := NewStringList(Copy(paramsList, 2, Length(paramsList)), splitStr);
  silent    := StrToBoolDef(paramsUC.Values['silent'], False);//.ToLower.Equals('true');
  caixaId   := StrToIntDef(paramsUC.Values['caixaId'], 0);
  repo      := TRepoHw.Create(paramsList);
  api       := TApiCloud.Create();
  Fkeys     := KeyWordsClss.KeyWords();

  repo.ConfigureStr(';databaseName=' + paramsUC.Values['databaseName']);
  repo.clientError.keys := Fkeys;
end;

destructor TUseCaseBase.Destroy;
begin
  if Assigned(api.Token) then
    repo.PostToken(api.Token);

  api.Free;
  repo.Free;
  Fkeys.Free;

  if Assigned(repoLog) then
    FreeAndNil(repoLog);
  inherited;
end;

function TUseCaseBase.GetLastSeqId(fields, text,
  separator: string): Integer;
begin
  var list := NewStringList(fields, ',');
  var index := list.IndexOf('SEQID_SINCOFF');
  if index = -1 then
    raise Exception.Create('Campo SEQID não presente na lista');

  list := NewStringList(text, separator);
  if not TryStrToInt(Trim(list[index]), index) then
    raise Exception.Create('Campo SEQID não foi convertido');

  Result := index;
end;

procedure TUseCaseBase.HandleError(
  const location: string;
  const E       : Exception);
begin
  LogApp.Error('%s / %s', [location, E.Message]);
  HandleLog('Error-> %s / %s', [location, e.Message]);
  if not silent then
    ShowErro(E.Message);
end;

procedure TUseCaseBase.HandleLog(text: string; const args: array of const);
begin
  HandleLog(Format(text, args));
end;

procedure TUseCaseBase.HandleLog(text: string);
begin
  if Assigned(FLog) then
    FLog(Format('[%s]', [Self.ClassName]) + text);
end;

procedure TUseCaseBase.HandleError(
  const location: string;
  const E       : ExceptionApp);
begin
  LogApp.Error('%s / %s - %s', [location, E.detail, E.Message]);
  HandleLog('Error-> %s / %s - %s', [location, e.detail, e.Message]);
  if not silent then
    ShowErro(E.Message);
end;

function TUseCaseBase.InitUseCase(
  checkAllPrivileges: Boolean): Boolean;
const D = 'TUseCaseBase.InitUseCase';
begin

  if Assigned(FLog) then
    repo.OnLog := FLog;

  if Assigned(FLog) then
    api.OnLog := FLog;

  var
  err := '';

  //if not repo.conectar(repo.DataBasePath, 'REPL', 'masterkey', err) then
  if not repo.ConfigureStr(';userName=REPL;passWord=masterkey').conectar(err) then
  begin
    if err.ToUpper().Contains(UpperCase('Your user name and password are not defined')) then
    begin
      {
      repo.Banco.Params.Clear;
      repo.Banco.Params.Add('user_name=sysdba');
      repo.Banco.Params.Add('password=masterkey');
      }
      //deixando em branco la dentro vai pegar o padrao, sysdba
      if not repo.ConfigureStr('').conectar(repo.DataBasePath, False) then
        raise ExceptionApp.Create
          ('Usuário REPL não foi criado no banco de dados. Por favor contacte o supoerte técnico', D);

      repo.SqlExec('CREATE USER REPL PASSWORD ''masterkey''').Transaction.Commit();
      repo.desconectar;

      if not repo.ConfigureStr(';userName=REPL;passWord=masterkey').conectar(err) then
        raise Exception.Create(Format('Erro ao conectar com o banco de dados configurado: "%s" ' + sLineBreak +
          'Erro: %s', [repo.DataBasePath, err]));

    end
    else
      raise Exception.Create(Format('Erro ao conectar com o banco de dados configurado: "%s" ' + sLineBreak +
        'Erro: %s', [repo.DataBasePath, err]));
  end;

  if checkAllPrivileges then
    repo.CheckPrivileges();

  var url := repo.GetUrlApi;
  if url.Trim.IsEmpty() then
    raise Exception.Create('O sistema não conseguiu obter a URL da API');

  var
  userDb := repo.GetUserCredentials(caixaId);

  if (not Assigned(userDb)) or (userDb.code.Trim.IsEmpty) then
    raise Exception.Create(Format('Usuário não encontrado ou não configurado' + sLineBreak +
      'Empresa Id: %d' + sLineBreak +
      'Emissor Id: %d', [repo.CodEmpresa, caixaId]));

  api.InitApi(url, userDb.cnpj, userDb.code, userDb.empresaId, userDb.caixaId);

  repoLog := TRepoLog.Create(caixaId, userDb.cnpj);
  repoLog.OnError := repoLog_error_event;
  repo.repoLog := repoLog;
  api.repoLog  := repoLog;

//  if Assigned(FLog) then
//    api.Api.OnLog := FLog;

  api.Token := repo.GetToken; // talvez algum lugar pra assim que pegar um novo gravar, um evento

  Result := True;

end;

procedure TUseCaseBase.repoLog_error_event(Sender: TObject);
begin
  repo.SetDateError(caixaId);
end;

end.
