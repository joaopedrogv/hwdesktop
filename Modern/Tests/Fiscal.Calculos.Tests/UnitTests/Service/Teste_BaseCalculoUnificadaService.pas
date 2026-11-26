unit Teste_BaseCalculoUnificadaService;

interface

uses
  DUnitX.TestFramework,
  IBaseCalculoUnificadaServiceUnit;

type
  [TestFixture]
  TTeste_BaseCalculoUnificadaService = class
  private
    FService: IBaseCalculoUnificadaService;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_S1_CalculaBaseRG_NFe;
    [Test]
    procedure teste_S2_CalculaBaseRG_NFCe;
    [Test]
    procedure teste_S3_IgnoraCamposNaoAplicaveis;
    [Test]
    procedure teste_S4_BaseNegativaAceitaNoNucleo;
    [Test]
    procedure teste_F3_TodosComponentesAusentes_ZeroZeroZero;
    [Test]
    procedure teste_F4_BaseNegativaPublicada;
    [Test]
    procedure teste_TipoDocumento44_LancaExcecao;
    [Test]
    procedure teste_TipoDocumentoNulo_LancaExcecao;
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
  MSG_NATUREZA =
    'Campo %s n'#$00E3'o comp'#$00F5'e as bases para a natureza %s (aplic'#$00E1'vel apenas a %s) e foi ignorado no c'#$00E1'lculo';

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

{ TTeste_BaseCalculoUnificadaService }

procedure TTeste_BaseCalculoUnificadaService.Setup;
begin
  FService := BaseCalculoUnificadaService.Create();
end;

procedure TTeste_BaseCalculoUnificadaService.TearDown;
begin
  FService := nil;
end;

procedure TTeste_BaseCalculoUnificadaService.teste_S1_CalculaBaseRG_NFe;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Moeda(50), Moeda(20), Ausente, Ausente, Ausente, Moeda(40),
    Ausente, Ausente, Moeda(180), Ausente, Ausente, Ausente, Ausente, Ausente);

  resultado := FService.CalcularExato(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));

  AssertBase('850.00000000', resultado.BaseRG, 'S1 baseRG');
end;

procedure TTeste_BaseCalculoUnificadaService.teste_S2_CalculaBaseRG_NFCe;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Moeda(50), Ausente, Ausente, Moeda(150), Ausente, Moeda(40),
    Ausente, Ausente, Moeda(180), Moeda(20), Ausente, Ausente, Ausente, Ausente);

  resultado := FService.CalcularExato(componentes, 2026, bcnBem,
    IntegerNullable.Create(65));

  AssertBase('830.00000000', resultado.BaseRG, 'S2 baseRG');
end;

procedure TTeste_BaseCalculoUnificadaService.teste_S3_IgnoraCamposNaoAplicaveis;
var
  componentes: ComponentesBaseCalculoInput;
  resultadoBem, resultadoServico: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente,
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Moeda(20));

  resultadoBem := FService.CalcularExato(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));
  resultadoServico := FService.CalcularExato(componentes, 2026, bcnServico,
    IntegerNullable.Create(55));

  AssertBase('1000.00000000', resultadoBem.BaseRG, 'S3 baseRG BEM');
  AssertBase('980.00000000', resultadoServico.BaseRG, 'S3 baseRG SERVICO');
  AssertAvisos([Format(MSG_NATUREZA, ['vISSQN', 'BEM', 'SERVICO'])],
    resultadoBem.Avisos, 'S3 avisos BEM');
  AssertAvisos([], resultadoServico.Avisos, 'S3 avisos SERVICO');
end;

procedure TTeste_BaseCalculoUnificadaService.teste_S4_BaseNegativaAceitaNoNucleo;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(100), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Moeda(200),
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  resultado := FService.CalcularExato(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));

  AssertBase('-100.00000000', resultado.BaseRG, 'S4 baseRG negativa');
end;

procedure TTeste_BaseCalculoUnificadaService.teste_F3_TodosComponentesAusentes_ZeroZeroZero;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente,
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  resultado := FService.Calcular(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));

  AssertBase('0.00000000', resultado.BaseRG, 'F3 baseRG');
  AssertBase('0.00000000', resultado.BaseIS, 'F3 baseIS');
  AssertBase('0.00000000', resultado.BaseSN, 'F3 baseSN');
  Assert.AreEqual('0.00', resultado.BaseRG.ParaTexto(2), 'F3 baseRG publicada');
end;

procedure TTeste_BaseCalculoUnificadaService.teste_F4_BaseNegativaPublicada;
var
  componentes: ComponentesBaseCalculoInput;
  resultado: BaseCalculoUnificadaOutput;
begin
  componentes := CriarComponentes(
    Moeda(100), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Moeda(200),
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  resultado := FService.Calcular(componentes, 2026, bcnBem,
    IntegerNullable.Create(55));

  Assert.AreEqual('-100.00', resultado.BaseRG.ParaTexto(2),
    'F4 base negativa publicada');
end;

procedure TTeste_BaseCalculoUnificadaService.teste_TipoDocumento44_LancaExcecao;
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

procedure TTeste_BaseCalculoUnificadaService.teste_TipoDocumentoNulo_LancaExcecao;
var
  componentes: ComponentesBaseCalculoInput;
begin
  componentes := CriarComponentes(
    Moeda(1000), Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente,
    Ausente, Ausente, Ausente, Ausente, Ausente, Ausente, Ausente);

  Assert.WillRaise(
    procedure
    begin
      FService.CalcularExato(componentes, 2026, bcnBem,
        IntegerNullable.NullInstance());
    end,
    EValidacaoRTC,
    MSG_TIPO_DOCUMENTO_INVALIDO);
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_BaseCalculoUnificadaService);

end.
