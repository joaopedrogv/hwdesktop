unit hw.utils.dx.teste.Unit4;

interface

uses TypInfo, Datasnap.DBClient, System.Rtti, Data.DB;

type
  LoggableAttribute = class(TCustomAttribute)
  private
    FDescription: String;
  public
    constructor Create(Description: String);
    property Description: String read FDescription;
  end;

  TProduct = Class(TObject)
  private
    FPrice: Double;
    FIsDirty: Boolean;
    FDescription: String;
    FMarca: string;
    FValueTime: TTime;
    FValueReal: Real;
    FValueString2: String;
    FValueDateTime: TDateTime;
    FValueString: string;
    FValueCurrency: Currency;
    FValueInteger: Integer;
    FValueDate: TDate;
    FValueReal48: Real48;
    FValueDouble: Double;
    procedure SetDescription(const Value: String);
    procedure SetPrice(const Value: Double);
    procedure SetMarca(const Value: string);
    procedure SetValueCurrency(const Value: Currency);
    procedure SetValueDate(const Value: TDate);
    procedure SetValueDateTime(const Value: TDateTime);
    procedure SetValueDouble(const Value: Double);
    procedure SetValueInteger(const Value: Integer);
    procedure SetValueReal(const Value: Real);
    procedure SetValueReal48(const Value: Real48);
    procedure SetValueString(const Value: string);
    procedure SetValueString2(const Value: String);
    procedure SetValueTime(const Value: TTime);
  public
    [LoggableAttribute('Product Price')]
    property Price: Double read FPrice write SetPrice;
    [Loggable('Product Description')] { the `Attribute` part is optional }
    property Description: String read FDescription write SetDescription;
    property Marca: string read FMarca write SetMarca;
    property IsDirty: Boolean read FIsDirty;
    property ValueString: string read FValueString write SetValueString;
    property ValueString2: String read FValueString2 write SetValueString2;
    property ValueInteger: Integer read FValueInteger write SetValueInteger;
    property ValueDouble: Double read FValueDouble write SetValueDouble;
    property ValueCurrency: Currency read FValueCurrency write SetValueCurrency;
    property ValueReal: Real read FValueReal write SetValueReal;
    property ValueReal48: Real48 read FValueReal48 write SetValueReal48;
    property ValueDate: TDate read FValueDate write SetValueDate;
    property ValueTime: TTime read FValueTime write SetValueTime;
    property ValueDateTime: TDateTime read FValueDateTime
      write SetValueDateTime;
  End;

  TProductArray = array of TProduct;

  TContentProdutos = class(TObject)
  private
    FProdutos: TProductArray;
  public
    property Produtos: TProductArray read FProdutos write FProdutos;
  end;

  TDisplayLabelAttribute = class(TCustomAttribute)
  private
    FText: string;
  public
    constructor Create(const aText: string);
    property Text: string read FText write FText;
  end;

  TRTTIHWCreator = class
  private
    FRTTICtx: TRttiContext;
    class function ObjectType(Ctx: TRttiContext; TypeName: string): TRttiType;
  public
    function CreateObject(AClass: TClass; AObject: TObject = nil): TObject;
    class function ObjectInstance(Ctx: TRttiContext; TypeName: string): TObject;
  end;

  TArtifactInspector = class
  private
    datasett: TDataSet;
  public
    class function DisplayLabelFor(aClass: TClass): string;
    class function LogChangesForDebug(AObject: TObject): string;
    class function LogChangesForDebugLine(AObject: TObject): string;
    class function LogChanges(LoggableClass: TObject): string;
    class function LogChangesClass(LoggableClass: TClass): string;
    class function RetornaObjetoCriado(aClass: TClass; Descricao, Marca: string; preco: Double): TObject;
    class function RetornaObjetoCriado1(aClass: TClass; Descricao, Marca: string; preco: Double): TObject;
    class function RetornaObjetoCriado2<T: class, constructor>(Descricao, Marca: string; preco: Double): T;
    class function RetornaObjetoCriadoArray<T: class, constructor>(Descricao, Marca: string; preco: Double): T;
  end;

  TUtilRTTI = class
  public
    procedure defineDataSet(var Value: TClientDataSet);
  end;

implementation

uses
  System.Classes, System.SysUtils, System.StrUtils;

{ TUtilRTTI }

procedure TUtilRTTI.defineDataSet(var Value: TClientDataSet);
begin

end;

{ TArtifactInspector }

class function TArtifactInspector.DisplayLabelFor(aClass: TClass): string;
var
  rttiContext: TRttiContext;
  rttiType: TRttiType;
  attribute: TCustomAttribute;
begin
  rttiContext := TRttiContext.Create;
  try
    rttiType := rttiContext.GetType(aClass);
    for attribute in rttiType.GetAttributes do
      // if attribute is TDisplayLabelAttribute then
      Exit(TDisplayLabelAttribute(attribute).Text);
    Result := '';
  finally
    rttiContext.Free;
  end; // try to recover and return the DisplayLabel

end;

class function TArtifactInspector.LogChanges(LoggableClass: TObject): string;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustoAttribute: TCustomAttribute;
  AValue: TValue;
  List: tstrings;
begin
  AContext := TRttiContext.Create;
  List := TStringList.Create;
  try
    AType := AContext.GetType(LoggableClass.ClassType);

    List.Add('');
    List.Add(AType.ToString);
    List.Add('');

    List.Add('Property: ' + IntToStr(High(AType.getProperties)));
    List.Add('Atributes: ' + IntToStr(High(AType.GetAttributes)));
    List.Add('');
    for AProperty in AType.getProperties do
    begin
      if High(AType.GetAttributes) = -1 then
      begin
        AValue := AProperty.GetValue(LoggableClass);
        List.Add('Name: ' + AProperty.Name);
        List.Add('Tipo: ' + AProperty.PropertyType.ToString);
        List.Add('Value: ' + AValue.ToString);
        List.Add('');
      end
      else
      begin
        for ACustoAttribute in AProperty.GetAttributes do
        begin
          if ACustoAttribute is LoggableAttribute then
          begin

            AValue := AProperty.GetValue(LoggableClass);
            // log to db..
            List.Add('Name: ' + AProperty.Name);
            List.Add('Personalizado: ' + LoggableAttribute(ACustoAttribute).Description);
            List.Add('Value: ' + AValue.ToString);
            List.Add('');
          end
          else
          begin
            AValue := AProperty.GetValue(LoggableClass);

            // log to db..
            List.Add('Name: ' + AProperty.Name);
            List.Add('Personalizado: ' + AProperty.ClassName);
            List.Add('Value: ' + AValue.ToString);
            List.Add('');
          end;
        end;
      end;
    end;
  finally
    Result := List.Text;
    List.Free;
    AContext.Free;
  end;

end;

class function TArtifactInspector.LogChangesClass(LoggableClass: TClass): string;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustoAttribute: TCustomAttribute;
  AValue: TValue;

  AContext2: TRttiContext;
  AType2: TRttiType;
  AProperty2: TRttiProperty;
  ACustoAttribute2: TCustomAttribute;
  AValue2: TValue;

  List: tstrings;
begin
  AContext := TRttiContext.Create;
  List := TStringList.Create;
  try
    AType := AContext.GetType(LoggableClass);

    List.Add('');
    List.Add(AType.ToString);
    List.Add('');

    List.Add('Property: ' + IntToStr(High(AType.getProperties)));
    List.Add('Atributes: ' + IntToStr(High(AType.GetAttributes)));
    List.Add('');
    for AProperty in AType.getProperties do
    begin
      if High(AType.GetAttributes) = -1 then
      begin
//        if AProperty.IsReadable then

//          AValue := AProperty.GetValue(LoggableClass);
        List.Add('Name: ' + AProperty.Name);
        List.Add('Tipo: ' + AProperty.PropertyType.ToString);
        List.Add('Value: ' + AValue.ToString);
        List.Add('');

        List.Add('asdasd : ' + AProperty.PropertyType.ClassType.ClassName);
        //AContext2 := trtt.ClassType
//        List.Add(LogChangesClass(AProperty.PropertyType.ClassType));
        //if AProperty.PropertyType.IsPublicType is TArrayField then
          //List.Add('yes') else List.Add('no');

        if AProperty.PropertyType.ClassType = TRttiDynamicArrayType then
        begin
          //AObject := rttiCreator.CreateObject(T) as T;
//          AValue := AProperty.GetValue(AProperty.PropertyType);
          //AContext2 := TRttiContext.Create;
          try
            AType2 := AContext.FindType( AProperty.PropertyType.ToString );
            for AProperty2 in AType2.getProperties do
//            for AProperty2 in AProperty.PropertyType.GetProperties do
            begin
              if High(AType2.GetAttributes) = -1 then
              begin
                List.Add(' - Name: ' + AProperty2.Name);
                List.Add(' - Tipo: ' + AProperty2.PropertyType.ToString);
                List.Add(' - Value: ' + AValue.ToString);
                List.Add('');
              end;
            end;

          finally
            AContext2.Free;
          end;
        end;
      end
      else
      begin
        for ACustoAttribute in AProperty.GetAttributes do
        begin
          if ACustoAttribute is LoggableAttribute then
          begin
//            if AProperty.IsReadable then
//              AValue := AProperty.GetValue(LoggableClass);
            // log to db..
            List.Add('Name: ' + AProperty.Name);
            List.Add('Personalizado: ' + LoggableAttribute(ACustoAttribute).Description);
            List.Add('Value: ' + AValue.ToString);
            List.Add('');
          end
          else
          begin
            AValue := AProperty.GetValue(LoggableClass);

            // log to db..
            List.Add('Name: ' + AProperty.Name);
            List.Add('Personalizado: ' + AProperty.ClassName);
            List.Add('Value: ' + AValue.ToString);
            List.Add('');
          end;
        end;
      end;
    end;
  finally
    Result := List.Text;
    List.Free;
    AContext.Free;
  end;
end;

class function TArtifactInspector.LogChangesForDebug(AObject: TObject): string;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustoAttribute: TCustomAttribute;
  AValue: TValue;
  List: tstrings;
begin
  AContext := TRttiContext.Create;
  List := TStringList.Create;
  try
    AType := AContext.GetType(AObject.ClassType);

    List.Add('');
    List.Add(AType.ToString);
    List.Add('');

    List.Add('Property: ' + IntToStr(High(AType.getProperties)));
    List.Add('Atributes: ' + IntToStr(High(AType.GetAttributes)));

    List.Add('');
    for AProperty in AType.getProperties do
    begin
      if AProperty.IsReadable then
      try
        AValue := AProperty.GetValue(AObject);
      except end;

      List.Add('Name: ' + AProperty.Name);
      List.Add('Tipo: ' + AProperty.PropertyType.ToString);
      try
      List.Add('Value: ' + AValue.ToString);
      except end;
      List.Add('');

    end;
  finally
    Result := List.Text;
    List.Free;
    AContext.Free;
  end;
end;

class function TArtifactInspector.LogChangesForDebugLine(AObject: TObject): string;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustoAttribute: TCustomAttribute;
  AValue: TValue;
  List: tstrings;
  linha: string;
  I: Integer;
begin
  AContext := TRttiContext.Create;
  List := TStringList.Create;
  try
    AType := AContext.GetType(AObject.ClassType);

    List.Add('');
    List.Add(AType.ToString);

    linha := 'Property: ' + IntToStr(High(AType.getProperties)) + ' Atributes: ' + IntToStr(High(AType.GetAttributes));
    List.Add(linha);

    List.Add('');
    for AProperty in AType.getProperties do
    begin
      if AProperty.IsReadable then
      try
        AValue := AProperty.GetValue(AObject);
      except end;

      linha := ('Name: ' + AProperty.Name) +
               (' Tipo: ' + AProperty.PropertyType.ToString);
      try
        linha := linha + (' Value: ' + AValue.ToString);
      except end;
      List.Add(linha);
    end;
  finally
//    Result := '';
//    for I := 0 to List.Count - 1 do
//      Result := Result + ifthen(List[I] <> '', ' ') + List[I];
    Result := List.Text;
    List.Free;
    AContext.Free;
  end;
end;

class function TArtifactInspector.RetornaObjetoCriado(aClass: TClass;
  Descricao, Marca: string; preco: Double): TObject;
var
  AObjeto: TObject;
  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;
  AValue: TValue;
  List: tstrings;
begin
  AObjeto := aClass.Create;

  AContext := TRttiContext.Create;
  List := TStringList.Create;
  try
    AType := AContext.GetType(AObjeto.ClassType);

    for AProperty in AType.getProperties do
    begin
      if MatchStr(AProperty.PropertyType.Name, ['Double', 'Currency', 'Real']) then
        if AProperty.Name = 'Price' then
          AProperty.SetValue(AObjeto, TValue.From(preco));
      if MatchStr(AProperty.PropertyType.Name, ['string', 'string']) then
        if AProperty.Name = 'Description' then
          AProperty.SetValue(AObjeto, TValue.From(Descricao))
        else if AProperty.Name = 'Marca' then
          AProperty.SetValue(AObjeto, TValue.From(Marca));
    end;
  finally
    Result := AObjeto;
    AContext.Free;
  end;
end;

class function TArtifactInspector.RetornaObjetoCriado1(aClass: TClass;
  Descricao, Marca: string; preco: Double): TObject;
var

  FRTTICtx: TRttiContext;

  function ObjectType(Ctx: TRttiContext; TypeName: string): TRttiType;
  begin
    Result := Ctx.FindType(TypeName);
  end;

  function ObjectInstance(Ctx: TRttiContext; TypeName: string): TObject;
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

  function CreateObject(AClass: TClass; AObject:TObject=nil): TObject;
  var
    LObjectType: string;
    LObject: TObject;
  begin
    LObjectType := AClass.QualifiedClassName; // RttiTypeOf(T).QualifiedName;
    LObject := ObjectInstance(FRTTICtx, LObjectType);
  end;
begin

//    if LObject = nil then
//      raise EConversionError.Create(Format(SCannotCreateType, [LObjectType]));
//
end;

class function TArtifactInspector.RetornaObjetoCriado2<T>(Descricao,
  Marca: string; preco: Double): T;
var
  rttiCreator: TRTTIHWCreator;

  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;
  AValue: TValue;
  AObject: TObject;

begin
  rttiCreator := TRTTIHWCreator.Create;
  try
    AObject := rttiCreator.CreateObject(T) as T;

    if AObject = nil then
      Exit;

    {Code for populate object}


    AContext := TRttiContext.Create;
    try
      AType := AContext.GetType((AObject as T).ClassType);

      for AProperty in AType.getProperties do
      begin
        if MatchStr(AProperty.PropertyType.Name, ['Double', 'Currency', 'Real']) then
          if AProperty.Name = 'Price' then
            AProperty.SetValue(AObject, TValue.From(preco));
        if MatchStr(AProperty.PropertyType.Name, ['string', 'string']) then
          if AProperty.Name = 'Description' then
            AProperty.SetValue(AObject, TValue.From(Descricao))
          else if AProperty.Name = 'Marca' then
            AProperty.SetValue(AObject, TValue.From(Marca));
      end;
    finally
      AContext.Free;
    end;








  finally
    Result := AObject as T;
    rttiCreator.Free;
  end;

end;

class function TArtifactInspector.RetornaObjetoCriadoArray<T>(Descricao, Marca: string; preco: Double): T;
var
  rttiCreator: TRTTIHWCreator;

  AContext: TRttiContext;
  AType: TRttiType;
  AProperty: TRttiProperty;
  ACustomAttribute: TCustomAttribute;
  AValue: TValue;
  AObject: TObject;

begin
  rttiCreator := TRTTIHWCreator.Create;
  try
    AObject := rttiCreator.CreateObject(T) as T;

    if AObject = nil then
      Exit;

    {Code for populate object}


    AContext := TRttiContext.Create;
    try
      AType := AContext.GetType((AObject as T).ClassType);
//                         AType.get.cl
//      if (AObject as T).  then


      for AProperty in AType.getProperties do
      begin
        if MatchStr(AProperty.PropertyType.Name, ['Double', 'Currency', 'Real']) then
          if AProperty.Name = 'Price' then
            AProperty.SetValue(AObject, TValue.From(preco));
        if MatchStr(AProperty.PropertyType.Name, ['string', 'string']) then
          if AProperty.Name = 'Description' then
            AProperty.SetValue(AObject, TValue.From(Descricao))
          else if AProperty.Name = 'Marca' then
            AProperty.SetValue(AObject, TValue.From(Marca));
      end;
    finally
      AContext.Free;
    end;








  finally
    Result := AObject as T;
    rttiCreator.Free;
  end;
end;

{ TDisplayLabelAttribute }

constructor TDisplayLabelAttribute.Create(const aText: string);
begin
  FText := aText;
end;

{ TProduct }

procedure TProduct.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TProduct.SetMarca(const Value: string);
begin
  FMarca := Value;
end;

procedure TProduct.SetPrice(const Value: Double);
begin
  FPrice := Value;
end;

procedure TProduct.SetValueCurrency(const Value: Currency);
begin
  FValueCurrency := Value;
end;

procedure TProduct.SetValueDate(const Value: TDate);
begin
  FValueDate := Value;
end;

procedure TProduct.SetValueDateTime(const Value: TDateTime);
begin
  FValueDateTime := Value;
end;

procedure TProduct.SetValueDouble(const Value: Double);
begin
  FValueDouble := Value;
end;

procedure TProduct.SetValueInteger(const Value: Integer);
begin
  FValueInteger := Value;
end;

procedure TProduct.SetValueReal(const Value: Real);
begin
  FValueReal := Value;
end;

procedure TProduct.SetValueReal48(const Value: Real48);
begin
  FValueReal48 := Value;
end;

procedure TProduct.SetValueString(const Value: string);
begin
  FValueString := Value;
end;

procedure TProduct.SetValueString2(const Value: String);
begin
  FValueString2 := Value;
end;

procedure TProduct.SetValueTime(const Value: TTime);
begin
  FValueTime := Value;
end;

{ LoggableAttribute }

constructor LoggableAttribute.Create(Description: String);
begin
  FDescription := 'ValorDescription';
end;

{ TRTTIHWCreator }

function TRTTIHWCreator.CreateObject(AClass: TClass; AObject: TObject): TObject;
var
  LObjectType: string;
  LObject: TObject;
  LRttiType: TRttiType;
  LAttribute: TCustomAttribute;
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
    Result := LObject;
  end;
end;

class function TRTTIHWCreator.ObjectInstance(Ctx: TRttiContext;
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

class function TRTTIHWCreator.ObjectType(Ctx: TRttiContext;
  TypeName: string): TRttiType;
begin
  // type name is qualified at this point (UnitName.TypeName)
  Result := Ctx.FindType(TypeName);
end;

end.
