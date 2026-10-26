unit TiposVendasRepositoryUnit;

interface

uses
  CacheableRepositoryUnit,
  ITiposVendasRepositoryUnit,
  TipoVendaEtdUnit,
  ParameterValueUnit,
  TipoComunsUnit,
  ArrayServiceUnit,
  QueryResultUnit;

type                                                 
  {$IFDEF INTF_ON}
  TiposVendasRepository = class(CacheableRepository, ITiposVendasRepository)
  {$ELSE}                                                                   
  TiposVendasRepository = class(ITiposVendasRepository)
  {$ENDIF}
  private
    function ObterDaQuery(Q: QueryResult): TipoVendaEtd;
    function ObterPorSQL(const CacheKey, SQL: string; const Params: ParametersValues): TipoVendaEtdList;
  public
    function ListarPorTipo(const Tipos: TArrayString): TipoVendaEtdList; override;
    function GetById(Codigo: Integer; const Tipo: string): TipoVendaEtd; override;
  end;

implementation

uses
  Classes,
  Contnrs,
  SysUtils,
  StrUtils,
  StatusRegistroEnumUnit;

{ TiposVendasRepository }

function TiposVendasRepository.GetById(Codigo: Integer;
  const Tipo: string): TipoVendaEtd;
var
  CacheKey: string;
  Q: QueryResult;
begin
  CacheKey := Format('%d_%s', [ Codigo, Tipo ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'select tv.cod_tipo, tv.tipo, tv.descricao, tv.tipo_os, tv.sigla, tv.venda, tv.ativo ' +
    ' from tipo_vendas tv ' +
    ' where tv.cod_tipo = :cod_tipo and tv.tipo = :tipo',
    ParametersBuilder.Create(2)
      .Add(Codigo)
      .Add(Tipo)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := ObterDaQuery( Q );

    FCacheObjs.Add(CacheKey, Result);

  finally
    Q.Free();
  end;
end;

function TiposVendasRepository.ListarPorTipo(const Tipos: TArrayString): TipoVendaEtdList;
var
  sTipos: string;
  I: Integer;
begin
  sTipos := QuotedStr(' ');
  for I := Low(Tipos) to High(Tipos) do
    sTipos := sTipos + ',' + QuotedStr(Tipos[I]);

  Result := ObterPorSQL( Format('user_%s', [ sTipos ]),
    Format(
      'select tv.cod_tipo, tv.tipo, tv.descricao, tv.tipo_os, tv.sigla, tv.venda, tv.ativo ' +
      ' from tipo_vendas tv ' +
      ' where tv.tipo in (%s)' +
      ' order by tv.tipo desc, tv.descricao ', [ sTipos ]
    ),
    ParametersBuilder.Create(0).Build()
  );
end;

function TiposVendasRepository.ObterDaQuery(Q: QueryResult): TipoVendaEtd;
begin
  Result := TipoVendaEtd.Create(
    Q.FieldAsInteger('COD_TIPO'),
    Q.FieldAsString('TIPO'),
    Q.FieldAsString('DESCRICAO'),
    Q.FieldAsString('TIPO_OS'),
    Q.FieldAsString('SIGLA'),
    Q.FieldAreEquals('VENDA', 'S'),
    StatusRegistroEnum( Q.FieldAsInteger('ATIVO') )
  );
end;

function TiposVendasRepository.ObterPorSQL(const CacheKey, SQL: string;
  const Params: ParametersValues
): TipoVendaEtdList;
var
  Q: QueryResult;
begin
  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery( SQL, Params );
  try
    Result := TipoVendaEtdList.Create();

    while not Q.DataSet.Eof do
    begin
      Result.Add( ObterDaQuery( Q ) );
      Q.DataSet.Next();
    end;

    FCacheObjs.Add(CacheKey, Result);

  finally
    Q.Free();
  end;
end;

end.
