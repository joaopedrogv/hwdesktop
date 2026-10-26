unit AliquotaAdValoremProdutoRepositoryUnit;

interface

uses
  CacheableRepositoryUnit,
  IAliquotaAdValoremProdutoRepositoryUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit,
  CurrencyNullableUnit;

type
  AliquotaAdValoremProdutoRepository = class(IAliquotaAdValoremProdutoRepository)
  public
    function ObterAliquota(const Ncm: string; TipoTributo: TipoTributoEnum; Data: TDate): CurrencyNullable; override;
  end;

implementation

{ AliquotaAdValoremProdutoRepository }

uses
  SysUtils,
  ParameterValueUnit, DateTimeServiceUnit;

function AliquotaAdValoremProdutoRepository.ObterAliquota(const Ncm: string; TipoTributo: TipoTributoEnum;
  Data: TDate): CurrencyNullable;
var
  CacheKey: string;
  CachePtr: Pointer;
  RecordPtr: ^CurrencyNullable;
begin
  CacheKey := Format('%s_%d_%s', [Ncm, Ord(TipoTributo), DateToStr(Data) ]);

  if FCacheRecords.TryGetValue(CacheKey, CachePtr) then
  begin
    RecordPtr := CachePtr;
    Result := RecordPtr^;
    Exit;
  end;

  with FConnection.ExecuteScalar(
    'SELECT FIRST 1 AL.AADV_VALOR ' +
    'FROM RTC_ALIQUOTA_AD_VALOREM_PRODUTO A ' +
    '  INNER JOIN RTC_ALIQUOTA_AD_VALOREM AL ON AL.AADV_ID = A.AAVP_AADV_ID ' +
    'WHERE EXISTS ( ' +
    '    SELECT 1 ' +
    '    FROM NCM N ' +
    '    WHERE N.CODIGO = :NCM ' +
    ') ' +
    'AND A.AAVP_NCM_CD = SUBSTRING(:NCM FROM 1 FOR CHAR_LENGTH(A.AAVP_NCM_CD)) ' +
    'AND AL.TIPO_TRIBUTO = :IDTRIBUTO ' +
    'AND :DATA BETWEEN A.AAVP_INICIO_VIGENCIA AND COALESCE(A.AAVP_FIM_VIGENCIA, :DATA) ' +
    'AND NOT EXISTS ( ' +
    '    SELECT 1 ' +
    '    FROM RTC_EXCECAO_AD_VALOREM_PRODUTO E ' +
    '    WHERE E.EAVP_NCM_CD = SUBSTRING(:NCM FROM 1 FOR CHAR_LENGTH(E.EAVP_NCM_CD)) ' +
    '    AND E.EAVP_AAVP_ID = A.AAVP_ID ' +
    '    AND :DATA BETWEEN E.EAVP_INICIO_VIGENCIA AND COALESCE(E.EAVP_FIM_VIGENCIA, :DATA) ' +
    ') ' +
    'AND NOT EXISTS ( ' +
    '    SELECT 1 ' +
    '    FROM RTC_EXCECAO_AD_VALOREM_PRODUTO E ' +
    '    WHERE E.EAVP_NCM_CD = SUBSTRING(A.AAVP_NCM_CD FROM 1 FOR CHAR_LENGTH(E.EAVP_NCM_CD)) ' +
    '    AND E.EAVP_AAVP_ID = A.AAVP_ID ' +
    '    AND :DATA BETWEEN E.EAVP_INICIO_VIGENCIA AND COALESCE(E.EAVP_FIM_VIGENCIA, :DATA) ' +
    ') ' +
    'ORDER BY CHAR_LENGTH(A.AAVP_NCM_CD) DESC ',
    ParametersBuilder.Create(3)
      .ByName('NCM', Ncm)
      .ByName('IDTRIBUTO', Ord(TipoTributo))
      .ByName('DATA', Data)
      .Build()
  ) do
  begin
    if IsNull then
      Result := CurrencyNullable.NullInstance()

    else
      Result := CurrencyNullable.Create( AsFloat );

    CachePtr := FCacheRecords.NewRecord(SizeOf(CurrencyNullable));
    RecordPtr := CachePtr;
    RecordPtr^ := Result;
    FCacheRecords.Add(CacheKey, CachePtr);
  end;
end;

end.
