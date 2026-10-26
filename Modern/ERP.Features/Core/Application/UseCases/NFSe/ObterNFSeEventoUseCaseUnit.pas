unit ObterNFSeEventoUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  INFSeRepositoryUnit,
  NFSeEventoModelUnit,
  NFSeEventoResumoModelUnit,
  NFSeTypesUnit;

type
  IObterNFSeEventoUseCase = interface
    ['{CE410902-643F-4EBB-BB1A-A26E3C1C78B7}']
    function Executar(const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoModel;
  end;

  IObterNFSeEventoResumoUseCase = interface
    ['{24FB0920-7449-4757-9D12-E1AC750128E9}']
    function Executar(const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoResumoModel;
  end;

  ObterNFSeEventoUseCaseBase = class(TInterfacedObject)
  private
    FNFSeRepo: INFSeRepository;
  public
    constructor Create(NFSeRepo: INFSeRepository);
    function GetNFSeEvento(const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoModel;
    function GetResumoNFSeEvento(const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoResumoModel;
  end;

  ObterNFSeEventoUseCase = class(ObterNFSeEventoUseCaseBase, IObterNFSeEventoUseCase)
  public
    function Executar(const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoModel;
  end;

  ObterNFSeEventoResumoUseCase = class(ObterNFSeEventoUseCaseBase, IObterNFSeEventoResumoUseCase)
  public
    function Executar(const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoResumoModel;
  end;

implementation

{ ObterNFSeEventoUseCaseBase }

constructor ObterNFSeEventoUseCaseBase.Create(NFSeRepo: INFSeRepository);
begin
  FNFSeRepo := NFSeRepo;
end;

function ObterNFSeEventoUseCaseBase.GetNFSeEvento(
  const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum
): NFSeEventoModel;
begin
  Result := FNFSeRepo.GetEventoNFSe(Id, EmpresaId, TipoEvento);
end;

function ObterNFSeEventoUseCaseBase.GetResumoNFSeEvento(
  const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum
): NFSeEventoResumoModel;
begin
  Result := FNFSeRepo.GetResumoEventoNFSe(Id, EmpresaId, TipoEvento);
end;

{ ObterNFSeEventoUseCase }

function ObterNFSeEventoUseCase.Executar(
  const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum
): NFSeEventoModel;
begin
  Result := GetNFSeEvento( Id, EmpresaId, TipoEvento );
end;

{ ObterNFSeEventoResumoUseCase }

function ObterNFSeEventoResumoUseCase.Executar(
  const Id: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum
): NFSeEventoResumoModel;
begin
  Result := GetResumoNFSeEvento( Id, EmpresaId, TipoEvento );
end;

end.

