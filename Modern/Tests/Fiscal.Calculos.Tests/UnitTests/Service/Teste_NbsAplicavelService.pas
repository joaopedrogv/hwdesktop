unit Teste_NbsAplicavelService;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  INbsAplicavelRepositoryUnit,
  NbsAplicavelEtdUnit,
  NbsEtdUnit,
  TipoComunsUnit;

type
  /// <summary>
  ///   Double localizado de INbsAplicavelRepository (classe abstrata, nao interface
  ///   no build de testes). Responde as consultas booleanas observaveis do Java e
  ///   registra quantas vezes cada metodo foi chamado, permitindo provar que
  ///   NbsAplicavelService consome os tres metodos equivalentes (TemNbsAplicavel,
  ///   TemExcecaoNbsAplicavel e TemNbsAplicavelSemExcecao) e nao a derivacao antiga
  ///   (ObterPorNbseClassificacaoId). Nenhuma infraestrutura real e usada.
  /// </summary>
  TFakeNbsAplicavelRepository = class(INbsAplicavelRepository)
  private
    FExistePorClassificacaoId: Boolean;
    FTemNbsAplicavel: Boolean;
    FTemExcecaoNbsAplicavel: Boolean;
    FTemNbsAplicavelSemExcecao: Boolean;

    FChamadasExistePorClassificacaoId: Integer;
    FChamadasTemNbsAplicavel: Integer;
    FChamadasTemExcecaoNbsAplicavel: Integer;
    FChamadasTemNbsAplicavelSemExcecao: Integer;
    FChamadasObterPorNbseClassificacaoId: Integer;
    FChamadasListarNbsAplicaveisPorClassificacao: Integer;
    FChamadasListarClassificacaoAplicavelPorNbs: Integer;
    FChamadasExisteVinculoParaClassificacao: Integer;
  public
    constructor Create(
      AExistePorClassificacaoId: Boolean;
      ATemNbsAplicavel: Boolean;
      ATemExcecaoNbsAplicavel: Boolean;
      ATemNbsAplicavelSemExcecao: Boolean
    ); reintroduce;

    function ObterPorNbseClassificacaoId(NCM: string; ClassificacaoId: Integer; Data: TDate): NbssAplicaveisEtd; override;
    function ExistePorClassificacaoId(ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function TemNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function TemExcecaoNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function TemNbsAplicavelSemExcecao(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function ListarNbsAplicaveisPorClassificacao(ClassificacaoId: Integer; Data: TDate): NbssEtd; override;
    function ListarClassificacaoAplicavelPorNbs(const Nbs: string; Data: TDate): TArrayString; override;
    function ExisteVinculoParaClassificacao(ClassificacaoId: Integer): Boolean; override;

    property ChamadasExistePorClassificacaoId: Integer read FChamadasExistePorClassificacaoId;
    property ChamadasTemNbsAplicavel: Integer read FChamadasTemNbsAplicavel;
    property ChamadasTemExcecaoNbsAplicavel: Integer read FChamadasTemExcecaoNbsAplicavel;
    property ChamadasTemNbsAplicavelSemExcecao: Integer read FChamadasTemNbsAplicavelSemExcecao;
    property ChamadasObterPorNbseClassificacaoId: Integer read FChamadasObterPorNbseClassificacaoId;
    property ChamadasListarNbsAplicaveisPorClassificacao: Integer read FChamadasListarNbsAplicaveisPorClassificacao;
    property ChamadasListarClassificacaoAplicavelPorNbs: Integer read FChamadasListarClassificacaoAplicavelPorNbs;
    property ChamadasExisteVinculoParaClassificacao: Integer read FChamadasExisteVinculoParaClassificacao;
  end;

  [TestFixture]
  TTeste_NbsAplicavelService = class
  public
    [Test]
    procedure teste_QuandoAplicavelVigenteSemExcecao_NaoGeraErro;

    [Test]
    procedure teste_ServiceConsomeOsTresMetodosJava_E_NaoUsaDerivacaoAntiga;

    [Test]
    procedure teste_F01_ExcecaoVigenteComLinhaNbsAplicavelForaDeVigencia_NaoGeraNaoVinculada;

    [Test]
    procedure teste_CondicaoA_AplicavelComExcecaoVigenteSemAplicavelSemExcecao_GeraNaoVinculada;

    [Test]
    procedure teste_CondicaoB_ClassificacaoExisteSemVinculoNemExcecao_GeraNaoVinculada;

    [Test]
    procedure teste_CondicaoB_SemClassificacaoTributaria_NaoGeraNaoVinculada;

    [Test]
    procedure teste_MatrizCombinacoesBooleanasDosTresMetodos;

    [Test]
    procedure teste_NbsIncompletoComClassificacao_GeraNbsCompletoNecessario;

    [Test]
    procedure teste_NbsIncompletoSemClassificacao_NaoGeraErro;

    [Test]
    procedure teste_F02_NbsComEspacosExternos_ContaComoCompleto;

    [Test]
    procedure teste_F02_NbsSomenteEspacos_ContaComoIncompleto;

    [Test]
    procedure teste_LacunaRegraNumerica_NbsNaoNumericoDeNoveCaracteres_ContaComoCompleto;
  end;

implementation

uses
  NbsAplicavelServiceUnit,
  ValidacaoOutputUnit,
  ValidacaoItemOutputUnit,
  CodigosErroValidacao;

const
  NBS_COMPLETO = '114052200';
  NBS_INCOMPLETO = '11405220';
  CLASSIFICACAO_ID = 200002;
  TRIBUTOS = 'CBS e IBS';

type
  /// <summary>
  ///   Linha da matriz observavel dos tres metodos equivalentes do Java.
  ///   GeraNaoVinculada reproduz as duas condicoes do NbsAplicavelService Java que
  ///   produzem NbsNaoVinculadaException (ECOD_NBS_NAO_VINC_CLASSIFICACAO no Modern).
  /// </summary>
  TCombinacaoMetodosJava = record
    TemNbsAplicavel: Boolean;
    TemExcecaoNbsAplicavel: Boolean;
    TemNbsAplicavelSemExcecao: Boolean;
    GeraNaoVinculada: Boolean;
  end;

function CriarDataFatoGerador: TDate;
begin
  Result := EncodeDate(2026, 1, 1);
end;

function ExecutarValidar(Repo: INbsAplicavelRepository; const Nbs: string): ValidacaoOutput;
var
  Service: NbsAplicavelService;
begin
  Service := NbsAplicavelService.Create(Repo);
  try
    Result := Service.Validar(Nbs, CLASSIFICACAO_ID, CriarDataFatoGerador, TRIBUTOS);
  finally
    Service.Free;
  end;
end;

function ContarCodigo(const Validacao: ValidacaoOutput; Codigo: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to High(Validacao.Validacoes) do
    if Validacao.Validacoes[I].Codigo = Codigo then
      Inc(Result);
end;

{ TFakeNbsAplicavelRepository }

constructor TFakeNbsAplicavelRepository.Create(
  AExistePorClassificacaoId: Boolean;
  ATemNbsAplicavel: Boolean;
  ATemExcecaoNbsAplicavel: Boolean;
  ATemNbsAplicavelSemExcecao: Boolean
);
begin
  inherited Create(nil);
  FExistePorClassificacaoId := AExistePorClassificacaoId;
  FTemNbsAplicavel := ATemNbsAplicavel;
  FTemExcecaoNbsAplicavel := ATemExcecaoNbsAplicavel;
  FTemNbsAplicavelSemExcecao := ATemNbsAplicavelSemExcecao;
end;

function TFakeNbsAplicavelRepository.ObterPorNbseClassificacaoId(
  NCM: string; ClassificacaoId: Integer; Data: TDate
): NbssAplicaveisEtd;
begin
  Inc(FChamadasObterPorNbseClassificacaoId);
  Result := nil;
end;

function TFakeNbsAplicavelRepository.ExistePorClassificacaoId(
  ClassificacaoId: Integer; Data: TDate
): Boolean;
begin
  Inc(FChamadasExistePorClassificacaoId);
  Result := FExistePorClassificacaoId;
end;

function TFakeNbsAplicavelRepository.TemNbsAplicavel(
  const Nbs: string; ClassificacaoId: Integer; Data: TDate
): Boolean;
begin
  Inc(FChamadasTemNbsAplicavel);
  Result := FTemNbsAplicavel;
end;

function TFakeNbsAplicavelRepository.TemExcecaoNbsAplicavel(
  const Nbs: string; ClassificacaoId: Integer; Data: TDate
): Boolean;
begin
  Inc(FChamadasTemExcecaoNbsAplicavel);
  Result := FTemExcecaoNbsAplicavel;
end;

function TFakeNbsAplicavelRepository.TemNbsAplicavelSemExcecao(
  const Nbs: string; ClassificacaoId: Integer; Data: TDate
): Boolean;
begin
  Inc(FChamadasTemNbsAplicavelSemExcecao);
  Result := FTemNbsAplicavelSemExcecao;
end;

function TFakeNbsAplicavelRepository.ListarNbsAplicaveisPorClassificacao(
  ClassificacaoId: Integer; Data: TDate
): NbssEtd;
begin
  Inc(FChamadasListarNbsAplicaveisPorClassificacao);
  Result := nil;
end;

function TFakeNbsAplicavelRepository.ListarClassificacaoAplicavelPorNbs(
  const Nbs: string; Data: TDate
): TArrayString;
begin
  Inc(FChamadasListarClassificacaoAplicavelPorNbs);
  SetLength(Result, 0);
end;

function TFakeNbsAplicavelRepository.ExisteVinculoParaClassificacao(
  ClassificacaoId: Integer
): Boolean;
begin
  Inc(FChamadasExisteVinculoParaClassificacao);
  Result := False;
end;

{ TTeste_NbsAplicavelService }

procedure TTeste_NbsAplicavelService.teste_QuandoAplicavelVigenteSemExcecao_NaoGeraErro;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  // TemNbsAplicavel=True, TemExcecaoNbsAplicavel=False, TemNbsAplicavelSemExcecao=True:
  // existe NBS_APLICAVEL vigente sem excecao vigente. O Java nao lanca
  // NbsNaoVinculadaException e validarNbsAplicavel retorna true.
  Repo := TFakeNbsAplicavelRepository.Create(True, True, False, True);
  try
    Output := ExecutarValidar(Repo, NBS_COMPLETO);
    Assert.IsTrue(Output.IsValid(), 'NBS aplicavel sem excecao vigente nao deve gerar erro');
    Assert.AreEqual(0, ContarCodigo(Output, ECOD_NBS_NAO_VINC_CLASSIFICACAO),
      'Nao deve gerar ECOD_NBS_NAO_VINC_CLASSIFICACAO');
    Assert.AreEqual(0, ContarCodigo(Output, ECOD_NBS_COMPLETO_NECESSARIO),
      'Nao deve gerar ECOD_NBS_COMPLETO_NECESSARIO');
  finally
    Repo.Free;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_ServiceConsomeOsTresMetodosJava_E_NaoUsaDerivacaoAntiga;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  Repo := TFakeNbsAplicavelRepository.Create(True, True, False, True);
  try
    Output := ExecutarValidar(Repo, NBS_COMPLETO);
    Assert.IsTrue(Output.IsValid());

    Assert.AreEqual(1, Repo.ChamadasExistePorClassificacaoId,
      'ExistePorClassificacaoId corresponde ao repository.tem do Java e deve ser consultado uma vez');
    Assert.AreEqual(1, Repo.ChamadasTemNbsAplicavel,
      'TemNbsAplicavel deve ser chamado uma vez');
    Assert.AreEqual(1, Repo.ChamadasTemExcecaoNbsAplicavel,
      'TemExcecaoNbsAplicavel deve ser chamado uma vez');
    Assert.AreEqual(1, Repo.ChamadasTemNbsAplicavelSemExcecao,
      'TemNbsAplicavelSemExcecao deve ser chamado uma vez');

    Assert.AreEqual(0, Repo.ChamadasObterPorNbseClassificacaoId,
      'A derivacao antiga ObterPorNbseClassificacaoId nao deve ser usada por Validar');
    Assert.AreEqual(0, Repo.ChamadasListarNbsAplicaveisPorClassificacao,
      'ListarNbsAplicaveisPorClassificacao nao pertence a Validar');
    Assert.AreEqual(0, Repo.ChamadasListarClassificacaoAplicavelPorNbs,
      'ListarClassificacaoAplicavelPorNbs nao pertence a Validar');
    Assert.AreEqual(0, Repo.ChamadasExisteVinculoParaClassificacao,
      'ExisteVinculoParaClassificacao nao pertence a Validar');
  finally
    Repo.Free;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_F01_ExcecaoVigenteComLinhaNbsAplicavelForaDeVigencia_NaoGeraNaoVinculada;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  // F-01: a classificacao existe e o NBS e completo, mas nao ha NBS_APLICAVEL
  // vigente na data (TemNbsAplicavel=False). Existe, porem, uma excecao vigente
  // (TemExcecaoNbsAplicavel=True) vinculada a uma linha NBS_APLICAVEL fora de
  // vigencia, o que tambem implica TemNbsAplicavelSemExcecao=False.
  // No Java: a primeira condicao exige temNbsAplicavel (falsa); a segunda exige
  // !temExcecaoNbsAplicavel (falsa). Logo, nao ha NbsNaoVinculadaException.
  Repo := TFakeNbsAplicavelRepository.Create(True, False, True, False);
  try
    Output := ExecutarValidar(Repo, NBS_COMPLETO);
    Assert.IsTrue(Output.IsValid(),
      'F-01: excecao vigente deve validar a NBS mesmo com a linha NBS_APLICAVEL fora de vigencia');
    Assert.AreEqual(0, ContarCodigo(Output, ECOD_NBS_NAO_VINC_CLASSIFICACAO),
      'F-01: nao deve gerar ECOD_NBS_NAO_VINC_CLASSIFICACAO');
    Assert.AreEqual(1, Repo.ChamadasTemNbsAplicavel,
      'F-01: os tres metodos Java devem ser consultados');
    Assert.AreEqual(1, Repo.ChamadasTemExcecaoNbsAplicavel,
      'F-01: os tres metodos Java devem ser consultados');
    Assert.AreEqual(1, Repo.ChamadasTemNbsAplicavelSemExcecao,
      'F-01: os tres metodos Java devem ser consultados');
  finally
    Repo.Free;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_CondicaoA_AplicavelComExcecaoVigenteSemAplicavelSemExcecao_GeraNaoVinculada;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  // Condicao Java 1 (A): temNbsAplicavel && temExcecaoNbsAplicavel
  // && !temNbsAplicavelSemExcecao -> NbsNaoVinculadaException.
  Repo := TFakeNbsAplicavelRepository.Create(True, True, True, False);
  try
    Output := ExecutarValidar(Repo, NBS_COMPLETO);
    Assert.IsFalse(Output.IsValid(), 'Condicao A deve invalidar a NBS');
    Assert.AreEqual(1, ContarCodigo(Output, ECOD_NBS_NAO_VINC_CLASSIFICACAO),
      'Condicao A deve gerar exatamente um ECOD_NBS_NAO_VINC_CLASSIFICACAO');
  finally
    Repo.Free;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_CondicaoB_ClassificacaoExisteSemVinculoNemExcecao_GeraNaoVinculada;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  // Condicao Java 2 (B): temClassificacaoTributaria && !temNbsAplicavel
  // && !temExcecaoNbsAplicavel && !temNbsAplicavelSemExcecao ->
  // NbsNaoVinculadaException.
  Repo := TFakeNbsAplicavelRepository.Create(True, False, False, False);
  try
    Output := ExecutarValidar(Repo, NBS_COMPLETO);
    Assert.IsFalse(Output.IsValid(), 'Condicao B deve invalidar a NBS');
    Assert.AreEqual(1, ContarCodigo(Output, ECOD_NBS_NAO_VINC_CLASSIFICACAO),
      'Condicao B deve gerar exatamente um ECOD_NBS_NAO_VINC_CLASSIFICACAO');
  finally
    Repo.Free;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_CondicaoB_SemClassificacaoTributaria_NaoGeraNaoVinculada;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  // Fronteira da condicao B: sem classificacao tributaria (repository.tem=false),
  // os tres booleanos falsos nao geram NbsNaoVinculadaException no Java.
  Repo := TFakeNbsAplicavelRepository.Create(False, False, False, False);
  try
    Output := ExecutarValidar(Repo, NBS_COMPLETO);
    Assert.IsTrue(Output.IsValid(),
      'Sem classificacao tributaria a condicao B nao se aplica e a NBS permanece valida');
    Assert.AreEqual(0, ContarCodigo(Output, ECOD_NBS_NAO_VINC_CLASSIFICACAO),
      'Nao deve gerar ECOD_NBS_NAO_VINC_CLASSIFICACAO');
  finally
    Repo.Free;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_MatrizCombinacoesBooleanasDosTresMetodos;
const
  COMBINACOES: array[0..7] of TCombinacaoMetodosJava = (
    (TemNbsAplicavel: False; TemExcecaoNbsAplicavel: False; TemNbsAplicavelSemExcecao: False; GeraNaoVinculada: True),
    (TemNbsAplicavel: False; TemExcecaoNbsAplicavel: False; TemNbsAplicavelSemExcecao: True;  GeraNaoVinculada: False),
    (TemNbsAplicavel: False; TemExcecaoNbsAplicavel: True;  TemNbsAplicavelSemExcecao: False; GeraNaoVinculada: False),
    (TemNbsAplicavel: False; TemExcecaoNbsAplicavel: True;  TemNbsAplicavelSemExcecao: True;  GeraNaoVinculada: False),
    (TemNbsAplicavel: True;  TemExcecaoNbsAplicavel: False; TemNbsAplicavelSemExcecao: False; GeraNaoVinculada: False),
    (TemNbsAplicavel: True;  TemExcecaoNbsAplicavel: False; TemNbsAplicavelSemExcecao: True;  GeraNaoVinculada: False),
    (TemNbsAplicavel: True;  TemExcecaoNbsAplicavel: True;  TemNbsAplicavelSemExcecao: False; GeraNaoVinculada: True),
    (TemNbsAplicavel: True;  TemExcecaoNbsAplicavel: True;  TemNbsAplicavelSemExcecao: True;  GeraNaoVinculada: False)
  );
var
  I: Integer;
  Combinacao: TCombinacaoMetodosJava;
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
  Descricao: string;
begin
  // Matriz observavel das oito combinacoes dos tres metodos, com classificacao
  // existente e NBS completo (possuiNbsCompleto=True). As duas condicoes Java que
  // geram ECOD_NBS_NAO_VINC_CLASSIFICACAO sao:
  //   A) TemNbsAplicavel && TemExcecaoNbsAplicavel && not TemNbsAplicavelSemExcecao;
  //   B) TemClassificacao && not TemNbsAplicavel && not TemExcecao && not TemSemExcecao.
  for I := Low(COMBINACOES) to High(COMBINACOES) do
  begin
    Combinacao := COMBINACOES[I];
    Descricao := Format('T=%d E=%d SE=%d',
      [Ord(Combinacao.TemNbsAplicavel),
       Ord(Combinacao.TemExcecaoNbsAplicavel),
       Ord(Combinacao.TemNbsAplicavelSemExcecao)]);

    Repo := TFakeNbsAplicavelRepository.Create(
      True,
      Combinacao.TemNbsAplicavel,
      Combinacao.TemExcecaoNbsAplicavel,
      Combinacao.TemNbsAplicavelSemExcecao
    );
    try
      Output := ExecutarValidar(Repo, NBS_COMPLETO);

      if Combinacao.GeraNaoVinculada then
        Assert.AreEqual(1, ContarCodigo(Output, ECOD_NBS_NAO_VINC_CLASSIFICACAO),
          'Combinacao ' + Descricao + ' deveria gerar ECOD_NBS_NAO_VINC_CLASSIFICACAO')
      else
      begin
        Assert.AreEqual(0, ContarCodigo(Output, ECOD_NBS_NAO_VINC_CLASSIFICACAO),
          'Combinacao ' + Descricao + ' nao deveria gerar ECOD_NBS_NAO_VINC_CLASSIFICACAO');
        Assert.IsTrue(Output.IsValid(),
          'Combinacao ' + Descricao + ' deveria ser valida');
      end;

      Assert.AreEqual(1, Repo.ChamadasTemNbsAplicavel,
        'Combinacao ' + Descricao + ': TemNbsAplicavel deve ser chamado');
      Assert.AreEqual(1, Repo.ChamadasTemExcecaoNbsAplicavel,
        'Combinacao ' + Descricao + ': TemExcecaoNbsAplicavel deve ser chamado');
      Assert.AreEqual(1, Repo.ChamadasTemNbsAplicavelSemExcecao,
        'Combinacao ' + Descricao + ': TemNbsAplicavelSemExcecao deve ser chamado');
    finally
      Repo.Free;
    end;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_NbsIncompletoComClassificacao_GeraNbsCompletoNecessario;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  // Java: temClassificacaoTributaria && !possuiNbsCompleto -> NbsCompletoNaoInformadoException.
  Repo := TFakeNbsAplicavelRepository.Create(True, False, False, False);
  try
    Output := ExecutarValidar(Repo, NBS_INCOMPLETO);
    Assert.AreEqual(1, ContarCodigo(Output, ECOD_NBS_COMPLETO_NECESSARIO),
      'NBS incompleto com classificacao deve gerar ECOD_NBS_COMPLETO_NECESSARIO');
    Assert.AreEqual(0, ContarCodigo(Output, ECOD_NBS_NAO_VINC_CLASSIFICACAO),
      'O ramo incompleto nao deve gerar ECOD_NBS_NAO_VINC_CLASSIFICACAO');
    Assert.AreEqual(0, Repo.ChamadasTemNbsAplicavel,
      'O ramo incompleto nao consulta os tres metodos Java');
    Assert.AreEqual(0, Repo.ChamadasTemExcecaoNbsAplicavel,
      'O ramo incompleto nao consulta os tres metodos Java');
    Assert.AreEqual(0, Repo.ChamadasTemNbsAplicavelSemExcecao,
      'O ramo incompleto nao consulta os tres metodos Java');
  finally
    Repo.Free;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_NbsIncompletoSemClassificacao_NaoGeraErro;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  // Java: sem classificacao tributaria, NBS incompleto nao gera
  // NbsCompletoNaoInformadoException (a condicao exige temClassificacaoTributaria).
  Repo := TFakeNbsAplicavelRepository.Create(False, False, False, False);
  try
    Output := ExecutarValidar(Repo, NBS_INCOMPLETO);
    Assert.IsTrue(Output.IsValid(),
      'NBS incompleto sem classificacao nao deve gerar erro');
    Assert.AreEqual(0, ContarCodigo(Output, ECOD_NBS_COMPLETO_NECESSARIO),
      'Nao deve gerar ECOD_NBS_COMPLETO_NECESSARIO');
    Assert.AreEqual(0, Repo.ChamadasTemNbsAplicavel,
      'O ramo incompleto nao consulta os tres metodos Java');
  finally
    Repo.Free;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_F02_NbsComEspacosExternos_ContaComoCompleto;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  // F-02: a regra Modern aceita e mantem Length(Trim(Nbs)) = 9; a decisao de gate
  // define NBS completo como exatamente nove caracteres, sem espacos externos.
  Repo := TFakeNbsAplicavelRepository.Create(True, True, False, True);
  try
    Output := ExecutarValidar(Repo, '  114052200  ');
    Assert.IsTrue(Output.IsValid(), 'NBS com espacos externos deve ser valido apos o Trim');
    Assert.AreEqual(0, ContarCodigo(Output, ECOD_NBS_COMPLETO_NECESSARIO),
      'F-02: espacos externos nao impedem o NBS completo');
    Assert.AreEqual(1, Repo.ChamadasTemNbsAplicavel,
      'F-02: o Trim deve levar ao ramo completo e consultar os tres metodos');
    Assert.AreEqual(1, Repo.ChamadasTemExcecaoNbsAplicavel,
      'F-02: o Trim deve levar ao ramo completo e consultar os tres metodos');
    Assert.AreEqual(1, Repo.ChamadasTemNbsAplicavelSemExcecao,
      'F-02: o Trim deve levar ao ramo completo e consultar os tres metodos');
  finally
    Repo.Free;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_F02_NbsSomenteEspacos_ContaComoIncompleto;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  // F-02: nove espacos sofrem Trim para zero caracteres e contam como NBS incompleto.
  Repo := TFakeNbsAplicavelRepository.Create(True, False, False, False);
  try
    Output := ExecutarValidar(Repo, '         ');
    Assert.AreEqual(1, ContarCodigo(Output, ECOD_NBS_COMPLETO_NECESSARIO),
      'F-02: NBS composto apenas por espacos e incompleto');
    Assert.AreEqual(0, Repo.ChamadasTemNbsAplicavel,
      'F-02: o ramo incompleto nao consulta os tres metodos');
  finally
    Repo.Free;
  end;
end;

procedure TTeste_NbsAplicavelService.teste_LacunaRegraNumerica_NbsNaoNumericoDeNoveCaracteres_ContaComoCompleto;
var
  Repo: TFakeNbsAplicavelRepository;
  Output: ValidacaoOutput;
begin
  // ACHADO MATERIAL (F-02, regra de somente digitos): o Java valida ^\d{9}$ na
  // fronteira da API (controllers e DTOs, fora do NbsAplicavelService) e o
  // NbsAplicavelService Java valida apenas StringUtils.length(nbs) == 9. O
  // NbsAplicavelService Modern nao possui validacao numerica. Este teste CARACTERIZA
  // o comportamento atual (lacuna conhecida) para tornar a ausencia observavel; ele
  // nao declara o comportamento desejado e a producao nao foi alterada neste
  // incremento de testes.
  Repo := TFakeNbsAplicavelRepository.Create(True, True, False, True);
  try
    Output := ExecutarValidar(Repo, 'ABCDEFGHI');
    Assert.AreEqual(0, ContarCodigo(Output, ECOD_NBS_COMPLETO_NECESSARIO),
      'Lacuna: nenhuma validacao de digitos impede o tratamento como NBS completo');
    Assert.AreEqual(1, Repo.ChamadasTemNbsAplicavel,
      'Lacuna: nove caracteres nao numericos chegam aos tres metodos Java');
  finally
    Repo.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_NbsAplicavelService);

end.
