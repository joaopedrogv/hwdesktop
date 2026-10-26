unit SituacaoTributariaRepositoryUnit;

interface

uses
  TipoComunsUnit,
  ISituacaoTributariaRepositoryUnit,
  SituacaoTributariaEtdUnit,
  TipoTributoEnumUnit;

type
  SituacaoTributariaRepository = class(ISituacaoTributariaRepository)
  public
    function ConsultarSituacaoTributariaPorCodigo(const CST: string; IdTributo: TipoTributoEnum; Data: TDate): SituacaoTributariaEtd; override;
  end;

implementation

uses
  SysUtils, ParameterValueUnit, CacheableRepositoryUnit;


type
  TWrapper = class(RecordWrapper)
    Data: SituacaoTributariaEtd;
  end;

{ SituacaoTributariaRepository }

function SituacaoTributariaRepository.ConsultarSituacaoTributariaPorCodigo(const CST: string;
  IdTributo: TipoTributoEnum; Data: TDate): SituacaoTributariaEtd;
var
  CacheKey: string;
  W: TWrapper;
begin
  CacheKey := Format('%s_%d_%s', [ CST, Ord(IdTributo), DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT ' +
    '  s.* ' +
    'FROM RTC_SITUACAO_TRIBUTARIA s ' +
    '  JOIN RTC_TRIBUTO_SITUACAO_TRIBUTARIA tst ON tst.TRST_SITR_ID = s.SITR_ID ' +
    'WHERE s.SITR_CD = :cst ' +
    '  AND tst.TIPO_TRIBUTO = :TIPO_TRIBUTO ' +
    '  AND :DATA BETWEEN tst.TRST_INICIO_VIGENCIA AND COALESCE(tst.TRST_FIM_VIGENCIA, :DATA)' +
    '  AND :DATA BETWEEN s.SITR_INICIO_VIGENCIA AND COALESCE(s.SITR_FIM_VIGENCIA, :DATA)' ,
    ParametersBuilder.Create(3)
      .ByName('CST', CST)
      .ByName('TIPO_TRIBUTO', Ord(IdTributo))
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := SituacaoTributariaEtd.NullInstance()

    else
      Result := SituacaoTributariaEtd.Create(
        FieldAsInteger('SITR_ID'),
        FieldAsString('SITR_CD'),
        FieldAsString('SITR_DESCRICAO'),
        FieldAreEquals('SITR_IND_GAJUSTECOMPET', 1),
        FieldAreEquals('SITR_IND_GRED', 1),
        FieldAreEquals('SITR_IND_GIBSCBS', 1),
        FieldAreEquals('SITR_IND_GCREDPRESIBSZFM', 1),
        FieldAreEquals('SITR_IND_GTRANSFCRED', 1),
        FieldAreEquals('SITR_IND_GDIF', 1),
        FieldAreEquals('SITR_IND_GIBSCBSMONO', 1),
        FieldAsDate('SITR_INICIO_VIGENCIA'),
        FieldAsDateNullable('SITR_FIM_VIGENCIA')
      );

    W := TWrapper.Create;
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W);

  finally
    FreeQueryResult();
  end;
end;

end.
