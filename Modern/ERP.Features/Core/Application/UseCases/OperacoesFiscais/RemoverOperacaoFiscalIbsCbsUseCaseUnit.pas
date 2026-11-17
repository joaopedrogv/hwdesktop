unit RemoverOperacaoFiscalIbsCbsUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
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
    FConnection: IDataBaseConnection;
    FOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
  public
    constructor Create(AConnection: IDataBaseConnection; AOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository);

    procedure Executar(const Id: string);
  end;

implementation

uses
  Sysutils, EValidacaoNegocioUnit, StatusRegistroEnumUnit, ITransactionUnit;

{ RemoverOperacaoFiscalIbsCbsUseCase }

constructor RemoverOperacaoFiscalIbsCbsUseCase.Create(AConnection: IDataBaseConnection; AOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository);
begin
  FConnection := AConnection;
  FOperacoesFiscaisIbsCbsRepo := AOperacoesFiscaisIbsCbsRepo;
end;

procedure RemoverOperacaoFiscalIbsCbsUseCase.Executar(const Id: string);
var
  itemDb: OperacaoFiscalIbsCbsEtd;
  removido: OperacaoFiscalIbsCbsEtd;
  transacao: ITransaction;
begin
  itemDb := nil;
  removido := nil;

  // A transacao cobre a leitura previa e a gravacao: a releitura final do
  // repositorio nao pode observar um estado parcial da remocao logica.
  transacao := FConnection.BeginTransaction();
  try
    try
      itemDb := FOperacoesFiscaisIbsCbsRepo.GetById(Id);

      if itemDb = nil then
        raise EValidacaoNegocio.Create('Registro não encontrado');

      if itemDb.Ativo = saLixeira then
        raise EValidacaoNegocio.Create('Registro já se encontra na Lixeira');

      itemDb.Ativo := saLixeira;

      removido := FOperacoesFiscaisIbsCbsRepo.Put(itemDb);

      transacao.Commit();
    except
      on E: Exception do
      begin
        transacao.Rollback();
        raise;
      end;
    end;
  finally
    // O Put devolve uma entidade propria; comparar os ponteiros evita
    // liberacao dupla caso o retorno seja o proprio itemDb.
    if removido <> itemDb then
      removido.Free;
    itemDb.Free;
    transacao.FreeTransaction();
  end;
end;

end.
