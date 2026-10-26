unit AvaliadorExpressaoAritmeticaServiceUnit;

interface

uses
  SysUtils, Classes,
  IAvaliadorExpressaoAritmeticaServiceUnit;

type
  AvaliadorExpressaoAritmeticaService = class(TInterfacedObject, IAvaliadorExpressaoAritmeticaService)
  public
    function Evaluate(const Expressao: string; const Variaveis: VariaveisAvaliador; Scale: ScaleRange): Double;
  end;

implementation

uses
  Math, strutils, ArredondamentoUtilsUnit;

type
  TExpressaoFunc = function(const V: VariaveisAvaliador): Double of object;

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

function Exec_NULL_or_ZERO(const V: VariaveisAvaliador): Double;
begin
  Result := 0;
end;

function Exec_PBIO_ADREM_PRINC_SEC(const V: VariaveisAvaliador): Double;
begin
  Result := (1-V.pBio)*V.aliquotaAdRemPrincipal+V.pBio*V.aliquotaAdRemSecundaria;
end;

function Exec_BCINF_ISINF_ISCALC2(const V: VariaveisAvaliador): Double;
begin
  Result := (V.baseCalculoInformada-V.impostoSeletivoInformado+V.impostoSeletivoCalculado)*(1-100/100);
end;

function Exec_PBIO_QTDE_ADREMSEC(const V: VariaveisAvaliador): Double;
begin
  Result := (V.pBio/(1-V.pBio))*V.quantidade*V.aliquotaAdRemSecundaria;
end;

function Exec_VPP_QTD_PBIO_ADRMSEC(const V: VariaveisAvaliador): Double;
begin
  Result := (V.variacaoPontoPercentual/100)*V.quantidade*(V.pBio/(1-V.pBio))*V.aliquotaAdRemSecundaria;
end;

function Exec_1_00(const V: VariaveisAvaliador): Double;
begin
  Result := 1.00;
end;

function Exec_ALIQUOTA(const V: VariaveisAvaliador): Double;
begin
  Result := V.aliquota;
end;

function Exec_ALIQ_REDUZIDA(const V: VariaveisAvaliador): Currency;
begin
  Result := V.aliquota*(1-V.percentualReducao);
end;

function Exec_ALIQ_RED_CMP_GOV(const V: VariaveisAvaliador): Double;
begin
  Result := V.aliquota*(1-V.percentualReducao)*(1-V.pRedutorCompraGov/100);
end;

function Exec_ALIQ_ADREM_PRINC(const V: VariaveisAvaliador): Double;
begin
  Result := V.aliquotaAdRemPrincipal;
end;

function Exec_ALIQ_ADREM_SEC(const V: VariaveisAvaliador): Double;
begin
  Result := V.aliquotaAdRemSecundaria;
end;

function Exec_BC_ADVLREM_QTD_ADREM(const V: VariaveisAvaliador): Double;
begin
  Result := V.baseCalculo*V.aliquotaAdValorem+V.quantidade*V.aliquotaAdRem;
end;

function Exec_BC_X_ALIQEFET(const V: VariaveisAvaliador): Double;
begin
  Result := V.baseCalculo*V.aliquotaEfetiva;
end;

function Exec_BCINF(const V: VariaveisAvaliador): Double;
begin
  Result := V.baseCalculoInformada;
end;

function Exec_BCINF_0_50(const V: VariaveisAvaliador): Double;
begin
  Result := V.baseCalculoInformada*0.5;
end;

function Exec_BCINF_ISINF_ISCALC(const V: VariaveisAvaliador): Double;
begin
  Result := V.baseCalculoInformada-V.impostoSeletivoInformado+V.impostoSeletivoCalculado;
end;

function Exec_QUANTIDADE(const V: VariaveisAvaliador): Double;
begin
  Result := V.quantidade;
end;

function Exec_QUANTIDADE_ALIQUOTA(const V: VariaveisAvaliador): Double;
begin
  Result := V.quantidade*V.aliquota;
end;

function Exec_QTDE_ADREM_PRINC(const V: VariaveisAvaliador): Double;
begin
  Result := V.quantidade*V.aliquotaAdRemPrincipal;
end;

function Exec_QTDE_ADREM_PRINC_DIF(const V: VariaveisAvaliador): Double;
begin
  Result := V.quantidade*V.aliquotaAdRemPrincipal*(1-V.percentualDiferimento);
end;

function Exec_TRIB_CALC(const V: VariaveisAvaliador): Double;
begin
  Result := V.tributoCalculado;
end;

function Exec_TRIB_CALC_X_1_00(const V: VariaveisAvaliador): Double;
begin
  Result := V.tributoCalculado*1.00;
end;

{ AvaliadorExpressaoAritmeticaService }

function AvaliadorExpressaoAritmeticaService.Evaluate(const Expressao: string; const Variaveis: VariaveisAvaliador;
  Scale: ScaleRange): Double;
var
  VariavelUnica: Boolean;
begin
  VariavelUnica := False;

  if Expressao = EXPR_NULL then
    Result := Exec_NULL_or_ZERO(Variaveis)

  else if Expressao = EXPR_TRIB_CALC then
  begin
    Result := Exec_TRIB_CALC(Variaveis);
    VariavelUnica := True;
  end

  else if Expressao = EXPR_BC_X_ALIQEFET then
    Result := Exec_BC_X_ALIQEFET(Variaveis)

  else if Expressao = EXPR_ALIQ_REDUZIDA then
    Result := Exec_ALIQ_REDUZIDA(Variaveis)

  else if Expressao = EXPR_ALIQ_RED_CMP_GOV then
    Result := Exec_ALIQ_RED_CMP_GOV(Variaveis)

  else if Expressao = EXPR_BCINF_ISINF_ISCALC then
    Result := Exec_BCINF_ISINF_ISCALC(Variaveis)

  else if Expressao = EXPR_ALIQUOTA then
  begin
    Result := Exec_ALIQUOTA(Variaveis);
    VariavelUnica := True;
  end

  else if Expressao = EXPR_BCINF then
  begin
    Result := Exec_BCINF(Variaveis);
    VariavelUnica := True;
  end

  else if Expressao = EXPR_ZERO then
    Result := Exec_NULL_or_ZERO(Variaveis)

  else if Expressao = EXPR_BC_ADVLREM_QTD_ADREM then
    Result := Exec_BC_ADVLREM_QTD_ADREM(Variaveis)

  else if Expressao = EXPR_QUANTIDADE then
  begin
    Result := Exec_QUANTIDADE(Variaveis);
    VariavelUnica := True;
  end

  else if Expressao = EXPR_ALIQ_ADREM_SEC then
  begin
    Result := Exec_ALIQ_ADREM_SEC(Variaveis);
    VariavelUnica := True;
  end

  else if Expressao = EXPR_QTDE_ADREM_PRINC then
    Result := Exec_QTDE_ADREM_PRINC(Variaveis)

  else if Expressao = EXPR_QUANTIDADE_ALIQUOTA then
    Result := Exec_QUANTIDADE_ALIQUOTA(Variaveis)

  else if Expressao = EXPR_ALIQ_ADREM_PRINC then
  begin
    Result := Exec_ALIQ_ADREM_PRINC(Variaveis);
    VariavelUnica := True;
  end

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

  // Caso 1 (variavel unica): valor bruto, sem arredondamento.
  // Caso geral (expressao composta ou constante): arredondamento interno
  // (8 casas, HALF_EVEN). O parametro Scale e ignorado.
  if not VariavelUnica then
    Result := ArredondamentoUtils.ArredondarInterno(Result);
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
