unit NextAuthorizationBridge;

interface

uses
  HwNextViewApi;

// Ponte do callback de autorizacao informado pelo host. O modulo nao possui o
// callback: apenas guarda o ponteiro recebido. A troca ocorre na thread visual,
// antes de qualquer tela ser criada e depois que todas forem liberadas; por
// isso nao ha sincronizacao propria nesta unit.

procedure SetAuthorizationCallback(ACallback: THwNextAuthorizationCallback);
function GetAuthorizationCallback: THwNextAuthorizationCallback;

implementation

var
  AuthorizationCallback: THwNextAuthorizationCallback;

procedure SetAuthorizationCallback(ACallback: THwNextAuthorizationCallback);
begin
  AuthorizationCallback := ACallback;
end;

function GetAuthorizationCallback: THwNextAuthorizationCallback;
begin
  Result := AuthorizationCallback;
end;

end.
