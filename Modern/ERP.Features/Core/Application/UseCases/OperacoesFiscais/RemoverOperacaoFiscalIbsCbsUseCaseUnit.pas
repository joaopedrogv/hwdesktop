unit RemoverOperacaoFiscalIbsCbsUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IOperacoesFiscaisIbsCbsRepositoryUnit,
  OperacaoFiscalIbsCbsEtdUnit,
  CreateEntityUseCaseOutputUnit;

type                   
  {$IFDEF INTF_ON}
  IRemoverOperacaoFiscalIbsCbsUseCase = interface
    ['{15EB0C55-6C57-4B4B-BB9D-ABC5AE4255EF}']
    procedure Executar(const Id: string);
  end;
  {$ENDIF}
             
  {$IFDEF INTF_ON}                                                                                  
  RemoverOperacaoFiscalIbsCbsUseCase = class(BaseUseCase, IRemoverOperacaoFiscalIbsCbsUseCase)
  {$ELSE}
  RemoverOperacaoFiscalIbsCbsUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
  public
    constructor Create(const OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository);

    procedure Executar(const Id: string);
  end;

implementation

uses
  Sysutils, EValidacaoNegocioUnit, StatusRegistroEnumUnit;

{ RemoverOperacaoFiscalIbsCbsUseCase }

constructor RemoverOperacaoFiscalIbsCbsUseCase.Create(const OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository);
begin
  FOperacoesFiscaisIbsCbsRepo := OperacoesFiscaisIbsCbsRepo;
end;

procedure RemoverOperacaoFiscalIbsCbsUseCase.Executar(const Id: string);
var
  itemDb: OperacaoFiscalIbsCbsEtd;
begin
  itemDb := FOperacoesFiscaisIbsCbsRepo.GetById(Id);

  if itemDb = nil then
    raise EValidacaoNegocio.Create('Registro não encontrado');

  if itemDb.Ativo = saLixeira then
    raise EValidacaoNegocio.Create('Registro já se encontra na Lixeira');

  itemDb.Ativo := saLixeira;

  FOperacoesFiscaisIbsCbsRepo.Put(itemDb);
end;

end.
