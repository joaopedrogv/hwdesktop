unit TipoInfComplementarEnumUnit;

interface

type
  TipoInfComplementarEnum = (ticNaoDefinido, ticNormal, ticNFe, ticNFCe, ticNFCeComplementar, ticMensagemSN,
    ticMensagemSNExcesso, ticRetencaoFederal, ticDevVendas, ticDevCompras, ticDesenICMS, ticDesonPISCOFINS, ticCUPON,
    ticRedBenefPC
  );

const
  TipoInfComplementarEnumStr: array[TipoInfComplementarEnum] of string = (
    '',
    'NORMAL',
    'NFE',
    'NFCE',
    'NFCE COMPLEMENTAR',
    'SIMPLES',
    'SIMPLES/EXCESSO',
    'RETENCAO FEDERAL',
    'DEVOLUCAO VENDAS',
    'DEVOLUCAO COMPRAS',
    'DESONERACAO',
    'DESONERACAO_PISCOF',
    'CUPOM',
    'RED_BENEF_PISCOFIN'
  );

implementation

end.