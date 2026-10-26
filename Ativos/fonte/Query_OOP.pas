unit Query_OOP;

interface

uses
  {$IFNDEF VER180}
  IBX.IBQuery,
  {$ELSE}
  IBQuery,
  {$ENDIF}
  Classes,
  Math,
  Controls,
  Types_OOP;

type
  TSqlJoin = (sqInner, sqLeft, sqRight);

  TQuery_OOP = class(TComponent)
  strict private
    lastTableName: string;
    hasFieldNames: Boolean;
    Floggeral: string;
    FlogStore: LogStore;
    dataSet: TIBQuery;
  private
    function GetRecordCount: Integer;
    function GetRecNo: Integer;
    function GetSQLText: string;
    function GetSqlTextWithoutLinebreak(ATrim: Boolean = True): string;
    procedure LogParamsIfExists;
    procedure logs(Atext, Afilename: string; Asingleline: Boolean = False; AtimeStart: TDateTime = 0);
  public
    constructor Create(query: TIBQuery; sqlText: string = '');

    function IsEmpty: Boolean;
    function Eof: Boolean;
    function First: TQuery_OOP;
    function Last: TQuery_OOP;
    function Next: TQuery_OOP;
    function Close: TQuery_OOP;

    function fstr(Afield: string; Atrim: Boolean = True): string; overload;
    function fstr(Afield: string; index, count: Integer; atrim: Boolean = True): string; overload;
    function fint(Afield: string): Integer;
    function ffloat(Afield: string): Double; overload;
    function ffloat(Afield: string; const ADigit: TRoundToRange): Double; overload;
    function fcurr(Afield: string): Currency; overload;
    function fcurr(Afield: string; const ADigit: TRoundToRange): Currency; overload;
    function fdate(Afield: string): TDate;
    function fdatet(Afield: string): TDateTime;
    function fdif(Afield, Text: string; Atrim: Boolean = True): Boolean;
    function fequals(Afield, Text: string; Atrim: Boolean = True): Boolean;
    function fempty(Afield: string; Atrim: Boolean = True): Boolean;
    function fnull(Afield: string): Boolean;
    function fcopy(Afield: string; Index, Count: Integer): string; overload;
    function fcopy(Afield: string; Count: Integer): string; overload;
    function flist(Afield: string; DupIgnore: Boolean = False): TStrings; overload;
    function flist(Afield: string; aLineBreak: string; DupIgnore: Boolean = False): TStrings; overload;

    function Open(): TQuery_OOP; overload;
    function Open(sqlText: string): TQuery_OOP; overload;
    function Open(sqlText: string; const Args: array of const): TQuery_OOP; overload;
    function Scalar(): ScalarValue; overload;
    function Scalar(sqlText: string): ScalarValue; overload;
    function Scalar(sqlText: string; const Args: array of const): ScalarValue; overload;
    function ExecSQL(): TQuery_OOP; overload;
    function IncCodigo(tabela: string; cod_empresa: Integer): Integer;

    function SQL(sqlText: string): TQuery_OOP; overload;
    function SQL(sqlText: string; const Args: array of const): TQuery_OOP; overload;
    function ParamValue(param: string; value: string): TQuery_OOP; overload;
    function ParamValue(param: string; value: Integer): TQuery_OOP; overload;
    function ParamAsFloat(param: string; value: Double): TQuery_OOP;
    function ParamAsCurrency(param: string; value: Currency): TQuery_OOP;
    function ParamAsDateTime(param: string; value: TDateTime): TQuery_OOP; overload;
    function ParamReplace(param, value: string): TQuery_OOP;
    function ParamIncCodigo(param: string; ATableName: string = ''): TQuery_OOP;
    function Table(taleName: string; fieldsName: string = ''): TQuery_OOP; overload;
    function Fields(values: array of string; alias: string = ''): TQuery_OOP; overload;
    function Join(joinTable, fieldsJoin: string; sqlJoin: TSqlJoin = sqInner): TQuery_OOP; overload;

    function Equals(fieldName: string; value: string): TQuery_OOP; overload;
    function Equals(fieldName: string; value: Integer): TQuery_OOP; overload;
    function Between(fieldName: string; value1, value2: TDateTime): TQuery_OOP;
    function InCond(fieldName, value: string; addNot: Boolean = False): TQuery_OOP;
    function Conditional(fieldName, cond, value: string; quoteString: Boolean = True): TQuery_OOP;
    function OrderBy(fieldsName: string): TQuery_OOP;
    function GroupBy(fieldsName: string): TQuery_OOP;

//    function Equals(fieldName: string; value: TDateTime): TQuery_OOP; overload;

    property query: TIBQuery read dataSet write dataSet;
    property SQLText: string read GetSQLText;
    property RecNo: Integer read GetRecNo;
    property RecordCount: Integer read GetRecordCount; 
  end;

  QueryHelper = class
  public
    class function Scalar(sqlText: string; query: TIBQuery): ScalarValue; overload;
    class function Scalar(sqlText: string; const Args: array of const; query: TIBQuery): ScalarValue; overload;
    class function CreateObj(query: TIBQuery; sqlText: string = ''): TQuery_OOP;
  end;

implementation

uses
  SysUtils,
  StrUtils,
  DateUtils,
  TypInfo,
  hw_win_utils,
  hw_utils,
  Forms,
  DB;

{ TQuery_OOP }

function TQuery_OOP.fcopy(Afield: string; Index, Count: Integer): string;
begin
  Result := Copy(fstr(Afield), Index, Count);
end;

function TQuery_OOP.Equals(fieldName: string; value: Integer): TQuery_OOP;
begin
  Result := Self;

  dataSet.SQL.Text := GetSqlTextWithoutLinebreak() +
                      IfThen(ContainsText(dataSet.SQL.Text, ' where '), ' and ', ' where ') +
                      Format('%s = %d', [fieldName, value]);
end;

function TQuery_OOP.ExecSQL: TQuery_OOP;
begin
  logs(dataSet.SQL.Text, Self.ClassName + '.ExecSQL');
  LogParamsIfExists();

  if dataSet.Active then
    dataSet.Close;

  if not dataSet.Prepared then
    dataSet.Prepare;

  dataSet.ExecSQL;

  Result := Self;

  logs('', FlogStore.filename, True, FlogStore.timeStarted);
end;

function TQuery_OOP.Table(taleName, fieldsName: string): TQuery_OOP;
var
  text: string;
begin
  logs('', Self.ClassName + '.Table');

  hasFieldNames := False;

  lastTableName := taleName;

  text := Format('select %s from %s', [fieldsName, taleName]);

  Result := Self.SQL(text);
end;

function TQuery_OOP.Equals(fieldName, value: string): TQuery_OOP;
begin
  Result := Self;

  dataSet.SQL.Text := GetSqlTextWithoutLinebreak() +
                      IfThen(ContainsText(dataSet.SQL.Text, ' where '), ' and ', ' where ') +
                      Format('%s = ''%s''', [fieldName, StringReplace(value, '''', '''''', [rfReplaceAll])]);
end;

function TQuery_OOP.Between(fieldName: string; value1,
  value2: TDateTime): TQuery_OOP;
begin
  Result := Self;

  dataSet.SQL.Text := GetSqlTextWithoutLinebreak() +
                      IfThen(ContainsText(dataSet.SQL.Text, ' where '), ' and ', ' where ') +
                      Format('%s >= %s and %s <= %s', [fieldName, datet_fb(value1), fieldName, datet_fb(value2)]);
end;

function TQuery_OOP.Close: TQuery_OOP;
begin
  Result := Self;
  DataSet.Close;
end;

function TQuery_OOP.Conditional(fieldName, cond, value: string;
  quoteString: Boolean): TQuery_OOP;
begin
  Result := Self;

  if quoteString then
    value := QuotedStr(StringReplace(value, '''', '''''', [rfReplaceAll]));

  dataSet.SQL.Text := GetSqlTextWithoutLinebreak() +
                      IfThen(ContainsText(dataSet.SQL.Text, ' where '), ' and ', ' where ') +
                      Format('%s %s %s', [fieldName, cond, value]);
end;

constructor TQuery_OOP.Create(query: TIBQuery; sqlText: string);
begin
  dataSet := query;
  if sqlText <> '' then
    dataSet.SQL.Text := sqlText;
  
  Floggeral := IniConf.ReadStr('Sistema', 'Loggeral', '');
end;

function TQuery_OOP.Eof: Boolean;
begin
  Result := DataSet.Eof;
end;

function TQuery_OOP.fcopy(Afield: string; Count: Integer): string;
begin
  Result := fcopy(Afield, 1, Count);
end;

function TQuery_OOP.fcurr(Afield: string): Currency;
begin
  Result := dataSet.FieldByName(Afield).AsCurrency;
end;

function TQuery_OOP.fcurr(Afield: string; const ADigit: TRoundToRange): Currency;
begin
  Result := RoundTo(dataSet.FieldByName(Afield).AsFloat, ADigit);
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

function TQuery_OOP.Fields(values: array of string; alias: string): TQuery_OOP;
var
  I, idx: Integer;
  fields, field, text: string;
begin
  logs('', Self.ClassName + '.Fields');

  idx := Pos('from ' + lastTableName, dataSet.SQL.Text);

  if idx = -1 then
    raise Exception.Create('lastTableName not exists in SQL.Text');

  text := dataSet.SQL.Text;

  alias := IfThen(Trim(alias) <> '', Trim(alias) + '.');

  fields := '';
  for I := Low(values) to High(values) do
    if Trim(values[I]) <> '' then
      fields := fields + IfThen(fields <> '', ',') + alias + Trim(values[I]);

  fields := IfThen(hasFieldNames, ',') + fields;
  hasFieldNames := True; // Se necessario for, adicionar um resetSql para ajustar esse hasFieldNames

  text := Format('%s %s %s', [Trim(Copy(text, 1, idx - 1)), fields, Copy(text, idx, Length(text))]);

  Result := Self.SQL(text);
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

function TQuery_OOP.flist(Afield: string; DupIgnore: Boolean): TStrings;
begin
  Result := flist(Afield, sLineBreak, DupIgnore);
end;

function TQuery_OOP.flist(Afield, aLineBreak: string;
  DupIgnore: Boolean): TStrings;
var
  rNo: Integer;
begin
  Result := NewStringList(DupIgnore, '', aLineBreak);
  if dataSet.IsEmpty then
    Exit;

  rNo := dataSet.RecNo;
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      if not fempty(Afield) then
        Result.Add(fstr(Afield));
      dataSet.Next;
    end;
  finally
    dataSet.RecNo := rNo;
  end;
end;

function TQuery_OOP.fnull(Afield: string): Boolean;
begin
  Result := dataSet.FieldByName(Afield).IsNull;
end;

function TQuery_OOP.fstr(Afield: string; index, count: Integer;
  atrim: Boolean): string;
begin
  Result := Copy(fstr(Afield, atrim), index, count);
end;

function TQuery_OOP.GetRecNo: Integer;
begin
  Result := dataSet.RecNo;
end;

function TQuery_OOP.GetRecordCount: Integer;
begin
  Result := dataSet.RecordCount;
end;

function TQuery_OOP.GetSQLText: string;
begin
  Result := dataSet.SQL.Text;
end;

function TQuery_OOP.GetSqlTextWithoutLinebreak(ATrim: Boolean): string;
var
  resLNB: string;
begin
  resLNB := dataSet.SQL.LineBreak;
  dataSet.SQL.LineBreak := ' ';
  try
    Result := dataSet.SQL.Text;

    if ATrim then
      Result := Trim(Result);
  finally
    dataSet.SQL.LineBreak := resLNB;
  end;
end;

function TQuery_OOP.GroupBy(fieldsName: string): TQuery_OOP;
begin
  Result := Self;

  dataSet.SQL.Add(Format('group by %s', [fieldsName]));
end;

function TQuery_OOP.fstr(Afield: string; Atrim: Boolean): string;
begin
  Result := dataSet.FieldByName(Afield).AsString;
  if Atrim then
    Result := Trim(Result);
end;

function TQuery_OOP.IncCodigo(tabela: string; cod_empresa: Integer): Integer;
begin
  dataSet.Close;
  Result := SQL('select cod from INCREMENTA_CODIGO(:cod_empresa, :tabela)')
    .ParamValue('tabela', tabela)
    .ParamValue('cod_empresa', cod_empresa)
    .Scalar.AsInteger;
end;

function TQuery_OOP.InCond(fieldName, value: string;
  addNot: Boolean): TQuery_OOP;
begin
  Result := Self;

  dataSet.SQL.Text := GetSqlTextWithoutLinebreak() +
                      IfThen(ContainsText(dataSet.SQL.Text, ' where '), ' and ', ' where ') +
                      Format('%s %s in (%s)', [fieldName, IfThen(addNot, 'not'), value]);
end;

function TQuery_OOP.IsEmpty: Boolean;
begin
  Result := DataSet.IsEmpty;
end;

function TQuery_OOP.Join(joinTable, fieldsJoin: string;
  sqlJoin: TSqlJoin): TQuery_OOP;
var
  text: string;
begin
  text := IfThen(sqlJoin = sqInner, 'inner', IfThen(sqlJoin = sqLeft, 'left', 'right'));

  text := Format('%s %s join %s on %s', [dataSet.Text, text, joinTable, fieldsJoin]);

  Result := Self.SQL(text);
end;

function TQuery_OOP.Last: TQuery_OOP;
begin
  Result := Self;
  DataSet.Last;
end;

procedure TQuery_OOP.LogParamsIfExists;
var
  I: Integer;
  paramsText, prText: string;
begin
  paramsText := '';
  for I := 0 to dataSet.Params.Count - 1 do
  begin
    case dataSet.Params[I].DataType of

      ftString, ftWideString:
        prText := dataSet.Params[I].AsString;

      ftSmallint, ftInteger, ftWord, ftLargeint:
        prText := IntToStr(dataSet.Params[I].AsInteger);

      ftFloat, ftCurrency:
        prText := FloatToStr(dataSet.Params[I].AsFloat);

      ftDate:
        prText := FormatDateTime('dd/MM/yyyy', dataSet.Params[I].AsDate);

      ftTime:
        prText := FormatDateTime('hh:mm:ss', dataSet.Params[I].AsTime);

      ftDateTime:
        prText := FormatDateTime('dd/MM/yyyy hh:mm:ss', dataSet.Params[I].AsDateTime);

      else
        prText := '? ' + GetEnumName(TypeInfo(TFieldType), Ord(dataSet.Params[I].DataType));
    end;

    paramsText := paramsText + IfThen(I > 0, ',') + Format('%s=%s', [dataSet.Params[I].Name, prText]);
  end;

  if Trim(paramsText) <> '' then
      logs(paramsText, Self.ClassName + '.Params');
end;

procedure TQuery_OOP.logs(Atext, Afilename: string; Asingleline: Boolean;
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

    end;
  end;
end;

function TQuery_OOP.Next: TQuery_OOP;
begin
  Result := Self;
  DataSet.Next;
end;

function TQuery_OOP.Open(sqlText: string; const Args: array of const): TQuery_OOP;
begin
  Result := Self.Open(Format(sqlText, Args));
end;

function TQuery_OOP.OrderBy(fieldsName: string): TQuery_OOP;
begin
  Result := Self;

  dataSet.SQL.Add(Format('order by %s', [fieldsName]));
end;

function TQuery_OOP.Open: TQuery_OOP;
begin
  logs(dataSet.SQL.Text, Self.ClassName + '.Open');
  LogParamsIfExists();

  dataSet.Close;
  dataSet.Open;

  Result := Self;

  logs('', FlogStore.filename, True, FlogStore.timeStarted);
end;

function TQuery_OOP.ParamValue(param, value: string): TQuery_OOP;
begin
  Result := Self;
  if Result.query.Active then
    Result.query.Close;

  Result.query.ParamByName(param).AsString := value;
end;

function TQuery_OOP.ParamValue(param: string; value: Integer): TQuery_OOP;
begin
  Result := Self;
  if Result.query.Active then
    Result.query.Close;
    
  Result.query.ParamByName(param).AsInteger := value;
end;

function TQuery_OOP.Scalar(sqlText: string;
  const Args: array of const): ScalarValue;
begin
  Result := Scalar(Format(sqlText, Args));
end;

function TQuery_OOP.SQL(sqlText: string;
  const Args: array of const): TQuery_OOP;
begin
  Result := Self.SQL(Format(sqlText, Args));
end;

function TQuery_OOP.Scalar: ScalarValue;
begin
  with Open().query do
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
  query.Close;
end;

function TQuery_OOP.SQL(sqlText: string): TQuery_OOP;
begin
  logs('', Self.ClassName + '.SQL');

  Result := Self;

  query.SQL.Text := sqlText;
end;

function TQuery_OOP.Scalar(sqlText: string): ScalarValue;
begin
  dataSet.Close;
  dataSet.SQL.Text := sqlText;

  Result := Scalar();
  (*
  with Open().query do
  begin
    Result.Value := Fields[0].Value;
    Result.AsString := Fields[0].AsString;
    {$IFNDEF VER180}
    if Fields[0].DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftShortint, ftLargeint, ftExtended, ftSingle, ftAutoInc] then
    {$ELSE}
    if Fields[0].DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftLargeint, ftAutoInc] then
    {$ENDIF}
    begin
      Result.AsInteger := Fields[0].AsInteger;
      Result.AsFloat := Fields[0].AsInteger;
    end;
    if Fields[0].DataType in [ftDateTime, ftDate, ftTime] then
    begin
      Result.AsDateTime := Fields[0].AsDateTime;
      Result.AsDate := DateOf(Fields[0].AsDateTime);
      Result.AsDateTime := TimeOf(Fields[0].AsDateTime);
    end;
  end;
  query.Close;
  *)
end;

function TQuery_OOP.Open(sqlText: string): TQuery_OOP;
begin
  logs(sqlText, Self.ClassName + '.Open');

  dataSet.Close;
  dataSet.SQL.Text := sqlText;
  dataSet.Open;

  Result := Self;

  logs('', FlogStore.filename, True, FlogStore.timeStarted);
end;

function TQuery_OOP.ParamAsCurrency(param: string; value: Currency): TQuery_OOP;
begin
  Result := Self;
  if Result.query.Active then
    Result.query.Close;

  Result.query.ParamByName(param).AsCurrency := value;
end;

function TQuery_OOP.ParamAsDateTime(param: string;
  value: TDateTime): TQuery_OOP;
begin
  Result := Self;
  if Result.query.Active then
    Result.query.Close;

  Result.query.ParamByName(param).AsDateTime := value;
end;

function TQuery_OOP.ParamAsFloat(param: string; value: Double): TQuery_OOP;
begin
  Result := Self;
  if Result.query.Active then
    Result.query.Close;

  Result.query.ParamByName(param).AsFloat := value;
end;

function TQuery_OOP.ParamIncCodigo(param, ATableName: string): TQuery_OOP;
//const
//  CHRS_END: array[1..3] of string = (',', ' ', ')');
var
  S, sSQL, sParam: string;
  I: Integer;
begin
  Result := Self;

  sParam := param;

  if (not StartsStr(':', sParam)) or (not StartsStr('@', sParam)) then
    sParam := ':' + sParam;

  if Trim(ATableName) = '' then
    ATableName := lastTableName;

  S := Format('select cod from incrementa_codigo(%s, ''%s'')', [':cod_empresa', ATableName ]);

  if not ContainsText(Result.query.SQL.Text, '(' + sParam + ')') then
    S := '(' + S + ')';

  Result := ParamReplace( param, S );
    {

  sSQL := Result.query.SQL.Text;
  for I := Low(CHRS_END) to High(CHRS_END) do
    if ContainsText(sSQL, param + CHRS_END[I]) then // ":id," ou ":id " ou ":id)"
    begin
      sSQL := StringReplace(sSQL, param + CHRS_END[I], S + CHRS_END[I], [ rfIgnoreCase ]);
      Result.SQL(sSQL);
      Break;
    end;
    }
end;

function TQuery_OOP.ParamReplace(param, value: string): TQuery_OOP;
const
  CHRS_END: array[1..6] of string = (',', ' ', ')', sLineBreak, #10, #9{tab} );
var
  S, sSQL: string;
  I: Integer;
begin
  Result := Self;

  if (not StartsStr(':', param)) or (not StartsStr('@', param)) then
    param := ':' + param;

  sSQL := Result.query.SQL.Text;
  for I := Low(CHRS_END) to High(CHRS_END) do
    if ContainsText(sSQL, param + CHRS_END[I]) then // ":id," ou ":id " ou ":id)"
    begin
      sSQL := StringReplace(sSQL, param + CHRS_END[I], value + CHRS_END[I], [ rfIgnoreCase ]);
      Result.SQL(sSQL);
      Break;
    end;

  {
  Result := Self;

  Result.SQL(StringReplace(Result.query.SQL.Text, param, value, [rfReplaceAll, rfIgnoreCase]));
  }
end;

{ QueryHelper }

class function QueryHelper.CreateObj(query: TIBQuery; sqlText: string): TQuery_OOP;
begin
  Result := TQuery_OOP.Create(query, sqlText);
end;

class function QueryHelper.Scalar(sqlText: string;
  const Args: array of const; query: TIBQuery): ScalarValue;
begin
  Result := QueryHelper.Scalar(Format(sqlText, Args), query);
end;

class function QueryHelper.Scalar(sqlText: string;
  query: TIBQuery): ScalarValue;
var
  helper: TQuery_OOP;
begin
  helper := TQuery_OOP.Create(query);
  try
    Result := helper.Scalar(sqlText);
  finally
    helper.Free;
  end;
end;

end.
