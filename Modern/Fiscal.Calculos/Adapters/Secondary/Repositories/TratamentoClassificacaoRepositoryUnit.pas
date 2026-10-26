unit TratamentoClassificacaoRepositoryUnit;

interface

uses
  ITratamentoClassificacaoRepositoryUnit,
  CacheableRepositoryUnit,
  TratamentoClassificacaoEtdUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit, TratamentoClassificacaoModelUnit;

type                                                                           
  TratamentoClassificacaoRepository = class(ITratamentoClassificacaoRepository)
  public
    function ObterTratamentoClassificacao(ClassificacaoFiscalId: Integer; Data: TDate): TratamentoClassificacaoEtd; overload; override;
    function ObterTratamentoClassificacaomodel(ClassificacaoFiscalId: Integer; Data: TDate): TratamentoClassificacaoModel; override;
    //ERP
    function ObterTratamentoClassificacao(const cClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd; overload; override;
    //Dados abertos - sem uso ainda
    function ListarPorTributo(TipoTributo: TipoTributoEnum; Data: TDate): TratamentosClassificacoesEtd; 

  end;

implementation

uses
  SysUtils, Math,
  ParameterValueUnit,
  BooleanNullableUnit,
  SituacaoTributariaEtdUnit, ClassificacaoTributariaEtdUnit, TratamentoTributarioEtdUnit,
  QueryResultUnit;

type
  TWrapper = class(RecordWrapper)
    Data: TratamentoClassificacaoModel;
  end;

{ TratamentoClassificacaoRepository }

function CreateItemFromQuery(Q: QueryResult): TratamentoClassificacaoEtd;
begin
  Result := TratamentoClassificacaoEtd.Create(
    Q.FieldAsInteger('TRCL_ID'),
    Q.FieldAsInteger('TRCL_CLTR_ID'),
    Q.FieldAsInteger('TRCL_TRTR_ID'),
    Q.FieldAsDate('TRCL_INICIO_VIGENCIA'),
    Q.FieldAsDateNullable('TRCL_FIM_VIGENCIA'),
    ClassificacaoTributariaEtd.Create(
      Q.FieldAsInteger('CLTR_ID'),
      Q.FieldAsString('CLTR_CD'),
      Q.FieldAsString('CLTR_DESCRICAO'),
      Q.FieldAsString('CLTR_MEMORIA_CALCULO'),
      BooleanNullable.CreateFromString(Q.FieldAsString('CLTR_APROP_CRED_ADQUIRENTE_CBS'), '1'),
      BooleanNullable.CreateFromString(Q.FieldAsString('CLTR_APROP_CRED_ADQUIRENTE_IBS'), '1'),
      BooleanNullable.CreateFromString(Q.FieldAsString('CLTR_CRED_PRESMD_FORNECEDOR'), '1'),
      BooleanNullable.CreateFromString(Q.FieldAsString('CLTR_CRED_PRESMD_ADQUIRENTE'), '1'),
      Q.FieldAsInteger('CLTR_SITR_ID'),
      Q.FieldAsIntNullable('CLTR_TMES_ID'),
      Q.FieldAsString('CLTR_TIPO_ALIQUOTA'),
      Q.FieldAsStringNullable('CLTR_CRED_OPERACAO_ANTECEDENTE'),
      Q.FieldAsString('CLTR_NOMENCLATURA'),
      Q.FieldAreEquals('CLTR_IND_GCREDPRESOPER', '1'),
      Q.FieldAreEquals('CLTR_IND_GMONOPADRAO', '1'),
      Q.FieldAreEquals('CLTR_IND_GMONORETEN', '1'),
      Q.FieldAreEquals('CLTR_IND_GMONORET', '1'),
      Q.FieldAreEquals('CLTR_IND_GMONODIF', '1'),
      Q.FieldAreEquals('CLTR_IND_GESTORNOCRED', '1'),
      Q.FieldAsStringNullable('CLTR_ANEXO'),
      Q.FieldAsDate('CLTR_INICIO_VIGENCIA'),
      Q.FieldAsDateNullable('CLTR_FIM_VIGENCIA'),
      Q.FieldAsDateNullable('CLTR_DATA_ATUALIZACAO'),
      SituacaoTributariaEtd.Create(
        Q.FieldAsInteger('SITR_ID'),
        Q.FieldAsString('SITR_CD'),
        Q.FieldAsString('SITR_DESCRICAO'),
        Q.FieldAreEquals('SITR_IND_GAJUSTECOMPET', 1),
        Q.FieldAreEquals('SITR_IND_GRED', 1),
        Q.FieldAreEquals('SITR_IND_GIBSCBS', 1),
        Q.FieldAreEquals('SITR_IND_GCREDPRESIBSZFM', 1),
        Q.FieldAreEquals('SITR_IND_GTRANSFCRED', 1),
        Q.FieldAreEquals('SITR_IND_GDIF', 1),
        Q.FieldAreEquals('SITR_IND_GIBSCBSMONO', 1),
        Q.FieldAsDate('SITR_INICIO_VIGENCIA'),
        Q.FieldAsDateNullable('SITR_FIM_VIGENCIA')
      )
    ),
    TratamentoTributarioEtd.Create(
      Q.FieldAsInteger('TRTR_ID'),
      Q.FieldAsString('TRTR_DESCRICAO'),
      Q.FieldAsStringNullable('TRTR_EXPS_ALIQUOTA'),
      Q.FieldAsStringNullable('TRTR_EXPS_ALIQUOTA_EFETIVA'),
      Q.FieldAsString('TRTR_EXPS_BASE_CALCULO'),
      Q.FieldAsString('TRTR_EXPS_TRIBUTO_CALCULADO'),
      Q.FieldAsString('TRTR_EXPS_TRIBUTO_DEVIDO'),
      Q.FieldAsStringNullable('TRTR_EXPS_PERC_DIFERIMENTO'),
      Q.FieldAsStringNullable('TRTR_EXPS_VALOR_DIFERIMENTO'),
      Q.FieldAreEquals('TRTR_IN_INCOMP_COM_SUSPENSAO', 1),
      Q.FieldAreEquals('TRTR_IN_EXIGE_GRUPO_DESONERACAO', 1),
      Q.FieldAreEquals('TRTR_IN_POSSUI_PERC_REDUCAO', 1),
      Q.FieldAreEquals('TRTR_IN_POSSUI_AJUSTE', 1),
      Q.FieldAreEquals('TRTR_IN_POSSUI_REDUTOR', 1),
      Q.FieldAreEquals('TRTR_IN_POSSUI_MONOFASIA', 1),
      Q.FieldAsDate('TRTR_INICIO_VIGENCIA'),
      Q.FieldAsDateNullable('TRTR_FIM_VIGENCIA')
    )
  );
end;

function TratamentoClassificacaoRepository.ListarPorTributo(
  TipoTributo: TipoTributoEnum; Data: TDate): TratamentosClassificacoesEtd;
var
  CacheKey: string;
  sql: string;
  query: QueryResult;
begin
  CacheKey := Format('list_%d_%s', [ Ord(TipoTributo), DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  sql :=
    'SELECT TC.TRCL_ID, TC.TRCL_CLTR_ID, TC.TRCL_TRTR_ID, TC.TRCL_INICIO_VIGENCIA, TC.TRCL_FIM_VIGENCIA, ' +
    '       CT.CLTR_ID, CT.CLTR_CD, CT.CLTR_DESCRICAO, CT.CLTR_MEMORIA_CALCULO, ' +
    '       CT.CLTR_APROP_CRED_ADQUIRENTE_CBS, CT.CLTR_APROP_CRED_ADQUIRENTE_IBS, ' +
    '       CT.CLTR_CRED_PRESMD_FORNECEDOR, CT.CLTR_CRED_PRESMD_ADQUIRENTE, ' +
    '       CT.CLTR_SITR_ID, CT.CLTR_TMES_ID, CT.CLTR_TIPO_ALIQUOTA, ' +
    '       CT.CLTR_CRED_OPERACAO_ANTECEDENTE, CT.CLTR_NOMENCLATURA, ' +
    '       CT.CLTR_IND_GCREDPRESOPER, CT.CLTR_IND_GMONOPADRAO, CT.CLTR_IND_GMONORETEN, ' +
    '       CT.CLTR_IND_GMONORET, CT.CLTR_IND_GMONODIF, CT.CLTR_IND_GESTORNOCRED, CT.CLTR_ANEXO, ' +
    '       CT.CLTR_INICIO_VIGENCIA, CT.CLTR_FIM_VIGENCIA, CT.CLTR_DATA_ATUALIZACAO, ' +
    '       TT.TRTR_ID, TT.TRTR_DESCRICAO, TT.TRTR_EXPS_ALIQUOTA, TT.TRTR_EXPS_ALIQUOTA_EFETIVA, ' +
    '       TT.TRTR_EXPS_BASE_CALCULO, TT.TRTR_EXPS_TRIBUTO_CALCULADO, TT.TRTR_EXPS_TRIBUTO_DEVIDO, ' +
    '       TT.TRTR_EXPS_PERC_DIFERIMENTO, TT.TRTR_EXPS_VALOR_DIFERIMENTO, ' +
    '       TT.TRTR_IN_INCOMP_COM_SUSPENSAO, TT.TRTR_IN_EXIGE_GRUPO_DESONERACAO, ' +
    '       TT.TRTR_IN_POSSUI_PERC_REDUCAO, TT.TRTR_IN_POSSUI_AJUSTE, TT.TRTR_IN_POSSUI_REDUTOR, ' +
    '       TT.TRTR_IN_POSSUI_MONOFASIA, TT.TRTR_INICIO_VIGENCIA, TT.TRTR_FIM_VIGENCIA, ' +
    '       ST.SITR_ID, ST.SITR_CD, ST.SITR_DESCRICAO, ST.SITR_INICIO_VIGENCIA, ' +
    '       ST.SITR_FIM_VIGENCIA, ST.SITR_IND_GIBSCBS, ST.SITR_IND_GIBSCBSMONO, ' +
    '       ST.SITR_IND_GRED, ST.SITR_IND_GDIF, ST.SITR_IND_GTRANSFCRED, ' +
    '       ST.SITR_IND_GCREDPRESIBSZFM, ST.SITR_IND_GAJUSTECOMPET ' +
    'FROM RTC_TRATAMENTO_CLASSIFICACAO TC ' +
    'INNER JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON CT.CLTR_ID = TC.TRCL_CLTR_ID ' +
    'INNER JOIN RTC_TRATAMENTO_TRIBUTARIO TT ON TT.TRTR_ID = TC.TRCL_TRTR_ID ' +
    'INNER JOIN RTC_SITUACAO_TRIBUTARIA ST ON ST.SITR_ID = CT.CLTR_SITR_ID ' +
    'INNER JOIN RTC_TRIBUTO_SITUACAO_TRIBUTARIA TST ON TST.TRST_SITR_ID = CT.CLTR_SITR_ID ' +
    'WHERE TST.TIPO_TRIBUTO = :TIPO_TRIBUTO ' +
    'AND :DATA BETWEEN TC.TRCL_INICIO_VIGENCIA AND COALESCE(TC.TRCL_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN CT.CLTR_INICIO_VIGENCIA AND COALESCE(CT.CLTR_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN TT.TRTR_INICIO_VIGENCIA AND COALESCE(TT.TRTR_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN TST.TRST_INICIO_VIGENCIA AND COALESCE(TST.TRST_FIM_VIGENCIA, :DATA) ';

  // C06-05: no Java, consultarTratamentoClassificacaoImpostoSeletivo adiciona
  // filtro de vigencia de SITUACAO_TRIBUTARIA; consultarTratamentoClassificacaoCbsIbs
  // nao o adiciona. Ambas ordenam por ct.CLTR_CD.
  if TipoTributo = tbtIS then
    sql := sql + 'AND :DATA BETWEEN ST.SITR_INICIO_VIGENCIA AND COALESCE(ST.SITR_FIM_VIGENCIA, :DATA) ';

  sql := sql + 'ORDER BY CT.CLTR_CD';

  query := FConnection.CreateQuery(
    sql,
    ParametersBuilder.Create(2)
      .ByName('TIPO_TRIBUTO', IfThen(TipoTributo = tbtIS, 1, 2))
      .ByName('DATA', Data)
      .Build()
  );
  try
    Result := TratamentosClassificacoesEtd.Create;

    while not query.DataSet.Eof do
    begin
      Result.Add( CreateItemFromQuery( query ) );

      query.DataSet.Next();
    end;

    FCacheObjs.Add(CacheKey, Result);

  finally
    query.Free();
  end;
end;

function TratamentoClassificacaoRepository.ObterTratamentoClassificacao(
  ClassificacaoFiscalId: Integer; Data: TDate
): TratamentoClassificacaoEtd;
var
  CacheKey: string;
  Q: QueryResult;
begin
  CacheKey := Format('_%d_%s', [ ClassificacaoFiscalId, DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'SELECT TC.TRCL_ID, TC.TRCL_CLTR_ID, TC.TRCL_TRTR_ID, TC.TRCL_INICIO_VIGENCIA, TC.TRCL_FIM_VIGENCIA, ' +
    '       CT.CLTR_ID, CT.CLTR_CD, CT.CLTR_DESCRICAO, CT.CLTR_MEMORIA_CALCULO, ' +
    '       CT.CLTR_APROP_CRED_ADQUIRENTE_CBS, CT.CLTR_APROP_CRED_ADQUIRENTE_IBS, ' +
    '       CT.CLTR_CRED_PRESMD_FORNECEDOR, CT.CLTR_CRED_PRESMD_ADQUIRENTE, ' +
    '       CT.CLTR_SITR_ID, CT.CLTR_TMES_ID, CT.CLTR_TIPO_ALIQUOTA, ' +
    '       CT.CLTR_CRED_OPERACAO_ANTECEDENTE, CT.CLTR_NOMENCLATURA, ' +
    '       CT.CLTR_IND_GCREDPRESOPER, CT.CLTR_IND_GMONOPADRAO, CT.CLTR_IND_GMONORETEN, ' +
    '       CT.CLTR_IND_GMONORET, CT.CLTR_IND_GMONODIF, CT.CLTR_IND_GESTORNOCRED, CT.CLTR_ANEXO, ' +
    '       CT.CLTR_INICIO_VIGENCIA, CT.CLTR_FIM_VIGENCIA, CT.CLTR_DATA_ATUALIZACAO, ' +
    '       TT.TRTR_ID, TT.TRTR_DESCRICAO, TT.TRTR_EXPS_ALIQUOTA, TT.TRTR_EXPS_ALIQUOTA_EFETIVA, ' +
    '       TT.TRTR_EXPS_BASE_CALCULO, TT.TRTR_EXPS_TRIBUTO_CALCULADO, TT.TRTR_EXPS_TRIBUTO_DEVIDO, ' +
    '       TT.TRTR_EXPS_PERC_DIFERIMENTO, TT.TRTR_EXPS_VALOR_DIFERIMENTO, ' +
    '       TT.TRTR_IN_INCOMP_COM_SUSPENSAO, TT.TRTR_IN_EXIGE_GRUPO_DESONERACAO, ' +
    '       TT.TRTR_IN_POSSUI_PERC_REDUCAO, TT.TRTR_IN_POSSUI_AJUSTE, TT.TRTR_IN_POSSUI_REDUTOR, ' +
    '       TT.TRTR_IN_POSSUI_MONOFASIA, TT.TRTR_INICIO_VIGENCIA, TT.TRTR_FIM_VIGENCIA, ' +
    '       ST.SITR_ID, ST.SITR_CD, ST.SITR_DESCRICAO, ST.SITR_INICIO_VIGENCIA, ' +
    '       ST.SITR_FIM_VIGENCIA, ST.SITR_IND_GIBSCBS, ST.SITR_IND_GIBSCBSMONO, ' +
    '       ST.SITR_IND_GRED, ST.SITR_IND_GDIF, ST.SITR_IND_GTRANSFCRED, ' +
    '       ST.SITR_IND_GCREDPRESIBSZFM, ST.SITR_IND_GAJUSTECOMPET ' +
    'FROM RTC_TRATAMENTO_CLASSIFICACAO TC ' +
    'LEFT JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON CT.CLTR_ID = TC.TRCL_CLTR_ID ' +
    'LEFT JOIN RTC_TRATAMENTO_TRIBUTARIO TT ON TT.TRTR_ID = TC.TRCL_TRTR_ID ' +
    'LEFT JOIN RTC_SITUACAO_TRIBUTARIA ST ON ST.SITR_ID = CT.CLTR_SITR_ID ' +
    'WHERE CT.CLTR_ID = :IDCLASSIFICACAO ' +
    'AND :DATA BETWEEN TC.TRCL_INICIO_VIGENCIA AND COALESCE(TC.TRCL_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN CT.CLTR_INICIO_VIGENCIA AND COALESCE(CT.CLTR_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN TT.TRTR_INICIO_VIGENCIA AND COALESCE(TT.TRTR_FIM_VIGENCIA, :DATA) ',

    ParametersBuilder.Create(2)
      .ByName('IDCLASSIFICACAO', ClassificacaoFiscalId)
      .ByName('DATA', Data)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( Q );

    FCacheObjs.Add(CacheKey, Result);

  finally
    Q.Free();
  end;
end;

function TratamentoClassificacaoRepository.ObterTratamentoClassificacao(
  const cClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd;
var
  CacheKey: string;
  Q: QueryResult;
begin
  CacheKey := Format('_%s_%s', [ cClassTrib, DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'SELECT TC.TRCL_ID, TC.TRCL_CLTR_ID, TC.TRCL_TRTR_ID, TC.TRCL_INICIO_VIGENCIA, TC.TRCL_FIM_VIGENCIA, ' +
    '       CT.CLTR_ID, CT.CLTR_CD, CT.CLTR_DESCRICAO, CT.CLTR_MEMORIA_CALCULO, ' +
    '       CT.CLTR_APROP_CRED_ADQUIRENTE_CBS, CT.CLTR_APROP_CRED_ADQUIRENTE_IBS, ' +
    '       CT.CLTR_CRED_PRESMD_FORNECEDOR, CT.CLTR_CRED_PRESMD_ADQUIRENTE, ' +
    '       CT.CLTR_SITR_ID, CT.CLTR_TMES_ID, CT.CLTR_TIPO_ALIQUOTA, ' +
    '       CT.CLTR_CRED_OPERACAO_ANTECEDENTE, CT.CLTR_NOMENCLATURA, ' +
    '       CT.CLTR_IND_GCREDPRESOPER, CT.CLTR_IND_GMONOPADRAO, CT.CLTR_IND_GMONORETEN, ' +
    '       CT.CLTR_IND_GMONORET, CT.CLTR_IND_GMONODIF, CT.CLTR_IND_GESTORNOCRED, CT.CLTR_ANEXO, ' +
    '       CT.CLTR_INICIO_VIGENCIA, CT.CLTR_FIM_VIGENCIA, CT.CLTR_DATA_ATUALIZACAO, ' +
    '       TT.TRTR_ID, TT.TRTR_DESCRICAO, TT.TRTR_EXPS_ALIQUOTA, TT.TRTR_EXPS_ALIQUOTA_EFETIVA, ' +
    '       TT.TRTR_EXPS_BASE_CALCULO, TT.TRTR_EXPS_TRIBUTO_CALCULADO, TT.TRTR_EXPS_TRIBUTO_DEVIDO, ' +
    '       TT.TRTR_EXPS_PERC_DIFERIMENTO, TT.TRTR_EXPS_VALOR_DIFERIMENTO, ' +
    '       TT.TRTR_IN_INCOMP_COM_SUSPENSAO, TT.TRTR_IN_EXIGE_GRUPO_DESONERACAO, ' +
    '       TT.TRTR_IN_POSSUI_PERC_REDUCAO, TT.TRTR_IN_POSSUI_AJUSTE, TT.TRTR_IN_POSSUI_REDUTOR, ' +
    '       TT.TRTR_IN_POSSUI_MONOFASIA, TT.TRTR_INICIO_VIGENCIA, TT.TRTR_FIM_VIGENCIA, ' +
    '       ST.SITR_ID, ST.SITR_CD, ST.SITR_DESCRICAO, ST.SITR_INICIO_VIGENCIA, ' +
    '       ST.SITR_FIM_VIGENCIA, ST.SITR_IND_GIBSCBS, ST.SITR_IND_GIBSCBSMONO, ' +
    '       ST.SITR_IND_GRED, ST.SITR_IND_GDIF, ST.SITR_IND_GTRANSFCRED, ' +
    '       ST.SITR_IND_GCREDPRESIBSZFM, ST.SITR_IND_GAJUSTECOMPET ' +
    'FROM RTC_TRATAMENTO_CLASSIFICACAO TC ' +
    'INNER JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON CT.CLTR_ID = TC.TRCL_CLTR_ID ' +
    'INNER JOIN RTC_TRIBUTO_SITUACAO_TRIBUTARIA TST ON TST.TRST_SITR_ID = CT.CLTR_SITR_ID ' +
    'LEFT JOIN RTC_TRATAMENTO_TRIBUTARIO TT ON TT.TRTR_ID = TC.TRCL_TRTR_ID ' +
    'LEFT JOIN RTC_SITUACAO_TRIBUTARIA ST ON ST.SITR_ID = CT.CLTR_SITR_ID ' +
    'WHERE CT.CLTR_CD = :CCLASSTRIB AND TST.TIPO_TRIBUTO = :TIPO_TRIBUTO ' +
    'AND :DATA BETWEEN TC.TRCL_INICIO_VIGENCIA AND COALESCE(TC.TRCL_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN CT.CLTR_INICIO_VIGENCIA AND COALESCE(CT.CLTR_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN TT.TRTR_INICIO_VIGENCIA AND COALESCE(TT.TRTR_FIM_VIGENCIA, :DATA) ',

    ParametersBuilder.Create(2)
      .ByName('CCLASSTRIB', cClassTrib)
      .ByName('TIPO_TRIBUTO', IfThen(TipoTributo = tbtIS, 1, 2))
      .ByName('DATA', Data)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( Q );

    FCacheObjs.Add(CacheKey, Result);

  finally
    Q.Free();
  end;
end;

function TratamentoClassificacaoRepository.ObterTratamentoClassificacaomodel(ClassificacaoFiscalId: Integer;
  Data: TDate): TratamentoClassificacaoModel;
var
  CacheKey: string;
  W: TWrapper;
begin
  CacheKey := Format('Obt_%d_%s', [ ClassificacaoFiscalId, DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT ' +
    '  TT.TRTR_ID, CT.CLTR_ID, TT.TRTR_IN_INCOMP_COM_SUSPENSAO, TT.TRTR_IN_EXIGE_GRUPO_DESONERACAO ' +
    'FROM RTC_TRATAMENTO_CLASSIFICACAO TC ' +
    '  INNER JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON CT.CLTR_ID = TC.TRCL_CLTR_ID ' +
    '  INNER JOIN RTC_TRATAMENTO_TRIBUTARIO TT ON TT.TRTR_ID = TC.TRCL_TRTR_ID ' +
    'WHERE CT.CLTR_ID = :IDCLASSIFICACAO ' +
    '  AND :DATA BETWEEN TC.TRCL_INICIO_VIGENCIA AND COALESCE(TC.TRCL_FIM_VIGENCIA, :DATA) ',

    ParametersBuilder.Create(2)
      .ByName('IDCLASSIFICACAO', ClassificacaoFiscalId)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := TratamentoClassificacaoModel.NullInstance()

    else
      Result := TratamentoClassificacaoModel.Create(
        FieldAsInteger('TRTR_ID'),
        FieldAsInteger('CLTR_ID'),
        FieldAreEquals('TRTR_IN_INCOMP_COM_SUSPENSAO', 1),
        FieldAreEquals('TRTR_IN_EXIGE_GRUPO_DESONERACAO', 1)
      );

    W := TWrapper.Create();
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W, 1);

  finally
    FreeQueryResult();
  end;
end;

end.
