unit PresenterConsultaBase;

interface

uses
  AuthorizationService;

type
  // Base dos apresentadores de consulta. Centraliza a autorizacao das
  // funcionalidades: cada uma informa o processo de pesquisa e a tabela padrao.
  // As operacoes informam o proprio processo e usam essa tabela padrao; apenas as
  // que atuam em outra tabela ou em cadastros aninhados pedem a permissao na
  // propria chamada. A negativa ou o cancelamento continuam com o mecanismo
  // legado e a indisponibilidade e comunicada pelo servico; a base apenas
  // interrompe a operacao.
  TPresenterConsultaBase = class
  private
    FAuthorization: IAuthorizationService;
    FProcessoConsulta: string;
    FTabelaPadrao: string;
  protected
    // Usa o processo recebido e a tabela padrao da funcionalidade.
    function Autorizar(const AProcessCode: string;
      AAction: TAuthorizationAction): Boolean; overload;
    // Usa o processo e a tabela recebidos; atende operacoes sobre outra tabela
    // e cadastros aninhados.
    function Autorizar(const AProcessCode: string; AAction: TAuthorizationAction;
      const ATabela: string): Boolean; overload;
  public
    constructor Create(AAuthorization: IAuthorizationService;
      const AProcessoConsulta, ATabelaPadrao: string);
    // Permissao da pesquisa. A tela consulta esta decisao depois de validar os
    // filtros e antes de limpar o resultado anterior.
    function AutorizarPesquisa: Boolean; virtual;
  end;

implementation

uses
  System.SysUtils;

const
  MissingAuthorizationMessage =
    'O servico de autorizacao do apresentador de consulta nao foi informado.';
  MissingProcessMessage =
    'O processo de pesquisa da consulta nao foi informado.';
  MissingTableMessage = 'A tabela padrao da consulta nao foi informada.';

{ TPresenterConsultaBase }

constructor TPresenterConsultaBase.Create(AAuthorization: IAuthorizationService;
  const AProcessoConsulta, ATabelaPadrao: string);
begin
  inherited Create;
  if AAuthorization = nil then
    raise Exception.Create(MissingAuthorizationMessage);
  if Trim(AProcessoConsulta) = '' then
    raise Exception.Create(MissingProcessMessage);
  if Trim(ATabelaPadrao) = '' then
    raise Exception.Create(MissingTableMessage);

  FAuthorization := AAuthorization;
  FProcessoConsulta := AProcessoConsulta;
  FTabelaPadrao := ATabelaPadrao;
end;

function TPresenterConsultaBase.Autorizar(const AProcessCode: string;
  AAction: TAuthorizationAction): Boolean;
begin
  Result := Autorizar(AProcessCode, AAction, FTabelaPadrao);
end;

function TPresenterConsultaBase.Autorizar(const AProcessCode: string;
  AAction: TAuthorizationAction; const ATabela: string): Boolean;
begin
  Result := FAuthorization.Authorize(AProcessCode, AAction, ATabela).Outcome =
    aoAllowed;
end;

function TPresenterConsultaBase.AutorizarPesquisa: Boolean;
begin
  Result := Autorizar(FProcessoConsulta, aaVisualizar);
end;

end.
