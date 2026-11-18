unit AuthorizationService;

interface

type
  TAuthorizationAction = (aaVisualizar, aaExcluir, aaInserir, aaSalvar, aaAlterar);

  // aoUnavailable cobre callback ausente, acao desconhecida e falha na chamada.
  TAuthorizationOutcome = (aoAllowed, aoDenied, aoUnavailable);

  TAuthorizationResult = record
    Outcome: TAuthorizationOutcome;
  end;

  // Os consumidores prosseguem apenas com aoAllowed; negativa e cancelamento continuam com o mecanismo legado.
  IAuthorizationComunicator = interface
    ['{85fd6012-cbc5-4366-bb80-905967ff24e3}']
    procedure Comunicate(const AMessage: string);
  end;

  // O host aplica as regras do processo solicitado; o adaptador cuida do protocolo textual.
  IAuthorizationService = interface
    ['{A1D4C7E2-5B8F-4F63-9E27-0C6B3D8A5F19}']
    function Authorize(const AProcessCode: string; AAction: TAuthorizationAction;
      const ATable: string): TAuthorizationResult;
    procedure SetComunicator(AComunicator: IAuthorizationComunicator);
  end;

implementation

end.
