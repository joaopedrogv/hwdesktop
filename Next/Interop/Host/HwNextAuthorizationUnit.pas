// Delphi 2006
unit HwNextAuthorizationUnit;

interface

uses
  HwNextViewApi;

// Callback sincrono consultado pelo modulo Next. O processo, a acao textual e a
// tabela vem do chamador: quais processos e acoes cada tela usa pertencem a
// funcionalidade, nao ao host. A verificacao usa TAudit_OOP, que obtem a
// empresa, o usuario e a conexao da sessao ERP corrente e aplica a regra do
// processo recebido. O host nao abre dialogo; negativa, senha de gerente e
// cancelamento continuam sendo apresentados pelo mecanismo legado. Nenhuma
// excecao atravessa a fronteira da DLL.

function HwNextAuthorize(AProcessCode, AAction, ATable: PWideChar): Integer; stdcall;

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

function HwNextAuthorize(AProcessCode, AAction, ATable: PWideChar): Integer; stdcall;
var
  ProcessCode, Action, TableName: string;
  Auditor: TAudit_OOP;
begin
  // Padrao seguro: dado incompleto ou falha mantem a operacao bloqueada.
  Result := HW_NEXT_AUTH_UNAVAILABLE;
  try
    ProcessCode := CallbackText(AProcessCode);
    Action := CallbackText(AAction);
    TableName := CallbackText(ATable);

    // O processo e a acao identificam a regra consultada; a tabela apenas
    // acompanha a auditoria e pode vir vazia.
    if (ProcessCode = '') or (Action = '') then
      Exit;

    Auditor := TAudit_OOP.Create;
    try
      Auditor.Tabela := TableName;
      // AcaoPermitida aplica a acao recebida ao processo informado usando a
      // sessao corrente. A liberacao da senha de gerente e a mensagem de
      // negativa ou cancelamento pertencem a esse mecanismo.
      if Auditor.Processo(ProcessCode).AcaoPermitida(Action) then
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
