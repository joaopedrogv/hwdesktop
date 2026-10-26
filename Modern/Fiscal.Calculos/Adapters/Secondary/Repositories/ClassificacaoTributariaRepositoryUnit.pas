unit ClassificacaoTributariaRepositoryUnit;

interface

uses
  IClassificacaoTributariaRepositoryUnit,
  CacheableRepositoryUnit,
  ClassificacaoTributariaEtdUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit,
  QueryResultUnit, ClassificacaoTributariaModelUnit, ClassificacaoTributariaCalculoModelUnit;

type                                                                           
  ClassificacaoTributariaRepository = class(IClassificacaoTributariaRepository)
  private
    procedure AdicionarAtualALista(const CClassTrib: string;
      Lista: ClassificacoesTributariasEtd);
    function ObterDaQuery(Query: QueryResult): ClassificacaoTributariaEtd;
  public
    function ObterClassificacaoTributaria(
      const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
    ): ClassificacaoTributariaModel; override;
    function ObterClassificacaoCalculo(Id: Integer): ClassificacaoTributariaCalculoModel; override;
    // Talvez deixou de ser usado
    function ObterClassificacaoCbsIbs(const CClassTrib: string; Data: TDate): ClassificacaoTributariaEtd; override;
    //De uso do ERP
    function ObterTodasEAtual(const CClassTribAtual: string; TipoTributo: TipoTributoEnum): ClassificacoesTributariasEtd; override;
    function ListarClassificacoesServicoSemVinculoNbs(Data: TDate): TArrayString; override;
  end;

implementation

uses
  SysUtils,
  Classes,
  Math,
  ParameterValueUnit,
  BooleanNullableUnit,
  SituacaoTributariaEtdUnit, Contnrs;

type
  TWrapper = class(RecordWrapper)
    Data: ClassificacaoTributariaModel;
  end;

  TCalcWrapper = class(RecordWrapper)
    Data: ClassificacaoTributariaCalculoModel;
  end;

{ ClassificacaoTributariaRepository }

function ClassificacaoTributariaRepository.ObterClassificacaoCalculo(Id: Integer): ClassificacaoTributariaCalculoModel;
var
  CacheKey: string;
  W: TCalcWrapper;
begin
  CacheKey := Format('ClassCalc_%d', [ Id ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT ' +
    'CT.CLTR_ID, CT.CLTR_CD, CT.CLTR_TIPO_ALIQUOTA, ' +
    'CT.CLTR_IND_GMONOPADRAO, CT.CLTR_IND_GMONORETEN, CT.CLTR_IND_GMONORET, CT.CLTR_IND_GMONODIF, ' +
    'ST.SITR_IND_GRED ' +
    'FROM RTC_CLASSIFICACAO_TRIBUTARIA CT ' +
    'JOIN RTC_SITUACAO_TRIBUTARIA ST ON CT.CLTR_SITR_ID = ST.SITR_ID ' +
    'WHERE CT.CLTR_ID = %d', [ Id ]
  ) do
  try
    if IsEmpty then
      Result := ClassificacaoTributariaCalculoModel.NullInstance()

    else
      Result := ClassificacaoTributariaCalculoModel.Create(
        FieldAsInteger('CLTR_ID'),
        FieldAsString('CLTR_CD'),
        FieldAsString('CLTR_TIPO_ALIQUOTA'),
        FieldAreEquals('CLTR_IND_GMONOPADRAO', 1),
        FieldAreEquals('CLTR_IND_GMONORETEN', 1),
        FieldAreEquals('CLTR_IND_GMONORET', 1),
        FieldAreEquals('CLTR_IND_GMONODIF', 1),
        FieldAreEquals('SITR_IND_GRED', 1)
      );

    W := TCalcWrapper.Create();
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W, 1);

  finally
    FreeQueryResult();
  end;
end;

function ClassificacaoTributariaRepository.ObterClassificacaoCbsIbs(const CClassTrib: string; Data: TDate): ClassificacaoTributariaEtd;
var
  CacheKey: string;
  query: QueryResult;
begin
  CacheKey := Format('cbsibs_%s_%s', [ CClassTrib, DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  query := FConnection.CreateQuery(
    'SELECT CT.CLTR_ID, CT.CLTR_CD, CT.CLTR_DESCRICAO, CT.CLTR_MEMORIA_CALCULO, ' +
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
    'FROM RTC_CLASSIFICACAO_TRIBUTARIA CT ' +
    'JOIN RTC_SITUACAO_TRIBUTARIA ST ON CT.CLTR_SITR_ID = ST.SITR_ID ' +
    'JOIN RTC_TRIBUTO_SITUACAO_TRIBUTARIA TST ON TST.TRST_SITR_ID = ST.SITR_ID ' +
//    '--JOIN RTC_TRIBUTO TB ON TST.TRST_TBTO_ID = TB.TBTO_ID ' +
    'WHERE CT.CLTR_CD = :CODIGO ' +
    'AND TST.TIPO_TRIBUTO = 2 ' +
    'AND :DATA BETWEEN CT.CLTR_INICIO_VIGENCIA AND COALESCE(CT.CLTR_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN ST.SITR_INICIO_VIGENCIA AND COALESCE(ST.SITR_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN TST.TRST_INICIO_VIGENCIA AND COALESCE(TST.TRST_FIM_VIGENCIA, :DATA) ',
//    '--AND :DATA BETWEEN TB.TBTO_INICIO_VIGENCIA AND COALESCE(TB.TBTO_FIM_VIGENCIA, :DATA) ',
    ParametersBuilder.Create(2)
      .ByName('CODIGO', CClassTrib)
      .ByName('DATA', Data)
      .Build()
  );
  try
    if query.IsEmpty then
      Result := nil

    else
      Result := ObterDaQuery( query );

    FCacheObjs.Add(CacheKey, Result);

  finally
    Query.Free();
  end;
end;

function ClassificacaoTributariaRepository.ObterClassificacaoTributaria(const CClassTrib: string;
  TipoTributo: TipoTributoEnum; Data: TDate): ClassificacaoTributariaModel;
var
  CacheKey: string;
  W: TWrapper;
begin
  CacheKey := Format('ClassTrib_%s_%d_%s', [ CClassTrib, Ord(TipoTributo), DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT ' +
    'CT.CLTR_ID, CT.CLTR_CD, CT.CLTR_NOMENCLATURA, ST.SITR_CD ' +
    'FROM RTC_CLASSIFICACAO_TRIBUTARIA CT ' +
    'JOIN RTC_SITUACAO_TRIBUTARIA ST ON CT.CLTR_SITR_ID = ST.SITR_ID ' +
    'JOIN RTC_TRIBUTO_SITUACAO_TRIBUTARIA TST ON TST.TRST_SITR_ID = ST.SITR_ID ' +
    'WHERE CT.CLTR_CD = :CODIGO ' +
    'AND TST.TIPO_TRIBUTO = :IDTRIBUTO ' +
    'AND :DATA BETWEEN CT.CLTR_INICIO_VIGENCIA AND COALESCE(CT.CLTR_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN ST.SITR_INICIO_VIGENCIA AND COALESCE(ST.SITR_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN TST.TRST_INICIO_VIGENCIA AND COALESCE(TST.TRST_FIM_VIGENCIA, :DATA) ',
    ParametersBuilder.Create(3)
      .ByName('CODIGO', CClassTrib )
      .ByName('IDTRIBUTO', Ord(TipoTributo) )
      .ByName('DATA', Data )
      .Build()
  ) do
  try
    if IsEmpty then
      Result := ClassificacaoTributariaModel.NullInstance()

    else
      Result := ClassificacaoTributariaModel.Create(
        FieldAsInteger('CLTR_ID'),
        FieldAsString('CLTR_CD'),
        FieldAsString('CLTR_NOMENCLATURA'),
        FieldAsString('SITR_CD')
      );

    W := TWrapper.Create();
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W, 1);

  finally
    FreeQueryResult();
  end;
end;

function ClassificacaoTributariaRepository.ObterDaQuery(
  Query: QueryResult): ClassificacaoTributariaEtd;
begin
  Result := ClassificacaoTributariaEtd.Create(
    Query.FieldAsInteger('CLTR_ID'),
    Query.FieldAsString('CLTR_CD'),
    Query.FieldAsString('CLTR_DESCRICAO'),
    Query.FieldAsString('CLTR_MEMORIA_CALCULO'),
    BooleanNullable.CreateFromString(Query.FieldAsString('CLTR_APROP_CRED_ADQUIRENTE_CBS'), '1'),
    BooleanNullable.CreateFromString(Query.FieldAsString('CLTR_APROP_CRED_ADQUIRENTE_IBS'), '1'),
    BooleanNullable.CreateFromString(Query.FieldAsString('CLTR_CRED_PRESMD_FORNECEDOR'), '1'),
    BooleanNullable.CreateFromString(Query.FieldAsString('CLTR_CRED_PRESMD_ADQUIRENTE'), '1'),
    Query.FieldAsInteger('CLTR_SITR_ID'),
    Query.FieldAsIntNullable('CLTR_TMES_ID'),
    Query.FieldAsString('CLTR_TIPO_ALIQUOTA'),
    Query.FieldAsStringNullable('CLTR_CRED_OPERACAO_ANTECEDENTE'),
    Query.FieldAsString('CLTR_NOMENCLATURA'),
    Query.FieldAreEquals('CLTR_IND_GCREDPRESOPER', '1'),
    Query.FieldAreEquals('CLTR_IND_GMONOPADRAO', '1'),
    Query.FieldAreEquals('CLTR_IND_GMONORETEN', '1'),
    Query.FieldAreEquals('CLTR_IND_GMONORET', '1'),
    Query.FieldAreEquals('CLTR_IND_GMONODIF', '1'),
    Query.FieldAreEquals('CLTR_IND_GESTORNOCRED', '1'),
    Query.FieldAsStringNullable('CLTR_ANEXO'),
    Query.FieldAsDate('CLTR_INICIO_VIGENCIA'),
    Query.FieldAsDateNullable('CLTR_FIM_VIGENCIA'),
    Query.FieldAsDateNullable('CLTR_DATA_ATUALIZACAO'),
    SituacaoTributariaEtd.Create(
      Query.FieldAsInteger('SITR_ID'),
      Query.FieldAsString('SITR_CD'),
      Query.FieldAsString('SITR_DESCRICAO'),
      Query.FieldAreEquals('SITR_IND_GAJUSTECOMPET', 1),
      Query.FieldAreEquals('SITR_IND_GRED', 1),
      Query.FieldAreEquals('SITR_IND_GIBSCBS', 1),
      Query.FieldAreEquals('SITR_IND_GCREDPRESIBSZFM', 1),
      Query.FieldAreEquals('SITR_IND_GTRANSFCRED', 1),
      Query.FieldAreEquals('SITR_IND_GDIF', 1),
      Query.FieldAreEquals('SITR_IND_GIBSCBSMONO', 1),
      Query.FieldAsDate('SITR_INICIO_VIGENCIA'),
      Query.FieldAsDateNullable('SITR_FIM_VIGENCIA')
    )
  );
end;

procedure ClassificacaoTributariaRepository.AdicionarAtualALista(const CClassTrib: string; Lista: ClassificacoesTributariasEtd);
var
  I: Integer;
  item: ClassificacaoTributariaEtd;
begin
  if CClassTrib = '' then
    Exit;

  for I := 0 to Lista.Count - 1 do
    if (Lista.Items[I] as ClassificacaoTributariaEtd).Codigo = CClassTrib then
      Exit
    else if (Lista.Items[I] as ClassificacaoTributariaEtd).Codigo > CClassTrib then
    begin
      item := ObterClassificacaoCbsIbs( CClassTrib, EncodeDate(2025, 1, 1) );
      if item <> nil then
        Lista.Insert(I, item);
      Exit;
    end;
end;

function ClassificacaoTributariaRepository.ObterTodasEAtual(const CClassTribAtual: string;
  TipoTributo: TipoTributoEnum): ClassificacoesTributariasEtd;
var
  CacheKey: string;
  Q: QueryResult;
  I: Integer;
begin
  CacheKey := Format('list_%d', [ Ord(TipoTributo)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
  begin
    AdicionarAtualALista( Trim(CClassTribAtual), Result);
    Exit;
  end;

  // Aqui retorna apenas as classificacoes validas com tratamento tributário
  Q := FConnection.CreateQuery(
    'SELECT * FROM ( ' +
    'SELECT CT.CLTR_ID, CT.CLTR_CD, CT.CLTR_DESCRICAO, CT.CLTR_MEMORIA_CALCULO, ' +
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
    'FROM RTC_TRATAMENTO_CLASSIFICACAO TC ' +
    'INNER JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON CT.CLTR_ID = TC.TRCL_CLTR_ID ' +
    'INNER JOIN RTC_TRATAMENTO_TRIBUTARIO TT ON TT.TRTR_ID = TC.TRCL_TRTR_ID ' +
    'INNER JOIN RTC_SITUACAO_TRIBUTARIA ST ON ST.SITR_ID = CT.CLTR_SITR_ID ' +
    'INNER JOIN RTC_TRIBUTO_SITUACAO_TRIBUTARIA TST ON TST.TRST_SITR_ID = CT.CLTR_SITR_ID ' +
    'WHERE TST.TIPO_TRIBUTO = :TIPO_TRIBUTO ' +
//    'WHERE TST.TIPO_TRIBUTO = :TIPO_TRIBUTO AND CT.CLTR_CD <> :CODIGO ' +
//    'UNION ALL ' +
//    'SELECT CT.CLTR_ID, CT.CLTR_CD, CT.CLTR_DESCRICAO, CT.CLTR_MEMORIA_CALCULO, ' +
//    '       CT.CLTR_APROP_CRED_ADQUIRENTE_CBS, CT.CLTR_APROP_CRED_ADQUIRENTE_IBS, ' +
//    '       CT.CLTR_CRED_PRESMD_FORNECEDOR, CT.CLTR_CRED_PRESMD_ADQUIRENTE, ' +
//    '       CT.CLTR_SITR_ID, CT.CLTR_TMES_ID, CT.CLTR_TIPO_ALIQUOTA, ' +
//    '       CT.CLTR_CRED_OPERACAO_ANTECEDENTE, CT.CLTR_NOMENCLATURA, ' +
//    '       CT.CLTR_INICIO_VIGENCIA, CT.CLTR_FIM_VIGENCIA, ' +
//    '       ST.SITR_ID, ST.SITR_CD, ST.SITR_DESCRICAO, ST.SITR_INICIO_VIGENCIA, ST.SITR_FIM_VIGENCIA ' +
//    'FROM RTC_CLASSIFICACAO_TRIBUTARIA CT ' +
//    'JOIN RTC_SITUACAO_TRIBUTARIA ST ON CT.CLTR_SITR_ID = ST.SITR_ID ' +
//    'JOIN RTC_TRIBUTO_SITUACAO_TRIBUTARIA TST ON TST.TRST_SITR_ID = ST.SITR_ID ' +
//    'WHERE TST.TIPO_TRIBUTO = :TIPO_TRIBUTO AND CT.CLTR_CD = :CODIGO' +
    ') ORDER BY CLTR_CD',
    ParametersBuilder.Create(2)
      .ByName('TIPO_TRIBUTO', IfThen(TipoTributo = tbtIS, 1, 2))
//      .ByName('CODIGO', CClassTribAtual)
      .Build()
  );
  try
    Result := ClassificacoesTributariasEtd.Create;

    while not Q.DataSet.Eof do
    begin
      Result.Add( ObterDaQuery( Q ) );

      Q.DataSet.Next();
    end;

    FCacheObjs.Add(CacheKey, Result);

  finally
    Q.Free();
  end;

  AdicionarAtualALista( Trim(CClassTribAtual), Result);
end;

function ClassificacaoTributariaRepository.ListarClassificacoesServicoSemVinculoNbs(
  Data: TDate
): TArrayString;
var
  i: Integer;
begin
  // Espelho de listarCodigosClassificacoesServicoSemVinculoNbs: somente
  // classificacoes com nomenclatura contendo NBS, vigentes na data e sem
  // vinculo NBS_APLICAVEL vigente na data.
  i := 0;
  SetLength(Result, 10);

  with FConnection.CreateQuery(
    'SELECT CT.CLTR_CD ' +
    'FROM RTC_CLASSIFICACAO_TRIBUTARIA CT ' +
    'WHERE (CT.CLTR_NOMENCLATURA LIKE ''%NBS%'') ' +
    'AND :DATA BETWEEN CT.CLTR_INICIO_VIGENCIA AND COALESCE(CT.CLTR_FIM_VIGENCIA, :DATA) ' +
    'AND CT.CLTR_ID NOT IN ( ' +
    '    SELECT N.NBSA_CLTR_ID ' +
    '    FROM RTC_NBS_APLICAVEL N ' +
    '    WHERE :DATA BETWEEN N.NBSA_INICIO_VIGENCIA AND COALESCE(N.NBSA_FIM_VIGENCIA, :DATA) ' +
    ') ',
    ParametersBuilder.Create(1)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    while not DataSet.Eof do
    begin
      if i >= Length(Result) then
        SetLength(Result, Length(Result) * 2);

      Result[i] := FieldAsString('CLTR_CD');

      Inc(i);
      DataSet.Next();
    end;

    SetLength(Result, i);

  finally
    FreeQueryResult();
  end;
end;

end.
