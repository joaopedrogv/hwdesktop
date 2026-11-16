unit GruposFiscaisPresenter;

interface

uses
  AuthorizationService, RemoverGrupoFiscalUseCaseUnit, GruposFiscaisView,
  SalvarGrupoFiscalUseCaseUnit, ObterGruposFiscaisUseCaseUnit,
  ListarEmpresasUseCaseUnit, ISessionContextUnit,
  GrupoFiscalEtdUnit, EmpresaOption, EmpresaOptionsBuilder, TipoComunsUnit,
  NextQueryDefinition, GruposFiscaisQueryDefinition;

type
  // Apresentador da consulta, da inclusao e da alteracao de Grupos Fiscais.
  // Encaminha a leitura para a consulta injetada, verifica a autorizacao antes
  // das operacoes e executa a remocao logica, o carregamento e a gravacao. A
  // inclusao e uma unica chamada: reapresenta a aba existente ou autoriza,
  // carrega as empresas e entrega as opcoes a tela, que cria o rascunho da aba.
  // A alteracao tambem e uma unica chamada: identifica a linha corrente,
  // reapresenta a aba existente ou autoriza, carrega o registro e entrega o
  // grupo a tela, que monta o rascunho da aba.
  // As mensagens e os erros de campo sao apresentados pela view recebida no
  // construtor; a negativa ou o cancelamento ja apresentado pelo legado e a
  // indisponibilidade comunicada pelo proprio servico de autorizacao nao sao
  // repetidos. Delega a leitura das empresas a preparacao compartilhada, que le
  // o login a cada operacao, e encaminha o resultado de validacao do caso de uso.
  TGruposFiscaisPresenter = class
  private
    // A view pertence a tela e as demais dependencias ao container de
    // composicao: o apresentador apenas as utiliza e nunca as libera.
    FView: IGruposFiscaisView;
    FQueryDefinition: INextQueryDefinition<TGrupoSelecionado>;
    FAuthorization: IAuthorizationService;
    FRemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
    FSalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
    FListarEmpresas: ListarEmpresasUseCase;
    FObterGrupoFiscal: ObterGrupoFiscalPorIdUseCase;
    FSession: ISessionContext;
    // Verifica a permissao de inclusao; a negativa ou o cancelamento ja foi
    // apresentado pelo legado.
    function AutorizarInclusao: Boolean;
    // Le as empresas da inclusao com o login atual e avisa a falha na propria
    // tela, porque a inclusao nao tem outra mensagem para essa leitura.
    function CarregarEmpresas(out AOpcoes: TEmpresaOptions): Boolean;
    // Acrescenta as marcas dos vinculos gravados as opcoes recebidas e deixa a
    // falha de leitura para quem chamou.
    function CarregarEmpresasAlteracao(
      const AEmpresasVinculadas: TArrayInteger;
      out AOpcoes: TEmpresaOptions): Boolean;
  public
    constructor Create(AView: IGruposFiscaisView;
      AQueryDefinition: INextQueryDefinition<TGrupoSelecionado>;
      AAuthorization: IAuthorizationService;
      ARemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
      ASalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
      AListarEmpresas: ListarEmpresasUseCase;
      AObterGrupoFiscal: ObterGrupoFiscalPorIdUseCase;
      ASession: ISessionContext);
    function AutorizarPesquisa: Boolean;
    function EnviarParaLixeira(): Boolean;
    // Reapresenta a aba de inclusao quando ela ja existe; caso contrario
    // autoriza a inclusao, carrega as empresas e entrega as opcoes para a nova
    // aba, que cria o proprio rascunho. A negativa da autorizacao ou a falha na
    // leitura das empresas ja foi apresentada e interrompe a operacao.
    function CarregarParaInclusao(): Boolean;
    // Reapresenta a aba da linha corrente quando ela ja existe; caso contrario
    // autoriza a alteracao, carrega o registro e as empresas e entrega o grupo
    // para a nova aba. Sem linha valida a view informa que a selecao e
    // obrigatoria e a operacao nao prossegue.
    function CarregarParaEdicao(): Boolean;
    function Salvar(const ARascunho: GrupoFiscalEtd): Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, StatusRegistroEnumUnit,
  CreateEntityUseCaseOutputUnit;

const
  // Codigos do cadastro legado usados por esta funcionalidade. O host recebe o
  // processo, a acao e a tabela e nao os conhece.
  ProcessoConsulta    = 'MOD008';
  ProcessoInclusao    = 'MOD009';
  ProcessoAlteracao   = 'MOD010';
  ProcessoGravacao    = 'MOD011';
  ProcessoExclusao    = 'MOD012';
  TabelaGruposFiscais = 'GRUPOS_FISCAIS';

  // Mensagens repetidas na mesma operacao.
  EmpresasFalhaMessage =
    'Não foi possível carregar as empresas para a inclusão.';
  EmpresasAlteracaoFalhaMessage =
    'Não foi possível carregar as empresas para a alteração.';
  SelecaoObrigatoriaMessage = 'Selecione um grupo fiscal na grade.';

{ TGruposFiscaisPresenter }

constructor TGruposFiscaisPresenter.Create(AView: IGruposFiscaisView;
  AQueryDefinition: INextQueryDefinition<TGrupoSelecionado>;
  AAuthorization: IAuthorizationService;
  ARemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
  ASalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
  AListarEmpresas: ListarEmpresasUseCase;
  AObterGrupoFiscal: ObterGrupoFiscalPorIdUseCase;
  ASession: ISessionContext);
begin
  inherited Create;
  if AView = nil then
    raise Exception.Create('A view de Grupos Fiscais não foi informada.');
  if AQueryDefinition = nil then
    raise Exception.Create('A consulta de Grupos Fiscais não foi informada.');
  if AAuthorization = nil then
    raise Exception.Create('O serviço de autorização de Grupos Fiscais não foi informado.');
  if ARemoverGrupoFiscal = nil then
    raise Exception.Create('O caso de uso de remoção de Grupos Fiscais não foi informado.');
  if ASalvarGrupoFiscal = nil then
    raise Exception.Create('O caso de uso de gravação de Grupos Fiscais não foi informado.');
  if AListarEmpresas = nil then
    raise Exception.Create('A consulta de empresas não foi informada.');
  if AObterGrupoFiscal = nil then
    raise Exception.Create('O caso de uso de carregamento de Grupos Fiscais não foi informado.');
  if ASession = nil then
    raise Exception.Create('A sessão de Grupos Fiscais não foi informada.');

  FView := AView;
  FQueryDefinition := AQueryDefinition;
  // A indisponibilidade da autorizacao e comunicada pelo proprio servico; o
  // apresentador apenas interrompe a operacao.
  FAuthorization := AAuthorization;
  FRemoverGrupoFiscal := ARemoverGrupoFiscal;
  FSalvarGrupoFiscal := ASalvarGrupoFiscal;
  FListarEmpresas := AListarEmpresas;
  FObterGrupoFiscal := AObterGrupoFiscal;
  FSession := ASession;
end;

function TGruposFiscaisPresenter.AutorizarPesquisa: Boolean;
var
  Autorizacao: TAuthorizationResult;
begin
  Result := FAuthorization.Authorize(ProcessoConsulta, aaVisualizar, TabelaGruposFiscais).Outcome = aoAllowed;
end;

function TGruposFiscaisPresenter.EnviarParaLixeira(): Boolean;
var
  Selected: TGrupoSelecionado;
begin
  Result := False;

  // A linha corrente e lida uma unica vez; o mesmo registro identificado na
  // confirmacao e enviado para a lixeira.
  if not FQueryDefinition.TryGetSelected(Selected) then
  begin
    FView.ShowError('O grupo fiscal a enviar para a lixeira não foi identificado.');
    Exit;
  end;

  if not FView.ShowDangerQuestion(Format('Deseja enviar o grupo fiscal "%s" para a lixeira?',
      [Selected.Descricao])) then
    Exit;

  if FAuthorization.Authorize(ProcessoExclusao, aaExcluir, TabelaGruposFiscais).Outcome <> aoAllowed then
    Exit;

  try
    FRemoverGrupoFiscal.Executar(Selected.Id);
    Result := True;
  except
    on E: EValidacaoNegocio do
      FView.ShowError(E.Message);
    on E: Exception do
      // O texto tecnico do banco nao deve chegar a interface.
      FView.ShowError('Não foi possível enviar o grupo fiscal para a lixeira.');
  end;
end;

function TGruposFiscaisPresenter.AutorizarInclusao: Boolean;
begin
  Result := FAuthorization.Authorize(ProcessoInclusao, aaInserir, TabelaGruposFiscais).Outcome = aoAllowed;
end;

function TGruposFiscaisPresenter.CarregarParaInclusao: Boolean;
var
  Opcoes: TEmpresaOptions;
begin
  Result := False;

  // Aba ja aberta: reapresenta o rascunho existente, sem nova autorizacao e
  // sem recarregar as empresas.
  if FView.AtivarInclusao then
  begin
    Result := True;
    Exit;
  end;

  // A negativa ou o cancelamento ja foi apresentado pelo legado.
  if not AutorizarInclusao then
    Exit;

  // Sem as empresas nao ha o que incluir; o aviso ja foi apresentado.
  if not CarregarEmpresas(Opcoes) then
    Exit;

  Result := FView.AbrirInclusao(Opcoes);
end;

function TGruposFiscaisPresenter.CarregarParaEdicao: Boolean;
var
  Selected: TGrupoSelecionado;
  Id: string;
  Carregado: GrupoFiscalEtd;
  Opcoes: TEmpresaOptions;
begin
  Result := False;

  // A linha corrente e lida uma unica vez: o mesmo registro identificado aqui e
  // o que a tela reapresenta ou carrega.
  if not FQueryDefinition.TryGetSelected(Selected) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  Id := Trim(Selected.Id);
  if Id = '' then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  // Aba ja aberta: reapresenta o rascunho existente, sem nova autorizacao e sem
  // recarregar o registro.
  if FView.AtivarEdicao(Id) then
  begin
    Result := True;
    Exit;
  end;

  // A permissao de alteracao e verificada antes de qualquer leitura; a negativa
  // ou o cancelamento ja foi apresentado pelo legado.
  if FAuthorization.Authorize(ProcessoAlteracao, aaAlterar,
    TabelaGruposFiscais).Outcome <> aoAllowed then
    Exit;

  Carregado := nil;
  try
    try
      Carregado := FObterGrupoFiscal.Executar(Id);
      if Carregado = nil then
      begin
        FView.ShowError('O grupo fiscal selecionado não foi encontrado.');
        Exit;
      end;

      // A consulta apresenta apenas registros ativos.
      if Carregado.Ativo <> saAtivo then
      begin
        FView.ShowError(
          'O grupo fiscal selecionado está fora da consulta de ativos.');
        Exit;
      end;

      if not CarregarEmpresasAlteracao(Carregado.EmpresasId, Opcoes) then
        Exit;

      // A view copia o grupo para o rascunho da aba; a entidade continua
      // pertencendo a este metodo e e liberada no finally.
      Result := FView.AbrirEdicao(Id, Carregado, Opcoes);
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message);
      on E: Exception do
        // O texto tecnico do banco nao deve chegar a interface.
        FView.ShowError('Não foi possível carregar o grupo fiscal para alteração.');
    end;
  finally
    Carregado.Free;
  end;
end;

function TGruposFiscaisPresenter.CarregarEmpresas(
  out AOpcoes: TEmpresaOptions): Boolean;
begin
  // Na inclusao a mensagem e unica para qualquer falha de leitura.
  Result := MontarOpcoesEmpresas(FListarEmpresas, FSession, AOpcoes);
  if not Result then
    FView.ShowWarning(EmpresasFalhaMessage);
end;

function TGruposFiscaisPresenter.CarregarEmpresasAlteracao(
  const AEmpresasVinculadas: TArrayInteger;
  out AOpcoes: TEmpresaOptions): Boolean;
begin
  Result := MontarOpcoesEmpresas(FListarEmpresas, FSession, AOpcoes);
  if not Result then
  begin
    FView.ShowWarning(EmpresasAlteracaoFalhaMessage);
    Exit;
  end;

  MarcarEmpresasVinculadas(AOpcoes, AEmpresasVinculadas);
end;

function TGruposFiscaisPresenter.Salvar(
  const ARascunho: GrupoFiscalEtd): Boolean;
var
  Resultado: CreateEntityUseCaseOutPut;
begin
  Result := False;

  if ARascunho = nil then
  begin
    FView.ShowError('O rascunho do grupo fiscal não foi informado.');
    Exit;
  end;

  if FAuthorization.Authorize(ProcessoGravacao, aaSalvar, TabelaGruposFiscais).Outcome <> aoAllowed then
    Exit;

  Resultado := nil;
  try
    try
      Resultado := FSalvarGrupoFiscal.Executar(ARascunho);

      if Resultado.Validation.IsValid then
        Result := True
      else
        // A validacao volta para a aba que iniciou a gravacao.
        FView.ExibirValidacao(Resultado.Validation);
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message);
      on E: Exception do
        // O texto tecnico do banco nao deve chegar a interface.
        FView.ShowError('Não foi possível salvar o grupo fiscal.');
    end;
  finally
    // O resultado do caso de uso libera a entidade persistida; o apresentador
    // nunca a devolve nem a retem.
    Resultado.Free;
  end;
end;

end.
