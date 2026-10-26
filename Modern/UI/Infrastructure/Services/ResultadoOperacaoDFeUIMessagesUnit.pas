unit ResultadoOperacaoDFeUIMessagesUnit;

interface

uses
  ResultadoOperacaoDFeUnit;

const
  ResultadoOperacaoDFeMessage: array[ResultadoOperacaoDFe] of string = (
    'Operação realizada',                                                 // Sucesso na comunicacao, idependente de Autorizacao ou rejeicao de documentos
    'Falha na execução. Consulte o histórico para mais detalhes',         // Falha comunicação, ex: Timeout ou outro qualquer <> rejeicao
    'Erro não catalogado. Consulte o log para mais detalhes'              // Falha não tratada ou catalogada
  );

implementation

end.
