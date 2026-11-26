unit Teste_ComponentesBaseCalculo;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TTeste_ComponentesBaseCalculo = class
  public
    [Test]
    procedure teste_Componentes_Ausente_EhNullESemComponentes;

    [Test]
    procedure teste_Componentes_PresenteVazio_NaoEhNullESemComponentes;

    [Test]
    procedure teste_Componentes_PresenteComZero_PossuiComponentes;

    [Test]
    procedure teste_GetValor_NaoInformado_RetornaNulo;

    [Test]
    procedure teste_GetValor_MapeiaOs15Elementos;

    [Test]
    procedure teste_GetValor_ElementoInvalido_LancaExcecao;

    [Test]
    procedure teste_ItemInput_ConstrutorAntigo_SemComponentes;

    [Test]
    procedure teste_ItemInput_ComponentesPresenteVazio_HasGComponentesBCTrue;

    [Test]
    procedure teste_ItemInput_ComponentesComZero_HasGComponentesBCTrueEPossuiComponentes;

    [Test]
    procedure teste_ItemInput_BaseCalculoAusentePorPadrao;

    [Test]
    procedure teste_ItemInput_BaseCalculoAusente_NullInstance;

    [Test]
    procedure teste_ItemInput_BaseCalculoZeroInformado_NaoEhAusente;

    [Test]
    procedure teste_ItemInput_BaseCalculo_SetterAtualizaNulidade;

    [Test]
    procedure teste_ItemInput_QuantidadeAusente_Efetiva1;

    [Test]
    procedure teste_ItemInput_QuantidadeZeroInformada_EfetivaZero;

    [Test]
    procedure teste_ItemInput_SobrecargaCurrency_ConverteParaPresente;

    [Test]
    procedure teste_ImpostoSeletivoInput_SobrecargaDouble_ConverteParaPresente;

    [Test]
    procedure teste_ImpostoSeletivoInput_QuantidadeAusente_IsNullEValorZero;

    [Test]
    procedure teste_ImpostoSeletivoInput_QuantidadeZeroInformada_NaoEhNull;

    [Test]
    procedure teste_ImpostoSeletivoInput_ImpostoInformadoAusente_IsNullEValorZero;

    [Test]
    procedure teste_ImpostoSeletivoInput_ImpostoInformadoZeroInformado_NaoEhNull;

    [Test]
    procedure teste_ImpostoSeletivoInput_ImpostoInformadoPresente_GetterDevolveValor;

    [Test]
    procedure teste_Catalogo_Possui15Elementos;

    [Test]
    procedure teste_Catalogo_OperacaoBasesNaturezaVigenciaETipos;

    [Test]
    procedure teste_PisCofins_2026Compoe_2027NaoCompoe;

    [Test]
    procedure teste_VIS_2026NaoCompoe_2027Compoe;

    [Test]
    procedure teste_FamiliaICMS_2032Compoe_2033NaoCompoe;

    [Test]
    procedure teste_VISSQN_ApenasServico;

    [Test]
    procedure teste_VII_VICMSUFDest_VFCPUFDest_ExcluidosNoModelo65;

    [Test]
    procedure teste_MotivoNaoComposicao_QuandoCompoe_RetornaNulo;

    [Test]
    procedure teste_MotivoNaoComposicao_Vigencia_TextoOficial;

    [Test]
    procedure teste_MotivoNaoComposicao_Natureza_TextoOficial;

    [Test]
    procedure teste_MotivoNaoComposicao_Modelo_TextoOficial;

    [Test]
    procedure teste_MotivoNaoComposicao_OrdemVigenciaAntesDeNaturezaEModelo;

    [Test]
    procedure teste_MotivoNaoComposicao_OrdemNaturezaAntesDeModelo;
  end;

implementation

uses
  System.SysUtils,
  CurrencyNullableUnit,
  StringNullableUnit,
  BaseCalculoBaseEnumUnit,
  BaseCalculoNaturezaEnumUnit,
  BaseCalculoOperacaoEnumUnit,
  ElementoBaseCalculoUnit,
  ComponentesBaseCalculoInputUnit,
  ItemCalculoInputUnit,
  ImpostoSeletivoInputUnit,
  TributacaoRegularInputUnit;

const
  // Textos oficiais da v0073 (ElementoBaseCalculo.java:129,134,139), com os
  // caracteres acentuados e o travessao codificados por codigo para preservar
  // o arquivo em ISO-8859-1.
  MSG_VIGENCIA =
    'Campo %s n'#$00E3'o comp'#$00F5'e as bases para o ano %d (vig'#$00EA'ncia %d'#$2013'%d) e foi ignorado no c'#$00E1'lculo';
  MSG_NATUREZA =
    'Campo %s n'#$00E3'o comp'#$00F5'e as bases para a natureza %s (aplic'#$00E1'vel apenas a %s) e foi ignorado no c'#$00E1'lculo';
  MSG_MODELO =
    'Campo %s n'#$00E3'o comp'#$00F5'e as bases para o documento modelo %d e foi ignorado no c'#$00E1'lculo';

procedure AssertMoeda(ValorEsperado: Currency; const ValorObtido: CurrencyNullable;
  const Mensagem: string);
begin
  Assert.IsTrue(ValorObtido.HasValue, Mensagem + ': valor deveria estar informado');
  Assert.IsTrue(ValorObtido.Value = ValorEsperado, Mensagem +
    ': esperado ' + CurrToStr(ValorEsperado) + ', obtido ' + CurrToStr(ValorObtido.Value));
end;

procedure VerificarElemento(Elemento: ElementoBaseCalculo; const Tag: string;
  Operacao: BaseCalculoOperacao; Bases: BaseCalculoBaseSet;
  Natureza: BaseCalculoNatureza; AnoInicio, AnoFim: Integer;
  TiposDocumento: TipoDocumentoSet);
begin
  Assert.AreEqual(Tag, ElementoBaseCalculoTag(Elemento),
    'Tag do elemento ' + Tag);
  Assert.AreEqual(Integer(Operacao), Integer(ElementoBaseCalculoOperacao(Elemento)),
    'Operacao do elemento ' + Tag);
  Assert.IsTrue(ElementoBaseCalculoBases(Elemento) = Bases,
    'Bases do elemento ' + Tag);
  Assert.AreEqual(Integer(Natureza), Integer(ElementoBaseCalculoNatureza(Elemento)),
    'Natureza do elemento ' + Tag);
  Assert.AreEqual(AnoInicio, ElementoBaseCalculoAnoInicioVigencia(Elemento),
    'Ano inicial de vigencia do elemento ' + Tag);
  Assert.AreEqual(AnoFim, ElementoBaseCalculoAnoFimVigencia(Elemento),
    'Ano final de vigencia do elemento ' + Tag);
  Assert.IsTrue(ElementoBaseCalculoTiposDocumentoValidos(Elemento) = TiposDocumento,
    'Tipos de documento do elemento ' + Tag);
end;

function CriarItemSemComponentes: ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    1,
    '12345678',
    '000001',
    '000',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.Create('000', '000001'));
end;

{ TTeste_ComponentesBaseCalculo }

procedure TTeste_ComponentesBaseCalculo.teste_Componentes_Ausente_EhNullESemComponentes;
var
  componentes: ComponentesBaseCalculoInput;
begin
  componentes := ComponentesBaseCalculoInput.NullInstance();

  Assert.IsTrue(componentes.IsNull(), 'NullInstance deve produzir grupo ausente');
  Assert.IsFalse(componentes.PossuiComponentes(), 'Grupo ausente nao possui componentes');
end;

procedure TTeste_ComponentesBaseCalculo.teste_Componentes_PresenteVazio_NaoEhNullESemComponentes;
var
  componentes: ComponentesBaseCalculoInput;
begin
  componentes := ComponentesBaseCalculoInput.Create();

  Assert.IsFalse(componentes.IsNull(), 'Create deve produzir grupo presente');
  Assert.IsFalse(componentes.PossuiComponentes(), 'Grupo presente sem valores nao possui componentes');
end;

procedure TTeste_ComponentesBaseCalculo.teste_Componentes_PresenteComZero_PossuiComponentes;
var
  componentes: ComponentesBaseCalculoInput;
begin
  componentes := ComponentesBaseCalculoInput.Create();
  componentes.VProd := CurrencyNullable.Create(0);

  Assert.IsFalse(componentes.IsNull(), 'Grupo com zero continua presente');
  Assert.IsTrue(componentes.PossuiComponentes(), 'Zero conta como componente informado');
  AssertMoeda(0, componentes.GetValor(ebcVProd), 'vProd zero');
end;

procedure TTeste_ComponentesBaseCalculo.teste_GetValor_NaoInformado_RetornaNulo;
var
  componentes: ComponentesBaseCalculoInput;
  elemento: ElementoBaseCalculo;
begin
  componentes := ComponentesBaseCalculoInput.Create();

  for elemento := Low(ElementoBaseCalculo) to High(ElementoBaseCalculo) do
    Assert.IsTrue(componentes.GetValor(elemento).IsNull,
      'Elemento nao informado deveria ser nulo: ' + ElementoBaseCalculoTag(elemento));
end;

procedure TTeste_ComponentesBaseCalculo.teste_GetValor_MapeiaOs15Elementos;
var
  componentes: ComponentesBaseCalculoInput;
begin
  componentes := ComponentesBaseCalculoInput.Create();
  componentes.VProd := CurrencyNullable.Create(1);
  componentes.VFrete := CurrencyNullable.Create(2);
  componentes.VSeg := CurrencyNullable.Create(3);
  componentes.VOutro := CurrencyNullable.Create(4);
  componentes.VII := CurrencyNullable.Create(5);
  componentes.VIS := CurrencyNullable.Create(6);
  componentes.VDesc := CurrencyNullable.Create(7);
  componentes.VPIS := CurrencyNullable.Create(8);
  componentes.VCOFINS := CurrencyNullable.Create(9);
  componentes.VICMS := CurrencyNullable.Create(10);
  componentes.VICMSUFDest := CurrencyNullable.Create(11);
  componentes.VFCP := CurrencyNullable.Create(12);
  componentes.VFCPUFDest := CurrencyNullable.Create(13);
  componentes.VICMSMono := CurrencyNullable.Create(14);
  componentes.VISSQN := CurrencyNullable.Create(15);

  AssertMoeda(1, componentes.GetValor(ebcVProd), 'vProd');
  AssertMoeda(2, componentes.GetValor(ebcVFrete), 'vFrete');
  AssertMoeda(3, componentes.GetValor(ebcVSeg), 'vSeg');
  AssertMoeda(4, componentes.GetValor(ebcVOutro), 'vOutro');
  AssertMoeda(5, componentes.GetValor(ebcVII), 'vII');
  AssertMoeda(6, componentes.GetValor(ebcVIS), 'vIS');
  AssertMoeda(7, componentes.GetValor(ebcVDesc), 'vDesc');
  AssertMoeda(8, componentes.GetValor(ebcVPIS), 'vPIS');
  AssertMoeda(9, componentes.GetValor(ebcVCOFINS), 'vCOFINS');
  AssertMoeda(10, componentes.GetValor(ebcVICMS), 'vICMS');
  AssertMoeda(11, componentes.GetValor(ebcVICMSUFDest), 'vICMSUFDest');
  AssertMoeda(12, componentes.GetValor(ebcVFCP), 'vFCP');
  AssertMoeda(13, componentes.GetValor(ebcVFCPUFDest), 'vFCPUFDest');
  AssertMoeda(14, componentes.GetValor(ebcVICMSMono), 'vICMSMono');
  AssertMoeda(15, componentes.GetValor(ebcVISSQN), 'vISSQN');
end;

procedure TTeste_ComponentesBaseCalculo.teste_GetValor_ElementoInvalido_LancaExcecao;
var
  componentes: ComponentesBaseCalculoInput;
begin
  componentes := ComponentesBaseCalculoInput.Create();

  Assert.WillRaise(
    procedure
    begin
      componentes.GetValor(ElementoBaseCalculo(Ord(High(ElementoBaseCalculo)) + 1));
    end,
    ERangeError);
end;

procedure TTeste_ComponentesBaseCalculo.teste_ItemInput_ConstrutorAntigo_SemComponentes;
var
  item: ItemCalculoInput;
begin
  item := CriarItemSemComponentes();

  Assert.IsFalse(item.HasGComponentesBC, 'Construtor antigo deve manter o grupo ausente');
  Assert.IsTrue(item.GComponentesBC.IsNull(), 'Grupo do item deve ser nulo no construtor antigo');
  Assert.IsFalse(item.GComponentesBC.PossuiComponentes(), 'Grupo nulo nao possui componentes');
  Assert.AreEqual(1, item.Numero, 'Numero preservado pelo construtor antigo');
  Assert.AreEqual('12345678', item.NCM, 'NCM preservado pelo construtor antigo');
  Assert.AreEqual('000001', item.cClassTrib, 'cClassTrib preservado pelo construtor antigo');
  Assert.AreEqual('000', item.CST, 'CST preservado pelo construtor antigo');
  Assert.IsTrue(item.BaseCalculo.IsNull, 'BaseCalculo ausente por padrao no construtor antigo');
  Assert.IsTrue(item.Quantidade.IsNull, 'Quantidade ausente por padrao no construtor antigo');
  Assert.IsTrue(item.QuantidadeEfetiva = 1, 'Quantidade ausente assume 1 no RTC');
  Assert.AreEqual('', item.Unidade, 'Unidade padrao vazia no construtor antigo');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ItemInput_ComponentesPresenteVazio_HasGComponentesBCTrue;
var
  item: ItemCalculoInput;
begin
  item := ItemCalculoInput.Create(
    2,
    '123456789',
    '200002',
    '200',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.NullInstance(),
    CurrencyNullable.Create(100),
    CurrencyNullable.Create(1),
    'UN',
    ComponentesBaseCalculoInput.Create());

  Assert.IsTrue(item.HasGComponentesBC, 'Grupo presente-vazio deve estar presente');
  Assert.IsFalse(item.GComponentesBC.IsNull(), 'Grupo presente-vazio nao e nulo');
  Assert.IsFalse(item.GComponentesBC.PossuiComponentes(), 'Grupo presente-vazio nao possui componentes');
  Assert.AreEqual('123456789', item.NBS, 'NBS de 9 posicoes preservado');
  Assert.AreEqual('', item.NCM, 'NCM deve ficar vazio quando informado NBS');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ItemInput_ComponentesComZero_HasGComponentesBCTrueEPossuiComponentes;
var
  item: ItemCalculoInput;
  componentes: ComponentesBaseCalculoInput;
begin
  componentes := ComponentesBaseCalculoInput.Create();
  componentes.VDesc := CurrencyNullable.Create(0);

  item := ItemCalculoInput.Create(
    3,
    '12345678',
    '000001',
    '000',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.Create('000', '000001'),
    CurrencyNullable.Create(200),
    CurrencyNullable.Create(2),
    'CX',
    componentes);

  Assert.IsTrue(item.HasGComponentesBC, 'Grupo presente com zero deve estar presente');
  Assert.IsTrue(item.GComponentesBC.PossuiComponentes(), 'Zero conta como componente no item');
  AssertMoeda(0, item.GComponentesBC.GetValor(ebcVDesc), 'vDesc zero no item');
  Assert.IsTrue(item.BaseCalculo.Value = 200, 'BaseCalculo preservada no construtor completo');
  Assert.IsTrue(item.Quantidade.Value = 2, 'Quantidade preservada no construtor completo');
  Assert.AreEqual('CX', item.Unidade, 'Unidade preservada no construtor completo');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ItemInput_BaseCalculoAusentePorPadrao;
var
  item: ItemCalculoInput;
begin
  item := CriarItemSemComponentes();

  Assert.IsTrue(item.BaseCalculo.IsNull, 'Create sem base deve manter a base ausente');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ItemInput_BaseCalculoAusente_NullInstance;
var
  item: ItemCalculoInput;
begin
  item := ItemCalculoInput.Create(
    4,
    '12345678',
    '000001',
    '000',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.Create('000', '000001'),
    CurrencyNullable.NullInstance(),
    CurrencyNullable.Create(0),
    '',
    ComponentesBaseCalculoInput.Create());

  Assert.IsTrue(item.BaseCalculo.IsNull, 'NullInstance deve marcar a base ausente');
  Assert.IsFalse(item.GComponentesBC.IsNull(), 'Grupo presente deve ser preservado');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ItemInput_BaseCalculoZeroInformado_NaoEhAusente;
var
  item: ItemCalculoInput;
begin
  item := ItemCalculoInput.Create(
    5,
    '12345678',
    '000001',
    '000',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.NullInstance(),
    CurrencyNullable.Create(0));

  Assert.IsFalse(item.BaseCalculo.IsNull, 'Zero informado continua presente');
  Assert.IsTrue(item.BaseCalculo.Value = 0, 'Zero informado nao se confunde com ausencia');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ItemInput_BaseCalculo_SetterAtualizaNulidade;
var
  item: ItemCalculoInput;
begin
  item := CriarItemSemComponentes();
  Assert.IsTrue(item.BaseCalculo.IsNull, 'Item criado pelo construtor antigo comeca ausente');

  item.BaseCalculo := CurrencyNullable.Create(0);
  Assert.IsFalse(item.BaseCalculo.IsNull, 'Setter deve marcar a base como presente');

  item.BaseCalculo := CurrencyNullable.NullInstance();
  Assert.IsTrue(item.BaseCalculo.IsNull, 'Setter deve restaurar a ausencia');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ItemInput_QuantidadeAusente_Efetiva1;
var
  item: ItemCalculoInput;
begin
  item := ItemCalculoInput.Create(
    6,
    '12345678',
    '000001',
    '000',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.NullInstance(),
    CurrencyNullable.Create(100),
    CurrencyNullable.NullInstance(),
    'UN');

  Assert.IsTrue(item.Quantidade.IsNull, 'quantidade ausente deve permanecer nula');
  Assert.IsTrue(item.QuantidadeEfetiva = 1, 'quantidade ausente deve valer 1 no calculo');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ItemInput_QuantidadeZeroInformada_EfetivaZero;
var
  item: ItemCalculoInput;
begin
  item := ItemCalculoInput.Create(
    7,
    '12345678',
    '000001',
    '000',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.NullInstance(),
    CurrencyNullable.Create(100),
    CurrencyNullable.Create(0),
    'UN');

  Assert.IsFalse(item.Quantidade.IsNull, 'zero informado nao e ausencia');
  Assert.IsTrue(item.QuantidadeEfetiva = 0, 'zero informado vale zero no calculo');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ItemInput_SobrecargaCurrency_ConverteParaPresente;
var
  item: ItemCalculoInput;
begin
  item := ItemCalculoInput.Create(
    8,
    '12345678',
    '000001',
    '000',
    ImpostoSeletivoInput.NullInstance(),
    TributacaoRegularInput.NullInstance(),
    100,
    2,
    'UN');

  Assert.IsTrue(item.BaseCalculo.HasValue, 'base Currency deve ficar informada');
  Assert.IsTrue(item.BaseCalculo.Value = 100, 'base Currency preservada');
  Assert.IsTrue(item.Quantidade.HasValue, 'quantidade Currency deve ficar informada');
  Assert.IsTrue(item.Quantidade.Value = 2, 'quantidade Currency preservada');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ImpostoSeletivoInput_SobrecargaDouble_ConverteParaPresente;
var
  isInput: ImpostoSeletivoInput;
begin
  isInput := ImpostoSeletivoInput.Create('000', '000000', 100, 2, 'UN', 12.34);

  Assert.IsTrue(isInput.BaseCalculo.HasValue, 'base Double deve ficar informada');
  Assert.IsTrue(isInput.BaseCalculo.Value = 100, 'base Double preservada');
  Assert.IsTrue(isInput.Quantidade.HasValue, 'quantidade Double deve ficar informada');
  Assert.IsTrue(isInput.Quantidade.Value = 2, 'quantidade Double preservada');
  Assert.IsTrue(isInput.ImpostoInformado.HasValue, 'impostoInformado Double deve ficar informado');
  Assert.IsTrue(isInput.ValorImpostoSeletivoInformado = 12.34, 'valor informado preservado');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ImpostoSeletivoInput_QuantidadeAusente_IsNullEValorZero;
var
  isInput: ImpostoSeletivoInput;
begin
  isInput := ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.Create(100),
    CurrencyNullable.NullInstance(), 'UN', CurrencyNullable.NullInstance());

  Assert.IsTrue(isInput.Quantidade.IsNull, 'quantidade ausente deve permanecer nula');
  Assert.IsTrue(isInput.Quantidade.Value = 0, 'quantidade ausente le como zero');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ImpostoSeletivoInput_QuantidadeZeroInformada_NaoEhNull;
var
  isInput: ImpostoSeletivoInput;
begin
  isInput := ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.Create(100),
    CurrencyNullable.Create(0), 'UN', CurrencyNullable.NullInstance());

  Assert.IsFalse(isInput.Quantidade.IsNull, 'zero informado continua presente');
  Assert.IsTrue(isInput.Quantidade.Value = 0, 'zero informado vale zero');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ImpostoSeletivoInput_ImpostoInformadoAusente_IsNullEValorZero;
var
  isInput: ImpostoSeletivoInput;
begin
  isInput := ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.Create(100),
    CurrencyNullable.Create(1), 'UN', CurrencyNullable.NullInstance());

  Assert.IsTrue(isInput.ImpostoInformado.IsNull, 'impostoInformado ausente deve permanecer nulo');
  Assert.IsTrue(isInput.ValorImpostoSeletivoInformado = 0,
    'getter devolve zero quando o impostoInformado esta ausente');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ImpostoSeletivoInput_ImpostoInformadoZeroInformado_NaoEhNull;
var
  isInput: ImpostoSeletivoInput;
begin
  isInput := ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.Create(100),
    CurrencyNullable.Create(1), 'UN', CurrencyNullable.Create(0));

  Assert.IsFalse(isInput.ImpostoInformado.IsNull, 'zero informado nao e ausencia');
  Assert.IsTrue(isInput.ValorImpostoSeletivoInformado = 0, 'zero informado vale zero');
end;

procedure TTeste_ComponentesBaseCalculo.teste_ImpostoSeletivoInput_ImpostoInformadoPresente_GetterDevolveValor;
var
  isInput: ImpostoSeletivoInput;
begin
  isInput := ImpostoSeletivoInput.Create('000', '000000', CurrencyNullable.Create(100),
    CurrencyNullable.Create(1), 'UN', CurrencyNullable.Create(12.34));

  Assert.IsFalse(isInput.ImpostoInformado.IsNull, 'valor informado deve ficar presente');
  Assert.IsTrue(isInput.ValorImpostoSeletivoInformado = 12.34,
    'getter deve devolver o valor informado');
end;

procedure TTeste_ComponentesBaseCalculo.teste_Catalogo_Possui15Elementos;
begin
  Assert.AreEqual(15, Ord(High(ElementoBaseCalculo)) - Ord(Low(ElementoBaseCalculo)) + 1,
    'Catalogo deve possuir exatamente 15 elementos');
end;

procedure TTeste_ComponentesBaseCalculo.teste_Catalogo_OperacaoBasesNaturezaVigenciaETipos;
begin
  VerificarElemento(ebcVProd, 'vProd', bcoSoma, [bcbRG, bcbIS, bcbSN],
    bcnUnassigned, 2026, 2033, [55, 65]);
  VerificarElemento(ebcVFrete, 'vFrete', bcoSoma, [bcbRG, bcbIS, bcbSN],
    bcnUnassigned, 2026, 2033, [55, 65]);
  VerificarElemento(ebcVSeg, 'vSeg', bcoSoma, [bcbRG, bcbIS, bcbSN],
    bcnUnassigned, 2026, 2033, [55, 65]);
  VerificarElemento(ebcVOutro, 'vOutro', bcoSoma, [bcbRG, bcbIS, bcbSN],
    bcnUnassigned, 2026, 2033, [55, 65]);
  VerificarElemento(ebcVII, 'vII', bcoSoma, [bcbRG, bcbIS],
    bcnBem, 2026, 2033, [55]);
  VerificarElemento(ebcVIS, 'vIS', bcoSoma, [bcbRG, bcbSN],
    bcnUnassigned, 2027, 2033, [55, 65]);
  VerificarElemento(ebcVDesc, 'vDesc', bcoSubtrai, [bcbRG, bcbIS, bcbSN],
    bcnUnassigned, 2026, 2033, [55, 65]);
  VerificarElemento(ebcVPIS, 'vPIS', bcoSubtrai, [bcbRG, bcbIS],
    bcnUnassigned, 2026, 2026, [55, 65]);
  VerificarElemento(ebcVCOFINS, 'vCOFINS', bcoSubtrai, [bcbRG, bcbIS],
    bcnUnassigned, 2026, 2026, [55, 65]);
  VerificarElemento(ebcVICMS, 'vICMS', bcoSubtrai, [bcbRG, bcbIS],
    bcnBem, 2026, 2032, [55, 65]);
  VerificarElemento(ebcVICMSUFDest, 'vICMSUFDest', bcoSubtrai, [bcbRG, bcbIS],
    bcnBem, 2026, 2032, [55]);
  VerificarElemento(ebcVFCP, 'vFCP', bcoSubtrai, [bcbRG, bcbIS],
    bcnBem, 2026, 2032, [55, 65]);
  VerificarElemento(ebcVFCPUFDest, 'vFCPUFDest', bcoSubtrai, [bcbRG, bcbIS],
    bcnBem, 2026, 2032, [55]);
  VerificarElemento(ebcVICMSMono, 'vICMSMono', bcoSubtrai, [bcbRG, bcbIS],
    bcnBem, 2026, 2032, [55, 65]);
  VerificarElemento(ebcVISSQN, 'vISSQN', bcoSubtrai, [bcbRG, bcbIS],
    bcnServico, 2026, 2032, [55, 65]);
end;

procedure TTeste_ComponentesBaseCalculo.teste_PisCofins_2026Compoe_2027NaoCompoe;
begin
  Assert.IsTrue(CampoCompoeBase(ebcVPIS, 2026, bcnUnassigned, 55),
    'vPIS compoe a base em 2026');
  Assert.IsFalse(CampoCompoeBase(ebcVPIS, 2027, bcnUnassigned, 55),
    'vPIS nao compoe a base em 2027');

  Assert.IsTrue(CampoCompoeBase(ebcVCOFINS, 2026, bcnUnassigned, 65),
    'vCOFINS compoe a base em 2026');
  Assert.IsFalse(CampoCompoeBase(ebcVCOFINS, 2027, bcnUnassigned, 65),
    'vCOFINS nao compoe a base em 2027');
end;

procedure TTeste_ComponentesBaseCalculo.teste_VIS_2026NaoCompoe_2027Compoe;
begin
  Assert.IsFalse(CampoCompoeBase(ebcVIS, 2026, bcnUnassigned, 55),
    'vIS nao compoe a base em 2026');
  Assert.IsTrue(CampoCompoeBase(ebcVIS, 2027, bcnUnassigned, 55),
    'vIS compoe a base a partir de 2027');
end;

procedure TTeste_ComponentesBaseCalculo.teste_FamiliaICMS_2032Compoe_2033NaoCompoe;
begin
  Assert.IsTrue(CampoCompoeBase(ebcVICMS, 2032, bcnBem, 55),
    'vICMS compoe em 2032');
  Assert.IsFalse(CampoCompoeBase(ebcVICMS, 2033, bcnBem, 55),
    'vICMS nao compoe em 2033');

  Assert.IsTrue(CampoCompoeBase(ebcVICMSUFDest, 2032, bcnBem, 55),
    'vICMSUFDest compoe em 2032');
  Assert.IsFalse(CampoCompoeBase(ebcVICMSUFDest, 2033, bcnBem, 55),
    'vICMSUFDest nao compoe em 2033');

  Assert.IsTrue(CampoCompoeBase(ebcVFCP, 2032, bcnBem, 65),
    'vFCP compoe em 2032');
  Assert.IsFalse(CampoCompoeBase(ebcVFCP, 2033, bcnBem, 65),
    'vFCP nao compoe em 2033');

  Assert.IsTrue(CampoCompoeBase(ebcVFCPUFDest, 2032, bcnBem, 55),
    'vFCPUFDest compoe em 2032');
  Assert.IsFalse(CampoCompoeBase(ebcVFCPUFDest, 2033, bcnBem, 55),
    'vFCPUFDest nao compoe em 2033');

  Assert.IsTrue(CampoCompoeBase(ebcVICMSMono, 2032, bcnBem, 65),
    'vICMSMono compoe em 2032');
  Assert.IsFalse(CampoCompoeBase(ebcVICMSMono, 2033, bcnBem, 65),
    'vICMSMono nao compoe em 2033');
end;

procedure TTeste_ComponentesBaseCalculo.teste_VISSQN_ApenasServico;
begin
  Assert.IsTrue(CampoCompoeBase(ebcVISSQN, 2026, bcnServico, 55),
    'vISSQN compoe quando a natureza e SERVICO');
  Assert.IsFalse(CampoCompoeBase(ebcVISSQN, 2026, bcnBem, 55),
    'vISSQN nao compoe quando a natureza e BEM');
  Assert.IsFalse(CampoCompoeBase(ebcVISSQN, 2026, bcnUnassigned, 55),
    'vISSQN nao compoe sem natureza informada');
end;

procedure TTeste_ComponentesBaseCalculo.teste_VII_VICMSUFDest_VFCPUFDest_ExcluidosNoModelo65;
begin
  Assert.IsTrue(CampoCompoeBase(ebcVII, 2026, bcnBem, 55),
    'vII compoe no modelo 55');
  Assert.IsFalse(CampoCompoeBase(ebcVII, 2026, bcnBem, 65),
    'vII nao compoe no modelo 65');

  Assert.IsTrue(CampoCompoeBase(ebcVICMSUFDest, 2026, bcnBem, 55),
    'vICMSUFDest compoe no modelo 55');
  Assert.IsFalse(CampoCompoeBase(ebcVICMSUFDest, 2026, bcnBem, 65),
    'vICMSUFDest nao compoe no modelo 65');

  Assert.IsTrue(CampoCompoeBase(ebcVFCPUFDest, 2026, bcnBem, 55),
    'vFCPUFDest compoe no modelo 55');
  Assert.IsFalse(CampoCompoeBase(ebcVFCPUFDest, 2026, bcnBem, 65),
    'vFCPUFDest nao compoe no modelo 65');
end;

procedure TTeste_ComponentesBaseCalculo.teste_MotivoNaoComposicao_QuandoCompoe_RetornaNulo;
var
  motivo: StringNullable;
begin
  motivo := MotivoNaoComposicao(ebcVProd, 2026, bcnUnassigned, 55);

  Assert.IsTrue(motivo.IsNull, 'Elemento que compoe a base nao possui motivo');
end;

procedure TTeste_ComponentesBaseCalculo.teste_MotivoNaoComposicao_Vigencia_TextoOficial;
var
  motivo: StringNullable;
  esperado: string;
begin
  motivo := MotivoNaoComposicao(ebcVPIS, 2027, bcnUnassigned, 55);
  esperado := Format(MSG_VIGENCIA, [ElementoBaseCalculoTag(ebcVPIS), 2027, 2026, 2026]);

  Assert.IsFalse(motivo.IsNull, 'Elemento fora de vigencia deve possuir motivo');
  Assert.AreEqual(esperado, motivo.Value, 'Texto oficial do motivo de vigencia');
end;

procedure TTeste_ComponentesBaseCalculo.teste_MotivoNaoComposicao_Natureza_TextoOficial;
var
  motivo: StringNullable;
  esperado: string;
begin
  motivo := MotivoNaoComposicao(ebcVISSQN, 2026, bcnBem, 55);
  esperado := Format(MSG_NATUREZA, [ElementoBaseCalculoTag(ebcVISSQN), 'BEM', 'SERVICO']);

  Assert.IsFalse(motivo.IsNull, 'Elemento de natureza incompativel deve possuir motivo');
  Assert.AreEqual(esperado, motivo.Value, 'Texto oficial do motivo de natureza');
end;

procedure TTeste_ComponentesBaseCalculo.teste_MotivoNaoComposicao_Modelo_TextoOficial;
var
  motivo: StringNullable;
  esperado: string;
begin
  motivo := MotivoNaoComposicao(ebcVII, 2026, bcnBem, 65);
  esperado := Format(MSG_MODELO, [ElementoBaseCalculoTag(ebcVII), 65]);

  Assert.IsFalse(motivo.IsNull, 'Elemento excluido no modelo deve possuir motivo');
  Assert.AreEqual(esperado, motivo.Value, 'Texto oficial do motivo de modelo');
end;

procedure TTeste_ComponentesBaseCalculo.teste_MotivoNaoComposicao_OrdemVigenciaAntesDeNaturezaEModelo;
var
  motivo: StringNullable;
  esperado: string;
begin
  // vIS falha na vigencia (2026), na natureza (BEM x nenhuma) e no modelo (55);
  // o motivo deve ser o da vigencia.
  motivo := MotivoNaoComposicao(ebcVIS, 2026, bcnBem, 65);
  esperado := Format(MSG_VIGENCIA, [ElementoBaseCalculoTag(ebcVIS), 2026, 2027, 2033]);

  Assert.IsFalse(motivo.IsNull, 'Motivo deveria ser informado');
  Assert.AreEqual(esperado, motivo.Value, 'Vigencia tem precedencia sobre natureza e modelo');
end;

procedure TTeste_ComponentesBaseCalculo.teste_MotivoNaoComposicao_OrdemNaturezaAntesDeModelo;
var
  motivo: StringNullable;
  esperado: string;
begin
  // vII falha na natureza (SERVICO x BEM) e no modelo (55); o motivo deve ser o da natureza.
  motivo := MotivoNaoComposicao(ebcVII, 2026, bcnServico, 65);
  esperado := Format(MSG_NATUREZA, [ElementoBaseCalculoTag(ebcVII), 'SERVICO', 'BEM']);

  Assert.IsFalse(motivo.IsNull, 'Motivo deveria ser informado');
  Assert.AreEqual(esperado, motivo.Value, 'Natureza tem precedencia sobre modelo');
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_ComponentesBaseCalculo);

end.
