unit ERPWriterUnit;

interface

uses
  IDadosFiscaisWriterUnit, IDataBaseConnectionUnit, INcmWriterUnit, IIbptWriterUnit, ITabelasFiscaisNFSeWriterUnit,
  VersaoSerproEtdUnit,
  ItemIbptEtdUnit,
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
  CodigoTributacaoNacionalNFSeEtdUnit,
  CodigoIndicadorOperacaoNFSeEtdUnit,
  CorrelacaoFiscalNFSeEtdUnit,
  TransferenciaCBSEnteGovEtdUnit,
  ListaServicosLC116EtdUnit,
  IndicadorOperacaoEtdUnit,
  IndicadorOpNbsClassificacaoEtdUnit,
  LocalIncidenciaEnumUnit;

type
  ERPWriter = class(TInterfacedObject, IDadosFiscaisWriter, INcmWriter, IIbptWriter, ITabelasFiscaisNFSeWriter)
  private
    const CONFIG_VERSAO_RTC = 'rtc_versao_calculadora';
  public
    FConnection: IDatabaseConnection;

    constructor Create(const Connection: IDatabaseConnection);

    function ObterUltimaVersao(): VersaoSerproEtd;
    procedure ExcluirTodosDadosFiscais();
    procedure ExcluirNCMs();
    procedure ExcluirItensIBPT(const UF: string);
    procedure ExcluirCodigosTributacaoNacionalNFSe();
    procedure ExcluirCodigosIndicadorOperacaoNFSe();
    procedure ExcluirCorrelacaoFiscalNFSe();
    procedure SalvarCodigosTributacaoNacionalNFSe(const Dados: CodigoTributacaoNacionalNFSeEtdList);
    procedure SalvarCodigosIndicadorOperacaoNFSe(const Dados: CodigoIndicadorOperacaoNFSeEtdList);
    procedure SalvarCorrelacaoFiscalNFSe(const Dados: CorrelacaoFiscalNFSeEtdList);
    procedure SalvarItensIBPT(const Dados: ItemIbptEtdList);
    procedure SalvarEstados(const Dados: EstadosEtd);
    procedure SalvarMunicipios(const Dados: MunicipiosEtd);
    procedure SalvarNCMs(const Dados: NcmsEtd);
    procedure SalvarNBSs(const Dados: NbssEtd);
    procedure SalvarAnexos(const Dados: AnexosEtd);
    procedure SalvarTiposDFe(const Dados: TiposDfeEtd);
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

uses
  SysUtils,
  Classes,
  Contnrs,
  Math,
  ParameterValueUnit,
  DateAndTimeNullableUnit,
  IntegerNullableUnit,
  BooleanNullableUnit,
  StringNullableUnit,
  ScalarResultUnit;

{ ERPWriter }

constructor ERPWriter.Create(const Connection: IDatabaseConnection);
begin
  FConnection := Connection;
end;

procedure ERPWriter.ExcluirCodigosIndicadorOperacaoNFSe;
begin
  FConnection.ExecuteCommand('delete from NFS_FISCAL_CINDOP');
end;

procedure ERPWriter.ExcluirCodigosTributacaoNacionalNFSe;
begin
  FConnection.ExecuteCommand('delete from NFS_FISCAL_CTRIBNAC');
end;

procedure ERPWriter.ExcluirCorrelacaoFiscalNFSe;
begin
  FConnection.ExecuteCommand('delete from NFS_FISCAL_CORREL');
end;

procedure ERPWriter.ExcluirItensIBPT(const UF: string);
begin
  FConnection.ExecuteCommand(
    'delete from IBPT_V2 WHERE UF = :UF',
    ParametersBuilder.Create(1)
      .Add(UF)
      .Build()
  );
 with FConnection.CreateQuery( 'SELECT GEN_ID(SEQ_IBPT_V2, COALESCE(MAX(ID), 0) - GEN_ID(SEQ_IBPT_V2, 0)) FROM IBPT_V2')
 do
 try

 finally
   FreeQueryResult();
 end;
 // FConnection.ExecuteCommand( 'UPDATE IBPT_V2 SET ID = GEN_ID(SEQ_IBPT_V2,1)' );
end;

procedure ERPWriter.ExcluirNCMs;
begin
  FConnection.ExecuteCommand('delete from NCM');
end;

procedure ERPWriter.ExcluirTodosDadosFiscais;
begin
  FConnection.ExecuteCommand('delete from RTC_CLASSIF_NBS_INDOP_LC');
  FConnection.ExecuteCommand('delete from RTC_INDICADOR_OPERACAO_IBS_CBS');
  FConnection.ExecuteCommand('delete from RTC_LISTA_SERVICOS_LC_116');
  FConnection.ExecuteCommand('delete from RTC_TRANSFERENCIA_CBS_ENTE_GOV');
  FConnection.ExecuteCommand('delete from RTC_REDUTOR_COMPRA_GOV');
  FConnection.ExecuteCommand('delete from RTC_EXCECAO_AD_REM_SERVICO');
  FConnection.ExecuteCommand('delete from RTC_ALIQUOTA_AD_REM_SERVICO');
  FConnection.ExecuteCommand('delete from RTC_EXCECAO_AD_VALOREM_SERVICO');
  FConnection.ExecuteCommand('delete from RTC_ALIQUOTA_AD_VALOREM_SERVICO');
  FConnection.ExecuteCommand('delete from RTC_EXCECAO_AD_REM_PRODUTO');
  FConnection.ExecuteCommand('delete from RTC_ALIQUOTA_AD_REM_PRODUTO');
  FConnection.ExecuteCommand('delete from RTC_ALIQUOTA_AD_REM');
  FConnection.ExecuteCommand('delete from RTC_UNIDADE_MEDIDA');
  FConnection.ExecuteCommand('delete from RTC_EXCECAO_AD_VALOREM_PRODUTO');
  FConnection.ExecuteCommand('delete from RTC_ALIQUOTA_AD_VALOREM_PRODUTO');
  FConnection.ExecuteCommand('delete from RTC_ALIQUOTA_AD_VALOREM');
  FConnection.ExecuteCommand('delete from RTC_TRATAMENTO_CLASSIFICACAO');
  FConnection.ExecuteCommand('delete from RTC_TRATAMENTO_TRIBUTARIO');
  FConnection.ExecuteCommand('delete from RTC_TRIBUTO_SITUACAO_TRIBUTARIA');
  FConnection.ExecuteCommand('delete from RTC_EXCECAO_NBS_APLICAVEL');
  FConnection.ExecuteCommand('delete from RTC_EXCECAO_NCM_APLICAVEL');
  FConnection.ExecuteCommand('delete from RTC_FUNDAMENTACAO_CLASSIFICACAO');
  FConnection.ExecuteCommand('delete from RTC_NBS_APLICAVEL');
  FConnection.ExecuteCommand('delete from RTC_NCM_APLICAVEL');
  FConnection.ExecuteCommand('delete from RTC_PERCENTUAL_REDUCAO');
  FConnection.ExecuteCommand('delete from RTC_TIPO_DFE_CLASSIFICACAO');
  FConnection.ExecuteCommand('delete from RTC_CLASSIFICACAO_TRIBUTARIA');
  FConnection.ExecuteCommand('delete from RTC_SITUACAO_TRIBUTARIA');
  FConnection.ExecuteCommand('delete from RTC_ALIQUOTA_PADRAO');
  FConnection.ExecuteCommand('delete from RTC_ALIQUOTA_REFERENCIA');
  FConnection.ExecuteCommand('delete from RTC_TOMADOR_ESPECIFICO');
  FConnection.ExecuteCommand('delete from RTC_FUNDAMENTACAO_LEGAL');
  FConnection.ExecuteCommand('delete from RTC_TIPO_DFE');
  FConnection.ExecuteCommand('delete from RTC_ANEXO');
  FConnection.ExecuteCommand('delete from NBS');
  //FConnection.ExecuteCommand('delete from NCM');
end;

function ERPWriter.ObterUltimaVersao: VersaoSerproEtd;
begin
  with FConnection.CreateQuery(
    'SELECT VALUE1_VC, VALUE1_F, VALUE1_B, VALUE_DT ' +
    ' FROM CONFIG_SISTEMA' +
    ' where CHAVE = ''%s'' and COD_EMPRESA = 0 ',
    [ CONFIG_VERSAO_RTC ]
  ) do
  try
    if IsEmpty then
      Result := VersaoSerproEtd.NullInstance()

    else
      Result := VersaoSerproEtd.Create(
        FieldAsInteger('VALUE1_F'),
        FieldAsDateTime('VALUE_DT'),
        FieldAsString('VALUE1_B'),
        FieldAsStringNullable('VALUE1_VC')
      );
  finally
    FreeQueryResult();
  end;
end;

procedure ERPWriter.SalvarAliquotasAdRem(const Dados: AliquotaAdRemEtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: AliquotaAdRemEtd;
begin
  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := AliquotaAdRemEtd(Dados.Items[I]);

    ParamsList[I] := ParametersBuilder.Create(6)
      .Add(Dado.Id)
      .AddFloat(Dado.Valor)
      .Add(Dado.UnidadeMedidaId)
      .Add(Ord(Dado.TipoTributo))
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_ALIQUOTA_AD_REM' +
    ' (AARE_ID, AARE_VALOR, AARE_UNMD_ID, AARE_TBTO_ID, AARE_INICIO_VIGENCIA, AARE_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarAliquotasAdRemProdutos(const Dados: AliquotasAdRemProdutosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .Add(Dados[I].Ncm)
      .Add(Dados[I].AliquotaAdRemId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_ALIQUOTA_AD_REM_PRODUTO' +
    ' (AARP_ID, AARP_NCM_CD, AARP_AARE_ID, AARP_INICIO_VIGENCIA, AARP_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarAliquotasAdRemServicos(const Dados: AliquotasAdRemServicosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .Add(Dados[I].Nbs)
      .Add(Dados[I].AliquotaAdRemId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_ALIQUOTA_AD_REM_SERVICO' +
    ' (AARS_ID, AARS_NBS_CD, AARS_AARE_ID, AARS_INICIO_VIGENCIA, AARS_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarAliquotasAdValorem(const Dados: AliquotasAdValoremEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
    ParamsList[I] := ParametersBuilder.Create(6)
      .Add(Dados[I].Id)
      .AddFloat(Dados[I].Valor)
      .Add(Ord(Dados[I].TipoTributo))
      .Add(Dados[I].ClassificacaoTributariaId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_ALIQUOTA_AD_VALOREM' +
    ' (AADV_ID, AADV_VALOR, TIPO_TRIBUTO, AADV_CLTR_ID, AADV_INICIO_VIGENCIA, AADV_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarAliquotasAdValoremProdutos(const Dados: AliquotasAdValoremProdutosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .Add(Dados[I].Ncm)
      .Add(Dados[I].AliquotaAdValoremId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_ALIQUOTA_AD_VALOREM_PRODUTO' +
    ' (AAVP_ID, AAVP_NCM_CD, AAVP_AADV_ID, AAVP_INICIO_VIGENCIA, AAVP_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarAliquotasAdValoremServicos(const Dados: AliquotasAdValoremServicosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .Add(Dados[I].Nbs)
      .Add(Dados[I].AliquotaAdValoremId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_ALIQUOTA_AD_VALOREM_SERVICO' +
    ' (AAVS_ID, AAVS_NBS_CD, AAVS_AADV_ID, AAVS_INICIO_VIGENCIA, AAVS_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarAliquotasPadrao(const Dados: AliquotasPadraoEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
    ParamsList[I] := ParametersBuilder.Create(8)
      .Add(Dados[I].Id)
      .AddFloat(Dados[I].Valor)
      .Add(Dados[I].MunicipioId)
      .Add(Dados[I].UfId)
      .Add(Dados[I].AliquotaReferenciaId)
      .Add( AliquotaPadraoFormaAplicacaoUtils.FromEnum(Dados[I].FormaAplicacao ))
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_ALIQUOTA_PADRAO' +
    ' (ALPA_ID, ALPA_VALOR, ALPA_MUNI_CD, ALPA_UF_CD, ALPA_ALRE_ID, ALPA_FORMA_APLICACAO, ALPA_INICIO_VIGENCIA, ALPA_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5, :P_6, :P_7)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarAliquotasReferencia(const Dados: AliquotasReferenciaEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .AddFloat(Dados[I].Valor)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Add(Ord(Dados[I].TipoTributo))
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_ALIQUOTA_REFERENCIA' +
    ' (ALRE_ID, ALRE_VALOR, ALRE_INICIO_VIGENCIA, ALRE_FIM_VIGENCIA, TIPO_TRIBUTO)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarAnexos(const Dados: AnexosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(7)
      .Add(Dados[I].Id)
      .Add(Dados[I].Numero)
      .Add(Dados[I].Descricao)
      .Add(Dados[I].NumeroItem)
      .Add(Dados[I].TextoItem)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_ANEXO' +
    ' (ANXO_ID, ANXO_NUMERO, ANXO_DESCRICAO, ANXO_NUMERO_ITEM, ANXO_TEXTO_ITEM, ANXO_INICIO_VIGENCIA, ANXO_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5, :P_6)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarClassificacoesTributarias(const Dados: ClassificacoesTributariasEtd);
  function Prm_GetIntNullable(const Value: BooleanNullable): ParameterValue;
  begin
    if Value.IsNull then
      Result := ParameterValue.GetNull
    else
      Result := ParameterValue.GetInt( IfThen( Value.Value, 1 ) );
  end;

var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: ClassificacaoTributariaEtd;
begin

  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := ClassificacaoTributariaEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(23)
      .Add(Dado.Id)
      .Add(Dado.Codigo)
      .Add(Dado.Descricao)
      .Add(Dado.MemoriaCalculo)
      .Add( Prm_GetIntNullable( Dado.InApropriacaoCreditosAdquirentesCBS ))
      .Add( Prm_GetIntNullable( Dado.InApropriacaoCreditosAdquirentesIBS ))
      .Add( Prm_GetIntNullable( Dado.InCreditoPresumidoFornecedor ))
      .Add( Prm_GetIntNullable( Dado.InCreditoPresumidoAdquirente ))
      .Add( Dado.SituacaoTributariaId )
      .Add( Dado.TomadorEspecificoId )
      .Add(Dado.TipoAliquota)
      .Add(Dado.CreditoOperacaoAntecedente)
      .Add(Dado.Nomenclatura)
      .Add( IfThen( Dado.InGrupoCredPresOper, 1) )
      .Add( IfThen( Dado.InGrupoMonofasiaPadrao, 1) )
      .Add( IfThen( Dado.InGrupoMonofasiaReten, 1) )
      .Add( IfThen( Dado.InGrupoMonofasiaRet, 1) )
      .Add( IfThen( Dado.InGrupoMonofasiaDiferimento, 1) )
      .Add( IfThen( Dado.InGrupoEstornoCredito, 1) )
      .Add( Dado.Anexo )
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Add(Dado.DataAtualizacao)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_CLASSIFICACAO_TRIBUTARIA' +
    ' (CLTR_ID, CLTR_CD, CLTR_DESCRICAO, CLTR_MEMORIA_CALCULO, CLTR_APROP_CRED_ADQUIRENTE_CBS, ' +
    ' CLTR_APROP_CRED_ADQUIRENTE_IBS, CLTR_CRED_PRESMD_FORNECEDOR, CLTR_CRED_PRESMD_ADQUIRENTE,' +
    ' CLTR_SITR_ID, CLTR_TMES_ID, CLTR_TIPO_ALIQUOTA, CLTR_CRED_OPERACAO_ANTECEDENTE, CLTR_NOMENCLATURA,' +
    ' CLTR_IND_GCREDPRESOPER, CLTR_IND_GMONOPADRAO, CLTR_IND_GMONORETEN, CLTR_IND_GMONORET, ' +
    ' CLTR_IND_GMONODIF, CLTR_IND_GESTORNOCRED, CLTR_ANEXO, ' +
    ' CLTR_INICIO_VIGENCIA, CLTR_FIM_VIGENCIA, CLTR_DATA_ATUALIZACAO)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5, :P_6, :P_7, :P_8, :P_9, :P_10, :P_11, :P_12, :P_13, :P_14, ' +
    '  :P_15, :P_16, :P_17, :P_18, :P_19, :P_20, :P_21, :P_22)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarClassificacoesNbsIndOpLc(const Dados: IndicadoresOpNbsClassificacaoEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
    ParamsList[I] := ParametersBuilder.Create(9)
      .Add(Dados[I].Id)
      .Add(Dados[I].ListaServicosCd)
      .Add(Dados[I].NbsCd)
      .Add(Dados[I].IndiceOperacaoId)
      .Add(Dados[I].ClassificacaoTributariaId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Add( IfThen( Dados[I].InPrestacaoOnerosa, 1) )
      .Add( IfThen( Dados[I].InAquisicaoExterior, 1) )
      .Build();

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_CLASSIF_NBS_INDOP_LC' +
    ' (CNIL_ID, CNIL_LSLC_CD, CNIL_NBS_CD, CNIL_IOIC_ID, CNIL_CLTR_ID,' +
    ' CNIL_INICIO_VIGENCIA, CNIL_FIM_VIGENCIA, CNIL_IN_PS_ONEROSA, CNIL_IN_ADQ_EXTERIOR)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5, :P_6, :P_7, :P_8)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarCodigosIndicadorOperacaoNFSe(const Dados: CodigoIndicadorOperacaoNFSeEtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: CodigoIndicadorOperacaoNFSeEtd;
begin
  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := CodigoIndicadorOperacaoNFSeEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(2)
      .Add(Dado.Codigo)
      .Add(Dado.Descricao.Substring(0, 120))
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO NFS_FISCAL_CINDOP ' +
    '(CINDOP, DESCRICAO) ' +
    'VALUES ' +
    '(:P_0, :P_1)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarCodigosTributacaoNacionalNFSe(const Dados: CodigoTributacaoNacionalNFSeEtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: CodigoTributacaoNacionalNFSeEtd;
begin
  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := CodigoTributacaoNacionalNFSeEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(2)
      .Add(Dado.Codigo)
      .Add(Dado.Descricao.Substring(0, 500))
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO NFS_FISCAL_CTRIBNAC ' +
    '(CTRIBNAC, DESCRICAO) ' +
    'VALUES ' +
    '(:P_0, :P_1)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarCorrelacaoFiscalNFSe(const Dados: CorrelacaoFiscalNFSeEtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: CorrelacaoFiscalNFSeEtd;
begin
  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := CorrelacaoFiscalNFSeEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dado.Id)
      .Add(Dado.Clc116)
      .Add(Dado.Cnbs)
      .Add(Dado.Cindop)
      .Add(Dado.Cclasstrib)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO NFS_FISCAL_CORREL ' +
    '(ID, CLC116, CNBS, CINDOP, CCLASSTRIB) ' +
    'VALUES ' +
    '(:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarEstados(const Dados: EstadosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
    ParamsList[I] := ParametersBuilder.Create()
      .ByName('CODIGO', Dados[I].Codigo)
      .ByName('SIGLA', Dados[I].Sigla)
      .ByName('NOME', Dados[I].Nome)
      .Build();
  
  FConnection.ExecuteBatch(
    'merge into estados e' +
    ' using' +
    '   (' +
    '       SELECT CAST(:SIGLA AS CHAR(2)) SIGLA_UF, CAST(:CODIGO AS INTEGER) IBGE_CODIGO_UF,' +
    '              CAST(:NOME AS VARCHAR(30)) NOME_UF FROM RDB$DATABASE' +
    '       LEFT JOIN ESTADOS E ON E.SIGLA_UF = :SIGLA' +
    '   ) as c' +
    ' on (e.sigla_uf = c.sigla_uf)' +
    ' when matched then ' +
    '   update set ibge_codigo_uf = c.ibge_codigo_uf, nome_uf = c.nome_uf' +
    ' when not matched then' +
    '   insert (sigla_uf, ibge_codigo_uf, nome_uf, mascara_fone)' +
    '   values (c.sigla_uf, c.ibge_codigo_uf, c.nome_uf, ''(99) 99999-9999;0;_'')',
    ParamsList
  );
end;

procedure ERPWriter.SalvarExcecoesAdRemProdutos(const Dados: ExcecoesAdRemProdutosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .Add(Dados[I].Ncm)
      .Add(Dados[I].AliquotaAdRemProdutoId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_EXCECAO_AD_REM_PRODUTO' +
    ' (EARP_ID, EARP_NCM_CD, EARP_AARP_ID, EARP_INICIO_VIGENCIA, EARP_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarExcecoesAdRemServicos(const Dados: ExcecoesAdRemServicosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .Add(Dados[I].Nbs)
      .Add(Dados[I].AliquotaAdRemServicoId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_EXCECAO_AD_REM_SERVICO' +
    ' (EARS_ID, EARS_NBS_CD, EARS_AARS_ID, EARS_INICIO_VIGENCIA, EARS_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarExcecoesAdValoremProdutos(const Dados: ExcecoesAdValoremProdutosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .Add(Dados[I].Ncm)
      .Add(Dados[I].AliquotaAdValoremProdutoId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_EXCECAO_AD_VALOREM_PRODUTO' +
    ' (EAVP_ID, EAVP_NCM_CD, EAVP_AAVP_ID, EAVP_INICIO_VIGENCIA, EAVP_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarExcecoesAdValoremServicos(const Dados: ExcecoesAdValoremServicosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .Add(Dados[I].Nbs)
      .Add(Dados[I].AliquotaAdValoremServicoId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_EXCECAO_AD_VALOREM_SERVICO' +
    ' (EAVS_ID, EAVS_NBS_CD, EAVS_AAVS_ID, EAVS_INICIO_VIGENCIA, EAVS_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarExcecoesNBSAplicavel(const Dados: ExcecoesNbsAplicavelEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .Add(Dados[I].Nbs)
      .Add(Dados[I].NbsAplicavelId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_EXCECAO_NBS_APLICAVEL' +
    ' (ENBS_ID, ENBS_NBS_CD, ENBS_NBSA_ID, ENBS_INICIO_VIGENCIA, ENBS_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarExcecoesNCMAplicavel(const Dados: ExcecoesNcmAplicavelEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dados[I].Id)
      .Add(Dados[I].Ncm)
      .Add(Dados[I].NcmAplicavelId)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_EXCECAO_NCM_APLICAVEL' +
    ' (ENCM_ID, ENCM_NCM_CD, ENCM_NCMA_ID, ENCM_INICIO_VIGENCIA, ENCM_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarFundamentacoesClassificacoes(const Dados: FundamentacoesClassificacoesEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: FundamentacaoClassificacaoEtd;
begin

  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := FundamentacaoClassificacaoEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dado.Id)
      .Add(Dado.ClassificacaoTributariaId)
      .Add(Dado.FundamentacaoLegalId)
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_FUNDAMENTACAO_CLASSIFICACAO' +
    ' (FDCL_ID, FDCL_CLTR_ID, FDCL_FDLG_ID, FDCL_INICIO_VIGENCIA, FDCL_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarFundamentacoesLegais(const Dados: FundamentacoesLegaisEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(6)
      .Add(Dados[I].Id)
      .Add(Dados[I].Texto)
      .Add(Dados[I].TextoCurto)
      .Add(Dados[I].ReferenciaNormativa)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_FUNDAMENTACAO_LEGAL' +
    ' (FDLG_ID, FDLG_TEXTO, FDLG_TEXTO_CURTO, FDLG_REFERENCIA_NORMATIVA, FDLG_INICIO_VIGENCIA, FDLG_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarIndicadoresOperacaoIbsCbs(const Dados: IndicadoresOperacaoEtd);
  function PrmLocalIncidencia(const V: LocalIncidenciaEnumUnit.LocalIncidencia): ParameterValue;
  begin
    if V = LocalIncidenciaEnumUnit.liUnassigned then
      Result := ParameterValue.GetNull
    else
      Result := ParameterValue.GetInt( Ord(V) );
  end;

var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
    ParamsList[I] := ParametersBuilder.Create(8)
      .Add(Dados[I].Id)
      .Add(Dados[I].Codigo)
      .Add(Dados[I].LocalIncidencia)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Add(Dados[I].TipoOperacao)
      .Add(Dados[I].CodigoLocalFornecimentoDfe)
      .Add(PrmLocalIncidencia(Dados[I].CodigoLocalIncidencia))
      .Build();

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_INDICADOR_OPERACAO_IBS_CBS' +
    ' (IOIC_ID, IOIC_CD, IOIC_LOCAL_INCIDENCIA, IOIC_INICIO_VIGENCIA, IOIC_FIM_VIGENCIA,' +
    ' IOIC_TIPO_OPERACAO, IOIC_CD_LOCAL_FORNECIMENTO_DFE, IOIC_CD_LOCAL_INCIDENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5, :P_6, :P_7)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarItensIBPT(const Dados: ItemIbptEtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: ItemIbptEtd;
begin

  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := ItemIbptEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(13)
      .Add(Dado.Codigo)
      .Add(Dado.Uf)
      .Add(Dado.Ex)
      .Add(Dado.Tipo)
      .Add(Dado.Descricao)
      .AddCurr(Dado.Nacional)
      .AddCurr(Dado.Estadual)
      .AddCurr(Dado.Importado)
      .AddCurr(Dado.Municipal)
      .AddDate(Dado.VigenciaInicio)
      .Add(Dado.VigenciaFim)
      .Add(Dado.Chave)
      .Add(Dado.Versao)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO IBPT_V2 ' +
    '(ID, CODIGO, UF, EX, TIPO, DESCRICAO, NACIONAL, ESTADUAL, IMPORTADO, MUNICIPAL, VIGENCIAINICIO, VIGENCIAFIM, ' +
    'CHAVE, VERSAO) ' +
    'VALUES ' +
    '( GEN_ID(SEQ_IBPT_V2,1), :P_0, :P_1, :P_2, :P_3, :P_4, :P_5, :P_6, :P_7, :P_8, :P_9, :P_10, :P_11, :P_12)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarListaServicosLC116(const Dados: ListaServicosLC116EtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: ListaServicosLC116Etd;
begin
  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := Dados.Items[I];

    ParamsList[I] := ParametersBuilder.Create(4)
      .Add(Dado.Codigo)
      .Add(Dado.Descricao)
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_LISTA_SERVICOS_LC_116' +
    ' (LSLC_CD, LSLC_DESCRICAO, LSLC_INICIO_VIGENCIA, LSLC_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarMunicipios(const Dados: MunicipiosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: MunicipioEtd;
begin
  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := MunicipioEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(3)
      .ByName('CODIGO', Dado.Codigo)
      .ByName('ESTADOID', Dado.EstadoId)
      .ByName('NOME', AnsiUpperCase(Dado.Nome))
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO CIDADES_IBGE (CODIGO_MUN_IBGE, NOME_UF, CODIGO_UF_IBGE, NOME_MUNICIPIO, ATIVO)' +
    ' SELECT DISTINCT CAST(:CODIGO AS INTEGER) CODIGO_MUN_IBGE, E.NOME_UF,' +
    '       CAST(:ESTADOID AS INTEGER) CODIGO_UF_IBGE, CAST(:NOME AS VARCHAR(50)) NOME_MUNICIPIO,' +
    '       1 ATIVO' +
    ' FROM RDB$DATABASE' +
    ' LEFT JOIN CIDADES_IBGE C ON C.CODIGO_MUN_IBGE = :CODIGO' +
    ' LEFT JOIN ESTADOS E ON E.IBGE_CODIGO_UF = :ESTADOID AND E.ATIVO = 1' +
    ' WHERE C.CODIGO_UF_IBGE IS NULL',
    ParamsList
  );
end;

procedure ERPWriter.SalvarNBSs(const Dados: NbssEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: NbsEtd;
begin
  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := NbsEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(6)
      .Add(Dado.Codigo)
      .Add(Dado.Descricao)
      .Add(Dado.Lc116)
      .AddDate(Dado.DataInicio)
      .Add(Dado.DataFim)
      .Add('2.0')
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO NBS' +
    ' (COD_NBS, DESCRICAO_NBS, LC_116, DATA_INICIO, DATA_FIM, VERSAO)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarRedutoresCompraGovernamental(const Dados: RedutoresCompraGovernamentalEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: RedutorCompraGovernamentalEtd;
begin
  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := RedutorCompraGovernamentalEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(4)
      .Add(Dado.Id)
      .AddCurr(Dado.Valor)
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_REDUTOR_COMPRA_GOV' +
    ' (RCGO_ID, RCGO_VALOR, RCGO_INICIO_VIGENCIA, RCGO_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarTransferenciasCBSEnteGov(const Dados: TransferenciaCBSEnteGovEtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: TransferenciaCBSEnteGovEtd;
begin
  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := Dados.Items[I];

    ParamsList[I] := ParametersBuilder.Create(4)
      .Add(Dado.Id)
      .AddFloat(Dado.Valor)
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_TRANSFERENCIA_CBS_ENTE_GOV' +
    ' (TCEG_ID, TCEG_VALOR, TCEG_INICIO_VIGENCIA, TCEG_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarNBSsAplicaveis(const Dados: NbssAplicaveisEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: NbsAplicavelEtd;
begin

  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := NbsAplicavelEtd(Dados[I]);

    ParamsList[I] := ParametersBuilder.Create(6)
      .Add(Dado.Id)
      .Add(Dado.Nbs)
      .Add(Dado.ClassificacaoTributariaId)
      .Add(Dado.AnexoId)
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_NBS_APLICAVEL' +
    ' (NBSA_ID, NBSA_NBS_CD, NBSA_CLTR_ID, NBSA_ANXO_ID, NBSA_INICIO_VIGENCIA, NBSA_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarNCMs(const Dados: NcmsEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: NcmEtd;
begin

  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := NcmEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(10)
      .Add( I + 1)
      .Add(Dado.Codigo)
      .Add(Dado.Descricao)
      .AddDate(Dado.DataInicio)
      .Add(Dado.DataFim)
      .Add(Dado.NumeroAtoIni)
      .Add(Dado.NumeroAtoFim)
      .Add(Dado.AnoAtoIni)
      .Add(Dado.AnoAtoFim)
      .Add( Ord(Dado.State) )
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO NCM' +
    ' (ID, CODIGO, DESCRICAO, DATA_INICIO, DATA_FIM, NUMERO_ATO_INI, NUMERO_ATO_FIM, ANO_ATO_INI, ANO_ATO_FIM, STATE)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5, :P_6, :P_7, :P_8, :P_9)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarNCMsAplicaveis(const Dados: NcmsAplicaveisEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: NcmAplicavelEtd;
begin

  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := NcmAplicavelEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(6)
      .Add(Dado.Id)
      .Add(Dado.Ncm)
      .Add(Dado.ClassificacaoTributariaId)
      .Add(Dado.AnexoId)
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_NCM_APLICAVEL' +
    ' (NCMA_ID, NCMA_NCM_CD, NCMA_CLTR_ID, NCMA_ANXO_ID, NCMA_INICIO_VIGENCIA, NCMA_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarPercentuaisReducao(const Dados: PercentuaisReducaoEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(6)
      .Add(Dados[I].Id)
      .Add(Dados[I].ClassificacaoTributariaId)
      .Add(Ord(Dados[I].TipoTributo))
      .AddFloat(Dados[I].Valor)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_PERCENTUAL_REDUCAO' +
    ' (PERE_ID, PERE_CLTR_ID, TIPO_TRIBUTO, PERE_VALOR, PERE_INICIO_VIGENCIA, PERE_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarSituacoesTributarias(const Dados: SituacoesTributariasEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(12)
      .Add(Dados[I].Id)
      .Add(Dados[I].Codigo)
      .Add(Dados[I].Descricao)
      .Add( IfThen( Dados[I].InGrupoIbsCbs, 1) )
      .Add( IfThen( Dados[I].InGrupoIbsCbsMono, 1) )
      .Add( IfThen( Dados[I].InGrupoReducao, 1) )
      .Add( IfThen( Dados[I].InGrupoDiferimento, 1) )
      .Add( IfThen( Dados[I].InGrupoTranferenciaCredito, 1) )
      .Add( IfThen( Dados[I].InGrupoCreditoPresumidoIbsZfm, 1) )
      .Add( IfThen( Dados[I].InGrupoAjusteCompetencia, 1) )
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_SITUACAO_TRIBUTARIA' +
    ' (SITR_ID, SITR_CD, SITR_DESCRICAO, ' +
    '  SITR_IND_GIBSCBS, SITR_IND_GIBSCBSMONO, SITR_IND_GRED, ' +
    '  SITR_IND_GDIF, SITR_IND_GTRANSFCRED, SITR_IND_GCREDPRESIBSZFM, SITR_IND_GAJUSTECOMPET,  ' +
    '  SITR_INICIO_VIGENCIA, SITR_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5, :P_6, :P_7, :P_8, :P_9, :P_10, :P_11)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarTiposDFe(const Dados: TiposDfeEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(6)
      .Add(Dados[I].Id)
      .Add(Dados[I].Tipo)
      .Add(Dados[I].Sigla)
      .Add(Dados[I].Descricao)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_TIPO_DFE' +
    ' (TPDF_ID, TPDF_TIPO, TPDF_SIGLA, TPDF_DESCRICAO, TPDF_INICIO_VIGENCIA, TPDF_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarTiposDFePorClassificacao(const Dados: TipoDfeClassificacaoEtdList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: TipoDfeClassificacaoEtd;
begin

  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := TipoDfeClassificacaoEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dado.Id)
      .Add(Dado.ClassificacaoTributariaId)
      .Add(Dado.TipoDfeId)
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_TIPO_DFE_CLASSIFICACAO' +
    ' (TDCL_ID, TDCL_CLTR_ID, TDCL_TPDF_ID, TDCL_INICIO_VIGENCIA, TDCL_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarTomadoresEspecificos(const Dados: TomadoresEspecificosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(4)
      .Add(Dados[I].Id)
      .Add(Dados[I].Nome)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_TOMADOR_ESPECIFICO' +
    ' (TMES_ID, TMES_NOME, TMES_INICIO_VIGENCIA, TMES_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarTratamentosClassificacoes(const Dados: TratamentosClassificacoesEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: TratamentoClassificacaoEtd;
begin

  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := TratamentoClassificacaoEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dado.Id)
      .Add(Dado.ClassificacaoTributariaId)
      .Add(Dado.TratamentoTributarioId)
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_TRATAMENTO_CLASSIFICACAO' +
    ' (TRCL_ID, TRCL_CLTR_ID, TRCL_TRTR_ID, TRCL_INICIO_VIGENCIA, TRCL_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarTratamentosTributarios(const Dados: TratamentosTributariosEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(17)
      .Add(Dados[I].Id)
      .Add(Dados[I].Descricao)
      .Add(Dados[I].ExpressaoAliquota)
      .Add(Dados[I].ExpressaoAliquotaEfetiva)
      .Add(Dados[I].ExpressaoBaseCalculo)
      .Add(Dados[I].ExpressaoTributoCalculado)
      .Add(Dados[I].ExpressaoTributoDevido)
      .Add(Dados[I].ExpressaoPercentualDiferimento)
      .Add(Dados[I].ExpressaoValorDiferimento)
      .Add( IfThen( Dados[I].InIncompativelComSuspensao, 1) )
      .Add( IfThen( Dados[I].InExigeGrupoDesoneracao, 1) )
      .Add( IfThen( Dados[I].InPossuiPercentualReducao, 1) )
      .Add( IfThen( Dados[I].InPossuiAjuste, 1) )
      .Add( IfThen( Dados[I].InPossuiRedutor, 1) )
      .Add( IfThen( Dados[I].InPossuiMonofasia, 1) )
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_TRATAMENTO_TRIBUTARIO' +
    ' (TRTR_ID, TRTR_DESCRICAO, TRTR_EXPS_ALIQUOTA, TRTR_EXPS_ALIQUOTA_EFETIVA, TRTR_EXPS_BASE_CALCULO,' +
    ' TRTR_EXPS_TRIBUTO_CALCULADO, TRTR_EXPS_TRIBUTO_DEVIDO, TRTR_EXPS_PERC_DIFERIMENTO, TRTR_EXPS_VALOR_DIFERIMENTO,' +
    ' TRTR_IN_INCOMP_COM_SUSPENSAO, TRTR_IN_EXIGE_GRUPO_DESONERACAO, TRTR_IN_POSSUI_PERC_REDUCAO,' +
    ' TRTR_IN_POSSUI_AJUSTE, TRTR_IN_POSSUI_REDUTOR, TRTR_IN_POSSUI_MONOFASIA, TRTR_INICIO_VIGENCIA, TRTR_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5, :P_6, :P_7, :P_8, :P_9, :P_10, :P_11, :P_12, :P_13, :P_14, :P_15, :P_16)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarTributoSituacoesTributarias(const Dados: TributoSituacoesTributariasEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Dado: TributoSituacaoTributariaEtd;
begin

  SetLength(ParamsList, Dados.Count);

  for I := 0 to Dados.Count - 1 do
  begin
    Dado := TributoSituacaoTributariaEtd(Dados[I]);
    ParamsList[I] := ParametersBuilder.Create(5)
      .Add(Dado.Id)
      .Add(Dado.SituacaoTributariaId)
      .Add(Ord(Dado.TipoTributo))
      .AddDate(Dado.InicioVigencia)
      .Add(Dado.FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_TRIBUTO_SITUACAO_TRIBUTARIA' +
    ' (TRST_ID, TRST_SITR_ID, TIPO_TRIBUTO, TRST_INICIO_VIGENCIA, TRST_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4)',
    ParamsList
  );
end;

procedure ERPWriter.SalvarUltimaVersao(const Versao: VersaoSerproEtd);
var
  Params: ParametersValues;
begin
  Params := ParametersBuilder.Create(5)
      .Add( CONFIG_VERSAO_RTC   )
      .Add( Versao.Id           )
      .AddDateTime( Versao.Data )
      .Add( Versao.Descricao    )
      .Add( Versao.Versao       )
      .Build();

  FConnection.ExecuteCommand(
    'UPDATE OR INSERT INTO CONFIG_SISTEMA' +
    ' (CHAVE, COD_EMPRESA, DISPLAY_, TYPE1_, ATIVO, VALUE1_F, VALUE_DT, VALUE1_B, VALUE1_VC)' +
    ' VALUES' +
    ' (:P_0, 0, ''Versao do banco de dados da calculador da RTC'', ''string'', 0, :P_1, :P_2, :P_3, :P_4) ' +
    ' MATCHING (CHAVE, COD_EMPRESA) ',
    Params
  );
end;

procedure ERPWriter.SalvarUnidadesMedidas(const Dados: UnidadesMedidasEtd);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Dados));

  for I := 0 to High(Dados) do
  begin
    ParamsList[I] := ParametersBuilder.Create(6)
      .Add(Dados[I].Id)
      .Add(Dados[I].Sigla)
      .Add(Dados[I].Nome)
      .Add(Dados[I].Descricao)
      .AddDate(Dados[I].InicioVigencia)
      .Add(Dados[I].FimVigencia)
      .Build();
  end;

  FConnection.ExecuteBatch(
    'INSERT INTO RTC_UNIDADE_MEDIDA' +
    ' (UNMD_ID, UNMD_SIGLA, UNMD_NOME, UNMD_DESCRICAO, UNMD_INICIO_VIGENCIA, UNMD_FIM_VIGENCIA)' +
    ' VALUES' +
    ' (:P_0, :P_1, :P_2, :P_3, :P_4, :P_5)',
    ParamsList
  );
end;

end.
