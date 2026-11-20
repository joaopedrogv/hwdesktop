unit ConsultaBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Controls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Forms, Vcl.StdCtrls, Vcl.Buttons, Vcl.ImgList, System.Generics.Collections,
  Data.DB,  NextBaseForm, DataGridFrame, FilterDefinition, FilterCriterion, FilterFrame,
  QueryResultOperations, NextQueryDefinition,
  LocalPreferences, PresenterConsultaBase,
  EditorCadastro, ConsultaBaseView;

type
  // Configura o editor recem-criado antes de a aba ser ativada: e o ponto em que o rascunho da funcionalidade nasce.
  TConfigurarAbaCadastro = reference to procedure(AEditor: TWinControl);

  // Intencao registrada no clique: somente a gravacao confirmada reconsulta a grade depois de liberar a aba.
  TIntencaoFechamentoAba = (ifaNenhuma, ifaSalvar, ifaCancelar);

const
  // Chave da unica aba de inclusao da janela.
  ChaveAbaInclusao = '@inclusao';
  // Mensagem privada da base: o comando da aba e concluido depois que o evento de clique retorna, quando liberar a aba
  // nao destroi mais o controle em uso.
  WM_COMANDO_ABA = WM_APP + 311;

type
  // Descritor de uma aba de cadastro aberta pela base. O objeto pertence a lista da base e nao possui a aba nem o
  // editor: ambos pertencem ao PageControl, que os libera quando a aba e fechada. O token identifica a montagem
  // corrente, porque um pedido de fechamento pode ser tratado depois do encerramento.
  TAbaCadastro = class
  public
    Chave: string;
    Aba: TTabSheet;
    Editor: TWinControl;
    Token: Integer;
    Intencao: TIntencaoFechamentoAba;
  end;

  // Comando da consulta cujo Enabled acompanha a associacao do apresentador e a linha corrente. O controle pertence ao
  // formulario; a base apenas o atualiza.
  TComandoConsulta = record
    Controle: TControl;
    ExigeSelecao: Boolean;
  end;

  // O retorno indica se a operacao foi concluida; a base usa essa resposta para atualizar a grade depois da exclusao.
  TAcaoConsulta = function: Boolean of object;

  // Base unica das consultas Next. Cada inclusao autorizada e cada registro escolhido para alteracao abrem uma aba
  // propria; o editor nasce na area de rolagem da aba, que o libera, e o rodape pertence ao proprio editor.
  TfrmConsultaBase = class(TfrmNextBase, IConsultaBaseView, IEditorCadastroHost)
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
    // Abas de cadastro abertas, uma por chave. A lista nasce no primeiro uso e e liberada na destruicao; os descritores
    // nao possuem abas nem editores.
    FAbasCadastro: TObjectList<TAbaCadastro>;
    // Identidade monotonica de cada montagem: um pedido de fechamento registrado para uma aba anterior nao pode
    // alcancar a proxima.
    FTokenAbaCadastro: Integer;
    // A base responde pela liberacao a partir da associacao aceita e nunca o libera com o evento da grade ainda ligado.
    FPresenterConsulta: TPresenterConsultaBase;
    FComandosConsulta: TArray<TComandoConsulta>;
    // Nascem na primeira associacao e pertencem ao painel, que os libera com o formulario.
    FBtnNovo: TButton;
    FBtnAlterar: TButton;
    FBtnExcluir: TButton;
    // Metodos do apresentador acionados por cada botao: sem o metodo a acao permanece oculta e a faixa e reorganizada.
    FAcaoNovo: TAcaoConsulta;
    FAcaoAlterar: TAcaoConsulta;
    FAcaoExcluir: TAcaoConsulta;
    procedure ClearResult;
    procedure DoPesquisar(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    function Pesquisar(const AExibirFalha: Boolean): Boolean;
    function HasActiveReader: Boolean;
    procedure GridTitleCtrlClick(Sender: TObject; const AFieldName: string);
    procedure FrameFeedback(Sender: TObject; const AMensagem: string);
    procedure PosicionarBotoesPesquisa;
    function ListaAbasCadastro: TObjectList<TAbaCadastro>;
    function IndiceAbaCadastro(const AChave: string): Integer;
    function AbaCadastroPorToken(AToken: Integer): TAbaCadastro;
    function AbaDoControle(AControle: TControl): TTabSheet;
    function AbaCadastroDoControle(AOrigem: TObject): TAbaCadastro;

    procedure EditorSalvo(const AEditor: TWinControl);
    procedure EditorCancelado(const AEditor: TWinControl);
    procedure FinalizarEditor(const AEditor: TWinControl; AIntencao: TIntencaoFechamentoAba);
    procedure SolicitarFechamentoAba(AAba: TAbaCadastro; AIntencao: TIntencaoFechamentoAba);
    procedure TratarPedidoFechamentoAba(AToken: Integer);
    procedure WMCmdAba(var AMessage: TMessage);
      message WM_COMANDO_ABA;
    procedure AtualizarAposSalvar;
    function CriarBotaoAcao(var ABotao: TButton; ALargura: Integer; AOnClick: TNotifyEvent): TButton;
    procedure AjustarAcoesConsulta;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  protected
    // Operacoes da configuracao inicial, expostas pela ConfigurarTela da tela concreta. A definicao e associada
    // primeiro; os filtros e o editor de cadastro vem em seguida; a posse do apresentador e sempre a ultima etapa.
    procedure Attach(const ADefinition: INextQueryDefinitionBase;
      const ATitle: string; AQuickFilterEnabled: Boolean = False); overload;
    procedure ConfigureFilters(const ADefinition: TFilterDefinition;
      const APreferences: ILocalPreferences; const AIdentity: string);
    procedure AssociarPresenter(APresenter: TPresenterConsultaBase);
    function CanPesquisar: Boolean; virtual;
    // Gancho executado depois de Attach e antes da posse do apresentador: a tela registra os comandos, os contratos e
    // as acoes que dependem da definicao e do proprio apresentador, que ainda pertence a composicao.
    procedure ApresentadorAssociado(APresenter: TPresenterConsultaBase;
      const ADefinition: INextQueryDefinitionBase); virtual;
    procedure RegistrarComando(AControl: TControl; AExigeSelecao: Boolean = False);
    procedure AssociarAcaoInclusao(const AMetodo: TAcaoConsulta; const ACaption: string = 'Novo');
    procedure AssociarAcaoAlteracao(const AMetodo: TAcaoConsulta; const ACaption: string = 'Alterar');
    procedure AssociarAcaoExclusao(const AMetodo: TAcaoConsulta; const ACaption: string = 'Excluir');
    // Os botoes da propria consulta, como Pesquisar e Sair, nao sao registrados.
    procedure AtualizarComandos; virtual;
    // A base verifica apenas o conjunto; a funcionalidade decide o que identifica o registro.
    function TemRegistroCorrente: Boolean; virtual;
    function CollectFilters: TFilterCriteriaResult;
    // Devolve False na negativa de autorizacao e na falha, sem limpar a grade.
    function RefreshResult: Boolean;
    procedure DoInitializeView; override;
    function AbrirAba(const AChave, ATitulo: string; AConfigurar: TConfigurarAbaCadastro): Boolean;
    function TryAtivarAba(const AChave: string): Boolean;
    procedure AtivarAba(const AChave: string);
    procedure FecharAba(const AChave: string);
    procedure FecharAbas;
    function AbaAberta(const AChave: string): Boolean;
    function AbaAtiva(const AChave: string): Boolean;
    function HaAbaAtiva: Boolean;
    function ChaveAbaAtiva: string;
    function EditorAbaAtiva: TWinControl;
    function TotalAbasCadastro: Integer;
    function EditorAbaCadastro(AIndice: Integer): TWinControl;
    // Cria o editor com Owner = AParent; a base define Parent e Align e a area de rolagem o libera, nunca o
    // descendente.
    function CriarEditor(const AChave: string; AParent: TWinControl): TWinControl; virtual;

    // Aviso de gravacao confirmada cuja reconsulta falhou: o descendente fornece a mensagem de negocio e a base chama
    // depois de fechar a aba.
    procedure AvisarSalvamentoSemAtualizacao; virtual;
    // Aviso de exclusao confirmada cuja reconsulta falhou: o descendente fornece a mensagem de negocio.
    procedure AvisarExclusaoSemAtualizacao; virtual;

    // Sem o tipo da funcionalidade; a tela usa o proprio getter tipado.
    property PresenterConsulta: TPresenterConsultaBase read FPresenterConsulta;
  public
    destructor Destroy; override;
    procedure ResetForSessionChange; override;
    function AtivarEdicao(const AChave: string): Boolean;
    function AtivarInclusao(const AChave: string = '@inclusao'): Boolean;
    // Qualquer aba de cadastro com rascunho pendente impede o fechamento; cada editor responde pela propria pendencia.
    function HasPendingChanges: Boolean; override;
    // A aba de cadastro ativa recebe o foco quando o editor consegue; caso contrario o foco continua com o host.
    procedure FocusView; override;
  end;

implementation

{$R *.dfm}

const
  MissingDefinitionMessage = 'A definicao da consulta nao foi informada.';
  EditorNaoInformadoMessage = 'A aba de cadastro não recebeu seu editor.';

procedure TfrmConsultaBase.ConfigureFilters(const ADefinition: TFilterDefinition;
  const APreferences: ILocalPreferences; const AIdentity: string);
begin
  if FFiltersConfigured then
    raise Exception.Create('Os filtros desta tela já foram configurados.');

  if APreferences = nil then
    raise Exception.Create('As preferências locais dos filtros não foram informadas.');

  if Trim(AIdentity) = '' then
    raise Exception.Create('A identidade dos filtros não foi informada.');

  // O frame e inline no DFM: a configuracao injeta a definicao e as preferencias na instancia existente e a tela
  // continua proprietaria.
  fraFiltros.Configure(ADefinition, APreferences, AIdentity, fpQuerySql);
  FFilterDefinition := ADefinition;
  FFiltersConfigured := True;

  fraFiltros.Visible := True;
end;

function TfrmConsultaBase.CollectFilters: TFilterCriteriaResult;
begin
  if not FFiltersConfigured then
    raise Exception.Create('Os filtros desta tela ainda não foram configurados.');

  Result := fraFiltros.CollectCriteria;
end;

procedure TfrmConsultaBase.GridTitleCtrlClick(Sender: TObject; const AFieldName: string);
begin
  if FFiltersConfigured then
    fraFiltros.TrySelectField(AFieldName);
end;

procedure TfrmConsultaBase.FrameFeedback(Sender: TObject; const AMensagem: string);
begin
  ShowWarning(AMensagem);
end;

procedure TfrmConsultaBase.ClearResult;
begin
  fraGrid.ClearSorting();
  fraGrid.ClearQuickFilters();

  // Desvincular antes de limpar impede que a grade retenha um dataset liberado.
  dsConsulta.DataSet := nil;

  // O leitor pertence a definicao e segue o ciclo dela; a tela nao possui leitor proprio.
  if FDefinition <> nil then
    FDefinition.Clear;

  // Nenhuma operacao pode alcancar a linha anterior depois da limpeza.
  if FOperations <> nil then
    FOperations.SetReader(nil);

  AtualizarComandos;
end;

function TfrmConsultaBase.Pesquisar(const AExibirFalha: Boolean): Boolean;
var
  Collected: TFilterCriteriaResult;
  Criteria: TFilterCriteria;
  DataSet: TDataSet;
begin
  // Segunda barreira contra composicao incompleta: sem definicao, nenhuma pesquisa e executada.
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
      // A definicao administra o proprio leitor.
      FDefinition.Search(Criteria);
      DataSet := FDefinition.GetDataSet;

      if DataSet = nil then
        raise Exception.Create('O leitor de dados da consulta nao foi informado.');
      dsConsulta.DataSet := DataSet;

      // Resultado vazio tambem conclui a pesquisa.
      Result := True;
      if DataSet.IsEmpty then
      begin
        ClearResult;
        ShowInformation(Format('Nenhum registro foi encontrado para a consulta de %s.', [FTitle]));
      end;
    except
      Result := False;
      ClearResult;
      // A falha generica pertence ao botao; a repeticao programatica deixa a mensagem especifica para o chamador.
      if AExibirFalha then
        ShowError(Format('Nao foi possivel consultar os dados de %s.', [FTitle]));
    end;
  finally
    FPesquisando := False;
    btnPesquisar.Enabled := True;
    // Os comandos refletem o conjunto efetivamente apresentado, inclusive apos falha ou negativa.
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
      // A atualizacao reusa a autorizacao da consulta; a negativa preserva o conjunto ja apresentado.
      if not CanPesquisar then
        Exit;

      try
        FDefinition.Refresh;

        // Resultado vazio tambem conclui a atualizacao.
        Result := True;
      except
        Result := False;
      end;
    end
    else
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
    raise Exception.Create('O titulo da consulta nao foi informado.');
  if FDefinition <> nil then
    raise Exception.Create('A definicao da consulta ja foi associada a esta tela.');

  // Colunas e operacoes pertencem a definicao; a grade usa a mesma definicao como origem do layout persistido.
  FDefinition := ADefinition;
  FTitle := ATitle;
  FOperations := ADefinition.GetResultOperation();
  FQuickFilterEnabled := AQuickFilterEnabled;

  fraGrid.Configure(FOperations, FQuickFilterEnabled);
  fraGrid.AttachColumnLayoutSource(ADefinition);
end;

procedure TfrmConsultaBase.PosicionarBotoesPesquisa;
begin
  // Sair ocupa a borda direita e Pesquisar fica imediatamente a esquerda, com intervalo fixo. As ancoras preservam as
  // duas distancias no redimensionamento posterior, quando o frame de filtros ja nao e tocado.

  btnPesquisar.Align := alNone;
  btnPesquisar.Anchors := [akTop, akLeft];
  btnPesquisar.Left := btnSair.Left - btnPesquisar.Width - 8;

  btnSair.Align := alNone;
  btnSair.Anchors := [akTop, akRight];
  btnSair.Left := pnFiltros.ClientWidth - btnSair.Width - 16;

  // A largura minima impede que os botoes invadam os filtros a esquerda.
  Constraints.MinWidth := btnPesquisar.Left + btnPesquisar.Width + 8 + btnSair.Width + 16;
end;

procedure TfrmConsultaBase.DoInitializeView;
begin
  inherited;

  Caption := Format('Consulta - Next %d', [InstanceNumber]);
  fraGrid.DataSource := dsConsulta;
  fraGrid.OnTitleCtrlClick := GridTitleCtrlClick;
  fraGrid.OnFeedback := FrameFeedback;
  fraFiltros.OnFeedback := FrameFeedback;

  // Sem definicao nao ha consulta a apresentar: a falha aparece na abertura da view, antes de a tela parecer operavel.
  if FDefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);

  PosicionarBotoesPesquisa;
  AjustarAcoesConsulta;
  fraFiltros.Visible := FFiltersConfigured;
  btnPesquisar.Enabled := True;
  btnPesquisar.OnClick := DoPesquisar;
  if FTitle <> '' then
    Caption := FTitle;
  fraGrid.ConfigureColumns;

  dsConsulta.OnDataChange := dsConsultaDataChange;
  AtualizarComandos;
end;

function TfrmConsultaBase.CanPesquisar: Boolean;
begin
  // Sem apresentador, a tela pesquisa sem autorizacao propria.
  Result := (FPresenterConsulta = nil) or FPresenterConsulta.AutorizarPesquisa;
end;

procedure TfrmConsultaBase.AssociarPresenter(APresenter: TPresenterConsultaBase);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador da consulta nao foi informado.');
  if FDefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);

  // O gancho da tela pode recusar a associacao e nao assume posse alguma. A atribuicao abaixo e o ponto de
  // transferencia: a partir dela a tela libera o apresentador, inclusive na destruicao.
  ApresentadorAssociado(APresenter, FDefinition);

  FPresenterConsulta := APresenter;
  try
    AtualizarComandos;
  except
    // Uma falha ao publicar os comandos devolve a posse: a composicao libera o apresentador ao tratar a excecao.
    FPresenterConsulta := nil;
    raise;
  end;
end;

procedure TfrmConsultaBase.ApresentadorAssociado(
  APresenter: TPresenterConsultaBase; const ADefinition: INextQueryDefinitionBase);
begin
  // Padrao sem comandos: o gancho roda depois de Attach e antes da posse.
end;

procedure TfrmConsultaBase.RegistrarComando(AControl: TControl; AExigeSelecao: Boolean);
var
  Indice: Integer;
  Comando: TComandoConsulta;
begin
  if AControl = nil then
    raise Exception.Create('O controle do comando da consulta nao foi informado.');

  // Cada controle tem um unico papel: registrar de novo substitui a exigencia anterior em vez de manter dois estados
  // para o mesmo botao.
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

function TfrmConsultaBase.CriarBotaoAcao(var ABotao: TButton; ALargura: Integer; AOnClick: TNotifyEvent): TButton;
begin
  // O botao nasce no painel de acoes e e liberado por ele com o formulario. A mesma instancia e reaproveitada nas
  // associacoes seguintes.
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

procedure TfrmConsultaBase.AssociarAcaoInclusao(const AMetodo: TAcaoConsulta; const ACaption: string);
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

procedure TfrmConsultaBase.AssociarAcaoAlteracao(const AMetodo: TAcaoConsulta; const ACaption: string);
begin
  FAcaoAlterar := AMetodo;

  if Assigned(AMetodo) then
  begin
    FBtnAlterar := CriarBotaoAcao(FBtnAlterar, 100, btnAlterarClick);
    FBtnAlterar.Caption := ACaption;
    RegistrarComando(FBtnAlterar, True);
  end;

  if FBtnAlterar <> nil then
    FBtnAlterar.Visible := Assigned(AMetodo);

  AjustarAcoesConsulta;
end;

procedure TfrmConsultaBase.AssociarAcaoExclusao(const AMetodo: TAcaoConsulta; const ACaption: string);
begin
  FAcaoExcluir := AMetodo;

  if Assigned(AMetodo) then
  begin
    // A exclusao recebe mais largura para as legendas de negocio.
    FBtnExcluir := CriarBotaoAcao(FBtnExcluir, 150, btnExcluirClick);
    FBtnExcluir.Caption := ACaption;
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
  // A linha corrente e verificada uma unica vez por atualizacao, e somente quando algum comando registrado depende
  // dela.
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

  for Indice := 0 to High(FComandosConsulta) do
    if FComandosConsulta[Indice].Controle <> nil then
      FComandosConsulta[Indice].Controle.Enabled := (FPresenterConsulta <> nil) and
        ((not FComandosConsulta[Indice].ExigeSelecao) or SelecaoValida);
end;

function TfrmConsultaBase.TemRegistroCorrente: Boolean;
var
  DataSet: TDataSet;
begin
  DataSet := dsConsulta.DataSet;
  Result := (DataSet <> nil) and DataSet.Active and (not DataSet.IsEmpty);
end;

procedure TfrmConsultaBase.dsConsultaDataChange(Sender: TObject; Field: TField);
begin
  AtualizarComandos;
end;

procedure TfrmConsultaBase.btnSairClick(Sender: TObject);
begin
  // O fechamento pertence ao host Delphi 2006: RequestClose passa pela confirmacao individual e pela politica de
  // ocultar/destruir da instancia.
  RequestClose;
end;

procedure TfrmConsultaBase.btnNovoClick(Sender: TObject);
begin
  if Assigned(FAcaoNovo) then
    FAcaoNovo;
end;

procedure TfrmConsultaBase.btnAlterarClick(Sender: TObject);
begin
  if Assigned(FAcaoAlterar) then
    FAcaoAlterar;
end;

procedure TfrmConsultaBase.btnExcluirClick(Sender: TObject);
begin
  if not Assigned(FAcaoExcluir) then
    Exit;
  if not FAcaoExcluir then
    Exit;

  // A falha de atualizacao mantem a mensagem de negocio da funcionalidade.
  try
    if not RefreshResult then
      AvisarExclusaoSemAtualizacao;
  except
    AvisarExclusaoSemAtualizacao;
  end;
end;

procedure TfrmConsultaBase.ResetForSessionChange;
begin
  // O rascunho e a aba pertencem a sessao encerrada. Fechar antes da limpeza garante que os frames descartem os
  // rascunhos e nao reabram uma inclusao com empresas do usuario anterior. Um comando pendente tambem morre aqui.
  FecharAbas;
  ClearResult;

  // O layout pertence ao login corrente: recarregar evita reapresentar, em uma janela oculta, a preferencia do usuario
  // anterior.
  fraGrid.ReloadColumnLayout;
end;

function TfrmConsultaBase.HasPendingChanges: Boolean;
var
  I: Integer;
  Editor: TWinControl;
  Cadastro: IEditorCadastro;
begin
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
    // Desligar o evento antes de liberar o apresentador impede que a atualizacao dos comandos alcance uma instancia ja
    // liberada ou um formulario em destruicao.
    if dsConsulta <> nil then
    begin
      dsConsulta.OnDataChange := nil;
      dsConsulta.DataSet := nil;
    end;
  finally
    try
      // Liberar a definicao encerra o leitor da consulta antes de a tela terminar.
      FDefinition := nil;
    finally
      // O apresentador pertence a tela a partir da associacao aceita e sai com o evento da grade ja desligado.
      FreeAndNil(FPresenterConsulta);

      // A destruicao nao executa pedidos pendentes: pcAbas libera as abas remanescentes e, com elas, rodapes, areas e
      // editores. Aqui se descarta apenas a lista de descritores.
      FreeAndNil(FAbasCadastro);
      inherited;
    end;
  end;
end;

function TfrmConsultaBase.CriarEditor(const AChave: string; AParent: TWinControl): TWinControl;
begin
  raise Exception.Create(EditorNaoInformadoMessage);
end;

procedure TfrmConsultaBase.AvisarSalvamentoSemAtualizacao;
begin
  ShowWarning('O registro foi salvo. Repita a pesquisa para atualizar a consulta.');
end;

procedure TfrmConsultaBase.AvisarExclusaoSemAtualizacao;
begin
  ShowWarning('O registro foi excluído. Refaça a pesquisa para atualizar a consulta.');
end;

function TfrmConsultaBase.AtivarEdicao(const AChave: string): Boolean;
begin
  Result := TryAtivarAba(AChave);
end;

function TfrmConsultaBase.AtivarInclusao(const AChave: string = '@inclusao'): Boolean;
begin
  Result := TryAtivarAba(AChave);
end;

function TfrmConsultaBase.ListaAbasCadastro: TObjectList<TAbaCadastro>;
begin
  // A lista nasce no primeiro uso: a tela nao sobrescreve o construtor.
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

function TfrmConsultaBase.AbaCadastroPorToken(AToken: Integer): TAbaCadastro;
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

function TfrmConsultaBase.AbaCadastroDoControle(AOrigem: TObject): TAbaCadastro;
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
  if (FAbasCadastro = nil) or (AIndice < 0) or (AIndice >= FAbasCadastro.Count) then
    Exit;

  Result := FAbasCadastro[AIndice].Editor;
end;

function TfrmConsultaBase.AbrirAba(const AChave, ATitulo: string; AConfigurar: TConfigurarAbaCadastro): Boolean;
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
    raise Exception.Create('A chave da aba de cadastro não foi informada.');

  // Uma aba por chave: reabrir apenas ativa a existente, sem reconfigurar o editor nem descartar o rascunho.
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

    // A area ocupa o restante da aba e e a dona do editor: libera-la encerra o editor junto.
    Area := TScrollBox.Create(Tela);
    Area.Parent := Tela;
    Area.Align := alClient;
    Area.BorderStyle := bsNone;

    Editor := CriarEditor(Chave, Area);
    if Editor = nil then
      raise Exception.Create(EditorNaoInformadoMessage);
    Editor.Parent := Area;
    Descritor.Editor := Editor;

    // O editor traz o proprio rodape e rola os proprios campos.
    Editor.Align := alClient;

    // O rascunho nasce com o editor, antes de a aba ser ativada.
    if Assigned(AConfigurar) then
      AConfigurar(Editor);

    Inc(FTokenAbaCadastro);
    Descritor.Token := FTokenAbaCadastro;
    ListaAbasCadastro.Add(Descritor);

    AtivarAba(Chave);
    Result := True;
  except
    // A aba parcial e liberada inteira: o editor e o rascunho morrem junto. O descritor e descartado antes da aba.
    Indice := IndiceAbaCadastro(Chave);
    if Indice >= 0 then
      FAbasCadastro.Delete(Indice)
    else
      Descritor.Free;
    Tela.Free;
    Result := False;
  end;
end;

function TfrmConsultaBase.TryAtivarAba(const AChave: string): Boolean;
var
  Indice: Integer;
begin
  Indice := IndiceAbaCadastro(AChave);
  Result := Indice >= 0;
  if not Result then
    Exit;

  // Reapresentar a aba nao recria o editor nem recarrega o registro; o foco pertence ao descendente, que conhece o
  // editor.
  pcAbas.ActivePage := FAbasCadastro[Indice].Aba;
end;

procedure TfrmConsultaBase.AtivarAba(const AChave: string);
begin
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

  // O descritor e liberado antes da aba: depois disso nenhum pedido antigo identifica esta montagem. A aba libera
  // rodape, area, editor e rascunho.
  FAbasCadastro.Delete(Indice);
  Tela.Free;
end;

procedure TfrmConsultaBase.FecharAbas;
var
  Chave: string;
begin
  // Cada fechamento remove o proprio descritor: o laco sempre parte da ultima aba ainda aberta.
  while (FAbasCadastro <> nil) and (FAbasCadastro.Count > 0) do
  begin
    Chave := FAbasCadastro[FAbasCadastro.Count - 1].Chave;
    FecharAba(Chave);
  end;
end;

procedure TfrmConsultaBase.SolicitarFechamentoAba(AAba: TAbaCadastro; AIntencao: TIntencaoFechamentoAba);
begin
  // O pedido guarda a intencao e viaja com o token da montagem: quando a mensagem for tratada, a aba pode ja ter sido
  // encerrada por uma troca de usuario.
  AAba.Intencao := AIntencao;
  PostMessage(Handle, WM_COMANDO_ABA, WPARAM(AAba.Token), 0);
end;

procedure TfrmConsultaBase.EditorSalvo(const AEditor: TWinControl);
begin
  FinalizarEditor(AEditor, ifaSalvar);
end;

procedure TfrmConsultaBase.EditorCancelado(const AEditor: TWinControl);
begin
  FinalizarEditor(AEditor, ifaCancelar);
end;

procedure TfrmConsultaBase.FinalizarEditor(const AEditor: TWinControl; AIntencao: TIntencaoFechamentoAba);
var
  Aba: TAbaCadastro;
begin
  Aba := nil;
  if AEditor <> nil then
    Aba := AbaCadastroDoControle(AEditor);
  if (Aba = nil) or (Aba.Intencao <> ifaNenhuma) then
    Exit;

  // O pedido apenas registra a intencao: a aba e liberada depois que o evento de clique retorna.
  SolicitarFechamentoAba(Aba, AIntencao);
end;

procedure TfrmConsultaBase.TratarPedidoFechamentoAba(AToken: Integer);
var
  Aba: TAbaCadastro;
  Intencao: TIntencaoFechamentoAba;
begin
  // A aba e reconhecida pelo token da montagem; sem aba, o pedido e descartado.
  Aba := AbaCadastroPorToken(AToken);
  if Aba = nil then
    Exit;

  // O pedido e consumido uma unica vez.
  Intencao := Aba.Intencao;
  Aba.Intencao := ifaNenhuma;
  if Intencao = ifaNenhuma then
    Exit;

  FecharAba(Aba.Chave);

  // Somente a gravacao confirmada atualiza a consulta; o cancelamento termina aqui.
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
  // A falha da atualizacao nao desfaz a gravacao: a aba permanece fechada e o usuario e orientado a repetir a pesquisa.
  try
    if not RefreshResult then
      AvisarSalvamentoSemAtualizacao;
  except
    AvisarSalvamentoSemAtualizacao;
  end;
end;

end.
