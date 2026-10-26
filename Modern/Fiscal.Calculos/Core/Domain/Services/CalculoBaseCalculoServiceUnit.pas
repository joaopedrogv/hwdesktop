unit CalculoBaseCalculoServiceUnit;

interface

uses
  ICalculoBaseCalculoServiceUnit,
  ICalculadorBaseCalculoServiceUnit,
  CalcularBaseCalculoModelUnit;

type
  CalculoBaseCalculoService = class(TInterfacedObject, ICalculoBaseCalculoService)
  private
    procedure ValidaAnoInicioTributo(AnoFatoGerador, AnoInicioTributo: SmallInt; const MensagemErro: string);
    procedure ValidaValoresForaLimiteVigenciaPermitido(AnoFatoGerador: SmallInt; icms, iss: Currency; pis: Currency = 0.00; cofins: Currency = 0.00);
    procedure ValidaValorFinalBaseCalculo(ValorFinal: Currency);
  public
    function CalculaIS(const Input: BaseCalculoISMercadoriasModel): Currency;
    function CalculaIbsCbs(const Input: BaseCalculoIbsCbsModel): Currency;
  end;

  CalculadorBaseCalculoService = class(CalculoBaseCalculoService, ICalculadorBaseCalculoService)
  end;

implementation

uses
  SysUtils, Math,
  NumberServiceUnit, ArredondamentoUtilsUnit;


const
  ANO_INICIO_CBS_IBS = 2026;
  ANO_INICIO_IS = 2027;
  ANO_EXTINCAO_PIS_COFINS = 2027;
  ANO_EXTINCAO_ICMS_ISS = 2033;
  MENSAGEM_ERRO_IS = 'Para IS, o ano do fato gerador deve ser 2027 ou superior';
  MENSAGEM_ERRO_CBS_IBS = 'Para CBS/IBS, o ano do fato gerador deve ser 2026 ou superior';

{ CalculoBaseCalculoService }

function CalculoBaseCalculoService.CalculaIbsCbs(
  const Input: BaseCalculoIbsCbsModel): Currency;
var
  integra, naoIntegra, baseCalculo: Double;
begin
  ValidaAnoInicioTributo( Input.AnoFatoGerador, ANO_INICIO_CBS_IBS, MENSAGEM_ERRO_CBS_IBS );

  ValidaValoresForaLimiteVigenciaPermitido(Input.AnoFatoGerador, Input.ICMS, Input.ISS, Input.PIS, Input.COFINS);

  integra :=
    + input.ValorBem
    + input.AjusteAcrescimos
    + input.Juros
    + input.Multas
    + input.Encargos
    + input.Frete
    + input.ImpostoSeletivo
    + input.OutrosTributos
    + input.DemaisImportancias;

  naoIntegra :=
    + input.IPI
    + input.DescontoIncondicional
    + IfThen( Input.AnoFatoGerador < ANO_EXTINCAO_PIS_COFINS, input.PIS)
    + IfThen( Input.AnoFatoGerador < ANO_EXTINCAO_PIS_COFINS, input.COFINS)
    + IfThen( Input.AnoFatoGerador < ANO_EXTINCAO_ICMS_ISS, input.ICMS)
    + IfThen( Input.AnoFatoGerador < ANO_EXTINCAO_ICMS_ISS, input.ISS);

  baseCalculo := ArredondamentoUtils.ArredondarInterno( integra - naoIntegra );
  Result := NumberService.RoundHalfUpTo2( baseCalculo );

  ValidaValorFinalBaseCalculo(Result);
end;

function CalculoBaseCalculoService.CalculaIS(
  const Input: BaseCalculoISMercadoriasModel): Currency;
var
  integra, naoIntegra, baseCalculo: Double;
begin
  ValidaAnoInicioTributo( Input.AnoFatoGerador, ANO_INICIO_IS, MENSAGEM_ERRO_IS );

  ValidaValoresForaLimiteVigenciaPermitido(Input.AnoFatoGerador, Input.ICMS, Input.ISS);

  integra :=
    + input.ValorBem
    + input.AjusteAcrescimos
    + input.Juros
    + input.Multas
    + input.Encargos
    + input.FreteCobrado
    + input.OutrosTributos
    + input.DemaisImportancias;

  naoIntegra :=
    { + input.Cosip }
    + input.IPI
    + input.DescontoIncondicional
    + input.Bonificacao
    + input.DevolucaoVendas
    + IfThen( Input.AnoFatoGerador < ANO_EXTINCAO_ICMS_ISS, input.ICMS)
    + IfThen( Input.AnoFatoGerador < ANO_EXTINCAO_ICMS_ISS, input.ISS);

  baseCalculo := ArredondamentoUtils.ArredondarInterno( integra - naoIntegra );
  Result := NumberService.RoundHalfUpTo2( baseCalculo );

  ValidaValorFinalBaseCalculo(Result);
end;

procedure CalculoBaseCalculoService.ValidaAnoInicioTributo(AnoFatoGerador, AnoInicioTributo: SmallInt;
  const MensagemErro: string);
begin
  if AnoFatoGerador < AnoInicioTributo then
    raise Exception.Create(MensagemErro);
end;

procedure CalculoBaseCalculoService.ValidaValoresForaLimiteVigenciaPermitido(AnoFatoGerador: SmallInt; icms, iss, pis, cofins: Currency);
begin
  if (AnoFatoGerador >= ANO_EXTINCAO_ICMS_ISS) and ((icms <> 0) or (iss <> 0)) then
    raise Exception.CreateFmt('ICMS e/ou ISS não devem ser informados a partir de %d', [ANO_EXTINCAO_ICMS_ISS]);

  if (AnoFatoGerador >= ANO_EXTINCAO_PIS_COFINS) and ((pis <> 0) or (cofins <> 0)) then
    raise Exception.CreateFmt('PIS e/ou COFINS não devem ser informados a partir de %d', [ANO_EXTINCAO_PIS_COFINS]);
end;

procedure CalculoBaseCalculoService.ValidaValorFinalBaseCalculo(ValorFinal: Currency);
begin
  if ValorFinal < 0 then
    raise Exception.Create('Base de cálculo não pode ser negativa. A soma dos valores que não integram a base é maior que a soma dos valores que integram a base');
end;

end.
