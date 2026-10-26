unit CalcularTributosNFSeServiceUnit;

interface

uses
  SysUtils, Classes, BaseUseCaseUnit,
  ICalcularTributosNFSeServiceUnit,
	ITiposServicosRepositoryUnit,
  IClientesRepositoryUnit,
  IConfiguracoesRepositoryUnit,
  IRegrasFiscaisIbsCbsRepositoryUnit,
  ICalcularISSQNServiceUnit,
  ICalcularPisCofinsServiceUnit,
  ICalcularRetenFederalServiceUnit,
  IResolverRegraFiscalIbsCbsServiceUnit,
  TributoNFSePisCofinsOutputUnit,
  CalculoPisCofinsResultUnit,
  CalculoTributosNFSeInputUnit,
  CalculoTributosNFSeOutputUnit,
  ICalculoTotaisNFSeServiceUnit,
  ICalculadorROCServiceUnit,
  ICalcularTributosAproximadosServiceUnit,
  NFSeTypesUnit,
  NFSeModelUnit,
  TributoDFeContextEtdUnit,
  ICalculadorBaseCalculoServiceUnit,
  IParametrosFiscaisNFSeServiceUnit,
  ValidacaoOutputUnit,
  ParametrosFiscaisNFSeCommandUnit,
  IAplicarRegrasTributosNFSeServiceUnit;

type
  CalcularTributosNFSeService = class(TInterfacedBaseUseCase, ICalcularTributosNFSeService)
  private
		FTiposServicosRepo: ITiposServicosRepository;
		FClientesRepo: IClientesRepository;
		FConfigsRepo: IConfiguracoesRepository;
    FRegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
    FCalculoTotais: ICalculoTotaisNFSeService;
		FCalcularISSQN: ICalcularISSQNService;
		FCalcularPisCofins: ICalcularPisCofinsService;
		FCalcularRetebFed: ICalcularRetenFederalService;
    FCalculadorROCService: ICalculadorROCService;
    FCalculadorBC: ICalculadorBaseCalculoService;
    FCalcularTribAprox: ICalcularTributosAproximadosService;
    FResolvedorRegras: IResolverRegraFiscalIbsCbsService;
    FParametrosFiscaisNFSe: IParametrosFiscaisNFSeService;
    FAplicarRegrasTributos: IAplicarRegrasTributosNFSeService;

    FValidacoes: ValidacaoOutput;
	private
		function GetTributoPisCofins(const Tributo: CalculoPisCofinsResult;
			ATipoRetencao: TipoRetencaoPisCofinsEnum
		): TributoNFSePisCofinsOutput;
    function CalcularIbsCbsIS( Input: NFSeModel; ValorLiquido, ValorIss, ValorPis, ValorCofins: Currency ): TributoDFeContextEtd;
		function CalcularTodos(const Input: NFSeModel): CalculoTributosNFSeOutput;
		function CalcularSomenteIbsCbs(const Input: NFSeModel): CalculoTributosNFSeOutput;
	public
		constructor Create(
			TiposServicosRepo: ITiposServicosRepository;
			ClientesRepo: IClientesRepository;
			ConfigsRepo: IConfiguracoesRepository;
      RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
      ParametrosFiscaisNFSe: IParametrosFiscaisNFSeService;
      AplicarRegrasTributos: IAplicarRegrasTributosNFSeService;
      CalculoTotais: ICalculoTotaisNFSeService;
			CalcularISSQN: ICalcularISSQNService;
      CalcularPisCofins: ICalcularPisCofinsService;
      CalcularRetebFed: ICalcularRetenFederalService;
      CalculadorROCService: ICalculadorROCService;
      CalculadorBC: ICalculadorBaseCalculoService;
      CalcularTribAprox: ICalcularTributosAproximadosService;
      ResolvedorRegras: IResolverRegraFiscalIbsCbsService
    );
		function Executar(const Input: CalculoTributosNFSeInput): CalculoTributosNFSeOutput;
	end;

implementation

uses
	StrUtils, DateUtils, Math,
	NumberServiceUnit,
	CalculoISSQNResultUnit, CalculoPisCofinsInputUnit,
  TributoNFSeIssQnOutputUnit,
  CurrencyNullableUnit, CalculoRetenFederalInputUnit,
	TipoServicoEtdUnit, EValidacaoNegocioUnit, ClienteEtdUnit, ConfigLegacyTypes,
	CalculoRetenFederalResultUnit, TributoNFSeRetenFederalOutputUnit,
	ConfiguracaoEtdUnit, StringNullableUnit, CalculoTotaisNFSeTypes, EstadosServiceUnit, CalcularTributoInputUnit,
  ICalculoBaseCalculoServiceUnit, CalcularBaseCalculoModelUnit, ImpostoSeletivoInputUnit, ROCDomainUnit,
  TributosDFeSerivceUnit, NFSeEtdUnit, TributosDFeServiceTypes, TributoDFeOrigemEnumUnit, ItemCalculoInputUnit,
  TributoDFeImpostoSeletivoEtdUnit, DoubleNullableUnit, TributoDFeIbsCbsEtdUnit, TributoDFeGrupoIbsCbsEtdUnit,
  TributoDFeMonofasiaIbsCbsEtdUnit, TipoRegraTributoDFeEnumUnit, ResolverRegraFiscalIbsCbsTypesUnit,
  RegraFiscalIbsCbsEtdUnit, TributacaoRegularInputUnit, CalcularTributosAproximadosTypesUnit,
  TributoNFSeAproximadosOutputUnit, StringServiceUnit, TipoRetencaoFederalPJEnumUnit, CompraGovernamentalInputUnit,
  TipoEnteGovernamentalEnumUnit, TipoOperacaoGovernamentalEnumUnit, DFeTypesUnit;

{ CalcularTributosNFSeService }

constructor CalcularTributosNFSeService.Create(
	TiposServicosRepo: ITiposServicosRepository;
	ClientesRepo: IClientesRepository;
	ConfigsRepo: IConfiguracoesRepository;
  RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
  ParametrosFiscaisNFSe: IParametrosFiscaisNFSeService;
  AplicarRegrasTributos: IAplicarRegrasTributosNFSeService;
  CalculoTotais: ICalculoTotaisNFSeService;
	CalcularISSQN: ICalcularISSQNService;
	CalcularPisCofins: ICalcularPisCofinsService;
	CalcularRetebFed: ICalcularRetenFederalService;
  CalculadorROCService: ICalculadorROCService;
  CalculadorBC: ICalculadorBaseCalculoService;
  CalcularTribAprox: ICalcularTributosAproximadosService;
  ResolvedorRegras: IResolverRegraFiscalIbsCbsService
);
begin
	FTiposServicosRepo := TiposServicosRepo;
	FClientesRepo := ClientesRepo;
	FConfigsRepo := ConfigsRepo;
  FRegrasFiscaisIbsCbsRepo := RegrasFiscaisIbsCbsRepo;
  FParametrosFiscaisNFSe := ParametrosFiscaisNFSe;
  FAplicarRegrasTributos := AplicarRegrasTributos;
  FCalculoTotais := CalculoTotais;
	FCalcularISSQN := CalcularISSQN;
  FCalcularPisCofins := CalcularPisCofins;
  FCalcularRetebFed := CalcularRetebFed;
  FCalculadorROCService := CalculadorROCService;
  FCalculadorBC := CalculadorBC;
  FCalcularTribAprox := CalcularTribAprox;
  FResolvedorRegras := ResolvedorRegras;

  FValidacoes := ValidacaoOutput.Create();
end;

function CalcularTributosNFSeService.Executar(const Input: CalculoTributosNFSeInput): CalculoTributosNFSeOutput;
begin
  if Input.CalcularLegado and Input.CalcularRTC then
    Result := Self.CalcularTodos( Input.Nota )

  else if Input.CalcularRTC then
    Result := Self.CalcularSomenteIbsCbs( Input.Nota )

  else
    raise Exception.Create('Erro de implementação CalcularTributosNFSeService.Executar Input inválido');
end;

function CreateCompraGovernamentalInput(
  ATpEnteGov: TipoEnteGovEnum;
  ATpOperGov: TipoOperEnteGovEnum
): CompraGovernamentalInput;
var
  TpEnteGov: TipoEnteGovernamental;
  TpOperGov: TipoOperacaoGovernamental;
begin
  // TipoEnteGovEnum e TipoEnteGovernamental tem os mesmos valores
  case ATpEnteGov of
    tgvNenhum          : TpEnteGov := tegUnassigned;
    tgvUniao           : TpEnteGov := tegUniao;
    tgvEstados         : TpEnteGov := tegEstado;
    tgvDistritoFederal : TpEnteGov := tegDistritoFederal;
    tgvMunicipios      : TpEnteGov := tegMunicipio;
    tgvConsorcioPublico: TpEnteGov := tegConsorcioPublico;
    tgvComiteGestorIbs : TpEnteGov := tegComiteGestorIbs;
    else
      raise Exception.Create('TipoEnteGovernamental do sistema incompativel com TipoEnteGovernamental do SERPRO');
  end;

  case ATpOperGov of
    NFSeTypesUnit.togNaoDefinido:
      TpOperGov := togUnassigned;

    NFSeTypesUnit.togFornecimento, NFSeTypesUnit.togFornecimentoRealizado, NFSeTypesUnit.togFornecimentoRecebimento:
      TpOperGov := togFornecimento;

    NFSeTypesUnit.togRecebimentoPag, NFSeTypesUnit.togRecebimentoPagPosterior:
      TpOperGov := togRecebimentoPagamento;
    else
      raise Exception.Create('TipoOperacaoGovernamental do sistema não mapeada com TipoOperacaoGovernamental do SERPRO');
  end;

  Result := CompraGovernamentalInput.Create(TpEnteGov, TpOperGov);
end;

function CalcularTributosNFSeService.CalcularIbsCbsIS(
  Input: NFSeModel; ValorLiquido, ValorIss, ValorPis, ValorCofins: Currency
): TributoDFeContextEtd;
var
  I: Integer;
  grupoFiscalId: string;
  regraFiscalId: string;
  regraFiscal  : RegraFiscalIbsCbsEtd;
  rfTribRegular: RegraFiscalIbsCbsEtd;
  itensInput   : ItensCalculoInput;
  calcInput    : ItemCalculoInput;
  impSelInput  : ImpostoSeletivoInput;
  tribRegInput : TributacaoRegularInput;
  rocResult    : ROCDomain;
  indDoacao    : Boolean;
  tipoRegra    : TipoRegraTributoDFeEnum;
  dataCalcRtc  : TDateTime;

  BaseCalcIS, BaseCalcIbsCbs: Currency;
begin
  if not Input.NFSe.LayoutNFSeComIbsCbs() then
  begin
    Result := nil;
    Exit;
  end
  else if (Input.Tributo <> nil) and (Input.Tributo.IbsCbs <> nil) then
  begin
    tipoRegra := Input.Tributo.IbsCbs.TipoRegra;
    regraFiscalId := Input.Tributo.IbsCbs.RegraFiscalId.Value;
  end
  else
  begin
    tipoRegra := tctAutomatica;
    regraFiscalId := '';
  end;

  if Input.NFSe.Servico = nil then
    grupoFiscalId := ''
  else
    grupoFiscalId := Input.NFSe.Servico.GrupoFiscalIbsCbsId.Value;

  if Input.NFSe.DhEmi.HasValue  then
    dataCalcRtc := DateOf(Input.NFSe.DhEmi.Value)
  else
    dataCalcRtc := DateOf(Input.NFSe.DCompet.Value);

  regraFiscal := FResolvedorRegras.Executar( ResolverRegraFiscalIbsCbsInput.Create(
    Input.NFSe.OpInternaId.Value,
    grupoFiscalId,
    Input.NFSe.CodEmpresa,
    dataCalcRtc
  ));
  if regraFiscal = nil then
    raise EValidacaoNegocio.Create( 'Regra fiscal do IBS e CBS não encontrada');

  if Input.NFSe.GetAnoFatoGerador() < 2027 then
    BaseCalcIS := 0.0
  else
  BaseCalcIS := FCalculadorBC.CalculaIS( BaseCalculoISMercadoriasModel.Create(
    Input.NFSe.GetAnoFatoGerador(),
    ValorLiquido,
    0, 0, 0, 0, 0, 0, 0, 0,
    ValorIss,
    0, 0, 0, 0
  ));
  BaseCalcIbsCbs := FCalculadorBC.CalculaIbsCbs( BaseCalculoIbsCbsModel.Create(
    Input.NFSe.GetAnoFatoGerador(),
    ValorLiquido,
    0, 0, 0, 0, 0, 0, 0, 0, 0,
    ValorIss,
    ValorPis,
    ValorCofins,
    0, 0
  ));

  // 2: Criando inputs e Calculando Base de calculo ImpostoSeletivo, CBS e IBS
  rocResult := nil;
  try
    // Falta implentar como configura o Imposto Seletivo, é pra 2027 ainda
    if True then
      impSelInput := ImpostoSeletivoInput.NullInstance()

    else
    begin
      impSelInput := ImpostoSeletivoInput.Create(
        {Cst} '',
        {CClassTrib} '',
        {BaseCalculo} BaseCalcIS,
        {Quantidade} 0,
        {Unidade} '' ,
        {ImpostoInformado} 0  // É necessario verificar se esse valor Digitado ou é calculado ou ret
      );
    end;

    rfTribRegular := nil;
    try
      if not regraFiscal.RegraFiscalTribRegularId.IsNull then
        rfTribRegular := FRegrasFiscaisIbsCbsRepo.GetById( regraFiscal.RegraFiscalTribRegularId.Value );

      if rfTribRegular = nil then
        tribRegInput := TributacaoRegularInput.NullInstance()
      else
        tribRegInput := TributacaoRegularInput.Create( Copy(rfTribRegular.CClassTrib, 1, 3), rfTribRegular.CClassTrib );
    finally
      rfTribRegular.Free();
    end;

    calcInput := ItemCalculoInput.Create(
      1,
      Input.NFSe.CNBS.Value,
      regraFiscal.CClassTrib,
      Copy(regraFiscal.CClassTrib, 1, 3),
      impSelInput,
      tribRegInput,
      BaseCalcIbsCbs,
      1,
      ''
    );
    SetLength(itensInput, 1);
    itensInput[0] := calcInput;

    // 3: Chamada do calculo dos tributos
    rocResult := FCalculadorROCService.Executar(
      CalcularTributoInput.Create(
        dataCalcRtc,
        Input.NFSe.CLocPrestacao.Value,
        EstadosService.MunicipioIbgeToUF(Input.NFSe.CLocPrestacao.Value),
        itensInput,
        CreateCompraGovernamentalInput(Input.NFSe.TpEnteGov, Input.NFSe.TpOper)
      )
    );

    if not rocResult.Validacoes.IsValid() then
    begin
      for I := 0 to High(rocResult.Validacoes.Validacoes) do
        FValidacoes.AddDistinct( rocResult.Validacoes.Validacoes[I] );

      Result := TributosDFeSerivce.Create( TributoDFeContextInput.Create(
        Input.NFSe.Id, StringNullable.Create(regraFiscal.Id), tipoRegra, indDoacao, tdfoNFSe), nil
      );
    end
    else
    begin
      indDoacao := (Input.Tributo <> nil) and (Input.Tributo.IbsCbs <> nil) and Input.Tributo.IbsCbs.Inddoacao;

      Result := TributosDFeSerivce.Create( TributoDFeContextInput.Create(
        Input.NFSe.Id, StringNullable.Create(regraFiscal.Id), tipoRegra, indDoacao, tdfoNFSe), rocResult.Objetos[0]
      );
    end;

  finally
    regraFiscal.Free();
    rocResult.Free();
  end;
end;

function CalcularTributosNFSeService.CalcularSomenteIbsCbs(const Input: NFSeModel): CalculoTributosNFSeOutput;
var
  nfse: NFSeEtd;
  tribDFeResult: TributoDFeContextEtd;
  valorLiq: Currency;
  vIBS, vCbs, vIbsMono, vCbsmono, vImpSeletivo: Currency;
  TotaisNFSe: CalculoTotaisNFSeResult;
  CNull: CurrencyNullable;
begin
  nfse := Input.NFSe;
  valorLiq := nfse.VServ.Value - nfse.VDescIncond.Value;
  CNull := CurrencyNullable.NullInstance();
  vImpSeletivo := 0;
  vIBS := 0;
  vCbs := 0;
  vIbsMono := 0;
  vCbsmono := 0;

  if nfse.LayoutNFSeComIbsCbs() then
  begin
    tribDFeResult := CalcularIbsCbsIS(
      Input,
      valorLiq,
      nfse.VIss.Value,
      NumberService.Default( nfse.VRetPis.Value, nfse.PCVPis.Value ),
      NumberService.Default( nfse.VRetCofins.Value, nfse.PCVCofins.Value )
    );
    if tribDFeResult.ImpostoSeletivo <> nil then
      vImpSeletivo := tribDFeResult.ImpostoSeletivo.Vis.Value;

    if (tribDFeResult.IbsCbs <> nil) and (tribDFeResult.IbsCbs.GIbsCbs <> nil) then
    begin
      vIBS := tribDFeResult.IbsCbs.GIbsCbs.VIbs;
      vCbs := tribDFeResult.IbsCbs.GIbsCbs.VCbs;
    end;

    if (tribDFeResult.IbsCbs <> nil) and (tribDFeResult.IbsCbs.Monofasia <> nil) then
    begin
      vIbsMono := tribDFeResult.IbsCbs.Monofasia.Vtotibsmonoitem;
      vCbsmono := tribDFeResult.IbsCbs.Monofasia.Vtotcbsmonoitem;
    end;
  end
  else
    tribDFeResult := nil;

  //Totais
  TotaisNFSe := FCalculoTotais.Executar( CalculoTotaisNFSeInput.Create(
    nfse.VServ.Value,
    nfse.VDescIncond.Value,
    nfse.VRetIrrf.Value,
    nfse.VRetCsll.Value,
    nfse.VRetCP.Value,
    nfse.VRetPis.Value,
    nfse.VRetCofins.Value,
    NumberService.IfThenCurr(
      nfse.TpRetIssQn in [trRetidoPeloTomador, trRetidoPeloIntermediario],
      nfse.VIss.Value
    ),
    {IBS} vIBS,
    {Cbs} vCbs,
    {IbsMono} vIbsMono,
    {Cbsmono} vCbsmono,
    {ImpSeletivo} vImpSeletivo
  ));

  Result := CalculoTributosNFSeOutput.Create(
    TotaisNFSe,
    TributoNFSeIssQnOutput.Create(
      nfse.TribIssQn, nfse.TpRetIssQn, nfse.IssPAliq, nfse.IssVBC, nfse.IssVBC
    ),
    TributoNFSePisCofinsOutput.Create(
      nfse.PCCst, nfse.PCVBcPisCofins, nfse.PCPAliqPis, nfse.PCPAliqCofins, nfse.PCVPis, nfse.PCVCofins, nfse.TpRetPisCofins
    ),
    TributoNFSeRetenFederalOutput.Create(
      CNull, NFSE.VRetPis, CNull, NFSE.VRetCofins, CNull, NFSE.VRetIrrf, CNull, NFSE.VRetCsll, CNull, NFSE.VRetCP
    ),
    TributoNFSeAproximadosOutput.Create(
      nfse.PTotTribFed.Value, nfse.PTotTribEst.Value, nfse.PTotTribMun.Value, nfse.PTotTribSN.Value
    ),
    tribDFeResult,
    FValidacoes
  );
end;

function CalcularTributosNFSeService.CalcularTodos(const Input: NFSeModel): CalculoTributosNFSeOutput;
var
  paramsFiscais: ParametrosFiscaisNFSeResult;
	valorLiq: Currency;
  nfse: NFSeEtd;
  cUF: string;
  // totais
  TotaisNFSe: CalculoTotaisNFSeResult;
	// iss
	issqnResult: CalculoISSQNResult;
	issqnOutput: TributoNFSeIssQnOutput;
	// piscofins
	//iCstPC: Integer;
	pcResult: CalculoPisCofinsResult;
	tipoRetPC: TipoRetencaoPisCofinsEnum;
	// retencoes
	retenResult: CalculoRetenFederalResult;
  // val aprox tributos
  tribAproxResult: CalcularTributosAproximadosResult;
  // Ibs Cbs e ImpSel
  tribDFeResult: TributoDFeContextEtd;
  vIBS, vCbs, vIbsMono, vCbsmono, vImpSeletivo: Currency;
begin
  vIBS := 0;
  vCbs := 0;
  vIbsMono := 0;
  vCbsmono := 0;
  vImpSeletivo := 0;

  nfse := Input.NFSe;

	valorLiq := nfse.VServ.Value - nfse.VDescIncond.Value;

  paramsFiscais := FParametrosFiscaisNFSe.Executar( ParametrosFiscaisNFSeCommand.Create(
    nfse.CodEmpresa,
    nfse.CodServico.Value,
    nfse.CodCliente.Value,
    nfse.IntermediarioId.Value,
    nfse.IsEmissaoPropria
  ));

	// Chamada do calculo do ISSQN
	case paramsFiscais.TipoTribIss of
		tiOperacaoTributavel,
		tiExportacao:
			begin
				issqnResult := FCalcularISSQN.Executar( paramsFiscais.AliqIssTratada, (valorLiq) );
				ISSQNOutput := TributoNFSeIssQnOutput.Create(
          paramsFiscais.TipoTribIss,
          paramsFiscais.TipoRetIss,
					CurrencyNullable.Create( issqnResult.Aliquota ),
					CurrencyNullable.Create( issqnResult.BaseCalculo ),
					CurrencyNullable.Create( issqnResult.ValorISSQN )
				);
			end;

		else
			issqnOutput := TributoNFSeIssQnOutput.Create( paramsFiscais.TipoTribIss, trNaoRetido,
				CurrencyNullable.NullInstance(), CurrencyNullable.NullInstance(), CurrencyNullable.NullInstance()
			);
	end;

	try
		// Chamada do calculo do PISCOFINS
		pcResult := FCalcularPisCofins.Executar( CalculoPisCofinsInput.Create(
			paramsFiscais.CSTPC,
      {ValorLiquidoCobrado} (valorLiq),
			{QtdeItem} 1,
      {ValorIpi} 0,
      {ValorIcms} 0,
			paramsFiscais.AliqPis,
      paramsFiscais.AliqCofins
		));

    // Aplicando regras
    pcResult := FAplicarRegrasTributos.AplicarPisCofins( pcResult, paramsFiscais.IsSimplesNacional );

		// Chamada do calculos das RETENCOES
		retenResult := FCalcularRetebFed.Executar( CalculoRetenFederalInput.Create(
			{ValorLiquidoCobrado} (valorLiq),
			paramsFiscais.AliqRetPis,
      paramsFiscais.AliqRetCofins,
      paramsFiscais.AliqRetIrrf,
      paramsFiscais.AliqRetCsll,
      paramsFiscais.AliqRetCP
		));

    // Aplicando valores de retencoes somente se necessário, testes de SN e Valor minimo 10.00
    retenResult := FAplicarRegrasTributos.AplicarRetencoesFederais(
      retenResult, paramsFiscais.IsSimplesNacional, paramsFiscais.RetsFedCliente
    );

    TipoRetPC := FAplicarRegrasTributos.ObterTipoRetencaoPC( retenResult );

    // Chamada Valor Aproximado dos Tributos
    tribAproxResult := FCalcularTribAprox.Executar( CalcularTributosAproximadosInput.Create(
      StringService.Split([','], Format('%s,%s,%s', [
        paramsFiscais.NBS, StringService.OnlyNumber(paramsFiscais.LC116), Copy(nfse.CTribNac.Value, 1, 4)
      ])),
      EstadosService.MunicipioIbgeToUF(nfse.CLocPrestacao.Value), valorLiq
    ));

    // IBS CBS IS, Ajustando a base de calculo
    if nfse.LayoutNFSeComIbsCbs() then
    begin
      tribDFeResult := CalcularIbsCbsIS(
        Input,
        valorLiq,
        issqnOutput.ValorISSQN.Value,
        NumberService.Default( retenResult.VRetPIS, pcResult.ValorPis ),
        NumberService.Default( retenResult.VRetCOFINS, pcResult.ValorCofins )
      );
      if tribDFeResult <> nil then
      begin
        if tribDFeResult.ImpostoSeletivo <> nil then
          vImpSeletivo := tribDFeResult.ImpostoSeletivo.Vis.Value;

        if (tribDFeResult.IbsCbs <> nil) and (tribDFeResult.IbsCbs.GIbsCbs <> nil) then
        begin
          vIBS := tribDFeResult.IbsCbs.GIbsCbs.VIbs;
          vCbs := tribDFeResult.IbsCbs.GIbsCbs.VCbs;
        end;

        if (tribDFeResult.IbsCbs <> nil) and (tribDFeResult.IbsCbs.Monofasia <> nil) then
        begin
          vIbsMono := tribDFeResult.IbsCbs.Monofasia.Vtotibsmonoitem;
          vCbsmono := tribDFeResult.IbsCbs.Monofasia.Vtotcbsmonoitem;
        end;
      end;
    end
    else
      tribDFeResult := nil;

    //Totais
    TotaisNFSe := FCalculoTotais.Executar( CalculoTotaisNFSeInput.Create(
      nfse.VServ.Value,
      nfse.VDescIncond.Value,
      retenResult.VRetIRRF,
      retenResult.VRetCSLL,
      retenResult.VRetCP,
      retenResult.VRetPIS,
      retenResult.VRetCOFINS,
      NumberService.IfThenCurr(
        issqnOutput.TipoRetencao in [trRetidoPeloTomador, trRetidoPeloIntermediario],
        issqnOutput.ValorISSQN.Value
      ),
      {IBS} vIBS,
      {Cbs} vCbs,
      {IbsMono} vIbsMono,
      {Cbsmono} vCbsmono,
      {ImpSeletivo} vImpSeletivo
    ));

		Result := CalculoTributosNFSeOutput.Create(
      TotaisNFSe,
			issqnOutput,
			GetTributoPisCofins( pcResult, tipoRetPC ),
			TributoNFSeRetenFederalOutput.Create(
				CurrencyNullable.Create( paramsFiscais.AliqRetPis, retenResult.VRetPIS <= 0 ),
        CurrencyNullable.CreateOrNull( retenResult.VRetPIS ),
				CurrencyNullable.Create( paramsFiscais.AliqRetCofins, retenResult.VRetCOFINS <= 0 ),
        CurrencyNullable.CreateOrNull( retenResult.VRetCOFINS ),
				CurrencyNullable.Create( paramsFiscais.AliqRetIrrf, retenResult.VRetIRRF <= 0 ),
        CurrencyNullable.CreateOrNull( retenResult.VRetIRRF ),
				CurrencyNullable.Create( paramsFiscais.AliqRetCsll, retenResult.VRetCSLL <= 0 ),
        CurrencyNullable.CreateOrNull( retenResult.VRetCSLL ),
				CurrencyNullable.Create( paramsFiscais.AliqRetCP, retenResult.VRetCP <= 0 ),
        CurrencyNullable.CreateOrNull( retenResult.VRetCP )
			),
      TributoNFSeAproximadosOutput.Create(
        tribAproxResult.PAliqNacional,
        tribAproxResult.PAliqEstadual,
        tribAproxResult.PAliqMunicipal,
        paramsFiscais.AliqCheiaSN
      ),
      tribDFeResult,
      FValidacoes
		);

	except on E: Exception do
		begin
			issqnOutput.Free();

			raise;
		end;
  end;
end;

function CalcularTributosNFSeService.GetTributoPisCofins(
  const Tributo: CalculoPisCofinsResult;
  ATipoRetencao: TipoRetencaoPisCofinsEnum
): TributoNFSePisCofinsOutput;
var
	iCstPC: Integer;
	cstPC: StringNullable;
  vBC, pPis, pCofins, vPis, vCofins: CurrencyNullable;
begin
	iCstPC := StrToIntDef( Trim(Tributo.CSTPisCofins), -1);

	if iCstPC = -1 then
		cstPC := Stringnullable.NullInstance()
	else
		cstPC := Stringnullable.Create(Trim(Tributo.CSTPisCofins));
  {
	case iCstPC of
		1,2,3,5:
			begin
  }
				vBC := CurrencyNullable.CreateOrNull(Tributo.VBcOuQtde);
				pPis := CurrencyNullable.CreateOrNull(Tributo.PPisOuReais);
				pCofins := CurrencyNullable.CreateOrNull(Tributo.PCofinsOuReais);
				vPis := CurrencyNullable.CreateOrNull(Tributo.ValorPis);
				vCofins := CurrencyNullable.CreateOrNull(Tributo.ValorCofins);
  {
			end;
		else
		begin
      vBC := CurrencyNullable.NullInstance();
      pPis := CurrencyNullable.NullInstance();
      pCofins := CurrencyNullable.NullInstance();
      vPis := CurrencyNullable.NullInstance();
      vCofins := CurrencyNullable.NullInstance();
    end;
  end;
  }

  Result := TributoNFSePisCofinsOutput.Create(
		cstPC, vBC, pPis, pCofins, vPis, vCofins, ATipoRetencao
  );
end;


end.
