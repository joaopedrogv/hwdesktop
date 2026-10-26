unit EntityValidatorFactoryUnit;

interface

uses
  IEntityValidatorUnit,
  EntityMetadataUnit,
  ValidationEntityOutputUnit,
  CurrencyNullableUnit,
  DateAndTimeNullableUnit,
  IntegerNullableUnit,
  StringNullableUnit;

type
  EntityValidatorFactory = class
  public
    class function Builder(): IEntityValidator; overload; static;
    class function Builder(const Metadata: EntityMetadata): IEntityValidator; overload; static; 
  end;

implementation

uses
  SysUtils, StrUtils,
  TipoComunsUnit,
  ArrayServiceUnit,
  StringServiceUnit,
  DateTimeServiceUnit, EValidacaoNegocioUnit;

type
  EntityValidator = class(TInterfacedObject, IEntityValidator)
  private
    FValidations: ValidationEntityOutput;
    FMetadata: EntityMetadata;
    FMetadataProblems: TArrayString;
    procedure CheckFieldMetadata(const FieldName: string);
    procedure CheckMetadata();
  public
    constructor Create(); overload;
    constructor Create(const Metadata: EntityMetadata); overload;

    function Field(const FieldName, Value: string): IStringFieldValidator; overload;
    function Field(const FieldName: string; Value: StringNullable): IStringFieldValidator; overload;
    function Field(const FieldName: string; Value: Currency): INumericFieldValidator; overload;
    function Field(const FieldName: string; const Value: CurrencyNullable): INumericFieldValidator; overload;
    function Field(const FieldName: string; const Value: DateNullable): IDateFieldValidator; overload;
    function Field(const FieldName: string; const Value: DateTimeNullable): IDateTimeFieldValidator; overload;
    function Field(const FieldName: string; const Value: IntegerNullable): IIntegerFieldValidator; overload;
    function Field(const FieldName: string; const Value: Int64Nullable): IIntegerFieldValidator; overload;
    function FieldD(const FieldName: string; Value: TDate): IDateFieldValidator;
    function FieldDT(const FieldName: string; Value: TDateTime): IDateTimeFieldValidator;
    function FieldEnum(const FieldName: string; Value: Cardinal): IEnumFieldValidator;
    function Add(const Value: ValidationEntityItem): IEntityValidator; overload;
    function Add(const FieldName, Detail: string): IEntityValidator; overload;
    function IsValid(): Boolean;
    function Result(): ValidationEntityOutput;
  end;

  StringFieldValidator = class(TInterfacedObject, IStringFieldValidator)
  private
    FField: string;
    FValue: StringNullable;
    //FUseNullable: Boolean;
    FOwner: EntityValidator;
  public
    constructor Create(Owner: EntityValidator; const Field, Value: string); overload;
    constructor Create(Owner: EntityValidator; const Field: string; const Value: StringNullable); overload;

    function IsRequired(): IStringFieldValidator;
    function IsNull(): IStringFieldValidator;
    function HasMinSize(MinSize: Integer): IStringFieldValidator;
    function HasMaxSize(MaxSize: Integer): IStringFieldValidator;
    function HasSize(MinSize, MaxSize: Integer): IStringFieldValidator;
    function IsIn(const AValues: array of string): IStringFieldValidator;
  end;

  NumericFieldValidator = class(TInterfacedObject, INumericFieldValidator)
  private
    FField: string;
    FValue: CurrencyNullable;
    FOwner: EntityValidator;
  public
    constructor Create(Owner: EntityValidator; const Field: string; Value: Currency); overload;
    constructor Create(Owner: EntityValidator; const Field: string; const Value: CurrencyNullable); overload;

    function IsRequired(const Detail: string = ''): INumericFieldValidator;
    function IsNull(): INumericFieldValidator;
    function HasMinValue(MinValue: Currency): INumericFieldValidator;
    function HasMaxValue(MaxValue: Currency): INumericFieldValidator;
    function HasToBeGreaterThan(MinValue: Currency; const Detail: string = DEFAULT_DISPLAY_GREATER_OR_EQUALS_THAN): INumericFieldValidator;
    function HasToBeGreaterOrEqualsThan(MinValue: Currency; const Detail: string = DEFAULT_DISPLAY_GREATER_OR_EQUALS_THAN): INumericFieldValidator;
  end;

  DateFieldValidator = class(TInterfacedObject, IDateFieldValidator)
  private
    FField: string;
    FValue: DateNullable;
    FOwner: EntityValidator;
  public
    constructor Create(Owner: EntityValidator; const Field: string; Value: TDate); overload;
    constructor Create(Owner: EntityValidator; const Field: string; const Value: DateNullable); overload;

    function IsRequired(): IDateFieldValidator;
    function HasMinValue(MinValue: TDate; const Detail: string = DEFAULT_DISPLAY_DATA_MIN): IDateFieldValidator;
    function HasMaxValue(MaxValue: TDate; const Detail: string = DEFAULT_DISPLAY_DATA_MAX): IDateFieldValidator;
  end;

  DateTimeFieldValidator = class(TInterfacedObject, IDateTimeFieldValidator)
  private
    FField: string;
    FValue: DateTimeNullable;
    FOwner: EntityValidator;
  public
    constructor Create(Owner: EntityValidator; const Field: string; Value: TDateTime); overload;
    constructor Create(Owner: EntityValidator; const Field: string; const Value: DateTimeNullable); overload;

    function IsRequired(): IDateTimeFieldValidator;
    function HasMinValue(MinValue: TDateTime; const Detail: string = DEFAULT_DISPLAY_DATA_MIN): IDateTimeFieldValidator;
    function HasMaxValue(MaxValue: TDateTime; const Detail: string = DEFAULT_DISPLAY_DATA_MAX): IDateTimeFieldValidator;
  end;

  IntegerOrEnumFieldValidator = class(TInterfacedObject, IEnumFieldValidator, IIntegerFieldValidator)
  private
    FField: string;
    FValue: Int64Nullable;
    FOwner: EntityValidator;
  public
    constructor Create(Owner: EntityValidator; const Field: string; Value: SmallInt); overload;
    constructor Create(Owner: EntityValidator; const Field: string; const Value: IntegerNullable); overload;
    constructor Create(Owner: EntityValidator; const Field: string; const Value: Int64Nullable); overload;

    function HasValidaValues(const Values: TArrayInteger): IEnumFieldValidator;
    function IsRequired(MinNullValue: SmallInt): IEnumFieldValidator; overload;

    function IsRequired(const Detail: string = ''): IIntegerFieldValidator; overload;
    function IsRequired(MinNullValue: Integer): IIntegerFieldValidator; overload;
    function HasMinValue(MinValue: Integer): IIntegerFieldValidator;
    function HasMaxValue(MaxValue: Integer): IIntegerFieldValidator;
  end;

{ StringFieldValidator }

constructor StringFieldValidator.Create(Owner: EntityValidator; const Field, Value: string);
begin
  if Owner = nil then
    raise Exception.Create('StringFieldValidator Owner is nil');

  if Trim(Field) = '' then
    raise Exception.Create('StringFieldValidator Field is empty');

  //FUseNullable := False;

  FOwner := Owner;
  FField := Field;
  FValue := StringNullable.CreateOrNull( Trim(Value) );
end;

constructor StringFieldValidator.Create(Owner: EntityValidator;
  const Field: string; const Value: StringNullable);
begin
  Create( Owner, Field, Value.Value);

  //FUseNullable := True;
  FValue := Value
end;

function StringFieldValidator.HasMaxSize(MaxSize: Integer): IStringFieldValidator;
begin
  if Length(FValue.Value) > MaxSize then
    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMax, Format('Tamanho máximo %d, preenchido %d', [ MaxSize, Length(FValue.Value) ]))
    );

  Result := Self;
end;

function StringFieldValidator.HasMinSize(MinSize: Integer): IStringFieldValidator;
begin
  if Length(FValue.Value) < MinSize then
    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMin, Format('Tamanho mínimo %d, preenchido %d', [ MinSize, Length(FValue.Value) ]))
    );

  Result := Self;
end;

function StringFieldValidator.HasSize(MinSize, MaxSize: Integer): IStringFieldValidator;
begin
  if Length(FValue.Value) < MinSize then
    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMin, Format('Preencher entre %d e %d caracteres, preenchido %d', [ MinSize, MaxSize, Length(FValue.Value) ]))
    );

  if Length(FValue.Value) > MaxSize then
    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMax, Format('Preencher entre %d e %d caracteres, preenchido %d', [ MinSize, MaxSize, Length(FValue.Value) ]))
    );

  Result := Self;
end;

function StringFieldValidator.IsIn(const AValues: array of string): IStringFieldValidator;
begin
  if not MatchStr(FValue.Value, AValues ) then
    FOwner.Add(ValidationEntityItem
      .CreateProblem(FField, vepOutOffRange, Format(
        'Valor "%s" preenchido não corresponde com valores permitidos: "%s" ',
        [ FValue.Value, StringService.Join( '", "', AValues )])
      ));
end;

function StringFieldValidator.IsNull: IStringFieldValidator;
begin
  if not FValue.IsNull then
    FOwner.FValidations.Add(ValidationEntityItem.CreateProblem(FField, vepIsNull));

  Result := Self;
end;

function StringFieldValidator.IsRequired(): IStringFieldValidator;
begin
  if FValue.IsNull then
    FOwner.FValidations.Add(ValidationEntityItem.CreateProblem(FField, vepRequired));

  Result := Self;
end;

{ EntityValidator }

function EntityValidator.Add(const Value: ValidationEntityItem): IEntityValidator;
begin
  CheckFieldMetadata(Value.FieldName);

  FValidations.Add(Value);

  Result := Self;
end;

constructor EntityValidator.Create;
begin
  FValidations := ValidationEntityOutput.Create();

  FMetadata := EntityMetadata.Create('');
  SetLength(FMetadataProblems, 0);
end;

function EntityValidator.Field(const FieldName, Value: string): IStringFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := StringFieldValidator.Create( Self, FieldName, Value );
end;

function EntityValidator.Field(const FieldName: string;
  Value: Currency): INumericFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := NumericFieldValidator.Create( Self, FieldName, Value );
end;

function EntityValidator.Field(const FieldName: string;
  const Value: CurrencyNullable): INumericFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := NumericFieldValidator.Create( Self, FieldName, Value );
end;

function EntityValidator.FieldEnum(const FieldName: string;
  Value: Cardinal): IEnumFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := IntegerOrEnumFieldValidator.Create( Self, FieldName, Value );
end;

function EntityValidator.IsValid(): Boolean;
begin
  CheckMetadata();

  Result := FValidations.IsValid();
end;

function EntityValidator.Result(): ValidationEntityOutput;
begin
  CheckMetadata();

  Result := FValidations;
end;

function EntityValidator.Field(const FieldName: string;
  const Value: DateTimeNullable): IDateTimeFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := DateTimeFieldValidator.Create( Self, FieldName, Value );
end;

function EntityValidator.Field(const FieldName: string;
  Value: StringNullable): IStringFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := StringFieldValidator.Create( Self, FieldName, Value );
end;

function EntityValidator.Field(const FieldName: string;
  const Value: DateNullable): IDateFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := DateFieldValidator.Create( Self, FieldName, Value );
end;

function EntityValidator.FieldD(const FieldName: string;
  Value: TDate): IDateFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := DateFieldValidator.Create( Self, FieldName, Value );
end;

function EntityValidator.FieldDT(const FieldName: string;
  Value: TDateTime): IDateTimeFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := DateTimeFieldValidator.Create( Self, FieldName, Value );
end;

function EntityValidator.Field(const FieldName: string; const Value: IntegerNullable): IIntegerFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := IntegerOrEnumFieldValidator.Create( Self, FieldName, Value );
end;

function EntityValidator.Add(const FieldName, Detail: string): IEntityValidator;
begin
  Result := Self.Add( ValidationEntityItem.Create( FieldName, Detail ));
end;

procedure EntityValidator.CheckFieldMetadata(const FieldName: string);
var
  S: string;
begin
  if not FMetadata.IsNull then
    if not FMetadata.TryGetDisplayAttribute(FieldName, S) then
    begin
      SetLength(FMetadataProblems, Length(FMetadataProblems) + 1);
      FMetadataProblems[High(FMetadataProblems)] := FieldName;
    end;
end;

procedure EntityValidator.CheckMetadata;
begin
  if Length(FMetadataProblems) > 0 then
    raise EValidacaoNegocio.Create(
      'EntityValidator. No attributes in ' + FMetadata.DisplayName + ' for:' + sLineBreak 
      + StringService.Join( sLineBreak, FMetadataProblems )
    );  
end;

constructor EntityValidator.Create(const Metadata: EntityMetadata);
begin
  FValidations := ValidationEntityOutput.Create( Metadata );

  FMetadata := Metadata;
  SetLength(FMetadataProblems, 0);
end;

function EntityValidator.Field(const FieldName: string; const Value: Int64Nullable): IIntegerFieldValidator;
begin
  CheckFieldMetadata(FieldName);
  Result := IntegerOrEnumFieldValidator.Create( Self, FieldName, Value );
end;

{ EntityValidatorFactory }

class function EntityValidatorFactory.Builder: IEntityValidator;
begin
  Result := EntityValidator.Create();
end;

class function EntityValidatorFactory.Builder(const Metadata: EntityMetadata): IEntityValidator;
begin
  Result := EntityValidator.Create(Metadata);
end;

{ IntegerOrEnumFieldValidator }

constructor IntegerOrEnumFieldValidator.Create(Owner: EntityValidator;
  const Field: string; Value: SmallInt);
begin
  Create( Owner, Field, Int64Nullable.CreateOrNull( Value ) );
end;

constructor IntegerOrEnumFieldValidator.Create(Owner: EntityValidator; const Field: string;
  const Value: IntegerNullable);
begin
  if Owner = nil then
    raise Exception.Create('IntegerOrEnumFieldValidator Owner is nil');

  if Trim(Field) = '' then
    raise Exception.Create('IntegerOrEnumFieldValidator Field is empty');

  FOwner := Owner;
  FField := Field;
  FValue := Int64Nullable.Create( Value.Value, Value.IsNull );
end;

constructor IntegerOrEnumFieldValidator.Create(Owner: EntityValidator; const Field: string; const Value: Int64Nullable);
begin
  if Owner = nil then
    raise Exception.Create('IntegerOrEnumFieldValidator Owner is nil');

  if Trim(Field) = '' then
    raise Exception.Create('IntegerOrEnumFieldValidator Field is empty');

  FOwner := Owner;
  FField := Field;
  FValue := Value;
end;

function IntegerOrEnumFieldValidator.HasMaxValue(MaxValue: Integer): IIntegerFieldValidator;
begin
  if not FValue.IsNull and ( FValue.Value > MaxValue ) then
    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMax, Format('Valor informado %d maior que o máximo permitido %d', [ FValue.Value, MaxValue ]))
    );

  Result := Self;
end;

function IntegerOrEnumFieldValidator.HasMinValue(MinValue: Integer): IIntegerFieldValidator;
begin
  if not FValue.IsNull and ( FValue.Value < MinValue ) then
    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMin, Format('Valor informado %d menor que o mínimo permitido %d', [ FValue.Value, MinValue ]))
    );

  Result := Self;
end;

function IntegerOrEnumFieldValidator.HasValidaValues(
  const Values: TArrayInteger): IEnumFieldValidator;
var
  I, V: Integer;
  S: string;
begin
  Result := Self;

  V := FValue.Value;

  for I := Low(Values) to High(Values) do
    if V = Values[I] then
      Exit;

  S := StringService.Join(', ', ArrayService.IntArrayToStringArray(Values));

  FOwner.FValidations.Add(ValidationEntityItem
    .CreateProblem(FField, vepOutOffRange, Format('Valor informado fora do range permitido: [%s]', [ S ]))
  );
end;

function IntegerOrEnumFieldValidator.IsRequired(const Detail: string): IIntegerFieldValidator;
begin
  if FValue.IsNull then
    FOwner.FValidations.Add(ValidationEntityItem.CreateProblem(FField, vepRequired, Detail));

  Result := Self;
end;

function IntegerOrEnumFieldValidator.IsRequired(MinNullValue: Integer): IIntegerFieldValidator;
begin
  if FValue.Value < MinNullValue then
    FOwner.FValidations.Add(ValidationEntityItem.CreateProblem(FField, vepRequired));

  Result := Self;
end;

function IntegerOrEnumFieldValidator.IsRequired(MinNullValue: SmallInt): IEnumFieldValidator;
begin
  if FValue.Value < MinNullValue then
    FOwner.FValidations.Add(ValidationEntityItem.CreateProblem(FField, vepRequired));

  Result := Self;
end;

{ NumericFieldValidator }

constructor NumericFieldValidator.Create(Owner: EntityValidator;
  const Field: string; Value: Currency);
begin
  Create( Owner, Field, CurrencyNullable.CreateOrNull( Value ) );
end;

constructor NumericFieldValidator.Create(Owner: EntityValidator;
  const Field: string; const Value: CurrencyNullable);
begin
  if Owner = nil then
    raise Exception.Create('NumericFieldValidator Owner is nil');

  if Trim(Field) = '' then
    raise Exception.Create('NumericFieldValidator Field is empty');

  FOwner := Owner;
  FField := Field;
  FValue := Value;
end;

function NumericFieldValidator.HasMaxValue(MaxValue: Currency): INumericFieldValidator;
begin
  if not FValue.IsNull and ( FValue.Value > MaxValue ) then
    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMax, Format('Valor informado %s maior que o máximo permitido %s', [ FloatToStr(FValue.Value), FloatToStr(MaxValue) ]))
    );

  Result := Self;
end;

function NumericFieldValidator.HasMinValue(MinValue: Currency): INumericFieldValidator;
begin
  if not FValue.IsNull and ( FValue.Value < MinValue ) then
    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMin, Format('Valor informado %s menor que o mínimo permitido %s', [ FloatToStr(FValue.Value), FloatToStr(MinValue) ]))
    );

  Result := Self;
end;

function NumericFieldValidator.HasToBeGreaterOrEqualsThan(MinValue: Currency;
  const Detail: string): INumericFieldValidator;
var
  S: string;
begin
  if not FValue.IsNull and ( FValue.Value < MinValue ) then
  begin
    S := StringReplace( Detail, '[@Value]', CurrToStr(FValue.Value), [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace( S     , '[@MinValue]', CurrToStr(MinValue), [rfReplaceAll, rfIgnoreCase]);

    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMin, S)
    );
  end;

  Result := Self;
end;

function NumericFieldValidator.HasToBeGreaterThan(MinValue: Currency; const Detail: string): INumericFieldValidator;
var
  S: string;
begin
  if not FValue.IsNull and ( FValue.Value <= MinValue ) then
  begin
    S := StringReplace( Detail, '[@Value]', CurrToStr(FValue.Value), [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace( S     , '[@MinValue]', CurrToStr(MinValue), [rfReplaceAll, rfIgnoreCase]);

    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMin, S)
    );
  end;

  Result := Self;
end;

function NumericFieldValidator.IsNull: INumericFieldValidator;
begin
  if not FValue.IsNull then
    FOwner.FValidations.Add(ValidationEntityItem.CreateProblem(FField, vepIsNull));

  Result := Self;
end;

function NumericFieldValidator.IsRequired(const Detail: string): INumericFieldValidator;
begin
  if FValue.IsNull then
    FOwner.FValidations.Add(ValidationEntityItem.CreateProblem(FField, vepRequired, Detail));

  Result := Self;  
end;

{ DateTimeFieldValidator }

constructor DateTimeFieldValidator.Create(Owner: EntityValidator;
  const Field: string; Value: TDateTime);
begin
  Create( Owner, Field, DateTimeNullable.CreateOrNull( Value ) );
end;

constructor DateTimeFieldValidator.Create(Owner: EntityValidator;
  const Field: string; const Value: DateTimeNullable);
begin
  if Owner = nil then
    raise Exception.Create('DateTimeFieldValidator Owner is nil');

  if Trim(Field) = '' then
    raise Exception.Create('DateTimeFieldValidator Field is empty');

  FOwner := Owner;
  FField := Field;
  FValue := Value;
end;

function DateTimeFieldValidator.HasMaxValue(
  MaxValue: TDateTime;
  const Detail: string
): IDateTimeFieldValidator;
var
  S: string;
begin
  if not FValue.IsNull and ( FValue.Value > MaxValue ) then
  begin
    S := StringReplace( Detail, '[@Value]', DateTimeService.ParseLocal(FValue.Value), [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace( S     , '[@MaxValue]', DateTimeService.ParseLocal(MaxValue), [rfReplaceAll, rfIgnoreCase]);

    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMax, S)
    );
  end;

  Result := Self;
end;

function DateTimeFieldValidator.HasMinValue(
  MinValue: TDateTime;
  const Detail: string
): IDateTimeFieldValidator;
var
  S: string;
begin
  if not FValue.IsNull and ( FValue.Value < MinValue ) then
  begin
    S := StringReplace( Detail, '[@Value]', DateTimeService.ParseLocal(FValue.Value), [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace( S     , '[@MinValue]', DateTimeService.ParseLocal(MinValue), [rfReplaceAll, rfIgnoreCase]);

    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMin, S)
    );
  end;

  Result := Self;
end;

function DateTimeFieldValidator.IsRequired: IDateTimeFieldValidator;
begin
  if FValue.IsNull then
    FOwner.FValidations.Add(ValidationEntityItem.CreateProblem(FField, vepRequired));

  Result := Self;
end;

{ DateFieldValidator }

constructor DateFieldValidator.Create(Owner: EntityValidator;
  const Field: string; Value: TDate);
begin
  Create( Owner, Field, DateNullable.CreateOrNull( Value ) );
end;

constructor DateFieldValidator.Create(Owner: EntityValidator;
  const Field: string; const Value: DateNullable);
begin
  if Owner = nil then
    raise Exception.Create('DateFieldValidator Owner is nil');

  if Trim(Field) = '' then
    raise Exception.Create('DateFieldValidator Field is empty');

  FOwner := Owner;
  FField := Field;
  FValue := Value;
end;

function DateFieldValidator.HasMaxValue(MaxValue: TDate;
  const Detail: string): IDateFieldValidator;
var
  S: string;
begin
  if not FValue.IsNull and ( FValue.Value > MaxValue ) then
  begin
    S := StringReplace( Detail, '[@Value]', DateService.ParseLocal(FValue.Value), [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace( S     , '[@MaxValue]', DateService.ParseLocal(MaxValue), [rfReplaceAll, rfIgnoreCase]);

    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMax, S)
    );
  end;

  Result := Self;
end;

function DateFieldValidator.HasMinValue(MinValue: TDate;
  const Detail: string): IDateFieldValidator;
var
  S: string;
begin
  if not FValue.IsNull and ( FValue.Value < MinValue ) then
  begin
    S := StringReplace( Detail, '[@Value]', DateService.ParseLocal(FValue.Value), [rfReplaceAll, rfIgnoreCase]);
    S := StringReplace( S     , '[@MinValue]', DateService.ParseLocal(MinValue), [rfReplaceAll, rfIgnoreCase]);

    FOwner.FValidations.Add(ValidationEntityItem
      .CreateProblem(FField, vepHasMin, S)
    );
  end;

  Result := Self;
end;

function DateFieldValidator.IsRequired: IDateFieldValidator;
begin
  if FValue.IsNull then
    FOwner.FValidations.Add(ValidationEntityItem.CreateProblem(FField, vepRequired));

  Result := Self;
end;

end.
