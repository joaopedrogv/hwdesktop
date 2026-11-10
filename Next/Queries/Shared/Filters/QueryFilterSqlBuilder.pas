unit QueryFilterSqlBuilder;

interface

uses
  NextQueryDefinition, FilterDefinition, FilterCriterion, ParameterValueUnit;

type
  // Traduz criterios tipados em condicoes parametrizadas. O SQL base informa o
  // ponto de insercao; a definicao informa os campos e operadores permitidos.
  TQueryFilterSqlBuilder = class
  public
    class function Build(const ABaseSql, AInsertionPoint: string;
      const AParameters: ParametersValues;
      const ADefinition: TFilterDefinition;
      const ACriteria: TFilterCriteria): TNextQueryDefinition; static;
  end;

implementation

uses
  System.SysUtils, System.DateUtils, DateAndTimeNullableUnit;

const
  MissingInsertionPointMessage =
    'O ponto de insercao dos filtros nao foi informado.';
  InsertionPointNotFoundMessage =
    'O ponto de insercao dos filtros nao foi encontrado no SQL base.';
  MissingParameterNameMessage =
    'O parametro obrigatorio da consulta nao possui nome.';
  DuplicatedParameterNameMessage =
    'O nome do parametro da consulta esta repetido.';
  UnknownFilterFieldMessage =
    'O campo do filtro nao faz parte da definicao da consulta.';
  UnsupportedFilterMessage =
    'O filtro informado nao pode ser traduzido para a consulta.';

function IsDateValueKind(const AKind: TFilterValueKind): Boolean;
begin
  Result := AKind in [fvkDate, fvkDateTime];
end;

function ParameterNameExists(const AParameters: ParametersValues;
  const AName: string): Boolean;
var
  I: Integer;
begin
  for I := 0 to High(AParameters) do
    if SameText(AParameters[I].Name, AName) then
      Exit(True);

  Result := False;
end;

procedure ValidateMandatoryParameters(const AParameters: ParametersValues);
var
  I: Integer;
  J: Integer;
begin
  for I := 0 to High(AParameters) do
  begin
    if Trim(AParameters[I].Name) = '' then
      raise Exception.Create(MissingParameterNameMessage);

    for J := 0 to I - 1 do
      if SameText(AParameters[I].Name, AParameters[J].Name) then
        raise Exception.Create(DuplicatedParameterNameMessage);
  end;
end;

function ComposeConditions(const ADefinition: TFilterDefinition;
  const ACriteria: TFilterCriteria; const AParameters: ParametersValues;
  const ABuilder: IParametersBuilder): string;
var
  Criterion: TFilterCriterion;
  Field: TFilterFieldDefinition;
  Value: TFilterValue;
  I: Integer;
  ParameterIndex: Integer;
  Condition: string;
  ParameterName: string;
  InitialName: string;
  FinalName: string;
begin
  Result := '';

  for I := 0 to High(ACriteria) do
  begin
    Criterion := ACriteria[I];

    if not ADefinition.FindField(Criterion.FieldId, Field) then
      raise Exception.Create(UnknownFilterFieldMessage);

    if not FilterFieldSupportsOperator(Field, Criterion.Operator) then
      raise Exception.Create(UnsupportedFilterMessage);

    ParameterIndex := I + 1;

    case Criterion.Operator of
      foEquals:
        begin
          if Length(Criterion.Values) <> 1 then
            raise Exception.Create(UnsupportedFilterMessage);

          Value := Criterion.Values[0];
          if not FilterValueMatchesFieldType(Value, Field.ValueType) then
            raise Exception.Create(UnsupportedFilterMessage);

          ParameterName := Field.Id + '_' + IntToStr(ParameterIndex);
          if ParameterNameExists(AParameters, ParameterName) then
            raise Exception.Create(DuplicatedParameterNameMessage);

          Condition := Field.Id + ' = :' + ParameterName;
          case Field.ValueType of
            fftString:
              ABuilder.ByName(ParameterName, Value.StringValue);
            fftInteger:
              ABuilder.ByName(ParameterName, Value.IntegerValue);
            fftInt64:
              ABuilder.ByNameI64(ParameterName, Value.Int64Value);
            fftCurrency:
              ABuilder.ByNameC(ParameterName, Value.CurrencyValue);
            fftDate:
              ABuilder.ByName(ParameterName,
                DateNullable.Create(DateOf(Value.DateTimeValue)));
            fftDateTime:
              ABuilder.ByName(ParameterName, Value.DateTimeValue);
          else
            raise Exception.Create(UnsupportedFilterMessage);
          end;
        end;
      foRange:
        begin
          if Length(Criterion.Values) <> 2 then
            raise Exception.Create(UnsupportedFilterMessage);

          if not (Field.ValueType in [fftDate, fftDateTime]) then
            raise Exception.Create(UnsupportedFilterMessage);

          if (not IsDateValueKind(Criterion.Values[0].Kind)) or
            (not IsDateValueKind(Criterion.Values[1].Kind)) then
            raise Exception.Create(UnsupportedFilterMessage);

          InitialName := Field.Id + '_INI_' + IntToStr(ParameterIndex);
          FinalName := Field.Id + '_FIM_' + IntToStr(ParameterIndex);
          if ParameterNameExists(AParameters, InitialName) or
            ParameterNameExists(AParameters, FinalName) then
            raise Exception.Create(DuplicatedParameterNameMessage);

          // O limite final e o dia seguinte ao ultimo dia informado, exclusivo,
          // para incluir todo o ultimo dia sem truncar a hora da coluna.
          Condition := Field.Id + ' >= :' + InitialName + ' and ' + Field.Id +
            ' < :' + FinalName;
          ABuilder.ByName(InitialName,
            DateOf(Criterion.Values[0].DateTimeValue));
          ABuilder.ByName(FinalName,
            DateOf(Criterion.Values[1].DateTimeValue) + 1);
        end;
    else
      raise Exception.Create(UnsupportedFilterMessage);
    end;

    if Result <> '' then
      Result := Result + ' and ';
    Result := Result + Condition;
  end;
end;

class function TQueryFilterSqlBuilder.Build(const ABaseSql,
  AInsertionPoint: string; const AParameters: ParametersValues;
  const ADefinition: TFilterDefinition;
  const ACriteria: TFilterCriteria): TNextQueryDefinition;
var
  Builder: IParametersBuilder;
  Conditions: string;
  Generated: ParametersValues;
  I: Integer;
begin
  if Trim(AInsertionPoint) = '' then
    raise Exception.Create(MissingInsertionPointMessage);

  if Pos(AInsertionPoint, ABaseSql) = 0 then
    raise Exception.Create(InsertionPointNotFoundMessage);

  ValidateMandatoryParameters(AParameters);

  Builder := ParametersBuilder.Create(Length(ACriteria) * 2);
  Conditions := ComposeConditions(ADefinition, ACriteria, AParameters, Builder);

  // O marcador sucede a condicao obrigatoria do SQL base; por isso a primeira
  // condicao do filtro tambem entra com a conjuncao.
  if Conditions <> '' then
    Conditions := ' and ' + Conditions;

  Result.Sql := StringReplace(ABaseSql, AInsertionPoint, Conditions, []);
  Generated := Builder.Build;

  // Os parametros obrigatorios sao copiados como vieram, inclusive o nome e o
  // tipo. Os parametros dos criterios entram depois, com nomes unicos.
  SetLength(Result.Parameters, Length(AParameters) + Length(Generated));
  for I := 0 to High(AParameters) do
    Result.Parameters[I] := AParameters[I];
  for I := 0 to High(Generated) do
    Result.Parameters[Length(AParameters) + I] := Generated[I];
end;

end.
