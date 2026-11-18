unit GruposFiscaisForm;

interface

uses
  System.SysUtils,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm, PresenterConsultaBase,
  GruposFiscaisPresenter, GruposFiscaisView, NextQueryDefinition,
  LocalPreferences,
  GruposFiscaisQueryDefinition, GrupoFiscalCadastroFrame, EditorCadastro;

type
  // Cada inclusao e cada registro alterado ocupam uma aba propria, cujo editor e dono do rascunho, da lista de empresas
  // e do apresentador do cadastro.
  TfrmGruposFiscais = class(TfrmConsultaBase, IGruposFiscaisView)
  private
    FDefinicaoSelecao: INextQueryDefinition<TGrupoSelecionado>;
    // A tela nao conhece as dependencias do editor e nao guarda aba, frame nem rascunho.
    FCriarEditorAba: TCriarEditorCadastroComandos;
    procedure ConfigurarCriacaoEditor(const ACriarEditor: TCriarEditorCadastroComandos);
  protected
    procedure ApresentadorAssociado(APresenter: TPresenterConsultaBase;
      const ADefinition: INextQueryDefinitionBase); override;
    function TemRegistroCorrente: Boolean; override;
    function CriarEditor(const AChave: string; AParent: TWinControl): TWinControl; override;
    procedure AvisarSalvamentoSemAtualizacao; override;
    procedure AvisarExclusaoSemAtualizacao; override;
  public
    function AbrirEdicao(const ASelecao: TGrupoSelecionado): Boolean;
    function AbrirInclusao: Boolean;
    procedure ConfigurarTela(const ADefinition: INextQueryDefinition<TGrupoSelecionado>;
      const APresenter: TGruposFiscaisPresenter; const APreferences: ILocalPreferences;
      const ACriarEditor: TCriarEditorCadastroComandos);
  end;

implementation

{$R *.dfm}

const
  MissingEditorFactoryMessage = 'A criacao do editor de Grupos Fiscais nao foi informada.';

procedure TfrmGruposFiscais.ConfigurarTela(const ADefinition: INextQueryDefinition<TGrupoSelecionado>;
  const APresenter: TGruposFiscaisPresenter; const APreferences: ILocalPreferences;
  const ACriarEditor: TCriarEditorCadastroComandos);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador de Grupos Fiscais nao foi informado.');
  if ADefinition = nil then
    raise Exception.Create('A definicao da consulta nao foi informada.');

  // A definicao, a fabrica do editor e os filtros precisam existir antes da posse: a primeira abertura de aba ja usa a
  // fabrica configurada e o apresentador so passa a pertencer a tela em AssociarPresenter.
  Attach(ADefinition, 'Grupos Fiscais');
  ConfigurarCriacaoEditor(ACriarEditor);
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.QueryId);
  AssociarPresenter(APresenter);
end;

procedure TfrmGruposFiscais.ApresentadorAssociado(
  APresenter: TPresenterConsultaBase; const ADefinition: INextQueryDefinitionBase);
var
  GrupoPresenter: TGruposFiscaisPresenter;
begin
  // Sem esse contrato a tela abre, mas Alterar e Excluir permanecem desabilitados.
  if not Supports(ADefinition, INextQueryDefinition<TGrupoSelecionado>, FDefinicaoSelecao) then
    FDefinicaoSelecao := nil;

  // A instancia recebida ainda pertence a composicao.
  GrupoPresenter := TGruposFiscaisPresenter(APresenter);
  AssociarAcaoInclusao(GrupoPresenter.SolicitarInclusao);
  AssociarAcaoAlteracao(GrupoPresenter.SolicitarEdicao);
  AssociarAcaoExclusao(GrupoPresenter.EnviarParaLixeira, 'Enviar para a lixeira');
end;

function TfrmGruposFiscais.TemRegistroCorrente: Boolean;
var
  Selecionado: TGrupoSelecionado;
begin
  Result := inherited TemRegistroCorrente;
  if not Result then
    Exit;

  // A chave vazia nao identifica registro e nao habilita as operacoes.
  Result := (FDefinicaoSelecao <> nil) and
    FDefinicaoSelecao.TryGetSelected(Selecionado) and (Trim(Selecionado.Id) <> '');
end;

procedure TfrmGruposFiscais.ConfigurarCriacaoEditor(const ACriarEditor: TCriarEditorCadastroComandos);
begin
  if not Assigned(ACriarEditor) then
    raise Exception.Create(MissingEditorFactoryMessage);
  FCriarEditorAba := ACriarEditor;
end;

function TfrmGruposFiscais.CriarEditor(const AChave: string; AParent: TWinControl): TWinControl;
begin
  // Cada aba recebe o proprio frame, dono do rascunho, da lista de empresas e do apresentador do cadastro.
  if not Assigned(FCriarEditorAba) then
    raise Exception.Create(MissingEditorFactoryMessage);
  Result := FCriarEditorAba(AChave, AParent, Self);
end;

function TfrmGruposFiscais.AbrirEdicao(const ASelecao: TGrupoSelecionado): Boolean;
var
  Id: string;
  PreparacaoFalhou: Boolean;
begin
  Result := False;
  Id := Trim(ASelecao.Id);
  if Id = '' then
    Exit;

  PreparacaoFalhou := False;
  Result := AbrirAba(Id, 'Alterar - ' + ASelecao.Descricao,
    procedure(AEditor: TWinControl)
    begin
      if TfrmGrupoFiscalCadastroFrame(AEditor).PrepararAbaAlteracao(Id) then
        Exit;
      PreparacaoFalhou := True;
      // Abort interrompe a montagem; a base descarta a aba parcial sem mensagem.
      Abort;
    end);

  if Result or PreparacaoFalhou then
    Exit;

  ShowError('Não foi possível iniciar a alteração do grupo fiscal.');
end;

function TfrmGruposFiscais.AbrirInclusao: Boolean;
var
  PreparacaoFalhou: Boolean;
begin
  PreparacaoFalhou := False;
  Result := AbrirAba(ChaveAbaInclusao, 'Inclusão',
    procedure(AEditor: TWinControl)
    begin
      if TfrmGrupoFiscalCadastroFrame(AEditor).PrepararAbaInclusao then
        Exit;
      PreparacaoFalhou := True;
      // Abort interrompe a montagem; a base descarta a aba parcial sem mensagem.
      Abort;
    end);

  if Result or PreparacaoFalhou then
    Exit;

  ShowError('Não foi possível iniciar a inclusão do grupo fiscal.');
end;

procedure TfrmGruposFiscais.AvisarSalvamentoSemAtualizacao;
begin
  // A base ja fechou a aba e descartou o rascunho.
  ShowWarning('O grupo fiscal foi salvo. Refaça a pesquisa para atualizar a consulta.');
end;

procedure TfrmGruposFiscais.AvisarExclusaoSemAtualizacao;
begin
  ShowWarning('O grupo fiscal já foi enviado para a lixeira. Refaça a pesquisa para atualizar a consulta.');
end;

end.
