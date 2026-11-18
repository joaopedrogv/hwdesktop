unit PresenterAutorizacao;

interface

uses
  AuthorizationService;

type
  // Autorizacao compartilhada pelos apresentadores; cada funcionalidade informa
  // a tabela padrao.
  TPresenterAutorizacao = class
  private
    FAuthorization: IAuthorizationService;
    FTabelaPadrao: string;
  protected
    function Autorizar(const AProcessCode: string;
      AAction: TAuthorizationAction): Boolean; overload;
    function Autorizar(const AProcessCode: string;
      AAction: TAuthorizationAction; const ATabela: string): Boolean; overload;
  public
    constructor Create(AAuthorization: IAuthorizationService;
      const ATabelaPadrao: string);
  end;

implementation

uses
  System.SysUtils;

const
  MissingAuthorizationMessage =
    'O servico de autorizacao do apresentador nao foi informado.';
  MissingTableMessage = 'A tabela padrao do apresentador nao foi informada.';

constructor TPresenterAutorizacao.Create(AAuthorization: IAuthorizationService;
  const ATabelaPadrao: string);
begin
  inherited Create;
  if AAuthorization = nil then
    raise Exception.Create(MissingAuthorizationMessage);
  if Trim(ATabelaPadrao) = '' then
    raise Exception.Create(MissingTableMessage);

  FAuthorization := AAuthorization;
  FTabelaPadrao := ATabelaPadrao;
end;

function TPresenterAutorizacao.Autorizar(const AProcessCode: string;
  AAction: TAuthorizationAction): Boolean;
begin
  Result := Autorizar(AProcessCode, AAction, FTabelaPadrao);
end;

function TPresenterAutorizacao.Autorizar(const AProcessCode: string;
  AAction: TAuthorizationAction; const ATabela: string): Boolean;
begin
  Result := FAuthorization.Authorize(AProcessCode, AAction, ATabela).Outcome =
    aoAllowed;
end;

end.
