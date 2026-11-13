unit GruposFiscaisPresenter;

interface

uses
  FilterCriterion, IDataSetReaderUnit, GruposFiscaisQuery, AuthorizationService;

type
  // Apresentador da consulta de Grupos Fiscais. Encaminha a leitura para a
  // consulta injetada, verifica a autorizacao MOD008 antes da pesquisa e contem
  // o ponto de extensao da exclusao simulada, que permanece sem efeito real.
  // Nao possui dataset, sessao nem empresa.
  TGruposFiscaisPresenter = class
  private
    FQuery: IGruposFiscaisQuery;
    FAuthorization: IAuthorizationService;
  public
    constructor Create(AQuery: IGruposFiscaisQuery;
      AAuthorization: IAuthorizationService);
    function AutorizarPesquisa: TAuthorizationResult;
    function CriarLeitor(const ACriteria: TFilterCriteria): IDataSetReader;
    function SimularExclusao(const AId: string): Boolean;
  end;

implementation

uses
  System.SysUtils;

const
  MissingQueryMessage =
    'A consulta de Grupos Fiscais nao foi informada.';

{ TGruposFiscaisPresenter }

constructor TGruposFiscaisPresenter.Create(AQuery: IGruposFiscaisQuery;
  AAuthorization: IAuthorizationService);
begin
  inherited Create;
  if AQuery = nil then
    raise Exception.Create(MissingQueryMessage);

  FQuery := AQuery;
  // A ausencia do servico de autorizacao nao impede a tela de abrir; a pesquisa
  // sera interrompida como indisponivel quando a permissao for consultada.
  FAuthorization := AAuthorization;
end;

function TGruposFiscaisPresenter.AutorizarPesquisa: TAuthorizationResult;
begin
  if FAuthorization = nil then
  begin
    Result.Outcome := aoUnavailable;
    Exit;
  end;

  Result := FAuthorization.Authorize('MOD008', aaVisualizar);
end;

function TGruposFiscaisPresenter.CriarLeitor(
  const ACriteria: TFilterCriteria): IDataSetReader;
begin
  // O catalogo e global: nenhuma empresa ou sessao participa da leitura.
  Result := FQuery.CriarLeitor(ACriteria);
end;

function TGruposFiscaisPresenter.SimularExclusao(const AId: string): Boolean;
begin
  // Ponto de extensao (seam) da futura operacao real de exclusao. Nesta fatia o
  // resultado e sempre sucesso de apresentacao: nenhum banco, dataset, arquivo,
  // transacao, auditoria ou autorizacao e acessado. AId existe para receber a
  // identidade da linha corrente quando a operacao real for ligada aqui.
  Result := True;
end;

end.
