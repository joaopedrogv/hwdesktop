unit ObterQuantidadePendenciasSefazUseCaseUnit;

interface

uses
  ISessionContextUnit, INotasFiscaisRepositoryUnit;

type
  IObterQuantidadePendenciasSefazUseCase = interface
    ['{5BC2E618-BA03-4AF5-A32A-277E005E8B4B}']
    function Executar(): Integer;
  end;

  ObterQuantidadePendenciasSefazUseCase = class(TInterfacedObject, IObterQuantidadePendenciasSefazUseCase)
  private
    FSession: ISessionContext;
    FNotasRepo: INotasFiscaisRepository;
  public
    constructor Create(Session: ISessionContext; NotasRepo: INotasFiscaisRepository);
    function Executar(): Integer;

  end;

implementation

{ ObterQuantidadePendenciasSefazUseCase }

constructor ObterQuantidadePendenciasSefazUseCase.Create(Session: ISessionContext; NotasRepo: INotasFiscaisRepository);
begin
  FSession := Session;
  FNotasRepo := NotasRepo;
end;

function ObterQuantidadePendenciasSefazUseCase.Executar: Integer;
begin
  Result := FNotasRepo.ObterQtdePendenciasSefazNaoResolvidas(FSession.EmpresaId);
end;

end.
