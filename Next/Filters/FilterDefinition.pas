unit FilterDefinition;

interface

type
  TFilterFieldType = (fftString, fftInteger, fftInt64, fftCurrency,
    fftDate, fftDateTime);

  // Ordem e rotulos preservam o catalogo ativo legado de filtros.
  TFilterOperator = (foEquals, foStartsWith, foContains, foEndsWith, foRange,
    foNotEquals, foGreaterThan, foGreaterOrEqual, foLessThan, foLessOrEqual,
    foIsEmpty, foNotEmpty, foIsNull, foNotNull);

  TFilterOperatorSet = set of TFilterOperator;

  // Politica de mascara por operador. A mascara de fragmento e usada por
  // Comeca/Esta contido/Termina com; a de valor completo por Igual/Diferente/
  // Entre; as demais condicoes usam a mascara padrao.
  TFilterMaskPolicy = record
  private
    FDefaultMask: string;
    FFullValueMask: string;
    FFragmentMask: string;
  public
    class function None: TFilterMaskPolicy; static;
    class function DateMask(
      const AMask: string = '!99/99/0000;1;_'): TFilterMaskPolicy; static;
    class function FromMasks(const ADefaultMask, AFullValueMask,
      AFragmentMask: string): TFilterMaskPolicy; static;
    function MaskFor(const AOperator: TFilterOperator): string;
    property DefaultMask: string read FDefaultMask;
    property FullValueMask: string read FFullValueMask;
    property FragmentMask: string read FFragmentMask;
  end;

  TFilterFieldDefinition = record
    Id: string;                 // identificador estavel; nao usar o rotulo
    Label_: string;             // rotulo exibido
    ValueType: TFilterFieldType;
    Operators: TFilterOperatorSet; // vazio = conjunto padrao do tipo
    MaskPolicy: TFilterMaskPolicy;
  end;

  TFilterFieldDefinitions = TArray<TFilterFieldDefinition>;

  TFilterDefinition = record
    Fields: TFilterFieldDefinitions;
    AllowAll: Boolean;          // habilita a opcao Todos
    function FieldIndex(const AId: string): Integer;
    function FindField(const AId: string;
      out AField: TFilterFieldDefinition): Boolean;
    function FirstFieldIndex: Integer;
  end;

function FilterField(const AId, ALabel: string;
  AValueType: TFilterFieldType): TFilterFieldDefinition; overload;
function FilterField(const AId, ALabel: string;
  AValueType: TFilterFieldType;
  const AOperators: TFilterOperatorSet): TFilterFieldDefinition; overload;
function FilterField(const AId, ALabel: string;
  AValueType: TFilterFieldType;
  const AOperators: TFilterOperatorSet;
  const AMaskPolicy: TFilterMaskPolicy): TFilterFieldDefinition; overload;
function FilterDefinitionOf(
  const AFields: array of TFilterFieldDefinition;
  AAllowAll: Boolean): TFilterDefinition;

function FilterOperatorLabel(const AOperator: TFilterOperator): string;
function FilterOperatorCode(const AOperator: TFilterOperator): string;
function TryFilterOperatorFromCode(const ACode: string;
  out AOperator: TFilterOperator): Boolean;
function FilterOperatorArity(const AOperator: TFilterOperator): Integer;
function FilterDefaultOperators(
  const AValueType: TFilterFieldType): TFilterOperatorSet;
function FilterFieldOperators(
  const AField: TFilterFieldDefinition): TFilterOperatorSet;
function FilterDefaultOperator(
  const AValueType: TFilterFieldType): TFilterOperator;
function FilterFieldSupportsOperator(const AField: TFilterFieldDefinition;
  const AOperator: TFilterOperator): Boolean;
function FilterMaskForOperator(const AField: TFilterFieldDefinition;
  const AOperator: TFilterOperator): string;

implementation

uses
  System.SysUtils;

const
  AllFilterOperators: TFilterOperatorSet = [
    foEquals, foStartsWith, foContains, foEndsWith, foRange, foNotEquals,
    foGreaterThan, foGreaterOrEqual, foLessThan, foLessOrEqual, foIsEmpty,
    foNotEmpty, foIsNull, foNotNull
  ];

  NonNullFilterOperators: TFilterOperatorSet = [
    foEquals, foNotEquals, foRange, foGreaterThan, foGreaterOrEqual,
    foLessThan, foLessOrEqual, foIsEmpty, foNotEmpty
  ];

  OperatorLabels: array[TFilterOperator] of string = (
    'Igual', 'Começa', 'Esta contido', 'Termina com', 'Entre', 'Diferente',
    'Maior', 'Maior ou Igual', 'Menor', 'Menor ou Igual', 'Vazio',
    'Não vazio', 'Nulo', 'Não nulo'
  );

  OperatorCodes: array[TFilterOperator] of string = (
    'equals', 'startsWith', 'contains', 'endsWith', 'range', 'notEquals',
    'greaterThan', 'greaterOrEqual', 'lessThan', 'lessOrEqual', 'isEmpty',
    'notEmpty', 'isNull', 'notNull'
  );

  OperatorArities: array[TFilterOperator] of Integer = (
    1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0
  );

{ TFilterMaskPolicy }

class function TFilterMaskPolicy.None: TFilterMaskPolicy;
begin
  Result := TFilterMaskPolicy.FromMasks('', '', '');
end;

class function TFilterMaskPolicy.DateMask(
  const AMask: string): TFilterMaskPolicy;
begin
  Result := TFilterMaskPolicy.FromMasks(AMask, AMask, '');
end;

class function TFilterMaskPolicy.FromMasks(const ADefaultMask,
  AFullValueMask, AFragmentMask: string): TFilterMaskPolicy;
begin
  Result.FDefaultMask := ADefaultMask;
  Result.FFullValueMask := AFullValueMask;
  Result.FFragmentMask := AFragmentMask;
end;

function TFilterMaskPolicy.MaskFor(
  const AOperator: TFilterOperator): string;
begin
  case AOperator of
    foStartsWith, foContains, foEndsWith:
      Result := FFragmentMask;
    foEquals, foNotEquals, foRange:
      Result := FFullValueMask;
  else
    Result := FDefaultMask;
  end;
end;

{ TFilterDefinition }

function TFilterDefinition.FieldIndex(const AId: string): Integer;
var
  I: Integer;
begin
  if (AId = '') or (Length(Fields) = 0) then
    Exit(-1);

  for I := 0 to High(Fields) do
    if Fields[I].Id = AId then
      Exit(I);

  Result := -1;
end;

function TFilterDefinition.FindField(const AId: string;
  out AField: TFilterFieldDefinition): Boolean;
var
  Index: Integer;
begin
  Index := FieldIndex(AId);
  Result := Index >= 0;

  if Result then
    AField := Fields[Index]
  else
    AField := Default(TFilterFieldDefinition);
end;

function TFilterDefinition.FirstFieldIndex: Integer;
begin
  if Length(Fields) = 0 then
    Result := -1
  else
    Result := 0;
end;

{ Construtores de campo e definicao }

function FilterField(const AId, ALabel: string;
  AValueType: TFilterFieldType): TFilterFieldDefinition;
begin
  Result := FilterField(AId, ALabel, AValueType, [],
    TFilterMaskPolicy.None);
end;

function FilterField(const AId, ALabel: string;
  AValueType: TFilterFieldType;
  const AOperators: TFilterOperatorSet): TFilterFieldDefinition;
begin
  Result := FilterField(AId, ALabel, AValueType, AOperators,
    TFilterMaskPolicy.None);
end;

function FilterField(const AId, ALabel: string;
  AValueType: TFilterFieldType;
  const AOperators: TFilterOperatorSet;
  const AMaskPolicy: TFilterMaskPolicy): TFilterFieldDefinition;
begin
  Result.Id := AId;
  Result.Label_ := ALabel;
  Result.ValueType := AValueType;
  Result.Operators := AOperators;
  Result.MaskPolicy := AMaskPolicy;
end;

function FilterDefinitionOf(
  const AFields: array of TFilterFieldDefinition;
  AAllowAll: Boolean): TFilterDefinition;
var
  I: Integer;
begin
  SetLength(Result.Fields, Length(AFields));
  for I := 0 to High(AFields) do
    Result.Fields[I] := AFields[I];

  Result.AllowAll := AAllowAll;
end;

{ Catalogo de operadores }

function FilterOperatorLabel(const AOperator: TFilterOperator): string;
begin
  Result := OperatorLabels[AOperator];
end;

function FilterOperatorCode(const AOperator: TFilterOperator): string;
begin
  Result := OperatorCodes[AOperator];
end;

function TryFilterOperatorFromCode(const ACode: string;
  out AOperator: TFilterOperator): Boolean;
var
  Candidate: TFilterOperator;
  NormalizedCode: string;
begin
  NormalizedCode := Trim(ACode);
  for Candidate := Low(TFilterOperator) to High(TFilterOperator) do
    if SameText(NormalizedCode, OperatorCodes[Candidate]) then
    begin
      AOperator := Candidate;
      Exit(True);
    end;

  AOperator := Low(TFilterOperator);
  Result := False;
end;

function FilterOperatorArity(const AOperator: TFilterOperator): Integer;
begin
  Result := OperatorArities[AOperator];
end;

function FilterDefaultOperators(
  const AValueType: TFilterFieldType): TFilterOperatorSet;
begin
  case AValueType of
    fftString:
      Result := AllFilterOperators;
    fftInteger, fftInt64, fftCurrency, fftDate, fftDateTime:
      Result := NonNullFilterOperators;
  else
    Result := [];
  end;
end;

function FilterFieldOperators(
  const AField: TFilterFieldDefinition): TFilterOperatorSet;
begin
  if AField.Operators <> [] then
    Result := AField.Operators
  else
    Result := FilterDefaultOperators(AField.ValueType);
end;

function FilterDefaultOperator(
  const AValueType: TFilterFieldType): TFilterOperator;
begin
  if AValueType in [fftDate, fftDateTime] then
    Result := foRange
  else
    Result := foEquals;
end;

function FilterFieldSupportsOperator(const AField: TFilterFieldDefinition;
  const AOperator: TFilterOperator): Boolean;
begin
  Result := AOperator in FilterFieldOperators(AField);
end;

function FilterMaskForOperator(const AField: TFilterFieldDefinition;
  const AOperator: TFilterOperator): string;
var
  MaskPolicy: TFilterMaskPolicy;
begin
  MaskPolicy := AField.MaskPolicy;
  Result := MaskPolicy.MaskFor(AOperator);
end;

end.
