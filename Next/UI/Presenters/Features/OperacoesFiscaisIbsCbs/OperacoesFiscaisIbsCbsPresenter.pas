unit OperacoesFiscaisIbsCbsPresenter;

interface

uses
  AuthorizationService, OperacoesFiscaisIbsCbsView,
  RemoverOperacaoFiscalIbsCbsUseCaseUnit, SalvarOperacaoFiscalIbsCbsUseCaseUnit,
  ObterOperacaoFiscalIbsCbsPorIdUseCaseUnit, OperacaoFiscalIbsCbsEtdUnit,
  NextQueryDefinition, OperacoesFiscaisIbsCbsQueryDefinition,
  ResolverRegraFiscalIbsCbsUseCaseUnit, PresenterConsultaBase;

type
  // Apresentador da consulta, da inclusao e da alteracao de Operacoes Fiscais
  // IBS/CBS. Encaminha a leitura para a consulta injetada, verifica a autorizacao
  // antes das operacoes e executa o carregamento e a gravacao.
  // A inclusao reapresenta a aba existente ou autoriza e entrega a abertura a
  // tela, que prepara os seletores e as empresas na propria aba. A alteracao
  // identifica a linha corrente, reapresenta a aba existente ou autoriza,
  // carrega o registro e delega a tela a preparacao da aba.
  // As mensagens e os erros de campo sao apresentados pela view recebida no
  // construtor; a negativa ou o cancelamento ja apresentado pelo legado e a
  // indisponibilidade comunicada pelo proprio servico de autorizacao nao sao
  // repetidos. O resultado de validacao do caso de uso volta para a aba que
  // iniciou a gravacao.
  TOperacoesFiscaisIbsCbsPresenter = class(TPresenterConsultaBase)
  private
    // A view pertence a tela e as demais dependencias ao container de
    // composicao: o apresentador apenas as utiliza e nunca as libera.
    FView: IOperacoesFiscaisIbsCbsView;
    FQueryDefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
    FRemover: RemoverOperacaoFiscalIbsCbsUseCase;
    FSalvar: SalvarOperacaoFiscalIbsCbsUseCase;
    FObter: ObterOperacaoFiscalIbsCbsPorIdUseCase;
    FResolver: ResolverRegraFiscalIbsCbsUseCase;
  public
    constructor Create(const AView: IOperacoesFiscaisIbsCbsView;
      const AQueryDefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
      const AAuthorization: IAuthorizationService;
      ARemover: RemoverOperacaoFiscalIbsCbsUseCase;
      ASalvar: SalvarOperacaoFiscalIbsCbsUseCase;
      AObter: ObterOperacaoFiscalIbsCbsPorIdUseCase;
      AResolver: ResolverRegraFiscalIbsCbsUseCase);
    function EnviarParaLixeira: Boolean;
    // Reapresenta a aba de inclusao quando ela ja existe; caso contrario autoriza
    // a inclusao e entrega a abertura para a nova aba, que cria o proprio
    // rascunho e carrega os seletores. A negativa da autorizacao ja foi
    // apresentada e interrompe a operacao.
    function CarregarParaInclusao: Boolean;
    // Reapresenta a aba da linha corrente quando ela ja existe; caso contrario
    // autoriza a alteracao, carrega o registro e entrega a operacao para a nova
    // aba, que prepara o rascunho e os vinculos. Sem linha valida a view informa
    // que a selecao e obrigatoria e a operacao nao prossegue.
    function CarregarParaEdicao: Boolean;
    function Salvar(const ARascunho: OperacaoFiscalIbsCbsEtd): Boolean;
    // Executa a análise do rascunho recebido e apresenta a conferência.
    function AnalisarCondicoes(
      const ARascunho: OperacaoFiscalIbsCbsEtd): Boolean;
  end;

implementation

uses
  System.SysUtils, EValidacaoNegocioUnit, StatusRegistroEnumUnit,
  ResolverRegraFiscalIbsCbsTypesUnit, CreateEntityUseCaseOutputUnit;

const
  // Codigos do cadastro legado usados por esta funcionalidade. O host recebe o
  // processo, a acao e a tabela e nao os conhece.
  ProcessoConsulta = 'MOD020';
  ProcessoInclusao = 'MOD021';
  ProcessoAlteracao = 'MOD022';
  ProcessoGravacao = 'MOD023';
  ProcessoExclusao = 'MOD024';
  ProcessoRestauracao = 'MOD025';
  TabelaOperacoesFiscais = 'OP_FISCAIS_IBSCBS';

  AnaliseFalhaMessage =
    'Não foi possível analisar as condições da operação fiscal.';

  SelecaoObrigatoriaMessage = 'Selecione uma operação fiscal na grade.';

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

{ TOperacoesFiscaisIbsCbsPresenter }

constructor TOperacoesFiscaisIbsCbsPresenter.Create(
  const AView: IOperacoesFiscaisIbsCbsView;
  const AQueryDefinition: INextQueryDefinition<TOperacaoFiscalSelecionada>;
  const AAuthorization: IAuthorizationService;
  ARemover: RemoverOperacaoFiscalIbsCbsUseCase;
  ASalvar: SalvarOperacaoFiscalIbsCbsUseCase;
  AObter: ObterOperacaoFiscalIbsCbsPorIdUseCase;
  AResolver: ResolverRegraFiscalIbsCbsUseCase);
begin
  // O processo de pesquisa e a tabela padrao ficam na base, que tambem responde
  // pela permissao da consulta. As demais operacoes informam o proprio processo
  // e usam essa tabela padrao.
  inherited Create(AAuthorization, ProcessoConsulta, TabelaOperacoesFiscais);
  if AView = nil then
    raise Exception.Create(
      'A view de Operações Fiscais IBS/CBS não foi informada.');
  if AQueryDefinition = nil then
    raise Exception.Create(
      'A consulta de Operações Fiscais IBS/CBS não foi informada.');
  if ARemover = nil then
    raise Exception.Create(
      'O caso de uso de remoção de Operações Fiscais IBS/CBS não foi informado.');
  if ASalvar = nil then
    raise Exception.Create(
      'O caso de uso de gravação de Operações Fiscais IBS/CBS não foi informado.');
  if AObter = nil then
    raise Exception.Create(
      'O caso de uso de carregamento de Operações Fiscais IBS/CBS não foi informado.');

  if AResolver = nil then
    raise Exception.Create(
      'O caso de uso de análise das condições de Operações Fiscais IBS/CBS não foi informado.');

  FView := AView;
  FQueryDefinition := AQueryDefinition;
  FRemover := ARemover;
  FSalvar := ASalvar;
  FObter := AObter;
  FResolver := AResolver;
end;

function TOperacoesFiscaisIbsCbsPresenter.EnviarParaLixeira: Boolean;
var
  Selected: TOperacaoFiscalSelecionada;
  Descricao: string;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selected) then
    Exit;

  Descricao := Trim(Selected.OperacaoInternaDescricao);
  if Trim(Selected.RegraFiscalDescricao) <> '' then
    Descricao := Descricao + ' / ' + Trim(Selected.RegraFiscalDescricao);
  if Trim(Selected.GrupoFiscalDescricao) <> '' then
    Descricao := Descricao + ' / ' + Trim(Selected.GrupoFiscalDescricao);

  if not FView.ShowDangerQuestion(Format(
    'Deseja enviar a operação fiscal "%s" para a lixeira?', [Descricao])) then
    Exit;

  if not Autorizar(ProcessoExclusao, aaExcluir) then
    Exit;

  try
    FRemover.Executar(Selected.Id);
    Result := True;
  except
    on E: EValidacaoNegocio do
      FView.ShowError(E.Message);
    on E: Exception do
      FView.ShowError(
        'Não foi possível enviar a operação fiscal para a lixeira.');
  end;
end;

function TOperacoesFiscaisIbsCbsPresenter.CarregarParaInclusao: Boolean;
begin
  Result := False;

  if FView.AtivarInclusao then
  begin
    Result := True;
    Exit;
  end;

  // A negativa ou o cancelamento ja foi apresentado pelo legado.
  if not Autorizar(ProcessoInclusao, aaInserir) then
    Exit;

  // A aba carrega seletores e empresas ao ser preparada; a falha descarta a aba
  // parcial e e informada uma unica vez pela propria tela.
  Result := FView.AbrirInclusao;
end;

function TOperacoesFiscaisIbsCbsPresenter.CarregarParaEdicao: Boolean;
var
  Selected: TOperacaoFiscalSelecionada;
  Id: string;
  Descricao: string;
  Carregada: OperacaoFiscalIbsCbsEtd;
begin
  Result := False;

  if not FQueryDefinition.TryGetSelected(Selected) then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  Id := Trim(Selected.Id);
  if Id = '' then
  begin
    FView.ShowError(SelecaoObrigatoriaMessage);
    Exit;
  end;

  if FView.AtivarEdicao(Id) then
  begin
    Result := True;
    Exit;
  end;

  // A permissao de alteracao e verificada antes de qualquer leitura.
  if not Autorizar(ProcessoAlteracao, aaAlterar) then
    Exit;

  Carregada := nil;
  try
    try
      Carregada := FObter.Executar(Id);
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

        Carregada.Ativo := saAtivo;
      end;

      // A view copia a operacao para o rascunho da aba; a entidade continua
      // pertencendo a este metodo e e liberada no finally.
      Result := FView.AbrirEdicao(Id, Carregada);
    except
      on E: EValidacaoNegocio do
        FView.ShowError(E.Message);
      on E: Exception do
        // O texto tecnico do banco nao deve chegar a interface.
        FView.ShowError(
          'Não foi possível carregar a operação fiscal para alteração.');
    end;
  finally
    Carregada.Free;
  end;
end;

function TOperacoesFiscaisIbsCbsPresenter.Salvar(
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
        // A validacao volta para a aba que iniciou a gravacao.
        FView.ExibirValidacao(Resultado.Validation);
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

function TOperacoesFiscaisIbsCbsPresenter.AnalisarCondicoes(
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
        FView.ShowError(AnaliseFalhaMessage);
    end;
  finally
    Analise.Free;
  end;
end;

end.
