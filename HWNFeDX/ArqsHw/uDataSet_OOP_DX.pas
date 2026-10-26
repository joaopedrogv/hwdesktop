unit uDataSet_OOP_DX;

interface

uses
  Vcl.StdCtrls, System.SysUtils, Vcl.Controls, IBX.IBDatabase, IBX.IBQuery,
  IBX.IBStoredProc, Datasnap.DBClient, System.Math;

type
  // Clsse TDataSet_OOP, implementação de metodos e eventos na classe.
  TDataSet_OOP_DX = class(TObject)
  private
    FDataSet: TClientDataSet;
    FTransacao: TIBTransaction;
    FBuscas: TIBQuery;
    function GetIndexFieldNames: string;
    procedure SetIndexFieldNames(const Value: string);
  protected
//    function reconectaEmBaseLocal(E: Exception): boolean;
//    function reconectaNoServidor(E: Exception): boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function Active: Boolean;
    function Apply: Boolean; virtual;
    function Cancel: Boolean; virtual;
    function CancelUpdates: Boolean; virtual;
    function Close: Boolean; virtual;
    function Refresh: Boolean; virtual;
    function Delete: Boolean; virtual;
    function Edit: Boolean; virtual;
    function Insert: Boolean; virtual;
    function Next: Boolean; virtual;
    function Open: Boolean; virtual;
    function Post: Boolean; virtual;
    function Prior: Boolean; virtual;
    function First: Boolean; virtual;
    function Last: Boolean; virtual;
    function Bof: Boolean; virtual;
    function Eof: Boolean; virtual;
    function IsEmpty: Boolean; virtual;
    procedure FindNearest(const KeyValues: array of const);
    property dataSet: TClientDataSet read FDataSet write FDataSet;
    property transacao: TIBTransaction read FTransacao write FTransacao;
    property buscas: TIBQuery read FBuscas write FBuscas;
    property IndexFieldNames: string read GetIndexFieldNames write SetIndexFieldNames;
    function tirapontos(vdados: string; CasaDecimal: Integer): string;
    function Gencodigo(Tabela: string; buscas: TIBQuery; codemp: string): integer; overload;
    function Gencodigo(Tabela: string; procedureCodigo: TIBStoredProc; codemp: string): integer; overload;
    function Cpf(Num: string): boolean;
    function cgc(Num: string): boolean;
    function montaSelect(sqlComandos: string): boolean; overload;
    function montaSelect(sqlComandos: string; dataIni, dataFim: TDate): boolean; overload;
    function ExecutaComandosSql(comandosSql: string): boolean;
    function ExecutaComandosSqlExec(comandosSql: string): boolean;
    function IniciaTransacao: boolean;
    function CommitaTransacao: Boolean;
    function emTransacao: boolean;
    procedure RollBackTransacao;
    procedure RetornaAtributos(Vcomb: Tcombobox; vcombord: TCombobox);
    function ConsultaCampos(tabela, valorConsulta, Campo, condicao, ordem: string; constante:
      boolean; codemp: string;vtipo: string;vtpnfe: string): boolean; overload; virtual;
    function ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim: string; codemp: string;vtipo: string;vtpnfe: string):
      boolean; overload; virtual;
    function ConsultaCampos(tabela, valorConsulta, Campo, condicao, ordem, sqlAdicional: string;
      constante:
      boolean; codemp: string;vtipo: string;vtpnfe: string): boolean; overload; virtual;
    function ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim, sqlAdicional: string; codemp:
      string;vtipo: string;vtpnfe: string):
      boolean; overload; virtual;
    procedure registraErro(vMenserro: string);
    function retornaValor(comandosSql: string): string;
   function FPontoFlutuante(valor: currency; casadecimal: integer): string;
   function getDataBanco(query: TIBQuery;vusserv: string): TDate;
   function getDataHoraBanco(query: TIBQuery;vusserv: string): TDateTime;
   function StrZero(Num, Tam: Integer): string; overload;
   function StrZero(Num: string; Tam: Integer): string; overload;
   function conectaBanco: boolean;
   function DesconectaBanco: boolean;
   function trocaVirgulaPorPonto(valor: string): string;
   procedure CopyQuery(var AQuery, ACopia: TIBQuery);
   function CreateProcessSimple(Acmd: string; Await: Boolean = False): Boolean;
   function SqlOpen(ASql: string; AQuery: TIBQuery = nil): TIBQuery;
   function SqlExec(ASql: string; AQuery: TIBQuery = nil): TIBQuery;
   function apenasNumeros(ATexto: string): string;
    function RetiraCarEsp(Str: String): String;

    function fstr(Afield: string; Atrim: Boolean = True): string;
    function fstrNotEsp(Afield: string; Atrim: Boolean = True): string;
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

  var
    inibeErro: string;
    vbanco: Tibdatabase;
    vcaminhobanco: string;
  end;

implementation

uses
  Vcl.Forms, Vcl.Dialogs, Winapi.Windows, Data.DB, System.DateUtils, System.StrUtils;

function __getSenhaFDB_DX: WideString; stdcall; external 'cons40.dll';
function __getUsuarioFDB_DX: WideString; stdcall; external 'cons40.dll';
function __descriptografaTextoFDB_DX(pTexto: WideString): Widestring; stdcall; external 'cons40.dll';

constructor TDataSet_OOP_DX.Create;
begin
  //
end;

function TDataSet_OOP_DX.CreateProcessSimple(Acmd: string; Await: Boolean): Boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  SUInfo.cb := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := SW_SHOW;

  Result := CreateProcess(nil, PChar(Acmd), nil, nil, false, CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS, nil, nil, SUInfo, ProcInfo);

  if (Result) then
  begin
    if Await then
      WaitForSingleObject(ProcInfo.hProcess, INFINITE)
    else
      WaitForSingleObject(ProcInfo.hProcess, 0);
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function TDataSet_OOP_DX.conectaBanco: boolean;
var
  vPw, vUs: string;
begin
 try
    vUs := __getUsuarioFDB_DX;
    vPw := __getSenhaFDB_DX;
    vbanco.Connected := false;
    if (Trim(vUs) <> '') then
      vbanco.Params[0] := 'user_name=' + __descriptografaTextoFDB_DX(vUs);
    if (Trim(vPw) <> '') then
      vbanco.Params[1] := 'password=' + __descriptografaTextoFDB_DX(vPw);
    vbanco.DatabaseName := vcaminhobanco;
    try
      vbanco.Connected := true;
    except on e: exception do
      begin
        if application.messagebox('Erro ao conectar banco. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          Application.MessageBox(pchar(E.Message),Pchar('Error'), MB_OK);
      end;
    end;
  finally
    Result := vbanco.Connected;
  end;
end;

function TDataSet_OOP_DX.DesconectaBanco: boolean;
begin
  try
    vbanco.Connected := false;
  finally
    Result := not vbanco.Connected;
  end;
end;

destructor TDataSet_OOP_DX.Destroy;
begin
  if dataset.Active then
    DataSet.close;
end;

function TDataSet_OOP_DX.apenasNumeros(ATexto: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to (Length(ATexto)) do
    if Pos(ATexto[I], '0123456789') > 0 then
      Result := Result + ATexto[I];
end;

function TDataSet_OOP_DX.Apply: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := true;
  try
    if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
    begin
      if DataSet.ApplyUpdates(-1) > 0 then
      begin
        Result := false;
        raise Exception.Create('Alguns dados não foram salvos');
      end;
    end
    else
      result := false;
  except
    on E: Exception do
    begin
      MessageDlg('E0001 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0001 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDataSet_OOP_DX.Cancel: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Cancel
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.CancelUpdates: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
      DataSet.CancelUpdates
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.Close: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Close
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.Delete: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := False;
  try
    if (DataSet <> nil) and (DataSet.Active) then
    begin
      if (DataSet.RecordCount > 0) then
      begin
        DataSet.Delete;
        Result := True;
      end;
    end;
  except
    on E: Exception do
    begin
      MessageDlg('E0002 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0002 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDataSet_OOP_DX.Edit: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) and (DataSet.State = dsBrowse)
      {//and (not DataSet.IsEmpty)}then
      DataSet.Edit
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.emTransacao: boolean;
begin
  Result := transacao.InTransaction;
end;

function TDataSet_OOP_DX.Insert: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Insert
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.IsEmpty: Boolean;
begin
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      Result := DataSet.IsEmpty
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.Next: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Next
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.Open: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (not DataSet.Active) then
      DataSet.Open
    else
      Result := False;
  except
    on E: Exception do
    begin
      Result := False;
      registraErro('E0003' + e.Message);
    end;
  end;
end;

function TDataSet_OOP_DX.Post: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  try
    Result := True;
    if (DataSet <> nil) and (DataSet.State in [dsInsert, dsEdit]) then
      DataSet.Post
    else
      result := false;
  except
    on E: Exception do
    begin
      MessageDlg('E0004 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0004 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDataSet_OOP_DX.Prior: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Prior
    else
      Result := False;
  except
    Result := False;
  end;
end;



function TDataSet_OOP_DX.Refresh: Boolean;
begin
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Refresh
    else
      Result := False;
  except
    Result := False;
  end;
end;

procedure TDataSet_OOP_DX.registraErro(vMenserro: string);
var
  Arq: TextFile;
  NomeArq: string;
  auxstr: string;
begin
  //jp  if vDadosIniF.vGravaErros = 'S' then
  begin
    Nomearq := ExtractFilePath(Application.Exename) + 'erros.log';
    AssignFile(Arq, NomeArq);
    if not FileExists(NomeArq) then
      Rewrite(arq)
    else
      append(arq);
    auxstr := 'ERRO: ' + vmenserro + ' Dia: ' + datetostr(date) +
      ' Hora: ' + timetostr(time) + ' FISCAL';
    WriteLn(arq, auxstr);
    closeFile(arq);
  end;
end;

function TDataSet_OOP_DX.Last: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Last
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.montaSelect(sqlComandos: string; dataIni,
  dataFim: TDate): boolean;
begin
  try
    Close;
    dataSet.CommandText := sqlComandos;
    dataSet.Params[0].AsDate := dataIni;
    dataSet.Params[1].AsDate := dataFim;
    Open;
    result := true;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('E0014 Erro ao executar comandos sql.' + #13 + 'Comandos: ' + sqlComandos + #13 +
        'Erro: ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0014 ' + sqlComandos + ' ' + e.Message);
    end;
  end;
end;

function TDataSet_OOP_DX.montaSelect(sqlComandos: string): boolean;
begin
  try
    Close;
    dataSet.CommandText := sqlComandos;
    result := Open;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('E0013 Erro ao executar comandos sql.' + #13 + 'Comandos: ' + sqlComandos + #13 +
        'Erro: ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0013 ' + sqlComandos + ' ' + e.Message);
    end;
  end;
end;

procedure TDataSet_OOP_DX.FindNearest(const KeyValues: array of const);
begin
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.FindNearest(KeyValues);
  except
  end;
end;

function TDataSet_OOP_DX.fint(Afield: string): Integer;
begin
  Result := dataSet.FieldByName(Afield).AsInteger;
end;

function TDataSet_OOP_DX.First: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.First
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.fnull(Afield: string): Boolean;
begin
  Result := dataSet.FieldByName(Afield).IsNull;
end;

function TDataSet_OOP_DX.FPontoFlutuante(valor: currency; casadecimal: integer): string;
var
  vl: string;
begin
  vl := format('%8.'+inttostr(casadecimal)+'f', [valor]);
{  while (pos('.', vl) > 0) do
  begin
    vl := copy(vl, 1, pos('.', vl) - 1) + copy(vl, pos('.', vl) + 1, (length(vl) - pos('.', vl) + 1));
  end;
  while (pos(',', vl)) > 0 do
  begin
    vl := copy(vl, 1, pos(',', vl) - 1) + '.'+ copy(vl, pos(',', vl) + 1, (length(vl) - pos(',', vl) + 1));
  end;}
  try
    result := trim(vl);
  except
    result := '0';
  end;
end;

function TDataSet_OOP_DX.fstr(Afield: string; Atrim: Boolean): string;
begin
  Result := dataSet.FieldByName(Afield).AsString;
  if Atrim then
    Result := Trim(Result);
end;

function TDataSet_OOP_DX.fstrNotEsp(Afield: string;
  Atrim: Boolean): string;
begin
  Result := RetiraCarEsp(fstr(Afield, Atrim));
end;

function TDataSet_OOP_DX.Gencodigo(Tabela: string; buscas: TIBQuery;
  codemp: string): integer;
begin
  while true do
  begin
    try

      buscas.Close;
      buscas.SQL.Text := 'SELECT COD FROM INCREMENTA_CODIGO(:VCOD_EMPRESA, :VTABELA)';
      buscas.ParamByName('VCOD_EMPRESA').Text := codemp;
      buscas.ParamByName('VTABELA').Text := UpperCase(Tabela);
      buscas.Open;
      Result := buscas.FieldByName('COD').Value;
      buscas.Close;
      exit;
    except
      on E: Exception do
      begin
        MessageDlg('E0005 ' + 'Erro ao obter código para: "' + Tabela +'"'+ #13 +
          'Não desligue o computador durante este processamento' + #13 +
          'Operação será repetida' + #13 +
          'Se o processo ficar repetitivo procure o Suporte', mtinformation, [mbOK], 0);
        registraErro('E0005 ' + e.Message + ' ' + Tabela);
        //     Result := False;
      end;
    end;
  end;
end;

function TDataSet_OOP_DX.Bof: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      Result := DataSet.Bof
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.Eof: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      Result := DataSet.Eof
    else
      Result := False;
  except
    Result := False;
  end;
end;


function TDataSet_OOP_DX.ExecutaComandosSql(comandosSql: string): boolean;
begin
  //Pesquisa gerais atraves de comandos sql.
  try
    buscas.close;
    buscas.SQL.Text := comandosSql;
    buscas.Open;
    if buscas.IsEmpty then
      Result := false
    else
      Result := true;
    buscas.close;
  except
    on E: Exception do
    begin
      result := false;
      if inibeErro <> 'S' then
        MessageDlg('E0006 ' + 'Erro ao ler executar comandos sql: ' + comandosSql, mtinformation,
          [mbOK], 0);
      inibeErro := 'N';
      registraErro('E0006 ' + e.Message + ' ' + comandosSql);
    end;
  end;
end;

function TDataSet_OOP_DX.ExecutaComandosSqlExec(comandosSql: string): boolean;
begin
  //Pesquisa gerais atraves de comandos sql.
  try
    buscas.close;
    buscas.SQL.Text := comandosSql;
    buscas.Prepare;
    buscas.ExecSQL;
    Result := true;
    buscas.close;
  except
    on E: Exception do
    begin
      result := false;
      if inibeErro <> 'S' then
        MessageDlg('E0006 ' + 'Erro ao ler executar comandos sql: ' + comandosSql, mtinformation,
          [mbOK], 0);
      inibeErro := 'N';
      registraErro('E0006 ' + e.Message + ' ' + comandosSql);
    end;
  end;
end;

function TDataSet_OOP_DX.fcopy(Afield: string; Index,
  Count: Integer): string;
begin
  Result := Copy(fstr(Afield), Index, Count);
end;

function TDataSet_OOP_DX.fcopy(Afield: string; Count: Integer): string;
begin
  Result := fcopy(Afield, 1, Count);
end;

function TDataSet_OOP_DX.fdate(Afield: string): TDate;
begin
  Result := DateOf(dataSet.FieldByName(Afield).AsDateTime);
end;

function TDataSet_OOP_DX.fdatet(Afield: string): TDateTime;
begin
  Result := dataSet.FieldByName(Afield).AsDateTime;
end;

function TDataSet_OOP_DX.fdif(Afield, Text: string;
  Atrim: Boolean): Boolean;
begin
  Result := not fequals(Afield, Text, Atrim);
end;

function TDataSet_OOP_DX.fempty(Afield: string; Atrim: Boolean): Boolean;
begin
  Result := fstr(Afield, Atrim) = '';
end;

function TDataSet_OOP_DX.fequals(Afield, Text: string;
  Atrim: Boolean): Boolean;
begin
  Result := fstr(Afield, Atrim) = IfThen(Atrim, Trim(Text), Text);
end;

function TDataSet_OOP_DX.ffloat(Afield: string;
  const ADigit: TRoundToRange): Double;
begin
  Result := RoundTo(dataSet.FieldByName(Afield).AsFloat, ADigit);
end;

function TDataSet_OOP_DX.ffloat(Afield: string): Double;
begin
  Result := dataSet.FieldByName(Afield).AsFloat;
end;

function TDataSet_OOP_DX.Active: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := false;
  try
    if (DataSet <> nil) then
      Result := DataSet.Active
  except
    Result := False;
  end;
end;

function TDataSet_OOP_DX.Gencodigo(Tabela: string; procedureCodigo: TIBStoredProc; codemp: string):
  integer;
begin
  while true do
  begin
    try
      procedureCodigo.Close;
      procedureCodigo.ParamByName('VCOD_EMPRESA').Text := codemp;
      procedureCodigo.ParamByName('VTABELA').Text := Tabela;
      procedureCodigo.ExecProc;
      Result := procedureCodigo.ParamByName('COD').Value;
      procedureCodigo.Close;
      exit;
    except
      on E: Exception do
      begin
        MessageDlg('E0005 ' + 'Erro ao gravar dados na tabela: ' + Tabela +
          '. Operação será repetida' + #13 +
          'Se o processo ficar repetitivo procure o Suporte', mtinformation, [mbOK], 0);
        registraErro('E0005 ' + e.Message + ' ' + Tabela);
        //     Result := False;
      end;
    end;
  end;
end;

function TDataSet_OOP_DX.GetIndexFieldNames: string;
begin
  Result := DataSet.IndexFieldNames;
end;

function TDataSet_OOP_DX.Cpf(Num: string): boolean;
var
  N1, n2, n3, n4, n5, n6, n7, n8, n9: integer;
  D1, d2: integer;
  Digitado, calculado: string;
begin
  try
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    calculado := inttostr(d1) + inttostr(d2);
    digitado := num[10] + num[11];
    if calculado = digitado then
      cpf := true
    else
      cpf := false;
  except
    cpf := false;
  end;
end;

function TDataSet_OOP_DX.cgc(Num: string): boolean;
var
  N1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: integer;
  D1, d2: integer;
  Digitado, calculado: string;
begin
  try
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    n10 := StrToInt(num[10]);
    n11 := StrToInt(num[11]);
    n12 := StrToInt(num[12]);

    d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3
      + n2 * 4 + n1 * 5;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3
      + n3 * 4 + n2 * 5 + n1 * 6;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    Calculado := inttostr(d1) + inttostr(d2);
    digitado := num[13] + num[14];
    if calculado = digitado then
      cgc := true
    else
      cgc := false;
  except
    cgc := false;
  end;
end;

function TDataSet_OOP_DX.IniciaTransacao: boolean;
begin
  if not emTransacao then
  begin
    try
      transacao.StartTransaction;
      result := true;
    except
      on e: exception do
      begin
        Result := False;
        MessageDlg('E0007 ' + e.Message, mtInformation, [mbOK], 0);
        registraErro('E0007 ' + e.Message);
      end;
    end;
  end;
end;

function TDataSet_OOP_DX.CommitaTransacao: Boolean;
begin
  if emTransacao then
  begin
    try
      transacao.Commit;
      result := true;
    except
      on e: exception do
      begin
        RollBackTransacao;
        Result := False;
        MessageDlg('E0008 ' + e.Message, mtInformation, [mbOK], 0);
        registraErro('E0008 ' + e.Message);
      end;
    end;
  end;
end;


function TDataSet_OOP_DX.ConsultaCampos(tabela, valorConsulta, Campo, condicao,
  ordem: string; constante: boolean; codemp: string;vtipo: string;vtpnfe: string): boolean;
var
  I: integer;
  possuisituacao,possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string; // F (Integer, Float); S String; D Data; I Indefinido
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
  try
  if vtpnfe <> 'SS' then
  begin
    possuiCodEmpresa := false;
    possuiAtivo := false;
    if vtipo = 'S'  then
     vtipo := 'AND EMISSAO_PROPRIA = ''S'' AND (SITUACAO_NFE IS NULL OR SITUACAO_NFE = ''Em Processamento'') AND MODELO_NF = ''55'' AND NATUREZA_NF = '''+vtpnfe+''' AND ((NATUREZA_NF = ''S'') OR ((EMISSAO_PROPRIA = ''S'') AND (NUM_GERADO = ''S'')))';
    if vtipo = 'N'  then
     vtipo := 'AND EMISSAO_PROPRIA = ''S'' AND (SITUACAO_NFE <> '''' AND SITUACAO_NFE <> ''Em Processamento'') AND MODELO_NF = ''55'' AND NATUREZA_NF = '''+vtpnfe+''' AND ((NATUREZA_NF = ''S'') OR ((EMISSAO_PROPRIA = ''S'') AND (NUM_GERADO = ''S'')))';
    if vtipo = ''  then
     vtipo := 'AND EMISSAO_PROPRIA = ''S'' AND MODELO_NF = ''55'' AND NATUREZA_NF = '''+vtpnfe+''' AND ((NATUREZA_NF = ''S'') OR ((EMISSAO_PROPRIA = ''S'') AND (NUM_GERADO = ''S'')))';

    result := false;
    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          begin
            Campo := DataSet.Fields[I].FieldName;

            if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
              ordem := DataSet.Fields[I].FieldName;

            if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
              possuiCodEmpresa := true;
            if Dataset.Fields[I].FieldName = 'ATIVO' then
              possuiAtivo := true;

            if (Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
              (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField) then
              tipo := 'F'
            else if DataSet.Fields[i] is TStringField then
              tipo := 'S'
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              tipo := 'D'
            else
              tipo := 'I';
            break;
          end;
        end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
          begin
            possuiCodEmpresa := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;
        DataSet.Close;
        if tipo = 'F' then
        begin
          if (condicao = 'like') or (condicao = 'Começa') then
            condicao := '=';
          DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' ' + condicao + ' '
            + tirapontos(valorConsulta, 5);
        end
        else if (tipo = 'S') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' ' + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and cod_empresa = ' + codemp+vtipo;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ativo=1';

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
          begin
            possuiCodEmpresa := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where cod_empresa = ' + codemp+vtipo;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ativo = 1'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ativo = 1';
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
  end
  else
  begin
    possuiCodEmpresa := false;
    possuiAtivo := false;
    if vtipo = 'S'  then
     vtipo := ' AND (PEDVENDA_SERV.N_NF IS NULL or PEDVENDA_SERV.N_NF = 0) AND modelo_NFSe = ''55'' ';
    if vtipo = 'N'  then
     vtipo := ' AND (PEDVENDA_SERV.N_NF <>0) AND modelo_NFSe = ''55'' ';


    result := false;
    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          begin
            Campo := DataSet.Fields[I].FieldName;
            tabela:=dataset.Fields[I].DisplayName;

            if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
              ordem := DataSet.Fields[I].DisplayName;

//            if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
              possuiCodEmpresa := true;
//            if Dataset.Fields[I].FieldName = 'ATIVO' then
              possuiAtivo := true;

            if (Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
              (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField) then
              tipo := 'F'
            else if DataSet.Fields[i] is TStringField then
              tipo := 'S'
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              tipo := 'D'
            else
              tipo := 'I';
            break;
          end;
        end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
          begin
            possuiCodEmpresa := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
//        for I := 0 to DataSet.FieldCount - 1 do
//          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
//          begin
//            ordem := DataSet.Fields[I].FieldName;
//            Break;
//          end;
        DataSet.Close;
        if tipo = 'F' then
        begin
          if (condicao = 'like') or (condicao = 'Começa') then
            condicao := '=';
          DataSet.CommandText :=
          'SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,iif(cs.value1_f = 1, empresa.aliq_simples_iss, tipo_servico.aliq_iss) aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
          'sum(pedvenda_serv.valor_tot_serv+coalesce(pedvenda_serv.rateio_acresc,0)-pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa, '+
          'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
          'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
          'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
          'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
          'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
          'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
          'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
          'inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa '+
          'left join config_sistema cs on cs.chave = ''nfse_simples_nacional_aliq'' and cs.cod_empresa = empresa.cod_empresa '+
          'where pedvenda_serv.valor_tot_serv <> 0 AND COALESCE(PEDVENDA_SERV.STATUS,'''') <> ''CANCELADO'' and pedvenda.ativo = 1 and '+ tabela +  ' ' + condicao + ' '
          + tirapontos(valorConsulta, 5);
        end
        else if (tipo = 'S') or (tipo = 'I') then
        begin
          if condicao = 'like' then
          DataSet.CommandText :=
          'SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,iif(cs.value1_f = 1, empresa.aliq_simples_iss, tipo_servico.aliq_iss) aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
          'sum(pedvenda_serv.valor_tot_serv+coalesce(pedvenda_serv.rateio_acresc,0)-pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa,'+
          'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
          'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
          'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
          'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
          'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
          'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
          'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
          'inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa '+
          'left join config_sistema cs on cs.chave = ''nfse_simples_nacional_aliq'' and cs.cod_empresa = empresa.cod_empresa '+
          'where pedvenda_serv.valor_tot_serv <> 0 and COALESCE(PEDVENDA_SERV.STATUS,'''') <> ''CANCELADO'' and pedvenda.ativo = 1 and '+tabela + ' like ' +QuotedStr('%' + valorConsulta + '%')
          else
           if condicao = 'Começa' then
            DataSet.CommandText :=
            'SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,iif(cs.value1_f = 1, empresa.aliq_simples_iss, tipo_servico.aliq_iss) aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
            'sum(pedvenda_serv.valor_tot_serv+coalesce(pedvenda_serv.rateio_acresc,0)-pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa,'+
            'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
            'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
            'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
            'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
            'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
            'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
            'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
            'inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa '+
            'left join config_sistema cs on cs.chave = ''nfse_simples_nacional_aliq'' and cs.cod_empresa = empresa.cod_empresa '+
            'where pedvenda_serv.valor_tot_serv <> 0 and COALESCE(PEDVENDA_SERV.STATUS,'''') <> ''CANCELADO'' and pedvenda.ativo = 1 and '+tabela + ' like ' +
              QuotedStr(valorConsulta + '%')
           else
            DataSet.CommandText :=
            'SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,iif(cs.value1_f = 1, empresa.aliq_simples_iss, tipo_servico.aliq_iss) aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
            'sum(pedvenda_serv.valor_tot_serv+coalesce(pedvenda_serv.rateio_acresc,0)-pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa,'+
            'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
            'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
            'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
            'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
            'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
            'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
            'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
            'inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa '+
            'left join config_sistema cs on cs.chave = ''nfse_simples_nacional_aliq'' and cs.cod_empresa = empresa.cod_empresa '+
            'where pedvenda_serv.valor_tot_serv <> 0 and COALESCE(PEDVENDA_SERV.STATUS,'''') <> ''CANCELADO'' and pedvenda.ativo = 1 and '+tabela+ ' ' + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

//        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and pedvenda.cod_empresa = ' + codemp+'  and pedvenda.tipo = ''OS'' and pedvenda.status_ped = ''FECHADA'' '+vtipo;
//        if possuiAtivo then
//          DataSet.CommandText := DataSet.CommandText + ' and ativo=1';
//        DataSet.CommandText := DataSet.CommandText +' '+vtipo;
        dataSet.CommandText:=DataSet.CommandText+' group by nome_cliente,nped,tipo,aliq_iss,nfs_servico,cnae_serv,cidade,cod_rps,n_nf,'+
        'cod_empresa,data_fech,status_nfse,iss_retido,ctiss ';
        DataSet.CommandText := DataSet.CommandText +' order by ' + Campo;
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText :='SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,iif(cs.value1_f = 1, empresa.aliq_simples_iss, tipo_servico.aliq_iss) aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
            'sum(pedvenda_serv.valor_tot_serv+coalesce(pedvenda_serv.rateio_acresc,0)-pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa,'+
            'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
            'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
            'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
            'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
            'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
            'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
            'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
            'inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa '+
            'left join config_sistema cs on cs.chave = ''nfse_simples_nacional_aliq'' and cs.cod_empresa = empresa.cod_empresa '+
            'where pedvenda_serv.valor_tot_serv <> 0 and COALESCE(PEDVENDA_SERV.STATUS,'''') <> ''CANCELADO'' and pedvenda.ativo = 1 and pedvenda.cod_empresa = '+codemp+'  and pedvenda.tipo = ''OS'' '+vtipo;
//            DataSet.CommandText := DataSet.CommandText +' '+vtipo;
            DataSet.CommandText:=dataSet.CommandText+' group by nome_cliente,nped,tipo,aliq_iss,nfs_servico,cnae_serv,cidade,cod_rps,n_nf,'+
            'cod_empresa,data_fech,status_nfse,iss_retido,ctiss';
            DataSet.CommandText := DataSet.CommandText +' order by ' + Campo;
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;

  end;
  finally
    possuiCodEmpresa := false;
  end;
end;

function TDataSet_OOP_DX.ConsultaCampos(tabela, Campo, ordem, dataIni,
  dataFim: string; codemp: string;vtipo: string;vtpnfe: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao: string;

begin
  if vtpnfe <> 'SS' then
  begin
    if vtipo = 'S'  then
     vtipo := ' AND (SITUACAO_NFE IS NULL or SITUACAO_NFE = ''Em Processamento'') AND MODELO_NF = ''55'' AND NATUREZA_NF = '''+vtpnfe+''' AND EMISSAO_PROPRIA = ''S'' AND ((NATUREZA_NF = ''S'') OR ((EMISSAO_PROPRIA = ''S'') AND (NUM_GERADO = ''S'')))';
    if vtipo = 'N'  then
     vtipo := ' AND (SITUACAO_NFE <> '''' AND SITUACAO_NFE <> ''Em Processamento'') AND MODELO_NF = ''55'' AND NATUREZA_NF = '''+vtpnfe+''' AND EMISSAO_PROPRIA = ''S'' AND ((NATUREZA_NF = ''S'') OR ((EMISSAO_PROPRIA = ''S'') AND (NUM_GERADO = ''S'')))';
    if vtipo = ''  then
     vtipo := ' AND MODELO_NF = ''55'' AND NATUREZA_NF = '''+vtpnfe+''' AND EMISSAO_PROPRIA = ''S'' AND ((NATUREZA_NF = ''S'') OR ((EMISSAO_PROPRIA = ''S'') AND (NUM_GERADO = ''S'')))';

    try vtipo := vtipo + ' and coalesce(nfe_versao,'''') = '''' '; except end;
    result := false;
    possuiCodEmpresa := false;
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
        Campo := DataSet.Fields[I].FieldName;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
      if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
        possuiCodEmpresa := true;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;
    if (dataIni <> '  /  /   ') or (dataFim <> '  /  /   ') then
    begin
      try
        DataSet.Close;
        if (dataIni <> '  /  /   ') and (dataFim <> '  /  /   ') then
          condicao := ' where ' + tabela + '.' + Campo + ' >= :dataIni and ' + tabela + '.' + Campo +
            ' <= :dataFim'
        else if (dataIni <> '  /  /   ') and (dataFim = '  /  /   ') then
          condicao := ' where ' + tabela + '.' + Campo + ' >= :dataIni'
        else if (dataIni = '  /  /   ') and (dataFim <> '  /  /   ') then
          condicao := ' where ' + tabela + '.' + Campo + ' <= :dataFim';
        DataSet.CommandText :='select * from ' + tabela + condicao;

        if (possuiCodEmpresa) and (pos('where', string(dataSet.CommandText)) > 0) then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.cod_empresa = ' + codemp+vtipo
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.cod_empresa = ' +
            codemp+vtipo;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 1';
        DataSet.CommandText := DataSet.CommandText + ' order by ' + tabela + '.' + ordem;

        if (dataIni <> '  /  /   ') and (dataFim <> '  /  /   ') then
        begin
          DataSet.Params[0].AsDate := StrToDate(dataIni);
          DataSet.Params[1].AsDate := StrToDate(dataFim);
        end
        else if (dataIni <> '  /  /   ') and (dataFim = '  /  /   ') then
          DataSet.Params[0].AsDate := StrToDate(dataIni)
        else if (dataIni = '  /  /   ') and (dataFim <> '  /  /   ') then
          DataSet.Params[0].AsDate := StrToDate(dataFim);
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'cod_empresa = ' +
            codemp + ' and ' + tabela + '.' + 'ativo = 1'+vtipo
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'ativo = 1'+vtipo
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'cod_empresa = ' +
            codemp+vtipo;
        DataSet.CommandText := DataSet.CommandText + ' order by ' + tabela + '.' + ordem;
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
  end
  else
  begin
    if vtipo = 'S'  then
     vtipo := ' AND (PEDVENDA_SERV.N_NF IS NULL or PEDVENDA_SERV.N_NF = 0) AND modelo_NFSe = ''55'' ';
    if vtipo = 'N'  then
     vtipo := ' AND (PEDVENDA_SERV.N_NF <>0) AND modelo_NFSe = ''55'' ';
//    if vtipo = ''  then
//     vtipo := ' AND MODELO_NF = ''55'' AND NATUREZA_NF = '''+vtpnfe+''' AND EMISSAO_PROPRIA = ''S'' ';
    result := false;
    possuiCodEmpresa := false;
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
      begin
        Campo := DataSet.Fields[I].FieldName;
        tabela:=dataset.Fields[I].DisplayName;
      end;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
      begin
        ordem := DataSet.Fields[I].DisplayName;
//        tabela:=dataset.Fields[I].DisplayName;
      end;
      if Dataset.Fields[I].FieldName = 'PEDVENDA.COD_EMPRESA' then
        possuiCodEmpresa := true;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;
    if (dataIni <> '  /  /   ') or (dataFim <> '  /  /   ') then
    begin
      try
        DataSet.Close;
        if (dataIni <> '  /  /   ') and (dataFim <> '  /  /   ') then
          condicao := ' and ' + tabela + ' >= :dataIni and ' + tabela +
            ' <= :dataFim'
        else if (dataIni <> '  /  /   ') and (dataFim = '  /  /   ') then
          condicao := ' and ' + tabela + ' >= :dataIni'
        else if (dataIni = '  /  /   ') and (dataFim <> '  /  /   ') then
          condicao := ' and ' + tabela + ' <= :dataFim';
        DataSet.CommandText :=
        'SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,iif(cs.value1_f = 1, empresa.aliq_simples_iss, tipo_servico.aliq_iss) aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
        'sum(pedvenda_serv.valor_tot_serv+coalesce(pedvenda_serv.rateio_acresc,0)-pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa,'+
        'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
        'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
        'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
        'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
        'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
        'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
        'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
        'inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa '+
        'left join config_sistema cs on cs.chave = ''nfse_simples_nacional_aliq'' and cs.cod_empresa = empresa.cod_empresa '+
        'where pedvenda_serv.valor_tot_serv <> 0 and COALESCE(PEDVENDA_SERV.STATUS,'''') <> ''CANCELADO'' and pedvenda.ativo = 1 '+condicao;
//        'select * from ' + tabela + condicao;

    //    if (possuiCodEmpresa) and (pos('where', dataSet.CommandText) > 0) then
          DataSet.CommandText := DataSet.CommandText + ' and ' + 'pedvenda.cod_empresa = ' + codemp+vtipo;
//        else if possuiCodEmpresa then
  //        DataSet.CommandText := DataSet.CommandText + ' where ' + 'pedvenda.cod_empresa = ' +
//            codemp+vtipo;
//        if possuiAtivo then
        DataSet.CommandText := DataSet.CommandText + ' and pedvenda.ativo = 1 and pedvenda.tipo = ''OS'' and pedvenda.status_ped = ''FECHADA'' ';
        dataSet.CommandText:=dataSet.CommandText+' group by nome_cliente,nped,tipo,aliq_iss,nfs_servico,cnae_serv,cidade,cod_rps,n_nf,'+
        'cod_empresa,data_fech,status_nfse,iss_retido,ctiss ';
        DataSet.CommandText := DataSet.CommandText + ' order by ' + Campo;

        if (dataIni <> '  /  /   ') and (dataFim <> '  /  /   ') then
        begin
          DataSet.Params[0].AsDate := StrToDate(dataIni);
          DataSet.Params[1].AsDate := StrToDate(dataFim);
        end
        else if (dataIni <> '  /  /   ') and (dataFim = '  /  /   ') then
          DataSet.Params[0].AsDate := StrToDate(dataIni)
        else if (dataIni = '  /  /   ') and (dataFim <> '  /  /   ') then
          DataSet.Params[0].AsDate := StrToDate(dataFim);
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText :=
        'SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,iif(cs.value1_f = 1, empresa.aliq_simples_iss, tipo_servico.aliq_iss) aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
        'sum(pedvenda_serv.valor_tot_serv+coalesce(pedvenda_serv.rateio_acresc,0)-pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa,'+
        'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
        'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
        'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
        'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
        'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
        'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
        'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
        'inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa '+
        'left join config_sistema cs on cs.chave = ''nfse_simples_nacional_aliq'' and cs.cod_empresa = empresa.cod_empresa '+
        'where pedvenda_serv.valor_tot_serv <> 0 and pedvenda.ativo = 1  and pedvenda.tipo = ''OS'' and pedvenda.status_ped = ''FECHADA'' '+condicao;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + 'pedvenda.cod_empresa = ' +
            codemp + ' and ' + 'pedvenda.ativo = 1 '+vtipo
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + 'pedvenda.ativo = 1 '+vtipo
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + 'pedvenda.cod_empresa = ' +
            codemp+vtipo;
        dataSet.CommandText:=dataSet.CommandText+' group by nome_cliente,nped,tipo,aliq_iss,nfs_servico,cnae_serv,cidade,cod_rps,n_nf,'+
        'cod_empresa,data_fech,status_nfse,iss_retido,ctiss ';
        DataSet.CommandText := DataSet.CommandText + ' order by ' + Campo;
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;

  end;

end;

function TDataSet_OOP_DX.ConsultaCampos(tabela, valorConsulta, Campo, condicao, ordem,
  sqlAdicional: string; constante: boolean; codemp: string;vtipo: string;vtpnfe: string): boolean;
var
  //Para evitar possíveis erros em centenças SQL sqladicional
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string;
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
  try
    if vtipo = 'S'  then
     vtipo := ' AND SITUACAO_NFE IS NULL AND NATUREZA_NF = '''+vtpnfe+'''';
    if vtipo = 'N'  then
     vtipo := ' AND SITUACAO_NFE <> '''' AND NATUREZA_NF = '''+vtpnfe+''''; 
    if vtipo = ''  then
     vtipo := '';
    result := false;
    possuiCodEmpresa := false;
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
      begin
        Campo := DataSet.Fields[I].FieldName;
        if (Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
          (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField) then
          tipo := 'F'
        else if DataSet.Fields[i] is TStringField then
          tipo := 'S'
        else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          tipo := 'D'
        else
          tipo := 'I';
      end;
      if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
        possuiCodEmpresa := true;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
    end;
    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';
        DataSet.Close;
        if tipo = 'F' then
        begin
          if (condicao = 'like') or (condicao = 'Começa') then
            condicao := '=';
          DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
            + condicao + ' '
            + tirapontos(valorConsulta, 5);
        end
        else if (tipo = 'S') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
              + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.cod_empresa = ' +
            codemp+vtipo;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo=1';

        DataSet.CommandText := DataSet.CommandText + ' order by ' + tabela + '.' + ordem;
        //Particularidade para a buscas de produtos
        if upperCase(Tabela) = 'PRODUTOS' then
        begin
          if UpperCase(Campo) = 'NUM_FAB_PROD' then
          begin
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'PRODUTOS.NUM_FAB_PROD',
              'COD_BARRA.cod_barra', [rfIgnoreCase]);
            dataSet.CommandText := StringReplace(dataSet.CommandText, '* from produtos where',
              'distinct(PRODUTOS.*) from PRODUTOS,COD_BARRA where COD_BARRA.cod_prod = PRODUTOS.cod_prod AND COD_BARRA.grupo_prod = PRODUTOS.grupo_prod AND PRODUTOS.cod_empresa = COD_BARRA.cod_empresa and ',
              [rfReplaceAll, rfIgnoreCase]);
          end;
        end;
        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        Result :=Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where  ' + tabela + '.' + 'cod_empresa = '
            + codemp;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + 'ativo = 1'+vtipo
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'ativo = 1'+vtipo;

        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        result:=Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
  finally
//    possuiCodEmpresa := false;
  end;
end;

procedure TDataSet_OOP_DX.RollBackTransacao;
begin
  if emTransacao then
    transacao.Rollback;
end;

procedure TDataSet_OOP_DX.SetIndexFieldNames(const Value: string);
begin
  DataSet.IndexFieldNames := Value;
end;

function TDataSet_OOP_DX.SqlExec(ASql: string; AQuery: TIBQuery): TIBQuery;
begin
  if AQuery = nil then
    AQuery := FBuscas;

  AQuery.Close;
  AQuery.SQL.Text := ASql;
  if not AQuery.Prepared then
    AQuery.Prepare;
  AQuery.ExecSQL;

  Result := AQuery;
end;

function TDataSet_OOP_DX.SqlOpen(ASql: string; AQuery: TIBQuery): TIBQuery;
begin
  if AQuery = nil then
    AQuery := FBuscas;

  AQuery.Close;
  AQuery.SQL.Text := ASql;
  AQuery.Open;

  Result := AQuery;
end;

function TDataSet_OOP_DX.tirapontos(vdados: string; CasaDecimal: Integer): string;
begin
  result:=vdados;
end;

function TDataSet_OOP_DX.trocaVirgulaPorPonto(valor: string): string;
begin
Result := StringReplace(valor, ',', '.', [rfReplaceAll, rfIgnoreCase]);
end;

function TDataSet_OOP_DX.RetiraCarEsp(Str: String): String;
var
   i, wTamanho: integer;
   wChar, wResultado: Char;
begin
   result:='';
   wtamanho:=Length(Str);
   i:=1;
   while (i <= wtamanho) do
   begin
      wChar:=Str[i];
      case wChar of
         'á', 'â', 'ã', 'à', 'ä', 'å',
         'Á', 'Â', 'Ã', 'À', 'Ä', 'Å': wResultado := 'A';
         'é', 'ê', 'è', 'ë',
         'É', 'Ê', 'È', 'Ë': wResultado := 'E';
         'í', 'î', 'ì', 'ï',
         'Í', 'Î', 'Ì', 'Ï': wResultado := 'I';
         'ó', 'ô', 'õ', 'ò', 'ö',
         'Ó', 'Ô', 'Õ', 'Ò', 'Ö': wResultado := 'O';
         'ú', 'û', 'ù', 'ü',
         'Ú', 'Û', 'Ù', 'Ü': wResultado := 'U';
         'ç', 'Ç': wResultado := 'C';
         'ñ', 'Ñ': wResultado := 'N';
         'ý', 'ÿ', 'Ý', 'Y': wResultado := 'Y';
         '<', '>': wResultado := '.';
         '°', 'º': wResultado := 'o';
         'ª': wResultado := 'a';
         '§', '¬', '¢', '£': wResultado := ' ';
         '¹': wResultado := '1';
         '²': wResultado := '2';
         '³': wResultado := '3';
      else
         wResultado:=wChar;
      end;
      i:=i+1;
      Result:=Result+wResultado;
   end;
   Result:=UpperCase(Result);
end;

procedure TDataSet_OOP_DX.RetornaAtributos(Vcomb: Tcombobox; vcombord: TCombobox);
var
  I: Integer;
begin
  try
    Vcomb.Clear;
    vcombord.clear;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      Vcomb.Items.Add(DataSet.Fields[I].DisplayName);
      vcombord.Items.Add(DataSet.Fields[I].DisplayName);
    end;
    Vcomb.Items.Add('TODOS');
  except
    on E: EListError do
      raise EListError.Create('Error na Montagem da Lista');
    on Exception do
      raise Exception.Create('Erro Interno com a Pesquisa');
  end; // Try...Except
end;

function TDataSet_OOP_DX.retornaValor(comandosSql: string): string;
begin
  //Pesquisa gerais atraves de comandos sql.
  try
//    buscas.Database.DatabaseName;
//    buscas.Database.Connected;
    buscas.close;
    buscas.SQL.Text := comandosSql;
    buscas.Open;
    if buscas.IsEmpty then
      Result := ''
    else
      Result := buscas.FieldByName('valor').AsString;
    buscas.close;
  except
    on E: Exception do
    begin
      result := '';
      MessageDlg('E0019 ' + 'Erro ao ler executar comandos sql: ' + comandosSql, mtinformation,
        [mbOK], 0);
      registraErro('E0019 ' + e.Message + ' ' + comandosSql);
    end;
  end;
end;

function TDataSet_OOP_DX.ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim,
  sqlAdicional, codemp: string;vtipo: string;vtpnfe: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao: string;
begin
  if vtipo = 'S'  then
   vtipo := ' AND SITUACAO_NFE IS NULL AND NATUREZA_NF = '''+vtpnfe+'''';
  if vtipo = 'N'  then
   vtipo := ' AND SITUACAO_NFE <> '''' AND NATUREZA_NF = '''+vtpnfe+'''';
  if vtipo = ''  then
   vtipo := '';
  result := false;
  possuiCodEmpresa := false;
  possuiAtivo := false;
  for I := 0 to DataSet.FieldCount - 1 do
  begin
    if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
      Campo := DataSet.Fields[I].FieldName;
    if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
      ordem := DataSet.Fields[I].FieldName;
    if Dataset.Fields[I].FieldName = 'COD_EMPRESA' then
      possuiCodEmpresa := true;
    if Dataset.Fields[I].FieldName = 'ATIVO' then
      possuiAtivo := true;
  end;

  if (dataIni <> '  /  /   ') or (dataFim <> '  /  /   ') then
  begin
    try
      DataSet.Close;
      if (dataIni <> '  /  /   ') and (dataFim <> '  /  /   ') then
        condicao := ' where ' + tabela + '.' + Campo + ' >= '+quotedstr(FormatDateTime('mm/dd/yyyy', strtodate(dataIni)))+' and ' + tabela + '.' + Campo +
          ' <= '+quotedstr(FormatDateTime('mm/dd/yyyy', strtodate(dataFim)))
      else if (dataIni <> '  /  /   ') and (dataFim = '  /  /   ') then
        condicao := ' where ' + tabela + '.' + Campo + ' >= '+quotedstr(FormatDateTime('mm/dd/yyyy', strtodate(dataIni)))
      else if (dataIni = '  /  /   ') and (dataFim <> '  /  /   ') then
        condicao := ' where ' + tabela + '.' + Campo + ' <= '+quotedstr(FormatDateTime('mm/dd/yyyy', strtodate(dataFim)));
      DataSet.CommandText := 'select * from ' + tabela + condicao;
      if (possuiCodEmpresa) and (pos('where', string(dataSet.CommandText)) > 0) then
        DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.cod_empresa = ' + codemp+vtipo
      else if possuiCodEmpresa then
        DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.cod_empresa = ' +
          codemp+vtipo;
      if possuiAtivo then
        DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 1';
      DataSet.CommandText := DataSet.CommandText + ' order by ' + tabela + '.' + ordem;
//      if (dataIni <> '  /  /   ') and (dataFim <> '  /  /   ') then
//      begin
//        DataSet.Params[0].AsDate := StrToDate(dataIni);
//        DataSet.Params[1].AsDate := StrToDate(dataFim);
//      end
//      else if (dataIni <> '  /  /   ') and (dataFim = '  /  /   ') then
//        DataSet.Params[0].AsDate := StrToDate(dataIni)
//      else if (dataIni = '  /  /   ') and (dataFim <> '  /  /   ') then
//        DataSet.Params[0].AsDate := StrToDate(dataFim);
      if sqlAdicional <> '' then
        if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
            ' order by ', [rfReplaceAll, rfIgnoreCase])
        else
          dataSet.CommandText := dataSet.CommandText + sqlAdicional;
      Result := Open;
    except
      on e: exception do
      begin
        Result := false;
        MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
          mtInformation, [mbOK], 0);
        registraErro('E0011 ' + e.Message + DataSet.CommandText);
      end;
    end;
  end
  else
  begin
    try
      DataSet.close;
      DataSet.CommandText := 'select * from ' + tabela;
      if possuiAtivo and possuiCodEmpresa then
        DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.cod_empresa = ' + codemp
          + ' and ' + tabela + '.' + 'ativo = 1'+vtipo
      else if possuiAtivo then
        DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.ativo = 1'+vtipo
      else if possuiCodEmpresa then
        DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.cod_empresa = ' +
          codemp+vtipo;
      DataSet.CommandText := DataSet.CommandText + ' order by ' + tabela + '.' + ordem;

      if sqlAdicional <> '' then
        if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
            ' order by ', [rfReplaceAll, rfIgnoreCase])
        else
          dataSet.CommandText := dataSet.CommandText + sqlAdicional;
      Result := Open;
    except
      on e: exception do
      begin
        Result := false;
        MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
          mtInformation, [mbOK], 0);
        registraErro('E0012 ' + e.Message + DataSet.CommandText);
      end;
    end;
  end;
end;

procedure TDataSet_OOP_DX.CopyQuery(var AQuery, ACopia: TIBQuery);
begin
  if ACopia = nil then
    ACopia := TIBQuery.Create(AQuery.Owner);
  ACopia.Database    := AQuery.Database;
  ACopia.Transaction := AQuery.Transaction;
end;

function TDataSet_OOP_DX.getDataBanco(query: TIBQuery;vusserv: string): TDate;
begin
  if vusserv <> 'S' then
  begin
    Result := date;
    exit;
  end;
  query.Close;
  query.SQL.Text := 'select cast(' + QuotedStr('now') +
    ' as timestamp) as DATASERVIDOR from RDB$database';
  query.Open;
  result := StrToDate(copy(query.fieldbyname('DATASERVIDOR').AsString, 1, 10));
  query.Close;
end;

function TDataSet_OOP_DX.getDataHoraBanco(query: TIBQuery;vusserv: string): TDateTime;
begin
  if vusserv <> 'S' then
  begin
    Result := Now;
    exit;
  end;
  query.Close;
  query.SQL.Text := 'select cast(' + QuotedStr('now') +
    ' as timestamp) as DATASERVIDOR from RDB$database';
  query.Open;
  result := query.fieldbyname('DATASERVIDOR').AsDateTime;
  query.Close;
end;

function TDataSet_OOP_DX.StrZero(Num, Tam: Integer): string;
var
  I: Integer;
  V1: string;
begin
  V1 := Trim(IntToStr(Num));
  for I := 1 to Tam - Length(V1) do V1 := '0' + V1;
  Result := V1;
end;

function TDataSet_OOP_DX.StrZero(Num: string; Tam: Integer): string;
var
  I: Integer;
  V1: string;
begin
  V1 := Trim(Num);
  for I := 1 to Tam - Length(V1) do
    V1 := '0' + V1;
  Result := V1;
end;


end.

