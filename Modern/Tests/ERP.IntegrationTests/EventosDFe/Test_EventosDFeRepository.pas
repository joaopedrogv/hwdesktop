unit Test_EventosDFeRepository;

interface

uses
  DUnitX.TestFramework,
  Classes,
  ConfigurationTestUnit,
  IDataBaseConnectionUnit,
  EventoDFeEtdUnit,
  EventoDFe211130ItemEtdUnit,
  EventosDFeRepositoryUnit,
  EventoDFe112150RepositoryUnit,
  EventoDFe211130RepositoryUnit,
  TipoEventoDFeUnit;

type
  [TestFixture]
  TTestEventosDFeRepository = class
  private
    FConnection: IDataBaseConnection;
    FConfig: ConfigurationTest;
    FEventosRepo: EventosDFeRepository;
    FRepo112150: EventoDFe112150Repository;
    FRepo211130: EventoDFe211130Repository;
    FCriados: TStringList;
    FEmpresaId: Integer;
    FOutraEmpresaId: Integer;
    procedure CarregarEmpresas;
    procedure VerificarTabelas;
    function ProximoSeqId: Integer;
    function InserirBase(ATipoEvento: TipoEventoDFe): EventoDFeEtd;
    function CriarEvento112150(ADataPrevisao: TDate): EventoDFeEtd;
    function CriarEvento211130(
      const AItens: EventoDFe211130ItemEtdArray): EventoDFeEtd;
    procedure RegistrarParaLimpeza(const AId: string);
    procedure LimparCriados;
    function ContarItens(const AEventoId: string): Integer;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveInserirELerEvento112150;

    [Test]
    procedure DeveInserirELerEvento211130ComItensOrdenados;

    [Test]
    procedure DeveSubstituirItensNaAlteracao;

    [Test]
    procedure DeveExcluirLogicamenteEPreservarDadosEspecificos;

    [Test]
    procedure DeveRestaurarRegistroNaLixeira;

    [Test]
    procedure DeveRestringirLeituraAEmpresa;

    [Test]
    procedure DeveDesfazerTransacaoAoViolarCheck;

    [Test]
    procedure DeveEliminarFilhosNaExclusaoFisica;

    [Test]
    procedure DeveGarantirSeqIdPorEmpresaEUnicidade;
  end;

implementation

uses
  SysUtils,
  StatusRegistroEnumUnit,
  ParameterValueUnit,
  ITransactionUnit,
  SetupTestUnit;

const
  CHAVE_INTEGRACAO = '11111111111111111111111111111111111111111111';
  DATA_PREVISAO = 45000;
  ID_ITEM_1 = '00000000-0000-0000-0000-000000000001';
  ID_ITEM_2 = '00000000-0000-0000-0000-000000000002';
  ID_ITEM_5 = '00000000-0000-0000-0000-000000000005';
  ID_ITEM_INVALIDO = '00000000-0000-0000-0000-000000000000';

function Item(const AId: string; ANItem: Integer;
  const AUImobilizado: string): EventoDFe211130ItemEtd;
begin
  Result := EventoDFe211130ItemEtd.Create(AId, ANItem, 1, 2, 10, AUImobilizado);
end;

function Itens(const AItens: array of EventoDFe211130ItemEtd):
  EventoDFe211130ItemEtdArray;
var
  I: Integer;
begin
  SetLength(Result, Length(AItens));

  for I := 0 to High(AItens) do
    Result[I] := AItens[I];
end;

{ TTestEventosDFeRepository }

procedure TTestEventosDFeRepository.Setup;
begin
  ModernInitialize();

  FConfig := GetConfig();

  // A escrita ocorre apenas no banco de teste; nunca no banco operacional
  // conectado por ModernInitialize.
  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True',
      [FConfig.DatabaseNameSinc]));

  FConnection := AppSetup.DatabaseConnection;
  FEventosRepo := EventosDFeRepository.Create(FConnection);
  FRepo112150 := EventoDFe112150Repository.Create(FConnection);
  FRepo211130 := EventoDFe211130Repository.Create(FConnection);
  FCriados := TStringList.Create;

  VerificarTabelas;
  CarregarEmpresas;
end;

procedure TTestEventosDFeRepository.TearDown;
begin
  LimparCriados;
  FCriados.Free;

  FRepo211130.Free;
  FRepo112150.Free;
  FEventosRepo.Free;

  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True',
      [FConfig.DatabaseName]));

  ModernShutDown();
end;

procedure TTestEventosDFeRepository.VerificarTabelas;
begin
  try
    FConnection.ExecuteScalar('SELECT COUNT(*) FROM EVENTOS_DFE');
    FConnection.ExecuteScalar('SELECT COUNT(*) FROM EVENTOS_DFE_112150');
    FConnection.ExecuteScalar('SELECT COUNT(*) FROM EVENTOS_DFE_211130_ITEM');
  except
    on E: Exception do
      raise Exception.Create(
        'Pre-requisito ausente no banco de teste: as tabelas de Eventos DF-e ' +
        'nao estao disponiveis. Aplique a migracao eventos-dfe-consulta-cadastro ' +
        'antes de executar a integracao. Detalhe: ' + E.Message);
  end;
end;

procedure TTestEventosDFeRepository.CarregarEmpresas;
begin
  FEmpresaId := FConnection.ExecuteScalar(
    'SELECT FIRST 1 COD_EMPRESA FROM EMPRESA').AsInteger;
  FOutraEmpresaId := FConnection.ExecuteScalar(
    'SELECT FIRST 1 COD_EMPRESA FROM EMPRESA WHERE COD_EMPRESA <> :COD_EMPRESA',
    ParametersBuilder.Create(1)
      .ByName('COD_EMPRESA', FEmpresaId)
      .Build()).AsInteger;

  if (FEmpresaId <= 0) or (FOutraEmpresaId <= 0) then
    raise Exception.Create(
      'Pre-requisitos ausentes no banco de teste: empresa e segunda empresa ' +
      '(EMPRESA). Os testes de integracao nao podem ser considerados executados.');
end;

function TTestEventosDFeRepository.ProximoSeqId: Integer;
begin
  Result := FConnection.ExecuteScalar(
    'SELECT COALESCE(MAX(SEQID), 0) + 1 FROM EVENTOS_DFE ' +
    ' WHERE COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(1)
      .ByName('COD_EMPRESA', FEmpresaId)
      .Build()).AsInteger;
end;

function TTestEventosDFeRepository.InserirBase(
  ATipoEvento: TipoEventoDFe): EventoDFeEtd;
var
  Base: EventoDFeEtd;
begin
  Base := EventoDFeEtd.Create(
    '',
    ProximoSeqId,
    fdNFe,
    ATipoEvento,
    CHAVE_INTEGRACAO,
    FEmpresaId,
    saAtivo,
    0,
    0
  );
  try
    Result := FEventosRepo.Inserir(Base);
  finally
    Base.Free;
  end;
end;

function TTestEventosDFeRepository.CriarEvento112150(
  ADataPrevisao: TDate): EventoDFeEtd;
var
  Transacao: ITransaction;
begin
  Transacao := FConnection.BeginTransaction();
  try
    try
      Result := InserirBase(teAtualizacaoPrevisaoEntrega);
      try
        FRepo112150.Inserir(Result.Id, ADataPrevisao);
      except
        Result.Free;
        raise;
      end;

      Transacao.Commit();
    except
      Transacao.Rollback();
      raise;
    end;
  finally
    Transacao.Free;
  end;

  RegistrarParaLimpeza(Result.Id);
end;

function TTestEventosDFeRepository.CriarEvento211130(
  const AItens: EventoDFe211130ItemEtdArray): EventoDFeEtd;
var
  Transacao: ITransaction;
begin
  Transacao := FConnection.BeginTransaction();
  try
    try
      Result := InserirBase(teImobilizacaoItem);
      try
        FRepo211130.SubstituirItens(Result.Id, AItens);
      except
        Result.Free;
        raise;
      end;

      Transacao.Commit();
    except
      Transacao.Rollback();
      raise;
    end;
  finally
    Transacao.Free;
  end;

  RegistrarParaLimpeza(Result.Id);
end;

procedure TTestEventosDFeRepository.RegistrarParaLimpeza(const AId: string);
begin
  FCriados.Add(AId);
end;

procedure TTestEventosDFeRepository.LimparCriados;
var
  Transacao: ITransaction;
  I: Integer;
begin
  if FCriados.Count = 0 then
    Exit;

  Transacao := FConnection.BeginTransaction();
  try
    try
      for I := 0 to FCriados.Count - 1 do
        FConnection.ExecuteCommand(
          'DELETE FROM EVENTOS_DFE WHERE ID = :ID',
          ParametersBuilder.Create(1)
            .ByName('ID', FCriados[I])
            .Build());

      Transacao.Commit();
    except
      Transacao.Rollback();
      raise;
    end;
  finally
    Transacao.Free;
  end;
end;

function TTestEventosDFeRepository.ContarItens(const AEventoId: string): Integer;
begin
  Result := FConnection.ExecuteScalar(
    'SELECT COUNT(*) FROM EVENTOS_DFE_211130_ITEM WHERE EVENTO_DFE_ID = :ID',
    ParametersBuilder.Create(1).ByName('ID', AEventoId).Build()).AsInteger;
end;

procedure TTestEventosDFeRepository.DeveInserirELerEvento112150;
var
  Criado: EventoDFeEtd;
  Carregado: EventoDFeEtd;
  DataPrevisao: TDate;
begin
  Criado := CriarEvento112150(DATA_PREVISAO);
  try
    Carregado := FEventosRepo.ObterPorId(Criado.Id, FEmpresaId);
    try
      Assert.IsNotNull(Carregado);
      Assert.AreEqual(Criado.SeqId, Carregado.SeqId);
      Assert.AreEqual(CHAVE_INTEGRACAO, Carregado.ChaveDocumento);
      Assert.IsTrue(Carregado.Ativo = saAtivo);
      Assert.IsTrue(FRepo112150.ObterDataPrevisao(Criado.Id, DataPrevisao));
      Assert.IsTrue(DataPrevisao = DATA_PREVISAO);
    finally
      Carregado.Free;
    end;
  finally
    Criado.Free;
  end;
end;

procedure TTestEventosDFeRepository.DeveInserirELerEvento211130ComItensOrdenados;
var
  Criado: EventoDFeEtd;
  ItensLidos: EventoDFe211130ItemEtdArray;
begin
  Criado := CriarEvento211130(Itens([Item(ID_ITEM_2, 2, 'CX'), Item(ID_ITEM_1, 1, 'UN')]));
  try
    ItensLidos := FRepo211130.ObterItens(Criado.Id);

    Assert.AreEqual(2, Length(ItensLidos));
    Assert.AreEqual(ID_ITEM_1, ItensLidos[0].Id);
    Assert.AreEqual(1, ItensLidos[0].NItem);
    Assert.AreEqual(ID_ITEM_2, ItensLidos[1].Id);
    Assert.AreEqual(2, ItensLidos[1].NItem);
    Assert.AreEqual(2, ContarItens(Criado.Id));
  finally
    Criado.Free;
  end;
end;

procedure TTestEventosDFeRepository.DeveSubstituirItensNaAlteracao;
var
  Criado: EventoDFeEtd;
  Transacao: ITransaction;
  ItensLidos: EventoDFe211130ItemEtdArray;
begin
  Criado := CriarEvento211130(Itens([Item(ID_ITEM_1, 1, 'UN'), Item(ID_ITEM_2, 2, 'CX')]));
  try
    Transacao := FConnection.BeginTransaction();
    try
      try
        FRepo211130.SubstituirItens(Criado.Id, Itens([Item(ID_ITEM_5, 5, 'KG')]));
        Transacao.Commit();
      except
        Transacao.Rollback();
        raise;
      end;
    finally
      Transacao.Free;
    end;

    ItensLidos := FRepo211130.ObterItens(Criado.Id);

    Assert.AreEqual(1, Length(ItensLidos));
    Assert.AreEqual(ID_ITEM_5, ItensLidos[0].Id);
    Assert.AreEqual(5, ItensLidos[0].NItem);
    Assert.AreEqual('KG', ItensLidos[0].UImobilizado);
    Assert.AreEqual(1, ContarItens(Criado.Id));
  finally
    Criado.Free;
  end;
end;

procedure TTestEventosDFeRepository.DeveExcluirLogicamenteEPreservarDadosEspecificos;
var
  Criado: EventoDFeEtd;
  Carregado: EventoDFeEtd;
  Transacao: ITransaction;
  DataPrevisao: TDate;
begin
  Criado := CriarEvento112150(DATA_PREVISAO);
  try
    Transacao := FConnection.BeginTransaction();
    try
      try
        FEventosRepo.RemoverLogicamente(Criado.Id, FEmpresaId);
        Transacao.Commit();
      except
        Transacao.Rollback();
        raise;
      end;
    finally
      Transacao.Free;
    end;

    Carregado := FEventosRepo.ObterPorId(Criado.Id, FEmpresaId);
    try
      Assert.IsNotNull(Carregado);
      Assert.IsTrue(Carregado.Ativo = saLixeira);
      Assert.IsTrue(FRepo112150.ObterDataPrevisao(Criado.Id, DataPrevisao));
      Assert.IsTrue(DataPrevisao = DATA_PREVISAO);
    finally
      Carregado.Free;
    end;
  finally
    Criado.Free;
  end;
end;

procedure TTestEventosDFeRepository.DeveRestaurarRegistroNaLixeira;
var
  Criado: EventoDFeEtd;
  Carregado: EventoDFeEtd;
  Atualizado: EventoDFeEtd;
  Transacao: ITransaction;
begin
  Criado := CriarEvento112150(DATA_PREVISAO);
  try
    Transacao := FConnection.BeginTransaction();
    try
      try
        FEventosRepo.RemoverLogicamente(Criado.Id, FEmpresaId);
        Transacao.Commit();
      except
        Transacao.Rollback();
        raise;
      end;
    finally
      Transacao.Free;
    end;

    Carregado := FEventosRepo.ObterPorId(Criado.Id, FEmpresaId);
    try
      Carregado.Ativo := saAtivo;

      Transacao := FConnection.BeginTransaction();
      try
        try
          Atualizado := FEventosRepo.Atualizar(Carregado);
          Transacao.Commit();
        except
          Transacao.Rollback();
          raise;
        end;
      finally
        Transacao.Free;
      end;
    finally
      Carregado.Free;
    end;

    try
      Assert.IsTrue(Atualizado.Ativo = saAtivo);
    finally
      Atualizado.Free;
    end;

    Carregado := FEventosRepo.ObterPorId(Criado.Id, FEmpresaId);
    try
      Assert.IsNotNull(Carregado);
      Assert.IsTrue(Carregado.Ativo = saAtivo);
    finally
      Carregado.Free;
    end;
  finally
    Criado.Free;
  end;
end;

procedure TTestEventosDFeRepository.DeveRestringirLeituraAEmpresa;
var
  Criado: EventoDFeEtd;
begin
  Criado := CriarEvento112150(DATA_PREVISAO);
  try
    Assert.IsNull(FEventosRepo.ObterPorId(Criado.Id, FOutraEmpresaId));
  finally
    Criado.Free;
  end;
end;

procedure TTestEventosDFeRepository.DeveDesfazerTransacaoAoViolarCheck;
var
  Header: EventoDFeEtd;
  Transacao: ITransaction;
  Id: string;
  Falhou: Boolean;
begin
  Id := '';
  Falhou := False;
  Transacao := FConnection.BeginTransaction();
  try
    try
      Header := InserirBase(teImobilizacaoItem);
      try
        Id := Header.Id;
        FRepo211130.SubstituirItens(Id, Itens([Item(ID_ITEM_INVALIDO, 0, 'UN')]));
      finally
        Header.Free;
      end;
    except
      on E: Exception do
        Falhou := True;
    end;

    if Falhou then
      Transacao.Rollback()
    else
      Transacao.Commit();
  finally
    Transacao.Free;
  end;

  Assert.IsTrue(Falhou, 'a violacao do CHECK deve desfazer a transacao');

  if not Falhou then
    RegistrarParaLimpeza(Id);

  Assert.IsNull(FEventosRepo.ObterPorId(Id, FEmpresaId),
    'nenhum agregado parcial pode permanecer gravado');
end;

procedure TTestEventosDFeRepository.DeveEliminarFilhosNaExclusaoFisica;
var
  Criado: EventoDFeEtd;
  Transacao: ITransaction;
  DataPrevisao: TDate;
begin
  Criado := CriarEvento211130(Itens([Item(ID_ITEM_1, 1, 'UN'), Item(ID_ITEM_2, 2, 'CX')]));
  try
    Assert.AreEqual(2, ContarItens(Criado.Id));

    Transacao := FConnection.BeginTransaction();
    try
      try
        FConnection.ExecuteCommand(
          'DELETE FROM EVENTOS_DFE WHERE ID = :ID',
          ParametersBuilder.Create(1).ByName('ID', Criado.Id).Build());
        Transacao.Commit();
      except
        Transacao.Rollback();
        raise;
      end;
    finally
      Transacao.Free;
    end;

    FCriados.Clear;

    Assert.AreEqual(0, ContarItens(Criado.Id));
    Assert.IsFalse(FRepo112150.ObterDataPrevisao(Criado.Id, DataPrevisao));
    Assert.IsNull(FEventosRepo.ObterPorId(Criado.Id, FEmpresaId));
  finally
    Criado.Free;
  end;
end;

procedure TTestEventosDFeRepository.DeveGarantirSeqIdPorEmpresaEUnicidade;
var
  Esperado: Integer;
  Criado: EventoDFeEtd;
  Base: EventoDFeEtd;
  Header: EventoDFeEtd;
  Transacao: ITransaction;
  Falhou: Boolean;
begin
  Esperado := ProximoSeqId;
  Assert.AreEqual(Esperado, FEventosRepo.ObterProximoSeqId(FEmpresaId));

  Criado := CriarEvento112150(DATA_PREVISAO);
  try
    Assert.AreEqual(Esperado, Criado.SeqId);
    Assert.AreEqual(Esperado + 1, FEventosRepo.ObterProximoSeqId(FEmpresaId));

    Base := EventoDFeEtd.Create(
      '', Criado.SeqId, fdNFe, teAtualizacaoPrevisaoEntrega, CHAVE_INTEGRACAO,
      FEmpresaId, saAtivo, 0, 0);
    try
      Header := nil;
      Falhou := False;
      Transacao := FConnection.BeginTransaction();
      try
        try
          Header := FEventosRepo.Inserir(Base);
        except
          on E: Exception do
            Falhou := True;
        end;

        if Falhou then
          Transacao.Rollback()
        else
          Transacao.Commit();
      finally
        Transacao.Free;
      end;

      if not Falhou then
        RegistrarParaLimpeza(Header.Id);

      Assert.IsTrue(Falhou,
        'a UNQ_EVENTOS_DFE_SEQ deve impedir o SeqID repetido na empresa');
    finally
      Header.Free;
      Base.Free;
    end;
  finally
    Criado.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestEventosDFeRepository);

end.
