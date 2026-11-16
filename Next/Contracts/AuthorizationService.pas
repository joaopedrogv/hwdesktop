unit AuthorizationService;

interface

type
  // Acao tipada solicitada a autorizacao. O adaptador converte para o texto
  // usado pelo host; manter a acao tipada evita strings soltas no chamador.
  // Inclusao, alteracao e gravacao tambem sao acoes tipadas: cada uma tem
  // processo e tabela proprios na funcionalidade que a solicita.
  TAuthorizationAction = (aaVisualizar, aaExcluir, aaInserir, aaSalvar,
    aaAlterar);

  // Resultado da verificacao de autorizacao. aoDenied indica negativa ou
  // cancelamento apresentado pelo mecanismo legado; aoUnavailable cobre
  // callback ausente, combinacao desconhecida e falha na chamada, comunicadas
  // uma unica vez pelo comunicador.
  TAuthorizationOutcome = (aoAllowed, aoDenied, aoUnavailable);

  TAuthorizationResult = record
    Outcome: TAuthorizationOutcome;
  end;

  // Porta para apresentar ao usuario a indisponibilidade da autorizacao. Os
  // consumidores testam apenas se o resultado e aoAllowed para prosseguir; a
  // negativa ou o cancelamento continuam com o mecanismo legado e o texto das
  // mensagens pertence ao adaptador.
  IAuthorizationComunicator = interface
    ['{85fd6012-cbc5-4366-bb80-905967ff24e3}']
    procedure Comunicate(const AMessage: string);
  end;

  // Porta de autorizacao das telas Next. A tela informa o codigo do processo, a
  // acao tipada e a tabela da regra; o adaptador cuida do protocolo textual do
  // host, que aplica as regras do processo solicitado.
  IAuthorizationService = interface
    ['{A1D4C7E2-5B8F-4F63-9E27-0C6B3D8A5F19}']
    function Authorize(const AProcessCode: string; AAction: TAuthorizationAction;
      const ATable: string): TAuthorizationResult;
    procedure SetComunicator(AComunicator: IAuthorizationComunicator);
  end;

implementation

end.
