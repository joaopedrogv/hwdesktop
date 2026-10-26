unit RemoverOperacaoInternaUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IOperacoesInternasRepositoryUnit,
  OperacaoInternaEtdUnit,
  CreateEntityUseCaseOutputUnit;

type   
  {$IFDEF INTF_ON}
  IRemoverOperacaoInternaUseCase = interface
    ['{6BF6744E-7C6E-4C11-A71A-BE445CBDC03B}']
    procedure Executar(const Id: string);
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  RemoverOperacaoInternaUseCase = class(BaseUseCase, IRemoverOperacaoInternaUseCase)
  {$ELSE}
  RemoverOperacaoInternaUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FOperacoesInternasRepo: IOperacoesInternasRepository;
  public
    constructor Create(const OperacoesInternasRepo: IOperacoesInternasRepository);

    procedure Executar(const Id: string);
  end;

implementation

uses
  Sysutils, EValidacaoNegocioUnit, StatusRegistroEnumUnit;

{ RemoverOperacaoInternaUseCase }

constructor RemoverOperacaoInternaUseCase.Create(const OperacoesInternasRepo: IOperacoesInternasRepository);
begin
  FOperacoesInternasRepo := OperacoesInternasRepo;
end;

procedure RemoverOperacaoInternaUseCase.Executar(const Id: string);
var
  itemDb: OperacaoInternaEtd;
begin
  itemDb := FOperacoesInternasRepo.GetById(Id);

  if itemDb = nil then
    raise EValidacaoNegocio.Create('Registro não encontrado');

  if itemDb.Ativo = saLixeira then
    raise EValidacaoNegocio.Create('Registro já se encontra na Lixeira');

  itemDb.Ativo := saLixeira;

  FOperacoesInternasRepo.Put(itemDb);
end;

end.
