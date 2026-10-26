unit SincronizadorCalculadoraServiceUnit;

interface

uses
  SysUtils,
  ISincronizadorCalculadoraServiceUnit, IProgressObserverUnit, IDadosFiscaisReaderUnit, IDadosFiscaisWriterUnit,
  SincronizacaoCalculadoraSnapshotUnit;

type
  SincronizadorCalculadoraService = class(TInterfacedObject, ISincronizadorCalculadoraService)
  private
    FObserver: IProgressObserver;
    FReader: IDadosFiscaisReader;
    FWriter: IDadosFiscaisWriter;
    FStepsCount: Integer;
    FStepsCurrent: Integer;
  private
    procedure DoLog(const Value: string);
  public
    constructor Create(
      Observer: IProgressObserver;
      Reader: IDadosFiscaisReader;
      Writer: IDadosFiscaisWriter
    );

    /// <summary>
    ///   Fase 1 - le todas as colecoes fiscais da calculadora (a origem ja foi
    ///   configurada pelo use case). Nenhuma transacao e aberta e nenhuma
    ///   escrita e feita. Excecoes de leitura propagam.
    /// </summary>
    function LerTodos(): SincronizacaoCalculadoraSnapshot;

    /// <summary>
    ///   Fase 2 - aplica o snapshot sob a transacao do use case. Guarda de
    ///   versao: nunca aplica quando a versao local for maior que a do
    ///   snapshot (versao igual e reaplicada). Nao abre/commita transacao.
    /// </summary>
    function Aplicar(const ASnapshot: SincronizacaoCalculadoraSnapshot): Boolean;
  end;

implementation

uses
  VersaoSerproEtdUnit, DateTimeServiceUnit;

{ SincronizadorCalculadoraService }

constructor SincronizadorCalculadoraService.Create(
  Observer: IProgressObserver;
  Reader: IDadosFiscaisReader;
  Writer: IDadosFiscaisWriter);
begin
  FObserver := Observer;
  FReader := Reader;
  FWriter := Writer;
end;

procedure SincronizadorCalculadoraService.DoLog(const Value: string);
begin
  if Assigned(FObserver) then
  begin
    FObserver.OnMessage(Value);
    Inc(FStepsCurrent);
    if FStepsCount > 0 then
      FObserver.OnProgress( Trunc(FStepsCurrent / FStepsCount * 100) );
  end;
end;

function SincronizadorCalculadoraService.LerTodos(): SincronizacaoCalculadoraSnapshot;
begin
  FStepsCount := 48 - 3{Declaracao e implementacao e comentario};
  FStepsCurrent := 0;

  DoLog('');
  DoLog('>>> LEITURA TABELAS RTC via Calculadora SERPRO');

  Result := SincronizacaoCalculadoraSnapshot.Create();
  try
    DoLog('Resolvendo versao');
    Result.Versao := FReader.ObterUltimaVersao();
    DoLog(Format('Versao da Calculadora : %d - %s', [ Result.Versao.Id, DateTimeService.ParseLocal( Result.Versao.Data ) ]));

    DoLog('Resolvendo Estados');
    Result.Estados := FReader.ObterEstados();
    DoLog('Resolvendo Municipios');
    Result.Municipios := FReader.ObterMunicipios();
    DoLog('Resolvendo NBSs');
    Result.Nbss := FReader.ObterNBSs();
    DoLog('Resolvendo Anexos');
    Result.Anexos := FReader.ObterAnexos();
    DoLog('Resolvendo Tipos DFe');
    Result.TiposDfe := FReader.ObterTiposDFe();
    DoLog('Resolvendo Fundamentacoes Legais');
    Result.FundamentacoesLegais := FReader.ObterFundamentacoesLegais();
    DoLog('Resolvendo Tomadores Especificos');
    Result.TomadoresEspecificos := FReader.ObterTomadoresEspecificos();
    DoLog('Resolvendo Aliquotas de referencia');
    Result.AliquotasReferencia := FReader.ObterAliquotasReferencia();
    DoLog('Resolvendo Aliquotas padrao');
    Result.AliquotasPadrao := FReader.ObterAliquotasPadrao();
    DoLog('Resolvendo Situacoes tributarias (CST)');
    Result.SituacoesTributarias := FReader.ObterSituacoesTributarias();
    DoLog('Resolvendo Classificacoes tributarias (cClassTrib)');
    Result.ClassificacoesTributarias := FReader.ObterClassificacoesTributarias();
    DoLog('Resolvendo Tipos DFe Classificacao');
    Result.TiposDfeClassificacao := FReader.ObterTiposDFePorClassificacao();
    DoLog('Resolvendo Percentuais de reducao');
    Result.PercentuaisReducao := FReader.ObterPercentuaisReducao();
    DoLog('Resolvendo NCMs aplicaveis a Reducoes');
    Result.NcmsAplicaveis := FReader.ObterNCMsAplicaveis();
    DoLog('Resolvendo NBSs aplicaveis a Reducoes');
    Result.NbssAplicaveis := FReader.ObterNBSsAplicaveis();
    DoLog('Resolvendo Fundamentacoes das classificacoes');
    Result.FundamentacoesClassificacoes := FReader.ObterFundamentacoesClassificacoes();
    DoLog('Resolvendo Excecoes dos NCMs aplicaveis a Reducoes');
    Result.ExcecoesNcmAplicavel := FReader.ObterExcecoesNCMAplicavel();
    DoLog('Resolvendo Excecoes dos NBSs aplicaveis a Reducoes');
    Result.ExcecoesNbsAplicavel := FReader.ObterExcecoesNBSAplicavel();
    DoLog('Resolvendo Tributos por situacao tributaria');
    Result.TributoSituacoesTributarias := FReader.ObterTributoSituacoesTributarias();
    DoLog('Resolvendo Tratamentos tributarios (Expressoes de calculo)');
    Result.TratamentosTributarios := FReader.ObterTratamentosTributarios();
    DoLog('Resolvendo Tratamento das classificacoes');
    Result.TratamentosClassificacoes := FReader.ObterTratamentosClassificacoes();
    DoLog('Resolvendo Aliquotas Ad Valorem');
    Result.AliquotasAdValorem := FReader.ObterAliquotasAdValorem();
    DoLog('Resolvendo Aliquotas Ad Valorem por NCM/Produtos');
    Result.AliquotasAdValoremProdutos := FReader.ObterAliquotasAdValoremProdutos();
    DoLog('Resolvendo Excessoes aliquotas Ad Valorem por NCM/Produtos');
    Result.ExcecoesAdValoremProdutos := FReader.ObterExcecoesAdValoremProdutos();
    DoLog('Resolvendo Aliquotas Ad Valorem por NBS/Servicos');
    Result.AliquotasAdValoremServicos := FReader.ObterAliquotasAdValoremServicos();
    DoLog('Resolvendo Excessoes aliquotas Ad Valorem por NBS/Servicos');
    Result.ExcecoesAdValoremServicos := FReader.ObterExcecoesAdValoremServicos();
    DoLog('Resolvendo Unidades de medidas');
    Result.UnidadesMedidas := FReader.ObterUnidadesMedidas();
    DoLog('Resolvendo Aliquotas Ad Rem');
    Result.AliquotasAdRem := FReader.ObterAliquotasAdRem();
    DoLog('Resolvendo Aliquotas Ad Rem por NCM/Produtos');
    Result.AliquotasAdRemProdutos := FReader.ObterAliquotasAdRemProdutos();
    DoLog('Resolvendo Excessoes aliquotas Ad Rem por NCM/Produtos');
    Result.ExcecoesAdRemProdutos := FReader.ObterExcecoesAdRemProdutos();
    DoLog('Resolvendo Aliquotas Ad Rem por NBS/Servicos');
    Result.AliquotasAdRemServicos := FReader.ObterAliquotasAdRemServicos();
    DoLog('Resolvendo Excessoes aliquotas Ad Rem por NBS/Servicos');
    Result.ExcecoesAdRemServicos := FReader.ObterExcecoesAdRemServicos();
    DoLog('Resolvendo Redutores de Compra Governamental');
    Result.RedutoresCompraGovernamental := FReader.ObterRedutoresCompraGovernamental();
    DoLog('Resolvendo Transferencia de CBS para Ente Gov');
    Result.TransferenciasCBSEnteGov := FReader.ObterTransferenciasCBSEnteGov();
    DoLog('Resolvendo Lista de Servicos LC116');
    Result.ListaServicosLC116 := FReader.ObterListaServicosLC116();
    DoLog('Resolvendo Indicadores de Operacao IBS/CBS');
    Result.IndicadoresOperacaoIbsCbs := FReader.ObterIndicadoresOperacaoIbsCbs();
    DoLog('Resolvendo Classificacoes NBS Indicador Operacao LC116');
    Result.ClassificacoesNbsIndOpLc := FReader.ObterClassificacoesNbsIndOpLc();

    DoLog('Leitura da calculadora concluida');
  except
    // Nenhuma escrita ocorreu; libera o agregado parcial e propaga a falha
    // para o use case abortar sem abrir a transacao (fail closed).
    Result.Free();
    Result := nil;
    raise;
  end;
end;

function SincronizadorCalculadoraService.Aplicar(
  const ASnapshot: SincronizacaoCalculadoraSnapshot): Boolean;
var
  VersaoERP: VersaoSerproEtd;
begin
  Result := False;

  if not Assigned(ASnapshot) then
    Exit;

  FStepsCount := 48 - 3{Declaracao e implementacao e comentario};
  FStepsCurrent := 0;

  DoLog('');
  DoLog('>>> APLICACAO TABELAS RTC via Calculadora SERPRO');

  try
    // O1: a leitura da versao local tambem pode falhar; mante-la dentro do try
    // garante OnError + False (sem commit pelo use case) em vez de excecao solta.
    VersaoERP := FWriter.ObterUltimaVersao();

    // Guarda de versao: igual reaplica (republicacao); menor nao aplica downgrade.
    if VersaoERP.Id > ASnapshot.Versao.Id then
    begin
      FStepsCurrent := FStepsCount - 1;
      DoLog(Format('Processo nao precisa continuar. Versao do ERP %d. Versao Calculadora %d', [ VersaoERP.Id, ASnapshot.Versao.Id ]));
      Exit;
    end;

    DoLog(Format('Versao da Calculadora : %d - %s', [ ASnapshot.Versao.Id, DateTimeService.ParseLocal( ASnapshot.Versao.Data ) ]));
    DoLog(Format('Versao do Sistemas ERP: %d - %s', [ VersaoERP.Id, DateTimeService.ParseLocal( VersaoERP.Data ) ]));

    DoLog('');
    DoLog('Excluindo registros obsoletos');
    FWriter.ExcluirTodosDadosFiscais();

    DoLog('');
    DoLog('Resolvendo Estados');
    FWriter.SalvarEstados( ASnapshot.Estados );
    DoLog('Resolvendo Municipios');
    FWriter.SalvarMunicipios( ASnapshot.Municipios );
    DoLog('Resolvendo NBSs');
    FWriter.SalvarNBSs( ASnapshot.Nbss );
    DoLog('Resolvendo Anexos');
    FWriter.SalvarAnexos( ASnapshot.Anexos );
    DoLog('Resolvendo Tipos DFe');
    FWriter.SalvarTiposDFe( ASnapshot.TiposDfe );
    DoLog('Resolvendo Fundamentacoes legais');
    FWriter.SalvarFundamentacoesLegais( ASnapshot.FundamentacoesLegais );
    DoLog('Resolvendo Tomadores especificos');
    FWriter.SalvarTomadoresEspecificos( ASnapshot.TomadoresEspecificos );
    DoLog('Resolvendo Aliquotas de referencia');
    FWriter.SalvarAliquotasReferencia( ASnapshot.AliquotasReferencia );
    DoLog('Resolvendo Aliquotas padrao');
    FWriter.SalvarAliquotasPadrao( ASnapshot.AliquotasPadrao );
    DoLog('Resolvendo Situacoes tributarias (CST)');
    FWriter.SalvarSituacoesTributarias( ASnapshot.SituacoesTributarias );
    DoLog('Resolvendo Classificacoes tributarias (cClassTrib)');
    FWriter.SalvarClassificacoesTributarias( ASnapshot.ClassificacoesTributarias );
    DoLog('Resolvendo Tipos DFe Classificacao');
    FWriter.SalvarTiposDFePorClassificacao( ASnapshot.TiposDfeClassificacao );
    DoLog('Resolvendo Percentuais de reducao');
    FWriter.SalvarPercentuaisReducao( ASnapshot.PercentuaisReducao );
    DoLog('Resolvendo NCMs aplicaveis a Reducoes');
    FWriter.SalvarNCMsAplicaveis( ASnapshot.NcmsAplicaveis );
    DoLog('Resolvendo NBSs aplicaveis a Reducoes');
    FWriter.SalvarNBSsAplicaveis( ASnapshot.NbssAplicaveis );
    DoLog('Resolvendo Fundamentacoes das classificacoes');
    FWriter.SalvarFundamentacoesClassificacoes( ASnapshot.FundamentacoesClassificacoes );
    DoLog('Resolvendo Excecoes dos NCMs aplicaveis a Reducoes');
    FWriter.SalvarExcecoesNCMAplicavel( ASnapshot.ExcecoesNcmAplicavel );
    DoLog('Resolvendo Excecoes dos NBSs aplicaveis a Reducoes');
    FWriter.SalvarExcecoesNBSAplicavel( ASnapshot.ExcecoesNbsAplicavel );
    DoLog('Resolvendo Tributos por situacao tributaria');
    FWriter.SalvarTributoSituacoesTributarias( ASnapshot.TributoSituacoesTributarias );
    DoLog('Resolvendo Tratamentos tributarios (Expressoes de calculo)');
    FWriter.SalvarTratamentosTributarios( ASnapshot.TratamentosTributarios );
    DoLog('Resolvendo Tratamento das classificacoes');
    FWriter.SalvarTratamentosClassificacoes( ASnapshot.TratamentosClassificacoes );
    DoLog('Resolvendo Aliquotas Ad Valorem');
    FWriter.SalvarAliquotasAdValorem( ASnapshot.AliquotasAdValorem );
    DoLog('Resolvendo Aliquotas Ad Valorem por NCM/Produtos');
    FWriter.SalvarAliquotasAdValoremProdutos( ASnapshot.AliquotasAdValoremProdutos );
    DoLog('Resolvendo Aliquotas Ad Valorem por NBS/Servicos');
    FWriter.SalvarAliquotasAdValoremServicos( ASnapshot.AliquotasAdValoremServicos );
    DoLog('Resolvendo Excessoes aliquotas Ad Valorem por NCM/Produtos');
    FWriter.SalvarExcecoesAdValoremProdutos( ASnapshot.ExcecoesAdValoremProdutos );
    DoLog('Resolvendo Excessoes aliquotas Ad Valorem por NBS/Servicos');
    FWriter.SalvarExcecoesAdValoremServicos( ASnapshot.ExcecoesAdValoremServicos );
    DoLog('Resolvendo Unidades de medidas');
    FWriter.SalvarUnidadesMedidas( ASnapshot.UnidadesMedidas );
    DoLog('Resolvendo Aliquotas Ad Rem');
    FWriter.SalvarAliquotasAdRem( ASnapshot.AliquotasAdRem );
    DoLog('Resolvendo Aliquotas Ad Rem por NCM/Produtos');
    FWriter.SalvarAliquotasAdRemProdutos( ASnapshot.AliquotasAdRemProdutos );
    DoLog('Resolvendo Aliquotas Ad Rem por NBS/Servicos');
    FWriter.SalvarAliquotasAdRemServicos( ASnapshot.AliquotasAdRemServicos );
    DoLog('Resolvendo Excessoes aliquotas Ad Rem por NCM/Produtos');
    FWriter.SalvarExcecoesAdRemProdutos( ASnapshot.ExcecoesAdRemProdutos );
    DoLog('Resolvendo Excessoes aliquotas Ad Rem por NBS/Servicos');
    FWriter.SalvarExcecoesAdRemServicos( ASnapshot.ExcecoesAdRemServicos );
    DoLog('Resolvendo Redutores de Compra Governamental');
    FWriter.SalvarRedutoresCompraGovernamental( ASnapshot.RedutoresCompraGovernamental );
    DoLog('Resolvendo Transferencia de CBS para Ente Gov');
    FWriter.SalvarTransferenciasCBSEnteGov( ASnapshot.TransferenciasCBSEnteGov );
    DoLog('Resolvendo Lista de Servicos LC116');
    FWriter.SalvarListaServicosLC116( ASnapshot.ListaServicosLC116 );
    DoLog('Resolvendo Indicadores de Operacao IBS/CBS');
    FWriter.SalvarIndicadoresOperacaoIbsCbs( ASnapshot.IndicadoresOperacaoIbsCbs );
    DoLog('Resolvendo Classificacoes NBS Indicador Operacao LC116');
    FWriter.SalvarClassificacoesNbsIndOpLc( ASnapshot.ClassificacoesNbsIndOpLc );

    DoLog('Salvando versao');
    FWriter.SalvarUltimaVersao( ASnapshot.Versao );

    FStepsCurrent := FStepsCount - 1;
    DoLog('Dados da calculadora aplicados com sucesso');

    Result := True;
  except
    on E: Exception do
    begin
      if Assigned(FObserver) then
        FObserver.OnError(E.Message);
      Result := False;
    end;
  end;
end;

end.
