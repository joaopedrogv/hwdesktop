unit HW.Json;

interface

uses
  System.JSON,
  REST.Json;

type
  TJsonHw = class
  strict protected
    class function HandleFirstAtributesName(AObject: TObject; jsonObject: TJSONObject; AOptions: TJsonOptions): TJSONObject;
    class function PrepareJsonObject(jsonObject: TJSONObject): TJSONObject;
  public
    class function ToJsonObject(AObject: TObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TJSONObject; overload;
    class function ToJsonString(AObject: TObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): string;

    class function ToArrayObject<T: class, constructor>(AJson: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TArray<T>; overload;
    class function ToArrayObject<T: class, constructor>(json, attName: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TArray<T>; overload;
    class function ToArrayJson<T: class>(AObjectArray: TArray<T>; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): string;
    class function ToArrayString(json: string): TArray<string>;

    class function ArrayObjectToJsonObject(AClass: TClass; AJson: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TJSONArray;
    class function ObjectToJsonObject(AClass: TClass; AJson: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TJSOnObject; overload;
    class function ObjectToJsonObject<T: class, constructor>(AJson: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TJSOnObject; overload;

    class function ToObject<T: class, constructor>(AJson: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): T; overload;
    class function ToObject<T: class, constructor>(AObject: TJSOnObject; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): T; overload;

    class function GetJSONArray(jsonaArr: TJSONArray; tree: array of string): TJSONObject;
    class function GetJSONValue(jsonObj: TJSONObject; tree: array of string): TJSONObject;

    class function ToString(pArray: array of string; pQuoteString: boolean = False): string;
  end;

  LocalToUtcJson = class(TCustomAttribute)
  end;

  HandleUtc = class(TCustomAttribute)
  end;

//var log: string;

implementation

uses
  System.Rtti,
  System.DateUtils,
  System.SysUtils,
  System.StrUtils,
  System.TypInfo,
  System.Classes;

{ TJsonHw }

class function TJsonHw.ArrayObjectToJsonObject(AClass: TClass; AJson: string; AOptions: TJsonOptions): TJSONArray;
var
  arrayJson: TJSONArray;
  valueJson: TJSONValue;
begin
  if AJson.ToLower.Trim.Equals('null') then
    Exit(nil);

  arrayJson := TJSONObject.ParseJSONValue( TEncoding.UTF8.GetBytes(AJson), 0) as TJSONArray;

  if arrayJson = nil then
    Exit(nil);

  Result := TJSONArray.Create;

  for valueJson in arrayJson do
    Result.AddElement(ObjectToJsonObject(AClass, valueJson.ToJSON, AOptions) as TJSONValue);

//  log := Result.ToJSON;
end;

class function TJsonHw.GetJSONArray(jsonaArr: TJSONArray;
  tree: array of string): TJSONObject;
var
  jsonValue: TJSONValue;
  pair     : TJSONPair;
  context  : TRttiContext;
  typep    : TRttiType;
  propertyp: TRttiProperty;
  arrayJ   : TJSONArray;
  I, J, K  : Integer;
//  jsonObj  : TJSONObject;
  pairCopy : TJSONPair;
  node     : string;
  newArray : array of string;
  valJson  : TJSONValue;
begin


  if jsonaArr.Count = 0 then
    Exit(nil);


  for I := Low(tree) to High(tree) do
  begin
    node     := tree[I];
//                                for var jsonValues in jsonaArr do
//                                  jso
    for jsonValue in jsonaArr do
      if not (jsonValue is TJSONObject) then
        Exit(nil)
      else
      for pair in jsonValue as TJSONObject do
        if pair.JsonString.Value.ToLower().Trim.Equals(node.Trim.ToLower) then
        begin
          newArray := [];
          for J := I + 1 to Length(tree) - 1 do
            newArray := newArray + [tree[J]];

          if I = High(tree) then
            Exit(pair.JsonValue as TJSONObject)
          else if pair.JsonValue is TJSONObject then
            Exit(TJsonHw.GetJSONValue(pair.JsonValue as TJSONObject, newArray))
          else if pair.JsonValue is TJSONArray then
          begin

            arrayJ := TJSONArray.Create();

            for valJson in pair.JsonValue as TJSONArray do
              arrayJ.AddElement(TJsonHw.GetJSONValue(valJson as TJSONObject, newArray));

            Exit(TJsonHw.GetJSONArray(arrayJ, newArray))
          end
          else
            Exit(pair.JsonValue as TJSONObject);

          break;
        end;
    end;

  Result := nil;
end;

class function TJsonHw.GetJSONValue(jsonObj: TJSONObject;
  tree: array of string): TJSONObject;
var
  pair     : TJSONPair;
  context  : TRttiContext;
  typep    : TRttiType;
  propertyp: TRttiProperty;
  arrayJ   : TJSONArray;
  I, J, K  : Integer;
//  jsonObj  : TJSONObject;
  pairCopy : TJSONPair;
  node     : string;
  newArray : array of string;
  valJson  : TJSONValue;
  resp: TJSONArray;
begin

//  Result := TJSONArray.Create;

  if jsonObj.Count = 0 then
    Exit(nil);

  //Result := TJSONObject.Create;

  for I := Low(tree) to High(tree) do
  begin
    node     := tree[I];

    for pair in jsonObj do
      if pair.JsonString.Value.ToLower().Trim.Equals(node.Trim.ToLower) then
      begin
        newArray := [];
        for J := I + 1 to Length(tree) - 1 do
          newArray := newArray + [tree[J]];

        if I = High(tree) then
          Exit(pair.JsonValue as TJSONObject)
        else if pair.JsonValue is TJSONObject then
          Exit(TJsonHw.GetJSONValue(pair.JsonValue as TJSONObject, newArray))
        else if pair.JsonValue is TJSONArray then
        begin

          arrayJ := TJSONArray.Create();

          for valJson in pair.JsonValue as TJSONArray do
            arrayJ.AddElement(TJsonHw.GetJSONValue(valJson as TJSONObject, newArray));

          Exit(TJsonHw.GetJSONArray(arrayJ, newArray))
        end
        else
          Exit(pair.JsonValue as TJSONObject);

        break;

      end;
  end;

  Result := jsonObj;
end;

class function TJsonHw.HandleFirstAtributesName(AObject: TObject;
  jsonObject: TJSONObject; AOptions: TJsonOptions): TJSONObject;
var
  pair     : TJSONPair;
  context  : TRttiContext;
  typep    : TRttiType;
  propertyp: TRttiProperty;
  arrayJ   : TJSONArray;
  I        : Integer;
  copyObj  : TJSONObject;
  pairCopy : TJSONPair;
begin
  if AObject = nil then
    Exit(nil);

  if jsonObject.Count = 0 then
    Exit(nil);

  copyObj := TJSONObject.Create;
  context := TRttiContext.Create;
  try

    typep := context.GetType(AObject.ClassType);

    for propertyp in typep.getProperties do
      for pair in jsonObject do
        if pair.JsonString.Value.ToLower().Trim.Equals(propertyp.Name.Trim.ToLower) then
        begin

          if pair.JsonValue is TJSONObject then
            pairCopy := TJSONPair
              .Create(pair.JsonString,
                      TJsonHw.HandleFirstAtributesName(propertyp.GetValue(AObject).AsObject, TJSONObject(pair.JsonValue), AOptions))
          else if pair.JsonValue is TJSONArray then
          begin
            arrayJ := TJSONArray.Create();

            for I := 0 to propertyp.GetValue(AObject).GetArrayLength - 1 do
              arrayJ.AddElement(TJsonHw.ToJsonObject(propertyp.GetValue(AObject).GetArrayElement(I).AsObject, AOptions) as TJSONValue);

            pairCopy := TJSONPair.Create(propertyp.Name.Trim, arrayJ);
          end
          else
            pairCopy := TJSONPair.Create(TJSONString.Create(propertyp.Name.Trim), pair.JsonValue);

          copyObj.AddPair(pairCopy);

          Break;
        end;

  finally
    context.Free;
  end;

  Result := copyObj;
end;

class function TJsonHw.ObjectToJsonObject(AClass: TClass; AJson: string; AOptions: TJsonOptions): TJSOnObject;
const
  nullValue = 'null';
var
  jsonObj  : TJSONObject;
  pair     : TJSONPair;
  context  : TRttiContext;
  typep    : TRttiType;
  typeprop : TRttiType;
  prop2    : TRttiProperty;
  propertyp: TRttiProperty;
  field    : TRttiField;
  dynarr   : TRttiDynamicArrayType;
  customAtt: TCustomAttribute;
  typeInfo : PTypeInfo;
  done     : Boolean;
  propfound: Boolean;
  datet    : TDateTime;
  string_  : string;
  arrayJson: TJSONArray;
  itemArray: TJSONValue;
  I        : Integer;
  classProp: TClass;
begin
  if (AJson.Trim = '') or (AJson.Trim.ToLower = 'null') then
    Exit(nil);

  jsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJson), 0) as TJSONObject;

  context := TRttiContext.Create;
  try

    typep := context.GetType(AClass);

    typep.QualifiedName;

    for pair in jsonObj do
    begin
      propfound := False;
      for propertyp in typep.getProperties do
        if propertyp.IsReadable then
          if pair.JsonString.ToString().ToLower().Trim.Equals('"' + propertyp.Name.Trim.ToLower + '"') then
          begin
            propfound := True;
            done := False;

            string_ := propertyp.PropertyType.QualifiedName;

            typeInfo := propertyp.PropertyType.Handle;

            {$REGION 'DateTime, Date and Time'}
            if (propertyp.PropertyType.TypeKind = tkFloat) and
               (((typeInfo = System.TypeInfo(TDate)) or (typeInfo = System.TypeInfo(TTime)) or (typeInfo = System.TypeInfo(TDateTime)))) then
            begin

              if (pair.JsonValue.Value.IsEmpty) or (pair.JsonValue.Value.Equals('null'))  then
              begin
                done := True;
                pair.JsonValue := TJSONString.Create();
              end;

              if not done then
                for customAtt in propertyp.GetAttributes do
                  if customAtt is LocalToUtcJson then
                  begin
                    string_ := pair.JsonValue.Value;

                    if joDateFormatISO8601 in AOptions then
                      datet := ISO8601ToDate(string_)
                    else if joDateFormatUnix in AOptions then
                      datet := UnixToDateTime(StrToIntDef(string_, 0))
                    else
                      datet := StrToDateTime(string_);

                    datet :=  TTimeZone.Local.ToLocalTime(datet);

                    if joDateFormatISO8601 in AOptions then
                      pair.JsonValue := TJSONString.Create(DateToISO8601(datet))
                    else if joDateFormatUnix in AOptions then
                      pair.JsonValue := TJSONString.Create(DateTimeToUnix(datet).ToString)
                    else
                      pair.JsonValue := TJSONString.Create(DateTimeToStr(datet));

                    //done := True;
                  end
                  else if customAtt is HandleUtc then
                  begin
                    string_ := pair.JsonValue.Value;

                    if joDateFormatISO8601 in AOptions then
                      datet := ISO8601ToDate(string_)
                    else if joDateFormatUnix in AOptions then
                      datet := UnixToDateTime(StrToIntDef(string_, 0))
                    else
                      datet := StrToDateTime(string_);

                    datet :=  TTimeZone.Local.ToLocalTime(datet);

                    if joDateFormatISO8601 in AOptions then
                      pair.JsonValue := TJSONString.Create(DateToISO8601(datet))
                    else if joDateFormatUnix in AOptions then
                      pair.JsonValue := TJSONString.Create(DateTimeToUnix(datet).ToString)
                    else
                      pair.JsonValue := TJSONString.Create(DateTimeToStr(datet));

                    //done := True;
                  end;
            end
            {$ENDREGION}

            {$REGION 'Boolean'}
            else if (propertyp.PropertyType.TypeKind = tkEnumeration) and (typeInfo = System.TypeInfo(System.Boolean)) then
            begin
              if pair.JsonValue is TJSONNull then
                pair.JsonValue := TJSONString.Create('False')
              else
                pair.JsonValue := TJSONString.Create(pair.JsonValue.Value
                                                                    .Replace('true', 'True', [rfIgnoreCase])
                                                                    .Replace('false', 'False', [rfIgnoreCase]));
            end
            {$ENDREGION}

            {$REGION 'Array dinamic'}
            else if typeInfo.Kind = tkDynArray then
            begin
              done := False;

              if pair.JsonValue.ToString.Equals(nullValue) then
              begin
                pair.JsonValue := TJSONArray.Create;
                done := True;
              end
              else if pair.JsonValue is TJSONArray then
              begin
                if TJSONArray(pair.JsonValue).Count <= 0 then
                begin
                  pair.JsonValue := TJSONArray.Create;
                  done := True;
                end
                else
                begin
                  for itemArray in TJSONArray(pair.JsonValue) do
                  begin
                    done := itemArray is TJSONString;
                    Break;
                  end;
                end;
              end;

              if not done then
              begin
                dynarr := TRttiDynamicArrayType(context.GetType(propertyp.PropertyType.Handle));

                classProp := dynarr.ElementType.AsInstance.MetaclassType;

                pair.JsonValue := TJsonHw.ArrayObjectToJsonObject(classProp, pair.JsonValue.ToJSON, AOptions) as TJSONArray;
              end;

            end
            {$ENDREGION}

            {$REGION 'Class'}
            else if typeInfo.Kind = tkClass then
            begin

              typeprop  := TRttiDynamicArrayType(context.GetType(propertyp.PropertyType.Handle));

              classProp := typeprop.AsInstance.MetaclassType;

              pair.JsonValue := TJsonHw.ObjectToJsonObject(classProp, pair.JsonValue.ToJSON, AOptions) as TJSONValue;
            end
            {$ENDREGION}

            {$REGION 'string'}
            else if typeInfo.Kind = tkUString then
            begin
              if pair.JsonValue is TJSONArray then
                pair.JsonValue := TJSONString.Create(pair.JsonValue.ToJSON)
              else if pair.JsonValue is TJSONNull then
                pair.JsonValue := TJSONString.Create();
            end;
            {$ENDREGION}

          end;

      if not propfound then
        if pair.JsonValue is TJSONNull then
          pair.JsonValue := TJSONString.Create();
    end;

  finally
    context.Free;
  end;

  Result := jsonObj;
end;

class function TJsonHw.ObjectToJsonObject<T>(AJson: string; AOptions: TJsonOptions): TJSOnObject;
begin
  if (AJson.Trim = '') or (AJson.Trim.ToLower = 'null') then
    Exit(nil);

  Result := ObjectToJsonObject(T, AJson, AOptions);
end;

class function TJsonHw.PrepareJsonObject(jsonObject: TJSONObject): TJSONObject;
const
  EmptyStrJson = '""';
var
  pair     : TJSONPair;
  pairCopy : TJSONPair;
  arrayJson: TJSONArray;
  itemArray: TJSONValue;
  done     : Boolean;
  copyObj  : TJSONObject;
begin
  if jsonObject = nil then
    Exit(nil);

  if jsonObject.Count = 0 then
    Exit(nil);

//  var fields := '';
//  var values := '';
//  var origFields := '';
//  var origValues := '';
//  var origType := '';

  copyObj := TJSONObject.Create;
  try

    for pair in jsonObject do
    begin
//      origFields := origFields + ' | ' + pair.JsonString.Value;
//      origValues := origValues + ' | ' + pair.JsonValue.ToString;
//      origType := origType + ' | ' + pair.JsonValue.ClassName;

      pairCopy := TJSONPair.Create();
      pairCopy.JsonString := pair.JsonString;

      if pair.JsonValue is TJSONObject then
        pairCopy.JsonValue := TJsonHw.PrepareJsonObject(TJSONObject(pair.JsonValue))
      else if pair.JsonValue is TJSONArray then
      begin
        done := False;

        arrayJson := TJSONArray.Create;

        for itemArray in TJSONArray(pair.JsonValue) do
          if itemArray is TJSONObject then
          begin
            arrayJson.AddElement(TJsonHw.PrepareJsonObject(itemArray as TJSONObject) as TJSONValue);
            done := True;
          end;

        if done then
          pairCopy.JsonValue := arrayJson
        else
          pairCopy.JsonValue := pair.JsonValue;

      end
      else if pair.JsonValue is TJSONString then
      begin
        if pair.JsonValue.ToString.Equals(EmptyStr) or pair.JsonValue.ToString.Equals(EmptyStrJson) then
          pairCopy.JsonValue := TJSONNull.Create
        else
          pairCopy.JsonValue := pair.JsonValue;
      end
      else if pair.JsonValue is TJSONBool then
        pairCopy.JsonValue := pair.JsonValue;


      if (not (pairCopy.JsonValue = nil)) then
      begin
//        fields := fields + ' | ' + pairCopy.JsonString.Value;
//        values := values + ' | ' + pairCopy.JsonValue.ToString;

        copyObj.AddPair(pairCopy);
      end;

    end;

  finally
    Result := copyObj;
  end;
end;

class function TJsonHw.ToArrayJson<T>(AObjectArray: TArray<T>; AOptions: TJsonOptions): string;
var
  jsonArray: string;
  objeto: T;
begin
   if Length(AObjectArray) = 0 then
    Exit('[]');

  jsonArray := '';
  for objeto in AObjectArray do
  begin
    jsonArray := jsonArray + ',' +
      TJsonHw.ToJsonString( objeto, AOptions);
  end;
  System.Delete(jsonArray, 1, 1);
  Result := '[' + jsonArray + ']';
end;

class function TJsonHw.ToArrayObject<T>(json, attName: string;
  AOptions: TJsonOptions): TArray<T>;
var
  O: TArray<T>;
begin

  Result := [];

  if MatchText(json.Trim, ['', 'null', '[]']) then
    Exit;

  var jsonObj := TJsonHw.PrepareJsonObject(TJsonHw.ObjectToJsonObject(T, json, AOptions));

  if jsonObj.Count = 0 then
    Exit;

  for var pair in jsonObj do
    if pair.JsonString.Value.ToLower().Trim.Equals('rows') then
    begin
      if pair.JsonValue is TJSONArray then
        Result := TJsonHw.ToArrayObject<T>(pair.JsonValue.ToJSON, AOptions)
      else if pair.JsonValue is TJSONObject then
      begin

        SetLength(O, 1);

        O[High(O)] := TJsonHw.ToObject<T>(pair.JsonValue as TJSONObject, AOptions);

        Result := O;
      end;
      Break;
    end;
end;

class function TJsonHw.ToString(pArray: array of string; pQuoteString: boolean = False): string;
var
  I: Integer;
begin
  Result := '[' + ']';
  if (Length(pArray) <= 0) then
    exit;

  Result := '[';
  for I := 0 to Length(pArray) - 1 do
    Result := Result + IfThen(I <> 0, ',') +
      IfThen(pQuoteString, '"') + trim(pArray[I]) + IfThen(pQuoteString, '"');

  Result := Result + ']';
end;

class function TJsonHw.ToArrayString(json: string): TArray<string>;
begin
  Result := [];

  if MatchText(json.Trim, ['', 'null', '[]']) then
    Exit;

  var arrayJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONArray;

  if arrayJson = nil then
    Exit;

  for var value in arrayJson do
    if (value is TJSONString) then
      Result := Result + [value.Value];
end;

class function TJsonHw.ToArrayObject<T>(AJson: string; AOptions: TJsonOptions): TArray<T>;
var
  arrayJson : TJSONArray;
  value     : TJSONValue;
  arrayValue: TArray<T>;
begin
  if AJson.ToLower.Trim.Equals('null') then
    Exit(nil);

  arrayJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJson), 0) as TJSONArray;

  if arrayJson = nil then
    Exit(nil);

  SetLength(arrayValue, 0);
  for value in arrayJson do
  begin
    SetLength(arrayValue, Length(arrayValue) + 1);

    if (value is TJSONObject) and
       (TJSONObject(value).Count = 1) and
       (TJSONObject(value).Pairs[0].JsonValue is TJSONObject) then
      arrayValue[Length(arrayValue) - 1] := TJsonHw.ToObject<T>(TJSONObject(value).Pairs[0].JsonValue as TJSONObject, AOptions) as T
    else
      arrayValue[Length(arrayValue) - 1] := TJsonHw.ToObject<T>(value as TJSONObject, AOptions) as T;
  end;

  Result := arrayValue;
end;

class function TJsonHw.ToJsonObject(AObject: TObject; AOptions: TJsonOptions): TJSONObject;
const
  nullValue = 'null';
var
  jsonObj  : TJSONObject;
  pair     : TJSONPair;
  context  : TRttiContext;
  typep    : TRttiType;
  propertyp: TRttiProperty;
  customAtt: TCustomAttribute;
  typeInfo : PTypeInfo;
  done     : Boolean;
  datet    : TDateTime;
  string_  : string;
  arrayJ   : TJSONArray;
  itemArray: TJSONValue;
  I        : Integer;
begin
  if AObject = nil then
    Exit(nil);

  jsonObj := TJson.ObjectToJsonObject(AObject, AOptions);

  if jsonObj.Count = 0 then
    Exit(nil);

  jsonObj := TJsonHw.HandleFirstAtributesName(AObject, jsonObj, AOptions);

  context := TRttiContext.Create;
  try

    typep := context.GetType(AObject.ClassType);

    for pair in jsonObj do
      for propertyp in typep.getProperties do
        if propertyp.IsReadable then
          if pair.JsonString.ToString().ToLower().Trim.Equals('"' + propertyp.Name.Trim.ToLower + '"') then
          begin
//            if not pair.JsonString.Value.Trim.Equals(propertyp.Name.Trim) then
//              pair.JsonString.Value := propertyp.Name.Trim;
//
//            if not pair.JsonString.ToString().Trim.Equals('"' + propertyp.Name.Trim + '"') then
//              pair.JsonString.Value := propertyp.Name.Trim;

            done := False;
            typeInfo := propertyp.GetValue(AObject).TypeInfo;

            {$REGION 'DateTime, Date and Time'}
            if (typeInfo.Kind = tkFloat) and
               (GetTypeData(typeInfo)^.FloatType = ftDouble) and
               (((typeInfo = System.TypeInfo(TDate)) or (typeInfo = System.TypeInfo(TTime)) or (typeInfo = System.TypeInfo(TDateTime)))) then
            begin

              //Data = 0, fica 1899-12-30, entao abaixo altera para "null"
              if propertyp.GetValue(AObject).AsType<TDateTime> = 0 then
              begin
                pair.JsonValue := TJSONNull.Create;
                done := True;
              end;

              if not done then
                for customAtt in propertyp.GetAttributes do
                  if customAtt is LocalToUtcJson then
                  begin
                    datet := TTimeZone.Local.ToUniversalTime(propertyp.GetValue(AObject).AsType<TDateTime>);
                    string_ := DateToISO8601(datet);

                    if joDateFormatISO8601 in AOptions then
                      pair.JsonValue := TJSONString.Create(DateToISO8601(datet))
                    else if joDateFormatUnix in AOptions then
                      pair.JsonValue := TJSONString.Create(DateTimeToUnix(datet).ToString)
                    else
                      pair.JsonValue := TJSONString.Create(DateTimeToStr(datet));

                    //done := True;
                  end
                  else if customAtt is HandleUtc then
                  begin
                   // add to utc
                    datet := propertyp.GetValue(AObject).AsType<TDateTime>;//;TTimeZone.Local.ToLocalTime(propertyp.GetValue(AObject).AsType<TDateTime>);

                    datet :=  TTimeZone.Local.ToUniversalTime(datet);

                    string_ := DateToISO8601(datet);

                    if joDateFormatISO8601 in AOptions then
                      pair.JsonValue := TJSONString.Create(DateToISO8601(datet))
                    else if joDateFormatUnix in AOptions then
                      pair.JsonValue := TJSONString.Create(DateTimeToUnix(datet).ToString)
                    else
                      pair.JsonValue := TJSONString.Create(DateTimeToStr(datet));

                    //done := True;
                  end;
            end
            {$ENDREGION}

            {$REGION 'Arrays of Object'}
            else if typeInfo.Kind = tkDynArray then
            begin
              if pair.JsonValue.ToString.Equals(nullValue) then
              begin
                pair.JsonValue := TJSONArray.Create;
                //done := True;
              end
              else if pair.JsonValue is TJSONArray then
              begin
                done := False;

                for itemArray in TJSONArray(pair.JsonValue) do
                begin
                  done := itemArray is TJSONString;
                  Break;
                end;

                if not done then
                begin
                  arrayJ := TJSONArray.Create;

                  for I := 0 to propertyp.GetValue(AObject).GetArrayLength - 1 do
                    arrayJ.AddElement(TJsonHw.ToJsonObject(propertyp.GetValue(AObject).GetArrayElement(I).AsObject, AOptions) as TJSONValue);

                  pair.JsonValue := arrayJ;
                end;

              end;
            end
            {$ENDREGION}

            {$REGION 'Class'}
            else if typeInfo.Kind = tkClass then
            begin

              pair.JsonValue := TJsonHw.ToJsonObject(propertyp.GetValue(AObject).AsObject, AOptions) as TJSONValue;

            end;
            {$ENDREGION}

          end;

  finally
    context.Free;
  end;

  Result := jsonObj;

end;

class function TJsonHw.ToJsonString(AObject: TObject; AOptions: TJsonOptions): string;
var
  jsonObject : TJSONObject;
begin
  if AObject = nil then
    Exit('');

  jsonObject := TJsonHw.ToJsonObject(AObject, AOptions);

  if jsonObject = nil then
    Exit('');

  Result := TJson.JsonEncode(jsonObject);
end;

class function TJsonHw.ToObject<T>(AObject: TJSOnObject;
  AOptions: TJsonOptions): T;
begin
  if (AObject = nil) then
    Exit(nil);

  AObject := TJsonHw.PrepareJsonObject(AObject);

  Result := TJson.JsonToObject<T>(AObject, AOptions);
end;

class function TJsonHw.ToObject<T>(AJson: string; AOptions: TJsonOptions): T;
var
  jsonObj  : TJSONObject;
begin
  if (AJson.Trim = '') or (AJson.Trim.ToLower = 'null') then
    Exit(nil);

  jsonObj := TJsonHw.PrepareJsonObject(TJsonHw.ObjectToJsonObject(T, AJson, AOptions));

  if jsonObj = nil then
    Exit;

  Result := TJson.JsonToObject<T>(jsonObj, AOptions);
end;

end.
