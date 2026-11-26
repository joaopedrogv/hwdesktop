unit AvaliadorExpressaoAritmeticaServiceUnit;

interface

uses
  SysUtils, Classes,
  DecimalCalculoUnit,
  IAvaliadorExpressaoAritmeticaServiceUnit;

type
  AvaliadorExpressaoAritmeticaService = class(TInterfacedObject, IAvaliadorExpressaoAritmeticaService)
  public
    function Evaluate(const Expressao: string; const Variaveis: VariaveisAvaliador): DecimalCalculo;
  end;

implementation

uses
  Math, strutils;

type
  TExpressaoFunc = function(const V: VariaveisAvaliador): DecimalCalculo of object;

const
  EXPR_NULL                 = '';
  EXPR_PBIO_ADREM_PRINC_SEC = '(1-pBio)*aliquotaAdRemPrincipal+pBio*aliquotaAdRemSecundaria';
  EXPR_BCINF_ISINF_ISCALC2  = '(baseCalculoInformada-impostoSeletivoInformado+impostoSeletivoCalculado)*(1-100/100)';
  EXPR_PBIO_QTDE_ADREMSEC   = '(pBio/(1-pBio))*quantidade*aliquotaAdRemSecundaria';
  EXPR_VPP_QTD_PBIO_ADRMSEC = '(variacaoPontoPercentual/100)*quantidade*(pBio/(1-pBio))*aliquotaAdRemSecundaria';
  EXPR_ZERO                 = '0';
  EXPR_1_00                 = '1.00';
  EXPR_ALIQUOTA             = 'aliquota';
  EXPR_ALIQ_REDUZIDA        = 'aliquota*(1-percentualReducao)';
  EXPR_ALIQ_RED_CMP_GOV     = 'aliquota*(1-percentualReducao)*(1-pRedutorCompraGov/100)';
  EXPR_ALIQ_ADREM_PRINC     = 'aliquotaAdRemPrincipal';
  EXPR_ALIQ_ADREM_SEC       = 'aliquotaAdRemSecundaria';
  EXPR_BC_ADVLREM_QTD_ADREM = 'baseCalculo*aliquotaAdValorem+quantidade*aliquotaAdRem';
  EXPR_BC_X_ALIQEFET        = 'baseCalculo*aliquotaEfetiva';
  EXPR_BCINF                = 'baseCalculoInformada';
  EXPR_BCINF_0_50           = 'baseCalculoInformada*0.5';
  EXPR_BCINF_ISINF_ISCALC   = 'baseCalculoInformada-impostoSeletivoInformado+impostoSeletivoCalculado';
  EXPR_QUANTIDADE           = 'quantidade';
  EXPR_QUANTIDADE_ALIQUOTA  = 'quantidade*aliquota';
  EXPR_QTDE_ADREM_PRINC     = 'quantidade*aliquotaAdRemPrincipal';
  EXPR_QTDE_ADREM_PRINC_DIF = 'quantidade*aliquotaAdRemPrincipal*(1-percentualDiferimento)';
  EXPR_TRIB_CALC            = 'tributoCalculado';
  EXPR_TRIB_CALC_X_1_00     = 'tributoCalculado*1.00';

function Exec_NULL_or_ZERO(const V: VariaveisAvaliador): DecimalCalculo;
begin
  Result := DecimalCalculo.Zero;
end;

function Exec_PBIO_ADREM_PRINC_SEC(const V: VariaveisAvaliador): DecimalCalculo;
var
  pBio, aliquotaAdRemPrincipal, aliquotaAdRemSecundaria,
  um, fator, termoPrincipal, termoSecundario, resultado: DecimalCalculo;
begin
  pBio := V.pBio;
  aliquotaAdRemPrincipal := V.aliquotaAdRemPrincipal;
  aliquotaAdRemSecundaria := V.aliquotaAdRemSecundaria;
  um := DecimalCalculo.DeInteiro(1);
  fator := um.Subtrair(pBio);
  termoPrincipal := fator.Multiplicar(aliquotaAdRemPrincipal);
  termoSecundario := pBio.Multiplicar(aliquotaAdRemSecundaria);
  resultado := termoPrincipal.Somar(termoSecundario);
  Result := resultado;
end;

function Exec_BCINF_ISINF_ISCALC2(const V: VariaveisAvaliador): DecimalCalculo;
var
  baseCalculoInformada, impostoSeletivoInformado, impostoSeletivoCalculado,
  cem, um, subtotal, semImposto, fator, quociente, resultado: DecimalCalculo;
begin
  baseCalculoInformada := V.baseCalculoInformada;
  impostoSeletivoInformado := V.impostoSeletivoInformado;
  impostoSeletivoCalculado := V.impostoSeletivoCalculado;
  subtotal := baseCalculoInformada.Subtrair(impostoSeletivoInformado);
  semImposto := subtotal.Somar(impostoSeletivoCalculado);
  cem := DecimalCalculo.DeInteiro(100);
  um := DecimalCalculo.DeInteiro(1);
  quociente := cem.Dividir(cem);
  fator := um.Subtrair(quociente);
  resultado := semImposto.Multiplicar(fator);
  Result := resultado;
end;

function Exec_PBIO_QTDE_ADREMSEC(const V: VariaveisAvaliador): DecimalCalculo;
var
  pBio, quantidade, aliquotaAdRemSecundaria,
  um, fator, razao, comQuantidade, resultado: DecimalCalculo;
begin
  pBio := V.pBio;
  quantidade := V.quantidade;
  aliquotaAdRemSecundaria := V.aliquotaAdRemSecundaria;
  um := DecimalCalculo.DeInteiro(1);
  fator := um.Subtrair(pBio);
  razao := pBio.Dividir(fator);
  comQuantidade := razao.Multiplicar(quantidade);
  resultado := comQuantidade.Multiplicar(aliquotaAdRemSecundaria);
  Result := resultado;
end;

function Exec_VPP_QTD_PBIO_ADRMSEC(const V: VariaveisAvaliador): DecimalCalculo;
var
  variacaoPontoPercentual, quantidade, pBio, aliquotaAdRemSecundaria,
  cem, variacaoFracao, um, fator, razao, comQuantidade, comBio, resultado: DecimalCalculo;
begin
  variacaoPontoPercentual := V.variacaoPontoPercentual;
  quantidade := V.quantidade;
  pBio := V.pBio;
  aliquotaAdRemSecundaria := V.aliquotaAdRemSecundaria;
  cem := DecimalCalculo.DeInteiro(100);
  variacaoFracao := variacaoPontoPercentual.Dividir(cem);
  um := DecimalCalculo.DeInteiro(1);
  fator := um.Subtrair(pBio);
  razao := pBio.Dividir(fator);
  comQuantidade := variacaoFracao.Multiplicar(quantidade);
  comBio := comQuantidade.Multiplicar(razao);
  resultado := comBio.Multiplicar(aliquotaAdRemSecundaria);
  Result := resultado;
end;

function Exec_1_00(const V: VariaveisAvaliador): DecimalCalculo;
begin
  Result := DecimalCalculo.DeTexto('1.00');
end;

function Exec_ALIQUOTA(const V: VariaveisAvaliador): DecimalCalculo;
begin
  Result := V.aliquota;
end;

function Exec_ALIQ_REDUZIDA(const V: VariaveisAvaliador): DecimalCalculo;
var
  aliquota, percentualReducao, um, fator, resultado: DecimalCalculo;
begin
  aliquota := V.aliquota;
  percentualReducao := V.percentualReducao;
  um := DecimalCalculo.DeInteiro(1);
  fator := um.Subtrair(percentualReducao);
  resultado := aliquota.Multiplicar(fator);
  Result := resultado;
end;

function Exec_ALIQ_RED_CMP_GOV(const V: VariaveisAvaliador): DecimalCalculo;
var
  aliquota, percentualReducao, pRedutorCompraGov, um, cem,
  fatorReducao, aliquotaReduzida, redutorFracao, fatorGov, resultado: DecimalCalculo;
begin
  aliquota := V.aliquota;
  percentualReducao := V.percentualReducao;
  pRedutorCompraGov := V.pRedutorCompraGov;
  um := DecimalCalculo.DeInteiro(1);
  fatorReducao := um.Subtrair(percentualReducao);
  aliquotaReduzida := aliquota.Multiplicar(fatorReducao);
  cem := DecimalCalculo.DeInteiro(100);
  redutorFracao := pRedutorCompraGov.Dividir(cem);
  fatorGov := um.Subtrair(redutorFracao);
  resultado := aliquotaReduzida.Multiplicar(fatorGov);
  Result := resultado;
end;

function Exec_ALIQ_ADREM_PRINC(const V: VariaveisAvaliador): DecimalCalculo;
begin
  Result := V.aliquotaAdRemPrincipal;
end;

function Exec_ALIQ_ADREM_SEC(const V: VariaveisAvaliador): DecimalCalculo;
begin
  Result := V.aliquotaAdRemSecundaria;
end;

function Exec_BC_ADVLREM_QTD_ADREM(const V: VariaveisAvaliador): DecimalCalculo;
var
  baseCalculo, aliquotaAdValorem, quantidade, aliquotaAdRem,
  termoAdValorem, termoAdRem, resultado: DecimalCalculo;
begin
  baseCalculo := V.baseCalculo;
  aliquotaAdValorem := V.aliquotaAdValorem;
  quantidade := V.quantidade;
  aliquotaAdRem := V.aliquotaAdRem;
  termoAdValorem := baseCalculo.Multiplicar(aliquotaAdValorem);
  termoAdRem := quantidade.Multiplicar(aliquotaAdRem);
  resultado := termoAdValorem.Somar(termoAdRem);
  Result := resultado;
end;

function Exec_BC_X_ALIQEFET(const V: VariaveisAvaliador): DecimalCalculo;
var
  baseCalculo, aliquotaEfetiva, resultado: DecimalCalculo;
begin
  baseCalculo := V.baseCalculo;
  aliquotaEfetiva := V.aliquotaEfetiva;
  resultado := baseCalculo.Multiplicar(aliquotaEfetiva);
  Result := resultado;
end;

function Exec_BCINF(const V: VariaveisAvaliador): DecimalCalculo;
begin
  Result := V.baseCalculoInformada;
end;

function Exec_BCINF_0_50(const V: VariaveisAvaliador): DecimalCalculo;
var
  baseCalculoInformada, meio, resultado: DecimalCalculo;
begin
  baseCalculoInformada := V.baseCalculoInformada;
  meio := DecimalCalculo.DeTexto('0.5');
  resultado := baseCalculoInformada.Multiplicar(meio);
  Result := resultado;
end;

function Exec_BCINF_ISINF_ISCALC(const V: VariaveisAvaliador): DecimalCalculo;
var
  baseCalculoInformada, impostoSeletivoInformado, impostoSeletivoCalculado,
  subtotal, resultado: DecimalCalculo;
begin
  baseCalculoInformada := V.baseCalculoInformada;
  impostoSeletivoInformado := V.impostoSeletivoInformado;
  impostoSeletivoCalculado := V.impostoSeletivoCalculado;
  subtotal := baseCalculoInformada.Subtrair(impostoSeletivoInformado);
  resultado := subtotal.Somar(impostoSeletivoCalculado);
  Result := resultado;
end;

function Exec_QUANTIDADE(const V: VariaveisAvaliador): DecimalCalculo;
begin
  Result := V.quantidade;
end;

function Exec_QUANTIDADE_ALIQUOTA(const V: VariaveisAvaliador): DecimalCalculo;
var
  quantidade, aliquota, resultado: DecimalCalculo;
begin
  quantidade := V.quantidade;
  aliquota := V.aliquota;
  resultado := quantidade.Multiplicar(aliquota);
  Result := resultado;
end;

function Exec_QTDE_ADREM_PRINC(const V: VariaveisAvaliador): DecimalCalculo;
var
  quantidade, aliquotaAdRemPrincipal, resultado: DecimalCalculo;
begin
  quantidade := V.quantidade;
  aliquotaAdRemPrincipal := V.aliquotaAdRemPrincipal;
  resultado := quantidade.Multiplicar(aliquotaAdRemPrincipal);
  Result := resultado;
end;

function Exec_QTDE_ADREM_PRINC_DIF(const V: VariaveisAvaliador): DecimalCalculo;
var
  quantidade, aliquotaAdRemPrincipal, percentualDiferimento,
  baseAdRem, um, fator, resultado: DecimalCalculo;
begin
  quantidade := V.quantidade;
  aliquotaAdRemPrincipal := V.aliquotaAdRemPrincipal;
  percentualDiferimento := V.percentualDiferimento;
  baseAdRem := quantidade.Multiplicar(aliquotaAdRemPrincipal);
  um := DecimalCalculo.DeInteiro(1);
  fator := um.Subtrair(percentualDiferimento);
  resultado := baseAdRem.Multiplicar(fator);
  Result := resultado;
end;

function Exec_TRIB_CALC(const V: VariaveisAvaliador): DecimalCalculo;
begin
  Result := V.tributoCalculado;
end;

function Exec_TRIB_CALC_X_1_00(const V: VariaveisAvaliador): DecimalCalculo;
var
  tributoCalculado, um, resultado: DecimalCalculo;
begin
  tributoCalculado := V.tributoCalculado;
  um := DecimalCalculo.DeTexto('1.00');
  resultado := tributoCalculado.Multiplicar(um);
  Result := resultado;
end;

{ AvaliadorExpressaoAritmeticaService }

function AvaliadorExpressaoAritmeticaService.Evaluate(const Expressao: string;
  const Variaveis: VariaveisAvaliador): DecimalCalculo;
begin
  if Expressao = EXPR_NULL then
    Result := Exec_NULL_or_ZERO(Variaveis)

  else if Expressao = EXPR_TRIB_CALC then
    Result := Exec_TRIB_CALC(Variaveis)

  else if Expressao = EXPR_BC_X_ALIQEFET then
    Result := Exec_BC_X_ALIQEFET(Variaveis)

  else if Expressao = EXPR_ALIQ_REDUZIDA then
    Result := Exec_ALIQ_REDUZIDA(Variaveis)

  else if Expressao = EXPR_ALIQ_RED_CMP_GOV then
    Result := Exec_ALIQ_RED_CMP_GOV(Variaveis)

  else if Expressao = EXPR_BCINF_ISINF_ISCALC then
    Result := Exec_BCINF_ISINF_ISCALC(Variaveis)

  else if Expressao = EXPR_ALIQUOTA then
    Result := Exec_ALIQUOTA(Variaveis)

  else if Expressao = EXPR_BCINF then
    Result := Exec_BCINF(Variaveis)

  else if Expressao = EXPR_ZERO then
    Result := Exec_NULL_or_ZERO(Variaveis)

  else if Expressao = EXPR_BC_ADVLREM_QTD_ADREM then
    Result := Exec_BC_ADVLREM_QTD_ADREM(Variaveis)

  else if Expressao = EXPR_QUANTIDADE then
    Result := Exec_QUANTIDADE(Variaveis)

  else if Expressao = EXPR_ALIQ_ADREM_SEC then
    Result := Exec_ALIQ_ADREM_SEC(Variaveis)

  else if Expressao = EXPR_QTDE_ADREM_PRINC then
    Result := Exec_QTDE_ADREM_PRINC(Variaveis)

  else if Expressao = EXPR_QUANTIDADE_ALIQUOTA then
    Result := Exec_QUANTIDADE_ALIQUOTA(Variaveis)

  else if Expressao = EXPR_ALIQ_ADREM_PRINC then
    Result := Exec_ALIQ_ADREM_PRINC(Variaveis)

  else if Expressao = EXPR_VPP_QTD_PBIO_ADRMSEC then
    Result := Exec_VPP_QTD_PBIO_ADRMSEC(Variaveis)

  else if Expressao = EXPR_BCINF_ISINF_ISCALC2 then
    Result := Exec_BCINF_ISINF_ISCALC2(Variaveis)

  else if Expressao = EXPR_PBIO_ADREM_PRINC_SEC then
    Result := Exec_PBIO_ADREM_PRINC_SEC(Variaveis)

  else if Expressao = EXPR_TRIB_CALC_X_1_00 then
    Result := Exec_TRIB_CALC_X_1_00(Variaveis)

  else if Expressao = EXPR_1_00 then
    Result := Exec_1_00(Variaveis)

  else if Expressao = EXPR_QTDE_ADREM_PRINC_DIF then
    Result := Exec_QTDE_ADREM_PRINC_DIF(Variaveis)

  else if Expressao = EXPR_BCINF_0_50 then
    Result := Exec_BCINF_0_50(Variaveis)

  else if Expressao = EXPR_PBIO_QTDE_ADREMSEC then
    Result := Exec_PBIO_QTDE_ADREMSEC(Variaveis)

  else
    raise Exception.CreateFmt('Expressão desconhecida: %s', [Expressao]);

end;

end.
{
|------------------------------------------------------------------------------------|----|
|expressao                                                                           |qtde|
|------------------------------------------------------------------------------------|----|
|                                                                                    |427 |
|tributoCalculado                                                                    |187 |
|baseCalculo*aliquotaEfetiva                                                         |157 |
|aliquota*(1-percentualReducao)*(1-pRedutorCompraGov/100)                            |156 |
|baseCalculoInformada-impostoSeletivoInformado+impostoSeletivoCalculado              |152 |
|aliquota                                                                            |121 |
|0                                                                                   |59  |
|baseCalculoInformada                                                                |30  |
|baseCalculo*aliquotaAdValorem+quantidade*aliquotaAdRem                              |13  |
|quantidade                                                                          |7   |
|aliquotaAdRemSecundaria                                                             |4   |
|quantidade*aliquotaAdRemPrincipal                                                   |3   |
|quantidade*aliquota                                                                 |3   |
|aliquotaAdRemPrincipal                                                              |3   |
|(variacaoPontoPercentual/100)*quantidade*(pBio/(1-pBio))*aliquotaAdRemSecundaria    |3   |
|(baseCalculoInformada-impostoSeletivoInformado+impostoSeletivoCalculado)*(1-100/100)|3   |
|(1-pBio)*aliquotaAdRemPrincipal+pBio*aliquotaAdRemSecundaria                        |3   |
|tributoCalculado*1.00                                                               |2   |
|1.00                                                                                |2   |
|quantidade*aliquotaAdRemPrincipal*(1-percentualDiferimento)                         |1   |
|baseCalculoInformada*0.5                                                            |1   |
|(pBio/(1-pBio))*quantidade*aliquotaAdRemSecundaria                                  |1   |
|------------------------------------------------------------------------------------|----|

|PARA COMPATIBILIDADE NOS CASOS DE TESTES|
aliquota*(1-percentualReducao)
}
