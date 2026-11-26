unit Teste_CodigoTextoValidacaoRtc;

interface

uses
  DUnitX.TestFramework,
  ValidacaoItemOutputUnit,
  TradutorErrosRtcUnit,
  CalculadorROCServiceUnit,
  ICalculadorROCServiceUnit,
  CalcularTributoInputUnit,
  ItemCalculoInputUnit,
  ImpostoSeletivoInputUnit,
  TributacaoRegularInputUnit,
  CompraGovernamentalInputUnit,
  IntegerNullableUnit,
  IPreparacaoCalculoServiceUnit,
  PreparacaoResultadoUnit,
  RedutorCompraGovernamentalServiceUnit,
  IMunicipiosRepositoryUnit,
  MunicipioEtdUnit,
  EstadoEtdUnit,
  ROCDomainUnit,
  ROCItemDomainUnit,
  ValidacaoOutputUnit,
  EValidacaoRTCUnit;

const
  MSG_REG_034 =
    'A base de cálculo declarada no item diverge da base calculada a partir dos componentes informados';

type
  TFakeMunicipiosRepository = class(IMunicipiosRepository)
  public
    constructor Create; reintroduce;
    function ObterMunicipio(Codigo: Integer): MunicipioEtd; override;
    function ListarTodos(): MunicipiosEtd; override;
  end;

  TFakeProcessamentoItemComErro = class(TInterfacedObject, IProcessamentoItemService)
  private
    FMensagem: string;
  public
    constructor Create(const AMensagem: string);
    function ProcessarItem(const Documento: CalcularTributoInput;
      const Item: ItemCalculoInput; Data: TDate): ProcessamentoItemResult; overload;
    function ProcessarItem(const Documento: CalcularTributoInput;
      const Item: ItemCalculoInput; Data: TDate;
      const TipoDocumento: IntegerNullable): ProcessamentoItemResult; overload;
  end;

  TFakeProcessamentoItemComValidacao = class(TInterfacedObject, IProcessamentoItemService)
  private
    FValidacoes: ValidacaoOutput;
  public
    constructor Create(const AValidacoes: ValidacaoOutput);
    function ProcessarItem(const Documento: CalcularTributoInput;
      const Item: ItemCalculoInput; Data: TDate): ProcessamentoItemResult; overload;
    function ProcessarItem(const Documento: CalcularTributoInput;
      const Item: ItemCalculoInput; Data: TDate;
      const TipoDocumento: IntegerNullable): ProcessamentoItemResult; overload;
  end;

  [TestFixture]
  TTeste_ValidacaoItemOutput_CodigoTexto = class
  public
    [Test]
    procedure teste_CriarComCodigoTexto_NaoPreencheCodigoNumerico;
    [Test]
    procedure teste_CriarComCodigoInteiro_NaoPreencheCodigoTexto;
    [Test]
    procedure teste_Clone_PreservaCodigoTexto;
  end;

  [TestFixture]
  TTeste_TradutorErrosRtc_CodigoTexto = class
  public
    [Test]
    procedure teste_TraduzirReg034_ComDetalhe_DevolveDetalhe;
    [Test]
    procedure teste_TraduzirReg034_SemDetalhe_DevolveMensagemOficial;
    [Test]
    procedure teste_TraduzirCodigoDesconhecido_DevolveDetalhe;
    [Test]
    procedure teste_TraduzirCodigoDesconhecido_SemDetalhe_DevolveCodigo;
    [Test]
    procedure teste_TraduzirValidacaoComCodigoTexto_UsaCodigoTexto;
    [Test]
    procedure teste_TraduzirValidacaoSemCodigoTexto_UsaCodigoNumerico;
  end;

  [TestFixture]
  TTeste_CalculadorROCService_CodigoTexto = class
  public
    [Test]
    procedure teste_ErroReg034_ViraValidacaoComCodigoTextoEItemSemTributo;
    [Test]
    procedure teste_ValidacaoNaoFatal_CopiaPreservaCodigo;
  end;

  [TestFixture]
  TTeste_ValidacaoOutput_CodigoTexto = class
  public
    [Test]
    procedure teste_AddDistinct_DoisReg034_MantemUm;
    [Test]
    procedure teste_AddDistinct_Reg034EReg035_NaoColapsam;
    [Test]
    procedure teste_AddDistinct_Reg034EValidacaoGenerica_NaoColapsam;
    [Test]
    procedure teste_AddValidacoes_DoisGenericosDetalhesDiferentes_Mantem;
    [Test]
    procedure teste_AddValidacoes_DoisReg034Iguais_Deduplica;
    [Test]
    procedure teste_AddValidacoes_Reg034EReg035_Mantem;
    [Test]
    procedure teste_RaiseIfNotIsValid_CodigoTexto_PrefixaCodigo;
    [Test]
    procedure teste_RaiseIfNotIsValid_CodigoNumerico_MantemPrefixo;
    [Test]
    procedure teste_RaiseIfNotIsValid_SemCodigo_NaoPrefixa;
  end;

implementation

uses
  System.SysUtils,
  CodigosErroValidacao,
  EValidacaoNegocioUnit;

{ TFakeMunicipiosRepository }

constructor TFakeMunicipiosRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeMunicipiosRepository.ObterMunicipio(Codigo: Integer): MunicipioEtd;
begin
  Result := MunicipioEtd.Create(Codigo, 'Curitiba',
    EstadoEtd.Create(43, 'RS', 'Rio Grande do Sul'));
end;

function TFakeMunicipiosRepository.ListarTodos: MunicipiosEtd;
begin
  Result := nil;
end;

{ TFakeProcessamentoItemComErro }

constructor TFakeProcessamentoItemComErro.Create(const AMensagem: string);
begin
  inherited Create;
  FMensagem := AMensagem;
end;

function TFakeProcessamentoItemComErro.ProcessarItem(const Documento: CalcularTributoInput;
  const Item: ItemCalculoInput; Data: TDate): ProcessamentoItemResult;
begin
  raise EValidacaoRTC.Create(CODIGO_BASE_CALCULO_COMPONENTES_INCONSISTENTE, FMensagem);
end;

function TFakeProcessamentoItemComErro.ProcessarItem(const Documento: CalcularTributoInput;
  const Item: ItemCalculoInput; Data: TDate;
  const TipoDocumento: IntegerNullable): ProcessamentoItemResult;
begin
  raise EValidacaoRTC.Create(CODIGO_BASE_CALCULO_COMPONENTES_INCONSISTENTE, FMensagem);
end;

{ TFakeProcessamentoItemComValidacao }

constructor TFakeProcessamentoItemComValidacao.Create(const AValidacoes: ValidacaoOutput);
begin
  inherited Create;
  FValidacoes := AValidacoes;
end;

function TFakeProcessamentoItemComValidacao.ProcessarItem(const Documento: CalcularTributoInput;
  const Item: ItemCalculoInput; Data: TDate): ProcessamentoItemResult;
begin
  Result := ProcessamentoItemResult.Create(nil, FValidacoes);
end;

function TFakeProcessamentoItemComValidacao.ProcessarItem(const Documento: CalcularTributoInput;
  const Item: ItemCalculoInput; Data: TDate;
  const TipoDocumento: IntegerNullable): ProcessamentoItemResult;
begin
  Result := ProcessamentoItemResult.Create(nil, FValidacoes);
end;

{ TTeste_ValidacaoItemOutput_CodigoTexto }

procedure TTeste_ValidacaoItemOutput_CodigoTexto.teste_CriarComCodigoTexto_NaoPreencheCodigoNumerico;
var
  validacao: ValidacaoItemOutput;
begin
  validacao := ValidacaoItemOutput.Create('REG-034', 'detalhe da divergencia');

  Assert.AreEqual('REG-034', validacao.CodigoTexto, 'codigo textual preservado');
  Assert.AreEqual(0, validacao.Codigo, 'codigo textual nao reutiliza o codigo generico 999');
  Assert.AreEqual('detalhe da divergencia', validacao.Detalhe, 'detalhe preservado');
end;

procedure TTeste_ValidacaoItemOutput_CodigoTexto.teste_CriarComCodigoInteiro_NaoPreencheCodigoTexto;
var
  validacao: ValidacaoItemOutput;
begin
  validacao := ValidacaoItemOutput.Create(42, 'erro numerico');

  Assert.AreEqual('', validacao.CodigoTexto, 'codigo inteiro nao possui codigo textual');
  Assert.AreEqual(42, validacao.Codigo, 'codigo numerico preservado');
  Assert.AreEqual('erro numerico', validacao.Detalhe, 'detalhe preservado');
end;

procedure TTeste_ValidacaoItemOutput_CodigoTexto.teste_Clone_PreservaCodigoTexto;
var
  original, copia: ValidacaoItemOutput;
begin
  original := ValidacaoItemOutput.Create('REG-034', 'detalhe da divergencia');
  copia := original.Clone();

  Assert.AreEqual('REG-034', copia.CodigoTexto, 'clone preserva o codigo textual');
  Assert.AreEqual(0, copia.Codigo, 'clone preserva o codigo zero do codigo textual');
  Assert.AreEqual('detalhe da divergencia', copia.Detalhe, 'clone preserva o detalhe');
end;

{ TTeste_TradutorErrosRtc_CodigoTexto }

procedure TTeste_TradutorErrosRtc_CodigoTexto.teste_TraduzirReg034_ComDetalhe_DevolveDetalhe;
var
  tradutor: TradutorErrosRtc;
  detalhe: string;
begin
  tradutor := TradutorErrosRtc.Create();
  try
    detalhe := 'A base de calculo declarada (900.00) diverge da base calculada a partir dos componentes informados (850.00)';

    Assert.AreEqual(detalhe, tradutor.Traduzir('REG-034', detalhe),
      'detalhe da excecao e devolvido sem prefixo');
    Assert.AreEqual(0, Pos('[RTC]', tradutor.Traduzir('REG-034', detalhe)),
      'traducao nao inventa token');
  finally
    tradutor.Free();
  end;
end;

procedure TTeste_TradutorErrosRtc_CodigoTexto.teste_TraduzirReg034_SemDetalhe_DevolveMensagemOficial;
var
  tradutor: TradutorErrosRtc;
begin
  tradutor := TradutorErrosRtc.Create();
  try
    Assert.AreEqual(MSG_REG_034, tradutor.Traduzir('REG-034', ''));
  finally
    tradutor.Free();
  end;
end;

procedure TTeste_TradutorErrosRtc_CodigoTexto.teste_TraduzirCodigoDesconhecido_DevolveDetalhe;
var
  tradutor: TradutorErrosRtc;
begin
  tradutor := TradutorErrosRtc.Create();
  try
    Assert.AreEqual('detalhe sem traducao',
      tradutor.Traduzir('REG-999', 'detalhe sem traducao'));
  finally
    tradutor.Free();
  end;
end;

procedure TTeste_TradutorErrosRtc_CodigoTexto.teste_TraduzirCodigoDesconhecido_SemDetalhe_DevolveCodigo;
var
  tradutor: TradutorErrosRtc;
begin
  tradutor := TradutorErrosRtc.Create();
  try
    Assert.AreEqual('REG-999', tradutor.Traduzir('REG-999', ''));
  finally
    tradutor.Free();
  end;
end;

procedure TTeste_TradutorErrosRtc_CodigoTexto.teste_TraduzirValidacaoComCodigoTexto_UsaCodigoTexto;
var
  tradutor: TradutorErrosRtc;
  validacao: ValidacaoItemOutput;
  detalhe: string;
begin
  tradutor := TradutorErrosRtc.Create();
  try
    detalhe := 'detalhe da divergencia';
    validacao := ValidacaoItemOutput.Create('REG-034', detalhe);

    Assert.AreEqual(detalhe, tradutor.Traduzir(validacao));
  finally
    tradutor.Free();
  end;
end;

procedure TTeste_TradutorErrosRtc_CodigoTexto.teste_TraduzirValidacaoSemCodigoTexto_UsaCodigoNumerico;
var
  tradutor: TradutorErrosRtc;
  validacao: ValidacaoItemOutput;
begin
  tradutor := TradutorErrosRtc.Create();
  try
    validacao := ValidacaoItemOutput.Create(ECOD_NCM_NAO_ENCONTRADO, '');

    Assert.AreEqual('[RTC] NCM não encontrado', tradutor.Traduzir(validacao));
  finally
    tradutor.Free();
  end;
end;

{ TTeste_CalculadorROCService_CodigoTexto }

procedure TTeste_CalculadorROCService_CodigoTexto.teste_ErroReg034_ViraValidacaoComCodigoTextoEItemSemTributo;
var
  municipios: TFakeMunicipiosRepository;
  calculador: ICalculadorROCService;
  itens: ItensCalculoInput;
  documento: CalcularTributoInput;
  resultado: ROCDomain;
  validacao: ValidacaoItemOutput;
  mensagem: string;
begin
  mensagem := 'A base de calculo declarada (900.00) diverge da base calculada a partir dos componentes informados (850.00)';
  municipios := TFakeMunicipiosRepository.Create();
  calculador := CalculadorROCService.Create(
    municipios,
    nil,
    TFakeProcessamentoItemComErro.Create(mensagem),
    nil,
    nil,
    TradutorErrosRtc.Create());
  try
    SetLength(itens, 1);
    itens[0] := ItemCalculoInput.Create(1, '', '', '',
      ImpostoSeletivoInput.NullInstance(), TributacaoRegularInput.NullInstance());
    documento := CalcularTributoInput.Create(
      EncodeDate(2026, 1, 1), 4314902, 'RS', itens,
      CompraGovernamentalInput.NullInstance());

    resultado := calculador.Executar(documento);
    try
      Assert.AreEqual(1, Length(resultado.Validacoes.Validacoes),
        'erro fatal deve gerar uma validacao');
      validacao := resultado.Validacoes.Validacoes[0];
      Assert.AreEqual('REG-034', validacao.CodigoTexto, 'codigo textual deve chegar a saida');
      Assert.AreEqual(0, validacao.Codigo, 'codigo textual nao ocupa o codigo numerico');
      Assert.AreEqual(mensagem, validacao.Detalhe,
        'detalhe oficial da excecao chega literal ao caminho ROC');
      Assert.AreEqual(1, Length(resultado.Objetos), 'item continua presente');
      Assert.IsNull(resultado.Objetos[0].TribCalc,
        'item deve continuar sem valor fiscal em erro fatal');
    finally
      resultado.Free();
    end;
  finally
    calculador := nil;
    municipios.Free();
  end;
end;

procedure TTeste_CalculadorROCService_CodigoTexto.teste_ValidacaoNaoFatal_CopiaPreservaCodigo;
var
  municipios: TFakeMunicipiosRepository;
  calculador: ICalculadorROCService;
  itens: ItensCalculoInput;
  documento: CalcularTributoInput;
  resultado: ROCDomain;
  recebidas: ValidacaoOutput;
begin
  recebidas := ValidacaoOutput.Create();
  recebidas.Add(ValidacaoItemOutput.Create('REG-026', 'mensagem nao fatal'));
  recebidas.Add(ValidacaoItemOutput.Create(ECOD_VALIDACAO_DIGITOS, 'detalhe numerico'));

  municipios := TFakeMunicipiosRepository.Create();
  calculador := CalculadorROCService.Create(
    municipios,
    nil,
    TFakeProcessamentoItemComValidacao.Create(recebidas),
    nil,
    nil,
    TradutorErrosRtc.Create());
  try
    SetLength(itens, 1);
    itens[0] := ItemCalculoInput.Create(1, '', '', '',
      ImpostoSeletivoInput.NullInstance(), TributacaoRegularInput.NullInstance());
    documento := CalcularTributoInput.Create(
      EncodeDate(2026, 1, 1), 4314902, 'RS', itens,
      CompraGovernamentalInput.NullInstance());

    resultado := calculador.Executar(documento);
    try
      Assert.AreEqual(2, Length(resultado.Validacoes.Validacoes),
        'validacoes nao fatais devem ser copiadas');
      Assert.AreEqual('REG-026', resultado.Validacoes.Validacoes[0].CodigoTexto,
        'codigo textual preservado na copia do ROC');
      Assert.AreEqual(0, resultado.Validacoes.Validacoes[0].Codigo,
        'codigo textual nao ocupa o codigo numerico');
      Assert.AreEqual(ECOD_VALIDACAO_DIGITOS, resultado.Validacoes.Validacoes[1].Codigo,
        'codigo numerico preservado na copia do ROC');
      Assert.AreEqual('', resultado.Validacoes.Validacoes[1].CodigoTexto,
        'codigo numerico nao vira codigo textual');
    finally
      resultado.Free();
    end;
  finally
    calculador := nil;
    municipios.Free();
  end;
end;

{ TTeste_ValidacaoOutput_CodigoTexto }

procedure TTeste_ValidacaoOutput_CodigoTexto.teste_AddDistinct_DoisReg034_MantemUm;
var
  validacoes: ValidacaoOutput;
begin
  validacoes := ValidacaoOutput.Create();
  validacoes.AddDistinct(ValidacaoItemOutput.Create('REG-034', 'primeira divergencia'));
  validacoes.AddDistinct(ValidacaoItemOutput.Create('REG-034', 'segunda divergencia'));

  Assert.AreEqual(1, Length(validacoes.Validacoes), 'mesmo codigo textual continua deduplicado');
  Assert.AreEqual('primeira divergencia', validacoes.Validacoes[0].Detalhe);
end;

procedure TTeste_ValidacaoOutput_CodigoTexto.teste_AddDistinct_Reg034EReg035_NaoColapsam;
var
  validacoes: ValidacaoOutput;
begin
  validacoes := ValidacaoOutput.Create();
  validacoes.AddDistinct(ValidacaoItemOutput.Create('REG-034', 'divergencia de base'));
  validacoes.AddDistinct(ValidacaoItemOutput.Create('REG-035', 'outra divergencia'));

  Assert.AreEqual(2, Length(validacoes.Validacoes), 'codigos textuais distintos nao colapsam');
  Assert.AreEqual('REG-034', validacoes.Validacoes[0].CodigoTexto);
  Assert.AreEqual('REG-035', validacoes.Validacoes[1].CodigoTexto);
end;

procedure TTeste_ValidacaoOutput_CodigoTexto.teste_AddDistinct_Reg034EValidacaoGenerica_NaoColapsam;
var
  validacoes: ValidacaoOutput;
begin
  validacoes := ValidacaoOutput.Create();
  validacoes.AddDistinct(ValidacaoItemOutput.Create('REG-034', 'divergencia de base'));
  validacoes.AddDistinct('validacao generica');

  Assert.AreEqual(2, Length(validacoes.Validacoes), 'codigo textual e validacao generica nao colapsam');
  Assert.AreEqual('', validacoes.Validacoes[1].CodigoTexto);
end;

procedure TTeste_ValidacaoOutput_CodigoTexto.teste_AddValidacoes_DoisGenericosDetalhesDiferentes_Mantem;
var
  validacoes: ValidacaoOutput;
  recebidas: ValidacaoItensOutput;
begin
  validacoes := ValidacaoOutput.Create();
  SetLength(recebidas, 2);
  recebidas[0] := ValidacaoItemOutput.Create(0, 'primeiro detalhe generico');
  recebidas[1] := ValidacaoItemOutput.Create(0, 'segundo detalhe generico');

  validacoes.Add(recebidas);

  Assert.AreEqual(2, Length(validacoes.Validacoes),
    'genericos sem codigo com detalhes diferentes nao colapsam');
  Assert.AreEqual('primeiro detalhe generico', validacoes.Validacoes[0].Detalhe);
  Assert.AreEqual('segundo detalhe generico', validacoes.Validacoes[1].Detalhe);
end;

procedure TTeste_ValidacaoOutput_CodigoTexto.teste_AddValidacoes_DoisReg034Iguais_Deduplica;
var
  validacoes: ValidacaoOutput;
  recebidas: ValidacaoItensOutput;
begin
  validacoes := ValidacaoOutput.Create();
  SetLength(recebidas, 2);
  recebidas[0] := ValidacaoItemOutput.Create('REG-034', 'mesma divergencia');
  recebidas[1] := ValidacaoItemOutput.Create('REG-034', 'mesma divergencia');

  validacoes.Add(recebidas);

  Assert.AreEqual(1, Length(validacoes.Validacoes),
    'mesmo codigo textual continua deduplicado ao copiar validacoes');
  Assert.AreEqual('REG-034', validacoes.Validacoes[0].CodigoTexto);
end;

procedure TTeste_ValidacaoOutput_CodigoTexto.teste_AddValidacoes_Reg034EReg035_Mantem;
var
  validacoes: ValidacaoOutput;
  recebidas: ValidacaoItensOutput;
begin
  validacoes := ValidacaoOutput.Create();
  SetLength(recebidas, 2);
  recebidas[0] := ValidacaoItemOutput.Create('REG-034', 'divergencia de base');
  recebidas[1] := ValidacaoItemOutput.Create('REG-035', 'outra divergencia');

  validacoes.Add(recebidas);

  Assert.AreEqual(2, Length(validacoes.Validacoes),
    'codigos textuais distintos com codigo zero nao colapsam');
  Assert.AreEqual('REG-034', validacoes.Validacoes[0].CodigoTexto);
  Assert.AreEqual('REG-035', validacoes.Validacoes[1].CodigoTexto);
end;

procedure TTeste_ValidacaoOutput_CodigoTexto.teste_RaiseIfNotIsValid_CodigoTexto_PrefixaCodigo;
var
  validacoes: ValidacaoOutput;
  mensagem: string;
begin
  validacoes := ValidacaoOutput.Create();
  validacoes.Add(ValidacaoItemOutput.Create('REG-034', 'detalhe da divergencia'));

  try
    validacoes.RaiseIfNotIsValid();
    Assert.Fail('validacao deveria levantar EValidacaoNegocio');
  except
    on E: EValidacaoNegocio do
      mensagem := E.Message;
  end;

  Assert.AreEqual('REG-034 - detalhe da divergencia', mensagem);
end;

procedure TTeste_ValidacaoOutput_CodigoTexto.teste_RaiseIfNotIsValid_CodigoNumerico_MantemPrefixo;
var
  validacoes: ValidacaoOutput;
  mensagem: string;
begin
  validacoes := ValidacaoOutput.Create();
  validacoes.Add(ValidacaoItemOutput.Create(42, 'erro numerico'));

  try
    validacoes.RaiseIfNotIsValid();
    Assert.Fail('validacao deveria levantar EValidacaoNegocio');
  except
    on E: EValidacaoNegocio do
      mensagem := E.Message;
  end;

  Assert.AreEqual('42 - erro numerico', mensagem);
end;

procedure TTeste_ValidacaoOutput_CodigoTexto.teste_RaiseIfNotIsValid_SemCodigo_NaoPrefixa;
var
  validacoes: ValidacaoOutput;
  mensagem: string;
begin
  validacoes := ValidacaoOutput.Create();
  validacoes.Add(ValidacaoItemOutput.Create('validacao generica'));

  try
    validacoes.RaiseIfNotIsValid();
    Assert.Fail('validacao deveria levantar EValidacaoNegocio');
  except
    on E: EValidacaoNegocio do
      mensagem := E.Message;
  end;

  Assert.AreEqual('validacao generica', mensagem);
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_ValidacaoItemOutput_CodigoTexto);
  TDUnitX.RegisterTestFixture(TTeste_TradutorErrosRtc_CodigoTexto);
  TDUnitX.RegisterTestFixture(TTeste_CalculadorROCService_CodigoTexto);
  TDUnitX.RegisterTestFixture(TTeste_ValidacaoOutput_CodigoTexto);

end.