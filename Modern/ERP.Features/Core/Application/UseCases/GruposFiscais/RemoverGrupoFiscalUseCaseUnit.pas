unit RemoverGrupoFiscalUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IGruposFiscaisRepositoryUnit,
  GrupoFiscalEtdUnit,
  CreateEntityUseCaseOutputUnit;

type      
  {$IFDEF INTF_ON}
  IRemoverGrupoFiscalUseCase = interface
    ['{3F67136A-0B5D-4CD2-AE56-B597CBF07449}']
    procedure Executar(const Id: string);
  end;
  {$ENDIF}
         
  {$IFDEF INTF_ON}
  RemoverGrupoFiscalUseCase = class(BaseUseCase, IRemoverGrupoFiscalUseCase)
  {$ELSE}
  RemoverGrupoFiscalUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FGruposFiscaisRepo: IGruposFiscaisRepository;
  public
    constructor Create(const GruposFiscaisRepo: IGruposFiscaisRepository);

    procedure Executar(const Id: string);
  end;

implementation

uses
  Sysutils, EValidacaoNegocioUnit, StatusRegistroEnumUnit;

{ RemoverGrupoFiscalUseCase }

constructor RemoverGrupoFiscalUseCase.Create(const GruposFiscaisRepo: IGruposFiscaisRepository);
begin
  FGruposFiscaisRepo := GruposFiscaisRepo;
end;

procedure RemoverGrupoFiscalUseCase.Executar(const Id: string);
var
  grupoFiscal: GrupoFiscalEtd;
begin
  grupoFiscal := FGruposFiscaisRepo.GetById(Id);

  if grupoFiscal = nil then
    raise EValidacaoNegocio.Create('Registro não encontrado');

  if grupoFiscal.Ativo = saLixeira then
    raise EValidacaoNegocio.Create('Registro já se encontra na Lixeira');

  grupoFiscal.Ativo := saLixeira;

  FGruposFiscaisRepo.Put(grupoFiscal);
end;

end.
