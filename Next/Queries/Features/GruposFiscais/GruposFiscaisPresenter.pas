unit GruposFiscaisPresenter;

interface

uses
  FilterCriterion, IDataSetReaderUnit, GruposFiscaisQuery, AuthorizationService,
  RemoverGrupoFiscalUseCaseUnit, ViewFeedback, SalvarGrupoFiscalUseCaseUnit,
  ListarEmpresasUseCaseUnit, ISessionContextUnit, GrupoFiscalEtdUnit,
  GrupoFiscalCadastro;

type
  // Apresentador da consulta e da inclusao de Grupos Fiscais. Encaminha a
  // leitura para a consulta injetada, verifica a autorizacao antes das
  // operacoes e executa a remocao logica e a gravacao. As decisoes e as
  // mensagens sao apresentadas pelo feedback recebido na chamada; a negativa
  // ou o cancelamento ja apresentado pelo legado nao e repetido. Le o login da
  // sessao a cada inclusao e traduz empresas e validacoes para o contrato da
  // tela, sem entregar entidades ou listas do contexto Modern.
  TGruposFiscaisPresenter = class
  private
    FQuery: IGruposFiscaisQuery;
    FAuthorization: IAuthorizationService;
    FRemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
    FSalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
    FListarEmpresas: ListarEmpresasUseCase;
    FSession: ISessionContext;
  public
    constructor Create(AQuery: IGruposFiscaisQuery;
      AAuthorization: IAuthorizationService;
      ARemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
      ASalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
      AListarEmpresas: ListarEmpresasUseCase;
      ASession: ISessionContext);
    function AutorizarPesquisa(const AFeedback: IViewFeedback): Boolean;
    function CriarLeitor(const ACriteria: TFilterCriteria): IDataSetReader;
    function EnviarParaLixeira(const AId: string;
      const AFeedback: IViewFeedback): Boolean;
    function AutorizarInclusao(const AFeedback: IViewFeedback): Boolean;
    function CarregarEmpresas(const AFeedback: IViewFeedback;
      out AOpcoes: TGrupoFiscalEmpresaOptions): Boolean;
    function Salvar(const ARascunho: GrupoFiscalEtd;
      const AFeedback: IViewFeedback): TGrupoFiscalSaveResult;
  end;

implementation

uses
  System.SysUtils, Contnrs, EValidacaoNegocioUnit, EmpresaEtdUnit,
  CreateEntityUseCaseOutputUnit, ValidationEntityOutputUnit;

const
  // Codigos do cadastro legado usados por esta funcionalidade. O host recebe o
  // processo, a acao e a tabela e nao os conhece.
  ProcessoConsulta    = 'MOD008';
  ProcessoExclusao    = 'MOD012';
  ProcessoInclusao    = 'MOD009';
  ProcessoGravacao    = 'MOD011';
  TabelaGruposFiscais = 'GRUPOS_FISCAIS';

  MissingQueryMessage =
    'A consulta de Grupos Fiscais nao foi informada.';
  MissingRemoverMessage =
    'O caso de uso de remocao de Grupos Fiscais nao foi informado.';
  MissingSalvarMessage =
    'O caso de uso de gravacao de Grupos Fiscais nao foi informado.';
  MissingEmpresasMessage =
    'A consulta de empresas nao foi informada.';
  MissingSessionMessage =
    'A sessao de Grupos Fiscais nao foi informada.';
  MissingIdMessage =
    'O grupo fiscal a enviar para a lixeira n'#227'o foi identificado.';
  ConsultaIndisponivelMessage =
    'N'#227'o foi poss'#237'vel verificar a permiss'#227'o de consulta.';
  ExclusaoIndisponivelMessage =
    'N'#227'o foi poss'#237'vel verificar a permiss'#227'o de exclus'#227'o.';
  InclusaoIndisponivelMessage =
    'N'#227'o foi poss'#237'vel verificar a permiss'#227'o de inclus'#227'o.';
  GravacaoIndisponivelMessage =
    'N'#227'o foi poss'#237'vel verificar a permiss'#227'o de grava'#231#227'o.';
  EmpresasFalhaMessage =
    'N'#227'o foi poss'#237'vel carregar as empresas para a inclus'#227'o.';
  RascunhoAusenteMessage =
    'O rascunho do grupo fiscal n'#227'o foi informado.';
  RemoveFailureMessage =
    'N'#227'o foi poss'#237'vel enviar o grupo fiscal para a lixeira.';
  SalvarFalhaMessage =
    'N'#227'o foi poss'#237'vel salvar o grupo fiscal.';
  AutorizacaoTitle = 'Autoriza'#231#227'o';
  LixeiraTitle = 'Enviar para a lixeira';
  InclusaoTitle = 'Novo grupo fiscal';
  SalvarTitle = 'Salvar grupo fiscal';

// O feedback pertence a tela e pode faltar em usos sem interface; nesse caso a
// mensagem e omitida e o retorno da operacao e preservado.
procedure Avisar(const AFeedback: IViewFeedback; const AMessage,
  ATitle: string);
begin
  if AFeedback <> nil then
    AFeedback.ShowWarning(AMessage, ATitle);
end;

procedure InformarErro(const AFeedback: IViewFeedback; const AMessage,
  ATitle: string);
begin
  if AFeedback <> nil then
    AFeedback.ShowError(AMessage, ATitle);
end;

// Traduz a validacao do caso de uso para o contrato da tela preservando a ordem
// produzida pelo validador. O texto ja vem pronto de GetMessage, que usa o
// detalhe do item quando existe.
function TraduzirValidacao(
  const AValidation: ValidationEntityOutput): TGrupoFiscalFieldErrors;
var
  I: Integer;
begin
  SetLength(Result, Length(AValidation.Validations));
  for I := 0 to High(AValidation.Validations) do
  begin
    Result[I].Campo := AValidation.Validations[I].FieldName;
    Result[I].Mensagem := AValidation.Validations[I].GetMessage();
  end;
end;

{ TGruposFiscaisPresenter }

constructor TGruposFiscaisPresenter.Create(AQuery: IGruposFiscaisQuery;
  AAuthorization: IAuthorizationService;
  ARemoverGrupoFiscal: IRemoverGrupoFiscalUseCase;
  ASalvarGrupoFiscal: ISalvarGrupoFiscalUseCase;
  AListarEmpresas: ListarEmpresasUseCase;
  ASession: ISessionContext);
begin
  inherited Create;
  if AQuery = nil then
    raise Exception.Create(MissingQueryMessage);
  if ARemoverGrupoFiscal = nil then
    raise Exception.Create(MissingRemoverMessage);
  if ASalvarGrupoFiscal = nil then
    raise Exception.Create(MissingSalvarMessage);
  if AListarEmpresas = nil then
    raise Exception.Create(MissingEmpresasMessage);
  if ASession = nil then
    raise Exception.Create(MissingSessionMessage);

  FQuery := AQuery;
  // A ausencia do servico de autorizacao nao impede a tela de abrir; cada
  // operacao sera interrompida como indisponivel quando a permissao for
  // consultada.
  FAuthorization := AAuthorization;
  // Os casos de uso e a sessao pertencem ao container de composicao: o
  // apresentador apenas os utiliza e nunca os libera.
  FRemoverGrupoFiscal := ARemoverGrupoFiscal;
  FSalvarGrupoFiscal := ASalvarGrupoFiscal;
  FListarEmpresas := AListarEmpresas;
  FSession := ASession;
end;

function TGruposFiscaisPresenter.AutorizarPesquisa(
  const AFeedback: IViewFeedback): Boolean;
var
  Autorizacao: TAuthorizationResult;
begin
  Result := False;

  if FAuthorization = nil then
  begin
    Avisar(AFeedback, ConsultaIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  try
    Autorizacao := FAuthorization.Authorize(ProcessoConsulta, aaVisualizar,
      TabelaGruposFiscais);
  except
    // Falha na consulta da permissao equivale a indisponibilidade.
    Avisar(AFeedback, ConsultaIndisponivelMessage, AutorizacaoTitle);
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
    Avisar(AFeedback, ConsultaIndisponivelMessage, AutorizacaoTitle);
  end;
end;

function TGruposFiscaisPresenter.CriarLeitor(
  const ACriteria: TFilterCriteria): IDataSetReader;
begin
  // O catalogo e global: nenhuma empresa ou sessao participa da leitura.
  Result := FQuery.CriarLeitor(ACriteria);
end;

function TGruposFiscaisPresenter.EnviarParaLixeira(const AId: string;
  const AFeedback: IViewFeedback): Boolean;
var
  Autorizacao: TAuthorizationResult;
begin
  Result := False;

  if Trim(AId) = '' then
  begin
    InformarErro(AFeedback, MissingIdMessage, LixeiraTitle);
    Exit;
  end;

  if FAuthorization = nil then
  begin
    Avisar(AFeedback, ExclusaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  try
    Autorizacao := FAuthorization.Authorize(ProcessoExclusao, aaExcluir,
      TabelaGruposFiscais);
  except
    Avisar(AFeedback, ExclusaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  case Autorizacao.Outcome of
    aoAllowed:
      ;
    aoDenied:
      // A negativa ou o cancelamento ja foi apresentado pelo legado.
      Exit;
  else
    Avisar(AFeedback, ExclusaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  try
    FRemoverGrupoFiscal.Executar(AId);
    Result := True;
  except
    on E: EValidacaoNegocio do
      InformarErro(AFeedback, E.Message, LixeiraTitle);
    on E: Exception do
      // O texto tecnico do banco nao deve chegar a interface.
      InformarErro(AFeedback, RemoveFailureMessage, LixeiraTitle);
  end;
end;

function TGruposFiscaisPresenter.AutorizarInclusao(
  const AFeedback: IViewFeedback): Boolean;
var
  Autorizacao: TAuthorizationResult;
begin
  Result := False;

  if FAuthorization = nil then
  begin
    Avisar(AFeedback, InclusaoIndisponivelMessage, AutorizacaoTitle);
    Exit;
  end;

  try
    Autorizacao := FAuthorization.Authorize(ProcessoInclusao, aaInserir,
      TabelaGruposFiscais);
  except
    // Falha na consulta da permissao equivale a indisponibilidade.
    Avisar(AFeedback, InclusaoIndisponivelMessage, AutorizacaoTitle);
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
    Avisar(AFeedback, InclusaoIndisponivelMessage, AutorizacaoTitle);
  end;
end;

function TGruposFiscaisPresenter.CarregarEmpresas(
  const AFeedback: IViewFeedback;
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
    Avisar(AFeedback, EmpresasFalhaMessage, InclusaoTitle);
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
          Avisar(AFeedback, EmpresasFalhaMessage, InclusaoTitle);
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
      Avisar(AFeedback, EmpresasFalhaMessage, InclusaoTitle);
    end;
  finally
    TodasEmpresas.Free;
  end;
end;

function TGruposFiscaisPresenter.Salvar(const ARascunho: GrupoFiscalEtd;
  const AFeedback: IViewFeedback): TGrupoFiscalSaveResult;
var
  Autorizacao: TAuthorizationResult;
  Resultado: CreateEntityUseCaseOutPut;
begin
  Result.Outcome := gfsoFalha;
  SetLength(Result.Erros, 0);

  if ARascunho = nil then
  begin
    InformarErro(AFeedback, RascunhoAusenteMessage, SalvarTitle);
    Exit;
  end;

  if FAuthorization = nil then
  begin
    Avisar(AFeedback, GravacaoIndisponivelMessage, AutorizacaoTitle);
    Result.Outcome := gfsoIndisponivel;
    Exit;
  end;

  try
    Autorizacao := FAuthorization.Authorize(ProcessoGravacao, aaSalvar,
      TabelaGruposFiscais);
  except
    Avisar(AFeedback, GravacaoIndisponivelMessage, AutorizacaoTitle);
    Result.Outcome := gfsoIndisponivel;
    Exit;
  end;

  case Autorizacao.Outcome of
    aoAllowed:
      ;
    aoDenied:
      begin
        // A negativa ou o cancelamento ja foi apresentado pelo legado.
        Result.Outcome := gfsoNegado;
        Exit;
      end;
  else
    Avisar(AFeedback, GravacaoIndisponivelMessage, AutorizacaoTitle);
    Result.Outcome := gfsoIndisponivel;
    Exit;
  end;

  Resultado := nil;
  try
    try
      Resultado := FSalvarGrupoFiscal.Executar(ARascunho);

      if Resultado.Validation.IsValid then
        Result.Outcome := gfsoSalvo
      else
      begin
        Result.Erros := TraduzirValidacao(Resultado.Validation);
        Result.Outcome := gfsoValidacao;
      end;
    except
      on E: EValidacaoNegocio do
      begin
        Result.Outcome := gfsoFalha;
        SetLength(Result.Erros, 0);
        InformarErro(AFeedback, E.Message, SalvarTitle);
      end;
      on E: Exception do
      begin
        // O texto tecnico do banco nao deve chegar a interface.
        Result.Outcome := gfsoFalha;
        SetLength(Result.Erros, 0);
        InformarErro(AFeedback, SalvarFalhaMessage, SalvarTitle);
      end;
    end;
  finally
    // O resultado do caso de uso libera a entidade persistida; o apresentador
    // nunca a devolve nem a retem.
    Resultado.Free;
  end;
end;

end.
