unit Test_PrepararNFSeParaEmissaoServiceIndicador;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  PrepararNFSeParaEmissaoServiceUnit,
  IPrepararNFSeParaEmissaoServiceUnit,
  ConfiguracaoNFSeModelUnit,
  NFSeEtdUnit,
  NFSeTypesUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  BooleanNullableUnit,
  DateAndTimeNullableUnit,
  DoubleNullableUnit,
  TipoRegraTributoDFeEnumUnit,
  TributoDFeContextEtdUnit,
  TributoDFeIbsCbsEtdUnit,
  TributoDFeGrupoIbsCbsEtdUnit,
  TributoDFeCredPresOpIbsCbsEtdUnit,
  TributoDFeIbsCbsTribRegEtdUnit,
  TributoDFeOrigemEnumUnit,
  SituacaoTributariaEtdUnit,
  TratamentoClassificacaoEtdUnit,
  ClassificacaoTributariaEtdUnit,
  TratamentoTributarioEtdUnit,
  ValidationEntityOutputUnit,
  StubNFSeRepositoryUnit,
  StubTributosDFeRepositoryUnit,
  StubTratamentoClassificacaoRepositoryUnit,
  StubSituacaoTributariaRepositoryUnit;

type
  [TestFixture]
  TTestPrepararNFSeParaEmissaoServiceIndicador = class
  private
    FNFSeRepo: TNFSeRepositoryStub;
    FTributosRepo: TTributosDFeRepositoryStub;
    FTratamentoRepo: TTratamentoClassificacaoRepositoryStub;
    FSituacaoRepo: TSituacaoTributariaRepositoryStub;
    FService: IPrepararNFSeParaEmissaoService;

    function CriarNFSe(const ASituacao: SituacaoNFSeEnum): NFSeEtd;
    function CriarTributo(const ACst, ACClassTrib: string; const ACredPres: string = '';
      const ATribRegular: string = ''; ADiferimento: Boolean = False): TributoDFeContextEtd;
    function CriarSituacao(const ACst: string; AInGrupoIbsCbs: Boolean): SituacaoTributariaEtd;
    function CriarTratamento(const ACstEsperado: string): TratamentoClassificacaoEtd;
    function CriarConfiguracao: ConfiguracaoNFSeModel;
    function ContemValidacao(const Saida: ValidationEntityOutput; const AChave: string): Boolean;
    function DetalheValidacao(const Saida: ValidationEntityOutput; const AChave: string): string;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveRecusarCIndOpAusenteQuandoIndicadorUm;

    [Test]
    procedure DeveAceitarIndicadorUmComCIndOpInformado;

    [Test]
    procedure DeveRecusarCIndOpPreenchidoQuandoIndicadorZero;

    [Test]
    procedure DeveAceitarIndicadorZeroSemCIndOpEDetalhamento;

    [Test]
    procedure DeveRecusarCreditoPresumidoQuandoIndicadorZero;

    [Test]
    procedure DeveRecusarTributacaoRegularQuandoIndicadorZero;

    [Test]
    procedure DeveRecusarDiferimentoQuandoIndicadorZero;

    [Test]
    procedure DeveAceitarDetalhamentoQuandoIndicadorUm;

    [Test]
    procedure DeveUsarTratamentoClassificacaoApenasComoExistenciaEVigencia;

    [Test]
    procedure NaoDeveConsultarCatalogoQuandoCstVazio;

    [Test]
    procedure NaoDeveCarregarTributoNemConsultarCatalogoParaEmissao;

    [Test]
    procedure NaoDeveCarregarTributoNemConsultarCatalogoParaEmProcessamento;

    [Test]
    procedure NaoDeveCarregarTributoNemConsultarCatalogoParaAutorizada;

    [Test]
    procedure NaoDeveConsultarCatalogoQuandoLayoutSemIbsCbs;

    [Test]
    procedure DeveCarregarTributoUmaUnicaVez;
  end;

implementation

const
  NFSE_ID = 'NFSE-INDICADOR';
  EMPRESA_ID = 1;
  CST_IBSCBS = '200';
  CCLASS_TRIB = '200001';

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.Setup;
begin
  FNFSeRepo := TNFSeRepositoryStub.Create;
  FTributosRepo := TTributosDFeRepositoryStub.Create;
  FTratamentoRepo := TTratamentoClassificacaoRepositoryStub.Create;
  FSituacaoRepo := TSituacaoTributariaRepositoryStub.Create;
  FService := PrepararNFSeParaEmissaoService.Create(
    FNFSeRepo, nil, FTributosRepo, FTratamentoRepo, FSituacaoRepo
  );
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.TearDown;
begin
  FService := nil;
  FSituacaoRepo.Free;
  FTratamentoRepo.Free;
  FTributosRepo.Free;
  FNFSeRepo.Free;
end;

function TTestPrepararNFSeParaEmissaoServiceIndicador.CriarNFSe(
  const ASituacao: SituacaoNFSeEnum): NFSeEtd;
begin
  Result := NFSeEtd.Create();
  Result.Id := NFSE_ID;
  Result.CodEmpresa := EMPRESA_ID;
  Result.CodCliente := IntegerNullable.Create(1);
  Result.NaturezaEmissao := nemtPrestadorWS;
  Result.LayoutNFSe := lytNacionalComIbsCbs;
  Result.Situacao := ASituacao;
  Result.DCompet := DateNullable.Create(EncodeDate(2026, 1, 5));
  Result.NDps := IntegerNullable.Create(1);
  Result.CodServico := IntegerNullable.Create(1);
  Result.CTribNac := StringNullable.Create('010701');
  Result.XDescServ := StringNullable.Create('Servico prestado');
end;

function TTestPrepararNFSeParaEmissaoServiceIndicador.CriarTributo(
  const ACst, ACClassTrib: string; const ACredPres: string;
  const ATribRegular: string; ADiferimento: Boolean): TributoDFeContextEtd;
var
  IbsCbs: TributoDFeIbsCbsEtd;
  Grupo: TributoDFeGrupoIbsCbsEtd;
  CredPres: TributoDFeCredPresOpIbsCbsEtd;
begin
  Grupo := nil;
  if (ATribRegular <> '') or ADiferimento then
  begin
    Grupo := TributoDFeGrupoIbsCbsEtd.Create;

    if ATribRegular <> '' then
      Grupo.TribRegular := TributoDFeIbsCbsTribRegEtd.Create(
        'tribregular', '', ATribRegular, 0, 0, 0, 0, 0, 0);

    if ADiferimento then
    begin
      Grupo.IbsUfPdif := DoubleNullable.Create(1.5);
      Grupo.IbsMunPdif := DoubleNullable.Create(1.5);
      Grupo.CbsPdif := DoubleNullable.Create(1.5);
    end;
  end;

  CredPres := nil;
  if ACredPres <> '' then
    CredPres := TributoDFeCredPresOpIbsCbsEtd.Create(
      'credpres', 0, ACredPres,
      DoubleNullable.NullInstance(), DoubleNullable.NullInstance(), DoubleNullable.NullInstance(),
      DoubleNullable.NullInstance(), DoubleNullable.NullInstance(), DoubleNullable.NullInstance());

  IbsCbs := TributoDFeIbsCbsEtd.Create(
    'ibscbs', StringNullable.NullInstance(), tctAutomatica, ACst, ACClassTrib, False,
    DoubleNullable.NullInstance(), DoubleNullable.NullInstance(),
    Grupo, nil, nil, nil, CredPres, nil
  );
  Result := TributoDFeContextEtd.Create(NFSE_ID, tdfoNFSe, nil, IbsCbs);
end;

function TTestPrepararNFSeParaEmissaoServiceIndicador.CriarSituacao(
  const ACst: string; AInGrupoIbsCbs: Boolean): SituacaoTributariaEtd;
begin
  Result := SituacaoTributariaEtd.Create(
    1, ACst, 'Situacao para teste',
    False, False, AInGrupoIbsCbs, False, False, False, False,
    EncodeDate(2020, 1, 1), DateNullable.NullInstance()
  );
end;

function TTestPrepararNFSeParaEmissaoServiceIndicador.CriarTratamento(
  const ACstEsperado: string): TratamentoClassificacaoEtd;
var
  Classificacao: ClassificacaoTributariaEtd;
begin
  Classificacao := ClassificacaoTributariaEtd.Create(
    1, CCLASS_TRIB, 'Classificacao para teste', '',
    BooleanNullable.NullInstance(), BooleanNullable.NullInstance(),
    BooleanNullable.NullInstance(), BooleanNullable.NullInstance(),
    1, IntegerNullable.NullInstance(), '', StringNullable.NullInstance(), '',
    False, False, False, False, False, False, StringNullable.NullInstance(),
    EncodeDate(2020, 1, 1), DateNullable.NullInstance(), DateNullable.NullInstance(),
    CriarSituacao(ACstEsperado, True)
  );
  Result := TratamentoClassificacaoEtd.Create(
    1, 1, 1, EncodeDate(2020, 1, 1), DateNullable.NullInstance(),
    Classificacao, TratamentoTributarioEtd.NullInstance()
  );
end;

function TTestPrepararNFSeParaEmissaoServiceIndicador.CriarConfiguracao: ConfiguracaoNFSeModel;
begin
  Result := Default(ConfiguracaoNFSeModel);
end;

function TTestPrepararNFSeParaEmissaoServiceIndicador.ContemValidacao(
  const Saida: ValidationEntityOutput; const AChave: string): Boolean;
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

function TTestPrepararNFSeParaEmissaoServiceIndicador.DetalheValidacao(
  const Saida: ValidationEntityOutput; const AChave: string): string;
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

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.DeveRecusarCIndOpAusenteQuandoIndicadorUm;
var
  Resultado: PreparacaoNFSeResult;
begin
  FNFSeRepo.NFSeToReturn := CriarNFSe(sdpsRascunho);
  FTributosRepo.TributoToReturn := CriarTributo(CST_IBSCBS, CCLASS_TRIB);
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);
  FSituacaoRepo.SituacaoToReturn := CriarSituacao(CST_IBSCBS, True);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsFalse(Resultado.Validacoes.IsValid());
    Assert.IsTrue(ContemValidacao(Resultado.Validacoes, 'CIndOp'));
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.DeveAceitarIndicadorUmComCIndOpInformado;
var
  NFSe: NFSeEtd;
  Resultado: PreparacaoNFSeResult;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.CIndOp := StringNullable.Create('01');
  FNFSeRepo.NFSeToReturn := NFSe;
  FTributosRepo.TributoToReturn := CriarTributo(CST_IBSCBS, CCLASS_TRIB);
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);
  FSituacaoRepo.SituacaoToReturn := CriarSituacao(CST_IBSCBS, True);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsTrue(Resultado.Validacoes.IsValid());
    Assert.AreEqual(1, FSituacaoRepo.CallCount);
    Assert.AreEqual(1, FTratamentoRepo.CallCount);
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.DeveRecusarCIndOpPreenchidoQuandoIndicadorZero;
var
  NFSe: NFSeEtd;
  Resultado: PreparacaoNFSeResult;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.CIndOp := StringNullable.Create('01');
  FNFSeRepo.NFSeToReturn := NFSe;
  FTributosRepo.TributoToReturn := CriarTributo(CST_IBSCBS, CCLASS_TRIB);
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);
  FSituacaoRepo.SituacaoToReturn := CriarSituacao(CST_IBSCBS, False);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsFalse(Resultado.Validacoes.IsValid());
    Assert.IsTrue(ContemValidacao(Resultado.Validacoes, 'CIndOp'));
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.DeveAceitarIndicadorZeroSemCIndOpEDetalhamento;
var
  Resultado: PreparacaoNFSeResult;
begin
  FNFSeRepo.NFSeToReturn := CriarNFSe(sdpsRascunho);
  FTributosRepo.TributoToReturn := CriarTributo(CST_IBSCBS, CCLASS_TRIB);
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);
  FSituacaoRepo.SituacaoToReturn := CriarSituacao(CST_IBSCBS, False);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsTrue(Resultado.Validacoes.IsValid());
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.DeveRecusarCreditoPresumidoQuandoIndicadorZero;
var
  Resultado: PreparacaoNFSeResult;
begin
  FNFSeRepo.NFSeToReturn := CriarNFSe(sdpsRascunho);
  FTributosRepo.TributoToReturn := CriarTributo(CST_IBSCBS, CCLASS_TRIB, '01');
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);
  FSituacaoRepo.SituacaoToReturn := CriarSituacao(CST_IBSCBS, False);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsFalse(Resultado.Validacoes.IsValid());
    Assert.IsTrue(ContemValidacao(Resultado.Validacoes, 'IbsCbs'));
    Assert.IsTrue(Pos('detalhamento', DetalheValidacao(Resultado.Validacoes, 'IbsCbs')) > 0);
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.DeveRecusarTributacaoRegularQuandoIndicadorZero;
var
  Resultado: PreparacaoNFSeResult;
begin
  FNFSeRepo.NFSeToReturn := CriarNFSe(sdpsRascunho);
  FTributosRepo.TributoToReturn := CriarTributo(CST_IBSCBS, CCLASS_TRIB, '', CCLASS_TRIB);
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);
  FSituacaoRepo.SituacaoToReturn := CriarSituacao(CST_IBSCBS, False);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsFalse(Resultado.Validacoes.IsValid());
    Assert.IsTrue(ContemValidacao(Resultado.Validacoes, 'IbsCbs'));
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.DeveRecusarDiferimentoQuandoIndicadorZero;
var
  Resultado: PreparacaoNFSeResult;
begin
  FNFSeRepo.NFSeToReturn := CriarNFSe(sdpsRascunho);
  FTributosRepo.TributoToReturn := CriarTributo(CST_IBSCBS, CCLASS_TRIB, '', '', True);
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);
  FSituacaoRepo.SituacaoToReturn := CriarSituacao(CST_IBSCBS, False);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsFalse(Resultado.Validacoes.IsValid());
    Assert.IsTrue(ContemValidacao(Resultado.Validacoes, 'IbsCbs'));
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.DeveAceitarDetalhamentoQuandoIndicadorUm;
var
  NFSe: NFSeEtd;
  Resultado: PreparacaoNFSeResult;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.CIndOp := StringNullable.Create('01');
  FNFSeRepo.NFSeToReturn := NFSe;
  FTributosRepo.TributoToReturn := CriarTributo(CST_IBSCBS, CCLASS_TRIB, '01');
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);
  FSituacaoRepo.SituacaoToReturn := CriarSituacao(CST_IBSCBS, True);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsTrue(Resultado.Validacoes.IsValid());
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.DeveUsarTratamentoClassificacaoApenasComoExistenciaEVigencia;
var
  Resultado: PreparacaoNFSeResult;
begin
  FNFSeRepo.NFSeToReturn := CriarNFSe(sdpsRascunho);
  FTributosRepo.TributoToReturn := CriarTributo(CST_IBSCBS, CCLASS_TRIB);
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsTrue(Resultado.Validacoes.IsValid());
    Assert.AreEqual(1, FSituacaoRepo.CallCount);
    Assert.AreEqual(1, FTratamentoRepo.CallCount);
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.NaoDeveConsultarCatalogoQuandoCstVazio;
var
  Resultado: PreparacaoNFSeResult;
begin
  FNFSeRepo.NFSeToReturn := CriarNFSe(sdpsRascunho);
  FTributosRepo.TributoToReturn := CriarTributo('', CCLASS_TRIB);
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsTrue(FTributosRepo.GetByIdCalled);
    Assert.AreEqual(0, FSituacaoRepo.CallCount);
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.NaoDeveCarregarTributoNemConsultarCatalogoParaEmissao;
var
  Resultado: PreparacaoNFSeResult;
begin
  FNFSeRepo.NFSeToReturn := CriarNFSe(sdpsEmissao);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsFalse(FTributosRepo.GetByIdCalled);
    Assert.AreEqual(0, FSituacaoRepo.CallCount);
    Assert.AreEqual(0, FTratamentoRepo.CallCount);
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.NaoDeveCarregarTributoNemConsultarCatalogoParaEmProcessamento;
var
  Resultado: PreparacaoNFSeResult;
begin
  FNFSeRepo.NFSeToReturn := CriarNFSe(sdpsEmProcessamento);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsFalse(FTributosRepo.GetByIdCalled);
    Assert.AreEqual(0, FSituacaoRepo.CallCount);
    Assert.AreEqual(0, FTratamentoRepo.CallCount);
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.NaoDeveCarregarTributoNemConsultarCatalogoParaAutorizada;
var
  Resultado: PreparacaoNFSeResult;
begin
  FNFSeRepo.NFSeToReturn := CriarNFSe(sdpsAutorizada);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsFalse(FTributosRepo.GetByIdCalled);
    Assert.AreEqual(0, FSituacaoRepo.CallCount);
    Assert.AreEqual(0, FTratamentoRepo.CallCount);
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.NaoDeveConsultarCatalogoQuandoLayoutSemIbsCbs;
var
  NFSe: NFSeEtd;
  Resultado: PreparacaoNFSeResult;
begin
  NFSe := CriarNFSe(sdpsRascunho);
  NFSe.LayoutNFSe := lytNacionalSemIbsCbs;
  FNFSeRepo.NFSeToReturn := NFSe;

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.IsFalse(FTributosRepo.GetByIdCalled);
    Assert.AreEqual(0, FSituacaoRepo.CallCount);
    Assert.AreEqual(0, FTratamentoRepo.CallCount);
  finally
    Resultado.NFSe.Free;
  end;
end;

procedure TTestPrepararNFSeParaEmissaoServiceIndicador.DeveCarregarTributoUmaUnicaVez;
var
  NFSe: NFSeEtd;
  Resultado: PreparacaoNFSeResult;
begin
  NFSe := CriarNFSe(sdpsRejeicao);
  NFSe.CIndOp := StringNullable.Create('01');
  FNFSeRepo.NFSeToReturn := NFSe;
  FTributosRepo.TributoToReturn := CriarTributo(CST_IBSCBS, CCLASS_TRIB);
  FTratamentoRepo.TratamentoToReturn := CriarTratamento(CST_IBSCBS);
  FSituacaoRepo.SituacaoToReturn := CriarSituacao(CST_IBSCBS, True);

  Resultado := FService.Preparar(NFSE_ID, EMPRESA_ID, CriarConfiguracao);
  try
    Assert.AreEqual(1, FTributosRepo.GetByIdCallCount);
    Assert.AreEqual(1, FSituacaoRepo.CallCount);
    Assert.AreEqual(1, FTratamentoRepo.CallCount);
  finally
    Resultado.NFSe.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestPrepararNFSeParaEmissaoServiceIndicador);

end.