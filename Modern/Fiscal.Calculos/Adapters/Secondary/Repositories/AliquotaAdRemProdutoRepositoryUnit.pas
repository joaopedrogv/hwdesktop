unit AliquotaAdRemProdutoRepositoryUnit;

interface

uses
  CacheableRepositoryUnit,
  IAliquotaAdRemProdutoRepositoryUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit,
  AliquotaAdRemModelUnit;

type
  AliquotaAdRemProdutoRepository = class(IAliquotaAdRemProdutoRepository)
  public
    function ObterAliquotaAdRem(const Ncm: string; TipoTributo: TipoTributoEnum; Data: TDate): AliquotaAdRemModel; override;
  end;

implementation

uses
  SysUtils,
  ParameterValueUnit, DateTimeServiceUnit, QueryResultUnit, UnidadeMedidaEtdUnit;

type
  TWrapper = class(RecordWrapper)
    Data: AliquotaAdRemModel;
  end;

{ AliquotaAdRemProdutoRepository }

function AliquotaAdRemProdutoRepository.ObterAliquotaAdRem(const Ncm: string; TipoTributo: TipoTributoEnum;
  Data: TDate): AliquotaAdRemModel;
var
  CacheKey: string;
  W: TWrapper;
begin
  CacheKey := Format('%s_%d_%s', [Ncm, Ord(TipoTributo), DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT FIRST 1 ' +
    '  AL.AARE_VALOR, UN.UNMD_SIGLA ' +
    //'   AL.AARE_ID, AL.AARE_VALOR, AL.AARE_UNMD_ID, AL.AARE_TBTO_ID,' +
    //'   AL.AARE_INICIO_VIGENCIA, AL.AARE_FIM_VIGENCIA,' +
    //'   UN.UNMD_ID, UN.UNMD_SIGLA, UN.UNMD_NOME, UN.UNMD_DESCRICAO,' +
    //'   UN.UNMD_INICIO_VIGENCIA, UN.UNMD_FIM_VIGENCIA' +
    ' FROM RTC_ALIQUOTA_AD_REM_PRODUTO A' +
    '  INNER JOIN RTC_ALIQUOTA_AD_REM AL ON AL.AARE_ID = A.AARP_AARE_ID' +
    '  LEFT JOIN RTC_UNIDADE_MEDIDA UN ON UN.UNMD_ID = AL.AARE_UNMD_ID' +
    ' WHERE EXISTS (' +
    '     SELECT 1 FROM NCM N' +
    '     WHERE N.CODIGO = :NCM' +
    ' )' +
    ' AND AL.AARE_TBTO_ID = :IDTRIBUTO' +
    ' AND A.AARP_NCM_CD = SUBSTRING(:NCM FROM 1 FOR CHAR_LENGTH(A.AARP_NCM_CD))' +
    ' AND :DATA BETWEEN A.AARP_INICIO_VIGENCIA AND COALESCE(A.AARP_FIM_VIGENCIA, :DATA)' +
    ' AND NOT EXISTS (' +
    '     SELECT 1' +
    '     FROM RTC_EXCECAO_AD_REM_PRODUTO E' +
    '     WHERE E.EARP_NCM_CD = SUBSTRING(:NCM FROM 1 FOR CHAR_LENGTH(E.EARP_NCM_CD))' +
    '     AND E.EARP_AARP_ID = A.AARP_ID' +
    '     AND :DATA BETWEEN E.EARP_INICIO_VIGENCIA AND COALESCE(E.EARP_FIM_VIGENCIA, :DATA)' +
    ' )' +
    ' AND NOT EXISTS (' +
    '     SELECT 1' +
    '     FROM RTC_EXCECAO_AD_REM_PRODUTO E' +
    '     WHERE E.EARP_NCM_CD = SUBSTRING(A.AARP_NCM_CD FROM 1 FOR CHAR_LENGTH(E.EARP_NCM_CD))' +
    '     AND E.EARP_AARP_ID = A.AARP_ID' +
    '     AND :DATA BETWEEN E.EARP_INICIO_VIGENCIA AND COALESCE(E.EARP_FIM_VIGENCIA, :DATA)' +
    ' )' +
    ' ORDER BY CHAR_LENGTH(A.AARP_NCM_CD) DESC',
    ParametersBuilder.Create(3)
      .ByName('NCM', Ncm)
      .ByName('IDTRIBUTO', Ord(TipoTributo))
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := AliquotaAdRemModel.NullInstance()

    else
      Result := AliquotaAdRemModel.Create(
        FieldAsCurrency('AARE_VALOR'),
        FieldAsString('UNMD_SIGLA')
      );

    W := TWrapper.Create();
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W);

  finally
    FreeQueryResult();
  end;
end;

end.
