unit ResultadoOperacaoDFeUnit;

interface

type
  ResultadoOperacaoDFe = (
    rodOK,                  // Sucesso na comunicacao, idependente de Autorizacao ou rejeicao de documentos
    rodFalhaRegistrada,     // Qualquer falha que tenha sido registrada no histórico
    rodFalhaNaoTratada      // Falha não tratada ou catalogada
  );

  ResultadoOperacaoDFeArray = array of ResultadoOperacaoDFe;

const
  HIST_DOC_NAO_ENCONTRADO     = 'Documento não encontrado';
  HIST_RPS_NAO_GERADO         = 'Número, Série ou Data de Emissão do DPS/RPS não gerado';
  HIST_SITUACAO_NAO_PERMITIDA = 'Situação do documento incompatível com a operação';
  HIST_XML_NAO_ENCONTRADO     = 'Documento eletrônico(Xml ou similar) não encontrado';
  HIST_EMISSAO_PORTAL         = 'Registro com emissão no Portal não pode ser transmitido';
  HIST_RESP_ENV_EMAIL_EMPTY   = 'Serviço de envio de email não conseguiu enviar email e não registrou a mensagem de erro';

//const
//  COM_WS_SUCESSO              = 0;
//  COM_WS_FALHA_NAO_CATALOGADA = 1;
//  COM_WS_CERTIFICADO_VENCIDO  = 2;

implementation

end.
