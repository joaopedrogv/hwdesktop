unit EventoDFe211130RepositoryUnit;

interface

uses
  IEventoDFe211130RepositoryUnit,
  BaseRepositoryUnit,
  EventoDFe211130ItemEtdUnit;

type
  {$IFDEF INTF_ON}
  EventoDFe211130Repository = class(BaseRepository, IEventoDFe211130Repository)
  {$ELSE}
  EventoDFe211130Repository = class(IEventoDFe211130Repository)
  {$ENDIF}
  public
    procedure SubstituirItens(const AEventoId: string;
      const AItens: EventoDFe211130ItemEtdArray); override;
    function ObterItens(const AEventoId: string): EventoDFe211130ItemEtdArray; override;
  end;

implementation

uses
  IDataBaseConnectionUnit,
  ParameterValueUnit,
  QueryResultUnit;

{ EventoDFe211130Repository }

procedure EventoDFe211130Repository.SubstituirItens(const AEventoId: string;
  const AItens: EventoDFe211130ItemEtdArray);
var
  Parametros: array of ParametersValues;
  I: Integer;
begin
  FConnection.ExecuteCommand(
    'DELETE FROM EVENTOS_DFE_211130_ITEM ' +
    ' WHERE EVENTO_DFE_ID = :EVENTO_DFE_ID',
    ParametersBuilder.Create(1)
      .ByName('EVENTO_DFE_ID', AEventoId)
      .Build()
  );

  if Length(AItens) = 0 then
    Exit;

  SetLength(Parametros, Length(AItens));

  for I := 0 to High(AItens) do
    Parametros[I] := ParametersBuilder.Create(7)
      .ByName('ID', AItens[I].Id)
      .ByName('EVENTO_DFE_ID', AEventoId)
      .ByName('NITEM', AItens[I].NItem)
      .ByNameC('VIBS', AItens[I].VIbs)
      .ByNameC('VCBS', AItens[I].VCbs)
      .ByNameC('QIMOBILIZADO', AItens[I].QImobilizado)
      .ByName('UIMOBILIZADO', AItens[I].UImobilizado)
      .Build();

  FConnection.ExecuteBatch(
    'INSERT INTO EVENTOS_DFE_211130_ITEM ' +
    ' (ID, EVENTO_DFE_ID, NITEM, VIBS, VCBS, QIMOBILIZADO, UIMOBILIZADO) ' +
    ' VALUES ' +
    ' (:ID, :EVENTO_DFE_ID, :NITEM, :VIBS, :VCBS, :QIMOBILIZADO, :UIMOBILIZADO)',
    Parametros
  );
end;

function EventoDFe211130Repository.ObterItens(
  const AEventoId: string): EventoDFe211130ItemEtdArray;
var
  Q: QueryResult;
  Quantidade: Integer;
begin
  SetLength(Result, 0);

  Q := FConnection.CreateQuery(
    'SELECT ID, NITEM, VIBS, VCBS, QIMOBILIZADO, UIMOBILIZADO ' +
    ' FROM EVENTOS_DFE_211130_ITEM ' +
    ' WHERE EVENTO_DFE_ID = :EVENTO_DFE_ID ' +
    ' ORDER BY NITEM',
    ParametersBuilder.Create(1)
      .ByName('EVENTO_DFE_ID', AEventoId)
      .Build()
  );
  try
    Quantidade := 0;

    while not Q.Eof do
    begin
      SetLength(Result, Quantidade + 1);
      Result[Quantidade] := EventoDFe211130ItemEtd.Create(
        Q.FieldAsString('ID'),
        Q.FieldAsInteger('NITEM'),
        Q.FieldAsCurrency('VIBS'),
        Q.FieldAsCurrency('VCBS'),
        Q.FieldAsCurrency('QIMOBILIZADO'),
        Q.FieldAsString('UIMOBILIZADO')
      );
      Inc(Quantidade);
      Q.Next();
    end;
  finally
    Q.Free();
  end;
end;

end.
