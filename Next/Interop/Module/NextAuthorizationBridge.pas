unit NextAuthorizationBridge;

interface

uses
  HwNextViewApi;

// Ponte do callback de autorizacao V2 informado pelo host; o modulo apenas guarda o ponteiro recebido. A troca
// ocorre na thread visual, antes de qualquer tela ser criada e depois que todas forem liberadas, por isso nao ha
// sincronizacao.

procedure SetAuthorizationCallbackV2(ACallback: THwNextAuthorizationCallbackV2);
function GetAuthorizationCallbackV2: THwNextAuthorizationCallbackV2;

implementation

var
  AuthorizationCallbackV2: THwNextAuthorizationCallbackV2;

procedure SetAuthorizationCallbackV2(ACallback: THwNextAuthorizationCallbackV2);
begin
  AuthorizationCallbackV2 := ACallback;
end;

function GetAuthorizationCallbackV2: THwNextAuthorizationCallbackV2;
begin
  Result := AuthorizationCallbackV2;
end;

end.
