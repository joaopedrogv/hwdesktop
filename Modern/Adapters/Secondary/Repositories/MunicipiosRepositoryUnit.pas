unit MunicipiosRepositoryUnit;

interface

uses
  CacheableRepositoryUnit,
  IMunicipiosRepositoryUnit,
  QueryResultUnit,
  MunicipioEtdUnit;

type                                                                       
  {$IFDEF INTF_ON}
  MunicipiosRepository = class(CacheableRepository, IMunicipiosRepository)
  {$ELSE}                                                                 
  MunicipiosRepository = class(IMunicipiosRepository)
  {$ENDIF}
  private
    function CreateItemFromQuery(Q: QueryResult): MunicipioEtd;
  public
    function ObterMunicipio(Codigo: Integer): MunicipioEtd; override;
    function ListarTodos(): MunicipiosEtd; override;
  end;

implementation

uses
  SysUtils,
  EstadoEtdUnit, Contnrs;

{ MunicipiosRepository }

function MunicipiosRepository.CreateItemFromQuery(Q: QueryResult): MunicipioEtd;
begin
  Result := MunicipioEtd.Create(
    Q.FieldAsInteger('codigo_mun_ibge'),
    Q.FieldAsString('nome_municipio'),
    EstadoEtd.Create(
      Q.FieldAsInteger('codigo_uf_ibge'),
      Q.FieldAsString('sigla_uf'),
      Q.FieldAsString('nome_uf')
    )
  );
end;

function MunicipiosRepository.ListarTodos: MunicipiosEtd;
var
  CacheKey: string;
  Q: QueryResult;
begin
  CacheKey := 'all';

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'select c.codigo_uf_ibge, c.nome_uf, c.codigo_mun_ibge, c.nome_municipio, e.sigla_uf from cidades_ibge c' +
    ' left join estados e on e.ibge_codigo_uf = c.codigo_uf_ibge' +
    ' order by c.nome_municipio, c.nome_uf'
  );
  try
    Result := MunicipiosEtd.Create();

    while not Q.Eof do
    begin
      Result.Add( CreateItemFromQuery( Q ));

      Q.Next();
    end;

    FCacheObjs.Add(CacheKey, Result);
  finally
    Q.Free();
  end;
end;

function MunicipiosRepository.ObterMunicipio(Codigo: Integer): MunicipioEtd;
var
  CacheKey: string;
  Q: QueryResult;
begin
  CacheKey := Format('cod_%d', [ Codigo ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'select c.codigo_uf_ibge, c.nome_uf, c.codigo_mun_ibge, c.nome_municipio, e.sigla_uf from cidades_ibge c' +
    ' left join estados e on e.ibge_codigo_uf = c.codigo_uf_ibge' +
    ' where c.codigo_mun_ibge = %d', [ Codigo ]
  );
  try

    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( Q );

    FCacheObjs.Add(CacheKey, Result);

  finally
    Q.Free();
  end;
end;

end.
