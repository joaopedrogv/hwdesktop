unit hw_filters;

interface

uses
  Classes, DB, Contnrs;

type
  FilterConditionEnum = (
    feEquals, feStartsWith, feContains, feEndsWith, feBetween, feNotEquals,
    feGreat, feGreatOrEquals,
    feLess, feLessOrEquals,
    feIsEmpty, feNotEmpty,
    feNull, feNotNull
  );

  FilterConditionEnumSet = set of FilterConditionEnum;

const
  COND_LIST_ALL: array[FilterConditionEnum] of string =
    ('Igual', 'Começa', 'Esta contido', 'Termina com', 'Entre', 'Diferente', 'Maior', 'Maior ou Igual', 'Menor', 'Menor ou Igual', 'Vazio', 'Não vazio', 'Nulo', 'Não nulo');

  COND_SQL: array[FilterConditionEnum] of string =
    ('=', 'like%', '%like%', '%like', 'between', '<>', '>', '>=', '<', '<=', 'empty', 'notempty', 'isnull', 'isnotnull');

  COND_LIST_STRINGS: array[1..14] of string =
    ('Igual', 'Começa', 'Esta contido', 'Termina com', 'Entre', 'Diferente', 'Maior', 'Maior ou Igual', 'Menor', 'Menor ou Igual', 'Vazio', 'Não vazio', 'Nulo', 'Não nulo');

  COND_LIST_NUMBERS: array[1..9] of string =
    ('Igual', 'Diferente', 'Entre', 'Maior', 'Maior ou Igual', 'Menor', 'Menor ou Igual', 'Vazio', 'Não vazio');

  FilterSetString: FilterConditionEnumSet = [
    feEquals, feStartsWith, feContains, feEndsWith, feBetween, feNotEquals, feGreat, feGreatOrEquals,
    feLess, feLessOrEquals, feIsEmpty, feNotEmpty, feNull, feNotNull
  ];

  FilterSetNumbers: FilterConditionEnumSet = [
    feEquals, feNotEquals, feBetween, feGreat, feGreatOrEquals, feLess, feLessOrEquals, feIsEmpty, feNotEmpty
  ];

type
  TFieldTypeDB = TFieldType;

  {$M+}
  TFilterProps = class
  private
    FIsPrivateHandled: Boolean;
    FIsCaseSensitive: Boolean;
    Ffield: string;
    Fcondition: string;
    Fvalue: string;
    Fcaption: string;
    Fdate2: TDateTime;
    Fdate1: TDateTime;
    Ftype: TFieldTypeDB;
    FisEnum: Boolean;
    FisNotCondition: Boolean;
    FisHandled: Boolean;
    Fbetween2: string;
    Fbetween1: string;

    procedure Prepare();
    //function IsPrivateHandled: Boolean;
    property IsPrivateHandled: Boolean read FIsPrivateHandled;
  public
    function Clone: TFilterProps;
    function GetDisplayRead: string;
    function IsValidQueryable(var error: string): Boolean;
    function GetCondition(): FilterConditionEnum;
  published
    property field         : string       read Ffield          write Ffield;
    property condition     : string       read Fcondition      write Fcondition;
    property caption       : string       read Fcaption        write Fcaption;
    property type_         : TFieldTypeDB read Ftype           write Ftype;
    property value         : string       read Fvalue          write Fvalue;
    property date1         : TDateTime    read Fdate1          write Fdate1;
    property date2         : TDateTime    read Fdate2          write Fdate2;
    property between1      : string       read Fbetween1       write Fbetween1;
    property between2      : string       read Fbetween2       write Fbetween2;
    property isEnum        : Boolean      read FisEnum         write FisEnum;
    property isNotCondition: Boolean      read FisNotCondition write FisNotCondition;
    property isHandled     : Boolean      read FisHandled      write FisHandled;
  end;
  {$M-}

  TFiltersProps = array of TFilterProps;

  TFilterPropsList = class(TObjectList)
  private
    function GetItem(Index: Integer): TFilterProps;
    procedure SetItem(Index: Integer; const Value: TFilterProps);
  public
    function New: TFilterProps;
    function IndexOfDisplay(const sDisplay: string): Integer;

    property Items[Index: Integer]: TFilterProps read GetItem write SetItem;
  end;

  ArrayString = array of string;

  FilterMaker = class
  strict private
    function Add(field, value: string; type_: TFieldTypeDB; condition: string): FilterMaker; overload;
    function Add(const Field, Value: string; Type_: TFieldTypeDB; Condition: FilterConditionEnum): FilterMaker; overload;
  private
    Fitems: TFiltersProps;
    FJoins: TStrings;
    Ffirst: Integer;
    ForderBy: string;
    Fwhere: string;
    Fdistinct: Boolean;
    FfieldsSel: ArrayString;
    FieldsCaseSensitive: TStrings;
    DefaultCaseSensitive: Boolean;
    function Prepare(): FilterMaker;
    function GetField(const FieldName: string): TFilterProps;
  public
    constructor Create();
    destructor Destroy; override;

    function FreeFilters(): FilterMaker;
    function Add(payload: TFilterProps): FilterMaker; overload;
    function Add(range: TFiltersProps): FilterMaker; overload;
    function Add(field, value: string; condition: string): FilterMaker; overload;
    function Add(field, value, condition: string; isHandled: Boolean): FilterMaker; overload;
    function Add(field, value: string; isEnum: Boolean; condition: string = '='): FilterMaker; overload;
    function Add(field: string; value: array of Integer; isEnum: Boolean = True; condition: string = '='): FilterMaker; overload;
    function Add(field: string; date1, date2: TDateTime; condition: string = 'between'): FilterMaker; overload;
    function Add(field : string; value: Integer; condition: string = '='): FilterMaker; overload;
    function Add(field : string; value: Double; condition: string = '='): FilterMaker; overload;
    function AddIsNull(field : string; isNull: Boolean): FilterMaker;

    // Melhor utilizar o Enumerado no lugar da condicao String
    function Add(const field, value: string; Condition: FilterConditionEnum = feEquals): FilterMaker; overload;
    function IsActive(): FilterMaker;

    property Items: TFiltersProps read Fitems write Fitems;
    property Field[const FieldName: string]: TFilterProps read GetField;
  end;

  TSqlMaker = class//(FilterMaker)
  strict private
    InternalSQL: string;
    RunAsSubSQL: Boolean;
    Ffilter: FilterMaker;

    FtableName: string;
    tableSelectName: string;
    FaliasTbSql: string;
    FfieldsSql: string;
    FjoinSql: string;
    FwhereSql: string;
    FGroupBySql: string;
    ForderSql: string;

    function handleAliasCommandSql(fieldName: string): string;
    function GetSearchSql(value: TFilterProps): string;
    function GetInternalSQL(): string;
  public
    function Build(
      tbName, aliasTb, fields, joins, where, orders: string; defaultCaseSensitive: Boolean = False
    ): TSqlMaker; overload;
    function Build(
      tbName, aliasTb, fields, joins, where, groupBy, orders: string; defaultCaseSensitive: Boolean = False
    ): TSqlMaker; overload;
    function ChangeCaseSentitive(const fields: string; isCaseSensitive: Boolean): TSqlMaker;
    destructor Destroy; override;

    function ClearSql(): TSqlMaker; // limpa o internalsql
    function Union(distinct: Boolean = False): TSqlMaker; // esse union vai gerar o sql
    function GetSQL(orderByOverwrite: string = ''): string; // retorna o sql completo

    // Caso necessario adicionar nessa classe, a outra lida com o field, essa com a table e joins
    //function SetDistinct(value: Boolean = True; sFields: string = ''): TSqlMaker;
    //function SetFirst(value: Integer): TSqlMaker;

    property FilterMk: FilterMaker read Ffilter write Ffilter;
    property TableName: string read FtableName;
    property AliasTbSql: string read FaliasTbSql;
    property FieldsSql: string read FfieldsSql;
    property JoinSql: string read FjoinSql;
    property WhereSql: string read FwhereSql;
    property GroupBySql: string read FGroupBySql;
    property OrderSql: string read ForderSql;
    //property Distinct: Boolean read Fdistinct;
  end;

implementation

uses
  SysUtils,
  StrUtils,
  DateUtils,
  json_utils;

{ FilterMaker }

function FilterMaker.Add(payload: TFilterProps): FilterMaker;
begin
  SetLength(Fitems, Length(Fitems) + 1);
  Fitems[High(Fitems)] := payload;
  Result := Self;
end;

function FilterMaker.Add(field, value: string; type_: TFieldTypeDB;
  condition: string): FilterMaker;
var
  item: TFilterProps;
begin

  item := TFilterProps.Create;
  item.field := field;
  item.condition := condition;
  item.type_ := type_;
  item.value := value;

  Result := Add(item);
end;

function FilterMaker.Add(field, value, condition: string): FilterMaker;
begin
  Result := Add(field, value, ftString, condition);
end;

function FilterMaker.Add(field: string; date1, date2: TDateTime;
  condition: string): FilterMaker;
var
  item: TFilterProps;
begin

  item := TFilterProps.Create;
  item.field := field;
  item.condition := condition;
  item.type_ := ftDateTime;
  item.date1 := date1;
  item.date2 := date2;

  Result := Add(item);
end;

function FilterMaker.Add(field: string; value: Double;
  condition: string): FilterMaker;
begin
  Result := Add(field, ReplaceStr(ReplaceStr(FloatToStr(value), '.', ''), ',', '.'), ftFloat, condition);
end;

function FilterMaker.Add(range: TFiltersProps): FilterMaker;
var
  I: Integer;
begin
  for I := Low(range) to High(range) do
    Add(range[I]);

  Result := Self;
end;

function FilterMaker.AddIsNull(field: string; isNull: Boolean): FilterMaker;
begin
  Result := Add(field, '', ftUnknown, IfThen(isNull, 'isnull', 'isnotnull'));
end;

constructor FilterMaker.Create;
begin
  FJoins := TStringList.Create;
  FieldsCaseSensitive := TStringList.Create;
  DefaultCaseSensitive := False;
end;

destructor FilterMaker.Destroy;
begin
  FreeFilters();
  FJoins.Free;
  FieldsCaseSensitive.Free;

  inherited;
end;

function FilterMaker.FreeFilters: FilterMaker;
var
  I: Integer;
begin
  Result :=  Self;

  for I := Low(Fitems) to High(Fitems) do
    FreeAndNil(Fitems[I]);

  SetLength(Fitems, 0);
  Ffirst := 0;
  ForderBy := '';
  Fwhere := 'default';
  Fdistinct := False;
  SetLength(FfieldsSel, 0);
  FJoins.Clear;
end;

function FilterMaker.GetField(const FieldName: string): TFilterProps;
var
  I: Integer;
begin
  Result := nil;
  for I := Low(Fitems) to High(Fitems) do
    if Trim(AnsiUpperCase(Fitems[I].field)) = Trim(AnsiUpperCase(FieldName)) then
    begin
      Result := Fitems[I];
      Exit;
    end;
end;

function FilterMaker.IsActive: FilterMaker;
begin
  Result := Self.Add('ativo', 1);
end;

function FilterMaker.Prepare: FilterMaker;
var
  I: Integer;
begin
  Result :=  Self;

  for I := Low(Fitems) to High(Fitems) do
    if (not Fitems[I].isHandled) and (Fitems[I].type_ = ftString) then
    begin
      if FieldsCaseSensitive.IndexOfName(AnsiLowerCase(Fitems[I].field)) >= 0 then
      begin
        if not StrToBool(FieldsCaseSensitive.Values[AnsiLowerCase(Fitems[I].field)]) then
        begin
          Fitems[I].value := AnsiUpperCase(Fitems[I].value);
          Fitems[I].between1 := AnsiUpperCase(Fitems[I].between1);
          Fitems[I].between2 := AnsiUpperCase(Fitems[I].between2);
        end;
      end
      else if not DefaultCaseSensitive then
      begin
        Fitems[I].value := AnsiUpperCase(Fitems[I].value);
        Fitems[I].between1 := AnsiUpperCase(Fitems[I].between1);
        Fitems[I].between2 := AnsiUpperCase(Fitems[I].between2);
      end;
    end;
end;

function FilterMaker.Add(field: string; value: array of Integer; isEnum: Boolean;
  condition: string): FilterMaker;
var
  item: TFilterProps;
  I: Integer;
begin

  item := TFilterProps.Create;
  item.field := field;
  item.condition := '=';
  item.type_ := ftInteger;
  item.value := '';

  for I in value do
    item.value := item.value + IfThen(Trim(item.value) <> '', ',') + IntToStr(I);

  item.isEnum := isEnum;

  Result := Add(item);
end;

function FilterMaker.Add(field, value, condition: string;
  isHandled: Boolean): FilterMaker;
var
  item: TFilterProps;
begin

  item := TFilterProps.Create;
  item.field := field;
  item.condition := condition;
  item.type_ := ftUnknown;
  item.value := value;
  item.isHandled := isHandled;

  Result := Add(item);

end;

function FilterMaker.Add(field, value: string; isEnum: Boolean;
  condition: string): FilterMaker;
var
  item: TFilterProps;
begin

  item := TFilterProps.Create;
  item.field := field;
  item.condition := '=';
  item.type_ := ftInteger;
  item.value := value;
  item.isEnum := isEnum;

  Result := Add(item);
end;

function FilterMaker.Add(field: string; value: Integer;
  condition: string): FilterMaker;
begin
  Result := Add(field, IntToStr(value), ftInteger, condition);
end;

function FilterMaker.Add(const field, value: string; Condition: FilterConditionEnum): FilterMaker;
begin
  Result := Self.Add( field, value, ftString, Condition );
end;

function FilterMaker.Add(const Field, Value: string; Type_: TFieldTypeDB; Condition: FilterConditionEnum): FilterMaker;
var
  item: TFilterProps;
begin
  item := TFilterProps.Create;
  item.field := Field;
  item.condition := COND_LIST_ALL[Condition];
  item.type_ := Type_;
  item.value := Value;

  Result := Add(item);
end;

{ TSqlMaker }

function TSqlMaker.ChangeCaseSentitive(const fields: string;
  isCaseSensitive: Boolean): TSqlMaker;
var
  flist: TStringList;
  I: Integer;
begin
  Result := Self;

  flist := TStringList.Create;
  try
    flist.LineBreak := ',';
    flist.Text := AnsiLowerCase(ReplaceText(fields, ';', ','));

    for I := 0 to flist.Count - 1 do
      Ffilter.FieldsCaseSensitive.Values[flist[I]] := BoolToStr(isCaseSensitive);
  finally
    flist.Free;
  end;
end;

function TSqlMaker.ClearSql: TSqlMaker;
begin
  Result := Self;

  InternalSQL := '';
  Ffilter.FreeFilters();
end;


function TSqlMaker.Build(tbName, aliasTb, fields, joins, where, groupBy, orders: string;
  defaultCaseSensitive: Boolean): TSqlMaker;
begin
  Result := Self;

//  hasStoreProps := True;
  FtableName := tbName;
  tableSelectName := tbName;
  FaliasTbSql := IfThen(Trim(aliasTb) <> '', Trim(aliasTb), FtableName);
  FfieldsSql := fields;
  FjoinSql := joins;
  FwhereSql := where;
  FGroupBySql := groupBy;
  ForderSql := orders;

  Ffilter := FilterMaker.Create;
  Ffilter.DefaultCaseSensitive := defaultCaseSensitive;

  if (ContainsText(FfieldsSql, 'coalesce(') or ContainsText(FfieldsSql, 'case when') or ContainsText(FfieldsSql, 'iif('))
    and (ContainsText(ForderSql, '.')) then
    raise Exception.Create('TSqlMaker.Build > Campos com coalesce, case when ou iif. No orderby não use alias como "a.numero, tabela.data desc", use apenas "numero, data desc" ');
end;

function TSqlMaker.Build(tbName, aliasTb, fields, joins, where, orders: string;
  defaultCaseSensitive: Boolean): TSqlMaker;
begin
  Result := Self.Build(
    tbName, aliasTb, fields, joins, where, '', orders, defaultCaseSensitive
  );
end;

destructor TSqlMaker.Destroy;
begin
  if Assigned(Ffilter) then
  begin
    Ffilter.FreeFilters();
    Ffilter.Free;
  end;

  inherited;
end;

function TSqlMaker.GetInternalSQL: string;
var
  field: string;
  fieldSql: string;
  firstSql: string;
  distinctSql: string;
  selFields: string;
  sql: string;
  where: string;
  joinF: string;
  fieldProp: TFilterProps;
begin
  fieldSql := '';
  firstSql := ' ';   // IfThen(Ffilter.first > 0, ' first ' + IntToStr(Ffilter.first) + ' ');
  distinctSql := ''; // IfThen(Ffilter.distinct, ' distinct ');
  selFields := Trim(fieldsSql);
  RunAsSubSQL := ContainsText(selFields, 'coalesce(') or ContainsText(selFields, 'case when') or ContainsText(selFields, 'iif(');

  sql := 'select ' + firstSql + distinctSql + Trim(selFields) + ' from ' + tableSelectName + ' ' + aliasTbSql;
  where := '';

  if Trim(joinSql) <> '' then
    sql := sql + ' ' + Trim(joinSql);

  if Trim(whereSql) <> '' then
    sql := sql + ' where ' + Trim(whereSql);

  if Trim(FGroupBySql) <> '' then
    sql := sql + ' group by ' + Trim(FGroupBySql);

  if RunAsSubSQL then
    sql := Format('select * from (%s) as s', [sql]);

  Ffilter.Prepare();
  for fieldProp in Ffilter.items do
  begin
    fieldSql := GetSearchSql(fieldProp);

    where := where + IfThen(Trim(where) = '', ' where ', ' and ') + fieldSql;
  end;

  if Trim(where) <> '' then
    sql := sql + where;

  if Trim(orderSql) <> '' then
    sql := sql + ' order by ' + Trim(orderSql);

  Result := sql;
end;

function TSqlMaker.GetSearchSql(value: TFilterProps): string;
  function date_fb(data: TDateTime): string;
  begin
    Result := QuotedStr(FormatDateTime('YYYY-MM-DD', data));
  end;
  function datet_fb(data: TDateTime): string;
  begin
    Result := QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss.zzz', data));
  end;
begin
  value.Prepare();
  // parece que falta "nao é nulo" talvez nao precise
  Result := handleAliasCommandSql(value.field);

  if (value.IsPrivateHandled) and (value.condition = 'between') then
    Result := Result + ' between ' + value.between1 + ' and ' + value.between2

  else if (value.isHandled) and ContainsText(value.condition, 'exists') then // nao usa o fieldname
    Result := value.condition + value.value

  else if (value.isHandled) then
    Result := Result + ' ' + value.condition + value.value

  else if value.condition = 'isnull' then
    Result := Result + ' is null'

  else if value.condition = ('isnotnull') then
    Result := Result + ' is not null'

  else if (value.condition = 'empty') and (value.type_ = ftString) then
    Result := 'coalesce(' + Result + ', '''') = '''''

  else if (value.condition = 'notempty') and (value.type_ = ftString) then
    Result := 'coalesce(' + Result + ', '''') <> '''''

  else if (value.condition = 'empty') and (value.type_ in [ftDate, ftDateTime, ftTime, ftTimeStamp]) then
    Result := Result + ' is null'

  else if (value.condition = 'notempty') and (value.type_ in [ftDate, ftDateTime, ftTime, ftTimeStamp]) then
    Result := Result + ' is not null'

  else if (value.condition = 'empty') {and value.isEnum} then
    Result := Result + ' is null'

  else if (value.condition = 'notempty') {and value.isEnum} then
    Result := Result + ' is not null'

  else if value.condition = ('null') then
    Result := ' coalesce(' + Result + ', 0) = 0'

  else if (value.type_ in [ftDate, ftDateTime, ftTime, ftTimeStamp]) then
  begin
    if (value.date1 > 0) and (value.date2 > 0) then
    begin
      if value.type_ = ftTime then
        raise Exception.Create('Conversao ftTime não implementada')
      else if value.type_ = ftDate then
        Result := Format(' %s >= %s and %s <= %s', [Result, date_fb(value.date1), Result, date_fb(value.date2)])
      else
        Result := Format(' %s >= %s and %s <= %s', [Result, datet_fb(value.date1), Result, datet_fb(value.date2)]);
    end
    else if value.type_ = ftTime then
      raise Exception.Create('Conversao ftTime não implementada 2')
    else if value.type_ = ftDate then
      Result := Format(' %s %s %s', [Result, value.condition, date_fb(value.date1)])
    else
      Result := Format(' %s %s %s', [Result, value.condition, datet_fb(value.date1)])
  end

  else if value.isEnum then
    Result := Result +  IfThen(value.condition = ('<>'), ' not') + ' in (' + value.value + ')'

  else if MatchText(value.condition, [ 'like', '%like', '%like%', 'like%' ]) then
    Result := Result + ' like ' + QuotedStr(ReplaceText(value.condition, 'like', value.value))

  else if (value.type_ = ftString)  then
    Result := Result + ' ' + value.condition + QuotedStr(value.value)

  else if (value.type_ in [ ftFloat, ftCurrency, ftBCD ])  then
    Result := Result + ' ' + value.condition + ReplaceStr(ReplaceStr(value.value, '.', ''), ',', '.')

  else if (value.type_ in [ ftInteger, ftLargeint, ftSmallInt ])  then
    Result := Result + ' ' + value.condition + value.value

  else
    raise Exception.Create('Conversao de tipo não mapeado');

  if value.isNotCondition then
    Result := 'not(' + Result + ')';
end;

function TSqlMaker.GetSQL(orderByOverwrite: string): string;
var
  rescueOrder: string;
  rescueFilterOrder: string;
begin
  if tableName = '' then
    raise Exception.Create('Attributos não inicializados. Usar o Build antes');  

  if Trim(orderByOverwrite) <> '' then
  begin
    rescueOrder := orderSql;
    //rescueFilterOrder := FilterMk.orderBy;
    try
      ForderSql := '';
      //FilterMk.SetOrderBy('');

       Result := InternalSQL + GetInternalSQL();

    finally
      ForderSql := rescueOrder;
      //FilterMk.SetOrderBy(rescueFilterOrder);
    end;


    Result :=  'select * from (' + Result + ') order by ' + orderByOverwrite;
  end
  else
    Result := InternalSQL + GetInternalSQL();
end;

function TSqlMaker.handleAliasCommandSql(fieldName: string): string;
var
  I: Integer;
  sql: string;
begin
  if RunAsSubSQL then
  begin
    Result := 's.' + Trim(fieldName);
    Exit;
  end;
//  I := 0;
	sql := AnsiLowerCase(fieldsSql);
  repeat
    sql := ',' + ReplaceStr(ReplaceStr(LowerCase(sql), ', ', ','), ' ,', ',') + ',';
  until (Pos(', ', sql) = 0) and (Pos(' ,', sql) = 0) ;

  fieldName := AnsiLowerCase(fieldName);

  if ContainsText(sql, ' ' + fieldName + ',') then
  begin
    Result := '';

    I := Pos(' ' + fieldName + ',', sql) - 1;
    while (I > 0) and (sql[I] <> ',') do
    begin
      Result := sql[I] + Result;
      I := I - 1;
    end;
  end
  else if ContainsText(sql, '.' + fieldName + ',') then
  begin
    Result := '';
    I := Pos('.' + LowerCase(fieldName) + ',', sql) - 1;
    while (I > 0) and (sql[I] <> ',') do
    begin
      Result := sql[I] + Result;
      I := I - 1;
    end;

    Result := Result + '.' + fieldName;

  end
  else if ContainsText(sql, ',' + fieldName + ',') then
    Result := aliasTbSql + '.' + fieldName
  else if ContainsText(sql, ',' + aliasTbSql + '.*,') then
    Result := aliasTbSql + '.' + fieldName;
end;

function TSqlMaker.Union(distinct: Boolean): TSqlMaker;
var
  rescueOrder: string;
begin
  Result := Self;

  rescueOrder := orderSql;
  try
    ForderSql := '';
    InternalSQL := InternalSQL + GetInternalSQL + ' union ' + IfThen(distinct, 'distinct ', 'all ');
  finally
    ForderSql := rescueOrder;
  end;
end;

{ TFilterProps }

function TFilterProps.Clone: TFilterProps;
begin
  Result := JsonUtils.ToObject(TFilterProps, JsonUtils.ToJson(Self)) as TFilterProps;
end;

function TFilterProps.GetCondition: FilterConditionEnum;
var
  eCond: FilterConditionEnum;
  sCond: string;
begin
  Result := feEquals;

  sCond := AnsiLowerCase(Trim(Fcondition));

  for eCond := Low(COND_LIST_ALL) to High(COND_LIST_ALL) do
    if sCond = AnsiLowerCase(COND_LIST_ALL[eCond]) then
    begin
      Result := eCond;
      Exit;
    end;

  for eCond := Low(COND_SQL) to High(COND_SQL) do
    if sCond = COND_SQL[eCond] then
    begin
      Result := eCond;
      Exit;
    end;
end;

function TFilterProps.GetDisplayRead: string;
var
  I: FilterConditionEnum;
  sCondSql, sCondDisplay, sValueDisplay: string;
begin
  sCondSql := Trim(Fcondition);
  sCondDisplay := sCondSql;

  for I := Low(COND_SQL) to High(COND_SQL) do
    if sCondSql = COND_SQL[I] then
    begin
      sCondDisplay := COND_LIST_ALL[I];
      Break;
    end;

  if sCondDisplay = sCondSql then
    for I := Low(COND_LIST_ALL) to High(COND_LIST_ALL) do
      if AnsiLowerCase(sCondDisplay) = AnsiLowerCase(COND_LIST_ALL[I]) then
      begin
        sCondSql := COND_SQL[I];
        Break;
      end;

  if sCondSql = 'between' then
  begin
    if Self.type_ = ftDateTime then
      sValueDisplay := DateToStr(Fdate1) + ' e ' + DateToStr(Fdate2)

    else
      sValueDisplay := Fbetween1 + ' e ' + Fbetween2;
  end

  else if Self.type_ = ftDateTime then
    sValueDisplay := DateToStr(Fdate1)
  else
    sValueDisplay := value;

  Result := '[' + Fcaption + '] ' + AnsiLowerCase(sCondDisplay) + ' [' + sValueDisplay + ']';
end;

function TFilterProps.IsValidQueryable(var error: string): Boolean;
var
  I: FilterConditionEnum;
  iVal1, iVal2: Integer;
  dVal1, dVal2: Double;
  bCondExist, bTestVal: Boolean;
  sCondSql: string;
begin
  bCondExist := False;
  error := '';

  sCondSql := AnsiLowerCase(Trim(Fcondition));

  for I := Low(COND_LIST_ALL) to High(COND_LIST_ALL) do
    if sCondSql = AnsiLowerCase(COND_LIST_ALL[I]) then
    begin
      sCondSql := COND_SQL[I];
      Break;
    end;

  for I := Low(COND_SQL) to High(COND_SQL) do
    if sCondSql = COND_SQL[I] then
    begin
      bCondExist := True;
      Break;
    end;

  if sCondSql = 'between' then
  begin
    if Self.type_ = ftDateTime then
    begin
      if (Fdate1 <= 0) or (Fdate2 <= 0) then
        error := 'Valores de data inválidos'

      else if Fdate1 > Fdate2 then
        error := 'Data inicial maior que data final';
    end

    else if Self.type_ = ftFloat then
    begin
      bTestVal := False;
      if not TryStrToFloat(Fbetween1, dVal1) then
        error := Format('Valor inicial [%s] inválido', [Fbetween1])
      else
        bTestVal := True;

      if not TryStrToFloat(Fbetween2, dVal2) then
        error := error + IfThen(error <> '', sLineBreak) + Format('Valor final [%s] inválido', [Fbetween2])

      else if bTestVal then
        if dVal1 > dVal2 then
          error := 'Valor inicial maior que valor final';
    end

    else if Self.type_ = ftInteger then
    begin
      bTestVal := False;
      if not TryStrToInt(Fbetween1, iVal1) then
        error := Format('Valor inicial [%s] inválido', [Fbetween1])
      else
        bTestVal := True;

      if not TryStrToInt(Fbetween2, iVal2) then
        error := error + IfThen(error <> '', sLineBreak) + Format('Valor final [%s] inválido', [Fbetween2])

      else if bTestVal then
        if iVal1 > iVal2 then
          error := 'Valor inicial maior que valor final';
    end

    else
    begin
      if Fbetween1 = '' then
        error := Format('Valor inicial não informado', [Fbetween1]);

      if Fbetween2 = '' then
        error := error + IfThen(error <> '', sLineBreak) + Format('Valor final não informado', [Fbetween2]);
    end
  end
  // ('=', 'like%', '%like%', '%like', 'between', '<>', '>', '>=', '<', '<=', 'empty', 'notempty', 'isnull', 'isnotnull');
  else if not MatchText(sCondSql, ['empty', 'notempty', 'isnull', 'isnotnull']) then
  begin
    // Nao testei data aqui pois o camo já não vai ser convertido e nao precisa ser tratado
    
    if Self.type_ = ftDateTime then
    begin                          
      if (Fdate1 <= 0) then
        error := 'Data inválida'
    end

    else if Self.type_ = ftFloat then
    begin
      if not TryStrToFloat(Fvalue, dVal1) then
        error := Format('Número [%s] inválido', [Fvalue]);
    end

    else if Self.type_ = ftInteger then
    begin
      if not TryStrToInt(Fvalue, iVal1) then
        error := Format('Número inteiro [%s] inválido', [Fvalue]);
    end

    else if Trim(Fvalue) = '' then
      error := Format('Texto não informado', [Fvalue]);
  end;

  if not bCondExist then
    error := Format('Condição inválida [%s]', [Fcondition]) + IfThen(error <> '', sLineBreak) + error;

  if Trim(Fcaption) = '' then
    error := 'Campo não informado' + IfThen(error <> '', sLineBreak) + error

  else if Trim(field) = '' then
    error := 'Field não informado'+ IfThen(error <> '', sLineBreak) + error;

  Result := error = '';
end;

procedure TFilterProps.Prepare();
var
  I: FilterConditionEnum;
  startS, endS: string;
begin
  startS := AnsiLowerCase(Trim(Fcondition));
  endS := startS;
  try
    for I := Low(COND_LIST_ALL) to High(COND_LIST_ALL) do
      if startS = AnsiLowerCase(COND_LIST_ALL[I]) then
      begin
        endS := COND_SQL[I];
        Break;
      end;

    if (Self.type_ <> ftString) and ContainsText(endS, 'like')  then
      raise Exception.Create('pkUtils.FiltersModel > Field <> string and like');
    {
    if (not FisHandled) and ContainsText(endS, 'like') then
    begin
      if (startS = 'esta contido') or (startS = 'começa') then
        value := value + '%';

      if (startS = 'esta contido') or (startS = 'termina com') then
        value := '%' + value;

      //value := QuotedStr(value);

      //FisHandled := True;
    end

    else
    }
    if (not FisHandled) and (endS = 'between') then
    begin

      if Self.type_ = ftString then
      begin
        Fbetween1 := QuotedStr(Fbetween1);
        Fbetween2 := QuotedStr(Fbetween2);
      end

      else if Self.type_ = ftDateTime then
      begin
        Fbetween1 := QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss.zzz', StartOfTheDay(Fdate1)));
        Fbetween2 := QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss.zzz', EndOfTheDay(Fdate2)))
      end

      else if Self.type_ = ftFloat then
      begin
        Fbetween1 := ReplaceStr(ReplaceStr(Self.Fbetween1, '.', ''), ',', '.');
        Fbetween2 := ReplaceStr(ReplaceStr(Self.Fbetween2, '.', ''), ',', '.');
      end;

      FIsPrivateHandled := True;
    end
    // Ajuste quando field = data e hora
    else if (not FisHandled) and (Self.type_ = ftDateTime) then
    begin
      case I of
        feEquals, feNotEquals:
          begin
            Fcondition := COND_SQL[feBetween];

            Fdate1 := StartOfTheDay(Fdate1);
            Fdate2 := EndOfTheDay(Fdate1);

            Fbetween1 := QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss.zzz', StartOfTheDay(Fdate1)));
            Fbetween2 := QuotedStr(FormatDateTime('yyyy-MM-dd hh:mm:ss.zzz', EndOfTheDay(Fdate2)));

            if I = feNotEquals then
              FisNotCondition := True;

            FIsPrivateHandled := True;
          end;

        feGreat:
          Fdate1 := EndOfTheDay(Fdate1);

        feGreatOrEquals:
          Fdate1 := StartOfTheDay(Fdate1);

        feLess:
          Fdate1 := StartOfTheDay(Fdate1);

        feLessOrEquals:
          Fdate1 := EndOfTheDay(Fdate1);
      end;
    end;

  finally
    Fcondition := endS;
  end;
end;

{ TFilterPropsList }

function TFilterPropsList.GetItem(Index: Integer): TFilterProps;
begin
  Result := TFilterProps(inherited Items[Index]);
end;

function TFilterPropsList.IndexOfDisplay(const sDisplay: string): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := 0 to Self.Count - 1 do
    if AnsiLowerCase(Trim(sDisplay)) = AnsiLowerCase(Trim(Self.Items[I].GetDisplayRead)) then
    begin
      Result := I;
      Exit;
    end;
end;

function TFilterPropsList.New: TFilterProps;
begin
  Result := TFilterProps.Create;
  Add(Result);
end;

procedure TFilterPropsList.SetItem(Index: Integer; const Value: TFilterProps);
begin
  Put(Index, Value);
end;

end.
