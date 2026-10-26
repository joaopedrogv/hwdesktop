unit ObterNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  INFSeRepositoryUnit,
  ISessionContextUnit,
  ITributosDFeRepositoryUnit,
  NFSeModelUnit,
  NFSeResumoModelUnit;

type
  IObterNFSeUseCase = interface
    ['{3B000E84-990B-4638-BE73-F1AA66D64E33}']
    function Executar(const Id: string): NFSeModel;
  end;

  IObterNFSeResumoUseCase = interface
    ['{172E2004-A253-45C6-88DE-81694D57B32E}']
    function Executar(const Id: string): NFSeResumoModel;
  end;

  ObterNFSeUseCaseBase = class(TInterfacedObject)
  private
    FSession: ISessionContext;
    FNFSeRepo: INFSeRepository;
    FTributosDFe: ITributosDFeRepository;
  public
    constructor Create(Session: ISessionContext; NFSeRepo: INFSeRepository; TributosDFe: ITributosDFeRepository);
    function GetNFSe(const Id: string): NFSeModel;
    function GetResumoNFSe(const Id: string): NFSeResumoModel;
  end;

  ObterNFSeUseCase = class(ObterNFSeUseCaseBase, IObterNFSeUseCase)
  public
    function Executar(const Id: string): NFSeModel;
  end;

  ObterNFSeResumoUseCase = class(ObterNFSeUseCaseBase, IObterNFSeResumoUseCase)
  public
    function Executar(const Id: string): NFSeResumoModel;
  end;

implementation

uses NFSeEtdUnit, TributoDFeContextEtdUnit, TributoDFeOrigemEnumUnit;

{ ObterNFSeUseCaseBase }

constructor ObterNFSeUseCaseBase.Create(
  Session: ISessionContext; NFSeRepo: INFSeRepository; TributosDFe: ITributosDFeRepository
);
begin
  FSession := Session;
  FNFSeRepo := NFSeRepo;
  FTributosDFe := TributosDFe;
end;

function ObterNFSeUseCaseBase.GetNFSe(const Id: string): NFSeModel;
var
  nf: NFSeEtd;
  trib: TributoDFeContextEtd;
begin
  nf := FNFSeRepo.GetNFSe(Id, FSession.EmpresaId);
  if nf = nil then
  begin
    Result := nil;
    Exit;
  end;

  trib := FTributosDFe.GetById( Id, tdfoNFSe );

  Result := NFSeModel.Create( nf, trib );
end;

function ObterNFSeUseCaseBase.GetResumoNFSe(const Id: string): NFSeResumoModel;
begin
  Result := FNFSeRepo.GetResumoNFSe(Id);
end;

{ ObterNFSeUseCase }

function ObterNFSeUseCase.Executar(const Id: string): NFSeModel;
begin
  Result := GetNFSe( Id );
end;

{ ObterNFSeResumoUseCase }

function ObterNFSeResumoUseCase.Executar(const Id: string): NFSeResumoModel;
begin
  Result := GetResumoNFSe( Id );
end;

end.

