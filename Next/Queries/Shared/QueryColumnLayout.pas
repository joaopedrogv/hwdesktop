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

// Verdadeiro para a coluna cuja ordem e largura participam da preferencia
// gravada: as configuraveis e as sempre visiveis. A marcacao e as colunas
// sempre ocultas nao participam; a sempre visivel participa da ordem e da
// largura, mas mantem a visibilidade forcada.
function QueryColumnPersistable(const AColumn: TGridColumnDefinition;
  const AMarkingFieldName: string): Boolean;

// Verdadeiro quando a definicao oferece ao menos uma coluna participante da
// ordem e da largura gravadas.
function QueryColumnLayoutAvailable(const ADefinitions: TGridColumnDefinitions;
  const AMarkingFieldName: string): Boolean;

// Cruza as preferencias salvas com as colunas padrao. Entradas desconhecidas,
// duplicadas ou de colunas que nao participam da ordem e da largura sao
// ignoradas. Colunas configuraveis ausentes do layout entram ao final na ordem
// da definicao; a sempre visivel ausente mantem a posicao da definicao, o que
// preserva os layouts gravados antes de ela participar. Colunas fora da
// participacao mantem posicao, visibilidade e largura da definicao.
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

// Coluna cuja posicao segue a ordem gravada. Sem entrada salva, apenas a
// configuravel entra na sequencia; a sempre visivel sem entrada permanece no
// slot da definicao.
function ColumnFollowsSavedOrder(const AColumn: TGridColumnDefinition;
  const AMarkingFieldName: string; const AHasSavedEntry: Boolean): Boolean;
begin
  Result := QueryColumnPersistable(AColumn, AMarkingFieldName) and
    (AHasSavedEntry or GridColumnConfigurable(AColumn.Behavior));
end;

function QueryColumnPersistable(const AColumn: TGridColumnDefinition;
  const AMarkingFieldName: string): Boolean;
begin
  if (AMarkingFieldName <> '') and
    SameText(AColumn.FieldName, AMarkingFieldName) then
    Exit(False);

  Result := GridColumnConfigurable(AColumn.Behavior) or
    (AColumn.Behavior = gcbAlwaysVisible);
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
  HasEntry: TArray<Boolean>;
  OrderSequence: TArray<Integer>;
  FinalOrder: TArray<Integer>;
  EntryIndex: Integer;
  DefinitionIndex: Integer;
  Count: Integer;
  I: Integer;
  Item: TQueryColumnLayoutItem;
begin
  Sorted := SortColumnLayoutEntries(AEntries);
  SetLength(HasEntry, Length(ADefinitions));
  SetLength(OrderSequence, 0);
  Count := 0;

  // 1. Ordem salva: vale para toda coluna ainda oferecida que participa da
  // ordem e da largura, inclusive a sempre visivel. Entradas desconhecidas, de
  // colunas fora da participacao ou duplicadas sao ignoradas sem apagar a
  // preferencia gravada.
  for I := 0 to High(Sorted) do
  begin
    DefinitionIndex := FindDefinitionIndex(ADefinitions, Sorted[I].FieldName);
    if DefinitionIndex < 0 then
      Continue;
    if not QueryColumnPersistable(ADefinitions[DefinitionIndex],
      AMarkingFieldName) then
      Continue;
    if HasEntry[DefinitionIndex] then
      Continue;

    HasEntry[DefinitionIndex] := True;
    SetLength(OrderSequence, Count + 1);
    OrderSequence[Count] := DefinitionIndex;
    Inc(Count);
  end;

  // 2. Colunas configuraveis ausentes do layout completam a sequencia na ordem
  // da definicao. A sempre visivel ausente nao entra: ela mantem o slot da
  // definicao para nao deslocar um layout gravado antes de ela participar.
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

  // 3. Cada slot recebe a sequencia somente quando a coluna da definicao consome
  // a ordem gravada: configuravel ou sempre visivel com entrada salva. A sempre
  // visivel sem entrada, a sempre oculta e a marcacao mantem o indice da
  // definicao.
  SetLength(FinalOrder, Length(ADefinitions));
  Count := 0;
  for I := 0 to High(ADefinitions) do
    if ColumnFollowsSavedOrder(ADefinitions[I], AMarkingFieldName,
      HasEntry[I]) then
    begin
      FinalOrder[I] := OrderSequence[Count];
      Inc(Count);
    end
    else
      FinalOrder[I] := I;

  // 4. Plano resolvido na ordem final. A visibilidade continua derivada do
  // comportamento e a largura gravada vale para toda coluna participante.
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
