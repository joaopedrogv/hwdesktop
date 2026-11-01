unit OperacoesFiscaisIbsCbsPresenter;

interface

uses
  SysUtils,
  OperacaoFiscalIbsCbsEtdUnit,
  OperacoesFiscaisIbsCbsView,
  ErpFeaturesFactoryUnit,
  SalvarOperacaoFiscalIbsCbsUseCaseUnit,
  ObterOperacaoFiscalIbsCbsPorIdUseCaseUnit,
  RemoverOperacaoFiscalIbsCbsUseCaseUnit,
  ListarOperacoesInternasUseCaseUnit,
  ListarGruposFiscaisUseCaseUnit;

type
  TOperacoesFiscaisIbsCbsPresenter = class
  private
    FView: IOperacoesFiscaisIbsCbsView;
    FSalvarUseCase: ISalvarOperacaoFiscalIbsCbsUseCase;
    FObterUseCase: IObterOperacaoFiscalIbsCbsPorIdUseCase;
    FRemoverUseCase: IRemoverOperacaoFiscalIbsCbsUseCase;
    FListarOperacoesInternasUseCase: IListarAtualeTodasOperacoesInternasUseCase;
    FListarGruposFiscaisUseCase: IListarAtualeTodosGruposFiscaisUseCase;
  public
    constructor Create(
      const AView: IOperacoesFiscaisIbsCbsView;
      const ASalvarUseCase: ISalvarOperacaoFiscalIbsCbsUseCase;
      const AObterUseCase: IObterOperacaoFiscalIbsCbsPorIdUseCase;
      const ARemoverUseCase: IRemoverOperacaoFiscalIbsCbsUseCase;
      const AListarOperacoesInternasUseCase: IListarAtualeTodasOperacoesInternasUseCase;
      const AListarGruposFiscaisUseCase: IListarAtualeTodosGruposFiscaisUseCase
    );
    destructor Destroy; override;

    function Salvar(AOperacaoFiscal: OperacaoFiscalIbsCbsEtd): Boolean;
    function ObterParaEdicao(
      const AId: string;
      out AOperacaoFiscal: OperacaoFiscalIbsCbsEtd
    ): Boolean;
    function Remover(const AId: string): Boolean;
    function CarregarListasSelecao(
      const AOperacaoInternaId, AGrupoFiscalId: string
    ): Boolean;
  end;

implementation

uses
  CreateEntityUseCaseOutputUnit,
  OperacaoInternaEtdUnit, GrupoFiscalEtdUnit;

{ TOperacoesFiscaisIbsCbsPresenter }

constructor TOperacoesFiscaisIbsCbsPresenter.Create(
  const AView: IOperacoesFiscaisIbsCbsView;
  const ASalvarUseCase: ISalvarOperacaoFiscalIbsCbsUseCase;
  const AObterUseCase: IObterOperacaoFiscalIbsCbsPorIdUseCase;
  const ARemoverUseCase: IRemoverOperacaoFiscalIbsCbsUseCase;
  const AListarOperacoesInternasUseCase: IListarAtualeTodasOperacoesInternasUseCase;
  const AListarGruposFiscaisUseCase: IListarAtualeTodosGruposFiscaisUseCase
);
begin
  inherited Create;

  FView := AView;
  FSalvarUseCase := ASalvarUseCase;
  FObterUseCase := AObterUseCase;
  FRemoverUseCase := ARemoverUseCase;
  FListarOperacoesInternasUseCase := AListarOperacoesInternasUseCase;
  FListarGruposFiscaisUseCase := AListarGruposFiscaisUseCase;
end;

destructor TOperacoesFiscaisIbsCbsPresenter.Destroy;
begin
  if Assigned(FSalvarUseCase) then
    FSalvarUseCase.FreeSafe();

  if Assigned(FObterUseCase) then
    FObterUseCase.FreeSafe();

  if Assigned(FRemoverUseCase) then
    FRemoverUseCase.FreeSafe();

  if Assigned(FListarOperacoesInternasUseCase) then
    FListarOperacoesInternasUseCase.FreeSafe();

  if Assigned(FListarGruposFiscaisUseCase) then
    FListarGruposFiscaisUseCase.FreeSafe();

  inherited;
end;

function TOperacoesFiscaisIbsCbsPresenter.Salvar(
  AOperacaoFiscal: OperacaoFiscalIbsCbsEtd
): Boolean;
var
  Resultado: CreateEntityUseCaseOutPut;
begin
  Result := False;
  Resultado := nil;

  try
    try
      Resultado := FSalvarUseCase.Executar(AOperacaoFiscal);

      if not Resultado.Validation.IsValid then
        FView.ExibirValidacoes(Resultado.Validation)
      else
        Result := True;
    except
      on E: Exception do
        FView.ExibirErro(E);
    end;
  finally
    if Assigned(Resultado) then
      Resultado.Free();
  end;
end;

function TOperacoesFiscaisIbsCbsPresenter.ObterParaEdicao(
  const AId: string;
  out AOperacaoFiscal: OperacaoFiscalIbsCbsEtd
): Boolean;
begin
  AOperacaoFiscal := nil;
  Result := False;

  AOperacaoFiscal := FObterUseCase.Executar(AId);

  if AOperacaoFiscal = nil then
    FView.ExibirAtencao('Registro não se encontra mais disponível')
  else
    Result := True;
end;

function TOperacoesFiscaisIbsCbsPresenter.Remover(const AId: string): Boolean;
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

function TOperacoesFiscaisIbsCbsPresenter.CarregarListasSelecao(
  const AOperacaoInternaId, AGrupoFiscalId: string
): Boolean;
var
  Operacoes: OperacoesInternasEtd;
  Grupos: GruposFiscaisEtd;
begin
  Result := False;
  Operacoes := nil;
  Grupos := nil;

  try
    try
      Operacoes := FListarOperacoesInternasUseCase.Executar(AOperacaoInternaId);
      Grupos := FListarGruposFiscaisUseCase.Executar(AGrupoFiscalId);

      FView.ExibirListas(Operacoes, Grupos);
      Result := True;
    except
      on E: Exception do
        FView.ExibirErro(E);
    end;
  finally
    FreeAndNil(Operacoes);
    FreeAndNil(Grupos);
  end;
end;

end.
