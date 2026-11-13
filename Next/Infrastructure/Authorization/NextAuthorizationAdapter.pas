unit NextAuthorizationAdapter;

interface

uses
  AuthorizationService;

type
  // Adaptador da porta de autorizacao sobre o callback sincrono do host. Nao
  // acessa banco, dataset, sessao, UI, SQL nem auditoria: converte a acao
  // tipada em texto, repassa processo, acao e tabela ao callback e traduz o
  // retorno, protegendo a tela contra excecoes da fronteira externa.
  TNextAuthorizationAdapter = class(TInterfacedObject, IAuthorizationService)
  public
    function Authorize(const AProcessCode: string; AAction: TAuthorizationAction;
      const ATable: string): TAuthorizationResult;
  end;

implementation

uses
  HwNextViewApi, NextAuthorizationBridge;

function TNextAuthorizationAdapter.Authorize(const AProcessCode: string;
  AAction: TAuthorizationAction; const ATable: string): TAuthorizationResult;
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
    aaExcluir:
      ActionText := 'EXCLUIR';
  else
    ActionText := '';
  end;

  if ActionText = '' then
    Exit;

  try
    // A tabela identifica o recurso auditado e e repassada como recebida; o
    // host nao a interpreta.
    AuthResult := Callback(PWideChar(AProcessCode), PWideChar(ActionText),
      PWideChar(ATable));
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
