unit Teste_CompraGovService;

interface

uses
  DUnitX.TestFramework,
  JsonResourceUnit,
  CalculoInputTestModel,
  CalcularTributoInputUnit,
  ROCDomainUnit,
  ROCItemDomainUnit,
  OperacaoConsumoModelUnit,
  CompraGovernamentalModelUnit,
  TipoEnteGovernamentalEnumUnit,
  TipoOperacaoGovernamentalEnumUnit,
  TributosModelUnit,
  ImpostoSeletivoModelUnit,
  IBSCBSModelUnit,
  GrupoIBSCBSModelUnit,
  IBSUFModelUnit,
  IBSMunModelUnit,
  CBSModelUnit,
  ReducaoAliquotaModelUnit,
  TributacaoRegularModelUnit,
  TributacaoCompraGovernamentalModelUnit,
  ValoresTotaisDomainUnit,
  TributosTotaisUnit,
  IBSCBSTotalUnit,
  IBSTotalUnit,
  CBSTotalUnit,
  MonofasiaTotalUnit,
  ImpostoSeletivoTotalUnit,
  IBSUFTotalUnit,
  IBSMunTotalUnit;

type
  [TestFixture]
  TTeste_CompraGovService = class
  private
    FJsonReader: JsonResource;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestCalcularTributosCompraGov;
  end;

  [TestFixture]
  TTeste_CalculoTributoService_SemCbsIbs = class
  public
    [Test]
    procedure teste_SemCbsIbs_GIBSCBSNulo;
  end;

implementation

uses
  SetupTestUnit,
  ContainerFiscalTestsUnit,
  CalculaTributoUseCaseUnit,
  SysUtils,
  CalculoTributoServiceUnit,
  TransferenciaCBSServiceUnit,
  CurrencyNullableUnit,
  OperacaoTributacaoModelUnit,
  TratamentoOperacaoModelUnit,
  ItemCalculoInputUnit,
  ImpostoSeletivoInputUnit,
  TributacaoRegularInputUnit;

type
  TSpyTransferenciaCBSRepository = class(TInterfacedObject, ITransferenciaCBSService)
  private
    FFoiChamado: Boolean;
  public
    constructor Create;
    function GetPercentualTransferencia(Data: TDate): Currency;
    property FoiChamado: Boolean read FFoiChamado;
  end;

{ TSpyTransferenciaCBSRepository }

constructor TSpyTransferenciaCBSRepository.Create;
begin
  FFoiChamado := False;
end;

function TSpyTransferenciaCBSRepository.GetPercentualTransferencia(Data: TDate): Currency;
begin
  FFoiChamado := True;
  Result := 0;
end;

{ TTeste_CompraGovService }

procedure TTeste_CompraGovService.Setup;
begin
  ModernInitialize();
  FJsonReader := JsonResource.Create;
end;

procedure TTeste_CompraGovService.TearDown;
begin
  FJsonReader.Free;
  ModernShutDown();
end;

procedure TTeste_CompraGovService.TestCalcularTributosCompraGov;
var
  LUseCase: ICalculaTributoUseCase;
  LInputJson: CalcularTributoTestInput;
  LInput: CalcularTributoInput;
  LResultado: ROCDomain;
  LItem: ROCItemDomain;
  LCompraGov: CompraGovernamentalModel;
  LIs: ImpostoSeletivoModel;
  LGrupo: GrupoIBSCBSModel;
  LIbsUf: IBSUFModel;
  LIbsMun: IBSMunModel;
  LCbs: CBSModel;
  LReg: TributacaoRegularModel;
  LTcg: TributacaoCompraGovernamentalModel;
  LTotal: ValoresTotaisDomain;
  LTribCalc: TributosTotais;
  LIbsCbsTot: IBSCBSTotal;
  LIbsTot: IBSTotal;
  LCbsTot: CBSTotal;
  LMono: MonofasiaTotal;
begin
  // Reproduz CompraGovServiceTest.java com o fluxo integrado de compra
  // governamental + transferencia de CBS (fixture entrada.json).
  LInputJson := FJsonReader.DeserializeObject<CalcularTributoTestInput>('Entradas\CalculosCorretos\compras-governamentais\entrada.json');
  try
    LInput := TCalculoInputConverter.ToInput(LInputJson);

    LUseCase := Container.GetInstance().FiscalCalculosFactory.CreateCalculaTributoUseCase();
    try
      LResultado := LUseCase.Executar(LInput);
      try
        Assert.IsNotNull(LResultado);

        // oper.gCompraGov
        Assert.IsFalse(LResultado.Oper.IsNull(), 'oper deve estar presente');
        LCompraGov := LResultado.Oper.GCompraGov;
        Assert.IsFalse(LCompraGov.IsNull(), 'gCompraGov deve estar presente');
        Assert.AreEqual(Integer(tegEstado), Integer(LCompraGov.TpEnteGov), 'tpEnteGov');
        Assert.AreEqual(Integer(togFornecimento), Integer(LCompraGov.TpOperGov), 'tpOperGov');
        Assert.AreEqual(50.00, LCompraGov.PRedutor, 0.0001, 'pRedutor');

        // objetos[0]
        Assert.IsNotNull(LResultado.Objetos);
        Assert.IsTrue(Length(LResultado.Objetos) > 0);
        LItem := LResultado.Objetos[0];
        Assert.IsNotNull(LItem);
        Assert.AreEqual(1, LItem.NObj);

        // objetos[0].tribCalc.IS
        LIs := LItem.TribCalc.&IS;
        Assert.IsFalse(LIs.IsNull(), 'IS deve estar presente');
        Assert.AreEqual(200.00, LIs.VBCIS, 0.0001);
        Assert.AreEqual(14.00, LIs.PIS, 0.0001);
        Assert.AreEqual(21.30, LIs.PISEspec, 0.0001);
        Assert.AreEqual(1.0, LIs.QTrib, 0.0001);
        Assert.AreEqual(49.30, LIs.VIS, 0.0001);

        // objetos[0].tribCalc.IBSCBS.gIBSCBS
        LGrupo := LItem.TribCalc.IBSCBS.GIBSCBS;
        Assert.IsNotNull(LGrupo);
        Assert.AreEqual(249.30, LGrupo.ValorBaseCalculoIBSCBS, 0.0001, 'gIBSCBS.VBC');

        // gIBSUF
        LIbsUf := LGrupo.GIBSUF;
        Assert.IsNotNull(LIbsUf);
        Assert.AreEqual(0.00, LIbsUf.PIBSUF, 0.0001);
        Assert.AreEqual(0.00, LIbsUf.GRed.PRedAliq, 0.0001);
        Assert.AreEqual(0.00, LIbsUf.GRed.PAliqEfet, 0.0001);
        Assert.AreEqual(0.00, LIbsUf.VIBSUF, 0.0001);

        // gIBSMun
        LIbsMun := LGrupo.GIBSMun;
        Assert.IsNotNull(LIbsMun);
        Assert.AreEqual(0.00, LIbsMun.PIBSMun, 0.0001);
        Assert.AreEqual(0.00, LIbsMun.GRed.PRedAliq, 0.0001);
        Assert.AreEqual(0.00, LIbsMun.GRed.PAliqEfet, 0.0001);
        Assert.AreEqual(0.00, LIbsMun.VIBSMun, 0.0001);

        Assert.AreEqual(0.00, LGrupo.VIBS, 0.0001);

        // gCBS
        LCbs := LGrupo.GCBS;
        Assert.IsNotNull(LCbs);
        Assert.AreEqual(0.00, LCbs.PCBS, 0.0001);
        Assert.AreEqual(0.00, LCbs.GRed.PRedAliq, 0.0001);
        Assert.AreEqual(0.00, LCbs.GRed.PAliqEfet, 0.0001);
        Assert.AreEqual(0.00, LCbs.VCBS, 0.0001);

        // gTribRegular
        LReg := LGrupo.TributacaoRegular;
        Assert.IsFalse(LReg.IsNull(), 'gTribRegular deve estar presente');
        Assert.AreEqual(0.54, LReg.PAliqEfetRegIBSUF, 0.0001);
        Assert.AreEqual(1.35, LReg.VTribRegIBSUF, 0.0001);
        Assert.AreEqual(0.00, LReg.PAliqEfetRegIBSMun, 0.0001);
        Assert.AreEqual(0.00, LReg.VTribRegIBSMun, 0.0001);
        Assert.AreEqual(1.53, LReg.PAliqEfetRegCBS, 0.0001);
        Assert.AreEqual(3.81, LReg.VTribRegCBS, 0.0001);

        // gTribCompraGov (zerado)
        LTcg := LGrupo.GTribCompraGov;
        Assert.IsFalse(LTcg.IsNull(), 'gTribCompraGov deve estar presente');
        Assert.AreEqual(0.00, LTcg.PAliqIBSUF, 0.0001);
        Assert.AreEqual(0.00, LTcg.VTribIBSUF, 0.0001);
        Assert.AreEqual(0.00, LTcg.PAliqIBSMun, 0.0001);
        Assert.AreEqual(0.00, LTcg.VTribIBSMun, 0.0001);
        Assert.AreEqual(0.00, LTcg.PAliqCBS, 0.0001);
        Assert.AreEqual(0.00, LTcg.VTribCBS, 0.0001);

        // total.tribCalc
        LTotal := LResultado.Total;
        LTribCalc := LTotal.TribCalc;
        Assert.AreEqual(49.30, LTribCalc.ISTot.VIS, 0.0001, 'ISTot.VIS');

        LIbsCbsTot := LTribCalc.IBSCBSTot;
        Assert.AreEqual(249.30, LIbsCbsTot.VBCIBSCBS, 0.0001, 'VBCIBSCBS');

        LIbsTot := LIbsCbsTot.GIBS;
        Assert.AreEqual(0.00, LIbsTot.GIBSUF.VDif, 0.0001);
        Assert.AreEqual(0.00, LIbsTot.GIBSUF.VDevTrib, 0.0001);
        Assert.AreEqual(0.00, LIbsTot.GIBSUF.VIBSUF, 0.0001);
        Assert.AreEqual(0.00, LIbsTot.GIBSMun.VDif, 0.0001);
        Assert.AreEqual(0.00, LIbsTot.GIBSMun.VDevTrib, 0.0001);
        Assert.AreEqual(0.00, LIbsTot.GIBSMun.VIBSMun, 0.0001);
        Assert.AreEqual(0.00, LIbsTot.VIBS, 0.0001);
        Assert.AreEqual(0.00, LIbsTot.VCredPres, 0.0001);
        Assert.AreEqual(0.00, LIbsTot.VCredPresCondSus, 0.0001);

        LCbsTot := LIbsCbsTot.GCBS;
        Assert.AreEqual(0.00, LCbsTot.VDif, 0.0001);
        Assert.AreEqual(0.00, LCbsTot.VDevTrib, 0.0001);
        Assert.AreEqual(0.00, LCbsTot.VCBS, 0.0001);
        Assert.AreEqual(0.00, LCbsTot.VCredPres, 0.0001);
        Assert.AreEqual(0.00, LCbsTot.VCredPresCondSus, 0.0001);

        LMono := LIbsCbsTot.GMono;
        Assert.AreEqual(0.00, LMono.VIBSMono, 0.0001);
        Assert.AreEqual(0.00, LMono.VCBSMono, 0.0001);
        Assert.AreEqual(0.00, LMono.VIBSMonoReten, 0.0001);
        Assert.AreEqual(0.00, LMono.VCBSMonoReten, 0.0001);
        Assert.AreEqual(0.00, LMono.VIBSMonoRet, 0.0001);
        Assert.AreEqual(0.00, LMono.VCBSMonoRet, 0.0001);
      finally
        LResultado.Free;
      end;
    finally
      LUseCase.FreeSafe();
    end;
  finally
    LInputJson.Free;
  end;
end;

procedure TTeste_CalculoTributoService_SemCbsIbs.teste_SemCbsIbs_GIBSCBSNulo;
var
  LTransfCBSServ: ITransferenciaCBSService;
  LService: CalculoTributoService;
  LItem: ItemCalculoInput;
  LOperacao: OperacaoTributacaoModel;
  LResultado: TributosModel;
begin
  // Espelho de CalculoTributoService.java#L229-L233: operacao sem CBS/IBS
  // (somente IS, imune, IBS desabilitado) gera gIBSCBS nulo SEM consultar o
  // repositorio de transferencia de CBS (sem exigir registro vigente).
  LTransfCBSServ := TSpyTransferenciaCBSRepository.Create;
  LService := CalculoTributoService.Create(nil, nil, nil, LTransfCBSServ);
  try
    LItem := ItemCalculoInput.Create(
      1, '24021000', '000001', '000',
      ImpostoSeletivoInput.NullInstance(),
      TributacaoRegularInput.NullInstance(),
      0, 0, 'VN');

    LOperacao := OperacaoTributacaoModel.Create(
      EncodeDate(2027, 1, 1),
      0, 0,
      '24021000', '',
      LItem,
      TratamentoOperacaoModel.NullInstance(),
      tegUnassigned, 0);

    LResultado := LService.Calcular(LOperacao);
    try
      Assert.IsNotNull(LResultado);
      Assert.IsNotNull(LResultado.IBSCBS);
      Assert.IsNull(LResultado.IBSCBS.GIBSCBS, 'gIBSCBS deve ser nulo quando não há CBS/IBS');
      Assert.IsFalse(TSpyTransferenciaCBSRepository(LTransfCBSServ).FoiChamado, 'Repositório de transferência não deve ser consultado sem CBS/IBS');
    finally
      LResultado.Free;
    end;
  finally
    LService.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_CompraGovService);
  TDUnitX.RegisterTestFixture(TTeste_CalculoTributoService_SemCbsIbs);

end.
