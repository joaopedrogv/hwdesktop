unit GruposFiscaisPresenter;

interface

uses
  FilterCriterion, IDataSetReaderUnit, GruposFiscaisQuery, AuthorizationService,
  RemoverGrupoFiscalUseCaseUnit, GruposFiscaisView, SalvarGrupoFiscalUseCaseUnit,
  ListarEmpresasUseCaseUnit, ISessionContextUnit, GrupoFiscalEtdUnit,
  GrupoFiscalCadastro;

type
  // Apresentador da consulta e da inclusao de Grupos Fiscais. Encaminha a
  // leitura para a consulta injetada, verifica a autorizacao antes das
  // operacoes e executa a remocao logica e a gravacao. As mensagens e os erros
  // de campo sao apresentados pela view recebida no construtor; a negativa ou o
  // cancelamento ja apresentado pelo legado nao e repetido. Le o login da
  // sessao a cada inclusao, traduz as empresas para o contrato da tela e
  // encaminha o resultado de validacao do caso de uso, sem entregar entidades
  // ou listas do contexto Modern.
  TGruposFiscaisPresenter = class
  private
    // A view pertence a tela e as demais dependencias ao container de
    // composicao: o apresentador apenas as utiliza e nunca as libera.
    FView: IGruposFiscaisView;
    FQuery: IGruposFiscaisQuery;
    FAuthorization: IAuthorizationService;
    FRemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
    FSalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
    FListarEmpresas: ListarEmpresasUseCase;
    FSession: ISessionContext;
  public
    constructor Create(AView: IGruposFiscaisView;
      AQuery: IGruposFiscaisQuery;
      AAuthorization: IAuthorizationService;
      ARemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
      ASalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
      AListarEmpresas: ListarEmpresasUseCase;
      ASession: ISessionContext);
    function AutorizarPesquisa: Boolean;
    function CriarLeitor(const ACriteria: TFilterCriteria): IDataSetReader;
    function EnviarParaLixeira(const AId: string): Boolean;
    function AutorizarInclusao: Boolean;
    function CarregarEmpresas(out AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
    function Salvar(const ARascunho: GrupoFiscalEtd): Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, EmpresaEtdUnit,
  CreateEntityUseCaseOutputUnit;

const
  // Codigos do cadastro legado usados por esta funcionalidade. O host recebe o
  // processo, a acao e a tabela e nao os conhece.
  ProcessoConsulta    = 'MOD008';
  ProcessoExclusao    = 'MOD012';
  ProcessoInclusao    = 'MOD009';
  ProcessoGravacao    = 'MOD011';
  TabelaGruposFiscais = 'GRUPOS_FISCAIS';

  // Mensagens repetidas na mesma operacao (indisponibilidade e empresas).
  ConsultaIndisponivelMessage =
    'Não foi possível verificar a permissão de consulta.';
  ExclusaoIndisponivelMessage =
    'Não foi possível verificar a permissão de exclusão.';
  InclusaoIndisponivelMessage =
    'Não foi possível verificar a permissão de inclusão.';
  GravacaoIndisponivelMessage =
    'Não foi possível verificar a permissão de gravação.';
  EmpresasFalhaMessage =
    'Não foi possível carregar as empresas para a inclusão.';
  AutorizacaoTitle = 'Autorização';
  LixeiraTitle = 'Enviar para a lixeira';
  InclusaoTitle = 'Novo grupo fiscal';
  SalvarTitle = 'Salvar grupo fiscal';

{ TGruposFiscaisPresenter }

constructor TGruposFiscaisPresenter.Create(AView: IGruposFiscaisView;
  AQuery: IGruposFiscaisQuery;
  AAuthorization: IAuthorizationService;
  ARemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
  ASalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
  AListarEmpresas: ListarEmpresasUseCase;
  ASession: ISessionContext);
begin
  inherited Create;
  if AView = nil then
    raise Exception.Create('A view de Grupos Fiscais não foi informada.');
  if AQuery = nil then
    raise Exception.Create('A consulta de Grupos Fiscais não foi informada.');
  if ARemoverGrupoFiscal = nil then
    raise Exception.Create('O caso de uso de remoção de Grupos Fiscais não foi informado.');
  if ASalvarGrupoFiscal = nil then
    raise Exception.Create('O caso de uso de gravação de Grupos Fiscais não foi informado.');
  if AListarEmpresas = nil then
    raise Exception.Create('A consulta de empresas não foi informada.');
  if ASession = nil then
    raise Exception.Create('A sessão de Grupos Fiscais não foi informada.');

  FView := AView;
  FQuery := AQuery;
  // A ausencia do servico de autorizacao nao impede a tela de abrir; cada
  // operacao sera interrompida como indisponivel quando a permissao for
  // consultada.
  FAuthorization := AAuthorization;
  FRemoverGrupoFiscal := ARemoverGrupoFiscal;
  FSalvarGrupoFiscal := ASalvarGrupoFiscal;
  FListarEmpresas := AListarEmpresas;
  FSession := ASession;
end;

function TGruposFiscaisPresenter.AutorizarPesquisa: Boolean;
var
  Autorizacao: TAuthorizationResult;
begin
  Result := False;

  if FAuthorization = nil then
  begin
    FView.ShowWarning(ConsultaIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  try
    Autorizacao := FAuthorization.Authorize(ProcessoConsulta, aaVisualizar,
      TabelaGruposFiscais);
  except
    // Falha na consulta da permissao equivale a indisponibilidade.
    FView.ShowWarning(ConsultaIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  case Autorizacao.Outcome of
    aoAllowed:
      Result := True;
    aoDenied:
      // A negativa ou o cancelamento ja foi apresentado pelo legado; nao ha
      // mensagem Next para repetir.
      ;
  else
    FView.ShowWarning(ConsultaIndisponivelMessage, AutorizacaoTitle);
  end;
end;

function TGruposFiscaisPresenter.CriarLeitor(
  const ACriteria: TFilterCriteria): IDataSetReader;
begin
  // O catalogo e global: nenhuma empresa ou sessao participa da leitura.
  Result := FQuery.CriarLeitor(ACriteria);
end;

function TGruposFiscaisPresenter.EnviarParaLixeira(const AId: string): Boolean;
var
  Autorizacao: TAuthorizationResult;
begin
  Result := False;

  if Trim(AId) = '' then
  begin
    FView.ShowError('O grupo fiscal a enviar para a lixeira não foi identificado.',
      LixeiraTitle);
    Exit;
  end;

  if FAuthorization = nil then
  begin
    FView.ShowWarning(ExclusaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  try
    Autorizacao := FAuthorization.Authorize(ProcessoExclusao, aaExcluir,
      TabelaGruposFiscais);
  except
    FView.ShowWarning(ExclusaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  case Autorizacao.Outcome of
    aoAllowed:
      ;
    aoDenied:
      // A negativa ou o cancelamento ja foi apresentado pelo legado.
      Exit;
  else
    FView.ShowWarning(ExclusaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  try
    FRemoverGrupoFiscal.Executar(AId);
    Result := True;
  except
    on E: EValidacaoNegocio do
      FView.ShowError(E.Message, LixeiraTitle);
    on E: Exception do
      // O texto tecnico do banco nao deve chegar a interface.
      FView.ShowError('Não foi possível enviar o grupo fiscal para a lixeira.',
        LixeiraTitle);
  end;
end;

function TGruposFiscaisPresenter.AutorizarInclusao: Boolean;
var
  Autorizacao: TAuthorizationResult;
begin
  Result := False;

  if FAuthorization = nil then
  begin
    FView.ShowWarning(InclusaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  try
    Autorizacao := FAuthorization.Authorize(ProcessoInclusao, aaInserir,
      TabelaGruposFiscais);
  except
    // Falha na consulta da permissao equivale a indisponibilidade.
    FView.ShowWarning(InclusaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  case Autorizacao.Outcome of
    aoAllowed:
      Result := True;
    aoDenied:
      // A negativa ou o cancelamento ja foi apresentado pelo legado; nao ha
      // mensagem Next para repetir.
      ;
  else
    FView.ShowWarning(InclusaoIndisponivelMessage, AutorizacaoTitle);
  end;
end;

function TGruposFiscaisPresenter.CarregarEmpresas(
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

  // O login e lido a cada inclusao: o host pode trocar o usuario mantendo esta
  // janela viva.
  Login := Trim(FSession.UsuarioLogin);
  if Login = '' then
  begin
    FView.ShowWarning(EmpresasFalhaMessage, InclusaoTitle);
    Exit;
  end;

  TodasEmpresas := nil;
  try
    try
      TodasEmpresas := FListarEmpresas.Executar();
      EmpresasPermitidas := nil;
      try
        EmpresasPermitidas := FListarEmpresas.Executar(Login);

        if (TodasEmpresas = nil) or (EmpresasPermitidas = nil) then
        begin
          FView.ShowWarning(EmpresasFalhaMessage, InclusaoTitle);
          Exit;
        end;

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

          // Na inclusao, toda empresa permitida ja inicia marcada.
          Opcao.Marcada := Opcao.Habilitada;
          AOpcoes[I] := Opcao;
        end;

        Result := True;
      finally
        EmpresasPermitidas.Free;
      end;
    except
      // Falha de leitura ou de montagem interrompe a inclusao; nenhuma opcao
      // parcial e devolvida.
      SetLength(AOpcoes, 0);
      FView.ShowWarning(EmpresasFalhaMessage, InclusaoTitle);
    end;
  finally
    TodasEmpresas.Free;
  end;
end;

function TGruposFiscaisPresenter.Salvar(
  const ARascunho: GrupoFiscalEtd): Boolean;
var
  Autorizacao: TAuthorizationResult;
  Resultado: CreateEntityUseCaseOutPut;
begin
  Result := False;

  if ARascunho = nil then
  begin
    FView.ShowError('O rascunho do grupo fiscal não foi informado.', SalvarTitle);
    Exit;
  end;

  if FAuthorization = nil then
  begin
    FView.ShowWarning(GravacaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  try
    Autorizacao := FAuthorization.Authorize(ProcessoGravacao, aaSalvar,
      TabelaGruposFiscais);
  except
    FView.ShowWarning(GravacaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  case Autorizacao.Outcome of
    aoAllowed:
      ;
    aoDenied:
      // A negativa ou o cancelamento ja foi apresentado pelo legado.
      Exit;
  else
    FView.ShowWarning(GravacaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  Resultado := nil;
  try
    try
      Resultado := FSalvarGrupoFiscal.Executar(ARascunho);

      if Resultado.Validation.IsValid then
        Result := True
      else
        FView.ExibirValidacao(Resultado.Validation);
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message, SalvarTitle);
      on E: Exception do
        // O texto tecnico do banco nao deve chegar a interface.
        FView.ShowError('Não foi possível salvar o grupo fiscal.', SalvarTitle);
    end;
  finally
    // O resultado do caso de uso libera a entidade persistida; o apresentador
    // nunca a devolve nem a retem.
    Resultado.Free;
  end;
end;

end.
