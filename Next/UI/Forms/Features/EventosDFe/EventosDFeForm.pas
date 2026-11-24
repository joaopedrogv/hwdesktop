unit EventosDFeForm;

interface

uses
  System.SysUtils, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm,
  PresenterConsultaBase, NextDatasetDefinition, LocalPreferences, EventosDFeView,
  EventosDFePresenter, EventosDFeQueryDefinition, TipoEventoDFeUnit, EditorCadastro, System.ImageList, Vcl.ImgList,
  Data.DB, DataGridFrame, Vcl.Buttons, FilterFrame, Vcl.ExtCtrls, Vcl.ComCtrls, System.Classes, Vcl.Menus;

type
  // Cada inclusão e cada registro alterado ocupam uma aba própria, cujo editor é dono do rascunho e do apresentador do
  // cadastro.
  TfrmEventosDFe = class(TfrmConsultaBase, IEventosDFeView)
    ckLixeira: TCheckBox;
    btnConsultarSituacao: TSpeedButton;
    btnTransmitir: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure ckLixeiraClick(Sender: TObject);
    procedure btnConsultarSituacaoClick(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure btnNovoAcoesClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    FDefinicaoSelecao: INextDatasetDefinition<TEventoDFeSelecionado>;
    function EditorDisponivel(ATipo: TipoEventoDFe): Boolean;
    function PrepararRestauracao(const AEditor: TWinControl; const AId: string): Boolean;
  public
    function SelecionarTipoEvento(out ATipo: TipoEventoDFe): Boolean;
    // Opção lida pela definição em cada pesquisa: vale para a próxima busca e não altera o resultado já apresentado.
    function IsLixeiraSearch: Boolean;
    function AbrirInclusao(const AChave, ATitulo: string): Boolean;
    function AbrirEdicao(const ASelecao: TEventoDFeSelecionado; AModo: TModoEventoDFe): Boolean;
    procedure ConfigurarTela(const ADefinition: INextDatasetDefinition<TEventoDFeSelecionado>;
      const APresenter: TEventosDFePresenter; const APreferences: ILocalPreferences;
      const ACriarEditor: TCriarEditorCadastroComandos);
  end;

implementation

{$R *.dfm}

uses
  CadastroEditorFrame, EventoDFeCadastroRestauracao, SelecaoEventoDFeForm,
  StatusRegistroEnumUnit;

procedure TfrmEventosDFe.ConfigurarTela(const ADefinition: INextDatasetDefinition<TEventoDFeSelecionado>;
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
  ConfigurarCriacaoEditorAba(ACriarEditor);
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.DatasetId);
  AssociarPresenter(APresenter);

  RegistrarAcao(btnNovoAcoes);
  RegistrarAcao(btnAlterar, True);
  RegistrarAcao(btnExcluir, True);
  RegistrarAcao(btnRestaurar, True);
  RegistrarAcao(btnTransmitir, True);
  RegistrarAcao(btnConsultarSituacao, True);

  btnRestaurar.Visible := False;
end;


procedure TfrmEventosDFe.ckLixeiraClick(Sender: TObject);
begin
  try
    // A troca de visão vale para uma nova pesquisa; o resultado já apresentado permanece até lá.
    btnPesquisar.Click;
  finally
    btnRestaurar.Enabled := ckLixeira.Checked;
  end;
end;

procedure TfrmEventosDFe.btnRestaurarClick(Sender: TObject);
begin
  if PresenterConsulta <> nil then
    TEventosDFePresenter(PresenterConsulta).SolicitarRestauracao;
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

procedure TfrmEventosDFe.btnConsultarSituacaoClick(Sender: TObject);
begin
  if not TEventosDFePresenter(PresenterConsulta).SolicitarConsultaSituacao then
    Exit;

  RefreshResult();
end;

procedure TfrmEventosDFe.btnTransmitirClick(Sender: TObject);
begin
  if not TEventosDFePresenter(PresenterConsulta).SolicitarTransmissao then
    Exit;

  RefreshResult();
end;

procedure TfrmEventosDFe.btnNovoAcoesClick(Sender: TObject);
begin
  TEventosDFePresenter(PresenterConsulta).SolicitarInclusao;
end;

procedure TfrmEventosDFe.btnAlterarClick(Sender: TObject);
begin
  TEventosDFePresenter(PresenterConsulta).SolicitarEdicao;
end;

procedure TfrmEventosDFe.btnExcluirClick(Sender: TObject);
begin
  if not TEventosDFePresenter(PresenterConsulta).EnviarParaLixeira then
    Exit;

  try
    RefreshResult();
  except
    btnPesquisar.Click;
  end;
end;

function TfrmEventosDFe.IsLixeiraSearch: Boolean;
begin
  Result := ckLixeira.Checked;
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

end.
