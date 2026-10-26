unit uClassesNotasFiscais_consts;

interface

uses
  SituacaoNFeEnumUnit;

const     
  natEntrada         = 'E';
  natSaida           = 'S';

  stsVazio           = '';
  stsAberta          = 'Aberta';
  stsFechada         = 'Fechada';
  stsCancelada       = 'Cancelada';
  stsPreNota         = 'Pre Nota';

  strVerVazio = '';
  strVer310   = '3.10';
  strVer400   = '4.00';

  sInfCplCUPOM           = 'CUPOM';
  sInfCplNFE             = 'NFE';
  sInfCplNFCE            = 'NFCE';
  sInfCplSIMPLES         = 'SIMPLES';
  sInfCplSIMPLES_EX      = 'SIMPLES/EXCESSO';
  sInfCplDESONERACAO     = 'DESONERACAO';
  sInfCplDESONERACAOPC   = 'DESONERACAO_PISCOF';
  sInfCplDEOLHOIMPOSTO   = 'DE OLHO NO IMPOSTO';
  sInfCplRETENCAOFEDERAL = 'RETENCAO FEDERAL';

  strDataVersion = 'Ver003';

  modeloProdServ: array[1..7] of string = ('1', '01', '1-A', '1A', '4', '04', '55');
  modeloVeicOutras: array[1..5] of string = ('1', '01', '1-A', '1A', '55');
  modeloImpressoras: array[1..4] of string = ('1', '01', '1-A', '1A');
  modeloDespesas: array[1..8] of string = ('6', '06', '21', '22', '28', '29', '62', '66');
  modeloFrete: array[1..9] of string = ('07','08','8B','09','10','11','26','27','57');
  modeloServicos: array[1..2] of string = ('E', 'O');
  modeloDESBH: array[1..8] of string = ('1', '2', '3', '4', '5', '17', '20', '21');
  numeros = ['0'..'9'];
  icmsCSTs: array[1..15] of string = ('00', '02', '10', '15', '20', '30', '40', '41', '50', '51', '53', '60', '61', '70', '90');

type
  TEvent = procedure of object;

  VersaoNFeHW = (vnfVazio, vnf310, vnf400);
  TDescompactarArquivo = function (pArquivo, pDestino: PChar): Boolean; stdcall;
  C_Operacao = (toEntrada, toSaida);
  C_OperacaoPedVenda = (opvAtualizarTotal, opvRemoverDespesasNF, opvAtualizarDespesasNF);
  C_OperacaoDiversas = (opdImportacaoXML, opdValidacao, opdCalculoCusto, opdConfirmacao, opdResumo);
  C_OperacaoMarcacao = (opmIndividual, opmTodos, opmNenhum, opmInversao);
  C_OperacaoFrete    = (opfContaTerceiros, opfContaEmitente, opfContaDestinatario, opfProprioEmitente, opfProprioDestinatario, opfSemFrete, opfNenhum);
  OperacaoICMS       = (opicmNenhum, opicmNormal, opicmComReducao, opicmST, opicmSTRetido);
  OperacaoICMSSet    = set of OperacaoICMS;
  TOrigemCancelamento = (ocDefault, ocEventoCanc, ocEventoInut);
  TipoNfEmum = (tnfProdutos, tnfVeiculos, tnfOutras, tnfDespesas, tnfServicos);

  RConsulta = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd: Boolean;
    //Opçoes Avanças
    avancada, adicional, personalisada: boolean;
    operacaoAv, statusAv: string;
    prodServAv, veiculosAv, outrasAv, despesasAv, servicosAv: boolean;
    campoAd, valorAd, dataIniAd, dataFimAd, condicaoAd, sqlPersonalizado: string;

    procedure Reset;
  end;

  RDespesas = record
    parcelas, indice: Integer;
    NumConta: array of Double;
    dataReferencia: array of string;
    NumDoc: array of string;
    historico: array of string;
    valorDocumento: array of Currency;
    Controle: array of Integer;
  end;

  RFaturas = record
    UsarValorDoPedido: Boolean;
    moraDiaria, multa: Double;
    somaFaturas: Currency;
    localPagamento, obs1, obs2: string;
    parcelas, codControle: integer;
    vencimentoDocumento: array of string;
    numeroDocumento: array of string;
    valorDocumento: array of Currency;
    despesas: array of RDespesas;
    numVenda: array of integer;
    tipoVenda: array of string;
    referenteFrete: array of Boolean;
    codControles: array of integer;
  end;

  RCstCsosn = record
    cst: string;
    valorCstCsosn: Currency;
  end;

  RDescontos = record
    vSomaBrutaProdutos, vSomaProdutosComPermissaoDeDesconto, vSomaProdutosSemPermissaoDeDesconto,
      vSomaServicos: Currency;
  end;

  RPedVenda2 = record
    NPed: integer;
    TipoVenda: string;
    ValorVenda: Extended;
  end;

  ArrayVendas = array of RPedVenda2;

  RAcumulado = record
    codigo: Integer;
    Valor: Double;
    Texto: string;
  end;

  array_string = array of string;

const
  TipoNfEmumStr : array[TipoNfEmum] of string = ('P', 'V', 'O', 'D', 'S');


implementation

{ RConsulta }

procedure RConsulta.Reset;
begin
  campo := '';
  ordem := '';
  condicao := '';
  valor := '';
  dataIni := '';
  dataFim := '';
  porData := False;
  porDataAd := False;

  //Opçoes Avanças
  avancada := False;
  adicional := False;
  personalisada := False;
  operacaoAv := '';
  statusAv := '';
  prodServAv := False;
  veiculosAv := False;
  outrasAv := False;
  despesasAv := False;
  servicosAv := False;
  campoAd := '';
  valorAd := '';
  dataIniAd := '';
  dataFimAd := '';
  condicaoAd := '';
  sqlPersonalizado := '';
end;

end.
