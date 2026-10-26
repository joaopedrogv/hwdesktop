unit InfComplementarDFeRepositoryUnit;

interface

uses
  SysUtils, Classes,
  IInfComplementarDFeRepositoryUnit, CacheableRepositoryUnit, InfComplementarDFeEtdUnit, TipoInfComplementarEnumUnit;

type
  InfComplementarDFeRepository = class(IInfComplementarDFeRepository)
  public
    function ListarPorTipo(Tipo: TipoInfComplementarEnum): InfComplementarDFeEtdList; override;
  end;

implementation

uses
  QueryResultUnit, ParameterValueUnit, StatusRegistroEnumUnit;

{ InfComplementarDFeRepository }

function InfComplementarDFeRepository.ListarPorTipo(Tipo: TipoInfComplementarEnum): InfComplementarDFeEtdList;
var
  Q: QueryResult;
  CacheKey: string;
begin
  CacheKey := Format('%d_%d', [ Ord(Tipo), FSession.EmpresaId ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'SELECT ' +
    'I.COD_INF, I.COD_EMPRESA, I.TXT, I.TXT_COMPL, I.TIPO, I.ATIVO, I.ATIVO_EM_NFE, I.ATIVO_EM_NFCE ' +
    'FROM SPED_INFORMACAO_COMPLEMENTAR I ' +
    'WHERE I.TIPO = :TIPO AND I.COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(2)
      .ByName('TIPO', TipoInfComplementarEnumStr[Tipo])
      .ByName('COD_EMPRESA', FSession.EmpresaId)
      .Build()
  );
  try
    Result := InfComplementarDFeEtdList.Create();

    while not Q.Eof do
    begin
      Result.Add(InfComplementarDFeEtd.Create(
        Q.FieldAsInteger('COD_INF'),
        Q.FieldAsInteger('COD_EMPRESA'),
        Q.FieldAsStringNullable('TXT'),
        Q.FieldAsStringNullable('TXT_COMPL'),
        Q.FieldAsStringNullable('TIPO'),
        StatusRegistroEnum(Q.FieldAsInteger('ATIVO')),
        Q.FieldAreEquals('ATIVO_EM_NFE', 'S'),
        Q.FieldAreEquals('ATIVO_EM_NFCE', 'S')
      ));
      Q.Next();
    end;

    FCacheObjs.Add( CacheKey, Result, 2 );
  finally
    Q.Free();
  end;
end;

end.
