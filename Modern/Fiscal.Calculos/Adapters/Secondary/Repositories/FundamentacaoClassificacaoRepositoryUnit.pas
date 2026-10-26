unit FundamentacaoClassificacaoRepositoryUnit;

interface

uses
  IFundamentacaoClassificacaoRepositoryUnit,
  CacheableRepositoryUnit,
  FundamentacaoClassificacaoModelUnit,
  TipoComunsUnit;

type
  FundamentacaoClassificacaoRepository = class(IFundamentacaoClassificacaoRepository)
  public
    function ObterPorClassificacaoTributariaId(ClassificacaoTributariaId: Integer; Data: TDate): FundamentacaoClassificacaoModel;  override;
  end;

implementation

uses
  SysUtils,
  ParameterValueUnit, FundamentacaoLegalEtdUnit, BooleanNullableUnit, ClassificacaoTributariaEtdUnit,
  SituacaoTributariaEtdUnit;

type
  TWrapper = class(RecordWrapper)
    Data: FundamentacaoClassificacaoModel;
  end;

{ FundamentacaoClassificacaoRepository }

function FundamentacaoClassificacaoRepository.ObterPorClassificacaoTributariaId(
  ClassificacaoTributariaId: Integer; Data: TDate
): FundamentacaoClassificacaoModel;
var
  CacheKey: string;
  W: TWrapper;
begin
  CacheKey := Format('%d_%s', [ ClassificacaoTributariaId, DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT ' +
    '  FL.FDLG_TEXTO_CURTO, CT.CLTR_MEMORIA_CALCULO ' +
    'FROM RTC_FUNDAMENTACAO_CLASSIFICACAO F ' +
    '  INNER JOIN RTC_FUNDAMENTACAO_LEGAL FL ON FL.FDLG_ID = F.FDCL_FDLG_ID ' +
    '  INNER JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON CT.CLTR_ID = F.FDCL_CLTR_ID ' +
    'WHERE F.FDCL_CLTR_ID = :IDCLASSIFICACAOTRIBUTARIA ' +
    '  AND :DATA BETWEEN F.FDCL_INICIO_VIGENCIA AND COALESCE(F.FDCL_FIM_VIGENCIA, :DATA) ',
    ParametersBuilder.Create(2)
      .ByName('IDCLASSIFICACAOTRIBUTARIA', ClassificacaoTributariaId)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := FundamentacaoClassificacaoModel.NullInstance()

    else
      Result := FundamentacaoClassificacaoModel.Create(
        FieldAsString('FDLG_TEXTO_CURTO'),
        FieldAsString('CLTR_MEMORIA_CALCULO')
      );

    W := TWrapper.Create;
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W);

  finally
    FreeQueryResult();
  end;
end;
     {
function FundamentacaoClassificacaoRepository.ObterPorClassificacaoTributariaId(
  ClassificacaoTributariaId: Integer; Data: TDate
): FundamentacaoClassificacaoEtd;
var
  CacheKey: string;
begin
  CacheKey := Format('%d_%s', [ ClassificacaoTributariaId, DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  with FConnection.CreateQuery(
    'SELECT F.FDCL_ID, F.FDCL_CLTR_ID, F.FDCL_FDLG_ID, F.FDCL_INICIO_VIGENCIA, F.FDCL_FIM_VIGENCIA, ' +
    '       FL.FDLG_ID, FL.FDLG_TEXTO, FL.FDLG_TEXTO_CURTO, FL.FDLG_REFERENCIA_NORMATIVA, ' +
    '       FL.FDLG_INICIO_VIGENCIA, FL.FDLG_FIM_VIGENCIA, ' +
    '       CT.CLTR_ID, CT.CLTR_CD, CT.CLTR_DESCRICAO, CT.CLTR_MEMORIA_CALCULO, ' +
    '       CT.CLTR_APROP_CRED_ADQUIRENTE_CBS, CT.CLTR_APROP_CRED_ADQUIRENTE_IBS, ' +
    '       CT.CLTR_CRED_PRESMD_FORNECEDOR, CT.CLTR_CRED_PRESMD_ADQUIRENTE, ' +
    '       CT.CLTR_SITR_ID, CT.CLTR_TMES_ID, CT.CLTR_TIPO_ALIQUOTA, ' +
    '       CT.CLTR_CRED_OPERACAO_ANTECEDENTE, CT.CLTR_NOMENCLATURA, ' +
    '       CT.CLTR_IND_GCREDPRESOPER, CT.CLTR_IND_GMONOPADRAO, CT.CLTR_IND_GMONORETEN, ' +
    '       CT.CLTR_IND_GMONORET, CT.CLTR_IND_GMONODIF, CT.CLTR_IND_GESTORNOCRED, CT.CLTR_ANEXO, ' +
    '       CT.CLTR_INICIO_VIGENCIA, CT.CLTR_FIM_VIGENCIA, CT.CLTR_DATA_ATUALIZACAO, ' +
    '       ST.SITR_ID, ST.SITR_CD, ST.SITR_DESCRICAO, ST.SITR_INICIO_VIGENCIA, ' +
    '       ST.SITR_FIM_VIGENCIA, ST.SITR_IND_GIBSCBS, ST.SITR_IND_GIBSCBSMONO, ' +
    '       ST.SITR_IND_GRED, ST.SITR_IND_GDIF, ST.SITR_IND_GTRANSFCRED, ' +
    '       ST.SITR_IND_GCREDPRESIBSZFM, ST.SITR_IND_GAJUSTECOMPET ' +
    'FROM RTC_FUNDAMENTACAO_CLASSIFICACAO F ' +
    'LEFT JOIN RTC_FUNDAMENTACAO_LEGAL FL ON FL.FDLG_ID = F.FDCL_FDLG_ID ' +
    'LEFT JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON CT.CLTR_ID = F.FDCL_CLTR_ID ' +
    'LEFT JOIN RTC_SITUACAO_TRIBUTARIA ST ON ST.SITR_ID = CT.CLTR_SITR_ID ' +
    'WHERE F.FDCL_CLTR_ID = :IDCLASSIFICACAOTRIBUTARIA ' +
    'AND :DATA BETWEEN F.FDCL_INICIO_VIGENCIA AND COALESCE(F.FDCL_FIM_VIGENCIA, :DATA) ',
    ParametersBuilder.Create(2)
      .ByName('IDCLASSIFICACAOTRIBUTARIA', ClassificacaoTributariaId)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := nil

    else
    begin
      Result := FundamentacaoClassificacaoEtd.Create(
        FieldAsInteger('FDCL_ID'),
        FieldAsInteger('FDCL_CLTR_ID'),
        FieldAsInteger('FDCL_FDLG_ID'),
        FieldAsDate('FDCL_INICIO_VIGENCIA'),
        FieldAsDateNullable('FDCL_FIM_VIGENCIA'),
        ClassificacaoTributariaEtd.Create(
          FieldAsInteger('CLTR_ID'),
          FieldAsString('CLTR_CD'),
          FieldAsString('CLTR_DESCRICAO'),
          FieldAsString('CLTR_MEMORIA_CALCULO'),
          BooleanNullable.CreateFromString(FieldAsString('CLTR_APROP_CRED_ADQUIRENTE_CBS'), '1'),
          BooleanNullable.CreateFromString(FieldAsString('CLTR_APROP_CRED_ADQUIRENTE_IBS'), '1'),
          BooleanNullable.CreateFromString(FieldAsString('CLTR_CRED_PRESMD_FORNECEDOR'), '1'),
          BooleanNullable.CreateFromString(FieldAsString('CLTR_CRED_PRESMD_ADQUIRENTE'), '1'),
          FieldAsInteger('CLTR_SITR_ID'),
          FieldAsIntNullable('CLTR_TMES_ID'),
          FieldAsString('CLTR_TIPO_ALIQUOTA'),
          FieldAsStringNullable('CLTR_CRED_OPERACAO_ANTECEDENTE'),
          FieldAsString('CLTR_NOMENCLATURA'),
          FieldAreEquals('CLTR_IND_GCREDPRESOPER', '1'),
          FieldAreEquals('CLTR_IND_GMONOPADRAO', '1'),
          FieldAreEquals('CLTR_IND_GMONORETEN', '1'),
          FieldAreEquals('CLTR_IND_GMONORET', '1'),
          FieldAreEquals('CLTR_IND_GMONODIF', '1'),
          FieldAreEquals('CLTR_IND_GESTORNOCRED', '1'),
          FieldAsStringNullable('CLTR_ANEXO'),
          FieldAsDate('CLTR_INICIO_VIGENCIA'),
          FieldAsDateNullable('CLTR_FIM_VIGENCIA'),
          FieldAsDateNullable('CLTR_DATA_ATUALIZACAO'),
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
        ),
        FundamentacaoLegalEtd.Create(
          FieldAsInteger('FDLG_ID'),
          FieldAsString('FDLG_TEXTO'),
          FieldAsString('FDLG_TEXTO_CURTO'),
          FieldAsString('FDLG_REFERENCIA_NORMATIVA'),
          FieldAsDate('FDLG_INICIO_VIGENCIA'),
          FieldAsDateNullable('FDLG_FIM_VIGENCIA')
        )
      );
    end;

    FCacheObjs.Add(CacheKey, Result);

  finally
    FreeQueryResult();
  end;
end;
}

end.
