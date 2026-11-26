unit Teste_BaseCalculoUnificadaInput;

interface

uses
  DUnitX.TestFramework,
  IBaseCalculoUnificadaServiceUnit;

type
  [TestFixture]
  TTeste_BaseCalculoUnificadaInput = class
  private
    FService: IBaseCalculoUnificadaService;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_U1_TresBasesComTodosOsComponentesAtivos;
    [Test]
    procedure teste_U2_PisCofins_2026Compoe;
    [Test]
    procedure teste_U2_PisCofins_2027Avisa;
    [Test]
    procedure teste_U3_VIS_2026Avisa;
    [Test]
    procedure teste_U3_VIS_2027Compoe;
    [Test]
    procedure teste_U4_FamiliaICMS_2032Compoe;
    [Test]
    procedure teste_U4_FamiliaICMS_2033Avisa;
    [Test]
    procedure teste_U5_VISSQN_Servico;
    [Test]
    procedure teste_U5_VISSQN_BemAvisa;
    [Test]
    procedure teste_U5_CamposDeBem_IgnoradosParaServico;
    [Test]
    procedure teste_U6_CamposModelo55_IgnoradosNo65;
    [Test]
    procedure teste_CampoIgnoradoZeroOuAusente_SemAviso;
    [Test]
    procedure teste_AvisosNaoAlteramBases;
    [Test]
    procedure teste_TipoDocumento44_LancaExcecao;
    [Test]
    procedure teste_T10_ArredondamentoUnico;
  end;

implementation

uses
  System.SysUtils,
  CurrencyNullableUnit,
  IntegerNullableUnit,
  BaseCalculoNaturezaEnumUnit,
  ComponentesBaseCalculoInputUnit,
  BaseCalculoUnificadaOutputUnit,
  BaseCalculoUnificadaServiceUnit,
  DecimalCalculoUnit,
  EValidacaoRTCUnit;

const
  MSG_TIPO_DOCUMENTO_INVALIDO = 'Tipo de documento deve ser 55 (NF-e) ou 65 (NFC-e)';
  MSG_VIGENCIA =
    'Campo %s n'#$00E3'o comp'#$00F5'e as bases para o ano %d (vig'#$00EA'ncia %d'#$2013'%d) e foi ignorado no c'#$00E1'lculo';
  MSG_NATUREZA =
    'Campo %s n'#$00E3'o comp'#$00F5'e as bases para a natureza %s (aplic'#$00E1'vel apenas a %s) e foi ignorado no c'#$00E1'lculo';
  MSG_MODELO =
    'Campo %s n'#$00E3'o comp'#$00F5'e as bases para o documento modelo %d e foi ignorado no c'#$00E1'lculo';

function Moeda(AValor: Currency): CurrencyNullable;
begin
  Result := CurrencyNullable.Create(AValor);
end;

function Ausente: CurrencyNullable;
begin
  Result := CurrencyNullable.NullInstance();
end;

function CriarComponentes(vProd, vFrete, vSeg, vOutro, vII, vIS, vDesc, vPIS,
  vCOFINS, vICMS, vICMSUFDest, vFCP, vFCPUFDest, vICMSMono,
  vISSQN: CurrencyNullable): ComponentesBaseCalculoInput;
begin
  Result := ComponentesBaseCalculoInput.Create();
  Result.VProd := vProd;
  Result.VFrete := vFrete;
  Result.VSeg := vSeg;
  Result.VOutro := vOutro;
  Result.VII := vII;
  Result.VIS := vIS;
  Result.VDesc := vDesc;
  Result.VPIS := vPIS;
  Result.VCOFINS := vCOFINS;
  Result.VICMS := vICMS;
  Result.VICMSUFDest := vICMSUFDest;
  Result.VFCP := vFCP;
  Result.VFCPUFDest := vFCPUFDest;
  Result.VICMSMono := vICMSMono;
  Result.VISSQN := vISSQN;
end;

procedure AssertBase(const AEsperado: string; const AObtido: DecimalCalculo;
  const AMensagem: string);
var
  esperado: DecimalCalculo;
begin
  esperado := DecimalCalculo.DeTexto(AEsperado);
  Assert.IsTrue(AObtido.Comparar(esperado) = 0,
    AMensagem + ': esperado ' + AEsperado + ', obtido ' + AObtido.ParaTexto(8));
end;

procedure AssertAvisos(const AEsperados: array of string;
  const AObtidos: BaseCalculoAvisos; const AMensagem: string);
var
  I, J: Integer;
  encontrado: Boolean;
begin
  Assert.AreEqual(Length(AEsperados), Length(AObtidos),
    AMensagem + ': quantidade de avisos');
  for I := Low(AEsperados) to High(AEsperados) do
  begin
    encontrado := False;
    for J := Low(AObtidos) to High(AObtidos) do
      if AObtidos[J] = AEsperados[I] then
      begin
        encontrado := True;
        Break;
      end;
    Assert.IsTrue(encontrado, AMensagem + ': aviso ausente: ' + AEsperados[I]);
  end;
end;

procedure AssertTresBases(const ARG, AIS, ASN: string;
  const AResultado: BaseCalculoUnificadaOutput; const AMensagem: string);
begin
  AssertBase(ARG, AResultado.BaseRG, AMensagem + ' baseRG');
  AssertBase(AIS, AResultado.BaseIS, AMensagem + ' baseIS');
  AssertBase(ASN, AResultado.BaseSN, AMensagem + ' baseSN');
end;

{ TTeste_BaseCalculoUnificadaInput }

procedure TTeste_BaseCalculoUnificadaInput.Setup;
begin
  FService := BaseCalculoUnificadaService.Create();
end;

procedure TTeste_BaseCalculoUnificadaInput.TearDown;
begin
  FService := nil;
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U1_TresBasesComTodosOsComponentesAtivos;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Moeda(50), Moeda(20), Moeda(10), Moeda(150), Ausente,
    Moeda(50), Moeda(9.25), Moeda(46.25), Moeda(180), Moeda(20), Moeda(10),
    Moeda(5), Moeda(100), Ausente);

  resultado := FService.Calcular(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));

  AssertTresBases('809.50', '809.50', '1030.00', resultado, 'U1');
  AssertAvisos([], resultado.Avisos, 'U1 avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U2_PisCofins_2026Compoe;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente,
    Moeda(100), Moeda(50), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  resultado := FService.Calcular(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));

  AssertTresBases('850.00', '850.00', '1000.00', resultado, 'U2 2026');
  AssertAvisos([], resultado.Avisos, 'U2 2026 avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U2_PisCofins_2027Avisa;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente,
    Moeda(100), Moeda(50), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  resultado := FService.Calcular(componentes, 2027, bcnBem,
    IntegerNullable.Create(55));

  AssertTresBases('1000.00', '1000.00', '1000.00', resultado, 'U2 2027');
  AssertAvisos([
    Format(MSG_VIGENCIA, ['vPIS', 2027, 2026, 2026]),
    Format(MSG_VIGENCIA, ['vCOFINS', 2027, 2026, 2026])],
    resultado.Avisos, 'U2 2027 avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U3_VIS_2026Avisa;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Moeda(30), Ausente,
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  resultado := FService.Calcular(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));

  AssertTresBases('1000.00', '1000.00', '1000.00', resultado, 'U3 2026');
  AssertAvisos([
    Format(MSG_VIGENCIA, ['vIS', 2026, 2027, 2033])],
    resultado.Avisos, 'U3 2026 avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U3_VIS_2027Compoe;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Moeda(30), Ausente,
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  resultado := FService.Calcular(componentes, 2027, bcnBem,
    IntegerNullable.Create(55));

  AssertTresBases('1030.00', '1000.00', '1030.00', resultado, 'U3 2027');
  AssertAvisos([], resultado.Avisos, 'U3 2027 avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U4_FamiliaICMS_2032Compoe;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente,
    Ausente, Moeda(100), Ausente, Moeda(10), Ausente, Moeda(40), Ausente);

  resultado := FService.Calcular(componentes, 2032, bcnBem,
    IntegerNullable.Create(55));

  AssertTresBases('850.00', '850.00', '1000.00', resultado, 'U4 2032');
  AssertAvisos([], resultado.Avisos, 'U4 2032 avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U4_FamiliaICMS_2033Avisa;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente,
    Ausente, Moeda(100), Ausente, Moeda(10), Ausente, Moeda(40), Ausente);

  resultado := FService.Calcular(componentes, 2033, bcnBem,
    IntegerNullable.Create(55));

  AssertTresBases('1000.00', '1000.00', '1000.00', resultado, 'U4 2033');
  AssertAvisos([
    Format(MSG_VIGENCIA, ['vICMS', 2033, 2026, 2032]),
    Format(MSG_VIGENCIA, ['vFCP', 2033, 2026, 2032]),
    Format(MSG_VIGENCIA, ['vICMSMono', 2033, 2026, 2032])],
    resultado.Avisos, 'U4 2033 avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U5_VISSQN_Servico;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente,
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Moeda(50));

  resultado := FService.Calcular(componentes, 2026, bcnServico,
    IntegerNullable.Create(55));

  AssertTresBases('950.00', '950.00', '1000.00', resultado, 'U5 SERVICO');
  AssertAvisos([], resultado.Avisos, 'U5 SERVICO avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U5_VISSQN_BemAvisa;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente,
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Moeda(50));

  resultado := FService.Calcular(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));

  AssertTresBases('1000.00', '1000.00', '1000.00', resultado, 'U5 BEM');
  AssertAvisos([
    Format(MSG_NATUREZA, ['vISSQN', 'BEM', 'SERVICO'])],
    resultado.Avisos, 'U5 BEM avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U5_CamposDeBem_IgnoradosParaServico;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Moeda(150), Ausente, Ausente,
    Ausente, Ausente, Moeda(100), Ausente, Ausente, Ausente, Ausente, Ausente);

  resultado := FService.Calcular(componentes, 2026, bcnServico,
    IntegerNullable.Create(55));

  AssertTresBases('1000.00', '1000.00', '1000.00', resultado, 'U5 SERVICO BEM');
  AssertAvisos([
    Format(MSG_NATUREZA, ['vII', 'SERVICO', 'BEM']),
    Format(MSG_NATUREZA, ['vICMS', 'SERVICO', 'BEM'])],
    resultado.Avisos, 'U5 SERVICO BEM avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_U6_CamposModelo55_IgnoradosNo65;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Moeda(150), Ausente, Ausente,
    Ausente, Ausente, Ausente, Moeda(20), Ausente, Moeda(5), Ausente, Ausente);

  resultado := FService.Calcular(componentes, 2026, bcnBem,
    IntegerNullable.Create(65));

  AssertTresBases('1000.00', '1000.00', '1000.00', resultado, 'U6');
  AssertAvisos([
    Format(MSG_MODELO, ['vII', 65]),
    Format(MSG_MODELO, ['vICMSUFDest', 65]),
    Format(MSG_MODELO, ['vFCPUFDest', 65])],
    resultado.Avisos, 'U6 avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_CampoIgnoradoZeroOuAusente_SemAviso;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Moeda(0),
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  resultado := FService.Calcular(componentes, 2027, bcnBem,
    IntegerNullable.Create(55));

  AssertTresBases('1000.00', '1000.00', '1000.00', resultado, 'zero 2027');
  AssertAvisos([], resultado.Avisos, 'zero 2027 avisos');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_AvisosNaoAlteramBases;
var
  semAvisos, comAvisos: BaseCalculoUnificadaOutput;
  componentesSem, componentesCom: ComponentesBaseCalculoInput;
begin
  componentesSem := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Moeda(50),
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);
  componentesCom := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Moeda(50),
    Moeda(100), Moeda(50), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  semAvisos := FService.Calcular(componentesSem, 2027, bcnBem,
    IntegerNullable.Create(55));
  comAvisos := FService.Calcular(componentesCom, 2027, bcnBem,
    IntegerNullable.Create(55));

  Assert.AreEqual(0, Length(semAvisos.Avisos), 'Cenario sem avisos');
  Assert.AreEqual(2, Length(comAvisos.Avisos), 'Avisos de PIS/COFINS');
  AssertTresBases('950.00', '950.00', '950.00', semAvisos, 'Avisos sem PIS/COFINS');
  AssertTresBases('950.00', '950.00', '950.00', comAvisos, 'Avisos com PIS/COFINS');
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_TipoDocumento44_LancaExcecao;
var
  componentes: ComponentesBaseCalculoInput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente,
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  Assert.WillRaise(
    procedure
    begin
      FService.Calcular(componentes, 2026, bcnBem, IntegerNullable.Create(44));
    end,
    EValidacaoRTC,
    MSG_TIPO_DOCUMENTO_INVALIDO);
end;

procedure TTeste_BaseCalculoUnificadaInput.teste_T10_ArredondamentoUnico;
var
  componentes: ComponentesBaseCalculoInput;
  publicado, exato: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Moeda(10.005), Ausente, Ausente, Ausente, Ausente, Moeda(0),
    Moeda(9.25), Moeda(46.25), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  exato := FService.CalcularExato(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));
  publicado := FService.Calcular(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));

  AssertTresBases('954.505', '954.505', '1010.005', exato, 'T10 nucleo exato');
  AssertTresBases('954.50', '954.50', '1010.00', publicado, 'T10 publicado');
  AssertAvisos([], publicado.Avisos, 'T10 avisos');
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_BaseCalculoUnificadaInput);

end.
