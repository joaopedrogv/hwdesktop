unit OperacoesFiscaisIbsCbsForm;

interface

uses
  System.SysUtils, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm,
  PresenterConsultaBase, NextQueryDefinition, LocalPreferences,
  OperacoesFiscaisIbsCbsView, OperacoesFiscaisIbsCbsPresenter,
  OperacoesFiscaisIbsCbsQueryDefinition, EditorCadastro;

type
  // Tela de consulta, inclusao e alteracao de Operacoes Fiscais IBS/CBS. Herda a
  // apresentacao generica e acrescenta a pesquisa da lixeira e as abas de
  // cadastro. A inclusao e cada registro alterado ocupam uma aba propria, cujo
  // editor e dono do rascunho, dos seletores e do apresentador do cadastro.
  TfrmOperacoesFiscaisIbsCbs = class(TfrmConsultaBase, IOperacoesFiscaisIbsCbsView)
    chkLixeira: TCheckBox;
  private
    // Contrato tipado da consulta: entrega o identificador e as descricoes ja
    // apresentadas na linha corrente usados por Alterar.
    FDefinicaoSelecao: INextQueryDefinition<TOperacaoFiscalSelecionada>;
    // Funcao de composicao que cria e configura o editor de cada aba. A tela nao
    // conhece as dependencias do editor e nao guarda aba, frame nem rascunho.
    FCriarEditorAba: TCriarEditorCadastroComandos;
    // Recebe a funcao de composicao que cria e configura o editor de cada aba.
    // Executada por ConfigurarTela antes da primeira abertura e da posse do
    // apresentador.
    procedure ConfigurarCriacaoEditor(
      const ACriarEditor: TCriarEditorCadastroComandos);
    // Identifica a aba de alteracao pelas descricoes ja apresentadas na
    // consulta; sem nenhuma descricao o identificador mantem a aba rastreavel.
    function TituloAlteracao(
      const ASelecao: TOperacaoFiscalSelecionada): string;
  protected
    // Liga as acoes padrao da consulta aos metodos do apresentador depois que a
    // base aceitou a definicao e antes de assumir a posse.
    procedure ApresentadorAssociado(APresenter: TPresenterConsultaBase;
      const ADefinition: INextQueryDefinitionBase); override;
    // Inclusao depende do apresentador; Alterar exige tambem uma linha corrente
    // identificada na grade.
    function TemRegistroCorrente: Boolean; override;
    // A base cria a aba e a area de rolagem; a tela fornece o editor tipado que
    // possui o rascunho da aba.
    function CriarEditor(const AChave: string;
      AParent: TWinControl): TWinControl; override;
    procedure AvisarSalvamentoSemAtualizacao; override;
    procedure AvisarExclusaoSemAtualizacao; override;
  public
    // Abre a aba da chave; a falha de preparacao e informada pelo apresentador
    // do cadastro.
    function AbrirEdicao(
      const ASelecao: TOperacaoFiscalSelecionada): Boolean;
    // Abre uma nova aba de inclusao; a falha de preparacao e informada pelo
    // apresentador do cadastro.
    function AbrirInclusao: Boolean;
    // Opcao lida pela definicao em cada pesquisa: vale para a proxima busca e
    // nao altera o resultado ja apresentado.
    function IsLixeiraSearch: Boolean;
    // Unica entrada da configuracao inicial: associa a definicao, configura a
    // criacao do editor e os filtros e entrega o apresentador a base por ultimo.
    procedure ConfigurarTela(
      const ADefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
      const APresenter: TOperacoesFiscaisIbsCbsPresenter;
      const APreferences: ILocalPreferences;
      const ACriarEditor: TCriarEditorCadastroComandos);
  end;

implementation

{$R *.dfm}

uses
  OperacaoFiscalIbsCbsCadastroFrame;

const
  MissingPresenterMessage =
    'O apresentador de Operações Fiscais IBS/CBS não foi informado.';
  MissingDefinitionMessage = 'A definição da consulta não foi informada.';
  MissingEditorFactoryMessage =
    'A criação do editor de Operações Fiscais IBS/CBS não foi informada.';
  // Prefixo e separador das descricoes no titulo da aba de alteracao.
  TituloAlteracaoPrefixo = 'Alterar - ';
  SeparadorTitulo = ' / ';

procedure TfrmOperacoesFiscaisIbsCbs.ConfigurarTela(
  const ADefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
  const APresenter: TOperacoesFiscaisIbsCbsPresenter;
  const APreferences: ILocalPreferences;
  const ACriarEditor: TCriarEditorCadastroComandos);
const
  QueryTitle = 'Operações Fiscais IBS/CBS';
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

procedure TfrmOperacoesFiscaisIbsCbs.ApresentadorAssociado(
  APresenter: TPresenterConsultaBase;
  const ADefinition: INextQueryDefinitionBase);
var
  OperacoesPresenter: TOperacoesFiscaisIbsCbsPresenter;
begin
  // O identificador da linha corrente vem do mesmo contrato que a alteracao
  // consome. Sem esse contrato a tela abre, mas Alterar permanece desabilitado.
  if not Supports(ADefinition, INextQueryDefinition<TOperacaoFiscalSelecionada>,
    FDefinicaoSelecao) then
    FDefinicaoSelecao := nil;

  // O gancho roda antes da posse do apresentador: as acoes usam a instancia
  // recebida, que ainda pertence a composicao.
  OperacoesPresenter := TOperacoesFiscaisIbsCbsPresenter(APresenter);
  AssociarAcaoInclusao(OperacoesPresenter.SolicitarInclusao);
  AssociarAcaoAlteracao(OperacoesPresenter.SolicitarEdicao);
  AssociarAcaoExclusao(OperacoesPresenter.EnviarParaLixeira,
    'Enviar para a lixeira');
end;

function TfrmOperacoesFiscaisIbsCbs.TemRegistroCorrente: Boolean;
var
  Selecionado: TOperacaoFiscalSelecionada;
begin
  Result := inherited TemRegistroCorrente;
  if not Result then
    Exit;

  // A definicao le a linha corrente sem criar objetos de apresentacao. A chave
  // vazia nao identifica registro e nao habilita a alteracao.
  Result := (FDefinicaoSelecao <> nil) and
    FDefinicaoSelecao.TryGetSelected(Selecionado) and
    (Trim(Selecionado.Id) <> '');
end;

procedure TfrmOperacoesFiscaisIbsCbs.ConfigurarCriacaoEditor(
  const ACriarEditor: TCriarEditorCadastroComandos);
begin
  if not Assigned(ACriarEditor) then
    raise Exception.Create(MissingEditorFactoryMessage);
  FCriarEditorAba := ACriarEditor;
end;

function TfrmOperacoesFiscaisIbsCbs.CriarEditor(const AChave: string;
  AParent: TWinControl): TWinControl;
begin
  // Cada aba recebe o proprio frame, dono do rascunho, dos seletores e do
  // apresentador do cadastro.
  if not Assigned(FCriarEditorAba) then
    raise Exception.Create(MissingEditorFactoryMessage);
  Result := FCriarEditorAba(AChave, AParent, Self);
end;

function TfrmOperacoesFiscaisIbsCbs.TituloAlteracao(
  const ASelecao: TOperacaoFiscalSelecionada): string;
var
  Descricao: string;

  // Acrescenta apenas a descricao existente, sem separador solto no inicio.
  procedure Adicionar(const ATexto: string);
  begin
    if Trim(ATexto) = '' then
      Exit;
    if Descricao <> '' then
      Descricao := Descricao + SeparadorTitulo;
    Descricao := Descricao + Trim(ATexto);
  end;

begin
  Descricao := '';
  Adicionar(ASelecao.OperacaoInternaDescricao);
  Adicionar(ASelecao.RegraFiscalDescricao);
  Adicionar(ASelecao.GrupoFiscalDescricao);

  // Sem descricao o identificador ainda permite reconhecer a aba aberta.
  if Descricao = '' then
    Descricao := ASelecao.Id;

  Result := TituloAlteracaoPrefixo + Descricao;
end;

function TfrmOperacoesFiscaisIbsCbs.AbrirEdicao(
  const ASelecao: TOperacaoFiscalSelecionada): Boolean;
var
  Id: string;
  PreparacaoFalhou: Boolean;
begin
  Result := False;
  Id := Trim(ASelecao.Id);
  if Id = '' then
    Exit;

  PreparacaoFalhou := False;
  Result := AbrirAba(Id, TituloAlteracao(ASelecao),
    procedure(AEditor: TWinControl)
    begin
      if TfrmOperacaoFiscalIbsCbsCadastroFrame(AEditor).PrepararAbaAlteracao(
        Id) then
        Exit;
      PreparacaoFalhou := True;
      // Abort interrompe a montagem; a base descarta a aba parcial sem mensagem.
      Abort;
    end);

  if Result or PreparacaoFalhou then
    Exit;

  ShowError('Não foi possível iniciar a alteração da operação fiscal.');
end;

function TfrmOperacoesFiscaisIbsCbs.AbrirInclusao: Boolean;
var
  PreparacaoFalhou: Boolean;
begin
  PreparacaoFalhou := False;
  Result := AbrirAba(ChaveAbaInclusao, 'Inclusão',
    procedure(AEditor: TWinControl)
    begin
      if TfrmOperacaoFiscalIbsCbsCadastroFrame(AEditor).PrepararAbaInclusao then
        Exit;
      PreparacaoFalhou := True;
      // Abort interrompe a montagem; a base descarta a aba parcial sem mensagem.
      Abort;
    end);

  if Result or PreparacaoFalhou then
    Exit;

  ShowError('Não foi possível iniciar a inclusão da operação fiscal.');
end;

function TfrmOperacoesFiscaisIbsCbs.IsLixeiraSearch: Boolean;
begin
  Result := chkLixeira.Checked;
end;

procedure TfrmOperacoesFiscaisIbsCbs.AvisarSalvamentoSemAtualizacao;
begin
  // A base ja fechou a aba e descartou o rascunho; a mensagem confirma a
  // gravacao e orienta a atualizar a consulta.
  ShowWarning(
    'A operação fiscal foi salva. Refaça a pesquisa para atualizar a consulta.');
end;

procedure TfrmOperacoesFiscaisIbsCbs.AvisarExclusaoSemAtualizacao;
begin
  ShowWarning(
    'A operação fiscal já foi enviada para a lixeira. Refaça a pesquisa para atualizar a consulta.');
end;

end.
