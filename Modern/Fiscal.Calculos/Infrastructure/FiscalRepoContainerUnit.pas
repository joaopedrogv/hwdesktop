unit FiscalRepoContainerUnit;

interface

uses
  IDataBaseConnectionUnit,
  IMunicipiosRepositoryUnit,
  INcmsRepositoryUnit,
  INbsRepositoryUnit,
  IAliquotaReferenciaRepositoryUnit,
  IAliquotaPadraoRepositoryUnit,
  IClassificacaoTributariaRepositoryUnit,
  ISituacaoTributariaRepositoryUnit,
  IPercentualReducaoRepositoryUnit,
  INcmAplicavelRepositoryUnit,
  INbsAplicavelRepositoryUnit,
  IFundamentacaoClassificacaoRepositoryUnit,
  ITributoSituacaoTributariaRepositoryUnit,
  ITratamentoClassificacaoRepositoryUnit,
  IAliquotaAdValoremProdutoRepositoryUnit,
  IAliquotaAdRemProdutoRepositoryUnit,
  IAliquotaAdValoremServicoRepositoryUnit, ITratamentosTributariosRepositoryUnit,
  IRedutorCompraGovernamentalRepositoryUnit,
  ITransferenciaCBSRepositoryUnit,
  IVersaoBaseDadosRepositoryUnit,
  IIndicadorOperacaoRepositoryUnit;

type
  FiscalRepoContainer = class
  strict private
    procedure CheckIsSetupValid();
  private
    FDataBaseConnection: IDataBaseConnection;
    FNbsRepo: INbsRepository;
    FClassificacaoTributariaRepo: IClassificacaoTributariaRepository;
    FSituacaoTributariaRepo: ISituacaoTributariaRepository;
    FAliquotaAdValoremProdutoRepo: IAliquotaAdValoremProdutoRepository;
    FPercentualReducaoRepo: IPercentualReducaoRepository;
    FAliquotaPadraoRepo: IAliquotaPadraoRepository;
    FAliquotaAdValoremServicoRepo: IAliquotaAdValoremServicoRepository;
    FNbsAplicavelRepo: INbsAplicavelRepository;
    FAliquotaReferenciaRepo: IAliquotaReferenciaRepository;
    FNcmsRepo: INcmsRepository;
    FMunicipioRepo: IMunicipiosRepository;
    FFundamentacaoClassificacaoRepo: IFundamentacaoClassificacaoRepository;
    FAliquotaAdRemProdutoRepo: IAliquotaAdRemProdutoRepository;
    FTributoSituacaoTributariaRepo: ITributoSituacaoTributariaRepository;
    FTratamentoClassificacaoRepo: ITratamentoClassificacaoRepository;
    FNcmAplicavelRepo: INcmAplicavelRepository;
    FTratamentosTributariosRepo: ITratamentosTributariosRepository;
    FRedutorCompraGovernamentalRepo: IRedutorCompraGovernamentalRepository;
    FIndicadorOperacaoRepo: IIndicadorOperacaoRepository;
    FTransferenciaCBSRepo: ITransferenciaCBSRepository;
    FVersaoBaseDadosRepo: IVersaoBaseDadosRepository;

    function GetAliquotaAdRemProdutoRepo: IAliquotaAdRemProdutoRepository;
    function GetAliquotaAdValoremProdutoRepo: IAliquotaAdValoremProdutoRepository;
    function GetAliquotaAdValoremServicoRepo: IAliquotaAdValoremServicoRepository;
    function GetAliquotaPadraoRepo: IAliquotaPadraoRepository;
    function GetAliquotaReferenciaRepo: IAliquotaReferenciaRepository;
    function GetClassificacaoTributariaRepo: IClassificacaoTributariaRepository;
    function GetSituacaoTributariaRepo: ISituacaoTributariaRepository;
    function GetFundamentacaoClassificacaoRepo: IFundamentacaoClassificacaoRepository;
    function GetNbsAplicavelRepo: INbsAplicavelRepository;
    function GetNbsRepo: INbsRepository;
    function GetNcmAplicavelRepo: INcmAplicavelRepository;
    function GetNcmRepo: INcmsRepository;
    function GetPercentualReducaoRepo: IPercentualReducaoRepository;
    function GetTratamentoClassificacaoRepo: ITratamentoClassificacaoRepository;
    function GetTributoSituacaoTributariaRepo: ITributoSituacaoTributariaRepository;
    function GetMunicipioRepo: IMunicipiosRepository;
    function GetTratamentosTributariosRepo: ITratamentosTributariosRepository;
    function GetRedutorCompraGovernamentalRepo: IRedutorCompraGovernamentalRepository;
    function GetIndicadorOperacaoRepo: IIndicadorOperacaoRepository;
    function GetTransferenciaCBSRepo: ITransferenciaCBSRepository;
    function GetVersaoBaseDadosRepo: IVersaoBaseDadosRepository;
  public
    destructor Destroy; override;

    class procedure ReleaseInstance();
    class function GetInstance(): FiscalRepoContainer;

    procedure Setup(const Connection: IDataBaseConnection);

    property MunicipioRepo: IMunicipiosRepository read GetMunicipioRepo;
    property NcmRepo: INcmsRepository read GetNcmRepo;
    property NbsRepo: INbsRepository read GetNbsRepo;
    property AliquotaReferenciaRepo: IAliquotaReferenciaRepository read GetAliquotaReferenciaRepo;
    property AliquotaPadraoRepo: IAliquotaPadraoRepository read GetAliquotaPadraoRepo;
    property ClassificacaoTributariaRepo: IClassificacaoTributariaRepository read GetClassificacaoTributariaRepo;
    property SituacaoTributariaRepo: ISituacaoTributariaRepository read GetSituacaoTributariaRepo;
    property PercentualReducaoRepo: IPercentualReducaoRepository read GetPercentualReducaoRepo;
    property NcmAplicavelRepo: INcmAplicavelRepository read GetNcmAplicavelRepo;
    property NbsAplicavelRepo: INbsAplicavelRepository read GetNbsAplicavelRepo;
    property FundamentacaoClassificacaoRepo: IFundamentacaoClassificacaoRepository read GetFundamentacaoClassificacaoRepo;
    property TributoSituacaoTributariaRepo: ITributoSituacaoTributariaRepository read GetTributoSituacaoTributariaRepo;
    property TratamentoClassificacaoRepo: ITratamentoClassificacaoRepository read GetTratamentoClassificacaoRepo;
    property AliquotaAdValoremProdutoRepo: IAliquotaAdValoremProdutoRepository read GetAliquotaAdValoremProdutoRepo;
    property AliquotaAdRemProdutoRepo: IAliquotaAdRemProdutoRepository read GetAliquotaAdRemProdutoRepo;
    property AliquotaAdValoremServicoRepo: IAliquotaAdValoremServicoRepository read GetAliquotaAdValoremServicoRepo;
    property TratamentosTributariosRepo: ITratamentosTributariosRepository read GetTratamentosTributariosRepo;
    property RedutorCompraGovernamentalRepo: IRedutorCompraGovernamentalRepository read GetRedutorCompraGovernamentalRepo;
    property IndicadorOperacaoRepo: IIndicadorOperacaoRepository read GetIndicadorOperacaoRepo;
    property TransferenciaCBSRepo: ITransferenciaCBSRepository read GetTransferenciaCBSRepo;
    property VersaoBaseDadosRepo: IVersaoBaseDadosRepository read GetVersaoBaseDadosRepo;
  end;

implementation

uses
  SysUtils,
  MunicipiosRepositoryUnit,
  NcmsRepositoryUnit,
  NbsRepositoryUnit,
  ClassificacaoTributariaRepositoryUnit,
  PercentualReducaoRepositoryUnit,
  NcmAplicavelRepositoryUnit,
  NbsAplicavelRepositoryUnit,
  AliquotaReferenciaRepositoryUnit,
  AliquotaPadraoRepositoryUnit,
  FundamentacaoClassificacaoRepositoryUnit,
  TributoSituacaoTributariaRepositoryUnit,
  TratamentoClassificacaoRepositoryUnit,
  AliquotaAdValoremProdutoRepositoryUnit,
  AliquotaAdRemProdutoRepositoryUnit,
  AliquotaAdValoremServicoRepositoryUnit, TratamentosTributariosRepositoryUnit,
  RedutorCompraGovernamentalRepositoryUnit,
  TransferenciaCBSRepositoryUnit,
  IndicadorOperacaoRepositoryUnit, SituacaoTributariaRepositoryUnit, VersaoBaseDadosRepositoryUnit;

var
  GFiscalRepoContainer: FiscalRepoContainer;

{ FiscalRepoContainer }

procedure FiscalRepoContainer.CheckIsSetupValid;
begin
  if FDataBaseConnection = nil then
    raise Exception.Create('Setup FiscalRepoContainer need be called');
end;

destructor FiscalRepoContainer.Destroy;
begin
  FAliquotaAdRemProdutoRepo.FreeSafe();
  FAliquotaAdValoremProdutoRepo.FreeSafe();
  FAliquotaAdValoremServicoRepo.FreeSafe();
  FAliquotaPadraoRepo.FreeSafe();
  FAliquotaReferenciaRepo.FreeSafe();
  FClassificacaoTributariaRepo.FreeSafe();
  FSituacaoTributariaRepo.FreeSafe();
  FFundamentacaoClassificacaoRepo.FreeSafe();
  FMunicipioRepo.FreeSafe();
  FNbsAplicavelRepo.FreeSafe();
  FNbsRepo.FreeSafe();
  FNcmAplicavelRepo.FreeSafe();
  FNcmsRepo.FreeSafe();
  FPercentualReducaoRepo.FreeSafe();
  FTratamentoClassificacaoRepo.FreeSafe();
  FTributoSituacaoTributariaRepo.FreeSafe();
  FTratamentosTributariosRepo.FreeSafe();
  FRedutorCompraGovernamentalRepo.FreeSafe();
  FIndicadorOperacaoRepo.FreeSafe();
  FTransferenciaCBSRepo.FreeSafe();
  FVersaoBaseDadosRepo.FreeSafe();

  inherited;
end;

function FiscalRepoContainer.GetAliquotaAdRemProdutoRepo: IAliquotaAdRemProdutoRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FAliquotaAdRemProdutoRepo) then
    FAliquotaAdRemProdutoRepo := AliquotaAdRemProdutoRepository.Create(FDataBaseConnection);

  Result := FAliquotaAdRemProdutoRepo;
end;

function FiscalRepoContainer.GetAliquotaAdValoremProdutoRepo: IAliquotaAdValoremProdutoRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FAliquotaAdValoremProdutoRepo) then
    FAliquotaAdValoremProdutoRepo := AliquotaAdValoremProdutoRepository.Create(FDataBaseConnection);

  Result := FAliquotaAdValoremProdutoRepo;
end;

function FiscalRepoContainer.GetAliquotaAdValoremServicoRepo: IAliquotaAdValoremServicoRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FAliquotaAdValoremServicoRepo) then
    FAliquotaAdValoremServicoRepo := AliquotaAdValoremServicoRepository.Create(FDataBaseConnection);

  Result := FAliquotaAdValoremServicoRepo;
end;

function FiscalRepoContainer.GetAliquotaPadraoRepo: IAliquotaPadraoRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FAliquotaPadraoRepo) then
    FAliquotaPadraoRepo := AliquotaPadraoRepository.Create(FDataBaseConnection);

  Result := FAliquotaPadraoRepo;
end;

function FiscalRepoContainer.GetAliquotaReferenciaRepo: IAliquotaReferenciaRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FAliquotaReferenciaRepo) then
    FAliquotaReferenciaRepo := AliquotaReferenciaRepository.Create(FDataBaseConnection);

  Result := FAliquotaReferenciaRepo;
end;

function FiscalRepoContainer.GetClassificacaoTributariaRepo: IClassificacaoTributariaRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FClassificacaoTributariaRepo) then
    FClassificacaoTributariaRepo := ClassificacaoTributariaRepository.Create(FDataBaseConnection);

  Result := FClassificacaoTributariaRepo;
end;

function FiscalRepoContainer.GetFundamentacaoClassificacaoRepo: IFundamentacaoClassificacaoRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FFundamentacaoClassificacaoRepo) then
    FFundamentacaoClassificacaoRepo := FundamentacaoClassificacaoRepository.Create(FDataBaseConnection);

  Result := FFundamentacaoClassificacaoRepo;
end;

class function FiscalRepoContainer.GetInstance: FiscalRepoContainer;
begin
  if GFiscalRepoContainer = nil then
    GFiscalRepoContainer := FiscalRepoContainer.Create();

  Result := GFiscalRepoContainer;
end;

function FiscalRepoContainer.GetMunicipioRepo: IMunicipiosRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FMunicipioRepo) then
    FMunicipioRepo := MunicipiosRepository.Create(FDataBaseConnection);

  Result := FMunicipioRepo;
end;

function FiscalRepoContainer.GetNbsAplicavelRepo: INbsAplicavelRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNbsAplicavelRepo) then
    FNbsAplicavelRepo := NbsAplicavelRepository.Create(FDataBaseConnection);

  Result := FNbsAplicavelRepo;
end;

function FiscalRepoContainer.GetNbsRepo: INbsRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNbsRepo) then
    FNbsRepo := NbsRepository.Create(FDataBaseConnection);

  Result := FNbsRepo;
end;

function FiscalRepoContainer.GetNcmAplicavelRepo: INcmAplicavelRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNcmAplicavelRepo) then
    FNcmAplicavelRepo := NcmAplicavelRepository.Create(FDataBaseConnection);

  Result := FNcmAplicavelRepo;
end;

function FiscalRepoContainer.GetNcmRepo: INcmsRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNcmsRepo) then
    FNcmsRepo := NcmsRepository.Create(FDataBaseConnection);

  Result := FNcmsRepo;
end;

function FiscalRepoContainer.GetPercentualReducaoRepo: IPercentualReducaoRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FPercentualReducaoRepo) then
    FPercentualReducaoRepo := PercentualReducaoRepository.Create(FDataBaseConnection);

  Result := FPercentualReducaoRepo;
end;

function FiscalRepoContainer.GetTratamentoClassificacaoRepo: ITratamentoClassificacaoRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FTratamentoClassificacaoRepo) then
    FTratamentoClassificacaoRepo := TratamentoClassificacaoRepository.Create(FDataBaseConnection);

  Result := FTratamentoClassificacaoRepo;
end;

function FiscalRepoContainer.GetTratamentosTributariosRepo: ITratamentosTributariosRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FTratamentosTributariosRepo) then
    FTratamentosTributariosRepo := TratamentosTributariosRepository.Create(FDataBaseConnection);

  Result := FTratamentosTributariosRepo;
end;

function FiscalRepoContainer.GetRedutorCompraGovernamentalRepo: IRedutorCompraGovernamentalRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FRedutorCompraGovernamentalRepo) then
    FRedutorCompraGovernamentalRepo := RedutorCompraGovernamentalRepository.Create(FDataBaseConnection);

  Result := FRedutorCompraGovernamentalRepo;
end;

function FiscalRepoContainer.GetSituacaoTributariaRepo: ISituacaoTributariaRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FSituacaoTributariaRepo) then
    FSituacaoTributariaRepo := SituacaoTributariaRepository.Create(FDataBaseConnection);

  Result := FSituacaoTributariaRepo;
end;

function FiscalRepoContainer.GetIndicadorOperacaoRepo: IIndicadorOperacaoRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FIndicadorOperacaoRepo) then
    FIndicadorOperacaoRepo := IndicadorOperacaoRepository.Create(FDataBaseConnection);

  Result := FIndicadorOperacaoRepo;
end;

function FiscalRepoContainer.GetTransferenciaCBSRepo: ITransferenciaCBSRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FTransferenciaCBSRepo) then
    FTransferenciaCBSRepo := TransferenciaCBSRepository.Create(FDataBaseConnection);

  Result := FTransferenciaCBSRepo;
end;

function FiscalRepoContainer.GetTributoSituacaoTributariaRepo: ITributoSituacaoTributariaRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FTributoSituacaoTributariaRepo) then
    FTributoSituacaoTributariaRepo := TributoSituacaoTributariaRepository.Create(FDataBaseConnection);

  Result := FTributoSituacaoTributariaRepo;
end;

function FiscalRepoContainer.GetVersaoBaseDadosRepo: IVersaoBaseDadosRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FVersaoBaseDadosRepo) then
    FVersaoBaseDadosRepo := VersaoBaseDadosRepository.Create(FDataBaseConnection);

  Result := FVersaoBaseDadosRepo;
end;

class procedure FiscalRepoContainer.ReleaseInstance;
begin
  if Assigned(GFiscalRepoContainer) then
    FreeAndNil(GFiscalRepoContainer);  
end;

procedure FiscalRepoContainer.Setup(const Connection: IDataBaseConnection);
begin
  FDataBaseConnection := Connection;
end;

initialization

finalization
  FiscalRepoContainer.ReleaseInstance();

end.
