unit GruposFiscaisForm;

interface

uses
  Winapi.Windows, System.SysUtils, Data.DB, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, ConsultaBaseForm, FilterCriterion, IDataSetReaderUnit,
  GridColumnDefinition, GruposFiscaisPresenter, GruposFiscaisView,
  QueryResultOperations, GrupoFiscalCadastro, GrupoFiscalEtdUnit,
  GrupoFiscalCadastroFrame, ValidationEntityOutputUnit;

type
  // Tela de consulta e inclusao de Grupos Fiscais. Herda a apresentacao
  // generica e acrescenta a consulta, o envio da linha corrente para a lixeira
  // e a inclusao em uma aba dinamica. O apresentador e o leitor sao injetados
  // pela composicao; o rascunho pertence a esta tela e o editor pertence a aba
  // criada pela base.
  TfrmGruposFiscais = class(TfrmConsultaBase, IGruposFiscaisView)
    btnNovo: TButton;
    btnEnviarLixeira: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEnviarLixeiraClick(Sender: TObject);
  private
    FPresenter: TGruposFiscaisPresenter;
    // Rascunho da inclusao corrente. A existencia do objeto e a pendencia: na
    // inclusao nao existe estado aberto sem alteracao a gravar, porque as
    // empresas permitidas ja iniciam marcadas.
    FDraft: GrupoFiscalEtd;
    // Referencia ao editor criado pela base para a aba aberta. A posse do
    // controle e da area de rolagem da aba, que o libera junto com ela.
    FEditor: TfrmGrupoFiscalCadastroFrame;
    // Empresas lidas antes de abrir a aba, mantidas ate o preparo do editor.
    FOpcoesEmpresas: TGrupoFiscalEmpresaOptions;
    function LerLinhaCorrente(out AId, ADescricao: string): Boolean;
    function PesquisarGrupos(
      const ACriteria: TFilterCriteria): IDataSetReader;
  protected
    function CanPesquisar: Boolean; override;
    // A base cria a aba, o rodape e a area de rolagem; a tela fornece o editor
    // tipado usado pelos hooks de abertura, gravacao e foco.
    function CriarEditorInclusao(AParent: TWinControl): TWinControl; override;
    function TituloAbaInclusao: string; override;
    procedure AoAbrirAbaInclusao; override;
    procedure AoFecharAbaInclusao; override;
    procedure AoFalharAberturaAbaInclusao; override;
    function SalvarInclusao: Boolean; override;
    procedure AvisarSalvamentoSemAtualizacao; override;
  public
    destructor Destroy; override;
    function HasPendingChanges: Boolean; override;
    procedure FocusView; override;
    // Encaminha ao editor da inclusao o resultado de validacao produzido pelo
    // apresentador; o painel do editor apresenta os campos e mensagens.
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
    procedure AttachPresenter(APresenter: TGruposFiscaisPresenter;
      const AColumns: TGridColumnDefinitions; const ATitle: string;
      AOperations: IQueryResultOperations = nil);
  end;

implementation

{$R *.dfm}

const
  MissingPresenterMessage =
    'O apresentador de Grupos Fiscais nao foi informado.';
  LixeiraTitle = 'Enviar para a lixeira';
  InclusaoTitle = 'Novo grupo fiscal';

destructor TfrmGruposFiscais.Destroy;
begin
  try
    // Nenhum controle e tocado na destruicao: apenas a posse dos objetos
    // transientes desta tela e liberada. A base e os componentes do formulario
    // liberam a aba, o editor e o resultado.
    FreeAndNil(FDraft);
    FreeAndNil(FPresenter);
  finally
    inherited;
  end;
end;

procedure TfrmGruposFiscais.AttachPresenter(APresenter: TGruposFiscaisPresenter;
  const AColumns: TGridColumnDefinitions; const ATitle: string;
  AOperations: IQueryResultOperations = nil);
begin
  if APresenter = nil then
    raise Exception.Create(MissingPresenterMessage);

  // A base recebe apenas o metodo de pesquisa; a tela assume o apresentador
  // transiente so depois da associacao aceita, para nao deixar posse parcial.
  AttachReaderFactory(PesquisarGrupos, AColumns, ATitle, AOperations, False);
  FPresenter := APresenter;
end;

function TfrmGruposFiscais.PesquisarGrupos(
  const ACriteria: TFilterCriteria): IDataSetReader;
begin
  if FPresenter = nil then
    raise Exception.Create(MissingPresenterMessage);

  Result := FPresenter.CriarLeitor(ACriteria);
end;

function TfrmGruposFiscais.CanPesquisar: Boolean;
begin
  // A decisao e as mensagens de indisponibilidade pertencem ao apresentador,
  // que apresenta o feedback na propria tela. Sem apresentador a pesquisa nao
  // prossegue.
  Result := (FPresenter <> nil) and FPresenter.AutorizarPesquisa;
end;

function TfrmGruposFiscais.CriarEditorInclusao(
  AParent: TWinControl): TWinControl;
begin
  // O editor nasce pertencendo a area de rolagem: quando a aba for liberada, a
  // area leva o editor junto e nao existe uma segunda liberacao.
  FEditor := TfrmGrupoFiscalCadastroFrame.Create(AParent);
  Result := FEditor;
end;

function TfrmGruposFiscais.TituloAbaInclusao: string;
begin
  // A aba de inclusao usa o mesmo titulo da janela de inclusao da tela.
  Result := InclusaoTitle;
end;

procedure TfrmGruposFiscais.AoAbrirAbaInclusao;
begin
  // A aba ja esta montada; o rascunho nasce aqui para que HasPendingChanges
  // reflita exatamente o periodo de edicao.
  FEditor.PrepararInclusao(FOpcoesEmpresas);
  FDraft := GrupoFiscalEtd.Create;
end;

procedure TfrmGruposFiscais.AoFecharAbaInclusao;
begin
  // A base libera a aba em seguida: nenhuma referencia pode sobreviver ao
  // editor, e o rascunho pertence ao mesmo escopo da aba.
  FEditor := nil;
  FreeAndNil(FDraft);
  FOpcoesEmpresas := nil;
end;

procedure TfrmGruposFiscais.AoFalharAberturaAbaInclusao;
begin
  // A aba parcial ja foi liberada pela base; limpar apenas o estado proprio
  // evita apontar para o editor destruido.
  FEditor := nil;
  FreeAndNil(FDraft);
  FOpcoesEmpresas := nil;
end;

function TfrmGruposFiscais.SalvarInclusao: Boolean;
begin
  Result := False;
  if (FDraft = nil) or (FEditor = nil) or (FPresenter = nil) then
    Exit;

  // Somente os tres campos da aba sao mapeados; os demais permanecem com os
  // padroes de criacao do rascunho.
  FDraft.Descricao := Trim(FEditor.Descricao);
  FDraft.TipoTributo := FEditor.TipoTributo;
  FDraft.EmpresasId := FEditor.EmpresasSelecionadas;
  FEditor.LimparValidacao;

  if not FPresenter.Salvar(FDraft) then
    Exit;

  // Uma mensagem modal do apresentador pode despachar uma troca de sessao, que
  // encerra a inclusao. Sem rascunho e sem editor nao existe aba a encerrar: a
  // base nao deve receber o pedido de fechamento.
  Result := (FDraft <> nil) and (FEditor <> nil);
end;

procedure TfrmGruposFiscais.ExibirValidacao(
  const AValidacao: ValidationEntityOutput);
begin
  // A inclusao pode ter sido encerrada por uma troca de sessao antes desta
  // chamada: sem editor nao existe aba para exibir o erro.
  if FEditor = nil then
    Exit;

  FEditor.ExibirValidacao(AValidacao);
end;

procedure TfrmGruposFiscais.AvisarSalvamentoSemAtualizacao;
begin
  // A base ja fechou a aba e descartou o rascunho; a mensagem confirma a
  // gravacao e orienta a atualizar a consulta.
  ShowWarning('O grupo fiscal foi salvo. Refaça a pesquisa para atualizar a consulta.',
    'Salvar grupo fiscal');
end;

function TfrmGruposFiscais.HasPendingChanges: Boolean;
begin
  // Qualquer rascunho aberto e pendencia: a inclusao ja contem dados a gravar.
  Result := FDraft <> nil;
end;

procedure TfrmGruposFiscais.FocusView;
begin
  // Com a aba de inclusao ativa, o foco pertence ao primeiro campo invalido (ou
  // a descricao). Nas demais situacoes a base decide.
  if AbaInclusaoAtiva and (FEditor <> nil) then
  begin
    FEditor.FocarPrimeiroCampoInvalido;
    Exit;
  end;

  inherited;
end;

procedure TfrmGruposFiscais.btnNovoClick(Sender: TObject);
var
  Opcoes: TGrupoFiscalEmpresaOptions;
begin
  // Reabrir devolve a aba existente sem repetir autorizacao nem recarregar as
  // empresas: o rascunho ainda pertence a sessao atual.
  if AbaInclusaoAberta then
  begin
    AtivarAbaInclusao;
    Exit;
  end;

  if FPresenter = nil then
  begin
    ShowError(MissingPresenterMessage, InclusaoTitle);
    Exit;
  end;

  // A negativa ou o cancelamento da autorizacao de inclusao ja foi apresentado
  // pelo legado: a tela permanece na consulta sem repetir a mensagem.
  if not FPresenter.AutorizarInclusao then
    Exit;

  // Sem as empresas nao ha o que incluir; o apresentador ja informou a falha.
  if not FPresenter.CarregarEmpresas(Opcoes) then
    Exit;

  FOpcoesEmpresas := Opcoes;
  try
    AbrirAbaInclusao;
  except
    // A base ja liberou a aba parcial e o hook de falha limpou FEditor/FDraft;
    // aqui resta informar a falha ao usuario.
    ShowError('Não foi possível iniciar a inclusão do grupo fiscal.',
      InclusaoTitle);
  end;
end;

function TfrmGruposFiscais.LerLinhaCorrente(out AId, ADescricao: string): Boolean;
var
  DataSet: TDataSet;
  CampoId, CampoDescricao: TField;
begin
  AId := '';
  ADescricao := '';
  Result := False;

  if dsConsulta = nil then
    Exit;

  DataSet := dsConsulta.DataSet;
  if (DataSet = nil) or (not DataSet.Active) or DataSet.IsEmpty then
    Exit;

  // A linha corrente e lida uma unica vez: a identidade identifica o registro a
  // alterar e a descricao identifica a linha na confirmacao e nas mensagens.
  CampoId := DataSet.FindField('ID');
  CampoDescricao := DataSet.FindField('DESCRICAO');
  if (CampoId = nil) or (CampoDescricao = nil) then
    Exit;

  AId := Trim(CampoId.AsString);
  ADescricao := Trim(CampoDescricao.AsString);
  Result := AId <> '';
end;

procedure TfrmGruposFiscais.btnEnviarLixeiraClick(Sender: TObject);
var
  Id, Descricao: string;
begin
  if not LerLinhaCorrente(Id, Descricao) then
  begin
    ShowInformation('Selecione um grupo fiscal na grade.', LixeiraTitle);
    Exit;
  end;

  // O envio para a lixeira retira o grupo da consulta: somente a afirmacao
  // explicita prossegue, e o padrao do dialogo e "Nao".
  if Application.MessageBox(
    PChar(Format('Deseja enviar o grupo fiscal "%s" para a lixeira?',
      [Descricao])), PChar(LixeiraTitle),
    MB_YESNO or MB_ICONWARNING or MB_DEFBUTTON2) <> IDYES then
    Exit;

  btnEnviarLixeira.Enabled := False;
  try
    if FPresenter = nil then
      ShowError(MissingPresenterMessage, LixeiraTitle)
    else
    begin
      // O apresentador interpreta a autorizacao e apresenta a mensagem
      // correspondente; False interrompe sem repetir o que o legado mostrou.
      if not FPresenter.EnviarParaLixeira(Id) then
        Exit;

      // A grade atualizada e a confirmacao do envio; nao ha dialogo de sucesso.
      if not RepetirPesquisa then
        ShowWarning('O grupo fiscal já foi enviado para a lixeira. Refaça a pesquisa para atualizar a consulta.',
          LixeiraTitle);
    end;
  finally
    btnEnviarLixeira.Enabled := True;
  end;
end;

end.
