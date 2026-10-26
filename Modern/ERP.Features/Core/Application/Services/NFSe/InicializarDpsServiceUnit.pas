unit InicializarDpsServiceUnit;

interface

uses
  SysUtils,
  IInicializarDpsServiceUnit,
  IResolverRegraFiscalIbsCbsServiceUnit,
  IClientesRepositoryUnit,
  ITiposServicosRepositoryUnit,
  IConfiguracaoNFSeServiceUnit,
  NFSeModelUnit;

type
  InicializarDpsService = class(TInterfacedObject, IInicializarDpsService)
  private
    FResolverRegrasFiscais: IResolverRegraFiscalIbsCbsService;
    FClientesRepo: IClientesRepository;
    FTiposServicosRepo: ITiposServicosRepository;
    FConfNFSe: IConfiguracaoNFSeService;
  public
    constructor Create(
      ClientesRepo: IClientesRepository;
      TiposServicosRepo: ITiposServicosRepository;
      ResolverRegrasFiscais: IResolverRegraFiscalIbsCbsService;
      ConfNFSe: IConfiguracaoNFSeService
    );
    function Executar(const Input: InicializarDpsCommand): NFSeModel;
  end;

implementation

uses
  StrUtils, DateUtils, ConfiguracaoEtdUnit, ConfigFactoryUnit, IConfigReaderAndWriterUnit, ConfigLegacyTypes,
  IntegerNullableUnit, DateAndTimeNullableUnit, NFSeTypesUnit, StringNullableUnit, CurrencyNullableUnit, TipoComunsUnit,
  StringServiceUnit, NFSeEtdUnit, ResolverRegraFiscalIbsCbsTypesUnit, RegraFiscalIbsCbsEtdUnit, TipoServicoEtdUnit,
  NFSeParticipanteEtdUnit, ClienteEtdUnit, NFSeParticipanteFactoryUnit, DFeTypesUnit, TipoRegraTributoDFeEnumUnit,
  NFSeIbsCbsFactoryUnit, ConfiguracaoNFSeModelUnit, VersaoAplicacaoUnit, DpsEmitirIbsCbsNacionalModelUnit;

{ InicializarDpsService }

constructor InicializarDpsService.Create(
  ClientesRepo: IClientesRepository;
  TiposServicosRepo: ITiposServicosRepository;
  ResolverRegrasFiscais: IResolverRegraFiscalIbsCbsService;
  ConfNFSe: IConfiguracaoNFSeService
);
begin
  FResolverRegrasFiscais := ResolverRegrasFiscais;
  FClientesRepo := ClientesRepo;
  FTiposServicosRepo := TiposServicosRepo;
  FConfNFSe := ConfNFSe;
end;

function InicializarDpsService.Executar(const Input: InicializarDpsCommand): NFSeModel;
var
  INull, CodCliente: IntegerNullable;
  SNull, XDescServ, Serie: StringNullable;
  CNull: CurrencyNullable;
  DNull: DateTimeNullable;
  IbsCbs: DpsEmitirIbsCbsNacionalModel;
  Servico: TipoServicoEtd;
  Tomador, Prestador: NFSeParticipanteEtd;
  Cliente: ClienteEtd;
  TpEnteGov: TipoEnteGovEnum;
  GrupoFiscalIbsCbsId: string;
  RegraFiscal: RegraFiscalIbsCbsEtd;
  ConfigNFSe: ConfiguracaoNFSeModel;
  IndTotTrib: YesNoEnum;
  LayoutNFSe: LayoutNFSeEnum;
  DPS: NFSeEtd;
  RefNFSe: TArrayString;
begin
  INull := IntegerNullable.NullInstance();
  SNull := StringNullable.NullInstance();
  CNull := CurrencyNullable.NullInstance();
  DNull := DateTimeNullable.NullInstance();

  IbsCbs := nil;
  Servico := nil;
  Tomador := nil;
  Prestador := nil;
  IbsCbs := nil;
  SetLength(RefNFSe, 0);

  TpEnteGov := tgvNenhum;
  CodCliente := INull;
  if Input.ClienteId > 0 then
  begin
    Cliente := FClientesRepo.GetById(Input.ClienteId, Input.EmpresaId);
    try
      if Cliente <> nil then
      begin
        if Input.Natureza in [ nemtPrestadorWS, nemtPrestadorPortal ] then
          Tomador := NFSeParticipanteFactory.Executar( '', tprtTomador, Cliente )
        else
          Prestador := NFSeParticipanteFactory.Executar( '', tprtPrestador, Cliente );

        CodCliente := IntegerNullable.CreateOrNull( Cliente.CodCliente );
        TpEnteGov := Cliente.TipoEnteGov;
      end;
    finally
      Cliente.Free();
    end;
  end;

  GrupoFiscalIbsCbsId := '';
  XDescServ.SetNull();
  if Input.ServicoId > 0 then
  begin
    Servico := FTiposServicosRepo.GetById(Input.ServicoId);
    if Servico <> nil then
      GrupoFiscalIbsCbsId := Servico.GrupoFiscalIbsCbsId.Value;
  end;

  ConfigNFSe := FConfNFSe.Executar(Input.EmpresaId);

  IndTotTrib := YesNoEnum(not ConfigNFSe.InibirValTrib);

  if Input.Natureza = nemtTomadorTerceiros then
  begin
    if ConfigNFSe.LayoutNFSe = lytNacionalComIbsCbs  then
      LayoutNFSe := lytNacionalComIbsCbs
    else
      LayoutNFSe := lytNacionalSemIbsCbs; // Simples nacional em 2006

    Serie.SetNull();
  end
  else
  begin
    LayoutNFSe := ConfigNFSe.LayoutNFSe;
    Serie.SetValue( ConfigNFSe.Serie );
  end;

  try
  
    DPS := NFSeEtd.Create(
      {Id} '',
      {SeqId} 0,
      {CodEmpresa} Input.EmpresaId,
      {TomadorId} CodCliente,
      {IntermediarioId} INull,
      {DestIbsCbs} INull,
      ConfigNFSe.OpInternaId,
      LayoutNFSe,
      {Situacao} sdpsRascunho,
      {NaturezaEmissao} Input.Natureza,
      {TpAmb} tpaNaoDefinido,
      {DhEmi} DNull,//( Input.Data ),
      {VerAplic} StringNullable.Create( VERSAO_APP_HW ),
      Serie,
      {Ndps} INull,
      {Dcompet} DateNullable.Create( DateOf( Input.DataCompetencia )),
      {CLocPrestacao} IntegerNullable.Create( ConfigNFSe.CMunEmitente ),
      {FinNFse} 0,
      {CIndOp} SNull,
      {TpOper} togNaoDefinido, // Tem de vir do usuário entao fica assim mesmo
      TpEnteGov,
      {IndDest} Ord(ynNo),
      {CCNAE} SNull,
      {CLC116} SNull,
      {CTribNac} SNull,
      {CTribMun} SNull,
      XDescServ,
      {CNBS} SNull,
      {CodServico} INull,
      {VServ} CNull,
      {VDescIncond} CNull,
      {TribIssQn} tiNaoDefinido,
      {TpRetIssQn} trNaoDefinido,
      {IssPAliq} CNull,
      {IssVBC} CNull,
      {VIss} CNull,
      {FPcCst} SNull,
      {PcVbcpiscofins} CNull,
      {PcPaliqPis} CNull,
      {PcPaliqCofins} CNull,
      {PcVpis} CNull,
      {PcVcofins} CNull,
      {TpretPiscofins} trpiscofinscsllNaoRetido,
      {VRetIrrf} CNull,
      {VRetCsll} CNull,
      {VRetCP} CNull,
      {VRetPis} CNull,
      {VRetCofins} CNull,
      {PTotTribFed} CNull,
      {PTotTribEst} CNull,
      {PTotTribMun} CNull,
      IndTotTrib,
      {PTotTribSN} ConfigNFSe.PTotTribSN,
      {NLote} SNull,
      {NProtocolo} SNull,
      {ChaveNFSe} SNull,
      {DhProc} DNull,
      {CCtat} SNull,
      {NNFSe} Int64Nullable.NullInstance(),
      {NDFSe} Int64Nullable.NullInstance(),
      {VLiq} CNull,
      {VTotNf} CNull,
      {PRedutor} CNull,
      {VTotalRet} CNull,
      {CVerificacao} SNull,
      {CancOrigem} ocnNaoDefinido,
      {DhCanc} DNull,
      RefNFSe,
      Tomador,
      Prestador,
      {Intermediario} nil,
      {DestIbsCbs} nil,
      Servico,
      nil
    );

    DPS.AplicarAtribuirServico(Servico);

    if LayoutNFSe in [ lytNacionalComIbsCbs ] then
    begin
      RegraFiscal := FResolverRegrasFiscais.Executar(ResolverRegraFiscalIbsCbsInput.Create(
        ConfigNFSe.OpInternaId.Value, GrupoFiscalIbsCbsId, Input.EmpresaId, Input.DataCompetencia
      ));
      try
        if RegraFiscal = nil then
          RegraFiscal := RegraFiscalIbsCbsEtd.Create();

        IbsCbs := NFSeIbsCbsFactory.Create(
          {Id} '',
          {TipoRegra} tctAutomatica,
          {CCredPres} SNull,
          RegraFiscal
        );

      finally
        RegraFiscal.Free();
      end;
    end;

  except on E: Exception do
    begin
      DPS.Free();
      IbsCbs.Free();
      raise;
    end;
  end;
  
  Result := NFSeModel.Create( DPS, IbsCbs );
end;

end.
