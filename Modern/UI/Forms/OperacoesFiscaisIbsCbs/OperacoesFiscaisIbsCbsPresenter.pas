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
  ListarGruposFiscaisUseCaseUnit,
  ResolverRegraFiscalIbsCbsUseCaseUnit,
  ResolverRegraFiscalIbsCbsTypesUnit;

type
  TOperacoesFiscaisIbsCbsPresenter = class
  private
    FView: IOperacoesFiscaisIbsCbsView;
    FSalvarUseCase: ISalvarOperacaoFiscalIbsCbsUseCase;
    FObterUseCase: IObterOperacaoFiscalIbsCbsPorIdUseCase;
    FRemoverUseCase: IRemoverOperacaoFiscalIbsCbsUseCase;
    FListarOperacoesInternasUseCase: IListarAtualeTodasOperacoesInternasUseCase;
    FListarGruposFiscaisUseCase: IListarAtualeTodosGruposFiscaisUseCase;
    FResolverUseCase: IResolverRegraFiscalIbsCbsUseCase;
  public
    constructor Create(
      const AView: IOperacoesFiscaisIbsCbsView;
      const ASalvarUseCase: ISalvarOperacaoFiscalIbsCbsUseCase;
      const AObterUseCase: IObterOperacaoFiscalIbsCbsPorIdUseCase;
      const ARemoverUseCase: IRemoverOperacaoFiscalIbsCbsUseCase;
      const AListarOperacoesInternasUseCase: IListarAtualeTodasOperacoesInternasUseCase;
      const AListarGruposFiscaisUseCase: IListarAtualeTodosGruposFiscaisUseCase;
      const AResolverUseCase: IResolverRegraFiscalIbsCbsUseCase
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
    function AnalisarCondicoes(
      const AState: OperacaoFiscalIbsCbsEtd
    ): Boolean;
  end;

implementation

uses
  CreateEntityUseCaseOutputUnit,
  OperacaoInternaEtdUnit, GrupoFiscalEtdUnit, StringNullableUnit;

{ TOperacoesFiscaisIbsCbsPresenter }

constructor TOperacoesFiscaisIbsCbsPresenter.Create(
  const AView: IOperacoesFiscaisIbsCbsView;
  const ASalvarUseCase: ISalvarOperacaoFiscalIbsCbsUseCase;
  const AObterUseCase: IObterOperacaoFiscalIbsCbsPorIdUseCase;
  const ARemoverUseCase: IRemoverOperacaoFiscalIbsCbsUseCase;
  const AListarOperacoesInternasUseCase: IListarAtualeTodasOperacoesInternasUseCase;
  const AListarGruposFiscaisUseCase: IListarAtualeTodosGruposFiscaisUseCase;
  const AResolverUseCase: IResolverRegraFiscalIbsCbsUseCase
);
begin
  inherited Create;

  FView := AView;
  FSalvarUseCase := ASalvarUseCase;
  FObterUseCase := AObterUseCase;
  FRemoverUseCase := ARemoverUseCase;
  FListarOperacoesInternasUseCase := AListarOperacoesInternasUseCase;
  FListarGruposFiscaisUseCase := AListarGruposFiscaisUseCase;
  FResolverUseCase := AResolverUseCase;
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

  if Assigned(FResolverUseCase) then
    FResolverUseCase.FreeSafe();

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

function TOperacoesFiscaisIbsCbsPresenter.AnalisarCondicoes(
  const AState: OperacaoFiscalIbsCbsEtd
): Boolean;
var
  Analise: ResolverRegraFiscalIbsCbsAnalise;
  Mensagem: string;
  Escopo: string;
  EmpresaTexto: string;
  DataTexto: string;
  EmpresaId: Integer;
  i: Integer;
begin
  Result := False;
  Analise := nil;

  try
    try
      EmpresaId := 0;
      if Length(AState.EmpresasId) > 0 then
        EmpresaId := AState.EmpresasId[0];

      Analise := FResolverUseCase.Analisar(
        ResolverRegraFiscalIbsCbsInput.CreateParaAnalise(
          AState.OperacaoInternaId,
          AState.GrupoFiscalId.Value,
          EmpresaId,
          AState.InicioVigencia
        )
      );

      if EmpresaId > 0 then
        EmpresaTexto := Format('1 empresa (código %d)', [EmpresaId])
      else
        EmpresaTexto := '1 empresa não selecionada';

      if AState.InicioVigencia > 0 then
        DataTexto := DateToStr(AState.InicioVigencia)
      else
        DataTexto := 'data de início de vigência não informada';

      Escopo := 'Escopo da análise: configuração persistida para ' + EmpresaTexto +
        ' na data ' + DataTexto + '.' + sLineBreak +
        'Alterações não salvas (checklists e seleção de empresas) não são consideradas. ' +
        'As demais empresas selecionadas não foram analisadas e podem ter vínculos concorrentes diferentes.';

      Mensagem := Escopo + sLineBreak + sLineBreak;
      if Length(Analise.Mensagens) = 0 then
        Mensagem := Mensagem +
          'Nenhuma inconsistência ou redundância identificada na configuração persistida analisada.'
      else
        for i := 0 to High(Analise.Mensagens) do
        begin
          if i > 0 then
            Mensagem := Mensagem + sLineBreak;
          Mensagem := Mensagem + Analise.Mensagens[i];
        end;

      FView.ExibirInformacao(Mensagem);
      Result := True;
    except
      on E: Exception do
        FView.ExibirErro(E);
    end;
  finally
    Analise.Free();
  end;
end;

end.
