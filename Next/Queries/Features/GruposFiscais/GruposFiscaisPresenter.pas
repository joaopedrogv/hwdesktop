unit GruposFiscaisPresenter;

interface

uses
  AuthorizationService, RemoverGrupoFiscalUseCaseUnit, GruposFiscaisView,
  SalvarGrupoFiscalUseCaseUnit, ObterGruposFiscaisUseCaseUnit,
  ListarEmpresasUseCaseUnit, ISessionContextUnit,
  GrupoFiscalEtdUnit, GrupoFiscalCadastro, TipoComunsUnit, NextQueryDefinition,
  GruposFiscaisQueryDefinition;

type
  // Apresentador da consulta, da inclusao e da alteracao de Grupos Fiscais.
  // Encaminha a leitura para a consulta injetada, verifica a autorizacao antes
  // das operacoes e executa a remocao logica, o carregamento e a gravacao. A
  // alteracao e uma unica chamada: identifica a linha corrente, reapresenta a
  // aba existente ou autoriza, carrega o registro e entrega o grupo a tela, que
  // monta o rascunho da aba.
  // As mensagens e os erros de campo sao apresentados pela view recebida no
  // construtor; a negativa ou o cancelamento ja apresentado pelo legado e a
  // indisponibilidade comunicada pelo proprio servico de autorizacao nao sao
  // repetidos. Le o login da sessao a cada operacao, traduz as empresas para o
  // contrato da tela e encaminha o resultado de validacao do caso de uso.
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
    // Leitura comum a inclusao e a alteracao: todas as empresas na ordem do
    // cadastro, habilitadas apenas as permitidas ao login corrente, e a falha
    // informada por quem chamou.
    function MontarOpcoesEmpresas(
      out AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
    procedure MarcarEmpresasVinculadas(
      var AOpcoes: TGrupoFiscalEmpresaOptions;
      const AEmpresasVinculadas: TArrayInteger);
    function CarregarEmpresasAlteracao(
      const AEmpresasVinculadas: TArrayInteger;
      out AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
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
    function AutorizarInclusao: Boolean;
    // Reapresenta a aba da linha corrente quando ela ja existe; caso contrario
    // autoriza a alteracao, carrega o registro e as empresas e entrega o grupo
    // para a nova aba. Sem linha valida a view informa que a selecao e
    // obrigatoria e a operacao nao prossegue.
    function CarregarParaEdicao(): Boolean;
    function CarregarEmpresas(out AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
    function Salvar(const ARascunho: GrupoFiscalEtd): Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, EmpresaEtdUnit,
  StatusRegistroEnumUnit, CreateEntityUseCaseOutputUnit;

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

function TGruposFiscaisPresenter.CarregarParaEdicao: Boolean;
var
  Selected: TGrupoSelecionado;
  Id: string;
  Carregado: GrupoFiscalEtd;
  Opcoes: TGrupoFiscalEmpresaOptions;
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
  out AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
begin
  // Na inclusao a mensagem e unica para qualquer falha de leitura.
  Result := MontarOpcoesEmpresas(AOpcoes);
  if not Result then
    FView.ShowWarning(EmpresasFalhaMessage);
end;

function TGruposFiscaisPresenter.CarregarEmpresasAlteracao(
  const AEmpresasVinculadas: TArrayInteger;
  out AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
begin
  Result := MontarOpcoesEmpresas(AOpcoes);
  if not Result then
  begin
    FView.ShowWarning(EmpresasAlteracaoFalhaMessage);
    Exit;
  end;

  MarcarEmpresasVinculadas(AOpcoes, AEmpresasVinculadas);
end;

function TGruposFiscaisPresenter.MontarOpcoesEmpresas(
  out AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
var
  TodasEmpresas: EmpresasEtd;
  EmpresasPermitidas: EmpresasEtd;
  Login: string;
  I: Integer;
  J: Integer;
  Empresa: EmpresaEtd;
  Opcao: TGrupoFiscalEmpresaOption;
begin
  Result := False;
  SetLength(AOpcoes, 0);

  // O login e lido a cada operacao: o host pode trocar o usuario mantendo esta
  // janela viva.
  Login := Trim(FSession.UsuarioLogin);
  if Login = '' then
    Exit;

  TodasEmpresas := nil;
  EmpresasPermitidas := nil;
  try
    try
      TodasEmpresas := FListarEmpresas.Executar();
      EmpresasPermitidas := FListarEmpresas.Executar(Login);

      if (TodasEmpresas = nil) or (EmpresasPermitidas = nil) then
        Exit;

      // A ordem e a da lista total (COD_EMPRESA). Empresas permitidas que nao
      // constam dela sao ignoradas, como no legado. As listas pertencem ao
      // apresentador e nenhuma entidade chega a tela.
      SetLength(AOpcoes, TodasEmpresas.Count);
      for I := 0 to TodasEmpresas.Count - 1 do
      begin
        Empresa := EmpresaEtd(TodasEmpresas.Items[I]);
        Opcao.Id := Empresa.Id;
        Opcao.Texto := Format('%d - %s',
          [Empresa.Id, Empresa.Identificacao]);
        Opcao.Habilitada := False;
        for J := 0 to EmpresasPermitidas.Count - 1 do
          if EmpresaEtd(EmpresasPermitidas.Items[J]).Id = Empresa.Id then
          begin
            Opcao.Habilitada := True;
            Break;
          end;

        // A inclusao marca toda empresa permitida; a alteracao substitui a
        // marca pelo vinculo gravado.
        Opcao.Marcada := Opcao.Habilitada;
        AOpcoes[I] := Opcao;
      end;

      Result := True;
    except
      // Falha de leitura ou de montagem interrompe a operacao; nenhuma opcao
      // parcial e devolvida.
      SetLength(AOpcoes, 0);
    end;
  finally
    EmpresasPermitidas.Free;
    TodasEmpresas.Free;
  end;
end;

procedure TGruposFiscaisPresenter.MarcarEmpresasVinculadas(
  var AOpcoes: TGrupoFiscalEmpresaOptions;
  const AEmpresasVinculadas: TArrayInteger);
var
  I: Integer;
  J: Integer;
begin
  // A marca pertence ao vinculo gravado e a permissao apenas habilita a troca:
  // vinculos sem permissao continuam marcados e bloqueados, como no cadastro
  // legado.
  for I := 0 to High(AOpcoes) do
  begin
    AOpcoes[I].Marcada := False;
    for J := 0 to High(AEmpresasVinculadas) do
      if AOpcoes[I].Id = AEmpresasVinculadas[J] then
      begin
        AOpcoes[I].Marcada := True;
        Break;
      end;
  end;
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
