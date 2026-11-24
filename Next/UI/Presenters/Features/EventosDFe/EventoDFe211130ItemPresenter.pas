unit EventoDFe211130ItemPresenter;

interface

uses
  AuthorizationService, EventoDFe211130ItemView, EventoDFe211130ItemEtdUnit,
  ValidadorItemEventoDFe211130Unit, NextMemoryDatasetDefinition,
  PresenterCadastroBase;

type
  TEventoDFe211130ItemPresenter = class(TPresenterCadastroBase)
  private
    // A view pertence ao frame e a colecao a aba do evento; o apresentador apenas as utiliza.
    FView: IEventoDFe211130ItemView;
    FColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>;
    FValidador: IValidadorItemEventoDFe211130;
    FId: string;
    FEditando: Boolean;
  public
    constructor Create(const AView: IEventoDFe211130ItemView;
      const AAuthorization: IAuthorizationService;
      const AColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>;
      const AValidador: IValidadorItemEventoDFe211130);
    function PrepararInclusao: Boolean; override;
    function PrepararAlteracao(const AId: string): Boolean; override;
    function Salvar: Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, GuidServiceUnit,
  ValidationEntityOutputUnit;

const
  // Autorização da gravação pertence ao salvar do evento; o apresentador do item não autoriza.
  TabelaItem211130 = 'EVENTOS_DFE_211130_ITEM';

constructor TEventoDFe211130ItemPresenter.Create(
  const AView: IEventoDFe211130ItemView;
  const AAuthorization: IAuthorizationService;
  const AColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>;
  const AValidador: IValidadorItemEventoDFe211130);
begin
  inherited Create(AAuthorization, TabelaItem211130);
  if AView = nil then
    raise Exception.Create('A view do item do evento 211130 não foi informada.');
  if AColecao = nil then
    raise Exception.Create('A coleção de itens do evento 211130 não foi informada.');
  if AValidador = nil then
    raise Exception.Create('O validador do item do evento 211130 não foi informado.');

  FView := AView;
  FColecao := AColecao;
  FValidador := AValidador;
end;

function TEventoDFe211130ItemPresenter.PrepararInclusao: Boolean;
begin
  FEditando := False;
  FId := GuidService.New;
  FView.PrepararItem(EventoDFe211130ItemEtd.Create(FId, 0, 0, 0, 0, ''));
  Result := True;
end;

function TEventoDFe211130ItemPresenter.PrepararAlteracao(
  const AId: string): Boolean;
var
  Item: EventoDFe211130ItemEtd;
begin
  Result := False;

  if Trim(AId) = '' then
  begin
    FView.ShowError('O item selecionado não foi informado.');
    Exit;
  end;

  if (not FColecao.TryGetSelected(Item)) or (Item.Id <> AId) then
  begin
    FView.ShowError('O item selecionado não está mais disponível.');
    Exit;
  end;

  FId := AId;
  FEditando := True;
  FView.PrepararItem(Item);
  Result := True;
end;

function TEventoDFe211130ItemPresenter.Salvar: Boolean;
var
  Item: EventoDFe211130ItemEtd;
  Atual: EventoDFe211130ItemEtd;
  Validacao: ValidationEntityOutput;
begin
  Result := False;

  if not FView.ColetarItem(Item) then
    Exit;

  Validacao := FValidador.Validar(Item);
  if not Validacao.IsValid then
  begin
    FView.ShowValidation(Validacao);
    Exit;
  end;

  if FEditando and
    ((not FColecao.TryGetSelected(Atual)) or (Atual.Id <> FId)) then
  begin
    FView.ShowError('O item selecionado não está mais disponível.');
    Exit;
  end;

  try
    if FEditando then
      FColecao.Update(Item)
    else
      FColecao.Add(Item);
    Result := True;
  except
    on E: EValidacaoNegocio do
      FView.ShowError(E.Message);
    on E: Exception do
      FView.ShowError('Não foi possível salvar o item.');
  end;
end;

end.
