unit ConsultarLocalOperacaoUseCaseUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/service/nfse/NfseService.java#consultarLocalOperacao
// Java: source/src/main/java/br/gov/serpro/rtc/api/model/output/nfse/NfseLocalOperacaoOutput.java
// Java: source/src/main/java/br/gov/serpro/rtc/testesintegracao/.../Teste_nfse_2_consultarLocalOperacao.java

interface

uses
  SysUtils,
  IIndicadorOperacaoRepositoryUnit,
  TipoComunsUnit,
  IntegerNullableUnit,
  LocalIncidenciaEnumUnit,
  LocalFornecimentoEnumUnit;

type
  /// <summary>
  ///   Saida de consultarLocalOperacao (espelho de NfseLocalOperacaoOutput.java
  ///   v0042). O antigo campo unico localOperacao (v0039) foi substituido pelos
  ///   codigos e descricoes de local de fornecimento e de local de incidencia.
  /// </summary>
  NfseLocalOperacaoOutput = record
  private
    FCIndOp: string;
    FDataOcorrenciaFatoGerador: TDate;
    // Codigo de local de fornecimento (IOIC_CD_LOCAL_FORNECIMENTO_DFE). O Java
    // expoe o enum LocalFornecimento (codigo 1..28, nullable); aqui o codigo
    // permanece inteiro e anulavel, coerente com a porta (I10) e com
    // LocalFornecimentoEnumUnit. Ausente = IntegerNullable nulo, nunca 0.
    FCodigoLocalFornecimento: IntegerNullable;
    FLocalFornecimento: string;
    // Ausencia do codigo tipado corresponde a liUnassigned (SQL NULL): nunca se
    // chama LocalIncidenciaFromCodigo(0) nem se serializa 0 (I12).
    FCodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia;
    FLocalIncidencia: string;
  public
    property CIndOp: string read FCIndOp;
    property DataOcorrenciaFatoGerador: TDate read FDataOcorrenciaFatoGerador;
    property CodigoLocalFornecimento: IntegerNullable read FCodigoLocalFornecimento;
    property LocalFornecimento: string read FLocalFornecimento;
    property CodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia read FCodigoLocalIncidencia;
    property LocalIncidencia: string read FLocalIncidencia;
  end;

  /// <summary>
  ///   Excecao distinguivel para a ausencia de indicador de operacao vigente.
  ///   Espelha IndicadorOperacaoNaoEncontradoException.java (v0042), que na API
  ///   Java responde 404 (F-01 do review de I11). O Modern nao possui camada
  ///   HTTP; o tipo permite ao adaptador futuro mapear not-found sem depender da
  ///   mensagem.
  /// </summary>
  EIndicadorOperacaoNaoEncontrado = class(Exception);

  IConsultarLocalOperacaoUseCase = interface
    ['{B25A6FA7-D39B-4D0C-98E1-3F2197AC7D89}']
    function Executar(const CIndOp: string; DataOcorrenciaFatoGerador: TDate): NfseLocalOperacaoOutput;
  end;

  ConsultarLocalOperacaoUseCase = class(TInterfacedObject, IConsultarLocalOperacaoUseCase)
  private
    FIndicadorOperacaoRepo: IIndicadorOperacaoRepository;
  public
    constructor Create(const IndicadorOperacaoRepo: IIndicadorOperacaoRepository);

    function Executar(const CIndOp: string; DataOcorrenciaFatoGerador: TDate): NfseLocalOperacaoOutput;
  end;

implementation

{ ConsultarLocalOperacaoUseCase }

constructor ConsultarLocalOperacaoUseCase.Create(
  const IndicadorOperacaoRepo: IIndicadorOperacaoRepository);
begin
  FIndicadorOperacaoRepo := IndicadorOperacaoRepo;
end;

function ConsultarLocalOperacaoUseCase.Executar(
  const CIndOp: string; DataOcorrenciaFatoGerador: TDate
): NfseLocalOperacaoOutput;
var
  resultado: LocalOperacaoPorIndOpResultado;
  linha: LocalOperacaoPorIndOpLinha;
begin
  // Espelho do Java v0042: busca o par {IOIC_CD_LOCAL_FORNECIMENTO_DFE,
  // IOIC_CD_LOCAL_INCIDENCIA}, com Result[0] como a linha. Assim como no Java
  // (resultado == null || length == 0), a ausencia de registro e o array vazio
  // e leva a IndicadorOperacaoNaoEncontradoException (404 na API Java).
  resultado := FIndicadorOperacaoRepo.BuscarLocalOperacaoPorIndOp(CIndOp, DataOcorrenciaFatoGerador);

  // Lanca apenas quando nao ha linha vigente; uma linha existente com codigos
  // nulos retorna normalmente com os campos ausentes.
  if Length(resultado) = 0 then
    raise EIndicadorOperacaoNaoEncontrado.CreateFmt(
      'Indicador de operação ''%s'' não encontrado para a data %s',
      [CIndOp, DateToStr(DataOcorrenciaFatoGerador)]);

  linha := resultado[0];

  Result.FCIndOp := CIndOp;
  Result.FDataOcorrenciaFatoGerador := DataOcorrenciaFatoGerador;

  // Java: resultadoQuery[0] != null ? fromCodigo(...) : null. Ausencia de
  // fornecimento permanece nula: sem conversao, sem descricao e sem 0. Quando
  // presente, a descricao vem do enum LocalFornecimento; codigo fora de 1..28
  // lanca, como fromCodigo no Java.
  if linha.CodigoLocalFornecimento.HasValue then
  begin
    Result.FCodigoLocalFornecimento := linha.CodigoLocalFornecimento;
    Result.FLocalFornecimento := LocalFornecimentoDescricaoPorCodigo(
      linha.CodigoLocalFornecimento.Value);
  end
  else
  begin
    Result.FCodigoLocalFornecimento := IntegerNullable.NullInstance();
    Result.FLocalFornecimento := '';
  end;

  // Incidencia: a porta ja converteu SQL NULL em liUnassigned (nunca
  // FromCodigo(0)); liUnassigned significa ausente e nao recebe descricao.
  Result.FCodigoLocalIncidencia := linha.CodigoLocalIncidencia;
  Result.FLocalIncidencia := LocalIncidenciaDescricao(linha.CodigoLocalIncidencia);
end;

end.
