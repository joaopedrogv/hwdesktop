unit GruposFiscaisForm;

interface

uses
  Winapi.Windows, System.SysUtils, System.Generics.Collections, Data.DB,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, ConsultaBaseForm, GruposFiscaisPresenter,
  GruposFiscaisView, NextQueryDefinition, GruposFiscaisQueryDefinition,
  GrupoFiscalCadastro, GrupoFiscalEtdUnit, GrupoFiscalCadastroFrame,
  ValidationEntityOutputUnit;

type
  // Contexto de uma aba de alteracao. O editor pertence a aba criada pela base,
  // que o libera junto com ela; o rascunho pertence ao contexto e e descartado
  // quando a aba e encerrada.
  TContextoEdicao = class
  public
    Chave: string;
    Editor: TfrmGrupoFiscalCadastroFrame;
    Rascunho: GrupoFiscalEtd;
    destructor Destroy; override;
  end;

  // Tela de consulta, inclusao e alteracao de Grupos Fiscais. Herda a
  // apresentacao generica e acrescenta a consulta, a alteracao, o envio da linha
  // corrente para a lixeira e as abas de cadastro. A inclusao e cada registro
  // alterado ocupam uma aba propria, com editor e rascunho da propria aba. O
  // apresentador e o leitor sao injetados pela composicao; o editor pertence a
  // aba criada pela base.
  TfrmGruposFiscais = class(TfrmConsultaBase, IGruposFiscaisView)
    btnNovo: TButton;
    btnAlterar: TButton;
    btnEnviarLixeira: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnEnviarLixeiraClick(Sender: TObject);
  private
    FPresenter: TGruposFiscaisPresenter;
    // Rascunho da inclusao corrente. A existencia do objeto e a pendencia: na
    // inclusao nao existe estado aberto sem alteracao a gravar, porque as
    // empresas permitidas ja iniciam marcadas.
    FDraft: GrupoFiscalEtd;
    // Referencia ao editor criado pela base para a aba de inclusao. A posse do
    // controle e da area de rolagem da aba, que o libera junto com ela.
    FEditor: TfrmGrupoFiscalCadastroFrame;
    // Empresas lidas antes de abrir a aba de inclusao, mantidas ate o preparo do
    // editor.
    FOpcoesEmpresas: TGrupoFiscalEmpresaOptions;
    // Registro carregado e empresas lidas antes de a aba de alteracao existir.
    // Os dois passam para o contexto da aba quando ela e montada.
    FAlteracaoGrupo: GrupoFiscalEtd;
    FAlteracaoOpcoes: TGrupoFiscalEmpresaOptions;
    // Contextos das abas de alteracao abertas, um por chave de registro. A lista
    // nasce no primeiro uso e e liberada na destruicao.
    FContextosEdicao: TObjectList<TContextoEdicao>;
    // Contrato tipado da consulta: entrega o identificador da linha corrente
    // usado por Alterar e Lixeira.
    FDefinicaoSelecao: INextQueryDefinition<TGrupoSelecionado>;
    // Estado dos comandos da consulta: Novo depende do apresentador e Alterar e
    // Lixeira exigem uma linha corrente identificada na grade.
    procedure AtualizarComandos;
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    function ListaContextosEdicao: TObjectList<TContextoEdicao>;
    function ContextoEdicao(const AChave: string): TContextoEdicao;
    procedure RemoverContextoEdicao(const AChave: string);
    function TemRegistroCorrente: Boolean;
    procedure DescartarAlteracaoPendente;
  protected
    function CanPesquisar: Boolean; override;
    procedure DoInitializeView; override;
    // A base cria a aba, o rodape e a area de rolagem; a tela fornece o editor
    // tipado usado pelos hooks de abertura, gravacao e foco.
    function CriarEditorInclusao(AParent: TWinControl): TWinControl; override;
    procedure AoAbrirAbaInclusao; override;
    procedure AoFecharAbaInclusao; override;
    procedure AoFalharAberturaAbaInclusao; override;
    function SalvarInclusao: Boolean; override;
    procedure AvisarSalvamentoSemAtualizacao; override;
    // Hooks da aba de alteracao: o editor e o rascunho pertencem ao contexto
    // identificado pela chave.
    function CriarEditorEdicao(AParent: TWinControl;
      const AChave: string): TWinControl; override;
    procedure AoAbrirAbaEdicao(const AChave: string;
      AEditor: TWinControl); override;
    procedure AoFecharAbaEdicao(const AChave: string;
      AEditor: TWinControl); override;
    procedure AoFalharAberturaAbaEdicao(const AChave: string); override;
    function SalvarEdicao(const AChave: string;
      AEditor: TWinControl): Boolean; override;
  public
    destructor Destroy; override;
    function HasPendingChanges: Boolean; override;
    procedure FocusView; override;
    // Encaminha ao editor da aba o resultado de validacao produzido pelo
    // apresentador; o painel de validacao pertence a cada editor. A chave vazia
    // identifica a inclusao e um identificador identifica a aba da alteracao.
    procedure ExibirValidacao(const AChave: string;
      const AValidacao: ValidationEntityOutput);
    // Reapresenta a aba de alteracao da chave ja aberta. Sem aba, nada e criado
    // e a alteracao segue para a autorizacao e a carga.
    function AtivarEdicao(const AChave: string): Boolean;
    // Assume o rascunho carregado no ponto de transferencia e monta a aba da
    // chave. A falha de montagem descarta a carga pendente e informa uma unica
    // vez.
    function AbrirEdicao(const AChave: string; var AGrupo: GrupoFiscalEtd;
      const AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
    procedure AttachPresenter(APresenter: TGruposFiscaisPresenter;
      const ADefinition: INextQueryDefinitionBase; const ATitle: string);
  end;

implementation

{$R *.dfm}

const
  MissingPresenterMessage = 'O apresentador de Grupos Fiscais nao foi informado.';
  MissingDefinitionMessage = 'A definicao da consulta nao foi informada.';

{ TContextoEdicao }

destructor TContextoEdicao.Destroy;
begin
  FreeAndNil(Rascunho);
  inherited;
end;

destructor TfrmGruposFiscais.Destroy;
begin
  try
    // Nenhum controle e tocado na destruicao: apenas a posse dos objetos
    // transientes desta tela e liberada. A base e os componentes do formulario
    // liberam as abas, os editores e o resultado.
    FreeAndNil(FContextosEdicao);
    DescartarAlteracaoPendente;
    FreeAndNil(FDraft);
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

function TfrmGruposFiscais.ListaContextosEdicao: TObjectList<TContextoEdicao>;
begin
  // A lista nasce no primeiro uso: telas que nunca abrem uma alteracao nao
  // alocam estrutura alguma.
  if FContextosEdicao = nil then
    FContextosEdicao := TObjectList<TContextoEdicao>.Create;
  Result := FContextosEdicao;
end;

function TfrmGruposFiscais.ContextoEdicao(
  const AChave: string): TContextoEdicao;
var
  Chave: string;
  I: Integer;
begin
  Result := nil;
  if FContextosEdicao = nil then
    Exit;

  Chave := Trim(AChave);
  for I := 0 to FContextosEdicao.Count - 1 do
    if FContextosEdicao[I].Chave = Chave then
    begin
      Result := FContextosEdicao[I];
      Break;
    end;
end;

procedure TfrmGruposFiscais.RemoverContextoEdicao(const AChave: string);
var
  Chave: string;
  I: Integer;
begin
  if FContextosEdicao = nil then
    Exit;

  // A lista libera o contexto e, com ele, o rascunho descartado da aba.
  Chave := Trim(AChave);
  for I := 0 to FContextosEdicao.Count - 1 do
    if FContextosEdicao[I].Chave = Chave then
    begin
      FContextosEdicao.Delete(I);
      Break;
    end;
end;

procedure TfrmGruposFiscais.DescartarAlteracaoPendente;
begin
  SetLength(FAlteracaoOpcoes, 0);
  FreeAndNil(FAlteracaoGrupo);
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

function TfrmGruposFiscais.CriarEditorInclusao(
  AParent: TWinControl): TWinControl;
begin
  // O editor nasce pertencendo a area de rolagem: quando a aba for liberada, a
  // area leva o editor junto e nao existe uma segunda liberacao.
  FEditor := TfrmGrupoFiscalCadastroFrame.Create(AParent);
  Result := FEditor;
end;

function TfrmGruposFiscais.CriarEditorEdicao(AParent: TWinControl;
  const AChave: string): TWinControl;
var
  Contexto: TContextoEdicao;
begin
  // Cada aba recebe o proprio editor e o proprio contexto: os dois nascem juntos
  // e o contexto e descartado quando a aba e encerrada.
  Contexto := TContextoEdicao.Create;
  try
    Contexto.Chave := Trim(AChave);
    Contexto.Editor := TfrmGrupoFiscalCadastroFrame.Create(AParent);
    ListaContextosEdicao.Add(Contexto);
    Result := Contexto.Editor;
  except
    // Sem o editor nao existe aba para este contexto.
    Contexto.Free;
    raise;
  end;
end;

procedure TfrmGruposFiscais.AoAbrirAbaInclusao;
begin
  // A aba ja esta montada; o rascunho nasce aqui para que HasPendingChanges
  // reflita exatamente o periodo de edicao.
  FEditor.PrepararInclusao(FOpcoesEmpresas);
  FDraft := GrupoFiscalEtd.Create;
end;

procedure TfrmGruposFiscais.AoFecharAbaInclusao;
begin
  // A base libera a aba em seguida: nenhuma referencia pode sobreviver ao
  // editor, e o rascunho pertence ao mesmo escopo da aba.
  FEditor := nil;
  FreeAndNil(FDraft);
  FOpcoesEmpresas := nil;
end;

procedure TfrmGruposFiscais.AoFalharAberturaAbaInclusao;
begin
  // A aba parcial ja foi liberada pela base; limpar apenas o estado proprio
  // evita apontar para o editor destruido.
  FEditor := nil;
  FreeAndNil(FDraft);
  FOpcoesEmpresas := nil;
end;

procedure TfrmGruposFiscais.AoAbrirAbaEdicao(const AChave: string;
  AEditor: TWinControl);
var
  Contexto: TContextoEdicao;
begin
  Contexto := ContextoEdicao(AChave);
  if Contexto = nil then
    Exit;

  // A carga feita antes de abrir a aba passa a pertencer a esta aba: o rascunho
  // e as empresas deixam de ser pendencia da tela.
  Contexto.Rascunho := FAlteracaoGrupo;
  FAlteracaoGrupo := nil;
  if Contexto.Rascunho = nil then
  begin
    SetLength(FAlteracaoOpcoes, 0);
    Exit;
  end;

  // O tipo de tributo e apresentado bloqueado e as empresas vinculadas chegam
  // marcadas; a tela nao decide nenhum desses valores.
  Contexto.Editor.PrepararAlteracao(Contexto.Rascunho.Descricao,
    Contexto.Rascunho.TipoTributo, FAlteracaoOpcoes);
  SetLength(FAlteracaoOpcoes, 0);
end;

procedure TfrmGruposFiscais.AoFecharAbaEdicao(const AChave: string;
  AEditor: TWinControl);
begin
  // A base libera a aba em seguida: o contexto e o rascunho sao descartados
  // antes disso, com o editor ainda existente.
  RemoverContextoEdicao(AChave);
end;

procedure TfrmGruposFiscais.AoFalharAberturaAbaEdicao(const AChave: string);
begin
  // A aba parcial ja foi liberada pela base: resta descartar o contexto criado
  // com o editor, sem tocar em controle destruido.
  RemoverContextoEdicao(AChave);
end;

function TfrmGruposFiscais.SalvarInclusao: Boolean;
begin
  Result := False;
  if (FDraft = nil) or (FEditor = nil) or (FPresenter = nil) then
    Exit;

  // Somente os tres campos da aba sao mapeados; os demais permanecem com os
  // padroes de criacao do rascunho.
  FDraft.Descricao := Trim(FEditor.Descricao);
  FDraft.TipoTributo := FEditor.TipoTributo;
  FDraft.EmpresasId := FEditor.EmpresasSelecionadas;
  FEditor.LimparValidacao;

  if not FPresenter.Salvar(FDraft) then
    Exit;

  // Uma mensagem modal do apresentador pode despachar uma troca de sessao, que
  // encerra a inclusao. Sem rascunho e sem editor nao existe aba a encerrar: a
  // base nao deve receber o pedido de fechamento.
  Result := (FDraft <> nil) and (FEditor <> nil);
end;

function TfrmGruposFiscais.SalvarEdicao(const AChave: string;
  AEditor: TWinControl): Boolean;
var
  Contexto: TContextoEdicao;
begin
  Result := False;
  Contexto := ContextoEdicao(AChave);
  if (Contexto = nil) or (Contexto.Rascunho = nil) or (FPresenter = nil) then
    Exit;

  // O rascunho e a entidade carregada: o identificador permanece e o caso de uso
  // grava por Put. Somente os campos editaveis sao remapeados.
  Contexto.Rascunho.Descricao := Trim(Contexto.Editor.Descricao);
  Contexto.Rascunho.TipoTributo := Contexto.Editor.TipoTributo;
  Contexto.Rascunho.EmpresasId := Contexto.Editor.EmpresasSelecionadas;
  Contexto.Editor.LimparValidacao;

  if not FPresenter.Salvar(Contexto.Rascunho) then
    Exit;

  // Uma mensagem modal do apresentador pode despachar uma troca de sessao, que
  // encerra esta aba. O contexto ja pode ter sido liberado: a base so recebe o
  // pedido de fechamento se a aba ainda existir.
  Result := ContextoEdicao(AChave) <> nil;
end;

procedure TfrmGruposFiscais.ExibirValidacao(const AChave: string;
  const AValidacao: ValidationEntityOutput);
var
  Contexto: TContextoEdicao;
begin
  // A inclusao nao tem identificador: o painel pertence ao editor dela. A aba
  // pode ter sido encerrada por uma troca de sessao antes desta chamada.
  if Trim(AChave) = '' then
  begin
    if FEditor <> nil then
      FEditor.ExibirValidacao(AValidacao);
    Exit;
  end;

  Contexto := ContextoEdicao(AChave);
  if (Contexto = nil) or (Contexto.Editor = nil) then
    Exit;

  Contexto.Editor.ExibirValidacao(AValidacao);
end;

function TfrmGruposFiscais.AtivarEdicao(const AChave: string): Boolean;
begin
  // Reabrir devolve a aba existente sem repetir autorizacao nem recarregar o
  // registro: o rascunho ainda pertence a sessao atual.
  Result := AbaEdicaoAberta[AChave];
  if Result then
    AtivarAbaEdicao(AChave);
end;

function TfrmGruposFiscais.AbrirEdicao(const AChave: string;
  var AGrupo: GrupoFiscalEtd;
  const AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
var
  Titulo: string;
begin
  Result := False;
  if AGrupo = nil then
    Exit;

  // O titulo usa a descricao antes de a posse do rascunho passar para a aba.
  Titulo := 'Alterar - ' + AGrupo.Descricao;

  // A transferencia de posse acontece antes de a base criar a aba: o hook de
  // abertura encontra o rascunho pendente e o leva para o contexto, que o
  // libera junto com a aba.
  FAlteracaoGrupo := AGrupo;
  AGrupo := nil;
  FAlteracaoOpcoes := AOpcoes;
  try
    Result := AbrirAbaEdicao(AChave, Titulo);
  except
    // A base ja liberou a aba parcial e o hook de falha descartou o contexto;
    // aqui se descarta o rascunho que nao chegou a uma aba. A falha e informada
    // uma unica vez.
    DescartarAlteracaoPendente;
    ShowError('Não foi possível iniciar a alteração do grupo fiscal.');
    Exit;
  end;

  // Uma aba que ja existia nao consome a carga pendente: o rascunho nao
  // pertence a nenhuma aba.
  if FAlteracaoGrupo <> nil then
    DescartarAlteracaoPendente;
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
begin
  // Qualquer rascunho aberto e pendencia: a inclusao ja contem dados a gravar e
  // cada aba de alteracao com rascunho tambem.
  Result := FDraft <> nil;
  if Result or (FContextosEdicao = nil) then
    Exit;

  for I := 0 to FContextosEdicao.Count - 1 do
    if FContextosEdicao[I].Rascunho <> nil then
    begin
      Result := True;
      Break;
    end;
end;

procedure TfrmGruposFiscais.FocusView;
var
  Contexto: TContextoEdicao;
begin
  // Com a aba de inclusao ativa, o foco pertence ao primeiro campo invalido (ou
  // a descricao).
  if AbaInclusaoAtiva and (FEditor <> nil) then
  begin
    FEditor.FocarPrimeiroCampoInvalido;
    Exit;
  end;

  // Com uma aba de alteracao ativa, o foco pertence ao editor daquela aba.
  if HaAbaEdicaoAtiva then
  begin
    Contexto := ContextoEdicao(ChaveAbaEdicaoAtiva);
    if (Contexto <> nil) and (Contexto.Editor <> nil) then
    begin
      Contexto.Editor.FocarPrimeiroCampoInvalido;
      Exit;
    end;
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
  if AbaInclusaoAberta then
  begin
    AtivarAbaInclusao;
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

  FOpcoesEmpresas := Opcoes;
  try
    AbrirAbaInclusao;
  except
    // A base ja liberou a aba parcial e o hook de falha limpou FEditor/FDraft;
    // aqui resta informar a falha ao usuario.
    ShowError('Não foi possível iniciar a inclusão do grupo fiscal.');
  end;
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
