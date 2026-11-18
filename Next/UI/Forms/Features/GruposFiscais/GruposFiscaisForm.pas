unit GruposFiscaisForm;

interface

uses
  System.SysUtils,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm, PresenterConsultaBase,
  GruposFiscaisPresenter, GruposFiscaisView, NextQueryDefinition,
  LocalPreferences,
  GruposFiscaisQueryDefinition, GrupoFiscalCadastroFrame, EditorCadastro;

type
  // Tela de consulta, inclusao e alteracao de Grupos Fiscais. Herda a
  // apresentacao generica e acrescenta a consulta, o envio da linha corrente
  // para a lixeira e as abas de cadastro. A inclusao e cada registro alterado
  // ocupam uma aba propria, cujo editor e dono do rascunho e do apresentador do
  // cadastro. O apresentador e o leitor sao injetados pela composicao; a base
  // cria a aba e o editor a partir do contrato comum.
  TfrmGruposFiscais = class(TfrmConsultaBase, IGruposFiscaisView)
  private
    // Contrato tipado da consulta: entrega a selecao da linha corrente usada
    // por Alterar e Lixeira.
    FDefinicaoSelecao: INextQueryDefinition<TGrupoSelecionado>;
    // Funcao de composicao que cria e configura o editor de cada aba. A tela
    // nao conhece as dependencias do editor e nao guarda aba, frame nem
    // rascunho.
    FCriarEditorAba: TCriarEditorCadastroComandos;
    // Recebe a funcao de composicao que cria e configura o editor de cada aba.
    // Executada por ConfigurarTela antes da primeira abertura e da posse do
    // apresentador.
    procedure ConfigurarCriacaoEditor(
      const ACriarEditor: TCriarEditorCadastroComandos);
  protected
    // Liga as acoes padrao da consulta aos metodos do apresentador depois que a
    // base aceitou a definicao e antes de assumir a posse.
    procedure ApresentadorAssociado(APresenter: TPresenterConsultaBase;
      const ADefinition: INextQueryDefinitionBase); override;
    // Inclusao depende do apresentador; Alterar e Excluir exigem tambem uma
    // linha corrente identificada na grade.
    function TemRegistroCorrente: Boolean; override;
    // A base cria a aba e a area de rolagem; a tela fornece o editor tipado que
    // possui o rascunho da aba.
    function CriarEditor(const AChave: string;
      AParent: TWinControl): TWinControl; override;
    procedure AvisarSalvamentoSemAtualizacao; override;
    procedure AvisarExclusaoSemAtualizacao; override;
  public
    // Abre a aba do registro escolhido na grade; a preparacao e informada pelo
    // apresentador do cadastro.
    function AbrirEdicao(const ASelecao: TGrupoSelecionado): Boolean;
    // Abre uma nova aba de inclusao; a preparacao e informada pelo apresentador
    // do cadastro.
    function AbrirInclusao: Boolean;
    // Unica entrada da configuracao inicial: associa a definicao, configura a
    // criacao do editor e os filtros e entrega o apresentador a base por ultimo.
    procedure ConfigurarTela(
      const ADefinition: INextQueryDefinition<TGrupoSelecionado>;
      const APresenter: TGruposFiscaisPresenter;
      const APreferences: ILocalPreferences;
      const ACriarEditor: TCriarEditorCadastroComandos);
  end;

implementation

{$R *.dfm}

const
  MissingPresenterMessage = 'O apresentador de Grupos Fiscais nao foi informado.';
  MissingDefinitionMessage = 'A definicao da consulta nao foi informada.';
  MissingEditorFactoryMessage =
    'A criacao do editor de Grupos Fiscais nao foi informada.';

procedure TfrmGruposFiscais.ConfigurarTela(
  const ADefinition: INextQueryDefinition<TGrupoSelecionado>;
  const APresenter: TGruposFiscaisPresenter;
  const APreferences: ILocalPreferences;
  const ACriarEditor: TCriarEditorCadastroComandos);
const
  QueryTitle = 'Grupos Fiscais';
begin
  if APresenter = nil then
    raise Exception.Create(MissingPresenterMessage);
  if ADefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);

  // A definicao, a fabrica do editor e os filtros precisam existir antes da
  // posse: a primeira abertura de aba ja usa a fabrica configurada e o
  // apresentador so passa a pertencer a tela em AssociarPresenter.
  Attach(ADefinition, QueryTitle);
  ConfigurarCriacaoEditor(ACriarEditor);
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.QueryId);
  AssociarPresenter(APresenter);
end;

procedure TfrmGruposFiscais.ApresentadorAssociado(
  APresenter: TPresenterConsultaBase;
  const ADefinition: INextQueryDefinitionBase);
var
  GrupoPresenter: TGruposFiscaisPresenter;
begin
  // A selecao da linha corrente vem do mesmo contrato que a alteracao
  // consome. Sem esse contrato a tela abre, mas Alterar e Excluir permanecem
  // desabilitados.
  if not Supports(ADefinition, INextQueryDefinition<TGrupoSelecionado>,
    FDefinicaoSelecao) then
    FDefinicaoSelecao := nil;

  // O gancho roda antes da posse do apresentador: as acoes usam a instancia
  // recebida, que ainda pertence a composicao.
  GrupoPresenter := TGruposFiscaisPresenter(APresenter);
  AssociarAcaoInclusao(GrupoPresenter.SolicitarInclusao);
  AssociarAcaoAlteracao(GrupoPresenter.SolicitarEdicao);
  AssociarAcaoExclusao(GrupoPresenter.EnviarParaLixeira,
    'Enviar para a lixeira');
end;

function TfrmGruposFiscais.TemRegistroCorrente: Boolean;
var
  Selecionado: TGrupoSelecionado;
begin
  Result := inherited TemRegistroCorrente;
  if not Result then
    Exit;

  // A definicao le a linha corrente sem criar objetos de apresentacao. A chave
  // vazia nao identifica registro e nao habilita as operacoes.
  Result := (FDefinicaoSelecao <> nil) and
    FDefinicaoSelecao.TryGetSelected(Selecionado) and
    (Trim(Selecionado.Id) <> '');
end;

procedure TfrmGruposFiscais.ConfigurarCriacaoEditor(
  const ACriarEditor: TCriarEditorCadastroComandos);
begin
  if not Assigned(ACriarEditor) then
    raise Exception.Create(MissingEditorFactoryMessage);
  FCriarEditorAba := ACriarEditor;
end;

function TfrmGruposFiscais.CriarEditor(const AChave: string;
  AParent: TWinControl): TWinControl;
begin
  // Cada aba recebe o proprio frame, dono do rascunho, da propria lista de
  // empresas e do apresentador do cadastro.
  if not Assigned(FCriarEditorAba) then
    raise Exception.Create(MissingEditorFactoryMessage);
  Result := FCriarEditorAba(AChave, AParent, Self);
end;

function TfrmGruposFiscais.AbrirEdicao(
  const ASelecao: TGrupoSelecionado): Boolean;
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
  // A base ja fechou a aba e descartou o rascunho; a mensagem confirma a
  // gravacao e orienta a atualizar a consulta.
  ShowWarning('O grupo fiscal foi salvo. Refaça a pesquisa para atualizar a consulta.');
end;

procedure TfrmGruposFiscais.AvisarExclusaoSemAtualizacao;
begin
  ShowWarning('O grupo fiscal já foi enviado para a lixeira. Refaça a pesquisa para atualizar a consulta.');
end;

end.
