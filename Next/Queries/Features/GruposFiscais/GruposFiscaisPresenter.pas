unit GruposFiscaisPresenter;

interface

uses
  FilterCriterion, IDataSetReaderUnit, GruposFiscaisQuery, AuthorizationService,
  RemoverGrupoFiscalUseCaseUnit, ViewFeedback;

type
  // Apresentador da consulta de Grupos Fiscais. Encaminha a leitura para a
  // consulta injetada, verifica a autorizacao antes da pesquisa e executa a
  // remocao logica da linha corrente. As decisoes e as mensagens sao
  // apresentadas pelo feedback recebido na chamada; a negativa ou o
  // cancelamento ja apresentado pelo legado nao e repetido. Nao possui dataset,
  // sessao nem empresa.
  TGruposFiscaisPresenter = class
  private
    FQuery: IGruposFiscaisQuery;
    FAuthorization: IAuthorizationService;
    FRemoverGrupoFiscal: RemoverGrupoFiscalUseCase;
  public
    constructor Create(AQuery: IGruposFiscaisQuery;
      AAuthorization: IAuthorizationService;
      ARemoverGrupoFiscal: RemoverGrupoFiscalUseCase);
    function AutorizarPesquisa(const AFeedback: IViewFeedback): Boolean;
    function CriarLeitor(const ACriteria: TFilterCriteria): IDataSetReader;
    function EnviarParaLixeira(const AId: string;
      const AFeedback: IViewFeedback): Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit;

const
  // Codigos do cadastro legado usados por esta consulta. O host recebe o
  // processo, a acao e a tabela da funcionalidade e nao os conhece.
  ProcessoConsulta    = 'MOD008';
  ProcessoExclusao    = 'MOD012';
  TabelaGruposFiscais = 'GRUPOS_FISCAIS';

  MissingQueryMessage =
    'A consulta de Grupos Fiscais nao foi informada.';
  MissingRemoverMessage =
    'O caso de uso de remocao de Grupos Fiscais nao foi informado.';
  MissingIdMessage =
    'O grupo fiscal a enviar para a lixeira n'#227'o foi identificado.';
  ConsultaIndisponivelMessage =
    'N'#227'o foi poss'#237'vel verificar a permiss'#227'o de consulta.';
  ExclusaoIndisponivelMessage =
    'N'#227'o foi poss'#237'vel verificar a permiss'#227'o de exclus'#227'o.';
  RemoveFailureMessage =
    'N'#227'o foi poss'#237'vel enviar o grupo fiscal para a lixeira.';
  AutorizacaoTitle = 'Autoriza'#231#227'o';
  LixeiraTitle = 'Enviar para a lixeira';

// O feedback pertence a tela e pode faltar em usos sem interface; nesse caso a
// mensagem e omitida e o retorno da operacao e preservado.
procedure Avisar(const AFeedback: IViewFeedback; const AMessage: string);
begin
  if AFeedback <> nil then
    AFeedback.ShowWarning(AMessage, AutorizacaoTitle);
end;

procedure InformarErro(const AFeedback: IViewFeedback; const AMessage,
  ATitle: string);
begin
  if AFeedback <> nil then
    AFeedback.ShowError(AMessage, ATitle);
end;

{ TGruposFiscaisPresenter }

constructor TGruposFiscaisPresenter.Create(AQuery: IGruposFiscaisQuery;
  AAuthorization: IAuthorizationService;
  ARemoverGrupoFiscal: RemoverGrupoFiscalUseCase);
begin
  inherited Create;
  if AQuery = nil then
    raise Exception.Create(MissingQueryMessage);
  if ARemoverGrupoFiscal = nil then
    raise Exception.Create(MissingRemoverMessage);

  FQuery := AQuery;
  // A ausencia do servico de autorizacao nao impede a tela de abrir; a pesquisa
  // sera interrompida como indisponivel quando a permissao for consultada.
  FAuthorization := AAuthorization;
  // O caso de uso pertence ao container de composicao: o apresentador apenas o
  // utiliza e nunca o libera.
  FRemoverGrupoFiscal := ARemoverGrupoFiscal;
end;

function TGruposFiscaisPresenter.AutorizarPesquisa(
  const AFeedback: IViewFeedback): Boolean;
var
  Autorizacao: TAuthorizationResult;
begin
  Result := False;

  if FAuthorization = nil then
  begin
    Avisar(AFeedback, ConsultaIndisponivelMessage);
    Exit;
  end;

  try
    Autorizacao := FAuthorization.Authorize(ProcessoConsulta, aaVisualizar,
      TabelaGruposFiscais);
  except
    // Falha na consulta da permissao equivale a indisponibilidade.
    Avisar(AFeedback, ConsultaIndisponivelMessage);
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
    Avisar(AFeedback, ConsultaIndisponivelMessage);
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
    Avisar(AFeedback, ExclusaoIndisponivelMessage);
    Exit;
  end;

  try
    Autorizacao := FAuthorization.Authorize(ProcessoExclusao, aaExcluir,
      TabelaGruposFiscais);
  except
    Avisar(AFeedback, ExclusaoIndisponivelMessage);
    Exit;
  end;

  case Autorizacao.Outcome of
    aoAllowed:
      ;
    aoDenied:
      // A negativa ou o cancelamento ja foi apresentado pelo legado.
      Exit;
  else
    Avisar(AFeedback, ExclusaoIndisponivelMessage);
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

end.
