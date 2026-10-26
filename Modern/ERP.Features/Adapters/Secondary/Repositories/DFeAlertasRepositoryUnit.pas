unit DFeAlertasRepositoryUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  CacheableRepositoryUnit, IDFeAlertasRepositoryUnit, DFeAlertaEdtUnit,
  IDataBaseConnectionUnit, QueryResultUnit, ParameterValueUnit;

type
  DFeAlertasRepository = class(IDFeAlertasRepository)
  private
    function CreateAlertaFromQuery(Q: QueryResult): DFeAlertaEdt;
  public
    function ObterPelodDFe(const ChaveDFe: string): DFeAlertaEdtList; override;
    function ExisteAlertaPelodDFe(const ChaveDFe: string): Boolean; override;
    procedure Incluir(const Input: DFeAlertaEdtList); override;
  end;

implementation

{ DFeAlertasRepository }

function DFeAlertasRepository.CreateAlertaFromQuery(Q: QueryResult): DFeAlertaEdt;
begin
  Result := DFeAlertaEdt.Create(
    Q.FieldAsString('ID'),
    Q.FieldAsString('CHAVE_DFE'),
    Q.FieldAsIntNullable('CMSG'),
    Q.FieldAsString('XMSG')
  );
end;

function DFeAlertasRepository.ObterPelodDFe(const ChaveDFe: string): DFeAlertaEdtList;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT ID, CHAVE_DFE, CMSG, XMSG FROM DFE_ALERTAS WHERE CHAVE_DFE = :CHAVE_DFE',
    ParametersBuilder.Create(1)
      .ByName('CHAVE_DFE', ChaveDFe)
      .Build()
  );
  try
    Result := DFeAlertaEdtList.Create();
    
    while not Q.Eof do
    begin
      Result.Add(CreateAlertaFromQuery(Q));
      Q.Next();
    end;
  finally
    Q.Free();
  end;
end;

function DFeAlertasRepository.ExisteAlertaPelodDFe(const ChaveDFe: string): Boolean;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT first 1 1 FROM DFE_ALERTAS WHERE CHAVE_DFE = :CHAVE_DFE',
    ParametersBuilder.Create(1)
      .ByName('CHAVE_DFE', ChaveDFe)
      .Build()
  );
  try
    Result := not Q.IsEmpty;
  finally
    Q.Free();
  end;
end;

procedure DFeAlertasRepository.Incluir(const Input: DFeAlertaEdtList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Input.Count);

  for I := 0 to Input.Count - 1 do
  begin
    ParamsList[I] := ParametersBuilder.Create(4)
      .ByName('ID', GenerateNewUUID())
      .ByName('CHAVE_DFE', Input.Items[I].ChaveDfe)
      .ByName('CMSG', Input.Items[I].Cmsg)
      .ByName('XMSG', Input.Items[I].Xmsg)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO DFE_ALERTAS (ID, CHAVE_DFE, CMSG, XMSG) VALUES (:ID, :CHAVE_DFE, :CMSG, :XMSG)',
    ParamsList
  );
end;

end.
