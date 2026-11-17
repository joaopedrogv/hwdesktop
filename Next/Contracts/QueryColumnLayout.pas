unit QueryColumnLayout;

interface

uses
  GridColumnDefinition, ColumnLayoutPreferences;

type
  // Coluna pronta para criacao na grade: metadados da definicao, largura ja
  // resolvida (preferencia quando positiva) e visibilidade efetiva da abertura.
  TQueryColumnLayoutItem = record
    Definition: TGridColumnDefinition;
    Visible: Boolean;
  end;

  // Plano na ordem visual final. A grade cria os TColumn nesta ordem, sem
  // reordenar depois.
  TQueryColumnLayout = TArray<TQueryColumnLayoutItem>;

// Verdadeiro para a coluna que o usuario pode alterar e que pode ser gravada.
// A coluna de marcacao e as colunas de visibilidade fixa nao participam.
function QueryColumnPersistable(const AColumn: TGridColumnDefinition;
  const AMarkingFieldName: string): Boolean;

// Verdadeiro quando a definicao oferece ao menos uma coluna persistivel.
function QueryColumnLayoutAvailable(const ADefinitions: TGridColumnDefinitions;
  const AMarkingFieldName: string): Boolean;

// Cruza as preferencias salvas com as colunas padrao. Entradas desconhecidas,
// duplicadas ou de colunas nao persistiveis sao ignoradas; colunas ausentes do
// layout entram ao final na ordem da definicao; colunas nao persistiveis mantem
// posicao, visibilidade e largura da definicao.
function ResolveQueryColumnLayout(const ADefinitions: TGridColumnDefinitions;
  const AEntries: TColumnLayoutEntries;
  const AMarkingFieldName: string): TQueryColumnLayout;

implementation

uses
  System.SysUtils;

function FindDefinitionIndex(const ADefinitions: TGridColumnDefinitions;
  const AFieldName: string): Integer;
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

function FindEntryIndex(const AEntries: TColumnLayoutEntries;
  const AFieldName: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to High(AEntries) do
    if SameText(AEntries[I].FieldName, AFieldName) then
      Exit(I);
end;

function SortColumnLayoutEntries(const AEntries: TColumnLayoutEntries):
  TColumnLayoutEntries;
var
  I: Integer;
  J: Integer;
  Current: TColumnLayoutEntry;
begin
  Result := Copy(AEntries);
  // O nome do campo desempata para o resultado nao depender da ordem devolvida
  // pelo repositorio.
  for I := 1 to High(Result) do
  begin
    Current := Result[I];
    J := I - 1;
    while (J >= 0) and
      ((Result[J].Order > Current.Order) or
       ((Result[J].Order = Current.Order) and
        (CompareStr(Result[J].FieldName, Current.FieldName) > 0))) do
    begin
      Result[J + 1] := Result[J];
      Dec(J);
    end;
    Result[J + 1] := Current;
  end;
end;

function QueryColumnPersistable(const AColumn: TGridColumnDefinition;
  const AMarkingFieldName: string): Boolean;
begin
  Result := GridColumnConfigurable(AColumn.Behavior) and
    ((AMarkingFieldName = '') or
     (not SameText(AColumn.FieldName, AMarkingFieldName)));
end;

function QueryColumnLayoutAvailable(const ADefinitions: TGridColumnDefinitions;
  const AMarkingFieldName: string): Boolean;
var
  I: Integer;
begin
  for I := 0 to High(ADefinitions) do
    if QueryColumnPersistable(ADefinitions[I], AMarkingFieldName) then
      Exit(True);
  Result := False;
end;

function ResolveVisibility(const AColumn: TGridColumnDefinition;
  const AEntries: TColumnLayoutEntries;
  const AMarkingFieldName: string): Boolean;
var
  EntryIndex: Integer;
begin
  // A marcacao permanece visivel mesmo que a definicao declare outro
  // comportamento.
  if (AMarkingFieldName <> '') and
    SameText(AColumn.FieldName, AMarkingFieldName) then
    Exit(True);

  // Sempre visivel/oculta continuam derivadas apenas do comportamento.
  if not GridColumnConfigurable(AColumn.Behavior) then
    Exit(GridColumnVisibleByDefault(AColumn.Behavior));

  EntryIndex := FindEntryIndex(AEntries, AColumn.FieldName);
  if EntryIndex < 0 then
    Result := GridColumnVisibleByDefault(AColumn.Behavior)
  else
    Result := AEntries[EntryIndex].Visible;
end;

function ResolveQueryColumnLayout(const ADefinitions: TGridColumnDefinitions;
  const AEntries: TColumnLayoutEntries;
  const AMarkingFieldName: string): TQueryColumnLayout;
var
  Sorted: TColumnLayoutEntries;
  Used: TArray<Boolean>;
  PersistableOrder: TArray<Integer>;
  FinalOrder: TArray<Integer>;
  EntryIndex: Integer;
  DefinitionIndex: Integer;
  Count: Integer;
  I: Integer;
  Item: TQueryColumnLayoutItem;
begin
  Sorted := SortColumnLayoutEntries(AEntries);
  SetLength(Used, Length(ADefinitions));
  SetLength(PersistableOrder, 0);
  Count := 0;

  // 1. Ordem salva: somente colunas ainda oferecidas e persistiveis. Entradas
  // desconhecidas, de visibilidade fixa, de marcacao ou duplicadas sao ignoradas
  // sem apagar a preferencia gravada.
  for I := 0 to High(Sorted) do
  begin
    DefinitionIndex := FindDefinitionIndex(ADefinitions, Sorted[I].FieldName);
    if DefinitionIndex < 0 then
      Continue;
    if not QueryColumnPersistable(ADefinitions[DefinitionIndex],
      AMarkingFieldName) then
      Continue;
    if Used[DefinitionIndex] then
      Continue;

    Used[DefinitionIndex] := True;
    SetLength(PersistableOrder, Count + 1);
    PersistableOrder[Count] := DefinitionIndex;
    Inc(Count);
  end;

  // 2. Colunas persistiveis ausentes do layout completam a sequencia na ordem
  // da definicao.
  for I := 0 to High(ADefinitions) do
  begin
    if Used[I] then
      Continue;
    if not QueryColumnPersistable(ADefinitions[I], AMarkingFieldName) then
      Continue;

    SetLength(PersistableOrder, Count + 1);
    PersistableOrder[Count] := I;
    Inc(Count);
  end;

  // 3. Somente os slots persistiveis recebem a sequencia; as colunas fixas e a
  // marcacao mantem a posicao da definicao.
  SetLength(FinalOrder, Length(ADefinitions));
  Count := 0;
  for I := 0 to High(ADefinitions) do
    if QueryColumnPersistable(ADefinitions[I], AMarkingFieldName) then
    begin
      FinalOrder[I] := PersistableOrder[Count];
      Inc(Count);
    end
    else
      FinalOrder[I] := I;

  // 4. Plano resolvido na ordem final.
  SetLength(Result, Length(ADefinitions));
  for I := 0 to High(FinalOrder) do
  begin
    Item.Definition := ADefinitions[FinalOrder[I]];
    Item.Visible := ResolveVisibility(Item.Definition, Sorted,
      AMarkingFieldName);

    EntryIndex := FindEntryIndex(Sorted, Item.Definition.FieldName);
    if QueryColumnPersistable(Item.Definition, AMarkingFieldName) and
      (EntryIndex >= 0) and (Sorted[EntryIndex].Width > 0) then
      Item.Definition.Width := Sorted[EntryIndex].Width;

    Result[I] := Item;
  end;
end;

end.
