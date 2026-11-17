unit GruposFiscaisForm;

interface

uses
  Winapi.Windows, System.SysUtils,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm, PresenterConsultaBase,
  GruposFiscaisPresenter, GruposFiscaisView, NextQueryDefinition,
  LocalPreferences,
  GruposFiscaisQueryDefinition,
  GrupoFiscalEtdUnit, GrupoFiscalCadastroFrame, EditorCadastro,
  ValidationEntityOutputUnit;

type
  // Tela de consulta, inclusao e alteracao de Grupos Fiscais. Herda a
  // apresentacao generica e acrescenta a consulta, a alteracao, o envio da linha
  // corrente para a lixeira e as abas de cadastro. A inclusao e cada registro
  // alterado ocupam uma aba propria, cujo editor e dono do rascunho. O
  // apresentador e o leitor sao injetados pela composicao; a base cria a aba e o
  // editor a partir do contrato comum.
  TfrmGruposFiscais = class(TfrmConsultaBase, IGruposFiscaisView)
  private
    // Contrato tipado da consulta: entrega o identificador da linha corrente
    // usado por Alterar e Lixeira.
    FDefinicaoSelecao: INextQueryDefinition<TGrupoSelecionado>;
    // Funcao de composicao que cria e configura o editor de cada aba. A tela
    // nao conhece as dependencias do editor e nao guarda aba, frame nem
    // rascunho.
    FCriarEditorAba: TCriarEditorCadastro;
    // Acesso tipado ao apresentador que a base possui e libera: esta tela nao
    // responde pela liberacao nem assume posse dele.
    function Presenter: TGruposFiscaisPresenter;
    // Recebe a funcao de composicao que cria e configura o editor de cada aba.
    // Executada por ConfigurarTela antes da primeira abertura e da posse do
    // apresentador.
    procedure ConfigurarCriacaoEditor(const ACriarEditor: TCriarEditorCadastro);
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
    // O frame da aba aplica os campos ao proprio rascunho e o apresentador
    // executa a gravacao. Depois de Salvar o frame nao e mais acessado: uma
    // troca de sessao pode te-lo liberado.
    function SalvarAba(const AChave: string;
      AEditor: TWinControl): Boolean; override;
    procedure AvisarSalvamentoSemAtualizacao; override;
    // O envio para a lixeira ja terminou; a mensagem usa o vocabulario desta
    // funcionalidade.
    procedure AvisarExclusaoSemAtualizacao; override;
  public
    // Implementa IGruposFiscaisView: a base encaminha a validacao ao editor da
    // aba que iniciou a gravacao, que apresenta as mensagens por campo.
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
    // Reapresenta a aba de alteracao da chave ja aberta. Sem aba, nada e criado
    // e a alteracao segue para a autorizacao e a carga.
    function AtivarEdicao(const AChave: string): Boolean;
    // Abre a aba da chave e copia o grupo carregado para o rascunho do editor.
    // A entidade continua pertencendo a quem chamou. A falha de preparacao e
    // informada uma unica vez.
    function AbrirEdicao(const AChave: string;
      const AGrupo: GrupoFiscalEtd): Boolean;
    // Reapresenta a aba de inclusao ja aberta. Sem aba, nada e criado e a
    // inclusao segue para a autorizacao e a preparacao da aba.
    function AtivarInclusao: Boolean;
    // Abre uma nova aba de inclusao; o editor cria o proprio rascunho e carrega
    // as empresas na preparacao. A falha e informada uma unica vez.
    function AbrirInclusao: Boolean;
    // Unica entrada da configuracao inicial: associa a definicao, configura a
    // criacao do editor e os filtros e entrega o apresentador a base por ultimo.
    procedure ConfigurarTela(
      const ADefinition: INextQueryDefinition<TGrupoSelecionado>;
      const APresenter: TGruposFiscaisPresenter;
      const APreferences: ILocalPreferences;
      const ACriarEditor: TCriarEditorCadastro);
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
  const ACriarEditor: TCriarEditorCadastro);
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

function TfrmGruposFiscais.Presenter: TGruposFiscaisPresenter;
begin
  // A instancia pertence a base; o valor e sempre o apresentador recebido por
  // ConfigurarTela.
  Result := TGruposFiscaisPresenter(PresenterConsulta);
end;

procedure TfrmGruposFiscais.ApresentadorAssociado(
  APresenter: TPresenterConsultaBase;
  const ADefinition: INextQueryDefinitionBase);
var
  GrupoPresenter: TGruposFiscaisPresenter;
begin
  // O identificador da linha corrente vem do mesmo contrato que a alteracao
  // consome. Sem esse contrato a tela abre, mas Alterar e Excluir permanecem
  // desabilitados.
  if not Supports(ADefinition, INextQueryDefinition<TGrupoSelecionado>,
    FDefinicaoSelecao) then
    FDefinicaoSelecao := nil;

  // O gancho roda antes da posse do apresentador: as acoes usam a instancia
  // recebida, que ainda pertence a composicao.
  GrupoPresenter := TGruposFiscaisPresenter(APresenter);
  AssociarAcaoInclusao(GrupoPresenter.CarregarParaInclusao);
  AssociarAcaoAlteracao(GrupoPresenter.CarregarParaEdicao);
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
  const ACriarEditor: TCriarEditorCadastro);
begin
  if not Assigned(ACriarEditor) then
    raise Exception.Create(MissingEditorFactoryMessage);
  FCriarEditorAba := ACriarEditor;
end;

function TfrmGruposFiscais.CriarEditor(const AChave: string;
  AParent: TWinControl): TWinControl;
begin
  // Cada aba recebe o proprio frame, dono do rascunho e da propria lista de
  // empresas. A base define Parent e Align e libera o editor junto com a aba.
  if not Assigned(FCriarEditorAba) then
    raise Exception.Create(MissingEditorFactoryMessage);
  Result := FCriarEditorAba(AChave, AParent);
end;

function TfrmGruposFiscais.SalvarAba(const AChave: string;
  AEditor: TWinControl): Boolean;
var
  Frame: TfrmGrupoFiscalCadastroFrame;
begin
  Result := False;
  if (Presenter = nil) or
    (not (AEditor is TfrmGrupoFiscalCadastroFrame)) then
    Exit;

  Frame := TfrmGrupoFiscalCadastroFrame(AEditor);
  if not Frame.TemRascunho then
    Exit;

  Frame.LimparValidacao;
  if not Frame.AplicarCamposAoRascunho then
    Exit;

  // A entidade pertence ao frame e continua valida durante a chamada. Depois de
  // Salvar o frame nao e mais acessado: uma troca de sessao pode te-lo liberado.
  Result := Presenter.Salvar(Frame.Rascunho);
end;

procedure TfrmGruposFiscais.ExibirValidacao(
  const AValidacao: ValidationEntityOutput);
begin
  // O encaminhamento e da base: a validacao vai para o editor da aba que
  // iniciou a gravacao.
  inherited ShowValidation(AValidacao);
end;

function TfrmGruposFiscais.AtivarEdicao(const AChave: string): Boolean;
begin
  // Reabrir devolve a aba existente sem repetir autorizacao nem recarregar o
  // registro: o rascunho ainda pertence a sessao atual.
  Result := TryAtivarAba(AChave);
end;

function TfrmGruposFiscais.AbrirEdicao(const AChave: string;
  const AGrupo: GrupoFiscalEtd): Boolean;
var
  Titulo: string;
  Grupo: GrupoFiscalEtd;
  CargaFalhou: Boolean;
begin
  Result := False;
  if AGrupo = nil then
    Exit;

  // O titulo usa a descricao antes de o frame clonar a entidade recebida.
  Titulo := 'Alterar - ' + AGrupo.Descricao;

  // O frame copia o grupo durante a abertura; o apresentador libera a entidade
  // original no finally.
  Grupo := AGrupo;
  CargaFalhou := False;
  Result := AbrirAba(AChave, Titulo,
    procedure(AEditor: TWinControl)
    begin
      if TfrmGrupoFiscalCadastroFrame(AEditor).PrepararAlteracao(Grupo) then
        Exit;
      CargaFalhou := True;
      Abort;
    end);

  if Result then
    Exit;

  if CargaFalhou then
    ShowWarning('Não foi possível carregar as empresas para a alteração.')
  else
    ShowError('Não foi possível iniciar a alteração do grupo fiscal.');
end;

function TfrmGruposFiscais.AtivarInclusao: Boolean;
begin
  // Reabrir devolve a aba de inclusao existente sem repetir autorizacao nem
  // recarregar as empresas: o rascunho ainda pertence a sessao atual.
  Result := TryAtivarAba(ChaveAbaInclusao);
end;

function TfrmGruposFiscais.AbrirInclusao: Boolean;
var
  CargaFalhou: Boolean;
begin
  // A carga das empresas pertence ao editor e roda na preparacao da aba. A
  // falha e registrada aqui para que o aviso especifico apareca uma unica vez.
  CargaFalhou := False;
  Result := AbrirAba(ChaveAbaInclusao, 'Inclusão',
    procedure(AEditor: TWinControl)
    begin
      // Abort interrompe a montagem; a base descarta a aba parcial e devolve
      // False sem apresentar mensagem.
      if TfrmGrupoFiscalCadastroFrame(AEditor).PrepararInclusao then
        Exit;
      CargaFalhou := True;
      Abort;
    end);

  if Result then
    Exit;

  if CargaFalhou then
    ShowWarning('Não foi possível carregar as empresas para a inclusão.')
  else
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
  // A exclusao desta funcionalidade envia o registro para a lixeira.
  ShowWarning('O grupo fiscal já foi enviado para a lixeira. Refaça a pesquisa para atualizar a consulta.');
end;

end.
