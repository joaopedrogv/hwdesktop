unit EmpresasRepositoryUnit;

interface

uses
  IEmpresasRepositoryUnit,
  EmpresaEtdUnit,
  QueryResultUnit,
  ParameterValueUnit;

type                                                         
  {$IFDEF INTF_ON}
  EmpresasRepository = class(CacheableRepository, IEmpresasRepository)
  {$ELSE}
  EmpresasRepository = class(IEmpresasRepository)
  {$ENDIF}
  private
    function GetCampos(): string;
    function ObterPorSQL(const CacheKey, SQL: string; const Params: ParametersValues): EmpresasEtd;
    function CreateItemFromQuery(Q: QueryResult): EmpresaEtd;
  public
    function ListarPorUsuarioPermitido(const Usuario: string): EmpresasEtd; override;
    function ListarTodas(): EmpresasEtd; override;
    function GetByKey(EmpresaId: Integer): EmpresaEtd; override;
  end;

implementation

uses
  Classes,
  Contnrs,
  SysUtils;

{ EmpresasRepository }

function EmpresasRepository.CreateItemFromQuery(Q: QueryResult): EmpresaEtd;
begin
  Result := EmpresaEtd.Create(
    Q.FieldAsInteger('COD_EMPRESA'),
    Q.FieldAsString('CGC_EMP'),
    Q.FieldAsString('NOME_EMP'),
    Q.FieldAsString('FANTASIA_EMP'),
    Q.FieldAsString('IDENTIFICACAO_EMP'),
    Q.FieldAsString('IE_EMP'),
    Q.FieldAsString('IM_EMP'),
    Q.FieldAsString('ENDRECO_EMP'),
    Q.FieldAsString('NUMERO_END'),
    Q.FieldAsString('CEP_EMP'),
    Q.FieldAsString('BAIRRO_EMP'),
    Q.FieldAsString('COMPLEMENTO_EMP'),
    Q.FieldAsString('CIDADE_EMP'),
    Q.FieldAsString('SIGLA_UF'),
    Q.FieldAsInteger('IBGE_COD_CIDADE'),
    Q.FieldAsString('TELEFONE_EMP'),
    Q.FieldAsString('EMAIL_EMP')
  );
end;

function EmpresasRepository.GetByKey(EmpresaId: Integer): EmpresaEtd;
var
  Q: QueryResult;
  CacheKey: string;
begin
  CacheKey := IntToStr(EmpresaId);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'SELECT ' + GetCampos() +
    'FROM EMPRESA E ' +
    'LEFT JOIN ESTADOS ES ON ES.CODIGO_UF = E.UF_EMP ' +
    'WHERE E.COD_EMPRESA = %D ', [ EmpresaId ]
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( Q );

    FCacheObjs.Add(CacheKey, Result, 5);

  finally
    Q.Free();
  end;
end;

function EmpresasRepository.GetCampos: string;
begin
  Result :=
    ' E.COD_EMPRESA, E.CGC_EMP, E.NOME_EMP, E.FANTASIA_EMP, E.IDENTIFICACAO_EMP, E.IE_EMP, E.IM_EMP, E.ENDRECO_EMP, ' +
    'E.NUMERO_END, E.CEP_EMP, E.BAIRRO_EMP, E.COMPLEMENTO_EMP, E.CIDADE_EMP, ES.SIGLA_UF, E.IBGE_COD_CIDADE, ' +
    'E.TELEFONE_EMP, E.EMAIL_EMP ';
end;

function EmpresasRepository.ListarPorUsuarioPermitido(const Usuario: string): EmpresasEtd;
begin
  Result := ObterPorSQL( Format('user_%s', [ Usuario ]),
    'SELECT ' + GetCampos() +
    'FROM SENHAS S ' +
    'INNER JOIN EMPRESA E ON E.COD_EMPRESA = S.COD_EMPRESA ' +
    'LEFT JOIN ESTADOS ES ON ES.CODIGO_UF = E.UF_EMP ' +
    'WHERE S.USUARIO = :USUARIO ' +
    'ORDER BY E.COD_EMPRESA ',
    ParametersBuilder.Create(1).Add( Usuario ).Build()
  );
end;

function EmpresasRepository.ObterPorSQL(const CacheKey, SQL: string;
  const Params: ParametersValues
): EmpresasEtd;
var
  Q: QueryResult;
begin
  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery( SQL, Params );
  try
    Result := EmpresasEtd.Create();

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

function EmpresasRepository.ListarTodas: EmpresasEtd;
begin
  Result := ObterPorSQL( 'all',
    'SELECT ' + GetCampos() +
    'FROM EMPRESA E ' +   
    'LEFT JOIN ESTADOS ES ON ES.CODIGO_UF = E.UF_EMP ' +
    'ORDER BY E.COD_EMPRESA ',
    ParametersBuilder.Create(0).Build()
  );
end;

end.
