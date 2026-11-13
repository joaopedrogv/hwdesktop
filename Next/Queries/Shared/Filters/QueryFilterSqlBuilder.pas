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
  UnsupportedOperatorMessage =
    'A condicao "%s" nao pode ser aplicada ao campo "%s" na pesquisa SQL.';

function EscapeLikeLiteral(const AValue: string): string;
begin
  // Escapa o escape e os curingas para que o texto digitado seja literal no
  // LIKE; o padrao continua sendo enviado por parametro.
  Result := StringReplace(AValue, '\', '\\', [rfReplaceAll]);
  Result := StringReplace(Result, '%', '\%', [rfReplaceAll]);
  Result := StringReplace(Result, '_', '\_', [rfReplaceAll]);
end;

function AddSingleValueParameter(const ABuilder: IParametersBuilder;
  const AField: TFilterFieldDefinition; const AParameterName: string;
  const AValue: TFilterValue): Boolean;
begin
  Result := True;
  case AField.ValueType of
    fftString:
      ABuilder.ByName(AParameterName, AValue.StringValue);
    fftInteger:
      ABuilder.ByName(AParameterName, AValue.IntegerValue);
    fftInt64:
      ABuilder.ByNameI64(AParameterName, AValue.Int64Value);
    fftCurrency:
      ABuilder.ByNameC(AParameterName, AValue.CurrencyValue);
    fftDate:
      ABuilder.ByName(AParameterName,
        DateNullable.Create(DateOf(AValue.DateTimeValue)));
    fftDateTime:
      ABuilder.ByName(AParameterName, AValue.DateTimeValue);
  else
    Result := False;
  end;
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
  OperatorText: string;
  Pattern: string;
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

    if not (Criterion.Operator in
      FilterPathFieldOperators(fpQuerySql, Field)) then
      raise Exception.Create(Format(UnsupportedOperatorMessage,
        [FilterOperatorLabel(Criterion.Operator), Field.Id]));

    ParameterIndex := I + 1;

    case Criterion.Operator of
      foEquals, foNotEquals, foGreaterThan, foGreaterOrEqual, foLessThan,
      foLessOrEqual:
        begin
          if Length(Criterion.Values) <> 1 then
            raise Exception.Create(UnsupportedFilterMessage);

          Value := Criterion.Values[0];
          if not FilterValueMatchesFieldType(Value, Field.ValueType) then
            raise Exception.Create(UnsupportedFilterMessage);

          ParameterName := Field.Id + '_' + IntToStr(ParameterIndex);
          if ParameterNameExists(AParameters, ParameterName) then
            raise Exception.Create(DuplicatedParameterNameMessage);

          case Criterion.Operator of
            foEquals:
              OperatorText := ' = ';
            foNotEquals:
              OperatorText := ' <> ';
            foGreaterThan:
              OperatorText := ' > ';
            foGreaterOrEqual:
              OperatorText := ' >= ';
            foLessThan:
              OperatorText := ' < ';
            foLessOrEqual:
              OperatorText := ' <= ';
          else
            raise Exception.Create(UnsupportedFilterMessage);
          end;

          Condition := Field.Id + OperatorText + ':' + ParameterName;
          if not AddSingleValueParameter(ABuilder, Field, ParameterName,
            Value) then
            raise Exception.Create(UnsupportedFilterMessage);
        end;
      foStartsWith, foContains, foEndsWith:
        begin
          if Field.ValueType <> fftString then
            raise Exception.Create(UnsupportedFilterMessage);

          if Length(Criterion.Values) <> 1 then
            raise Exception.Create(UnsupportedFilterMessage);

          Value := Criterion.Values[0];
          if not FilterValueMatchesFieldType(Value, Field.ValueType) then
            raise Exception.Create(UnsupportedFilterMessage);

          ParameterName := Field.Id + '_' + IntToStr(ParameterIndex);
          if ParameterNameExists(AParameters, ParameterName) then
            raise Exception.Create(DuplicatedParameterNameMessage);

          case Criterion.Operator of
            foStartsWith:
              Pattern := EscapeLikeLiteral(Value.StringValue) + '%';
            foContains:
              Pattern := '%' + EscapeLikeLiteral(Value.StringValue) + '%';
            foEndsWith:
              Pattern := '%' + EscapeLikeLiteral(Value.StringValue);
          else
            raise Exception.Create(UnsupportedFilterMessage);
          end;

          ABuilder.ByName(ParameterName, Pattern);
          Condition := Field.Id + ' like :' + ParameterName +
            ' escape ' + QuotedStr('\');
        end;
      foRange:
        begin
          if Length(Criterion.Values) <> 2 then
            raise Exception.Create(UnsupportedFilterMessage);

          if (not FilterValueMatchesFieldType(Criterion.Values[0],
            Field.ValueType)) or
            (not FilterValueMatchesFieldType(Criterion.Values[1],
            Field.ValueType)) then
            raise Exception.Create(UnsupportedFilterMessage);

          InitialName := Field.Id + '_INI_' + IntToStr(ParameterIndex);
          FinalName := Field.Id + '_FIM_' + IntToStr(ParameterIndex);
          if ParameterNameExists(AParameters, InitialName) or
            ParameterNameExists(AParameters, FinalName) then
            raise Exception.Create(DuplicatedParameterNameMessage);

          if Field.ValueType in [fftDate, fftDateTime] then
          begin
            // O limite final e o dia seguinte ao ultimo dia informado,
            // exclusivo, para incluir todo o ultimo dia sem truncar a hora.
            Condition := Field.Id + ' >= :' + InitialName + ' and ' +
              Field.Id + ' < :' + FinalName;
            ABuilder.ByName(InitialName, DateNullable.Create(
              DateOf(Criterion.Values[0].DateTimeValue)));
            ABuilder.ByName(FinalName, DateNullable.Create(
              DateOf(Criterion.Values[1].DateTimeValue) + 1));
          end
          else
          begin
            // Nos numeros os dois limites sao inclusivos.
            Condition := Field.Id + ' >= :' + InitialName + ' and ' +
              Field.Id + ' <= :' + FinalName;
            case Field.ValueType of
              fftInteger:
                begin
                  ABuilder.ByName(InitialName,
                    Criterion.Values[0].IntegerValue);
                  ABuilder.ByName(FinalName,
                    Criterion.Values[1].IntegerValue);
                end;
              fftInt64:
                begin
                  ABuilder.ByNameI64(InitialName,
                    Criterion.Values[0].Int64Value);
                  ABuilder.ByNameI64(FinalName,
                    Criterion.Values[1].Int64Value);
                end;
              fftCurrency:
                begin
                  ABuilder.ByNameC(InitialName,
                    Criterion.Values[0].CurrencyValue);
                  ABuilder.ByNameC(FinalName,
                    Criterion.Values[1].CurrencyValue);
                end;
            else
              raise Exception.Create(UnsupportedFilterMessage);
            end;
          end;
        end;
      foIsEmpty:
        begin
          if Length(Criterion.Values) <> 0 then
            raise Exception.Create(UnsupportedFilterMessage);

          if Field.ValueType = fftString then
            Condition := '(' + Field.Id + ' is null or ' + Field.Id +
              ' = ' + QuotedStr('') + ')'
          else
            Condition := Field.Id + ' is null';
        end;
      foNotEmpty:
        begin
          if Length(Criterion.Values) <> 0 then
            raise Exception.Create(UnsupportedFilterMessage);

          if Field.ValueType = fftString then
            Condition := 'not (' + Field.Id + ' is null or ' + Field.Id +
              ' = ' + QuotedStr('') + ')'
          else
            Condition := Field.Id + ' is not null';
        end;
      foIsNull:
        begin
          // A distincao entre vazio e nulo so existe no texto.
          if (Field.ValueType <> fftString) or
            (Length(Criterion.Values) <> 0) then
            raise Exception.Create(UnsupportedFilterMessage);

          Condition := Field.Id + ' is null';
        end;
      foNotNull:
        begin
          if (Field.ValueType <> fftString) or
            (Length(Criterion.Values) <> 0) then
            raise Exception.Create(UnsupportedFilterMessage);

          Condition := Field.Id + ' is not null';
        end;
    else
      raise Exception.Create(UnsupportedFilterMessage);
    end;

    if Result <> '' then
      Result := Result + ' and ';
    Result := Result + '(' + Condition + ')';
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
