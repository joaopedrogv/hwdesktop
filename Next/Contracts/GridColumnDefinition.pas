unit GridColumnDefinition;

interface

type
  // Alinhamento de apresentacao da coluna. qcaDefault preserva o padrao da grade.
  TGridColumnDefinitionAlignment = (qcaDefault, qcaLeft, qcaCenter, qcaRight);

  // Comportamento de visibilidade da coluna. A ordem dos valores corresponde ao
  // Field.Tag do cadastro padrao legado: 0 configuravel, 1 invisivel,
  // 2 sempre visivel, 3 configuravel mas invisivel ao criar novo usuario.
  TGridColumnBehavior = (
    gcbConfigurableVisible,
    gcbAlwaysHidden,
    gcbAlwaysVisible,
    gcbConfigurableHidden
  );

  // Metadados de apresentacao de uma coluna. Width igual a zero preserva a
  // largura padrao da grade. Behavior define a visibilidade inicial e se o
  // usuario pode altera-la na tela.
  TGridColumnDefinition = record
    FieldName: string;
    Title: string;
    Width: Integer;
    Alignment: TGridColumnDefinitionAlignment;
    Behavior: TGridColumnBehavior;
  end;

  TGridColumnDefinitions = TArray<TGridColumnDefinition>;

function GridColumn(const AFieldName, ATitle: string;
  AWidth: Integer = 0;
  AAlignment: TGridColumnDefinitionAlignment = qcaDefault;
  ABehavior: TGridColumnBehavior = gcbConfigurableVisible): TGridColumnDefinition;
function GridColumns(const AItems: array of TGridColumnDefinition): TGridColumnDefinitions;

// Visibilidade inicial derivada apenas do comportamento.
function GridColumnVisibleByDefault(const ABehavior: TGridColumnBehavior): Boolean;

// Verdadeiro somente para os comportamentos que o usuario pode alterar (0 e 3).
function GridColumnConfigurable(const ABehavior: TGridColumnBehavior): Boolean;

implementation

function GridColumn(const AFieldName, ATitle: string;
  AWidth: Integer; AAlignment: TGridColumnDefinitionAlignment;
  ABehavior: TGridColumnBehavior): TGridColumnDefinition;
begin
  Result.FieldName := AFieldName;
  Result.Title := ATitle;
  Result.Width := AWidth;
  Result.Alignment := AAlignment;
  Result.Behavior := ABehavior;
end;

function GridColumnVisibleByDefault(
  const ABehavior: TGridColumnBehavior): Boolean;
begin
  Result := ABehavior in [gcbConfigurableVisible, gcbAlwaysVisible];
end;

function GridColumnConfigurable(const ABehavior: TGridColumnBehavior): Boolean;
begin
  Result := ABehavior in [gcbConfigurableVisible, gcbConfigurableHidden];
end;

function GridColumns(const AItems: array of TGridColumnDefinition): TGridColumnDefinitions;
var
  I: Integer;
begin
  SetLength(Result, Length(AItems));
  for I := 0 to High(AItems) do
    Result[I] := AItems[I];
end;

end.
