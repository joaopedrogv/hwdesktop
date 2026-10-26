unit AliquotaReferenciaRepositoryUnit;

interface

uses
  IAliquotaReferenciaRepositoryUnit,
  CacheableRepositoryUnit,
  TipoTributoEnumUnit,
  CurrencyNullableUnit,
  TipoComunsUnit;

type
  AliquotaReferenciaRepository = class(IAliquotaReferenciaRepository)
  public
    function ObterPorTipoTributo(TipoTributo: TipoTributoEnum; Data: TDate): CurrencyNullable; override;
  end;

implementation

uses
  SysUtils,
  ParameterValueUnit;

type
   TWrapper = class(RecordWrapper)
     Data: CurrencyNullable;
   end;

{ AliquotaReferenciaRepository }

function AliquotaReferenciaRepository.ObterPorTipoTributo(TipoTributo: TipoTributoEnum; Data: TDate): CurrencyNullable;
var
  CacheKey: string;
  W: TWrapper;
begin
  CacheKey := Format('%d_%s', [Ord(TipoTributo), DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT A.ALRE_ID, A.ALRE_VALOR, A.ALRE_INICIO_VIGENCIA, A.ALRE_FIM_VIGENCIA, A.TIPO_TRIBUTO '+
    'FROM RTC_ALIQUOTA_REFERENCIA A '+
    'WHERE A.TIPO_TRIBUTO = :IDTRIBUTO '+
    'AND :DATA BETWEEN A.ALRE_INICIO_VIGENCIA AND COALESCE(A.ALRE_FIM_VIGENCIA, :DATA) ',
    ParametersBuilder.Create(3)
      .ByName('IDTRIBUTO', Ord(TipoTributo))
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result.SetNull()

    else
      Result := FieldAsCurrencyNullable('ALRE_VALOR');

    W := TWrapper.Create;
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W);

  finally
    FreeQueryResult();
  end;
end;

end.
