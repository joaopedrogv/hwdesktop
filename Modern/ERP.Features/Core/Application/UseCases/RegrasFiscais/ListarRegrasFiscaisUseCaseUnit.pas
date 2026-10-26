unit ListarRegrasFiscaisUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  RegraFiscalIbsCbsEtdUnit, IRegrasFiscaisIbsCbsRepositoryUnit;

type                 
  {$IFDEF INTF_ON}
  IListarAtualeTodosRegrasFiscaisUseCase = interface
    ['{2B373A7A-87F8-45A1-A773-3FD3CD2CC8F1}']
    function Executar(const RegraAtualId: string): RegrasFiscaisIbsCbsEtd;
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  ListarRegrasFiscaisUseCase = class(BaseUseCase, IListarAtualeTodosRegrasFiscaisUseCase)
  {$ELSE}
  ListarRegrasFiscaisUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FRegraFiscalRepo: IRegrasFiscaisIbsCbsRepository;
  public
    constructor Create(const RegraFiscalRepo: IRegrasFiscaisIbsCbsRepository);

    function Executar(const RegraAtualId: string): RegrasFiscaisIbsCbsEtd;
  end;

implementation

{ ListarRegrasFiscaisPermitidasUseCase }

constructor ListarRegrasFiscaisUseCase.Create(const RegraFiscalRepo: IRegrasFiscaisIbsCbsRepository);
begin
  FRegraFiscalRepo := RegraFiscalRepo;
end;

function ListarRegrasFiscaisUseCase.Executar(const RegraAtualId: string): RegrasFiscaisIbsCbsEtd;
begin
  Result := FRegraFiscalRepo.ListCurrentAndActives(RegraAtualId);
end;

end.
