unit ParametrosFiscaisNFSeServiceUnit;

interface

uses
  IParametrosFiscaisNFSeServiceUnit, ITiposServicosRepositoryUnit, IClientesRepositoryUnit, IConfiguracoesRepositoryUnit,
  ParametrosFiscaisNFSeCommandUnit;

type
  ParametrosFiscaisNFSeService = class(TInterfacedObject, IParametrosFiscaisNFSeService)
  private
     FTiposServicosRepo: ITiposServicosRepository;
     FClientesRepo: IClientesRepository;
     FConfigsRepo: IConfiguracoesRepository;
  public
    constructor Create(
     TiposServicosRepo: ITiposServicosRepository;
     ClientesRepo: IClientesRepository;
     ConfigsRepo: IConfiguracoesRepository
    );
    function Executar(const Input: ParametrosFiscaisNFSeCommand): ParametrosFiscaisNFSeResult;
  end;

implementation

uses
  SysUtils, StrUtils,
  NFSeTypesUnit, ConfigLegacyTypes, ConfiguracaoEtdUnit, TipoServicoEtdUnit, ClienteEtdUnit, EValidacaoNegocioUnit,
  StringServiceUnit, NumberServiceUnit, TipoRetencaoFederalPJEnumUnit;

{ ParametrosFiscaisNFSeService }

constructor ParametrosFiscaisNFSeService.Create(
  TiposServicosRepo: ITiposServicosRepository;
  ClientesRepo: IClientesRepository;
  ConfigsRepo: IConfiguracoesRepository
);
begin
  FTiposServicosRepo := TiposServicosRepo;
  FClientesRepo := ClientesRepo;
  FConfigsRepo := ConfigsRepo;
end;

function ParametrosFiscaisNFSeService.Executar(const Input: ParametrosFiscaisNFSeCommand): ParametrosFiscaisNFSeResult;
var
  AliqPis, AliqCofins, AliqRetPis, AliqRetCofins, AliqRetIrrf, AliqRetCsll, AliqRetCP: Currency;
  AliqCheiaSN, AliqIssSN, AliqIssServico: Currency;
  IsSimplesNacional, UsarAliqIssSN: Boolean;
  NBS, LC116, CSTPC: string;
  TipoTribIss: TributacaoISSQNEnum;
  TipoRetIss: TipoRetencaoISSQNEnum;
  TipoRetPC: TipoRetencaoPisCofinsEnum;
  RetencoesPJ: TipoRetencaoFederalPJEnumSet;
  confL: ConfigLegacyData;
  conf: ConfiguracaoEtd;
  servico: TipoServicoEtd;
  tomador, intermed: ClienteEtd;
  iCstPC: Integer;
begin
  tomador := nil;
  intermed := nil;
  confL := FConfigsRepo.GetLegacy([ceRegimeFederal, ceAliqCheiaSN, ceAliqIssSN, ceAliqPis, ceAliqCofins]);
  conf := FConfigsRepo.GetByKey('nfse_simples_nacional_aliq', Input.EmpresaId);
  try
    AliqPis := confL.GetCurrency(ceAliqPis);
    AliqCofins := confL.GetCurrency(ceAliqCofins);
    AliqCheiaSN := confL.GetCurrency(ceAliqCheiaSN);
    AliqIssSN := confL.GetCurrency(ceAliqIssSN);

    IsSimplesNacional := ContainsText(confL.GetString(ceRegimeFederal), 'SIMPLES');
		UsarAliqIssSN := IsSimplesNacional and Assigned(conf) and conf.ValorBool;

    servico := FTiposServicosRepo.GetById(Input.ServicoId);
    if servico = nil then
			raise EValidacaoNegocio.CreateFmt('Tipo de serviço não encontrado com o código %d', [ Input.ServicoId ]);

    tomador := FClientesRepo.GetById(Input.TomadorId, Input.EmpresaId);
    if tomador = nil then
			raise EValidacaoNegocio.CreateFmt('Tomador/Prestador não encontrado com o código %d', [ Input.TomadorId ]);

    NBS := servico.cNBS.Value;
    LC116 := StringService.PadLeft(StringService.OnlyNumber(servico.CodLC116.Value), 4, '0');
    TipoTribIss := servico.Tributacao;
    AliqIssServico := servico.AliqISS.Value;
    RetencoesPJ := tomador.RetencoesFederaisNFS;

    if not Input.IsEmissaoPropria then
      TipoRetIss := trNaoRetido

    else if (TipoTribIss <> tiOperacaoTributavel) then
    begin
      TipoRetIss := trNaoRetido;
      AliqIssServico := 0;
    end
    else
    begin
      if Input.IntermedId > 0 then
        intermed := FClientesRepo.GetById(Input.IntermedId, Input.EmpresaId);

      if Assigned(intermed) and intermed.TemRentecaoISS then
				TipoRetIss := trRetidoPeloIntermediario

			else if tomador.TemRentecaoISS or servico.TemRentecaoISS then
				TipoRetIss := trRetidoPeloTomador

			else
				TipoRetIss := trNaoRetido;
    end;

		// Obtendo PISCOFINS
//		if IsSimplesNacional then // Simples nacional nao vai destacar
//    begin
//			CSTPC := '';
//      AliqPis := 0;
//      AliqCofins := 0;
//    end
//		else
//		begin
    CSTPC := IfThen( Input.IsEmissaoPropria, servico.CSTPisCofins.Value, servico.CSTPisCofinsEntrada.Value );
    iCstPC := StrToIntDef( Trim(CSTPC), -1);
    case iCstPC of
      0..9                              : CSTPC := '0' + IntToStr(iCstPC); // CSTs validos
      49, 50..56, 60..67, 70..75, 98, 99: CSTPC := IntToStr(iCstPC);       // CSTs validos
      else
        CSTPC := IfThen(Input.IsEmissaoPropria, '01', '50'); // Default tributavel com aliquota basica
    end;
//		end;

		// Obtendo retencoes
    AliqRetIrrf := NumberService.Default(servico.AliqRetIR.Value, 0);
    AliqRetPis := NumberService.Default(servico.AliqRetPIS.Value, 0);
    AliqRetCofins := NumberService.Default(servico.AliqRetCOFINS.Value, 0);
    AliqRetCsll := NumberService.Default(servico.AliqRetCSLL.Value, 0);
    AliqRetCP := NumberService.Default(servico.AliqRetCP.Value, 0);

    // Assegurando quando tem retencao que vai usar um CST que tem valores calculados
//		if (AliqRetPis > 0) or (AliqRetCofins > 0) then
//		begin
//			iCstPC := StrToIntDef(Trim(CSTPC), -1);
//			case iCstPC of
//				1,2,3,5: ;// CST OK com calculo de PIS
//			else
//				CSTPC := '01'; // Default tributavel com aliquota basica
//			end;
//		end;

    Result := ParametrosFiscaisNFSeResult.Create(
      AliqPis, AliqCofins, AliqRetPis, AliqRetCofins, AliqRetIrrf, AliqRetCsll, AliqRetCP,
      AliqCheiaSN, AliqIssSN, AliqIssServico,
      IsSimplesNacional, UsarAliqIssSN,
      NBS, LC116, CSTPC,
      TipoTribIss,
      TipoRetIss,
      TipoRetPC,
      RetencoesPJ
    );

  finally
    conf.Free();
    servico.Free();
    tomador.Free();
    intermed.Free();
  end;
end;

end.
