unit EventosDFePresenter;

interface

uses
  AuthorizationService, EventosDFeView, RemoverEventoDFeUseCaseUnit,
  NextQueryDefinition, EventosDFeQueryDefinition, PresenterConsultaBase;

type
  // A preparação, o carregamento e a gravação do registro pertencem ao apresentador do cadastro.
  TEventosDFePresenter = class(TPresenterConsultaBase)
  private
    // A view pertence à tela e as demais dependências ao container de composição: o apresentador apenas as utiliza e
    // nunca as libera.
    FView: IEventosDFeView;
    FQueryDefinition: INextQueryDefinition<TEventoDFeSelecionado>;
    FRemoverEvento: IRemoverEventoDFeUseCase;
  public
    constructor Create(const AView: IEventosDFeView;
      AQueryDefinition: INextQueryDefinition<TEventoDFeSelecionado>;
      AAuthorization: IAuthorizationService; ARemoverEvento: IRemoverEventoDFeUseCase);
    function EnviarParaLixeira: Boolean;
    function SolicitarInclusao: Boolean;
    function SolicitarEdicao: Boolean;
    function SolicitarRestauracao: Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, StatusRegistroEnumUnit, TipoEventoDFeUnit;

const
  // Códigos do cadastro legado usados por esta funcionalidade. O host recebe o processo, a ação, a tabela e a chave e
  // não os conhece.
  ProcessoConsulta = 'EVT001';
  ProcessoInclusao = 'EVT002';
  ProcessoAlteracao = 'EVT003';
  ProcessoExclusao112150 = 'EVT006';
  ProcessoExclusao211130 = 'EVT007';
  ProcessoRestauracao = 'EVT008';
  TabelaEventosDFe = 'EVENTOS_DFE';
  Tabela112150 = 'EVENTOS_DFE_112150';
  Tabela211130 = 'EVENTOS_DFE_211130_ITEM';

  SelecaoObrigatoriaMessage = 'Selecione um evento DF-e na grade.';

constructor TEventosDFePresenter.Create(const AView: IEventosDFeView;
  AQueryDefinition: INextQueryDefinition<TEventoDFeSelecionado>;
  AAuthorization: IAuthorizationService; ARemoverEvento: IRemoverEventoDFeUseCase);
begin
  // O processo de pesquisa e a tabela padrão ficam na base, que também responde pela permissão da consulta.
  inherited Create(AAuthorization, ProcessoConsulta, TabelaEventosDFe);
  if AView = nil then
    raise Exception.Create('A view de Eventos DF-e não foi informada.');
  if AQueryDefinition = nil then
    raise Exception.Create('A consulta de Eventos DF-e não foi informada.');
  if ARemoverEvento = nil then
    raise Exception.Create('O caso de uso de remoção de Eventos DF-e não foi informado.');

  FView := AView;
  FQueryDefinition := AQueryDefinition;
  FRemoverEvento := ARemoverEvento;
end;

function TEventosDFePresenter.EnviarParaLixeira: Boolean;
var
  Selecao: TEventoDFeSelecionado;
  Processo: string;
  Tabela: string;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selecao) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Trim(Selecao.Id) = '' then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Selecao.Ativo <> saAtivo then
  begin
    FView.ShowWarning('O evento já está na lixeira.');
    Exit;
  end;

  if not FView.ShowDangerQuestion(Format('Deseja enviar o evento "%s" (%s) para a lixeira?',
    [Selecao.ChaveDocumento, TipoEventoDFeDisplay(Selecao.TipoEvento)])) then
    Exit;

  if Selecao.TipoEvento = teAtualizacaoPrevisaoEntrega then
  begin
    Processo := ProcessoExclusao112150;
    Tabela := Tabela112150;
  end
  else
  begin
    Processo := ProcessoExclusao211130;
    Tabela := Tabela211130;
  end;

  if not Autorizar(Processo, aaExcluir, Tabela, IntToStr(Selecao.SeqId)) then
    Exit;

  try
    FRemoverEvento.Executar(Selecao.Id);
    Result := True;
  except
    on E: EValidacaoNegocio do
      FView.ShowError(E.Message);
    on E: Exception do
      // O texto técnico do banco não deve chegar à interface.
      FView.ShowError('Não foi possível enviar o evento para a lixeira.');
  end;
end;

function TEventosDFePresenter.SolicitarInclusao: Boolean;
var
  Tipo: TipoEventoDFe;
  Chave: string;
begin
  Result := False;

  // A negativa ou o cancelamento já foi apresentado pelo legado.
  if not Autorizar(ProcessoInclusao, aaInserir, TabelaEventosDFe, '') then
    Exit;

  if not FView.SelecionarTipoEvento(Tipo) then
    Exit;

  Chave := IntToStr(TipoEventoDFeCodigo(Tipo));
  if FView.AtivarInclusao(Chave) then
    Result := True
  else
    Result := FView.AbrirInclusao(Chave, 'Inclusão - ' + TipoEventoDFeDisplay(Tipo));
end;

function TEventosDFePresenter.SolicitarEdicao: Boolean;
var
  Selecao: TEventoDFeSelecionado;
  Chave: string;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selecao) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Trim(Selecao.Id) = '' then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Selecao.Ativo <> saAtivo then
  begin
    FView.ShowWarning('O evento está na lixeira; use Restaurar.');
    Exit;
  end;

  Chave := IntToStr(TipoEventoDFeCodigo(Selecao.TipoEvento)) + ':' + Selecao.Id;
  if FView.AtivarEdicao(Chave) then
  begin
    Result := True;
    Exit;
  end;

  // A permissão de alteração é verificada antes de o cadastro carregar o registro.
  if not Autorizar(ProcessoAlteracao, aaAlterar, TabelaEventosDFe, IntToStr(Selecao.SeqId)) then
    Exit;

  Result := FView.AbrirEdicao(Selecao, meAlteracao);
end;

function TEventosDFePresenter.SolicitarRestauracao: Boolean;
var
  Selecao: TEventoDFeSelecionado;
  Chave: string;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selecao) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Trim(Selecao.Id) = '' then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if Selecao.Ativo <> saLixeira then
  begin
    FView.ShowWarning('O evento não está na lixeira.');
    Exit;
  end;

  // A chave é a mesma da alteração: a aba já aberta é reativada e o modo é validado na gravação.
  Chave := IntToStr(TipoEventoDFeCodigo(Selecao.TipoEvento)) + ':' + Selecao.Id;
  if FView.AtivarEdicao(Chave) then
  begin
    Result := True;
    Exit;
  end;

  if not Autorizar(ProcessoRestauracao, aaAlterar, TabelaEventosDFe, IntToStr(Selecao.SeqId)) then
    Exit;

  Result := FView.AbrirEdicao(Selecao, meRestauracao);
end;

end.
