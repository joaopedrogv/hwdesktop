unit PresenterAutorizacao;

interface

uses
  AuthorizationService;

type
  // Cada funcionalidade informa a tabela padrao usada nas verificacoes.
  TPresenterAutorizacao = class
  private
    FAuthorization: IAuthorizationService;
    FTabelaPadrao: string;
  protected
    function Autorizar(const AProcessCode: string; AAction: TAuthorizationAction): Boolean; overload;
    function Autorizar(const AProcessCode: string;
      AAction: TAuthorizationAction; const ATabela: string): Boolean; overload;
    function Autorizar(const AProcessCode: string;
      AAction: TAuthorizationAction; const ATabela, AChaveNegocio: string): Boolean; overload;
  public
    constructor Create(AAuthorization: IAuthorizationService; const ATabelaPadrao: string);
  end;

implementation

uses
  System.SysUtils;

constructor TPresenterAutorizacao.Create(AAuthorization: IAuthorizationService;
  const ATabelaPadrao: string);
begin
  inherited Create;
  if AAuthorization = nil then
    raise Exception.Create('O servico de autorizacao do apresentador nao foi informado.');
  if Trim(ATabelaPadrao) = '' then
    raise Exception.Create('A tabela padrao do apresentador nao foi informada.');

  FAuthorization := AAuthorization;
  FTabelaPadrao := ATabelaPadrao;
end;

function TPresenterAutorizacao.Autorizar(const AProcessCode: string; AAction: TAuthorizationAction): Boolean;
begin
  Result := Autorizar(AProcessCode, AAction, FTabelaPadrao);
end;

function TPresenterAutorizacao.Autorizar(const AProcessCode: string;
  AAction: TAuthorizationAction; const ATabela: string): Boolean;
begin
  Result := Autorizar(AProcessCode, AAction, ATabela, '');
end;

function TPresenterAutorizacao.Autorizar(const AProcessCode: string;
  AAction: TAuthorizationAction; const ATabela, AChaveNegocio: string): Boolean;
begin
  Result := FAuthorization.Authorize(AProcessCode, AAction, ATabela, AChaveNegocio).Outcome = aoAllowed;
end;

end.
