unit ObterOperacaoInternaPorIdUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IOperacoesInternasRepositoryUnit,
  OperacaoInternaEtdUnit;

type    
  {$IFDEF INTF_ON}     
  IObterOperacaoInternaPorIdUseCase = interface
    ['{D1FD82C6-47F8-47A4-802A-8D6DE4E0185A}']
    function Executar(const Id: string): OperacaoInternaEtd;
  end;
  {$ENDIF}
      
  {$IFDEF INTF_ON}
  ObterOperacaoInternaPorIdUseCase = class(BaseUseCase, IObterOperacaoInternaPorIdUseCase)
  {$ELSE}
  ObterOperacaoInternaPorIdUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FOperacoesInternasRepo: IOperacoesInternasRepository;
  public
    constructor Create(const OperacoesInternasRepo: IOperacoesInternasRepository);

    function Executar(const Id: string): OperacaoInternaEtd;
  end;

implementation

{ ObterOperacaoInternaPorIdUseCase }

constructor ObterOperacaoInternaPorIdUseCase.Create(const OperacoesInternasRepo: IOperacoesInternasRepository);
begin
  FOperacoesInternasRepo := OperacoesInternasRepo;
end;

function ObterOperacaoInternaPorIdUseCase.Executar(const Id: string): OperacaoInternaEtd;
begin
  Result := FOperacoesInternasRepo.GetById(Id);
end;

end.
