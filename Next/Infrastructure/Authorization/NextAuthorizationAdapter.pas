unit NextAuthorizationAdapter;

interface

uses
  AuthorizationService;

type
  // Adaptador da porta de autorizacao sobre o callback sincrono do host: nao acessa banco, dataset, sessao, SQL nem
  // auditoria. Apenas aoUnavailable e apresentado aqui; negativa e cancelamento sao apresentados no legado.
  TNextAuthorizationAdapter = class(TInterfacedObject, IAuthorizationService)
  private
    FComunicator: IAuthorizationComunicator;
    procedure DoComunication(const AMessage: string);
  public
    constructor Create(AComunicator: IAuthorizationComunicator);
    function Authorize(const AProcessCode: string; AAction: TAuthorizationAction;
      const ATable: string): TAuthorizationResult; overload;
    function Authorize(const AProcessCode: string; AAction: TAuthorizationAction;
      const ATable, ABusinessKey: string): TAuthorizationResult; overload;
    procedure SetComunicator(AComunicator: IAuthorizationComunicator);
  end;

  TNextAuthorizationComunicator = class(TInterfacedObject, IAuthorizationComunicator)
  public
    procedure Comunicate(const AMessage: string);
  end;

implementation

uses
  SysUtils, Vcl.Forms, Winapi.Windows, HwNextViewApi, NextAuthorizationBridge;

constructor TNextAuthorizationAdapter.Create(AComunicator: IAuthorizationComunicator);
begin
  SetComunicator(AComunicator);
end;

function TNextAuthorizationAdapter.Authorize(const AProcessCode: string;
  AAction: TAuthorizationAction; const ATable: string): TAuthorizationResult;
begin
  Result := Authorize(AProcessCode, AAction, ATable, '');
end;

function TNextAuthorizationAdapter.Authorize(const AProcessCode: string;
  AAction: TAuthorizationAction; const ATable, ABusinessKey: string): TAuthorizationResult;
var
  Callback: THwNextAuthorizationCallbackV2;
  ActionText: string;
  AuthResult: Integer;
begin
  // Qualquer caminho nao reconhecido mantem a operacao bloqueada.
  Result.Outcome := aoUnavailable;

  // Os parenteses forcam a chamada da funcao; sem eles o compilador tenta atribuir a propria rotina (register) ao
  // ponteiro stdcall.
  Callback := GetAuthorizationCallbackV2();
  if not Assigned(Callback) then
  begin
    DoComunication('Callback de autorização não está disponível');
    Exit;
  end;

  case AAction of
    aaVisualizar:
      ActionText := 'VISUALIZAR';
    aaExcluir:
      ActionText := 'EXCLUIR';
    aaInserir:
      ActionText := 'INSERIR';
    aaSalvar:
      ActionText := 'SALVAR';
    aaAlterar:
      ActionText := 'ALTERAR';
  else
    ActionText := '';
  end;

  if ActionText = '' then
  begin
    DoComunication('Ação de autorização não foi informada.');
    Exit;
  end;

  try
    // A tabela identifica o recurso auditado e e repassada sem interpretacao do host.
    AuthResult := Callback(PWideChar(AProcessCode), PWideChar(ActionText), PWideChar(ATable),
      PWideChar(ABusinessKey));
    case AuthResult of
      HW_NEXT_AUTH_ALLOWED:
        Result.Outcome := aoAllowed;
      HW_NEXT_AUTH_DENIED:
        // A negativa ou o cancelamento ja foi apresentado pelo legado; repetir aqui mostraria duas mensagens para a
        // mesma decisao.
        Result.Outcome := aoDenied;
    else
      begin
        Result.Outcome := aoUnavailable;
        DoComunication('Resposta do callback de autorização inválida.');
      end;
    end;
  except
    on E: Exception do
    begin
      // Uma excecao nao deve atravessar a fronteira do callback; a tela trata a ausencia de resposta como
      // indisponibilidade.
      Result.Outcome := aoUnavailable;
      DoComunication('Não foi possível obter uma resposta do callback de autorização por um erro.' +
        sLineBreak + E.Message);
    end;
  end;
end;

procedure TNextAuthorizationAdapter.SetComunicator(AComunicator: IAuthorizationComunicator);
begin
  FComunicator := AComunicator;
end;

procedure TNextAuthorizationAdapter.DoComunication(const AMessage: string);
begin
  if not Assigned(FComunicator) then
    Exit;

  FComunicator.Comunicate(AMessage);
end;

procedure TNextAuthorizationComunicator.Comunicate(const AMessage: string);
begin
  // A indisponibilidade da autorizacao e informada uma unica vez, aqui, para que nenhum consumidor repita a mensagem.
  Application.MessageBox(PChar(AMessage), PChar('Autorização'), MB_OK or MB_ICONWARNING);
end;

end.
