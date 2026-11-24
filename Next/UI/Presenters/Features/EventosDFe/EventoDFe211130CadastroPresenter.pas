unit EventoDFe211130CadastroPresenter;

interface

uses
  AuthorizationService, EventoDFe211130CadastroView,
  ObterEventoDFe211130PorIdUseCaseUnit, SalvarEventoDFe211130UseCaseUnit,
  ObterProximoSeqIdEventoDFeUseCaseUnit, EventoDFe211130EtdUnit,
  PresenterCadastroBase;

type
  // Não conhece a consulta, a grade nem as abas.
  TEventoDFe211130CadastroPresenter = class(TPresenterCadastroBase)
  private
    // A view pertence ao frame do editor e as demais dependências ao container de composição: o apresentador apenas as
    // utiliza e nunca as libera.
    FView: IEventoDFe211130CadastroView;
    FObter: ObterEventoDFe211130PorIdUseCase;
    FSalvar: ISalvarEventoDFe211130UseCase;
    FProximoSeqId: IObterProximoSeqIdEventoDFeUseCase;
  public
    constructor Create(const AView: IEventoDFe211130CadastroView;
      const AAuthorization: IAuthorizationService; AObter: ObterEventoDFe211130PorIdUseCase;
      ASalvar: ISalvarEventoDFe211130UseCase;
      AProximoSeqId: IObterProximoSeqIdEventoDFeUseCase);
    function PrepararInclusao: Boolean; override;
    function PrepararAlteracao(const AId: string): Boolean; override;
    function Salvar(const ARascunho: EventoDFe211130Etd): Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, CreateEntityUseCaseOutputUnit,
  StatusRegistroEnumUnit;

const
  // Código do cadastro legado usado por esta funcionalidade. O host recebe o processo, a ação, a tabela e a chave.
  ProcessoGravacao = 'EVT005';
  ProcessoRestauracao = 'EVT008';
  Tabela211130 = 'EVENTOS_DFE_211130_ITEM';
  TabelaEventosDFe = 'EVENTOS_DFE';

constructor TEventoDFe211130CadastroPresenter.Create(
  const AView: IEventoDFe211130CadastroView;
  const AAuthorization: IAuthorizationService; AObter: ObterEventoDFe211130PorIdUseCase;
  ASalvar: ISalvarEventoDFe211130UseCase;
  AProximoSeqId: IObterProximoSeqIdEventoDFeUseCase);
begin
  inherited Create(AAuthorization, Tabela211130);
  if AView = nil then
    raise Exception.Create('A view do cadastro do evento 211130 não foi informada.');
  if AObter = nil then
    raise Exception.Create('O caso de uso de carregamento do evento 211130 não foi informado.');
  if ASalvar = nil then
    raise Exception.Create('O caso de uso de gravação do evento 211130 não foi informado.');
  if AProximoSeqId = nil then
    raise Exception.Create('O caso de uso do próximo código do evento não foi informado.');

  FView := AView;
  FObter := AObter;
  FSalvar := ASalvar;
  FProximoSeqId := AProximoSeqId;
end;

function TEventoDFe211130CadastroPresenter.PrepararInclusao: Boolean;
begin
  Result := FView.PrepararInclusao;
end;

function TEventoDFe211130CadastroPresenter.PrepararAlteracao(const AId: string): Boolean;
var
  Carregado: EventoDFe211130Etd;
begin
  Result := False;

  Carregado := nil;
  try
    try
      Carregado := FObter.Executar(AId);
      if Carregado = nil then
      begin
        FView.ShowError('O evento selecionado não foi encontrado.');
        Exit;
      end;

      if Carregado.Ativo <> saAtivo then
      begin
        if not FView.ShowQuestion(Format('O evento de código %d está na lixeira. Deseja restaurar o registro?',
          [Carregado.SeqId])) then
          Exit;

        if not Autorizar(ProcessoRestauracao, aaAlterar, TabelaEventosDFe, IntToStr(Carregado.SeqId)) then
          Exit;

        // A restauração é persistida somente pela gravação.
        Carregado.Ativo := saAtivo;
      end;

      // A view copia o evento para o rascunho do frame; a entidade continua pertencendo a este método.
      Result := FView.PrepararAlteracao(Carregado);
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

function TEventoDFe211130CadastroPresenter.Salvar(
  const ARascunho: EventoDFe211130Etd): Boolean;
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

  if not Autorizar(ProcessoGravacao, aaSalvar, Tabela211130, IntToStr(ARascunho.SeqId)) then
    Exit;

  Resultado := nil;
  try
    try
      Resultado := FSalvar.Executar(ARascunho);

      if Resultado.Validation.IsValid then
        Result := True
      else
        // A validação volta para o editor que iniciou a gravação; os erros da coleção chegam sob 'Itens'.
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
