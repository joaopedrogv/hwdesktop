unit AuthorizationService;

interface

type
  // Acao tipada solicitada a autorizacao. O adaptador converte para o texto
  // usado pelo host; manter a acao tipada evita strings soltas no chamador.
  TAuthorizationAction = (aaVisualizar, aaExcluir);

  // Resultado da verificacao de autorizacao. aoDenied indica negativa ou
  // cancelamento apresentado pelo mecanismo legado; aoUnavailable cobre
  // callback ausente, combinacao desconhecida e falha na chamada.
  TAuthorizationOutcome = (aoAllowed, aoDenied, aoUnavailable);

  TAuthorizationResult = record
    Outcome: TAuthorizationOutcome;
  end;

  // Porta de autorizacao das telas Next. A tela informa o codigo do processo, a
  // acao tipada e a tabela da regra; o adaptador cuida do protocolo textual do
  // host, que aplica as regras do processo solicitado.
  IAuthorizationService = interface
    ['{A1D4C7E2-5B8F-4F63-9E27-0C6B3D8A5F19}']
    function Authorize(const AProcessCode: string; AAction: TAuthorizationAction;
      const ATable: string): TAuthorizationResult;
  end;

implementation

end.
