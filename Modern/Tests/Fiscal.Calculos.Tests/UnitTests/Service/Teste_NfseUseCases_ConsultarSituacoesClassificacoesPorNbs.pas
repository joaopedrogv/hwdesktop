unit Teste_NfseUseCases_ConsultarSituacoesClassificacoesPorNbs;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  IIndicadorOperacaoRepositoryUnit,
  ConsultarSituacoesClassificacoesPorNbsUseCaseUnit,
  INbsRepositoryUnit,
  NbsEtdUnit,
  TipoComunsUnit,
  StringNullableUnit,
  BooleanNullableUnit,
  DateAndTimeNullableUnit;

type
  TFakeIndicadorOperacaoRepository = class(IIndicadorOperacaoRepository)
  private
    FLista: SituacoesClassificacoesLinha;
    FFallback: SituacaoClassificacaoLinha;
  public
    constructor Create(const Lista: SituacoesClassificacoesLinha; const Fallback: SituacaoClassificacaoLinha); reintroduce;
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
  end;

  TFakeNbsRepository = class(INbsRepository)
  private
    FNbs: NbsEtd;
  public
    constructor Create(const Nbs: NbsEtd); reintroduce;
    function ObterNbs(const Nbs: string; Data: TDate): NbsEtd; override;
  end;

  [TestFixture]
  TTeste_NfseUseCases_ConsultarSituacoesClassificacoesPorNbs = class
  public
    [Test]
    procedure teste_NbsInexistente_LancaNbsNaoEncontrada;

    [Test]
    procedure teste_NbsExistente_RetornaLista;

    [Test]
    procedure teste_NbsSemVinculo_UsaFallback000001;

    [Test]
    procedure teste_NbsSemVinculoSemFallback_RetornaVazio;
  end;

implementation

{ TFakeIndicadorOperacaoRepository }

constructor TFakeIndicadorOperacaoRepository.Create(const Lista: SituacoesClassificacoesLinha; const Fallback: SituacaoClassificacaoLinha);
begin
  inherited Create(nil);
  FLista := Lista;
  FFallback := Fallback;
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
  Result := FLista;
end;

function TFakeIndicadorOperacaoRepository.BuscarSituacaoClassificacaoPorClassificacao(
  const CodigoClassificacaoTributaria: string; Data: TDate
): SituacaoClassificacaoLinha;
begin
  Result := FFallback;
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

function CriarLinha(const CST: string; const ClassTrib: string): SituacaoClassificacaoLinha;
begin
  Result.CodigoSituacaoTributaria := CST;
  Result.DescricaoSituacaoTributaria := 'desc ' + CST;
  Result.CodigoClassificacaoTributaria := ClassTrib;
  Result.DescricaoClassificacaoTributaria := 'desc ' + ClassTrib;
  Result.Encontrada := True;
end;

{ TTeste_NfseUseCases_ConsultarSituacoesClassificacoesPorNbs }

procedure TTeste_NfseUseCases_ConsultarSituacoesClassificacoesPorNbs.teste_NbsInexistente_LancaNbsNaoEncontrada;
var
  repo: TFakeIndicadorOperacaoRepository;
  nbsRepo: TFakeNbsRepository;
  uc: ConsultarSituacoesClassificacoesPorNbsUseCase;
  lista: SituacoesClassificacoesLinha;
  fallback: SituacaoClassificacaoLinha;
begin
  SetLength(lista, 0);
  fallback.Encontrada := False;

  repo := TFakeIndicadorOperacaoRepository.Create(lista, fallback);
  nbsRepo := TFakeNbsRepository.Create(nil);
  try
    uc := ConsultarSituacoesClassificacoesPorNbsUseCase.Create(repo, nbsRepo);
    try
      Assert.WillRaise(
        procedure
        begin
          uc.Executar('90116000', EncodeDate(2026, 1, 1));
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

procedure TTeste_NfseUseCases_ConsultarSituacoesClassificacoesPorNbs.teste_NbsExistente_RetornaLista;
var
  repo: TFakeIndicadorOperacaoRepository;
  nbsRepo: TFakeNbsRepository;
  uc: ConsultarSituacoesClassificacoesPorNbsUseCase;
  nbs: NbsEtd;
  lista: SituacoesClassificacoesLinha;
  fallback: SituacaoClassificacaoLinha;
  result: SituacoesClassificacoesLinha;
begin
  nbs := NbsEtd.Create('90116000', 'desc', StringNullable.NullInstance(), EncodeDate(2020, 1, 1), DateNullable.NullInstance());
  SetLength(lista, 1);
  lista[0] := CriarLinha('200', '200002');
  fallback.Encontrada := False;

  repo := TFakeIndicadorOperacaoRepository.Create(lista, fallback);
  nbsRepo := TFakeNbsRepository.Create(nbs);
  try
    uc := ConsultarSituacoesClassificacoesPorNbsUseCase.Create(repo, nbsRepo);
    try
      result := uc.Executar('90116000', EncodeDate(2026, 1, 1));
      Assert.AreEqual(1, Length(result), 'Deve retornar a lista');
      Assert.AreEqual('200', result[0].CodigoSituacaoTributaria);
      Assert.AreEqual('200002', result[0].CodigoClassificacaoTributaria);
    finally
      uc.Free;
    end;
  finally
    nbs.Free;
    nbsRepo.Free;
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ConsultarSituacoesClassificacoesPorNbs.teste_NbsSemVinculo_UsaFallback000001;
var
  repo: TFakeIndicadorOperacaoRepository;
  nbsRepo: TFakeNbsRepository;
  uc: ConsultarSituacoesClassificacoesPorNbsUseCase;
  nbs: NbsEtd;
  lista: SituacoesClassificacoesLinha;
  fallback: SituacaoClassificacaoLinha;
  result: SituacoesClassificacoesLinha;
begin
  nbs := NbsEtd.Create('90116000', 'desc', StringNullable.NullInstance(), EncodeDate(2020, 1, 1), DateNullable.NullInstance());
  SetLength(lista, 0);
  fallback := CriarLinha('000', '000001');

  repo := TFakeIndicadorOperacaoRepository.Create(lista, fallback);
  nbsRepo := TFakeNbsRepository.Create(nbs);
  try
    uc := ConsultarSituacoesClassificacoesPorNbsUseCase.Create(repo, nbsRepo);
    try
      result := uc.Executar('90116000', EncodeDate(2026, 1, 1));
      Assert.AreEqual(1, Length(result), 'Deve retornar o fallback 000001');
      Assert.AreEqual('000001', result[0].CodigoClassificacaoTributaria);
    finally
      uc.Free;
    end;
  finally
    nbs.Free;
    nbsRepo.Free;
    repo.Free;
  end;
end;

procedure TTeste_NfseUseCases_ConsultarSituacoesClassificacoesPorNbs.teste_NbsSemVinculoSemFallback_RetornaVazio;
var
  repo: TFakeIndicadorOperacaoRepository;
  nbsRepo: TFakeNbsRepository;
  uc: ConsultarSituacoesClassificacoesPorNbsUseCase;
  nbs: NbsEtd;
  lista: SituacoesClassificacoesLinha;
  fallback: SituacaoClassificacaoLinha;
  result: SituacoesClassificacoesLinha;
begin
  nbs := NbsEtd.Create('90116000', 'desc', StringNullable.NullInstance(), EncodeDate(2020, 1, 1), DateNullable.NullInstance());
  SetLength(lista, 0);
  fallback.Encontrada := False;

  repo := TFakeIndicadorOperacaoRepository.Create(lista, fallback);
  nbsRepo := TFakeNbsRepository.Create(nbs);
  try
    uc := ConsultarSituacoesClassificacoesPorNbsUseCase.Create(repo, nbsRepo);
    try
      result := uc.Executar('90116000', EncodeDate(2026, 1, 1));
      Assert.AreEqual(0, Length(result), 'Sem vinculo e sem fallback deve retornar vazio');
    finally
      uc.Free;
    end;
  finally
    nbs.Free;
    nbsRepo.Free;
    repo.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_NfseUseCases_ConsultarSituacoesClassificacoesPorNbs);

end.
