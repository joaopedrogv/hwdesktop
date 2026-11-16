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

  // Configura o editor recem-criado antes de a aba ser ativada: e o ponto em que
  // o rascunho da funcionalidade nasce.
  TConfigurarAbaCadastro = reference to procedure(AEditor: TWinControl);

  // Intencao registrada no clique: somente a gravacao confirmada reconsulta a
  // grade depois de liberar a aba. ifaNenhuma e o valor inicial de cada aba.
  TIntencaoFechamentoAba = (ifaNenhuma, ifaSalvar, ifaCancelar);

const
  // Chave da unica aba de inclusao da janela.
  ChaveAbaInclusao = '@inclusao';
  // Mensagem privada da base: o comando da aba e concluido depois que o evento
  // de clique retorna, quando liberar a aba nao destroi mais o controle em uso.
  WM_COMANDO_ABA = WM_APP + 311;

type
  // Descritor de uma aba de cadastro aberta pela base. O objeto pertence a lista
  // da base e nao possui a aba nem o editor: ambos pertencem ao PageControl, que
  // os libera quando a aba e fechada. O token identifica a montagem corrente,
  // porque um pedido de fechamento pode ser tratado depois do encerramento.
  TAbaCadastro = class
  public
    Chave: string;
    Aba: TTabSheet;
    Rodape: TPanel;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    Editor: TWinControl;
    Token: Integer;
    Intencao: TIntencaoFechamentoAba;
  end;

  // Base unica das consultas Next. Recebe a definicao ou a fabrica de leitores,
  // apresenta o resultado na grade e oferece a aba Consulta com filtros,
  // Pesquisar e Sair.
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
    // Leitor criado pela fabrica para a pesquisa corrente. A definicao mantem o
    // proprio leitor; este campo fica nil ate a primeira pesquisa e depois de
    // ClearResult.
    FReader: IDataSetReader;
    FReaderFactory: TConsultaReaderFactory;
    FDefinition: INextQueryDefinitionBase;
    FColumns: TGridColumnDefinitions;
    FOperations: IQueryResultOperations;
    FTitle: string;
    FQuickFilterEnabled: Boolean;
    FPesquisando: Boolean;
    // Abas de cadastro abertas, uma por chave. A lista nasce no primeiro uso e e
    // liberada na destruicao; os descritores nao possuem abas nem editores.
    FAbasCadastro: TObjectList<TAbaCadastro>;
    // Identidade monotonica de cada montagem: um pedido de fechamento registrado
    // para uma aba anterior nao pode alcancar a proxima.
    FTokenAbaCadastro: Integer;
    // Chave da aba cuja gravacao esta em andamento; a validacao do apresentador
    // volta para o editor dessa aba.
    FChaveAbaEmGravacao: string;
    procedure ClearResult;
    procedure DoPesquisar(Sender: TObject);
    function Pesquisar(const AExibirFalha: Boolean): Boolean;
    procedure GridTitleCtrlClick(Sender: TObject; const AFieldName: string);
    procedure FrameFeedback(Sender: TObject;
      const AMensagem: string);
    procedure PosicionarBotoesPesquisa;
    function ListaAbasCadastro: TObjectList<TAbaCadastro>;
    function IndiceAbaCadastro(const AChave: string): Integer;
    function AbaCadastroPorToken(AToken: Integer): TAbaCadastro;
    function AbaDoControle(AControle: TControl): TTabSheet;
    function AbaCadastroDoControle(AOrigem: TObject): TAbaCadastro;
    procedure DefinirComandosAba(AAba: TAbaCadastro; AHabilitado: Boolean);
    procedure btnSalvarAbaClick(Sender: TObject);
    procedure btnCancelarAbaClick(Sender: TObject);
    procedure SolicitarFechamentoAba(AAba: TAbaCadastro;
      AIntencao: TIntencaoFechamentoAba);
    procedure TratarPedidoFechamentoAba(AToken: Integer);
    procedure WMCmdAba(var AMessage: TMessage);
      message WM_COMANDO_ABA;
    procedure AtualizarAposSalvar;
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
    // Abre a aba de cadastro da chave. Se ela ja existe, apenas a ativa e
    // preserva o rascunho; caso contrario cria aba, rodape, area de rolagem e
    // editor, chama AConfigurar antes de ativar e devolve True. Uma falha de
    // montagem libera a aba parcial e devolve False.
    function AbrirAba(const AChave, ATitulo: string;
      AConfigurar: TConfigurarAbaCadastro): Boolean; overload;
    function AbrirAba(const AChave, ATitulo: string): Boolean; overload;
    procedure AtivarAba(const AChave: string);
    procedure FecharAba(const AChave: string);
    procedure FecharAbas;
    function AbaAberta(const AChave: string): Boolean;
    function AbaAtiva(const AChave: string): Boolean;
    function HaAbaAtiva: Boolean;
    function ChaveAbaAtiva: string;
    function EditorDaAba(const AChave: string): TWinControl;
    function EditorAbaAtiva: TWinControl;
    function TotalAbasCadastro: Integer;
    function EditorAbaCadastro(AIndice: Integer): TWinControl;
    // Cria o editor com Owner = AParent e devolve o controle. A base define
    // Parent e Align; a area de rolagem libera o editor e o descendente nao o
    // libera.
    function CriarEditor(const AChave: string;
      AParent: TWinControl): TWinControl; virtual;
    // True quando a gravacao foi confirmada e a aba pode ser encerrada; a base
    // registra o fechamento diferido e reconsulta depois do clique.
    function SalvarAba(const AChave: string;
      AEditor: TWinControl): Boolean; virtual;
    // Aviso de gravacao confirmada cuja reconsulta falhou. O descendente
    // fornece a mensagem de negocio; a base chama depois de fechar a aba.
    procedure AvisarSalvamentoSemAtualizacao; virtual;
    // Chave da aba cuja gravacao esta em andamento. A validacao produzida pelo
    // apresentador e encaminhada ao editor dessa aba.
    property ChaveAbaEmGravacao: string read FChaveAbaEmGravacao;
  public
    destructor Destroy; override;
    procedure ResetForSessionChange; override;
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
    'A aba de cadastro não recebeu seu editor.';
  SalvamentoSemAtualizacaoMessage =
    'O registro foi salvo. Repita a pesquisa para atualizar a consulta.';
  ChaveAbaNaoInformadaMessage =
    'A chave da aba de cadastro não foi informada.';

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
  // habilitada quando a tela recebe definicao ou fabrica na inicializacao.
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

  // O leitor da definicao pertence a ela e segue o ciclo dela. O leitor da
  // fabrica pertence a pesquisa corrente e nao sobrevive a limpeza do resultado.
  if FDefinition <> nil then
    FDefinition.Limpar
  else if FReader <> nil then
  begin
    FReader.Limpar;
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
  DataSet: TDataSet;
begin
  // Segunda barreira contra composicao incompleta: sem definicao ou fabrica
  // nenhuma instrucao SQL e executada e o resultado anterior nao e alterado.
  if (FDefinition = nil) and (not Assigned(FReaderFactory)) then
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
      // Cada caminho obtem o conjunto no mesmo bloco: a definicao administra o
      // proprio leitor e a fabrica entrega um novo leitor para esta pesquisa.
      if FDefinition <> nil then
      begin
        FDefinition.Pesquisar(Criteria);
        DataSet := FDefinition.GetDataSet;
      end
      else
      begin
        FReader := FReaderFactory(Criteria);
        if FReader = nil then
          raise Exception.Create(MissingReaderMessage);
        FReader.Pesquisar;
        DataSet := FReader.DataSet;
      end;

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

procedure TfrmConsultaBase.Attach(const ADefinition: INextQueryDefinitionBase;
  const ATitle: string; AQuickFilterEnabled: Boolean = False);
begin
  if ADefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);
  if Trim(ATitle) = '' then
    raise Exception.Create(MissingTitleMessage);
  if Assigned(FReaderFactory) or (FDefinition <> nil) then
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
  if Assigned(FReaderFactory) or (FDefinition <> nil) then
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

  // Sem definicao ou fabrica nao existe consulta a apresentar: a falha de
  // composicao aparece na abertura da view, antes de a tela parecer operavel.
  if (FDefinition = nil) and (not Assigned(FReaderFactory)) then
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
  // garante que os frames descartem os rascunhos e nao reabram uma inclusao com
  // empresas do usuario anterior. Um comando pendente tambem morre aqui.
  FecharAbas;
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
      // A destruicao nao executa pedidos pendentes: pcAbas libera as abas
      // remanescentes e, com elas, rodapes, areas e editores. Aqui se descarta
      // apenas a lista de descritores e a chave de gravacao.
      FChaveAbaEmGravacao := '';
      FreeAndNil(FAbasCadastro);
      inherited;
    end;
  end;
end;

function TfrmConsultaBase.CriarEditor(const AChave: string;
  AParent: TWinControl): TWinControl;
begin
  raise Exception.Create(EditorNaoInformadoMessage);
end;

function TfrmConsultaBase.SalvarAba(const AChave: string;
  AEditor: TWinControl): Boolean;
begin
  Result := False;
end;

procedure TfrmConsultaBase.AvisarSalvamentoSemAtualizacao;
begin
  // Padrao da base para telas que nao fornecem mensagem propria. A gravacao ja
  // terminou; a mensagem apenas orienta a repetir a consulta.
  ShowWarning(SalvamentoSemAtualizacaoMessage);
end;

function TfrmConsultaBase.ListaAbasCadastro: TObjectList<TAbaCadastro>;
begin
  // A lista nasce no primeiro uso: a tela nao sobrescreve o construtor e abas
  // de cadastro existem apenas quando a funcionalidade as abre.
  if FAbasCadastro = nil then
    FAbasCadastro := TObjectList<TAbaCadastro>.Create;
  Result := FAbasCadastro;
end;

function TfrmConsultaBase.IndiceAbaCadastro(const AChave: string): Integer;
var
  Chave: string;
  I: Integer;
begin
  Result := -1;
  if FAbasCadastro = nil then
    Exit;

  Chave := Trim(AChave);
  for I := 0 to FAbasCadastro.Count - 1 do
    if FAbasCadastro[I].Chave = Chave then
    begin
      Result := I;
      Break;
    end;
end;

function TfrmConsultaBase.AbaCadastroPorToken(
  AToken: Integer): TAbaCadastro;
var
  I: Integer;
begin
  Result := nil;
  if (AToken <= 0) or (FAbasCadastro = nil) then
    Exit;

  for I := 0 to FAbasCadastro.Count - 1 do
    if FAbasCadastro[I].Token = AToken then
    begin
      Result := FAbasCadastro[I];
      Break;
    end;
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

function TfrmConsultaBase.AbaCadastroDoControle(
  AOrigem: TObject): TAbaCadastro;
var
  Tela: TTabSheet;
  I: Integer;
begin
  Result := nil;
  if (FAbasCadastro = nil) or (not (AOrigem is TControl)) then
    Exit;

  Tela := AbaDoControle(TControl(AOrigem));
  if Tela = nil then
    Exit;

  // O rodape e filho da aba: a aba do controle identifica o descritor que o
  // comando deve tratar.
  for I := 0 to FAbasCadastro.Count - 1 do
    if FAbasCadastro[I].Aba = Tela then
    begin
      Result := FAbasCadastro[I];
      Break;
    end;
end;

function TfrmConsultaBase.AbaAberta(const AChave: string): Boolean;
begin
  Result := IndiceAbaCadastro(AChave) >= 0;
end;

function TfrmConsultaBase.AbaAtiva(const AChave: string): Boolean;
var
  Indice: Integer;
begin
  Result := False;
  Indice := IndiceAbaCadastro(AChave);
  if Indice < 0 then
    Exit;

  Result := pcAbas.ActivePage = FAbasCadastro[Indice].Aba;
end;

function TfrmConsultaBase.HaAbaAtiva: Boolean;
begin
  Result := EditorAbaAtiva <> nil;
end;

function TfrmConsultaBase.ChaveAbaAtiva: string;
var
  I: Integer;
begin
  Result := '';
  if FAbasCadastro = nil then
    Exit;

  for I := 0 to FAbasCadastro.Count - 1 do
    if pcAbas.ActivePage = FAbasCadastro[I].Aba then
    begin
      Result := FAbasCadastro[I].Chave;
      Break;
    end;
end;

function TfrmConsultaBase.EditorDaAba(const AChave: string): TWinControl;
var
  Indice: Integer;
begin
  Result := nil;
  Indice := IndiceAbaCadastro(AChave);
  if Indice < 0 then
    Exit;

  Result := FAbasCadastro[Indice].Editor;
end;

function TfrmConsultaBase.EditorAbaAtiva: TWinControl;
var
  I: Integer;
begin
  Result := nil;
  if FAbasCadastro = nil then
    Exit;

  for I := 0 to FAbasCadastro.Count - 1 do
    if pcAbas.ActivePage = FAbasCadastro[I].Aba then
    begin
      Result := FAbasCadastro[I].Editor;
      Break;
    end;
end;

function TfrmConsultaBase.TotalAbasCadastro: Integer;
begin
  if FAbasCadastro = nil then
    Result := 0
  else
    Result := FAbasCadastro.Count;
end;

function TfrmConsultaBase.EditorAbaCadastro(AIndice: Integer): TWinControl;
begin
  Result := nil;
  if (FAbasCadastro = nil) or (AIndice < 0) or
    (AIndice >= FAbasCadastro.Count) then
    Exit;

  Result := FAbasCadastro[AIndice].Editor;
end;

function TfrmConsultaBase.AbrirAba(const AChave, ATitulo: string;
  AConfigurar: TConfigurarAbaCadastro): Boolean;
var
  Chave: string;
  Descritor: TAbaCadastro;
  Tela: TTabSheet;
  Area: TScrollBox;
  Editor: TWinControl;
  Indice: Integer;
begin
  Chave := Trim(AChave);
  if Chave = '' then
    raise Exception.Create(ChaveAbaNaoInformadaMessage);

  // Uma aba por chave: reabrir apenas ativa a existente, sem reconfigurar o
  // editor nem descartar o rascunho.
  Result := AbaAberta(Chave);
  if Result then
  begin
    AtivarAba(Chave);
    Exit;
  end;

  Descritor := TAbaCadastro.Create;
  Tela := nil;
  try
    Tela := TTabSheet.Create(pcAbas);
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
    Descritor.BtnCancelar.OnClick := btnCancelarAbaClick;

    Descritor.BtnSalvar := TButton.Create(Descritor.Rodape);
    Descritor.BtnSalvar.Parent := Descritor.Rodape;
    Descritor.BtnSalvar.Caption := 'Salvar';
    Descritor.BtnSalvar.Width := 110;
    Descritor.BtnSalvar.Height := 32;
    Descritor.BtnSalvar.Top := 6;
    Descritor.BtnSalvar.Anchors := [akTop, akRight];
    Descritor.BtnSalvar.Left :=
      Descritor.BtnCancelar.Left - Descritor.BtnSalvar.Width - 8;
    Descritor.BtnSalvar.OnClick := btnSalvarAbaClick;

    // A area ocupa o restante da aba e e a dona do editor: libera-la encerra o
    // editor junto.
    Area := TScrollBox.Create(Tela);
    Area.Parent := Tela;
    Area.Align := alClient;
    Area.BorderStyle := bsNone;
    Area.AutoScroll := True;

    Editor := CriarEditor(Chave, Area);
    if Editor = nil then
      raise Exception.Create(EditorNaoInformadoMessage);
    Editor.Parent := Area;
    Editor.Align := alTop;
    Descritor.Editor := Editor;

    // O rascunho nasce com o editor, antes de a aba ser ativada.
    if Assigned(AConfigurar) then
      AConfigurar(Editor);

    Inc(FTokenAbaCadastro);
    Descritor.Token := FTokenAbaCadastro;
    ListaAbasCadastro.Add(Descritor);

    AtivarAba(Chave);
    Result := True;
  except
    // A aba parcial e liberada inteira: o editor e o rascunho morrem junto. O
    // descritor e descartado antes da aba.
    Indice := IndiceAbaCadastro(Chave);
    if Indice >= 0 then
      FAbasCadastro.Delete(Indice)
    else
      Descritor.Free;
    Tela.Free;
    Result := False;
  end;
end;

function TfrmConsultaBase.AbrirAba(const AChave,
  ATitulo: string): Boolean;
begin
  Result := AbrirAba(AChave, ATitulo, nil);
end;

procedure TfrmConsultaBase.AtivarAba(const AChave: string);
var
  Indice: Integer;
begin
  Indice := IndiceAbaCadastro(AChave);
  if Indice < 0 then
    Exit;

  // Reapresentar a aba nao recria o editor nem recarrega o registro; o foco
  // pertence ao descendente, que conhece o editor.
  pcAbas.ActivePage := FAbasCadastro[Indice].Aba;
end;

procedure TfrmConsultaBase.FecharAba(const AChave: string);
var
  Indice: Integer;
  Descritor: TAbaCadastro;
  Tela: TTabSheet;
begin
  Indice := IndiceAbaCadastro(AChave);
  if Indice < 0 then
    Exit;

  Descritor := FAbasCadastro[Indice];
  // Um comando pendente pertence a aba que esta sendo encerrada.
  Descritor.Intencao := ifaNenhuma;
  Tela := Descritor.Aba;
  if pcAbas.ActivePage = Tela then
    pcAbas.ActivePage := tsConsulta;

  // O descritor e liberado antes da aba: depois disso nenhum pedido antigo
  // identifica esta montagem. A aba libera rodape, area, editor e rascunho.
  FAbasCadastro.Delete(Indice);
  Tela.Free;
end;

procedure TfrmConsultaBase.FecharAbas;
var
  Chave: string;
begin
  // Cada fechamento remove o proprio descritor: o laco sempre parte da ultima
  // aba ainda aberta.
  while (FAbasCadastro <> nil) and (FAbasCadastro.Count > 0) do
  begin
    Chave := FAbasCadastro[FAbasCadastro.Count - 1].Chave;
    FecharAba(Chave);
  end;
end;

procedure TfrmConsultaBase.DefinirComandosAba(AAba: TAbaCadastro;
  AHabilitado: Boolean);
begin
  if AAba = nil then
    Exit;

  if AAba.BtnSalvar <> nil then
    AAba.BtnSalvar.Enabled := AHabilitado;
  if AAba.BtnCancelar <> nil then
    AAba.BtnCancelar.Enabled := AHabilitado;
end;

procedure TfrmConsultaBase.SolicitarFechamentoAba(AAba: TAbaCadastro;
  AIntencao: TIntencaoFechamentoAba);
begin
  // O pedido guarda a intencao e viaja com o token da montagem: quando a
  // mensagem for tratada, a aba pode ja ter sido encerrada por uma troca de
  // usuario.
  AAba.Intencao := AIntencao;
  PostMessage(Handle, WM_COMANDO_ABA, WPARAM(AAba.Token), 0);
end;

procedure TfrmConsultaBase.btnSalvarAbaClick(Sender: TObject);
var
  Aba: TAbaCadastro;
  Token: Integer;
begin
  // A origem identifica a aba; um comando de outra aba nao pode gravar este
  // rascunho, e um pedido ja registrado aguarda o manipulador diferido.
  Aba := AbaCadastroDoControle(Sender);
  if (Aba = nil) or (Aba.Intencao <> ifaNenhuma) then
    Exit;

  Token := Aba.Token;
  DefinirComandosAba(Aba, False);
  FChaveAbaEmGravacao := Aba.Chave;
  try
    if not SalvarAba(Aba.Chave, Aba.Editor) then
      Exit;

    // A gravacao pode ter despachado uma troca de sessao: a aba so recebe o
    // pedido de fechamento se ainda estiver registrada.
    Aba := AbaCadastroPorToken(Token);
    if Aba <> nil then
      SolicitarFechamentoAba(Aba, ifaSalvar);
  finally
    FChaveAbaEmGravacao := '';
    // Com fechamento pendente os botoes continuam desabilitados; sem aba, nada
    // e reabilitado.
    Aba := AbaCadastroPorToken(Token);
    if (Aba <> nil) and (Aba.Intencao = ifaNenhuma) then
      DefinirComandosAba(Aba, True);
  end;
end;

procedure TfrmConsultaBase.btnCancelarAbaClick(Sender: TObject);
var
  Aba: TAbaCadastro;
begin
  Aba := AbaCadastroDoControle(Sender);
  if (Aba = nil) or (Aba.Intencao <> ifaNenhuma) then
    Exit;

  // Cancelar nao grava nem reconsulta: o pedido apenas encerra esta aba e a
  // liberacao descarta o rascunho.
  DefinirComandosAba(Aba, False);
  SolicitarFechamentoAba(Aba, ifaCancelar);
end;

procedure TfrmConsultaBase.TratarPedidoFechamentoAba(AToken: Integer);
var
  Aba: TAbaCadastro;
  Intencao: TIntencaoFechamentoAba;
begin
  // A aba e reconhecida pelo token da montagem. Sem aba, o pedido e descartado
  // sem fechar, sem reconsultar e sem avisar.
  Aba := AbaCadastroPorToken(AToken);
  if Aba = nil then
    Exit;

  // O pedido e consumido uma unica vez.
  Intencao := Aba.Intencao;
  Aba.Intencao := ifaNenhuma;
  if Intencao = ifaNenhuma then
    Exit;

  FecharAba(Aba.Chave);

  // Somente a gravacao confirmada atualiza a consulta; o cancelamento termina
  // aqui.
  if Intencao = ifaSalvar then
    AtualizarAposSalvar;
end;

procedure TfrmConsultaBase.WMCmdAba(var AMessage: TMessage);
begin
  AMessage.Result := 0;
  TratarPedidoFechamentoAba(Integer(AMessage.WParam));
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

end.
