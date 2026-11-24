unit DatasetColumnLayout;

interface

uses
  GridColumnDefinition, ColumnLayoutPreferences;

type
  // Coluna pronta para criacao na grade: metadados, largura ja resolvida (preferencia quando positiva) e visibilidade
  // efetiva da abertura.
  TDatasetColumnLayoutItem = record
    Definition: TGridColumnDefinition;
    Visible: Boolean;
  end;

  // Plano na ordem visual final. A grade cria os TColumn nesta ordem, sem reordenar depois.
  TDatasetColumnLayout = TArray<TDatasetColumnLayoutItem>;

// Verdadeiro para a coluna cuja ordem e largura participam da preferencia gravada: as configuraveis e as sempre
// visiveis, que mantem a visibilidade forcada. A marcacao e as sempre ocultas nao participam.
function DatasetColumnPersistable(const AColumn: TGridColumnDefinition; const AMarkingFieldName: string): Boolean;

function DatasetColumnLayoutAvailable(const ADefinitions: TGridColumnDefinitions;
  const AMarkingFieldName: string): Boolean;

// Cruza as preferencias salvas com as colunas padrao. Entradas desconhecidas, duplicadas ou de colunas que nao
// participam sao ignoradas. Colunas configuraveis ausentes entram ao final; a sempre visivel ausente mantem a posicao
// da definicao para preservar layouts gravados antes de ela participar.
function ResolveDatasetColumnLayout(const ADefinitions: TGridColumnDefinitions; const AEntries: TColumnLayoutEntries;
  const AMarkingFieldName: string): TDatasetColumnLayout;

implementation

uses
  System.SysUtils;

function FindDefinitionIndex(const ADefinitions: TGridColumnDefinitions; const AFieldName: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  if AFieldName = '' then
    Exit;
  for I := 0 to High(ADefinitions) do
    if SameText(ADefinitions[I].FieldName, AFieldName) then
      Exit(I);
end;

function FindEntryIndex(const AEntries: TColumnLayoutEntries; const AFieldName: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to High(AEntries) do
    if SameText(AEntries[I].FieldName, AFieldName) then
      Exit(I);
end;

function SortColumnLayoutEntries(const AEntries: TColumnLayoutEntries): TColumnLayoutEntries;
var
  I: Integer;
  J: Integer;
  Current: TColumnLayoutEntry;
begin
  Result := Copy(AEntries);
  // O nome do campo desempata para o resultado nao depender da ordem devolvida pelo repositorio.
  for I := 1 to High(Result) do
  begin
    Current := Result[I];
    J := I - 1;
    while (J >= 0) and ((Result[J].Order > Current.Order) or
         ((Result[J].Order = Current.Order) and (CompareStr(Result[J].FieldName, Current.FieldName) > 0))) do
    begin
      Result[J + 1] := Result[J];
      Dec(J);
    end;
    Result[J + 1] := Current;
  end;
end;

function ColumnFollowsSavedOrder(const AColumn: TGridColumnDefinition;
  const AMarkingFieldName: string; const AHasSavedEntry: Boolean): Boolean;
begin
  Result := DatasetColumnPersistable(AColumn, AMarkingFieldName) and
    (AHasSavedEntry or GridColumnConfigurable(AColumn.Behavior));
end;

function DatasetColumnPersistable(const AColumn: TGridColumnDefinition; const AMarkingFieldName: string): Boolean;
begin
  if (AMarkingFieldName <> '') and SameText(AColumn.FieldName, AMarkingFieldName) then
    Exit(False);

  Result := GridColumnConfigurable(AColumn.Behavior) or (AColumn.Behavior = gcbAlwaysVisible);
end;

function DatasetColumnLayoutAvailable(const ADefinitions: TGridColumnDefinitions;
  const AMarkingFieldName: string): Boolean;
var
  I: Integer;
begin
  for I := 0 to High(ADefinitions) do
    if DatasetColumnPersistable(ADefinitions[I], AMarkingFieldName) then
      Exit(True);
  Result := False;
end;

function ResolveVisibility(const AColumn: TGridColumnDefinition; const AEntries: TColumnLayoutEntries;
  const AMarkingFieldName: string): Boolean;
var
  EntryIndex: Integer;
begin
  // A marcacao permanece visivel mesmo que a definicao declare outro comportamento.
  if (AMarkingFieldName <> '') and SameText(AColumn.FieldName, AMarkingFieldName) then
    Exit(True);

  if not GridColumnConfigurable(AColumn.Behavior) then
    Exit(GridColumnVisibleByDefault(AColumn.Behavior));

  EntryIndex := FindEntryIndex(AEntries, AColumn.FieldName);
  if EntryIndex < 0 then
    Result := GridColumnVisibleByDefault(AColumn.Behavior)
  else
    Result := AEntries[EntryIndex].Visible;
end;

function ResolveDatasetColumnLayout(const ADefinitions: TGridColumnDefinitions; const AEntries: TColumnLayoutEntries;
  const AMarkingFieldName: string): TDatasetColumnLayout;
var
  Sorted: TColumnLayoutEntries;
  HasEntry: TArray<Boolean>;
  OrderSequence: TArray<Integer>;
  FinalOrder: TArray<Integer>;
  EntryIndex: Integer;
  DefinitionIndex: Integer;
  Count: Integer;
  I: Integer;
  Item: TDatasetColumnLayoutItem;
begin
  Sorted := SortColumnLayoutEntries(AEntries);
  SetLength(HasEntry, Length(ADefinitions));
  SetLength(OrderSequence, 0);
  Count := 0;

  // A ordem salva vale para toda coluna ainda oferecida que participa da ordem e da largura; entradas desconhecidas ou
  // duplicadas sao ignoradas.
  for I := 0 to High(Sorted) do
  begin
    DefinitionIndex := FindDefinitionIndex(ADefinitions, Sorted[I].FieldName);
    if DefinitionIndex < 0 then
      Continue;
    if not DatasetColumnPersistable(ADefinitions[DefinitionIndex], AMarkingFieldName) then
      Continue;
    if HasEntry[DefinitionIndex] then
      Continue;

    HasEntry[DefinitionIndex] := True;
    SetLength(OrderSequence, Count + 1);
    OrderSequence[Count] := DefinitionIndex;
    Inc(Count);
  end;

  // Colunas configuraveis ausentes completam a sequencia; a sempre visivel ausente nao entra, para nao deslocar um
  // layout gravado antes de ela participar.
  for I := 0 to High(ADefinitions) do
  begin
    if HasEntry[I] then
      Continue;
    if not ColumnFollowsSavedOrder(ADefinitions[I], AMarkingFieldName, False) then
      Continue;

    SetLength(OrderSequence, Count + 1);
    OrderSequence[Count] := I;
    Inc(Count);
  end;

  // Cada slot recebe a sequencia apenas quando a coluna consome a ordem gravada; as demais mantem o indice da
  // definicao.
  SetLength(FinalOrder, Length(ADefinitions));
  Count := 0;
  for I := 0 to High(ADefinitions) do
    if ColumnFollowsSavedOrder(ADefinitions[I], AMarkingFieldName, HasEntry[I]) then
    begin
      FinalOrder[I] := OrderSequence[Count];
      Inc(Count);
    end
    else
      FinalOrder[I] := I;

  SetLength(Result, Length(ADefinitions));
  for I := 0 to High(FinalOrder) do
  begin
    Item.Definition := ADefinitions[FinalOrder[I]];
    Item.Visible := ResolveVisibility(Item.Definition, Sorted, AMarkingFieldName);

    EntryIndex := FindEntryIndex(Sorted, Item.Definition.FieldName);
    if DatasetColumnPersistable(Item.Definition, AMarkingFieldName) and
      (EntryIndex >= 0) and (Sorted[EntryIndex].Width > 0) then
      Item.Definition.Width := Sorted[EntryIndex].Width;

    Result[I] := Item;
  end;
end;

end.
