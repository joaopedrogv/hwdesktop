unit Teste_ProcessamentoItemService;

interface

uses
  DUnitX.TestFramework,
  ProcessamentoItemServiceNovoUnit,
  PreparacaoCalculoServiceInterUnit,
  IPreparacaoCalculoServiceUnit,
  CalcularTributoInputUnit,
  ItemCalculoInputUnit,
  ImpostoSeletivoInputUnit,
  TributacaoRegularInputUnit,
  ComponentesBaseCalculoInputUnit,
  CurrencyNullableUnit,
  CompraGovernamentalInputUnit,
  IntegerNullableUnit,
  IBaseCalculoUnificadaServiceUnit,
  BaseCalculoUnificadaServiceUnit,
  EValidacaoRTCUnit;

type
  [TestFixture]
  TTeste_ProcessamentoItemService = class
  private
    FService: ProcessamentoItemService;
    FPreparacao: IPreparacaoCalculoServiceInter;
    function CriarDocumento(const ATpDoc: IntegerNullable): CalcularTributoInput;
    function CriarItem(const ANcm: string; const ABaseCalculo: CurrencyNullable;
      const AImpostoSeletivo: ImpostoSeletivoInput;
      const AComponentes: ComponentesBaseCalculoInput): ItemCalculoInput;
    function CriarComponentes: ComponentesBaseCalculoInput;
    function CriarComponentesNegativos: ComponentesBaseCalculoInput;
    function Moeda(AValor: Currency): CurrencyNullable;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_P1_PreencheBaseItem_QuandoSomenteComponentes;
    [Test]
    procedure teste_P1_AceitaBaseItemConsistente;
    [Test]
    procedure teste_P1_RejeitaBaseItemDivergente_Reg034;
    [Test]
    procedure teste_P1_BaseItemZeroInformada_DivergeDaBaseCalculada;
    [Test]
    procedure teste_P2_PreencheBaseIS_QuandoImpostoSeletivoSemBase;
    [Test]
    procedure teste_P2_PreencheBaseISZero_QuandoBaseCalculadaZero;
    [Test]
    procedure teste_P2_BaseISZeroInformada_DivergeDaBaseCalculada;
    [Test]
    procedure teste_P2_NaoValidaBaseItem_QuandoHaImpostoSeletivo;
    [Test]
    procedure teste_P2_AceitaBaseISConsistente;
    [Test]
    procedure teste_P2_RejeitaBaseISDivergente_Reg034;
    [Test]
    procedure teste_P3_RejeitaTipoDocumentoAusente;
    [Test]
    procedure teste_P3_RejeitaTipoDocumentoInvalido;
    [Test]
    procedure teste_BaseNegativa_SemIS_LancaErro;
    [Test]
    procedure teste_BaseNegativa_ComIS_LancaErro;
    [Test]
    procedure teste_SemComponentes_NaoAcionaValidacao;
    [Test]
    procedure teste_ProcessarItem_ComponentesSemTipo_LancaAntesDoFluxoLegado;
    [Test]
    procedure teste_Preparar_ComponentesSemTipo_LancaAntesDoFluxoLegado;
  end;

implementation

uses
  SysUtils;

function TTeste_ProcessamentoItemService.Moeda(AValor: Currency): CurrencyNullable;
begin
  Result := CurrencyNullable.Create(AValor);
end;

function TTeste_ProcessamentoItemService.CriarComponentes: ComponentesBaseCalculoInput;
begin
  Result := ComponentesBaseCalculoInput.Create();
  Result.VProd := Moeda(1000);
  Result.VFrete := Moeda(50);
  Result.VSeg := Moeda(20);
  Result.VDesc := Moeda(40);
  Result.VICMS := Moeda(180);
end;

function TTeste_ProcessamentoItemService.CriarComponentesNegativos: ComponentesBaseCalculoInput;
begin
  Result := ComponentesBaseCalculoInput.Create();
  Result.VProd := Moeda(100);
  Result.VPIS := Moeda(200);
end;

function TTeste_ProcessamentoItemService.CriarDocumento(
  const ATpDoc: IntegerNullable): CalcularTributoInput;
begin
  Result := CalcularTributoInput.Create(
    EncodeDate(2026, 1, 1), 4314902, 'RS', nil,
    CompraGovernamentalInput.NullInstance(), 0, ATpDoc);
end;

function TTeste_ProcessamentoItemService.CriarItem(const ANcm: string;
  const ABaseCalculo: CurrencyNullable;
  const AImpostoSeletivo: ImpostoSeletivoInput;
  const AComponentes: ComponentesBaseCalculoInput): ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    1, ANcm, '000001', '000', AImpostoSeletivo,
    TributacaoRegularInput.NullInstance(), ABaseCalculo, CurrencyNullable.Create(1), 'UN',
    AComponentes);
end;

procedure TTeste_ProcessamentoItemService.Setup;
var
  baseCalculo: IBaseCalculoUnificadaService;
begin
  baseCalculo := BaseCalculoUnificadaService.Create();
  FService := ProcessamentoItemService.Create(
    nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, baseCalculo);
  FPreparacao := PreparacaoCalculoServiceInter.Create(
    nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, baseCalculo);
end;

procedure TTeste_ProcessamentoItemService.TearDown;
begin
  FPreparacao := nil;
  FService.Free();
  FService := nil;
end;

procedure TTeste_ProcessamentoItemService.teste_P1_PreencheBaseItem_QuandoSomenteComponentes;
var
  item, ajustado: ItemCalculoInput;
  documentoCalc: CalcularTributoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.NullInstance(), ImpostoSeletivoInput.NullInstance(),
    CriarComponentes());

  ajustado := FService.ValidarBaseCalculoComComponentes(
    documentoCalc, item, documentoCalc.TpDoc);

  Assert.IsFalse(ajustado.BaseCalculo.IsNull, 'base preenchida deve ser marcada como presente');
  Assert.IsTrue(ajustado.BaseCalculo.Value = 850, 'base preenchida deve ser 850,00');
  Assert.IsTrue(item.BaseCalculo.IsNull, 'item de entrada nao deve ser alterado');
end;

procedure TTeste_ProcessamentoItemService.teste_P1_AceitaBaseItemConsistente;
var
  documentoCalc: CalcularTributoInput;
  item, ajustado: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.Create(850), ImpostoSeletivoInput.NullInstance(),
    CriarComponentes());

  ajustado := FService.ValidarBaseCalculoComComponentes(
    documentoCalc, item, documentoCalc.TpDoc);

  Assert.IsTrue(ajustado.BaseCalculo.Value = 850, 'base declarada consistente deve ser mantida');
end;

procedure TTeste_ProcessamentoItemService.teste_P1_RejeitaBaseItemDivergente_Reg034;
var
  documentoCalc: CalcularTributoInput;
  item: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.Create(900), ImpostoSeletivoInput.NullInstance(),
    CriarComponentes());

  try
    FService.ValidarBaseCalculoComComponentes(documentoCalc, item, documentoCalc.TpDoc);
    Assert.Fail('Deveria lancar EValidacaoRTC para base divergente');
  except
    on E: EValidacaoRTC do
    begin
      Assert.AreEqual('REG-034', E.Codigo, 'codigo da divergencia');
      Assert.IsTrue(Pos('900.00', E.Message) > 0, 'mensagem deve citar a base declarada: ' + E.Message);
      Assert.IsTrue(Pos('850.00', E.Message) > 0, 'mensagem deve citar a base calculada: ' + E.Message);
    end;
  end;
end;

procedure TTeste_ProcessamentoItemService.teste_P1_BaseItemZeroInformada_DivergeDaBaseCalculada;
var
  documentoCalc: CalcularTributoInput;
  item: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.Create(0), ImpostoSeletivoInput.NullInstance(),
    CriarComponentes());

  try
    FService.ValidarBaseCalculoComComponentes(documentoCalc, item, documentoCalc.TpDoc);
    Assert.Fail('Zero informado deve ser comparado, nao tratado como ausente');
  except
    on E: EValidacaoRTC do
    begin
      Assert.AreEqual('REG-034', E.Codigo, 'codigo da divergencia');
      Assert.IsTrue(Pos('(0.00)', E.Message) > 0, 'mensagem deve citar a base declarada: ' + E.Message);
      Assert.IsTrue(Pos('(850.00)', E.Message) > 0, 'mensagem deve citar a base calculada: ' + E.Message);
    end;
  end;
end;

procedure TTeste_ProcessamentoItemService.teste_P2_PreencheBaseIS_QuandoImpostoSeletivoSemBase;
var
  documentoCalc: CalcularTributoInput;
  item, ajustado: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.NullInstance(),
    ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.NullInstance(), CurrencyNullable.Create(1), 'UN', CurrencyNullable.Create(0)),
    CriarComponentes());

  ajustado := FService.ValidarBaseCalculoComComponentes(
    documentoCalc, item, documentoCalc.TpDoc);

  Assert.IsFalse(ajustado.ImpostoSeletivo.BaseCalculo.IsNull,
    'base do IS preenchida deve ficar presente');
  Assert.IsTrue(ajustado.ImpostoSeletivo.BaseCalculo.Value = 850,
    'base do IS deve ser preenchida com 850,00');
  Assert.IsTrue(ajustado.BaseCalculo.IsNull, 'item.baseCalculo nao deve ser preenchido com IS');
end;

procedure TTeste_ProcessamentoItemService.teste_P2_PreencheBaseISZero_QuandoBaseCalculadaZero;
var
  documentoCalc: CalcularTributoInput;
  item, ajustado: ItemCalculoInput;
  componentes: ComponentesBaseCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  componentes := ComponentesBaseCalculoInput.Create();
  componentes.VProd := Moeda(0);
  item := CriarItem('24021000', CurrencyNullable.NullInstance(),
    ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.NullInstance(), CurrencyNullable.Create(1), 'UN', CurrencyNullable.Create(0)),
    componentes);

  ajustado := FService.ValidarBaseCalculoComComponentes(
    documentoCalc, item, documentoCalc.TpDoc);

  Assert.IsFalse(ajustado.ImpostoSeletivo.BaseCalculo.IsNull,
    'base do IS preenchida com zero deve ficar presente');
  Assert.IsTrue(ajustado.ImpostoSeletivo.BaseCalculo.Value = 0,
    'base do IS deve ser preenchida com zero');
  Assert.IsTrue(ajustado.BaseCalculo.IsNull, 'item.baseCalculo nao deve ser preenchido com IS');
end;

procedure TTeste_ProcessamentoItemService.teste_P2_BaseISZeroInformada_DivergeDaBaseCalculada;
var
  documentoCalc: CalcularTributoInput;
  item: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.NullInstance(),
    ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.Create(0), CurrencyNullable.Create(1), 'UN', CurrencyNullable.Create(0)),
    CriarComponentes());

  try
    FService.ValidarBaseCalculoComComponentes(documentoCalc, item, documentoCalc.TpDoc);
    Assert.Fail('Zero informado deve ser comparado, nao tratado como ausente');
  except
    on E: EValidacaoRTC do
    begin
      Assert.AreEqual('REG-034', E.Codigo, 'codigo da divergencia');
      Assert.IsTrue(Pos('(0.00)', E.Message) > 0, 'mensagem deve citar a base declarada: ' + E.Message);
      Assert.IsTrue(Pos('(850.00)', E.Message) > 0, 'mensagem deve citar a base calculada: ' + E.Message);
    end;
  end;
end;

procedure TTeste_ProcessamentoItemService.teste_P2_NaoValidaBaseItem_QuandoHaImpostoSeletivo;
var
  documentoCalc: CalcularTributoInput;
  item, ajustado: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.Create(123),
    ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.Create(850), CurrencyNullable.Create(1), 'UN', CurrencyNullable.Create(0)),
    CriarComponentes());

  ajustado := FService.ValidarBaseCalculoComComponentes(
    documentoCalc, item, documentoCalc.TpDoc);

  Assert.IsTrue(ajustado.BaseCalculo.Value = 123, 'item.baseCalculo nao deve ser validado com IS');
end;

procedure TTeste_ProcessamentoItemService.teste_P2_AceitaBaseISConsistente;
var
  documentoCalc: CalcularTributoInput;
  item, ajustado: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.NullInstance(),
    ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.Create(850), CurrencyNullable.Create(1), 'UN', CurrencyNullable.Create(0)),
    CriarComponentes());

  ajustado := FService.ValidarBaseCalculoComComponentes(
    documentoCalc, item, documentoCalc.TpDoc);

  Assert.IsTrue(ajustado.ImpostoSeletivo.BaseCalculo.Value = 850,
    'base do IS consistente deve ser mantida');
end;

procedure TTeste_ProcessamentoItemService.teste_P2_RejeitaBaseISDivergente_Reg034;
var
  documentoCalc: CalcularTributoInput;
  item: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.NullInstance(),
    ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.Create(999.99), CurrencyNullable.Create(1), 'UN', CurrencyNullable.Create(0)),
    CriarComponentes());

  try
    FService.ValidarBaseCalculoComComponentes(documentoCalc, item, documentoCalc.TpDoc);
    Assert.Fail('Deveria lancar EValidacaoRTC para base do IS divergente');
  except
    on E: EValidacaoRTC do
    begin
      Assert.AreEqual('REG-034', E.Codigo, 'codigo da divergencia');
      Assert.IsTrue(Pos('999.99', E.Message) > 0, 'mensagem deve citar a base declarada: ' + E.Message);
      Assert.IsTrue(Pos('850.00', E.Message) > 0, 'mensagem deve citar a base calculada: ' + E.Message);
    end;
  end;
end;

procedure TTeste_ProcessamentoItemService.teste_P3_RejeitaTipoDocumentoAusente;
var
  documentoCalc: CalcularTributoInput;
  item: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.NullInstance());
  item := CriarItem('24021000', CurrencyNullable.NullInstance(), ImpostoSeletivoInput.NullInstance(),
    CriarComponentes());

  try
    FService.ValidarBaseCalculoComComponentes(documentoCalc, item, documentoCalc.TpDoc);
    Assert.Fail('Deveria lancar EValidacaoRTC para tipo de documento ausente');
  except
    on E: EValidacaoRTC do
      Assert.IsTrue(Pos('Tipo de documento deve ser 55 (NF-e) ou 65 (NFC-e)', E.Message) > 0,
        'mensagem do tipo de documento: ' + E.Message);
  end;
end;

procedure TTeste_ProcessamentoItemService.teste_P3_RejeitaTipoDocumentoInvalido;
var
  documentoCalc: CalcularTributoInput;
  item: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(57));
  item := CriarItem('24021000', CurrencyNullable.NullInstance(), ImpostoSeletivoInput.NullInstance(),
    CriarComponentes());

  try
    FService.ValidarBaseCalculoComComponentes(documentoCalc, item, documentoCalc.TpDoc);
    Assert.Fail('Deveria lancar EValidacaoRTC para tipo de documento invalido');
  except
    on E: EValidacaoRTC do
      Assert.IsTrue(Pos('Tipo de documento deve ser 55 (NF-e) ou 65 (NFC-e)', E.Message) > 0,
        'mensagem do tipo de documento: ' + E.Message);
  end;
end;

procedure TTeste_ProcessamentoItemService.teste_BaseNegativa_SemIS_LancaErro;
var
  documentoCalc: CalcularTributoInput;
  item: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.NullInstance(), ImpostoSeletivoInput.NullInstance(),
    CriarComponentesNegativos());

  try
    FService.ValidarBaseCalculoComComponentes(documentoCalc, item, documentoCalc.TpDoc);
    Assert.Fail('Deveria lancar EValidacaoRTC para base negativa');
  except
    on E: EValidacaoRTC do
    begin
      Assert.IsTrue(Pos('negativa', E.Message) > 0, 'mensagem de base negativa: ' + E.Message);
      Assert.IsTrue(Pos('Imposto Seletivo', E.Message) = 0, 'mensagem nao deve ser do IS');
    end;
  end;
end;

procedure TTeste_ProcessamentoItemService.teste_BaseNegativa_ComIS_LancaErro;
var
  documentoCalc: CalcularTributoInput;
  item: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.Create(55));
  item := CriarItem('24021000', CurrencyNullable.NullInstance(),
    ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.NullInstance(), CurrencyNullable.Create(1), 'UN', CurrencyNullable.Create(0)),
    CriarComponentesNegativos());

  try
    FService.ValidarBaseCalculoComComponentes(documentoCalc, item, documentoCalc.TpDoc);
    Assert.Fail('Deveria lancar EValidacaoRTC para base do IS negativa');
  except
    on E: EValidacaoRTC do
    begin
      Assert.IsTrue(Pos('Imposto Seletivo', E.Message) > 0,
        'mensagem deve identificar a base do IS: ' + E.Message);
      Assert.IsTrue(Pos('negativa', E.Message) > 0, 'mensagem de base negativa: ' + E.Message);
    end;
  end;
end;

procedure TTeste_ProcessamentoItemService.teste_SemComponentes_NaoAcionaValidacao;
var
  documentoCalc: CalcularTributoInput;
  item, ajustado: ItemCalculoInput;
  vazio: ComponentesBaseCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.NullInstance());
  item := CriarItem('24021000', CurrencyNullable.Create(10), ImpostoSeletivoInput.NullInstance(),
    ComponentesBaseCalculoInput.NullInstance());

  ajustado := FService.ValidarBaseCalculoComComponentes(
    documentoCalc, item, documentoCalc.TpDoc);
  Assert.IsTrue(ajustado.BaseCalculo.Value = 10, 'grupo ausente nao deve alterar a base');

  vazio := ComponentesBaseCalculoInput.Create();
  item := CriarItem('24021000', CurrencyNullable.Create(10), ImpostoSeletivoInput.NullInstance(), vazio);
  ajustado := FService.ValidarBaseCalculoComComponentes(
    documentoCalc, item, documentoCalc.TpDoc);
  Assert.IsTrue(ajustado.BaseCalculo.Value = 10, 'grupo vazio nao deve alterar a base');
end;

procedure TTeste_ProcessamentoItemService.teste_ProcessarItem_ComponentesSemTipo_LancaAntesDoFluxoLegado;
var
  documentoCalc: CalcularTributoInput;
  item: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.NullInstance());
  item := CriarItem('24021000', CurrencyNullable.NullInstance(), ImpostoSeletivoInput.NullInstance(),
    CriarComponentes());

  try
    FService.ProcessarItem(documentoCalc, item, documentoCalc.GetFatoGeradorAplicavel());
    Assert.Fail('Deveria lancar EValidacaoRTC antes do fluxo legado');
  except
    on E: EValidacaoRTC do
      Assert.IsTrue(Pos('Tipo de documento deve ser 55 (NF-e) ou 65 (NFC-e)', E.Message) > 0,
        'mensagem do tipo de documento: ' + E.Message);
  end;
end;

procedure TTeste_ProcessamentoItemService.teste_Preparar_ComponentesSemTipo_LancaAntesDoFluxoLegado;
var
  documentoCalc: CalcularTributoInput;
  item: ItemCalculoInput;
begin
  documentoCalc := CriarDocumento(IntegerNullable.NullInstance());
  item := CriarItem('24021000', CurrencyNullable.NullInstance(), ImpostoSeletivoInput.NullInstance(),
    CriarComponentes());

  try
    FPreparacao.Preparar(documentoCalc, item);
    Assert.Fail('Deveria lancar EValidacaoRTC antes do fluxo legado');
  except
    on E: EValidacaoRTC do
      Assert.IsTrue(Pos('Tipo de documento deve ser 55 (NF-e) ou 65 (NFC-e)', E.Message) > 0,
        'mensagem do tipo de documento: ' + E.Message);
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_ProcessamentoItemService);

end.
