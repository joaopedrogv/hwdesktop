unit QueryResultOperations;

interface

uses
  Data.DB, IDataSetReaderUnit, System.Generics.Collections;

type
  // Criterio de igualdade do filtro rapido. A lista mantem a ordem de inclusao
  // para que a faixa e a expressao combinada permanecam previsiveis.
  TQuickFilterCriterion = record
    Id: Integer;
    FieldName: string;
    Expression: string;
    Description: string;
  end;

  IQueryResultOperations = interface
    ['{76045AA4-FE97-4A2E-87CA-85077589168B}']
    procedure MarkAll();
    procedure UnmarkAll();
    procedure InverterAllMarks();
    procedure ToggleCurrentMark();
    function MarkingColumnName(): string;
    // Filtros rapidos de igualdade sobre o mesmo conjunto ja carregado. Cada
    // inclusao e combinada com as anteriores por AND.
    function AddQuickFilter(const AField: TField; out AId: Integer): Boolean;
    function RemoveQuickFilter(AId: Integer): Boolean;
    procedure ClearQuickFilters();
    function QuickFilterCount(): Integer;
    function QuickFilterId(AIndex: Integer): Integer;
    function QuickFilterDescription(AId: Integer): string;
    function QuickFilterActive(): Boolean;
  end;

  TMarkOperation = (moMarkAll, moUnmarkAll, moInvertAll, moToggle);

  TQueryResultOperations = class(TInterfacedObject, IQueryResultOperations)
  private
    FReader: IDataSetReader;
    FMarkingColumn: string;
    FQuickFilters: TList<TQuickFilterCriterion>;
    FNextQuickFilterId: Integer;
    FQuickFilterDataSet: TDataSet;
    procedure DoMarkOperation(AOperation: TMarkOperation);
    function BuildQuickFilterExpression(const AField: TField): string;
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
    function RemoveQuickFilter(AId: Integer): Boolean;
    procedure ClearQuickFilters();
    function QuickFilterCount(): Integer;
    function QuickFilterId(AIndex: Integer): Integer;
    function QuickFilterDescription(AId: Integer): string;
    function QuickFilterActive(): Boolean;
  end;

implementation

uses
  System.SysUtils;

type
  // Valor original que nao pode ser comparado pelo filtro rapido. A inclusao
  // falha sem alterar os criterios ja aceitos.
  EQuickFilterValue = class(Exception);

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
    ACriterion := FQuickFilters[Index];
end;

function TQueryResultOperations.AddQuickFilter(const AField: TField;
  out AId: Integer): Boolean;
var
  dts: TDataSet;
  Candidate: TList<TQuickFilterCriterion>;
  NewCriterion: TQuickFilterCriterion;
  NewFilter: string;
  I: Integer;
begin
  Result := False;
  AId := 0;

  if AField = nil then
    Exit;

  SyncQuickFilterDataSet();
  if FReader = nil then
    Exit;

  dts := FReader.DataSet;
  if (dts = nil) or (not dts.Active) then
    Exit;

  // A expressao e validada antes de alterar o conjunto. Uma falha mantem os
  // criterios anteriores ou a ausencia de filtro.
  try
    NewFilter := BuildQuickFilterExpression(AField);
  except
    on E: EQuickFilterValue do
      Exit;
  end;

  NewCriterion.Id := FNextQuickFilterId;
  NewCriterion.FieldName := AField.FieldName;
  NewCriterion.Expression := NewFilter;
  NewCriterion.Description := Format('%s = %s',
    [AField.DisplayLabel, AField.DisplayText]);

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

function TQueryResultOperations.BuildQuickFilterExpression(
  const AField: TField): string;
var
  Value: string;
begin
  // O criterio usa o valor original do campo, nunca o texto de apresentacao.
  if AField.IsNull then
    raise EQuickFilterValue.Create(
      'O valor da celula esta vazio e nao pode ser filtrado.');

  case AField.DataType of
    ftString, ftWideString, ftFixedChar, ftFixedWideChar, ftMemo, ftWideMemo:
      Value := QuotedStr(AField.AsString);
    ftSmallint, ftInteger, ftWord, ftLargeint:
      Value := IntToStr(AField.AsLargeInt);
    ftFloat, ftCurrency:
      Value := FormatFloat('0.################', AField.AsFloat,
        TFormatSettings.Invariant);
    ftDate:
      Value := QuotedStr(FormatDateTime('yyyy-mm-dd', AField.AsDateTime,
        TFormatSettings.Invariant));
    ftTime:
      Value := QuotedStr(FormatDateTime('hh:nn:ss', AField.AsDateTime,
        TFormatSettings.Invariant));
    ftDateTime:
      Value := QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',
        AField.AsDateTime, TFormatSettings.Invariant));
    ftBoolean:
      if AField.AsBoolean then
        Value := 'True'
      else
        Value := 'False';
  else
    raise EQuickFilterValue.Create(
      'O tipo do campo nao e suportado pelo filtro rapido.');
  end;

  Result := Format('%s = %s', [AField.FieldName, Value]);
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
