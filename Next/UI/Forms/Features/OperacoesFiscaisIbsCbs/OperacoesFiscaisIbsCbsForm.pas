unit OperacoesFiscaisIbsCbsForm;

interface

uses
  System.SysUtils, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm,
  PresenterConsultaBase, NextQueryDefinition, LocalPreferences,
  OperacoesFiscaisIbsCbsView, OperacoesFiscaisIbsCbsPresenter,
  OperacoesFiscaisIbsCbsQueryDefinition, EditorCadastro;

type
  // Cada inclusao e cada registro alterado ocupam uma aba propria, cujo editor e dono do rascunho, dos seletores e do
  // apresentador do cadastro.
  TfrmOperacoesFiscaisIbsCbs = class(TfrmConsultaBase, IOperacoesFiscaisIbsCbsView)
    chkLixeira: TCheckBox;
  private
    FDefinicaoSelecao: INextQueryDefinition<TOperacaoFiscalSelecionada>;
    // A tela nao conhece as dependencias do editor e nao guarda aba, frame nem rascunho.
    FCriarEditorAba: TCriarEditorCadastroComandos;
    procedure ConfigurarCriacaoEditor(const ACriarEditor: TCriarEditorCadastroComandos);
    function TituloAlteracao(const ASelecao: TOperacaoFiscalSelecionada): string;
  protected
    procedure ApresentadorAssociado(APresenter: TPresenterConsultaBase;
      const ADefinition: INextQueryDefinitionBase); override;
    function TemRegistroCorrente: Boolean; override;
    function CriarEditor(const AChave: string; AParent: TWinControl): TWinControl; override;
    procedure AvisarSalvamentoSemAtualizacao; override;
    procedure AvisarExclusaoSemAtualizacao; override;
  public
    function AbrirEdicao(const ASelecao: TOperacaoFiscalSelecionada): Boolean;
    function AbrirInclusao: Boolean;
    // Opcao lida pela definicao em cada pesquisa: vale para a proxima busca e nao altera o resultado ja apresentado.
    function IsLixeiraSearch: Boolean;
    procedure ConfigurarTela(const ADefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
      const APresenter: TOperacoesFiscaisIbsCbsPresenter; const APreferences: ILocalPreferences;
      const ACriarEditor: TCriarEditorCadastroComandos);
  end;

implementation

{$R *.dfm}

uses
  OperacaoFiscalIbsCbsCadastroFrame;

const
  MissingEditorFactoryMessage = 'A criação do editor de Operações Fiscais IBS/CBS não foi informada.';

procedure TfrmOperacoesFiscaisIbsCbs.ConfigurarTela(const ADefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
  const APresenter: TOperacoesFiscaisIbsCbsPresenter; const APreferences: ILocalPreferences;
  const ACriarEditor: TCriarEditorCadastroComandos);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador de Operações Fiscais IBS/CBS não foi informado.');
  if ADefinition = nil then
    raise Exception.Create('A definição da consulta não foi informada.');

  // A definicao, a fabrica do editor e os filtros precisam existir antes da posse: a primeira abertura de aba ja usa a
  // fabrica configurada e o apresentador so passa a pertencer a tela em AssociarPresenter.
  Attach(ADefinition, 'Operações Fiscais IBS/CBS');
  ConfigurarCriacaoEditor(ACriarEditor);
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.QueryId);
  AssociarPresenter(APresenter);
end;

procedure TfrmOperacoesFiscaisIbsCbs.ApresentadorAssociado(
  APresenter: TPresenterConsultaBase; const ADefinition: INextQueryDefinitionBase);
var
  OperacoesPresenter: TOperacoesFiscaisIbsCbsPresenter;
begin
  // Sem esse contrato a tela abre, mas Alterar permanece desabilitado.
  if not Supports(ADefinition, INextQueryDefinition<TOperacaoFiscalSelecionada>, FDefinicaoSelecao) then
    FDefinicaoSelecao := nil;

  // A instancia recebida ainda pertence a composicao.
  OperacoesPresenter := TOperacoesFiscaisIbsCbsPresenter(APresenter);
  AssociarAcaoInclusao(OperacoesPresenter.SolicitarInclusao);
  AssociarAcaoAlteracao(OperacoesPresenter.SolicitarEdicao);
  AssociarAcaoExclusao(OperacoesPresenter.EnviarParaLixeira, 'Enviar para a lixeira');
end;

function TfrmOperacoesFiscaisIbsCbs.TemRegistroCorrente: Boolean;
var
  Selecionado: TOperacaoFiscalSelecionada;
begin
  Result := inherited TemRegistroCorrente;
  if not Result then
    Exit;

  // A chave vazia nao identifica registro e nao habilita a alteracao.
  Result := (FDefinicaoSelecao <> nil) and
    FDefinicaoSelecao.TryGetSelected(Selecionado) and (Trim(Selecionado.Id) <> '');
end;

procedure TfrmOperacoesFiscaisIbsCbs.ConfigurarCriacaoEditor(const ACriarEditor: TCriarEditorCadastroComandos);
begin
  if not Assigned(ACriarEditor) then
    raise Exception.Create(MissingEditorFactoryMessage);
  FCriarEditorAba := ACriarEditor;
end;

function TfrmOperacoesFiscaisIbsCbs.CriarEditor(const AChave: string; AParent: TWinControl): TWinControl;
begin
  // Cada aba recebe o proprio frame, dono do rascunho, dos seletores e do apresentador do cadastro.
  if not Assigned(FCriarEditorAba) then
    raise Exception.Create(MissingEditorFactoryMessage);
  Result := FCriarEditorAba(AChave, AParent, Self);
end;

function TfrmOperacoesFiscaisIbsCbs.TituloAlteracao(const ASelecao: TOperacaoFiscalSelecionada): string;
var
  Descricao: string;

  // Acrescenta apenas a descricao existente, sem separador solto no inicio.
  procedure Adicionar(const ATexto: string);
  begin
    if Trim(ATexto) = '' then
      Exit;
    if Descricao <> '' then
      Descricao := Descricao + ' / ';
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

  Result := 'Alterar - ' + Descricao;
end;

function TfrmOperacoesFiscaisIbsCbs.AbrirEdicao(const ASelecao: TOperacaoFiscalSelecionada): Boolean;
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
      if TfrmOperacaoFiscalIbsCbsCadastroFrame(AEditor).PrepararAbaAlteracao(Id) then
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
  // A base ja fechou a aba e descartou o rascunho.
  ShowWarning('A operação fiscal foi salva. Refaça a pesquisa para atualizar a consulta.');
end;

procedure TfrmOperacoesFiscaisIbsCbs.AvisarExclusaoSemAtualizacao;
begin
  ShowWarning('A operação fiscal já foi enviada para a lixeira. Refaça a pesquisa para atualizar a consulta.');
end;

end.
