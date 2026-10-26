unit basefb_class;

interface

uses
{$IFDEF VER180}
  Classes,
  Contnrs,
  Controls,
  DB,
  IBQuery,
  DBClient
{$ELSE}
  System.Classes,
  System.Contnrs,
  //System.Controls,
  Data.DB,
  IBX.IBQuery,
  DataSnap.DBClient
{$ENDIF}
;

const
  const_cod_empresa: array[1..3] of string = ('COD_EMPRESA', 'CODIGO_EMP', 'COD_EMP');

type
  BaseFkind  = (fkInteger, fkString, fkFloat, fkDateTime, fkTime, fkDate, fkTStrings);
  BaseFtype  = (ftFields, ftPrimarys, ftForeigns);
  BaseUpdate = (buChanges, buAll);

  TBaseFb_class = class;

  TFieldFb = class
  private
    FTypeF: BaseFkind;
    FName: string;
    FIsKeyF: Boolean;
    FNullable: Boolean;
    FIsKeyP: Boolean;
    FSize: Integer;
    FHasDefault: Boolean;
  public
    constructor Create(AName: string; ATypeF: BaseFkind; ASize: Integer;
                       ANullable: Boolean = True;
                       AIsKeyP: Boolean = False;
                       AIsKeyF: Boolean = False;
                       AHasDefault: Boolean = False);
    property Name      : string    read FName       write FName;
    property TypeF     : BaseFkind read FTypeF      write FTypeF;
    property Size      : Integer   read FSize       write FSize;
    property Nullable  : Boolean   read FNullable   write FNullable;
    property IsKeyP    : Boolean   read FIsKeyP     write FIsKeyP;
    property IsKeyF    : Boolean   read FIsKeyF     write FIsKeyF;
    property HasDefault: Boolean   read FHasDefault write FHasDefault;
  end;

  TFieldsFb = class(TObjectList)
  private
    function GetItem(Index: Integer): TFieldFb;
  public
    function AddField(Name: string; TypeF: BaseFkind; Size: Integer = 0;
                      Nullable: Boolean = True;
                      IsKeyP: Boolean = False;
                      IsKeyF: Boolean = False;
                      HasDefault: Boolean = False): TFieldFb;
    property Items[Index: Integer]: TFieldFb read GetItem;
  end;

  TTableFb = class
  private
    Fname  : string;
    FFields: TFieldsFb;
  public
    constructor Create(Atable : string);
    destructor Destroy; override;
    function GetFieldsSql(Aalias: string = ''; Atype: BaseFtype = ftFields): string;

    property Name    : string    read Fname;
    property Fields  : TFieldsFb read FFields;
    //property Primarys: TFieldsFb read GetPrimarys;
    //property Foreigns: TFieldsFb read GetForeigns;
  end;

  TFieldOb = class
  private
    FTypeF: BaseFkind;
    FName: string;
    FOldValue: Variant;
    FValue: Variant;
    FieldFB: TFieldFb;
    function VariantToFb(AValue: Variant; ATypeF: BaseFkind; ASize: Integer): string;
    function VariantToStr(AValue: Variant; ATypeF: BaseFkind; ASize: Integer): string;
  public
    constructor Create(AFieldFB: TFieldFb);
    function GetValueFb(Size: Integer = 0): string;
    function GetOldValueFb(Size: Integer = 0): string;
    function GetValueStr(Size: Integer = 0): string;
    function GetOldValueStr(Size: Integer = 0): string;

    property Name    : string    read FName     write FName;
    property TypeF   : BaseFkind read FTypeF    write FTypeF;
    property Value   : Variant   read FValue    write FValue;
    property OldValue: Variant   read FOldValue write FOldValue;
  end;

  TFieldsOb = class(TObjectList)
  private
    procedure SetItem(Index: Integer; const Value: TFieldOb);
    function GetItem(Index: Integer): TFieldOb;
  public
    function New(AFieldFB: TFieldFb): TFieldOb;
    function Get(Name: string): TFieldOb;
    function GetFieldCodEmpresa: TFieldOb;

    procedure StoreValues(Sender: TObject; OldValues: Boolean = False);

    property Items[Index: Integer]: TFieldOb read GetItem write SetItem;
  end;

  TSqlBaseFb_Options = class
  private
    FUpdateFields   : BaseUpdate;
    FUpdateKeyFields: Boolean;
  public
    property UpdateFields   : BaseUpdate read FUpdateFields    write FUpdateFields    default buChanges;
    property UpdateKeyFields: Boolean    read FUpdateKeyFields write FUpdateKeyFields default False;
  end;

  TSqlBaseFb = class
  private
    FOwner  : TBaseFb_class;
    FtableFB: TTableFb;
    FieldsOb: TFieldsOb;
    FOptions: TSqlBaseFb_Options;
    FautoIncField: string;
    FFieldsIgnored: TStrings;
    procedure SetautoIncField(const Value: string);

    function GetMatchingClause: string;
    function GetSqlInsert(AupdateOrInsert: Boolean = False; AautoInc: Boolean = False):string;
    function GetSqlUpdate():string;
    function GetDelete: string;

    function GetInsert: string;
    function GetInsertAutoInc(): string;

    function GetUpdate: string;
    function GetUpdateOrInsert: string;
    function GetUpdateOrInsertAutoInc(): string;

  public
    destructor Destroy; override;
    constructor Create(AOwner: TBaseFb_class);

    property autoIncField            : string read FautoIncField write SetautoIncField;

    property SQLInsert               : string read GetInsert;
    property SQLInsertAutoInc        : string read GetInsertAutoInc;
    property SQLUpdate               : string read GetUpdate;
    property SQLUpdateOrInsert       : string read GetUpdateOrInsert;
    property SQLUpdateOrInsertAutoInc: string read GetUpdateOrInsertAutoInc;
    property SQLDelete               : string read GetDelete;

    property Options                 : TSqlBaseFb_Options read FOptions write FOptions;
    property FieldsIgnored           : TStrings read FFieldsIgnored write FFieldsIgnored;
  end;


{$TYPEINFO ON}
  TBaseFb_class = class(TPersistent)
  private
    FieldsOb: TFieldsOb;
    function GetTableFb: TTableFb;
    procedure InitializeIfDoNot();
  protected
    HasNoTable: Boolean;
    FTable    : TTableFb;
    FSqlMotor : TSqlBaseFb;
    procedure InitializeObjects; virtual; abstract;
  public
    destructor Destroy; override;

    procedure beginChanges();
    function FoundChanges(): Boolean;
    function StrValues: string;
    function StrChanges: string;

    function CopyFrom(ADataSet: TDataSet; AStoreObValues: Boolean = True): TBaseFb_class; overload; virtual;
    function CopyFrom(Source: TPersistent): TBaseFb_class; overload; virtual;
    function CopyTo(ADataSet: TClientDataSet; AdoPost, AdoInsert, AdoAppend, AdoEdit: Boolean): TClientDataSet; overload; virtual;
    function CopyTo(Destination: TPersistent): TBaseFb_class; overload; virtual;
    function Clone(): TBaseFb_class; virtual;

    function BuildParams(ADataSet: TIBQuery): TDataSet; virtual;

    function SQLMotor(AautoIncField: string = ''; AignoreFields: string = ''): TSqlBaseFb; virtual;
    function SQL(AautoIncField: string = ''; AignoreFields: string = ''): TSqlBaseFb; virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property _tb: TTableFb read GetTableFb;
  end;

  TBaseFb_Model = class(TBaseFb_class)
  public
    class function GetFieldsSql(Aalias: string = ''): string; override;
  end;
{$TYPEINFO OFF}

  TBaseFbs_class = class(TObjectList)
  public
    //function New: TBaseFbs_class; abstract;
    function CopyFrom(AClass: TPersistentClass; ADataSet: TDataSet; AStoreObValues: Boolean = True): Integer; virtual;
    function CopyTo(ADataSet: TClientDataSet): TClientDataSet; virtual;
  end;

implementation

uses
  SysUtils,
  StrUtils,
  Variants,
  TypInfo,
  hw_utils;


{ TField_Value_fb }

constructor TFieldFb.Create(AName: string; ATypeF: BaseFkind;
  ASize: Integer; ANullable, AIsKeyP, AIsKeyF, AHasDefault: Boolean);
begin
  Self.Name := AName;
  Self.TypeF := ATypeF;
  Self.Size := ASize;
  Self.Nullable := ANullable;
  Self.IsKeyP := AIsKeyP;
  Self.IsKeyF := AIsKeyF;
  Self.IsKeyF := AIsKeyF;
  Self.HasDefault := AHasDefault;
end;

{ TField_Value_fb_List }

function TFieldsFb.AddField(Name: string; TypeF: BaseFkind;
  Size: Integer; Nullable, IsKeyP, IsKeyF, HasDefault: Boolean): TFieldFb;
begin
  Result := TFieldFb.Create(Name, TypeF, Size, Nullable, IsKeyP, IsKeyF, HasDefault);
  Add(Result);
end;

function TFieldsFb.GetItem(Index: Integer): TFieldFb;
begin
  Result := TFieldFb(inherited Items[Index]);
end;

{ TTable_fb }

constructor TTableFb.Create(Atable: string);
begin
  Fname := UpperCase(Atable);
  FFields := TFieldsFb.Create;
end;

destructor TTableFb.Destroy;
begin
  FreeAndNil(FFields);
  inherited;
end;

function TTableFb.GetFieldsSql(Aalias: string; Atype: BaseFtype): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to FFields.Count - 1 do
    Result := Result + IfThen(Result <> '', ', ') +
              IfThen(( Atype = ftFields  ) or
                     ((Atype = ftPrimarys) and (FFields.Items[I].IsKeyP)) or
                     ((Atype = ftForeigns) and (FFields.Items[I].IsKeyF)),
                     '@' + FFields.Items[I].Name);

  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(LowerCase(Result), '@', Aalias, [rfReplaceAll]);
end;

{ TBaseFb_class }

function TBaseFb_class.Clone: TBaseFb_class;
var
  TMyClassRef: TPersistentClass;
  MyObject   : TPersistent;
begin
  Result := nil;
  TMyClassRef := GetClass(Self.ClassName);
  if Assigned(TMyClassRef) then
  begin

    MyObject := TMyClassRef.create;

    TBaseFb_class(MyObject).InitializeObjects;
    TBaseFb_class(MyObject).CopyFrom(Self);

    Result := TBaseFb_class(MyObject)
  end;
end;

function TBaseFb_class.CopyFrom(Source: TPersistent): TBaseFb_class;
var
  I        : Integer;
  PropCount: Integer;
  PropList : PPropList;
  ObjSource: TObject;
  ObjMySelf: TObject;
begin
  InitializeIfDoNot();

  Result := Self;

  PropCount := GetPropList(Self.Classinfo, PropList);
  if PropCount <= 0 then
    Exit;

  for I := 0 to Pred(PropCount) do
  begin
    if (PropList[I].PropType^.Kind = tkClass) and
       (IndexText(PropList[I].PropType^.Name, ['TStrings', 'TStringList']) >= 0) then
    begin
      if IsPublishedProp(Source, PropList[I].Name) then
      begin
        ObjSource := GetobjectProp(Source, PropList[I].Name);
        ObjMySelf := GetobjectProp(Self  , PropList[I].Name);
        if Assigned(ObjSource) and Assigned(ObjMySelf) then
          TStrings(ObjMySelf).Text := TStrings(ObjSource).Text;
      end;
    end
    else if (PropList[I].PropType^.Kind <> tkClass) then
      if IsPublishedProp(Source, PropList[I].Name) then
        SetPropValue(Self, PropList[I].Name, GetPropValue(Source, PropList[I].Name));
  end;
end;

function TBaseFb_class.CopyTo(ADataSet: TClientDataSet; AdoPost, AdoInsert,
  AdoAppend, AdoEdit: Boolean): TClientDataSet;
var
  I        : Integer;
  PropCount: Integer;
  PropList : PPropList;
  ObjProp  : TObject;
  Continuar: Boolean;
  FieldDB  : TField;
begin
  InitializeIfDoNot();

  if ADataSet.State = dsBrowse then
    if AdoEdit then
      ADataSet.Edit
    else if AdoAppend then
      ADataSet.Append
    else if AdoInsert then
      ADataSet.Insert;

  Result := ADataSet;

  PropCount := GetPropList(Self.Classinfo, PropList);
  if PropCount <= 0 then
    Exit;

  for I := 0 to Pred(PropCount) do
  begin
    if (PropList[I].PropType^.Kind = tkClass) and
       (IndexText(PropList[I].PropType^.Name, ['TStrings', 'TStringList']) >= 0) then
    begin
      FieldDB   := ADataSet.FindField(PropList[I].Name);
      Continuar := Assigned(FieldDB);
      if Continuar then
      begin
        ObjProp := GetobjectProp(Self, PropList[I].Name);
        if Assigned(ObjProp) then
          FieldDB.AsString := TStrings(ObjProp).Text;
      end;
    end
    else if (PropList[I].PropType^.Kind <> tkClass) then
    begin
      FieldDB   := ADataSet.FindField(PropList[I].Name);
      Continuar := Assigned(FieldDB);
      if Continuar then
        FieldDB.Value := GetPropValue(Self, PropList[I].Name);
    end;
  end;

  if AdoPost then
    ADataSet.Post;
end;

function TBaseFb_class.CopyTo(Destination: TPersistent): TBaseFb_class;
{var
  I        : Integer;
  PropCount: Integer;
  PropList : PPropList;
  ObjSource: TObject;
  ObjMySelf: TObject;
  Continuar: Boolean;
  }
begin

  Result := TBaseFb_class(Destination).CopyFrom(Self);

  {
  InitializeIfDoNot;

  Result := Destination;

  PropCount := GetPropList(Destination.Classinfo, PropList);
  if PropCount <= 0 then
    Exit;

  for I := 0 to Pred(PropCount) do
  begin
    if (PropList[I].PropType^.Kind = tkClass) and
       (IndexText(PropList[I].PropType^.Name, ['TStrings', 'TStringList']) >= 0) then
    begin
      if IsPublishedProp(Self, PropList[I].Name) then
      begin
        ObjSource := GetobjectProp(Self, PropList[I].Name);
        ObjMySelf := GetobjectProp(Destination  , PropList[I].Name);
        if Assigned(ObjSource) and Assigned(ObjMySelf) then
          TStrings(ObjMySelf).Text := TStrings(ObjSource).Text;
      end;
    end
    else if (PropList[I].PropType^.Kind <> tkClass) then
      if IsPublishedProp(Self, PropList[I].Name) then
        SetPropValue(Destination, PropList[I].Name, GetPropValue(Self, PropList[I].Name));
  end;
  }
end;

destructor TBaseFb_class.Destroy;
begin
  if Assigned(FieldsOb)  then FreeAndNil(FieldsOb);
  if Assigned(FSQLMotor) then FreeAndNil(FSQLMotor);
  if Assigned(FTable) then FreeAndNil(FTable);
  inherited;
end;

function TBaseFb_class.FoundChanges: Boolean;
var
  I: Integer;
  FieldValue: TFieldOb;
  FieldFb: TFieldFb;
begin
  InitializeIfDoNot;

  FieldsOb.StoreValues(Self);

  Result := False;
  for I := 0 to FTable.Fields.Count - 1 do if FSqlMotor.FieldsIgnored.IndexOf(FTable.Fields.Items[I].Name) = -1 then
  begin
    FieldFb    := FTable.Fields.Items[I];
    FieldValue := FieldsOb.Get(FieldFb.Name);

    if Assigned(FieldValue) then
    begin
      Result := (FieldValue.Value <> FieldValue.OldValue) and (not VarIsEmpty(FieldValue.Value));
      if Result then
        Break;
    end;
  end;
end;

class function TBaseFb_class.GetFieldsSql(Aalias: string): string;
var
  TMyClassRef: TPersistentClass;
  MyObject   : TPersistent;
begin
  TMyClassRef := GetClass(Self.ClassName);
  if Assigned(TMyClassRef) then
  begin
    try
      MyObject := TMyClassRef.create;

      TBaseFb_class(MyObject).InitializeObjects;

      Result := TBaseFb_class(MyObject)._tb.GetFieldsSql(Aalias);
    finally
      FreeAndNil(MyObject);
    end;
  end;
end;

function TBaseFb_class.GetTableFb: TTableFb;
begin
  Result := FTable;
end;

procedure TBaseFb_class.InitializeIfDoNot();
var
  I: Integer;
begin
  if HasNoTable then
    Exit;

  if not Assigned(FTable) then
    raise Exception.Create('Objeto Table não instanciado. Verifique a herança do construtor da classe');

  if not Assigned(FieldsOb) then
  begin
    FieldsOb := TFieldsOb.Create;
    for I := 0 to FTable.Fields.Count - 1 do
      FieldsOb.New(FTable.Fields.Items[I]);
  end;

  if not Assigned(FSqlMotor) then
    FSqlMotor := TSqlBaseFb.Create(Self);
end;

procedure TBaseFb_class.beginChanges();
begin
  InitializeIfDoNot;

  FSqlMotor.FieldsOb.StoreValues(Self, True);
end;

function TBaseFb_class.BuildParams(ADataSet: TIBQuery): TDataSet;
var
  I        : Integer;
  PropCount: Integer;
  PropList : PPropList;
  ObjProp  : TObject;
  Continuar: Boolean;
  ParamDB  : TParam;
begin
  InitializeIfDoNot;

  Result := ADataSet;

  PropCount := GetPropList(Self.Classinfo, PropList);
  if PropCount <= 0 then
    Exit;

  for I := 0 to Pred(PropCount) do
  begin
    if (PropList[I].PropType^.Kind = tkClass) and
       (IndexText(PropList[I].PropType^.Name, ['TStrings', 'TStringList']) >= 0) then
    begin
      ParamDB   := ADataSet.Params.FindParam(PropList[I].Name);
      Continuar := Assigned(ParamDB);
      if Continuar then
      begin
        ObjProp := GetobjectProp(Self, PropList[I].Name);
        if Assigned(ObjProp) then
          ParamDB.AsString := TStrings(ObjProp).Text;
      end;
    end
    else if (PropList[I].PropType^.Kind <> tkClass) then
    begin
      ParamDB   := ADataSet.Params.FindParam(PropList[I].Name);
      Continuar := Assigned(ParamDB);
      if Continuar then
        ParamDB.Value := GetPropValue(Self, PropList[I].Name);
    end;
  end;
end;

function TBaseFb_class.CopyFrom(ADataSet: TDataSet; AStoreObValues: Boolean): TBaseFb_class;
var
  I        : Integer;
  PropCount: Integer;
  PropList : PPropList;
  ObjProp  : TObject;
  Continuar: Boolean;
  FieldDB  : TField;
begin
  InitializeIfDoNot();

  Result := Self;

  PropCount := GetPropList(Self.Classinfo, PropList);
  if PropCount <= 0 then
    Exit;

  for I := 0 to Pred(PropCount) do
  begin
    if (PropList[I].PropType^.Kind = tkClass) and
       (IndexText(PropList[I].PropType^.Name, ['TStrings', 'TStringList']) >= 0) then
    begin
      FieldDB   := ADataSet.FindField(PropList[I].Name);
      Continuar := Assigned(FieldDB);
      if Continuar then
      begin
        ObjProp := GetobjectProp(Self, PropList[I].Name);
        if Assigned(ObjProp) then
          TStrings(ObjProp).Text := FieldDB.AsString;
      end;
    end
    else if (PropList[I].PropType^.Kind <> tkClass) then
    begin
      FieldDB   := ADataSet.FindField(PropList[I].Name);
      Continuar := Assigned(FieldDB);
      if Continuar then
        case PropList[I].PropType^.Kind of
          tkInt64,
          tkInteger : SetPropValue(Self, PropList[I].Name, FieldDB.AsInteger);
          tkFloat   : SetPropValue(Self, PropList[I].Name, FieldDB.AsFloat);
          tkString,
          tkLString : SetPropValue(Self, PropList[I].Name, Trim(FieldDB.AsString));
          else        SetPropValue(Self, PropList[I].Name, FieldDB.Value);
        end;
    end;
  end;

  if Assigned(FieldsOb) then
    FieldsOb.StoreValues(Self, AStoreObValues);
end;

function TBaseFb_class.SQL(AautoIncField, AignoreFields: string): TSqlBaseFb;
begin
  InitializeIfDoNot;

  FSqlMotor.FieldsIgnored := NewStringList(False, StringReplace(UpperCase(AignoreFields), ' ', '', [rfReplaceAll]), ',');
  FSqlMotor.autoIncField  := '';
  FieldsOb.StoreValues(Self);
  Result := FSqlMotor;
end;

function TBaseFb_class.SQLMotor(AautoIncField,
  AignoreFields: string): TSqlBaseFb;
begin
  InitializeIfDoNot;

  FSqlMotor.FieldsIgnored := NewStringList(False, StringReplace(UpperCase(AignoreFields), ' ', '', [rfReplaceAll]), ',');
  FSqlMotor.autoIncField  := AautoIncField;
  FieldsOb.StoreValues(Self);
  Result := FSqlMotor;
end;

function TBaseFb_class.StrChanges: string;
var
  I: Integer;
  FieldCaption: string;
  FieldValue  : TFieldOb;
  FieldFb     : TFieldFb;
begin
  InitializeIfDoNot;

  Result := '';
  for I := 0 to FTable.Fields.Count - 1 do if FSqlMotor.FieldsIgnored.IndexOf(FTable.Fields.Items[I].Name) = -1 then
  begin
    FieldFb    := FTable.Fields.Items[I];
    FieldValue := FieldsOb.Get(FieldFb.Name);

    if (FieldValue.Value <> FieldValue.OldValue) and (not VarIsEmpty(FieldValue.Value)) then
    begin
      FieldCaption :=  FieldFb.Name[1] + LowerCase(Copy(FieldFb.Name, 2, Length(FieldFb.Name)));
      Result := IfThen(Result <> '', Result + ' ') +
                Format('[%s:%s->%s]', [FieldCaption, FieldValue.GetOldValueStr(FieldFb.Size), FieldValue.GetValueStr(FieldFb.Size)]);
    end;
  end;
  Result := StringReplace(Result, sLineBreak, ' ', [rfReplaceAll]);
end;

function TBaseFb_class.StrValues: string;
var
  I: Integer;
  FieldCaption: string;
begin
  Result := '';
  InitializeIfDoNot;

  FieldsOb.StoreValues(Self);

  for I := 0 to FieldsOb.Count - 1 do
  begin
    FieldCaption :=  FieldsOb.Items[I].Name[1] + LowerCase(Copy(FieldsOb.Items[I].Name, 2, Length(FieldsOb.Items[I].Name)));
    Result := Result + IfThen(I > 0, ' ') + Format('[%s:%s]', [FieldCaption, FieldsOb.Items[I].GetValueStr]);
  end;
  Result := StringReplace(Result, sLineBreak, ' ', [rfReplaceAll]);
end;

{ TFieldOb }

constructor TFieldOb.Create(AFieldFB: TFieldFb);
begin
  FieldFB   := AFieldFB;
  FName     := AFieldFB.Name;
  FTypeF    := AFieldFB.TypeF;
//  FValue    := Null;
//  FOldValue := Null;

  {if FieldFB.TypeF in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate] then //fkInteger, fkString, fkFloat, fkDateTime, fkTime, fkDate, fkTStrings
  FName := AName;
  TypeF := ATypeF;
//  if Nullable then
  begin
    FValue    := Null;
    FOldValue := Null;
  end;
  }
end;

function TFieldOb.GetOldValueFb(Size: Integer): string;
begin
  Result := VariantToFb(FOldValue, FTypeF, Size);
end;

function TFieldOb.GetOldValueStr(Size: Integer): string;
begin
  Result := VariantToStr(Self.OldValue, Self.TypeF, Size);
end;

function TFieldOb.GetValueFb(Size: Integer): string;
begin
  Result := VariantToFb(FValue, FTypeF, Size);
end;

function TFieldOb.GetValueStr(Size: Integer): string;
begin
  Result := VariantToStr(Self.Value, Self.TypeF, Size);
end;

function TFieldOb.VariantToFb(AValue: Variant; ATypeF: BaseFkind; ASize: Integer): string;
begin
  if (AValue = Null) or (VarIsEmpty(AValue))then
    Result := 'NULL'
  else
    case ATypeF of
      fkInteger : Result := VarToStr(AValue);
      fkString  :
        begin
          Result := VarToStr(AValue);
          if Asize > 0 then
            Result := Copy(Result, 1, ASize);
          Result := QuotedStr(Result);
        end;
      fkFloat   :
        begin
          Result := StringReplace(Format('%0.14f', [StrToFloatDef(VarToStr(AValue), 0)]), ',', '.', []);
          if Result <> '' then
            while Result[Length(Result)] = '0' do
              System.Delete(Result, Length(Result), 1);
          if Result[Length(Result)] = '.' then
            System.Delete(Result, Length(Result), 1);
        end;
      fkDateTime: Result := QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', VarToDateTime(AValue)));
      fkTime    : Result := QuotedStr(FormatDateTime('hh:mm:ss', VarToDateTime(AValue)));
      fkDate    : Result := QuotedStr(FormatDateTime('YYYY-MM-DD', VarToDateTime(AValue)));
      fkTStrings: Result := QuotedStr(VarToStr(AValue));
    end;
end;

function TFieldOb.VariantToStr(AValue: Variant; ATypeF: BaseFkind;
  ASize: Integer): string;
begin
  if (AValue = Null) or (VarIsEmpty(AValue)) then
    Result := ''
  else
    case ATypeF of
      fkInteger : Result := VarToStr(AValue);
      fkString  :
        begin
          Result := VarToStr(AValue);
          if Asize > 0 then
            Result := Copy(Result, 1, ASize);
        end;
      fkFloat   :
        begin
          Result := Format('%0.14f', [StrToFloatDef(VarToStr(AValue), 0)]);
          if Result <> '' then
            while Result[Length(Result)] = '0' do
              System.Delete(Result, Length(Result), 1);
          if Result[Length(Result)] = ',' then
            System.Delete(Result, Length(Result), 1);
        end;
      fkDateTime: Result := FormatDateTime('DD/MM/YYYY hh:mm:ss', VarToDateTime(AValue));
      fkTime    : Result := FormatDateTime('hh:mm:ss', VarToDateTime(AValue));
      fkDate    : Result := FormatDateTime('DD/MM/YYYY', VarToDateTime(AValue));
      fkTStrings: Result := VarToStr(AValue);
    end;
end;

{ TFieldsOb }

function TFieldsOb.Get(Name: string): TFieldOb;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Self.Count - 1 do
    if Self.Items[I].Name = UpperCase(Name) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

function TFieldsOb.GetFieldCodEmpresa: TFieldOb;
var
  K, I: Integer;
begin
  Result := nil;
  for K := 1 to 3 do
    for I := 0 to Self.Count - 1 do if Self.Items[I].Name = const_cod_empresa[K] then
    begin
      Result := Self.Items[I];
      Exit;
    end;
end;

function TFieldsOb.GetItem(Index: Integer): TFieldOb;
begin
  Result := TFieldOb(inherited Items[Index]);
end;

function TFieldsOb.New(AFieldFB: TFieldFb): TFieldOb;
begin
  Result := TFieldOb.Create(AFieldFB);
  Add(Result);
end;

procedure TFieldsOb.SetItem(Index: Integer; const Value: TFieldOb);
begin
  Put(Index, Value);
end;

procedure TFieldsOb.StoreValues(Sender: TObject; OldValues: Boolean);
var
  I, PropCount: integer;
  PropList    : PPropList;
  Field       : TFieldOb;
  Val         : Variant;
begin
  PropCount := GetPropList(Sender.Classinfo, PropList);
  if PropCount <= 0 then
    Exit;

  for I := 0 to Pred(PropCount) do
  begin
    if PropList[I].PropType^.Kind <> tkClass then
    begin
      Field := Get(UpperCase(PropList^[I]^.Name));
      if Assigned(Field) then
      begin
        Val := GetPropValue(Sender, PropList^[I]^.Name);
//        if Val = Unassigned then Val := Null;
        if OldValues then
          Field.OldValue := Val
        else
          Field.Value    := Val;
      end;
    end
    else if IndexText(PropList[I].PropType^.Name, ['TStrings', 'TStringList']) >= 0 then
    begin
      Field := Get(UpperCase(PropList^[I]^.Name));
      if Assigned(Field) then
        if OldValues then
          Field.OldValue := TStringList(GetobjectProp(Sender, PropList^[I])).Text
        else
          Field.Value    := TStringList(GetobjectProp(Sender, PropList^[I])).Text;
     end;
  end;
end;

{ TSqlBaseFb }

constructor TSqlBaseFb.Create(AOwner: TBaseFb_class);
begin
  FOwner         := AOwner;
  FtableFB       := FOwner.FTable;
  FieldsOb       := FOwner.FieldsOb;;
  FFieldsIgnored := TStringList.Create;

  FOptions                 := TSqlBaseFb_Options.Create;
  FOptions.UpdateFields    := buChanges;
  FOptions.UpdateKeyFields := False;
end;

destructor TSqlBaseFb.Destroy;
begin
  FreeAndNil(FFieldsIgnored);
  FreeAndNil(FOptions);
  inherited;
end;

function TSqlBaseFb.GetDelete: string;
var
  Awhere: string;
  I: Integer;
  FieldValue: TFieldOb;
  FieldFb: TFieldFb;
begin
  Awhere := '';
  for I := 0 to FtableFB.Fields.Count - 1 do if FtableFB.Fields.Items[I].IsKeyP then
  begin
    FieldFb    := FtableFB.Fields.Items[I];
    FieldValue := FieldsOb.Get(FieldFb.Name);

    if Assigned(FieldValue) then
    begin
        Awhere := Awhere + IfThen(Awhere = '', ' where ', ' and ') +
                  FieldFb.Name + ' = ' + IfThen((FieldValue.TypeF in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                                (FieldValue.Value = 0) and (FieldFb.IsKeyF), 'NULL',
                                                FieldValue.GetValueFb(FieldFb.Size));
      end;
  end;

  Result := 'delete from ' + FtableFB.name + ' ' + Awhere;
end;

function TSqlBaseFb.GetInsert: string;
begin
  Result := GetSqlInsert;
end;

function TSqlBaseFb.GetInsertAutoInc: string;
begin
  Result := GetSqlInsert(False, FautoIncField <> '');
end;

function TSqlBaseFb.GetMatchingClause: string;
var
  I: Integer;
  FieldValue: TFieldOb;
  FieldFb: TFieldFb;
begin
  Result := '';
  for I := 0 to FtableFB.Fields.Count - 1 do if FtableFB.Fields.Items[I].IsKeyP then
  begin
    FieldFb    := FtableFB.Fields.Items[I];
    FieldValue := FieldsOb.Get(FieldFb.Name);
    if Assigned(FieldValue) then
      Result := Result + IfThen(Result <> '', ', ') + FieldFb.Name;
  end;

  if Result = '' then
    for I := 0 to FtableFB.Fields.Count - 1 do
    begin
      FieldFb    := FtableFB.Fields.Items[I];
      FieldValue := FieldsOb.Get(FieldFb.Name);
      if Assigned(FieldValue) then
        Result := Result + IfThen(Result <> '', ', ') + FieldFb.Name;
    end;

  Result := IfThen(Result <> '', Format(' matching (%s)', [Result]));
end;

function TSqlBaseFb.GetSqlInsert(AupdateOrInsert: Boolean; AautoInc: Boolean): string;
var
  I: Integer;
  Ainto, Avalues, strAutoInc: string;
  ASet: Boolean;
  FieldValue: TFieldOb;
  FieldFb: TFieldFb;
  FieldCodEmp: TFieldOb;
begin
  Ainto   := '';
  Avalues := '';
  Result := 'insert into ' + FtableFB.Name + ' (';
  for I := 0 to FtableFB.Fields.Count - 1 do if FFieldsIgnored.IndexOf(FtableFB.Fields.Items[I].Name) = -1 then
  begin
    FieldFb    := FtableFB.Fields.Items[I];
    FieldValue := FieldsOb.Get(FieldFb.Name);

    if Assigned(FieldValue) then
    begin
      Aset := ((FOptions.UpdateFields = buAll    )) or
              ((not FieldFb.Nullable             ) and (not FieldFb.HasDefault)) or
              ((FOptions.UpdateFields = buChanges) and (FieldValue.Value <> FieldValue.OldValue) and (not VarIsEmpty(FieldValue.Value))) or
              ((AautoInc                         ) and (FautoIncField = FieldFb.Name)) or
              ((AupdateOrInsert                  ) and (FieldFb.IsKeyP));

      if ASet then
        Ainto := Ainto + IfThen(Ainto <> '', ', ') + FieldFb.Name;
    end;
  end;

  Result := Result + Ainto + ') values (';
  for I := 0 to FtableFB.Fields.Count - 1 do if FFieldsIgnored.IndexOf(FtableFB.Fields.Items[I].Name) = -1 then
  begin
    FieldFb    := FtableFB.Fields.Items[I];
    FieldValue := FieldsOb.Get(FieldFb.Name);

    if Assigned(FieldValue) then
    begin
      Aset := ((FOptions.UpdateFields = buAll    )) or
              ((not FieldFb.Nullable             ) and (not FieldFb.HasDefault)) or
              ((FOptions.UpdateFields = buChanges) and (FieldValue.Value <> FieldValue.OldValue) and (not VarIsEmpty(FieldValue.Value))) or
              ((AautoInc                         ) and (FautoIncField = FieldFb.Name)) or
              ((AupdateOrInsert                  ) and (FieldFb.IsKeyP));

      strAutoInc := '';
      if (AautoInc) and (FautoIncField = FieldFb.Name) then
      begin
        FieldCodEmp := FieldsOb.GetFieldCodEmpresa;
        if Assigned(FieldCodEmp) then
          strAutoInc := Format('(select cod from incrementa_codigo(%s, %s))', [FieldCodEmp.GetValueFb(0), QuotedStr(FtableFB.Name)]);
      end;

      if ASet then
        Avalues := Avalues + IfThen(Avalues <> '', ', ') +
                   IfThen(strAutoInc <> '', strAutoInc,
                         IfThen((FieldValue.TypeF in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                (FieldValue.Value = 0) and (FieldFb.IsKeyF), 'NULL',
                                FieldValue.GetValueFb(FieldFb.Size))
                         );
    end;
  end;

  Result := Result + Avalues;

  Result := IfThen(AupdateOrInsert, 'update or ') +  Result + ')';
end;

function TSqlBaseFb.GetSqlUpdate: string;
var
  Awhere, Asets, StrValue: string;
  I: Integer;
  Aset: Boolean;
  FieldValue: TFieldOb;
  FieldFb: TFieldFb;
begin
  Result := 'update ' + FtableFB.Name + ' set ';
  Asets  := '';

  for I := 0 to FtableFB.Fields.Count - 1 do if FFieldsIgnored.IndexOf(FtableFB.Fields.Items[I].Name) = -1 then
  begin
    FieldFb    := FtableFB.Fields.Items[I];
    FieldValue := FieldsOb.Get(FieldFb.Name);

    if Assigned(FieldValue) then
    begin
      Aset := ((FOptions.UpdateFields = buAll    )) or
              ((FOptions.UpdateFields = buChanges) and (FieldValue.Value <> FieldValue.OldValue) and (not VarIsEmpty(FieldValue.Value)));
      if ASet and FieldFb.IsKeyP then
        ASet := FOptions.UpdateKeyFields;

      if ASet then
        Asets := Asets + IfThen(Asets <> '', ', ') +
                 FieldFb.Name + ' = ' + IfThen((FieldValue.TypeF in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                               (FieldValue.Value = 0) and (FieldFb.IsKeyF), 'NULL',
                                                FieldValue.GetValueFb(FieldFb.Size));
    end;
  end;

  Awhere := '';
  for I := 0 to FtableFB.Fields.Count - 1 do if FtableFB.Fields.Items[I].IsKeyP then
  begin
    FieldFb    := FtableFB.Fields.Items[I];
    FieldValue := FieldsOb.Get(FieldFb.Name);

    if Assigned(FieldValue) then
    begin
      StrValue := FieldValue.GetOldValueFb(FieldFb.Size);
      if StrValue = 'NULL' then
        StrValue := FieldValue.GetValueFb(FieldFb.Size);

      Awhere := Awhere + IfThen(Awhere = '', ' where ', ' and ') +
                FieldFb.Name  + ' = ' + IfThen((FieldValue.TypeF in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                               (FieldValue.OldValue = 0) and (FieldFb.IsKeyF), 'NULL', StrValue);
    end;
  end;

  if Awhere = '' then
    for I := 0 to FtableFB.Fields.Count - 1 do
    begin
      FieldFb    := FtableFB.Fields.Items[I];
      FieldValue := FieldsOb.Get(FieldFb.Name);

      if Assigned(FieldValue) then
      begin
        StrValue := FieldValue.GetOldValueFb(FieldFb.Size);
        if StrValue = 'NULL' then
          StrValue := FieldValue.GetValueFb(FieldFb.Size);

        Awhere := Awhere + IfThen(Awhere = '', ' where ', ' and ') +
                  FieldFb.Name  + ' = ' + IfThen((FieldValue.TypeF in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                                 (FieldValue.OldValue = 0) and (FieldFb.IsKeyF), 'NULL', StrValue);
        Break;
      end;
    end;

  Result := Result + Asets + Awhere;
end;

function TSqlBaseFb.GetUpdate: string;
begin
  Result := GetSqlUpdate();
end;

function TSqlBaseFb.GetUpdateOrInsert: string;
begin
  Result := GetSqlInsert(True) + GetMatchingClause;
end;

function TSqlBaseFb.GetUpdateOrInsertAutoInc: string;
begin
  Result := GetSqlInsert(True, FautoIncField <> '') + GetMatchingClause;
end;

procedure TSqlBaseFb.SetautoIncField(const Value: string);
begin
  FautoIncField := UpperCase(Value);
end;

{ TBaseFbs_class }

function TBaseFbs_class.CopyFrom(AClass: TPersistentClass;
  ADataSet: TDataSet; AStoreObValues: Boolean): Integer;
var
  MyObject   : TPersistent;
begin
  Result := 0;
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    MyObject := AClass.Create;
    TBaseFb_class(MyObject).InitializeObjects;
    TBaseFb_class(MyObject).CopyFrom(ADataSet, AStoreObValues);
    Add(TBaseFb_class(MyObject));
    Result := Result + 1;
    ADataSet.Next;
  end;
end;

function TBaseFbs_class.CopyTo(ADataSet: TClientDataSet): TClientDataSet;
var
  I: Integer;
begin
  Result := ADataSet;

  for I := 0 to Self.Count - 1 do
    (Self.Items[I] as TBaseFb_class).CopyTo(ADataSet, True, False, True, False);

  ADataSet.First;
end;

{ TBaseFb_Model }

class function TBaseFb_Model.GetFieldsSql(Aalias: string): string;
var
  I        : Integer;
  PropCount: Integer;
  PropList : PPropList;
  ObjSource: TObject;
  ObjMySelf: TObject;
begin
  Result := '';

  PropCount := GetPropList(Self.ClassInfo, PropList);
  if PropCount <= 0 then
    Exit;

  for I := 0 to Pred(PropCount) do
  begin
    if (PropList[I].PropType^.Kind = tkClass) and
       (IndexText(PropList[I].PropType^.Name, ['TStrings', 'TStringList']) >= 0) then
    begin
      if IsPublishedProp(Self, PropList[I].Name) then
        Result := Result + IfThen(Result <> '', ',@', '@') + PropList[I].Name;
    end
    else if (PropList[I].PropType^.Kind <> tkClass) then
      if IsPublishedProp(Self, PropList[I].Name) then
        Result := Result + IfThen(Result <> '', ',@', '@') + PropList[I].Name;
  end;

  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(LowerCase(Result), '@', Aalias, [rfReplaceAll]);
end;

end.
