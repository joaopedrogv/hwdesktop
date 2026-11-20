unit EventoDFe112150CadastroPresenter;

interface

uses
  AuthorizationService, EventoDFe112150CadastroView, ObterEventoDFe112150PorIdUseCaseUnit,
  SalvarEventoDFe112150UseCaseUnit, ObterProximoSeqIdEventoDFeUseCaseUnit,
  EventoDFe112150EtdUnit, TipoEventoDFeUnit, PresenterCadastroBase;

type
  // Não conhece a consulta, a grade nem as abas.
  TEventoDFe112150CadastroPresenter = class(TPresenterCadastroBase)
  private
    // A view pertence ao frame do editor e as demais dependências ao container de composição: o apresentador apenas as
    // utiliza e nunca as libera.
    FView: IEventoDFe112150CadastroView;
    FObter: ObterEventoDFe112150PorIdUseCase;
    FSalvar: ISalvarEventoDFe112150UseCase;
    FProximoSeqId: IObterProximoSeqIdEventoDFeUseCase;
  public
    constructor Create(const AView: IEventoDFe112150CadastroView;
      const AAuthorization: IAuthorizationService; AObter: ObterEventoDFe112150PorIdUseCase;
      ASalvar: ISalvarEventoDFe112150UseCase;
      AProximoSeqId: IObterProximoSeqIdEventoDFeUseCase);
    function PrepararInclusao: Boolean; override;
    function PrepararAlteracao(const AId: string): Boolean; overload; override;
    function PrepararAlteracao(const AId: string; AModo: TModoEventoDFe): Boolean; overload;
    function Salvar(const ARascunho: EventoDFe112150Etd): Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, CreateEntityUseCaseOutputUnit;

const
  // Código do cadastro legado usado por esta funcionalidade. O host recebe o processo, a ação, a tabela e a chave.
  ProcessoGravacao = 'EVT004';
  Tabela112150 = 'EVENTOS_DFE_112150';

constructor TEventoDFe112150CadastroPresenter.Create(const AView: IEventoDFe112150CadastroView;
  const AAuthorization: IAuthorizationService; AObter: ObterEventoDFe112150PorIdUseCase;
  ASalvar: ISalvarEventoDFe112150UseCase; AProximoSeqId: IObterProximoSeqIdEventoDFeUseCase);
begin
  inherited Create(AAuthorization, Tabela112150);
  if AView = nil then
    raise Exception.Create('A view do cadastro do evento 112150 não foi informada.');
  if AObter = nil then
    raise Exception.Create('O caso de uso de carregamento do evento 112150 não foi informado.');
  if ASalvar = nil then
    raise Exception.Create('O caso de uso de gravação do evento 112150 não foi informado.');
  if AProximoSeqId = nil then
    raise Exception.Create('O caso de uso do próximo código do evento não foi informado.');

  FView := AView;
  FObter := AObter;
  FSalvar := ASalvar;
  FProximoSeqId := AProximoSeqId;
end;

function TEventoDFe112150CadastroPresenter.PrepararInclusao: Boolean;
begin
  Result := FView.PrepararInclusao;
end;

function TEventoDFe112150CadastroPresenter.PrepararAlteracao(const AId: string): Boolean;
begin
  Result := PrepararAlteracao(AId, meAlteracao);
end;

function TEventoDFe112150CadastroPresenter.PrepararAlteracao(const AId: string;
  AModo: TModoEventoDFe): Boolean;
var
  Carregado: EventoDFe112150Etd;
begin
  Result := False;

  Carregado := nil;
  try
    try
      Carregado := FObter.Executar(AId, AModo);
      if Carregado = nil then
      begin
        FView.ShowError('O evento selecionado não foi encontrado.');
        Exit;
      end;

      // A view copia o evento para o rascunho do frame; a entidade continua pertencendo a este método.
      Result := FView.PrepararAlteracao(Carregado, AModo);
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message);
      on E: Exception do
        // O texto técnico do banco não deve chegar à interface.
        FView.ShowError('Não foi possível carregar o evento para edição.');
    end;
  finally
    Carregado.Free;
  end;
end;

function TEventoDFe112150CadastroPresenter.Salvar(const ARascunho: EventoDFe112150Etd): Boolean;
var
  Resultado: CreateEntityUseCaseOutPut;
begin
  Result := False;

  if ARascunho = nil then
  begin
    FView.ShowError('O rascunho do evento não foi informado.');
    Exit;
  end;

  // O código da inclusão é reservado antes da autorização e persistido sem recálculo; cada nova tentativa obtém outro
  // valor.
  if ARascunho.Id = '' then
    try
      ARascunho.DefinirSeqIdInclusao(FProximoSeqId.Executar);
    except
      on E: Exception do
      begin
        // O texto técnico do banco não deve chegar à interface.
        FView.ShowError('Não foi possível reservar o código do evento.');
        Exit;
      end;
    end;

  if not Autorizar(ProcessoGravacao, aaSalvar, Tabela112150, IntToStr(ARascunho.SeqId)) then
    Exit;

  Resultado := nil;
  try
    try
      Resultado := FSalvar.Executar(ARascunho);

      if Resultado.Validation.IsValid then
        Result := True
      else
        // A validação volta para o editor que iniciou a gravação.
        FView.ShowValidation(Resultado.Validation);
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message);
      on E: Exception do
        // O texto técnico do banco não deve chegar à interface.
        FView.ShowError('Não foi possível salvar o evento.');
    end;
  finally
    // O resultado do caso de uso libera a entidade persistida; o apresentador nunca a devolve nem a retém.
    Resultado.Free;
  end;
end;

end.
