unit TributoSituacaoTributariaRepositoryUnit;

interface

uses
  ITributoSituacaoTributariaRepositoryUnit,
  CacheableRepositoryUnit,
  TributoSituacaoTributariaEtdUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit;

type                                                                                
  {$IFDEF INTF_ON}
  TributoSituacaoTributariaRepository = class(CacheableRepository, ITributoSituacaoTributariaRepository)
  {$ELSE}                                                                                               
  TributoSituacaoTributariaRepository = class(ITributoSituacaoTributariaRepository)
  {$ENDIF}
  public
    function Obter(const CST: string; TipoTributoId: TipoTributoEnum; Data: TDate): TributoSituacaoTributariaEtd; override;
  end;

implementation

{ TributoSituacaoTributariaRepository }

uses
  SysUtils,
  ParameterValueUnit, SituacaoTributariaEtdUnit;

function TributoSituacaoTributariaRepository.Obter(const CST: string; TipoTributoId: TipoTributoEnum; Data: TDate): TributoSituacaoTributariaEtd;
var
  CacheKey: string;
begin
  CacheKey := Format('%s_%d_%s', [ CST, Ord(TipoTributoId), DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  with FConnection.CreateQuery(
    'SELECT TS.TRST_ID, TS.TRST_SITR_ID, TS.TIPO_TRIBUTO, TS.TRST_INICIO_VIGENCIA, TS.TRST_FIM_VIGENCIA, ' +
    '       ST.SITR_ID, ST.SITR_CD, ST.SITR_DESCRICAO, ST.SITR_INICIO_VIGENCIA, ' +
    '       ST.SITR_FIM_VIGENCIA, ST.SITR_IND_GIBSCBS, ST.SITR_IND_GIBSCBSMONO, ' +
    '       ST.SITR_IND_GRED, ST.SITR_IND_GDIF, ST.SITR_IND_GTRANSFCRED, ' +
    '       ST.SITR_IND_GCREDPRESIBSZFM, ST.SITR_IND_GAJUSTECOMPET ' +
    'FROM RTC_TRIBUTO_SITUACAO_TRIBUTARIA TS ' +
    'LEFT JOIN RTC_SITUACAO_TRIBUTARIA ST ON ST.SITR_ID = TS.TRST_SITR_ID ' +
    'WHERE ST.SITR_CD = :CST ' +
    'AND TS.TIPO_TRIBUTO = :TIPO_TRIBUTO ' +
    'AND :DATA BETWEEN TS.TRST_INICIO_VIGENCIA AND COALESCE(TS.TRST_FIM_VIGENCIA, :DATA) ',
    ParametersBuilder.Create(3)
      .ByName('CST', CST)
      .ByName('TIPO_TRIBUTO', Ord(TipoTributoId))
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := nil

    else
    begin
      Result := TributoSituacaoTributariaEtd.Create(
        FieldAsInteger('TRST_ID'),
        FieldAsInteger('TRST_SITR_ID'),
        TipoTributoEnum( FieldAsInteger('TIPO_TRIBUTO') ),
        FieldAsDate('TRST_INICIO_VIGENCIA'),
        FieldAsDateNullable('TRST_FIM_VIGENCIA'),
        SituacaoTributariaEtd.Create(
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
        )
      );
    end;

    FCacheObjs.Add(CacheKey, Result);

  finally
    FreeQueryResult();
  end;
end;

end.
