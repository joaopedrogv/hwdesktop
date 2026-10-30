unit OperacoesInternasPresenter;

interface

uses
  SysUtils,
  OperacaoInternaEtdUnit, IViewFeedbackUnit, ErpFeaturesFactoryUnit,
  CreateEntityUseCaseOutputUnit;

type
  TOperacoesInternasPresenter = class
  private
    FView: IViewFeedback;
    FSalvarUseCase: ISalvarOperacaoInternaUseCase;
    FObterUseCase: IObterOperacaoInternaPorIdUseCase;
    FRemoverUseCase: IRemoverOperacaoInternaUseCase;
  public
    constructor Create(
      const AView: IViewFeedback;
      const ASalvarUseCase: ISalvarOperacaoInternaUseCase;
      const AObterUseCase: IObterOperacaoInternaPorIdUseCase;
      const ARemoverUseCase: IRemoverOperacaoInternaUseCase
    );
    destructor Destroy; override;

    function Salvar(AOperacaoInterna: OperacaoInternaEtd): Boolean;
    function ObterParaEdicao(
      const AId: string;
      out AOperacaoInterna: OperacaoInternaEtd
    ): Boolean;
    function Remover(const AId: string): Boolean;
  end;

implementation

{ TOperacoesInternasPresenter }

constructor TOperacoesInternasPresenter.Create(
  const AView: IViewFeedback;
  const ASalvarUseCase: ISalvarOperacaoInternaUseCase;
  const AObterUseCase: IObterOperacaoInternaPorIdUseCase;
  const ARemoverUseCase: IRemoverOperacaoInternaUseCase
);
begin
  inherited Create;

  FView := AView;
  FSalvarUseCase := ASalvarUseCase;
  FObterUseCase := AObterUseCase;
  FRemoverUseCase := ARemoverUseCase;
end;

destructor TOperacoesInternasPresenter.Destroy;
begin
  if Assigned(FSalvarUseCase) then
    FSalvarUseCase.FreeSafe();

  if Assigned(FObterUseCase) then
    FObterUseCase.FreeSafe();

  if Assigned(FRemoverUseCase) then
    FRemoverUseCase.FreeSafe();

  inherited;
end;

function TOperacoesInternasPresenter.Salvar(
  AOperacaoInterna: OperacaoInternaEtd
): Boolean;
var
  Resultado: CreateEntityUseCaseOutPut;
begin
  Result := False;

  try
    Resultado := FSalvarUseCase.Executar(AOperacaoInterna);
    try
      if not Resultado.Validation.IsValid then
        FView.ExibirValidacoes(Resultado.Validation)
      else
        Result := True;
    finally
      Resultado.Free();
    end;
  except
    on E: Exception do
      FView.ExibirErro(E);
  end;
end;

function TOperacoesInternasPresenter.ObterParaEdicao(
  const AId: string;
  out AOperacaoInterna: OperacaoInternaEtd
): Boolean;
begin
  AOperacaoInterna := nil;
  AOperacaoInterna := FObterUseCase.Executar(AId);
  Result := AOperacaoInterna <> nil;

  if not Result then
    FView.ExibirAtencao('Registro não se encontra mais disponível');
end;

function TOperacoesInternasPresenter.Remover(const AId: string): Boolean;
begin
  Result := False;

  try
    FRemoverUseCase.Executar(AId);
    Result := True;
  except
    on E: Exception do
      FView.ExibirErro(E);
  end;
end;

end.
