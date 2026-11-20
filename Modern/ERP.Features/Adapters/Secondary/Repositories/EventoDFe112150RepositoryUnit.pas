unit EventoDFe112150RepositoryUnit;

interface

uses
  IEventoDFe112150RepositoryUnit,
  BaseRepositoryUnit;

type
  {$IFDEF INTF_ON}
  EventoDFe112150Repository = class(BaseRepository, IEventoDFe112150Repository)
  {$ELSE}
  EventoDFe112150Repository = class(IEventoDFe112150Repository)
  {$ENDIF}
  public
    procedure Inserir(const AEventoId: string; ADataPrevisaoEntrega: TDate); override;
    procedure Atualizar(const AEventoId: string; ADataPrevisaoEntrega: TDate); override;
    function ObterDataPrevisao(const AEventoId: string;
      out ADataPrevisaoEntrega: TDate): Boolean; override;
  end;

implementation

uses
  IDataBaseConnectionUnit,
  ParameterValueUnit,
  QueryResultUnit;

{ EventoDFe112150Repository }

procedure EventoDFe112150Repository.Inserir(const AEventoId: string;
  ADataPrevisaoEntrega: TDate);
begin
  FConnection.ExecuteCommand(
    'INSERT INTO EVENTOS_DFE_112150 (EVENTO_DFE_ID, DATA_PREVISAO_ENTREGA) ' +
    ' VALUES (:EVENTO_DFE_ID, :DATA_PREVISAO_ENTREGA)',
    ParametersBuilder.Create(2)
      .ByName('EVENTO_DFE_ID', AEventoId)
      .ByName('DATA_PREVISAO_ENTREGA', ADataPrevisaoEntrega)
      .Build()
  );
end;

procedure EventoDFe112150Repository.Atualizar(const AEventoId: string;
  ADataPrevisaoEntrega: TDate);
begin
  FConnection.ExecuteCommand(
    'UPDATE EVENTOS_DFE_112150 ' +
    ' SET DATA_PREVISAO_ENTREGA = :DATA_PREVISAO_ENTREGA ' +
    ' WHERE EVENTO_DFE_ID = :EVENTO_DFE_ID',
    ParametersBuilder.Create(2)
      .ByName('EVENTO_DFE_ID', AEventoId)
      .ByName('DATA_PREVISAO_ENTREGA', ADataPrevisaoEntrega)
      .Build()
  );
end;

function EventoDFe112150Repository.ObterDataPrevisao(const AEventoId: string;
  out ADataPrevisaoEntrega: TDate): Boolean;
var
  Q: QueryResult;
begin
  ADataPrevisaoEntrega := 0;

  Q := FConnection.CreateQuery(
    'SELECT DATA_PREVISAO_ENTREGA ' +
    ' FROM EVENTOS_DFE_112150 ' +
    ' WHERE EVENTO_DFE_ID = :EVENTO_DFE_ID',
    ParametersBuilder.Create(1)
      .ByName('EVENTO_DFE_ID', AEventoId)
      .Build()
  );
  try
    Result := not Q.IsEmpty;

    if Result then
      ADataPrevisaoEntrega := Q.FieldAsDate('DATA_PREVISAO_ENTREGA');
  finally
    Q.Free();
  end;
end;

end.
