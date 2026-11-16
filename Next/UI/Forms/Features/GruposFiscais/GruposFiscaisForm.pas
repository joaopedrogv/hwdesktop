unit GruposFiscaisForm;

interface

uses
  Winapi.Windows, System.SysUtils, Data.DB,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm, GruposFiscaisPresenter,
  GruposFiscaisView, NextQueryDefinition, GruposFiscaisQueryDefinition,
  GrupoFiscalCadastro, GrupoFiscalEtdUnit, GrupoFiscalCadastroFrame,
  ValidationEntityOutputUnit;

type
  // Tela de consulta, inclusao e alteracao de Grupos Fiscais. Herda a
  // apresentacao generica e acrescenta a consulta, a alteracao, o envio da linha
  // corrente para a lixeira e as abas de cadastro. A inclusao e cada registro
  // alterado ocupam uma aba propria, cujo editor e dono do rascunho. O
  // apresentador e o leitor sao injetados pela composicao; a base cria a aba e o
  // editor a partir do contrato comum.
  TfrmGruposFiscais = class(TfrmConsultaBase, IGruposFiscaisView)
    btnNovo: TButton;
    btnAlterar: TButton;
    btnEnviarLixeira: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnEnviarLixeiraClick(Sender: TObject);
  private
    FPresenter: TGruposFiscaisPresenter;
    // Contrato tipado da consulta: entrega o identificador da linha corrente
    // usado por Alterar e Lixeira.
    FDefinicaoSelecao: INextQueryDefinition<TGrupoSelecionado>;
    // Estado dos comandos da consulta: Novo depende do apresentador e Alterar e
    // Lixeira exigem uma linha corrente identificada na grade.
    procedure AtualizarComandos;
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    function TemRegistroCorrente: Boolean;
  protected
    function CanPesquisar: Boolean; override;
    procedure DoInitializeView; override;
    // A base cria a aba e a area de rolagem; a tela fornece o editor tipado que
    // possui o rascunho da aba.
    function CriarEditor(const AChave: string;
      AParent: TWinControl): TWinControl; override;
    // O frame da aba aplica os campos ao proprio rascunho e o apresentador
    // executa a gravacao. Depois de Salvar o frame nao e mais acessado: uma
    // troca de sessao pode te-lo liberado.
    function SalvarAba(const AChave: string;
      AEditor: TWinControl): Boolean; override;
    procedure AvisarSalvamentoSemAtualizacao; override;
  public
    destructor Destroy; override;
    function HasPendingChanges: Boolean; override;
    procedure FocusView; override;
    // Encaminha ao editor da aba que iniciou a gravacao o resultado de validacao
    // produzido pelo apresentador; o painel pertence a cada editor.
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
    // Reapresenta a aba de alteracao da chave ja aberta. Sem aba, nada e criado
    // e a alteracao segue para a autorizacao e a carga.
    function AtivarEdicao(const AChave: string): Boolean;
    // Abre a aba da chave e copia o grupo carregado para o rascunho do editor.
    // A entidade continua pertencendo a quem chamou. A falha de montagem e
    // informada uma unica vez.
    function AbrirEdicao(const AChave: string; const AGrupo: GrupoFiscalEtd;
      const AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
    procedure AttachPresenter(APresenter: TGruposFiscaisPresenter;
      const ADefinition: INextQueryDefinitionBase; const ATitle: string);
  end;

implementation

{$R *.dfm}

const
  MissingPresenterMessage = 'O apresentador de Grupos Fiscais nao foi informado.';
  MissingDefinitionMessage = 'A definicao da consulta nao foi informada.';

destructor TfrmGruposFiscais.Destroy;
begin
  try
    // Nenhum controle e tocado na destruicao: a base e os componentes do
    // formulario liberam as abas, os editores e os rascunhos. Aqui se libera
    // apenas o apresentador transiente desta tela.
    FreeAndNil(FPresenter);
  finally
    inherited;
  end;
end;

procedure TfrmGruposFiscais.AttachPresenter(APresenter: TGruposFiscaisPresenter;
  const ADefinition: INextQueryDefinitionBase; const ATitle: string);
begin
  if APresenter = nil then
    raise Exception.Create(MissingPresenterMessage);
  if ADefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);

  // A definicao entrega colunas, filtros, operacoes e o ciclo da pesquisa; a
  // tela assume o apresentador transiente so depois da associacao aceita, para
  // nao deixar posse parcial.
  Attach(ADefinition, ATitle, False);
  FPresenter := APresenter;

  // O identificador da linha corrente vem do mesmo contrato que a alteracao
  // consome. Sem esse contrato a tela abre, mas Alterar e Lixeira permanecem
  // desabilitados.
  if not Supports(ADefinition, INextQueryDefinition<TGrupoSelecionado>,
    FDefinicaoSelecao) then
    FDefinicaoSelecao := nil;

  AtualizarComandos;
end;

procedure TfrmGruposFiscais.AtualizarComandos;
var
  DataSet: TDataSet;
  ComRegistro: Boolean;
begin
  // Novo depende apenas do apresentador; a consulta pode estar vazia antes da
  // primeira pesquisa.
  if btnNovo <> nil then
    btnNovo.Enabled := FPresenter <> nil;

  // Alterar e Lixeira exigem a consulta lida e uma linha corrente com
  // identificador, porque as duas operacoes partem do registro selecionado.
  ComRegistro := False;
  DataSet := dsConsulta.DataSet;
  if (FPresenter <> nil) and (DataSet <> nil) then
    ComRegistro := DataSet.Active and (not DataSet.IsEmpty) and
      TemRegistroCorrente;

  if btnAlterar <> nil then
    btnAlterar.Enabled := ComRegistro;
  if btnEnviarLixeira <> nil then
    btnEnviarLixeira.Enabled := ComRegistro;
end;

function TfrmGruposFiscais.TemRegistroCorrente: Boolean;
var
  Selecionado: TGrupoSelecionado;
begin
  Result := False;
  if FDefinicaoSelecao = nil then
    Exit;

  // A definicao le a linha corrente sem criar objetos de apresentacao. A chave
  // vazia nao identifica registro e nao habilita nenhuma das operacoes.
  if not FDefinicaoSelecao.TryGetSelected(Selecionado) then
    Exit;

  Result := Trim(Selecionado.Id) <> '';
end;

procedure TfrmGruposFiscais.dsConsultaDataChange(Sender: TObject; Field: TField);
begin
  AtualizarComandos;
end;

procedure TfrmGruposFiscais.DoInitializeView;
begin
  inherited;

  // A troca de dataset (pesquisa, limpeza, reconsulta) atualiza os comandos
  // junto com a grade.
  dsConsulta.OnDataChange := dsConsultaDataChange;
  AtualizarComandos;
end;

function TfrmGruposFiscais.CanPesquisar: Boolean;
begin
  // A decisao e as mensagens de indisponibilidade pertencem ao apresentador,
  // que apresenta o feedback na propria tela. Sem apresentador a pesquisa nao
  // prossegue.
  Result := (FPresenter <> nil) and FPresenter.AutorizarPesquisa;
end;

function TfrmGruposFiscais.CriarEditor(const AChave: string;
  AParent: TWinControl): TWinControl;
begin
  // Cada aba recebe o proprio frame, dono do rascunho correspondente. A base
  // define Parent e Align e libera o editor junto com a aba.
  Result := TfrmGrupoFiscalCadastroFrame.Create(AParent);
end;

function TfrmGruposFiscais.SalvarAba(const AChave: string;
  AEditor: TWinControl): Boolean;
var
  Frame: TfrmGrupoFiscalCadastroFrame;
begin
  Result := False;
  if (FPresenter = nil) or
    (not (AEditor is TfrmGrupoFiscalCadastroFrame)) then
    Exit;

  Frame := TfrmGrupoFiscalCadastroFrame(AEditor);
  if not Frame.TemRascunho then
    Exit;

  Frame.LimparValidacao;
  if not Frame.AplicarCamposAoRascunho then
    Exit;

  // A entidade pertence ao frame e continua valida durante a chamada. Depois de
  // Salvar o frame nao e mais acessado: uma troca de sessao pode te-lo liberado.
  Result := FPresenter.Salvar(Frame.Rascunho);
end;

procedure TfrmGruposFiscais.ExibirValidacao(
  const AValidacao: ValidationEntityOutput);
var
  Editor: TWinControl;
begin
  // O formulario encaminha o resultado para a aba que iniciou a gravacao. A aba
  // pode ter sido encerrada por uma troca de sessao antes desta chamada.
  Editor := EditorDaAba(ChaveAbaEmGravacao);
  if Editor is TfrmGrupoFiscalCadastroFrame then
    TfrmGrupoFiscalCadastroFrame(Editor).ExibirValidacao(AValidacao);
end;

function TfrmGruposFiscais.AtivarEdicao(const AChave: string): Boolean;
begin
  // Reabrir devolve a aba existente sem repetir autorizacao nem recarregar o
  // registro: o rascunho ainda pertence a sessao atual.
  Result := AbaAberta(AChave);
  if Result then
    AtivarAba(AChave);
end;

function TfrmGruposFiscais.AbrirEdicao(const AChave: string;
  const AGrupo: GrupoFiscalEtd;
  const AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
var
  Titulo: string;
  Grupo: GrupoFiscalEtd;
  Opcoes: TGrupoFiscalEmpresaOptions;
begin
  Result := False;
  if AGrupo = nil then
    Exit;

  // O titulo usa a descricao antes de o frame clonar a entidade recebida.
  Titulo := 'Alterar - ' + AGrupo.Descricao;

  // O frame copia o grupo e as opcoes durante a abertura; o apresentador libera
  // a entidade original no finally.
  Grupo := AGrupo;
  Opcoes := AOpcoes;
  Result := AbrirAba(AChave, Titulo,
    procedure(AEditor: TWinControl)
    begin
      TfrmGrupoFiscalCadastroFrame(AEditor).PrepararAlteracao(Grupo, Opcoes);
    end);

  if not Result then
    ShowError('Não foi possível iniciar a alteração do grupo fiscal.');
end;

procedure TfrmGruposFiscais.AvisarSalvamentoSemAtualizacao;
begin
  // A base ja fechou a aba e descartou o rascunho; a mensagem confirma a
  // gravacao e orienta a atualizar a consulta.
  ShowWarning('O grupo fiscal foi salvo. Refaça a pesquisa para atualizar a consulta.');
end;

function TfrmGruposFiscais.HasPendingChanges: Boolean;
var
  I: Integer;
  Editor: TWinControl;
begin
  // Qualquer aba de cadastro com rascunho e pendencia: a inclusao ja contem
  // dados a gravar e cada alteracao possui a copia carregada.
  for I := 0 to TotalAbasCadastro - 1 do
  begin
    Editor := EditorAbaCadastro(I);
    if (Editor is TfrmGrupoFiscalCadastroFrame) and
      TfrmGrupoFiscalCadastroFrame(Editor).TemRascunho then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

procedure TfrmGruposFiscais.FocusView;
var
  Editor: TWinControl;
begin
  // Com uma aba de cadastro ativa, o foco pertence ao editor daquela aba.
  Editor := EditorAbaAtiva;
  if Editor is TfrmGrupoFiscalCadastroFrame then
  begin
    TfrmGrupoFiscalCadastroFrame(Editor).FocarPrimeiroCampoInvalido;
    Exit;
  end;

  inherited;
end;

procedure TfrmGruposFiscais.btnNovoClick(Sender: TObject);
var
  Opcoes: TGrupoFiscalEmpresaOptions;
begin
  // Reabrir devolve a aba existente sem repetir autorizacao nem recarregar as
  // empresas: o rascunho ainda pertence a sessao atual. As abas de alteracao
  // abertas nao interferem na inclusao.
  if AbaAberta(ChaveAbaInclusao) then
  begin
    AtivarAba(ChaveAbaInclusao);
    Exit;
  end;

  if FPresenter = nil then
  begin
    ShowError(MissingPresenterMessage);
    Exit;
  end;

  // A negativa ou o cancelamento da autorizacao de inclusao ja foi apresentado
  // pelo legado: a tela permanece na consulta sem repetir a mensagem.
  if not FPresenter.AutorizarInclusao then
    Exit;

  // Sem as empresas nao ha o que incluir; o apresentador ja informou a falha.
  if not FPresenter.CarregarEmpresas(Opcoes) then
    Exit;

  if not AbrirAba(ChaveAbaInclusao, 'Inclusão',
    procedure(AEditor: TWinControl)
    begin
      TfrmGrupoFiscalCadastroFrame(AEditor).PrepararInclusao(Opcoes);
    end) then
    ShowError('Não foi possível iniciar a inclusão do grupo fiscal.');
end;

procedure TfrmGruposFiscais.btnAlterarClick(Sender: TObject);
begin
  try
    // A alteracao e uma unica chamada: o apresentador identifica a linha
    // corrente, reapresenta a aba existente ou autoriza, carrega e entrega o
    // rascunho para a nova aba. As mensagens pertencem a tela ou ao servico de
    // autorizacao.
    if FPresenter <> nil then
      FPresenter.CarregarParaEdicao;
  finally
    AtualizarComandos;
  end;
end;

procedure TfrmGruposFiscais.btnEnviarLixeiraClick(Sender: TObject);
begin
  try
    if FPresenter = nil then
    begin
      ShowError(MissingPresenterMessage);
      Exit;
    end;

    // O apresentador identifica a linha corrente, confirma (padrao "Nao") e
    // autoriza antes de executar; False interrompe sem repetir o que o legado
    // mostrou.
    if not FPresenter.EnviarParaLixeira() then
      Exit;

    // A grade atualizada e a confirmacao do envio; nao ha dialogo de sucesso.
    if not RepetirPesquisa then
      ShowWarning('O grupo fiscal já foi enviado para a lixeira. Refaça a pesquisa para atualizar a consulta.');
  finally
    AtualizarComandos;
  end;
end;

end.
