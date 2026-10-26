unit ErpFeaturesRepoContainerUnit;

interface

uses
  IDataBaseConnectionUnit,
  IGruposFiscaisRepositoryUnit,
  IEmpresasRepositoryUnit,
  IOperacoesInternasRepositoryUnit,
  IRegrasFiscaisIbsCbsRepositoryUnit,
  IOperacoesFiscaisIbsCbsRepositoryUnit,
  IOpInternasComTpVendasRepositoryUnit,
  ITiposVendasRepositoryUnit,
  ITributosDFeRepositoryUnit,
  IConfiguracoesRepositoryUnit,
  IProdutosRepositoryUnit,
  IClientesRepositoryUnit,
  ITiposServicosRepositoryUnit,
  INFSeRepositoryUnit,
  IPedVendaRepositoryUnit,
  ISessionContextUnit,
  IFormasPagamentoRepositoryUnit,
  IControleCreditosRepositoryUnit,
  IRegrasRedBenefPcRepositoryUnit,
  IInfComplementarDFeRepositoryUnit,
  IAjustesRedBenefPcRepositoryUnit,
  INotasConsumidorRepositoryUnit,
  INotasFiscaisRepositoryUnit, IDFeAlertasRepositoryUnit;

type
  ErpFeaturesRepoContainer = class
  strict private
    procedure CheckIsSetupValid();
  private
    FSession: ISessionContext;
    FDataBaseConnection: IDataBaseConnection;
    FEmpresasRepo: IEmpresasRepository;
    FGruposFiscaisRepo: IGruposFiscaisRepository;
    FOperacoesInternasRepo: IOperacoesInternasRepository;
    FRegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
    FOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
    FOpInternasComTpVendasRepo: IOpInternasComTpVendasRepository;
    FTiposVendasRepo: ITiposVendasRepository;
    FTributosDFeRepo: ITributosDFeRepository;
    FConfiguracoesRepo: IConfiguracoesRepository;
    FProdutosRepo: IProdutosRepository;
    FClientesRepo: IClientesRepository;
    FTiposServicosRepo: ITiposServicosRepository;
    FNFSeRepo: INFSeRepository;
    FPedVendaRepo: IPedVendaRepository;
    FFormasPagamentoRepo: IFormasPagamentoRepository;
    FControleCreditosRepo: IControleCreditosRepository;
    FRegrasRedBenefPcRepo: IRegrasRedBenefPcRepository;
    FInfComplementarDFeRepo: IInfComplementarDFeRepository;
    FAjustesRedBenefPcRepo: IAjustesRedBenefPcRepository;
    FNotasFiscaisRepo: INotasFiscaisRepository;
    FNotasConsumidorRepo: INotasConsumidorRepository;
    FDFeAlertasRepo: IDFeAlertasRepository;

    function GetEmpresasRepo: IEmpresasRepository;
    function GetGruposFiscaisRepo: IGruposFiscaisRepository;
    function GetOperacoesInternasRepo: IOperacoesInternasRepository;
    function GetRegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
    function GetOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
    function GetOpInternasComTpVendasRepo: IOpInternasComTpVendasRepository;
    function GetTiposVendasRepo: ITiposVendasRepository;
    function GetTributosDFeRepo: ITributosDFeRepository;
    function GetConfiguracoesRepo: IConfiguracoesRepository;
    function GetProdutosRepo: IProdutosRepository;
    function GetClientesRepo: IClientesRepository;
    function GetTiposServicosRepo: ITiposServicosRepository;
    function GetNFSeRepo: INFSeRepository;
    function GetPedVendaRepo: IPedVendaRepository;
    function GetFormasPagamentoRepo: IFormasPagamentoRepository;
    function GetControleCreditosRepo: IControleCreditosRepository;
    function GetRegrasRedBenefPcRepo: IRegrasRedBenefPcRepository;
    function GetInfComplementarDFeRepo: IInfComplementarDFeRepository;
    function GetAjustesRedBenefPcRepo: IAjustesRedBenefPcRepository;
    function GetNotasConsumidorRepo: INotasConsumidorRepository;
    function GetNotasFiscaisRepo: INotasFiscaisRepository;
    function GetDFeAlertasRepo: IDFeAlertasRepository;
  public
    destructor Destroy; override;

    class procedure ReleaseInstance();
    class function GetInstance(): ErpFeaturesRepoContainer;

    procedure Setup(Connection: IDataBaseConnection; Session: ISessionContext);

    property EmpresasRepo: IEmpresasRepository read GetEmpresasRepo;
    property GruposFiscaisRepo: IGruposFiscaisRepository read GetGruposFiscaisRepo;
    property OperacoesInternasRepo: IOperacoesInternasRepository read GetOperacoesInternasRepo;
    property RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository read GetRegrasFiscaisIbsCbsRepo;
    property OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository read GetOperacoesFiscaisIbsCbsRepo;
    property OpInternasComTpVendasRepo: IOpInternasComTpVendasRepository read GetOpInternasComTpVendasRepo;
    property TiposVendasRepo: ITiposVendasRepository read GetTiposVendasRepo;
    property TributosDFeRepo: ITributosDFeRepository read GetTributosDFeRepo;
    property ConfiguracoesRepo: IConfiguracoesRepository read GetConfiguracoesRepo;
    property ProdutosRepo: IProdutosRepository read GetProdutosRepo;
    property ClientesRepo: IClientesRepository read GetClientesRepo;
    property TiposServicosRepo: ITiposServicosRepository read GetTiposServicosRepo;
    property NFSeRepo: INFSeRepository read GetNFSeRepo;
    property PedVendaRepo: IPedVendaRepository read GetPedVendaRepo;
    property FormasPagamentoRepo: IFormasPagamentoRepository read GetFormasPagamentoRepo;
    property ControleCreditosRepo: IControleCreditosRepository read GetControleCreditosRepo;
    property RegrasRedBenefPcRepo: IRegrasRedBenefPcRepository read GetRegrasRedBenefPcRepo;
    property InfComplementarDFeRepo: IInfComplementarDFeRepository read GetInfComplementarDFeRepo;
    property AjustesRedBenefPcRepo: IAjustesRedBenefPcRepository read GetAjustesRedBenefPcRepo;
    property NotasFiscaisRepo: INotasFiscaisRepository read GetNotasFiscaisRepo;
    property NotasConsumidorRepo: INotasConsumidorRepository read GetNotasConsumidorRepo;
    property DFeAlertasRepo: IDFeAlertasRepository read GetDFeAlertasRepo;
  end;

implementation

uses
  SysUtils,
  GruposFiscaisRepositoryUnit,
  EmpresasRepositoryUnit,
  OperacoesInternasRepositoryUnit,
  RegrasFiscaisIbsCbsRepositoryUnit,
  OperacoesFiscaisIbsCbsRepositoryUnit,
  OpInternasComTpVendasRepositoryUnit,
  TiposVendasRepositoryUnit,
  TributosDFeRepositoryUnit,
  ConfiguracoesRepositoryUnit,
  ProdutosRepositoryUnit,
  ClientesRepositoryUnit,
  TiposServicosRepositoryUnit,
  NFSeRepositoryUnit,
  PedVendaRepositoryUnit, FormasPagamentoRepositoryUnit, ControleCreditosRepositoryUnit, RegrasRedBenefPcRepositoryUnit,
  AjustesRedBenefPcRepositoryUnit, NotasConsumidorRepositoryUnit, NotasFiscaisRepositoryUnit,
  InfComplementarDFeRepositoryUnit, DFeAlertasRepositoryUnit;

var
  GErpFeaturesRepoContainer: ErpFeaturesRepoContainer;

{ ErpFeaturesRepoContainer }

procedure ErpFeaturesRepoContainer.CheckIsSetupValid;
begin
  if FDataBaseConnection = nil then
    raise Exception.Create('Setup ERPFeaturesRepoContainer need be called');
end;

destructor ErpFeaturesRepoContainer.Destroy;
begin

  FSession := nil;

  FGruposFiscaisRepo.FreeSafe();
  FEmpresasRepo.FreeSafe();
  FOperacoesInternasRepo.FreeSafe();
  FRegrasFiscaisIbsCbsRepo.FreeSafe();
  FOperacoesFiscaisIbsCbsRepo.FreeSafe();
  FOpInternasComTpVendasRepo.FreeSafe();
  FTiposVendasRepo.FreeSafe();
  FTributosDFeRepo.FreeSafe();
  FConfiguracoesRepo.Free();
  FProdutosRepo.FreeSafe();
  FClientesRepo.FreeSafe();
  FTiposServicosRepo.FreeSafe();
  FNFSeRepo.FreeSafe();
  FPedVendaRepo.FreeSafe();
  FFormasPagamentoRepo.FreeSafe();
  FControleCreditosRepo.FreeSafe();
  FRegrasRedBenefPcRepo.FreeSafe();
  FInfComplementarDFeRepo.FreeSafe();
  FAjustesRedBenefPcRepo.FreeSafe();
  FNotasFiscaisRepo.Free();
  FNotasConsumidorRepo.Free();
  FDFeAlertasRepo.Free();

  inherited;
end;

function ErpFeaturesRepoContainer.GetAjustesRedBenefPcRepo: IAjustesRedBenefPcRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FAjustesRedBenefPcRepo) then
    FAjustesRedBenefPcRepo := AjustesRedBenefPcRepository.Create(FDataBaseConnection, FSession);

  Result := FAjustesRedBenefPcRepo;
end;

function ErpFeaturesRepoContainer.GetClientesRepo: IClientesRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FClientesRepo) then
    FClientesRepo := ClientesRepository.Create(FDataBaseConnection, FSession);

  Result := FClientesRepo;
end;

function ErpFeaturesRepoContainer.GetConfiguracoesRepo: IConfiguracoesRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FConfiguracoesRepo) then
    FConfiguracoesRepo := ConfiguracoesRepository.Create(FDataBaseConnection, FSession);

  Result := FConfiguracoesRepo;
end;

function ErpFeaturesRepoContainer.GetControleCreditosRepo: IControleCreditosRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FControleCreditosRepo) then
    FControleCreditosRepo := ControleCreditosRepository.Create(FDataBaseConnection, FSession);

  Result := FControleCreditosRepo;
end;

function ErpFeaturesRepoContainer.GetDFeAlertasRepo: IDFeAlertasRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FDFeAlertasRepo) then
    FDFeAlertasRepo := DFeAlertasRepository.Create(FDataBaseConnection, FSession);

  Result := FDFeAlertasRepo;
end;

function ErpFeaturesRepoContainer.GetEmpresasRepo: IEmpresasRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FEmpresasRepo) then
    FEmpresasRepo := EmpresasRepository.Create(FDataBaseConnection, FSession);

  Result := FEmpresasRepo;
end;

function ErpFeaturesRepoContainer.GetFormasPagamentoRepo: IFormasPagamentoRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FFormasPagamentoRepo) then
    FFormasPagamentoRepo := FormasPagamentoRepository.Create(FDataBaseConnection, FSession);

  Result := FFormasPagamentoRepo;
end;

function ErpFeaturesRepoContainer.GetGruposFiscaisRepo: IGruposFiscaisRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FGruposFiscaisRepo) then
    FGruposFiscaisRepo := GruposFiscaisRepository.Create(FDataBaseConnection, FSession);

  Result := FGruposFiscaisRepo;
end;

function ErpFeaturesRepoContainer.GetInfComplementarDFeRepo: IInfComplementarDFeRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FInfComplementarDFeRepo) then
    FInfComplementarDFeRepo := InfComplementarDFeRepository.Create(FDataBaseConnection, FSession);

  Result := FInfComplementarDFeRepo;
end;

class function ErpFeaturesRepoContainer.GetInstance: ErpFeaturesRepoContainer;
begin
  if GErpFeaturesRepoContainer = nil then
    GErpFeaturesRepoContainer := ErpFeaturesRepoContainer.Create();

  Result := GErpFeaturesRepoContainer;
end;

function ErpFeaturesRepoContainer.GetNFSeRepo: INFSeRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNFSeRepo) then
    FNFSeRepo := NFSeRepository.Create(FDataBaseConnection, FSession);

  Result := FNFSeRepo;
end;

function ErpFeaturesRepoContainer.GetNotasConsumidorRepo: INotasConsumidorRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNotasConsumidorRepo) then
    FNotasConsumidorRepo := NotasConsumidorRepository.Create(FDataBaseConnection, FSession);

  Result := FNotasConsumidorRepo;
end;

function ErpFeaturesRepoContainer.GetNotasFiscaisRepo: INotasFiscaisRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNotasFiscaisRepo) then
    FNotasFiscaisRepo := NotasFiscaisRepository.Create(FDataBaseConnection, FSession);

  Result := FNotasFiscaisRepo;
end;

function ErpFeaturesRepoContainer.GetOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FOperacoesFiscaisIbsCbsRepo) then
    FOperacoesFiscaisIbsCbsRepo := OperacoesFiscaisIbsCbsRepository.Create(FDataBaseConnection, FSession);

  Result := FOperacoesFiscaisIbsCbsRepo;
end;

function ErpFeaturesRepoContainer.GetOperacoesInternasRepo: IOperacoesInternasRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FOperacoesInternasRepo) then
    FOperacoesInternasRepo := OperacoesInternasRepository.Create(FDataBaseConnection, FSession);

  Result := FOperacoesInternasRepo;
end;

function ErpFeaturesRepoContainer.GetOpInternasComTpVendasRepo: IOpInternasComTpVendasRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FOpInternasComTpVendasRepo) then
    FOpInternasComTpVendasRepo := OpInternasComTpVendasRepository.Create(FDataBaseConnection, FSession);

  Result := FOpInternasComTpVendasRepo;
end;

function ErpFeaturesRepoContainer.GetPedVendaRepo: IPedVendaRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FPedVendaRepo) then
    FPedVendaRepo := PedVendaRepository.Create(FDataBaseConnection, FSession);

  Result := FPedVendaRepo;
end;

function ErpFeaturesRepoContainer.GetProdutosRepo: IProdutosRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FProdutosRepo) then
    FProdutosRepo := ProdutosRepository.Create(FDataBaseConnection, FSession);

  Result := FProdutosRepo;
end;

function ErpFeaturesRepoContainer.GetRegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FRegrasFiscaisIbsCbsRepo) then
    FRegrasFiscaisIbsCbsRepo := RegrasFiscaisIbsCbsRepository.Create(FDataBaseConnection, FSession);

  Result := FRegrasFiscaisIbsCbsRepo;
end;

function ErpFeaturesRepoContainer.GetRegrasRedBenefPcRepo: IRegrasRedBenefPcRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FRegrasRedBenefPcRepo) then
    FRegrasRedBenefPcRepo := RegrasRedBenefPcRepository.Create(FDataBaseConnection, FSession);

  Result := FRegrasRedBenefPcRepo;
end;

function ErpFeaturesRepoContainer.GetTiposServicosRepo: ITiposServicosRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FTiposServicosRepo) then
    FTiposServicosRepo := TiposServicosRepository.Create(FDataBaseConnection, FSession);

  Result := FTiposServicosRepo;
end;

function ErpFeaturesRepoContainer.GetTiposVendasRepo: ITiposVendasRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FTiposVendasRepo) then
    FTiposVendasRepo := TiposVendasRepository.Create(FDataBaseConnection, FSession);

  Result := FTiposVendasRepo;
end;

function ErpFeaturesRepoContainer.GetTributosDFeRepo: ITributosDFeRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FTributosDFeRepo) then
    FTributosDFeRepo := TributosDFeRepository.Create(FDataBaseConnection, FSession);

  Result := FTributosDFeRepo;
end;

class procedure ErpFeaturesRepoContainer.ReleaseInstance;
begin
  if Assigned(GErpFeaturesRepoContainer) then
    FreeAndNil(GErpFeaturesRepoContainer);
end;

procedure ErpFeaturesRepoContainer.Setup(Connection: IDataBaseConnection; Session: ISessionContext);
begin
  FDataBaseConnection := Connection;
  FSession := Session;
end;

initialization

finalization
  ErpFeaturesRepoContainer.ReleaseInstance();

end.
