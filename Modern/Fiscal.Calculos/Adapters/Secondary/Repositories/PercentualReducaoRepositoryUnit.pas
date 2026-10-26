unit PercentualReducaoRepositoryUnit;

interface

uses
  IPercentualReducaoRepositoryUnit,
  CacheableRepositoryUnit,
  PercentualReducaoEtdUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit,
  CurrencyNullableUnit;

type                                               
  PercentualReducaoRepository = class(IPercentualReducaoRepository)
  public
    function ObterporClassTribETributo(
      ClassificacaoTributariaId: Integer;
      TipoTributo: TipoTributoEnum;
      Data: TDate
    ): CurrencyNullable; override;
    // ERP
    function ObterporCClassTribETributo(
      const CClassTrib: string;
      TipoTributo: TipoTributoEnum;
      Data: TDate
    ): PercentualReducaoEtd; override;
  end;

implementation

uses
  SysUtils,
  ParameterValueUnit;

type
  TWrapper = class(RecordWrapper)
    Data: PercentualReducaoEtd;
  end;

  CWrapper = class(RecordWrapper)
    Data: CurrencyNullable;
  end;

{ PercentualReducaoRepository }

function PercentualReducaoRepository.ObterporCClassTribETributo(
  const CClassTrib: string; TipoTributo: TipoTributoEnum;
  Data: TDate): PercentualReducaoEtd;
var
  CacheKey: string;
  W: TWrapper;
begin
  CacheKey := Format('%s_%d_%s', [ CClassTrib, Ord(TipoTributo), DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT PR.PERE_ID, PR.PERE_CLTR_ID, PR.TIPO_TRIBUTO, PR.PERE_VALOR, ' +
    '       PR.PERE_INICIO_VIGENCIA, PR.PERE_FIM_VIGENCIA ' +
    'FROM RTC_CLASSIFICACAO_TRIBUTARIA CT ' +
    'INNER JOIN RTC_PERCENTUAL_REDUCAO PR ON PR.PERE_CLTR_ID = CT.CLTR_ID ' +
    'WHERE CT.CLTR_CD = :CCLASSTRIB ' +
    'AND PR.TIPO_TRIBUTO = :IDTRIBUTO ' +
    'AND :DATA BETWEEN PR.PERE_INICIO_VIGENCIA AND COALESCE(PR.PERE_FIM_VIGENCIA, :DATA) ',
    ParametersBuilder.Create(3)
      .ByName('CCLASSTRIB', CClassTrib)
      .ByName('IDTRIBUTO', Ord(TipoTributo))
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := PercentualReducaoEtd.NullInstance()

    else
      Result := PercentualReducaoEtd.CreateEtd(
        FieldAsInteger('PERE_ID'),
        FieldAsInteger('PERE_CLTR_ID'),
        TipoTributoEnum(FieldAsInteger('TIPO_TRIBUTO')),
        FieldAsFloat('PERE_VALOR'),
        FieldAsDate('PERE_INICIO_VIGENCIA'),
        FieldAsDateNullable('PERE_FIM_VIGENCIA')
      );

    W := TWrapper.Create;
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W);

  finally
    FreeQueryResult();
  end;
end;

function PercentualReducaoRepository.ObterporClassTribETributo(
  ClassificacaoTributariaId: Integer;
  TipoTributo: TipoTributoEnum;
  Data: TDate
): CurrencyNullable;
var
  CacheKey: string;
  W: CWrapper;
begin
  CacheKey := Format('%d_%d_%s', [ ClassificacaoTributariaId, Ord(TipoTributo), DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT ' +
    '  PR.PERE_VALOR ' +
    'FROM RTC_PERCENTUAL_REDUCAO PR ' +
    'WHERE PR.PERE_CLTR_ID = :IDCLASSIFICACAOTRIBUTARIA ' +
    'AND PR.TIPO_TRIBUTO = :IDTRIBUTO ' +
    'AND :DATA BETWEEN PR.PERE_INICIO_VIGENCIA AND COALESCE(PR.PERE_FIM_VIGENCIA, :DATA) ',
    ParametersBuilder.Create(3)
      .ByName('IDCLASSIFICACAOTRIBUTARIA', ClassificacaoTributariaId)
      .ByName('IDTRIBUTO', Ord(TipoTributo))
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result.SetNull()

    else
      Result := FieldAsCurrencyNullable('PERE_VALOR');

    W := CWrapper.Create;
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W);

  finally
    FreeQueryResult();
  end;
end;

end.
