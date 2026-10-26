unit IEntityValidatorUnit;

interface

uses
  ValidationEntityOutputUnit,
  TipoComunsUnit,
  CurrencyNullableUnit,
  DateAndTimeNullableUnit,
  IntegerNullableUnit,
  StringNullableUnit;

const
  DEFAULT_DISPLAY_DATA_MIN = 'Data informada [@Value] menor que a mínima permitida [@MinValue]';
  DEFAULT_DISPLAY_DATA_MAX = 'Data informada [@Value] maior que a máxima permitida [@MaxValue]';
  DEFAULT_DISPLAY_GREATER_THAN = 'Valor informado [@Value] precisa ser maior que [@MinValue]';
  DEFAULT_DISPLAY_GREATER_OR_EQUALS_THAN = 'Valor informado [@Value] precisa ser maior ou igual a [@MinValue]';

type
  IStringFieldValidator = interface
    ['{5F2921FF-BAE2-444C-808B-DA0CA9ED273A}']
    function IsRequired(): IStringFieldValidator;
    function IsNull(): IStringFieldValidator;
    function HasMinSize(MinSize: Integer): IStringFieldValidator;
    function HasMaxSize(MaxSize: Integer): IStringFieldValidator;
    function HasSize(MinSize, MaxSize: Integer): IStringFieldValidator;
    function IsIn(const AValues: array of string): IStringFieldValidator;
  end;

  IEnumFieldValidator = interface
    ['{0F220DA9-436A-4371-9205-4C51D221DBED}']
    function IsRequired(MinNullValue: SmallInt): IEnumFieldValidator;
    function HasValidaValues(const Values: TArrayInteger): IEnumFieldValidator;
  end;

  IIntegerFieldValidator = interface
    ['{03F39EE5-926C-4E4E-B072-DA134E0C1F22}']
    function IsRequired(const Detail: string = ''): IIntegerFieldValidator; overload;
    function IsRequired(MinNullValue: Integer): IIntegerFieldValidator; overload;
    function HasMinValue(MinValue: Integer): IIntegerFieldValidator;
    function HasMaxValue(MaxValue: Integer): IIntegerFieldValidator;
  end;

  INumericFieldValidator = interface
    ['{3B2B9596-AD61-4580-B174-094A1FFD68C9}']
    function IsRequired(const Detail: string = ''): INumericFieldValidator;
    function IsNull(): INumericFieldValidator;
    function HasMinValue(MinValue: Currency): INumericFieldValidator;
    function HasMaxValue(MaxValue: Currency): INumericFieldValidator;
    function HasToBeGreaterThan(MinValue: Currency; const Detail: string = DEFAULT_DISPLAY_GREATER_THAN): INumericFieldValidator;
    function HasToBeGreaterOrEqualsThan(MinValue: Currency; const Detail: string = DEFAULT_DISPLAY_GREATER_OR_EQUALS_THAN): INumericFieldValidator;
  end;

  IDateFieldValidator = interface
    ['{F233E105-EC4C-40D9-B3C4-4E5C09730D56}']
    function IsRequired(): IDateFieldValidator;
    function HasMinValue(MinValue: TDate; const Detail: string = DEFAULT_DISPLAY_DATA_MIN): IDateFieldValidator;
    function HasMaxValue(MaxValue: TDate; const Detail: string = DEFAULT_DISPLAY_DATA_MAX): IDateFieldValidator;
  end;

  IDateTimeFieldValidator = interface
    ['{77F41904-FFE0-45D8-A51A-3AE732DD975C}']
    function IsRequired(): IDateTimeFieldValidator;
    function HasMinValue(MinValue: TDateTime; const Detail: string = DEFAULT_DISPLAY_DATA_MIN): IDateTimeFieldValidator;
    function HasMaxValue(MaxValue: TDateTime; const Detail: string = DEFAULT_DISPLAY_DATA_MAX): IDateTimeFieldValidator;
  end;

  IEntityValidator = interface
    ['{BA89A034-155B-4592-8BAA-A2C3E80E2A9B}']
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


implementation

end.
