unit QueryResultOperations;

interface

uses
  Data.DB, IDataSetReaderUnit, IDataSetSorterUnit, System.Generics.Collections,
  FilterDefinition, FilterCriterion;

type
  // Criterio do filtro rapido. Id e a identidade estavel na faixa; FieldName,
  // Expression e Description sao derivados do criterio tipado no momento em que
  // ele e aceito pelo conjunto.
  TQuickFilterCriterion = record
    Id: Integer;
    FieldName: string;
    Criterion: TFilterCriterion;
    Expression: string;
    Description: string;
  end;

  TMarkOperation = (moMarkAll, moUnmarkAll, moInvertAll, moToggle);

  // Especificacao neutra de ordenacao. A prioridade segue a ordem do array; o
  // adaptador do conjunto carregado traduz cada item para a ordenacao nativa.
  TQuerySortField = record
    FieldName: string;
    Ascending: Boolean;
  end;

  TQuerySortFields = TArray<TQuerySortField>;

  IQueryResultOperations = interface
    ['{76045AA4-FE97-4A2E-87CA-85077589168B}']
    procedure MarkAll();
    procedure UnmarkAll();
    procedure InverterAllMarks();
    procedure ToggleCurrentMark();
    function MarkingColumnName(): string;
    // Filtros rapidos sobre o mesmo conjunto ja carregado. Cada aceite e
    // combinado com os anteriores por AND e so substitui a lista apos o
    // conjunto aceitar o filtro.
    function AddQuickFilter(const AField: TField; out AId: Integer;
      out AMessage: string): Boolean;
    function AddQuickFilterCriterion(
      const ACriterion: TFilterCriterion; out AMessage: string): Boolean;
    function UpdateQuickFilter(AId: Integer;
      const ACriterion: TFilterCriterion; out AMessage: string): Boolean;
    function GetQuickFilterCriterion(AId: Integer;
      out ACriterion: TFilterCriterion): Boolean;
    function RemoveQuickFilter(AId: Integer): Boolean;
    procedure ClearQuickFilters();
    function QuickFilterCount(): Integer;
    function QuickFilterId(AIndex: Integer): Integer;
    function QuickFilterDescription(AId: Integer): string;
    function QuickFilterActive(): Boolean;
    // Ordena o conjunto informado pela ordenacao nativa, preservando os dados,
    // o filtro, as marcacoes e a linha corrente. A lista vazia remove a
    // ordenacao e devolve o conjunto a ordem padrao da consulta. A coluna de
    // marcacao nunca participa.
    function CanSortField(const ADataSet: TDataSet;
      const AFieldName: string): Boolean;
    function ApplySort(const ADataSet: TDataSet;
      const ASorts: TQuerySortFields): Boolean;
  end;

  TQueryResultOperations = class(TInterfacedObject, IQueryResultOperations)
  private
    FReader: IDataSetReader;
    FDataSetSorter: IDataSetSorter;
    FMarkingColumn: string;
    FQuickFilters: TList<TQuickFilterCriterion>;
    FNextQuickFilterId: Integer;
    FQuickFilterDataSet: TDataSet;
    procedure DoMarkOperation(AOperation: TMarkOperation);
    function BuildCriterionExpression(const AField: TField;
      const ACriterion: TFilterCriterion): string;
    function BuildCriterionDescription(const AField: TField;
      const ACriterion: TFilterCriterion): string;
    function TryValidateCriterion(const ACriterion: TFilterCriterion;
      out AField: TField; out AValueType: TFilterFieldType;
      out AMessage: string): Boolean;
    function AddQuickFilterCriterionInternal(
      const ACriterion: TFilterCriterion; out AId: Integer;
      out AMessage: string): Boolean;
    function BuildCombinedFilter(
      const ACriteria: TList<TQuickFilterCriterion>): string;
    function TryApplyFilter(const ADataSet: TDataSet;
      const AFilter: string): Boolean;
    procedure SyncQuickFilterDataSet();
    function FindQuickFilterIndex(AId: Integer): Integer;
    function GetQuickFilter(const AId: Integer;
      out ACriterion: TQuickFilterCriterion): Boolean;
    procedure ResetQuickFilterState();
  public
    constructor Create(AReader: IDataSetReader; const AMarkingColumn: string;
      const ADataSetSorter: IDataSetSorter = nil);
    destructor Destroy; override;
    procedure MarkAll();
    procedure UnmarkAll();
    procedure InverterAllMarks();
    procedure ToggleCurrentMark();
    function MarkingColumnName(): string;
    function AddQuickFilter(const AField: TField; out AId: Integer;
      out AMessage: string): Boolean;
    function AddQuickFilterCriterion(
      const ACriterion: TFilterCriterion; out AMessage: string): Boolean;
    function UpdateQuickFilter(AId: Integer;
      const ACriterion: TFilterCriterion; out AMessage: string): Boolean;
    function GetQuickFilterCriterion(AId: Integer;
      out ACriterion: TFilterCriterion): Boolean;
    function RemoveQuickFilter(AId: Integer): Boolean;
    procedure ClearQuickFilters();
    function QuickFilterCount(): Integer;
    function QuickFilterId(AIndex: Integer): Integer;
    function QuickFilterDescription(AId: Integer): string;
    function QuickFilterActive(): Boolean;
    function CanSortField(const ADataSet: TDataSet;
      const AFieldName: string): Boolean;
    function ApplySort(const ADataSet: TDataSet;
      const ASorts: TQuerySortFields): Boolean;
  end;

// Mapeia o tipo fisico do campo para o tipo tipado usado pelo catalogo de
// filtros. Tipos sem representacao propria usam texto, preservando o valor
// original para a validacao e a montagem do filtro.
function QuickFilterFieldTypeFor(const AField: TField): TFilterFieldType;

// Constroi o criterio de igualdade a partir do valor original do campo. A
// mesma regra atende o comando direto e o valor inicial do modal.
function TryBuildEqualityCriterion(const AField: TField;
  out ACriterion: TFilterCriterion): Boolean;

// Operadores que o filtro rapido executa para o tipo fisico do campo. Tipos
// sem suporte confirmado no motor carregado mantem apenas a igualdade.
function QuickFilterOperators(const AField: TField): TFilterOperatorSet;

// Criterio inicial usado quando a celula nao tem valor: o campo com o operador
// padrao do tipo ou o primeiro disponivel, sem valores.
function TryBuildDefaultQuickFilterCriterion(const AField: TField;
  out ACriterion: TFilterCriterion): Boolean;

implementation

uses
  System.SysUtils, System.DateUtils;

type
  // Valor original que nao pode ser comparado pelo filtro rapido. A inclusao
  // falha sem alterar os criterios ja aceitos.
  EQuickFilterValue = class(Exception);

const
  UnsupportedFilterValueMessage =
    'O valor da celula nao pode ser usado no filtro rapido.';
  UnsupportedFilterCriterionMessage =
    'O criterio informado nao pode ser aplicado ao conjunto.';
  QuickFilterNoDataSetMessage =
    'O conjunto de dados nao esta disponivel para o filtro rapido.';
  QuickFilterMissingFieldMessage = 'Campo de filtro nao informado.';
  QuickFilterUnknownFieldMessage =
    'O campo "%s" nao pertence ao conjunto atual.';
  QuickFilterNotAppliedMessage =
    'O conjunto nao aceitou o filtro informado. O filtro anterior foi mantido.';
  QuickFilterDuplicateMessage = 'Este filtro ja esta aplicado.';
  QuickFilterUpdateDuplicateMessage =
    'Ja existe outro filtro com estes valores.';
  QuickFilterWildcardMessage =
    'O filtro rapido nao consegue tratar "%" ou "_" como texto literal. ' +
    'Use outro criterio ou a pesquisa SQL.';
  QuickFilterBooleanMessage = 'Informe True ou False para o campo "%s".';
  QuickFilterTimeMessage =
    'Informe um horario valido (hh:nn:ss) para o campo "%s".';

function QuickFilterFieldTypeFor(const AField: TField): TFilterFieldType;
begin
  if AField = nil then
    Exit(fftString);

  case AField.DataType of
    ftSmallint, ftInteger, ftWord, ftAutoInc:
      Result := fftInteger;
    ftLargeint:
      Result := fftInt64;
    ftFloat, ftCurrency, ftBCD, ftExtended, ftSingle:
      Result := fftCurrency;
    ftDate:
      Result := fftDate;
    ftDateTime, ftTimeStamp:
      Result := fftDateTime;
  else
    Result := fftString;
  end;
end;

function QuickFilterOperators(const AField: TField): TFilterOperatorSet;
begin
  if AField = nil then
  begin
    Result := [foEquals];
    Exit;
  end;

  case AField.DataType of
    ftString, ftWideString:
      Result := [foEquals, foStartsWith, foContains, foEndsWith, foNotEquals,
        foIsEmpty, foNotEmpty, foIsNull, foNotNull];
    ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint,
    ftFloat, ftCurrency, ftBCD, ftExtended, ftSingle:
      Result := [foEquals, foNotEquals, foGreaterThan, foGreaterOrEqual,
        foLessThan, foLessOrEqual, foRange, foIsEmpty, foNotEmpty];
    ftDate, ftDateTime, ftTimeStamp:
      Result := [foEquals, foNotEquals, foGreaterThan, foGreaterOrEqual,
        foLessThan, foLessOrEqual, foRange, foIsEmpty, foNotEmpty];
  else
    // Memo, booleano, hora, tipos fixos, guid, bytes e demais: o motor local
    // so tem suporte confirmado para igualdade.
    Result := [foEquals];
  end;
end;

function TryBuildFieldValue(const AField: TField;
  out AValue: TFilterValue): Boolean;
var
  ValueType: TFilterFieldType;
begin
  Result := False;
  AValue := TFilterValue.Null;
  if (AField = nil) or AField.IsNull then
    Exit;

  ValueType := QuickFilterFieldTypeFor(AField);
  try
    case ValueType of
      fftString:
        begin
          if AField.DataType = ftBoolean then
            AValue := TFilterValue.FromString(BoolToStr(AField.AsBoolean, True))
          else if AField.DataType = ftTime then
            AValue := TFilterValue.FromString(FormatDateTime('hh:nn:ss',
              AField.AsDateTime, TFormatSettings.Invariant))
          else
            AValue := TFilterValue.FromString(AField.AsString);
        end;
      fftInteger:
        AValue := TFilterValue.FromInteger(AField.AsInteger);
      fftInt64:
        AValue := TFilterValue.FromInt64(AField.AsLargeInt);
      fftCurrency:
        AValue := TFilterValue.FromCurrency(AField.AsCurrency);
      fftDate:
        AValue := TFilterValue.FromDate(AField.AsDateTime);
      fftDateTime:
        AValue := TFilterValue.FromDateTime(AField.AsDateTime);
    else
      Exit;
    end;
  except
    // Conversoes do tipo fisico para o valor tipado nao devem interromper a
    // operacao; a celula apenas deixa de ser elegivel para o filtro rapido.
    Exit;
  end;

  Result := True;
end;

function TryBuildEqualityCriterion(const AField: TField;
  out ACriterion: TFilterCriterion): Boolean;
var
  Value: TFilterValue;
begin
  ACriterion := Default(TFilterCriterion);
  Result := TryBuildFieldValue(AField, Value);
  if not Result then
    Exit;

  ACriterion.FieldId := AField.FieldName;
  ACriterion.Operator := foEquals;
  SetLength(ACriterion.Values, 1);
  ACriterion.Values[0] := Value;
end;

function TryBuildDefaultQuickFilterCriterion(const AField: TField;
  out ACriterion: TFilterCriterion): Boolean;
var
  Operators: TFilterOperatorSet;
  Operator: TFilterOperator;
begin
  ACriterion := Default(TFilterCriterion);
  Result := False;
  if AField = nil then
    Exit;

  Operators := QuickFilterOperators(AField);
  Operator := FilterDefaultOperator(QuickFilterFieldTypeFor(AField));

  if not (Operator in Operators) then
    for Operator := Low(TFilterOperator) to High(TFilterOperator) do
      if Operator in Operators then
        Break;

  if not (Operator in Operators) then
    Exit;

  ACriterion.FieldId := AField.FieldName;
  ACriterion.Operator := Operator;
  ACriterion.Values := nil;
  Result := True;
end;

function QuickFilterIsTextType(const AField: TField): Boolean;
begin
  Result := (AField <> nil) and
    (AField.DataType in [ftString, ftWideString]);
end;

procedure CheckQuickFilterFragment(const AValue: string);
begin
  // O filtro local nao tem escape confirmado para '%' e '_'; sem isso eles
  // seriam interpretados como curinga. O criterio e recusado.
  if (Pos('%', AValue) > 0) or (Pos('_', AValue) > 0) then
    raise EQuickFilterValue.Create(QuickFilterWildcardMessage);
end;

function QuickFilterLiteral(const AField: TField;
  const AValue: TFilterValue): string;
var
  ParsedTime: TDateTime;
begin
  case AField.DataType of
    ftSmallint, ftInteger, ftWord, ftAutoInc:
      Result := IntToStr(AValue.IntegerValue);
    ftLargeint:
      Result := IntToStr(AValue.Int64Value);
    ftFloat, ftCurrency, ftBCD, ftExtended, ftSingle:
      Result := FormatFloat('0.################', AValue.CurrencyValue,
        TFormatSettings.Invariant);
    ftDate:
      Result := QuotedStr(FormatDateTime('yyyy-mm-dd', AValue.DateTimeValue,
        TFormatSettings.Invariant));
    ftDateTime, ftTimeStamp:
      Result := QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',
        AValue.DateTimeValue, TFormatSettings.Invariant));
    ftBoolean:
      if SameText(AValue.StringValue, 'True') or (AValue.StringValue = '1') then
        Result := 'True'
      else if SameText(AValue.StringValue, 'False') or
        (AValue.StringValue = '0') then
        Result := 'False'
      else
        raise EQuickFilterValue.Create(Format(QuickFilterBooleanMessage,
          [AField.FieldName]));
    ftTime:
      begin
        if not TryStrToTime(AValue.StringValue, ParsedTime,
          TFormatSettings.Invariant) then
          raise EQuickFilterValue.Create(Format(QuickFilterTimeMessage,
            [AField.FieldName]));
        Result := QuotedStr(FormatDateTime('hh:nn:ss', ParsedTime,
          TFormatSettings.Invariant));
      end;
  else
    Result := QuotedStr(AValue.StringValue);
  end;
end;

{ TQueryResultOperations }

constructor TQueryResultOperations.Create(AReader: IDataSetReader;
  const AMarkingColumn: string; const ADataSetSorter: IDataSetSorter);
begin
  FReader := AReader;
  FMarkingColumn := AMarkingColumn;
  FDataSetSorter := ADataSetSorter;
  FQuickFilters := TList<TQuickFilterCriterion>.Create;
  FNextQuickFilterId := 1;
end;

destructor TQueryResultOperations.Destroy;
begin
  FQuickFilters.Free;
  inherited;
end;

procedure TQueryResultOperations.DoMarkOperation(AOperation: TMarkOperation);
var
  fdMark: TField;
  dts: TDataSet;
  reNo: Integer;
begin
  dts := FReader.DataSet;
  fdMark := dts.FieldByName(FMarkingColumn);

  case AOperation of
    moMarkAll, moUnmarkAll, moInvertAll:
      begin
        // Com o filtro rapido ativo, First..Eof percorre apenas as linhas
        // visiveis; as linhas ocultas preservam a marcacao anterior.
        reNo := dts.RecNo;
        try
          dts.First;
          while not dts.Eof do
          begin
            dts.Edit;
            case AOperation of
              moMarkAll   : fdMark.AsBoolean :=  True;
              moUnmarkAll: fdMark.AsBoolean :=  False;
              moInvertAll: fdMark.AsBoolean :=  not fdMark.AsBoolean;
            end;
            dts.Post;
            dts.Next();
          end;
        finally
          dts.RecNo := reNo;
        end;
      end;

    moToggle:
      begin
        dts.Edit;
        fdMark.AsBoolean := not fdMark.AsBoolean;
        dts.Post;
      end;
  end;
end;

function TQueryResultOperations.BuildCombinedFilter(
  const ACriteria: TList<TQuickFilterCriterion>): string;
var
  I: Integer;
begin
  // Cada criterio fica entre parenteses para preservar a avaliacao de
  // igualdade e permitir a remocao sem reconstruir os demais.
  Result := '';
  for I := 0 to ACriteria.Count - 1 do
  begin
    if Result <> '' then
      Result := Result + ' and ';
    Result := Result + '(' + ACriteria[I].Expression + ')';
  end;
end;

function TQueryResultOperations.TryApplyFilter(const ADataSet: TDataSet;
  const AFilter: string): Boolean;
var
  PreviousFilter: string;
  PreviousFiltered: Boolean;
begin
  Result := False;
  if ADataSet = nil then
    Exit;

  PreviousFilter := ADataSet.Filter;
  PreviousFiltered := ADataSet.Filtered;
  try
    ADataSet.Filtered := False;
    ADataSet.Filter := AFilter;
    if AFilter <> '' then
      ADataSet.Filtered := True;
    Result := True;
  except
    // O conjunto nao aceitou o filtro: restaura exatamente o estado anterior
    // antes de o chamador decidir manter a lista ja aceita.
    try
      ADataSet.Filtered := False;
      ADataSet.Filter := PreviousFilter;
      ADataSet.Filtered := PreviousFiltered;
    except
      // A restauracao e a melhor possivel; a lista anterior continua valida.
    end;
    Result := False;
  end;
end;

procedure TQueryResultOperations.SyncQuickFilterDataSet;
var
  dts: TDataSet;
begin
  if FReader = nil then
    dts := nil
  else
    dts := FReader.DataSet;

  // Os criterios pertencem ao conjunto em que foram aceitos. Um conjunto
  // diferente comeca sem criterios locais e sem reaproveitar identificadores.
  if dts <> FQuickFilterDataSet then
  begin
    FQuickFilters.Clear;
    FNextQuickFilterId := 1;
    FQuickFilterDataSet := dts;
  end;
end;

function TQueryResultOperations.FindQuickFilterIndex(AId: Integer): Integer;
var
  I: Integer;
begin
  for I := 0 to FQuickFilters.Count - 1 do
    if FQuickFilters[I].Id = AId then
      Exit(I);
  Result := -1;
end;

function TQueryResultOperations.GetQuickFilter(const AId: Integer;
  out ACriterion: TQuickFilterCriterion): Boolean;
var
  Index: Integer;
begin
  Index := FindQuickFilterIndex(AId);
  Result := Index >= 0;
  if Result then
    ACriterion := FQuickFilters[Index]
  else
    ACriterion := Default(TQuickFilterCriterion);
end;

function TQueryResultOperations.TryValidateCriterion(
  const ACriterion: TFilterCriterion; out AField: TField;
  out AValueType: TFilterFieldType; out AMessage: string): Boolean;
var
  Definition: TFilterDefinition;
begin
  Result := False;
  AField := nil;
  AValueType := fftString;
  AMessage := '';

  if (FReader = nil) or (FReader.DataSet = nil) or
    (not FReader.DataSet.Active) then
  begin
    AMessage := QuickFilterNoDataSetMessage;
    Exit;
  end;

  if Trim(ACriterion.FieldId) = '' then
  begin
    AMessage := QuickFilterMissingFieldMessage;
    Exit;
  end;

  AField := FReader.DataSet.FindField(ACriterion.FieldId);
  if AField = nil then
  begin
    AMessage := Format(QuickFilterUnknownFieldMessage,
      [ACriterion.FieldId]);
    Exit;
  end;

  AValueType := QuickFilterFieldTypeFor(AField);

  // A definicao de um campo reproduz o conjunto efetivo do modal, permitindo
  // que a validacao comum decida operador, aridade, tipo, texto e ordem.
  Definition := FilterDefinitionOf([
    FilterField(AField.FieldName, AField.DisplayLabel, AValueType,
      QuickFilterOperators(AField))
  ], False);

  Result := ValidateFilterCriterion(ACriterion, Definition, fpLoadedDataSet,
    AMessage);
end;

function TQueryResultOperations.BuildCriterionExpression(const AField: TField;
  const ACriterion: TFilterCriterion): string;
var
  ValidatedField: TField;
  ValueType: TFilterFieldType;
  ValidationMessage: string;
  Fragment: string;
begin
  ValidatedField := AField;
  if not TryValidateCriterion(ACriterion, ValidatedField, ValueType,
    ValidationMessage) then
    raise EQuickFilterValue.Create(ValidationMessage);

  // A combinacao envolve cada expressao em parenteses; Vazio/Nao vazio ainda
  // levam parenteses proprios por conterem OR.
  case ACriterion.Operator of
    foEquals:
      Result := Format('%s = %s', [ACriterion.FieldId,
        QuickFilterLiteral(ValidatedField, ACriterion.Values[0])]);
    foNotEquals:
      Result := Format('%s <> %s', [ACriterion.FieldId,
        QuickFilterLiteral(ValidatedField, ACriterion.Values[0])]);
    foGreaterThan:
      Result := Format('%s > %s', [ACriterion.FieldId,
        QuickFilterLiteral(ValidatedField, ACriterion.Values[0])]);
    foGreaterOrEqual:
      Result := Format('%s >= %s', [ACriterion.FieldId,
        QuickFilterLiteral(ValidatedField, ACriterion.Values[0])]);
    foLessThan:
      Result := Format('%s < %s', [ACriterion.FieldId,
        QuickFilterLiteral(ValidatedField, ACriterion.Values[0])]);
    foLessOrEqual:
      Result := Format('%s <= %s', [ACriterion.FieldId,
        QuickFilterLiteral(ValidatedField, ACriterion.Values[0])]);
    foStartsWith, foContains, foEndsWith:
      begin
        Fragment := ACriterion.Values[0].StringValue;
        CheckQuickFilterFragment(Fragment);
        case ACriterion.Operator of
          foStartsWith:
            Fragment := Fragment + '%';
          foContains:
            Fragment := '%' + Fragment + '%';
        else
          Fragment := '%' + Fragment;
        end;
        Result := Format('%s like %s', [ACriterion.FieldId,
          QuotedStr(Fragment)]);
      end;
    foRange:
      if ValueType in [fftDate, fftDateTime] then
        Result := Format('%s >= %s and %s < %s', [
          ACriterion.FieldId,
          QuotedStr(FormatDateTime('yyyy-mm-dd',
            DateOf(ACriterion.Values[0].DateTimeValue),
            TFormatSettings.Invariant)),
          ACriterion.FieldId,
          QuotedStr(FormatDateTime('yyyy-mm-dd',
            DateOf(ACriterion.Values[1].DateTimeValue) + 1,
            TFormatSettings.Invariant))])
      else
        Result := Format('%s >= %s and %s <= %s', [
          ACriterion.FieldId,
          QuickFilterLiteral(ValidatedField, ACriterion.Values[0]),
          ACriterion.FieldId,
          QuickFilterLiteral(ValidatedField, ACriterion.Values[1])]);
    foIsEmpty:
      if QuickFilterIsTextType(ValidatedField) then
        Result := Format('(%s is null or %s = %s)', [
          ACriterion.FieldId, ACriterion.FieldId, QuotedStr('')])
      else
        Result := Format('%s is null', [ACriterion.FieldId]);
    foNotEmpty:
      if QuickFilterIsTextType(ValidatedField) then
        Result := Format('not (%s is null or %s = %s)', [
          ACriterion.FieldId, ACriterion.FieldId, QuotedStr('')])
      else
        Result := Format('%s is not null', [ACriterion.FieldId]);
    foIsNull:
      Result := Format('%s is null', [ACriterion.FieldId]);
    foNotNull:
      Result := Format('%s is not null', [ACriterion.FieldId]);
  else
    raise EQuickFilterValue.Create(UnsupportedFilterCriterionMessage);
  end;
end;

function TQueryResultOperations.BuildCriterionDescription(const AField: TField;
  const ACriterion: TFilterCriterion): string;
var
  ValidatedField: TField;
  ValueType: TFilterFieldType;
  ValidationMessage: string;
  CaptionText: string;
  OperatorText: string;
begin
  ValidatedField := AField;
  if not TryValidateCriterion(ACriterion, ValidatedField, ValueType,
    ValidationMessage) then
    raise EQuickFilterValue.Create(ValidationMessage);

  CaptionText := Trim(ValidatedField.DisplayLabel);
  if CaptionText = '' then
    CaptionText := ACriterion.FieldId;

  OperatorText := LowerCase(FilterOperatorLabel(ACriterion.Operator));

  // Aridade 0 nao exibe valor residual; Igualdade mantem a forma curta usada
  // pelo comando direto; as demais condicoes mostram rotulo e limites.
  case FilterOperatorArity(ACriterion.Operator) of
    0:
      Result := Format('%s %s', [CaptionText, OperatorText]);
    1:
      if ACriterion.Operator = foEquals then
        Result := Format('%s = %s', [CaptionText,
          ACriterion.Values[0].DisplayText])
      else
        Result := Format('%s %s %s', [CaptionText, OperatorText,
          ACriterion.Values[0].DisplayText]);
  else
    Result := Format('%s %s %s e %s', [CaptionText, OperatorText,
      ACriterion.Values[0].DisplayText, ACriterion.Values[1].DisplayText]);
  end;
end;

function TQueryResultOperations.AddQuickFilterCriterionInternal(
  const ACriterion: TFilterCriterion; out AId: Integer;
  out AMessage: string): Boolean;
var
  dts: TDataSet;
  Candidate: TList<TQuickFilterCriterion>;
  NewCriterion: TQuickFilterCriterion;
  NewFilter: string;
  NewDescription: string;
  DataField: TField;
  ValueType: TFilterFieldType;
  ValidationMessage: string;
  I: Integer;
begin
  Result := False;
  AId := 0;
  AMessage := '';

  SyncQuickFilterDataSet();
  if FReader = nil then
  begin
    AMessage := QuickFilterNoDataSetMessage;
    Exit;
  end;

  dts := FReader.DataSet;
  if (dts = nil) or (not dts.Active) then
  begin
    AMessage := QuickFilterNoDataSetMessage;
    Exit;
  end;

  // A expressao e a descricao sao validadas antes de alterar o conjunto. Uma
  // falha mantem os criterios anteriores ou a ausencia de filtro.
  try
    if not TryValidateCriterion(ACriterion, DataField, ValueType,
      ValidationMessage) then
      raise EQuickFilterValue.Create(ValidationMessage);

    NewFilter := BuildCriterionExpression(DataField, ACriterion);
    NewDescription := BuildCriterionDescription(DataField, ACriterion);
  except
    on E: EQuickFilterValue do
    begin
      AMessage := E.Message;
      Exit;
    end;
  end;

  // A duplicidade usa igualdade tipada, nao o texto exibido.
  for I := 0 to FQuickFilters.Count - 1 do
    if SameFilterCriterion(FQuickFilters[I].Criterion, ACriterion) then
    begin
      AMessage := QuickFilterDuplicateMessage;
      Exit;
    end;

  NewCriterion.Id := FNextQuickFilterId;
  NewCriterion.FieldName := ACriterion.FieldId;
  NewCriterion.Criterion := CloneFilterCriterion(ACriterion);
  NewCriterion.Expression := NewFilter;
  NewCriterion.Description := NewDescription;

  Candidate := TList<TQuickFilterCriterion>.Create;
  try
    for I := 0 to FQuickFilters.Count - 1 do
      Candidate.Add(FQuickFilters[I]);
    Candidate.Add(NewCriterion);

    // A lista candidata so substitui a atual depois de o conjunto aceitar o
    // filtro combinado. Marcacao e linha corrente nao sao alteradas.
    if not TryApplyFilter(dts, BuildCombinedFilter(Candidate)) then
    begin
      AMessage := QuickFilterNotAppliedMessage;
      Exit;
    end;

    FQuickFilters.Clear;
    for I := 0 to Candidate.Count - 1 do
      FQuickFilters.Add(Candidate[I]);
    Inc(FNextQuickFilterId);
    FQuickFilterDataSet := dts;
    AId := NewCriterion.Id;
    Result := True;
  finally
    Candidate.Free;
  end;
end;

function TQueryResultOperations.AddQuickFilter(const AField: TField;
  out AId: Integer; out AMessage: string): Boolean;
var
  Criterion: TFilterCriterion;
begin
  AId := 0;
  AMessage := '';
  if not TryBuildEqualityCriterion(AField, Criterion) then
  begin
    AMessage := UnsupportedFilterValueMessage;
    Exit(False);
  end;

  Result := AddQuickFilterCriterionInternal(Criterion, AId, AMessage);
end;

function TQueryResultOperations.AddQuickFilterCriterion(
  const ACriterion: TFilterCriterion; out AMessage: string): Boolean;
var
  AId: Integer;
begin
  Result := AddQuickFilterCriterionInternal(ACriterion, AId, AMessage);
end;

function TQueryResultOperations.UpdateQuickFilter(AId: Integer;
  const ACriterion: TFilterCriterion; out AMessage: string): Boolean;
var
  dts: TDataSet;
  Candidate: TList<TQuickFilterCriterion>;
  Updated: TQuickFilterCriterion;
  NewFilter: string;
  NewDescription: string;
  DataField: TField;
  ValueType: TFilterFieldType;
  ValidationMessage: string;
  Index: Integer;
  I: Integer;
begin
  Result := False;
  AMessage := '';
  SyncQuickFilterDataSet();
  if FReader = nil then
  begin
    AMessage := QuickFilterNoDataSetMessage;
    Exit;
  end;

  dts := FReader.DataSet;
  if (dts = nil) or (not dts.Active) then
  begin
    AMessage := QuickFilterNoDataSetMessage;
    Exit;
  end;

  Index := FindQuickFilterIndex(AId);
  if Index < 0 then
    Exit;

  // A alteracao constroi uma lista candidata na mesma posicao. Qualquer falha
  // preserva a lista e o filtro anteriores.
  try
    if not TryValidateCriterion(ACriterion, DataField, ValueType,
      ValidationMessage) then
      raise EQuickFilterValue.Create(ValidationMessage);

    NewFilter := BuildCriterionExpression(DataField, ACriterion);
    NewDescription := BuildCriterionDescription(DataField, ACriterion);
  except
    on E: EQuickFilterValue do
    begin
      AMessage := E.Message;
      Exit;
    end;
  end;

  // Duplicidade contra os demais criterios; o proprio id nao participa.
  for I := 0 to FQuickFilters.Count - 1 do
    if (FQuickFilters[I].Id <> AId) and
      SameFilterCriterion(FQuickFilters[I].Criterion, ACriterion) then
    begin
      AMessage := QuickFilterUpdateDuplicateMessage;
      Exit;
    end;

  Updated := FQuickFilters[Index];
  Updated.FieldName := ACriterion.FieldId;
  Updated.Criterion := CloneFilterCriterion(ACriterion);
  Updated.Expression := NewFilter;
  Updated.Description := NewDescription;

  Candidate := TList<TQuickFilterCriterion>.Create;
  try
    for I := 0 to FQuickFilters.Count - 1 do
      if I = Index then
        Candidate.Add(Updated)
      else
        Candidate.Add(FQuickFilters[I]);

    if not TryApplyFilter(dts, BuildCombinedFilter(Candidate)) then
    begin
      AMessage := QuickFilterNotAppliedMessage;
      Exit;
    end;

    FQuickFilters.Clear;
    for I := 0 to Candidate.Count - 1 do
      FQuickFilters.Add(Candidate[I]);
    FQuickFilterDataSet := dts;
    Result := True;
  finally
    Candidate.Free;
  end;
end;

function TQueryResultOperations.GetQuickFilterCriterion(AId: Integer;
  out ACriterion: TFilterCriterion): Boolean;
var
  Index: Integer;
begin
  SyncQuickFilterDataSet();
  Index := FindQuickFilterIndex(AId);
  Result := Index >= 0;
  if Result then
    ACriterion := CloneFilterCriterion(FQuickFilters[Index].Criterion)
  else
    ACriterion := Default(TFilterCriterion);
end;

function TQueryResultOperations.RemoveQuickFilter(AId: Integer): Boolean;
var
  dts: TDataSet;
  Candidate: TList<TQuickFilterCriterion>;
  I: Integer;
begin
  Result := False;
  SyncQuickFilterDataSet();
  if FReader = nil then
    Exit;

  dts := FReader.DataSet;
  if (dts = nil) or (not dts.Active) then
    Exit;

  if FindQuickFilterIndex(AId) < 0 then
    Exit;

  Candidate := TList<TQuickFilterCriterion>.Create;
  try
    for I := 0 to FQuickFilters.Count - 1 do
      if FQuickFilters[I].Id <> AId then
        Candidate.Add(FQuickFilters[I]);

    // Aplicar a lista restante sem aceite deixa intacta a lista e o filtro
    // anteriores.
    if not TryApplyFilter(dts, BuildCombinedFilter(Candidate)) then
      Exit;

    FQuickFilters.Clear;
    for I := 0 to Candidate.Count - 1 do
      FQuickFilters.Add(Candidate[I]);
    FQuickFilterDataSet := dts;
    if FQuickFilters.Count = 0 then
      FNextQuickFilterId := 1;
    Result := True;
  finally
    Candidate.Free;
  end;
end;

procedure TQueryResultOperations.ClearQuickFilters;
var
  dts: TDataSet;
begin
  SyncQuickFilterDataSet();
  if FReader = nil then
    dts := nil
  else
    dts := FReader.DataSet;

  if dts <> nil then
  begin
    dts.Filtered := False;
    dts.Filter := '';
  end;

  // Somente o filtro rapido e retirado; as marcacoes existentes permanecem.
  ResetQuickFilterState();
  FQuickFilterDataSet := dts;
end;

function TQueryResultOperations.QuickFilterCount(): Integer;
begin
  SyncQuickFilterDataSet();
  Result := FQuickFilters.Count;
end;

function TQueryResultOperations.QuickFilterId(AIndex: Integer): Integer;
begin
  SyncQuickFilterDataSet();
  if (AIndex < 0) or (AIndex >= FQuickFilters.Count) then
    Exit(0);
  Result := FQuickFilters[AIndex].Id;
end;

function TQueryResultOperations.QuickFilterDescription(AId: Integer): string;
var
  Criterion: TQuickFilterCriterion;
begin
  SyncQuickFilterDataSet();
  if GetQuickFilter(AId, Criterion) then
    Result := Criterion.Description
  else
    Result := '';
end;

function TQueryResultOperations.QuickFilterActive(): Boolean;
begin
  // O estado local so vale enquanto o conjunto atual for o mesmo em que os
  // criterios foram aceitos.
  SyncQuickFilterDataSet();
  Result := (FQuickFilters.Count > 0) and (FQuickFilterDataSet <> nil);
end;

procedure TQueryResultOperations.ResetQuickFilterState;
begin
  FQuickFilters.Clear;
  FNextQuickFilterId := 1;
  FQuickFilterDataSet := nil;
end;

procedure TQueryResultOperations.InverterAllMarks;
begin
  DoMarkOperation(moInvertAll);
end;

procedure TQueryResultOperations.MarkAll;
begin
  DoMarkOperation(moMarkAll);
end;

function TQueryResultOperations.MarkingColumnName: string;
begin
  Result := FMarkingColumn;
end;

function TQueryResultOperations.CanSortField(const ADataSet: TDataSet;
  const AFieldName: string): Boolean;
begin
  // A coluna de marcacao controla apenas os comandos de selecao e nunca e
  // elegivel para ordenacao, mesmo que o conjunto aceitasse o campo.
  if (FMarkingColumn <> '') and SameText(Trim(AFieldName), FMarkingColumn) then
    Exit(False);

  Result := (FDataSetSorter <> nil) and
    FDataSetSorter.CanSort(ADataSet, AFieldName);
end;

function TQueryResultOperations.ApplySort(const ADataSet: TDataSet;
  const ASorts: TQuerySortFields): Boolean;
var
  DataSetSorts: TDataSetSortFields;
  I: Integer;
begin
  for I := 0 to High(ASorts) do
    if (FMarkingColumn <> '') and
      SameText(Trim(ASorts[I].FieldName), FMarkingColumn) then
      Exit(False);

  if FDataSetSorter = nil then
    Exit(False);

  // A especificacao permanece neutra: a traducao para o formato do contrato de
  // ordenacao e a aplicacao nativa ficam atras de IDataSetSorter.
  SetLength(DataSetSorts, Length(ASorts));
  for I := 0 to High(ASorts) do
  begin
    DataSetSorts[I].FieldName := ASorts[I].FieldName;
    DataSetSorts[I].Ascending := ASorts[I].Ascending;
  end;

  Result := FDataSetSorter.ApplySort(ADataSet, DataSetSorts);
end;

procedure TQueryResultOperations.ToggleCurrentMark;
begin
  DoMarkOperation(moToggle);
end;

procedure TQueryResultOperations.UnmarkAll;
begin
  DoMarkOperation(moUnmarkAll);
end;

end.
