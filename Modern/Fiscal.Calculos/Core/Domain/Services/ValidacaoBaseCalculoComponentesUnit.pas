unit ValidacaoBaseCalculoComponentesUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/service/ProcessamentoItemService.java

interface

uses
  CalcularTributoInputUnit,
  ItemCalculoInputUnit,
  IntegerNullableUnit,
  IBaseCalculoUnificadaServiceUnit;

type
  ValidacaoBaseCalculoComponentes = class
  public
    class function AjustarItem(const Documento: CalcularTributoInput;
      const Item: ItemCalculoInput; const TipoDocumento: IntegerNullable;
      const BaseCalculoService: IBaseCalculoUnificadaService): ItemCalculoInput; static;
    class function AjustarBaseLegado(const Item: ItemCalculoInput): ItemCalculoInput; static;
  end;

implementation

uses
  SysUtils,
  DateUtils,
  CodigosErroValidacao,
  BaseCalculoNaturezaEnumUnit,
  BaseCalculoUnificadaOutputUnit,
  CurrencyNullableUnit,
  DecimalCalculoUnit,
  EValidacaoRTCUnit,
  ImpostoSeletivoInputUnit;

const
  MSG_BASE_IS_NEGATIVA =
    'A base de cálculo do Imposto Seletivo calculada a partir dos componentes é negativa';
  MSG_BASE_NEGATIVA =
    'A base de cálculo calculada a partir dos componentes é negativa';
  MSG_COMPONENTES_INCONSISTENTES =
    'A base de cálculo declarada (%s) diverge da base calculada a partir dos componentes informados (%s)';

function InferirNatureza(const Item: ItemCalculoInput): BaseCalculoNatureza;
var
  possuiNcm, possuiNbs: Boolean;
begin
  possuiNcm := Trim(Item.NCM) <> '';
  possuiNbs := Trim(Item.NBS) <> '';

  if possuiNcm and not possuiNbs then
    Result := bcnBem
  else if possuiNbs and not possuiNcm then
    Result := bcnServico
  else
    Result := bcnUnassigned;
end;

function TextoBase(const Valor: DecimalCalculo): string;
begin
  if Valor.Escala <= 2 then
    Result := Valor.ParaTexto(2)
  else
    Result := Valor.ParaTexto(Valor.Escala);
end;

function TextoValor(const Valor: DecimalCalculo): string;
begin
  Result := Valor.ParaTexto(Valor.Escala);
end;

procedure ValidarDivergencia(const Declarada, Calculada: DecimalCalculo);
begin
  if Declarada.Comparar(Calculada) <> 0 then
    raise EValidacaoRTC.Create(CODIGO_BASE_CALCULO_COMPONENTES_INCONSISTENTE,
      Format(MSG_COMPONENTES_INCONSISTENTES,
        [TextoBase(Declarada), TextoBase(Calculada)]));
end;

{ ValidacaoBaseCalculoComponentes }

class function ValidacaoBaseCalculoComponentes.AjustarItem(
  const Documento: CalcularTributoInput;
  const Item: ItemCalculoInput;
  const TipoDocumento: IntegerNullable;
  const BaseCalculoService: IBaseCalculoUnificadaService): ItemCalculoInput;
var
  resultado: BaseCalculoUnificadaOutput;
  baseCalculada: DecimalCalculo;
  impostoSeletivo: ImpostoSeletivoInput;
  natureza: BaseCalculoNatureza;
begin
  Result := Item;

  if (not Result.HasGComponentesBC) or (not Result.GComponentesBC.PossuiComponentes) then
    Exit;

  natureza := InferirNatureza(Result);
  resultado := BaseCalculoService.CalcularExato(Result.GComponentesBC,
    YearOf(Documento.GetFatoGeradorAplicavel()), natureza, TipoDocumento);

  if not Result.ImpostoSeletivo.IsNull then
  begin
    baseCalculada := resultado.BaseIS;

    if baseCalculada.Negativo then
      raise EValidacaoRTC.Create(MSG_BASE_IS_NEGATIVA);

    if not Result.ImpostoSeletivo.BaseCalculo.IsNull then
      ValidarDivergencia(
        DecimalCalculo.DeCurrency(Result.ImpostoSeletivo.BaseCalculo.Value), baseCalculada)
    else
    begin
      impostoSeletivo := Result.ImpostoSeletivo;
      impostoSeletivo.BaseCalculo := CurrencyNullable.Create(baseCalculada.ParaCurrency);
      Result.ImpostoSeletivo := impostoSeletivo;
    end;

    Exit;
  end;

  baseCalculada := resultado.BaseRG;

  if baseCalculada.Negativo then
    raise EValidacaoRTC.Create(MSG_BASE_NEGATIVA);

  if not Result.BaseCalculo.IsNull then
    ValidarDivergencia(DecimalCalculo.DeCurrency(Result.BaseCalculo.Value), baseCalculada)
  else
    Result.BaseCalculo := CurrencyNullable.Create(baseCalculada.ParaCurrency);
end;

class function ValidacaoBaseCalculoComponentes.AjustarBaseLegado(
  const Item: ItemCalculoInput): ItemCalculoInput;
var
  baseCalculo, baseImpostoSeletivo, impostoInformado, soma: DecimalCalculo;
begin
  Result := Item;

  if Result.ImpostoSeletivo.IsNull then
  begin
    if Result.BaseCalculo.IsNull then
      raise EValidacaoRTC.Create(CODIGO_BASE_CALCULO_NAO_INFORMADA,
        'A base de cálculo de CBS e IBS deve ser informada quando o grupo do ' +
        'Imposto Seletivo não é informado');
    Exit;
  end;

  if Result.ImpostoSeletivo.BaseCalculo.IsNull then
    raise EValidacaoRTC.Create(CODIGO_ERRO_GENERICO_VALIDACAO,
      'A base de cálculo do Imposto Seletivo deve ser informada quando o grupo de ' +
      'Imposto Seletivo é informado');

  baseImpostoSeletivo := DecimalCalculo.DeCurrency(Result.ImpostoSeletivo.BaseCalculo.Value);

  if Result.BaseCalculo.IsNull then
  begin
    soma := baseImpostoSeletivo.Somar(
      DecimalCalculo.DeCurrency(Result.ImpostoSeletivo.ValorImpostoSeletivoInformado));
    Result.BaseCalculo := CurrencyNullable.Create(soma.ParaCurrency);
    Exit;
  end;

  baseCalculo := DecimalCalculo.DeCurrency(Result.BaseCalculo.Value);

  if not Result.ImpostoSeletivo.ImpostoInformado.IsNull then
  begin
    impostoInformado := DecimalCalculo.DeCurrency(Result.ImpostoSeletivo.ImpostoInformado.Value);
    soma := baseImpostoSeletivo.Somar(impostoInformado);

    if baseCalculo.Comparar(soma) <> 0 then
      raise EValidacaoRTC.Create(CODIGO_BASE_CALCULO_INCONSISTENTE,
        Format('A base de cálculo de CBS e IBS informada %s difere da soma da base de ' +
          'cálculo do Imposto Seletivo %s com o Imposto Seletivo informado %s',
          [TextoValor(baseCalculo), TextoValor(baseImpostoSeletivo),
            TextoValor(impostoInformado)]));
  end
  else if baseCalculo.Comparar(baseImpostoSeletivo) < 0 then
    raise EValidacaoRTC.Create(CODIGO_BASE_CALCULO_MENOR_BASE_CALCULO_IMPOSTO_SELETIVO,
      Format('A base de cálculo de CBS e IBS informada %s é menor que a base de ' +
        'cálculo do Imposto Seletivo %s',
        [TextoValor(baseCalculo), TextoValor(baseImpostoSeletivo)]));
end;

end.
