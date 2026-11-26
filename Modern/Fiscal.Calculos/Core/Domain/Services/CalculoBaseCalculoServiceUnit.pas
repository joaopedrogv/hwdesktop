unit CalculoBaseCalculoServiceUnit;

interface

uses
  ICalculoBaseCalculoServiceUnit,
  ICalculadorBaseCalculoServiceUnit,
  CalcularBaseCalculoModelUnit,
  DecimalCalculoUnit;

type
  CalculoBaseCalculoService = class(TInterfacedObject, ICalculoBaseCalculoService)
  private
    procedure ValidaAnoInicioTributo(AnoFatoGerador, AnoInicioTributo: SmallInt; const MensagemErro: string);
    procedure ValidaValoresForaLimiteVigenciaPermitido(AnoFatoGerador: SmallInt; icms, iss: Currency; pis: Currency = 0.00; cofins: Currency = 0.00);
    procedure ValidaValorFinalBaseCalculo(const ValorFinal: DecimalCalculo);
  public
    function CalculaIS(const Input: BaseCalculoISMercadoriasModel): Currency;
    function CalculaIbsCbs(const Input: BaseCalculoIbsCbsModel): Currency;
  end;

  CalculadorBaseCalculoService = class(CalculoBaseCalculoService, ICalculadorBaseCalculoService)
  end;

implementation

uses
  SysUtils,
  ArredondamentoCalculoUnit;


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
  integra, naoIntegra, baseCalculo: DecimalCalculo;
begin
  ValidaAnoInicioTributo( Input.AnoFatoGerador, ANO_INICIO_CBS_IBS, MENSAGEM_ERRO_CBS_IBS );

  ValidaValoresForaLimiteVigenciaPermitido(Input.AnoFatoGerador, Input.ICMS, Input.ISS, Input.PIS, Input.COFINS);

  integra := DecimalCalculo.DeCurrency(input.ValorBem);
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.AjusteAcrescimos));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.Juros));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.Multas));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.Encargos));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.Frete));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.ImpostoSeletivo));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.OutrosTributos));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.DemaisImportancias));

  naoIntegra := DecimalCalculo.DeCurrency(input.IPI);
  naoIntegra := naoIntegra.Somar(DecimalCalculo.DeCurrency(input.DescontoIncondicional));
  if Input.AnoFatoGerador < ANO_EXTINCAO_PIS_COFINS then
  begin
    naoIntegra := naoIntegra.Somar(DecimalCalculo.DeCurrency(input.PIS));
    naoIntegra := naoIntegra.Somar(DecimalCalculo.DeCurrency(input.COFINS));
  end;
  if Input.AnoFatoGerador < ANO_EXTINCAO_ICMS_ISS then
  begin
    naoIntegra := naoIntegra.Somar(DecimalCalculo.DeCurrency(input.ICMS));
    naoIntegra := naoIntegra.Somar(DecimalCalculo.DeCurrency(input.ISS));
  end;

  baseCalculo := integra.Subtrair(naoIntegra);
  ValidaValorFinalBaseCalculo(baseCalculo);
  baseCalculo := ArredondamentoCalculo.ValorFiscal(baseCalculo);
  Result := baseCalculo.ParaCurrency;
end;

function CalculoBaseCalculoService.CalculaIS(
  const Input: BaseCalculoISMercadoriasModel): Currency;
var
  integra, naoIntegra, baseCalculo: DecimalCalculo;
begin
  ValidaAnoInicioTributo( Input.AnoFatoGerador, ANO_INICIO_IS, MENSAGEM_ERRO_IS );

  ValidaValoresForaLimiteVigenciaPermitido(Input.AnoFatoGerador, Input.ICMS, Input.ISS);

  integra := DecimalCalculo.DeCurrency(input.ValorBem);
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.AjusteAcrescimos));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.Juros));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.Multas));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.Encargos));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.FreteCobrado));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.OutrosTributos));
  integra := integra.Somar(DecimalCalculo.DeCurrency(input.DemaisImportancias));

  naoIntegra := DecimalCalculo.DeCurrency(input.IPI);
  naoIntegra := naoIntegra.Somar(DecimalCalculo.DeCurrency(input.DescontoIncondicional));
  naoIntegra := naoIntegra.Somar(DecimalCalculo.DeCurrency(input.Bonificacao));
  naoIntegra := naoIntegra.Somar(DecimalCalculo.DeCurrency(input.DevolucaoVendas));
  if Input.AnoFatoGerador < ANO_EXTINCAO_ICMS_ISS then
  begin
    naoIntegra := naoIntegra.Somar(DecimalCalculo.DeCurrency(input.ICMS));
    naoIntegra := naoIntegra.Somar(DecimalCalculo.DeCurrency(input.ISS));
  end;

  baseCalculo := integra.Subtrair(naoIntegra);
  ValidaValorFinalBaseCalculo(baseCalculo);
  baseCalculo := ArredondamentoCalculo.ValorFiscal(baseCalculo);
  Result := baseCalculo.ParaCurrency;
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

procedure CalculoBaseCalculoService.ValidaValorFinalBaseCalculo(const ValorFinal: DecimalCalculo);
begin
  if ValorFinal.MenorQue(DecimalCalculo.Zero) then
    raise Exception.Create('Base de cálculo não pode ser negativa. A soma dos valores que não integram a base é maior que a soma dos valores que integram a base');
end;

end.
