unit ConsultaBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Controls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Forms, Vcl.StdCtrls, Vcl.Buttons, Vcl.ImgList, System.Generics.Collections,
  Data.DB,  NextBaseForm, DataGridFrame, FilterDefinition, FilterCriterion, FilterFrame,
  QueryResultOperations, NextQueryDefinition,
  LocalPreferences, PresenterConsultaBase,
  EditorCadastro, ValidationEntityOutputUnit;

type
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

  // Comando da consulta cujo Enabled acompanha a associacao do apresentador e a
  // linha corrente. O controle pertence ao formulario; a base apenas o atualiza.
  TComandoConsulta = record
    Controle: TControl;
    ExigeSelecao: Boolean;
  end;

  // Acao padrao da consulta associada a um metodo do apresentador. O retorno
  // indica se a operacao foi concluida; a base usa essa resposta para atualizar
  // a grade depois da exclusao.
  TAcaoConsulta = function: Boolean of object;

  // Base unica das consultas Next. Recebe a definicao da consulta, apresenta o
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
    imgListConsulta: TImageList;
    procedure btnSairClick(Sender: TObject);
  private
    FFiltersConfigured: Boolean;
    FFilterDefinition: TFilterDefinition;
    FDefinition: INextQueryDefinitionBase;
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
    // Apresentador da funcionalidade. A base responde pela liberacao a partir da
    // associacao aceita e nunca o libera com o evento da grade ainda ligado.
    FPresenterConsulta: TPresenterConsultaBase;
    // Comandos registrados pela funcionalidade: cada um e habilitado conforme a
    // associacao do apresentador e, quando exigido, a linha corrente.
    FComandosConsulta: TArray<TComandoConsulta>;
    // Botoes das acoes padrao da consulta. Nascem na primeira associacao e
    // pertencem ao painel, que os libera com o formulario.
    FBtnNovo: TButton;
    FBtnAlterar: TButton;
    FBtnExcluir: TButton;
    // Metodos do apresentador acionados por cada botao: sem o metodo a acao
    // permanece oculta e a faixa e reorganizada.
    FAcaoNovo: TAcaoConsulta;
    FAcaoAlterar: TAcaoConsulta;
    FAcaoExcluir: TAcaoConsulta;
    procedure ClearResult;
    procedure DoPesquisar(Sender: TObject);
    // A troca, a limpeza e a leitura de linha atualizam os comandos junto com a
    // grade.
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    function Pesquisar(const AExibirFalha: Boolean): Boolean;
    // True somente quando a grade esta vinculada ao leitor ativo da pesquisa
    // corrente da definicao.
    function HasActiveReader: Boolean;
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
    // Cria o botao da acao na primeira associacao e devolve a mesma instancia
    // nas seguintes.
    function CriarBotaoAcao(var ABotao: TButton; ALargura: Integer;
      AOnClick: TNotifyEvent): TButton;
    // Organiza os botoes visiveis da esquerda para a direita e oculta a faixa
    // quando nenhuma acao foi associada.
    procedure AjustarAcoesConsulta;
    // Handlers das acoes padrao; a exclusao reconsulta a grade somente depois
    // da execucao confirmada pelo apresentador.
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  protected
    // Permite que a tela filha interrompa a pesquisa antes de limpar o
    // resultado ou criar um novo leitor. A validacao dos filtros ocorre antes.
    // A base pede a autorizacao ao apresentador associado; telas sem
    // apresentador pesquisam sem ela.
    function CanPesquisar: Boolean; virtual;
    // Associa a definicao e o apresentador da funcionalidade. Attach e o gancho
    // da tela acontecem antes da posse: ate a atribuicao, a composicao continua
    // dona do apresentador e o libera se a associacao for recusada.
    procedure AssociarPresenter(APresenter: TPresenterConsultaBase;
      const ADefinition: INextQueryDefinitionBase; const ATitle: string;
      AQuickFilterEnabled: Boolean = False);
    // Gancho executado depois de Attach e antes da posse do apresentador: a tela
    // registra os comandos, os contratos e as acoes que dependem da definicao e
    // do proprio apresentador, que ainda pertence a composicao.
    procedure ApresentadorAssociado(APresenter: TPresenterConsultaBase;
      const ADefinition: INextQueryDefinitionBase); virtual;
    // Registra um controle da funcionalidade cujo Enabled acompanha a consulta.
    // Com AExigeSelecao, o controle so e habilitado com uma linha corrente.
    procedure RegistrarComando(AControl: TControl;
      AExigeSelecao: Boolean = False);
    // Associa a inclusao ao metodo do apresentador. O botao nasce na primeira
    // associacao; sem metodo ele permanece oculto.
    procedure AssociarAcaoInclusao(const AMetodo: TAcaoConsulta;
      const ACaption: string = 'Novo');
    // Associa a alteracao da linha corrente ao metodo do apresentador.
    procedure AssociarAcaoAlteracao(const AMetodo: TAcaoConsulta;
      const ACaption: string = 'Alterar');
    // Associa a exclusao da linha corrente ao metodo do apresentador. A base
    // reconsulta a grade depois da execucao confirmada.
    procedure AssociarAcaoExclusao(const AMetodo: TAcaoConsulta;
      const ACaption: string = 'Excluir');
    // Recalcula o Enabled dos controles registrados. Os botoes da propria
    // consulta, como Pesquisar e Sair, nao passam por aqui.
    procedure AtualizarComandos; virtual;
    // True quando a grade reflete uma linha corrente identificada. A base apenas
    // verifica o conjunto; a funcionalidade decide o que identifica o registro.
    function TemRegistroCorrente: Boolean; virtual;
    function CollectFilters: TFilterCriteriaResult;
    // Atualiza o resultado ja apresentado com o SQL e os parametros da ultima
    // pesquisa, mantendo a grade vinculada; sem leitor ativo, executa a pesquisa.
    // Retorna True quando a consulta foi relida, incluindo resultado vazio. A
    // negativa de autorizacao e a falha devolvem False sem limpar a grade.
    // Destina-se as telas que alteram dados e precisam de mensagem propria.
    function RefreshResult: Boolean;
    procedure DoInitializeView; override;
    // Abre a aba de cadastro da chave. Se ela ja existe, apenas a ativa e
    // preserva o rascunho; caso contrario cria aba, rodape, area de rolagem e
    // editor, chama AConfigurar antes de ativar e devolve True. Uma falha de
    // montagem libera a aba parcial e devolve False.
    function AbrirAba(const AChave, ATitulo: string;
      AConfigurar: TConfigurarAbaCadastro): Boolean; overload;
    function AbrirAba(const AChave, ATitulo: string): Boolean; overload;
    // Ativa a aba de cadastro ja existente e informa se ela foi encontrada. Nao
    // cria nem reconfigura a aba: o editor e o rascunho continuam intactos.
    function TryAtivarAba(const AChave: string): Boolean;
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
    // Encaminha o resultado de validacao da gravacao ao editor da aba que a
    // iniciou. Sem esse editor nada e apresentado.
    procedure ShowValidation(const AValidacao: ValidationEntityOutput);
    // Aviso de gravacao confirmada cuja reconsulta falhou. O descendente
    // fornece a mensagem de negocio; a base chama depois de fechar a aba.
    procedure AvisarSalvamentoSemAtualizacao; virtual;
    // Aviso de exclusao confirmada cuja reconsulta falhou. O descendente fornece
    // a mensagem de negocio da funcionalidade.
    procedure AvisarExclusaoSemAtualizacao; virtual;
    // Chave da aba cuja gravacao esta em andamento. A validacao produzida pelo
    // apresentador e encaminhada ao editor dessa aba.
    property ChaveAbaEmGravacao: string read FChaveAbaEmGravacao;
    // Apresentador associado, sem o tipo da funcionalidade: a tela usa o proprio
    // getter tipado para as chamadas especificas.
    property PresenterConsulta: TPresenterConsultaBase read FPresenterConsulta;
  public
    destructor Destroy; override;
    procedure ResetForSessionChange; override;
    // Qualquer aba de cadastro com rascunho pendente impede o fechamento; cada
    // editor responde pela propria pendencia.
    function HasPendingChanges: Boolean; override;
    // A aba de cadastro ativa recebe o foco quando o editor consegue; caso
    // contrario o foco continua com o host.
    procedure FocusView; override;
    // Recebe a definicao completa da consulta: colunas e operacoes vem dela e o
    // ciclo do leitor pertence a propria definicao.
    procedure Attach(const ADefinition: INextQueryDefinitionBase;
      const ATitle: string; AQuickFilterEnabled: Boolean = False); overload;
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
  MissingPresenterMessage =
    'O apresentador da consulta nao foi informado.';
  MissingCommandControlMessage =
    'O controle do comando da consulta nao foi informado.';
  MissingTitleMessage = 'O titulo da consulta nao foi informado.';
  AlreadyAttachedMessage =
    'A definicao da consulta ja foi associada a esta tela.';
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
  ExclusaoSemAtualizacaoMessage =
    'O registro foi excluído. Refaça a pesquisa para atualizar a consulta.';
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
  // habilitada quando a tela recebe a definicao na inicializacao.
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

  // O leitor pertence a definicao e segue o ciclo dela; a tela nao possui
  // leitor proprio.
  if FDefinition <> nil then
    FDefinition.Clear;

  // Nenhuma operacao pode alcancar a linha anterior depois da limpeza.
  if FOperations <> nil then
    FOperations.SetReader(nil);

  // A grade ficou sem conjunto: os comandos que dependem da linha corrente
  // acompanham a limpeza, assim como o evento do conjunto desvinculado.
  AtualizarComandos;
end;

function TfrmConsultaBase.Pesquisar(const AExibirFalha: Boolean): Boolean;
var
  Collected: TFilterCriteriaResult;
  Criteria: TFilterCriteria;
  DataSet: TDataSet;
begin
  // Segunda barreira contra composicao incompleta: sem definicao nenhuma
  // instrucao SQL e executada e o resultado anterior nao e alterado.
  if FDefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);

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
      // A definicao administra o proprio leitor; o resultado anterior ja foi
      // limpo e a grade recebe o conjunto desta pesquisa.
      FDefinition.Search(Criteria);
      DataSet := FDefinition.GetDataSet;

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
    // Resultado vazio, falha, negativa de autorizacao e reaquisicao terminam
    // aqui: os comandos refletem o conjunto efetivamente apresentado.
    AtualizarComandos;
  end;
end;

procedure TfrmConsultaBase.DoPesquisar(Sender: TObject);
begin
  Pesquisar(True);
end;

function TfrmConsultaBase.HasActiveReader: Boolean;
var
  DataSet: TDataSet;
begin
  DataSet := dsConsulta.DataSet;
  Result := (DataSet <> nil) and DataSet.Active;
  if not Result then
    Exit;

  Result := (FDefinition <> nil) and (FDefinition.GetDataSet <> nil);
end;

function TfrmConsultaBase.RefreshResult: Boolean;
begin
  Result := False;
  try
    if HasActiveReader then
    begin
      // A atualizacao reusa a autorizacao da consulta; a negativa preserva o
      // conjunto ja apresentado.
      if not CanPesquisar then
        Exit;

      try
        FDefinition.Refresh;

        // Um resultado vazio tambem conclui a atualizacao: a grade continua
        // vinculada e apresenta o conjunto relido.
        Result := True;
      except
        Result := False;
      end;
    end
    else
      // Sem leitor ativo, a atualizacao equivale a primeira pesquisa e aplica
      // os criterios da tela.
      Result := Pesquisar(False);
  finally
    AtualizarComandos;
  end;
end;

procedure TfrmConsultaBase.Attach(const ADefinition: INextQueryDefinitionBase;
  const ATitle: string; AQuickFilterEnabled: Boolean = False);
begin
  if ADefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);
  if Trim(ATitle) = '' then
    raise Exception.Create(MissingTitleMessage);
  if FDefinition <> nil then
    raise Exception.Create(AlreadyAttachedMessage);

  // Colunas e operacoes pertencem a definicao; a base apenas as apresenta. A
  // grade recebe a mesma definicao como origem das colunas padrao e do layout
  // persistido (leitura, gravacao e restauracao).
  FDefinition := ADefinition;
  FTitle := ATitle;
  FOperations := ADefinition.GetResultOperation();
  FQuickFilterEnabled := AQuickFilterEnabled;

  fraGrid.Configure(FOperations, FQuickFilterEnabled);
  fraGrid.AttachColumnLayoutSource(ADefinition);
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
  inherited;

  Caption := Format('Consulta - Next %d', [InstanceNumber]);
  fraGrid.DataSource := dsConsulta;
  fraGrid.OnTitleCtrlClick := GridTitleCtrlClick;
  fraGrid.OnFeedback := FrameFeedback;
  fraFiltros.OnFeedback := FrameFeedback;

  // Sem definicao nao existe consulta a apresentar: a falha de composicao
  // aparece na abertura da view, antes de a tela parecer operavel.
  if FDefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);

  PosicionarBotoesPesquisa;
  // A faixa so aparece quando a funcionalidade associou alguma acao; os botoes
  // visiveis ficam organizados da esquerda para a direita.
  AjustarAcoesConsulta;
  fraFiltros.Visible := FFiltersConfigured;
  btnPesquisar.Enabled := True;
  btnPesquisar.OnClick := DoPesquisar;
  if FTitle <> '' then
    Caption := FTitle;
  fraGrid.ConfigureColumns;

  // A troca de conjunto, a limpeza e a leitura de linha atualizam os comandos
  // da funcionalidade junto com a grade.
  dsConsulta.OnDataChange := dsConsultaDataChange;
  AtualizarComandos;
end;

function TfrmConsultaBase.CanPesquisar: Boolean;
begin
  // Telas sem apresentador pesquisam sem autorizacao propria; com apresentador,
  // a decisao e o feedback sao dele.
  Result := (FPresenterConsulta = nil) or FPresenterConsulta.AutorizarPesquisa;
end;

procedure TfrmConsultaBase.AssociarPresenter(
  APresenter: TPresenterConsultaBase;
  const ADefinition: INextQueryDefinitionBase; const ATitle: string;
  AQuickFilterEnabled: Boolean = False);
begin
  if APresenter = nil then
    raise Exception.Create(MissingPresenterMessage);
  if ADefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);

  // Attach e o gancho da tela podem recusar a associacao e nao assumem posse
  // alguma. A atribuicao abaixo e o ponto de transferencia: a partir dela a tela
  // libera o apresentador, inclusive na destruicao.
  Attach(ADefinition, ATitle, AQuickFilterEnabled);
  ApresentadorAssociado(APresenter, ADefinition);

  FPresenterConsulta := APresenter;
  try
    AtualizarComandos;
  except
    // Uma falha ao publicar os comandos devolve a posse: a composicao libera o
    // apresentador ao tratar a excecao.
    FPresenterConsulta := nil;
    raise;
  end;
end;

procedure TfrmConsultaBase.ApresentadorAssociado(
  APresenter: TPresenterConsultaBase;
  const ADefinition: INextQueryDefinitionBase);
begin
  // Padrao sem comandos: apenas a tela que possui acoes proprias usa a definicao
  // e o apresentador recebidos aqui, quando a associacao ja foi aceita mas a
  // posse ainda nao foi transferida.
end;

procedure TfrmConsultaBase.RegistrarComando(AControl: TControl;
  AExigeSelecao: Boolean);
var
  Indice: Integer;
  Comando: TComandoConsulta;
begin
  if AControl = nil then
    raise Exception.Create(MissingCommandControlMessage);

  // Cada controle tem um unico papel: registrar de novo substitui a exigencia
  // anterior em vez de manter dois estados para o mesmo botao.
  for Indice := 0 to High(FComandosConsulta) do
    if FComandosConsulta[Indice].Controle = AControl then
    begin
      FComandosConsulta[Indice].ExigeSelecao := AExigeSelecao;
      AtualizarComandos;
      Exit;
    end;

  Comando.Controle := AControl;
  Comando.ExigeSelecao := AExigeSelecao;
  FComandosConsulta := FComandosConsulta + [Comando];
  AtualizarComandos;
end;

function TfrmConsultaBase.CriarBotaoAcao(var ABotao: TButton;
  ALargura: Integer; AOnClick: TNotifyEvent): TButton;
begin
  // O botao nasce no painel de acoes e e liberado por ele com o formulario. A
  // mesma instancia e reaproveitada nas associacoes seguintes.
  if ABotao = nil then
  begin
    ABotao := TButton.Create(pnAcoesConsulta);
    ABotao.Parent := pnAcoesConsulta;
    ABotao.Width := ALargura;
    ABotao.Height := 32;
    ABotao.Top := 6;
    ABotao.OnClick := AOnClick;
  end;

  Result := ABotao;
end;

procedure TfrmConsultaBase.AjustarAcoesConsulta;
var
  Botoes: array[0..2] of TButton;
  Indice: Integer;
  Esquerda: Integer;
  HaVisivel: Boolean;
begin
  Botoes[0] := FBtnNovo;
  Botoes[1] := FBtnAlterar;
  Botoes[2] := FBtnExcluir;

  // As acoes associadas ocupam a faixa a partir da margem esquerda, sem lacunas
  // entre as que a funcionalidade oferece.
  Esquerda := 16;
  HaVisivel := False;
  for Indice := Low(Botoes) to High(Botoes) do
  begin
    if (Botoes[Indice] = nil) or (not Botoes[Indice].Visible) then
      Continue;

    Botoes[Indice].Left := Esquerda;
    Esquerda := Esquerda + Botoes[Indice].Width + 8;
    HaVisivel := True;
  end;

  // Sem acoes a faixa nao ocupa espaco na aba.
  pnAcoesConsulta.Visible := HaVisivel;
end;

procedure TfrmConsultaBase.AssociarAcaoInclusao(const AMetodo: TAcaoConsulta;
  const ACaption: string);
begin
  FAcaoNovo := AMetodo;

  if Assigned(AMetodo) then
  begin
    FBtnNovo := CriarBotaoAcao(FBtnNovo, 100, btnNovoClick);
    FBtnNovo.Caption := ACaption;
    // A inclusao nao parte da linha corrente: depende do apresentador associado.
    RegistrarComando(FBtnNovo, False);
  end;

  if FBtnNovo <> nil then
    FBtnNovo.Visible := Assigned(AMetodo);

  AjustarAcoesConsulta;
end;

procedure TfrmConsultaBase.AssociarAcaoAlteracao(const AMetodo: TAcaoConsulta;
  const ACaption: string);
begin
  FAcaoAlterar := AMetodo;

  if Assigned(AMetodo) then
  begin
    FBtnAlterar := CriarBotaoAcao(FBtnAlterar, 100, btnAlterarClick);
    FBtnAlterar.Caption := ACaption;
    // A alteracao parte do registro selecionado na grade.
    RegistrarComando(FBtnAlterar, True);
  end;

  if FBtnAlterar <> nil then
    FBtnAlterar.Visible := Assigned(AMetodo);

  AjustarAcoesConsulta;
end;

procedure TfrmConsultaBase.AssociarAcaoExclusao(const AMetodo: TAcaoConsulta;
  const ACaption: string);
begin
  FAcaoExcluir := AMetodo;

  if Assigned(AMetodo) then
  begin
    // A exclusao recebe mais largura para as legendas de negocio.
    FBtnExcluir := CriarBotaoAcao(FBtnExcluir, 150, btnExcluirClick);
    FBtnExcluir.Caption := ACaption;
    // A exclusao parte do registro selecionado na grade.
    RegistrarComando(FBtnExcluir, True);
  end;

  if FBtnExcluir <> nil then
    FBtnExcluir.Visible := Assigned(AMetodo);

  AjustarAcoesConsulta;
end;

procedure TfrmConsultaBase.AtualizarComandos;
var
  Indice: Integer;
  ExigeSelecao: Boolean;
  SelecaoValida: Boolean;
begin
  // A linha corrente e verificada uma unica vez por atualizacao, e somente
  // quando algum comando registrado depende dela.
  ExigeSelecao := False;
  for Indice := 0 to High(FComandosConsulta) do
    if FComandosConsulta[Indice].ExigeSelecao then
    begin
      ExigeSelecao := True;
      Break;
    end;

  SelecaoValida := False;
  if ExigeSelecao then
    SelecaoValida := TemRegistroCorrente;

  // Comandos sem selecao dependem apenas da associacao do apresentador; os
  // demais tambem exigem a linha corrente. Os botoes da consulta nao sao
  // registrados e nao sao tocados.
  for Indice := 0 to High(FComandosConsulta) do
    if FComandosConsulta[Indice].Controle <> nil then
      FComandosConsulta[Indice].Controle.Enabled :=
        (FPresenterConsulta <> nil) and
        ((not FComandosConsulta[Indice].ExigeSelecao) or SelecaoValida);
end;

function TfrmConsultaBase.TemRegistroCorrente: Boolean;
var
  DataSet: TDataSet;
begin
  DataSet := dsConsulta.DataSet;
  Result := (DataSet <> nil) and DataSet.Active and (not DataSet.IsEmpty);
end;

procedure TfrmConsultaBase.dsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
  AtualizarComandos;
end;

procedure TfrmConsultaBase.btnSairClick(Sender: TObject);
begin
  // O fechamento pertence ao host Delphi 2006: RequestClose passa pela
  // confirmacao individual e pela politica de ocultar/destruir da instancia.
  RequestClose;
end;

procedure TfrmConsultaBase.btnNovoClick(Sender: TObject);
begin
  // Sem metodo associado nao ha inclusao a executar.
  if Assigned(FAcaoNovo) then
    FAcaoNovo;
end;

procedure TfrmConsultaBase.btnAlterarClick(Sender: TObject);
begin
  // Sem metodo associado nao ha alteracao a executar.
  if Assigned(FAcaoAlterar) then
    FAcaoAlterar;
end;

procedure TfrmConsultaBase.btnExcluirClick(Sender: TObject);
begin
  // O apresentador identifica a linha corrente, confirma, autoriza e executa; a
  // negativa ou o cancelamento interrompe sem reconsultar a grade.
  if not Assigned(FAcaoExcluir) then
    Exit;
  if not FAcaoExcluir then
    Exit;

  // A grade atualizada e a confirmacao da exclusao; a falha de atualizacao
  // mantem a mensagem de negocio da funcionalidade.
  try
    if not RefreshResult then
      AvisarExclusaoSemAtualizacao;
  except
    AvisarExclusaoSemAtualizacao;
  end;
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

function TfrmConsultaBase.HasPendingChanges: Boolean;
var
  I: Integer;
  Editor: TWinControl;
  Cadastro: IEditorCadastro;
begin
  // A base nao conhece o tipo do editor: cada aba informa se o proprio rascunho
  // ainda conta como pendencia. Sem abas de cadastro nao ha o que gravar.
  Result := False;
  for I := 0 to TotalAbasCadastro - 1 do
  begin
    Editor := EditorAbaCadastro(I);
    if Editor = nil then
      Continue;
    if not Supports(Editor, IEditorCadastro, Cadastro) then
      Continue;

    if Cadastro.HasPendingChanges then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TfrmConsultaBase.FocusView;
var
  Editor: TWinControl;
  Cadastro: IEditorCadastro;
begin
  // Com uma aba de cadastro ativa, o foco pertence ao editor daquela aba. Sem
  // editor que o receba, o foco permanece com o host.
  Editor := EditorAbaAtiva;
  if Editor <> nil then
    if Supports(Editor, IEditorCadastro, Cadastro) then
      if Cadastro.TryFocus then
        Exit;

  inherited;
end;

destructor TfrmConsultaBase.Destroy;
begin
  try
    // Desligar o evento antes de liberar o apresentador impede que a atualizacao
    // dos comandos alcance uma instancia ja liberada ou um formulario em
    // destruicao.
    if dsConsulta <> nil then
    begin
      dsConsulta.OnDataChange := nil;
      dsConsulta.DataSet := nil;
    end;
  finally
    try
      // Desvincular o conjunto ja ocorreu; liberar a definicao encerra o leitor
      // da consulta antes de a tela terminar.
      FDefinition := nil;
    finally
      // O apresentador pertence a tela a partir da associacao aceita e sai com o
      // evento da grade ja desligado.
      FreeAndNil(FPresenterConsulta);

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

procedure TfrmConsultaBase.AvisarExclusaoSemAtualizacao;
begin
  // Padrao da base para telas que nao fornecem mensagem propria. A exclusao ja
  // terminou; a mensagem apenas orienta a repetir a consulta.
  ShowWarning(ExclusaoSemAtualizacaoMessage);
end;

procedure TfrmConsultaBase.ShowValidation(
  const AValidacao: ValidationEntityOutput);
var
  Editor: TWinControl;
  Cadastro: IEditorCadastro;
begin
  // A validacao pertence a aba que iniciou a gravacao; uma troca de sessao pode
  // te-la encerrado antes desta chamada.
  Editor := EditorDaAba(ChaveAbaEmGravacao);
  if Editor = nil then
    Exit;

  if Supports(Editor, IEditorCadastro, Cadastro) then
    Cadastro.ShowValidation(AValidacao);
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

function TfrmConsultaBase.TryAtivarAba(const AChave: string): Boolean;
var
  Indice: Integer;
begin
  Indice := IndiceAbaCadastro(AChave);
  Result := Indice >= 0;
  if not Result then
    Exit;

  // Reapresentar a aba nao recria o editor nem recarrega o registro; o foco
  // pertence ao descendente, que conhece o editor.
  pcAbas.ActivePage := FAbasCadastro[Indice].Aba;
end;

procedure TfrmConsultaBase.AtivarAba(const AChave: string);
begin
  // A abertura da aba continua usando a assinatura sem retorno; sem aba
  // existente a ativacao nao faz nada.
  TryAtivarAba(AChave);
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
  // A atualizacao do resultado pode falhar com False ou com excecao antes do
  // tratamento interno. Em ambos os casos a gravacao esta concluida: a aba
  // permanece fechada e o usuario e orientado a repetir a pesquisa.
  try
    if not RefreshResult then
      AvisarSalvamentoSemAtualizacao;
  except
    AvisarSalvamentoSemAtualizacao;
  end;
end;

end.
