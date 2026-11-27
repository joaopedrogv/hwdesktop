unit Test_ValidacaoNFSeFactoryIbsCbs;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  ValidacaoNFSeFactoryUnit,
  IEntityValidatorUnit,
  ValidationEntityOutputUnit,
  NFSeEtdUnit,
  NFSeTypesUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  DateAndTimeNullableUnit;

type
  [TestFixture]
  TTestValidacaoNFSeFactoryIbsCbs = class
  private
    function CriarNFSe(const ASituacao: SituacaoNFSeEnum): NFSeEtd;
    function CriarContexto(const ACst, ACClassTrib: string;
      const ADataReferencia: DateNullable; AClassificacaoEncontrada: Boolean;
      const ACstEsperado: string; AIndicadorGrupoIbsCbs: Integer;
      ADetalhamentoInformado: Boolean = False): TValidacaoIbsCbsNFSeContext;
    function ContemValidacao(const Saida: ValidationEntityOutput; const AChave: string): Boolean;
    function DetalheValidacao(const Saida: ValidationEntityOutput; const AChave: string): string;
  public
    [Test]
    procedure DeveAceitarDpsIntegraQuandoContextoNulo;

    [Test]
    procedure DeveAceitarDpsIntegraNaAssinaturaSemContexto;

    [Test]
    procedure DeveRecusarCompetenciaAnteriorAJaneiroDe2026;

    [Test]
    procedure DeveAceitarCompetenciaAPartirDeJaneiroDe2026;

    [Test]
    procedure DeveRecusarFinalidadeDiferenteDeRegular;

    [Test]
    procedure DeveExigirCIndOpQuandoIndicadorDoGrupoForUm;

    [Test]
    procedure DeveAceitarCIndOpInformadoQuandoIndicadorDoGrupoForUm;

    [Test]
    procedure DeveAceitarCIndOpVazioQuandoIndicadorDoGrupoForZero;

    [Test]
    procedure DeveAceitarCIndOpVazioQuandoIndicadorNaoResolvido;

    [Test]
    procedure DeveRecusarCIndOpPreenchidoQuandoIndicadorDoGrupoForZero;

    [Test]
    procedure DeveRecusarDetalhamentoQuandoIndicadorDoGrupoForZero;

    [Test]
    procedure DeveRecusarClassificacaoInexistenteOuForaDeVigencia;

    [Test]
    procedure DeveRecusarCstDivergenteDoEsperado;

    [Test]
    procedure DeveAceitarCstCoerenteComAClassificacao;

    [Test]
    procedure DeveAplicarRegrasNaReemissaoDeRejeitada;

    [Test]
    procedure DeveIgnorarRegrasDeDataQuandoDataAusente;

    [Test]
    procedure DeveRecusarXInfCompAcimaDoTamanhoMaximoNaEmissao;

    [Test]
    procedure DeveAceitarXInfCompNoLimiteMaximoNaEmissao;

    [Test]
    procedure DeveAceitarXInfCompVazioOuNuloNaEmissao;
  end;

implementation

function TTestValidacaoNFSeFactoryIbsCbs.CriarNFSe(const ASituacao: SituacaoNFSeEnum): NFSeEtd;
begin
  Result := NFSeEtd.Create();
  Result.Situacao := ASituacao;
  Result.NaturezaEmissao := nemtPrestadorWS;
  Result.LayoutNFSe := lytNacionalComIbsCbs;
  Result.CodCliente := IntegerNullable.Create(1);
  Result.CodServico := IntegerNullable.Create(1);
  Result.CTribNac := StringNullable.Create('010701');
  Result.XDescServ := StringNullable.Create('Serviço prestado');
end;

function TTestValidacaoNFSeFactoryIbsCbs.CriarContexto(const ACst, ACClassTrib: string;
  const ADataReferencia: DateNullable; AClassificacaoEncontrada: Boolean;
  const ACstEsperado: string; AIndicadorGrupoIbsCbs: Integer;
  ADetalhamentoInformado: Boolean): TValidacaoIbsCbsNFSeContext;
begin
  Result := TValidacaoIbsCbsNFSeContext.Create(ACst, ACClassTrib, ADataReferencia,
    AClassificacaoEncontrada, ACstEsperado, AIndicadorGrupoIbsCbs, ADetalhamentoInformado);
end;

function TTestValidacaoNFSeFactoryIbsCbs.ContemValidacao(const Saida: ValidationEntityOutput;
  const AChave: string): Boolean;
var
  I: Integer;
begin
  for I := 0 to High(Saida.Validations) do
    if SameText(Saida.Validations[I].FieldName, AChave) then
    begin
      Result := True;
      Exit;
    end;

  Result := False;
end;

function TTestValidacaoNFSeFactoryIbsCbs.DetalheValidacao(const Saida: ValidationEntityOutput;
  const AChave: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to High(Saida.Validations) do
    if SameText(Saida.Validations[I].FieldName, AChave) then
    begin
      Result := Saida.Validations[I].Detail;
      Exit;
    end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveAceitarDpsIntegraQuandoContextoNulo;
var
  NFSe: NFSeEtd;
  Validador: IEntityValidator;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, nil);

    Assert.IsTrue(Validador.IsValid());
  finally
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveAceitarDpsIntegraNaAssinaturaSemContexto;
var
  NFSe: NFSeEtd;
  Validador: IEntityValidator;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe);

    Assert.IsTrue(Validador.IsValid());
  finally
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveRecusarCompetenciaAnteriorAJaneiroDe2026;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.DCompet := DateNullable.Create(EncodeDate(2025, 12, 31));
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2025, 12, 31)),
    True, '200', 0);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);
    Saida := Validador.Result();

    Assert.IsFalse(Validador.IsValid());
    Assert.IsTrue(ContemValidacao(Saida, 'DCompet'));
    Assert.IsTrue(Pos('01/01/2026', DetalheValidacao(Saida, 'DCompet')) > 0);
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveAceitarCompetenciaAPartirDeJaneiroDe2026;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.DCompet := DateNullable.Create(EncodeDate(2026, 1, 1));
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2026, 1, 1)),
    True, '200', 0);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);

    Assert.IsTrue(Validador.IsValid());
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveRecusarFinalidadeDiferenteDeRegular;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.FinNFSe := 1;
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2026, 1, 5)),
    True, '200', 0);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);
    Saida := Validador.Result();

    Assert.IsFalse(Validador.IsValid());
    Assert.IsTrue(ContemValidacao(Saida, 'FinNFSe'));
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveExigirCIndOpQuandoIndicadorDoGrupoForUm;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2026, 1, 5)),
    True, '200', 1);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);
    Saida := Validador.Result();

    Assert.IsFalse(Validador.IsValid());
    Assert.IsTrue(ContemValidacao(Saida, 'CIndOp'));
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveAceitarCIndOpInformadoQuandoIndicadorDoGrupoForUm;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.CIndOp := StringNullable.Create('01');
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2026, 1, 5)),
    True, '200', 1);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);

    Assert.IsTrue(Validador.IsValid());
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveAceitarCIndOpVazioQuandoIndicadorDoGrupoForZero;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2026, 1, 5)),
    True, '200', 0);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);

    Assert.IsTrue(Validador.IsValid());
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveAceitarCIndOpVazioQuandoIndicadorNaoResolvido;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2026, 1, 5)),
    True, '200', -1);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);

    Assert.IsTrue(Validador.IsValid());
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveRecusarCIndOpPreenchidoQuandoIndicadorDoGrupoForZero;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.CIndOp := StringNullable.Create('01');
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2026, 1, 5)),
    True, '200', 0);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);
    Saida := Validador.Result();

    Assert.IsFalse(Validador.IsValid());
    Assert.IsTrue(ContemValidacao(Saida, 'CIndOp'));
    Assert.IsTrue(Pos('remova', DetalheValidacao(Saida, 'CIndOp')) > 0);
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveRecusarDetalhamentoQuandoIndicadorDoGrupoForZero;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2026, 1, 5)),
    True, '200', 0, True);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);
    Saida := Validador.Result();

    Assert.IsFalse(Validador.IsValid());
    Assert.IsTrue(ContemValidacao(Saida, 'IbsCbs'));
    Assert.IsTrue(Pos('remova o detalhamento', DetalheValidacao(Saida, 'IbsCbs')) > 0);
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveRecusarClassificacaoInexistenteOuForaDeVigencia;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  Contexto := CriarContexto('200', '999999', DateNullable.Create(EncodeDate(2026, 1, 5)),
    False, '', 0);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);
    Saida := Validador.Result();

    Assert.IsFalse(Validador.IsValid());
    Assert.IsTrue(ContemValidacao(Saida, 'IbsCbs.CClassTrib'));
    Assert.IsTrue(Pos('999999', DetalheValidacao(Saida, 'IbsCbs.CClassTrib')) > 0);
    Assert.IsTrue(Pos('05/01/2026', DetalheValidacao(Saida, 'IbsCbs.CClassTrib')) > 0);
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveRecusarCstDivergenteDoEsperado;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.CIndOp := StringNullable.Create('01');
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2026, 1, 5)),
    True, '000', 1);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);
    Saida := Validador.Result();

    Assert.IsFalse(Validador.IsValid());
    Assert.IsTrue(ContemValidacao(Saida, 'IbsCbs.Cst'));
    Assert.IsTrue(Pos('200', DetalheValidacao(Saida, 'IbsCbs.Cst')) > 0);
    Assert.IsTrue(Pos('000', DetalheValidacao(Saida, 'IbsCbs.Cst')) > 0);
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveAceitarCstCoerenteComAClassificacao;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.CIndOp := StringNullable.Create('01');
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2026, 1, 5)),
    True, '200', 1);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);

    Assert.IsTrue(Validador.IsValid());
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveAplicarRegrasNaReemissaoDeRejeitada;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRejeicao);
  NFSe.DCompet := DateNullable.Create(EncodeDate(2025, 12, 31));
  Contexto := CriarContexto('200', '200001', DateNullable.Create(EncodeDate(2025, 12, 31)),
    True, '200', 0);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);
    Saida := Validador.Result();

    Assert.IsFalse(Validador.IsValid());
    Assert.IsTrue(ContemValidacao(Saida, 'DCompet'));
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveIgnorarRegrasDeDataQuandoDataAusente;
var
  NFSe: NFSeEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  Contexto := CriarContexto('200', '999999', DateNullable.NullInstance(),
    False, '', -1);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);
    Saida := Validador.Result();

    Assert.IsTrue(Validador.IsValid());
    Assert.IsFalse(ContemValidacao(Saida, 'DCompet'));
    Assert.IsFalse(ContemValidacao(Saida, 'IbsCbs.CClassTrib'));
    Assert.IsFalse(ContemValidacao(Saida, 'CIndOp'));
  finally
    Contexto.Free;
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveRecusarXInfCompAcimaDoTamanhoMaximoNaEmissao;
var
  NFSe: NFSeEtd;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
  XInfComp: string;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  XInfComp := StringOfChar('A', 2001);
  NFSe.XInfComp := StringNullable.Create(XInfComp);
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe);
    Saida := Validador.Result();

    Assert.IsFalse(Validador.IsValid());
    Assert.IsTrue(ContemValidacao(Saida, 'XInfComp'));
    Assert.AreEqual(XInfComp, NFSe.XInfComp.Value);
  finally
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveAceitarXInfCompNoLimiteMaximoNaEmissao;
var
  NFSe: NFSeEtd;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.XInfComp := StringNullable.Create(StringOfChar('A', 2000));
  try
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe);
    Saida := Validador.Result();

    Assert.IsTrue(Validador.IsValid());
    Assert.IsFalse(ContemValidacao(Saida, 'XInfComp'));
  finally
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeFactoryIbsCbs.DeveAceitarXInfCompVazioOuNuloNaEmissao;
var
  NFSe: NFSeEtd;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  try
    NFSe.XInfComp := StringNullable.NullInstance();
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe);
    Saida := Validador.Result();

    Assert.IsTrue(Validador.IsValid());
    Assert.IsFalse(ContemValidacao(Saida, 'XInfComp'));

    NFSe.XInfComp := StringNullable.Create('   ');
    Validador := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe);
    Saida := Validador.Result();

    Assert.IsTrue(Validador.IsValid());
    Assert.IsFalse(ContemValidacao(Saida, 'XInfComp'));
  finally
    NFSe.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestValidacaoNFSeFactoryIbsCbs);

end.