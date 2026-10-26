unit AliquotaPadraoRepositoryUnit;

interface

uses
  IAliquotaPadraoRepositoryUnit,
  ParameterValueUnit,
  TipoComunsUnit,
  TipoTributoEnumUnit,
  IntegerNullableUnit,
  AliquotaResultadoModelUnit;

type
  AliquotaPadraoRepository = class(IAliquotaPadraoRepository)
  public
    function ObterAliquota(
      TipoTributo: TipoTributoEnum; const CUF, CMun: IntegerNullable; Data: TDate
    ): AliquotaResultadoModel; override;
  end;

implementation

uses
  SysUtils, CacheableRepositoryUnit;

{ AliquotaPadraoRepository }

function AliquotaPadraoRepository.ObterAliquota(
  TipoTributo: TipoTributoEnum; const CUF, CMun: IntegerNullable; Data: TDate
): AliquotaResultadoModel;
var
  CacheKey: string;
begin
  CacheKey := Format('%d_%s_%s_%s', [Ord(TipoTributo), CUF.ToText(), CMun.ToText(), DateToStr(Data) ]);
  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  with FConnection.CreateQuery(
    'SELECT ' +
    '  R.ALRE_VALOR AS ALIQ_REFERENCIA, ' +
    '  P.ALPA_VALOR AS ALIQ_PADRAO, ' +
    '  P.ALPA_FORMA_APLICACAO AS FORMA_APLICACAO ' +
    'FROM RTC_ALIQUOTA_REFERENCIA R ' +
    'LEFT JOIN RTC_ALIQUOTA_PADRAO P ' +
    '  ON P.ALPA_ALRE_ID = R.ALRE_ID ' +
    '  AND P.ALPA_INICIO_VIGENCIA <= :DATA ' +
    '  AND (P.ALPA_FIM_VIGENCIA IS NULL OR P.ALPA_FIM_VIGENCIA >= :DATA) ' +
    '  AND ( ' +
    '    (R.TIPO_TRIBUTO = 4 AND P.ALPA_MUNI_CD = cast(:MUNICIPIO as integer) AND cast(:MUNICIPIO as integer) IS NOT NULL) OR ' +
    '    (R.TIPO_TRIBUTO = 3 AND P.ALPA_UF_CD = cast(:CODIGOUF as integer) AND cast(:CODIGOUF as integer) IS NOT NULL) ' +
    '  ) ' +
    'WHERE R.TIPO_TRIBUTO = :IDTRIBUTO ' +
    '  AND R.ALRE_INICIO_VIGENCIA <= :DATA ' +
    '  AND (R.ALRE_FIM_VIGENCIA IS NULL OR R.ALRE_FIM_VIGENCIA >= :DATA) ',
    ParametersBuilder.Create(4)
      .ByName('MUNICIPIO', CMun )
      .ByName('CODIGOUF', CUF )
      .ByName('DATA', Data )
      .ByName('IDTRIBUTO', Ord(TipoTributo) )
      .Build()
  ) do
  try
    if IsEmpty then
      Result := nil

    else
      Result := AliquotaResultadoModel.Create(
        FieldAsCurrencyNullable('ALIQ_REFERENCIA'),
        FieldAsCurrencyNullable('ALIQ_PADRAO'),
        FieldAsStringNullable('FORMA_APLICACAO')
      );

    FCacheObjs.Add(CacheKey, Result);

  finally
    FreeQueryResult();
  end;
end;

end.
