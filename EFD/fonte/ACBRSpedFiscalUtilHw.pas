unit ACBRSpedFiscalUtilHw;

interface

uses ACBrEFDBlocos;

function StrToEmitente(str: string): TACBrEmitente;
function StrToTipoTitulo(str: string): TACBrTipoTitulo;
function StrToTipoTransporte(str: string): TACBrTipoTransporte;
function StrToOrigemProcesso(str: string): TACBrOrigemProcesso;
function StrToTipoOperacao(str: string): TACBrTipoOperacao;
function StrToMovimentacaoFisica(str: string): TACBrMovimentacaoFisica;
function StrToApuracaoIPI(str: string): TACBrApuracaoIPI;
function StrToTipoItemF(str: string): TACBrTipoItem;
function StrToTipoOperacaoVeiculo(str: string): TACBrTipoOperacaoVeiculo;
function StrToClasseConsumo(str: string): TACBrClasseConsumo;
function StrToTipoFrete(str: string): TACBrTipoFrete;
function StrToMovimentoBens(str: string): TACBrMovimentoBens;

implementation

function StrToEmitente(str: string): TACBrEmitente;
begin
  if str = '0' then
    Result := edEmissaoPropria
  else
    Result := edTerceiros;
end;

function StrToTipoTitulo(str: string): TACBrTipoTitulo;
begin
  if str = '00' then
    Result := tcDuplicata
  else if str = '01' then
    Result := tcCheque
  else if str = '02' then
    Result := tcPromissoria
  else if str = '03' then
    Result := tcRecibo
  else
    Result := tcOutros;
end;

function StrToTipoTransporte(str: string): TACBrTipoTransporte;
begin
  if str = '0' then result := ttRodoviario // 0 – Rodoviário
  else if str = '1' then result := ttFerroviario // 1 – Ferroviário
  else if str = '2' then result := ttRodoFerroviario // 2 – Rodo-Ferroviário
  else if str = '3' then result := ttAquaviario // 3 – Aquaviário
  else if str = '4' then result := ttDutoviario // 4 – Dutoviário
  else if str = '5' then result := ttAereo // 5 – Aéreo
  else result := ttOutros // 9 – Outros
end;

function StrToOrigemProcesso(str: string): TACBrOrigemProcesso;
begin
  if str = '0' then Result := opSefaz // 0 - Sefaz
  else if str = '1' then Result := opJusticaFederal // 1 - Justiça Federal
  else if str = '2' then Result := opJusticaEstadual // 2 - Justiça Estadual
  else if str = '3' then Result := opSecexRFB // 3 - Secex/RFB
  else if str = '9' then Result := opOutros // 9 - Outros
  else Result := opNenhum; // Preencher vazio
end;

function StrToTipoOperacao(str: string): TACBrTipoOperacao;
begin
  if str = '0' then Result := tpEntradaAquisicao // 0 - Entrada
  else Result := tpSaidaPrestacao; // 1 - Saída
end;

function StrToMovimentacaoFisica(str: string): TACBrMovimentacaoFisica;
begin
  if str = '0' then result := mfSim // 0 - Sim
  else result := mfNao; // 1 - Não
end;

function StrToApuracaoIPI(str: string): TACBrApuracaoIPI;
begin
  if str = '0' then Result := iaMensal // 0 - Mensal
  else Result := iaDecendial; // 1 - Decendial
end;

function StrToTipoItemF(str: string): TACBrTipoItem;
begin
  if str = '00' then Result := tiMercadoriaRevenda // 00 – Mercadoria para Revenda
  else if str = '01' then Result := tiMateriaPrima // 01 – Matéria-Prima;
  else if str = '02' then Result := tiEmbalagem // 02 – Embalagem;
  else if str = '03' then Result := tiProdutoProcesso // 03 – Produto em Processo;
  else if str = '04' then Result := tiProdutoAcabado // 04 – Produto Acabado;
  else if str = '05' then Result := tiSubproduto // 05 – Subproduto;
  else if str = '06' then Result := tiProdutoIntermediario // 06 – Produto Intermediário;
  else if str = '07' then Result := tiMaterialConsumo // 07 – Material de Uso e Consumo;
  else if str = '08' then Result := tiAtivoImobilizado // 08 – Ativo Imobilizado;
  else if str = '09' then Result := tiServicos // 09 – Serviços;
  else if str = '10' then Result := tiOutrosInsumos // 10 – Outros Insumos;
  else Result := tiOutras; // 99 – Outras
end;

function StrToTipoOperacaoVeiculo(str: string): TACBrTipoOperacaoVeiculo;
begin
  if str = '0' then Result := tovVendaPConcess // 0 - Venda para concessionária
  else if str = '1' then Result := tovFaturaDireta // 1 - Faturamento direto
  else if str = '2' then Result := tovVendaDireta // 2 - Venda direta
  else if str = '3' then Result := tovVendaDConcess // 3 - Venda da concessionária
  else Result := tovVendaOutros; // 9 - Outros
end;

function StrToClasseConsumo(str: string): TACBrClasseConsumo;
begin
  if str = '01' then Result := ccComercial // 01 - Comercial
  else if str = '02' then Result := ccConsumoProprio // 02 - Consumo Próprio
  else if str = '03' then Result := ccIluminacaoPublica // 03 - Iluminação Pública
  else if str = '04' then Result := ccIndustrial // 04 - Industrial
  else if str = '05' then Result := ccPoderPublico // 05 - Poder Público
  else if str = '06' then Result := ccResidencial // 06 - Residencial
  else if str = '07' then Result := ccRural // 07 - Rural
  else if str = '08' then Result := ccServicoPublico // 08 -Serviço Público
  else Result := ccComercial;
end;

function StrToTipoFrete(str: string): TACBrTipoFrete;
begin
  if str = '0' then Result := tfPorContaTerceiros // 0 - Por conta de terceiros
  else if str = '1' then Result := tfPorContaEmitente // 1 - Por conta do emitente
  else if str = '2' then Result := tfPorContaDestinatario // 2 - Por conta do destinatário
  else if str = '9' then Result := tfSemCobrancaFrete // 9 - Sem cobrança de frete
  else Result := tfNenhum // Preencher vazio
end;

function StrToMovimentoBens(str: string): TACBrMovimentoBens;
begin
  if str = 'SI' then Result := mbcSI // SI = Saldo inicial de bens imobilizados
  else if str = 'IM' then Result := mbcIM // IM = Imobilização de bem individual
  else if str = 'IA' then Result := mbcIA // IA = Imobilização em Andamento - Componente
  else if str = 'CI' then Result := mbcCI // CI = Conclusão de Imobilização em Andamento – Bem Resultante
  else if str = 'MC' then Result := mbcMC // MC = Imobilização oriunda do Ativo Circulante
  else if str = 'BA' then Result := mbcBA // BA = Baixa do Saldo de ICMS - Fim do período de apropriação
  else if str = 'AT' then Result := mbcAT // AT = Alienação ou Transferência
  else if str = 'PE' then Result := mbcPE // PE = Perecimento, Extravio ou Deterioração
  else if str = 'OT' then Result := mbcOT // OT = Outras Saídas do Imobilizado
end;

end.

