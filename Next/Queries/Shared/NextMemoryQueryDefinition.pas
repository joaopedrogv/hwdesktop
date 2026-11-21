unit NextMemoryQueryDefinition;

interface

uses
  System.SysUtils, Data.DB, FilterCriterion, QueryResultOperations,
  ColumnLayoutPreferences, IDataSetReaderUnit, NextQueryDefinition;

type
  // Colecao tipada em memoria: a leitura continua em INextQueryDefinition<T> e a edicao opera a linha corrente.
  // Load substitui o conteudo na preparacao da aba.
  INextMemoryDefinition<T> = interface(INextQueryDefinition<T>)
    ['{3A7C1D24-5E6F-4A80-9B12-8C4D5E6F7A81}']
    procedure Load(const AModels: TArray<T>);
    procedure Add(const AModel: T);
    procedure Update(const AModel: T);
    procedure Remove;
    function SelectAll: TArray<T>;
  end;

  TNextMemoryQueryDefinitionBase<T> = class(TNextQueryDefinitionBase,
    INextMemoryDefinition<T>)
  private
    FMemoryReader: IDataSetReader;
    function RequireDataSet: TDataSet;
    procedure RequireCurrentRow(const ADataSet: TDataSet);
    procedure LimparLinhas(const ADataSet: TDataSet);
  protected
    // Libera os modelos produzidos por DataSetToModel quando o mapeamento falha; nil para records.
    FLiberarModelo: TProc<T>;
    function CreateReader(const ACriteria: TFilterCriteria): IDataSetReader; override;
    procedure ModelToDataSet(const AModel: T); virtual; abstract;
    function DataSetToModel: T; virtual; abstract;
  public
    constructor Create(const AReader: IDataSetReader;
      AOperation: IQueryResultOperations;
      ALayoutPreferences: IColumnLayoutPreferences);
    procedure Load(const AModels: TArray<T>);
    procedure Add(const AModel: T);
    procedure Update(const AModel: T);
    procedure Remove;
    function SelectAll: TArray<T>;
    function TryGetSelected(out ASelected: T): Boolean;
  end;

implementation

uses
  EValidacaoNegocioUnit;

constructor TNextMemoryQueryDefinitionBase<T>.Create(
  const AReader: IDataSetReader; AOperation: IQueryResultOperations;
  ALayoutPreferences: IColumnLayoutPreferences);
begin
  if AReader = nil then
    raise Exception.Create('O leitor da colecao em memoria nao foi informado.');

  inherited Create(AOperation, ALayoutPreferences);
  FMemoryReader := AReader;
  // A base de consulta associa o leitor as operacoes em Search; antes disso GetDataSet devolve o conjunto.
  FReader := AReader;
end;

function TNextMemoryQueryDefinitionBase<T>.RequireDataSet: TDataSet;
begin
  Result := GetDataSet;
  if (Result = nil) or (not Result.Active) then
    raise Exception.Create('A colecao em memoria nao esta aberta.');
end;

procedure TNextMemoryQueryDefinitionBase<T>.RequireCurrentRow(
  const ADataSet: TDataSet);
begin
  if ADataSet.IsEmpty then
    raise EValidacaoNegocio.Create('Selecione um item da colecao.');
end;

procedure TNextMemoryQueryDefinitionBase<T>.LimparLinhas(const ADataSet: TDataSet);
begin
  ADataSet.First;
  while not ADataSet.Eof do
    ADataSet.Delete;
end;

function TNextMemoryQueryDefinitionBase<T>.CreateReader(
  const ACriteria: TFilterCriteria): IDataSetReader;
begin
  Result := FMemoryReader;
end;

procedure TNextMemoryQueryDefinitionBase<T>.Load(const AModels: TArray<T>);
var
  DataSet: TDataSet;
  Model: T;
begin
  DataSet := RequireDataSet;
  DataSet.DisableControls;
  try
    DataSet.Filtered := False;
    DataSet.Filter := '';
    LimparLinhas(DataSet);
    try
      for Model in AModels do
      begin
        DataSet.Append;
        ModelToDataSet(Model);
        DataSet.Post;
      end;
    except
      if DataSet.State in dsEditModes then
        DataSet.Cancel;
      // Sem carga parcial: remove as linhas inseridas e preserva a excecao original.
      try
        LimparLinhas(DataSet);
      except
        // A limpeza e melhor esforco; a excecao original deve prevalecer.
      end;
      raise;
    end;
  finally
    DataSet.First;
    DataSet.EnableControls;
  end;
end;

procedure TNextMemoryQueryDefinitionBase<T>.Add(const AModel: T);
var
  DataSet: TDataSet;
begin
  DataSet := RequireDataSet;
  DataSet.Append;
  try
    ModelToDataSet(AModel);
    DataSet.Post;
  except
    DataSet.Cancel;
    raise;
  end;
end;

procedure TNextMemoryQueryDefinitionBase<T>.Update(const AModel: T);
var
  DataSet: TDataSet;
begin
  DataSet := RequireDataSet;
  RequireCurrentRow(DataSet);
  DataSet.Edit;
  try
    ModelToDataSet(AModel);
    DataSet.Post;
  except
    DataSet.Cancel;
    raise;
  end;
end;

procedure TNextMemoryQueryDefinitionBase<T>.Remove;
var
  DataSet: TDataSet;
begin
  DataSet := RequireDataSet;
  RequireCurrentRow(DataSet);
  DataSet.Delete;
end;

function TNextMemoryQueryDefinitionBase<T>.SelectAll: TArray<T>;
var
  DataSet: TDataSet;
  Filter: string;
  Filtered: Boolean;
  Bookmark: TBookmark;
  Model: T;
  Count: Integer;
  Index: Integer;
begin
  DataSet := RequireDataSet;
  Filter := DataSet.Filter;
  Filtered := DataSet.Filtered;
  Bookmark := nil;
  SetLength(Result, 0);
  Count := 0;
  DataSet.DisableControls;
  try
    try
      Bookmark := DataSet.GetBookmark;
      try
        DataSet.Filtered := False;
        DataSet.Filter := '';
        DataSet.First;
        while not DataSet.Eof do
        begin
          if Count >= Length(Result) then
            SetLength(Result, Length(Result) + 16);
          Model := DataSetToModel;
          Result[Count] := Model;
          Inc(Count);
          DataSet.Next;
        end;
        SetLength(Result, Count);
      finally
        DataSet.Filter := Filter;
        DataSet.Filtered := Filtered;
        if Bookmark <> nil then
          try
            if DataSet.BookmarkValid(Bookmark) then
              DataSet.GotoBookmark(Bookmark);
          except
            // Um bookmark invalido nao impede o resultado; o dataset permanece na posicao atual.
          end;
      end;
    except
      SetLength(Result, Count);
      if Assigned(FLiberarModelo) then
        for Index := 0 to Count - 1 do
          FLiberarModelo(Result[Index]);
      SetLength(Result, 0);
      raise;
    end;
  finally
    if Bookmark <> nil then
      DataSet.FreeBookmark(Bookmark);
    DataSet.EnableControls;
  end;
end;

function TNextMemoryQueryDefinitionBase<T>.TryGetSelected(
  out ASelected: T): Boolean;
var
  DataSet: TDataSet;
begin
  ASelected := Default(T);
  DataSet := GetDataSet;
  Result := (DataSet <> nil) and DataSet.Active and (not DataSet.IsEmpty);
  if Result then
    ASelected := DataSetToModel;
end;

end.
