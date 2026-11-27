unit Test_NFSeConverterIbsCbs;

interface

uses
  SysUtils,
  DUnitX.TestFramework,
  ACBrDFe.Conversao,
  ACBrNFSeX,
  ACBrNFSeXClass,
  ACBrNFSeXConversao,
  ACBrNFSeXNotasFiscais,
  INFSeConverterUnit,
  NFSeConverterUnit,
  NFSeModelUnit,
  NFSeEtdUnit,
  NFSeParticipanteEtdUnit,
  NFSeTypesUnit,
  DFeTypesUnit,
  DpsEmitirModelUnit,
  DpsEmitirIbsCbsNacionalModelUnit,
  TipoRegraTributoDFeEnumUnit,
  TipoComunsUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  CurrencyNullableUnit,
  DateAndTimeNullableUnit,
  TributoDFeContextEtdUnit,
  TributoDFeIbsCbsEtdUnit,
  TributoDFeGrupoIbsCbsEtdUnit;

type
  [TestFixture]
  TTestNFSeConverterIbsCbs = class
  private
    FAcbr: TACBrNFSeX;
    FNota: TNotaFiscal;
    FConverter: INFSeConverter;
    FDpsEmitir: DpsEmitirModel;
    function CriarDps: NFSeEtd;
    function CriarIbsCbs(const ACst, AClassTrib: string): DpsEmitirIbsCbsNacionalModel;
    function CriarDestinatario: NFSeParticipanteEtd;
    procedure Preparar(const AIbsCbs: DpsEmitirIbsCbsNacionalModel);
    procedure Converter;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveGravarXInfCompQuandoPreenchido;
    [Test]
    procedure NaoDeveGravarXInfCompQuandoVazio;
    [Test]
    procedure DeveGravarCIndOpQuandoPreenchido;
    [Test]
    procedure NaoDeveGravarCIndOpQuandoVazio;
    [Test]
    procedure DeveGravarClassificacaoComDetalhamento;
    [Test]
    procedure DeveGravarClassificacaoSemDetalhamento;
    [Test]
    procedure NaoDeveGravarClassificacaoComModeloVazio;
    [Test]
    procedure NaoDeveGravarClassificacaoComModeloNulo;
    [Test]
    procedure NaoDevePreencherDestinatarioQuandoIndDestForZero;
    [Test]
    procedure DevePreencherDestinatarioQuandoIndDestForUm;
    [Test]
    procedure NaoDevePreencherGruposForaDoEscopo;
    [Test]
    procedure DevePreservarClassificacaoDoErpQuandoRetornoSemIbsCbs;
  end;

implementation

function TTestNFSeConverterIbsCbs.CriarDps: NFSeEtd;
begin
  Result := NFSeEtd.Create();
  Result.Id := 'nfse-conversor';
  Result.LayoutNFSe := lytNacionalComIbsCbs;
  Result.FinNFSe := Ord(fnfsDebito);
  Result.CIndOp := StringNullable.NullInstance();
  Result.TpOper := togNaoDefinido;
  Result.TpEnteGov := tgvNenhum;
  Result.IndDest := Ord(idTomadorAdquirenteDestinatarioIguais);
  Result.CCNAE := StringNullable.Create('6201500');
  Result.CNBS := StringNullable.Create('123456789');
  Result.CTribNac := StringNullable.Create('010101');
  Result.CTribMun := StringNullable.Create('0101');
  Result.XDescServ := StringNullable.Create('Servico prestado');
  Result.CLocPrestacao := IntegerNullable.Create(3550308);
  Result.VServ := CurrencyNullable.Create(100);
  Result.VDescIncond := CurrencyNullable.Create(0);
  Result.TribIssQn := tiOperacaoTributavel;
  Result.TpRetIssQn := trNaoRetido;
  Result.IssPAliq := CurrencyNullable.Create(2);
  Result.VRetIrrf := CurrencyNullable.Create(0);
  Result.VRetCsll := CurrencyNullable.Create(0);
  Result.VRetCP := CurrencyNullable.Create(0);
  Result.VRetPis := CurrencyNullable.Create(0);
  Result.VRetCofins := CurrencyNullable.Create(0);
  Result.PCCst := StringNullable.NullInstance();
  Result.PTotTribSN := CurrencyNullable.Create(0);
  Result.IndTotTrib := ynNo;
  Result.NDps := IntegerNullable.Create(10);
  Result.Serie := StringNullable.Create('1');
  Result.DhEmi := DateTimeNullable.Create(EncodeDate(2026, 1, 10));
  Result.DCompet := DateNullable.Create(EncodeDate(2026, 1, 1));
  Result.VerAplic := StringNullable.Create('1.0');
  Result.TpAmb := tpaHomologacao;
end;

function TTestNFSeConverterIbsCbs.CriarIbsCbs(const ACst, AClassTrib: string): DpsEmitirIbsCbsNacionalModel;
begin
  Result := DpsEmitirIbsCbsNacionalModel.Create(
    tctManual,
    StringNullable.Create('regra-teste'),
    ACst,
    AClassTrib,
    StringNullable.NullInstance(),
    StringNullable.NullInstance(),
    StringNullable.NullInstance(),
    CurrencyNullable.NullInstance(),
    CurrencyNullable.NullInstance(),
    CurrencyNullable.NullInstance()
  );
end;

function TTestNFSeConverterIbsCbs.CriarDestinatario: NFSeParticipanteEtd;
begin
  Result := NFSeParticipanteEtd.Create();
  Result.Cpfcnpj := StringNullable.Create('98765432000110');
  Result.Nif := StringNullable.NullInstance();
  Result.Cnaonif := IntegerNullable.NullInstance();
  Result.Xnome := 'Destinatario Teste';
  Result.Cmun := IntegerNullable.Create(3550308);
  Result.Cep := StringNullable.Create('01001000');
  Result.Xlgr := StringNullable.Create('Rua Destino');
  Result.Nro := StringNullable.Create('100');
  Result.Xcpl := StringNullable.NullInstance();
  Result.Xbairro := StringNullable.Create('Centro');
end;

procedure TTestNFSeConverterIbsCbs.Preparar(const AIbsCbs: DpsEmitirIbsCbsNacionalModel);
var
  Dps: NFSeEtd;
  Modelo: NFSeModel;
begin
  Dps := CriarDps();

  if AIbsCbs = nil then
    Modelo := NFSeModel.Create(Dps, TributoDFeContextEtd(nil))
  else
    Modelo := NFSeModel.Create(Dps, AIbsCbs);

  FDpsEmitir := DpsEmitirModel.Create(
    Modelo,
    edpsPrestador,
    '12345678000199',
    StringNullable.Create('12345'),
    'Prestador Teste',
    3550308,
    osnNaoOptante,
    raNaoDefinido,
    0,
    False,
    False,
    True,
    True
  );
end;

procedure TTestNFSeConverterIbsCbs.Converter;
begin
  FConverter.ConverterParaACBr(FDpsEmitir, FNota);
end;

procedure TTestNFSeConverterIbsCbs.Setup;
begin
  FAcbr := TACBrNFSeX.Create(nil);
  FNota := TNotaFiscal.Create(FAcbr);
  FConverter := NFSeConverter.Create();
end;

procedure TTestNFSeConverterIbsCbs.TearDown;
begin
  FConverter := nil;

  if FDpsEmitir <> nil then
  begin
    FDpsEmitir.DPS.IbsCbsNacional := nil;
    FreeAndNil(FDpsEmitir);
  end;

  FreeAndNil(FNota);
  FreeAndNil(FAcbr);
end;

procedure TTestNFSeConverterIbsCbs.DeveGravarXInfCompQuandoPreenchido;
begin
  Preparar(CriarIbsCbs('200', '200001'));
  FDpsEmitir.DPS.NFSe.XInfComp := StringNullable.Create('Informacoes complementares');

  Converter;

  Assert.AreEqual('Informacoes complementares', FNota.NFSe.Servico.infoCompl.xInfComp);
  Assert.AreEqual('', FNota.NFSe.Servico.infoCompl.idDocTec);
  Assert.AreEqual('', FNota.NFSe.Servico.infoCompl.docRef);
  Assert.AreEqual('', FNota.NFSe.Servico.infoCompl.xPed);
  Assert.AreEqual(0, FNota.NFSe.Servico.infoCompl.gItemPed.Count);
end;

procedure TTestNFSeConverterIbsCbs.NaoDeveGravarXInfCompQuandoVazio;
begin
  Preparar(CriarIbsCbs('200', '200001'));
  FDpsEmitir.DPS.NFSe.XInfComp := StringNullable.NullInstance();
  FNota.NFSe.Servico.infoCompl.xInfComp := 'mantido';

  Converter;

  Assert.AreEqual('mantido', FNota.NFSe.Servico.infoCompl.xInfComp);
end;

procedure TTestNFSeConverterIbsCbs.DeveGravarCIndOpQuandoPreenchido;
begin
  Preparar(CriarIbsCbs('200', '200001'));
  FDpsEmitir.DPS.NFSe.CIndOp := StringNullable.Create('101010');

  Converter;

  Assert.AreEqual('101010', FNota.NFSe.IBSCBS.cIndOp);
end;

procedure TTestNFSeConverterIbsCbs.NaoDeveGravarCIndOpQuandoVazio;
begin
  Preparar(CriarIbsCbs('200', '200001'));
  FDpsEmitir.DPS.NFSe.CIndOp := StringNullable.Create('   ');

  Converter;

  Assert.AreEqual('', FNota.NFSe.IBSCBS.cIndOp);
end;

procedure TTestNFSeConverterIbsCbs.DeveGravarClassificacaoComDetalhamento;
var
  IbsCbs: DpsEmitirIbsCbsNacionalModel;
begin
  IbsCbs := DpsEmitirIbsCbsNacionalModel.Create(
    tctManual,
    StringNullable.Create('regra-teste'),
    '200',
    '200001',
    StringNullable.Create('01'),
    StringNullable.Create('200'),
    StringNullable.Create('200002'),
    CurrencyNullable.Create(1.5),
    CurrencyNullable.Create(2.5),
    CurrencyNullable.Create(3.5)
  );
  Preparar(IbsCbs);

  Converter;

  Assert.AreEqual('200', CSTIBSCBSToStr(FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.CST));
  Assert.AreEqual('200001', FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.cClassTrib);
  Assert.AreEqual('01', cCredPresToStr(FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.cCredPres));
  Assert.AreEqual('200', CSTIBSCBSToStr(FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.gTribRegular.CSTReg));
  Assert.AreEqual('200002', FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.gTribRegular.cClassTribReg);
  Assert.AreEqual(1.5, FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.gDif.pDifUF, 0.0001);
  Assert.AreEqual(2.5, FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.gDif.pDifMun, 0.0001);
  Assert.AreEqual(3.5, FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.gDif.pDifCBS, 0.0001);
end;

procedure TTestNFSeConverterIbsCbs.DeveGravarClassificacaoSemDetalhamento;
begin
  Preparar(CriarIbsCbs('200', '200001'));

  Converter;

  Assert.AreEqual('200', CSTIBSCBSToStr(FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.CST));
  Assert.AreEqual('200001', FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.cClassTrib);
  Assert.AreEqual('', cCredPresToStr(FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.cCredPres));
  Assert.AreEqual('', FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.gTribRegular.cClassTribReg);
  Assert.AreEqual(0.0, FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.gDif.pDifUF, 0.0001);
  Assert.AreEqual(0.0, FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.gDif.pDifMun, 0.0001);
  Assert.AreEqual(0.0, FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.gDif.pDifCBS, 0.0001);
end;

procedure TTestNFSeConverterIbsCbs.NaoDeveGravarClassificacaoComModeloVazio;
begin
  Preparar(DpsEmitirIbsCbsNacionalModel.Create());

  Converter;

  Assert.AreEqual('', CSTIBSCBSToStr(FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.CST));
  Assert.AreEqual('', FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.cClassTrib);
  Assert.IsTrue(FNota.NFSe.IBSCBS.finNFSe = fnfsDebito);
end;

procedure TTestNFSeConverterIbsCbs.NaoDeveGravarClassificacaoComModeloNulo;
begin
  Preparar(nil);

  Converter;

  Assert.AreEqual('', CSTIBSCBSToStr(FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.CST));
  Assert.AreEqual('', FNota.NFSe.IBSCBS.valores.trib.gIBSCBS.cClassTrib);
  Assert.IsTrue(FNota.NFSe.IBSCBS.finNFSe = fnfsDebito);
end;

procedure TTestNFSeConverterIbsCbs.NaoDevePreencherDestinatarioQuandoIndDestForZero;
begin
  Preparar(CriarIbsCbs('200', '200001'));
  FDpsEmitir.DPS.NFSe.IndDest := Ord(idTomadorAdquirenteDestinatarioIguais);
  FDpsEmitir.DPS.NFSe.DestIbsCbs := CriarDestinatario();

  Converter;

  Assert.IsTrue(FNota.NFSe.IBSCBS.indDest = idTomadorAdquirenteDestinatarioIguais);
  Assert.AreEqual('', FNota.NFSe.IBSCBS.dest.xNome);
  Assert.AreEqual('', FNota.NFSe.IBSCBS.dest.CNPJCPF);
end;

procedure TTestNFSeConverterIbsCbs.DevePreencherDestinatarioQuandoIndDestForUm;
begin
  Preparar(CriarIbsCbs('200', '200001'));
  FDpsEmitir.DPS.NFSe.IndDest := Ord(idTomadorAdquirenteIguais);
  FDpsEmitir.DPS.NFSe.DestIbsCbs := CriarDestinatario();

  Converter;

  Assert.IsTrue(FNota.NFSe.IBSCBS.indDest = idTomadorAdquirenteIguais);
  Assert.AreEqual('98765432000110', FNota.NFSe.IBSCBS.dest.CNPJCPF);
  Assert.AreEqual('Destinatario Teste', FNota.NFSe.IBSCBS.dest.xNome);
  Assert.AreEqual(3550308, FNota.NFSe.IBSCBS.dest.ender.endNac.cMun);
  Assert.AreEqual('01001000', FNota.NFSe.IBSCBS.dest.ender.endNac.CEP);
  Assert.AreEqual('Rua Destino', FNota.NFSe.IBSCBS.dest.ender.xLgr);
  Assert.AreEqual('100', FNota.NFSe.IBSCBS.dest.ender.nro);
  Assert.AreEqual('Centro', FNota.NFSe.IBSCBS.dest.ender.xBairro);
end;

procedure TTestNFSeConverterIbsCbs.NaoDevePreencherGruposForaDoEscopo;
begin
  Preparar(CriarIbsCbs('200', '200001'));

  Converter;

  Assert.AreEqual(0.0, FNota.NFSe.Servico.Valores.ValorDeducoes, 0.0001);
  Assert.AreEqual(0.0, FNota.NFSe.Servico.Valores.DescontoCondicionado, 0.0001);
  Assert.AreEqual(0, FNota.NFSe.Servico.Valores.DocDeducao.Count);
  Assert.AreEqual(0, FNota.NFSe.IBSCBS.valores.gReeRepRes.documentos.Count);
  Assert.AreEqual(0.0, FNota.NFSe.IBSCBS.vlrReeRepRes, 0.0001);
  Assert.AreEqual(0.0, FNota.NFSe.Servico.Valores.vAjusteBCISSQN, 0.0001);
  Assert.AreEqual(0, FNota.NFSe.Servico.Valores.docAjusteBC.Count);
end;

procedure TTestNFSeConverterIbsCbs.DevePreservarClassificacaoDoErpQuandoRetornoSemIbsCbs;
var
  IbsCbs: DpsEmitirIbsCbsNacionalModel;
  Tributo: TributoDFeContextEtd;
begin
  IbsCbs := CriarIbsCbs('200', '200001');
  Preparar(IbsCbs);
  FNota.NFSe.infNFSe.cLocIncid := 3550308;

  Tributo := FConverter.ConververParaTributoDFe(FDpsEmitir.DPS, FNota);
  try
    Assert.IsNotNull(Tributo);
    Assert.IsNotNull(Tributo.IbsCbs);
    Assert.AreEqual('nfse-conversor', Tributo.Id);
    Assert.AreEqual('200', Tributo.IbsCbs.Cst);
    Assert.AreEqual('200001', Tributo.IbsCbs.CClasstrib);
    Assert.IsNull(Tributo.IbsCbs.GIbsCbs.TribRegular);
    Assert.IsNull(Tributo.IbsCbs.CredPresOp);
  finally
    Tributo.Free();
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestNFSeConverterIbsCbs);

end.
