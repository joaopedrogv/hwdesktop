unit EventosDFeForm;

interface

uses
  System.SysUtils, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm,
  PresenterConsultaBase, NextQueryDefinition, LocalPreferences, EventosDFeView,
  EventosDFePresenter, EventosDFeQueryDefinition, TipoEventoDFeUnit, EditorCadastro, System.ImageList, Vcl.ImgList,
  Data.DB, DataGridFrame, Vcl.Buttons, FilterFrame, Vcl.ExtCtrls, Vcl.ComCtrls, System.Classes;

type
  // Cada inclusão e cada registro alterado ocupam uma aba própria, cujo editor é dono do rascunho e do apresentador do
  // cadastro.
  TfrmEventosDFe = class(TfrmConsultaBase, IEventosDFeView)
    ckLixeira: TCheckBox;
    btnRestaurar: TButton;
    btnTransmitir: TButton;
    btnConsultarSituacao: TButton;
    procedure ckLixeiraClick(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure btnConsultarSituacaoClick(Sender: TObject);
  private
    FDefinicaoSelecao: INextQueryDefinition<TEventoDFeSelecionado>;
    FOperacaoEmAndamento: Boolean;
    // A tela não conhece as dependências do editor e não guarda aba, frame nem rascunho.
    FCriarEditorAba: TCriarEditorCadastroComandos;
    procedure AtualizarAposOperacao;
    procedure ConfigurarCriacaoEditor(const ACriarEditor: TCriarEditorCadastroComandos);
    procedure DesabilitarComandos;
    procedure IniciarEspera(const AComando: TButton; const ARotulo: string);
    procedure EncerrarEspera;
    function EditorDisponivel(ATipo: TipoEventoDFe): Boolean;
    function PrepararRestauracao(const AEditor: TWinControl; const AId: string): Boolean;
  protected
    procedure ApresentadorAssociado(APresenter: TPresenterConsultaBase;
      const ADefinition: INextQueryDefinitionBase); override;
    function TemRegistroCorrente: Boolean; override;
    procedure AtualizarComandos; override;
    function CriarEditor(const AChave: string; AParent: TWinControl): TWinControl; override;
    procedure AvisarSalvamentoSemAtualizacao; override;
    procedure AvisarExclusaoSemAtualizacao; override;
  public
    function SelecionarTipoEvento(out ATipo: TipoEventoDFe): Boolean;
    // Opção lida pela definição em cada pesquisa: vale para a próxima busca e não altera o resultado já apresentado.
    function IsLixeiraSearch: Boolean;
    function AbrirInclusao(const AChave, ATitulo: string): Boolean;
    function AbrirEdicao(const ASelecao: TEventoDFeSelecionado; AModo: TModoEventoDFe): Boolean;
    procedure IniciarTransmissao;
    procedure EncerrarTransmissao;
    procedure IniciarConsultaSituacao;
    procedure EncerrarConsultaSituacao;
    procedure ConfigurarTela(const ADefinition: INextQueryDefinition<TEventoDFeSelecionado>;
      const APresenter: TEventosDFePresenter; const APreferences: ILocalPreferences;
      const ACriarEditor: TCriarEditorCadastroComandos);
  end;

implementation

{$R *.dfm}

uses
  CadastroEditorFrame, EventoDFeCadastroRestauracao, SelecaoEventoDFeForm,
  StatusRegistroEnumUnit;

const
  MissingEditorFactoryMessage = 'A criação do editor de Eventos DF-e não foi informada.';
  AtualizacaoPendenteMessage =
    'A consulta não pôde ser atualizada. Refaça a pesquisa para ver a situação atual do evento.';

procedure TfrmEventosDFe.ConfigurarTela(const ADefinition: INextQueryDefinition<TEventoDFeSelecionado>;
  const APresenter: TEventosDFePresenter; const APreferences: ILocalPreferences;
  const ACriarEditor: TCriarEditorCadastroComandos);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador de Eventos DF-e não foi informado.');
  if ADefinition = nil then
    raise Exception.Create('A definição da consulta não foi informada.');

  // A definição, a fábrica do editor e os filtros precisam existir antes da posse: a primeira abertura de aba já usa a
  // fábrica configurada e o apresentador só passa a pertencer à tela em AssociarPresenter.
  Attach(ADefinition, 'Eventos DFe');
  ConfigurarCriacaoEditor(ACriarEditor);
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.QueryId);
  AssociarPresenter(APresenter);
end;

procedure TfrmEventosDFe.ApresentadorAssociado(APresenter: TPresenterConsultaBase;
  const ADefinition: INextQueryDefinitionBase);
var
  EventosPresenter: TEventosDFePresenter;
begin
  // Sem esse contrato a tela abre, mas Alterar e Excluir permanecem desabilitados.
  if not Supports(ADefinition, INextQueryDefinition<TEventoDFeSelecionado>, FDefinicaoSelecao) then
    FDefinicaoSelecao := nil;

  // A instância recebida ainda pertence à composição.
  EventosPresenter := TEventosDFePresenter(APresenter);
  AssociarAcaoInclusao(EventosPresenter.SolicitarInclusao);
  AssociarAcaoAlteracao(EventosPresenter.SolicitarEdicao);
  AssociarAcaoExclusao(EventosPresenter.EnviarParaLixeira, 'Enviar para a lixeira');
  RegistrarComando(btnRestaurar, True);
  RegistrarComando(btnTransmitir, True);
  RegistrarComando(btnConsultarSituacao, True);
end;

function TfrmEventosDFe.TemRegistroCorrente: Boolean;
var
  Selecionado: TEventoDFeSelecionado;
begin
  Result := inherited TemRegistroCorrente;
  if not Result then
    Exit;

  // A chave vazia não identifica registro e não habilita as operações.
  Result := (FDefinicaoSelecao <> nil) and
    FDefinicaoSelecao.TryGetSelected(Selecionado) and (Trim(Selecionado.Id) <> '');
end;

procedure TfrmEventosDFe.AtualizarComandos;
var
  Selecionado: TEventoDFeSelecionado;
  EventosPresenter: TEventosDFePresenter;
begin
  inherited;

  EventosPresenter := nil;
  if PresenterConsulta <> nil then
    EventosPresenter := TEventosDFePresenter(PresenterConsulta);

  // Enquanto a operação corre na thread da interface, nenhum comando aceita um novo clique.
  if FOperacaoEmAndamento then
  begin
    DesabilitarComandos;
    Exit;
  end;

  // A restauração só existe na visão da lixeira e sobre o registro escolhido.
  btnRestaurar.Enabled := (EventosPresenter <> nil) and ckLixeira.Checked and
    (FDefinicaoSelecao <> nil) and FDefinicaoSelecao.TryGetSelected(Selecionado) and
    (Selecionado.Ativo = saLixeira);

  // A habilitação apenas reflete a decisão do apresentador; a autoridade continua no caso de uso.
  btnTransmitir.Enabled := (EventosPresenter <> nil) and EventosPresenter.PodeTransmitir;
  btnConsultarSituacao.Enabled := (EventosPresenter <> nil) and
    EventosPresenter.PodeConsultarSituacao;
end;

procedure TfrmEventosDFe.DesabilitarComandos;
var
  Indice: Integer;
  Controle: TControl;
begin
  // A opção da lixeira não é comando: permanece como estava e não precisa ser restaurada.
  for Indice := 0 to pnAcoesConsulta.ControlCount - 1 do
  begin
    Controle := pnAcoesConsulta.Controls[Indice];
    if Controle <> ckLixeira then
      Controle.Enabled := False;
  end;
  btnPesquisar.Enabled := False;
end;

procedure TfrmEventosDFe.ConfigurarCriacaoEditor(
  const ACriarEditor: TCriarEditorCadastroComandos);
begin
  if not Assigned(ACriarEditor) then
    raise Exception.Create(MissingEditorFactoryMessage);
  FCriarEditorAba := ACriarEditor;
end;

function TfrmEventosDFe.CriarEditor(const AChave: string; AParent: TWinControl): TWinControl;
begin
  // Cada aba recebe o próprio frame, dono do rascunho e do apresentador do cadastro.
  if not Assigned(FCriarEditorAba) then
    raise Exception.Create(MissingEditorFactoryMessage);
  Result := FCriarEditorAba(AChave, AParent, Self);
end;

procedure TfrmEventosDFe.ckLixeiraClick(Sender: TObject);
begin
  // A troca de visão vale para uma nova pesquisa; o resultado já apresentado permanece até lá.
  btnPesquisar.Click;
end;

procedure TfrmEventosDFe.btnRestaurarClick(Sender: TObject);
begin
  if PresenterConsulta <> nil then
    TEventosDFePresenter(PresenterConsulta).SolicitarRestauracao;
end;

procedure TfrmEventosDFe.AtualizarAposOperacao;
var
  FalhaApresentada: Boolean;
begin
  // A linha é recarregada mesmo com falha, mas o aviso de atualização não repete um erro já apresentado.
  FalhaApresentada := TEventosDFePresenter(PresenterConsulta).FalhaApresentada;
  try
    if (not FalhaApresentada) and (not RefreshResult) then
      ShowWarning(AtualizacaoPendenteMessage);
  except
    if not FalhaApresentada then
      ShowWarning(AtualizacaoPendenteMessage);
  end;
end;

procedure TfrmEventosDFe.btnTransmitirClick(Sender: TObject);
begin
  if PresenterConsulta = nil then
    Exit;

  if not TEventosDFePresenter(PresenterConsulta).SolicitarTransmissao then
    Exit;

  AtualizarAposOperacao;
end;

procedure TfrmEventosDFe.btnConsultarSituacaoClick(Sender: TObject);
begin
  if PresenterConsulta = nil then
    Exit;

  if not TEventosDFePresenter(PresenterConsulta).SolicitarConsultaSituacao then
    Exit;

  AtualizarAposOperacao;
end;

function TfrmEventosDFe.EditorDisponivel(ATipo: TipoEventoDFe): Boolean;
begin
  Result := TipoEventoDFeSuportado(TipoEventoDFeCodigo(ATipo));
  if not Result then
    ShowWarning(Format('O editor do evento %d ainda não está disponível.',
      [TipoEventoDFeCodigo(ATipo)]));
end;

function TfrmEventosDFe.PrepararRestauracao(const AEditor: TWinControl;
  const AId: string): Boolean;
var
  Restauracao: IEventoDFeCadastroRestauracao;
begin
  Result := Supports(AEditor, IEventoDFeCadastroRestauracao, Restauracao) and
    Restauracao.PrepararAbaRestauracao(AId);
end;

function TfrmEventosDFe.SelecionarTipoEvento(out ATipo: TipoEventoDFe): Boolean;
var
  Modal: TfrmSelecaoEventoDFe;
begin
  Result := False;

  Modal := TfrmSelecaoEventoDFe.Create(Self);
  try
    Modal.Configurar(TipoEventoDFeOpcoes);
    if Modal.ShowModal <> mrOk then
      Exit;

    ATipo := Modal.TipoSelecionado;
    Result := True;
  finally
    Modal.Free;
  end;
end;

function TfrmEventosDFe.IsLixeiraSearch: Boolean;
begin
  Result := ckLixeira.Checked;
end;

procedure TfrmEventosDFe.IniciarEspera(const AComando: TButton; const ARotulo: string);
begin
  FOperacaoEmAndamento := True;
  Screen.Cursor := crHourGlass;
  DesabilitarComandos;
  AComando.Caption := ARotulo;
  // Publica o estado de espera antes da chamada síncrona ao ACBr.
  Update;
end;

procedure TfrmEventosDFe.EncerrarEspera;
begin
  FOperacaoEmAndamento := False;
  btnTransmitir.Caption := 'Transmitir';
  btnConsultarSituacao.Caption := 'Consultar situação';
  btnPesquisar.Enabled := True;
  Screen.Cursor := crDefault;
  AtualizarComandos;
end;

procedure TfrmEventosDFe.IniciarTransmissao;
begin
  IniciarEspera(btnTransmitir, 'Transmitindo...');
end;

procedure TfrmEventosDFe.EncerrarTransmissao;
begin
  EncerrarEspera;
end;

procedure TfrmEventosDFe.IniciarConsultaSituacao;
begin
  IniciarEspera(btnConsultarSituacao, 'Consultando...');
end;

procedure TfrmEventosDFe.EncerrarConsultaSituacao;
begin
  EncerrarEspera;
end;

function TfrmEventosDFe.AbrirInclusao(const AChave, ATitulo: string): Boolean;
var
  PreparacaoFalhou: Boolean;
begin
  Result := False;
  if Trim(AChave) = '' then
    Exit;

  PreparacaoFalhou := False;
  Result := AbrirAba(AChave, ATitulo,
    procedure(AEditor: TWinControl)
    begin
      if TfrmCadastroEditor(AEditor).PrepararAbaInclusao then
        Exit;
      PreparacaoFalhou := True;
      // Abort interrompe a montagem; a base descarta a aba parcial sem mensagem.
      Abort;
    end);

  if Result or PreparacaoFalhou then
    Exit;

  ShowError('Não foi possível iniciar a inclusão do evento DF-e.');
end;

function TfrmEventosDFe.AbrirEdicao(const ASelecao: TEventoDFeSelecionado;
  AModo: TModoEventoDFe): Boolean;
var
  Chave: string;
  Titulo: string;
  PreparacaoFalhou: Boolean;
begin
  Result := False;
  if Trim(ASelecao.Id) = '' then
    Exit;

  if not EditorDisponivel(ASelecao.TipoEvento) then
    Exit;

  Chave := IntToStr(TipoEventoDFeCodigo(ASelecao.TipoEvento)) + ':' + ASelecao.Id;
  if AModo = meRestauracao then
    Titulo := 'Restaurar - ' + TipoEventoDFeDisplay(ASelecao.TipoEvento)
  else
    Titulo := 'Alterar - ' + TipoEventoDFeDisplay(ASelecao.TipoEvento);

  PreparacaoFalhou := False;
  Result := AbrirAba(Chave, Titulo,
    procedure(AEditor: TWinControl)
    begin
      if AModo = meRestauracao then
      begin
        if PrepararRestauracao(AEditor, ASelecao.Id) then
          Exit;
      end
      else if TfrmCadastroEditor(AEditor).PrepararAbaAlteracao(ASelecao.Id) then
        Exit;

      PreparacaoFalhou := True;
      // Abort interrompe a montagem; a base descarta a aba parcial sem mensagem.
      Abort;
    end);

  if Result or PreparacaoFalhou then
    Exit;

  if AModo = meRestauracao then
    ShowError('Não foi possível iniciar a restauração do evento DF-e.')
  else
    ShowError('Não foi possível iniciar a alteração do evento DF-e.');
end;

procedure TfrmEventosDFe.AvisarSalvamentoSemAtualizacao;
begin
  // A base já fechou a aba e descartou o rascunho.
  ShowWarning('O evento DF-e foi salvo. Refaça a pesquisa para atualizar a consulta.');
end;

procedure TfrmEventosDFe.AvisarExclusaoSemAtualizacao;
begin
  ShowWarning('O evento DF-e já foi enviado para a lixeira. Refaça a pesquisa para atualizar a consulta.');
end;

end.
