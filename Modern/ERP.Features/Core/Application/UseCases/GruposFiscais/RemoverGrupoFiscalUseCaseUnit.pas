unit RemoverGrupoFiscalUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IGruposFiscaisRepositoryUnit,
  IDataBaseConnectionUnit,
  GrupoFiscalEtdUnit,
  CreateEntityUseCaseOutputUnit;

type
  RemoverGrupoFiscalUseCase = class(BaseUseCase)
  private
    FGruposFiscaisRepo: IGruposFiscaisRepository;
    FConnection: IDataBaseConnection;
  public
    constructor Create(AConnection: IDataBaseConnection; AGruposFiscaisRepo: IGruposFiscaisRepository);

    procedure Executar(const Id: string);
  end;

implementation

uses
  Sysutils, EValidacaoNegocioUnit, StatusRegistroEnumUnit, ITransactionUnit;

{ RemoverGrupoFiscalUseCase }

constructor RemoverGrupoFiscalUseCase.Create(AConnection: IDataBaseConnection; AGruposFiscaisRepo: IGruposFiscaisRepository);
begin
  FGruposFiscaisRepo := AGruposFiscaisRepo;
  FConnection := AConnection;
end;

procedure RemoverGrupoFiscalUseCase.Executar(const Id: string);
var
  grupoFiscal: GrupoFiscalEtd;
  transaction: ITransaction;
begin
  grupoFiscal := FGruposFiscaisRepo.GetById(Id);

  if grupoFiscal = nil then
    raise EValidacaoNegocio.Create('Registro não encontrado');

  if grupoFiscal.Ativo = saLixeira then
    raise EValidacaoNegocio.Create('Registro já se encontra na Lixeira');

  grupoFiscal.Ativo := saLixeira;

  // A remocao logica altera somente o status; descricao e vinculos de empresa
  // permanecem no cadastro.
  transaction := FConnection.BeginTransaction();
  try try
    FGruposFiscaisRepo.RemoverLogicamente(grupoFiscal.Id);

    transaction.Commit();
  except
    on E: Exception do
      begin
        transaction.Rollback();
        raise;
      end;
  end;
  finally
    transaction.FreeTransaction();
  end;
end;

end.
