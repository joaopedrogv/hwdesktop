unit AliquotaAdValoremServicoRepositoryUnit;

interface

uses
  IAliquotaAdValoremServicoRepositoryUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit,
  CurrencyNullableUnit;

type
  AliquotaAdValoremServicoRepository = class(IAliquotaAdValoremServicoRepository)
  public
    function ObterAliquotaAdValorem(
      const Nbs: string; TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate
    ): CurrencyNullable; override;
    function ObterAliquotaAdValoremPorClassificacaoTributaria(
      TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate
    ): CurrencyNullable; override;
  end;

implementation

uses
  SysUtils,
  ParameterValueUnit, DateTimeServiceUnit, CacheableRepositoryUnit;

type
  TWrapper = class(RecordWrapper)
    Data: CurrencyNullable;
  end;

{ AliquotaAdValoremServicoRepository }

function AliquotaAdValoremServicoRepository.ObterAliquotaAdValorem(
  const Nbs: string; TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate
): CurrencyNullable;
var
  CacheKey: string;
  W: TWrapper;
begin
  CacheKey := Format('%s_%d_%d_%s', [Nbs, Ord(TipoTributo), ClassifiscacaoTributariaId, DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.ExecuteScalar(
    'SELECT ' +
    'A.AAVS_NBS_CD, AL.AADV_VALOR ' +
    'FROM RTC_ALIQUOTA_AD_VALOREM_SERVICO A ' +
    'INNER JOIN RTC_ALIQUOTA_AD_VALOREM AL ON AL.AADV_ID = A.AAVS_AADV_ID ' +
    'LEFT JOIN RTC_CLASSIFICACAO_TRIBUTARIA C ON C.CLTR_ID = AL.AADV_CLTR_ID ' +
    'WHERE EXISTS ( ' +
    '  SELECT 1 ' +
    '  FROM NBS N ' +
    '  WHERE N.COD_NBS = :NBS ' +
    ') ' +
    'AND A.AAVS_NBS_CD = SUBSTRING(:NBS FROM 1 FOR CHAR_LENGTH(A.AAVS_NBS_CD)) ' +
    'AND AL.TIPO_TRIBUTO = :IDTRIBUTO ' +
    'AND ((COALESCE(:IDCLASSTRIB, 0) = 0) OR (C.CLTR_ID = :IDCLASSTRIB)) ' +
    'AND :DATA BETWEEN A.AAVS_INICIO_VIGENCIA AND COALESCE(A.AAVS_FIM_VIGENCIA, :DATA) ' +
    'AND NOT EXISTS ( ' +
    '  SELECT 1 ' +
    '  FROM RTC_EXCECAO_AD_VALOREM_SERVICO E ' +
    '  WHERE E.EAVS_NBS_CD = SUBSTRING(:NBS FROM 1 FOR CHAR_LENGTH(E.EAVS_NBS_CD)) ' +
    '  AND E.EAVS_AAVS_ID = A.AAVS_ID ' +
    '  AND :DATA BETWEEN E.EAVS_INICIO_VIGENCIA AND COALESCE(E.EAVS_FIM_VIGENCIA, :DATA) ' +
    ') ' +
    'AND NOT EXISTS ( ' +
    '  SELECT 1 ' +
    '  FROM RTC_EXCECAO_AD_VALOREM_SERVICO E ' +
    '  WHERE E.EAVS_NBS_CD = SUBSTRING(A.AAVS_NBS_CD FROM 1 FOR CHAR_LENGTH(E.EAVS_NBS_CD)) ' +
    '  AND E.EAVS_AAVS_ID = A.AAVS_ID ' +
    '  AND :DATA BETWEEN E.EAVS_INICIO_VIGENCIA AND COALESCE(E.EAVS_FIM_VIGENCIA, :DATA) ' +
    ') ' +
    'ORDER BY CHAR_LENGTH(A.AAVS_NBS_CD) DESC ',
    ParametersBuilder.Create(2)
      .ByName('NBS', Nbs)
      .ByName('IDTRIBUTO', Ord(TipoTributo))
      .ByName('IDCLASSTRIB', ClassifiscacaoTributariaId )
      .ByName('DATA', Data)
      .Build()
  ) do
  begin
    if IsNull then
      Result := CurrencyNullable.NullInstance()

    else
      Result := CurrencyNullable.Create( AsCurrency );

    W := TWrapper.Create();
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W);
  end;
end;

function AliquotaAdValoremServicoRepository.ObterAliquotaAdValoremPorClassificacaoTributaria(
  TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate
): CurrencyNullable;
var
  CacheKey: string;
  W: TWrapper;
begin
  CacheKey := Format('%d_%d_%s', [Ord(TipoTributo), ClassifiscacaoTributariaId, DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.ExecuteScalar(
    'SELECT aadv.AADV_VALOR ' +
    'FROM RTC_ALIQUOTA_AD_VALOREM aadv ' +
    'WHERE aadv.AADV_TBTO_ID = :IDTRIBUTO ' +
    'AND aadv.AADV_CLTR_ID = :IDCLASSTRIB ' +
    'AND :data BETWEEN aadv.AADV_INICIO_VIGENCIA AND COALESCE(aadv.AADV_FIM_VIGENCIA, :data) ',
    ParametersBuilder.Create(3)
      .ByName('IDTRIBUTO', Ord(TipoTributo))
      .ByName('IDCLASSTRIB', ClassifiscacaoTributariaId )
      .ByName('DATA', Data)
      .Build()
  ) do
  begin
    if IsNull then
      Result := CurrencyNullable.NullInstance()

    else
      Result := CurrencyNullable.CreateOrNull( AsCurrency );

    W := TWrapper.Create();
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W);
  end;
end;

end.
