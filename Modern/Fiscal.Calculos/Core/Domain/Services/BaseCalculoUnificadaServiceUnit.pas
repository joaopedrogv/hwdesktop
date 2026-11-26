unit BaseCalculoUnificadaServiceUnit;

interface

uses
  IBaseCalculoUnificadaServiceUnit,
  BaseCalculoUnificadaOutputUnit,
  ComponentesBaseCalculoInputUnit,
  BaseCalculoNaturezaEnumUnit,
  IntegerNullableUnit;

type
  BaseCalculoUnificadaService = class(TInterfacedObject, IBaseCalculoUnificadaService)
  private
    procedure ValidarTipoDocumento(const ATipoDocumento: IntegerNullable);
  public
    function Calcular(const AComponentes: ComponentesBaseCalculoInput; AAno: Integer;
      ANatureza: BaseCalculoNatureza;
      const ATipoDocumento: IntegerNullable): BaseCalculoUnificadaOutput;
    function CalcularExato(const AComponentes: ComponentesBaseCalculoInput;
      AAno: Integer; ANatureza: BaseCalculoNatureza;
      const ATipoDocumento: IntegerNullable): BaseCalculoUnificadaOutput;
  end;

implementation

uses
  SysUtils,
  CurrencyNullableUnit,
  StringNullableUnit,
  BaseCalculoBaseEnumUnit,
  BaseCalculoOperacaoEnumUnit,
  ElementoBaseCalculoUnit,
  DecimalCalculoUnit,
  ArredondamentoCalculoUnit,
  EValidacaoRTCUnit;

const
  MSG_TIPO_DOCUMENTO_INVALIDO = 'Tipo de documento deve ser 55 (NF-e) ou 65 (NFC-e)';

{ BaseCalculoUnificadaService }

procedure BaseCalculoUnificadaService.ValidarTipoDocumento(
  const ATipoDocumento: IntegerNullable);
var
  tipoDocumento: Integer;
begin
  if ATipoDocumento.IsNull then
    raise EValidacaoRTC.Create(MSG_TIPO_DOCUMENTO_INVALIDO);

  tipoDocumento := ATipoDocumento.Value;
  if (tipoDocumento <> 55) and (tipoDocumento <> 65) then
    raise EValidacaoRTC.Create(MSG_TIPO_DOCUMENTO_INVALIDO);
end;

function BaseCalculoUnificadaService.Calcular(
  const AComponentes: ComponentesBaseCalculoInput; AAno: Integer;
  ANatureza: BaseCalculoNatureza;
  const ATipoDocumento: IntegerNullable): BaseCalculoUnificadaOutput;
var
  exato: BaseCalculoUnificadaOutput;
  baseRG, baseIS, baseSN: DecimalCalculo;
begin
  exato := CalcularExato(AComponentes, AAno, ANatureza, ATipoDocumento);

  baseRG := ArredondamentoCalculo.ValorFiscal(exato.BaseRG);
  baseIS := ArredondamentoCalculo.ValorFiscal(exato.BaseIS);
  baseSN := ArredondamentoCalculo.ValorFiscal(exato.BaseSN);

  Result := BaseCalculoUnificadaOutput.Create(baseRG, baseIS, baseSN, exato.Avisos);
end;

function BaseCalculoUnificadaService.CalcularExato(
  const AComponentes: ComponentesBaseCalculoInput; AAno: Integer;
  ANatureza: BaseCalculoNatureza;
  const ATipoDocumento: IntegerNullable): BaseCalculoUnificadaOutput;
var
  tipoDocumento: Integer;
  rgSoma, rgSubtrai, isSoma, isSubtrai, snSoma, snSubtrai: DecimalCalculo;
  baseRG, baseIS, baseSN, valor: DecimalCalculo;
  valorComponente: CurrencyNullable;
  elemento: ElementoBaseCalculo;
  bases: BaseCalculoBaseSet;
  operacao: BaseCalculoOperacao;
  motivo: StringNullable;
  avisos: BaseCalculoAvisos;
begin
  ValidarTipoDocumento(ATipoDocumento);
  tipoDocumento := ATipoDocumento.Value;

  rgSoma := DecimalCalculo.Zero;
  rgSubtrai := DecimalCalculo.Zero;
  isSoma := DecimalCalculo.Zero;
  isSubtrai := DecimalCalculo.Zero;
  snSoma := DecimalCalculo.Zero;
  snSubtrai := DecimalCalculo.Zero;
  SetLength(avisos, 0);

  for elemento := Low(ElementoBaseCalculo) to High(ElementoBaseCalculo) do
  begin
    valorComponente := AComponentes.GetValor(elemento);

    if not CampoCompoeBase(elemento, AAno, ANatureza, tipoDocumento) then
    begin
      if not valorComponente.IsNull then
        if valorComponente.Value <> 0 then
        begin
          motivo := MotivoNaoComposicao(elemento, AAno, ANatureza, tipoDocumento);
          if not motivo.IsNull then
          begin
            SetLength(avisos, Length(avisos) + 1);
            avisos[High(avisos)] := motivo.Value;
          end;
        end;
      Continue;
    end;

    if valorComponente.IsNull then
      Continue;

    valor := DecimalCalculo.DeCurrency(valorComponente.Value);
    if valor.EhZero then
      Continue;

    bases := ElementoBaseCalculoBases(elemento);
    operacao := ElementoBaseCalculoOperacao(elemento);

    if operacao = bcoSoma then
    begin
      if bcbRG in bases then
        rgSoma := rgSoma.Somar(valor);
      if bcbIS in bases then
        isSoma := isSoma.Somar(valor);
      if bcbSN in bases then
        snSoma := snSoma.Somar(valor);
    end;

    if operacao = bcoSubtrai then
    begin
      if bcbRG in bases then
        rgSubtrai := rgSubtrai.Somar(valor);
      if bcbIS in bases then
        isSubtrai := isSubtrai.Somar(valor);
      if bcbSN in bases then
        snSubtrai := snSubtrai.Somar(valor);
    end;
  end;

  baseRG := rgSoma.Subtrair(rgSubtrai);
  baseIS := isSoma.Subtrair(isSubtrai);
  baseSN := snSoma.Subtrair(snSubtrai);

  Result := BaseCalculoUnificadaOutput.Create(baseRG, baseIS, baseSN, avisos);
end;

end.
