unit ChecarPossivelRetencaoNFSeUseCaseUnit;

interface

uses
  IParametrosFiscaisNFSeServiceUnit, IPedVendaRepositoryUnit, INFSeAgrupamentoServiceUnit, IConfiguracaoNFSeServiceUnit,
  ISessionContextUnit, ICalcularRetenFederalServiceUnit, ICalcularISSQNServiceUnit,
  IAplicarRegrasTributosNFSeServiceUnit;

type
  IChecarPossivelRetencaoNFSeUseCase = interface
    ['{96D00945-4444-4B7D-BCF2-88176B58C8E1}']
    function Executar(NumeroOS: Integer): Boolean;
  end;

  ChecarPossivelRetencaoNFSeUseCase = class(TInterfacedObject, IChecarPossivelRetencaoNFSeUseCase)
  private
    FSession: ISessionContext;
    FOrdensServRepo: IPedVendaRepository;
    FConfigNFSeServ: IConfiguracaoNFSeService;
    FParametrosFiscaisNFSe: IParametrosFiscaisNFSeService;
    FAgrupamentosOrdemServ: INFSeAgrupamentoService;
		FCalcularISSQN: ICalcularISSQNService;
		FCalcularRetebFed: ICalcularRetenFederalService;
    FAplicarRegrasTributos: IAplicarRegrasTributosNFSeService;
  public
    constructor Create(
      Session: ISessionContext;
      OrdensServRepo: IPedVendaRepository;
      ConfigNFSeServ: IConfiguracaoNFSeService;
      ParametrosFiscaisNFSe: IParametrosFiscaisNFSeService;
      AgrupamentosOrdemServ: INFSeAgrupamentoService;
      CalcularISSQN: ICalcularISSQNService;
      CalcularRetebFed: ICalcularRetenFederalService;
      AplicarRegrasTributos: IAplicarRegrasTributosNFSeService
    );
    function Executar(NumeroOS: Integer): Boolean;
  end;

implementation

uses
  OSItemFiscalEtdUnit, TipoComunsUnit, ArrayServiceUnit, ConfiguracaoNFSeModelUnit, ParametrosFiscaisNFSeCommandUnit,
  NFSeTypesUnit, CalculoISSQNResultUnit, CalculoRetenFederalInputUnit, CalculoRetenFederalResultUnit;

{ ChecarPossivelRetencaoNFSeUseCase }

constructor ChecarPossivelRetencaoNFSeUseCase.Create(
  Session: ISessionContext;
  OrdensServRepo: IPedVendaRepository;
  ConfigNFSeServ: IConfiguracaoNFSeService;
  ParametrosFiscaisNFSe: IParametrosFiscaisNFSeService;
  AgrupamentosOrdemServ: INFSeAgrupamentoService;
  CalcularISSQN: ICalcularISSQNService;
	CalcularRetebFed: ICalcularRetenFederalService;
  AplicarRegrasTributos: IAplicarRegrasTributosNFSeService
);
begin
  FSession := Session;
  FOrdensServRepo := OrdensServRepo;
  FConfigNFSeServ := ConfigNFSeServ;
  FParametrosFiscaisNFSe := ParametrosFiscaisNFSe;
  FAgrupamentosOrdemServ := AgrupamentosOrdemServ;
  FCalcularISSQN := CalcularISSQN;
  FCalcularRetebFed := CalcularRetebFed;
  FAplicarRegrasTributos := AplicarRegrasTributos;
end;

function ChecarPossivelRetencaoNFSeUseCase.Executar(NumeroOS: Integer): Boolean;
var
  ItemsOS: OSItemFiscalEtdlList;
  ConfigNFSe: ConfiguracaoNFSeModel;
  Agrupamento: NFSeAgrupamentosOS;
  ParamsResult: ParametrosFiscaisNFSeResult;
  issqnResult: CalculoISSQNResult;
  retenResult: CalculoRetenFederalResult;
  ValorLiquido: Currency;
  I: Integer;
begin
  ConfigNFSe := FConfigNFSeServ.Executar(FSession.EmpresaId);

  ItemsOS := FOrdensServRepo.ListarItensFiscaisOS(ArrayService.MakeArrayInt(NumeroOS));
  try
    Agrupamento := FAgrupamentosOrdemServ.AgruparItensParaNFSe( ItemsOS, ConfigNFSe.AgruparPorCTribNac );
  finally
    ItemsOS.Free();
  end;

  for I := 0 to High(Agrupamento) do
  begin
    ValorLiquido := Agrupamento[I].ValorServicos - Agrupamento[I].ValorDescontos;

    ParamsResult := FParametrosFiscaisNFSe.Executar( ParametrosFiscaisNFSeCommand.Create(
      FSession.EmpresaId,
      Agrupamento[I].ServicoId,
      Agrupamento[I].ClienteId,
      0, True
    ));

    if (ParamsResult.TipoRetIss in [ trRetidoPeloTomador, trRetidoPeloIntermediario ])
      and (ParamsResult.TipoTribIss in [ tiOperacaoTributavel, tiExportacao ]) then
    begin
      issqnResult := FCalcularISSQN.Executar( ParamsResult.AliqIssTratada, ValorLiquido );
      if issqnResult.ValorISSQN > 0 then
      begin
        Result := True;
        Exit;
      end;
    end;

    retenResult := FCalcularRetebFed.Executar( CalculoRetenFederalInput.Create(
      ValorLiquido,
      ParamsResult.AliqRetPis,
      ParamsResult.AliqCofins,
      ParamsResult.AliqRetIrrf,
      ParamsResult.AliqRetCsll,
      ParamsResult.AliqRetCP
    ));

    retenResult := FAplicarRegrasTributos.AplicarRetencoesFederais(
      retenResult, ParamsResult.IsSimplesNacional, ParamsResult.RetsFedCliente
    );

    if (retenResult.VRetPIS > 0)
      or (retenResult.VRetCOFINS > 0)
      or (retenResult.VRetIRRF > 0)
      or (retenResult.VRetCSLL > 0)
      or (retenResult.VRetCP > 0) then
    begin
      Result := True;
      Exit;
    end;
  end;

  Result := False;
end;

end.
