unit SharedRepoContainerUnit;

interface

uses
  IDataBaseConnectionUnit,
  IMunicipiosRepositoryUnit,
  IAnexosRepositoryUnit,
  INcmsRepositoryUnit,
  IItensIbptRepositoryUnit;

type
  SharedRepoContainer = class
  strict private
    procedure CheckIsSetupValid();
  private
    FDataBaseConnection: IDataBaseConnection;
    FMunicipiosRepo: IMunicipiosRepository;
    FAnexosRepo: IAnexosRepository;
    FNcmsRepo: INcmsRepository;
    FItensIbptRepo: IItensIbptRepository;
    function GetMunicipioRepo: IMunicipiosRepository;
    function GetAnexosRepo: IAnexosRepository;
    function GetNcmsRepo: INcmsRepository;
    function GetItensIbptRepo: IItensIbptRepository;
  public
    class procedure ReleaseInstance();
    class function GetInstance(): SharedRepoContainer;

    procedure Setup(const Connection: IDataBaseConnection);

    property MunicipiosRepo: IMunicipiosRepository read GetMunicipioRepo;
    property AnexosRepo: IAnexosRepository read GetAnexosRepo;
    property NcmsRepo: INcmsRepository read GetNcmsRepo;
    property ItensIbptRepo: IItensIbptRepository read GetItensIbptRepo;

  end;

implementation

uses
  SysUtils,
  MunicipiosRepositoryUnit,
  AnexosRepositoryUnit,
  NcmsRepositoryUnit,
  ItensIbptRepositoryUnit;

var
  GSharedRepoContainer: SharedRepoContainer;

{ SharedRepoContainer }

procedure SharedRepoContainer.CheckIsSetupValid;
begin
  if FDataBaseConnection = nil then
    raise Exception.Create('Setup SharedRepoContainer need be called');
end;

function SharedRepoContainer.GetAnexosRepo: IAnexosRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FAnexosRepo) then
    FAnexosRepo := AnexosRepository.Create(FDataBaseConnection);

  Result := FAnexosRepo
end;

class function SharedRepoContainer.GetInstance: SharedRepoContainer;
begin
  if GSharedRepoContainer = nil then
    GSharedRepoContainer := SharedRepoContainer.Create();

  Result := GSharedRepoContainer;
end;

function SharedRepoContainer.GetItensIbptRepo: IItensIbptRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FItensIbptRepo) then
    FItensIbptRepo := ItensIbptRepository.Create(FDataBaseConnection);

  Result := FItensIbptRepo
end;

function SharedRepoContainer.GetMunicipioRepo: IMunicipiosRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FMunicipiosRepo) then
    FMunicipiosRepo := MunicipiosRepository.Create(FDataBaseConnection);

  Result := FMunicipiosRepo;
end;

function SharedRepoContainer.GetNcmsRepo: INcmsRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNcmsRepo) then
    FNcmsRepo := NcmsRepository.Create(FDataBaseConnection);

  Result := FNcmsRepo
end;

class procedure SharedRepoContainer.ReleaseInstance;
begin
  if Assigned(GSharedRepoContainer) then
    FreeAndNil(GSharedRepoContainer);
end;

procedure SharedRepoContainer.Setup(const Connection: IDataBaseConnection);
begin
  if FDataBaseConnection = Connection then
    Exit;

  if FDataBaseConnection <> Connection then
    FDataBaseConnection := nil;

  FDataBaseConnection := Connection;
end;

initialization

finalization
  SharedRepoContainer.ReleaseInstance();

end.
