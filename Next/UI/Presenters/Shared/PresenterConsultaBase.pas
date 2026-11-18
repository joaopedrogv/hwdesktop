unit PresenterConsultaBase;

interface

uses
  AuthorizationService, PresenterAutorizacao;

type
  // A base apenas interrompe a operacao; a negativa e a indisponibilidade sao
  // comunicadas pelo mecanismo de autorizacao existente.
  TPresenterConsultaBase = class(TPresenterAutorizacao)
  private
    FProcessoConsulta: string;
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
  MissingProcessMessage =
    'O processo de pesquisa da consulta nao foi informado.';

constructor TPresenterConsultaBase.Create(AAuthorization: IAuthorizationService;
  const AProcessoConsulta, ATabelaPadrao: string);
begin
  inherited Create(AAuthorization, ATabelaPadrao);
  if Trim(AProcessoConsulta) = '' then
    raise Exception.Create(MissingProcessMessage);

  FProcessoConsulta := AProcessoConsulta;
end;

function TPresenterConsultaBase.AutorizarPesquisa: Boolean;
begin
  Result := Autorizar(FProcessoConsulta, aaVisualizar);
end;

end.
