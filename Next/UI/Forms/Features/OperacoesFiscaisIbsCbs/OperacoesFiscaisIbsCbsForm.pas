unit OperacoesFiscaisIbsCbsForm;

interface

uses
  System.SysUtils, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm,
  PresenterConsultaBase, NextQueryDefinition, LocalPreferences,
  OperacoesFiscaisIbsCbsView, OperacoesFiscaisIbsCbsPresenter,
  OperacoesFiscaisIbsCbsQueryDefinition, OperacaoFiscalIbsCbsEtdUnit,
  OperacaoFiscalIbsCbsCadastroFrame, EditorCadastro, AnaliseCondicoesForm;

type
  // Tela de consulta, inclusao e alteracao de Operacoes Fiscais IBS/CBS. Herda a
  // apresentacao generica e acrescenta a pesquisa da lixeira e as abas de
  // cadastro. A inclusao e cada registro alterado ocupam uma aba propria, cujo
  // editor e dono do rascunho e dos seletores. O apresentador e a definicao sao
  // injetados pela composicao; a base cria a aba e o editor a partir do contrato
  // comum.
  TfrmOperacoesFiscaisIbsCbs = class(TfrmConsultaBase, IOperacoesFiscaisIbsCbsView)
    chkLixeira: TCheckBox;
  private
    // Contrato tipado da consulta: entrega o identificador e as descricoes ja
    // apresentadas na linha corrente usados por Alterar.
    FDefinicaoSelecao: INextQueryDefinition<TOperacaoFiscalSelecionada>;
    // Funcao de composicao que cria e configura o editor de cada aba. A tela nao
    // conhece as dependencias do editor e nao guarda aba, frame nem rascunho.
    FCriarEditorAba: TCriarEditorCadastro;
    // Acesso tipado ao apresentador que a base possui e libera: esta tela nao
    // responde pela liberacao nem assume posse dele.
    function Presenter: TOperacoesFiscaisIbsCbsPresenter;
    // Recebe a funcao de composicao que cria e configura o editor de cada aba.
    // Executada por ConfigurarTela antes da primeira abertura e da posse do
    // apresentador.
    procedure ConfigurarCriacaoEditor(const ACriarEditor: TCriarEditorCadastro);
    // Identifica a aba de alteracao pelas descricoes ja apresentadas na
    // consulta; sem nenhuma descricao o identificador mantem a aba rastreavel.
    function TituloAlteracao(const AChave: string;
      const AOperacao: OperacaoFiscalIbsCbsEtd): string;
    procedure VerificarCondicoesAba(
      const ARascunho: OperacaoFiscalIbsCbsEtd);
  protected
    // Liga as acoes padrao da consulta aos metodos do apresentador depois que a
    // base aceitou a definicao e antes de assumir a posse.
    procedure ApresentadorAssociado(APresenter: TPresenterConsultaBase;
      const ADefinition: INextQueryDefinitionBase); override;
    // Inclusao depende do apresentador; Alterar exige tambem uma linha corrente
    // identificada na grade.
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
    procedure AvisarExclusaoSemAtualizacao; override;
  public
    // Abre a aba da chave e copia a operacao carregada para o rascunho do editor.
    // A entidade continua pertencendo a quem chamou. A falha de preparacao e
    // informada uma unica vez.
    function AbrirEdicao(const AChave: string;
      const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
    // Abre uma nova aba de inclusao; o editor cria o proprio rascunho e carrega
    // os seletores na preparacao. A falha e informada uma unica vez.
    function AbrirInclusao: Boolean;
    // Opcao lida pela definicao em cada pesquisa: vale para a proxima busca e
    // nao altera o resultado ja apresentado.
    function IsLixeiraSearch: Boolean;
    procedure ExibirAnaliseCondicoes(const AResumo, ARelatorio: string);
    // Unica entrada da configuracao inicial: associa a definicao, configura a
    // criacao do editor e os filtros e entrega o apresentador a base por ultimo.
    procedure ConfigurarTela(
      const ADefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
      const APresenter: TOperacoesFiscaisIbsCbsPresenter;
      const APreferences: ILocalPreferences;
      const ACriarEditor: TCriarEditorCadastro);
  end;

implementation

{$R *.dfm}

const
  MissingPresenterMessage =
    'O apresentador de Operações Fiscais IBS/CBS não foi informado.';
  MissingDefinitionMessage = 'A definição da consulta não foi informada.';
  MissingEditorFactoryMessage =
    'A criação do editor de Operações Fiscais IBS/CBS não foi informada.';
  // Prefixo e separador das descricoes no titulo da aba de alteracao.
  TituloAlteracaoPrefixo = 'Alterar - ';
  SeparadorTitulo = ' / ';

procedure TfrmOperacoesFiscaisIbsCbs.ConfigurarTela(
  const ADefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
  const APresenter: TOperacoesFiscaisIbsCbsPresenter;
  const APreferences: ILocalPreferences;
  const ACriarEditor: TCriarEditorCadastro);
const
  QueryTitle = 'Operações Fiscais IBS/CBS';
begin
  if APresenter = nil then
    raise Exception.Create(MissingPresenterMessage);
  if ADefinition = nil then
    raise Exception.Create(MissingDefinitionMessage);

  // A definicao, a fabrica do editor e os filtros precisam existir antes da
  // posse: a primeira abertura de aba ja usa a fabrica configurada e o
  // apresentador so passa a pertencer a tela em AssociarPresenter.
  Attach(ADefinition, QueryTitle);
  ConfigurarCriacaoEditor(ACriarEditor);
  ConfigureFilters(ADefinition.FiltersDef, APreferences, ADefinition.QueryId);
  AssociarPresenter(APresenter);
end;

function TfrmOperacoesFiscaisIbsCbs.Presenter: TOperacoesFiscaisIbsCbsPresenter;
begin
  // A instancia pertence a base; o valor e sempre o apresentador recebido por
  // ConfigurarTela.
  Result := TOperacoesFiscaisIbsCbsPresenter(PresenterConsulta);
end;

procedure TfrmOperacoesFiscaisIbsCbs.ApresentadorAssociado(
  APresenter: TPresenterConsultaBase;
  const ADefinition: INextQueryDefinitionBase);
var
  OperacoesPresenter: TOperacoesFiscaisIbsCbsPresenter;
begin
  // O identificador da linha corrente vem do mesmo contrato que a alteracao
  // consome. Sem esse contrato a tela abre, mas Alterar permanece desabilitado.
  if not Supports(ADefinition, INextQueryDefinition<TOperacaoFiscalSelecionada>,
    FDefinicaoSelecao) then
    FDefinicaoSelecao := nil;

  // O gancho roda antes da posse do apresentador: as acoes usam a instancia
  // recebida, que ainda pertence a composicao.
  OperacoesPresenter := TOperacoesFiscaisIbsCbsPresenter(APresenter);
  AssociarAcaoInclusao(OperacoesPresenter.CarregarParaInclusao);
  AssociarAcaoAlteracao(OperacoesPresenter.CarregarParaEdicao);
  AssociarAcaoExclusao(OperacoesPresenter.EnviarParaLixeira,
    'Enviar para a lixeira');
end;

function TfrmOperacoesFiscaisIbsCbs.TemRegistroCorrente: Boolean;
var
  Selecionado: TOperacaoFiscalSelecionada;
begin
  Result := inherited TemRegistroCorrente;
  if not Result then
    Exit;

  // A definicao le a linha corrente sem criar objetos de apresentacao. A chave
  // vazia nao identifica registro e nao habilita a alteracao.
  Result := (FDefinicaoSelecao <> nil) and
    FDefinicaoSelecao.TryGetSelected(Selecionado) and
    (Trim(Selecionado.Id) <> '');
end;

procedure TfrmOperacoesFiscaisIbsCbs.ConfigurarCriacaoEditor(
  const ACriarEditor: TCriarEditorCadastro);
begin
  if not Assigned(ACriarEditor) then
    raise Exception.Create(MissingEditorFactoryMessage);
  FCriarEditorAba := ACriarEditor;
end;

function TfrmOperacoesFiscaisIbsCbs.CriarEditor(const AChave: string;
  AParent: TWinControl): TWinControl;
var
  Frame: TfrmOperacaoFiscalIbsCbsCadastroFrame;
begin
  // Cada aba recebe o proprio frame, dono do rascunho e dos proprios seletores.
  // A base define Parent e Align e libera o editor junto com a aba.
  if not Assigned(FCriarEditorAba) then
    raise Exception.Create(MissingEditorFactoryMessage);
  Result := FCriarEditorAba(AChave, AParent);
  if not (Result is TfrmOperacaoFiscalIbsCbsCadastroFrame) then
    Exit;
  Frame := TfrmOperacaoFiscalIbsCbsCadastroFrame(Result);
  Frame.OnVerificarCondicoes := VerificarCondicoesAba;
end;

procedure TfrmOperacoesFiscaisIbsCbs.VerificarCondicoesAba(
  const ARascunho: OperacaoFiscalIbsCbsEtd);
begin
  if Presenter = nil then
    Exit;
  Presenter.AnalisarCondicoes(ARascunho);
end;

function TfrmOperacoesFiscaisIbsCbs.SalvarAba(const AChave: string;
  AEditor: TWinControl): Boolean;
var
  Frame: TfrmOperacaoFiscalIbsCbsCadastroFrame;
begin
  Result := False;
  if (Presenter = nil) or
    (not (AEditor is TfrmOperacaoFiscalIbsCbsCadastroFrame)) then
    Exit;

  Frame := TfrmOperacaoFiscalIbsCbsCadastroFrame(AEditor);
  Frame.LimparValidacao;
  if not Frame.AplicarCamposAoRascunho then
    Exit;

  // A entidade pertence ao frame e continua valida durante a chamada. Depois de
  // Salvar o frame nao e mais acessado: uma troca de sessao pode te-lo liberado.
  Result := Presenter.Salvar(Frame.Rascunho);
end;

procedure TfrmOperacoesFiscaisIbsCbs.ExibirAnaliseCondicoes(
  const AResumo, ARelatorio: string);
var
  Dialogo: TfrmAnaliseCondicoes;
begin
  Dialogo := TfrmAnaliseCondicoes.Create(nil);
  try
    Dialogo.Configure(AResumo, ARelatorio);
    Dialogo.ShowModal;
  finally
    Dialogo.Free;
  end;
end;

function TfrmOperacoesFiscaisIbsCbs.TituloAlteracao(const AChave: string;
  const AOperacao: OperacaoFiscalIbsCbsEtd): string;
var
  Descricao: string;

  // Acrescenta apenas a descricao existente, sem separador solto no inicio.
  procedure Adicionar(const ATexto: string);
  begin
    if Trim(ATexto) = '' then
      Exit;
    if Descricao <> '' then
      Descricao := Descricao + SeparadorTitulo;
    Descricao := Descricao + Trim(ATexto);
  end;

begin
  Descricao := '';
  Adicionar(AOperacao.OperacaoInternaDescricao);
  Adicionar(AOperacao.RegraFiscalDescricao);
  Adicionar(AOperacao.GrupoFiscalDescricao);

  // Sem descricao o identificador ainda permite reconhecer a aba aberta.
  if Descricao = '' then
    Descricao := AChave;

  Result := TituloAlteracaoPrefixo + Descricao;
end;

function TfrmOperacoesFiscaisIbsCbs.AbrirEdicao(const AChave: string;
  const AOperacao: OperacaoFiscalIbsCbsEtd): Boolean;
var
  Titulo: string;
  Operacao: OperacaoFiscalIbsCbsEtd;
  CargaFalhou: Boolean;
  Falha: string;
  Mensagem: string;
begin
  Result := False;
  if AOperacao = nil then
    Exit;

  // O titulo usa as descricoes antes de o frame copiar a entidade recebida.
  Titulo := TituloAlteracao(AChave, AOperacao);

  // O frame copia a operacao durante a abertura; o apresentador libera a
  // entidade original no finally.
  Operacao := AOperacao;
  CargaFalhou := False;
  Falha := '';
  Result := AbrirAba(AChave, Titulo,
    procedure(AEditor: TWinControl)
    begin
      if TfrmOperacaoFiscalIbsCbsCadastroFrame(AEditor).PrepararAlteracao(
        Operacao) then
        Exit;
      CargaFalhou := True;
      // O motivo pertence ao frame, liberado junto com a aba parcial; por isso
      // ele e copiado antes de Abort.
      Falha := TfrmOperacaoFiscalIbsCbsCadastroFrame(AEditor).FalhaCarga;
      Abort;
    end);

  if Result then
    Exit;

  if CargaFalhou then
  begin
    // O aviso identifica a carga que interrompeu a preparacao; sem motivo
    // registrado, mantem a mensagem generica.
    Mensagem :=
      'Não foi possível carregar os seletores e as empresas para a alteração';
    if Falha <> '' then
      Mensagem := Mensagem + ': ' + Falha;
    ShowWarning(Mensagem + '.');
  end
  else
    ShowError('Não foi possível iniciar a alteração da operação fiscal.');
end;

function TfrmOperacoesFiscaisIbsCbs.AbrirInclusao: Boolean;
var
  CargaFalhou: Boolean;
  Falha: string;
  Mensagem: string;
begin
  // A carga dos seletores e das empresas pertence ao editor e roda na
  // preparacao da aba. A falha e registrada aqui para que o aviso especifico
  // apareca uma unica vez.
  CargaFalhou := False;
  Falha := '';
  Result := AbrirAba(ChaveAbaInclusao, 'Inclusão',
    procedure(AEditor: TWinControl)
    begin
      // Abort interrompe a montagem; a base descarta a aba parcial e devolve
      // False sem apresentar mensagem.
      if TfrmOperacaoFiscalIbsCbsCadastroFrame(AEditor).PrepararInclusao then
        Exit;
      CargaFalhou := True;
      // O motivo pertence ao frame, liberado junto com a aba parcial; por isso
      // ele e copiado antes de Abort.
      Falha := TfrmOperacaoFiscalIbsCbsCadastroFrame(AEditor).FalhaCarga;
      Abort;
    end);

  if Result then
    Exit;

  if CargaFalhou then
  begin
    // O aviso identifica a carga que interrompeu a preparacao; sem motivo
    // registrado, mantem a mensagem generica.
    Mensagem :=
      'Não foi possível carregar os seletores e as empresas para a inclusão';
    if Falha <> '' then
      Mensagem := Mensagem + ': ' + Falha;
    ShowWarning(Mensagem + '.');
  end
  else
    ShowError('Não foi possível iniciar a inclusão da operação fiscal.');
end;

function TfrmOperacoesFiscaisIbsCbs.IsLixeiraSearch: Boolean;
begin
  Result := chkLixeira.Checked;
end;

procedure TfrmOperacoesFiscaisIbsCbs.AvisarSalvamentoSemAtualizacao;
begin
  // A base ja fechou a aba e descartou o rascunho; a mensagem confirma a
  // gravacao e orienta a atualizar a consulta.
  ShowWarning(
    'A operação fiscal foi salva. Refaça a pesquisa para atualizar a consulta.');
end;

procedure TfrmOperacoesFiscaisIbsCbs.AvisarExclusaoSemAtualizacao;
begin
  ShowWarning(
    'A operação fiscal já foi enviada para a lixeira. Refaça a pesquisa para atualizar a consulta.');
end;

end.
