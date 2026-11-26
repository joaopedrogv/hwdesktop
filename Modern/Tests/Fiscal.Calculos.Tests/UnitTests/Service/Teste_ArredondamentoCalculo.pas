unit Teste_ArredondamentoCalculo;

interface

uses
  DUnitX.TestFramework,
  DecimalCalculoUnit,
  ArredondamentoCalculoUnit;

type
  [TestFixture]
  TTest_ArredondamentoCalculo = class
  public
    [Test] procedure teste_Caso6_1_Rateio_1_80_em_10_13_10;
    [Test] procedure teste_Caso6_2_Rateio_0_20_em_10_13_10;
    [Test] procedure teste_Caso6_3_Rateio_0_01_em_3_Iguais;
    [Test] procedure teste_Caso6_4_RateioNegativo_1_80_em_10_13_10;
    [Test] procedure teste_Caso6_5_Rateio_PesosVaziosLancaExcecao;
    [Test] procedure teste_Caso6_6_Rateio_PesoNegativoLancaExcecao;
    [Test] procedure teste_Caso6_7_Rateio_SomaPesosZeroLancaExcecao;

    [Test] procedure teste_Caso7_1_t4_AliquotaEfetivaPublicada;
    [Test] procedure teste_Caso7_2_t4_ValorCbsComAliquotaPublicada;

    [Test] procedure teste_Caso8_1_CompraGov_PAliqCbs;
    [Test] procedure teste_Caso8_2_CompraGov_VTribCbs;
    [Test] procedure teste_Caso8_3_CompraGov_PAliqEfetiva;
    [Test] procedure teste_Caso8_4_CompraGov_ValorCbs;

    [Test] procedure teste_Caso9_1_Is_VBCIS;
    [Test] procedure teste_Caso9_2_Is_PIS;
    [Test] procedure teste_Caso9_3_Is_PISEspec;
    [Test] procedure teste_Caso9_4_Is_VIS;
    [Test] procedure teste_Caso9_5_Is_BaseCbsIbs;

    [Test] procedure teste_Caso10_1_Base25_Cbs0_90;
    [Test] procedure teste_Caso10_2_Base25_IbsUf0_10;
    [Test] procedure teste_Caso10_3_Base12_Cbs8_80;
    [Test] procedure teste_Caso10_4_Base12_IbsUf0_05;
    [Test] procedure teste_Caso10_5_Base12_IbsMun0_05;
    [Test] procedure teste_Caso10_6_TotalIbsDoisItens;
    [Test] procedure teste_Caso10_7_Base14_Cbs0_90;
    [Test] procedure teste_Caso10_8_TotalCbsDoisItens;
    [Test] procedure teste_Caso10_9_Item2315_79_Cbs0_90;
    [Test] procedure teste_Caso10_10_Item690_52_Cbs0_90;
    [Test] procedure teste_Caso10_11_TotalCbsDoisItensIssue;
    [Test] procedure teste_Caso10_12_Item2315_79_IbsUf0_10;

    [Test] procedure teste_Caso11_1_Cadeia_BaseIs;
    [Test] procedure teste_Caso11_2_Cadeia_IsCalculado;
    [Test] procedure teste_Caso11_3_Cadeia_PISPublicado;
    [Test] procedure teste_Caso11_4_Cadeia_AdRemPublicado;
    [Test] procedure teste_Caso11_5_Cadeia_BaseCbsIbs;
    [Test] procedure teste_Caso11_6_Cadeia_AliquotaEfetivaCbs;
    [Test] procedure teste_Caso11_7_Cadeia_ValorCbsFinal;
    [Test] procedure teste_Caso11_8_Cadeia_ValorCbsComBaseMilhao;

    [Test] procedure teste_FormatarMoedaPtBr;
    [Test] procedure teste_FormatarPercentualPtBr;

    // Fixtures oficiais t10/n1; a integracao no servico de base unificada e I05.
    [Test] procedure teste_t10_BaseUnificada_954_50;
    [Test] procedure teste_t10_BaseAntesDasDeducoes_1010_00;
    [Test] procedure teste_n1_BaseUnificada_954_50;
  end;

implementation

uses
  SysUtils,
  System.JSON,
  System.IOUtils;

type
  TResultadoIS = record
    VBCIS: DecimalCalculo;
    PIS: DecimalCalculo;
    PISEspec: DecimalCalculo;
    VIS: DecimalCalculo;
  end;

  TResultadoCbs = record
    PAliqEfet: DecimalCalculo;
    Valor: DecimalCalculo;
  end;

  TResultadoCompraGov = record
    PAliqCBS: DecimalCalculo;
    VTribCBS: DecimalCalculo;
    PAliqEfetMain: DecimalCalculo;
    ValorMain: DecimalCalculo;
  end;

function Dec(const ATexto: string): DecimalCalculo;
begin
  Result := DecimalCalculo.DeTexto(ATexto);
end;

function CalcularIS(const ABaseIS, AAdValorem, AAdRem: string): TResultadoIS;
var
  baseIS, adValorem, adRem, fracao, tributo: DecimalCalculo;
begin
  baseIS := Dec(ABaseIS);
  adValorem := Dec(AAdValorem);
  adRem := Dec(AAdRem);
  fracao := ArredondamentoCalculo.PercentualParaFracao(adValorem);
  tributo := baseIS.Multiplicar(fracao);
  tributo := tributo.Somar(adRem);
  Result.VBCIS := ArredondamentoCalculo.ValorFiscal(baseIS);
  Result.PIS := ArredondamentoCalculo.AliquotaPublicada(adValorem);
  Result.PISEspec := ArredondamentoCalculo.AliquotaPublicada(adRem);
  Result.VIS := ArredondamentoCalculo.ValorFiscal(tributo);
end;

function CalcularBaseCbs(const ABaseIS, AImpostoInformado: string;
  const AISPublicado: DecimalCalculo): DecimalCalculo;
var
  valor: DecimalCalculo;
begin
  valor := Dec(ABaseIS);
  valor := valor.Subtrair(Dec(AImpostoInformado));
  valor := valor.Somar(AISPublicado);
  Result := ArredondamentoCalculo.ValorFiscal(valor);
end;

function CalcularCbs(const ABase, AAliquota, AReducao,
  ARedutor: string): TResultadoCbs;
var
  base, aliquota, reducao, redutor, um, aliquotaFracao, reducaoFracao,
  redutorFracao, aliquotaEfetiva, aliquotaUsada: DecimalCalculo;
begin
  base := Dec(ABase);
  aliquota := Dec(AAliquota);
  reducao := Dec(AReducao);
  redutor := Dec(ARedutor);
  um := DecimalCalculo.DeInteiro(1);
  aliquotaFracao := ArredondamentoCalculo.PercentualParaFracao(aliquota);
  reducaoFracao := ArredondamentoCalculo.PercentualParaFracao(reducao);
  redutorFracao := ArredondamentoCalculo.PercentualParaFracao(redutor);
  aliquotaEfetiva := aliquotaFracao.Multiplicar(um.Subtrair(reducaoFracao));
  aliquotaEfetiva := aliquotaEfetiva.Multiplicar(um.Subtrair(redutorFracao));
  Result.PAliqEfet := ArredondamentoCalculo.AliquotaPublicada(
    ArredondamentoCalculo.FracaoParaPercentual(aliquotaEfetiva));
  aliquotaUsada := ArredondamentoCalculo.PercentualParaFracao(Result.PAliqEfet);
  Result.Valor := ArredondamentoCalculo.ValorFiscal(
    base.Multiplicar(aliquotaUsada));
end;

function CalcularCompraGovUniao(const ABase, AAliquotaCbs, AAliquotaUf,
  AAliquotaMun: string): TResultadoCompraGov;
var
  base, aliquotaCbs, aliquotaUf, aliquotaMun, aliquotaEfetiva: DecimalCalculo;
begin
  base := Dec(ABase);
  aliquotaCbs := Dec(AAliquotaCbs);
  aliquotaUf := Dec(AAliquotaUf);
  aliquotaMun := Dec(AAliquotaMun);
  Result.PAliqCBS := ArredondamentoCalculo.AliquotaPublicada(aliquotaCbs);
  Result.VTribCBS := ArredondamentoCalculo.ValorFiscal(
    base.Multiplicar(ArredondamentoCalculo.PercentualParaFracao(aliquotaCbs)));
  aliquotaEfetiva := aliquotaCbs.Somar(aliquotaUf);
  aliquotaEfetiva := aliquotaEfetiva.Somar(aliquotaMun);
  Result.PAliqEfetMain := ArredondamentoCalculo.AliquotaPublicada(aliquotaEfetiva);
  Result.ValorMain := ArredondamentoCalculo.ValorFiscal(
    base.Multiplicar(ArredondamentoCalculo.PercentualParaFracao(Result.PAliqEfetMain)));
end;

function ValorFiscalDoProdutoPercentual(const ABase,
  APercentual: string): DecimalCalculo;
var
  valor: DecimalCalculo;
begin
  valor := Dec(ABase);
  valor := valor.Multiplicar(
    ArredondamentoCalculo.PercentualParaFracao(Dec(APercentual)));
  Result := ArredondamentoCalculo.ValorFiscal(valor);
end;

function TextoValorFiscalDoProdutoPercentual(const ABase,
  APercentual: string): string;
var
  valor: DecimalCalculo;
begin
  valor := ValorFiscalDoProdutoPercentual(ABase, APercentual);
  Result := valor.ParaTexto(2);
end;

function TextoTotalValorFiscal(const ABase1, APercentual1, ABase2,
  APercentual2: string): string;
var
  valores: array[0..1] of DecimalCalculo;
  total: DecimalCalculo;
begin
  valores[0] := ValorFiscalDoProdutoPercentual(ABase1, APercentual1);
  valores[1] := ValorFiscalDoProdutoPercentual(ABase2, APercentual2);
  total := ArredondamentoCalculo.TotalizarValorFiscal(valores);
  Result := total.ParaTexto(2);
end;

function JoinRateio(const AResultado: TResultadoRateio; ACasas: Integer): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to High(AResultado.Itens) do
  begin
    if I > 0 then
      Result := Result + '/';
    Result := Result + AResultado.Itens[I].ParaTexto(ACasas);
  end;
end;

function TotalizarRateio(const AResultado: TResultadoRateio): DecimalCalculo;
var
  I: Integer;
begin
  Result := DecimalCalculo.Zero;
  for I := 0 to High(AResultado.Itens) do
    Result := Result.Somar(AResultado.Itens[I]);
end;

function CaminhoFixture(const ANome: string): string;
var
  Base: string;
begin
  Base := ExtractFilePath(ParamStr(0));
  Result := TPath.Combine(Base, '..\..\resources\Entradas\arredondamento\' + ANome);
  if not TFile.Exists(Result) then
    Result := TPath.Combine(Base, '..\resources\Entradas\arredondamento\' + ANome);
  if not TFile.Exists(Result) then
    Assert.Fail('Fixture nao encontrada: ' + ANome);
end;

function ValorDoJson(const ACaminho, ACampo: string): DecimalCalculo;
var
  Raiz: TJSONObject;
  Valor: TJSONValue;
begin
  Raiz := TJSONObject.ParseJSONValue(TFile.ReadAllText(ACaminho)) as TJSONObject;
  try
    Assert.IsNotNull(Raiz, 'JSON invalido: ' + ACaminho);
    Valor := Raiz.GetValue(ACampo);
    Assert.IsNotNull(Valor, 'Campo ausente na fixture: ' + ACampo);
    // TJSONNumber.Value formata via FloatToStr com o separador do locale; ToString preserva o literal JSON.
    Result := DecimalCalculo.DeTexto(Valor.ToString);
  finally
    Raiz.Free;
  end;
end;

function BaseUnificada(const ANome: string): DecimalCalculo;
var
  Caminho: string;
begin
  Caminho := CaminhoFixture(ANome);
  Result := ValorDoJson(Caminho, 'vProd');
  Result := Result.Somar(ValorDoJson(Caminho, 'vFrete'));
  Result := Result.Subtrair(ValorDoJson(Caminho, 'vPIS'));
  Result := Result.Subtrair(ValorDoJson(Caminho, 'vCOFINS'));
end;

{ TTest_ArredondamentoCalculo }

procedure TTest_ArredondamentoCalculo.teste_Caso6_1_Rateio_1_80_em_10_13_10;
var
  pesos: array[0..2] of DecimalCalculo;
  resultado: TResultadoRateio;
begin
  pesos[0] := DecimalCalculo.DeInteiro(10);
  pesos[1] := DecimalCalculo.DeInteiro(13);
  pesos[2] := DecimalCalculo.DeInteiro(10);
  ArredondamentoCalculo.RatearValorFiscal(Dec('1.80'), pesos, resultado);
  Assert.AreEqual('0.55/0.71/0.54', JoinRateio(resultado, 2));
  Assert.AreEqual('1.80', TotalizarRateio(resultado).ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso6_2_Rateio_0_20_em_10_13_10;
var
  pesos: array[0..2] of DecimalCalculo;
  resultado: TResultadoRateio;
begin
  pesos[0] := DecimalCalculo.DeInteiro(10);
  pesos[1] := DecimalCalculo.DeInteiro(13);
  pesos[2] := DecimalCalculo.DeInteiro(10);
  ArredondamentoCalculo.RatearValorFiscal(Dec('0.20'), pesos, resultado);
  Assert.AreEqual('0.06/0.08/0.06', JoinRateio(resultado, 2));
  Assert.AreEqual('0.20', TotalizarRateio(resultado).ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso6_3_Rateio_0_01_em_3_Iguais;
var
  pesos: array[0..2] of DecimalCalculo;
  resultado: TResultadoRateio;
begin
  pesos[0] := DecimalCalculo.DeInteiro(1);
  pesos[1] := DecimalCalculo.DeInteiro(1);
  pesos[2] := DecimalCalculo.DeInteiro(1);
  ArredondamentoCalculo.RatearValorFiscal(Dec('0.01'), pesos, resultado);
  Assert.AreEqual('0.01/0.00/0.00', JoinRateio(resultado, 2));
  Assert.AreEqual('0.01', TotalizarRateio(resultado).ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso6_4_RateioNegativo_1_80_em_10_13_10;
var
  pesos: array[0..2] of DecimalCalculo;
  resultado: TResultadoRateio;
begin
  pesos[0] := DecimalCalculo.DeInteiro(10);
  pesos[1] := DecimalCalculo.DeInteiro(13);
  pesos[2] := DecimalCalculo.DeInteiro(10);
  ArredondamentoCalculo.RatearValorFiscal(Dec('-1.80'), pesos, resultado);
  Assert.AreEqual('-0.55/-0.71/-0.54', JoinRateio(resultado, 2));
  Assert.AreEqual('-1.80', TotalizarRateio(resultado).ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso6_5_Rateio_PesosVaziosLancaExcecao;
var
  pesos: array of DecimalCalculo;
  resultado: TResultadoRateio;
begin
  SetLength(pesos, 0);
  Assert.WillRaise(
    procedure
    begin
      ArredondamentoCalculo.RatearValorFiscal(Dec('1.00'), pesos, resultado);
    end,
    EDecimalCalculo);
end;

procedure TTest_ArredondamentoCalculo.teste_Caso6_6_Rateio_PesoNegativoLancaExcecao;
var
  pesos: array[0..1] of DecimalCalculo;
  resultado: TResultadoRateio;
begin
  pesos[0] := DecimalCalculo.DeInteiro(10);
  pesos[1] := DecimalCalculo.DeInteiro(-1);
  Assert.WillRaise(
    procedure
    begin
      ArredondamentoCalculo.RatearValorFiscal(Dec('1.00'), pesos, resultado);
    end,
    EDecimalCalculo);
end;

procedure TTest_ArredondamentoCalculo.teste_Caso6_7_Rateio_SomaPesosZeroLancaExcecao;
var
  pesos: array[0..2] of DecimalCalculo;
  resultado: TResultadoRateio;
begin
  pesos[0] := DecimalCalculo.Zero;
  pesos[1] := DecimalCalculo.Zero;
  pesos[2] := DecimalCalculo.Zero;
  Assert.WillRaise(
    procedure
    begin
      ArredondamentoCalculo.RatearValorFiscal(Dec('1.00'), pesos, resultado);
    end,
    EDecimalCalculo);
end;

procedure TTest_ArredondamentoCalculo.teste_Caso7_1_t4_AliquotaEfetivaPublicada;
var
  resultado: TResultadoCbs;
begin
  resultado := CalcularCbs('1000000', '8.8123', '60', '0');
  Assert.AreEqual('3.5249', resultado.PAliqEfet.ParaTexto(4));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso7_2_t4_ValorCbsComAliquotaPublicada;
var
  resultado: TResultadoCbs;
begin
  resultado := CalcularCbs('1000000', '8.8123', '60', '0');
  Assert.AreEqual('35249.00', resultado.Valor.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso8_1_CompraGov_PAliqCbs;
var
  resultado: TResultadoCompraGov;
begin
  resultado := CalcularCompraGovUniao('12', '8.80', '0.05', '0.05');
  Assert.AreEqual('8.80', resultado.PAliqCBS.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso8_2_CompraGov_VTribCbs;
var
  resultado: TResultadoCompraGov;
begin
  resultado := CalcularCompraGovUniao('12', '8.80', '0.05', '0.05');
  Assert.AreEqual('1.06', resultado.VTribCBS.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso8_3_CompraGov_PAliqEfetiva;
var
  resultado: TResultadoCompraGov;
begin
  resultado := CalcularCompraGovUniao('12', '8.80', '0.05', '0.05');
  Assert.AreEqual('8.90', resultado.PAliqEfetMain.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso8_4_CompraGov_ValorCbs;
var
  resultado: TResultadoCompraGov;
begin
  resultado := CalcularCompraGovUniao('12', '8.80', '0.05', '0.05');
  Assert.AreEqual('1.07', resultado.ValorMain.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso9_1_Is_VBCIS;
var
  resultado: TResultadoIS;
begin
  resultado := CalcularIS('200', '13', '21.30');
  Assert.AreEqual('200.00', resultado.VBCIS.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso9_2_Is_PIS;
var
  resultado: TResultadoIS;
begin
  resultado := CalcularIS('200', '13', '21.30');
  Assert.AreEqual('13.00', resultado.PIS.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso9_3_Is_PISEspec;
var
  resultado: TResultadoIS;
begin
  resultado := CalcularIS('200', '13', '21.30');
  Assert.AreEqual('21.30', resultado.PISEspec.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso9_4_Is_VIS;
var
  resultado: TResultadoIS;
begin
  resultado := CalcularIS('200', '13', '21.30');
  Assert.AreEqual('47.30', resultado.VIS.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso9_5_Is_BaseCbsIbs;
var
  resultadoIS: TResultadoIS;
  base: DecimalCalculo;
begin
  resultadoIS := CalcularIS('200', '13', '21.30');
  base := CalcularBaseCbs('200', '0', resultadoIS.VIS);
  Assert.AreEqual('247.30', base.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_1_Base25_Cbs0_90;
begin
  Assert.AreEqual('0.22', TextoValorFiscalDoProdutoPercentual('25', '0.90'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_2_Base25_IbsUf0_10;
begin
  Assert.AreEqual('0.02', TextoValorFiscalDoProdutoPercentual('25', '0.10'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_3_Base12_Cbs8_80;
begin
  Assert.AreEqual('1.06', TextoValorFiscalDoProdutoPercentual('12', '8.80'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_4_Base12_IbsUf0_05;
begin
  Assert.AreEqual('0.01', TextoValorFiscalDoProdutoPercentual('12', '0.05'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_5_Base12_IbsMun0_05;
begin
  Assert.AreEqual('0.01', TextoValorFiscalDoProdutoPercentual('12', '0.05'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_6_TotalIbsDoisItens;
begin
  Assert.AreEqual('0.02', TextoTotalValorFiscal('12', '0.05', '12', '0.05'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_7_Base14_Cbs0_90;
begin
  Assert.AreEqual('0.13', TextoValorFiscalDoProdutoPercentual('14', '0.90'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_8_TotalCbsDoisItens;
begin
  Assert.AreEqual('0.26', TextoTotalValorFiscal('14', '0.90', '14', '0.90'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_9_Item2315_79_Cbs0_90;
begin
  Assert.AreEqual('20.84', TextoValorFiscalDoProdutoPercentual('2315.79', '0.90'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_10_Item690_52_Cbs0_90;
begin
  Assert.AreEqual('6.21', TextoValorFiscalDoProdutoPercentual('690.52', '0.90'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_11_TotalCbsDoisItensIssue;
begin
  Assert.AreEqual('27.05', TextoTotalValorFiscal('2315.79', '0.90', '690.52', '0.90'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso10_12_Item2315_79_IbsUf0_10;
begin
  Assert.AreEqual('2.32', TextoValorFiscalDoProdutoPercentual('2315.79', '0.10'));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso11_1_Cadeia_BaseIs;
var
  resultado: TResultadoIS;
begin
  resultado := CalcularIS('200', '13', '21.30');
  Assert.AreEqual('200.00', resultado.VBCIS.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso11_2_Cadeia_IsCalculado;
var
  resultado: TResultadoIS;
begin
  resultado := CalcularIS('200', '13', '21.30');
  Assert.AreEqual('47.30', resultado.VIS.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso11_3_Cadeia_PISPublicado;
var
  resultado: TResultadoIS;
begin
  resultado := CalcularIS('200', '13', '21.30');
  Assert.AreEqual('13.00', resultado.PIS.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso11_4_Cadeia_AdRemPublicado;
var
  resultado: TResultadoIS;
begin
  resultado := CalcularIS('200', '13', '21.30');
  Assert.AreEqual('21.30', resultado.PISEspec.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso11_5_Cadeia_BaseCbsIbs;
var
  resultadoIS: TResultadoIS;
  base: DecimalCalculo;
begin
  resultadoIS := CalcularIS('200', '13', '21.30');
  base := CalcularBaseCbs('200', '0', resultadoIS.VIS);
  Assert.AreEqual('247.30', base.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso11_6_Cadeia_AliquotaEfetivaCbs;
var
  resultado: TResultadoCbs;
begin
  resultado := CalcularCbs('247.30', '8.8123', '60', '0');
  Assert.AreEqual('3.5249', resultado.PAliqEfet.ParaTexto(4));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso11_7_Cadeia_ValorCbsFinal;
var
  resultado: TResultadoCbs;
begin
  resultado := CalcularCbs('247.30', '8.8123', '60', '0');
  Assert.AreEqual('8.72', resultado.Valor.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_Caso11_8_Cadeia_ValorCbsComBaseMilhao;
var
  resultado: TResultadoCbs;
begin
  resultado := CalcularCbs('1000000', '8.8123', '60', '0');
  Assert.AreEqual('35249.00', resultado.Valor.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_FormatarMoedaPtBr;
var
  valor: DecimalCalculo;
begin
  valor := Dec('1234.5');
  Assert.AreEqual('1.234,50', ArredondamentoCalculo.FormatarMoedaPtBr(valor));
end;

procedure TTest_ArredondamentoCalculo.teste_FormatarPercentualPtBr;
var
  valor: DecimalCalculo;
begin
  valor := Dec('8.8');
  Assert.AreEqual('8,80', ArredondamentoCalculo.FormatarPercentualPtBr(valor));
end;

procedure TTest_ArredondamentoCalculo.teste_t10_BaseUnificada_954_50;
var
  valor: DecimalCalculo;
begin
  valor := ArredondamentoCalculo.ValorFiscal(
    BaseUnificada('T10_base_unificada.json'));
  Assert.AreEqual('954.50', valor.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_t10_BaseAntesDasDeducoes_1010_00;
var
  caminho: string;
  valor: DecimalCalculo;
begin
  caminho := CaminhoFixture('T10_base_unificada.json');
  valor := ValorDoJson(caminho, 'vProd');
  valor := valor.Somar(ValorDoJson(caminho, 'vFrete'));
  valor := ArredondamentoCalculo.ValorFiscal(valor);
  Assert.AreEqual('1010.00', valor.ParaTexto(2));
end;

procedure TTest_ArredondamentoCalculo.teste_n1_BaseUnificada_954_50;
var
  valor: DecimalCalculo;
begin
  valor := ArredondamentoCalculo.ValorFiscal(
    BaseUnificada('N1_base_unificada.json'));
  Assert.AreEqual('954.50', valor.ParaTexto(2));
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_ArredondamentoCalculo);

end.
