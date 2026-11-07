unit ReaderContextLease;

interface

uses
  System.SysUtils, DB, IDatabaseReaderUnit;

type
  TReaderReleaseContext = reference to procedure;

  // Decorator Next da porta Modern. A reserva do contexto pertence a este
  // wrapper; o leitor interno, a query e a transacao sao liberados antes.
  TReaderContextLease = class(TInterfacedObject, IDatabaseReader)
  private
    FInner: IDatabaseReader;
    FReleaseContext: TReaderReleaseContext;
    procedure RequireInner;
  public
    constructor Create(const AInner: IDatabaseReader;
      const AReleaseContext: TReaderReleaseContext);
    destructor Destroy; override;
    procedure Pesquisar;
    procedure Limpar;
    function DataSet: TDataSet;
  end;

implementation

constructor TReaderContextLease.Create(const AInner: IDatabaseReader;
  const AReleaseContext: TReaderReleaseContext);
begin
  inherited Create;

  if AInner = nil then
    raise Exception.Create('O leitor interno da consulta nao foi informado.');
  if not Assigned(AReleaseContext) then
    raise Exception.Create('A liberacao do contexto da empresa nao foi informada.');

  FInner := AInner;
  FReleaseContext := AReleaseContext;
end;

procedure TReaderContextLease.RequireInner;
begin
  if FInner = nil then
    raise Exception.Create('O leitor interno da consulta nao foi informado.');
end;

procedure TReaderContextLease.Pesquisar;
begin
  RequireInner;
  FInner.Pesquisar;
end;

procedure TReaderContextLease.Limpar;
begin
  if FInner <> nil then
    FInner.Limpar;
end;

function TReaderContextLease.DataSet: TDataSet;
begin
  RequireInner;
  Result := FInner.DataSet;
end;

destructor TReaderContextLease.Destroy;
var
  ReleaseContext: TReaderReleaseContext;
begin
  try
    // Primeiro libera o leitor interno, que fecha/desfaz a transacao e libera a
    // query. Somente depois a reserva do contexto e devolvida.
    FInner := nil;
  finally
    ReleaseContext := FReleaseContext;
    FReleaseContext := nil;
    try
      if Assigned(ReleaseContext) then
        ReleaseContext();
    finally
      inherited;
    end;
  end;
end;

end.
