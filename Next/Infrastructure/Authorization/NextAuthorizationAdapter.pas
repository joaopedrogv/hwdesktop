unit NextAuthorizationAdapter;

interface

uses
  AuthorizationService;

type
  // Adaptador da porta de autorizacao sobre o callback sincrono do host. Nao
  // acessa banco, dataset, sessao, UI, SQL nem auditoria: converte a acao
  // tipada em texto, encaminha ao callback e traduz o retorno, protegendo a
  // tela contra excecoes da fronteira externa.
  TNextAuthorizationAdapter = class(TInterfacedObject, IAuthorizationService)
  public
    function Authorize(const AProcessCode: string;
      AAction: TAuthorizationAction): TAuthorizationResult;
  end;

implementation

uses
  HwNextViewApi, NextAuthorizationBridge;

function TNextAuthorizationAdapter.Authorize(const AProcessCode: string;
  AAction: TAuthorizationAction): TAuthorizationResult;
var
  Callback: THwNextAuthorizationCallback;
  ActionText: string;
  AuthResult: Integer;
begin
  // Qualquer caminho nao reconhecido mantem a pesquisa interrompida.
  Result.Outcome := aoUnavailable;

  // Os parenteses forcam a chamada da funcao; sem eles o compilador tenta
  // atribuir a propria rotina (register) ao ponteiro stdcall.
  Callback := GetAuthorizationCallback();
  if not Assigned(Callback) then
    Exit;

  // A acao chega tipada do chamador; o texto do protocolo fica restrito ao
  // adaptador.
  case AAction of
    aaVisualizar:
      ActionText := 'VISUALIZAR';
  else
    ActionText := '';
  end;

  if ActionText = '' then
    Exit;

  try
    AuthResult := Callback(PWideChar(AProcessCode), PWideChar(ActionText));
    case AuthResult of
      HW_NEXT_AUTH_ALLOWED:
        Result.Outcome := aoAllowed;
      HW_NEXT_AUTH_DENIED:
        Result.Outcome := aoDenied;
    else
      Result.Outcome := aoUnavailable;
    end;
  except
    // Uma excecao nao deve atravessar a fronteira do callback; a tela trata a
    // ausencia de resposta como indisponibilidade.
    Result.Outcome := aoUnavailable;
  end;
end;

end.
