unit base_class;

interface

uses
{$IFDEF VER180}
  Classes,
  Contnrs,
  Controls
{$ELSE}
  System.Classes,
  System.Contnrs
{$ENDIF}
;

type

//  Motor_Options    = set of (muModified, muCheckModified, muKeyFields, muAllFields);
//  Motor_Options    = set of (muModified, muCheckModified, muKeyFields, muAllFields);
                             {
                             ******* Opções para incluir campos no update ou insert ******
                             muModified       = Sempre que setar uma property indemendente do valor antigo ser diferente
                             muCheckModified  = Sempre que o valor antigo fore diferente do atual
                             muKeyFields      = Campos chave apenas serao setados no insert ou update se esta ativada e uma das acima
                             muAllFields      = Todos os campos irão fazer parte do update ou do insert
                             }
  TFieldsInInsertUdate = (fsPropertySet, fsNewDifOld, fsNewdifOldAndPropertySet, fsAllFields);
                       {
                       fsPropertySet             = Quando setar uma property indemendente do valor antigo ser diferente, lembrando que por rasoes tecnicas os campos TStrings sempre sao setados antes do SQLMotor ser chamado
                       fsNewDifOld               = Quando o valor antigo for diferente do atual
                       fsNewdifOldAndPropertySet = Quando o valor antigo for diferente do atual e a propriedate for setada
                       fsAllFields               = Todos os campos irão fazer parte do update ou do insert
                       }
  TRecordFieldTypes = (ftFields, ftPrimarys, ftForeigns);
  TRecordFieldkind  = (fkNone, fkString, fkInteger, fkFloat, fkDateTime, fkTime, fkDate, fkTStrings);
  TRecordSate       = (rsUnknow, rsNew, rsUpdated, rsDeleted);

//  TStringList = class(TStringList)
//  public
//    property Name
//
//  end;

  TField_Value_fb = class
  private
    Fname   : string;
    Fvalue  : string;
    Frescue : string;
    Fchanged: Boolean;
    Fkind   : TRecordFieldkind;
  public
    property name   : string  read Fname    write Fname;
    property value  : string  read Fvalue   write Fvalue;
    property rescue : string  read Frescue  write Frescue;
    property kind   : TRecordFieldkind read Fkind write Fkind;
    property changed: Boolean read Fchanged;
  end;

  TTable_fb = class
  private
    Fname    : string;
    Ffields  : TStrings;
    Fprimarys: TStrings;
    Fforeigns: TStrings;
  public
    constructor Create(Atable, Aprimarys, Aforeigns, Afields: string);
    destructor Destroy; override;
    function GetFieldsSql(Aalias: string = ''; Atype: TRecordFieldTypes = ftFields): string;

    property name    : string   read Fname;
    property fields  : TStrings read Ffields;
    property primarys: TStrings read Fprimarys;
    property foreigns: TStrings read Fforeigns;
  end;


  TSQLBase_fb_Options = class
  private
    FFieldsInInsertUpdate: TFieldsInInsertUdate;
    FUpdateKeyFields: Boolean;
  public
    property FieldsInInsertUpdate: TFieldsInInsertUdate read FFieldsInInsertUpdate write FFieldsInInsertUpdate default fsNewDifOld;
    property UpdateKeyFields     : Boolean              read FUpdateKeyFields      write FUpdateKeyFields      default False      ;
  end;


  TSQLBase_fb = class(TObjectList)
  private
    FautoIncField: string;
//    Fcod_empresa : Integer;
    Ftable       : TTable_fb;
//    FOptions     : Motor_Options;
    FOptions     : TSQLBase_fb_Options;

    procedure SetautoIncField(const Value: string);
    function GetValueCodigoEmpresa: string;

    function GetItem(Index: Integer): TField_Value_fb;
    procedure SetItem(Index: Integer; const Value: TField_Value_fb);

    procedure RescueValues;

    function GetSqlInsert(AupdateOrInsert: Boolean = False):string;
    function GetSqlUpdate():string;
    function GetDelete: string;
//    function RTTI_GetWhereKeyFields(AClassInfo: Pointer): string;
//    function GetSelectByKeyFormat: string;

    function GetInsert: string;
    function GetInsertAutoInc(): string;

    function GetUpdate: string;
    function GetUpdateOrInsert: string;
    function GetUpdateOrInsertAutoInc(): string;

  public
    //constructor Create(Atable, Afields, Akeys, AautoIncField: string{; Acod_empresa: Integer}); overload;
    constructor Create(Atable: TTable_fb; AautoIncField: string{; Acod_empresa: Integer}); overload;

    destructor Destroy; override;

    class function NewSQLBase(AsqlBase: TSQLBase_fb; AautoIncField, AignoreFields: string{; Acod_empresa: Integer}): TSQLBase_fb;
//    class function NewSelectByKeyFormat: string;

    function NewField(Aname, Avalue: string; Akind: TRecordFieldkind): TField_Value_fb;
    function ChangeValue(Aname, Avalue: string; Akind: TRecordFieldkind): TField_Value_fb;
    function HasChanges: Boolean;

    procedure ResetChanges;
    procedure StoreValues;

    property Items[Index: Integer]: TField_Value_fb read GetItem write SetItem;

    property SQLInsert               : string read GetInsert;
    property SQLInsertAutoInc        : string read GetInsertAutoInc;
    property SQLUpdate               : string read GetUpdate;
    property SQLUpdateOrInsert       : string read GetUpdateOrInsert;
    property SQLUpdateOrInsertAutoInc: string read GetUpdateOrInsertAutoInc;
    property SQLDelete               : string read GetDelete;
//    property SelectByKeys            : string read GetSelectByKeyFormat;
    property autoIncField            : string read FautoIncField write SetautoIncField;
//    property Options                 : Motor_Options read FOptions write FOptions;
    property Options                 : TSQLBase_fb_Options read FOptions write FOptions;
    property MetaTable               : TTable_fb read Ftable;
  end;


  TBase_class = class
  private
    FrecordState: TRecordSate;
    function GetTable_fb: TTable_fb;
    procedure checkSQLMotor;
  protected
    Ftable   : TTable_fb;
//    Fprimarys : string;
    FSQLMotor : TSQLBase_fb;
    FinChanges: string;

    procedure ChangeField(FieldName, Value: string); overload;
    procedure ChangeField(FieldName: string; Value: Integer); overload;
    procedure ChangeField_f(FieldName: string; Value: Double); overload;
    procedure ChangeField_dt(FieldName: string; Value: TDateTime); overload;
    procedure ChangeField_d(FieldName: string; Value: TDate); overload;
    procedure ChangeField_t(FieldName: string; Value: TTime); overload;
    procedure ChangeField(FieldName: string; Value: TStrings); overload;
//    procedure ChageAllFields
//    procedure ValueTStringsChange(Sender: TObject);
  public
//    constructor Create();
    destructor Destroy; override;

    procedure beginChanges(InitializeFields: Boolean = False);
    procedure cancelChanges;
    procedure endChanges;
    function HasChangesIn: Boolean;
    function StrChanges: string;

    function SQLMotor(AautoIncField: string = ''; AignoreFields: string = 'ativo'): TSQLBase_fb; virtual;
    //function SetValuesFrom2(ADataSet: TDataSet; AcheckFields: Boolean = False): TBase_class; virtual;
    //ver se podemos colocar rtti em alguns metodos, exemplo C113 cluble delphi
    //o metodo clone tambem podemos fazer de outa forma, acho que o assign tambem usando rtti 

    class function NewStringList(AdupIgnore: Boolean = False; Atext: string = ''; AlineBreak: string = sLineBreak): TStringList;
    class function OnlyNumber(Atext: string): string;

    function int_fb(Aint: Integer): string;
    function float_fb(Adouble: Double): string;
    function date_fb(Adate: TDateTime; AquoteStr: Boolean = True): string;
    function datet_fb(AdateTime: TDateTime; AquoteStr: Boolean = True): string;
    function strq(Astr: string; Asize: Integer = 0; Atrim: Boolean = True): string;

    property recordState: TRecordSate read FrecordState write FrecordState;
    property _tb        : TTable_fb   read GetTable_fb;
  end;

  TBase_classList = class(TObjectList)
  protected
    FChange: TNotifyEvent;
  public
    procedure Clear; override;

    procedure DeleteItem(Index: Integer); virtual;

    function AddItem(AObject: TObject): Integer; virtual;

    function OutOfBounds(Index: Integer): Boolean;

    property OnChange: TNotifyEvent read FChange write FChange;
  end;

implementation

uses
  SysUtils,
  StrUtils,
  TypInfo;

{ TSQLBase_fb }

{
constructor TSQLBase_fb.Create(Atable, Afields, Akeys,
  AautoIncField: string//; Acod_empresa: Integer
  );
begin
  Ftable        := TTable_fb.Create(Atable, Afields, Akeys);
  //FautoIncField := Trim(UpperCase(AautoIncField));
//  Fcod_empresa  := Acod_empresa;
  //FreturnField  := Trim(UpperCase(AreturnField));
  autoIncField  := UpperCase(AautoIncField);
//  FOptions := TSQLBase_fb_Options.Create;

//  if FautoIncField <> '' then
//    if Ftable.fields.IndexOf(FautoIncField) = -1 then
//      FautoIncField := '';

  //if FreturnField <> '' then
  //  if Ftable.fields.IndexOf(FreturnField) = -1 then
  //    FreturnField := '';
end;
}

function TSQLBase_fb.ChangeValue(Aname, Avalue: string;
  Akind: TRecordFieldkind): TField_Value_fb;
var
  I: Integer;
  AhasField: Boolean;
  Anome: string;
begin
  AhasField := False;

  for I := 0 to Self.Count - 1 do
    if Self.Items[I].name = UpperCase(Trim(Aname)) then
    begin
      Anome := Self.Items[i].name;
      Self.Items[I].value := Avalue;
      if Akind <> fkNone then
        Self.Items[I].kind  := Akind;
      Result := Self.Items[I];
      AhasField := True;
      Break;
    end;

  if not AhasField then
    Result := NewField(Aname, Avalue, Akind);
end;

constructor TSQLBase_fb.Create(Atable: TTable_fb; AautoIncField: string{;
  Acod_empresa: Integer});
begin
  Ftable        := Atable;
  //FautoIncField := Trim(UpperCase(AautoIncField));
  //Fcod_empresa  := Acod_empresa;
  //FreturnField  := Trim(UpperCase(AreturnField));
  autoIncField  := UpperCase(AautoIncField);
  FOptions := TSQLBase_fb_Options.Create;
  FOptions.FieldsInInsertUpdate := fsNewDifOld;
  FOptions.UpdateKeyFields      := False;

//  if FautoIncField <> '' then
//    if Ftable.fields.IndexOf(FautoIncField) = -1 then
//      FautoIncField := '';
end;

destructor TSQLBase_fb.Destroy;
begin
  //FreeAndNil(Ftable);
  FreeAndNil(FOptions);
  inherited;
end;

function TSQLBase_fb.GetDelete: string;
var
  Awhere: string;
  I, J: Integer;
begin
  Awhere := '';
  for I := 0 to Ftable.primarys.Count - 1 do
    for J := 0 to Self.Count - 1 do with Self.Items[J] do
      if name = Ftable.primarys[I] then
      begin
        Awhere := Awhere + IfThen(Awhere = '', ' where ', ' and ') + name + ' = ' + IfThen((kind in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                                                                           (Trim(value) = '') and
                                                                                           (Ftable.foreigns.IndexOf(name) >= 0), 'NULL', value);
        Break;
      end;

  Result := 'delete from ' + Ftable.name + ' ' + Awhere;
end;

function TSQLBase_fb.GetInsert: string;
begin
  Result := GetSqlInsert;

  //if FreturnField <> '' then
  //  Result := Result + ' returning ' + FreturnField;
end;

function TSQLBase_fb.GetInsertAutoInc(): string;
var
  I: Integer;
begin
  if FautoIncField <> '' then
    if Ftable.fields.IndexOf(FautoIncField) >= 0 then
      for I := 0 to Self.Count - 1 do with Self.Items[I] do if FautoIncField = name then
      begin
        value := Format('(select cod from incrementa_codigo(%s, %s))', [GetValueCodigoEmpresa, QuotedStr(Ftable.name)]);
        Break;
      end;

  Result := GetSqlInsert;

  RescueValues;

  //if FreturnField <> '' then
  //  Result := Result + ' returning ' + FreturnField;  
end;

function TSQLBase_fb.GetUpdateOrInsert: string;
var
  Amatching: string;
  I, J: Integer;
begin
  Result := GetSqlInsert(True);

  Amatching := '';
  for I := 0 to Ftable.primarys.Count - 1 do
    for J := 0 to Self.Count - 1 do with Self.Items[J] do if name = Ftable.primarys[I] then
      Amatching := Amatching + IfThen(Amatching <> '', ', ') + name;

  if Amatching = '' then
    for J := 0 to Self.Count - 1 do with Self.Items[J] do
      Amatching := Amatching + IfThen(Amatching <> '', ', ') + name;

  Result := Result + IfThen(Amatching <> '', Format(' matching (%s)', [Amatching]))

  //if FreturnField <> '' then
  //  Result := Result + ' returning ' + FreturnField;
end;

function TSQLBase_fb.GetUpdateOrInsertAutoInc(): string;
var
  I: Integer;
begin
  if FautoIncField <> '' then
    if Ftable.fields.IndexOf(FautoIncField) >= 0 then
      for I := 0 to Self.Count - 1 do with Self.Items[I] do if FautoIncField = name then
      begin
        value := Format('(select cod from incrementa_codigo(%s, %s))', [GetValueCodigoEmpresa, QuotedStr(Ftable.name)]);
        Break;
      end;

  Result := GetSqlInsert(True);

  RescueValues;

  //if FreturnField <> '' then
  //  Result := Result + ' returning ' + FreturnField;
end;

function TSQLBase_fb.GetValueCodigoEmpresa: string;
var
  K: Integer;
  AfieldEmpresa: string;

begin
  AfieldEmpresa := '';
  if Ftable.primarys.IndexOf('COD_EMPRESA') >= 0 then
    AfieldEmpresa := 'COD_EMPRESA'
  else if Ftable.primarys.IndexOf('CODIGO_EMP') >= 0 then
    AfieldEmpresa := 'CODIGO_EMP'
  else if Ftable.primarys.IndexOf('COD_EMP') >= 0 then
    AfieldEmpresa := 'COD_EMP';

  Result := '';
  for K := 0 to Self.Count - 1 do
    if Self.Items[K].name = AfieldEmpresa then
    begin
      Result := Trim(Self.Items[K].value);
      Break;
    end;

  if AfieldEmpresa = '' then // quando a tabela nao tem codigo da empresa pode usar zero para um auto incremento
    Result := '0'
  else if Result = '' then
    raise Exception.Create(Format('Auto incremento não pode ser gerado, campo %s sem valor', [AfieldEmpresa]));
end;

function TSQLBase_fb.HasChanges: Boolean;
var
  I: Integer;
begin
  Result := False;

  if FOptions.FieldsInInsertUpdate = fsAllFields then
    Exit;

  for I := 0 to Self.Count - 1 do with Self.Items[I] do
  begin
    Result := ((FOptions.FieldsInInsertUpdate = fsPropertySet      ) and (changed        )) or
              ((FOptions.FieldsInInsertUpdate = fsNewDifOld  ) and (value <> rescue)) or
              ((FOptions.FieldsInInsertUpdate = fsNewdifOldAndPropertySet) and (value <> rescue) and (changed));

    if Result and (Ftable.primarys.IndexOf(name) >= 0) then
      Result := (FOptions.UpdateKeyFields);

    if Result then
      Break;
  end;
  {
  if (not (muModified in FOptions)) and (not (muCheckModified in FOptions)) then
    Exit;

  for I := 0 to Self.Count - 1 do with Self.Items[I] do
  begin
    Result := ((muCheckModified in FOptions ) and (value <> rescue)) or
              ((muModified      in FOptions ) and (changed        ));

    if Result and (Ftable.primarys.IndexOf(name) >= 0) then
      Result := (muKeyFields in FOptions);

    if Result then
      Break;
  end;
  }
end;

function TSQLBase_fb.GetItem(
  Index: Integer): TField_Value_fb;
begin
  Result := TField_Value_fb(inherited Items[Index]);
end;

//function TSQLBase_fb.GetSelectByKeyFormat: string;
//var
//  I, J: integer;
//  infoPropriedades: PPropInfo;
//  Awhere: string;
//begin
//  Result := 'select ' + Ftable.GetFieldsSql() + ' from ' + Ftable.name + ' ' + RTTI_GetWhereKeyFields(Self.ClassType);

  {for I := 0 to Ftable.primarys.Count - 1 do
  begin
    infoPropriedades := GetPropInfo(Self.ClassInfo, LowerCase(Ftable.primarys[I]);

    Awhere := '';
    if Assigned(infoPropriedades) then
      if ((infoPropriedades.PropType^.Kind = tkFloat) and
         (IndexStr(infoPropriedades.PropType^.Name, ['TDate', 'TTime', 'TDateTime', 'Double'])))
         or
         ((infoPropriedades.PropType^.Kind in [tkString, tkLString, tkWString]) and (Trim(LowerCase(infoPropriedades.PropType^.Name)) = 'string'))
         or
         (infoPropriedades.PropType^.Kind = tkChar) then
        Awhere := Awhere +  IfThen(Awhere <> '', ' and ') + Ftable.primarys[I] + ' = %s'
      else if (infoPropriedades.PropType^.Kind = tkInteger) then
        Awhere := Awhere +  IfThen(Awhere <> '', ' and ') + Ftable.primarys[I] + ' = %d'
      else
        raise Exception.Create(Format('TSQLBase_fb.GetSelectByKeyFormat Kind and Name Unknown' +
                                      ' Kind %d - Name %s', [Ord(infoPropriedades.PropType^.Kind),
                                                             infoPropriedades.PropType^.Name]));
  end;}

  //Result := Result + Awhere;
//end;

function TSQLBase_fb.GetSqlInsert(AupdateOrInsert: Boolean): string;
var
  I: Integer;
  Ainto, Avalues: string;
  ASet, IsKey: Boolean;
begin
  Ainto   := '';
  Avalues := '';
  Result := 'insert into ' + Ftable.name + ' (';
  for I := 0 to Self.Count - 1 do with Self.Items[I] do
  begin   
    IsKey := (Ftable.primarys.IndexOf(name) >= 0);
    ASet  := ((FOptions.FieldsInInsertUpdate = fsAllFields             )) or
             ((FOptions.FieldsInInsertUpdate = fsPropertySet            ) and (changed        )) or
             ((FOptions.FieldsInInsertUpdate = fsNewDifOld              ) and (value <> rescue)) or
             ((FOptions.FieldsInInsertUpdate = fsNewdifOldAndPropertySet) and (value <> rescue) and (changed)) or
             ((AupdateOrInsert                                          ) and (IsKey));

    if ASet then
      Ainto := Ainto + IfThen(Ainto <> '', ', ') + name;

  {
    if ((muCheckModified in FOptions ) and (value <> rescue)) or
       ((muModified      in FOptions ) and (changed        )) or
       ((not (muModified in FOptions)) and (not (muCheckModified in FOptions))) or
       ((AupdateOrInsert) and (Ftable.primarys.IndexOf(name) >= 0)) or
       (muAllFields in FOptions) then
       //((kind = fkTStrings) and (muModified in FOptions ) and (value <> rescue)) then
      Ainto := Ainto + IfThen(Ainto <> '', ', ') + name;
      }
  end;


//    ASet := ((muCheckModified in FOptions) and (value <> rescue)) or
//            ((muModified in FOptions) and (changed));
    //if (not FOptions.InsertChangedOnly) or (changed) then
//      Ainto := Ainto + IfThen(Ainto <> '', ', ') + name;
//  end;

  Result := Result + Ainto + ') values (';
  for I := 0 to Self.Count - 1 do with Self.Items[I] do
  begin
    IsKey := (Ftable.primarys.IndexOf(name) >= 0);
    ASet  := ((FOptions.FieldsInInsertUpdate = fsAllFields             )) or
             ((FOptions.FieldsInInsertUpdate = fsPropertySet            ) and (changed        )) or
             ((FOptions.FieldsInInsertUpdate = fsNewDifOld              ) and (value <> rescue)) or
             ((FOptions.FieldsInInsertUpdate = fsNewdifOldAndPropertySet) and (value <> rescue) and (changed)) or
             ((AupdateOrInsert                                          ) and (IsKey));

    if ASet then
      Avalues := Avalues + IfThen(Avalues <> '', ', ') + IfThen((kind in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                                                (Trim(value) = '') and (Ftable.foreigns.IndexOf(name) >= 0), 'NULL', value);
    {
    if ((muCheckModified in FOptions ) and (value <> rescue)) or
       ((muModified      in FOptions ) and (changed        )) or
       ((not (muModified in FOptions)) and (not (muCheckModified in FOptions))) or
       ((AupdateOrInsert) and (Ftable.primarys.IndexOf(name) >= 0)) or
       (muAllFields in FOptions) then
//       ((kind = fkTStrings) and (muModified in FOptions ) and (value <> rescue)) then
    //if (not FOptions.InsertChangedOnly) or (changed) then
      Avalues := Avalues + IfThen(Avalues <> '', ', ') + IfThen((kind in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                                                (Trim(value) = '') and
                                                                (Ftable.foreigns.IndexOf(name) >= 0), 'NULL', value);
                                                                }
  end;

  Result := Result + Avalues;

  Result := IfThen(AupdateOrInsert, 'update or ') +  Result + ')';
end;

function TSQLBase_fb.GetSqlUpdate(): string;
var
  Awhere, Asets: string;
  I, J: Integer;
  Aset, IsKey: Boolean;
begin
  Result := 'update ' + Ftable.name + ' set ';
  Asets  := '';
  for I := 0 to Self.Count - 1 do with Self.Items[I] do
  begin
    IsKey := (Ftable.primarys.IndexOf(name) >= 0);
    ASet  := ((FOptions.FieldsInInsertUpdate = fsAllFields   )) or
             ((FOptions.FieldsInInsertUpdate = fsPropertySet      ) and (changed        )) or
             ((FOptions.FieldsInInsertUpdate = fsNewDifOld  ) and (value <> rescue)) or
             ((FOptions.FieldsInInsertUpdate = fsNewdifOldAndPropertySet) and (value <> rescue) and (changed));


    if ASet and IsKey then
      ASet := FOptions.UpdateKeyFields;

    if ASet then
      Asets := Asets + IfThen(Asets <> '', ', ') + name + ' = ' + IfThen((kind in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                                                         (Trim(value) = '') and (Ftable.foreigns.IndexOf(name) >= 0), 'NULL', value);
  {
//    if ((not FOptions.UpdateChangedOnly) or (changed)) and
//       ((Ftable.primarys.IndexOf(name) = -1) or (FOptions.UpdateKeyFields)) then
    Aset := ((muCheckModified in FOptions ) and (value <> rescue)) or
            ((muModified      in FOptions ) and (changed        )) or
            ((not (muModified in FOptions)) and (not (muCheckModified in FOptions))) or
            (muAllFields in FOptions);
//            ((kind = fkTStrings) and (muModified in FOptions ) and (value <> rescue)) ;

    if Aset and (Ftable.primarys.IndexOf(name) >= 0) then
      Aset := (muKeyFields in FOptions);

    if Aset then
      Asets := Asets + IfThen(Asets <> '', ', ') + name + ' = ' + IfThen((kind in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                                                         (Trim(value) = '') and
                                                                         (Ftable.foreigns.IndexOf(name) >= 0), 'NULL', value);
                                                                         }
  end;

  Awhere := '';
  for I := 0 to Ftable.primarys.Count - 1 do
    for J := 0 to Self.Count - 1 do with Self.Items[J] do
      if name = Ftable.primarys[I] then
      begin
//    if Ftable.primarys.IndexOf(name) >= 0 then
        Awhere := Awhere + IfThen(Awhere = '', ' where ', ' and ') + name + ' = ' + IfThen((kind in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                                                                           (Trim(value) = '') and
                                                                                           (Ftable.foreigns.IndexOf(name) >= 0), 'NULL', value);
        Break;
      end;

  if Awhere = '' then
    for J := 0 to Self.Count - 1 do with Self.Items[J] do
      Awhere := Awhere + IfThen(Awhere = '', ' where ', ' and ') + name + ' = ' + IfThen((kind in [fkInteger, fkFloat, fkDateTime, fkTime, fkDate]) and
                                                                                         (Trim(value) = '') and
                                                                                         (Ftable.foreigns.IndexOf(name) >= 0), 'NULL', value);

  Result := Result + Asets + Awhere;      
end;

function TSQLBase_fb.GetUpdate: string;
begin
  Result := GetSqlUpdate();

  //if FreturnField <> '' then
  //  Result := Result + ' returning ' + FreturnField;
end;

function TSQLBase_fb.NewField(Aname,
  Avalue: string; Akind: TRecordFieldkind): TField_Value_fb;
begin
  Result          := TField_Value_fb.Create;
  Result.name     := UpperCase(Aname);
  Result.value    := Avalue;
  Result.rescue   := Avalue;
  Result.Fchanged := False;
  Result.kind     := Akind;
  Add(Result);
end;

//class function TSQLBase_fb.NewSelectByKeyFormat: string;
//begin
//  Result := 'select ' + Ftable.GetFieldsSql() + ' from ' + Ftable.name + ' ' + RTTI_GetWhereKeyFields(Self.ClassType);
//end;

class function TSQLBase_fb.NewSQLBase(AsqlBase: TSQLBase_fb;
  AautoIncField, AignoreFields: string{; Acod_empresa: Integer}): TSQLBase_fb;
var
  I: Integer;
  AignoreList: TStringList;
//  Aoptions: Motor_Options;
begin
  //Result := TSQLBase_fb.Create(AsqlBase.Ftable.name, AsqlBase.Ftable.GetFieldsSql(), AsqlBase.Ftable.GetFieldsSql('', ftPrimarys), AautoIncField{, Acod_empresa});
  Result := TSQLBase_fb.Create(AsqlBase.Ftable, AautoIncField);
  AignoreList := TBase_class.NewStringList(False, StringReplace(UpperCase(AignoreFields), ' ', '', [rfReplaceAll]), ',');
  try
    for I := 0 to AsqlBase.Count - 1 do
      if AignoreList.IndexOf(AsqlBase.Items[I].name) = -1 then
        with Result.NewField(AsqlBase.Items[I].name, AsqlBase.Items[I].value, AsqlBase.Items[I].kind) do
        begin
          Frescue  := AsqlBase.Items[I].rescue;
          Fchanged := AsqlBase.Items[I].changed;
        end;
    Result.Options.FieldsInInsertUpdate := AsqlBase.Options.FieldsInInsertUpdate;
    Result.Options.UpdateKeyFields      := AsqlBase.Options.UpdateKeyFields;
//    Aoptions := AsqlBase.Options;
//    Result.Options := Aoptions;
//    Result.Options := asq.UpdateChangedOnly := AsqlBase.Options.UpdateChangedOnly;
//    Result.Options.UpdateKeyFields   := AsqlBase.Options.UpdateKeyFields;
//    Result.Options.InsertChangedOnly := AsqlBase.Options.InsertChangedOnly;
  finally
    FreeAndNil(AignoreList);
  end;
end;

procedure TSQLBase_fb.RescueValues;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do
    Self.Items[I].value := Self.Items[I].rescue;
end;

procedure TSQLBase_fb.ResetChanges;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do
  begin
    Self.Items[I].value    := Self.Items[I].rescue;
    Self.Items[I].Fchanged := False;
  end;
end;

{
function TSQLBase_fb.RTTI_GetWhereKeyFields(AClassInfo: Pointer): string;
var
  I, J: integer;
  infoPropriedades: PPropInfo;
begin
  Result := '';
  for I := 0 to Ftable.primarys.Count - 1 do
  begin
    infoPropriedades := GetPropInfo(AClassInfo, LowerCase(Ftable.primarys[I]);

    if Assigned(infoPropriedades) then
      if ((infoPropriedades.PropType^.Kind = tkFloat) and
         (IndexStr(infoPropriedades.PropType^.Name, ['TDate', 'TTime', 'TDateTime', 'Double'])))
         or
         ((infoPropriedades.PropType^.Kind in [tkString, tkLString, tkWString]) and (Trim(LowerCase(infoPropriedades.PropType^.Name)) = 'string'))
         or
         (infoPropriedades.PropType^.Kind = tkChar) then
        Result := Result +  IfThen(Result <> '', ' and ') + Ftable.primarys[I] + ' = %s'
      else if (infoPropriedades.PropType^.Kind = tkInteger) then
        Result := Result +  IfThen(Result <> '', ' and ') + Ftable.primarys[I] + ' = %d'
      else
        raise Exception.Create(Format('TSQLBase_fb.RTTI_GetWhereKeyFields Kind and Name Unknown' +
                                      ' Kind %d - Name %s', [Ord(infoPropriedades.PropType^.Kind),
                                                             infoPropriedades.PropType^.Name]));
  end;
end;
}

procedure TSQLBase_fb.SetautoIncField(const Value: string);
begin
  FautoIncField := Trim(UpperCase(Value));
  if FautoIncField <> '' then
    if Ftable.fields.IndexOf(FautoIncField) = -1 then
      FautoIncField := '';
end;

procedure TSQLBase_fb.SetItem(Index: Integer;
  const Value: TField_Value_fb);
begin
  Put(Index, Value);
end;

procedure TSQLBase_fb.StoreValues;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do
  begin
    Self.Items[I].rescue   := Self.Items[I].value;
    Self.Items[I].Fchanged := False;
  end;
end;

{ TBase_class }

procedure TBase_class.beginChanges(InitializeFields: Boolean);
var
  I: Integer;
begin
  checkSQLMotor;

  if InitializeFields then
    for I := 0 to Ftable.fields.Count - 1 do
      FSQLMotor.ChangeValue(Ftable.fields[I], '', fkNone);

  FSQLMotor.StoreValues;

  FinChanges := 'S';
  {
  if not Assigned(FSQLMotor) then
  begin
    FSQLMotor := TSQLBase_fb.Create(Ftable.name, Ftable.GetFieldsSql(), Fprimarys, '', 0);
    for I := 0 to Ftable.fields.Count - 1 do
      FSQLMotor.NewField(Ftable.fields[I], '');
  end;
  }
end;

procedure TBase_class.cancelChanges;
begin
  FinChanges := '';

  checkSQLMotor;

  FSQLMotor.ResetChanges;
end;

procedure TBase_class.ChangeField_dt(FieldName: string; Value: TDateTime);
begin
  checkSQLMotor;

  with FSQLMotor.ChangeValue(FieldName, IfThen((Value = 0) and (Ftable.foreigns.IndexOf(FieldName) >= 0),
                                               '', datet_fb(Value)), fkDateTime) do
    if FinChanges = 'S' then
      Fchanged := True;
end;

procedure TBase_class.ChangeField_f(FieldName: string; Value: Double);
begin
  checkSQLMotor;

  with FSQLMotor.ChangeValue(FieldName, IfThen((Value = 0) and (Ftable.foreigns.IndexOf(FieldName) >= 0),
                                               '', float_fb(Value)), fkFloat) do
    if FinChanges = 'S' then
      Fchanged := True;
end;

procedure TBase_class.ChangeField(FieldName: string; Value: Integer);
begin
  checkSQLMotor;

  with FSQLMotor.ChangeValue(FieldName, IfThen((Value = 0) and (Ftable.foreigns.IndexOf(FieldName) >= 0),
                                               '', IntToStr(Value)), fkInteger) do
    if FinChanges = 'S' then
      Fchanged := True;
end;

procedure TBase_class.ChangeField(FieldName: string; Value: TStrings);
begin
  checkSQLMotor;

  with FSQLMotor.ChangeValue(FieldName, QuotedStr(Value.Text), fkTStrings) do
    if FinChanges = 'S' then
      Fchanged := True;
end;

procedure TBase_class.ChangeField_t(FieldName: string; Value: TTime);
begin
  checkSQLMotor;

  with FSQLMotor.ChangeValue(FieldName, IfThen((Value = 0) and (Ftable.foreigns.IndexOf(FieldName) >= 0),
                                               '', datet_fb(Value)), fkTime) do
    if FinChanges = 'S' then
      Fchanged := True;
end;

procedure TBase_class.ChangeField_d(FieldName: string; Value: TDate);
begin
  checkSQLMotor;

  with FSQLMotor.ChangeValue(FieldName, IfThen((Value = 0) and (Ftable.foreigns.IndexOf(FieldName) >= 0),
                                               '', date_fb(Value)), fkDate) do
    if FinChanges = 'S' then
      Fchanged := True;
end;

procedure TBase_class.ChangeField(FieldName, Value: string);
var
  I: Integer;
  AhasField: Boolean;
begin
  checkSQLMotor;

  with FSQLMotor.ChangeValue(FieldName, Value, fkString) do
    if FinChanges = 'S' then
      Fchanged := True;

  {
  AhasField := False;

  for I := 0 to FSQLMotor.Count - 1 do
    if FSQLMotor.Items[I].name = Trim(UpperCase(FieldName)) then
    begin
      FSQLMotor.Items[I].value := Value;
      if FinChanges = 'S' then
        FSQLMotor.Items[I].Fchanged := FSQLMotor.Items[I].value <> FSQLMotor.Items[I].rescue;
      AhasField := True;
      Break;
    end;

  if not AhasField then
    with FSQLMotor.NewField(FieldName, Value) do
      Fchanged := FinChanges = 'S';
  }
end;

procedure TBase_class.checkSQLMotor;
begin
  if not Assigned(FSQLMotor) then
    FSQLMotor := TSQLBase_fb.Create(Ftable, '');
//    FSQLMotor := TSQLBase_fb.Create(Ftable.name, Ftable.GetFieldsSql(), Fprimarys, '');
end;

function TBase_class.datet_fb(AdateTime: TDateTime;
  AquoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD hh:mm:ss', AdateTime);
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function TBase_class.date_fb(Adate: TDateTime; AquoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD', Adate);
  if AquoteStr then
    Result := QuotedStr(Result);
end;

destructor TBase_class.Destroy;
begin
  if Assigned(FSQLMotor) then FreeAndNil(FSQLMotor);  
  inherited;
end;

procedure TBase_class.endChanges;
begin
  FinChanges := '';

  checkSQLMotor;

  FSQLMotor.StoreValues;
end;

function TBase_class.float_fb(Adouble: Double): string;
begin
  Result := StringReplace(Format('%0.14f', [Adouble]), ',', '.', []);
  if Result <> '' then
    while Result[Length(Result)] = '0' do
      System.Delete(Result, Length(Result), 1);
  if Result[Length(Result)] = '.' then
    System.Delete(Result, Length(Result), 1);
end;

function TBase_class.GetTable_fb: TTable_fb;
begin
  Result := SQLMotor().MetaTable;
end;

function TBase_class.HasChangesIn: Boolean;
var
  I: Integer;
begin
  Result := False;

  checkSQLMotor;

  for I := 0 to FSQLMotor.Count - 1 do with FSQLMotor.Items[I] do
    if value <> rescue then
    begin
      Result := True;
      Exit;
    end;
end;

function TBase_class.int_fb(Aint: Integer): string;
begin
  Result := IntToStr(Aint);
end;

class function TBase_class.NewStringList(AdupIgnore: Boolean; Atext,
  AlineBreak: string): TStringList;
begin
  Result := TStringList.Create;
  Result.LineBreak := AlineBreak;
  if AdupIgnore then
  begin
    Result.Sorted := True;
    Result.Duplicates := dupIgnore;
  end;
  Result.Text := Atext;
end;

class function TBase_class.OnlyNumber(Atext: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to (Length(Atext)) do
    if Pos(Atext[I], '0123456789') > 0 then
      Result := Result + Atext[I];
end;

function TBase_class.SQLMotor(AautoIncField,
  AignoreFields: string): TSQLBase_fb;
var
  AignoreList: TStrings;
  I: Integer;
begin
  AignoreList := TBase_class.NewStringList(False, StringReplace(AignoreFields, ' ', '', [rfReplaceAll]), ',');
  try
    if Assigned(FSQLMotor) then
      Result := TSQLBase_fb.NewSQLBase(FSQLMotor, AautoIncField, AignoreFields)
    else
      Result := TSQLBase_fb.Create(Ftable, AautoIncField);

    for I := 0 to Result.Count - 1 do
      if Result.Items[I].kind in [fkString, fkTStrings] then
        if (Result.Items[I].value = QuotedStr('')) and (Result.Items[I].Frescue = '') then
          Result.Items[I].rescue := QuotedStr('');
  finally
    FreeAndNil(AignoreList);
  end;
end;

function TBase_class.StrChanges: string;
var
  I: Integer;
begin
  Result := '';

  checkSQLMotor;

  for I := 0 to FSQLMotor.Count - 1 do with FSQLMotor.Items[I] do if value <> rescue then
    Result := Result + Format('[%s:%s>%s]', [name, rescue, value]);

  Result := StringReplace(Result, '''', '', [rfReplaceAll]);
end;

function TBase_class.strq(Astr: string; Asize: Integer;
  Atrim: Boolean): string;
begin
  if Atrim then
    Astr := Trim(Astr);
  if Asize > 0 then
    Astr := Copy(Astr, 1, Asize);
  Result := QuotedStr(Astr);
end;

{ TTable_fb }

constructor TTable_fb.Create(Atable, Aprimarys, Aforeigns, Afields: string);
var
  I: Integer;
begin
  Fname     := Trim(UpperCase(Atable));
  Ffields   := TBase_class.NewStringList(False, StringReplace(UpperCase(Afields  ), ' ', '', [rfReplaceAll]), ',');
  Fprimarys := TBase_class.NewStringList(False, StringReplace(UpperCase(Aprimarys), ' ', '', [rfReplaceAll]), ',');
  Fforeigns := TBase_class.NewStringList(False, StringReplace(UpperCase(Aforeigns), ' ', '', [rfReplaceAll]), ',');

  for I := Pred(Fprimarys.Count) downto 0 do
    if Ffields.IndexOf(Fprimarys[I]) = -1 then//campos nao existe na tabela
      Fprimarys.Delete(I);

  for I := Pred(Fforeigns.Count) downto 0 do
    if Ffields.IndexOf(Fforeigns[I]) = -1 then//campos nao existe na tabela
      Fforeigns.Delete(I);
end;

destructor TTable_fb.Destroy;
begin
  FreeAndNil(Ffields);
  FreeAndNil(Fprimarys);
  inherited;
end;

function TTable_fb.GetFieldsSql(Aalias: string; Atype: TRecordFieldTypes): string;
var
  Alist: TStringList;
begin
  if Atype = ftPrimarys then
    Result := Trim(Fprimarys.Text)
  else if Atype = ftForeigns then
    Result := Trim(Fforeigns.Text)
  else
    Result := Trim(Ffields.Text);
  while (Length(Result) > 0) and
        ((Result[Length(Result)] = ',' ) or
         (Result[Length(Result)] = ' ' )) do
    System.Delete(Result, Length(Result), 1);

  Result := '@' + StringReplace(Result, ',', ', @', [rfReplaceAll]);
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(LowerCase(Result), '@', Aalias, [rfReplaceAll]);
end;

{ TBase_classList }

function TBase_classList.AddItem(AObject: TObject): Integer;
begin
  Result := Add(AObject);
  if Assigned(FChange) then
    FChange(Self);
end;

procedure TBase_classList.Clear;
begin
  inherited;

  if Assigned(FChange) then
    FChange(Self);
end;

procedure TBase_classList.DeleteItem(Index: Integer);
begin
  Delete(Index);
  if Assigned(FChange) then
    FChange(Self);  
end;

function TBase_classList.OutOfBounds(Index: Integer): Boolean;
begin
  Result := (Index < 0) or (Index > Self.Count -1);
end;

end.
