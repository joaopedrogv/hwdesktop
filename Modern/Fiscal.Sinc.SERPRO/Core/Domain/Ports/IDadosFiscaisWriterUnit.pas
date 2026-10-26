unit IDadosFiscaisWriterUnit;

interface

uses
  VersaoSerproEtdUnit,
  EstadoEtdUnit,
  MunicipioEtdUnit,
  NcmEtdUnit,
  NbsEtdUnit,
  AnexoEtdUnit,
  TipoDfeEtdUnit,
  TipoDfeClassificacaoEtdUnit,
  FundamentacaoLegalEtdUnit,
  TomadorEspecificoEtdUnit,
  AliquotaReferenciaEtdUnit,
  AliquotaPadraoEtdUnit,
  SituacaoTributariaEtdUnit,
  ClassificacaoTributariaEtdUnit,
  PercentualReducaoEtdUnit,
  NcmAplicavelEtdUnit,
  NbsAplicavelEtdUnit,
  FundamentacaoClassificacaoEtdUnit,
  ExcecaoNcmAplicavelEtdUnit,
  ExcecaoNbsAplicavelEtdUnit,
  TributoSituacaoTributariaEtdUnit,
  TratamentoTributarioEtdUnit,
  TratamentoClassificacaoEtdUnit,
  AliquotaAdValoremEtdUnit,
  AliquotaAdValoremProdutoEtdUnit,
  ExcecaoAdValoremProdutoEtdUnit,
  UnidadeMedidaEtdUnit,
  AliquotaAdRemEtdUnit,
  AliquotaAdRemProdutoEtdUnit,
  ExcecaoAdRemProdutoEtdUnit,
  AliquotaAdValoremServicoEtdUnit,
  ExcecaoAdValoremServicoEtdUnit,
  AliquotaAdRemServicoEtdUnit,
  ExcecaoAdRemServicoEtdUnit,
  RedutorCompraGovernamentalEtdUnit,
  TransferenciaCBSEnteGovEtdUnit,
  ListaServicosLC116EtdUnit,
  IndicadorOperacaoEtdUnit,
  IndicadorOpNbsClassificacaoEtdUnit;

type
  IDadosFiscaisWriter = interface
    ['{58CB1BC2-4E67-4DBF-8D1B-9C896736CACD}']
    procedure ExcluirTodosDadosFiscais();

    function ObterUltimaVersao(): VersaoSerproEtd;
    procedure SalvarEstados(const Dados: EstadosEtd);
    procedure SalvarMunicipios(const Dados: MunicipiosEtd);
    procedure SalvarAnexos(const Dados: AnexosEtd);
    procedure SalvarTiposDFe(const Dados: TiposDfeEtd);
    procedure SalvarNCMs(const Dados: NcmsEtd);
    procedure SalvarNBSs(const Dados: NbssEtd);
    procedure SalvarFundamentacoesLegais(const Dados: FundamentacoesLegaisEtd);
    procedure SalvarTomadoresEspecificos(const Dados: TomadoresEspecificosEtd);
    procedure SalvarAliquotasReferencia(const Dados: AliquotasReferenciaEtd);
    procedure SalvarAliquotasPadrao(const Dados: AliquotasPadraoEtd);
    procedure SalvarSituacoesTributarias(const Dados: SituacoesTributariasEtd);
    procedure SalvarClassificacoesTributarias(const Dados: ClassificacoesTributariasEtd);
    procedure SalvarTiposDFePorClassificacao(const Dados: TipoDfeClassificacaoEtdList);
    procedure SalvarPercentuaisReducao(const Dados: PercentuaisReducaoEtd);
    procedure SalvarNCMsAplicaveis(const Dados: NcmsAplicaveisEtd);
    procedure SalvarNBSsAplicaveis(const Dados: NbssAplicaveisEtd);
    procedure SalvarFundamentacoesClassificacoes(const Dados: FundamentacoesClassificacoesEtd);
    procedure SalvarExcecoesNCMAplicavel(const Dados: ExcecoesNcmAplicavelEtd);
    procedure SalvarExcecoesNBSAplicavel(const Dados: ExcecoesNbsAplicavelEtd);
    procedure SalvarTributoSituacoesTributarias(const Dados: TributoSituacoesTributariasEtd);
    procedure SalvarTratamentosTributarios(const Dados: TratamentosTributariosEtd);
    procedure SalvarTratamentosClassificacoes(const Dados: TratamentosClassificacoesEtd);
    procedure SalvarAliquotasAdValorem(const Dados: AliquotasAdValoremEtd);
    procedure SalvarAliquotasAdValoremProdutos(const Dados: AliquotasAdValoremProdutosEtd);
    procedure SalvarExcecoesAdValoremProdutos(const Dados: ExcecoesAdValoremProdutosEtd);
    procedure SalvarUnidadesMedidas(const Dados: UnidadesMedidasEtd);
    procedure SalvarAliquotasAdRem(const Dados: AliquotaAdRemEtdList);
    procedure SalvarAliquotasAdRemProdutos(const Dados: AliquotasAdRemProdutosEtd);
    procedure SalvarExcecoesAdRemProdutos(const Dados: ExcecoesAdRemProdutosEtd);
    procedure SalvarAliquotasAdValoremServicos(const Dados: AliquotasAdValoremServicosEtd);
    procedure SalvarExcecoesAdValoremServicos(const Dados: ExcecoesAdValoremServicosEtd);
    procedure SalvarAliquotasAdRemServicos(const Dados: AliquotasAdRemServicosEtd);
    procedure SalvarExcecoesAdRemServicos(const Dados: ExcecoesAdRemServicosEtd);
    procedure SalvarRedutoresCompraGovernamental(const Dados: RedutoresCompraGovernamentalEtd);
    procedure SalvarTransferenciasCBSEnteGov(const Dados: TransferenciaCBSEnteGovEtdList);
    procedure SalvarListaServicosLC116(const Dados: ListaServicosLC116EtdList);
    procedure SalvarIndicadoresOperacaoIbsCbs(const Dados: IndicadoresOperacaoEtd);
    procedure SalvarClassificacoesNbsIndOpLc(const Dados: IndicadoresOpNbsClassificacaoEtd);
    procedure SalvarUltimaVersao(const Versao: VersaoSerproEtd);
  end;

implementation

end.
