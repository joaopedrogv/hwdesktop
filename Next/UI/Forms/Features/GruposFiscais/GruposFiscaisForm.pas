unit GruposFiscaisForm;

interface

uses
  Winapi.Windows, System.SysUtils, Data.DB, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, QueryResultForm, FilterCriterion,
  IDataSetReaderUnit, GridColumnDefinition, GruposFiscaisPresenter,
  QueryResultOperations, GrupoFiscalCadastro, GrupoFiscalEtdUnit,
  TipoTributoFiscalEnumUnit, GrupoFiscalCadastroFrame;

type
  // Tela de consulta e inclusao de Grupos Fiscais. Herda a apresentacao
  // generica e acrescenta a consulta, o envio da linha corrente para a lixeira
  // e a inclusao em uma aba propria. O apresentador e o leitor sao injetados
  // pela composicao; o rascunho da inclusao pertence a esta tela.
  TfrmGruposFiscais = class(TfrmQueryResult)
    pcAbas: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    sbCadastro: TScrollBox;
    fraCadastro: TfrmGrupoFiscalCadastroFrame;
    pnAcoesCadastro: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnEnviarLixeira: TButton;
    pnComandosConsulta: TPanel;
    btnNovo: TButton;
    procedure btnEnviarLixeiraClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FPresenter: TGruposFiscaisPresenter;
    // Rascunho da inclusao corrente. A existencia do objeto e a pendencia: na
    // inclusao nao existe estado aberto sem alteracao a gravar, porque as
    // empresas permitidas ja iniciam marcadas.
    FDraft: GrupoFiscalEtd;
    FAbasPreparadas: Boolean;
    function LerLinhaCorrente(out AId, ADescricao: string): Boolean;
    function PesquisarGrupos(
      const ACriteria: TFilterCriteria): IDataSetReader;
    // Move os frames herdados para a aba de consulta e revela o page control.
    // Executado uma unica vez, na primeira apresentacao da instancia.
    procedure PrepararAbas;
    procedure DescartarRascunho;
    procedure AtualizarComandos;
  protected
    function CanPesquisar: Boolean; override;
    procedure DoInitializeView; override;
  public
    destructor Destroy; override;
    function HasPendingChanges: Boolean; override;
    procedure ResetForSessionChange; override;
    procedure FocusView; override;
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
  SemRegistroMessage = 'Selecione um grupo fiscal na grade.';
  ConfirmacaoMessage =
    'Deseja enviar o grupo fiscal "%s" para a lixeira?';
  AtualizacaoFalhouMessage =
    'O grupo fiscal j'#225' foi enviado para a lixeira. Refa'#231'a a pesquisa para' +
    ' atualizar a consulta.';
  FalhaMessage =
    'N'#227'o foi poss'#237'vel enviar o grupo fiscal para a lixeira.';
  InclusaoTitle = 'Novo grupo fiscal';
  SalvarTitle = 'Salvar grupo fiscal';
  NovaInclusaoFalhaMessage =
    'N'#227'o foi poss'#237'vel iniciar a inclus'#227'o do grupo fiscal.';
  GrupoSalvoAtualizacaoFalhouMessage =
    'O grupo fiscal foi salvo. Refa'#231'a a pesquisa para atualizar a consulta.';
  SalvarFalhaMessage =
    'N'#227'o foi poss'#237'vel salvar o grupo fiscal.';

destructor TfrmGruposFiscais.Destroy;
begin
  try
    // Nenhum controle e tocado na destruicao: apenas a posse dos objetos
    // transientes desta tela e liberada.
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
  // A decisao e as mensagens de indisponibilidade pertencem ao apresentador, que
  // recebe esta tela como feedback. Sem apresentador a pesquisa nao prossegue.
  Result := (FPresenter <> nil) and FPresenter.AutorizarPesquisa(Self);
end;

procedure TfrmGruposFiscais.PrepararAbas;
begin
  if FAbasPreparadas then
    Exit;

  // Os frames herdados passam a viver na aba de consulta. Reparentar preserva
  // as instancias, os eventos, o DataSource e o leiaute de colunas ja
  // configurados; recriar os frames duplicaria filtros e grade.
  pnFiltros.Parent := tsConsulta;
  fraGrid.Parent := tsConsulta;
  pnFiltros.Align := alTop;
  fraGrid.Align := alClient;
  pcAbas.Align := alClient;
  pcAbas.Visible := True;

  // A aba de cadastro so aparece depois de uma inclusao autorizada com as
  // empresas carregadas; ate entao a tela apresenta apenas a consulta.
  tsCadastro.TabVisible := False;
  pcAbas.ActivePage := tsConsulta;

  FAbasPreparadas := True;
end;

procedure TfrmGruposFiscais.DoInitializeView;
begin
  // As abas sao preparadas antes da inicializacao da base: o posicionamento de
  // btnEnviarLixeira e o calculo da largura minima usam a geometria final.
  PrepararAbas;
  inherited;
  // O botao de envio para a lixeira fica a esquerda do Pesquisar, com a mesma
  // ancora direita. ConfigureFilters (chamado pela composicao antes desta
  // inicializacao) ja reposicionou btnPesquisar a 16 px da borda direita.
  btnEnviarLixeira.Anchors := [akTop, akRight];
  btnEnviarLixeira.Top := btnPesquisar.Top;
  btnEnviarLixeira.Left := btnPesquisar.Left - btnEnviarLixeira.Width - 8;
  Constraints.MinWidth := btnEnviarLixeira.Left +
    btnEnviarLixeira.Width + 8 + btnPesquisar.Width + 16;
end;

function TfrmGruposFiscais.HasPendingChanges: Boolean;
begin
  // Qualquer rascunho aberto e pendencia: a inclusao ja contem dados a gravar.
  Result := FDraft <> nil;
end;

procedure TfrmGruposFiscais.ResetForSessionChange;
begin
  // O rascunho pertence ao usuario anterior: descartar antes da limpeza do
  // resultado evita reabrir a inclusao com as empresas de outra sessao. O foco
  // nao e definido aqui porque a janela pode estar oculta.
  DescartarRascunho;
  inherited;
end;

procedure TfrmGruposFiscais.FocusView;
begin
  // Com a aba de cadastro ativa, o foco pertence ao primeiro campo invalido (ou
  // a descricao). Nas demais situacoes a base decide.
  if pcAbas.ActivePage = tsCadastro then
  begin
    fraCadastro.FocarPrimeiroCampoInvalido;
    Exit;
  end;

  inherited;
end;

procedure TfrmGruposFiscais.AtualizarComandos;
var
  EmInclusao: Boolean;
begin
  // Sem rascunho apenas o Novo esta disponivel; com rascunho, a tela oferece a
  // gravacao e o cancelamento e impede substituir a inclusao corrente.
  EmInclusao := FDraft <> nil;
  btnNovo.Enabled := not EmInclusao;
  btnSalvar.Enabled := EmInclusao;
  btnCancelar.Enabled := EmInclusao;
end;

procedure TfrmGruposFiscais.DescartarRascunho;
begin
  FreeAndNil(FDraft);

  // A consulta volta a ser a unica aba visivel. Os valores dos campos
  // permanecem na aba oculta e sao reiniciados na proxima inclusao.
  pcAbas.ActivePage := tsConsulta;
  tsCadastro.TabVisible := False;
  fraCadastro.LimparValidacao;
  AtualizarComandos;
end;

procedure TfrmGruposFiscais.btnNovoClick(Sender: TObject);
var
  Opcoes: TGrupoFiscalEmpresaOptions;
begin
  btnNovo.Enabled := False;
  try
    if FPresenter = nil then
    begin
      ShowError(MissingPresenterMessage, InclusaoTitle);
      Exit;
    end;

    // A negativa ou o cancelamento da autorizacao de inclusao ja foi
    // apresentado pelo legado: a tela permanece na consulta sem repetir a
    // mensagem.
    if not FPresenter.AutorizarInclusao(Self) then
      Exit;

    // Sem as empresas nao ha o que incluir; o apresentador ja informou a falha.
    if not FPresenter.CarregarEmpresas(Self, Opcoes) then
      Exit;

    try
      DescartarRascunho;
      FDraft := GrupoFiscalEtd.Create;
      fraCadastro.PrepararInclusao(Opcoes);

      // A aba so aparece depois da autorizacao e das empresas carregadas; ao
      // ativar depois de torna-la visivel nenhuma aba invisivel e ativada.
      tsCadastro.TabVisible := True;
      pcAbas.ActivePage := tsCadastro;
      fraCadastro.FocarPrimeiroCampoInvalido;
    except
      // Uma falha inesperada nao pode deixar meia inclusao aberta: o descarte
      // devolve a tela a consulta antes do aviso.
      DescartarRascunho;
      ShowError(NovaInclusaoFalhaMessage, InclusaoTitle);
    end;
  finally
    AtualizarComandos;
  end;
end;

procedure TfrmGruposFiscais.btnSalvarClick(Sender: TObject);
var
  Resultado: TGrupoFiscalSaveResult;
begin
  if FDraft = nil then
    Exit;

  // Somente os tres campos da aba sao mapeados; os demais permanecem com os
  // padroes de criacao do rascunho.
  FDraft.Descricao := Trim(fraCadastro.Descricao);
  FDraft.TipoTributo := fraCadastro.TipoTributo;
  FDraft.EmpresasId := fraCadastro.EmpresasSelecionadas;

  fraCadastro.LimparValidacao;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  try
    try
      Resultado := FPresenter.Salvar(FDraft, Self);
    except
      // O apresentador traduz as falhas esperadas; este resguardo impede que
      // uma excecao inesperada atravesse o manipulador de evento.
      ShowError(SalvarFalhaMessage, SalvarTitle);
      Exit;
    end;

    case Resultado.Outcome of
      gfsoValidacao:
        begin
          // A mensagem junto ao campo substitui o dialogo de validacao.
          fraCadastro.ExibirValidacao(Resultado.Erros);
          fraCadastro.FocarPrimeiroCampoInvalido;
        end;
      gfsoSalvo:
        begin
          // A grade atualizada e a confirmacao da gravacao; nao ha dialogo de
          // sucesso. Uma falha apenas da reconsulta informa que o grupo foi
          // salvo e orienta refazer a pesquisa.
          DescartarRascunho;
          if not RepetirPesquisa then
            ShowWarning(GrupoSalvoAtualizacaoFalhouMessage, SalvarTitle);
        end;
      // gfsoNegado, gfsoIndisponivel e gfsoFalha mantem o rascunho e a aba: a
      // mensagem, quando existe, ja foi apresentada pelo apresentador.
    end;
  finally
    AtualizarComandos;
  end;
end;

procedure TfrmGruposFiscais.btnCancelarClick(Sender: TObject);
begin
  // A inclusao e um registro novo nao gravado: descartar nao pede confirmacao,
  // como no cadastro legado.
  DescartarRascunho;
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
    ShowInformation(SemRegistroMessage, LixeiraTitle);
    Exit;
  end;

  // O envio para a lixeira retira o grupo da consulta: somente a afirmacao
  // explicita prossegue, e o padrao do dialogo e "Nao".
  if Application.MessageBox(PChar(Format(ConfirmacaoMessage, [Descricao])),
    PChar(LixeiraTitle),
    MB_YESNO or MB_ICONWARNING or MB_DEFBUTTON2) <> IDYES then
    Exit;

  btnEnviarLixeira.Enabled := False;
  try
    if FPresenter = nil then
      ShowError(MissingPresenterMessage, LixeiraTitle)
    else
    begin
      try
        // O apresentador interpreta a autorizacao e apresenta a mensagem
        // correspondente; False interrompe sem repetir o que o legado mostrou.
        if not FPresenter.EnviarParaLixeira(Id, Self) then
          Exit;
      except
        // O apresentador traduz as falhas esperadas; este resguardo impede que
        // uma excecao inesperada atravesse o manipulador de evento.
        ShowError(FalhaMessage, LixeiraTitle);
        Exit;
      end;

      // A grade atualizada e a confirmacao do envio; nao ha dialogo de sucesso.
      if not RepetirPesquisa then
        ShowWarning(AtualizacaoFalhouMessage, LixeiraTitle);
    end;
  finally
    btnEnviarLixeira.Enabled := True;
  end;
end;

end.
