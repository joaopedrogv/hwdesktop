unit SincronizacaoCalculadoraSnapshotUnit;

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
  /// <summary>
  ///   Agregado em memoria com todas as colecoes fiscais da calculadora lidas
  ///   antes de qualquer escrita, mais a versao da publicacao. O snapshot possui
  ///   as colecoes do tipo TObjectList (as listas representadas por array dinamico
  ///   de record sao gerenciadas pelo compilador). O chamador que recebe a
  ///   instancia e o seu dono.
  /// </summary>
  SincronizacaoCalculadoraSnapshot = class
  public
    Versao: VersaoSerproEtd;
    Estados: EstadosEtd;
    Municipios: MunicipiosEtd;
    Nbss: NbssEtd;
    Anexos: AnexosEtd;
    TiposDfe: TiposDfeEtd;
    FundamentacoesLegais: FundamentacoesLegaisEtd;
    TomadoresEspecificos: TomadoresEspecificosEtd;
    AliquotasReferencia: AliquotasReferenciaEtd;
    AliquotasPadrao: AliquotasPadraoEtd;
    SituacoesTributarias: SituacoesTributariasEtd;
    ClassificacoesTributarias: ClassificacoesTributariasEtd;
    TiposDfeClassificacao: TipoDfeClassificacaoEtdList;
    PercentuaisReducao: PercentuaisReducaoEtd;
    NcmsAplicaveis: NcmsAplicaveisEtd;
    NbssAplicaveis: NbssAplicaveisEtd;
    FundamentacoesClassificacoes: FundamentacoesClassificacoesEtd;
    ExcecoesNcmAplicavel: ExcecoesNcmAplicavelEtd;
    ExcecoesNbsAplicavel: ExcecoesNbsAplicavelEtd;
    TributoSituacoesTributarias: TributoSituacoesTributariasEtd;
    TratamentosTributarios: TratamentosTributariosEtd;
    TratamentosClassificacoes: TratamentosClassificacoesEtd;
    AliquotasAdValorem: AliquotasAdValoremEtd;
    AliquotasAdValoremProdutos: AliquotasAdValoremProdutosEtd;
    ExcecoesAdValoremProdutos: ExcecoesAdValoremProdutosEtd;
    UnidadesMedidas: UnidadesMedidasEtd;
    AliquotasAdRem: AliquotaAdRemEtdList;
    AliquotasAdRemProdutos: AliquotasAdRemProdutosEtd;
    ExcecoesAdRemProdutos: ExcecoesAdRemProdutosEtd;
    AliquotasAdValoremServicos: AliquotasAdValoremServicosEtd;
    ExcecoesAdValoremServicos: ExcecoesAdValoremServicosEtd;
    AliquotasAdRemServicos: AliquotasAdRemServicosEtd;
    ExcecoesAdRemServicos: ExcecoesAdRemServicosEtd;
    RedutoresCompraGovernamental: RedutoresCompraGovernamentalEtd;
    TransferenciasCBSEnteGov: TransferenciaCBSEnteGovEtdList;
    ListaServicosLC116: ListaServicosLC116EtdList;
    IndicadoresOperacaoIbsCbs: IndicadoresOperacaoEtd;
    ClassificacoesNbsIndOpLc: IndicadoresOpNbsClassificacaoEtd;

    destructor Destroy; override;
  end;

implementation

uses
  SysUtils;

{ SincronizacaoCalculadoraSnapshot }

destructor SincronizacaoCalculadoraSnapshot.Destroy;
begin
  // Somente as colecoes TObjectList sao liberadas aqui; arrays dinamicos de
  // record sao finalizados automaticamente pelo compilador.
  FreeAndNil(Municipios);
  FreeAndNil(Nbss);
  FreeAndNil(ClassificacoesTributarias);
  FreeAndNil(TiposDfeClassificacao);
  FreeAndNil(NcmsAplicaveis);
  FreeAndNil(NbssAplicaveis);
  FreeAndNil(FundamentacoesClassificacoes);
  FreeAndNil(TributoSituacoesTributarias);
  FreeAndNil(TratamentosClassificacoes);
  FreeAndNil(AliquotasAdRem);
  FreeAndNil(RedutoresCompraGovernamental);
  FreeAndNil(TransferenciasCBSEnteGov);
  FreeAndNil(ListaServicosLC116);

  inherited;
end;

end.
