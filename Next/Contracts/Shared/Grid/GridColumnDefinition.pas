unit GridColumnDefinition;

interface

type
  // qcaDefault preserva o padrao da grade.
  TGridColumnDefinitionAlignment = (qcaDefault, qcaLeft, qcaCenter, qcaRight);

  // A ordem dos valores corresponde ao Field.Tag do cadastro padrao legado: 0 configuravel, 1 invisivel, 2 sempre
  // visivel, 3 configuravel mas invisivel ao criar novo usuario.
  TGridColumnBehavior = (gcbConfigurableVisible, gcbAlwaysHidden, gcbAlwaysVisible, gcbConfigurableHidden);

  // Width zero usa a largura padrao da grade; DisplayFormat vazio usa a formatacao do campo.
  TGridColumnDefinition = record
    FieldName: string;
    Title: string;
    Width: Integer;
    Alignment: TGridColumnDefinitionAlignment;
    Behavior: TGridColumnBehavior;
    DisplayFormat: string;
  end;

  TGridColumnDefinitions = TArray<TGridColumnDefinition>;

function GridColumn(const AFieldName, ATitle: string;
  AWidth: Integer = 0;
  AAlignment: TGridColumnDefinitionAlignment = qcaDefault;
  ABehavior: TGridColumnBehavior = gcbConfigurableVisible;
  const ADisplayFormat: string = ''): TGridColumnDefinition;
function GridColumns(const AItems: array of TGridColumnDefinition): TGridColumnDefinitions;

function GridColumnVisibleByDefault(const ABehavior: TGridColumnBehavior): Boolean;

function GridColumnConfigurable(const ABehavior: TGridColumnBehavior): Boolean;

implementation

function GridColumn(const AFieldName, ATitle: string;
  AWidth: Integer; AAlignment: TGridColumnDefinitionAlignment;
  ABehavior: TGridColumnBehavior;
  const ADisplayFormat: string): TGridColumnDefinition;
begin
  Result.FieldName := AFieldName;
  Result.Title := ATitle;
  Result.Width := AWidth;
  Result.Alignment := AAlignment;
  Result.Behavior := ABehavior;
  Result.DisplayFormat := ADisplayFormat;
end;

function GridColumnVisibleByDefault(const ABehavior: TGridColumnBehavior): Boolean;
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
