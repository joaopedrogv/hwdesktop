unit OperacoesFiscaisIbsCbsCadastroPresenter;

interface

uses
  AuthorizationService, OperacoesFiscaisIbsCbsCadastroView, ObterOperacaoFiscalIbsCbsPorIdUseCaseUnit,
  SalvarOperacaoFiscalIbsCbsUseCaseUnit, ResolverRegraFiscalIbsCbsUseCaseUnit, OperacaoFiscalIbsCbsEtdUnit,
  PresenterCadastroBase;

type
  // Apresentador do cadastro; nao conhece a consulta, a grade nem as abas.
  TOperacoesFiscaisIbsCbsCadastroPresenter = class(TPresenterCadastroBase)
  private
    // A view pertence ao frame do editor e as demais dependencias ao container de
    // composicao: o apresentador apenas as utiliza e nunca as libera.
    FView: IOperacoesFiscaisIbsCbsCadastroView;
    FObter: ObterOperacaoFiscalIbsCbsPorIdUseCase;
    FSalvar: SalvarOperacaoFiscalIbsCbsUseCase;
    FResolver: ResolverRegraFiscalIbsCbsUseCase;
  public
    constructor Create(const AView: IOperacoesFiscaisIbsCbsCadastroView;
      const AAuthorization: IAuthorizationService;
      AObter: ObterOperacaoFiscalIbsCbsPorIdUseCase;
      ASalvar: SalvarOperacaoFiscalIbsCbsUseCase;
      AResolver: ResolverRegraFiscalIbsCbsUseCase);
    function PrepararInclusao: Boolean; override;
    function PrepararAlteracao(const AId: string): Boolean; override;
    function Salvar(const ARascunho: OperacaoFiscalIbsCbsEtd): Boolean;
    function AnalisarCondicoes(
      const ARascunho: OperacaoFiscalIbsCbsEtd): Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, StatusRegistroEnumUnit,
  ResolverRegraFiscalIbsCbsTypesUnit, CreateEntityUseCaseOutputUnit;

const
  ProcessoInclusao = 'MOD021';
  ProcessoAlteracao = 'MOD022';
  ProcessoGravacao = 'MOD023';
  ProcessoRestauracao = 'MOD025';
  TabelaOperacoesFiscais = 'OP_FISCAIS_IBSCBS';

function DescricaoConfiguracao(
  const ARascunho: OperacaoFiscalIbsCbsEtd): string;
var
  OperacaoInterna: string;
  GrupoFiscal: string;
  RegraFiscal: string;
begin
  OperacaoInterna := Trim(ARascunho.OperacaoInternaDescricao);
  if OperacaoInterna = '' then
    OperacaoInterna := 'não identificada';

  GrupoFiscal := Trim(ARascunho.GrupoFiscalDescricao);
  if GrupoFiscal = '' then
    GrupoFiscal := 'Nenhum';

  RegraFiscal := Trim(ARascunho.RegraFiscalDescricao);
  if RegraFiscal = '' then
    RegraFiscal := 'não identificada';

  Result := Format('Op Interna [%s] / Grupo Fiscal [%s] / Regra fiscal [%s]',
    [OperacaoInterna, GrupoFiscal, RegraFiscal]);
end;

function SecaoApontamentos(const ATitulo: string;
  const AApontamentos: ResolverRegraFiscalIbsCbsApontamentoArray;
  ATipo: ResolverRegraFiscalIbsCbsApontamentoTipo): string;
var
  I: Integer;
  Quantidade: Integer;
  TituloSecao: string;
begin
  Result := '';
  Quantidade := 0;
  for I := 0 to High(AApontamentos) do
    if AApontamentos[I].Tipo = ATipo then
      Inc(Quantidade);

  if Quantidade = 0 then
    Exit;

  if ATipo = ratObservacaoOpcoes then
  begin
    if Quantidade = 1 then
      TituloSecao := 'Uma observação sobre as opções selecionadas'
    else
      TituloSecao := Format('%d observações sobre as opções selecionadas',
        [Quantidade]);
  end
  else
    TituloSecao := ATitulo;

  Result := TituloSecao;
  for I := 0 to High(AApontamentos) do
    if AApontamentos[I].Tipo = ATipo then
      Result := Result + sLineBreak + #149 + ' ' + AApontamentos[I].Texto;

  if ATipo = ratObservacaoOpcoes then
    Result := Result + sLineBreak +
      'Esses campos aceitam todas as opções disponíveis. Por isso, a aplicação ' +
      'desta configuração depende dos demais critérios. Se essa abrangência é a ' +
      'desejada, mantenha as opções. Para limitar a configuração, marque somente ' +
      'as opções que ela deve aceitar.';
end;

procedure AdicionarBloco(var ATexto: string; const ABloco: string);
begin
  if ABloco = '' then
    Exit;

  if ATexto <> '' then
    ATexto := ATexto + sLineBreak + sLineBreak;
  ATexto := ATexto + ABloco;
end;

{ TOperacoesFiscaisIbsCbsCadastroPresenter }

constructor TOperacoesFiscaisIbsCbsCadastroPresenter.Create(
  const AView: IOperacoesFiscaisIbsCbsCadastroView;
  const AAuthorization: IAuthorizationService;
  AObter: ObterOperacaoFiscalIbsCbsPorIdUseCase;
  ASalvar: SalvarOperacaoFiscalIbsCbsUseCase;
  AResolver: ResolverRegraFiscalIbsCbsUseCase);
begin
  inherited Create(AAuthorization, TabelaOperacoesFiscais);
  if AView = nil then
    raise Exception.Create(
      'A view de Operações Fiscais IBS/CBS não foi informada.');
  if AObter = nil then
    raise Exception.Create(
      'O caso de uso de carregamento de Operações Fiscais IBS/CBS não foi informado.');
  if ASalvar = nil then
    raise Exception.Create(
      'O caso de uso de gravação de Operações Fiscais IBS/CBS não foi informado.');
  if AResolver = nil then
    raise Exception.Create(
      'O caso de uso de análise das condições de Operações Fiscais IBS/CBS não foi informado.');

  FView := AView;
  FObter := AObter;
  FSalvar := ASalvar;
  FResolver := AResolver;
end;

function TOperacoesFiscaisIbsCbsCadastroPresenter.PrepararInclusao: Boolean;
var
  Mensagem: string;
begin
  Result := False;

  // A negativa ou o cancelamento ja foi apresentado pelo legado.
  if not Autorizar(ProcessoInclusao, aaInserir) then
    Exit;

  if FView.PrepararInclusao then
  begin
    Result := True;
    Exit;
  end;

  Mensagem :=
    'Não foi possível carregar os seletores e as empresas para a inclusão';
  if FView.FalhaCarga <> '' then
    Mensagem := Mensagem + ': ' + FView.FalhaCarga;
  FView.ShowWarning(Mensagem + '.');
end;

function TOperacoesFiscaisIbsCbsCadastroPresenter.PrepararAlteracao(
  const AId: string): Boolean;
var
  Carregada: OperacaoFiscalIbsCbsEtd;
  Descricao: string;
  Mensagem: string;
begin
  Result := False;

  // A permissao de alteracao e verificada antes de qualquer leitura.
  if not Autorizar(ProcessoAlteracao, aaAlterar) then
    Exit;

  Carregada := nil;
  try
    try
      Carregada := FObter.Executar(AId);
      if Carregada = nil then
      begin
        FView.ShowError('A operação fiscal selecionada não foi encontrada.');
        Exit;
      end;

      if Carregada.Ativo <> saAtivo then
      begin
        Descricao := Trim(Carregada.OperacaoInternaDescricao);
        if Trim(Carregada.RegraFiscalDescricao) <> '' then
          Descricao := Descricao + ' / ' + Trim(Carregada.RegraFiscalDescricao);
        if Trim(Carregada.GrupoFiscalDescricao) <> '' then
          Descricao := Descricao + ' / ' + Trim(Carregada.GrupoFiscalDescricao);

        if not FView.ShowQuestion(Format(
          'A operação fiscal "%s" está na lixeira. Deseja restaurar o registro?',
          [Descricao])) then
          Exit;

        if not Autorizar(ProcessoRestauracao, aaAlterar) then
          Exit;

        // A restauracao so e persistida pela gravacao.
        Carregada.Ativo := saAtivo;
      end;

      if not FView.PrepararAlteracao(Carregada) then
      begin
        Mensagem :=
          'Não foi possível carregar os seletores e as empresas para a alteração';
        if FView.FalhaCarga <> '' then
          Mensagem := Mensagem + ': ' + FView.FalhaCarga;
        FView.ShowWarning(Mensagem + '.');
        Exit;
      end;

      Result := True;
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message);
      on E: Exception do
        // O texto tecnico do banco nao deve chegar a interface.
        FView.ShowError(
          'Não foi possível carregar a operação fiscal para alteração.');
    end;
  finally
    // A view copia a operacao para o rascunho do frame; a entidade continua
    // pertencendo a este metodo e e liberada no finally.
    Carregada.Free;
  end;
end;

function TOperacoesFiscaisIbsCbsCadastroPresenter.Salvar(
  const ARascunho: OperacaoFiscalIbsCbsEtd): Boolean;
var
  Resultado: CreateEntityUseCaseOutPut;
begin
  Result := False;

  if ARascunho = nil then
  begin
    FView.ShowError('O rascunho da operação fiscal não foi informado.');
    Exit;
  end;

  if not Autorizar(ProcessoGravacao, aaSalvar) then
    Exit;

  Resultado := nil;
  try
    try
      Resultado := FSalvar.Executar(ARascunho);

      if Resultado.Validation.IsValid then
        Result := True
      else
        // A validacao volta para o editor que iniciou a gravacao.
        FView.ShowValidation(Resultado.Validation);
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message);
      on E: Exception do
        // O texto tecnico do banco nao deve chegar a interface.
        FView.ShowError('Não foi possível salvar a operação fiscal.');
    end;
  finally
    // O resultado do caso de uso libera a entidade persistida; o apresentador
    // nunca a devolve nem a retem.
    Resultado.Free;
  end;
end;

function TOperacoesFiscaisIbsCbsCadastroPresenter.AnalisarCondicoes(
  const ARascunho: OperacaoFiscalIbsCbsEtd): Boolean;
var
  Analise: ResolverRegraFiscalIbsCbsAnalise;
  EmpresaId: Integer;
  EmpresaTexto: string;
  DataTexto: string;
  Relatorio: string;
  Corpo: string;
  Resumo: string;
begin
  Result := False;
  Analise := nil;

  try
    try
      EmpresaId := 0;
      if Length(ARascunho.EmpresasId) > 0 then
        EmpresaId := ARascunho.EmpresasId[0];

      Analise := FResolver.Analisar(
        ResolverRegraFiscalIbsCbsInput.CreateParaAnalise(
          ARascunho.OperacaoInternaId, ARascunho.GrupoFiscalId.Value,
          EmpresaId, ARascunho.InicioVigencia, ARascunho));

      if EmpresaId > 0 then
        EmpresaTexto := Format('Código [%d]', [EmpresaId])
      else
        EmpresaTexto := 'Empresa não selecionada';

      if ARascunho.InicioVigencia > 0 then
        DataTexto := FormatDateTime('dd/mm/yyyy', ARascunho.InicioVigencia)
      else
        DataTexto := 'data não informada';

      Relatorio := 'Conferência da configuração' + sLineBreak + sLineBreak +
        'Configuração analisada' + sLineBreak +
        DescricaoConfiguracao(ARascunho) + sLineBreak + sLineBreak +
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

      Relatorio := Relatorio + sLineBreak + sLineBreak + Corpo + sLineBreak +
        sLineBreak +
        'A conferência considera as alterações deste cadastro e os demais ' +
        'cadastros já salvos para a empresa e a data indicadas. As outras ' +
        'empresas selecionadas precisam de uma conferência própria.';

      if Length(Analise.Apontamentos) = 0 then
        Resumo := 'Nenhum problema encontrado'
      else
        Resumo := Format('%d ponto(s) para revisar',
          [Length(Analise.Apontamentos)]);

      FView.ExibirAnaliseCondicoes(Resumo, Relatorio);
      Result := True;
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message);
      on E: Exception do
        FView.ShowError(
          'Não foi possível analisar as condições da operação fiscal.');
    end;
  finally
    Analise.Free;
  end;
end;

end.
