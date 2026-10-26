unit IIndicadorOperacaoRepositoryUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/repository/IndicadorOperacaoRepository.java

interface

uses
  TipoComunsUnit,
  CacheableRepositoryUnit,
  StringNullableUnit,
  BooleanNullableUnit,
  IntegerNullableUnit,
  LocalIncidenciaEnumUnit;

type
  /// <summary>
  ///   Linha retornada por buscarIndicadorOperacaoPorData /
  ///   buscarIndicadorOperacaoPorDataComNbs.
  ///   Mapeia as colunas IOIC_CD, IOIC_TIPO_OPERACAO,
  ///   IOIC_CD_LOCAL_FORNECIMENTO_DFE, IOIC_LOCAL_INCIDENCIA,
  ///   IOIC_CD_LOCAL_INCIDENCIA, CNIL_IN_PS_ONEROSA e
  ///   CNIL_IN_ADQ_EXTERIOR. Na consulta geral (sem NBS) os dois ultimos campos
  ///   sao nulos; o codigo de local de fornecimento DFe e IntegerNullable porque
  ///   o v0042 deixou de exigir IOIC_CD_LOCAL_FORNECIMENTO_DFE IS NOT NULL e o
  ///   Java admite NULL nessa coluna (nao existe enum LocalFornecimento no
  ///   Delphi, entao o codigo permanece inteiro, agora anulavel).
  ///   LocalIncidencia (string, IOIC_LOCAL_INCIDENCIA) e CodigoLocalIncidencia
  ///   (tipado, IOIC_CD_LOCAL_INCIDENCIA) coexistem, como em
  ///   IndicadorOperacao.java v0042, que mantem a string e acrescenta o enum sem
  ///   remover nem renomear o campo anterior.
  /// </summary>
  IndicadorOperacaoLinha = record
    CIndOp: string;
    TipoOperacao: string;
    // IOIC_CD_LOCAL_FORNECIMENTO_DFE e anulavel no v0042: IntegerNullable em vez
    // de Integer, preservando o codigo inteiro (nao ha enum LocalFornecimento
    // no Delphi) e representando SQL NULL como ausencia.
    CodigoLocalFornecimento: IntegerNullable;
    LocalIncidencia: string;
    // Ausencia do codigo tipado: SQL NULL corresponde a liUnassigned, o valor
    // neutro do enum que nao existe no Java. Nunca alimentar Ord=0 (nem o
    // literal 0) em LocalIncidenciaFromCodigo, que so aceita 1..7 e lanca nos
    // demais codigos; o codigo de incidencia nao deve ser serializado como 0,
    // e sim tratado como ausente (omissao/nulo).
    // Tipo qualificado pelo unit porque o campo LocalIncidencia (string) oculta
    // o identificador do enum no escopo do record.
    CodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia;
    PrestacaoServicoOnerosa: BooleanNullable;
    AdquirenteExterior: BooleanNullable;
  end;

  IndicadoresOperacaoLinha = array of IndicadorOperacaoLinha;

  /// <summary>
  ///   Linha do par devolvido por BuscarLocalOperacaoPorIndOp. Espelha a linha
  ///   {IOIC_CD_LOCAL_FORNECIMENTO_DFE, IOIC_CD_LOCAL_INCIDENCIA} do Java v0042.
  ///   CodigoLocalFornecimento e IntegerNullable porque a coluna admite NULL no
  ///   v0042. CodigoLocalIncidencia usa o valor neutro liUnassigned para SQL
  ///   NULL: nunca se chama LocalIncidenciaFromCodigo(0) nem se serializa 0.
  /// </summary>
  LocalOperacaoPorIndOpLinha = record
    CodigoLocalFornecimento: IntegerNullable;
    // Tipo qualificado pelo unit para nao depender da resolucao do identificador
    // do enum no escopo do record.
    CodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia;
  end;

  /// <summary>
  ///   Resultado de BuscarLocalOperacaoPorIndOp. O Java v0042 devolve um Object[]
  ///   cujo elemento [0] e a propria linha; aqui o mesmo contrato e expresso como
  ///   array de linhas tipadas, preservando Result[0] como a linha e a ausencia
  ///   de registro como array vazio (equivalente ao resultado null/empty do Java,
  ///   que leva a IndicadorOperacaoNaoEncontradoException). Nao e um array
  ///   escalar de duas posicoes.
  /// </summary>
  LocalOperacaoPorIndOpResultado = array of LocalOperacaoPorIndOpLinha;

  /// <summary>
  ///   Linha retornada por buscarSituacoesClassificacoesPorNbsEData e
  ///   buscarSituacaoClassificacaoPorClassificacao. Encontrada=false sinaliza
  ///   ausencia de registro (espelho do retorno null do Java).
  /// </summary>
  SituacaoClassificacaoLinha = record
    CodigoSituacaoTributaria: string;
    DescricaoSituacaoTributaria: string;
    CodigoClassificacaoTributaria: string;
    DescricaoClassificacaoTributaria: string;
    Encontrada: Boolean;
  end;

  SituacoesClassificacoesLinha = array of SituacaoClassificacaoLinha;

  /// <summary>
  ///   Porta de acesso aos indicadores de operacao e as situacoes/classificacoes
  ///   associadas a servicos (NFS-e). Equivale a IndicadorOperacaoRepository.java.
  /// </summary>
  IIndicadorOperacaoRepository = class(CacheableRepository)
  public
    function ValidarCombinacaoExiste(
      const NbsCd: string;
      const CClassTrib: string;
      const CIndOp: string;
      const CTribNac: StringNullable;
      DataOcorrenciaFatoGerador: TDate
    ): Integer; virtual; abstract;

    /// <summary>
    ///   Contrato alinhado ao Java v0042: devolve o par
    ///   {IOIC_CD_LOCAL_FORNECIMENTO_DFE, IOIC_CD_LOCAL_INCIDENCIA} com
    ///   resultado[0] como a linha (LocalOperacaoPorIndOpResultado). Ausencia de
    ///   registro = array vazio. Ausencia de IOIC_CD_LOCAL_INCIDENCIA =
    ///   liUnassigned; ausencia de IOIC_CD_LOCAL_FORNECIMENTO_DFE =
    ///   IntegerNullable nulo.
    /// </summary>
    function BuscarLocalOperacaoPorIndOp(
      const CIndOp: string; Data: TDate
    ): LocalOperacaoPorIndOpResultado; virtual; abstract;

    function BuscarIndicadorOperacaoPorData(
      Data: TDate
    ): IndicadoresOperacaoLinha; virtual; abstract;

    function BuscarIndicadorOperacaoPorDataComNbs(
      Data: TDate; const Nbs: string
    ): IndicadoresOperacaoLinha; virtual; abstract;

    function BuscarSituacoesClassificacoesPorNbsEData(
      const Nbs: string; Data: TDate
    ): SituacoesClassificacoesLinha; virtual; abstract;

    function BuscarSituacaoClassificacaoPorClassificacao(
      const CodigoClassificacaoTributaria: string; Data: TDate
    ): SituacaoClassificacaoLinha; virtual; abstract;
  end;

implementation

end.
