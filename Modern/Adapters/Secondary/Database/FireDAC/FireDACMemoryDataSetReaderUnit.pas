// Delphi Rio
unit FireDACMemoryDataSetReaderUnit;

interface

uses
  Data.DB, FireDAC.Comp.Client, IDataSetReaderUnit, DataSetFieldDefinitionUnit;

type
  // Adaptador FireDAC da colecao em memoria. E o dono do TFDMemTable ate a
  // ultima referencia da interface; o restante do codigo usa apenas IDataSetReader.
  TFireDACMemoryDataSetReader = class(TInterfacedObject, IDataSetReader)
  private
    FDataSet: TFDMemTable;
    procedure CriarCampos(const AFields: TDataSetFieldDefinitions);
  public
    constructor Create(const AFields: TDataSetFieldDefinitions);
    destructor Destroy; override;
    procedure Search;
    procedure Refresh;
    procedure Clear;
    function GetDataSet: TDataSet;
  end;

implementation

uses
  System.SysUtils;

constructor TFireDACMemoryDataSetReader.Create(
  const AFields: TDataSetFieldDefinitions);
begin
  inherited Create;
  FDataSet := TFDMemTable.Create(nil);
  try
    CriarCampos(AFields);
  except
    FreeAndNil(FDataSet);
    raise;
  end;
end;

destructor TFireDACMemoryDataSetReader.Destroy;
begin
  FreeAndNil(FDataSet);
  inherited;
end;

procedure TFireDACMemoryDataSetReader.CriarCampos(
  const AFields: TDataSetFieldDefinitions);
var
  Definition: TDataSetFieldDefinition;
  Field: TFieldDef;
begin
  for Definition in AFields do
  begin
    Field := FDataSet.FieldDefs.AddFieldDef;
    Field.Name := Definition.Name;
    Field.DataType := Definition.DataType;
    Field.Size := Definition.Size;
    Field.Precision := Definition.Precision;
    // O TFieldDef do Rio não expõe Scale; a moeda do Delphi já usa 4 casas fixas.
  end;
end;

function TFireDACMemoryDataSetReader.GetDataSet: TDataSet;
begin
  Result := FDataSet;
end;

procedure TFireDACMemoryDataSetReader.Search;
begin
  if not FDataSet.Active then
    FDataSet.CreateDataSet;
end;

procedure TFireDACMemoryDataSetReader.Refresh;
begin
  // Nao existe fonte externa para reler; as edicoes da colecao permanecem.
end;

procedure TFireDACMemoryDataSetReader.Clear;
begin
  // A base de consulta chama Clear antes de nova pesquisa; a colecao nao pode ser esvaziada.
end;

end.
