unit EventosRtcQuery;

interface

uses
  Data.DB, FireDAC.Comp.Client;

type
  // Consulta somente leitura de NOTAFISCAL_EVENTO para a empresa ativa. A
  // conexao pertence a TNextSetup; esta classe mantem apenas uma referencia
  // sem propriedade sobre ela.
  TEventosRtcQuery = class
  private
    FConnection: TFDConnection;
    FQuery: TFDQuery;
    FTransaction: TFDTransaction;
    FCompanyCode: Integer;
  public
    constructor Create(AConnection: TFDConnection; ACompanyCode: Integer);
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    function DataSet: TDataSet;
  end;

implementation

uses
  System.SysUtils, FireDAC.Stan.Option, FireDAC.Stan.Param;

const
  EventosRtcSql =
    'select CHNFE, TPEVENTO, DHEVENTO' + sLineBreak +
    'from NOTAFISCAL_EVENTO' + sLineBreak +
    'where COD_EMPRESA = :COD_EMPRESA' + sLineBreak +
    'order by DHEVENTO desc, CHNFE';

{ TEventosRtcQuery }

constructor TEventosRtcQuery.Create(AConnection: TFDConnection;
  ACompanyCode: Integer);
begin
  inherited Create;

  if AConnection = nil then
    raise Exception.Create('A conexao da consulta de eventos RTC nao foi informada.');
  if ACompanyCode <= 0 then
    raise Exception.Create('O codigo da empresa deve ser maior que zero.');

  FConnection := AConnection;
  FCompanyCode := ACompanyCode;

  // A transacao pertence a query. Uma falha nesta construcao deixa a limpeza
  // para Destroy, que verifica nulos e libera a query e sua transacao.
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection;
  FQuery.SQL.Text := EventosRtcSql;
  FQuery.FetchOptions.Mode := fmAll;
  FQuery.UpdateOptions.ReadOnly := True;

  FTransaction := TFDTransaction.Create(FQuery);
  FTransaction.Connection := FConnection;
  FTransaction.Options.ReadOnly := True;
  FTransaction.Options.Params.Add('read_committed');
  FTransaction.Options.Params.Add('rec_version');
  FTransaction.Options.Params.Add('nowait');
  FQuery.Transaction := FTransaction;
end;

destructor TEventosRtcQuery.Destroy;
begin
  Close;
  if FQuery <> nil then
  begin
    FQuery.Free;
    FQuery := nil;
  end;
  inherited;
end;

procedure TEventosRtcQuery.Open;
begin
  Close;
  try
    FQuery.ParamByName('COD_EMPRESA').AsInteger := FCompanyCode;
    if not FTransaction.Active then
      FTransaction.StartTransaction;
    FQuery.Open;
  except
    Close;
    raise;
  end;
end;

procedure TEventosRtcQuery.Close;
begin
  try
    if (FQuery <> nil) and FQuery.Active then
      FQuery.Close;
  except
  end;
  try
    if (FTransaction <> nil) and FTransaction.Active then
      FTransaction.Rollback;
  except
  end;
end;

function TEventosRtcQuery.DataSet: TDataSet;
begin
  Result := FQuery;
end;

end.
