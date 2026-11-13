unit FilterCriterion;

interface

uses
  FilterDefinition;

type
  TFilterValueKind = (fvkNull, fvkString, fvkInteger, fvkInt64,
    fvkCurrency, fvkDate, fvkDateTime);

  // Valor tipado do filtro. Kind discrimina qual campo contem o valor.
  TFilterValue = record
    Kind: TFilterValueKind;
    StringValue: string;
    IntegerValue: Integer;
    Int64Value: Int64;
    CurrencyValue: Currency;
    DateTimeValue: TDateTime;
    class function Null: TFilterValue; static;
    class function FromString(const AValue: string): TFilterValue; static;
    class function FromInteger(const AValue: Integer): TFilterValue; static;
    class function FromInt64(const AValue: Int64): TFilterValue; static;
    class function FromCurrency(const AValue: Currency): TFilterValue; static;
    class function FromDate(const AValue: TDateTime): TFilterValue; static;
    class function FromDateTime(const AValue: TDateTime): TFilterValue; static;
    function IsNull: Boolean;
    function SameValue(const AOther: TFilterValue): Boolean;
    function DisplayText: string;
  end;

  TFilterValues = TArray<TFilterValue>;

  TFilterCriterion = record
    FieldId: string;
    Operator: TFilterOperator;
    Values: TFilterValues;
  end;

  TFilterCriteria = TArray<TFilterCriterion>;

  TFilterCriteriaStatus = (fcsValidCriteria, fcsNoUserFilters, fcsInvalid);

  TFilterCriteriaResult = record
    Status: TFilterCriteriaStatus;
    Criteria: TFilterCriteria;
    AllSelected: Boolean;
    ValidationMessage: string;
    class function Valid(const ACriteria: TFilterCriteria): TFilterCriteriaResult; static;
    class function NoUserFilters(AAllSelected: Boolean): TFilterCriteriaResult; static;
    class function Invalid(const AMessage: string): TFilterCriteriaResult; static;
  end;

function CloneFilterValue(const AValue: TFilterValue): TFilterValue;
function CloneFilterCriterion(const ACriterion: TFilterCriterion): TFilterCriterion;
function CloneFilterCriteria(const ACriteria: TFilterCriteria): TFilterCriteria;
function SameFilterCriterion(const ALeft, ARight: TFilterCriterion): Boolean;
function FilterCriterionDisplayText(const ACriterion: TFilterCriterion;
  const ADefinition: TFilterDefinition): string;
function ValidateFilterCriterion(const ACriterion: TFilterCriterion;
  const ADefinition: TFilterDefinition; APath: TFilterPath;
  out AMessage: string): Boolean;
function TryParseFilterValue(const AText: string; AValueType: TFilterFieldType;
  out AValue: TFilterValue): Boolean;
function FilterValueMatchesFieldType(const AValue: TFilterValue;
  AValueType: TFilterFieldType): Boolean;

implementation

uses
  System.SysUtils, System.DateUtils;

{ TFilterValue }

class function TFilterValue.Null: TFilterValue;
begin
  Result.Kind := fvkNull;
  Result.StringValue := '';
  Result.IntegerValue := 0;
  Result.Int64Value := 0;
  Result.CurrencyValue := 0;
  Result.DateTimeValue := 0;
end;

class function TFilterValue.FromString(const AValue: string): TFilterValue;
begin
  Result := TFilterValue.Null;
  Result.Kind := fvkString;
  Result.StringValue := AValue;
end;

class function TFilterValue.FromInteger(const AValue: Integer): TFilterValue;
begin
  Result := TFilterValue.Null;
  Result.Kind := fvkInteger;
  Result.IntegerValue := AValue;
end;

class function TFilterValue.FromInt64(const AValue: Int64): TFilterValue;
begin
  Result := TFilterValue.Null;
  Result.Kind := fvkInt64;
  Result.Int64Value := AValue;
end;

class function TFilterValue.FromCurrency(const AValue: Currency): TFilterValue;
begin
  Result := TFilterValue.Null;
  Result.Kind := fvkCurrency;
  Result.CurrencyValue := AValue;
end;

class function TFilterValue.FromDate(const AValue: TDateTime): TFilterValue;
begin
  Result := TFilterValue.Null;
  Result.Kind := fvkDate;
  Result.DateTimeValue := AValue;
end;

class function TFilterValue.FromDateTime(const AValue: TDateTime): TFilterValue;
begin
  Result := TFilterValue.Null;
  Result.Kind := fvkDateTime;
  Result.DateTimeValue := AValue;
end;

function TFilterValue.IsNull: Boolean;
begin
  Result := Kind = fvkNull;
end;

function TFilterValue.SameValue(const AOther: TFilterValue): Boolean;
begin
  if Kind <> AOther.Kind then
    Exit(False);

  case Kind of
    fvkNull:
      Result := True;
    fvkString:
      Result := StringValue = AOther.StringValue;
    fvkInteger:
      Result := IntegerValue = AOther.IntegerValue;
    fvkInt64:
      Result := Int64Value = AOther.Int64Value;
    fvkCurrency:
      Result := CurrencyValue = AOther.CurrencyValue;
    fvkDate, fvkDateTime:
      Result := DateTimeValue = AOther.DateTimeValue;
  else
    Result := False;
  end;
end;

function TFilterValue.DisplayText: string;
begin
  case Kind of
    fvkNull:
      Result := '';
    fvkString:
      Result := StringValue;
    fvkInteger:
      Result := IntToStr(IntegerValue);
    fvkInt64:
      Result := IntToStr(Int64Value);
    fvkCurrency:
      Result := CurrToStr(CurrencyValue);
    fvkDate:
      Result := DateToStr(DateTimeValue);
    fvkDateTime:
      Result := DateTimeToStr(DateTimeValue);
  else
    Result := '';
  end;
end;

{ Copia de valores e criterios }

function CloneFilterValue(const AValue: TFilterValue): TFilterValue;
begin
  Result := AValue;
end;

function CloneFilterValues(const AValues: TFilterValues): TFilterValues;
var
  I: Integer;
begin
  SetLength(Result, Length(AValues));
  for I := 0 to High(AValues) do
    Result[I] := CloneFilterValue(AValues[I]);
end;

function CloneFilterCriterion(const ACriterion: TFilterCriterion): TFilterCriterion;
begin
  Result.FieldId := ACriterion.FieldId;
  Result.Operator := ACriterion.Operator;
  Result.Values := CloneFilterValues(ACriterion.Values);
end;

function CloneFilterCriteria(const ACriteria: TFilterCriteria): TFilterCriteria;
var
  I: Integer;
begin
  SetLength(Result, Length(ACriteria));
  for I := 0 to High(ACriteria) do
    Result[I] := CloneFilterCriterion(ACriteria[I]);
end;

function SameFilterCriterion(const ALeft, ARight: TFilterCriterion): Boolean;
var
  I: Integer;
  LeftCriterion: TFilterCriterion;
  RightCriterion: TFilterCriterion;
begin
  LeftCriterion := ALeft;
  RightCriterion := ARight;

  if LeftCriterion.FieldId <> RightCriterion.FieldId then
    Exit(False);

  if LeftCriterion.Operator <> RightCriterion.Operator then
    Exit(False);

  if Length(LeftCriterion.Values) <> Length(RightCriterion.Values) then
    Exit(False);

  for I := 0 to High(LeftCriterion.Values) do
    if not LeftCriterion.Values[I].SameValue(RightCriterion.Values[I]) then
      Exit(False);

  Result := True;
end;

{ Resultado da coleta }

class function TFilterCriteriaResult.Valid(
  const ACriteria: TFilterCriteria): TFilterCriteriaResult;
begin
  Result.Status := fcsValidCriteria;
  Result.Criteria := CloneFilterCriteria(ACriteria);
  Result.AllSelected := False;
  Result.ValidationMessage := '';
end;

class function TFilterCriteriaResult.NoUserFilters(
  AAllSelected: Boolean): TFilterCriteriaResult;
begin
  Result.Status := fcsNoUserFilters;
  Result.Criteria := nil;
  Result.AllSelected := AAllSelected;
  Result.ValidationMessage := '';
end;

class function TFilterCriteriaResult.Invalid(
  const AMessage: string): TFilterCriteriaResult;
begin
  Result.Status := fcsInvalid;
  Result.Criteria := nil;
  Result.AllSelected := False;
  Result.ValidationMessage := AMessage;
end;

{ Apresentacao }

function FieldCaption(const AField: TFilterFieldDefinition): string;
begin
  Result := Trim(AField.Label_);
  if Result = '' then
    Result := AField.Id;
end;

function FilterCriterionDisplayText(const ACriterion: TFilterCriterion;
  const ADefinition: TFilterDefinition): string;
var
  Criterion: TFilterCriterion;
  Definition: TFilterDefinition;
  Field: TFilterFieldDefinition;
  Caption: string;
  OperatorText: string;
  ValueText: string;
  Arity: Integer;
begin
  Criterion := ACriterion;
  Definition := ADefinition;

  if Definition.FindField(Criterion.FieldId, Field) then
    Caption := FieldCaption(Field)
  else
    Caption := Criterion.FieldId;

  OperatorText := LowerCase(FilterOperatorLabel(Criterion.Operator));
  Arity := FilterOperatorArity(Criterion.Operator);
  ValueText := '';

  if Arity = 1 then
  begin
    if Length(Criterion.Values) > 0 then
      ValueText := Criterion.Values[0].DisplayText;
  end
  else if Arity = 2 then
  begin
    if Length(Criterion.Values) >= 2 then
      ValueText := Criterion.Values[0].DisplayText + ' e ' +
        Criterion.Values[1].DisplayText
    else if Length(Criterion.Values) = 1 then
      ValueText := Criterion.Values[0].DisplayText;
  end;

  Result := Format('[%s] %s [%s]', [Caption, OperatorText, ValueText]);
end;

{ Validacao }

function ValidateFilterCriterion(const ACriterion: TFilterCriterion;
  const ADefinition: TFilterDefinition; APath: TFilterPath;
  out AMessage: string): Boolean;
var
  Definition: TFilterDefinition;
  Field: TFilterFieldDefinition;
  FieldCaptionText: string;
  OperatorLabel: string;
  Arity: Integer;
  I: Integer;
  Value: TFilterValue;
begin
  Result := False;
  AMessage := '';
  Definition := ADefinition;

  if not Definition.FindField(ACriterion.FieldId, Field) then
  begin
    if Trim(ACriterion.FieldId) = '' then
      AMessage := 'Campo de filtro não informado.'
    else
      AMessage := Format('Campo de filtro "%s" não encontrado.',
        [ACriterion.FieldId]);
    Exit;
  end;

  FieldCaptionText := FieldCaption(Field);
  OperatorLabel := FilterOperatorLabel(ACriterion.Operator);

  if not (ACriterion.Operator in FilterPathFieldOperators(APath, Field)) then
  begin
    AMessage := Format(
      'A condição "%s" não está disponível para o campo "%s" nesta consulta.',
      [OperatorLabel, FieldCaptionText]);
    Exit;
  end;

  Arity := FilterOperatorArity(ACriterion.Operator);
  if Length(ACriterion.Values) <> Arity then
  begin
    case Arity of
      0:
        AMessage := Format('A condição "%s" não aceita valores.',
          [OperatorLabel]);
      1:
        AMessage := Format('A condição "%s" exige um valor.',
          [OperatorLabel]);
      2:
        AMessage := Format('A condição "%s" exige dois valores.',
          [OperatorLabel]);
    else
      AMessage := Format('A condição "%s" exige %d valores.',
        [OperatorLabel, Arity]);
    end;
    Exit;
  end;

  for I := 0 to High(ACriterion.Values) do
  begin
    Value := ACriterion.Values[I];

    if not FilterValueMatchesFieldType(Value, Field.ValueType) then
    begin
      AMessage := Format('O valor informado não é válido para o campo "%s".',
        [FieldCaptionText]);
      Exit;
    end;

    if Field.ValueType = fftString then
    begin
      if Trim(Value.StringValue) = '' then
      begin
        if Arity = 2 then
        begin
          if I = 0 then
            AMessage := 'Informe o valor inicial.'
          else
            AMessage := 'Informe o valor final.';
        end
        else
          AMessage := 'Informe o valor do filtro.';
        Exit;
      end;
    end
  end;

  if Arity = 2 then
  begin
    if Field.ValueType = fftInteger then
    begin
      if ACriterion.Values[0].IntegerValue >
        ACriterion.Values[1].IntegerValue then
        AMessage := 'O valor inicial deve ser menor ou igual ao valor final.';
    end
    else if Field.ValueType = fftInt64 then
    begin
      if ACriterion.Values[0].Int64Value >
        ACriterion.Values[1].Int64Value then
        AMessage := 'O valor inicial deve ser menor ou igual ao valor final.';
    end
    else if Field.ValueType = fftCurrency then
    begin
      if ACriterion.Values[0].CurrencyValue >
        ACriterion.Values[1].CurrencyValue then
        AMessage := 'O valor inicial deve ser menor ou igual ao valor final.';
    end
    else if (Field.ValueType = fftDate) or
      (Field.ValueType = fftDateTime) then
    begin
      if DateOf(ACriterion.Values[0].DateTimeValue) >
        DateOf(ACriterion.Values[1].DateTimeValue) then
        AMessage := 'A data inicial deve ser menor ou igual à data final.';
    end;

    if AMessage <> '' then
      Exit;
  end;

  Result := True;
end;

function FilterValueMatchesFieldType(const AValue: TFilterValue;
  AValueType: TFilterFieldType): Boolean;
begin
  case AValueType of
    fftString:
      Result := AValue.Kind = fvkString;
    fftInteger:
      Result := AValue.Kind = fvkInteger;
    fftInt64:
      Result := AValue.Kind = fvkInt64;
    fftCurrency:
      Result := AValue.Kind = fvkCurrency;
    fftDate:
      Result := AValue.Kind = fvkDate;
    fftDateTime:
      Result := AValue.Kind = fvkDateTime;
  else
    Result := False;
  end;
end;

{ Leitura tipada }

function FilterTextHasTimePart(const AText: string): Boolean;
begin
  Result := (Pos(':', AText) > 0) or (Pos('h', LowerCase(AText)) > 0);
end;

function TryParseFilterValue(const AText: string; AValueType: TFilterFieldType;
  out AValue: TFilterValue): Boolean;
var
  Text: string;
  ParsedInteger: Integer;
  ParsedInt64: Int64;
  ParsedCurrency: Currency;
  ParsedDateTime: TDateTime;
begin
  AValue := TFilterValue.Null;
  Text := Trim(AText);

  case AValueType of
    fftString:
      begin
        AValue := TFilterValue.FromString(AText);
        Result := True;
      end;
    fftInteger:
      begin
        Result := TryStrToInt(Text, ParsedInteger);
        if Result then
          AValue := TFilterValue.FromInteger(ParsedInteger);
      end;
    fftInt64:
      begin
        Result := TryStrToInt64(Text, ParsedInt64);
        if Result then
          AValue := TFilterValue.FromInt64(ParsedInt64);
      end;
    fftCurrency:
      begin
        Result := TryStrToCurr(Text, ParsedCurrency);
        if Result then
          AValue := TFilterValue.FromCurrency(ParsedCurrency);
      end;
    fftDate:
      begin
        Result := TryStrToDate(Text, ParsedDateTime);
        if Result then
          AValue := TFilterValue.FromDate(ParsedDateTime);
      end;
    fftDateTime:
      begin
        if FilterTextHasTimePart(Text) then
        begin
          Result := TryStrToDateTime(Text, ParsedDateTime);
          if not Result then
            Result := TryStrToDate(Text, ParsedDateTime);
        end
        else
        begin
          Result := TryStrToDate(Text, ParsedDateTime);
          if not Result then
            Result := TryStrToDateTime(Text, ParsedDateTime);
        end;

        if Result then
          AValue := TFilterValue.FromDateTime(ParsedDateTime);
      end;
  else
    Result := False;
  end;
end;

end.
