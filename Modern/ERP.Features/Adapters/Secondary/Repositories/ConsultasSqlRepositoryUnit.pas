unit ConsultasSqlRepositoryUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  CacheableRepositoryUnit, IConsultasSqlRepositoryUnit, ConsultaSqlEtdUnit,
  IDataBaseConnectionUnit, ISessionContextUnit, QueryResultUnit, ParameterValueUnit;

type
  ConsultasSqlRepository = class(IConsultasSqlRepository)
  private
    function CreateConsultaFromQuery(Q: QueryResult): ConsultaSqlEtd;
  public
    function ObterTodos(): ConsultaSqlEtdList; override;
    procedure Incluir(const Input: ConsultaSqlEtdList); override;
    procedure Atualizar(const Input: ConsultaSqlEtdList); override;
    procedure Remover(const Ids: TArray<string>); override;
  end;

implementation

{ ConsultasSqlRepository }

function ConsultasSqlRepository.CreateConsultaFromQuery(Q: QueryResult): ConsultaSqlEtd;
begin
  Result := ConsultaSqlEtd.Create(
    Q.FieldAsString('ID'),
    Q.FieldAsString('SQL')
  );
end;

function ConsultasSqlRepository.ObterTodos(): ConsultaSqlEtdList;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT ID, SQL FROM CONSULTAS_SQL ORDER BY ID'
  );
  try
    Result := ConsultaSqlEtdList.Create();
    
    while not Q.Eof do
    begin
      Result.Add(CreateConsultaFromQuery(Q));
      Q.Next();
    end;
  finally
    Q.Free();
  end;
end;

procedure ConsultasSqlRepository.Incluir(const Input: ConsultaSqlEtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Input.Count);

  for I := 0 to Input.Count - 1 do
  begin
    ParamsList[I] := ParametersBuilder.Create(2)
      .ByName('ID', Input.Items[I].Id)
      .ByName('SQL', Input.Items[I].SQL)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'UPDATE OR INSERT INTO CONSULTAS_SQL (ID, SQL) VALUES (:ID, :SQL) MATCHING (ID)',
    ParamsList
  );
end;

procedure ConsultasSqlRepository.Atualizar(const Input: ConsultaSqlEtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Input.Count);

  for I := 0 to Input.Count - 1 do
  begin
    ParamsList[I] := ParametersBuilder.Create(2)
      .ByName('ID', Input.Items[I].Id)
      .ByName('SQL', Input.Items[I].SQL)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'UPDATE OR INSERT INTO CONSULTAS_SQL (ID, SQL) VALUES (:ID, :SQL) MATCHING (ID)',
    ParamsList
  );
end;

procedure ConsultasSqlRepository.Remover(const Ids: TArray<string>);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Ids));

  for I := 0 to High(Ids) do
  begin
    ParamsList[I] := ParametersBuilder.Create(1)
      .ByName('ID', Ids[I])
      .Build();
  end;

  FConnection.ExecuteBatch(
    'DELETE FROM CONSULTAS_SQL WHERE ID = :ID',
    ParamsList
  );
end;

end.
