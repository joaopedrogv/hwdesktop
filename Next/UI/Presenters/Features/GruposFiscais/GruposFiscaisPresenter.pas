unit GruposFiscaisPresenter;

interface

uses
  AuthorizationService, RemoverGrupoFiscalUseCaseUnit, GruposFiscaisView,
  SalvarGrupoFiscalUseCaseUnit, ObterGruposFiscaisUseCaseUnit,
  GrupoFiscalEtdUnit,
  NextQueryDefinition, GruposFiscaisQueryDefinition, PresenterConsultaBase;

type
  // Apresentador da consulta, da inclusao e da alteracao de Grupos Fiscais.
  // Encaminha a leitura para a consulta injetada, verifica a autorizacao antes
  // das operacoes e executa a remocao logica, o carregamento e a gravacao.
  // A inclusao reapresenta a aba existente ou autoriza e entrega a abertura a
  // tela, que prepara o rascunho e carrega as empresas na propria aba. A
  // alteracao identifica a linha corrente, reapresenta a aba existente ou
  // autoriza, carrega o registro e delega a tela a preparacao da aba e das
  // empresas.
  // As mensagens e os erros de campo sao apresentados pela view recebida no
  // construtor; a negativa ou o cancelamento ja apresentado pelo legado e a
  // indisponibilidade comunicada pelo proprio servico de autorizacao nao sao
  // repetidos. O resultado de validacao do caso de uso volta para a aba que
  // iniciou a gravacao.
  TGruposFiscaisPresenter = class(TPresenterConsultaBase)
  private
    // A view pertence a tela e as demais dependencias ao container de
    // composicao: o apresentador apenas as utiliza e nunca as libera.
    FView: IGruposFiscaisView;
    FQueryDefinition: INextQueryDefinition<TGrupoSelecionado>;
    FRemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
    FSalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
    FObterGrupoFiscal: ObterGrupoFiscalPorIdUseCase;
  public
    constructor Create(AView: IGruposFiscaisView;
      AQueryDefinition: INextQueryDefinition<TGrupoSelecionado>;
      AAuthorization: IAuthorizationService;
      ARemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
      ASalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
      AObterGrupoFiscal: ObterGrupoFiscalPorIdUseCase);
    function EnviarParaLixeira(): Boolean;
    // Reapresenta a aba de inclusao quando ela ja existe; caso contrario autoriza
    // a inclusao e entrega a abertura para a nova aba, que cria o proprio
    // rascunho e carrega as empresas. A negativa da autorizacao ja foi
    // apresentada e interrompe a operacao.
    function CarregarParaInclusao(): Boolean;
    // Reapresenta a aba da linha corrente quando ela ja existe; caso contrario
    // autoriza a alteracao, carrega o registro e entrega o grupo para a nova
    // aba, que prepara o rascunho e os vinculos das empresas. Sem linha valida a
    // view informa que a selecao e obrigatoria e a operacao nao prossegue.
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

  SelecaoObrigatoriaMessage = 'Selecione um grupo fiscal na grade.';

{ TGruposFiscaisPresenter }

constructor TGruposFiscaisPresenter.Create(AView: IGruposFiscaisView;
  AQueryDefinition: INextQueryDefinition<TGrupoSelecionado>;
  AAuthorization: IAuthorizationService;
  ARemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
  ASalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
  AObterGrupoFiscal: ObterGrupoFiscalPorIdUseCase);
begin
  // O processo de pesquisa e a tabela padrao ficam na base, que tambem responde
  // pela permissao da consulta. As demais operacoes informam o proprio processo
  // e usam essa tabela padrao.
  inherited Create(AAuthorization, ProcessoConsulta, TabelaGruposFiscais);
  if AView = nil then
    raise Exception.Create('A view de Grupos Fiscais não foi informada.');
  if AQueryDefinition = nil then
    raise Exception.Create('A consulta de Grupos Fiscais não foi informada.');
  if ARemoverGrupoFiscal = nil then
    raise Exception.Create('O caso de uso de remoção de Grupos Fiscais não foi informado.');
  if ASalvarGrupoFiscal = nil then
    raise Exception.Create('O caso de uso de gravação de Grupos Fiscais não foi informado.');
  if AObterGrupoFiscal = nil then
    raise Exception.Create('O caso de uso de carregamento de Grupos Fiscais não foi informado.');

  FView := AView;
  FQueryDefinition := AQueryDefinition;
  FRemoverGrupoFiscal := ARemoverGrupoFiscal;
  FSalvarGrupoFiscal := ASalvarGrupoFiscal;
  FObterGrupoFiscal := AObterGrupoFiscal;
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

  if not Autorizar(ProcessoExclusao, aaExcluir) then
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

function TGruposFiscaisPresenter.CarregarParaInclusao: Boolean;
begin
  Result := False;

  if FView.AtivarInclusao then
  begin
    Result := True;
    Exit;
  end;

  // A negativa ou o cancelamento ja foi apresentado pelo legado.
  if not Autorizar(ProcessoInclusao, aaInserir) then
    Exit;

  // A aba carrega as empresas ao ser preparada; a falha descarta a aba parcial
  // e e informada uma unica vez pela propria tela.
  Result := FView.AbrirInclusao;
end;

function TGruposFiscaisPresenter.CarregarParaEdicao: Boolean;
var
  Selected: TGrupoSelecionado;
  Id: string;
  Carregado: GrupoFiscalEtd;
begin
  Result := False;

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

  if FView.AtivarEdicao(Id) then
  begin
    Result := True;
    Exit;
  end;

  // A permissao de alteracao e verificada antes de qualquer leitura.
  if not Autorizar(ProcessoAlteracao, aaAlterar) then
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

      // A view copia o grupo para o rascunho da aba; a entidade continua
      // pertencendo a este metodo e e liberada no finally.
      Result := FView.AbrirEdicao(Id, Carregado);
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

  if not Autorizar(ProcessoGravacao, aaSalvar) then
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
