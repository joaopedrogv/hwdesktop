unit NextDatasetDefinition;

interface

uses
  Data.DB, IDataSetReaderUnit, FilterCriterion, DatasetResultOperations,
  GridColumnDefinition, FilterDefinition, ColumnLayoutPreferences,
  DatasetColumnLayout;

type
  // A base possui o leitor e associa as operacoes ao leitor vigente.
  INextDatasetDefinitionBase = interface
    ['{D1A2B3C4-D5E6-F7A8-B9C0-D1E2F3A4B5C6}']
    function GetResultOperation(): IDataSetResultOperations;
    function GetColumnsDef: TGridColumnDefinitions;
    function GetFiltersDef(): TFilterDefinition;
    function GetDatasetId: string;
    function GetDataSet: TDataSet;
    procedure Search(const ACriteria: TFilterCriteria);
    // Atualiza o resultado da pesquisa corrente sem recriar o leitor nem reaplicar os criterios da tela.
    procedure Refresh;
    procedure Clear;
    // Layout de colunas: a definicao e a unica origem das colunas padrao e das preferencias persistidas para o DatasetId
    // corrente.
    function LoadColumnLayout: TDatasetColumnLayout;
    procedure SaveColumnLayout(const AEntries: TColumnLayoutEntries);
    procedure ResetColumnLayout;

    property FiltersDef: TFilterDefinition read GetFiltersDef;
    property ColumnsDef: TGridColumnDefinitions read GetColumnsDef;
    property DatasetId: string read GetDatasetId;
  end;

  INextDatasetDefinition<T> = interface(INextDatasetDefinitionBase)
    ['{bb78610f-7934-4bdc-b859-cf0f9b052e69}']
    // Le a linha corrente do leitor; a funcionalidade decide o que identifica um registro selecionado. Nao cria nem
    // libera objetos de apresentacao.
    function TryGetSelected(out ASelected: T): Boolean;
  end;

  TNextDatasetDefinitionBase = class(TInterfacedObject, INextDatasetDefinitionBase)
  protected
    FOperation: IDataSetResultOperations;
    FReader: IDataSetReader;
    FLayoutPreferences: IColumnLayoutPreferences;
    // Identidade do layout em CONFIG_COLUNAS. Cada definicao atribui na primeira linha de Configure, que roda na
    // construcao da base e nao pode depender de campos da classe derivada.
    FDatasetId: string;
    FFiltersDef: TFilterDefinition;
    FColumnsDef: TGridColumnDefinitions;
    procedure Configure(); virtual;
    function CreateReader(const ACriteria: TFilterCriteria): IDataSetReader; virtual; abstract;
  public
    constructor Create(AOperation: IDataSetResultOperations;
      ALayoutPreferences: IColumnLayoutPreferences);
    procedure Search(const ACriteria: TFilterCriteria);
    procedure Refresh;
    procedure Clear; virtual;
    function GetResultOperation(): IDataSetResultOperations;
    function GetColumnsDef: TGridColumnDefinitions;
    function GetFiltersDef(): TFilterDefinition;
    function GetDatasetId(): string;
    function GetDataSet: TDataSet;
    function LoadColumnLayout: TDatasetColumnLayout;
    procedure SaveColumnLayout(const AEntries: TColumnLayoutEntries);
    procedure ResetColumnLayout;
  end;

implementation

uses
  System.SysUtils;

const
  MissingReaderMessage = 'O leitor de dados nao foi informado.';

constructor TNextDatasetDefinitionBase.Create(AOperation: IDataSetResultOperations;
  ALayoutPreferences: IColumnLayoutPreferences);
begin
  inherited Create;
  if AOperation = nil then
    raise Exception.Create('As operacoes do resultado nao foram informadas.');
  if ALayoutPreferences = nil then
    raise Exception.Create('As preferencias de colunas nao foram informadas.');

  FOperation := AOperation;
  FLayoutPreferences := ALayoutPreferences;
  Configure();

  // Sem identidade nenhuma preferencia pode ser lida ou gravada: a falha de composicao aparece na abertura.
  if Trim(FDatasetId) = '' then
    raise Exception.Create('A identidade do layout de colunas nao foi informada.');
end;

function TNextDatasetDefinitionBase.GetDatasetId(): string;
begin
  Result := FDatasetId;
end;

function TNextDatasetDefinitionBase.LoadColumnLayout: TDatasetColumnLayout;
var
  Entries: TColumnLayoutEntries;
  MarkingFieldName: string;
begin
  MarkingFieldName := FOperation.MarkingColumnName();

  // Sem coluna participante nao existe preferencia a aplicar e a leitura do banco e dispensavel.
  if not DatasetColumnLayoutAvailable(FColumnsDef, MarkingFieldName) then
    Exit(ResolveDatasetColumnLayout(FColumnsDef, nil, MarkingFieldName));

  try
    Entries := FLayoutPreferences.Load(FDatasetId);
  except
    // Abrir o dataset nunca depende da preferencia gravada: a falha de leitura mantem as colunas padrao. Save/Reset
    // continuam reportando ao host.
    Entries := nil;
  end;

  Result := ResolveDatasetColumnLayout(FColumnsDef, Entries, MarkingFieldName);
end;

procedure TNextDatasetDefinitionBase.SaveColumnLayout(const AEntries: TColumnLayoutEntries);
begin
  // A falha de validacao ou de banco pertence ao chamador, que decide a apresentacao.
  FLayoutPreferences.Save(FDatasetId, AEntries);
end;

procedure TNextDatasetDefinitionBase.ResetColumnLayout;
begin
  FLayoutPreferences.Reset(FDatasetId);
end;

procedure TNextDatasetDefinitionBase.Configure();
begin
  raise Exception.Create('Configuração do dataset não implementada');
end;

procedure TNextDatasetDefinitionBase.Search(const ACriteria: TFilterCriteria);
begin
  // Uma pesquisa substitui a anterior: nenhum leitor antigo permanece ativo nem associado as operacoes.
  Clear;
  FReader := CreateReader(ACriteria);
  try
    if FReader = nil then
      raise Exception.Create(MissingReaderMessage);
    FReader.Search;
    FOperation.SetReader(FReader);
  except
    Clear;
    raise;
  end;
end;

procedure TNextDatasetDefinitionBase.Refresh;
begin
  // Sem leitor nao existe resultado aberto a reler; a base nao cria um novo leitor nesta chamada.
  if FReader = nil then
    raise Exception.Create(MissingReaderMessage);

  FReader.Refresh;
end;

procedure TNextDatasetDefinitionBase.Clear;
begin
  // Desassociar antes de fechar impede que as operacoes alcancem um leitor liberado ou uma linha do resultado anterior.
  FOperation.SetReader(nil);
  if FReader <> nil then
  begin
    FReader.Clear;
    FReader := nil;
  end;
end;

function TNextDatasetDefinitionBase.GetResultOperation(): IDataSetResultOperations;
begin
  Result := FOperation;
end;

function TNextDatasetDefinitionBase.GetColumnsDef(): TGridColumnDefinitions;
begin
  Result := FColumnsDef;
end;

function TNextDatasetDefinitionBase.GetFiltersDef(): TFilterDefinition;
begin
  Result := FFiltersDef;
end;

function TNextDatasetDefinitionBase.GetDataSet: TDataSet;
begin
  if FReader = nil then
    Result := nil
  else
    Result := FReader.GetDataSet;
end;

end.
