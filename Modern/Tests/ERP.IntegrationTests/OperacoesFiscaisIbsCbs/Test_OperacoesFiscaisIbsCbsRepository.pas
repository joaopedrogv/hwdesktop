unit Test_OperacoesFiscaisIbsCbsRepository;

interface

uses
  DUnitX.TestFramework,
  Classes,
  ConfigurationTestUnit,
  IDataBaseConnectionUnit,
  IOperacoesFiscaisIbsCbsRepositoryUnit,
  OperacaoFiscalIbsCbsEtdUnit,
  OperacaoFiscalIbsCbsCondicaoEtdUnit;

type
  [TestFixture]
  TTestOperacoesFiscaisIbsCbsRepository = class
  private
    FConnection: IDataBaseConnection;
    FConfig: ConfigurationTest;
    FRepo: IOperacoesFiscaisIbsCbsRepository;
    FVinculosCriados: TStringList;
    FOperacaoInternaId: string;
    FGrupoFiscalId: string;
    FRegraFiscalId: string;
    FEmpresaId: Integer;
    FOutraEmpresaId: Integer;
    procedure CarregarDadosDeApoio;
    procedure VerificarTabelaDeCondicoes;
    procedure RemoverVinculosCriados;
    procedure DeletarVinculoFisicamente(const AId: string);
    function ContarCondicoes(const AId: string): Integer;
    function ContarVinculos(const ARegraFiscalId: string; ADataInicio: TDate): Integer;
    function ContarCondicoesDoContexto(ADataInicio: TDate): Integer;
    function CriarEntidade(const AGrupoFiscalId: string;
      const AEmpresas: array of Integer;
      const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
      ADataInicio: TDate): OperacaoFiscalIbsCbsEtd;
    function CriarVinculo(const AGrupoFiscalId: string;
      const AEmpresas: array of Integer;
      const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
      ADataInicio: TDate): OperacaoFiscalIbsCbsEtd;
    function IndiceVinculo(const ALista: OperacaoFiscalIbsCbsEtdList;
      const AId: string): Integer;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveCarregarCondicoesNoGetById;

    [Test]
    procedure DeveRetornarAgregadoAusenteSemObjetoParcial;

    [Test]
    procedure DeveSubstituirCondicoesNoPut;

    [Test]
    procedure DeveRemoverTodasAsCondicoesNoPut;

    [Test]
    procedure DeveCarregarEspecificoEPadraoFiltrandoEmpresaEVigencia;

    [Test]
    procedure DeveDesfazerTransacaoQuandoCondicaoViolarCheck;

    [Test]
    procedure DevePreservarAgregadoQuandoReinsercaoDeCondicoesFalhar;

    [Test]
    procedure DeveEliminarCondicoesNaExclusaoFisica;

    [Test]
    procedure DevePreservarCondicoesNaExclusaoLogica;
  end;

implementation

uses
  SysUtils,
  TipoComunsUnit,
  StatusRegistroEnumUnit,
  StringNullableUnit,
  DateAndTimeNullableUnit,
  ParameterValueUnit,
  ITransactionUnit,
  ErpFeaturesRepoContainerUnit,
  SetupUnit,
  SetupTestUnit;

function Condicao(const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  const AValores: array of Integer): OperacaoFiscalIbsCbsCondicaoEtd;
var
  Valores: TArrayInteger;
  I: Integer;
begin
  SetLength(Valores, Length(AValores));
  for I := 0 to High(AValores) do
    Valores[I] := AValores[I];

  Result := OperacaoFiscalIbsCbsCondicaoEtd.Create(AAtributo, Valores);
end;

function Condicoes(const AItens: array of OperacaoFiscalIbsCbsCondicaoEtd):
  OperacaoFiscalIbsCbsCondicaoEtdArray;
var
  I: Integer;
begin
  SetLength(Result, Length(AItens));
  for I := 0 to High(AItens) do
    Result[I] := AItens[I];
end;

function IndiceCondicao(const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to High(ACondicoes) do
    if ACondicoes[I].Atributo = AAtributo then
      Exit(I);
end;

{ TTestOperacoesFiscaisIbsCbsRepository }

procedure TTestOperacoesFiscaisIbsCbsRepository.Setup;
begin
  ModernInitialize();

  FConfig := GetConfig();

  // A escrita ocorre apenas no banco de teste; nunca no banco operacional
  // conectado por ModernInitialize.
  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True',
      [FConfig.DatabaseNameSinc]));

  FConnection := AppSetup.DatabaseConnection;
  FRepo := ErpFeaturesRepoContainer.GetInstance().OperacoesFiscaisIbsCbsRepo;
  FVinculosCriados := TStringList.Create;

  CarregarDadosDeApoio;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.TearDown;
begin
  RemoverVinculosCriados;
  FVinculosCriados.Free;

  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True',
      [FConfig.DatabaseName]));

  ModernShutDown();
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.CarregarDadosDeApoio;
var
  Faltantes: string;
begin
  FOperacaoInternaId := FConnection.ExecuteScalar(
    'SELECT FIRST 1 ID FROM OP_INTERNAS WHERE ATIVO = 1').AsString;
  FGrupoFiscalId := FConnection.ExecuteScalar(
    'SELECT FIRST 1 ID FROM GRUPOS_FISCAIS WHERE ATIVO = 1').AsString;
  FRegraFiscalId := FConnection.ExecuteScalar(
    'SELECT FIRST 1 ID FROM REGRAS_FISCAIS_IBSCBS WHERE ATIVO = 1').AsString;
  FEmpresaId := FConnection.ExecuteScalar(
    'SELECT FIRST 1 COD_EMPRESA FROM EMPRESA').AsInteger;
  FOutraEmpresaId := FConnection.ExecuteScalar(
    'SELECT FIRST 1 COD_EMPRESA FROM EMPRESA WHERE COD_EMPRESA <> :COD_EMPRESA',
    ParametersBuilder.Create(1).ByName('COD_EMPRESA', FEmpresaId).Build()).AsInteger;

  // Pre-requisitos ausentes nunca podem resultar em teste silenciosamente
  // aprovado: a preparacao falha com diagnostico explicito.
  Faltantes := '';
  if FOperacaoInternaId = '' then
    Faltantes := Faltantes + ' operacao interna ativa (OP_INTERNAS);';
  if FGrupoFiscalId = '' then
    Faltantes := Faltantes + ' grupo fiscal ativo (GRUPOS_FISCAIS);';
  if FRegraFiscalId = '' then
    Faltantes := Faltantes + ' regra fiscal ativa (REGRAS_FISCAIS_IBSCBS);';
  if FEmpresaId <= 0 then
    Faltantes := Faltantes + ' empresa (EMPRESA);';
  if FOutraEmpresaId <= 0 then
    Faltantes := Faltantes + ' segunda empresa (EMPRESA);';

  if Faltantes <> '' then
    raise Exception.Create(
      'Pre-requisitos ausentes no banco de teste (' + FConfig.DatabaseNameSinc +
      '):' + Faltantes +
      ' os testes de integracao nao podem ser considerados executados.');

  VerificarTabelaDeCondicoes;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.VerificarTabelaDeCondicoes;
begin
  try
    FConnection.ExecuteScalar('SELECT COUNT(*) FROM OP_FISCAIS_IBSCBS_COND');
  except
    on E: Exception do
      raise Exception.Create(
        'Pre-requisito ausente no banco de teste: a tabela OP_FISCAIS_IBSCBS_COND ' +
        'nao esta disponivel. Aplique a migracao condicoes-operacoes-ibscbs antes ' +
        'de executar a integracao. Detalhe: ' + E.Message);
  end;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.RemoverVinculosCriados;
var
  I: Integer;
  Transacao: ITransaction;
begin
  if FVinculosCriados.Count = 0 then
    Exit;

  Transacao := FConnection.BeginTransaction();
  try
    try
      for I := 0 to FVinculosCriados.Count - 1 do
        FConnection.ExecuteCommand(
          'DELETE FROM OP_FISCAIS_IBSCBS WHERE ID = :ID',
          ParametersBuilder.Create(1)
            .ByName('ID', FVinculosCriados[I])
            .Build()
        );

      Transacao.Commit();
    except
      Transacao.Rollback();
      raise;
    end;
  finally
    Transacao.Free;
  end;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.DeletarVinculoFisicamente(const AId: string);
var
  Transacao: ITransaction;
begin
  Transacao := FConnection.BeginTransaction();
  try
    try
      FConnection.ExecuteCommand(
        'DELETE FROM OP_FISCAIS_IBSCBS WHERE ID = :ID',
        ParametersBuilder.Create(1).ByName('ID', AId).Build()
      );

      Transacao.Commit();
    except
      Transacao.Rollback();
      raise;
    end;
  finally
    Transacao.Free;
  end;
end;

function TTestOperacoesFiscaisIbsCbsRepository.ContarCondicoes(const AId: string): Integer;
begin
  Result := FConnection.ExecuteScalar(
    'SELECT COUNT(*) FROM OP_FISCAIS_IBSCBS_COND WHERE OP_FISCAIS_ID = :ID',
    ParametersBuilder.Create(1).ByName('ID', AId).Build()).AsInteger;
end;

function TTestOperacoesFiscaisIbsCbsRepository.ContarVinculos(
  const ARegraFiscalId: string; ADataInicio: TDate): Integer;
begin
  Result := FConnection.ExecuteScalar(
    'SELECT COUNT(*) FROM OP_FISCAIS_IBSCBS ' +
    ' WHERE OP_INTERNA_ID = :OP_INTERNA_ID ' +
    ' AND REGRA_FISCAL_ID = :REGRA_FISCAL_ID ' +
    ' AND DATA_INI_VIGENCIA = :DATA_INI_VIGENCIA',
    ParametersBuilder.Create(3)
      .ByName('OP_INTERNA_ID', FOperacaoInternaId)
      .ByName('REGRA_FISCAL_ID', ARegraFiscalId)
      .ByName('DATA_INI_VIGENCIA', ADataInicio)
      .Build()).AsInteger;
end;

function TTestOperacoesFiscaisIbsCbsRepository.ContarCondicoesDoContexto(
  ADataInicio: TDate): Integer;
begin
  Result := FConnection.ExecuteScalar(
    'SELECT COUNT(*) FROM OP_FISCAIS_IBSCBS_COND C ' +
    ' INNER JOIN OP_FISCAIS_IBSCBS O ON O.ID = C.OP_FISCAIS_ID ' +
    ' WHERE O.OP_INTERNA_ID = :OP_INTERNA_ID ' +
    ' AND O.REGRA_FISCAL_ID = :REGRA_FISCAL_ID ' +
    ' AND O.DATA_INI_VIGENCIA = :DATA_INI_VIGENCIA',
    ParametersBuilder.Create(3)
      .ByName('OP_INTERNA_ID', FOperacaoInternaId)
      .ByName('REGRA_FISCAL_ID', FRegraFiscalId)
      .ByName('DATA_INI_VIGENCIA', ADataInicio)
      .Build()).AsInteger;
end;

function TTestOperacoesFiscaisIbsCbsRepository.CriarEntidade(
  const AGrupoFiscalId: string;
  const AEmpresas: array of Integer;
  const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  ADataInicio: TDate): OperacaoFiscalIbsCbsEtd;
var
  EmpresasId: TArrayInteger;
  I: Integer;
begin
  SetLength(EmpresasId, Length(AEmpresas));
  for I := 0 to High(AEmpresas) do
    EmpresasId[I] := AEmpresas[I];

  Result := OperacaoFiscalIbsCbsEtd.Create();
  Result.OperacaoInternaId := FOperacaoInternaId;
  Result.RegraFiscalId := FRegraFiscalId;
  Result.GrupoFiscalId := StringNullable.CreateOrNull(AGrupoFiscalId);
  Result.InicioVigencia := ADataInicio;
  Result.FimVigencia := DateNullable.NullInstance();
  Result.EmpresasId := EmpresasId;
  Result.Condicoes := ACondicoes;
end;

function TTestOperacoesFiscaisIbsCbsRepository.CriarVinculo(
  const AGrupoFiscalId: string;
  const AEmpresas: array of Integer;
  const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  ADataInicio: TDate): OperacaoFiscalIbsCbsEtd;
var
  Entidade: OperacaoFiscalIbsCbsEtd;
begin
  Entidade := CriarEntidade(AGrupoFiscalId, AEmpresas, ACondicoes, ADataInicio);
  try
    Result := FRepo.Post(Entidade);
  finally
    Entidade.Free;
  end;

  FVinculosCriados.Add(Result.Id);
end;

function TTestOperacoesFiscaisIbsCbsRepository.IndiceVinculo(
  const ALista: OperacaoFiscalIbsCbsEtdList; const AId: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to ALista.Count - 1 do
    if OperacaoFiscalIbsCbsEtd(ALista[I]).Id = AId then
      Exit(I);
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.DeveCarregarCondicoesNoGetById;
var
  Criado: OperacaoFiscalIbsCbsEtd;
  Carregado: OperacaoFiscalIbsCbsEtd;
  Indice: Integer;
begin
  Criado := CriarVinculo('', [FEmpresaId, FOutraEmpresaId], Condicoes([
    Condicao(ocaTipoEmissao, [1]),
    Condicao(ocaTipoOrgaoPublico, [0, 1])
  ]), EncodeDate(2026, 1, 1));
  try
    Carregado := FRepo.GetById(Criado.Id);
    try
      Assert.IsNotNull(Carregado);
      Assert.AreEqual(2, Length(Carregado.EmpresasId));
      Assert.AreEqual(2, Length(Carregado.Condicoes));

      Indice := IndiceCondicao(Carregado.Condicoes, ocaTipoEmissao);
      Assert.IsTrue(Indice >= 0);
      Assert.AreEqual(1, Length(Carregado.Condicoes[Indice].Valores));
      Assert.AreEqual(1, Carregado.Condicoes[Indice].Valores[0]);

      Indice := IndiceCondicao(Carregado.Condicoes, ocaTipoOrgaoPublico);
      Assert.IsTrue(Indice >= 0);
      Assert.AreEqual(2, Length(Carregado.Condicoes[Indice].Valores));
      Assert.AreEqual(0, Carregado.Condicoes[Indice].Valores[0]);
      Assert.AreEqual(1, Carregado.Condicoes[Indice].Valores[1]);

      Assert.AreEqual(3, ContarCondicoes(Criado.Id));
    finally
      Carregado.Free;
    end;
  finally
    Criado.Free;
  end;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.DeveRetornarAgregadoAusenteSemObjetoParcial;
var
  Lista: OperacaoFiscalIbsCbsEtdList;
begin
  // Sem vinculo nao ha agregado: GetById devolve nil e a lista de candidatos
  // devolve colecao vazia (nunca um objeto parcial de carga).
  Assert.IsNull(FRepo.GetById('00000000-0000-0000-0000-000000000000'));

  Lista := FRepo.GetByOpInternaGrupoFiscal('', '', FEmpresaId, EncodeDate(2026, 1, 1));
  try
    Assert.IsNotNull(Lista);
    Assert.AreEqual(0, Lista.Count);
  finally
    Lista.Free;
  end;

  Lista := FRepo.GetByOpInternaGrupoFiscal(
    '00000000-0000-0000-0000-000000000000', '', FEmpresaId, EncodeDate(2026, 1, 1));
  try
    Assert.IsNotNull(Lista);
    Assert.AreEqual(0, Lista.Count);
  finally
    Lista.Free;
  end;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.DeveSubstituirCondicoesNoPut;
var
  Criado: OperacaoFiscalIbsCbsEtd;
  Carregado: OperacaoFiscalIbsCbsEtd;
  Salvo: OperacaoFiscalIbsCbsEtd;
begin
  Criado := CriarVinculo('', [FEmpresaId], Condicoes([
    Condicao(ocaTipoEmissao, [1]),
    Condicao(ocaNaturezaEmissao, [2])
  ]), EncodeDate(2026, 1, 1));
  try
    Carregado := FRepo.GetById(Criado.Id);
    try
      Carregado.Condicoes := Condicoes([
        Condicao(ocaTipoEmissao, [2])
      ]);
      Salvo := FRepo.Put(Carregado);
    finally
      Carregado.Free;
    end;
    Salvo.Free;

    Carregado := FRepo.GetById(Criado.Id);
    try
      Assert.AreEqual(1, Length(Carregado.Condicoes));
      Assert.IsTrue(Carregado.Condicoes[0].Atributo = ocaTipoEmissao);
      Assert.AreEqual(1, Length(Carregado.Condicoes[0].Valores));
      Assert.AreEqual(2, Carregado.Condicoes[0].Valores[0]);
      Assert.AreEqual(1, ContarCondicoes(Criado.Id));
    finally
      Carregado.Free;
    end;
  finally
    Criado.Free;
  end;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.DeveRemoverTodasAsCondicoesNoPut;
var
  Criado: OperacaoFiscalIbsCbsEtd;
  Carregado: OperacaoFiscalIbsCbsEtd;
  Salvo: OperacaoFiscalIbsCbsEtd;
begin
  Criado := CriarVinculo('', [FEmpresaId], Condicoes([
    Condicao(ocaTipoEmissao, [1])
  ]), EncodeDate(2026, 1, 1));
  try
    Carregado := FRepo.GetById(Criado.Id);
    try
      Carregado.Condicoes := Condicoes([]);
      Salvo := FRepo.Put(Carregado);
    finally
      Carregado.Free;
    end;
    Salvo.Free;

    Carregado := FRepo.GetById(Criado.Id);
    try
      Assert.AreEqual(0, Length(Carregado.Condicoes));
      Assert.AreEqual(0, ContarCondicoes(Criado.Id));
    finally
      Carregado.Free;
    end;
  finally
    Criado.Free;
  end;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.DeveCarregarEspecificoEPadraoFiltrandoEmpresaEVigencia;
var
  Especifico: OperacaoFiscalIbsCbsEtd;
  Padrao: OperacaoFiscalIbsCbsEtd;
  Lista: OperacaoFiscalIbsCbsEtdList;
  Indice: Integer;
begin
  Especifico := CriarVinculo(FGrupoFiscalId, [FEmpresaId], Condicoes([
    Condicao(ocaTipoEmissao, [1])
  ]), EncodeDate(2026, 1, 1));
  Padrao := CriarVinculo('', [FEmpresaId], Condicoes([
    Condicao(ocaNaturezaEmissao, [2])
  ]), EncodeDate(2026, 1, 1));
  try
    Lista := FRepo.GetByOpInternaGrupoFiscal(
      FOperacaoInternaId, FGrupoFiscalId, FEmpresaId, EncodeDate(2026, 3, 4));
    try
      Indice := IndiceVinculo(Lista, Especifico.Id);
      Assert.IsTrue(Indice >= 0);
      Assert.AreEqual(1, Length(OperacaoFiscalIbsCbsEtd(Lista[Indice]).Condicoes));

      Indice := IndiceVinculo(Lista, Padrao.Id);
      Assert.IsTrue(Indice >= 0);
      Assert.AreEqual(1, Length(OperacaoFiscalIbsCbsEtd(Lista[Indice]).Condicoes));
    finally
      Lista.Free;
    end;

    Lista := FRepo.GetByOpInternaGrupoFiscal(
      FOperacaoInternaId, FGrupoFiscalId, FOutraEmpresaId, EncodeDate(2026, 3, 4));
    try
      Assert.IsTrue(IndiceVinculo(Lista, Especifico.Id) < 0);
      Assert.IsTrue(IndiceVinculo(Lista, Padrao.Id) < 0);
    finally
      Lista.Free;
    end;

    Lista := FRepo.GetByOpInternaGrupoFiscal(
      FOperacaoInternaId, FGrupoFiscalId, FEmpresaId, EncodeDate(2025, 1, 1));
    try
      Assert.IsTrue(IndiceVinculo(Lista, Especifico.Id) < 0);
      Assert.IsTrue(IndiceVinculo(Lista, Padrao.Id) < 0);
    finally
      Lista.Free;
    end;
  finally
    Especifico.Free;
    Padrao.Free;
  end;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.DeveDesfazerTransacaoQuandoCondicaoViolarCheck;
var
  Entidade: OperacaoFiscalIbsCbsEtd;
  VinculosAntes: Integer;
  VinculosDepois: Integer;
  CondicoesAntes: Integer;
  CondicoesDepois: Integer;
begin
  Entidade := CriarEntidade('', [FEmpresaId], Condicoes([
    Condicao(ocaTipoEmissao, [7])
  ]), EncodeDate(2026, 1, 1));
  try
    VinculosAntes := ContarVinculos(FRegraFiscalId, EncodeDate(2026, 1, 1));
    CondicoesAntes := ContarCondicoesDoContexto(EncodeDate(2026, 1, 1));

    Assert.WillRaise(
      procedure
      begin
        FRepo.Post(Entidade);
      end,
      Exception
    );

    VinculosDepois := ContarVinculos(FRegraFiscalId, EncodeDate(2026, 1, 1));
    CondicoesDepois := ContarCondicoesDoContexto(EncodeDate(2026, 1, 1));

    Assert.AreEqual(VinculosAntes, VinculosDepois);
    Assert.AreEqual(CondicoesAntes, CondicoesDepois);
  finally
    Entidade.Free;
  end;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.DevePreservarAgregadoQuandoReinsercaoDeCondicoesFalhar;
var
  Criado: OperacaoFiscalIbsCbsEtd;
  Carregado: OperacaoFiscalIbsCbsEtd;
  Salvo: OperacaoFiscalIbsCbsEtd;
  Verificado: OperacaoFiscalIbsCbsEtd;
  Falhou: Boolean;
begin
  Criado := CriarVinculo('', [FEmpresaId], Condicoes([
    Condicao(ocaTipoEmissao, [1])
  ]), EncodeDate(2026, 1, 1));
  try
    Carregado := FRepo.GetById(Criado.Id);
    try
      // O Put remove as condicoes confirmadas e reinsere o novo conjunto na
      // mesma transacao; a violacao do CHECK na reinsercao deve desfazer
      // tambem a remocao.
      Carregado.Condicoes := Condicoes([
        Condicao(ocaTipoEmissao, [7])
      ]);

      Salvo := nil;
      Falhou := False;
      try
        Salvo := FRepo.Put(Carregado);
      except
        on E: Exception do
          Falhou := True;
      end;
      // Se o Put nao falhar, o retorno nao pode vazar nem servir de base para
      // as verificacoes seguintes.
      Salvo.Free;

      Assert.IsTrue(Falhou,
        'a reinsercao que viola o CHECK deve falhar e desfazer a transacao');
    finally
      Carregado.Free;
    end;

    Verificado := FRepo.GetById(Criado.Id);
    try
      Assert.IsNotNull(Verificado);
      Assert.AreEqual(1, Length(Verificado.Condicoes),
        'a falha na reinsercao nao pode destruir as condicoes confirmadas');
      Assert.IsTrue(Verificado.Condicoes[0].Atributo = ocaTipoEmissao);
      Assert.AreEqual(1, Length(Verificado.Condicoes[0].Valores));
      Assert.AreEqual(1, Verificado.Condicoes[0].Valores[0]);
      Assert.AreEqual(1, ContarCondicoes(Criado.Id));
    finally
      Verificado.Free;
    end;
  finally
    Criado.Free;
  end;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.DeveEliminarCondicoesNaExclusaoFisica;
var
  Criado: OperacaoFiscalIbsCbsEtd;
begin
  Criado := CriarVinculo('', [FEmpresaId], Condicoes([
    Condicao(ocaTipoEmissao, [1]),
    Condicao(ocaNaturezaEmissao, [1, 2])
  ]), EncodeDate(2026, 1, 1));
  try
    Assert.AreEqual(3, ContarCondicoes(Criado.Id));

    DeletarVinculoFisicamente(Criado.Id);

    Assert.AreEqual(0, ContarCondicoes(Criado.Id));
  finally
    Criado.Free;
  end;
end;

procedure TTestOperacoesFiscaisIbsCbsRepository.DevePreservarCondicoesNaExclusaoLogica;
var
  Criado: OperacaoFiscalIbsCbsEtd;
  Carregado: OperacaoFiscalIbsCbsEtd;
  Salvo: OperacaoFiscalIbsCbsEtd;
begin
  Criado := CriarVinculo('', [FEmpresaId], Condicoes([
    Condicao(ocaTipoEmissao, [2])
  ]), EncodeDate(2026, 1, 1));
  try
    Carregado := FRepo.GetById(Criado.Id);
    try
      Carregado.Ativo := saLixeira;
      Salvo := FRepo.Put(Carregado);
    finally
      Carregado.Free;
    end;

    try
      Assert.IsTrue(Salvo.Ativo = saLixeira);
      Assert.AreEqual(1, Length(Salvo.Condicoes));
      Assert.AreEqual(1, ContarCondicoes(Criado.Id));
    finally
      Salvo.Free;
    end;
  finally
    Criado.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestOperacoesFiscaisIbsCbsRepository);

end.
