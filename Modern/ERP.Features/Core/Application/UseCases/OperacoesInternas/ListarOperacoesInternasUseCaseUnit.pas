unit ListarOperacoesInternasUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  OperacaoInternaEtdUnit, IOperacoesInternasRepositoryUnit;

type    
  {$IFDEF INTF_ON}
  IListarAtualeTodasOperacoesInternasUseCase = interface
    ['{DF14C1B9-4E5A-46B8-9D60-4B7E2DDF840E}']
    function Executar(const OperacaoAtualId: string): OperacoesInternasEtd;
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  ListarOperacoesInternasUseCase = class(BaseUseCase, IListarAtualeTodasOperacoesInternasUseCase)
  {$ELSE}
  ListarOperacoesInternasUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FOperacaoInternaRepo: IOperacoesInternasRepository;
  public
    constructor Create(const OperacaoInternaRepo: IOperacoesInternasRepository);

    function Executar(const OperacaoAtualId: string): OperacoesInternasEtd;
  end;

implementation

{ ListarOperacoesInternasPermitidasUseCase }

constructor ListarOperacoesInternasUseCase.Create(const OperacaoInternaRepo: IOperacoesInternasRepository);
begin
  FOperacaoInternaRepo := OperacaoInternaRepo;
end;

function ListarOperacoesInternasUseCase.Executar(const OperacaoAtualId: string): OperacoesInternasEtd;
begin
  Result := FOperacaoInternaRepo.ListCurrentAndActives(OperacaoAtualId);
end;

end.
