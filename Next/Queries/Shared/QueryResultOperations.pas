unit QueryResultOperations;

interface

uses
  Data.DB, IDataSetReaderUnit, System.Generics.Collections, FilterDefinition,
  FilterCriterion;

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
    function AddQuickFilter(const AField: TField; out AId: Integer): Boolean;
    function AddQuickFilterCriterion(
      const ACriterion: TFilterCriterion): Boolean;
    function UpdateQuickFilter(AId: Integer;
      const ACriterion: TFilterCriterion): Boolean;
    function GetQuickFilterCriterion(AId: Integer;
      out ACriterion: TFilterCriterion): Boolean;
    function RemoveQuickFilter(AId: Integer): Boolean;
    procedure ClearQuickFilters();
    function QuickFilterCount(): Integer;
    function QuickFilterId(AIndex: Integer): Integer;
    function QuickFilterDescription(AId: Integer): string;
    function QuickFilterActive(): Boolean;
  end;

  TQueryResultOperations = class(TInterfacedObject, IQueryResultOperations)
  private
    FReader: IDataSetReader;
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
      out AField: TField; out AValueType: TFilterFieldType): Boolean;
    function AddQuickFilterCriterionInternal(
      const ACriterion: TFilterCriterion; out AId: Integer): Boolean;
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
    constructor Create(AReader: IDataSetReader; const AMarkingColumn: string);
    destructor Destroy; override;
    procedure MarkAll();
    procedure UnmarkAll();
    procedure InverterAllMarks();
    procedure ToggleCurrentMark();
    function MarkingColumnName(): string;
    function AddQuickFilter(const AField: TField; out AId: Integer): Boolean;
    function AddQuickFilterCriterion(
      const ACriterion: TFilterCriterion): Boolean;
    function UpdateQuickFilter(AId: Integer;
      const ACriterion: TFilterCriterion): Boolean;
    function GetQuickFilterCriterion(AId: Integer;
      out ACriterion: TFilterCriterion): Boolean;
    function RemoveQuickFilter(AId: Integer): Boolean;
    procedure ClearQuickFilters();
    function QuickFilterCount(): Integer;
    function QuickFilterId(AIndex: Integer): Integer;
    function QuickFilterDescription(AId: Integer): string;
    function QuickFilterActive(): Boolean;
  end;

// Mapeia o tipo fisico do campo para o tipo tipado usado pelo catalogo de
// filtros. Tipos sem representacao propria usam texto, preservando o valor
// original para a validacao e a montagem do filtro.
function QuickFilterFieldTypeFor(const AField: TField): TFilterFieldType;

// Constroi o criterio de igualdade a partir do valor original do campo. A
// mesma regra atende o comando direto e o valor inicial do modal.
function TryBuildEqualityCriterion(const AField: TField;
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

function QuickFilterLiteral(const AField: TField;
  const AValue: TFilterValue): string;
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
        raise EQuickFilterValue.Create(UnsupportedFilterValueMessage);
    ftTime:
      Result := QuotedStr(AValue.StringValue);
  else
    Result := QuotedStr(AValue.StringValue);
  end;
end;

{ TQueryResultOperations }

constructor TQueryResultOperations.Create(AReader: IDataSetReader;
  const AMarkingColumn: string);
begin
  FReader := AReader;
  FMarkingColumn := AMarkingColumn;
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
  out AValueType: TFilterFieldType): Boolean;
var
  StartDate: TDateTime;
  EndDate: TDateTime;
begin
  Result := False;
  AField := nil;
  AValueType := fftString;

  if (FReader = nil) or (FReader.DataSet = nil) or
    (not FReader.DataSet.Active) then
    Exit;

  if Trim(ACriterion.FieldId) = '' then
    Exit;

  AField := FReader.DataSet.FindField(ACriterion.FieldId);
  if AField = nil then
    Exit;

  AValueType := QuickFilterFieldTypeFor(AField);
  case ACriterion.Operator of
    foEquals:
      begin
        if Length(ACriterion.Values) <> 1 then
          Exit;
        if not FilterValueMatchesFieldType(ACriterion.Values[0],
          AValueType) then
          Exit;
      end;
    foRange:
      begin
        if not (AValueType in [fftDate, fftDateTime]) then
          Exit;
        if Length(ACriterion.Values) <> 2 then
          Exit;
        if not FilterValueMatchesFieldType(ACriterion.Values[0],
          AValueType) then
          Exit;
        if not FilterValueMatchesFieldType(ACriterion.Values[1],
          AValueType) then
          Exit;

        StartDate := DateOf(ACriterion.Values[0].DateTimeValue);
        EndDate := DateOf(ACriterion.Values[1].DateTimeValue);
        if StartDate > EndDate then
          Exit;
      end;
  else
    Exit;
  end;

  Result := True;
end;

function TQueryResultOperations.BuildCriterionExpression(const AField: TField;
  const ACriterion: TFilterCriterion): string;
var
  ValidatedField: TField;
  ValueType: TFilterFieldType;
  StartDate: TDateTime;
  EndDate: TDateTime;
begin
  ValidatedField := AField;
  if not TryValidateCriterion(ACriterion, ValidatedField, ValueType) then
    raise EQuickFilterValue.Create(UnsupportedFilterCriterionMessage);

  case ACriterion.Operator of
    foEquals:
      Result := Format('%s = %s', [ACriterion.FieldId,
        QuickFilterLiteral(ValidatedField, ACriterion.Values[0])]);
    foRange:
      begin
        StartDate := DateOf(ACriterion.Values[0].DateTimeValue);
        EndDate := DateOf(ACriterion.Values[1].DateTimeValue) + 1;
        Result := Format('%s >= %s and %s < %s', [
          ACriterion.FieldId,
          QuotedStr(FormatDateTime('yyyy-mm-dd', StartDate,
            TFormatSettings.Invariant)),
          ACriterion.FieldId,
          QuotedStr(FormatDateTime('yyyy-mm-dd', EndDate,
            TFormatSettings.Invariant))]);
      end;
  else
    raise EQuickFilterValue.Create(UnsupportedFilterCriterionMessage);
  end;
end;

function TQueryResultOperations.BuildCriterionDescription(const AField: TField;
  const ACriterion: TFilterCriterion): string;
var
  ValidatedField: TField;
  ValueType: TFilterFieldType;
  CaptionText: string;
  ValueText: string;
  I: Integer;
begin
  ValidatedField := AField;
  if not TryValidateCriterion(ACriterion, ValidatedField, ValueType) then
    raise EQuickFilterValue.Create(UnsupportedFilterCriterionMessage);

  CaptionText := Trim(ValidatedField.DisplayLabel);
  if CaptionText = '' then
    CaptionText := ACriterion.FieldId;

  ValueText := '';
  for I := 0 to High(ACriterion.Values) do
  begin
    if I > 0 then
      ValueText := ValueText + ' e ';
    ValueText := ValueText + ACriterion.Values[I].DisplayText;
  end;

  // Igualdade mantem a descricao curta usada pelo comando direto; o intervalo
  // explicita a condicao e os dois limites.
  if ACriterion.Operator = foEquals then
    Result := Format('%s = %s', [CaptionText, ValueText])
  else
    Result := Format('%s %s %s', [CaptionText,
      LowerCase(FilterOperatorLabel(ACriterion.Operator)), ValueText]);
end;

function TQueryResultOperations.AddQuickFilterCriterionInternal(
  const ACriterion: TFilterCriterion; out AId: Integer): Boolean;
var
  dts: TDataSet;
  Candidate: TList<TQuickFilterCriterion>;
  NewCriterion: TQuickFilterCriterion;
  NewFilter: string;
  NewDescription: string;
  DataField: TField;
  ValueType: TFilterFieldType;
  I: Integer;
begin
  Result := False;
  AId := 0;

  SyncQuickFilterDataSet();
  if FReader = nil then
    Exit;

  dts := FReader.DataSet;
  if (dts = nil) or (not dts.Active) then
    Exit;

  // A expressao e a descricao sao validadas antes de alterar o conjunto. Uma
  // falha mantem os criterios anteriores ou a ausencia de filtro.
  try
    if not TryValidateCriterion(ACriterion, DataField, ValueType) then
      raise EQuickFilterValue.Create(UnsupportedFilterCriterionMessage);

    NewFilter := BuildCriterionExpression(DataField, ACriterion);
    NewDescription := BuildCriterionDescription(DataField, ACriterion);
  except
    on E: EQuickFilterValue do
      Exit;
  end;

  // A duplicidade usa igualdade tipada, nao o texto exibido.
  for I := 0 to FQuickFilters.Count - 1 do
    if SameFilterCriterion(FQuickFilters[I].Criterion, ACriterion) then
      Exit;

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
      Exit;

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
  out AId: Integer): Boolean;
var
  Criterion: TFilterCriterion;
begin
  AId := 0;
  if not TryBuildEqualityCriterion(AField, Criterion) then
    Exit(False);

  Result := AddQuickFilterCriterionInternal(Criterion, AId);
end;

function TQueryResultOperations.AddQuickFilterCriterion(
  const ACriterion: TFilterCriterion): Boolean;
var
  AId: Integer;
begin
  Result := AddQuickFilterCriterionInternal(ACriterion, AId);
end;

function TQueryResultOperations.UpdateQuickFilter(AId: Integer;
  const ACriterion: TFilterCriterion): Boolean;
var
  dts: TDataSet;
  Candidate: TList<TQuickFilterCriterion>;
  Updated: TQuickFilterCriterion;
  NewFilter: string;
  NewDescription: string;
  DataField: TField;
  ValueType: TFilterFieldType;
  Index: Integer;
  I: Integer;
begin
  Result := False;
  SyncQuickFilterDataSet();
  if FReader = nil then
    Exit;

  dts := FReader.DataSet;
  if (dts = nil) or (not dts.Active) then
    Exit;

  Index := FindQuickFilterIndex(AId);
  if Index < 0 then
    Exit;

  // A alteracao constroi uma lista candidata na mesma posicao. Qualquer falha
  // preserva a lista e o filtro anteriores.
  try
    if not TryValidateCriterion(ACriterion, DataField, ValueType) then
      raise EQuickFilterValue.Create(UnsupportedFilterCriterionMessage);

    NewFilter := BuildCriterionExpression(DataField, ACriterion);
    NewDescription := BuildCriterionDescription(DataField, ACriterion);
  except
    on E: EQuickFilterValue do
      Exit;
  end;

  // Duplicidade contra os demais criterios; o proprio id nao participa.
  for I := 0 to FQuickFilters.Count - 1 do
    if (FQuickFilters[I].Id <> AId) and
      SameFilterCriterion(FQuickFilters[I].Criterion, ACriterion) then
      Exit;

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
      Exit;

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

procedure TQueryResultOperations.ToggleCurrentMark;
begin
  DoMarkOperation(moToggle);
end;

procedure TQueryResultOperations.UnmarkAll;
begin
  DoMarkOperation(moUnmarkAll);
end;

end.
