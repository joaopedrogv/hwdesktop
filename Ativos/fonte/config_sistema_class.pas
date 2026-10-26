unit config_sistema_class;

interface

uses
  IniFiles,
  hw_strings,
{$IFDEF VER180}
  Contnrs,
  Classes,
  DB,
  IBQuery;
{$ELSE}
  System.Classes,
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ENDIF}

const
  typeBlob     = 'blob';
  typeBool     = 'boolean';
  typeString   = 'string';
  typeInt      = 'integer';
  typeFloat    = 'float';
  typeDateTime = 'datetime';

  // Para os comentarios funcionarem é criado uma section sempre ao topo do arquivo,
  // Pois o IniFiles separa as sections a partir do primeiro "[" que ele encontra,
  // E nossos comentarios são adicionados acima
  constkey = 'KSsuhs7SJhda&SA';

type
  RStrings = record
    Text: string;
  end;

  TConfig_sistema_class = class(TObject)
  strict private
    procedure clearConstKey;
  private
    MapKeysMissing : Boolean;
    HasKeysMissing : Boolean;
    Fchave      : string;
    Fcod_empresa: Integer;
    Fdisplay_   : string;
    Ftag        : string;
    Ftype1_     : string;
    Fvalue1_vc  : string;
    Fvalue1_f   : Double;
    Fvalue1_b   : TStringIni;
    Fordem      : Integer;
    Fativo      : Integer;
    Fvalue_dt   : TDateTime;
    FHasComment : Boolean;

    procedure FormatIniConf;
    procedure FormatIniConfFixed;
  public
    constructor Create; overload;
    constructor create(aChave, aDisplay, aTag, aType: string; codEmpresa: Integer); overload;
    destructor Destroy; override;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;
    class function GetFieldsSql(Aalias: string = ''): string; virtual;
    function Clone: TConfig_sistema_class; virtual;

    function SetValuesFrom(ADataSet: TDataSet): TConfig_sistema_class; virtual;
    function WriteString(Section, Ident, Value: string): TConfig_sistema_class;
    function WriteInteger(Section, Ident: string; Value: Integer): TConfig_sistema_class;
    function WriteBool(Section, Ident: string; Value: Boolean): TConfig_sistema_class;
    function ReadString(Section, Ident: string; Default: string = ''): string;
    function ReadInteger(Section, Ident: string; Default: Integer = 0): Integer;
    function ReadBool(Section, Ident: string; Default: Boolean = False): Boolean;
    function ValueExists(const Section, Ident: string): Boolean;
    procedure DeleteKey(const Section, Ident: String);
    function ConfString(Section, Ident, Value: string; formatConf: Boolean = False): TConfig_sistema_class;
    function ConfActive(Section, Ident, Default, Value: string): Boolean;
    function Comment(section, text: string; formatConf: Boolean = False): TConfig_sistema_class; overload;
    function Comment(section: string; const text: array of string; formatConf: Boolean = False): TConfig_sistema_class; overload;
    function InsertLineConf(Section, Ident, Value: string): Boolean;
    function CSVPipe(row, col: Integer): string;
    function GetIniFile: TMemIniFile;
    function AtivarMapeamentoKeys: TConfig_sistema_class;
    function KesyChanges: Boolean;
    function AsBoolean: Boolean;
    function AsInteger: Integer;
    function AsString: string;
    function AsFloat: Double;
    function AsStrings: TStrings;
    function AsRStrings: RStrings;
    function AsDateTime: TDateTime;
    function AsDate: TDateTime;
    function AsTime: TDateTime;
    function GetBlobConf: string;

    function SaveConfDB(ADataSet: TIBQuery): TIBQuery;
    class function getConf(Akey: string; ADataSet: TIBQuery; Acod_Empresa: Integer): TConfig_sistema_class;

    property chave      : string   read Fchave       write Fchave;
    property cod_empresa: Integer  read Fcod_empresa write Fcod_empresa;
    property display_   : string   read Fdisplay_    write Fdisplay_;
    property tag        : string   read Ftag         write Ftag;
    property type1_     : string   read Ftype1_      write Ftype1_;
    property value1_vc  : string   read Fvalue1_vc   write Fvalue1_vc;
    property value1_f   : Double   read Fvalue1_f    write Fvalue1_f;
    property value1_b   : TStringIni read Fvalue1_b    write Fvalue1_b;
    property ordem      : Integer  read Fordem       write Fordem;
    property ativo      : Integer  read Fativo       write Fativo;
    property value_dt   : TDateTime read Fvalue_dt   write Fvalue_dt;
  end;

  TConfig_sistema_classList = class(TObjectList)
  private
    FListEmptyConfs: TObjectList; // so pra retornar no GetConf e nao dar vazamento de memoria depois
    FKeys: TStrings;
    FValidateKeys: Boolean;
    function ReturnoEmpty(): TConfig_sistema_class;
    function GetItem(Index: Integer): TConfig_sistema_class;
    procedure SetItem(Index: Integer; const Value: TConfig_sistema_class);
  public
    constructor Create;
    destructor Destroy; override;

    function New: TConfig_sistema_class; overload;
    function New(Achave, Adisplay, Atag, Atype1_, Avalue1_vc: string; Acod_empresa: Integer; Avalue1_f: Double): TConfig_sistema_class; overload;

    function MakeAll(ADataSet: TIBQuery; Acod_Empresa: Integer; AclearBefore: Boolean = True): TConfig_sistema_classList;
    function AddKey(Akey: string): TConfig_sistema_classList;
    function GetConf(Akey: string): TConfig_sistema_class;

    property Items[Index: Integer]: TConfig_sistema_class read GetItem write SetItem;
    property ValidateKeys: Boolean read FValidateKeys write FValidateKeys;
  end;

  TCfg_sis = class(TConfig_sistema_class);

implementation

uses
  SysUtils,
  StrUtils,
  DateUtils,
  Math,
  hw_utils;

{TConfig_sistema_class}

function TConfig_sistema_class.ReadBool(Section, Ident: string;
  Default: Boolean): Boolean;
var
  ArqConfig: TMemIniFile;
begin
  Result := Default;
  if not Assigned(value1_b) then
    Exit;

  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(value1_b);
    if MapKeysMissing then
      if not ArqConfig.ValueExists(Section, Ident) then
      begin
        WriteBool(Section, Ident, Default);
        HasKeysMissing := True;
        Exit;
      end;

    Result := ArqConfig.ReadBool(Section, Ident, Default);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

function TConfig_sistema_class.ReadInteger(Section, Ident: string;
  Default: Integer): Integer;
var
  ArqConfig: TMemIniFile;
begin
  Result := Default;
  if not Assigned(value1_b) then
    Exit;

  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(value1_b);
    if MapKeysMissing then
      if not ArqConfig.ValueExists(Section, Ident) then
      begin
        WriteInteger(Section, Ident, Default);
        HasKeysMissing := True;
        FormatIniConf;
        Exit;
      end;

    Result := ArqConfig.ReadInteger(Section, Ident, Default);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

function TConfig_sistema_class.ReadString(Section, Ident,
  Default: string): string;
var
  ArqConfig: TMemIniFile;
begin
  Result := Default;
  if not Assigned(value1_b) then
    Exit;

  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(value1_b);
    if MapKeysMissing then
      if not ArqConfig.ValueExists(Section, Ident) then
      begin
        WriteString(Section, Ident, Default);
        HasKeysMissing := True;
        FormatIniConf;
        Exit;
      end;

    Result := ArqConfig.ReadString(Section, Ident, Default);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

function TConfig_sistema_class.InsertLineConf(Section, Ident,
  Value: string): Boolean;
var
  I: Integer;
  AinSection: Boolean;
begin
  Result := False;
  if not Assigned(Fvalue1_b) then
    Exit;

  with GetIniFile do
  begin
    if ValueExists(Section, Ident) then
      Exit;

    if not SectionExists(Section) then
    begin
//      if Fvalue1_b.Count > 0 then
//        Fvalue1_b.Add('');

      Fvalue1_b.Add(Format('[%s]', [Section]));
      Fvalue1_b.Add(Format('%s=%s', [Ident, Value]));
      Result := True;
      FormatIniConf;
      Exit;
    end;

    AinSection := False;
    for I := 0 to Fvalue1_b.Count - 1 do
    begin
      if not AinSection then
        AinSection := ContainsText('[' + Section + ']', Fvalue1_b[I])
      else if (Trim(Fvalue1_b[I]) = '') or (Fvalue1_b[I][1] = '[') or (I = Fvalue1_b.Count - 1) then
      begin
        if I = (Fvalue1_b.Count - 1) then
          Fvalue1_b.Add(Format('%s=%s', [Ident, Value]))
        else
          Fvalue1_b.Insert(I, Format('%s=%s', [Ident, Value]));
        Result := True;
        FormatIniConf;
        Break;
      end;
    end;
  end;
end;

function TConfig_sistema_class.KesyChanges: Boolean;
begin
  Result := MapKeysMissing and HasKeysMissing;
end;

function TConfig_sistema_class.AsBoolean: Boolean;
begin
  Result := Self.value1_f = 1;
end;

function TConfig_sistema_class.AsDate: TDateTime;
begin
  Result := DateOf(Self.value_dt);
end;

function TConfig_sistema_class.AsDateTime: TDateTime;
begin
  Result := Self.value_dt;
end;

function TConfig_sistema_class.AsFloat: Double;
begin
  Result := Self.value1_f;
end;

function TConfig_sistema_class.AsInteger: Integer;
begin
  Result := Trunc(Self.value1_f);
end;

function TConfig_sistema_class.AsRStrings: RStrings;
begin
  Result.Text := Self.value1_b.Text;
end;

function TConfig_sistema_class.AsString: string;
begin
  Result := Self.value1_vc;
end;

function TConfig_sistema_class.AsStrings: TStrings;
begin
  Result := Self.value1_b;
end;

function TConfig_sistema_class.AsTime: TDateTime;
begin
  Result := TimeOf(Self.value_dt);
end;

function TConfig_sistema_class.AtivarMapeamentoKeys: TConfig_sistema_class;
begin
  Result := Self;
  MapKeysMissing :=  True;
end;

procedure TConfig_sistema_class.clearConstKey;
begin
  while value1_b.IndexOf('[' + constkey + ']') >= 0 do
    value1_b.Delete(value1_b.IndexOf('[' + constkey + ']'));

  while value1_b.IndexOf(constkey + '=' + constkey) >= 0 do
    value1_b.Delete(value1_b.IndexOf(constkey + '=' + constkey));
end;

function TConfig_sistema_class.Clone: TConfig_sistema_class;
begin
  Result               := TConfig_sistema_class.Create;
  Result.chave         := Self.chave;
  Result.cod_empresa   := Self.cod_empresa;
  Result.display_      := Self.display_;
  Result.tag           := Self.tag;
  Result.type1_        := Self.type1_;
  Result.value1_vc     := Self.value1_vc;
  Result.value1_f      := Self.value1_f;
  Result.value1_b.Text := Self.value1_b.Text;
  Result.ordem         := Self.ordem;
  Result.ativo         := Self.ativo;
  Result.value_dt      := Self.value_dt;
end;

function TConfig_sistema_class.Comment(section,
  text: string; formatConf: Boolean): TConfig_sistema_class;
var
  idx: Integer;
begin
  Result := Self;
  FHasComment := True;

  if (value1_b.Count = 0) or ( value1_b[0] <> '[' + constkey + ']') then
    begin
      value1_b.Insert(0, constkey + '=' + constkey);
      value1_b.Insert(0, '[' + constkey + ']');
    end;

  idx := value1_b.IndexOf('[' + section + ']');
  if idx = -1 then
    idx := 0;

  value1_b.Insert(idx, Trim('# ' + text));
  if formatConf then
    FormatIniConfFixed;
end;

function TConfig_sistema_class.Comment(section: string;
  const text: array of string; formatConf: Boolean): TConfig_sistema_class;
var
  I: Integer;
begin
  Result := Self;

  for I := Low(text) to High(text) do
    Comment(section, text[i], formatConf and (I = High(text)));
end;

function TConfig_sistema_class.ConfActive(Section, Ident, Default,
  Value: string): Boolean;
begin
  Result := ReadString(Section, Ident, Default) = Value;
end;

function TConfig_sistema_class.ConfString(Section, Ident,
  Value: string; formatConf: Boolean): TConfig_sistema_class;
var
  ArqConfig: TMemIniFile;
begin
  Result := Self;

  if not Assigned(value1_b) then
    Exit;

  ArqConfig := TMemIniFile.Create('');
  try
    if value1_b.IndexOf('[' + constkey + ']') <> 0 then
    begin
      value1_b.Insert(0, constkey + '=' + constkey);
      value1_b.Insert(0, '[' + constkey + ']');
    end;

    ArqConfig.SetStrings(value1_b);
    if not ArqConfig.ValueExists(Section, Ident) then
    begin
      WriteString(Section, Ident, Value);
      MapKeysMissing := True;
      HasKeysMissing := True;
      if formatConf then
        FormatIniConfFixed;
      Exit;
    end;

  finally
    FreeAndNil(ArqConfig);
  end;
end;

constructor TConfig_sistema_class.Create(aChave, aDisplay, aTag,
  aType: string; codEmpresa: Integer);
begin
  Create;
  Self.chave := aChave;
  Self.display_ := aDisplay;
  Self.type1_ := aType;
  Self.tag := aTag;
  Self.cod_empresa := codEmpresa;
end;

constructor TConfig_sistema_class.Create;
begin
  MapKeysMissing := False;
  HasKeysMissing := False;
  Fvalue1_b := TStringIni.Create;
  Fativo    := 1;
  FHasComment := False;
end;

function TConfig_sistema_class.CSVPipe(row, col: Integer): string;
//name|lastname
//jose|da silva
//tanto o row como o col se iniciam em 0, Ex: CSVPipe(1, 0) = jose, CSVPipe(1, 1) = da silva,
var
  cols: TStrings;
begin
  if row > (value1_b.Count -1) then
    Result := ''
  else
  begin
    cols := NewStringList(value1_b[row], '|');
    if (col >= 0) and (col <= cols.Count -1) then
      Result := cols[col]
    else
      Result := '';
  end;
end;

procedure TConfig_sistema_class.DeleteKey(const Section, Ident: String);
var
  ArqConfig: TMemIniFile;
begin
  if not Assigned(value1_b) then
    Exit;

  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(value1_b);
    ArqConfig.DeleteKey(Section, Ident);
    value1_b.Clear;
    ArqConfig.GetStrings(value1_b);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

destructor TConfig_sistema_class.Destroy;
begin
  if Assigned(Fvalue1_b) then
    FreeAndNil(Fvalue1_b);
  inherited;
end;

procedure TConfig_sistema_class.FormatIniConf;
var
  I: Integer;
begin
  clearConstKey;

  for I := value1_b.Count - 1 downto 0 do
    if I > 1 then
      if (Copy(value1_b[I], 1, 1) = '[') and (Copy(value1_b[I], Length(value1_b[I]), 1) = ']') then
        if Trim(value1_b[I - 1]) <> '' then
          value1_b.Insert(I, '');
end;

procedure TConfig_sistema_class.FormatIniConfFixed;
var
  I: Integer;
  lastChar: string;
begin
  FHasComment := False;
  clearConstKey;

  for I := value1_b.Count - 1 downto 0 do
    if value1_b[I] = '' then
      value1_b.Delete(I);

  lastChar := '';
  for I := value1_b.Count - 1 downto 0 do
    if I > 0 then
      if ((Copy(value1_b[I], 1, 1) = '[') and (Copy(value1_b[I], Length(value1_b[I]), 1) = ']')) or
         ((lastChar = '#') and (Copy(Trim(value1_b[I]), 1, 1) <> '#')) then
      begin
        value1_b.Insert(I + IfThen(lastChar = '#', 1), '');
        lastChar := '';
      end
      else
        lastChar := Copy(Trim(value1_b[I]), 1, 1);
end;

function TConfig_sistema_class.GetBlobConf: string;
begin
  if FHasComment then
    FormatIniConfFixed;

  Result := value1_b.Text;
end;

class function TConfig_sistema_class.getConf(Akey: string; ADataSet: TIBQuery; Acod_Empresa: Integer): TConfig_sistema_class;
begin
  Result := TConfig_sistema_class.Create;
  ADataSet.Close;
  ADataSet.SQL.Text := 'select ' + TConfig_sistema_class.GetFieldsSql() +
                       ' from config_sistema' +
                       ' where chave = ' + QuotedStr(Akey) +
                       ' and cod_empresa = ' + IntToStr(Acod_empresa);
  ADataSet.Open;
  Result.SetValuesFrom(ADataSet);
  ADataSet.Close;
end;

class function TConfig_sistema_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@chave, @cod_empresa, @display_, @tag, @type1_, @value1_vc, @value1_f, @value1_b, @ordem, @ativo, @value_dt';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

function TConfig_sistema_class.GetIniFile: TMemIniFile;
begin
  Result := TMemIniFile.Create('');
  if not Assigned(value1_b) then
    Exit;
  Result.SetStrings(value1_b);
end;

function TConfig_sistema_class.SaveConfDB(ADataSet: TIBQuery): TIBQuery;
begin
  Self.GetBlobConf;

  clearConstKey;

  Result := ADataSet;

  ADataSet.Close;
  ADataSet.SQL.Text := Format('update or insert into config_sistema (%s) values (%s);',
                              [TConfig_sistema_class.GetFieldsSql(), TConfig_sistema_class.GetFieldsSql(':')]);
  ADataSet.SQL.Text := StringReplace(ADataSet.SQL.Text, ', :ordem', '', [rfIgnoreCase]);
  ADataSet.SQL.Text := StringReplace(ADataSet.SQL.Text,  ', ordem', '', [rfIgnoreCase]);

  if Self.value_dt = 0 then
    ADataSet.SQL.Text := StrReplaceA(ADataSet.SQL.Text, [', value_dt', ', :value_dt'], ['', '']);

  SetValuesInParams(ADataSet, True).ExecSQL;
end;

function TConfig_sistema_class.SetValuesFrom(ADataSet: TDataSet): TConfig_sistema_class;
begin
  Result         := Self;
  Fchave         := Trim(ADataSet.FieldByName('CHAVE').AsString);
  Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fdisplay_      := Trim(ADataSet.FieldByName('DISPLAY_').AsString);
  Ftag           := Trim(ADataSet.FieldByName('TAG').AsString);
  Ftype1_        := Trim(ADataSet.FieldByName('TYPE1_').AsString);
  Fvalue1_vc     := Trim(ADataSet.FieldByName('VALUE1_VC').AsString);
  Fvalue1_f      := ADataSet.FieldByName('VALUE1_F').AsFloat;
  Fvalue1_b.Text := Trim(ADataSet.FieldByName('VALUE1_B').AsString);
  Fordem         := ADataSet.FieldByName('ORDEM').AsInteger;
  Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
  Fvalue_dt      := ADataSet.FieldByName('VALUE_DT').AsDateTime;
end;

function TConfig_sistema_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('CHAVE').AsString        := Copy(Fchave    , 1, 64);
    ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    ADataSet.ParamByName('DISPLAY_').AsString     := Copy(Fdisplay_ , 1, 256);
    ADataSet.ParamByName('TAG').AsString          := Copy(Ftag      , 1, 256);
    ADataSet.ParamByName('TYPE1_').AsString       := Copy(Ftype1_   , 1, 32);
    ADataSet.ParamByName('VALUE1_VC').AsString    := Copy(Fvalue1_vc, 1, 256);
    ADataSet.ParamByName('VALUE1_F').AsFloat      := Fvalue1_f;
    ADataSet.ParamByName('VALUE1_B').AsString     := Fvalue1_b.Text;
    ADataSet.ParamByName('ORDEM').AsInteger       := Fordem;
    ADataSet.ParamByName('ATIVO').AsInteger       := Fativo;
    ADataSet.ParamByName('VALUE_DT').AsDateTime    := Fvalue_dt;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('CHAVE'      )) then   ADataSet.ParamByName('CHAVE').AsString        := Copy(Fchave    , 1, 64);
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA')) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('DISPLAY_'   )) then   ADataSet.ParamByName('DISPLAY_').AsString     := Copy(Fdisplay_ , 1, 256);
    if Assigned(ADataSet.Params.FindParam('TAG'        )) then   ADataSet.ParamByName('TAG').AsString          := Copy(Ftag      , 1, 256);
    if Assigned(ADataSet.Params.FindParam('TYPE1_'     )) then   ADataSet.ParamByName('TYPE1_').AsString       := Copy(Ftype1_   , 1, 32);
    if Assigned(ADataSet.Params.FindParam('VALUE1_VC'  )) then   ADataSet.ParamByName('VALUE1_VC').AsString    := Copy(Fvalue1_vc, 1, 256);
    if Assigned(ADataSet.Params.FindParam('VALUE1_F'   )) then   ADataSet.ParamByName('VALUE1_F').AsFloat      := Fvalue1_f;
    if Assigned(ADataSet.Params.FindParam('VALUE1_B'   )) then   ADataSet.ParamByName('VALUE1_B').AsString     := Fvalue1_b.Text;
    if Assigned(ADataSet.Params.FindParam('ORDEM'      )) then   ADataSet.ParamByName('ORDEM').AsInteger       := Fordem;
    if Assigned(ADataSet.Params.FindParam('ATIVO'      )) then   ADataSet.ParamByName('ATIVO').AsInteger       := Fativo;
    if Assigned(ADataSet.Params.FindParam('VALUE_DT'   )) then   ADataSet.ParamByName('VALUE_DT').AsDateTime   := Fvalue_dt;
  end;
end;

function TConfig_sistema_class.ValueExists(const Section, Ident: string): Boolean;
var
  ArqConfig: TMemIniFile;
begin
  Result := False;

  if not Assigned(value1_b) then
    Exit;

  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(value1_b);

    Result := ArqConfig.ValueExists(Section, Ident);

  finally
    FreeAndNil(ArqConfig);
  end;
end;

function TConfig_sistema_class.WriteBool(Section, Ident: string;
  Value: Boolean): TConfig_sistema_class;
var
  ArqConfig: TMemIniFile;
begin
  Result := Self;

  if not Assigned(value1_b) then
    Exit;

  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(value1_b);
    ArqConfig.WriteBool(Section, Ident, Value);
    value1_b.Clear;
    ArqConfig.GetStrings(value1_b);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

function TConfig_sistema_class.WriteInteger(Section, Ident: string;
  Value: Integer): TConfig_sistema_class;
var
  ArqConfig: TMemIniFile;
begin
  Result := Self;

  if not Assigned(value1_b) then
    Exit;

  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(value1_b);
    ArqConfig.WriteInteger(Section, Ident, Value);
    value1_b.Clear;
    ArqConfig.GetStrings(value1_b);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

function TConfig_sistema_class.WriteString(Section, Ident, Value: string): TConfig_sistema_class;
var
  ArqConfig: TMemIniFile;
begin
  Result := Self;

  if not Assigned(value1_b) then
    Exit;

  ArqConfig := TMemIniFile.Create('');
  try
    ArqConfig.SetStrings(value1_b);
    ArqConfig.WriteString(Section, Ident, Value);
    value1_b.Clear;
    ArqConfig.GetStrings(value1_b);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

{TConfig_sistema_classList}

function TConfig_sistema_classList.AddKey(Akey: string): TConfig_sistema_classList;
begin
  Result := Self;
  FKeys.Add(Akey);
end;

constructor TConfig_sistema_classList.Create;
begin
  inherited Create();
  FKeys := TStringList.Create;
  TStringList(FKeys).Sorted := True;
  TStringList(FKeys).Duplicates := dupIgnore;
  FValidateKeys :=  False;
  FListEmptyConfs := TObjectList.Create();
end;

destructor TConfig_sistema_classList.Destroy;
begin
  FreeAndNil(FKeys);
  FreeAndNil(FListEmptyConfs);
  inherited;
end;

function TConfig_sistema_classList.MakeAll(ADataSet: TIBQuery; Acod_Empresa: Integer;
  AclearBefore: Boolean): TConfig_sistema_classList;
var
  I: Integer;
begin
  Result := Self;

  if AclearBefore then
    Self.Clear;

  ADataSet.Close;
  ADataSet.SQL.Clear;
  for I := 0 to FKeys.Count - 1 do
    ADataSet.SQL.Add(IfThen(I > 0, ' union ') +
                     Format('select %s from config_sistema where chave = %s and cod_empresa = %d',
                            [TConfig_sistema_class.GetFieldsSql(), QuotedStr(FKeys[I]), Acod_empresa])
                    );
  ADataSet.Open;

  while not ADataSet.Eof do
  begin
    Result.New.SetValuesFrom(TDataSet(ADataSet));
    ADataSet.Next;
  end;
  ADataSet.Close;
end;

function TConfig_sistema_classList.GetConf(Akey: string): TConfig_sistema_class;
var
  I: Integer;
begin
  Result := nil;

  if FValidateKeys then
    if FKeys.IndexOf(Akey) = -1 then
      raise Exception.Create(Format('Chave %s não definida', [Akey]));

  for I := 0 to Self.Count - 1 do
    if Self.Items[I].chave = Akey then
    begin
      Result := Self.Items[I];
      Break;
    end;
  if Result = nil then
    Result := Self.ReturnoEmpty;
end;

function TConfig_sistema_classList.GetItem(Index: Integer): TConfig_sistema_class;
begin
  Result := TConfig_sistema_class(inherited Items[Index]);
end;

function TConfig_sistema_classList.New: TConfig_sistema_class;
begin
  Result := TConfig_sistema_class.Create;
  Add(Result);
end;

function TConfig_sistema_classList.New(Achave, Adisplay, Atag, Atype1_,
  Avalue1_vc: string; Acod_empresa: Integer;
  Avalue1_f: Double): TConfig_sistema_class;
begin
  Result             := New;
  Result.chave       := Achave;
  Result.cod_empresa := Acod_empresa;
  Result.display_    := Adisplay;
  Result.tag         := Atag;
  Result.type1_      := Atype1_;
  Result.value1_vc   := Avalue1_vc;
  Result.value1_f    := Avalue1_f;
end;

function TConfig_sistema_classList.ReturnoEmpty: TConfig_sistema_class;
var
  I: Integer;
begin
  for I := 0 to FListEmptyConfs.Count - 1 do
    if TConfig_sistema_class(FListEmptyConfs.Items[I]).chave = '' then    
    begin
      Result :=  TConfig_sistema_class(FListEmptyConfs.Items[I]);
      Exit;
    end;

  Result :=  TConfig_sistema_class.Create;
  FListEmptyConfs.Add(Result);  
end;

procedure TConfig_sistema_classList.SetItem(Index: Integer; const Value: TConfig_sistema_class);
begin
  Put(Index, Value);
end;

end.
