unit uClasseConexao;

interface

uses
{$IFNDEF DLL_AUDIT}
  {$IFNDEF VER180}
  hw_audit_utils,
  {$ENDIF}
{$ENDIF}
{$IFDEF VER180}
  IBQuery, IBSQL, IBDatabase, DBClient, Provider, DB, Math, Controls, Classes,
{$ELSE}
  IBX.IBDatabase, IBX.IBQuery, IBX.IBSQL, DataSnap.DBClient, DataSnap.Provider, Data.DB, System.Math, System.Classes, System.SysUtils,
{$ENDIF}
  Query_OOP,
  Types_OOP;

type
  TOptions_loopC      = set of (ol_storeRecno, ol_storeFilter, ol_disableControls, ol_filterClear_done, ol_go_first);

  TCriptografiaFDB = class;

  TConexao_OOP = class;

//  TQuery_OOP = Query_OOP.TQuery_OOP;

	TConexao = class
  private
		FQrAux: TIBQuery;
    FBanco: TIBDatabase;
    FTransacao: TIBTransaction;
    FiSQL: TIBSQL;
    FFreeDatabase: Boolean;
    Floggeral: string;
    FlogStore: LogStore;
    FClient: TConexao_OOP;
    FqueryCons: TQuery_OOP;
    {$IFNDEF DLL_AUDIT}
    {$IFNDEF VER180}
    FAuditor: TAudit_OOP;
    function GetAuditor: TAudit_OOP;
    {$ENDIF}
    {$ENDIF}
    function GetQueryCons: TQuery_OOP;
    function GetParamsDB(const Name: string): string;
    procedure SetParamsDB(const Name, Value: string);
  protected
    FCriptografia: TCriptografiaFDB;
    {$IFNDEF VER180}
    fmtSettings: TFormatSettings;
    {$ENDIF}
  public
    destructor Destroy; override;
    constructor Create; overload; virtual;
    constructor Create(AdataBase: TIBDatabase); overload;

    function conectar(pMensagemErro: Boolean): Boolean; overload;
    function conectar(databaseName: string; AMensagemErro: Boolean): Boolean; overload;
    function conectar(databaseName: string; userName, passWord: string; AMensagemErro: Boolean): Boolean; overload;
    function conectar(databaseName, userName, passWord: string; var Aerro: string): Boolean; overload;
    function conectar(var error: string): Boolean; overload;
    function conectar: Boolean; overload;
    function conectarPAF(pMensagemErro: Boolean): Boolean;
    function desconectar: Boolean;
    function GetTransaction(): TIBTransaction;
    //function Configure(dataBaseName: string; userName: string = ''; passWord: string = ''): TConexao; overload;
    function ConfigureStr(paramsList: string): TConexao;
    function getini(Asection, Aident, Adefault: string): string;
    {$IFDEF VER180} {$ELSE} class {$ENDIF}procedure registraErro(vMenserro: string);
    procedure LogError(Error: string); overload;
    procedure LogError(Error: string; const Args: array of const); overload;
    function SqlOpen(ASql: string; AQuery: TIBQuery = nil): TIBQuery; overload;
    function SqlOpen(ASql: string; const Args: array of const; AQuery: TIBQuery = nil): TIBQuery; overload;

    function SqlExec(ASql: string; sql: TIBSQL = nil): TIBSQL; overload;
    function SqlExec(ASql: string; const Args: array of const; sql: TIBSQL = nil): TIBSQL; overload;
    function SqlExecP(ASql: string; params: array of string; sql: TIBSQL = nil): TIBSQL; overload;
    function SqlExecP(ASql: string; const Args: array of const; params: array of string; sql: TIBSQL = nil): TIBSQL; overload;

    function SqlExec(ASql: string; AQuery: TIBQuery): TIBQuery; overload;
    function SqlExec(ASql: string; const Args: array of const; AQuery: TIBQuery): TIBQuery; overload;
    function SqlScalar(ASql: string; AQuery: TIBQuery = nil): ScalarValue; overload;
    function SqlScalar(ASql: string; const Args: array of const; AQuery: TIBQuery = nil): ScalarValue; overload;
    function NewClientOOP(ATransaction: TIBTransaction): TConexao_OOP; overload;
    function NewClientOOP(MemoryDataSet: TClientDataSet): TConexao_OOP; overload;
    function NewClientOOP(ASql: string = ''): TConexao_OOP; overload;
    function NewClientOOP(ASql: string; const Args: array of const): TConexao_OOP; overload;
    function ClientOOP(ASql: string = ''): TConexao_OOP; overload;
    function ClientOOP(ASql: string; const Args: array of const): TConexao_OOP; overload;
    {$IFNDEF DLL_AUDIT}
    {$IFNDEF VER180}
    procedure InitAuditor(usuario: string; cod_empresa: Integer);
    {$ENDIF}
    {$ENDIF}

    function SqlInsertID(Asql: string; AreturnField: string; AQuery: TIBQuery = nil): Integer; overload;
    function SqlInsertID(Asql: string; const Args: array of const; AreturnField: string; AQuery: TIBQuery = nil): Integer; overload;

    procedure logs(Atext, Afilename: string; Asingleline: Boolean = False; AtimeStart: TDateTime = 0);
    procedure logs_sl(Atext, Afilename: string; AtimeStart: TDateTime = 0);
    procedure logs_elapsed_time(Atext: string = '');

    procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: Double; ATipoData: Boolean = False; Nullable: Boolean = True); overload;
    procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: Integer; Nullable: Boolean = True); overload;
    procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: string; ALength: Integer; Nullable: Boolean = True; AUpper: Boolean = True); overload;
    procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: Boolean; TrueValue, FalseValue: string; ALength: Integer); overload;

    procedure SetParamVal(AFieldName: string; Value: Double; ATipoData: Boolean = False; Nullable: Boolean = True); overload;
    procedure SetParamVal(AFieldName: string; Value: Integer; Nullable: Boolean = True); overload;
    procedure SetParamVal(AFieldName: string; Value: string; ALength: Integer; Nullable: Boolean = True; AUpper: Boolean = True); overload;
    procedure SetParamVal(AFieldName: string; Value: Boolean; TrueValue, FalseValue: string; ALength: Integer); overload;

    function DateToStr_fb(Adate: TDateTime; AquoteStr: Boolean = True): string;
    function DateToTimeStr_fb(Adate: TDateTime; AquoteStr: Boolean = True): string;
    function FloatToStr_fb(Adouble: Double): string; overload;
    function VarToInt(Value: Variant; Default: Integer = 0): Integer;

    function float_fb(Adouble: Double): string;
    function date_fb(Adate: TDateTime; AquoteStr: Boolean = True): string;
    function datet_fb(AdateTime: TDateTime; AquoteStr: Boolean = True): string;
    function strq(Astr: string; Atrim: Boolean = True): string;

    property QrAux: TIBQuery read FQrAux write FQrAux;
    property iSQL: TIBSQL read FiSQL write FiSQL;
  	property Banco: TIBDatabase read FBanco write FBanco;
  	property Transacao: TIBTransaction read FTransacao write FTransacao;
    property Client: TConexao_OOP read FClient write FClient;
    property queryCons: TQuery_OOP read GetQueryCons write FqueryCons;
    property ParamsDB[const Name: string]: string read GetParamsDB write SetParamsDB;
    {$IFNDEF DLL_AUDIT}
    {$IFNDEF VER180}
    property Auditor: TAudit_OOP read GetAuditor write FAuditor;
    {$ENDIF}
    {$ENDIF}
  end;

	TCriptografiaFDB = class
  private
    fUser, fPassword, fEnderecoBanco, fEnderecoBancoPAF: string;
    FcharSet: string;
    procedure lerConfig;
    function StrZero(Num: string; Tam: Integer): string;
    function HexaToInt(valorHexa: string): Int64;
    procedure Inicializar;
  public
    constructor create;

    function getSenhaFDB: string;
    function getUsuarioFDB: string;
    function getEnderecoBanco: string;
    function getEnderecoBancoPAF: string;
    function criptografaTextoFDB(pTexto: string): string;
    function descriptografaTextoFDB(pTexto: string): string;

    property databaseName: string read fEnderecoBanco write fEnderecoBanco;
    property userName: string read fUser write fUser;
    property passWord: string read FpassWord write FpassWord;
    property charSet: string read FcharSet write FcharSet;

  end;


  {
  TQuery_OOP = class(TComponent)
  strict private
    FlogStore: LogStore;
    dataSet: TIBQuery;
    procedure logs(Atext, Afilename: string; Asingleline: Boolean = False; AtimeStart: TDateTime = 0);
  public
    constructor Create(query: TIBQuery);

    function IsEmpty: Boolean;
    function Eof: Boolean;
    function First: TQuery_OOP;
    function Next: TQuery_OOP;

    function fstr(Afield: string; Atrim: Boolean = True): string;
    function fint(Afield: string): Integer;
    function ffloat(Afield: string): Double; overload;
    function ffloat(Afield: string; const ADigit: TRoundToRange): Double; overload;
    function fdate(Afield: string): TDate;
    function fdatet(Afield: string): TDateTime;
    function fdif(Afield, Text: string; Atrim: Boolean = True): Boolean;
    function fequals(Afield, Text: string; Atrim: Boolean = True): Boolean;
    function fempty(Afield: string; Atrim: Boolean = True): Boolean;
    function fnull(Afield: string): Boolean;
    function fcopy(Afield: string; Index, Count: Integer): string; overload;
    function fcopy(Afield: string; Count: Integer): string; overload;

    function Open(ASql: string): TQuery_OOP; overload;
    function Open(ASql: string; const Args: array of const): TQuery_OOP; overload;

    property query: TIBQuery read dataSet write dataSet;
  end;
  }

  TConexao_OOP = class(TComponent)
  private
    FOwner            : TConexao;
    FDataSet          : TClientDataSet;
    FTransaction      : TIBTransaction;
    FDataSetProvideOOP: TDataSetProvider;
    FQueryOOP         : TIBQuery;
    FBuscas           : TIBQuery;
    FDataSourceOOP    : TDataSource;
    F_Free_Transaction: Boolean;
    FprepareOptions   : TOptions_loopC;
    Frecno            : Integer;
    Ffilter           : string;
    Ffiltered         : Boolean;

    procedure dataSetDBBeforeOpen(DataSet: TDataSet);
    procedure dataSetDBAfterOpen(DataSet: TDataSet);
    function GetText(const FieldName: string): string;
    procedure SetText(const FieldName, Value: string);
    function GetField(const FieldName: string): TField;
  protected
    function CreateDbComponents(AOwner: TConexao; ATransaction: TIBTransaction = nil; AMainDataSet: Boolean = True; AnameUnq: string = ''): Boolean; virtual;
  public
    constructor Create(); overload;
    constructor Create(MemoryDataSet: TClientDataSet); overload;
    constructor Create(AOwner: TConexao; ATransaction: TIBTransaction = nil; AMainDataSet: Boolean = True; AnameUnq: string = ''); overload;
    destructor Destroy; override;

    class function NewMemory_OOP(MemoryDataSet: TClientDataSet): TConexao_OOP;

    procedure CheckUnCheckRow(AFieldName: string = 'SEL');
    function CheckUnCheckAllRows(Acheck: Boolean; AFieldName: string = 'SEL'; Afilter: string = ''): TConexao_OOP;
    function Count: Integer;
    function Active: Boolean;
    function IsEmpty: Boolean;
    function Eof: Boolean;
    function Prior: TConexao_OOP;
    function First: TConexao_OOP;
    function Next: TConexao_OOP;
    function Last: TConexao_OOP;
    function Close: TConexao_OOP;
    function Edit: TConexao_OOP;
    function Post: TConexao_OOP;
    function Refresh: TConexao_OOP;

    procedure LogDataSet(logName: string = ''; resetFile: Boolean = False);
    procedure storeRecNo;
    procedure restoreRecNo;
    procedure storeFilter;
    procedure restoreFilter;
    procedure filterClear;
    function filterStr(Afilter: string): TConexao_OOP; overload;
    function filterStr(Afilter: string; const Args: array of const): TConexao_OOP; overload;

    function prepare_loop(Afilter: string = ''; Aoptions: TOptions_loopC = [ol_storeRecno, ol_storeFilter, ol_disableControls, ol_filterClear_done, ol_go_first]): TConexao_OOP; overload;
    function prepare_loop_fmt(Afilter: string; const ArgsFilter: array of const; Aoptions: TOptions_loopC = [ol_storeRecno, ol_storeFilter, ol_disableControls, ol_filterClear_done, ol_go_first]): TConexao_OOP; overload;
    function prepare_loop_done: TConexao_OOP;

    function ClientOpen(ASql: string; ADataSet: TClientDataSet = nil): TClientDataSet ; overload;
    function ClientOpen(ASql: string; const Args: array of const; ADataSet: TClientDataSet = nil): TClientDataSet; overload;

    function Open(ASql: string): TConexao_OOP ; overload;
    function Open(ASql: string; const Args: array of const): TConexao_OOP; overload;

    function fint(Afield: string): Integer;
    function fint64(Afield: string): Int64;
    function ffloat(Afield: string): Double; overload;
    function ffloat(Afield: string; const ADigit: TRoundToRange): Double; overload;
    function ffloat_fb(Afield: string): string; overload;
    function ffloat_fb(Adouble: Double): string; overload;
    function fdate(Afield: string): TDate;
    function fdatet(Afield: string): TDateTime;
    function fdate_fb(Afield: string; AquoteStr: Boolean = True): string;
    function fdatet_fb(Afield: string; AquoteStr: Boolean = True): string;
    function retirar_zeros_esquerda(Afield: string): string;

    function fstr(Afield: string; Atrim: Boolean = True): string; overload;
    function fstr(Afield: string; index, count: Integer; atrim: Boolean = True): string; overload;
    function fstrdate(Afield: string; const formato: string = 'DD/MM/YYYY'): string;
    function fstrq(Afield: string; Atrim: Boolean = True): string; overload;
    function fstrq(Afield: string; Index, Count: Integer; Atrim: Boolean = True): string; overload;
    function str_empty(Afield: string; Atrim: Boolean = True): Boolean;
    function fdif(Afield, Text: string; Atrim: Boolean = True): Boolean;
    function fequals(Afield, Text: string; Atrim: Boolean = True): Boolean;
    function fempty(Afield: string; Atrim: Boolean = True): Boolean;
    function fnull(Afield: string): Boolean;
    function fcopy(Afield: string; Index, Count: Integer): string; overload;
    function fcopy(Afield: string; Count: Integer): string; overload;
    function fcontainst(Afield: string; const ASubText: string): Boolean;
    function finsideof(Afield: string; const AText: string): Boolean;
    function fmatchStr(const Afield: string; const AValues: array of string): Boolean;
    function fmatchText(const Afield: string; const AValues: array of string): Boolean;

    property Text[const FieldName: string]: string read GetText write SetText;
    property Field[const FieldName: string]: TField read GetField;

    property DataSet          : TClientDataSet   read FDataSet           write FDataSet;
    property Transaction      : TIBTransaction   read FTransaction       write FTransaction;
    property DataSetProvideOOP: TDataSetProvider read FDataSetProvideOOP write FDataSetProvideOOP;
    property QueryOOP         : TIBQuery         read FQueryOOP          write FQueryOOP;
    property DataSourceOOP    : TDataSource      read FDataSourceOOP     write FDataSourceOOP;
    property FbCon            : TConexao         read FOwner;

  end;

implementation

uses
  hw_utils, hw_win_utils,
{$IFDEF VER180}
  Forms, SysUtils, IniFiles, Variants, DateUtils, StrUtils;
{$ELSE}
  Vcl.Forms,  System.IniFiles, System.Variants,System.DateUtils, System.StrUtils;
{$ENDIF}

{ TConexao }

function TConexao.conectar(pMensagemErro: Boolean): Boolean;
var
  userName: string;
  passWord: string;
begin
  try
    userName := FCriptografia.getUsuarioFDB;
    passWord := FCriptografia.getSenhaFDB;

    FBanco.Connected := False;

    if (userName <> '') then
      FBanco.Params.Values['user_name'] := FCriptografia.descriptografaTextoFDB(userName);
      //FBanco.Params[0] := 'user_name=' + FCriptografia.descriptografaTextoFDB(userName);
    if (passWord <> '') then
      FBanco.Params.Values['password'] := FCriptografia.descriptografaTextoFDB(passWord);
      //FBanco.Params[1] := 'password=' + FCriptografia.descriptografaTextoFDB(passWord);

    FBanco.DatabaseName := FCriptografia.getEnderecoBanco;

    FBanco.Connected := True;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      if pMensagemErro then
        Application.MessageBox(PChar('Não foi possivel conectar ao banco de dados. Erro: ' + e.Message),'Atenção' , 0 + 64);
    end;
  end;
end;

function TConexao.NewClientOOP(ASql: string): TConexao_OOP;
begin
  Result := TConexao_OOP.Create(Self);
  if Trim(ASql) <> '' then
    Result.ClientOpen(ASql);
//
//  SetLength(ListConexaoOOP, Length(ListConexaoOOP) + 1);
//  ListConexaoOOP[High(ListConexaoOOP)] := Result;
end;

function TConexao.NewClientOOP(ASql: string; const Args: array of const): TConexao_OOP;
begin
  Result := NewClientOOP(Format(ASql, Args));
end;

function TConexao.NewClientOOP(ATransaction: TIBTransaction): TConexao_OOP;
begin
  Result := TConexao_OOP.Create(Self, ATransaction);
end;

function TConexao.ClientOOP(ASql: string;
  const Args: array of const): TConexao_OOP;
begin
  Result := ClientOOP(Format(ASql, Args));
end;

function TConexao.ClientOOP(ASql: string): TConexao_OOP;
begin
  Result := FClient;
  FClient.ClientOpen(ASql);
end;

function TConexao.conectar: Boolean;
begin
  try
    FBanco.Connected := False;
    FBanco.Connected := True;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TConexao.conectar(databaseName, userName, passWord: string;
  AMensagemErro: Boolean): Boolean;
begin
  try
    FBanco.Connected := False;

    if UpperCase(userName) = 'SYSDBA' then
      FBanco.Params.Values['user_name'] := 'SYSDBA'
    else if UpperCase(userName) = 'REPL' then
      FBanco.Params.Values['user_name'] := 'REPL'
    else
    begin
      if (userName <> '') then
        FBanco.Params.Values['user_name'] := FCriptografia.descriptografaTextoFDB(userName);
    end;
      //FBanco.Params[0] := 'user_name=' + FCriptografia.descriptografaTextoFDB(userName);
    if (LowerCase(passWord) = 'masterkey') then
      FBanco.Params.Values['password'] := 'masterkey'
    else
    begin
      if (passWord <> '') then
        FBanco.Params.Values['password'] := FCriptografia.descriptografaTextoFDB(passWord);
    end;
      //FBanco.Params[1] := 'password=' + FCriptografia.descriptografaTextoFDB(passWord);

    FBanco.DatabaseName := databaseName;

    FBanco.Connected := True;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      if AMensagemErro then
        Application.MessageBox(PChar('Não foi possivel conectar ao banco de dados. Erro: ' + e.Message),'Atenção' , 0 + 64);
    end;
  end;
end;

function TConexao.conectar(var error: string): Boolean;
begin
  try
    FBanco.Connected := False;
    FBanco.Connected := True;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      error := E.Message;
    end;
  end;
end;

function TConexao.conectar(databaseName: string; AMensagemErro: Boolean): Boolean;
var
  userName: string;
  passWord: string;
begin
  try
    userName := FCriptografia.getUsuarioFDB;
    passWord := FCriptografia.getSenhaFDB;

    FBanco.Connected := False;

    if (userName <> '') then
      FBanco.Params.Values['user_name'] := FCriptografia.descriptografaTextoFDB(userName);
      //FBanco.Params[0] := 'user_name=' + FCriptografia.descriptografaTextoFDB(userName);
    if (passWord <> '') then
      FBanco.Params.Values['password'] := FCriptografia.descriptografaTextoFDB(passWord);
      //FBanco.Params[1] := 'password=' + FCriptografia.descriptografaTextoFDB(passWord);

    FBanco.DatabaseName := databaseName;

    FBanco.Connected := True;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      if AMensagemErro then
        Application.MessageBox(PChar('Não foi possivel conectar ao banco de dados. Erro: ' + e.Message),'Atenção' , 0 + 64);
    end;
  end;
end;

function TConexao.conectar(databaseName, userName, passWord: string;
  var Aerro: string): Boolean;
begin
  try
    FBanco.Connected := False;

    if userName <> '' then
      FBanco.Params.Values['user_name'] := userName;

    if passWord <> '' then
      FBanco.Params.Values['password'] := passWord;

    if databaseName <> '' then
      FBanco.DatabaseName := databaseName;

    FBanco.Connected := True;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      Aerro := E.Message;
    end;
  end;
end;

function TConexao.conectarPAF(pMensagemErro: Boolean): Boolean;
var
  vPw, vUs: string;
begin
  try
    vUs := FCriptografia.getUsuarioFDB;
    vPw := FCriptografia.getSenhaFDB;

    FBanco.Connected := False;

    if (vUs <> '') then
      FBanco.Params[0] := 'user_name=' + FCriptografia.descriptografaTextoFDB(vUs);
    if (vPw <> '') then
      FBanco.Params[1] := 'password=' + FCriptografia.descriptografaTextoFDB(vPw);

    FBanco.DatabaseName := FCriptografia.getEnderecoBancoPAF;

    FBanco.Connected := True;
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      if pMensagemErro then
        Application.MessageBox(PChar('Não foi possivel conectar ao banco de dados. Erro: ' + e.Message),'Atenção' , 0 + 64);
    end;
  end;
end;

constructor TConexao.Create;
begin
  Create(nil);
end;

{function TConexao.Configure(dataBaseName, userName,
  passWord: string): TConexao;
begin
  Result := Self;

  if userName = '' then
    userName := FCriptografia.getUsuarioFDB;

  if passWord = '' then
    passWord := FCriptografia.getSenhaFDB;

  FBanco.Connected := False;

  if (userName <> '') then
    FBanco.Params[0] := 'user_name=' + FCriptografia.descriptografaTextoFDB(userName);
  if (passWord <> '') then
    FBanco.Params[1] := 'password=' + FCriptografia.descriptografaTextoFDB(passWord);

  FBanco.DatabaseName := dataBaseName;
end;    }

function TConexao.ConfigureStr(paramsList: string): TConexao;
var
  databaseName: string;
  userName    : string;
  passWord    : string;
  charSet     : string;
  splitStr    : string;
  logGeral    : string;
  params      : TStrings;
begin
  Result := Self;

  if paramsList <> '' then
  begin
    splitStr := Copy(paramsList, 1, 1);
    if OnlyNumberAndLetters(splitStr, '') = splitStr then
      raise Exception.Create('TConexao.ConfigureStr. Primeiro caracter do paramsList deve ser o split para a string de parametros');
  end;

  params       := NewStringList(Copy(paramsList, 2, Length(paramsList)), splitStr);
  databaseName := Trim(params.Values['databaseName']);
  userName     := Trim(params.Values['userName']);
  passWord     := Trim(params.Values['passWord']);
  charSet      := Trim(params.Values['charSet']);
  logGeral     := Trim(params.Values['loggeral']);

  if logGeral <> '' then
    Floggeral := logGeral;

  if userName = '' then
    userName := FCriptografia.descriptografaTextoFDB(FCriptografia.getUsuarioFDB);

  if passWord = '' then
    passWord := FCriptografia.descriptografaTextoFDB(FCriptografia.getSenhaFDB);

  FBanco.Connected := False;

  if (userName <> '') then
    FBanco.Params.Values['user_name'] := userName;
  if (passWord <> '') then
    FBanco.Params.Values['password'] := passWord;
  if (charSet <> '') then
    FBanco.Params.Values['lc_ctype'] := charSet;
  if (databaseName <> '') then
    FBanco.DatabaseName := dataBaseName;
end;

constructor TConexao.Create(AdataBase: TIBDatabase);
begin
  if Assigned(AdataBase) then
  begin
    FFreeDatabase := False;
  	FBanco := TIBDatabase(AdataBase);
  end
  else
  begin
    FFreeDatabase := True;
  	FBanco := TIBDatabase.Create(Application);
  end;

  FCriptografia := TCriptografiaFDB.create;

  FTransacao := TIBTransaction.Create(Application);
  FTransacao.DefaultDatabase := FBanco;
  FTransacao.Params.Add('read_committed');
  FTransacao.Params.Add('rec_version');
  FTransacao.Params.Add('nowait');

  if not Assigned(AdataBase) then
  begin
    FBanco.Connected := False;
    FBanco.DefaultTransaction := FTransacao;
    FBanco.LoginPrompt := false;
    FBanco.Params.Add('user_name=sysdba');
    FBanco.Params.Add('password=masterkey');
    if FCriptografia.databaseName <> '' then
      FBanco.DatabaseName := FCriptografia.databaseName;
    if (FCriptografia.userName <> '') then
      FBanco.Params.Values['user_name'] := FCriptografia.userName;
    if (FCriptografia.passWord <> '') then
      FBanco.Params.Values['password'] := FCriptografia.passWord;
    if (FCriptografia.charSet <> '') then
      FBanco.Params.Values['lc_ctype'] := FCriptografia.charSet;
  end;

  FQrAux := TIBQuery.Create(Application);
  FQrAux.Database := FBanco;
  FQrAux.Transaction := FTransacao;

  FiSQL := TIBSQL.Create(Application);
  FiSQL.Database := FBanco;
  FiSQL.Transaction := FTransacao;

  FClient := TConexao_OOP.Create(Self, FTransacao);

  {$IFNDEF VER180}
  fmtSettings                     := TFormatSettings.Create;
  fmtSettings.DecimalSeparator    := ',';
  fmtSettings.ThousandSeparator   := '.';
  fmtSettings.CurrencyDecimals    := 2;
  fmtSettings.DateSeparator       := '/';
  fmtSettings.ShortDateFormat     := 'dd/MM/yyyy';
  //fmtSettings.LongDateFormat      := 'dddd, d'' de ''MMMM'' de ''yyyy';
  fmtSettings.TimeSeparator       := ':';
  fmtSettings.TimeAMString        := 'AM';
  fmtSettings.TimePMString        := 'PM';
  fmtSettings.ShortTimeFormat     := 'hh:nn';
  fmtSettings.LongTimeFormat      := 'hh:nn:ss';
  fmtSettings.CurrencyString      := 'R$';
  {$ENDIF}

  Floggeral := getini('Sistema', 'Loggeral', 'N');
end;

function TConexao.DateToStr_fb(Adate: TDateTime; AquoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD', Adate);
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function TConexao.DateToTimeStr_fb(Adate: TDateTime;
  AquoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD hh:mm:ss', Adate);
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function TConexao.desconectar: Boolean;
begin
  try
    if FBanco.Connected then
      FBanco.Connected := False;
    if FBanco.Connected then
      FBanco.ForceClose;

    Result := True;
  except on E: Exception do
  begin
    Result := False;
  end;
  end;
end;

destructor TConexao.Destroy;
var
  I: Integer;
begin
  if FFreeDatabase then
    if Assigned(FBanco) then
    begin
      Self.desconectar;

      FreeAndNil(FBanco);
    end;
  FreeAndNil(FTransacao);
  FreeAndNil(FQrAux);
  FreeAndNil(FiSQL);
  FreeAndNil(FCriptografia);

  {$IFNDEF DLL_AUDIT}
  {$IFNDEF VER180}
  if Assigned(FAuditor) then
    FAuditor.Free;
  {$ENDIF}
  {$ENDIF}

  if Assigned(FqueryCons) then
    FreeAndNil(FqueryCons);

//  for I := Low(ListConexaoOOP) to High(ListConexaoOOP) do
//    if Assigned(ListConexaoOOP[I]) then
//      if ListConexaoOOP[I].FConexao_OOPName <> 'nil' then
//        ListConexaoOOP[I].Free;

  inherited;
end;

function TConexao.datet_fb(AdateTime: TDateTime;
  AquoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD hh:mm:ss', AdateTime);
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function TConexao.date_fb(Adate: TDateTime; AquoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD', Adate);
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function TConexao.float_fb(Adouble: Double): string;
begin
  Result := StringReplace(Format('%0.14f', [Adouble]), ',', '.', []);
  if Result <> '' then
    while Result[Length(Result)] = '0' do
      System.Delete(Result, Length(Result), 1);
  if Result[Length(Result)] = '.' then
    System.Delete(Result, Length(Result), 1);
end;

{$IFNDEF DLL_AUDIT}
{$IFNDEF VER180}
function TConexao.GetAuditor: TAudit_OOP;
begin
  if not Assigned(FAuditor) then
    FAuditor := TAudit_OOP.Create;

  Result := FAuditor;
end;

procedure TConexao.InitAuditor(usuario: string; cod_empresa: Integer);
begin
  if Assigned(FAuditor) then
    FAuditor.Free;

  Auditor := TAudit_OOP.Create(usuario, cod_empresa, FBanco);
end;
{$ENDIF}
{$ENDIF}

function TConexao.FloatToStr_fb(Adouble: Double): string;
begin
  Result := StringReplace(Format('%0.14f', [Adouble]), ',', '.', []);
  if Result <> '' then
    while Result[Length(Result)] = '0' do
      System.Delete(Result, Length(Result), 1);
  if Result[Length(Result)] = '.' then
    System.Delete(Result, Length(Result), 1);
end;

function TConexao.strq(Astr: string; Atrim: Boolean): string;
begin
  Result := QuotedStr(Astr);
end;

function TConexao.VarToInt(Value: Variant; Default: Integer): Integer;
begin
  try
    if (VarIsEmpty(Value)) or (Value = Null) then
      Result := 0
    else
      Result := Value;
  except
    Result := 0;
  end;
end;

function TConexao.getini(Asection, Aident, Adefault: string): string;
var
  ArqIni: string;
  ArqConfig: TiniFile;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
  if not FileExists(ArqIni) then
    ArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
  try
    try
      ArqConfig := TIniFile.Create(ArqIni);
      Result := ArqConfig.ReadString(Asection, Aident, Adefault);
    finally
      ArqConfig.Free;
    end;
  except
  end;
end;

function TConexao.GetParamsDB(const Name: string): string;
begin
  Result := Banco.Params.Values[Name];
  if (Result = '') and (LowerCase(Name) = 'charset') then
    Result := Banco.Params.Values['lc_ctype'];
  if (Result = '') and (LowerCase(Name) = 'username') then
    Result := Banco.Params.Values['user_name'];
  if (Result = '') and (LowerCase(Name) = 'databasename') then
    Result := Banco.DatabaseName;
  if (Result = '') and (LowerCase(Name) = 'connectionstring') then
    Result := Format(';databaseName=%s;userName=%s;passWord=%s;charSet=%s',
                     [Banco.DatabaseName,
                      Banco.Params.Values['user_name'],
                      Banco.Params.Values['password'],
                      Banco.Params.Values['lc_ctype']]);
end;

function TConexao.GetQueryCons: TQuery_OOP;
begin
  if not Assigned(FqueryCons) then
    FqueryCons := QueryHelper.CreateObj(QrAux);
  
  Result := FqueryCons;
end;

function TConexao.GetTransaction: TIBTransaction;
begin
  Result := FTransacao;
end;

procedure TConexao.LogError(Error: string);
var
  FileText: TextFile;
  FileName: string;
  Text: string;
begin
  try
    FileName := ExtractFilePath(Application.Exename) + 'erros.log';
    AssignFile(FileText, FileName);
    if not FileExists(FileName) then
      Rewrite(FileText)
    else
      Append(FileText);
    Text := 'ERRO: ' + Error + ' Data ' + DateTimeToStr(Now);
    WriteLn(FileText, Text);
    CloseFile(FileText);
  except
  end;
end;

procedure TConexao.LogError(Error: string; const Args: array of const);
begin
  LogError(Format(Error, Args));
end;

procedure TConexao.logs(Atext, Afilename: string; Asingleline: Boolean;
  AtimeStart: TDateTime);
var
  Afile: TextFile;
  Adir, Alogname, Atimestr: string;
begin
  if IndexText(Floggeral, ['S', 'D']) < 0 then
    Exit;

  FlogStore.filename   := Afilename;
  FlogStore.timeStarted := Now;  

  try
    Atimestr := '';
    if AtimeStart > 0 then
    begin
      if (Now - AtimeStart) >= 1  then
      begin
        Atimestr := IntToStr(Trunc(Now - AtimeStart));
        AtimeStart := (Now - AtimeStart) - Trunc(Now - AtimeStart);
        Atimestr := Atimestr + ' dia(s) ' + FormatDateTime('hh:mm:ss.zzz', AtimeStart);
      end
      else
        Atimestr := FormatDateTime('hh:mm:ss.zzz', Now - AtimeStart);
    end;

    Alogname := ExtractFileName(Afilename);
    if Floggeral = 'S' then //Simplificado, Unico arquivo, com o nome da classe
      if Pos('.', Afilename) > 0 then
        System.Delete(Afilename, Pos('.', Afilename), Length(Afilename));

    Adir := ExtractFilePath(Application.ExeName) + 'log\' +
            FormatDateTime('YYYY-MM-DD', Date) + '\';

    ForceDirectories(ExtractFilePath(Adir));

    Afilename := Adir + '\' + Afilename + '.log';

    AssignFile(Afile, Afilename);
    if FileExists(Afilename) then
      Append(Afile)
    else
      Rewrite(Afile);
    if not Asingleline then
    begin
      if Atimestr <> '' then
        Writeln(Afile, Format('/*[%s] {%s} (%s)*/', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atimestr]))
      else
        Writeln(Afile, Format('/*[%s] {%s}*/', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname]));
      Writeln(Afile, Atext);
    end
    else if Atimestr <> '' then
      Writeln(Afile, Format('/*[%s] {%s} (%s)*/ %s', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atimestr, Atext]))
    else
      Writeln(Afile, Format('/*[%s] {%s}*/ %s', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atext]));
    CloseFile(Afile);

  except on E: Exception do
    begin
      registraErro('TSingleton.logs ' + E.Message);
    end;
  end;
end;

procedure TConexao.logs_elapsed_time(Atext: string);
begin
  logs_sl(Atext, FlogStore.filename, FlogStore.timeStarted);
end;

procedure TConexao.logs_sl(Atext, Afilename: string; AtimeStart: TDateTime);
begin
  logs(Atext, Afilename, True, AtimeStart);
end;

function TConexao.NewClientOOP(
  MemoryDataSet: TClientDataSet): TConexao_OOP;
begin
  Result := TConexao_OOP.Create(MemoryDataSet);
end;

{$IFDEF VER180} {$ELSE}  class {$ENDIF}procedure TConexao.registraErro(vMenserro: string);
var
  Arq: TextFile;
  NomeArq: string;
  auxstr: string;
begin
  try
    Nomearq := ExtractFilePath(Application.Exename) + 'erros.log';
    AssignFile(Arq, NomeArq);
    if not FileExists(NomeArq) then
      Rewrite(arq)
    else
      append(arq);
    auxstr := 'ERRO: ' + vmenserro + ' Dia: ' + datetostr(date) +
      ' Hora: ' + timetostr(time);
    WriteLn(arq, auxstr);
    closeFile(arq);
  except
  end;
end;

function TConexao.SqlExec(ASql: string; AQuery: TIBQuery): TIBQuery;
begin
  logs(ASql, Self.ClassName + '.SqlExec');

  if AQuery = nil then
    AQuery := FQrAux;

  AQuery.Close;
  AQuery.SQL.Text := ASql;
  if not AQuery.Prepared then
    AQuery.Prepare;
  AQuery.ExecSQL;

  Result := AQuery;

  logs_elapsed_time();
end;

function TConexao.SqlOpen(ASql: string; AQuery: TIBQuery): TIBQuery;
begin
  logs(ASql, Self.ClassName + '.SqlOpen');

  if AQuery = nil then
    AQuery := FQrAux;

  AQuery.Close;
  AQuery.SQL.Text := ASql;
  AQuery.Open;

  Result := AQuery;

  logs_elapsed_time();
end;

procedure TConexao.SetParamVal(AQuery: TIBQuery; AFieldName: string;
  Value: Integer; Nullable: Boolean);
begin
  if (Value = 0) and (Nullable) then
    AQuery.ParamByName(AFieldName).Value := Unassigned
  else
    AQuery.ParamByName(AFieldName).Value := Value;
end;

procedure TConexao.SetParamVal(AQuery: TIBQuery; AFieldName: string;
  Value: Double; ATipoData, Nullable: Boolean);
begin
  if (Value = 0) and (Nullable) then
    AQuery.ParamByName(AFieldName).Value := Unassigned
  else if ATipoData then
    AQuery.ParamByName(AFieldName).AsDateTime := DateOf(Value) + TimeOf(Value)
  else
    AQuery.ParamByName(AFieldName).AsFloat := Value;
end;

procedure TConexao.SetParamVal(AQuery: TIBQuery; AFieldName: string;
  Value: Boolean; TrueValue, FalseValue: string; ALength: Integer);
begin
  AQuery.ParamByName(AFieldName).AsString := Copy(string(IfThen(Value, TrueValue, FalseValue)), 1, ALength);
end;

procedure TConexao.SetParamVal(AQuery: TIBQuery; AFieldName, Value: string;
  ALength: Integer; Nullable, AUpper: Boolean);
begin
  if AUpper then
    Value := UpperCase(Value);
  if (Value = '') and (Nullable) then
    AQuery.ParamByName(AFieldName).Value := Unassigned
  else
    AQuery.ParamByName(AFieldName).AsString := Copy(Value, 1, ALength);
end;

function TConexao.SqlExec(ASql: string; const Args: array of const;
  AQuery: TIBQuery): TIBQuery;
begin
  Result := SqlExec(Format(ASql, Args), AQuery);
end;

function TConexao.SqlExecP(ASql: string; const Args: array of const;
  params: array of string; sql: TIBSQL): TIBSQL;
begin
  Result := SqlExecP(Format(ASql, Args), params, sql);
end;

function TConexao.SqlExecP(ASql: string; params: array of string;
  sql: TIBSQL): TIBSQL;
var
  I: Integer;
begin
  logs(ASql, Self.ClassName + '.SqlExecP TIBSQL');

  if sql = nil then
    sql := iSQL;

  if not sql.Transaction.InTransaction then
    sql.Transaction.StartTransaction;

  sql.Close;
  sql.SQL.Text := ASql;
  for I := Low(params) to High(params) do
    sql.Params[I].AsString := params[I];

  if not sql.Prepared then
    sql.Prepare;
  sql.ExecQuery;

  Result := sql;

  logs_elapsed_time();
end;

function TConexao.SqlExec(ASql: string; const Args: array of const;
  sql: TIBSQL): TIBSQL;
begin
  Result := SqlExec(Format(ASql, Args), sql);
end;

function TConexao.SqlExec(ASql: string; sql: TIBSQL): TIBSQL;
begin
  logs(ASql, Self.ClassName + '.SqlExec TIBSQL');

  if sql = nil then
    sql := iSQL;

  if not sql.Transaction.InTransaction then
    sql.Transaction.StartTransaction;

  sql.Close;
  sql.SQL.Text := ASql;
  if not sql.Prepared then
    sql.Prepare;
  sql.ExecQuery;

  Result := sql;

  logs_elapsed_time();
end;

function TConexao.SqlInsertID(Asql: string; const Args: array of const;
  AreturnField: string; AQuery: TIBQuery): Integer;
begin
  Result := SqlInsertID(Format(ASql, Args), AreturnField, AQuery);
end;

function TConexao.SqlInsertID(Asql: string; AreturnField: string;
  AQuery: TIBQuery): Integer;
begin
  Result := 0;
  try
    Asql := Format('select id from sp_sql_insert(%s, %s)', [QuotedStr(Asql), QuotedStr(AreturnField)]);
  except on E: Exception do
    begin
      logs(ASql, Self.ClassName + '.SqlInsertID-ERRO Format');
      Exit;
    end;
  end;

  logs(ASql, Self.ClassName + '.SqlInsertID');

  if AQuery = nil then
    AQuery := FQrAux;

  AQuery.Close;
  AQuery.SQL.Text := Asql;// Format('select id from sp_sql_insert(%s, %s)', [QuotedStr(Asql), QuotedStr(AreturnField)]);
  AQuery.Open;

  logs_elapsed_time();

  Result := AQuery.FieldByName('id').AsInteger;

  AQuery.Close;
end;

function TConexao.SqlOpen(ASql: string; const Args: array of const;
  AQuery: TIBQuery): TIBQuery;
begin
  Result := SqlOpen(Format(ASql, Args), AQuery);
end;

function TConexao.SqlScalar(ASql: string; const Args: array of const;
  AQuery: TIBQuery): ScalarValue;
begin
  Result := SqlScalar(Format(Asql, Args), AQuery);
end;

function TConexao.SqlScalar(ASql: string; AQuery: TIBQuery): ScalarValue;
begin
  with SqlOpen(ASql, AQuery) do
  begin
    Result.Value := Fields[0].Value;
    Result.AsString := Fields[0].AsString;
    {$IFNDEF VER180}
    if Fields[0].DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftShortint, ftLargeint, ftExtended, ftSingle, ftAutoInc] then
    {$ELSE}
    if Fields[0].DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftLargeint, ftAutoInc] then
    {$ENDIF}
    begin
      Result.AsInteger  := Fields[0].AsInteger;
      Result.AsFloat    := Fields[0].AsFloat;
      Result.AsCurrency := Fields[0].AsCurrency;
    end;
    if Fields[0].DataType in [ftDateTime, ftDate, ftTime] then
    begin
      Result.AsDateTime := Fields[0].AsDateTime;
      Result.AsDate := DateOf(Fields[0].AsDateTime);
      Result.AsDateTime := TimeOf(Fields[0].AsDateTime);
    end;
  end;
end;

procedure TConexao.SetParamVal(AFieldName: string; Value: Integer;
  Nullable: Boolean);
begin
  SetParamVal(FQrAux, AFieldName, Value, Nullable);
end;

procedure TConexao.SetParamVal(AFieldName: string; Value: Double; ATipoData,
  Nullable: Boolean);
begin
  SetParamVal(FQrAux, AFieldName, Value, ATipoData, Nullable);
end;

procedure TConexao.SetParamsDB(const Name, Value: string);
var
  pName: string;
begin
  pName := Trim(LowerCase(Name));
  if (pName = 'charset') then
    pName := 'lc_ctype';
  if (pName = 'username') then
    pName := 'user_name';

  if (pName = 'databasename') then
    Banco.DatabaseName := Value
  else if (pName = 'connectionstring') then
    ConfigureStr(Value)
  else
   Banco.Params.Values[pName] := Value;
end;

procedure TConexao.SetParamVal(AFieldName: string; Value: Boolean; TrueValue,
  FalseValue: string; ALength: Integer);
begin
  SetParamVal(FQrAux, AFieldName, Value, TrueValue, FalseValue, ALength);
end;

procedure TConexao.SetParamVal(AFieldName, Value: string; ALength: Integer;
  Nullable, AUpper: Boolean);
begin
  SetParamVal(FQrAux, AFieldName, Value, ALength, Nullable, AUpper);
end;

{ TCriptografiaFDB }

constructor TCriptografiaFDB.create;
begin
  Inicializar;
end;

function TCriptografiaFDB.criptografaTextoFDB(pTexto: string): string;
var
  vAsc : Byte;
  i : Integer;
  vTxt, vTxt1, vTxt2, vTxtF, vHW: string;
  J: Integer;
begin
  if Trim(pTexto) = '' then
  begin
    Result := '';
    Exit;
  end;

  try

    vTxt := '';
    for i := 1 to Length(Trim(pTexto)) do
    begin
      vAsc := Ord(Trim(pTexto)[i]);

      vTxt := vTxt  + StrZero(IntToStr(vAsc),3);

    end;

    I:= 0;
    vTxtF:= '';

    repeat
      i := I + 1;
      vTxt1 := Trim(Copy(vTxt, i, 1));
      vTxt2 := Trim(Copy(vTxt, i + 1, 1));

      if (Trim(vTxt1) <> '') and (Trim(vTxt2) <> '') then
        vTxtF := vTxtF + vTxt2 + vTxt1
      else if (Trim(vTxt1) <> '') then
        vTxtF := vTxtF + vTxt1;

      i := I + 1;
    until (i >= Length(vTxt));

    vTxt := vTxtF;

    vTxt1 := copy(vTxt, 1, Trunc(Length(vTxt)/2));
    vTxt2 := copy(vTxt, Trunc(Length(vTxt)/2) + 1, Length(vTxt) );

    vTxtF := '';
    I := Length(vTxt2);
    while I > 0 do
    begin
      vTxtF := vTxtF + vTxt2[I];
      I := I - 1;
    end;

    I := Length(vTxt1);
    while I > 0 do
    begin
      vTxtF := vTxtF + vTxt1[I];
      I := I - 1;
    end;

    vTxt := vTxtF;
    vTxtF := '';
    if Trunc(Length(vTxt)/9) = (Length(vTxt)/9) then
      J := Trunc(Length(vTxt)/9)
    else
      J:= Trunc((Length(vTxt)/9) + 1);
    for I := 1 to J do
    begin
      Randomize;
      if (Random(10) mod 2) = 0 then
        vHW := 'W'
      else
        vHW := 'H';

      vTxt1 := IntToHex(StrToInt64(Copy(vTxt,1,9)), 20) + vHW + IntToStr(Length(Trim(Copy(vTxt,1,9))));
      while vTxt1[1] = '0' do
        vTxt1 := copy(vTxt1, 2, Length(vTxt1));

      vTxtF := vTxtF + vTxt1;
      vTxt := copy(vTxt,10,Length(vTxt));
    end;
    Result := vTxtF;
  except
    Result := '';
  end;
end;

function TCriptografiaFDB.descriptografaTextoFDB(pTexto: string): string;
var
  i : Integer;
  vTxt, vTxt1, vTxt2, vTxtF: string;
  J: Integer;
begin
  if Trim(pTexto) = '' then
  begin
    Result := '';
    Exit;
  end;

  try

    vTxt := pTexto;
    vTxtF := '';
    J := -1;
    while J <> 0 do
    begin
      J := pos('H', vTxt);
      if (pos('W', vTxt) < J) or (J = 0) then
        if pos('W', vTxt) <> 0 then
          J := pos('W', vTxt);

      vTxtF := vTxtF + strzero(IntToStr(HexaToInt(copy(vTxt, 1, J - 1))), StrToInt(Copy(vTxt,j+1,1)));
      vTxt := copy(vTxt, J + 2, Length(vTxt));
      if Trim(vTxt) = '' then
        J := 0;
    end;

    vTxt := vTxtF;

    if (Length(vTxt) mod 2) = 0 then
    begin
      vTxt1 := copy(vTxt, 1, Trunc(Length(vTxt)/2));
      vTxt2 := copy(vTxt, Trunc(Length(vTxt)/2) + 1, Length(vTxt) );
    end
    else
    begin
      vTxt1 := copy(vTxt, 1, Trunc(Length(vTxt)/2)+1);
      vTxt2 := copy(vTxt, Trunc(Length(vTxt)/2) + 2, Length(vTxt) );
    end;

    vTxtF := '';
    I := Length(vTxt2);
    while I > 0 do
    begin
      vTxtF := vTxtF + vTxt2[I];
      I := I - 1;
    end;

    I := Length(vTxt1);
    while I > 0 do
    begin
      vTxtF := vTxtF + vTxt1[I];
      I := I - 1;
    end;

    vTxt := vTxtF;

    I:= 0;
    vTxtF:= '';


    repeat
      i := I + 1;
      vTxt1 := Trim(Copy(vTxt, i, 1));
      vTxt2 := Trim(Copy(vTxt, i + 1, 1));

      if (Trim(vTxt1) <> '') and (Trim(vTxt2) <> '') then
        vTxtF := vTxtF + vTxt2 + vTxt1
      else if (Trim(vTxt1) <> '') then
        vTxtF := vTxtF + vTxt1;

      i := I + 1;
    until (i >= Length(vTxt));

    vTxt := vTxtF;

    vTxtF := '';
    while vTxt <> '' do
    begin

      vTxt1 := Copy(vTxt, 1, 3);
      vTxt1 := Chr(StrToInt(vTxt1));
      vTxtF := vTxtF + vTxt1;
      vTxt := Copy(vTxt, 4, Length(vTxt));
    end;

    Result := vTxtF;
  except
    Result := '';
  end;
end;

function TCriptografiaFDB.getEnderecoBanco: string;
begin
  lerConfig;
  Result := Trim(fEnderecoBanco);
end;

function TCriptografiaFDB.getEnderecoBancoPAF: string;
begin
  lerConfig;
  Result := Trim(fEnderecoBancoPAF);
end;

function TCriptografiaFDB.getSenhaFDB: string;
begin
  lerConfig;
  Result := Trim(fPassword);
end;

function TCriptografiaFDB.getUsuarioFDB: string;
begin
  lerConfig;
  Result := Trim(fUser);
end;

function TCriptografiaFDB.HexaToInt(valorHexa: string): Int64;
begin
  Result := StrToInt64(IntToStr(StrToInt('$' + valorHexa)));
end;

procedure TCriptografiaFDB.Inicializar;
begin
  lerConfig;
  if fPassword <> '' then
    fPassword := descriptografaTextoFDB(fPassword);
  if fUser <> '' then
    fUser := descriptografaTextoFDB(fUser);
end;

procedure TCriptografiaFDB.lerConfig;
var
  ArqIni: string;
  ArqConfig: TiniFile;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
  if not FileExists(ArqIni) then
    ArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
  try
    ArqConfig := TIniFile.Create(ArqIni);
    fEnderecoBanco := ArqConfig.ReadString('Banco', 'HW', '');
    fEnderecoBancoPAF := ArqConfig.ReadString('Banco', 'Fiscal', '');
    fUser := ArqConfig.ReadString('Banco', 'FBU', '');
    fPassword := ArqConfig.ReadString('Banco', 'FBP', '');
    FcharSet := ArqConfig.ReadString('Banco', 'CharSet', '');
  finally
    ArqConfig.Free;
  end;
end;

function TCriptografiaFDB.StrZero(Num: string; Tam: Integer): string;
var
  I: Integer;
  V1: string;
begin
  V1 := Trim(Num);
  for I := 1 to Tam - Length(V1) do V1 := '0' + V1;
  Result := V1;
end;

{ TConexao_OOP }

constructor TConexao_OOP.Create();
begin
  FDataSet           := TClientDataSet.Create(Application);
  FTransaction       := TIBTransaction.Create(Application);
  FDataSetProvideOOP := TDataSetProvider.Create(Application);
  FQueryOOP          := TIBQuery.Create(Application);
  FBuscas            := TIBQuery.Create(Application);
  FDataSourceOOP     := TDataSource.Create(Application);
  F_Free_Transaction := False;
  Frecno             := -1;
  Ffiltered          := False;
  Ffilter            := '';
  Randomize;
  Name               := 'OOP' + StringReplace(FormatDateTime('DDMMYYYYhhmmsszzz', Now) + IntToStr(Random(99999)), '/', '', [rfReplaceAll]);
  FDataSet.PacketRecords := 1000;
end;

function TConexao_OOP.ClientOpen(ASql: string;
  ADataSet: TClientDataSet): TClientDataSet;
begin
  FOwner.logs(ASql, Self.ClassName + '.ClientOpen');

  if ADataSet = nil then
    ADataSet := FDataSet;

  ADataSet.Close;
  ADataSet.CommandText := ASql;
  ADataSet.Open;

  Result := ADataSet;

  FOwner.logs_elapsed_time();
end;

function TConexao_OOP.Active: Boolean;
begin
  Result := DataSet.Active;
end;

function TConexao_OOP.CheckUnCheckAllRows(Acheck: Boolean; AFieldName,
  Afilter: string): TConexao_OOP;
var
  ArecNo: Integer;
begin
  Result := Self;
  if not DataSet.Active then
    Exit;

  if DataSet.IsEmpty then
    Exit;

  ArecNo := DataSet.RecNo;

  try
    DataSet.DisableControls;
    if Afilter <> '' then
    begin
      DataSet.Filter   := Afilter;
      DataSet.Filtered := True;
    end;

    DataSet.First;
    while not DataSet.Eof do
    begin
      DataSet.Edit;
      DataSet.FieldByName(AFieldName).AsString := IfThen(Acheck, 'S', '');
      DataSet.Post;
      DataSet.Next;
    end;

  finally
    if Afilter <> '' then
      filterClear;
    DataSet.RecNo := ArecNo;
    DataSet.EnableControls;
  end;
end;

procedure TConexao_OOP.CheckUnCheckRow(AFieldName: string);
begin
  DataSet.Edit;
  DataSet.FieldByName(AFieldName).AsString := IfThen(fequals(AFieldName, 'S'), '', 'S');
  DataSet.Post;
end;

function TConexao_OOP.ClientOpen(ASql: string; const Args: array of const;
  ADataSet: TClientDataSet): TClientDataSet;
begin
  Result := ClientOpen(Format(ASql, Args), ADataSet);
end;

function TConexao_OOP.Close: TConexao_OOP;
begin
  Result := Self;
  DataSet.Close;
end;

function TConexao_OOP.Count: Integer;
begin
  Result := DataSet.RecordCount;
end;

constructor TConexao_OOP.Create(AOwner: TConexao;
  ATransaction: TIBTransaction; AMainDataSet: Boolean; AnameUnq: string);
var
  Rand: Integer;
begin
  Randomize;
  if Trim(AnameUnq) = '' then
  begin
    Rand := Random(99999);
    AnameUnq := '_dataset' + StringReplace(FormatDateTime('DD/MM/YYYY hh:mm:ss zzz', Now), '/', '', [rfReplaceAll]);
    AnameUnq := StringReplace(AnameUnq, ':', '', [rfReplaceAll]);
    AnameUnq := StringReplace(AnameUnq, ' ', '', [rfReplaceAll]) + IntToStr(Rand);
  end;
  Name       := 'OOP' + StringReplace(FormatDateTime('DDMMYYYYhhmmsszzz', Now) + IntToStr(Random(99999)), '/', '', [rfReplaceAll]);

  inherited Create(AOwner.Banco);
  FDataSet := TClientDataSet.Create(AOwner.Banco);
  FDataSet.name := AnameUnq;
  CreateDbComponents(AOwner, ATransaction, AMainDataSet, AnameUnq);
end;

constructor TConexao_OOP.Create(MemoryDataSet: TClientDataSet);
var
  Rand: Integer;
  AnameUnq: string;
begin
  if MemoryDataSet.Owner = nil then
    raise Exception.Create('MemoryDataSet Owner = nil');

  Randomize;
  if Trim(AnameUnq) = '' then
  begin
    Rand := Random(99999);
    AnameUnq := '_dataset' + StringReplace(FormatDateTime('DD/MM/YYYY hh:mm:ss zzz', Now), '/', '', [rfReplaceAll]);
    AnameUnq := StringReplace(AnameUnq, ':', '', [rfReplaceAll]);
    AnameUnq := StringReplace(AnameUnq, ' ', '', [rfReplaceAll]) + IntToStr(Rand);
  end;

  inherited Create(MemoryDataSet.Owner);
  Name := 'OOP' + StringReplace(FormatDateTime('DDMMYYYYhhmmsszzz', Now) + IntToStr(Random(99999)), '/', '', [rfReplaceAll]);
  FDataSet := MemoryDataSet;
  FDataSet.name := AnameUnq;

  FDataSourceOOP := TDataSource.Create(MemoryDataSet.Owner);
  FDataSourceOOP.DataSet := FDataSet;
  fDataSourceOOP.AutoEdit := False;

  FDataSet.BeforeOpen := dataSetDBBeforeOpen;
  FDataSet.AfterOpen  := dataSetDBAfterOpen;
end;

function TConexao_OOP.CreateDbComponents(AOwner: TConexao;
  ATransaction: TIBTransaction; AMainDataSet: Boolean;
  AnameUnq: string): Boolean;
var
  AComponentName: string;
begin
  try
    FOwner := AOwner;
    Randomize;

    if ATransaction = nil then
    begin
      FTransaction := TIBTransaction.Create(FDataSet.Owner);
      FTransaction.DefaultDatabase := AOwner.Banco;
      FTransaction.Params.Clear;
      FTransaction.Params.Add('read_committed');
      FTransaction.Params.Add('rec_version');
      FTransaction.Params.Add('nowait');
      F_Free_Transaction := True;
    end
    else
      FTransaction := AOwner.Transacao;

    FBuscas := TIBQuery.Create(FDataSet.Owner);
    FBuscas.Database := AOwner.Banco;
    FBuscas.Transaction := FTransaction;

    FQueryOOP := TIBQuery.Create(FDataSet.Owner);
    FQueryOOP.Database := AOwner.Banco;
    FQueryOOP.Transaction := FTransaction;

    FDataSetProvideOOP := TDataSetProvider.Create(FDataSet.Owner);
    FDataSetProvideOOP.Options := [poAllowCommandText, poUseQuoteChar];
    FDataSetProvideOOP.DataSet := FQueryOOP;
    FDataSetProvideOOP.UpdateMode := upWhereChanged;

    AComponentName:= 'DSP_' + Self.ClassName + '_' + IntToStr(Random(100000));
    while FDataSet.Owner.FindComponent( AComponentName) <> nil do
      AComponentName := 'Provider' + IntToStr(Random(100000));
    FDataSetProvideOOP.Name := AComponentName;

    FDataSet.ProviderName := FDataSetProvideOOP.Name;

    FDataSourceOOP := TDataSource.Create(FDataSet.Owner);
    FDataSourceOOP.DataSet := FDataSet;
    FDataSourceOOP.AutoEdit := False;

    FDataSet.BeforeOpen := dataSetDBBeforeOpen;
    FDataSet.AfterOpen  := dataSetDBAfterOpen;

    Result := True;
  except
    on e: exception do
    begin
      Result := False;
      raise Exception.Create('CreateDbComponents: ' + e.Message);
    end;
  end;
end;

procedure TConexao_OOP.dataSetDBAfterOpen(DataSet: TDataSet);
var
  I: integer;
  Adisplay: string;
begin
  for I := 0 to DataSet.Fields.Count - 1 do with DataSet.Fields[I] do
  begin
    Adisplay     := Trim(StringReplace(LowerCase(FieldName), '_', ' ', [rfReplaceAll, rfIgnoreCase]));
    DisplayLabel := UpperCase(Copy(Adisplay, 1, 1)) + Copy(Adisplay, 2, Length(Adisplay));
  end;
end;

procedure TConexao_OOP.dataSetDBBeforeOpen(DataSet: TDataSet);
var
  I: integer;
  AOwner: TComponent;
begin
  if TClientDataSet(DataSet).CommandText <> '' then
  begin
    AOwner := DataSet.Owner;
    for I := 0 to AOwner.ComponentCount - 1 do
    begin
      if (AOwner.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(AOwner.Components[i]).Name) = UpperCase(TClientDataSet(DataSet).ProviderName) then
        begin
          TIBQuery(TDataSetProvider(AOwner.Components[i]).DataSet).SQL.Text := TClientDataSet(DataSet).CommandText;
          Break;
        end;
    end;
  end;
end;

destructor TConexao_OOP.Destroy;
begin
  if dataset <> nil then
    if dataset.Active then
      DataSet.close;

  inherited;
end;

function TConexao_OOP.Edit: TConexao_OOP;
begin
  Result := Self;
  DataSet.Edit;
end;

function TConexao_OOP.Eof: Boolean;
begin
  Result := DataSet.Eof;
end;

function TConexao_OOP.fcopy(Afield: string; Index, Count: Integer): string;
begin
  Result := Copy(fstr(Afield), Index, Count);
end;

function TConexao_OOP.fcontainst(Afield: string;
  const ASubText: string): Boolean;
begin
  Result := ContainsText(fstr(Afield), ASubText);
end;

function TConexao_OOP.fcopy(Afield: string; Count: Integer): string;
begin
  Result := fcopy(Afield, 1, Count);
end;

function TConexao_OOP.fdate(Afield: string): TDate;
begin
  Result := DateOf(dataSet.FieldByName(Afield).AsDateTime);
end;

function TConexao_OOP.fstr(Afield: string; index, count: Integer;
  atrim: Boolean): string;
begin
  Result := Copy(fstr(Afield, atrim), index, count);
end;

function TConexao_OOP.fstrdate(Afield: string;
  const formato: string): string;
begin
  Result := FormatDateTime(formato, fdatet(Afield));end;

function TConexao_OOP.fdatet(Afield: string): TDateTime;
begin
  Result := dataSet.FieldByName(Afield).AsDateTime;
end;

function TConexao_OOP.fdatet_fb(Afield: string; AquoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD hh:mm:ss', fdatet(Afield));
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function TConexao_OOP.fdate_fb(Afield: string; AquoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD', fdate(Afield));
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function TConexao_OOP.fdif(Afield, Text: string; Atrim: Boolean): Boolean;
begin
  Result := not fequals(Afield, Text, Atrim);
end;

function TConexao_OOP.fempty(Afield: string; Atrim: Boolean): Boolean;
begin
  Result := fstr(Afield, Atrim) = '';
end;

function TConexao_OOP.fequals(Afield, Text: string; Atrim: Boolean): Boolean;
begin
  Result := fstr(Afield, Atrim) = IfThen(Atrim, Trim(Text), Text);
end;

function TConexao_OOP.ffloat(Afield: string;
  const ADigit: TRoundToRange): Double;
begin
  Result := RoundTo(dataSet.FieldByName(Afield).AsFloat, ADigit);
end;

function TConexao_OOP.ffloat(Afield: string): Double;
begin
  Result := dataSet.FieldByName(Afield).AsFloat;
end;

function TConexao_OOP.ffloat_fb(Adouble: Double): string;
begin
  Result := StringReplace(Format('%0.14f', [Adouble]), ',', '.', []);
  if Result <> '' then
    while Result[Length(Result)] = '0' do
      System.Delete(Result, Length(Result), 1);
  if Result[Length(Result)] = '.' then
    System.Delete(Result, Length(Result), 1);
end;

function TConexao_OOP.ffloat_fb(Afield: string): string;
begin
  Result := ffloat_fb(ffloat(Afield));
end;

procedure TConexao_OOP.filterClear;
begin
  dataSet.Filtered := False;
  dataSet.Filter := '';
end;

function TConexao_OOP.filterStr(Afilter: string;
  const Args: array of const): TConexao_OOP;
begin
  Result := filterStr(Format(Afilter, Args));
end;

function TConexao_OOP.filterStr(Afilter: string): TConexao_OOP;
begin
  Result := Self;
  dataSet.Filter := Afilter;
  dataSet.Filtered := True;
end;

function TConexao_OOP.fint(Afield: string): Integer;
begin
  Result := dataSet.FieldByName(Afield).AsInteger;
end;

function TConexao_OOP.fint64(Afield: string): Int64;
begin
  Result := dataSet.FieldByName(Afield).AsInteger;
end;

function TConexao_OOP.First: TConexao_OOP;
begin
  Result := Self;
  DataSet.First;
end;

function TConexao_OOP.fmatchStr(const Afield: string;
  const AValues: array of string): Boolean;
begin
  Result := MatchStr(fstr(Afield), AValues);
end;

function TConexao_OOP.fnull(Afield: string): Boolean;
begin
  Result := dataSet.FieldByName(Afield).IsNull;
end;

function TConexao_OOP.fstr(Afield: string; Atrim: Boolean): string;
begin
  Result := dataSet.FieldByName(Afield).AsString;
  if Atrim then
    Result := Trim(Result);
end;

function TConexao_OOP.fstrq(Afield: string; Index, Count: Integer;
  Atrim: Boolean): string;
begin
  Result := QuotedStr(Copy(fstr(Afield, Atrim), Index, Count));
end;

function TConexao_OOP.GetField(const FieldName: string): TField;
begin
  Result := DataSet.FieldByName(FieldName);
end;

function TConexao_OOP.GetText(const FieldName: string): string;
begin
  Result := DataSet.FieldByName(FieldName).AsString;
end;

function TConexao_OOP.finsideof(Afield: string;
  const AText: string): Boolean;
begin
  Result := ContainsText(AText, fstr(Afield));
end;

function TConexao_OOP.IsEmpty: Boolean;
begin
  Result := DataSet.IsEmpty;
end;

function TConexao_OOP.Last: TConexao_OOP;
begin
  Result := Self;
  DataSet.Last;
end;

procedure TConexao_OOP.LogDataSet(logName: string;
  resetFile: Boolean);
var
  I: Integer;
  logValues: string;
begin
  logName := IfThen(trim(logName) = '', Self.DataSet.Name, trim(logName));
  logValues := '';
  if resetFile then
  begin
    for I := 0 to Self.DataSet.FieldCount - 1 do
      logValues := logValues + IfThen(logValues <> '', ',') + Self.DataSet.Fields[i].FieldName;
    LogApp.Log(logName, logValues, False, resetFile);
  end;

  if DataSet.Active and (DataSet.RecordCount > 0) then
  begin
    logValues := '';
    for I := 0 to Self.DataSet.FieldCount - 1 do
      logValues := logValues + IfThen(logValues <> '', ';') + Self.DataSet.Fields[i].AsString;
    LogApp.Log(logName, logValues, False, resetFile);
  end;
end;

function TConexao_OOP.fmatchText(const Afield: string;
  const AValues: array of string): Boolean;
begin
  Result := MatchText(fstr(Afield), AValues);
end;

class function TConexao_OOP.NewMemory_OOP(MemoryDataSet: TClientDataSet): TConexao_OOP;
//var
//  Rand: Integer;
//  AnameUnq: string;
begin
  Result := TConexao_OOP.Create(MemoryDataSet);

//  if MemoryDataSet.Owner = nil then
//    raise Exception.Create('MemoryDataSet Owner = nil');
//
//  Randomize;
//  if Trim(AnameUnq) = '' then
//  begin
//    Rand := Random(99999);
//    AnameUnq := '_dataset' + StringReplace(FormatDateTime('DD/MM/YYYY hh:mm:ss zzz', Now), '/', '', [rfReplaceAll]);
//    AnameUnq := StringReplace(AnameUnq, ':', '', [rfReplaceAll]);
//    AnameUnq := StringReplace(AnameUnq, ' ', '', [rfReplaceAll]) + IntToStr(Rand);
//  end;
//
//  Result := TConexao_OOP.Create(MemoryDataSet.Owner);
//  Result.Name := 'OOP' + StringReplace(FormatDateTime('DDMMYYYYhhmmsszzz', Now) + IntToStr(Random(99999)), '/', '', [rfReplaceAll]);
//  Result.DataSet := MemoryDataSet;
//  Result.DataSet.name := AnameUnq;
//
//  Result.DataSourceOOP := TDataSource.Create(MemoryDataSet.Owner);
//  Result.DataSourceOOP.DataSet := Result.DataSet;
//  Result.DataSourceOOP.AutoEdit := False;
//
//  FDataSet.BeforeOpen := dataSetDBBeforeOpen;
//  Result.DataSet.AfterOpen  := dataSetDBAfterOpen;

end;

function TConexao_OOP.Next: TConexao_OOP;
begin
  Result := Self;
  DataSet.Next;
end;

function TConexao_OOP.Open(ASql: string;
  const Args: array of const): TConexao_OOP;
begin
  Result := Open(Format(ASql, Args));
end;

function TConexao_OOP.Post: TConexao_OOP;
begin
  Result := Self;
  DataSet.Post;
end;

function TConexao_OOP.Open(ASql: string): TConexao_OOP;
begin
  Result := Self;
  FOwner.logs(ASql, Self.ClassName + '.' + Self.DataSet.Name + '.ClientOpen');

  Self.DataSet.Close;
  Self.DataSet.CommandText := ASql;
  Self.DataSet.Open;

  FOwner.logs_elapsed_time();
end;

function TConexao_OOP.prepare_loop(Afilter: string;
  Aoptions: TOptions_loopC): TConexao_OOP;
begin
  Result := Self;
  FprepareOptions := Aoptions;

  if ol_storeRecno in FprepareOptions then
    storeRecNo;

  if ol_storeFilter in FprepareOptions then
    storeFilter;

  if ol_disableControls in FprepareOptions then
    dataSet.DisableControls;

  if Trim(Afilter) <> '' then
    filterStr(Afilter);

  if ol_go_First in FprepareOptions then
    dataSet.First;
end;

function TConexao_OOP.prepare_loop_done: TConexao_OOP;
begin
  Result := Self;

  if ol_filterClear_done in FprepareOptions then
    filterClear
  else if ol_storeFilter in FprepareOptions then
    restoreFilter;

  if ol_storeRecno in FprepareOptions then
    restoreRecNo;

  if ol_disableControls in FprepareOptions then
    dataSet.EnableControls;
end;

function TConexao_OOP.prepare_loop_fmt(Afilter: string;
  const ArgsFilter: array of const; Aoptions: TOptions_loopC): TConexao_OOP;
begin
  Result := prepare_loop(Format(Afilter, ArgsFilter), Aoptions);
end;

function TConexao_OOP.Prior: TConexao_OOP;
begin
  Result := Self;
  DataSet.Prior;
end;

function TConexao_OOP.Refresh: TConexao_OOP;
begin
  Result := Self;
  DataSet.CancelUpdates;
  DataSet.Refresh;
end;

procedure TConexao_OOP.restoreFilter;
begin
  dataSet.Filter := Ffilter;
  dataSet.Filtered := Ffiltered;
end;

procedure TConexao_OOP.restoreRecNo;
begin
  if (Frecno > 0) and (Frecno <= dataSet.RecordCount) then
    dataSet.RecNo := Frecno;
end;

function TConexao_OOP.retirar_zeros_esquerda(Afield: string): string;
var
  i: Integer;
  ZERO_ESQ: string;
  vval: string;
begin
  i := 0;
  RESULT := '';
  vval := trim(Afield);

  while (i < Length(vval)) do
  begin
    if ((Copy(vval, i + 1, 1) = '0') and (TRIM(Result) = '')) then
        Result := Result
    else
        Result := Result + Copy(vval, i + 1, 1);
    i := i + 1;
  end
end;

procedure TConexao_OOP.SetText(const FieldName, Value: string);
begin
  DataSet.FieldByName(FieldName).AsString := Value;
end;

function TConexao_OOP.fstrq(Afield: string; Atrim: Boolean): string;
begin
  Result := QuotedStr(fstr(Afield, Atrim));
end;

procedure TConexao_OOP.storeFilter;
begin
  Ffilter   := dataSet.Filter;
  Ffiltered := dataSet.Filtered;
end;

procedure TConexao_OOP.storeRecNo;
begin
  if (not dataSet.IsEmpty) and (dataSet.RecordCount > 0) then
    Frecno := dataSet.RecNo
  else
    Frecno := -1;
end;

function TConexao_OOP.str_empty(Afield: string; Atrim: Boolean): Boolean;
begin
  Result := fstr(Afield, Atrim) = '';
end;

{ TQuery_OOP }
{
function TQuery_OOP.fcopy(Afield: string; Index, Count: Integer): string;
begin
  Result := Copy(fstr(Afield), Index, Count);
end;

constructor TQuery_OOP.Create(query: TIBQuery);
begin
  dataSet := query;
end;

function TQuery_OOP.Eof: Boolean;
begin
  Result := DataSet.Eof;
end;

function TQuery_OOP.fcopy(Afield: string; Count: Integer): string;
begin
  Result := fcopy(Afield, 1, Count);
end;

function TQuery_OOP.fdate(Afield: string): TDate;
begin
  Result := DateOf(dataSet.FieldByName(Afield).AsDateTime);
end;

function TQuery_OOP.fdatet(Afield: string): TDateTime;
begin
  Result := dataSet.FieldByName(Afield).AsDateTime;
end;

function TQuery_OOP.fdif(Afield, Text: string; Atrim: Boolean): Boolean;
begin
  Result := not fequals(Afield, Text, Atrim);
end;

function TQuery_OOP.fempty(Afield: string; Atrim: Boolean): Boolean;
begin
  Result := fstr(Afield, Atrim) = '';
end;

function TQuery_OOP.fequals(Afield, Text: string; Atrim: Boolean): Boolean;
begin
  Result := fstr(Afield, Atrim) = IfThen(Atrim, Trim(Text), Text);
end;

function TQuery_OOP.ffloat(Afield: string;
  const ADigit: TRoundToRange): Double;
begin
  Result := RoundTo(dataSet.FieldByName(Afield).AsFloat, ADigit);
end;

function TQuery_OOP.ffloat(Afield: string): Double;
begin
  Result := dataSet.FieldByName(Afield).AsFloat;
end;

function TQuery_OOP.fint(Afield: string): Integer;
begin
  Result := dataSet.FieldByName(Afield).AsInteger;
end;

function TQuery_OOP.First: TQuery_OOP;
begin
  Result := Self;
  DataSet.First;
end;

function TQuery_OOP.fnull(Afield: string): Boolean;
begin
  Result := dataSet.FieldByName(Afield).IsNull;
end;

function TQuery_OOP.fstr(Afield: string; Atrim: Boolean): string;
begin
  Result := dataSet.FieldByName(Afield).AsString;
  if Atrim then
    Result := Trim(Result);
end;

function TQuery_OOP.IsEmpty: Boolean;
begin

end;

procedure TQuery_OOP.logs(Atext, Afilename: string; Asingleline: Boolean;
  AtimeStart: TDateTime);
begin

end;

function TQuery_OOP.Next: TQuery_OOP;
begin
  Result := Self;
  DataSet.Next;
end;

function TQuery_OOP.Open(ASql: string; const Args: array of const): TQuery_OOP;
begin
  Result := Self.Open(Format(ASql, Args));
end;

function TQuery_OOP.Open(ASql: string): TQuery_OOP;
begin
  logs(ASql, Self.ClassName + '.Open');

  dataSet.Close;
  dataSet.SQL.Text := ASql;
  dataSet.Open;

  Result := Self;

  logs('', FlogStore.filename, True, FlogStore.timeStarted);
end;

}

end.
