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

function DescricaoConfiguracao(const AState: OperacaoFiscalIbsCbsEtd): string;
var
  OperacaoInterna: string;
  GrupoFiscal: string;
  RegraFiscal: string;
begin
  OperacaoInterna := Trim(AState.OperacaoInternaDescricao);
  if OperacaoInterna = '' then
    OperacaoInterna := 'não identificada';

  GrupoFiscal := Trim(AState.GrupoFiscalDescricao);
  if GrupoFiscal = '' then
    GrupoFiscal := 'Nenhum';

  RegraFiscal := Trim(AState.RegraFiscalDescricao);
  if RegraFiscal = '' then
    RegraFiscal := 'não identificada';

  Result := Format('Op Interna [%s] / Grupo Fiscal [%s] / Regra fiscal [%s]',
    [OperacaoInterna, GrupoFiscal, RegraFiscal]);
end;

function SecaoApontamentos(const Titulo: string;
  const Apontamentos: ResolverRegraFiscalIbsCbsApontamentoArray;
  Tipo: ResolverRegraFiscalIbsCbsApontamentoTipo): string;
var
  i: Integer;
  Quantidade: Integer;
  TituloSecao: string;
begin
  Result := '';
  Quantidade := 0;
  for i := 0 to High(Apontamentos) do
    if Apontamentos[i].Tipo = Tipo then
      Inc(Quantidade);

  if Quantidade = 0 then
    Exit;

  if Tipo = ratObservacaoOpcoes then
  begin
    if Quantidade = 1 then
      TituloSecao := 'Uma observação sobre as opções selecionadas'
    else
      TituloSecao := Format('%d observações sobre as opções selecionadas',
        [Quantidade]);
  end
  else
    TituloSecao := Titulo;

  Result := TituloSecao;
  for i := 0 to High(Apontamentos) do
    if Apontamentos[i].Tipo = Tipo then
      Result := Result + sLineBreak + #149 + ' ' + Apontamentos[i].Texto;

  if Tipo = ratObservacaoOpcoes then
    Result := Result + sLineBreak +
      'Esses campos aceitam todas as opções disponíveis. Por isso, a aplicação ' +
      'desta configuração depende dos demais critérios. Se essa abrangência é a ' +
      'desejada, mantenha as opções. Para limitar a configuração, marque somente ' +
      'as opções que ela deve aceitar.';
end;

procedure AdicionarBloco(var Texto: string; const Bloco: string);
begin
  if Bloco = '' then
    Exit;

  if Texto <> '' then
    Texto := Texto + sLineBreak + sLineBreak;
  Texto := Texto + Bloco;
end;

function TOperacoesFiscaisIbsCbsPresenter.AnalisarCondicoes(
  const AState: OperacaoFiscalIbsCbsEtd
): Boolean;
var
  Analise: ResolverRegraFiscalIbsCbsAnalise;
  Mensagem: string;
  Corpo: string;
  Resumo: string;
  EmpresaTexto: string;
  DataTexto: string;
  EmpresaId: Integer;
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
          AState.InicioVigencia,
          AState
        )
      );

      if EmpresaId > 0 then
        EmpresaTexto := Format('Código [%d]', [EmpresaId])
      else
        EmpresaTexto := 'Empresa não selecionada';

      if AState.InicioVigencia > 0 then
        DataTexto := FormatDateTime('dd/mm/yyyy', AState.InicioVigencia)
      else
        DataTexto := 'data não informada';

      Mensagem := 'Conferência da configuração' + sLineBreak + sLineBreak +
        'Configuração analisada' + sLineBreak +
        DescricaoConfiguracao(AState) + sLineBreak + sLineBreak +
        'Empresa analisada: ' + EmpresaTexto + sLineBreak + sLineBreak +
        'Data considerada' + sLineBreak + DataTexto;

      Corpo := '';
      AdicionarBloco(Corpo, SecaoApontamentos(
        'Uma observação sobre as opções selecionadas', Analise.Apontamentos,
        ratObservacaoOpcoes));
      AdicionarBloco(Corpo, SecaoApontamentos(
        'Possível duplicidade', Analise.Apontamentos, ratDuplicidade));
      AdicionarBloco(Corpo, SecaoApontamentos(
        'Possível conflito', Analise.Apontamentos, ratConflito));
      AdicionarBloco(Corpo, SecaoApontamentos(
        'Regra fiscal não encontrada', Analise.Apontamentos, ratRegraAusente));
      AdicionarBloco(Corpo, SecaoApontamentos(
        'Valor inválido', Analise.Apontamentos, ratValorInvalido));

      if Corpo = '' then
        Corpo := 'Nenhuma inconsistência ou possível duplicidade foi encontrada ' +
          'nas configurações consideradas para esta empresa e esta data.';

      Mensagem := Mensagem + sLineBreak + sLineBreak + Corpo + sLineBreak +
        sLineBreak +
        'A conferência considera as alterações deste cadastro e os demais ' +
        'cadastros já salvos para a empresa e a data indicadas. As outras ' +
        'empresas selecionadas precisam de uma conferência própria.';

      if Length(Analise.Apontamentos) = 0 then
        Resumo := 'Nenhum problema encontrado'
      else
        Resumo := Format('%d ponto(s) para revisar',
          [Length(Analise.Apontamentos)]);

      FView.ExibirAnaliseCondicoes(Resumo, Mensagem);
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
