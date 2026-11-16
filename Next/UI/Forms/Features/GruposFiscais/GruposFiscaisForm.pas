unit GruposFiscaisForm;

interface

uses
  Winapi.Windows, System.SysUtils,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm, GruposFiscaisPresenter,
  GruposFiscaisView, NextQueryDefinition, GruposFiscaisQueryDefinition,
  GrupoFiscalEtdUnit, GrupoFiscalCadastroFrame, EmpresaOption,
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
    // Contrato tipado da consulta: entrega o identificador da linha corrente
    // usado por Alterar e Lixeira.
    FDefinicaoSelecao: INextQueryDefinition<TGrupoSelecionado>;
    // Acesso tipado ao apresentador que a base possui e libera: esta tela nao
    // responde pela liberacao nem assume posse dele.
    function Presenter: TGruposFiscaisPresenter;
  protected
    // Registra os comandos da consulta depois que a base aceitou a definicao e
    // antes de assumir a posse do apresentador.
    procedure ApresentadorAssociado(
      const ADefinition: INextQueryDefinitionBase); override;
    // Novo depende do apresentador; Alterar e Lixeira exigem tambem uma linha
    // corrente identificada na grade.
    function TemRegistroCorrente: Boolean; override;
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
    // Implementa IGruposFiscaisView: a base encaminha a validacao ao editor da
    // aba que iniciou a gravacao, que apresenta as mensagens por campo.
    procedure ExibirValidacao(const AValidacao: ValidationEntityOutput);
    // Reapresenta a aba de alteracao da chave ja aberta. Sem aba, nada e criado
    // e a alteracao segue para a autorizacao e a carga.
    function AtivarEdicao(const AChave: string): Boolean;
    // Abre a aba da chave e copia o grupo carregado para o rascunho do editor.
    // A entidade continua pertencendo a quem chamou. A falha de montagem e
    // informada uma unica vez.
    function AbrirEdicao(const AChave: string; const AGrupo: GrupoFiscalEtd;
      const AOpcoes: TEmpresaOptions): Boolean;
    // Reapresenta a aba de inclusao ja aberta. Sem aba, nada e criado e a
    // inclusao segue para a autorizacao e a carga das empresas.
    function AtivarInclusao: Boolean;
    // Abre uma nova aba de inclusao e copia as opcoes para o editor, que cria o
    // proprio rascunho. A falha de montagem e informada uma unica vez.
    function AbrirInclusao(const AOpcoes: TEmpresaOptions): Boolean;
    procedure AttachPresenter(APresenter: TGruposFiscaisPresenter;
      const ADefinition: INextQueryDefinitionBase; const ATitle: string);
  end;

implementation

{$R *.dfm}

const
  MissingPresenterMessage = 'O apresentador de Grupos Fiscais nao foi informado.';
  MissingDefinitionMessage = 'A definicao da consulta nao foi informada.';

procedure TfrmGruposFiscais.AttachPresenter(APresenter: TGruposFiscaisPresenter;
  const ADefinition: INextQueryDefinitionBase; const ATitle: string);
begin
  if APresenter = nil then
    raise Exception.Create(MissingPresenterMessage);
  if ADefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);

  // A base recebe a definicao, registra os comandos desta tela e passa a possuir
  // o apresentador; esta tela o acessa pelo getter tipado.
  AssociarPresenter(APresenter, ADefinition, ATitle);
end;

function TfrmGruposFiscais.Presenter: TGruposFiscaisPresenter;
begin
  // A instancia pertence a base; o valor e sempre o apresentador associado por
  // AttachPresenter a esta tela.
  Result := TGruposFiscaisPresenter(PresenterConsulta);
end;

procedure TfrmGruposFiscais.ApresentadorAssociado(
  const ADefinition: INextQueryDefinitionBase);
begin
  // O identificador da linha corrente vem do mesmo contrato que a alteracao
  // consome. Sem esse contrato a tela abre, mas Alterar e Lixeira permanecem
  // desabilitados.
  if not Supports(ADefinition, INextQueryDefinition<TGrupoSelecionado>,
    FDefinicaoSelecao) then
    FDefinicaoSelecao := nil;

  // Novo depende apenas do apresentador; Alterar e Lixeira partem do registro
  // selecionado na grade.
  RegistrarComando(btnNovo, False);
  RegistrarComando(btnAlterar, True);
  RegistrarComando(btnEnviarLixeira, True);
end;

function TfrmGruposFiscais.TemRegistroCorrente: Boolean;
var
  Selecionado: TGrupoSelecionado;
begin
  Result := inherited TemRegistroCorrente;
  if not Result then
    Exit;

  // A definicao le a linha corrente sem criar objetos de apresentacao. A chave
  // vazia nao identifica registro e nao habilita as operacoes.
  Result := (FDefinicaoSelecao <> nil) and
    FDefinicaoSelecao.TryGetSelected(Selecionado) and
    (Trim(Selecionado.Id) <> '');
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
  if (Presenter = nil) or
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
  Result := Presenter.Salvar(Frame.Rascunho);
end;

procedure TfrmGruposFiscais.ExibirValidacao(
  const AValidacao: ValidationEntityOutput);
begin
  // O encaminhamento e da base: a validacao vai para o editor da aba que
  // iniciou a gravacao.
  inherited ShowValidation(AValidacao);
end;

function TfrmGruposFiscais.AtivarEdicao(const AChave: string): Boolean;
begin
  // Reabrir devolve a aba existente sem repetir autorizacao nem recarregar o
  // registro: o rascunho ainda pertence a sessao atual.
  Result := TryAtivarAba(AChave);
end;

function TfrmGruposFiscais.AbrirEdicao(const AChave: string;
  const AGrupo: GrupoFiscalEtd;
  const AOpcoes: TEmpresaOptions): Boolean;
var
  Titulo: string;
  Grupo: GrupoFiscalEtd;
  Opcoes: TEmpresaOptions;
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

function TfrmGruposFiscais.AtivarInclusao: Boolean;
begin
  // Reabrir devolve a aba de inclusao existente sem repetir autorizacao nem
  // recarregar as empresas: o rascunho ainda pertence a sessao atual.
  Result := TryAtivarAba(ChaveAbaInclusao);
end;

function TfrmGruposFiscais.AbrirInclusao(
  const AOpcoes: TEmpresaOptions): Boolean;
var
  Opcoes: TEmpresaOptions;
begin
  // O editor copia as opcoes durante a abertura e cria o proprio rascunho.
  Opcoes := AOpcoes;
  Result := AbrirAba(ChaveAbaInclusao, 'Inclusão',
    procedure(AEditor: TWinControl)
    begin
      TfrmGrupoFiscalCadastroFrame(AEditor).PrepararInclusao(Opcoes);
    end);

  if not Result then
    ShowError('Não foi possível iniciar a inclusão do grupo fiscal.');
end;

procedure TfrmGruposFiscais.AvisarSalvamentoSemAtualizacao;
begin
  // A base ja fechou a aba e descartou o rascunho; a mensagem confirma a
  // gravacao e orienta a atualizar a consulta.
  ShowWarning('O grupo fiscal foi salvo. Refaça a pesquisa para atualizar a consulta.');
end;

procedure TfrmGruposFiscais.btnNovoClick(Sender: TObject);
begin
  // A inclusao e uma unica chamada: o apresentador reapresenta a aba existente
  // ou autoriza, carrega as empresas e entrega as opcoes para a nova aba, que
  // cria o proprio rascunho.
  if Presenter <> nil then
    Presenter.CarregarParaInclusao;
end;

procedure TfrmGruposFiscais.btnAlterarClick(Sender: TObject);
begin
  // A alteracao e uma unica chamada: o apresentador identifica a linha
  // corrente, reapresenta a aba existente ou autoriza, carrega e entrega o
  // rascunho para a nova aba. As mensagens pertencem a tela ou ao servico de
  // autorizacao. A base atualiza os comandos quando a consulta muda.
  if Presenter <> nil then
    Presenter.CarregarParaEdicao;
end;

procedure TfrmGruposFiscais.btnEnviarLixeiraClick(Sender: TObject);
begin
  if Presenter = nil then
  begin
    ShowError(MissingPresenterMessage);
    Exit;
  end;

  // O apresentador identifica a linha corrente, confirma (padrao "Nao") e
  // autoriza antes de executar; False interrompe sem repetir o que o legado
  // mostrou.
  if not Presenter.EnviarParaLixeira() then
    Exit;

  // A grade atualizada e a confirmacao do envio; nao ha dialogo de sucesso.
  if not RefreshResult then
    ShowWarning('O grupo fiscal já foi enviado para a lixeira. Refaça a pesquisa para atualizar a consulta.');
end;

end.
