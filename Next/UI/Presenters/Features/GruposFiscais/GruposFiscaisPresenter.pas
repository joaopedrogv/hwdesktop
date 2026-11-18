unit GruposFiscaisPresenter;

interface

uses
  AuthorizationService, RemoverGrupoFiscalUseCaseUnit, GruposFiscaisView,
  NextQueryDefinition, GruposFiscaisQueryDefinition, PresenterConsultaBase;

type
  // Apresentador da consulta; a preparacao, o carregamento e a gravacao do
  // registro pertencem ao apresentador do cadastro.
  TGruposFiscaisPresenter = class(TPresenterConsultaBase)
  private
    // A view pertence a tela e as demais dependencias ao container de
    // composicao: o apresentador apenas as utiliza e nunca as libera.
    FView: IGruposFiscaisView;
    FQueryDefinition: INextQueryDefinition<TGrupoSelecionado>;
    FRemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
  public
    constructor Create(AView: IGruposFiscaisView;
      AQueryDefinition: INextQueryDefinition<TGrupoSelecionado>;
      AAuthorization: IAuthorizationService;
      ARemoverGrupoFiscal: IRemoverGrupoFiscalUseCase);
    function EnviarParaLixeira(): Boolean;
    // Reapresenta a aba de inclusao ja aberta; sem aba, autoriza a inclusao e
    // entrega a abertura ao editor, que cria o proprio rascunho.
    function SolicitarInclusao: Boolean;
    // Reapresenta a aba da linha corrente ja aberta; sem aba, autoriza a
    // alteracao e entrega a abertura ao editor, que carrega o registro. Sem
    // linha valida a view informa que a selecao e obrigatoria.
    function SolicitarEdicao: Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit;

const
  // Codigos do cadastro legado usados por esta funcionalidade. O host recebe o
  // processo, a acao e a tabela e nao os conhece.
  ProcessoConsulta = 'MOD008';
  ProcessoInclusao = 'MOD009';
  ProcessoAlteracao = 'MOD010';
  ProcessoExclusao = 'MOD012';
  TabelaGruposFiscais = 'GRUPOS_FISCAIS';

  SelecaoObrigatoriaMessage = 'Selecione um grupo fiscal na grade.';

{ TGruposFiscaisPresenter }

constructor TGruposFiscaisPresenter.Create(AView: IGruposFiscaisView;
  AQueryDefinition: INextQueryDefinition<TGrupoSelecionado>;
  AAuthorization: IAuthorizationService;
  ARemoverGrupoFiscal: IRemoverGrupoFiscalUseCase);
begin
  // O processo de pesquisa e a tabela padrao ficam na base, que tambem responde
  // pela permissao da consulta.
  inherited Create(AAuthorization, ProcessoConsulta, TabelaGruposFiscais);
  if AView = nil then
    raise Exception.Create('A view de Grupos Fiscais não foi informada.');
  if AQueryDefinition = nil then
    raise Exception.Create('A consulta de Grupos Fiscais não foi informada.');
  if ARemoverGrupoFiscal = nil then
    raise Exception.Create(
      'O caso de uso de remoção de Grupos Fiscais não foi informado.');

  FView := AView;
  FQueryDefinition := AQueryDefinition;
  FRemoverGrupoFiscal := ARemoverGrupoFiscal;
end;

function TGruposFiscaisPresenter.EnviarParaLixeira(): Boolean;
var
  Selected: TGrupoSelecionado;
begin
  Result := False;

  // A linha corrente e lida uma unica vez; o mesmo registro identificado na
  // confirmacao e enviado para a lixeira.
  if not FQueryDefinition.TryGetSelected(Selected) then
  begin
    FView.ShowError('O grupo fiscal a enviar para a lixeira não foi identificado.');
    Exit;
  end;

  if not FView.ShowDangerQuestion(Format('Deseja enviar o grupo fiscal "%s" para a lixeira?',
      [Selected.Descricao])) then
    Exit;

  if not Autorizar(ProcessoExclusao, aaExcluir) then
    Exit;

  try
    FRemoverGrupoFiscal.Executar(Selected.Id);
    Result := True;
  except
    on E: EValidacaoNegocio do
      FView.ShowError(E.Message);
    on E: Exception do
      // O texto tecnico do banco nao deve chegar a interface.
      FView.ShowError('Não foi possível enviar o grupo fiscal para a lixeira.');
  end;
end;

function TGruposFiscaisPresenter.SolicitarInclusao: Boolean;
begin
  Result := False;

  if FView.AtivarInclusao then
  begin
    Result := True;
    Exit;
  end;

  // A negativa ou o cancelamento ja foi apresentado pelo legado.
  if not Autorizar(ProcessoInclusao, aaInserir) then
    Exit;

  Result := FView.AbrirInclusao;
end;

function TGruposFiscaisPresenter.SolicitarEdicao: Boolean;
var
  Selected: TGrupoSelecionado;
  Id: string;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selected) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  Id := Trim(Selected.Id);
  if Id = '' then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if FView.AtivarEdicao(Id) then
  begin
    Result := True;
    Exit;
  end;

  // A permissao de alteracao e verificada antes de o cadastro carregar o
  // registro.
  if not Autorizar(ProcessoAlteracao, aaAlterar) then
    Exit;

  Selected.Id := Id;
  Result := FView.AbrirEdicao(Selected);
end;

end.
