unit OperacoesFiscaisIbsCbsForm;

interface

uses
  System.SysUtils, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm,
  PresenterConsultaBase, NextQueryDefinition, LocalPreferences,
  OperacoesFiscaisIbsCbsView, OperacoesFiscaisIbsCbsPresenter,
  OperacoesFiscaisIbsCbsQueryDefinition, EditorCadastro;

type
  TfrmOperacoesFiscaisIbsCbs = class(TfrmConsultaBase, IOperacoesFiscaisIbsCbsView)
    chkLixeira: TCheckBox;
    procedure btnNovoAcoesClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject); 
  private
    function TituloAlteracao(const ASelecao: TOperacaoFiscalSelecionada): string;
  protected       
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

procedure TfrmOperacoesFiscaisIbsCbs.ConfigurarTela(const ADefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
  const APresenter: TOperacoesFiscaisIbsCbsPresenter; const APreferences: ILocalPreferences;
  const ACriarEditor: TCriarEditorCadastroComandos);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador de Operações Fiscais IBS/CBS não foi informado.');
  if ADefinition = nil then
    raise Exception.Create('A definição da consulta não foi informada.');

  // As validacoes precisam acontecer antes da posse. a sequencia preserva o resultado esperado
  Attach(ADefinition, 'Operações Fiscais IBS/CBS');
  ConfigurarCriacaoEditorAba(ACriarEditor);
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.QueryId);
  AssociarPresenter(APresenter);

  RegistrarAcao(btnNovoAcoes);
  RegistrarAcao(btnAlterar, True);
  RegistrarAcao(btnExcluir, True);
  btnExcluir.Hint  := 'Enviar para a lixeira';
  btnNovoAcoes.OnClick := btnNovoAcoesClick;
  btnAlterar.OnClick := btnAlterarClick;
  btnExcluir.OnClick := btnExcluirClick;
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

procedure TfrmOperacoesFiscaisIbsCbs.btnNovoAcoesClick(Sender: TObject);
begin
  TOperacoesFiscaisIbsCbsPresenter(PresenterConsulta).SolicitarInclusao;
end;

procedure TfrmOperacoesFiscaisIbsCbs.btnAlterarClick(Sender: TObject);
begin
  TOperacoesFiscaisIbsCbsPresenter(PresenterConsulta).SolicitarEdicao;
end;

procedure TfrmOperacoesFiscaisIbsCbs.btnExcluirClick(Sender: TObject);
begin
  if not TOperacoesFiscaisIbsCbsPresenter(PresenterConsulta).EnviarParaLixeira then
    Exit;

  try
    RefreshResult();
  except
    btnPesquisar.Click;
  end;
end;

end.
