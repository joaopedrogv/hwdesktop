unit Teste_NfseUseCases_ConsultarIndicadorOperacao;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  IIndicadorOperacaoRepositoryUnit,
  ConsultarIndicadorOperacaoUseCaseUnit,
  INbsRepositoryUnit,
  NbsEtdUnit,
  TipoComunsUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  BooleanNullableUnit,
  DateAndTimeNullableUnit,
  LocalIncidenciaEnumUnit,
  LocalFornecimentoEnumUnit;

type
  /// <summary>
  ///   Test double da porta IIndicadorOperacaoRepository para o fluxo de
  ///   consultar indicador de operacao. Distingue a consulta por NBS da
  ///   consulta geral por data, registrando o uso do fallback, e devolve linhas
  ///   no record v0042 (campos textuais e tipados de local de incidencia).
  /// </summary>
  TFakeIndicadorOperacaoRepository = class(IIndicadorOperacaoRepository)
  private
    FComNbs: IndicadoresOperacaoLinha;
    FSemNbs: IndicadoresOperacaoLinha;
    FChamouPorData: Boolean;
  public
    constructor Create(const ComNbs, SemNbs: IndicadoresOperacaoLinha); reintroduce;
    function ValidarCombinacaoExiste(
      const NbsCd: string;
      const CClassTrib: string;
      const CIndOp: string;
      const CTribNac: StringNullable;
      DataOcorrenciaFatoGerador: TDate
    ): Integer; override;
    function BuscarLocalOperacaoPorIndOp(
      const CIndOp: string; Data: TDate
    ): LocalOperacaoPorIndOpResultado; override;
    function BuscarIndicadorOperacaoPorData(
      Data: TDate
    ): IndicadoresOperacaoLinha; override;
    function BuscarIndicadorOperacaoPorDataComNbs(
      Data: TDate; const Nbs: string
    ): IndicadoresOperacaoLinha; override;
    function BuscarSituacoesClassificacoesPorNbsEData(
      const Nbs: string; Data: TDate
    ): SituacoesClassificacoesLinha; override;
    function BuscarSituacaoClassificacaoPorClassificacao(
      const CodigoClassificacaoTributaria: string; Data: TDate
    ): SituacaoClassificacaoLinha; override;

    property ChamouPorData: Boolean read FChamouPorData;
  end;

  TFakeNbsRepository = class(INbsRepository)
  private
    FNbs: NbsEtd;
  public
    constructor Create(const Nbs: NbsEtd); reintroduce;
    function ObterNbs(const Nbs: string; Data: TDate): NbsEtd; override;
  end;

  [TestFixture]
  TTeste_NfseUseCases_ConsultarIndicadorOperacao = class
  public
    [Test]
    procedure teste_NbsInexistente_LancaNbsNaoEncontrada;

    [Test]
    procedure teste_NbsExistente_RetornaListaComNbs;

    [Test]
    procedure teste_NbsExistenteSemVinculo_UsaFallbackPorData;

    [Test]
    procedure teste_NbsVazia_RetornaListaGeralPorData;

    /// <summary>
    ///   Fronteira de ausencia do output remapeado no I12: codigo de
    ///   fornecimento nulo, incidencia liUnassigned e booleanos nulos nao podem
    ///   virar 0 nem descricao espuria.
    /// </summary>
    [Test]
    procedure teste_LinhaSemCodigos_RemapeamentoNullSafeSemZero;
  end;

implementation

{ TFakeIndicadorOperacaoRepository }

constructor TFakeIndicadorOperacaoRepository.Create(const ComNbs, SemNbs: IndicadoresOperacaoLinha);
begin
  inherited Create(nil);
  FComNbs := ComNbs;
  FSemNbs := SemNbs;
  FChamouPorData := False;
end;

function TFakeIndicadorOperacaoRepository.ValidarCombinacaoExiste(
  const NbsCd: string;
  const CClassTrib: string;
  const CIndOp: string;
  const CTribNac: StringNullable;
  DataOcorrenciaFatoGerador: TDate
): Integer;
begin
  Result := 0;
end;

function TFakeIndicadorOperacaoRepository.BuscarLocalOperacaoPorIndOp(
  const CIndOp: string; Data: TDate
): LocalOperacaoPorIndOpResultado;
begin
  SetLength(Result, 0);
end;

function TFakeIndicadorOperacaoRepository.BuscarIndicadorOperacaoPorData(
  Data: TDate
): IndicadoresOperacaoLinha;
begin
  FChamouPorData := True;
  Result := FSemNbs;
end;

function TFakeIndicadorOperacaoRepository.BuscarIndicadorOperacaoPorDataComNbs(
  Data: TDate; const Nbs: string
): IndicadoresOperacaoLinha;
begin
  Result := FComNbs;
end;

function TFakeIndicadorOperacaoRepository.BuscarSituacoesClassificacoesPorNbsEData(
  const Nbs: string; Data: TDate
): SituacoesClassificacoesLinha;
begin
  SetLength(Result, 0);
end;

function TFakeIndicadorOperacaoRepository.BuscarSituacaoClassificacaoPorClassificacao(
  const CodigoClassificacaoTributaria: string; Data: TDate
): SituacaoClassificacaoLinha;
begin
  Result.Encontrada := False;
end;

{ TFakeNbsRepository }

constructor TFakeNbsRepository.Create(const Nbs: NbsEtd);
begin
  inherited Create(nil);
  FNbs := Nbs;
end;

function TFakeNbsRepository.ObterNbs(const Nbs: string; Data: TDate): NbsEtd;
begin
  Result := FNbs;
end;

{ Helpers }

function CriarLinha(
  const CIndOp: string;
  const TipoOperacao: string;
  const CodigoLocalFornecimento: IntegerNullable;
  const CodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia;
  const PrestacaoServicoOnerosa: BooleanNullable;
  const AdquirenteExterior: BooleanNullable
): IndicadorOperacaoLinha;
begin
  Result.CIndOp := CIndOp;
  Result.TipoOperacao := TipoOperacao;
  Result.CodigoLocalFornecimento := CodigoLocalFornecimento;
  // O texto bruto (IOIC_LOCAL_INCIDENCIA) e propositalmente divergente: o
  // output v0042 deriva a descricao do codigo tipado, como no Java, e ignora
  // esse campo para nao introduzir conteudo espurio.
  Result.LocalIncidencia := 'texto bruto legado ignorado';
  Result.CodigoLocalIncidencia := CodigoLocalIncidencia;
  Result.PrestacaoServicoOnerosa := PrestacaoServicoOnerosa;
  Result.AdquirenteExterior := AdquirenteExterior;
end;

{ TTeste_NfseUseCases_ConsultarIndicadorOperacao }

procedure TTeste_NfseUseCases_ConsultarIndicadorOperacao.teste_NbsInexistente_LancaNbsNaoEncontrada;
var
  repo: TFakeIndicadorOperacaoRepository;
  nbsRepo: TFakeNbsRepository;
  uc: ConsultarIndicadorOperacaoUseCase;
begin
  repo := TFakeIndicadorOperacaoRepository.Create(nil, nil);
  nbsRepo := TFakeNbsRepository.Create(nil);
  try
    uc := ConsultarIndicadorOperacaoUseCase.Create(repo, nbsRepo);
    try
      Assert.WillRaise(
        procedure
        begin
          uc.Executar(EncodeDate(2026, 1, 1), '90116000');
        end,
        Exception,
        'NBS inexistente deve lancar excecao');
    finally
      uc.Free;
    end;
  finally
    nbsRepo.Free;
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ConsultarIndicadorOperacao.teste_NbsExistente_RetornaListaComNbs;
var
  repo: TFakeIndicadorOperacaoRepository;
  nbsRepo: TFakeNbsRepository;
  uc: ConsultarIndicadorOperacaoUseCase;
  nbs: NbsEtd;
  comNbs: IndicadoresOperacaoLinha;
  result: NfseIndicadoresOperacaoOutput;
begin
  nbs := NbsEtd.Create('90116000', 'desc', StringNullable.NullInstance(), EncodeDate(2020, 1, 1), DateNullable.NullInstance());
  SetLength(comNbs, 1);
  comNbs[0] := CriarLinha(
    '100301',
    'Demais serviços, em operações onerosas',
    IntegerNullable.Create(11),
    liEnderecoTomadorAdquirente,
    BooleanNullable.Create(True),
    BooleanNullable.Create(False));

  repo := TFakeIndicadorOperacaoRepository.Create(comNbs, nil);
  nbsRepo := TFakeNbsRepository.Create(nbs);
  try
    uc := ConsultarIndicadorOperacaoUseCase.Create(repo, nbsRepo);
    try
      result := uc.Executar(EncodeDate(2026, 1, 1), '90116000');
      Assert.AreEqual(1, Length(result), 'Deve retornar a lista com NBS');
      Assert.AreEqual('100301', result[0].CIndOp);
      Assert.AreEqual('Demais serviços, em operações onerosas', result[0].TipoOperacao);

      Assert.IsTrue(result[0].CodigoLocalFornecimento.HasValue,
        'Codigo de fornecimento presente');
      Assert.AreEqual(11, result[0].CodigoLocalFornecimento.Value,
        'Codigo de fornecimento deve ser 11');
      Assert.AreEqual(LocalFornecimentoDescricaoPorCodigo(11), result[0].LocalFornecimento,
        'Descricao deve vir do enum LocalFornecimento');

      Assert.AreEqual(Integer(liEnderecoTomadorAdquirente), Integer(result[0].CodigoLocalIncidencia),
        'Codigo de incidencia deve corresponder a 2');
      Assert.AreEqual('Endereço do Tomador/Adquirente', result[0].LocalIncidencia,
        'Descricao deve vir do enum LocalIncidencia, nao do texto bruto');

      Assert.IsFalse(result[0].PrestacaoServicoOnerosa.IsNull,
        'prestacaoServicoOnerosa informada nao deve ser nula');
      Assert.IsTrue(result[0].PrestacaoServicoOnerosa.Value,
        'prestacaoServicoOnerosa deve ser propagada');
      Assert.IsFalse(result[0].AdquirenteExterior.IsNull,
        'adquirenteExterior informado nao deve ser nulo');
      Assert.IsFalse(result[0].AdquirenteExterior.Value,
        'adquirenteExterior deve ser propagado');

      Assert.IsFalse(repo.ChamouPorData, 'Nao deve chamar fallback por data quando ha vinculo');
    finally
      uc.Free;
    end;
  finally
    nbs.Free;
    nbsRepo.Free;
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ConsultarIndicadorOperacao.teste_NbsExistenteSemVinculo_UsaFallbackPorData;
var
  repo: TFakeIndicadorOperacaoRepository;
  nbsRepo: TFakeNbsRepository;
  uc: ConsultarIndicadorOperacaoUseCase;
  nbs: NbsEtd;
  semNbs: IndicadoresOperacaoLinha;
  result: NfseIndicadoresOperacaoOutput;
begin
  nbs := NbsEtd.Create('90116000', 'desc', StringNullable.NullInstance(), EncodeDate(2020, 1, 1), DateNullable.NullInstance());
  SetLength(semNbs, 1);
  semNbs[0] := CriarLinha(
    '100302',
    'IO2',
    IntegerNullable.Create(2),
    liEnderecoDestinatario,
    BooleanNullable.NullInstance(),
    BooleanNullable.NullInstance());

  repo := TFakeIndicadorOperacaoRepository.Create(nil, semNbs);
  nbsRepo := TFakeNbsRepository.Create(nbs);
  try
    uc := ConsultarIndicadorOperacaoUseCase.Create(repo, nbsRepo);
    try
      result := uc.Executar(EncodeDate(2026, 1, 1), '90116000');
      Assert.AreEqual(1, Length(result), 'Deve retornar o fallback por data');
      Assert.AreEqual('100302', result[0].CIndOp);
      Assert.AreEqual(2, result[0].CodigoLocalFornecimento.Value,
        'Codigo de fornecimento do fallback deve ser propagado');
      Assert.AreEqual(Integer(liEnderecoDestinatario), Integer(result[0].CodigoLocalIncidencia),
        'Codigo de incidencia do fallback deve ser propagado');
      Assert.IsTrue(repo.ChamouPorData, 'Deve chamar fallback por data quando nao ha vinculo');
    finally
      uc.Free;
    end;
  finally
    nbs.Free;
    nbsRepo.Free;
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ConsultarIndicadorOperacao.teste_NbsVazia_RetornaListaGeralPorData;
var
  repo: TFakeIndicadorOperacaoRepository;
  nbsRepo: TFakeNbsRepository;
  uc: ConsultarIndicadorOperacaoUseCase;
  semNbs: IndicadoresOperacaoLinha;
  result: NfseIndicadoresOperacaoOutput;
begin
  SetLength(semNbs, 1);
  semNbs[0] := CriarLinha(
    '100303',
    'IO3',
    IntegerNullable.Create(3),
    liLocalidadeImovel,
    BooleanNullable.NullInstance(),
    BooleanNullable.NullInstance());

  repo := TFakeIndicadorOperacaoRepository.Create(nil, semNbs);
  nbsRepo := TFakeNbsRepository.Create(nil);
  try
    uc := ConsultarIndicadorOperacaoUseCase.Create(repo, nbsRepo);
    try
      result := uc.Executar(EncodeDate(2026, 1, 1), '');
      Assert.AreEqual(1, Length(result), 'Sem NBS deve retornar a lista geral por data');
      Assert.AreEqual('100303', result[0].CIndOp);
      Assert.AreEqual(3, result[0].CodigoLocalFornecimento.Value,
        'Codigo de fornecimento deve ser propagado');
      Assert.AreEqual(Integer(liLocalidadeImovel), Integer(result[0].CodigoLocalIncidencia),
        'Codigo de incidencia deve ser propagado');
      Assert.AreEqual('Localidade do Imóvel', result[0].LocalIncidencia,
        'Descricao deve vir do enum LocalIncidencia');
    finally
      uc.Free;
    end;
  finally
    nbsRepo.Free;
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ConsultarIndicadorOperacao.teste_LinhaSemCodigos_RemapeamentoNullSafeSemZero;
var
  repo: TFakeIndicadorOperacaoRepository;
  nbsRepo: TFakeNbsRepository;
  uc: ConsultarIndicadorOperacaoUseCase;
  semNbs: IndicadoresOperacaoLinha;
  result: NfseIndicadoresOperacaoOutput;
begin
  // Linha presente com fornecimento SQL NULL, incidencia liUnassigned e
  // booleanos nulos: o remapeamento nao pode produzir codigo 0 nem descricao.
  SetLength(semNbs, 1);
  semNbs[0] := CriarLinha(
    '100304',
    'IO4',
    IntegerNullable.NullInstance(),
    liUnassigned,
    BooleanNullable.NullInstance(),
    BooleanNullable.NullInstance());

  repo := TFakeIndicadorOperacaoRepository.Create(nil, semNbs);
  nbsRepo := TFakeNbsRepository.Create(nil);
  try
    uc := ConsultarIndicadorOperacaoUseCase.Create(repo, nbsRepo);
    try
      result := uc.Executar(EncodeDate(2026, 1, 1), '');
      Assert.AreEqual(1, Length(result), 'Linha sem codigos ainda deve ser retornada');
      Assert.AreEqual('100304', result[0].CIndOp);

      Assert.IsTrue(result[0].CodigoLocalFornecimento.IsNull,
        'Fornecimento ausente deve permanecer nulo, nunca 0');
      Assert.AreEqual('', result[0].LocalFornecimento,
        'Fornecimento ausente nao deve ter descricao');

      Assert.AreEqual(Integer(liUnassigned), Integer(result[0].CodigoLocalIncidencia),
        'Incidencia ausente deve permanecer liUnassigned');
      Assert.AreEqual('', result[0].LocalIncidencia,
        'Incidencia ausente nao deve ter descricao');

      Assert.IsTrue(result[0].PrestacaoServicoOnerosa.IsNull,
        'prestacaoServicoOnerosa ausente deve permanecer nula');
      Assert.IsTrue(result[0].AdquirenteExterior.IsNull,
        'adquirenteExterior ausente deve permanecer nulo');
    finally
      uc.Free;
    end;
  finally
    nbsRepo.Free;
    repo.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_NfseUseCases_ConsultarIndicadorOperacao);

end.
