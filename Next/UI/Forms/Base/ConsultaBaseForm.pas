unit ConsultaBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  System.Generics.Collections, Data.DB,
  Vcl.Controls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Forms, Vcl.StdCtrls, Vcl.Buttons,
  NextBaseForm,
  DataGridFrame, FilterDefinition, FilterCriterion, FilterFrame,
  GridColumnDefinition, IDataSetReaderUnit, QueryResultOperations,
  NextQueryDefinition, ColumnLayoutPreferences, LocalPreferences;

type
  // Fabrica de leitores para consultas que montam o SQL a partir dos criterios
  // coletados. A forma de criar o leitor permanece na composicao.
  TConsultaReaderFactory = reference to function(
    const ACriteria: TFilterCriteria): IDataSetReader;

  // Intencao registrada no clique: somente a gravacao confirmada reconsulta a
  // grade depois de liberar a inclusao. ifaNenhuma e o valor inicial do form.
  TIntencaoFechamentoAbaInclusao = (ifaNenhuma, ifaSalvar, ifaCancelar);

  // Intencao da aba de edicao. Cada aba guarda a propria: um comando aceito em
  // uma aba nunca encerra nem grava o rascunho de outra.
  TIntencaoFechamentoAbaEdicao = (ifcNenhuma, ifcSalvar, ifcCancelar);

const
  // Mensagem privada da base: o comando da aba e concluido depois que o evento
  // de clique retorna, quando liberar a aba nao destroi mais o controle em uso.
  WM_COMANDO_ABA_INCLUSAO = WM_APP + 311;
  // Mensagem equivalente da aba de edicao: o token viaja em WParam e identifica
  // a montagem que registrou o pedido.
  WM_COMANDO_ABA_EDICAO = WM_APP + 312;

type
  // Descritor de uma aba de edicao aberta pela base. O objeto pertence a lista
  // da base e nao possui a aba nem o editor: ambos pertencem ao PageControl, que
  // os libera quando a aba e fechada. O token identifica a montagem corrente,
  // porque um pedido de fechamento pode ser tratado depois do encerramento.
  TAbaEdicao = class
  public
    Chave: string;
    Aba: TTabSheet;
    Rodape: TPanel;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    Editor: TWinControl;
    Token: Integer;
    Intencao: TIntencaoFechamentoAbaEdicao;
  end;

  // Base unica das consultas Next. Recebe o leitor (ou a fabrica), apresenta o
  // resultado na grade e oferece a aba Consulta com filtros, Pesquisar e Sair.
  // Cada inclusao autorizada pela funcionalidade abre uma aba propria e cada
  // registro escolhido para alteracao abre outra, com rodape, area de rolagem e
  // editor sob posse da base.
  TfrmConsultaBase = class(TfrmNextBase)
    pcAbas: TPageControl;
    tsConsulta: TTabSheet;
    pnFiltros: TPanel;
    fraFiltros: TfrmFilterFrame;
    btnPesquisar: TBitBtn;
    btnSair: TBitBtn;
    pnAcoesConsulta: TPanel;
    fraGrid: TfrmDataGridFrame;
    dsConsulta: TDataSource;
    procedure btnSairClick(Sender: TObject);
  private
    FFiltersConfigured: Boolean;
    FFilterDefinition: TFilterDefinition;
    FReader: IDataSetReader;
    FReaderFactory: TConsultaReaderFactory;
    FDefinition: INextQueryDefinitionBase;
    FColumns: TGridColumnDefinitions;
    FOperations: IQueryResultOperations;
    FTitle: string;
    FQuickFilterEnabled: Boolean;
    FPesquisando: Boolean;
    // Aba de inclusao corrente e controles que nascem com ela. Todos ficam
    // nulos assim que a aba e liberada, inclusive antes de qualquer uso tardio.
    FAbaInclusao: TTabSheet;
    FRodapeInclusao: TPanel;
    FBtnSalvarInclusao: TButton;
    FBtnCancelarInclusao: TButton;
    // Pedido de fechamento: a intencao diz se ha reconsulta; o token identifica
    // a aba sem guardar o endereco de um objeto cuja vida nao pode ser verificada.
    FIntencaoFechamentoAba: TIntencaoFechamentoAbaInclusao;
    FTokenPedidoAba: Integer;
    FTokenAbaInclusao: Integer;
    // Abas de edicao abertas, uma por chave de registro. A lista nasce no
    // primeiro uso e e liberada na destruicao; os descritores nao possuem abas
    // nem editores.
    FAbasEdicao: TObjectList<TAbaEdicao>;
    FTokenAbaEdicao: Integer;
    procedure ClearResult;
    procedure DoPesquisar(Sender: TObject);
    function Pesquisar(const AExibirFalha: Boolean): Boolean;
    procedure GridTitleCtrlClick(Sender: TObject; const AFieldName: string);
    procedure FrameFeedback(Sender: TObject;
      const AMensagem: string);
    procedure PosicionarBotoesPesquisa;
    function GetAbaInclusaoAberta: Boolean;
    function GetAbaInclusaoAtiva: Boolean;
    function GetFechamentoAbaPendente: Boolean;
    function AbaDoControle(AControle: TControl): TTabSheet;
    function ComandoDaAbaInclusao(AOrigem: TObject): Boolean;
    procedure DefinirComandosHabilitados(AHabilitado: Boolean);
    procedure AtualizarComandosAbaInclusao;
    procedure btnSalvarAbaInclusaoClick(Sender: TObject);
    procedure btnCancelarAbaInclusaoClick(Sender: TObject);
    procedure SolicitarFechamentoAbaInclusao(
      AIntencao: TIntencaoFechamentoAbaInclusao);
    procedure TratarPedidoFechamentoAbaInclusao;
    procedure LimparPedidoFechamentoAbaInclusao;
    procedure AtualizarAposSalvar;
    procedure WMCmdAbaInclusao(var AMessage: TMessage);
      message WM_COMANDO_ABA_INCLUSAO;
    function ListaAbasEdicao: TObjectList<TAbaEdicao>;
    function IndiceAbaEdicao(const AChave: string): Integer;
    function AbaEdicaoRegistrada(AAba: TAbaEdicao): Boolean;
    function AbaEdicaoDoControle(AOrigem: TObject): TAbaEdicao;
    function AbaEdicaoPorToken(AToken: Integer): TAbaEdicao;
    function GetAbaEdicaoAberta(const AChave: string): Boolean;
    function GetAbaEdicaoAtiva(const AChave: string): Boolean;
    function GetHaAbaEdicaoAtiva: Boolean;
    function GetChaveAbaEdicaoAtiva: string;
    procedure DefinirComandosAbaEdicao(AAba: TAbaEdicao;
      AHabilitado: Boolean);
    procedure btnSalvarAbaEdicaoClick(Sender: TObject);
    procedure btnCancelarAbaEdicaoClick(Sender: TObject);
    procedure SolicitarFechamentoAbaEdicao(AAba: TAbaEdicao;
      AIntencao: TIntencaoFechamentoAbaEdicao);
    procedure TratarPedidoFechamentoAbaEdicao(AToken: Integer);
    procedure WMCmdAbaEdicao(var AMessage: TMessage);
      message WM_COMANDO_ABA_EDICAO;
    property FechamentoAbaPendente: Boolean read GetFechamentoAbaPendente;
  protected
    // Permite que a tela filha interrompa a pesquisa antes de limpar o
    // resultado ou criar um novo leitor. A validacao dos filtros ocorre antes.
    function CanPesquisar: Boolean; virtual;
    function CollectFilters: TFilterCriteriaResult;
    // Repete a pesquisa atual pela mesma sequencia de filtros, autorizacao e
    // leitura, sem o dialogo generico da falha. Retorna True quando a grade
    // reflete a consulta, incluindo resultado vazio. Destina-se as telas que
    // alteram dados e precisam atualizar o resultado com mensagem propria.
    function RepetirPesquisa: Boolean;
    procedure DoInitializeView; override;
    // Cria o editor com Owner = AParent e devolve o controle. A base define
    // Parent e Align; a area de rolagem libera o editor e o descendente nao o
    // libera.
    function CriarEditorInclusao(AParent: TWinControl): TWinControl; virtual;
    function TituloAbaInclusao: string; virtual;
    // Chamado com aba, rodape e editor ja montados: e o ponto em que o
    // rascunho da funcionalidade nasce.
    procedure AoAbrirAbaInclusao; virtual;
    // Chamado antes de a base liberar a aba: solta referencias e descarta o
    // rascunho enquanto o editor ainda existe.
    procedure AoFecharAbaInclusao; virtual;
    // Chamado depois de a base liberar a aba parcial: somente limpa estado
    // proprio, sem tocar em controle ja destruido.
    procedure AoFalharAberturaAbaInclusao; virtual;
    // True quando a gravacao foi confirmada e a inclusao pode ser encerrada;
    // a base registra o fechamento diferido e reconsulta depois do clique.
    function SalvarInclusao: Boolean; virtual;
    // Aviso de gravacao confirmada cuja reconsulta falhou. O descendente
    // fornece a mensagem de negocio; a base chama depois de fechar a aba.
    procedure AvisarSalvamentoSemAtualizacao; virtual;
    // Uma aba de inclusao por janela: reabrir apenas devolve a aba existente,
    // preservando o digitado e sem repetir autorizacao.
    function AbrirAbaInclusao: Boolean;
    procedure FecharAbaInclusao;
    procedure AtivarAbaInclusao;
    property AbaInclusaoAberta: Boolean read GetAbaInclusaoAberta;
    property AbaInclusaoAtiva: Boolean read GetAbaInclusaoAtiva;

    // Abas de edicao: uma por registro identificado por AChave, em paralelo a
    // aba de inclusao. Reabrir a mesma chave apenas ativa a aba existente,
    // preservando o digitado.
    function AbrirAbaEdicao(const AChave, ATitulo: string): Boolean;
    procedure AtivarAbaEdicao(const AChave: string);
    procedure FecharAbaEdicao(const AChave: string);
    procedure FecharAbasEdicao;
    property AbaEdicaoAberta[const AChave: string]: Boolean
      read GetAbaEdicaoAberta;
    property AbaEdicaoAtiva[const AChave: string]: Boolean
      read GetAbaEdicaoAtiva;
    property HaAbaEdicaoAtiva: Boolean read GetHaAbaEdicaoAtiva;
    property ChaveAbaEdicaoAtiva: string read GetChaveAbaEdicaoAtiva;
    // Cria o editor com Owner = AParent e devolve o controle. A base define
    // Parent e Align; a area de rolagem libera o editor e o descendente nao o
    // libera.
    function CriarEditorEdicao(AParent: TWinControl;
      const AChave: string): TWinControl; virtual;
    // Chamado com aba, rodape e editor ja montados, antes de a aba ser ativada.
    procedure AoAbrirAbaEdicao(const AChave: string;
      AEditor: TWinControl); virtual;
    // Chamado antes de a base liberar a aba: solta referencias e descarta o
    // rascunho enquanto o editor ainda existe.
    procedure AoFecharAbaEdicao(const AChave: string;
      AEditor: TWinControl); virtual;
    // Chamado depois de a base liberar a aba parcial: somente limpa estado
    // proprio, sem tocar em controle ja destruido.
    procedure AoFalharAberturaAbaEdicao(const AChave: string); virtual;
    // True quando a gravacao foi confirmada e a aba de edicao pode ser
    // encerrada; a base registra o fechamento diferido e reconsulta depois do
    // clique.
    function SalvarEdicao(const AChave: string;
      AEditor: TWinControl): Boolean; virtual;
  public
    destructor Destroy; override;
    procedure ResetForSessionChange; override;
    procedure Attach(const AReader: IDataSetReader;
      const AColumns: TGridColumnDefinitions; const ATitle: string;
      AOperations: IQueryResultOperations = nil;
      AQuickFilterEnabled: Boolean = False); overload;
    // Recebe a definicao completa da consulta: colunas e operacoes vem dela e o
    // ciclo do leitor pertence a propria definicao.
    procedure Attach(const ADefinition: INextQueryDefinitionBase;
      const ATitle: string; AQuickFilterEnabled: Boolean = False); overload;
    procedure AttachReaderFactory(const AFactory: TConsultaReaderFactory;
      const AColumns: TGridColumnDefinitions; const ATitle: string;
      AOperations: IQueryResultOperations = nil;
      AQuickFilterEnabled: Boolean = False);
    // A grade le e aplica o layout; a tela nao conhece banco nem sessao.
    procedure AttachColumnLayout(const APreferences: IColumnLayoutPreferences);
    // Recebe a definicao, as preferencias locais e a identidade estavel da tela.
    // Configura a instancia inline de fraFiltros somente quando chamado; telas
    // sem filtros mantem o frame oculto e pesquisam sem criterios.
    procedure ConfigureFilters(const ADefinition: TFilterDefinition;
      const APreferences: ILocalPreferences; const AIdentity: string);
  end;

implementation

{$R *.dfm}

const
  FiltersAlreadyConfiguredMessage =
    'Os filtros desta tela já foram configurados.';
  MissingPreferencesMessage =
    'As preferências locais dos filtros não foram informadas.';
  MissingIdentityMessage = 'A identidade dos filtros não foi informada.';
  FiltersNotConfiguredMessage =
    'Os filtros desta tela ainda não foram configurados.';
  MissingReaderMessage = 'O leitor de dados da consulta nao foi informado.';
  MissingDefinitionMessage =
    'A definicao da consulta nao foi informada.';
  MissingReaderFactoryMessage =
    'A fabrica de leitores da consulta nao foi informada.';
  MissingTitleMessage = 'O titulo da consulta nao foi informado.';
  AlreadyAttachedMessage =
    'O leitor de dados da consulta ja foi associado a esta tela.';
  MissingDependencyMessage =
    'A tela de consulta nao recebeu seu leitor de dados.';
  MissingColumnLayoutPreferencesMessage =
    'As preferencias de colunas nao foram informadas.';
  EmptyResultMessage =
    'Nenhum registro foi encontrado para a consulta de %s.';
  FailureMessage = 'Nao foi possivel consultar os dados de %s.';
  InvalidFilterTitle = 'Filtro invalido';
  EmptyResultTitle = 'Consulta sem resultados';
  QueryFailureTitle = 'Falha na consulta';
  EditorNaoInformadoMessage =
    'A aba de inclusão não recebeu seu editor.';
  SalvamentoSemAtualizacaoMessage =
    'O registro foi salvo. Repita a pesquisa para atualizar a consulta.';
  EditorEdicaoNaoInformadoMessage =
    'A aba de edição não recebeu seu editor.';
  ChaveAbaEdicaoNaoInformadaMessage =
    'A chave da aba de edição não foi informada.';

procedure TfrmConsultaBase.ConfigureFilters(
  const ADefinition: TFilterDefinition;
  const APreferences: ILocalPreferences; const AIdentity: string);
begin
  if FFiltersConfigured then
    raise Exception.Create(FiltersAlreadyConfiguredMessage);

  if APreferences = nil then
    raise Exception.Create(MissingPreferencesMessage);

  if Trim(AIdentity) = '' then
    raise Exception.Create(MissingIdentityMessage);

  // O frame ja faz parte do formulario (inline no DFM). A configuracao apenas
  // injeta a definicao e as preferencias na instancia existente, sem criar ou
  // liberar o frame: a tela e a proprietaria. Posicao dos botoes e largura
  // minima pertencem a inicializacao, nao a esta chamada da composicao.
  fraFiltros.Configure(ADefinition, APreferences, AIdentity, fpQuerySql);
  FFilterDefinition := ADefinition;
  FFiltersConfigured := True;

  // Os filtros ficam disponiveis assim que configurados; a pesquisa so e
  // habilitada quando a tela recebe leitor ou fabrica na inicializacao.
  fraFiltros.Visible := True;
end;

function TfrmConsultaBase.CollectFilters: TFilterCriteriaResult;
begin
  if not FFiltersConfigured then
    raise Exception.Create(FiltersNotConfiguredMessage);

  Result := fraFiltros.CollectCriteria;
end;

procedure TfrmConsultaBase.GridTitleCtrlClick(Sender: TObject;
  const AFieldName: string);
begin
  // O atalho apenas prepara o editor de pesquisa. Sem filtros configurados, o
  // gesto nao altera a ordem nem o resultado ja carregado.
  if FFiltersConfigured then
    fraFiltros.TrySelectField(AFieldName);
end;

procedure TfrmConsultaBase.FrameFeedback(Sender: TObject;
  const AMensagem: string);
begin
  // O host apresenta o feedback dos frames reutilizaveis, que nao criam
  // dialogo proprio.
  ShowWarning(AMensagem);
end;

procedure TfrmConsultaBase.ClearResult;
begin
  // Cada pesquisa comeca sem criterios rapidos e sem a ordenacao do resultado
  // anterior; ambos pertencem ao conjunto que sera substituido.
  fraGrid.ClearSorting();
  fraGrid.ClearQuickFilters();

  // Desvincular antes de limpar impede que a grade retenha um dataset liberado.
  dsConsulta.DataSet := nil;
  if FDefinition <> nil then
    FDefinition.Limpar
  else if FReader <> nil then
  begin
    FReader.Limpar;
    if Assigned(FReaderFactory) then
      FReader := nil;
  end;

  // Nenhuma operacao pode alcancar a linha anterior depois da limpeza.
  if FOperations <> nil then
    FOperations.SetReader(nil);
end;

function TfrmConsultaBase.Pesquisar(const AExibirFalha: Boolean): Boolean;
var
  Collected: TFilterCriteriaResult;
  Criteria: TFilterCriteria;
  NewReader: IDataSetReader;
  DataSet: TDataSet;
begin
  // Segunda barreira contra composicao incompleta: sem leitor, fabrica ou
  // definicao nenhuma instrucao SQL e executada e o resultado anterior nao e
  // alterado.
  if (FReader = nil) and (not Assigned(FReaderFactory)) and
    (FDefinition = nil) then
    raise Exception.Create(MissingDependencyMessage);

  Result := False;
  if FPesquisando then
    Exit;
  FPesquisando := True;
  btnPesquisar.Enabled := False;
  try
    Criteria := nil;
    if FFiltersConfigured then
    begin
      Collected := CollectFilters;
      if Collected.Status = fcsInvalid then
      begin
        ShowWarning(Collected.ValidationMessage);
        Exit;
      end;

      if Collected.Status = fcsValidCriteria then
        Criteria := Collected.Criteria;
    end;

    if not CanPesquisar then
      Exit;

    ClearResult;
    try
      if Assigned(FReaderFactory) then
      begin
        NewReader := FReaderFactory(Criteria);
        if NewReader = nil then
          raise Exception.Create(MissingReaderMessage);
        FReader := NewReader;
        NewReader := nil;
      end;

      if FDefinition <> nil then
        FDefinition.Pesquisar(Criteria)
      else
        FReader.Pesquisar;

      if FDefinition <> nil then
        DataSet := FDefinition.GetDataSet
      else
        DataSet := FReader.DataSet;

      if DataSet = nil then
        raise Exception.Create(MissingReaderMessage);
      dsConsulta.DataSet := DataSet;

      // A sequencia terminou e a grade reflete a consulta; resultado vazio
      // tambem conclui a pesquisa.
      Result := True;
      if DataSet.IsEmpty then
      begin
        ClearResult;
        ShowInformation(Format(EmptyResultMessage, [FTitle]));
      end;
    except
      Result := False;
      ClearResult;
      // A falha generica pertence ao botao; a repeticao programatica deixa a
      // mensagem especifica para o chamador.
      if AExibirFalha then
        ShowError(Format(FailureMessage, [FTitle]));
    end;
  finally
    FPesquisando := False;
    btnPesquisar.Enabled := True;
  end;
end;

procedure TfrmConsultaBase.DoPesquisar(Sender: TObject);
begin
  Pesquisar(True);
end;

function TfrmConsultaBase.RepetirPesquisa: Boolean;
begin
  Result := Pesquisar(False);
end;

procedure TfrmConsultaBase.Attach(const AReader: IDataSetReader;
  const AColumns: TGridColumnDefinitions; const ATitle: string;
  AOperations: IQueryResultOperations = nil;
  AQuickFilterEnabled: Boolean = False);
begin
  if AReader = nil then
    raise Exception.Create(MissingReaderMessage);
  if Trim(ATitle) = '' then
    raise Exception.Create(MissingTitleMessage);
  if (FReader <> nil) or Assigned(FReaderFactory) or (FDefinition <> nil) then
    raise Exception.Create(AlreadyAttachedMessage);

  // A propriedade do leitor passa para a tela somente depois de todas as
  // verificacoes; nenhuma falha ocorre a partir daqui.
  FReader := AReader;
  FColumns := AColumns;
  FTitle := ATitle;
  FOperations := AOperations;
  FQuickFilterEnabled := AQuickFilterEnabled;

  fraGrid.Configure(AOperations, FQuickFilterEnabled);
end;

procedure TfrmConsultaBase.Attach(const ADefinition: INextQueryDefinitionBase;
  const ATitle: string; AQuickFilterEnabled: Boolean = False);
begin
  if ADefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);
  if Trim(ATitle) = '' then
    raise Exception.Create(MissingTitleMessage);
  if (FReader <> nil) or Assigned(FReaderFactory) or (FDefinition <> nil) then
    raise Exception.Create(AlreadyAttachedMessage);

  // Colunas e operacoes pertencem a definicao; a base apenas as apresenta. O
  // ciclo do leitor permanece na definicao e a grade recebe a instancia das
  // operacoes para ordenacao, marcacao e filtros rapidos.
  FDefinition := ADefinition;
  FColumns := ADefinition.ColumnsDef;
  FTitle := ATitle;
  FOperations := ADefinition.GetResultOperation();
  FQuickFilterEnabled := AQuickFilterEnabled;

  fraGrid.Configure(FOperations, FQuickFilterEnabled);
end;

procedure TfrmConsultaBase.AttachReaderFactory(
  const AFactory: TConsultaReaderFactory;
  const AColumns: TGridColumnDefinitions; const ATitle: string;
  AOperations: IQueryResultOperations = nil;
  AQuickFilterEnabled: Boolean = False);
begin
  if not Assigned(AFactory) then
    raise Exception.Create(MissingReaderFactoryMessage);
  if Trim(ATitle) = '' then
    raise Exception.Create(MissingTitleMessage);
  if (FReader <> nil) or Assigned(FReaderFactory) or (FDefinition <> nil) then
    raise Exception.Create(AlreadyAttachedMessage);

  // A consulta cria um novo leitor a cada pesquisa; nenhum leitor e recebido
  // nesta associacao. Sem coluna de marcacao nas operacoes recebidas, os
  // comandos de selecao ficam desabilitados. O filtro rapido tambem depende das
  // operacoes; nesta fatia a opcao permanece desabilitada quando elas nao
  // existem.
  FReaderFactory := AFactory;
  FColumns := AColumns;
  FTitle := ATitle;
  FOperations := AOperations;
  FQuickFilterEnabled := AQuickFilterEnabled;

  fraGrid.Configure(AOperations, FQuickFilterEnabled);
end;

procedure TfrmConsultaBase.AttachColumnLayout(
  const APreferences: IColumnLayoutPreferences);
begin
  if APreferences = nil then
    raise Exception.Create(MissingColumnLayoutPreferencesMessage);

  fraGrid.AttachColumnLayout(APreferences);
end;

procedure TfrmConsultaBase.PosicionarBotoesPesquisa;
begin
  // Sair ocupa a borda direita e Pesquisar fica imediatamente a esquerda, com
  // intervalo fixo. As ancoras preservam as duas distancias no redimensionamento
  // posterior, quando o frame de filtros ja nao e tocado.

  btnPesquisar.Align := alNone;
  btnPesquisar.Anchors := [akTop, akLeft];
  // Vou mudar para acompanha o fraFiltros, Pesquisar, sair
  // btnPesquisar.Left := fraFiltros.Left - btnPesquisar.Width - 8;
  btnPesquisar.Left := btnSair.Left - btnPesquisar.Width - 8;

  btnSair.Align := alNone;
  btnSair.Anchors := [akTop, akRight];
  btnSair.Left := pnFiltros.ClientWidth - btnSair.Width - 16;

  // A largura minima impede que os botoes invadam os filtros a esquerda.
  Constraints.MinWidth := btnPesquisar.Left + btnPesquisar.Width + 8 +
    btnSair.Width + 16;
end;

procedure TfrmConsultaBase.DoInitializeView;
begin
  Caption := Format('Consulta - Next %d', [InstanceNumber]);
  fraGrid.DataSource := dsConsulta;
  fraGrid.OnTitleCtrlClick := GridTitleCtrlClick;
  fraGrid.OnFeedback := FrameFeedback;
  fraFiltros.OnFeedback := FrameFeedback;

  // Sem leitor, fabrica ou definicao nao existe consulta a apresentar: a falha
  // de composicao aparece na abertura da view, antes de a tela parecer
  // operavel.
  if (FReader = nil) and (not Assigned(FReaderFactory)) and
    (FDefinition = nil) then
    raise Exception.Create(MissingDependencyMessage);

  PosicionarBotoesPesquisa;
  // A faixa so aparece quando a funcionalidade acrescentou comandos no DFM.
  pnAcoesConsulta.Visible := pnAcoesConsulta.ControlCount > 0;
  fraFiltros.Visible := FFiltersConfigured;
  btnPesquisar.Enabled := True;
  btnPesquisar.OnClick := DoPesquisar;
  if FTitle <> '' then
    Caption := FTitle;
  fraGrid.ConfigureColumns(FColumns);
end;

function TfrmConsultaBase.CanPesquisar: Boolean;
begin
  Result := True;
end;

procedure TfrmConsultaBase.btnSairClick(Sender: TObject);
begin
  // O fechamento pertence ao host Delphi 2006: RequestClose passa pela
  // confirmacao individual e pela politica de ocultar/destruir da instancia.
  RequestClose;
end;

procedure TfrmConsultaBase.ResetForSessionChange;
begin
  // O rascunho e a aba pertencem a sessao encerrada. Fechar antes da limpeza
  // garante que o descendente descarte o rascunho e nao reabra a inclusao com
  // empresas do usuario anterior. Um comando pendente da aba tambem morre aqui.
  FecharAbaInclusao;

  // A sessao encerrada e a dona de todas as abas de edicao: cada uma descarta o
  // proprio rascunho antes de a lista ser liberada.
  FecharAbasEdicao;
  ClearResult;

  // O layout pertence ao login corrente: recarregar evita reapresentar, em uma
  // janela oculta, a preferencia do usuario anterior.
  fraGrid.ReloadColumnLayout;
end;

destructor TfrmConsultaBase.Destroy;
begin
  try
    if dsConsulta <> nil then
      dsConsulta.DataSet := nil;
  finally
    try
      // A tela libera o leitor atual e a fabrica depois de desvincular o
      // conjunto. Se o leitor for o wrapper do Next, ele libera o leitor interno
      // antes de devolver a reserva do contexto.
      FDefinition := nil;
      FReader := nil;
      FReaderFactory := nil;
    finally
      // A destruicao nao executa hooks nem libera a aba: pcAbas libera a aba
      // remanescente e, com ela, rodape, area de rolagem e editor. Aqui apenas
      // se descarta o pedido pendente e se zeram as referencias.
      LimparPedidoFechamentoAbaInclusao;
      FAbaInclusao := nil;
      FRodapeInclusao := nil;
      FBtnSalvarInclusao := nil;
      FBtnCancelarInclusao := nil;
      // Os descritores nao possuem abas nem editores: pcAbas libera as abas
      // remanescentes e aqui se descarta apenas a lista.
      FreeAndNil(FAbasEdicao);
      inherited;
    end;
  end;
end;

function TfrmConsultaBase.CriarEditorInclusao(
  AParent: TWinControl): TWinControl;
begin
  Result := nil;
end;

function TfrmConsultaBase.TituloAbaInclusao: string;
begin
  Result := 'Inclusão';
end;

procedure TfrmConsultaBase.AoAbrirAbaInclusao;
begin
end;

procedure TfrmConsultaBase.AoFecharAbaInclusao;
begin
end;

procedure TfrmConsultaBase.AoFalharAberturaAbaInclusao;
begin
end;

function TfrmConsultaBase.SalvarInclusao: Boolean;
begin
  Result := False;
end;

procedure TfrmConsultaBase.AvisarSalvamentoSemAtualizacao;
begin
  // Padrao da base para telas que nao fornecem mensagem propria. A gravacao ja
  // terminou; a mensagem apenas orienta a repetir a consulta.
  ShowWarning(SalvamentoSemAtualizacaoMessage);
end;

function TfrmConsultaBase.GetAbaInclusaoAberta: Boolean;
begin
  Result := FAbaInclusao <> nil;
end;

function TfrmConsultaBase.GetAbaInclusaoAtiva: Boolean;
begin
  Result := (FAbaInclusao <> nil) and (pcAbas.ActivePage = FAbaInclusao);
end;

function TfrmConsultaBase.GetFechamentoAbaPendente: Boolean;
begin
  // Enquanto ha intencao registrada o comando ja foi aceito e ainda nao foi
  // concluido: um novo clique nao pode gravar nem fechar a mesma inclusao.
  Result := FIntencaoFechamentoAba <> ifaNenhuma;
end;

function TfrmConsultaBase.AbrirAbaInclusao: Boolean;
var
  Aba: TTabSheet;
  Area: TScrollBox;
  Editor: TWinControl;
begin
  Result := AbaInclusaoAberta;
  if Result then
  begin
    // Uma aba por janela: reabrir devolve o foco ao editor existente.
    AtivarAbaInclusao;
    Exit;
  end;

  Aba := TTabSheet.Create(pcAbas);
  try
    Aba.PageControl := pcAbas;
    Aba.Caption := TituloAbaInclusao;

    // O rodape nasce e morre com a aba: seus comandos so podem tratar o
    // rascunho desta aba.
    FRodapeInclusao := TPanel.Create(Aba);
    FRodapeInclusao.Parent := Aba;
    FRodapeInclusao.Align := alBottom;
    FRodapeInclusao.Height := 44;
    FRodapeInclusao.BevelOuter := bvNone;
    FRodapeInclusao.Caption := '';

    FBtnCancelarInclusao := TButton.Create(FRodapeInclusao);
    FBtnCancelarInclusao.Parent := FRodapeInclusao;
    FBtnCancelarInclusao.Caption := 'Cancelar';
    FBtnCancelarInclusao.Width := 110;
    FBtnCancelarInclusao.Height := 32;
    FBtnCancelarInclusao.Top := 6;
    FBtnCancelarInclusao.Anchors := [akTop, akRight];
    FBtnCancelarInclusao.Left :=
      Aba.ClientWidth - 16 - FBtnCancelarInclusao.Width;
    FBtnCancelarInclusao.OnClick := btnCancelarAbaInclusaoClick;

    FBtnSalvarInclusao := TButton.Create(FRodapeInclusao);
    FBtnSalvarInclusao.Parent := FRodapeInclusao;
    FBtnSalvarInclusao.Caption := 'Salvar';
    FBtnSalvarInclusao.Width := 110;
    FBtnSalvarInclusao.Height := 32;
    FBtnSalvarInclusao.Top := 6;
    FBtnSalvarInclusao.Anchors := [akTop, akRight];
    FBtnSalvarInclusao.Left :=
      FBtnCancelarInclusao.Left - FBtnSalvarInclusao.Width - 8;
    FBtnSalvarInclusao.OnClick := btnSalvarAbaInclusaoClick;

    // A area ocupa o restante da aba e e a dona do editor: libera-la encerra o
    // editor junto.
    Area := TScrollBox.Create(Aba);
    Area.Parent := Aba;
    Area.Align := alClient;
    Area.BorderStyle := bsNone;
    Area.AutoScroll := True;

    // Cada montagem recebe identidade propria: um pedido registrado para a aba
    // anterior nao pode alcancar esta.
    Inc(FTokenAbaInclusao);
    FAbaInclusao := Aba;
    Editor := CriarEditorInclusao(Area);
    if Editor = nil then
      raise Exception.Create(EditorNaoInformadoMessage);
    Editor.Parent := Area;
    Editor.Align := alTop;

    // O rascunho so nasce depois de aba, rodape e editor existirem.
    AoAbrirAbaInclusao;
    AtivarAbaInclusao;
    Result := True;
  except
    // A aba parcial e liberada inteira. O hook de falha e chamado depois da
    // liberacao: ele solta apenas referencias, sem tocar em controle destruido.
    FAbaInclusao := nil;
    FRodapeInclusao := nil;
    FBtnSalvarInclusao := nil;
    FBtnCancelarInclusao := nil;
    Aba.Free;
    AoFalharAberturaAbaInclusao;
    raise;
  end;
end;

procedure TfrmConsultaBase.FecharAbaInclusao;
var
  Aba: TTabSheet;
begin
  // Um comando pendente pertence a aba que esta sendo encerrada: uma troca de
  // usuario que chegue por este caminho invalida o pedido, em vez de deixa-lo
  // para ser tratado depois, sobre outra inclusao.
  LimparPedidoFechamentoAbaInclusao;

  if FAbaInclusao = nil then
    Exit;

  Aba := FAbaInclusao;
  if pcAbas.ActivePage = Aba then
    pcAbas.ActivePage := tsConsulta;

  try
    // O descendente solta as referencias e descarta o rascunho enquanto o
    // editor ainda existe.
    AoFecharAbaInclusao;
  finally
    // Uma unica liberacao encerra a aba e, com ela, rodape, area e editor.
    Aba.Free;
    FAbaInclusao := nil;
    FRodapeInclusao := nil;
    FBtnSalvarInclusao := nil;
    FBtnCancelarInclusao := nil;
    // Depois deste ponto nenhum pedido antigo identifica a proxima aba.
    Inc(FTokenAbaInclusao);
    AtualizarComandosAbaInclusao;
  end;
end;

procedure TfrmConsultaBase.AtivarAbaInclusao;
begin
  if FAbaInclusao = nil then
    Exit;

  // Reapresentar a inclusao nao recria a aba nem o rascunho; o foco pertence ao
  // descendente, que conhece o editor.
  pcAbas.ActivePage := FAbaInclusao;
end;

function TfrmConsultaBase.AbaDoControle(AControle: TControl): TTabSheet;
var
  Atual: TControl;
begin
  Result := nil;
  Atual := AControle;
  while (Atual <> nil) and (not (Atual is TTabSheet)) do
    Atual := Atual.Parent;
  if Atual is TTabSheet then
    Result := TTabSheet(Atual);
end;

function TfrmConsultaBase.ComandoDaAbaInclusao(AOrigem: TObject): Boolean;
var
  Aba: TTabSheet;
begin
  Result := False;
  if (FAbaInclusao = nil) or (not (AOrigem is TControl)) then
    Exit;

  // O rodape e filho da aba, entao a origem do clique identifica o rascunho que
  // o comando deve tratar.
  Aba := AbaDoControle(TControl(AOrigem));
  Result := Aba = FAbaInclusao;
end;

procedure TfrmConsultaBase.DefinirComandosHabilitados(AHabilitado: Boolean);
begin
  if FBtnSalvarInclusao <> nil then
    FBtnSalvarInclusao.Enabled := AHabilitado;
  if FBtnCancelarInclusao <> nil then
    FBtnCancelarInclusao.Enabled := AHabilitado;
end;

procedure TfrmConsultaBase.AtualizarComandosAbaInclusao;
begin
  // So existe um conjunto de comandos, o da aba corrente; depois do fechamento
  // ele ja nao existe e nada e reabilitado.
  DefinirComandosHabilitados(FAbaInclusao <> nil);
end;

procedure TfrmConsultaBase.LimparPedidoFechamentoAbaInclusao;
begin
  FIntencaoFechamentoAba := ifaNenhuma;
  FTokenPedidoAba := 0;
end;

procedure TfrmConsultaBase.SolicitarFechamentoAbaInclusao(
  AIntencao: TIntencaoFechamentoAbaInclusao);
begin
  // O pedido guarda intencao e token, nunca o ponteiro da aba: quando a mensagem
  // for tratada, a inclusao pode ja ter sido encerrada por uma troca de usuario.
  FIntencaoFechamentoAba := AIntencao;
  FTokenPedidoAba := FTokenAbaInclusao;

  // Liberar a aba dentro do proprio OnClick destruiria o botao que ainda esta no
  // caminho do evento. A mensagem privada so e tratada quando o laco de
  // mensagens volta a despachar, depois de o clique terminar.
  PostMessage(Handle, WM_COMANDO_ABA_INCLUSAO, 0, 0);
end;

procedure TfrmConsultaBase.btnSalvarAbaInclusaoClick(Sender: TObject);
begin
  // A origem identifica a aba; um comando de outra aba nao pode gravar este
  // rascunho, e um pedido ja registrado aguarda o manipulador diferido.
  if (not ComandoDaAbaInclusao(Sender)) or FechamentoAbaPendente then
    Exit;

  DefinirComandosHabilitados(False);
  try
    if not SalvarInclusao then
      Exit;

    // Gravacao confirmada: o fechamento e solicitado agora e concluido depois
    // que este evento retornar.
    SolicitarFechamentoAbaInclusao(ifaSalvar);
  finally
    // Com fechamento pendente os botoes continuam desabilitados: a aba sera
    // liberada e nao existe estado editavel para reabilitar.
    if not FechamentoAbaPendente then
      AtualizarComandosAbaInclusao;
  end;
end;

procedure TfrmConsultaBase.btnCancelarAbaInclusaoClick(Sender: TObject);
begin
  if (not ComandoDaAbaInclusao(Sender)) or FechamentoAbaPendente then
    Exit;

  // Cancelar nao grava nem reconsulta: o pedido apenas encerra a aba, e o hook
  // de fechamento descarta o rascunho.
  DefinirComandosHabilitados(False);
  SolicitarFechamentoAbaInclusao(ifaCancelar);
end;

procedure TfrmConsultaBase.TratarPedidoFechamentoAbaInclusao;
var
  Intencao: TIntencaoFechamentoAbaInclusao;
  Token: Integer;
begin
  // O pedido e consumido uma unica vez, inclusive quando for descartado.
  Intencao := FIntencaoFechamentoAba;
  Token := FTokenPedidoAba;
  LimparPedidoFechamentoAbaInclusao;

  if Intencao = ifaNenhuma then
    Exit;

  // A aba e reconhecida pelo token, nunca pelo endereco. Sem aba, ou com token
  // diferente, a inclusao terminou antes deste tratamento (troca de usuario ou
  // fechamento do host): o pedido e descartado sem fechar, sem reconsultar e sem
  // avisar, e a proxima aba nao herda o comando anterior.
  if (FAbaInclusao = nil) or (FTokenAbaInclusao <> Token) then
    Exit;

  FecharAbaInclusao;

  // Somente a gravacao confirmada atualiza a consulta; o cancelamento termina
  // aqui. Neste ponto a aba ja foi liberada e o rascunho descartado pelo hook de
  // fechamento.
  if Intencao = ifaSalvar then
    AtualizarAposSalvar;
end;

procedure TfrmConsultaBase.AtualizarAposSalvar;
begin
  // A reconsulta pode falhar com False ou com excecao antes do tratamento
  // interno da pesquisa. Em ambos os casos a gravacao esta concluida: a aba
  // permanece fechada e o usuario e orientado a repetir a pesquisa.
  try
    if not RepetirPesquisa then
      AvisarSalvamentoSemAtualizacao;
  except
    AvisarSalvamentoSemAtualizacao;
  end;
end;

procedure TfrmConsultaBase.WMCmdAbaInclusao(var AMessage: TMessage);
begin
  AMessage.Result := 0;
  TratarPedidoFechamentoAbaInclusao;
end;

// ---- Abas de edicao ---------------------------------------------------------

function TfrmConsultaBase.CriarEditorEdicao(AParent: TWinControl;
  const AChave: string): TWinControl;
begin
  Result := nil;
end;

procedure TfrmConsultaBase.AoAbrirAbaEdicao(const AChave: string;
  AEditor: TWinControl);
begin
end;

procedure TfrmConsultaBase.AoFecharAbaEdicao(const AChave: string;
  AEditor: TWinControl);
begin
end;

procedure TfrmConsultaBase.AoFalharAberturaAbaEdicao(const AChave: string);
begin
end;

function TfrmConsultaBase.SalvarEdicao(const AChave: string;
  AEditor: TWinControl): Boolean;
begin
  Result := False;
end;

function TfrmConsultaBase.ListaAbasEdicao: TObjectList<TAbaEdicao>;
begin
  // A lista nasce no primeiro uso: a tela nao sobrescreve o construtor e abas
  // de edicao existem apenas quando a funcionalidade as abre.
  if FAbasEdicao = nil then
    FAbasEdicao := TObjectList<TAbaEdicao>.Create;
  Result := FAbasEdicao;
end;

function TfrmConsultaBase.IndiceAbaEdicao(const AChave: string): Integer;
var
  Chave: string;
  I: Integer;
begin
  Result := -1;
  if FAbasEdicao = nil then
    Exit;

  Chave := Trim(AChave);
  for I := 0 to FAbasEdicao.Count - 1 do
    if FAbasEdicao[I].Chave = Chave then
    begin
      Result := I;
      Break;
    end;
end;

function TfrmConsultaBase.AbaEdicaoRegistrada(AAba: TAbaEdicao): Boolean;
var
  I: Integer;
begin
  Result := False;
  if (AAba = nil) or (FAbasEdicao = nil) then
    Exit;

  for I := 0 to FAbasEdicao.Count - 1 do
    if FAbasEdicao[I] = AAba then
    begin
      Result := True;
      Break;
    end;
end;

function TfrmConsultaBase.AbaEdicaoDoControle(AOrigem: TObject): TAbaEdicao;
var
  Tela: TTabSheet;
  I: Integer;
begin
  Result := nil;
  if (FAbasEdicao = nil) or (not (AOrigem is TControl)) then
    Exit;

  Tela := AbaDoControle(TControl(AOrigem));
  if Tela = nil then
    Exit;

  // O rodape e filho da aba: a aba do controle identifica o descritor que o
  // comando deve tratar.
  for I := 0 to FAbasEdicao.Count - 1 do
    if FAbasEdicao[I].Aba = Tela then
    begin
      Result := FAbasEdicao[I];
      Break;
    end;
end;

function TfrmConsultaBase.AbaEdicaoPorToken(AToken: Integer): TAbaEdicao;
var
  I: Integer;
begin
  Result := nil;
  if (AToken <= 0) or (FAbasEdicao = nil) then
    Exit;

  for I := 0 to FAbasEdicao.Count - 1 do
    if FAbasEdicao[I].Token = AToken then
    begin
      Result := FAbasEdicao[I];
      Break;
    end;
end;

function TfrmConsultaBase.GetAbaEdicaoAberta(const AChave: string): Boolean;
begin
  Result := IndiceAbaEdicao(AChave) >= 0;
end;

function TfrmConsultaBase.GetAbaEdicaoAtiva(const AChave: string): Boolean;
var
  Indice: Integer;
begin
  Result := False;
  Indice := IndiceAbaEdicao(AChave);
  if Indice < 0 then
    Exit;

  Result := pcAbas.ActivePage = FAbasEdicao[Indice].Aba;
end;

function TfrmConsultaBase.GetHaAbaEdicaoAtiva: Boolean;
var
  I: Integer;
begin
  Result := False;
  if FAbasEdicao = nil then
    Exit;

  for I := 0 to FAbasEdicao.Count - 1 do
    if pcAbas.ActivePage = FAbasEdicao[I].Aba then
    begin
      Result := True;
      Break;
    end;
end;

function TfrmConsultaBase.GetChaveAbaEdicaoAtiva: string;
var
  I: Integer;
begin
  Result := '';
  if FAbasEdicao = nil then
    Exit;

  for I := 0 to FAbasEdicao.Count - 1 do
    if pcAbas.ActivePage = FAbasEdicao[I].Aba then
    begin
      Result := FAbasEdicao[I].Chave;
      Break;
    end;
end;

function TfrmConsultaBase.AbrirAbaEdicao(const AChave,
  ATitulo: string): Boolean;
var
  Chave: string;
  Descritor: TAbaEdicao;
  Tela: TTabSheet;
  Area: TScrollBox;
  Editor: TWinControl;
  Indice: Integer;
begin
  Chave := Trim(AChave);
  if Chave = '' then
    raise Exception.Create(ChaveAbaEdicaoNaoInformadaMessage);

  // Uma aba por chave: reabrir devolve a aba existente, com o digitado
  // preservado e sem repetir a carga do registro.
  Result := GetAbaEdicaoAberta(Chave);
  if Result then
  begin
    AtivarAbaEdicao(Chave);
    Exit;
  end;

  Descritor := TAbaEdicao.Create;
  Tela := TTabSheet.Create(pcAbas);
  try
    Tela.PageControl := pcAbas;
    Tela.Caption := ATitulo;

    Descritor.Chave := Chave;
    Descritor.Aba := Tela;

    // O rodape nasce e morre com a aba: seus comandos so podem tratar o
    // rascunho desta aba.
    Descritor.Rodape := TPanel.Create(Tela);
    Descritor.Rodape.Parent := Tela;
    Descritor.Rodape.Align := alBottom;
    Descritor.Rodape.Height := 44;
    Descritor.Rodape.BevelOuter := bvNone;
    Descritor.Rodape.Caption := '';

    Descritor.BtnCancelar := TButton.Create(Descritor.Rodape);
    Descritor.BtnCancelar.Parent := Descritor.Rodape;
    Descritor.BtnCancelar.Caption := 'Cancelar';
    Descritor.BtnCancelar.Width := 110;
    Descritor.BtnCancelar.Height := 32;
    Descritor.BtnCancelar.Top := 6;
    Descritor.BtnCancelar.Anchors := [akTop, akRight];
    Descritor.BtnCancelar.Left :=
      Tela.ClientWidth - 16 - Descritor.BtnCancelar.Width;
    Descritor.BtnCancelar.OnClick := btnCancelarAbaEdicaoClick;

    Descritor.BtnSalvar := TButton.Create(Descritor.Rodape);
    Descritor.BtnSalvar.Parent := Descritor.Rodape;
    Descritor.BtnSalvar.Caption := 'Salvar';
    Descritor.BtnSalvar.Width := 110;
    Descritor.BtnSalvar.Height := 32;
    Descritor.BtnSalvar.Top := 6;
    Descritor.BtnSalvar.Anchors := [akTop, akRight];
    Descritor.BtnSalvar.Left :=
      Descritor.BtnCancelar.Left - Descritor.BtnSalvar.Width - 8;
    Descritor.BtnSalvar.OnClick := btnSalvarAbaEdicaoClick;

    // A area ocupa o restante da aba e e a dona do editor: libera-la encerra o
    // editor junto.
    Area := TScrollBox.Create(Tela);
    Area.Parent := Tela;
    Area.Align := alClient;
    Area.BorderStyle := bsNone;
    Area.AutoScroll := True;

    // Cada montagem recebe identidade propria: o pedido de fechamento registrado
    // para uma aba anterior nao pode alcancar esta.
    Inc(FTokenAbaEdicao);
    Descritor.Token := FTokenAbaEdicao;
    ListaAbasEdicao.Add(Descritor);

    Editor := CriarEditorEdicao(Area, Chave);
    if Editor = nil then
      raise Exception.Create(EditorEdicaoNaoInformadoMessage);

    Editor.Parent := Area;
    Editor.Align := alTop;
    Descritor.Editor := Editor;

    // O rascunho so nasce depois de aba, rodape e editor existirem.
    AoAbrirAbaEdicao(Chave, Editor);
    AtivarAbaEdicao(Chave);
    Result := True;
  except
    // A aba parcial e liberada inteira. O hook de falha e chamado depois da
    // liberacao: ele solta apenas referencias, sem tocar em controle destruido.
    Indice := IndiceAbaEdicao(Descritor.Chave);
    if Indice >= 0 then
      FAbasEdicao.Delete(Indice)
    else
      Descritor.Free;

    Tela.Free;
    AoFalharAberturaAbaEdicao(Chave);
    raise;
  end;
end;

procedure TfrmConsultaBase.FecharAbaEdicao(const AChave: string);
var
  Indice: Integer;
  Descritor: TAbaEdicao;
  Tela: TTabSheet;
begin
  Indice := IndiceAbaEdicao(AChave);
  if Indice < 0 then
    Exit;

  Descritor := FAbasEdicao[Indice];
  // Um comando pendente pertence a aba que esta sendo encerrada.
  Descritor.Intencao := ifcNenhuma;
  Tela := Descritor.Aba;
  if pcAbas.ActivePage = Tela then
    pcAbas.ActivePage := tsConsulta;

  try
    // O descendente solta as referencias e descarta o rascunho enquanto o
    // editor ainda existe.
    AoFecharAbaEdicao(Descritor.Chave, Descritor.Editor);
  finally
    // O descritor e liberado antes da aba: depois disso nenhum pedido antigo
    // identifica esta montagem.
    FAbasEdicao.Delete(Indice);
    // Uma unica liberacao encerra a aba e, com ela, rodape, area e editor.
    Tela.Free;
  end;
end;

procedure TfrmConsultaBase.FecharAbasEdicao;
var
  Chave: string;
begin
  // Cada fechamento remove o proprio descritor: o laco sempre parte da ultima
  // aba ainda aberta.
  while (FAbasEdicao <> nil) and (FAbasEdicao.Count > 0) do
  begin
    Chave := FAbasEdicao[FAbasEdicao.Count - 1].Chave;
    FecharAbaEdicao(Chave);
  end;
end;

procedure TfrmConsultaBase.AtivarAbaEdicao(const AChave: string);
var
  Indice: Integer;
begin
  Indice := IndiceAbaEdicao(AChave);
  if Indice < 0 then
    Exit;

  // Reapresentar a edicao nao recria a aba nem recarrega o registro; o foco
  // pertence ao descendente, que conhece o editor.
  pcAbas.ActivePage := FAbasEdicao[Indice].Aba;
end;

procedure TfrmConsultaBase.DefinirComandosAbaEdicao(AAba: TAbaEdicao;
  AHabilitado: Boolean);
begin
  if AAba = nil then
    Exit;

  if AAba.BtnSalvar <> nil then
    AAba.BtnSalvar.Enabled := AHabilitado;
  if AAba.BtnCancelar <> nil then
    AAba.BtnCancelar.Enabled := AHabilitado;
end;

procedure TfrmConsultaBase.SolicitarFechamentoAbaEdicao(AAba: TAbaEdicao;
  AIntencao: TIntencaoFechamentoAbaEdicao);
begin
  // O pedido guarda a intencao e viaja com o token da montagem: quando a
  // mensagem for tratada, a aba pode ja ter sido encerrada por uma troca de
  // usuario.
  AAba.Intencao := AIntencao;
  PostMessage(Handle, WM_COMANDO_ABA_EDICAO, WPARAM(AAba.Token), 0);
end;

procedure TfrmConsultaBase.btnSalvarAbaEdicaoClick(Sender: TObject);
var
  Aba: TAbaEdicao;
begin
  // A origem identifica a aba; um comando de outra aba nao pode gravar este
  // rascunho, e um pedido ja registrado aguarda o manipulador diferido.
  Aba := AbaEdicaoDoControle(Sender);
  if (Aba = nil) or (Aba.Intencao <> ifcNenhuma) then
    Exit;

  DefinirComandosAbaEdicao(Aba, False);
  try
    if not SalvarEdicao(Aba.Chave, Aba.Editor) then
      Exit;

    // Gravacao confirmada: o fechamento e solicitado agora e concluido depois
    // que este evento retornar.
    SolicitarFechamentoAbaEdicao(Aba, ifcSalvar);
  finally
    // Com fechamento pendente os botoes continuam desabilitados; uma troca de
    // sessao durante a gravacao ja encerrou a aba.
    if AbaEdicaoRegistrada(Aba) and (Aba.Intencao = ifcNenhuma) then
      DefinirComandosAbaEdicao(Aba, True);
  end;
end;

procedure TfrmConsultaBase.btnCancelarAbaEdicaoClick(Sender: TObject);
var
  Aba: TAbaEdicao;
begin
  Aba := AbaEdicaoDoControle(Sender);
  if (Aba = nil) or (Aba.Intencao <> ifcNenhuma) then
    Exit;

  // Cancelar nao grava nem reconsulta: o pedido apenas encerra esta aba e o
  // hook de fechamento descarta o rascunho.
  DefinirComandosAbaEdicao(Aba, False);
  SolicitarFechamentoAbaEdicao(Aba, ifcCancelar);
end;

procedure TfrmConsultaBase.TratarPedidoFechamentoAbaEdicao(AToken: Integer);
var
  Aba: TAbaEdicao;
  Intencao: TIntencaoFechamentoAbaEdicao;
begin
  // A aba e reconhecida pelo token da montagem. Sem aba, o pedido e descartado
  // sem fechar, sem reconsultar e sem avisar.
  Aba := AbaEdicaoPorToken(AToken);
  if Aba = nil then
    Exit;

  // O pedido e consumido uma unica vez.
  Intencao := Aba.Intencao;
  Aba.Intencao := ifcNenhuma;
  if Intencao = ifcNenhuma then
    Exit;

  FecharAbaEdicao(Aba.Chave);

  // Somente a gravacao confirmada atualiza a consulta; o cancelamento termina
  // aqui.
  if Intencao = ifcSalvar then
    AtualizarAposSalvar;
end;

procedure TfrmConsultaBase.WMCmdAbaEdicao(var AMessage: TMessage);
begin
  AMessage.Result := 0;
  TratarPedidoFechamentoAbaEdicao(Integer(AMessage.WParam));
end;

end.
