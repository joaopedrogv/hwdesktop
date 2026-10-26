unit Teste_NfseUseCases_ValidarIndicadorOperacao;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  IIndicadorOperacaoRepositoryUnit,
  ValidarIndicadorOperacaoUseCaseUnit,
  TipoComunsUnit,
  StringNullableUnit;

type
  TFakeIndicadorOperacaoRepository = class(IIndicadorOperacaoRepository)
  private
    FResultadoValidacao: Integer;
    FCTribNacRecebido: StringNullable;
    FNbsRecebido: string;
    FCClassTribRecebido: string;
    FCIndOpRecebido: string;
  public
    constructor Create(const ResultadoValidacao: Integer); reintroduce;
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

    property CTribNacRecebido: StringNullable read FCTribNacRecebido;
    property NbsRecebido: string read FNbsRecebido;
    property CClassTribRecebido: string read FCClassTribRecebido;
    property CIndOpRecebido: string read FCIndOpRecebido;
  end;

  [TestFixture]
  TTeste_NfseUseCases_ValidarIndicadorOperacao = class
  public
    [Test]
    procedure teste_CombinacaoValida_RetornaValidoTrue;

    [Test]
    procedure teste_CombinacaoInvalida_RetornaValidoFalse;

    [Test]
    procedure teste_CTribNac_FormatadoComoNumeroPontoNumero;

    [Test]
    procedure teste_CTribNacVazio_EnviaNulo;
  end;

implementation

{ TFakeIndicadorOperacaoRepository }

constructor TFakeIndicadorOperacaoRepository.Create(const ResultadoValidacao: Integer);
begin
  inherited Create(nil);
  FResultadoValidacao := ResultadoValidacao;
end;

function TFakeIndicadorOperacaoRepository.ValidarCombinacaoExiste(
  const NbsCd: string;
  const CClassTrib: string;
  const CIndOp: string;
  const CTribNac: StringNullable;
  DataOcorrenciaFatoGerador: TDate
): Integer;
begin
  FNbsRecebido := NbsCd;
  FCClassTribRecebido := CClassTrib;
  FCIndOpRecebido := CIndOp;
  FCTribNacRecebido := CTribNac;
  Result := FResultadoValidacao;
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

{ TTeste_NfseUseCases_ValidarIndicadorOperacao }

procedure TTeste_NfseUseCases_ValidarIndicadorOperacao.teste_CombinacaoValida_RetornaValidoTrue;
var
  repo: TFakeIndicadorOperacaoRepository;
  uc: ValidarIndicadorOperacaoUseCase;
  output: NfseValidacaoIndicadorOperacaoOutput;
begin
  repo := TFakeIndicadorOperacaoRepository.Create(1);
  try
    uc := ValidarIndicadorOperacaoUseCase.Create(repo);
    try
      output := uc.Executar(NfseValidacaoIndicadorOperacaoInput.Create('90116000', '200002', '100301', '', EncodeDate(2026, 1, 1)));
      Assert.IsTrue(output.Valido, 'Combinacao existente deve retornar valido=True');
    finally
      uc.Free;
    end;
  finally
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ValidarIndicadorOperacao.teste_CombinacaoInvalida_RetornaValidoFalse;
var
  repo: TFakeIndicadorOperacaoRepository;
  uc: ValidarIndicadorOperacaoUseCase;
  output: NfseValidacaoIndicadorOperacaoOutput;
begin
  repo := TFakeIndicadorOperacaoRepository.Create(0);
  try
    uc := ValidarIndicadorOperacaoUseCase.Create(repo);
    try
      output := uc.Executar(NfseValidacaoIndicadorOperacaoInput.Create('90116000', '200002', '100301', '', EncodeDate(2026, 1, 1)));
      Assert.IsFalse(output.Valido, 'Combinacao inexistente deve retornar valido=False');
    finally
      uc.Free;
    end;
  finally
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ValidarIndicadorOperacao.teste_CTribNac_FormatadoComoNumeroPontoNumero;
var
  repo: TFakeIndicadorOperacaoRepository;
  uc: ValidarIndicadorOperacaoUseCase;
begin
  repo := TFakeIndicadorOperacaoRepository.Create(1);
  try
    uc := ValidarIndicadorOperacaoUseCase.Create(repo);
    try
      uc.Executar(NfseValidacaoIndicadorOperacaoInput.Create('90116000', '200002', '100301', '0712', EncodeDate(2026, 1, 1)));
      Assert.IsFalse(repo.CTribNacRecebido.IsNull, 'CTribNac formatado nao deve ser nulo');
      Assert.AreEqual('7.12', repo.CTribNacRecebido.Value, 'CTribNac deve ser formatado como numero.numero');
    finally
      uc.Free;
    end;
  finally
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ValidarIndicadorOperacao.teste_CTribNacVazio_EnviaNulo;
var
  repo: TFakeIndicadorOperacaoRepository;
  uc: ValidarIndicadorOperacaoUseCase;
begin
  repo := TFakeIndicadorOperacaoRepository.Create(1);
  try
    uc := ValidarIndicadorOperacaoUseCase.Create(repo);
    try
      uc.Executar(NfseValidacaoIndicadorOperacaoInput.Create('90116000', '200002', '100301', '', EncodeDate(2026, 1, 1)));
      Assert.IsTrue(repo.CTribNacRecebido.IsNull, 'CTribNac vazio deve ser enviado como nulo');
    finally
      uc.Free;
    end;
  finally
    repo.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_NfseUseCases_ValidarIndicadorOperacao);

end.
