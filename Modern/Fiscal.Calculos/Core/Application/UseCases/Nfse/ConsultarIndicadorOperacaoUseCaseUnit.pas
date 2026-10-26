unit ConsultarIndicadorOperacaoUseCaseUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/service/nfse/NfseService.java#consultarIndicadorOperacao
// Java: source/src/main/java/br/gov/serpro/rtc/api/model/output/nfse/NfseIndicadorOperacaoOutput.java (v0042)

interface

uses
  IIndicadorOperacaoRepositoryUnit,
  INbsRepositoryUnit,
  TipoComunsUnit,
  IntegerNullableUnit,
  BooleanNullableUnit,
  LocalIncidenciaEnumUnit,
  LocalFornecimentoEnumUnit;

type
  /// <summary>
  ///   Saida de consultarIndicadorOperacao (espelho de NfseIndicadorOperacaoOutput
  ///   .java v0042). Remapeia as posicoes da linha do repositorio:
  ///   [0] cIndOp, [1] tipoOperacao, [2] codigo de local de fornecimento,
  ///   [3] incidencia textual (ignorada: a descricao e derivada do codigo
  ///   tipado, como no Java), [4] codigo tipado de local de incidencia,
  ///   [5] prestacao de servico onerosa, [6] adquirente do exterior.
  ///   Null-safety: fornecimento ausente permanece IntegerNullable nulo (nunca 0);
  ///   incidencia ausente permanece liUnassigned (nunca FromCodigo(0)/0); os
  ///   booleanos preservam a nulidade. O Java usa @JsonInclude(NON_NULL), logo
  ///   ausencia nao vira conteudo espurio na serializacao; na camada de aplicacao
  ///   Modern a mesma regra e representada por campos nulos / descricao vazia.
  /// </summary>
  NfseIndicadorOperacaoOutput = record
  private
    FCIndOp: string;
    FTipoOperacao: string;
    FCodigoLocalFornecimento: IntegerNullable;
    FLocalFornecimento: string;
    FCodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia;
    FLocalIncidencia: string;
    FPrestacaoServicoOnerosa: BooleanNullable;
    FAdquirenteExterior: BooleanNullable;
  public
    property CIndOp: string read FCIndOp;
    property TipoOperacao: string read FTipoOperacao;
    property CodigoLocalFornecimento: IntegerNullable read FCodigoLocalFornecimento;
    property LocalFornecimento: string read FLocalFornecimento;
    property CodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia read FCodigoLocalIncidencia;
    property LocalIncidencia: string read FLocalIncidencia;
    property PrestacaoServicoOnerosa: BooleanNullable read FPrestacaoServicoOnerosa;
    property AdquirenteExterior: BooleanNullable read FAdquirenteExterior;
  end;

  NfseIndicadoresOperacaoOutput = array of NfseIndicadorOperacaoOutput;

  IConsultarIndicadorOperacaoUseCase = interface
    ['{4E7B1C22-0A63-4D4B-B3F4-8E1D9C2A6B85}']
    function Executar(DataOcorrenciaFatoGerador: TDate; const Nbs: string): NfseIndicadoresOperacaoOutput;
  end;

  ConsultarIndicadorOperacaoUseCase = class(TInterfacedObject, IConsultarIndicadorOperacaoUseCase)
  private
    FIndicadorOperacaoRepo: IIndicadorOperacaoRepository;
    FNbsRepo: INbsRepository;

    /// <summary>
    ///   Reprojeta uma linha do repositorio no output v0042
    ///   (mapToIndicadorOperacaoOutput).
    /// </summary>
    function MapToIndicadorOperacaoOutput(
      const Linha: IndicadorOperacaoLinha
    ): NfseIndicadorOperacaoOutput;
  public
    constructor Create(
      const IndicadorOperacaoRepo: IIndicadorOperacaoRepository;
      const NbsRepo: INbsRepository
    );

    function Executar(DataOcorrenciaFatoGerador: TDate; const Nbs: string): NfseIndicadoresOperacaoOutput;
  end;

implementation

uses
  SysUtils;

{ ConsultarIndicadorOperacaoUseCase }

constructor ConsultarIndicadorOperacaoUseCase.Create(
  const IndicadorOperacaoRepo: IIndicadorOperacaoRepository;
  const NbsRepo: INbsRepository);
begin
  FIndicadorOperacaoRepo := IndicadorOperacaoRepo;
  FNbsRepo := NbsRepo;
end;

function ConsultarIndicadorOperacaoUseCase.Executar(
  DataOcorrenciaFatoGerador: TDate; const Nbs: string
): NfseIndicadoresOperacaoOutput;
var
  linhas: IndicadoresOperacaoLinha;
  i: Integer;
begin
  // Espelho do Java: com NBS valida a existencia e, se a consulta especifica
  // retornar vazia, usa a consulta geral por data como fallback; sem NBS,
  // retorna a lista geral.
  if Nbs <> '' then
  begin
    if FNbsRepo.ObterNbs(Nbs, DataOcorrenciaFatoGerador) = nil then
      raise Exception.CreateFmt('NBS ''%s'' não encontrada para a data %s',
        [Nbs, DateToStr(DataOcorrenciaFatoGerador)]);

    linhas := FIndicadorOperacaoRepo.BuscarIndicadorOperacaoPorDataComNbs(DataOcorrenciaFatoGerador, Nbs);

    if Length(linhas) = 0 then
      linhas := FIndicadorOperacaoRepo.BuscarIndicadorOperacaoPorData(DataOcorrenciaFatoGerador);
  end
  else
    linhas := FIndicadorOperacaoRepo.BuscarIndicadorOperacaoPorData(DataOcorrenciaFatoGerador);

  // Cada linha e reprojetada para o output v0042; lista vazia permanece vazia.
  SetLength(Result, Length(linhas));
  for i := 0 to High(linhas) do
    Result[i] := MapToIndicadorOperacaoOutput(linhas[i]);
end;

function ConsultarIndicadorOperacaoUseCase.MapToIndicadorOperacaoOutput(
  const Linha: IndicadorOperacaoLinha): NfseIndicadorOperacaoOutput;
begin
  Result.FCIndOp := Linha.CIndOp;
  Result.FTipoOperacao := Linha.TipoOperacao;

  // Java: row[2] != null ? fromCodigo(row[2]) : null. Ausencia de fornecimento
  // permanece nula (IntegerNullable nulo) e sem descricao, nunca codigo 0.
  if Linha.CodigoLocalFornecimento.HasValue then
  begin
    Result.FCodigoLocalFornecimento := Linha.CodigoLocalFornecimento;
    Result.FLocalFornecimento := LocalFornecimentoDescricaoPorCodigo(
      Linha.CodigoLocalFornecimento.Value);
  end
  else
  begin
    Result.FCodigoLocalFornecimento := IntegerNullable.NullInstance();
    Result.FLocalFornecimento := '';
  end;

  // Java: row[4] != null ? LocalIncidencia.fromCodigo(row[4]) : null. A porta
  // ja converteu SQL NULL em liUnassigned (nunca FromCodigo(0)); a descricao e
  // derivada do codigo tipado, e o texto bruto de row[3] e ignorado, como no
  // Java, para nao introduzir conteudo espurio quando a incidencia esta ausente.
  Result.FCodigoLocalIncidencia := Linha.CodigoLocalIncidencia;
  if Linha.CodigoLocalIncidencia = LocalIncidenciaEnumUnit.liUnassigned then
    Result.FLocalIncidencia := ''
  else
    Result.FLocalIncidencia := LocalIncidenciaEnumUnit.LocalIncidenciaDescricao(
      Linha.CodigoLocalIncidencia);

  // Java: row[5]/row[6] != null ? (intValue == 1) : null. A nulidade e
  // preservada pelo BooleanNullable vindo do repositorio.
  Result.FPrestacaoServicoOnerosa := Linha.PrestacaoServicoOnerosa;
  Result.FAdquirenteExterior := Linha.AdquirenteExterior;
end;

end.
