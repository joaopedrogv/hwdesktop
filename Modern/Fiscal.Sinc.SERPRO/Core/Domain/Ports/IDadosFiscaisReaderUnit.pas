unit IDadosFiscaisReaderUnit;

interface

uses
  VersaoSerproEtdUnit,
  EstadoEtdUnit,
  MunicipioEtdUnit,
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
  IDadosFiscaisReader = interface
    ['{14AFDBAB-F1BE-46D2-8692-16447E61E31D}']
    /// <summary>
    ///   Configura a origem de leitura do reader (URL base da API, token opaco e
    ///   database da publicacao). O token nunca deve ser registrado ou exibido.
    /// </summary>
    procedure Configurar(const ABaseUrl, AToken, ADatabase: string);
    function ObterUltimaVersao(): VersaoSerproEtd;
    function ObterEstados(): EstadosEtd;
    function ObterMunicipios(): MunicipiosEtd;
    function ObterNBSs(): NbssEtd;
    function ObterAnexos(): AnexosEtd;
    function ObterTiposDFe(): TiposDfeEtd;
    function ObterFundamentacoesLegais(): FundamentacoesLegaisEtd;
    function ObterTomadoresEspecificos(): TomadoresEspecificosEtd;
    function ObterAliquotasReferencia(): AliquotasReferenciaEtd;
    function ObterAliquotasPadrao(): AliquotasPadraoEtd;
    function ObterSituacoesTributarias(): SituacoesTributariasEtd;
    function ObterClassificacoesTributarias(): ClassificacoesTributariasEtd;
    function ObterTiposDFePorClassificacao(): TipoDfeClassificacaoEtdList;
    function ObterPercentuaisReducao(): PercentuaisReducaoEtd;
    function ObterNCMsAplicaveis(): NcmsAplicaveisEtd;
    function ObterNBSsAplicaveis(): NbssAplicaveisEtd;
    function ObterFundamentacoesClassificacoes(): FundamentacoesClassificacoesEtd;
    function ObterExcecoesNCMAplicavel(): ExcecoesNcmAplicavelEtd;
    function ObterExcecoesNBSAplicavel(): ExcecoesNbsAplicavelEtd;
    function ObterTributoSituacoesTributarias(): TributoSituacoesTributariasEtd;
    function ObterTratamentosTributarios(): TratamentosTributariosEtd;
    function ObterTratamentosClassificacoes(): TratamentosClassificacoesEtd;
    function ObterAliquotasAdValorem(): AliquotasAdValoremEtd;
    function ObterAliquotasAdValoremProdutos(): AliquotasAdValoremProdutosEtd;
    function ObterExcecoesAdValoremProdutos(): ExcecoesAdValoremProdutosEtd;
    function ObterUnidadesMedidas(): UnidadesMedidasEtd;
    function ObterAliquotasAdRem(): AliquotaAdRemEtdList;
    function ObterAliquotasAdRemProdutos(): AliquotasAdRemProdutosEtd;
    function ObterExcecoesAdRemProdutos(): ExcecoesAdRemProdutosEtd;
    function ObterAliquotasAdValoremServicos(): AliquotasAdValoremServicosEtd;
    function ObterExcecoesAdValoremServicos(): ExcecoesAdValoremServicosEtd;
    function ObterAliquotasAdRemServicos(): AliquotasAdRemServicosEtd;
    function ObterExcecoesAdRemServicos(): ExcecoesAdRemServicosEtd;
    function ObterRedutoresCompraGovernamental(): RedutoresCompraGovernamentalEtd;
    function ObterTransferenciasCBSEnteGov(): TransferenciaCBSEnteGovEtdList;
    function ObterListaServicosLC116(): ListaServicosLC116EtdList;
    function ObterIndicadoresOperacaoIbsCbs(): IndicadoresOperacaoEtd;
    function ObterClassificacoesNbsIndOpLc(): IndicadoresOpNbsClassificacaoEtd;
  end;

implementation

end.
