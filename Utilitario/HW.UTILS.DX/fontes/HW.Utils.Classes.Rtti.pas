{******************************************************************************}
{ Projeto: REST HW                                                             }
{  Biblioteca para ser usada em maior parte para consumir a api da HW Sistemas }
{ outras apis também são podem ser consumidas utilizando esta biblioteca       }
{                                                                              }
{ Direitos Autorais Reservados (c) 2017   Hw Sistemas e Computadores           }
{                                                                              }
{ Autor: João Pedro Rodrigues Costa                                            }
{                                                                              }
{            HW Sistemas e Computadores Ltda - www.hwsistemas.com.br           }
{    Rua Mogno, 236, Santo Agostinho - Governador Valadares - MG - 35.065-019  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 23/02/2017: João Pedro
|*  - Criação e distribuição da Primeira Versao
*******************************************************************************}

unit HW.Utils.Classes.Rtti;

interface

uses
  System.Rtti,
  System.Classes,
  Data.DB,
  DataSnap.DBClient;

type
  THwRttiEnumActionDataSet = (hwrtacUpdate, hwrtacInsert, hwrtacApend,
    hwrtacApplyClient, hwrtacUpdateOrInsert, hwrtacSelect);
  THwRttiEnumActionDataSetOptions = set of THwRttiEnumActionDataSet;

  THwCustomAttribute = class(TCustomAttribute)
  end;

  THwConvertDateTimeFormatUtils = class
  public
    class function ConvertDateTimeToStr(Value: TDateTime; AFormat: string): string;
    class function ConvertStrToDateTime(Value: string; AFormat: string): TDateTime;
    class function ConvertDateTime(Value: string; AFormatIn, AFormatOut: string): string;
  end;

  /// <summary> Conversao de valores entre Objeto e DataSet, Atributo e Field -- string para (datatime, date ou time) e vice versa </summary>
  THwConvertDateTimeFormat = class(THwCustomAttribute)
  private
    FDateTimeFormat: string;
  public
    constructor Create(const ADateTimeFormat: string); overload;

    function ConvertDateTimeToStr(Value: TDateTime): string;
    function ConvertStrToDateTime(Value: string): TDateTime;

    property DateTimeFormat: string read FDateTimeFormat write FDateTimeFormat;
  end;

  /// <summary>Indica que o campo é not null e quando for serializado e vazio precisa conter um valor</summary>
  THwJsonSerializer = class(THwCustomAttribute)
  private
    FName: string;
    FNotNull: Boolean;
    FDefaultValue: string;
    FIsNumber: Boolean;
  public
    constructor Create(const ANotNull     : Boolean = False;
                       const ADefaultValue: string = '';
                       const AName        : string = '');
    property NotNull: Boolean read FNotNull write FNotNull;

    property Name: string read FName write FName;
    property DefaultValue: string read FDefaultValue write FDefaultValue;
    property IsNumber: Boolean read FIsNumber write FIsNumber;
  end;

  /// <summary>Indica que o campo não existe no banco de dados, entao não irá montar qualquer sql, Paramtro ou Field com ele</summary>
  THwDBFieldNotIn = class(THwCustomAttribute)
  end;

  /// <summary>CustomAttribute para definir no nome da tabela no banco de dados</summary>
  THwDBTableName = class(THwCustomAttribute)
  private
    FTableName: string;
  public
    constructor Create(const ATableName: string);
    property TableName: string read FTableName write FTableName;
  end;

  /// <summary>CustomAttribute para definir as propriedades no DataSet e no Banco de dados</summary>
  THwDBField = class(THwCustomAttribute)
  private
    FName: string;
    FDisplay: string;
    FMask: string;
    FSize: SmallInt;
    FisKey: Boolean;
  public
    constructor Create(const AName: string; ADisplay: string = ''; AisKey: Boolean = False; ASize: Integer = 0; AMask: string = ''); overload;
    constructor Create(const AName: string; ADisplay: string = ''; ASize: Integer = 0); overload;
    constructor Create(const AName: string; ASize: Integer); overload;

    class function GetFieldTypeByStr(AValue: string): TFieldType;

    property Name: string read FName write FName;
    property Display: string read FDisplay write FDisplay;
    property Mask: string read FMask write FMask;
    property Size: SmallInt read FSize write FSize;
    property isKey: Boolean read FisKey write FisKey;
  end;

  HWDBField = class(THwCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const FieldName: string);
    property Name: string read FName write FName;
  end;

  /// <summary> Converte classes, objetos, datasets e parametros usando RTTI junto com CustomAttributes</summary>
  THwRttiConverter = class
  private
    FRTTICtx: TRttiContext;
    class function ObjectType(Ctx: TRttiContext; TypeName: string): TRttiType;
    class function ObjectInstance(Ctx: TRttiContext; TypeName: string): TObject;
    class function CapitalizeFieldNormalCase(FieldName: string): string;
  public
    function CreateObject(AClass: TClass; AObject: TObject = nil): TObject;
    /// <summary>
    ///   Converte os valores do registro corrente no dataset em um objeto
    /// </summary>
    function DataSetRowToObject(AClass: TClass; ADataSet: TDataSet): TObject;
    /// <summary>
    ///   Posta os dados de um objeto em um dataset
    /// </summary>
    class function ObjectPostInDataSetRow(AObject: TObject; ADataSet: TDataSet;
      AAction: THwRttiEnumActionDataSet = hwrtacInsert; AOptions: THwRttiEnumActionDataSetOptions = []): TDataSet;
    /// <summary>
    ///   Posta os dados de um objeto no parametro que foram gerados por alguma expressão SQL
    /// </summary>
    class procedure SetObjectToDataSetParams(AObject: TObject; AParams: TParams);
    /// <summary>
    ///   Converte a classe em um script de Update or Insert
    /// </summary>
    class function ClassToSqlUpdateOrInsert(AClass: TClass; AFieldsMatching: array of string): string;
    /// <summary>
    ///   Converte a classe em um script de (Update, Insert ou Select)
    /// </summary>
    class function ClassToSql(AClass: TClass; AAction: THwRttiEnumActionDataSet;
      AFieldNames: array of string; AFieldsMatching: array of string): string;
    /// <summary>
    ///   Converte a classe em um script de Update
    /// </summary>
    class function ClassToSqlUpdate(AClass: TClass; AFieldsUpdate, AFieldsMatching: array of string): string;
    /// <summary>
    ///   Converte a classe em um script de Insert
    /// </summary>
    class function ClassToSqlInsert(AClass: TClass; AFieldNames: array of string): string;
    /// <summary>
    ///   Converte a classe em um script de Select
    /// </summary>
    class function ClassToSqlSelect(AClass: TClass; AFieldNames, AFieldsInWhere: array of string): string;
    /// <summary>
    ///   Cria um Objeto do tipo TClientDataSet usando como base uma Classe com seus CustomAttributes
    /// </summary>
    /// <param name="AMemoryDataSet">Quando True chama o metodo CreateDataset e automaticamente o metodo <see cref="THwRttiConverter.SetPropertiesFields"/></param>
    class function ClassToEmptyDataSet(AClass: TClass; AMemoryDataSet: Boolean = True; ResolveDisplay: Boolean = True; AOwner: TComponent = nil): TClientDataSet;
    /// <summary>
    ///   Modifica displays e mascaras do dataset com base nos CustomAttributes
    /// </summary>
    class procedure SetPropertiesFields(AClass: TClass; ADataSet: TDataSet);
    /// <summary>
    ///   Retorna um array dos campos que permitem valor nulo
    /// </summary>
    class function GetCustomFieldsJsonSerializer(AClass: TClass): TArray<THwJsonSerializer>;
    /// <summary>
    ///   Mescla os dados do segundo objeto no primeiro
    /// </summary>
    class procedure MesclarObjetos(var Destination: TObject; Source: TObject; acceptVariant: Boolean = False);
    /// <summary>
    ///   Criar uma copia com base em source
    /// </summary>
    //class function CopiarObjeto<T>(Source: TObject): T;
  end;

  RttiHwUtils = class(THwRttiConverter)

  end;

implementation

{ THwRttiConverter }

uses
  System.SysUtils,
  System.StrUtils,
  System.Variants,
  System.TypInfo,
  Winapi.Windows,
  REST.Json.Types;

function THwRttiConverter.CreateObject(AClass: TClass;
  AObject: TObject): TObject;
var
  LObjectType: string;
  LObject: TObject;
begin
  if not Assigned(AClass) then
    result := nil
  else
  begin
    LObjectType := AClass.QualifiedClassName; // RttiTypeOf(T).QualifiedName;
    if not Assigned(AObject) then
      LObject := ObjectInstance(FRTTICtx, LObjectType)
    else
      LObject := AObject;
    if LObject = nil then
      raise Exception.Create('nil instance');
    result := LObject;
  end;
end;

function THwRttiConverter.DataSetRowToObject(AClass: TClass;
  ADataSet: TDataSet): TObject;
var
  AObject: TObject;

  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;
  AField: TField;
  AFieldName: string;

  isSet: Boolean;
begin
  AObject := CreateObject(AClass);
  try
    if not Assigned(ADataSet) then
      raise Exception.Create('ADataSet not Assigned');

    if not(ADataSet.State in [dsBrowse, dsInsert, dsEdit]) then
      Exit(AObject);

    if ADataSet.IsEmpty then
      Exit(AObject);

    AContext := TRttiContext.Create;

    try
      AType := AContext.GetType(AObject.ClassType);

      for AProperty in AType.getProperties do
      begin
        AFieldName := AProperty.Name;
        for ACustomAttribute in AProperty.GetAttributes do
          if (ACustomAttribute is THwDBField) then
            AFieldName := THwDBField(ACustomAttribute).Name;

        AField := ADataSet.FindField(AFieldName);
        if Assigned(AField) then
        begin
          if MatchStr(AProperty.PropertyType.Name, ['Integer', 'SmallInt', 'Int64']) then
            AProperty.SetValue(AObject, TValue.From(TIntegerField(AField).Value))
          else if MatchStr(AProperty.PropertyType.Name, ['Double', 'Currency', 'Real']) then
            AProperty.SetValue(AObject, TValue.From(TFloatField(AField).Value))
          else if MatchStr(AProperty.PropertyType.Name, ['string']) then
          begin // caso seja usado o THwConvertDateTimeFormat pela classe, sera chamado o conversor
            isSet := False;
            if (AField is TDateTimeField) or (AField is TDateField) or
              (AField is TTimeField) then
              for ACustomAttribute in AProperty.GetAttributes do
                if ACustomAttribute is THwConvertDateTimeFormat then
                begin
                  AProperty.SetValue(AObject,
                    TValue.From(THwConvertDateTimeFormat(ACustomAttribute)
                    .ConvertDateTimeToStr(TDateTimeField(AField).Value)));
                  isSet := True;
                end;

            if not isSet then
              AProperty.SetValue(AObject,
                TValue.From(TStringField(AField).Value))
          end
          else if MatchStr(AProperty.PropertyType.Name,
            ['TDateTime', 'TDate', 'TTime']) then
          begin
            isSet := False;
            for ACustomAttribute in AProperty.GetAttributes do
              if ACustomAttribute is THwConvertDateTimeFormat then
              begin
                AProperty.SetValue(AObject,
                  TValue.From(THwConvertDateTimeFormat(ACustomAttribute)
                  .ConvertStrToDateTime(TStringField(AField).Value)));
                isSet := True;
              end;

            if not isSet then
              AProperty.SetValue(AObject,
                TValue.From(TDateTimeField(AField).Value));

            { ///se necerrario remover os comentarios e utilizar o teste para cada tipo de field
              if not isSet then
              begin
              if MatchStr(AProperty.PropertyType.Name, ['TDateTime']) then
              AProperty.SetValue(AObject, TValue.From(TDateTimeField(AField).Value))
              else if MatchStr(AProperty.PropertyType.Name, ['TDate']) then
              AProperty.SetValue(AObject, TValue.From(TDateField(AField).Value))
              else if MatchStr(AProperty.PropertyType.Name, ['TTime']) then
              AProperty.SetValue(AObject, TValue.From(TTimeField(AField).Value));
              end; }
          end;
        end;
      end;
    finally
      AContext.Free;
    end;

  finally
    result := AObject;
  end;
end;

class function THwRttiConverter.GetCustomFieldsJsonSerializer(AClass: TClass): TArray<THwJsonSerializer>;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;
  AArrayValue: TArray<THwJsonSerializer>;
  AF: THwJsonSerializer;
begin
  SetLength(AArrayValue, 0);

  if not Assigned(AClass) then
    raise Exception.Create('AClass not Assigned');

  AContext := TRttiContext.Create;

  try
    AType := AContext.GetType(AClass);

    for AProperty in AType.getProperties do
    begin
      SetLength(AArrayValue, Length(AArrayValue) + 1);

      AF := nil;

      for ACustomAttribute in AProperty.GetAttributes do
        if ACustomAttribute is THwJsonSerializer then
        begin
          if THwJsonSerializer(ACustomAttribute).Name = '' then
            THwJsonSerializer(ACustomAttribute).Name := AProperty.Name;

          if not Assigned(AF) then
            AF := THwJsonSerializer.Create();

          AF.Name    := THwJsonSerializer(ACustomAttribute).Name;
          AF.NotNull := THwJsonSerializer(ACustomAttribute).NotNull;
          AF.DefaultValue := THwJsonSerializer(ACustomAttribute).DefaultValue;
        end
        else if ACustomAttribute is JSONNameAttribute then
        begin
          if not Assigned(AF) then
            AF := THwJsonSerializer.Create();

          AF.Name    := JSONNameAttribute(ACustomAttribute).Name;
        end;

      if not Assigned(AF) then
        AF := THwJsonSerializer.Create(False, '', AProperty.Name);

      AF.IsNumber := MatchStr(AProperty.PropertyType.Name, ['Integer', 'SmallInt', 'Int64', 'Double', 'Currency', 'Real']);

      AArrayValue[Length(AArrayValue) - 1] := AF;
    end;

  finally
    result := AArrayValue;
    AContext.Free;
  end;
end;

class procedure THwRttiConverter.MesclarObjetos(var Destination: TObject;
  Source: TObject; acceptVariant: Boolean);
var
  AContextDest: TRttiContext;
  ATypeDest: TRttiType;
  APropertyDest: TRttiProperty;

  AContextSource: TRttiContext;
  ATypeSource: TRttiType;
  APropertySource: TRttiProperty;

  ACustomAttribute: TCustomAttribute;
  attSourceName, attDestName: string;

begin
  if not Assigned(Source) then
    raise Exception.Create('Source not Assigned');

  if not Assigned(Destination) then
    raise Exception.Create('Destination not Assigned');

  AContextDest := TRttiContext.Create;
  AContextSource := TRttiContext.Create;

  try
    ATypeDest := AContextDest.GetType(Destination.ClassType);
    ATypeSource := AContextDest.GetType(Source.ClassType);

    for APropertySource in ATypeSource.getProperties do
      for APropertyDest in ATypeDest.getProperties do
      begin
        attSourceName := APropertySource.Name.Trim.ToLower();
        for ACustomAttribute in APropertySource.GetAttributes do
          if (ACustomAttribute is HwDBField) then
          begin
            attSourceName := THwDBField(ACustomAttribute).Name.Trim.ToLower();
            Break;
          end;

        attDestName := APropertyDest.Name.Trim.ToLower();
        for ACustomAttribute in APropertyDest.GetAttributes do
          if (ACustomAttribute is HwDBField) then
          begin
            attDestName := THwDBField(ACustomAttribute).Name.Trim.ToLower();
            Break;
          end;

        if (attDestName.Equals(attSourceName)) then
          if (APropertyDest.PropertyType.Name.ToLower.Equals(APropertySource.PropertyType.Name.ToLower)) or
            (APropertyDest.PropertyType.Name.ToLower.Equals('variant') and acceptVariant) or
            (APropertySource.PropertyType.Name.ToLower.Equals('variant') and acceptVariant) then
            if APropertySource.PropertyType.TypeKind = tkClass then
              //
            else
              APropertyDest.SetValue(Destination, APropertySource.GetValue(Source));
      end;

  finally
    AContextDest.Free;
    AContextSource.Free;
  end;

//var
//  I        : Integer;
//  PropCount: Integer;
//  PropList : PPropList;
//  ObjSource: TObject;
//  ObjMySelf: TObject;
//begin

//  Value := Value;
//
//  PropCount := GetPropList(Source.ClassInfo, PropList);
//  if PropCount <= 0 then
//    Exit;
//
//  for I := 0 to Pred(PropCount) do
//  begin
//    if (PropList[I].PropType^.Kind = tkClass) and
//       (IndexText(PropList[I].PropType^.Name, ['TStrings', 'TStringList']) >= 0) then
//    begin
//      if IsPublishedProp(Source, PropList[I].Name) then
//      begin
//        ObjSource := GetobjectProp(Source, PropList[I].Name);
//        ObjMySelf := GetobjectProp(Value  , PropList[I].Name);
//        if Assigned(ObjSource) and Assigned(ObjMySelf) then
//          TStrings(ObjMySelf).Text := TStrings(ObjSource).Text;
//      end;
//    end
//    else if (PropList[I].PropType^.Kind <> tkClass) then
//      if IsPublishedProp(Source, PropList[I].Name) then
//        SetPropValue(Value, PropList[I].Name, GetPropValue(Source, PropList[I].Name));
//  end;

end;

class function THwRttiConverter.ObjectInstance(Ctx: TRttiContext;
  TypeName: string): TObject;
var
  rType: TRttiType;
  mType: TRTTIMethod;
  metaClass: TClass;
begin
  rType := ObjectType(Ctx, TypeName);
  if (rType <> nil) then
    for mType in rType.GetMethods do
    begin
      if mType.HasExtendedInfo and mType.IsConstructor then
      begin
        if Length(mType.GetParameters) = 0 then
        begin
          // invoke
          metaClass := rType.AsInstance.MetaclassType;
          Exit(mType.Invoke(metaClass, []).AsObject);
        end;
      end;
    end;
  Exit(nil);
end;

class function THwRttiConverter.ObjectPostInDataSetRow(AObject: TObject;
  ADataSet: TDataSet; AAction: THwRttiEnumActionDataSet;
  AOptions: THwRttiEnumActionDataSetOptions): TDataSet;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;
  AField: TField;
  isSet: Boolean;
  AFieldName: string;
begin
  Result := ADataSet;
  if not Assigned(ADataSet) then
    raise Exception.Create('ADataSet not Assigned');

  AContext := TRttiContext.Create;

  try
    AType := AContext.GetType(AObject.ClassType);
    if ADataSet.State = dsBrowse then
      case AAction of
        hwrtacUpdate:
          ADataSet.Edit;
        hwrtacApend:
          ADataSet.Append;
      else
        ADataSet.Insert;
      end;

    for AProperty in AType.getProperties do
      if AProperty.IsReadable then
      begin
        AFieldName := AProperty.Name;
        for ACustomAttribute in AProperty.GetAttributes do
          if (ACustomAttribute is THwDBField) then
            AFieldName := THwDBField(ACustomAttribute).Name;

        AField := ADataSet.FindField(AFieldName);

        if Assigned(AField) then
        begin
          isSet := False;
          if MatchStr(AProperty.PropertyType.Name, ['Integer', 'SmallInt', 'Int64']) then
            AField.AsInteger := AProperty.GetValue(AObject).AsInteger
          else if MatchStr(AProperty.PropertyType.Name,
            ['Double', 'Currency', 'Real']) then
            AField.AsFloat := AProperty.GetValue(AObject).AsExtended
          else if MatchStr(AProperty.PropertyType.Name, ['string']) then
          begin
            if (AField.DataType in [ftDateTime, ftDate, ftTime]) then
              for ACustomAttribute in AProperty.GetAttributes do
                if ACustomAttribute is THwConvertDateTimeFormat then
                begin
                  TDateTimeField(AField).Value :=
                    THwConvertDateTimeFormat(ACustomAttribute)
                    .ConvertStrToDateTime(AProperty.GetValue(AObject).ToString);
                  isSet := True;
                end;

            if not isSet then
              AField.AsString := AProperty.GetValue(AObject).ToString
          end
          else if MatchStr(AProperty.PropertyType.Name,
            ['TDateTime', 'TDate', 'TTime']) then
          begin
            if (AField.DataType in [ftString]) then
              for ACustomAttribute in AProperty.GetAttributes do
                if ACustomAttribute is THwConvertDateTimeFormat then
                begin
                  TStringField(AField).Value :=
                    THwConvertDateTimeFormat(ACustomAttribute)
                    .ConvertDateTimeToStr(AProperty.GetValue(AObject).AsExtended);
                  isSet := True;
                end;

            if (not isSet) and (not AProperty.GetValue(AObject).ToString().Trim.IsEmpty) then
            begin
              if MatchStr(AProperty.PropertyType.Name, ['TDateTime']) then
                AField.AsDateTime :=
                  StrToDateTime(AProperty.GetValue(AObject).ToString)
              else if MatchStr(AProperty.PropertyType.Name, ['TDate']) then
                AField.AsDateTime :=
                  StrToDate(AProperty.GetValue(AObject).ToString)
              else if MatchStr(AProperty.PropertyType.Name, ['TTime']) then
                AField.AsDateTime :=
                  StrToTime(AProperty.GetValue(AObject).ToString);
            end;
            if AField.AsDateTime = 0 then
              AField.Value := Null;
          end;
        end;
      end;

    ADataSet.Post;

    if hwrtacApplyClient in AOptions then
      TClientDataSet(ADataSet).ApplyUpdates(-1);

  finally
    AContext.Free;
  end;
end;

class function THwRttiConverter.CapitalizeFieldNormalCase(FieldName: string): string;
const
  TextoU = ['A'..'Z'];
  TextoL = ['a'..'z'];
var
  I: Integer;
  Upper, Lower, Capitalize: Boolean;
begin
  Result := '';

  Upper := False;
  Lower := False;

  for I := 0 to FieldName.Length do
    if FieldName[I] in TextoU then
      Upper := True
    else if FieldName[I] in TextoL then
      Lower := True;

  Capitalize := Lower;

  for I := 1 to FieldName.Length do
  begin
    if (I = 1) and (Lower) then
      Result := FieldName.ToUpper()[I]
    else if (Lower) and (FieldName[i] in TextoU) and (FieldName[I - 1] in TextoL) then
      Result := Result + ' ' + FieldName.ToUpper()[I]
    else
      Result := Result + FieldName[I];
  end;
end;

class function THwRttiConverter.ClassToEmptyDataSet(AClass: TClass;
  AMemoryDataSet, ResolveDisplay: Boolean; AOwner: TComponent): TClientDataSet;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;

  AClient: TClientDataSet;
  ADbField: THwDBField;
  ASizeDefault: SmallInt;
  AField: TField;
  AFieldType: TFieldType;

  isSet: Boolean;
  I: Integer;
begin

  if not Assigned(AClass) then
    raise Exception.Create('AClass not Assigned');

  AContext := TRttiContext.Create;

  AClient := TClientDataSet.Create(AOwner);

  try
    AType := AContext.GetType(AClass);

    isSet := False;
    for ACustomAttribute in AType.GetAttributes do
      if ACustomAttribute is THwDBTableName then
      begin
        AClient.Name := 'dsbClient' + THwDBTableName(ACustomAttribute).TableName;
        isSet := True;
      end;
    if not isSet then
      AClient.Name := 'dsbClient' + AType.ToString;

    for AProperty in AType.getProperties do
    begin
      isSet := False;

      for ACustomAttribute in AProperty.GetAttributes do
        if ACustomAttribute is THwDBFieldNotIn then
          isSet := True;

      if not isSet then
      begin
        for ACustomAttribute in AProperty.GetAttributes do
          if (ACustomAttribute is THwDBField) then
          begin
            ADbField         := THwDBField(ACustomAttribute);
            ADbField.Name    := IfThen(ADbField.Name  <> '', ADbField.Name, AProperty.Name);
            ADbField.Display := IfThen(ADbField.Display  <> '', ADbField.Display, AProperty.Name);
            with AClient.FieldDefs.AddFieldDef do
            begin
              Name     := ADbField.Name;
              DataType := THwDBField.GetFieldTypeByStr(AProperty.PropertyType.Name);
              Size     := ADbField.Size;
            end;
            isSet := True;
          end;

        if not isSet then
        begin
          if THwDBField.GetFieldTypeByStr(AProperty.PropertyType.Name) = ftString then
            ASizeDefault := 64
          else
            ASizeDefault := 0;
          AFieldType := THwDBField.GetFieldTypeByStr(AProperty.PropertyType.Name);
          if AFieldType <> ftUnknown then
            AClient.FieldDefs.Add( AProperty.Name,AFieldType ,ASizeDefault);
        end;
      end;
    end;

    if AMemoryDataSet then
    begin
      AClient.CreateDataSet;

      for AProperty in AType.getProperties do
      begin
        isSet := False;

        for ACustomAttribute in AProperty.GetAttributes do
          if ACustomAttribute is THwDBFieldNotIn then
            isSet := True;

        if not isSet then
        begin
          for ACustomAttribute in AProperty.GetAttributes do
            if (ACustomAttribute is THwDBField) then
            begin
              ADbField         := THwDBField(ACustomAttribute);
              ADbField.Name    := IfThen(ADbField.Name  <> '', ADbField.Name, AProperty.Name);
              ADbField.Display := IfThen(ADbField.Display  <> '', ADbField.Display, AProperty.Name);
              AField           := AClient.FieldByName(ADbField.Name);
              if AField <> nil then
              begin
                AField.DisplayLabel := ADbField.Display;
                if AField.DataType in [ftFloat, ftCurrency] then
                  TFloatField(AField).DisplayFormat := ADbField.Mask
                else if AField.DataType in [ftString, ftDateTime, ftDate, ftTime] then
                  TStringField(AField).EditMask := ADbField.Mask
                else if AField.DataType in [ftInteger] then
                  TIntegerField(AField).EditFormat := ADbField.Mask;
              end;
            end;
        end;
      end;
    end;

    if ResolveDisplay then
      for I := 0 to AClient.Fields.Count - 1 do
        AClient.Fields[I].DisplayLabel := CapitalizeFieldNormalCase(AClient.Fields[I].DisplayLabel);

  finally
    result := AClient;
    AContext.Free;
  end;
end;

class function THwRttiConverter.ClassToSql(AClass: TClass;
  AAction: THwRttiEnumActionDataSet;
  AFieldNames, AFieldsMatching: array of string): string;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;
  ASql, ATableName, AFieldName: string;
  AListFieldNames, AListKeyFieldName: TStrings;
  isSet: Boolean;
  I: Integer;
  ADbField: THwDBField;
begin

  if not Assigned(AClass) then
    raise Exception.Create('AClass not Assigned');

  ASql := '';

  AContext := TRttiContext.Create;

  AListFieldNames := TStringList.Create;
  AListKeyFieldName := TStringList.Create;

  try
    AType := AContext.GetType(AClass);

    isSet := False;
    for ACustomAttribute in AType.GetAttributes do
      if ACustomAttribute is THwDBTableName then
      begin
        ATableName := THwDBTableName(ACustomAttribute).TableName;
        isSet := True;
      end;
    if not isSet then
      ATableName := AType.ToString;

    for I := Low(AFieldNames) to High(AFieldNames) do
      AFieldNames[I] := AFieldNames[I].ToUpper;
    for I := Low(AFieldsMatching) to High(AFieldsMatching) do
      AFieldsMatching[I] := AFieldsMatching[I].ToUpper;

    for AProperty in AType.getProperties do
    begin
      isSet := False;
      AFieldName := '';

      for ACustomAttribute in AProperty.GetAttributes do
        if ACustomAttribute is THwDBFieldNotIn then
          isSet := True;

      if not isSet then
      begin
        for ACustomAttribute in AProperty.GetAttributes do
          if (ACustomAttribute is THwDBField) then
          begin
            ADbField   := THwDBField(ACustomAttribute);
            AFieldName := ADbField.Name;
            if (MatchStr(AFieldName.ToUpper, AFieldNames)) or (High(AFieldNames) <= -1) then
              if not (MatchStr(AFieldName, AListFieldNames.ToStringArray)) then
                AListFieldNames.Add(AFieldName);

            if (MatchStr(AFieldName.ToUpper, AFieldsMatching)) or // ou parametros
              ((High(AFieldsMatching) <= -1) and (ADbField.isKey)) then // ou chave
              if not (MatchStr(AFieldName, AListKeyFieldName.ToStringArray)) then
                AListKeyFieldName.Add(AFieldName);
            isSet := True;
          end;
        if not isSet then
        begin
          AFieldName := AProperty.Name;
          if (MatchStr(AFieldName.ToUpper, AFieldNames)) or (High(AFieldNames) <= -1) then
            if not (MatchStr(AFieldName, AListFieldNames.ToStringArray)) then
              AListFieldNames.Add(AFieldName);
        end;
      end;
    end;

    case AAction of
      hwrtacUpdate:
        begin
          ASql := 'UPDATE ' + ATableName + ' set ';
          for AFieldName in AListFieldNames do
            ASql := ASql + AFieldName + ' = :' + AFieldName + ',';

          Delete(ASql, Length(ASql), 1);
          ASql := ASql + ' WHERE ';

          for AFieldName in AListKeyFieldName do
            ASql := ASql + AFieldName + ' = :' + AFieldName + ' AND ';

          Delete(ASql, Length(ASql) - 4, 4);
        end;

      hwrtacInsert:
        begin
          ASql := 'INSERT INTO ' + ATableName + ' (';
          for AFieldName in AListFieldNames do
            ASql := ASql + AFieldName + ',';

          Delete(ASql, Length(ASql), 1);
          ASql := ASql + ') VALUES (';

          for AFieldName in AListFieldNames do
            ASql := ASql + ':' + AFieldName + ',';

          Delete(ASql, Length(ASql), 1);
          ASql := ASql + ')';
        end;

      hwrtacUpdateOrInsert:
        begin
          ASql := 'UPDATE OR INSERT INTO ' + ATableName + ' (';
          for AFieldName in AListFieldNames do
            ASql := ASql + AFieldName + ',';

          Delete(ASql, Length(ASql), 1);
          ASql := ASql + ') VALUES (';

          for AFieldName in AListFieldNames do
            ASql := ASql + ':' + AFieldName + ',';

          Delete(ASql, Length(ASql), 1);
          ASql := ASql + ') MATCHING (';

          for AFieldName in AListKeyFieldName do
            ASql := ASql + AFieldName + ',';

          Delete(ASql, Length(ASql), 1);
          ASql := ASql + ')';
        end;

      hwrtacSelect:
        begin
          ASql := 'SELECT ';
          for AFieldName in AListFieldNames do
            ASql := ASql + AFieldName + ',';

          Delete(ASql, Length(ASql), 1);
          ASql := ASql + ' FROM ' + ATableName;

          if AListKeyFieldName.Count > 0 then
          begin

            ASql := ASql + ' WHERE ';

            for AFieldName in AListKeyFieldName do
              ASql := ASql + AFieldName + ' = :' + AFieldName + ' AND ';

            Delete(ASql, Length(ASql) - 4, 4);
          end;
        end;
    end;

  finally
    result := ASql;
    AContext.Free;
    AListFieldNames.Free;
    AListKeyFieldName.Free;
  end;
end;


class function THwRttiConverter.ClassToSqlInsert(AClass: TClass; AFieldNames: array of string): string;
begin
  Result := THwRttiConverter.ClassToSql(AClass, hwrtacInsert, AFieldNames, []);
end;

class function THwRttiConverter.ClassToSqlSelect(AClass: TClass; AFieldNames, AFieldsInWhere: array of string): string;
begin
  Result := THwRttiConverter.ClassToSql(AClass, hwrtacSelect, AFieldNames, AFieldsInWhere);
end;

class function THwRttiConverter.ClassToSqlUpdate(AClass: TClass; AFieldsUpdate,
  AFieldsMatching: array of string): string;
begin
  Result := THwRttiConverter.ClassToSql(AClass, hwrtacUpdate, AFieldsUpdate, AFieldsMatching);
end;

class function THwRttiConverter.ClassToSqlUpdateOrInsert(AClass: TClass;
  AFieldsMatching: array of string): string;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;
  ASql, ATableName, AFieldName: string;
  AListFieldNames, AListKeyFieldName: TStrings;
  isSet: Boolean;
  I: Integer;
  ADbField: THwDBField;
begin

  if not Assigned(AClass) then
    raise Exception.Create('AClass not Assigned');

  ASql := '';

  AContext := TRttiContext.Create;

  AListFieldNames := TStringList.Create;
  AListKeyFieldName := TStringList.Create;

  try
    AType := AContext.GetType(AClass);

    isSet := False;
    for ACustomAttribute in AType.GetAttributes do
      if ACustomAttribute is THwDBTableName then
      begin
        ATableName := THwDBTableName(ACustomAttribute).TableName;
        isSet := True;
      end;
    if not isSet then
      ATableName := AType.ToString;

    for I := Low(AFieldsMatching) to High(AFieldsMatching) do
      AFieldsMatching[I] := AFieldsMatching[I].ToUpper;

    for AProperty in AType.getProperties do
    begin
      isSet := False;
      AFieldName := '';

      for ACustomAttribute in AProperty.GetAttributes do
        if ACustomAttribute is THwDBFieldNotIn then
          isSet := True;

      if not isSet then
      begin
        for ACustomAttribute in AProperty.GetAttributes do
          if (ACustomAttribute is THwDBField) then
          begin
            ADbField   := THwDBField(ACustomAttribute);
            AFieldName := ADbField.Name;
            if not (MatchStr(AFieldName, AListFieldNames.ToStringArray)) then
              AListFieldNames.Add(AFieldName);

            if (MatchStr(AFieldName.ToUpper, AFieldsMatching)) or // ou parametros
              ((High(AFieldsMatching) <= -1) and (ADbField.isKey)) then // ou chave
              if not (MatchStr(AFieldName, AListKeyFieldName.ToStringArray)) then
                AListKeyFieldName.Add(AFieldName);

            isSet := True;
          end;
        if not isSet then
        begin
          AFieldName := AProperty.Name;
          AListFieldNames.Add(AFieldName);
        end;
      end;
    end;

    ASql := 'UPDATE OR INSERT INTO ' + ATableName + ' (';
    for AFieldName in AListFieldNames do
      ASql := ASql + AFieldName + ',';

    Delete(ASql, Length(ASql), 1);
    ASql := ASql + ') VALUES (';

    for AFieldName in AListFieldNames do
      ASql := ASql + ':' + AFieldName + ',';

    Delete(ASql, Length(ASql), 1);
    ASql := ASql + ') MATCHING (';

    for AFieldName in AListKeyFieldName do
      ASql := ASql + AFieldName + ',';

    Delete(ASql, Length(ASql), 1);
    ASql := ASql + ')';

  finally
    result := ASql;
    AContext.Free;
    AListFieldNames.Free;
    AListKeyFieldName.Free;
  end;
end;

class function THwRttiConverter.ObjectType(Ctx: TRttiContext; TypeName: string)
  : TRttiType;
begin
  // type name is qualified at this point (UnitName.TypeName)
  result := Ctx.FindType(TypeName);
end;

class procedure THwRttiConverter.SetObjectToDataSetParams(AObject: TObject;
  AParams: TParams);
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;
  AParam: TParam;
  AParamName: string;
  isSet: Boolean;
  ASize: Integer;
begin
  if not Assigned(AParams) then
    raise Exception.Create('AParams not Assigned');

  try
    AContext := TRttiContext.Create;
    AType := AContext.GetType(AObject.ClassType);

    for AProperty in AType.getProperties do
    begin
      isSet := False;
      AParamName := AProperty.Name;
      for ACustomAttribute in AProperty.GetAttributes do
        if ACustomAttribute is THwDBField then
          AParamName := THwDBField(ACustomAttribute).Name;

      AParam := AParams.FindParam(AParamName);
      if Assigned(AParam) then
      begin
        if MatchStr(AProperty.PropertyType.Name, ['Integer', 'SmallInt', 'Int64']) then
          AParam.AsInteger := AProperty.GetValue(AObject).AsInt64
        else if MatchStr(AProperty.PropertyType.Name, ['Double', 'Currency', 'Real']) then
          AParam.AsFloat := AProperty.GetValue(AObject).AsExtended
        else if MatchStr(AProperty.PropertyType.Name, ['string']) then
        begin
          ASize := 0;
          for ACustomAttribute in AProperty.GetAttributes do
            if ACustomAttribute is THwConvertDateTimeFormat then
            begin
              AParam.AsDateTime := THwConvertDateTimeFormat(ACustomAttribute)
                .ConvertStrToDateTime(AProperty.GetValue(AObject).ToString);
              isSet := True;
            end
            else if ACustomAttribute is THwDBField then
              ASize := THwDBField(ACustomAttribute).Size;
          if not isSet then
            AParam.AsString := AProperty.GetValue(AObject).ToString;
          if ASize > 0 then
            AParam.AsString := Copy(AParam.AsString, 1, ASize);
        end
        else if MatchStr(AProperty.PropertyType.Name, ['TDateTime', 'TDate', 'TTime']) then
        begin
          for ACustomAttribute in AProperty.GetAttributes do
            if ACustomAttribute is THwConvertDateTimeFormat then
            begin
              AParam.AsString := THwConvertDateTimeFormat(ACustomAttribute)
                .ConvertDateTimeToStr(AProperty.GetValue(AObject).AsExtended);
              isSet := True;
            end;

          if not isSet then
          begin
            if MatchStr(AProperty.PropertyType.Name, ['TDateTime']) then
              AParam.AsDateTime := StrToDateTime(AProperty.GetValue(AObject).ToString)
            else if MatchStr(AProperty.PropertyType.Name, ['TDate']) then
              AParam.AsDateTime := StrToDate(AProperty.GetValue(AObject).ToString)
            else if MatchStr(AProperty.PropertyType.Name, ['TTime']) then
              AParam.AsTime := StrToTime(AProperty.GetValue(AObject).ToString);
          end;
        end;
      end;
    end;
  finally
    AContext.Free;
  end;
end;

class procedure THwRttiConverter.SetPropertiesFields(AClass: TClass; ADataSet: TDataSet);
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;

  ADbField: THwDBField;
  AField: TField;

  isSet: Boolean;
begin

  if not Assigned(AClass) then
    raise Exception.Create('AClass not Assigned');

  if not Assigned(ADataSet) then
    raise Exception.Create('ADataSet not Assigned');


  AContext := TRttiContext.Create;

  try
    AType := AContext.GetType(AClass);

    for AProperty in AType.getProperties do
    begin
      isSet := False;

      for ACustomAttribute in AProperty.GetAttributes do
        if ACustomAttribute is THwDBFieldNotIn then
          isSet := True;

      if not isSet then
      begin
        for ACustomAttribute in AProperty.GetAttributes do
          if (ACustomAttribute is THwDBField) then
          begin
            ADbField         := THwDBField(ACustomAttribute);
            ADbField.Name    := IfThen(ADbField.Name  <> '', ADbField.Name, AProperty.Name);
            ADbField.Display := IfThen(ADbField.Display  <> '', ADbField.Display, AProperty.Name);
            AField           := ADataSet.FindField(ADbField.Name);
            if AField <> nil then
            begin
              AField.DisplayLabel := ADbField.Display;
              if AField.DataType in [ftFloat, ftCurrency] then
                TFloatField(AField).DisplayFormat := ADbField.Mask
              else if AField.DataType in [ftString, ftDateTime, ftDate, ftTime, ftWideString] then
                ADataSet.FieldByName(ADbField.Name).EditMask := ADbField.Mask
              else if AField.DataType in [ftInteger] then
                TIntegerField(AField).EditFormat := ADbField.Mask;
            end;
          end;
      end;
    end;

  finally
    AContext.Free;
  end;
end;

{ THwConvertDateTimeFormat }

function THwConvertDateTimeFormat.ConvertDateTimeToStr
  (Value: TDateTime): string;
{
var
  TimeZone: TTimeZoneInformation;
}
begin
  Result := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(Value, FDateTimeFormat);
  {
  if FDateTimeFormat.LowerCase(FDateTimeFormat) = 'mongo' then
  begin
    GetTimeZoneInformation(TimeZone);
    result := FormatDateTime('YYYY"-"MM"-"DD"T"hh":"mm":"ss' + FormatFloat('00',
      TimeZone.Bias div -60) + ':00', Value);
  end
  // colocar outros formatos aqui se necessario assim como feito com o mongo
  else
    result := FormatDateTime(FDateTimeFormat, Value);
  }
end;

function THwConvertDateTimeFormat.ConvertStrToDateTime(Value: string)
  : TDateTime;
{
var
  AFormatSettings: TFormatSettings;
  ADateTimeFormat: string;
  ADate, ADay, AMonth, AYear, AHour, AMinutes, ASeconds: string;
  AChar, ACharValue: Char;
  isSet: Boolean;
  I: Integer;
  }
begin
  Result := THwConvertDateTimeFormatUtils.ConvertStrToDateTime(Value, FDateTimeFormat);
  {
  isSet := False;
  if FDateTimeFormat.LowerCase(FDateTimeFormat) = 'mongo' then
  begin
    AFormatSettings.DateSeparator := '-';
    AFormatSettings.TimeSeparator := ':';
    AFormatSettings.ShortDateFormat := 'YYYY-MM-DD';
    AFormatSettings.ShortTimeFormat := 'hh:nn:ss';

    ADate := Copy(Value, 1, 19);
    ADate := StringReplace(ADate, 'T', ' ', []);
    result := StrToDateTime(ADate, AFormatSettings);
    isSet := True;
  end;
  // colocar os outros formatos aqui se necessario, igual feito com o mongo
  if not isSet then
  begin
    ADate := Value;
    ADateTimeFormat := FDateTimeFormat.ToUpper;

    for I := 1 to Length(ADateTimeFormat) do
    begin
      AChar := ADateTimeFormat[I];
      ACharValue := ADate[I];

      if AChar = 'D' then
        ADay := ADay + ACharValue
      else if AChar = 'M' then
        AMonth := AMonth + ACharValue
      else if AChar = 'Y' then
        AYear := AYear + ACharValue
      else if AChar = 'H' then
        AHour := AHour + ACharValue
      else if AChar = 'N' then
        AMinutes := AMinutes + ACharValue
      else if AChar = 'S' then
        ASeconds := ASeconds + ACharValue;
    end;
    result := EncodeDate(StrToIntDef(AYear, 0), StrToIntDef(AMonth, 0),
      StrToIntDef(ADay, 0)) + EncodeTime(StrToIntDef(AHour, 0),
      StrToIntDef(AMinutes, 0), StrToIntDef(ASeconds, 0), 0);
  end;     }
end;

constructor THwConvertDateTimeFormat.Create(const ADateTimeFormat: string);
begin
  FDateTimeFormat := ADateTimeFormat;
end;

{ THwDBTableName }

constructor THwDBTableName.Create(const ATableName: string);
begin
  FTableName := ATableName;
end;

{ THwDBField }

constructor THwDBField.Create(const AName: string; ADisplay: string; AisKey: Boolean; ASize: Integer; AMask: string);
begin
  FName := AName;
  FDisplay := ADisplay;
  FisKey := AisKey;
  FSize := ASize;
  FMask := AMask;
end;

constructor THwDBField.Create(const AName: string; ADisplay: string; ASize: Integer);
begin
  FName := AName;
  FDisplay := ADisplay;
  FisKey := False;
  FSize := ASize;
  FMask := '';
end;

constructor THwDBField.Create(const AName: string; ASize: Integer);
begin
  FName := AName;
  FDisplay := '';
  FisKey := False;
  FSize := ASize;
  FMask := '';
end;

class function THwDBField.GetFieldTypeByStr(AValue: string): TFieldType;
begin
  if AValue.ToLower = 'string' then
    Result := ftString
  else if MatchStr(AValue, ['Integer', 'SmallInt', 'Int64']) then
    Result := ftInteger
  else if MatchStr(AValue, ['Currency']) then
    Result := ftCurrency
  else if MatchStr(AValue, ['Double', 'Real']) then
    Result := ftFloat
  else if MatchStr(AValue, ['TDateTime', 'TDate', 'TTime']) then
    Result := ftDateTime
  else if MatchStr(AValue, ['TDate']) then
    Result := ftDate
  else if MatchStr(AValue, ['TTime']) then
    Result := ftTime
  else if MatchStr(AValue, ['TStrings']) then
    Result := ftMemo
  else
    Result := ftUnknown;
end;

{ THwConvertDateTimeFormatUtils }

class function THwConvertDateTimeFormatUtils.ConvertDateTime(Value, AFormatIn, AFormatOut: string): string;
var
  ADateTime: TDateTime;
begin
  ADateTime := ConvertStrToDateTime(Value, AFormatIn);

  Exit(ConvertDateTimeToStr(ADateTime, AFormatOut));
end;

class function THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(Value: TDateTime;
  AFormat: string): string;
var
  TimeZone: TTimeZoneInformation;
begin
  if AFormat.LowerCase(AFormat) = 'mongo' then
  begin
    GetTimeZoneInformation(TimeZone);
    //SetTimeZoneInformation()
    result := FormatDateTime('YYYY"-"MM"-"DD"T"hh":"mm":"ss' {FormatFloat('00',
      TimeZone.Bias div -60) + ':00'}, Value);
  end
  // colocar outros formatos aqui se necessario assim como feito com o mongo
  else
    result := FormatDateTime(AFormat, Value);
end;

class function THwConvertDateTimeFormatUtils.ConvertStrToDateTime(Value: string;
  AFormat: string): TDateTime;
var
  AFormatSettings: TFormatSettings;
  ADateTimeFormat: string;
  ADate, ADay, AMonth, AYear, AHour, AMinutes, ASeconds: string;
  AChar, ACharValue: Char;
  I: Integer;
begin
  if AFormat.LowerCase(AFormat) = 'mongo' then
  begin
    AFormatSettings.DateSeparator := '-';
    AFormatSettings.TimeSeparator := ':';
    AFormatSettings.ShortDateFormat := 'YYYY-MM-DD';
    AFormatSettings.ShortTimeFormat := 'hh:nn:ss';

    ADate := Copy(Value, 1, 19);
    ADate := StringReplace(ADate, 'T', ' ', []);
    Result := StrToDateTime(ADate, AFormatSettings);
  end
  else
  begin
    ADate := Value;
    ADateTimeFormat := AFormat.ToUpper;

    for I := 1 to Length(ADateTimeFormat) do
    begin
      AChar := ADateTimeFormat[I];
      ACharValue := ADate[I];

      if AChar = 'D' then
        ADay := ADay + ACharValue
      else if AChar = 'M' then
        AMonth := AMonth + ACharValue
      else if AChar = 'Y' then
        AYear := AYear + ACharValue
      else if AChar = 'H' then
        AHour := AHour + ACharValue
      else if AChar = 'N' then
        AMinutes := AMinutes + ACharValue
      else if AChar = 'S' then
        ASeconds := ASeconds + ACharValue;
    end;
    result := EncodeDate(StrToIntDef(AYear, 0), StrToIntDef(AMonth, 0),
      StrToIntDef(ADay, 0)) + EncodeTime(StrToIntDef(AHour, 0),
      StrToIntDef(AMinutes, 0), StrToIntDef(ASeconds, 0), 0);
  end;
end;

{ THwJsonSerializer }

constructor THwJsonSerializer.Create(const ANotNull: Boolean; const ADefaultValue, AName: string);
begin
  FNotNull:= ANotNull;
  FDefaultValue := ADefaultValue;
  if AName.Trim <> '' then
    FName := AName.Trim;
  FIsNumber := False;
end;

{ HWDBField }

constructor HWDBField.Create(const FieldName: string);
begin
  FName := FieldName;
end;

end.
