unit RemoverRegraFiscalIbsCbsUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IRegrasFiscaisIbsCbsRepositoryUnit,
  RegraFiscalIbsCbsEtdUnit,
  CreateEntityUseCaseOutputUnit;

type          
  {$IFDEF INTF_ON}
  IRemoverRegraFiscalIbsCbsUseCase = interface
    ['{31E56300-CFEB-47CD-BEF9-F9D3D19E2BAC}']
    procedure Executar(const Id: string);
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  RemoverRegraFiscalIbsCbsUseCase = class(BaseUseCase, IRemoverRegraFiscalIbsCbsUseCase)
  {$ELSE}
  RemoverRegraFiscalIbsCbsUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FRegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
  public
    constructor Create(const RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository);

    procedure Executar(const Id: string);
  end;

implementation

uses
  Sysutils, EValidacaoNegocioUnit, StatusRegistroEnumUnit;

{ RemoverRegraFiscalIbsCbsUseCase }

constructor RemoverRegraFiscalIbsCbsUseCase.Create(const RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository);
begin
  FRegrasFiscaisIbsCbsRepo := RegrasFiscaisIbsCbsRepo;
end;

procedure RemoverRegraFiscalIbsCbsUseCase.Executar(const Id: string);
var
  itemDb: RegraFiscalIbsCbsEtd;
begin
  itemDb := FRegrasFiscaisIbsCbsRepo.GetById(Id);

  if itemDb = nil then
    raise EValidacaoNegocio.Create('Registro não encontrado');

  if itemDb.Ativo = saLixeira then
    raise EValidacaoNegocio.Create('Registro já se encontra na Lixeira');

  itemDb.Ativo := saLixeira;

  FRegrasFiscaisIbsCbsRepo.Put(itemDb);
end;

end.
