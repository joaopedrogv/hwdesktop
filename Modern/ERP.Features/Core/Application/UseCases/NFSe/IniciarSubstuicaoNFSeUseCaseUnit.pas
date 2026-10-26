unit IniciarSubstuicaoNFSeUseCaseUnit;

interface

uses
  SysUtils,
  INFSeRepositoryUnit,
  ITributosDFeRepositoryUnit,
  IConfiguracaoNFSeServiceUnit,
  NFSeModelUnit;

type
  IIniciarSubstuicaoNFSeUseCase = interface
    ['{4B04BF3C-ED6C-4C0B-9E0D-915FA1880E36}']
    function Executar(const NFSeId: string; EmpresaId: Integer): NFSeModel;
  end;

  IniciarSubstuicaoNFSeUseCase = class(TInterfacedObject, IIniciarSubstuicaoNFSeUseCase)
  private
    FNFSeRepo: INFSeRepository;        
    FTributosDFeRepo: ITributosDFeRepository;
    FConfNFSe: IConfiguracaoNFSeService;
  public
    constructor Create(
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository;
      ConfNFSe: IConfiguracaoNFSeService
    );
    function Executar(const NFSeId: string; EmpresaId: Integer): NFSeModel;
  end;

implementation

uses
  StrUtils,
  IntegerNullableUnit, DateAndTimeNullableUnit, NFSeTypesUnit, StringNullableUnit, CurrencyNullableUnit,
  TipoServicoEtdUnit, NFSeParticipanteEtdUnit, NFSeParticipanteFactoryUnit, ConfiguracaoNFSeModelUnit,
  VersaoAplicacaoUnit, EValidacaoNegocioUnit, NFSeSubstEtdUnit, NFSeEtdUnit, TributoDFeContextEtdUnit,
  TributoDFeOrigemEnumUnit, NFSeIbsCbsFactoryUnit;

{ IniciarSubstuicaoNFSeUseCase }

constructor IniciarSubstuicaoNFSeUseCase.Create(
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository;
  ConfNFSe: IConfiguracaoNFSeService
);
begin
  FNFSeRepo := NFSeRepo;
  FTributosDFeRepo := TributosDFeRepo;
  FConfNFSe := ConfNFSe;
end;

function IniciarSubstuicaoNFSeUseCase.Executar(const NFSeId: string; EmpresaId: Integer): NFSeModel;
var
  nfseBase: NFSeEtd;
  trib, tribResult: TributoDFeContextEtd;
  SNull: StringNullable;
  INull: IntegerNullable;
  CNull: CurrencyNullable;
  DNull: DateTimeNullable;
  _Tomador, _Prestador, _Intermediario, _DestIbsCbs: NFSeParticipanteEtd;
  _Servico: TipoServicoEtd;
  _Substituida: NFSeSubstEtd;
  ConfigNFSe: ConfiguracaoNFSeModel;
begin
  INull := IntegerNullable.NullInstance();
  SNull := StringNullable.NullInstance();
  nfseBase := FNFSeRepo.GetNFSe(NFSeId, EmpresaId);
  trib := FTributosDFeRepo.GetById( NFSeId, tdfoNFSe );
  try

    if nfseBase = nil then
      raise EValidacaoNegocio.Create('NFSe base não encontrada');

    if nfseBase.Situacao <> sdpsAutorizada then
      raise EValidacaoNegocio.Create('NFSe selecionada não está Autorizada para ser substituída');

    if nfseBase.NaturezaEmissao = nemtTomadorTerceiros then
      raise EValidacaoNegocio.Create('NFSe selecionada emitida por terceiros, não é possível efetuar a substuição');

    ConfigNFSe := FConfNFSe.Executar(EmpresaId);

    if nfseBase.IsPadraoNacional and ( ConfigNFSe.LayoutNFSe = lytPrefeitura ) then
      raise EValidacaoNegocio.Create('NFSe base é do padrão nacional e o provedor atual é da prefeitura')

    else if not nfseBase.IsPadraoNacional and ( ConfigNFSe.LayoutNFSe <> lytPrefeitura ) then
      raise EValidacaoNegocio.Create('Padrão nacional habilitado, porém a NFSe é do layout da Prefeitura');

    _Substituida := NFSeSubstEtd.Create(
      '',
      StringNullable.Create( NFSeId ),
      nfseBase.ChaveNFSe,
      SNull,
      SNull,
      nfseBase.Serie,
      nfseBase.NDps,
      nfseBase.NNFSe,
      nfseBase.NLote,
      nfseBase.CVerificacao
    );

    if nfseBase.Tomador = nil then
      _Tomador := nil
    else
      _Tomador := NFSeParticipanteEtd(nfseBase.Tomador.Clone());

    if nfseBase.Prestador = nil then
      _Prestador := nil
    else
      _Prestador := NFSeParticipanteEtd(nfseBase.Prestador.Clone());

    if nfseBase.Intermediario = nil then
      _Intermediario := nil
    else
      _Intermediario := NFSeParticipanteEtd(nfseBase.Intermediario.Clone());

    if nfseBase.DestIbsCbs = nil then
      _DestIbsCbs := nil
    else
      _DestIbsCbs := NFSeParticipanteEtd(nfseBase.DestIbsCbs.Clone());

    if nfseBase.Servico = nil then
      _Servico := nil
    else
      _Servico := TipoServicoEtd(nfseBase.Servico.Clone());

//    if nfseBase.IbsCbs = nil then
//      _IbsCbs := nil
//    else
//      _IbsCbs := NFSeIbsCbsEtd(nfseBase.IbsCbs.Clone());

    tribResult := trib.Clone();
    if tribResult <> nil then
      tribResult.Id := '';

    Result := NFSeModel.Create(
      NFSeEtd.Create(
        {Id} '',
        {SeqId} 0,
        {CodEmpresa} EmpresaId,
        nfseBase.CodCliente,
        nfseBase.IntermediarioId,
        nfseBase.DestIbsCbsId,
        nfseBase.OpInternaId,
        {LayoutNFSe} ConfigNFSe.LayoutNFSe,
        {Situacao} sdpsRascunho,
        {NaturezaEmissao} nemtPrestadorWS,
        nfseBase.TpAmb,
        {DhEmi} DateTimeNullable.Create(Now),
        {VerAplic} StringNullable.Create(VERSAO_APP_HW),
        {Serie} SNull,
        {Ndps} INull,
        nfseBase.DCompet,
        nfseBase.CLocPrestacao,
        nfseBase.FinNFSe,
        nfseBase.CIndOp,
        nfseBase.TpOper,
        nfseBase.TpEnteGov,
        nfseBase.IndDest,
        nfseBase.CCNAE,
        nfseBase.CLC116,
        nfseBase.CTribNac,
        nfseBase.CTribMun,
        nfseBase.XDescServ,
        nfseBase.CNBS,
        nfseBase.CodServico,
        nfseBase.VServ,
        nfseBase.VDescIncond,
        nfseBase.TribIssQn,
        nfseBase.TpRetIssQn,
        nfseBase.IssPAliq,
        nfseBase.IssVBC,
        nfseBase.VIss,
        nfseBase.PCCst,
        nfseBase.PcVbcpiscofins,
        nfseBase.PcPaliqPis,
        nfseBase.PcPaliqCofins,
        nfseBase.PcVpis,
        nfseBase.PcVcofins,
        nfseBase.TpretPiscofins,
        nfseBase.VRetIrrf,
        nfseBase.VRetCsll,
        nfseBase.VRetCP,
        nfseBase.VRetPis,
        nfseBase.VRetCofins,
        nfseBase.PTotTribFed,
        nfseBase.PTotTribEst,
        nfseBase.PTotTribMun,
        nfseBase.IndTotTrib,
        nfseBase.PTotTribSN,
        {NLote} SNull,
        {NProtocolo} SNull,
        {ChaveNFSe} SNull,
        {DhProc} DNull,
        {CCtat} SNull,
        {NNFSe} Int64Nullable.NullInstance(),
        {NDFSe} Int64Nullable.NullInstance(),
        nfseBase.VLiq,
        nfseBase.VTotNf,
        nfseBase.PRedutor,
        nfseBase.VTotalRet,
        {CVerificacao} SNull,
        {CancOrigem} ocnNaoDefinido,
        {DhCanc} DNull,
        nfseBase.RefNFSe,
        _Tomador,
        _Prestador,
        _Intermediario,
        _DestIbsCbs,
        _Servico,
        //_IbsCbs,
        _Substituida
      ),
      tribResult
    );

  finally
    nfseBase.Free();
    trib.Free();
  end;
end;

end.
