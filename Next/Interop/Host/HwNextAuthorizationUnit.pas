// Delphi 2006
unit HwNextAuthorizationUnit;

interface

uses
  HwNextViewApi;

// Callback sincrono consultado pelo modulo Next. Recebe apenas o codigo do
// processo e a acao textual ja convertida pelo modulo. A verificacao usa
// TAudit_OOP, que obtem a empresa, o usuario e a conexao da sessao ERP corrente.
// Nenhuma excecao atravessa a fronteira da DLL.

function HwNextAuthorize(AProcessCode, AAction: PWideChar): Integer; stdcall;

implementation

uses
  SysUtils, hw_audit_utils;

// Os buffers pertencem ao chamador e valem somente durante a chamada. A
// conversao e sincrona e nenhum ponteiro e retido.
function CallbackText(AValue: PWideChar): string;
begin
  if AValue = nil then
    Result := ''
  else
    Result := string(WideString(AValue));
end;

function HwNextAuthorize(AProcessCode, AAction: PWideChar): Integer; stdcall;
var
  ProcessCode, Action: string;
  Auditor: TAudit_OOP;
begin
  // Padrao seguro: somente a combinacao conhecida pode liberar a consulta.
  Result := HW_NEXT_AUTH_UNAVAILABLE;
  try
    ProcessCode := CallbackText(AProcessCode);
    Action := CallbackText(AAction);

    if (ProcessCode <> 'MOD008') or (Action <> 'VISUALIZAR') then
      Exit;

    // O auditor usa a sessao ERP corrente; a conexao vem de dtmAtivo.bancoHw,
    // obtida internamente pelo TAudit_OOP. A negativa ou o cancelamento do
    // legado (Permitido/PesqPros) e apresentado ao usuario pelo proprio
    // mecanismo; o host nao abre dialogo.
    Auditor := TAudit_OOP.Create;
    try
      Auditor.Tabela := 'GRUPOS_FISCAIS';
      if Auditor.Processo('MOD008').Visualizar().Permitido() then
        Result := HW_NEXT_AUTH_ALLOWED
      else
        Result := HW_NEXT_AUTH_DENIED;
    finally
      Auditor.Free;
    end;
  except
    // Nenhuma falha de autorizacao pode atravessar a fronteira da DLL.
    Result := HW_NEXT_AUTH_UNAVAILABLE;
  end;
end;

end.
