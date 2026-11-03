unit Test_SalvarOperacaoFiscalIbsCbsUseCase;

interface

uses
  DUnitX.TestFramework,
  OperacaoFiscalIbsCbsEtdUnit,
  OperacaoFiscalIbsCbsCondicaoEtdUnit,
  CreateEntityUseCaseOutputUnit,
  SalvarOperacaoFiscalIbsCbsUseCaseUnit,
  StubOperacoesFiscaisIbsCbsRepositoryUnit;

type
  [TestFixture]
  TTestSalvarOperacaoFiscalIbsCbsUseCase = class
  private
    FRepo: TOperacoesFiscaisIbsCbsRepositoryStub;
    FUseCase: SalvarOperacaoFiscalIbsCbsUseCase;
    function Executar(const AId: string;
      const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray): CreateEntityUseCaseOutPut;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveManterCondicoesValidasIncluindoUniversal;

    [Test]
    procedure DeveNormalizarDuplicatasDeValor;

    [Test]
    procedure DeveRejeitarCondicaoSemValores;

    [Test]
    procedure DeveRejeitarAtributoDuplicado;

    [Test]
    procedure DeveRejeitarValorForaDoDominio;

    [Test]
    procedure DeveChamarPostParaRegistroNovo;

    [Test]
    procedure DeveChamarPutParaRegistroExistente;

    [Test]
    procedure DeveRegistrarAtributoCondicoesNoMetadata;
  end;

implementation

uses
  SysUtils,
  TipoComunsUnit,
  StringNullableUnit,
  DateAndTimeNullableUnit,
  StatusRegistroEnumUnit,
  EntityMetadataUnit,
  OperacaoFiscalIbsCbsMetadataUnit;

const
  OPERACAO_INTERNA_ID = 'OP-TESTE';
  REGRA_FISCAL_ID = 'REGRA-TESTE';
  CAMPO_CONDICOES = 'Condicoes';

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

function CriarEntidade(const AId: string): OperacaoFiscalIbsCbsEtd;
var
  EmpresasId: TArrayInteger;
begin
  SetLength(EmpresasId, 0);

  if AId = '' then
  begin
    Result := OperacaoFiscalIbsCbsEtd.Create();
    Result.OperacaoInternaId := OPERACAO_INTERNA_ID;
    Result.RegraFiscalId := REGRA_FISCAL_ID;
  end
  else
    Result := OperacaoFiscalIbsCbsEtd.Create(
      AId,
      OPERACAO_INTERNA_ID,
      REGRA_FISCAL_ID,
      StringNullable.NullInstance(),
      EncodeDate(2026, 1, 1),
      DateNullable.NullInstance(),
      Now(),
      Now(),
      saAtivo,
      EmpresasId
    );
end;

function PossuiErroCondicoes(const ASaida: CreateEntityUseCaseOutPut): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to High(ASaida.Validation.Validations) do
    if ASaida.Validation.Validations[I].FieldName = CAMPO_CONDICOES then
      Exit(True);
end;

{ TTestSalvarOperacaoFiscalIbsCbsUseCase }

procedure TTestSalvarOperacaoFiscalIbsCbsUseCase.Setup;
begin
  FRepo := TOperacoesFiscaisIbsCbsRepositoryStub.Create;
  FUseCase := SalvarOperacaoFiscalIbsCbsUseCase.Create(FRepo);
end;

procedure TTestSalvarOperacaoFiscalIbsCbsUseCase.TearDown;
begin
  FUseCase.Free;
  FRepo.Free;
end;

function TTestSalvarOperacaoFiscalIbsCbsUseCase.Executar(const AId: string;
  const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray): CreateEntityUseCaseOutPut;
var
  Entidade: OperacaoFiscalIbsCbsEtd;
begin
  Entidade := CriarEntidade(AId);
  Entidade.Condicoes := ACondicoes;

  Result := FUseCase.Executar(Entidade);

  // Em caso de validacao o caso de uso nao transfere a posse da entidade.
  if Result.OutputObj = nil then
    Entidade.Free;
end;

procedure TTestSalvarOperacaoFiscalIbsCbsUseCase.DeveManterCondicoesValidasIncluindoUniversal;
var
  Saida: CreateEntityUseCaseOutPut;
  Resultado: OperacaoFiscalIbsCbsEtd;
begin
  Saida := Executar('', Condicoes([
    Condicao(ocaTipoEmissao, [1, 2]),
    Condicao(ocaNaturezaEmissao, [2])
  ]));
  try
    Assert.IsNotNull(Saida.OutputObj);
    Assert.IsTrue(FRepo.PostChamado);

    Resultado := OperacaoFiscalIbsCbsEtd(Saida.OutputObj);

    Assert.AreEqual(2, Length(Resultado.Condicoes));
    Assert.IsTrue(Resultado.Condicoes[0].Atributo = ocaTipoEmissao);
    Assert.AreEqual(2, Length(Resultado.Condicoes[0].Valores));
    Assert.AreEqual(1, Resultado.Condicoes[0].Valores[0]);
    Assert.AreEqual(2, Resultado.Condicoes[0].Valores[1]);
    Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.EhUniversal(Resultado.Condicoes[0]));
    Assert.IsTrue(Resultado.Condicoes[1].Atributo = ocaNaturezaEmissao);
  finally
    Saida.Free;
  end;
end;

procedure TTestSalvarOperacaoFiscalIbsCbsUseCase.DeveNormalizarDuplicatasDeValor;
var
  Saida: CreateEntityUseCaseOutPut;
  Resultado: OperacaoFiscalIbsCbsEtd;
begin
  Saida := Executar('', Condicoes([
    Condicao(ocaTipoEmissao, [2, 1, 1])
  ]));
  try
    Assert.IsNotNull(Saida.OutputObj);

    Resultado := OperacaoFiscalIbsCbsEtd(Saida.OutputObj);

    Assert.AreEqual(1, Length(Resultado.Condicoes));
    Assert.AreEqual(2, Length(Resultado.Condicoes[0].Valores));
    Assert.AreEqual(1, Resultado.Condicoes[0].Valores[0]);
    Assert.AreEqual(2, Resultado.Condicoes[0].Valores[1]);
  finally
    Saida.Free;
  end;
end;

procedure TTestSalvarOperacaoFiscalIbsCbsUseCase.DeveRejeitarCondicaoSemValores;
var
  Saida: CreateEntityUseCaseOutPut;
begin
  Saida := Executar('', Condicoes([
    Condicao(ocaTipoEmissao, [])
  ]));
  try
    Assert.IsNull(Saida.OutputObj);
    Assert.IsTrue(PossuiErroCondicoes(Saida));
    Assert.IsFalse(FRepo.PostChamado);
    Assert.IsFalse(FRepo.PutChamado);
  finally
    Saida.Free;
  end;
end;

procedure TTestSalvarOperacaoFiscalIbsCbsUseCase.DeveRejeitarAtributoDuplicado;
var
  Saida: CreateEntityUseCaseOutPut;
begin
  Saida := Executar('', Condicoes([
    Condicao(ocaTipoEmissao, [1]),
    Condicao(ocaTipoEmissao, [2])
  ]));
  try
    Assert.IsNull(Saida.OutputObj);
    Assert.IsTrue(PossuiErroCondicoes(Saida));
    Assert.IsFalse(FRepo.PostChamado);
    Assert.IsFalse(FRepo.PutChamado);
  finally
    Saida.Free;
  end;
end;

procedure TTestSalvarOperacaoFiscalIbsCbsUseCase.DeveRejeitarValorForaDoDominio;
var
  Saida: CreateEntityUseCaseOutPut;
begin
  Saida := Executar('', Condicoes([
    Condicao(ocaTipoEmissao, [7])
  ]));
  try
    Assert.IsNull(Saida.OutputObj);
    Assert.IsTrue(PossuiErroCondicoes(Saida));
    Assert.IsFalse(FRepo.PostChamado);
    Assert.IsFalse(FRepo.PutChamado);
  finally
    Saida.Free;
  end;
end;

procedure TTestSalvarOperacaoFiscalIbsCbsUseCase.DeveChamarPostParaRegistroNovo;
var
  Saida: CreateEntityUseCaseOutPut;
begin
  Saida := Executar('', Condicoes([
    Condicao(ocaTipoEmissao, [1])
  ]));
  try
    Assert.IsNotNull(Saida.OutputObj);
    Assert.IsTrue(FRepo.PostChamado);
    Assert.IsFalse(FRepo.PutChamado);
  finally
    Saida.Free;
  end;
end;

procedure TTestSalvarOperacaoFiscalIbsCbsUseCase.DeveChamarPutParaRegistroExistente;
var
  Saida: CreateEntityUseCaseOutPut;
begin
  Saida := Executar('ID-EXISTENTE', Condicoes([
    Condicao(ocaTipoEmissao, [1])
  ]));
  try
    Assert.IsNotNull(Saida.OutputObj);
    Assert.IsTrue(FRepo.PutChamado);
    Assert.IsFalse(FRepo.PostChamado);
  finally
    Saida.Free;
  end;
end;

procedure TTestSalvarOperacaoFiscalIbsCbsUseCase.DeveRegistrarAtributoCondicoesNoMetadata;
var
  Metadata: EntityMetadata;
  Display: string;
  DisplayEsperado: string;
begin
  Metadata := TOperacaoFiscalIbsCbsMetadata.GetMetadata();

  Assert.IsTrue(Metadata.TryGetDisplayAttribute(CAMPO_CONDICOES, Display));

  // Texto com acentos montado por codigo para preservar a codificacao do fonte.
  DisplayEsperado := 'Condi' + #231 + #245 + 'es de aplicabilidade';
  Assert.AreEqual(DisplayEsperado, Display);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestSalvarOperacaoFiscalIbsCbsUseCase);

end.
