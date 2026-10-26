unit IndicadorOperacaoRepositoryUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/repository/IndicadorOperacaoRepository.java

interface

uses
  IIndicadorOperacaoRepositoryUnit,
  CacheableRepositoryUnit,
  TipoComunsUnit,
  StringNullableUnit;

type
  /// <summary>
  ///   Adaptador que consulta os indicadores de operacao e as
  ///   situacoes/classificacoes associadas a servicos (NFS-e), filtrando por
  ///   vigencia conforme o comportamento do Java v0042
  ///   (IndicadorOperacaoRepository.java).
  /// </summary>
  IndicadorOperacaoRepository = class(IIndicadorOperacaoRepository)
  public
    function ValidarCombinacaoExiste(
      const NbsCd: string;
      const CClassTrib: string;
      const CIndOp: string;
      const CTribNac: StringNullable;
      DataOcorrenciaFatoGerador: TDate
    ): Integer; override;

    function BuscarLocalOperacaoPorIndOp(
      const CIndOp: string; Data: TDate
    ): LocalOperacaoPorIndOpResultado; override;

    function BuscarIndicadorOperacaoPorData(
      Data: TDate
    ): IndicadoresOperacaoLinha; override;

    function BuscarIndicadorOperacaoPorDataComNbs(
      Data: TDate; const Nbs: string
    ): IndicadoresOperacaoLinha; override;

    function BuscarSituacoesClassificacoesPorNbsEData(
      const Nbs: string; Data: TDate
    ): SituacoesClassificacoesLinha; override;

    function BuscarSituacaoClassificacaoPorClassificacao(
      const CodigoClassificacaoTributaria: string; Data: TDate
    ): SituacaoClassificacaoLinha; override;
  end;

implementation

uses
  SysUtils,
  ParameterValueUnit,
  BooleanNullableUnit,
  IntegerNullableUnit,
  LocalIncidenciaEnumUnit;

{ IndicadorOperacaoRepository }

function IndicadorOperacaoRepository.ValidarCombinacaoExiste(
  const NbsCd: string;
  const CClassTrib: string;
  const CIndOp: string;
  const CTribNac: StringNullable;
  DataOcorrenciaFatoGerador: TDate
): Integer;
begin
  // Espelho de validarCombinacaoExiste: retorna 1 quando existe combinacao
  // vigente para a data do fato gerador; 0 caso contrario.
  with FConnection.CreateQuery(
    'SELECT FIRST 1 1 ' +
    'FROM RTC_CLASSIF_NBS_INDOP_LC C ' +
    'INNER JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON C.CNIL_CLTR_ID = CT.CLTR_ID ' +
    'INNER JOIN RTC_INDICADOR_OPERACAO_IBS_CBS IO ON C.CNIL_IOIC_ID = IO.IOIC_ID ' +
    'WHERE C.CNIL_NBS_CD = :NBSCD ' +
    'AND CT.CLTR_CD = :CCLASSTRIB ' +
    'AND IO.IOIC_CD = :CINDOP ' +
    'AND (:CTRIBNAC IS NULL OR C.CNIL_LSLC_CD = :CTRIBNAC) ' +
    'AND C.CNIL_INICIO_VIGENCIA <= :DATAOCORRENCIAFATOGERADOR ' +
    'AND (C.CNIL_FIM_VIGENCIA IS NULL OR C.CNIL_FIM_VIGENCIA >= :DATAOCORRENCIAFATOGERADOR) ',
    ParametersBuilder.Create(5)
      .ByName('NBSCD', NbsCd)
      .ByName('CCLASSTRIB', CClassTrib)
      .ByName('CINDOP', CIndOp)
      .ByName('CTRIBNAC', CTribNac)
      .ByName('DATAOCORRENCIAFATOGERADOR', DataOcorrenciaFatoGerador)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := 0
    else
      Result := 1;

  finally
    FreeQueryResult();
  end;
end;

function IndicadorOperacaoRepository.BuscarLocalOperacaoPorIndOp(
  const CIndOp: string; Data: TDate
): LocalOperacaoPorIndOpResultado;
var
  i: Integer;
begin
  // Espelho de buscarLocalOperacaoPorIndOp v0042: projeta o par
  // {IOIC_CD_LOCAL_FORNECIMENTO_DFE, IOIC_CD_LOCAL_INCIDENCIA}. O Java devolve
  // Object[] com resultado[0] como a linha; aqui o mesmo contrato e expresso
  // como array de linhas tipadas (Result[0] = linha). Ausencia de registro =
  // array vazio. SQL NULL na incidencia vira liUnassigned (nunca
  // LocalIncidenciaFromCodigo(0) nem 0 serializado); SQL NULL no fornecimento
  // vira IntegerNullable nulo.
  i := 0;
  SetLength(Result, 10);

  with FConnection.CreateQuery(
    'SELECT IO.IOIC_CD_LOCAL_FORNECIMENTO_DFE, IO.IOIC_CD_LOCAL_INCIDENCIA ' +
    'FROM RTC_INDICADOR_OPERACAO_IBS_CBS IO ' +
    'WHERE IO.IOIC_CD = :CINDOP ' +
    'AND :DATA BETWEEN IO.IOIC_INICIO_VIGENCIA AND COALESCE(IO.IOIC_FIM_VIGENCIA, :DATA) ',
    ParametersBuilder.Create(2)
      .ByName('CINDOP', CIndOp)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    while not DataSet.Eof do
    begin
      if i >= Length(Result) then
        SetLength(Result, Length(Result) * 2);

      Result[i].CodigoLocalFornecimento := FieldAsIntNullable('IOIC_CD_LOCAL_FORNECIMENTO_DFE');

      if FieldIsNull('IOIC_CD_LOCAL_INCIDENCIA') then
        Result[i].CodigoLocalIncidencia := LocalIncidenciaEnumUnit.liUnassigned
      else
        Result[i].CodigoLocalIncidencia := LocalIncidenciaEnumUnit.LocalIncidenciaFromCodigo(
          FieldAsInteger('IOIC_CD_LOCAL_INCIDENCIA'));

      Inc(i);
      DataSet.Next();
    end;

    SetLength(Result, i);

  finally
    FreeQueryResult();
  end;
end;

function IndicadorOperacaoRepository.BuscarIndicadorOperacaoPorData(
  Data: TDate
): IndicadoresOperacaoLinha;
var
  i: Integer;
begin
  // Espelho de buscarIndicadorOperacaoPorData: colunas 6 e 7 sao nulas e
  // IOIC_CD_LOCAL_FORNECIMENTO_DFE deixou de ser exigido como nao nulo no v0042
  // (pode retornar SQL NULL, mapeado como IntegerNullable nulo).
  i := 0;
  SetLength(Result, 10);

  with FConnection.CreateQuery(
    'SELECT IO.IOIC_CD, IO.IOIC_TIPO_OPERACAO, IO.IOIC_CD_LOCAL_FORNECIMENTO_DFE, ' +
    '       IO.IOIC_LOCAL_INCIDENCIA, IO.IOIC_CD_LOCAL_INCIDENCIA, ' +
    '       CAST(NULL AS INTEGER) AS CNIL_IN_PS_ONEROSA, ' +
    '       CAST(NULL AS INTEGER) AS CNIL_IN_ADQ_EXTERIOR ' +
    'FROM RTC_INDICADOR_OPERACAO_IBS_CBS IO ' +
    'WHERE IO.IOIC_TIPO_OPERACAO IS NOT NULL ' +
    'AND :DATA BETWEEN IO.IOIC_INICIO_VIGENCIA AND COALESCE(IO.IOIC_FIM_VIGENCIA, :DATA) ' +
    'ORDER BY IO.IOIC_CD ',
    ParametersBuilder.Create(1)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    while not DataSet.Eof do
    begin
      if i >= Length(Result) then
        SetLength(Result, Length(Result) * 2);

      Result[i].CIndOp := FieldAsString('IOIC_CD');
      Result[i].TipoOperacao := FieldAsString('IOIC_TIPO_OPERACAO');
      Result[i].CodigoLocalFornecimento := FieldAsIntNullable('IOIC_CD_LOCAL_FORNECIMENTO_DFE');
      Result[i].LocalIncidencia := FieldAsString('IOIC_LOCAL_INCIDENCIA');

      if FieldIsNull('IOIC_CD_LOCAL_INCIDENCIA') then
        Result[i].CodigoLocalIncidencia := LocalIncidenciaEnumUnit.liUnassigned
      else
        Result[i].CodigoLocalIncidencia := LocalIncidenciaEnumUnit.LocalIncidenciaFromCodigo(
          FieldAsInteger('IOIC_CD_LOCAL_INCIDENCIA'));

      Result[i].PrestacaoServicoOnerosa := BooleanNullable.NullInstance();
      Result[i].AdquirenteExterior := BooleanNullable.NullInstance();

      Inc(i);
      DataSet.Next();
    end;

    SetLength(Result, i);

  finally
    FreeQueryResult();
  end;
end;

function IndicadorOperacaoRepository.BuscarIndicadorOperacaoPorDataComNbs(
  Data: TDate; const Nbs: string
): IndicadoresOperacaoLinha;
var
  i: Integer;
begin
  i := 0;
  SetLength(Result, 10);

  with FConnection.CreateQuery(
    'SELECT DISTINCT IO.IOIC_CD, IO.IOIC_TIPO_OPERACAO, IO.IOIC_CD_LOCAL_FORNECIMENTO_DFE, ' +
    '       IO.IOIC_LOCAL_INCIDENCIA, IO.IOIC_CD_LOCAL_INCIDENCIA, ' +
    '       C.CNIL_IN_PS_ONEROSA, C.CNIL_IN_ADQ_EXTERIOR ' +
    'FROM RTC_INDICADOR_OPERACAO_IBS_CBS IO ' +
    'INNER JOIN RTC_CLASSIF_NBS_INDOP_LC C ON IO.IOIC_ID = C.CNIL_IOIC_ID ' +
    'WHERE C.CNIL_NBS_CD = :NBS ' +
    'AND :DATA BETWEEN IO.IOIC_INICIO_VIGENCIA AND COALESCE(IO.IOIC_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN C.CNIL_INICIO_VIGENCIA AND COALESCE(C.CNIL_FIM_VIGENCIA, :DATA) ' +
    'AND IO.IOIC_TIPO_OPERACAO IS NOT NULL ' +
    'ORDER BY IO.IOIC_CD ',
    ParametersBuilder.Create(2)
      .ByName('DATA', Data)
      .ByName('NBS', Nbs)
      .Build()
  ) do
  try
    while not DataSet.Eof do
    begin
      if i >= Length(Result) then
        SetLength(Result, Length(Result) * 2);

      Result[i].CIndOp := FieldAsString('IOIC_CD');
      Result[i].TipoOperacao := FieldAsString('IOIC_TIPO_OPERACAO');
      Result[i].CodigoLocalFornecimento := FieldAsIntNullable('IOIC_CD_LOCAL_FORNECIMENTO_DFE');
      Result[i].LocalIncidencia := FieldAsString('IOIC_LOCAL_INCIDENCIA');

      if FieldIsNull('IOIC_CD_LOCAL_INCIDENCIA') then
        Result[i].CodigoLocalIncidencia := LocalIncidenciaEnumUnit.liUnassigned
      else
        Result[i].CodigoLocalIncidencia := LocalIncidenciaEnumUnit.LocalIncidenciaFromCodigo(
          FieldAsInteger('IOIC_CD_LOCAL_INCIDENCIA'));

      if FieldIsNull('CNIL_IN_PS_ONEROSA') then
        Result[i].PrestacaoServicoOnerosa := BooleanNullable.NullInstance()
      else
        Result[i].PrestacaoServicoOnerosa := BooleanNullable.Create(FieldAreEquals('CNIL_IN_PS_ONEROSA', 1));

      if FieldIsNull('CNIL_IN_ADQ_EXTERIOR') then
        Result[i].AdquirenteExterior := BooleanNullable.NullInstance()
      else
        Result[i].AdquirenteExterior := BooleanNullable.Create(FieldAreEquals('CNIL_IN_ADQ_EXTERIOR', 1));

      Inc(i);
      DataSet.Next();
    end;

    SetLength(Result, i);

  finally
    FreeQueryResult();
  end;
end;

function IndicadorOperacaoRepository.BuscarSituacoesClassificacoesPorNbsEData(
  const Nbs: string; Data: TDate
): SituacoesClassificacoesLinha;
var
  i: Integer;
begin
  i := 0;
  SetLength(Result, 10);

  with FConnection.CreateQuery(
    'SELECT DISTINCT ST.SITR_CD, ST.SITR_DESCRICAO, CT.CLTR_CD, CT.CLTR_DESCRICAO ' +
    'FROM RTC_CLASSIF_NBS_INDOP_LC C ' +
    'INNER JOIN RTC_CLASSIFICACAO_TRIBUTARIA CT ON C.CNIL_CLTR_ID = CT.CLTR_ID ' +
    'INNER JOIN RTC_SITUACAO_TRIBUTARIA ST ON CT.CLTR_SITR_ID = ST.SITR_ID ' +
    'WHERE C.CNIL_NBS_CD = :NBS ' +
    'AND :DATA BETWEEN C.CNIL_INICIO_VIGENCIA AND COALESCE(C.CNIL_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN CT.CLTR_INICIO_VIGENCIA AND COALESCE(CT.CLTR_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN ST.SITR_INICIO_VIGENCIA AND COALESCE(ST.SITR_FIM_VIGENCIA, :DATA) ' +
    'ORDER BY CT.CLTR_CD, ST.SITR_CD ',
    ParametersBuilder.Create(2)
      .ByName('NBS', Nbs)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    while not DataSet.Eof do
    begin
      if i >= Length(Result) then
        SetLength(Result, Length(Result) * 2);

      Result[i].CodigoSituacaoTributaria := FieldAsString('SITR_CD');
      Result[i].DescricaoSituacaoTributaria := FieldAsString('SITR_DESCRICAO');
      Result[i].CodigoClassificacaoTributaria := FieldAsString('CLTR_CD');
      Result[i].DescricaoClassificacaoTributaria := FieldAsString('CLTR_DESCRICAO');
      Result[i].Encontrada := True;

      Inc(i);
      DataSet.Next();
    end;

    SetLength(Result, i);

  finally
    FreeQueryResult();
  end;
end;

function IndicadorOperacaoRepository.BuscarSituacaoClassificacaoPorClassificacao(
  const CodigoClassificacaoTributaria: string; Data: TDate
): SituacaoClassificacaoLinha;
begin
  Result.Encontrada := False;

  with FConnection.CreateQuery(
    'SELECT FIRST 1 ST.SITR_CD, ST.SITR_DESCRICAO, CT.CLTR_CD, CT.CLTR_DESCRICAO ' +
    'FROM RTC_CLASSIFICACAO_TRIBUTARIA CT ' +
    'INNER JOIN RTC_SITUACAO_TRIBUTARIA ST ON CT.CLTR_SITR_ID = ST.SITR_ID ' +
    'WHERE CT.CLTR_CD = :CODIGOCLASSIFICACAOTRIBUTARIA ' +
    'AND :DATA BETWEEN CT.CLTR_INICIO_VIGENCIA AND COALESCE(CT.CLTR_FIM_VIGENCIA, :DATA) ' +
    'AND :DATA BETWEEN ST.SITR_INICIO_VIGENCIA AND COALESCE(ST.SITR_FIM_VIGENCIA, :DATA) ',
    ParametersBuilder.Create(2)
      .ByName('CODIGOCLASSIFICACAOTRIBUTARIA', CodigoClassificacaoTributaria)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if not IsEmpty then
    begin
      Result.CodigoSituacaoTributaria := FieldAsString('SITR_CD');
      Result.DescricaoSituacaoTributaria := FieldAsString('SITR_DESCRICAO');
      Result.CodigoClassificacaoTributaria := FieldAsString('CLTR_CD');
      Result.DescricaoClassificacaoTributaria := FieldAsString('CLTR_DESCRICAO');
      Result.Encontrada := True;
    end;

  finally
    FreeQueryResult();
  end;
end;

end.
