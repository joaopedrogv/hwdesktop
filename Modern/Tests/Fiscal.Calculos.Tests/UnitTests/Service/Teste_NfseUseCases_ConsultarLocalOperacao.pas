unit Teste_NfseUseCases_ConsultarLocalOperacao;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  IIndicadorOperacaoRepositoryUnit,
  ConsultarLocalOperacaoUseCaseUnit,
  TipoComunsUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  LocalIncidenciaEnumUnit,
  LocalFornecimentoEnumUnit;

type
  /// <summary>
  ///   Test double da porta IIndicadorOperacaoRepository para o fluxo de
  ///   consultar local de operacao. Devolve o par tipado
  ///   {codigo de local de fornecimento, codigo de local de incidencia} com
  ///   Result[0] como a linha, espelhando buscarLocalOperacaoPorIndOp v0042.
  ///   Tambem registra os parametros recebidos para conferir o eco de cIndOp e
  ///   data exigido pelo teste oficial Teste_nfse_2_consultarLocalOperacao.
  /// </summary>
  TFakeIndicadorOperacaoRepository = class(IIndicadorOperacaoRepository)
  private
    FLocalOperacao: LocalOperacaoPorIndOpResultado;
    FCIndOpRecebido: string;
    FDataRecebida: TDate;
    FChamouBuscarLocalOperacao: Boolean;
  public
    constructor Create(const LocalOperacao: LocalOperacaoPorIndOpResultado); reintroduce;
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

    property CIndOpRecebido: string read FCIndOpRecebido;
    property DataRecebida: TDate read FDataRecebida;
    property ChamouBuscarLocalOperacao: Boolean read FChamouBuscarLocalOperacao;
  end;

  [TestFixture]
  TTeste_NfseUseCases_ConsultarLocalOperacao = class
  public
    /// <summary>
    ///   Cenario 200 do teste oficial: o indicador existe e o par devolvido
    ///   expoe codigo/descricao de local de fornecimento e de incidencia, alem
    ///   do eco dos parametros informados.
    /// </summary>
    [Test]
    procedure teste_LocalOperacaoEncontrado_RetornaCodigosEDescricoes;

    /// <summary>
    ///   Cenario 404 do teste oficial: sem linha vigente, o caso de uso lanca
    ///   EIndicadorOperacaoNaoEncontrado.
    /// </summary>
    [Test]
    procedure teste_LocalOperacaoNaoEncontrado_LancaIndicadorOperacaoNaoEncontrado;

    /// <summary>
    ///   Fronteira de ausencia aprovada: linha existente com fornecimento SQL
    ///   NULL e incidencia liUnassigned permanece ausente, sem virar 0 e sem
    ///   descricao espuria.
    /// </summary>
    [Test]
    procedure teste_LocalOperacaoSemCodigos_RetornaAusenciaSemZero;
  end;

implementation

{ TFakeIndicadorOperacaoRepository }

constructor TFakeIndicadorOperacaoRepository.Create(const LocalOperacao: LocalOperacaoPorIndOpResultado);
begin
  inherited Create(nil);
  FLocalOperacao := LocalOperacao;
  FCIndOpRecebido := '';
  FDataRecebida := 0;
  FChamouBuscarLocalOperacao := False;
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
  FChamouBuscarLocalOperacao := True;
  FCIndOpRecebido := CIndOp;
  FDataRecebida := Data;
  Result := FLocalOperacao;
end;

function TFakeIndicadorOperacaoRepository.BuscarIndicadorOperacaoPorData(
  Data: TDate
): IndicadoresOperacaoLinha;
begin
  SetLength(Result, 0);
end;

function TFakeIndicadorOperacaoRepository.BuscarIndicadorOperacaoPorDataComNbs(
  Data: TDate; const Nbs: string
): IndicadoresOperacaoLinha;
begin
  SetLength(Result, 0);
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

{ TTeste_NfseUseCases_ConsultarLocalOperacao }

procedure TTeste_NfseUseCases_ConsultarLocalOperacao.teste_LocalOperacaoEncontrado_RetornaCodigosEDescricoes;
var
  repo: TFakeIndicadorOperacaoRepository;
  uc: ConsultarLocalOperacaoUseCase;
  output: NfseLocalOperacaoOutput;
  localOperacao: LocalOperacaoPorIndOpResultado;
begin
  // Par alinhado ao Java v0042: Result[0] e a linha com o codigo de
  // fornecimento (11) e o codigo de incidencia (2 = endereco do
  // tomador/adquirente), como no exemplo oficial do endpoint.
  SetLength(localOperacao, 1);
  localOperacao[0].CodigoLocalFornecimento := IntegerNullable.Create(11);
  localOperacao[0].CodigoLocalIncidencia := liEnderecoTomadorAdquirente;

  repo := TFakeIndicadorOperacaoRepository.Create(localOperacao);
  try
    uc := ConsultarLocalOperacaoUseCase.Create(repo);
    try
      output := uc.Executar('100301', EncodeDate(2026, 1, 1));

      // Eco dos parametros: valores exigidos pelo cenario de sucesso oficial.
      Assert.AreEqual('100301', output.CIndOp, 'Deve ecoar o codigo do indicador');
      Assert.IsTrue(output.DataOcorrenciaFatoGerador = EncodeDate(2026, 1, 1),
        'Deve ecoar a data do fato gerador');
      Assert.IsTrue(repo.ChamouBuscarLocalOperacao,
        'O caso de uso deve consultar o par na porta');
      Assert.AreEqual('100301', repo.CIndOpRecebido,
        'A porta deve receber o cIndOp informado');
      Assert.IsTrue(repo.DataRecebida = EncodeDate(2026, 1, 1),
        'A porta deve receber a data informada');

      // Codigo e descricao de fornecimento.
      Assert.IsTrue(output.CodigoLocalFornecimento.HasValue,
        'Codigo de fornecimento presente');
      Assert.AreEqual(11, output.CodigoLocalFornecimento.Value,
        'Codigo de fornecimento deve ser 11');
      Assert.AreEqual(LocalFornecimentoDescricaoPorCodigo(11), output.LocalFornecimento,
        'Descricao deve vir do enum LocalFornecimento');

      // Codigo e descricao de incidencia.
      Assert.AreEqual(Integer(liEnderecoTomadorAdquirente),
        Integer(output.CodigoLocalIncidencia),
        'Codigo de incidencia deve corresponder a 2');
      Assert.AreEqual('Endereço do Tomador/Adquirente', output.LocalIncidencia,
        'Descricao deve vir do enum LocalIncidencia');
    finally
      uc.Free;
    end;
  finally
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ConsultarLocalOperacao.teste_LocalOperacaoNaoEncontrado_LancaIndicadorOperacaoNaoEncontrado;
var
  repo: TFakeIndicadorOperacaoRepository;
  uc: ConsultarLocalOperacaoUseCase;
  localOperacao: LocalOperacaoPorIndOpResultado;
begin
  // Ausencia de registro = array vazio, equivalente ao resultado nulo do Java
  // que leva a IndicadorOperacaoNaoEncontradoException (404 na API Java).
  SetLength(localOperacao, 0);

  repo := TFakeIndicadorOperacaoRepository.Create(localOperacao);
  try
    uc := ConsultarLocalOperacaoUseCase.Create(repo);
    try
      Assert.WillRaise(
        procedure
        begin
          uc.Executar('999999', EncodeDate(2026, 1, 1));
        end,
        EIndicadorOperacaoNaoEncontrado,
        'Indicador inexistente deve lancar EIndicadorOperacaoNaoEncontrado');
    finally
      uc.Free;
    end;
    Assert.IsTrue(repo.ChamouBuscarLocalOperacao,
      'O caso de uso deve consultar a porta antes de lancar');
    Assert.AreEqual('999999', repo.CIndOpRecebido,
      'A porta deve receber o cIndOp inexistente');
  finally
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ConsultarLocalOperacao.teste_LocalOperacaoSemCodigos_RetornaAusenciaSemZero;
var
  repo: TFakeIndicadorOperacaoRepository;
  uc: ConsultarLocalOperacaoUseCase;
  output: NfseLocalOperacaoOutput;
  localOperacao: LocalOperacaoPorIndOpResultado;
begin
  // Linha existente, mas com fornecimento SQL NULL e incidencia liUnassigned:
  // a fronteira de ausencia nao pode virar codigo 0 nem descricao espuria.
  SetLength(localOperacao, 1);
  localOperacao[0].CodigoLocalFornecimento := IntegerNullable.NullInstance();
  localOperacao[0].CodigoLocalIncidencia := liUnassigned;

  repo := TFakeIndicadorOperacaoRepository.Create(localOperacao);
  try
    uc := ConsultarLocalOperacaoUseCase.Create(repo);
    try
      output := uc.Executar('100301', EncodeDate(2026, 1, 1));

      Assert.IsTrue(output.CodigoLocalFornecimento.IsNull,
        'Fornecimento ausente deve permanecer nulo, nunca 0');
      Assert.AreEqual('', output.CodigoLocalFornecimento.ToText(),
        'Fornecimento ausente nao deve ser serializado como 0');
      Assert.AreEqual('', output.LocalFornecimento,
        'Fornecimento ausente nao deve ter descricao');

      Assert.AreEqual(Integer(liUnassigned), Integer(output.CodigoLocalIncidencia),
        'Incidencia ausente deve permanecer liUnassigned');
      Assert.AreEqual('', output.LocalIncidencia,
        'Incidencia ausente nao deve ter descricao');
    finally
      uc.Free;
    end;
  finally
    repo.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_NfseUseCases_ConsultarLocalOperacao);

end.
