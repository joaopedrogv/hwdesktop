unit ListarOpIntComTpVendasUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  OpInternaComTpVendaEtdUnit, IOpInternasComTpVendasRepositoryUnit;

type     
  {$IFDEF INTF_ON}
  IListarOpInternasComTpVendasPorTpVendaUseCase = interface
    ['{E64BD40D-F54D-474C-8BE5-19AB59973D33}']
    function Executar(CodTpVenda: Integer; const TipoTpVenda: string): OpInternasComTpVendasEtd;
  end;

  IListarOpInternasComTpVendasPorOpInternaUseCase = interface
    ['{45CC2090-937B-4735-B989-5A44D48AA52E}']
    function Executar(const OpInternaId: string): OpInternasComTpVendasEtd;
  end;

  IListarOpInternasComTpVendasPorVendaUseCase = interface
    ['{D5479C26-27FA-4BDC-95C7-6666D36CCCC3}']
    function Executar(const TipoVenda, TipoSigla: string; EmpresaId: Integer): OpInternasComTpVendasEtd;
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  ListarOpInternasComTpVendasUseCase = class(BaseUseCase, IListarOpInternasComTpVendasPorTpVendaUseCase, IListarOpInternasComTpVendasPorOpInternaUseCase, IListarOpInternasComTpVendasPorVendaUseCase)
  {$ELSE}
  ListarOpInternasComTpVendasUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FOpInternaComTpVendaRepo: IOpInternasComTpVendasRepository;
  public
    constructor Create(const OpInternaComTpVendaRepo: IOpInternasComTpVendasRepository);

    function Executar(CodTpVenda: Integer; const TipoTpVenda: string): OpInternasComTpVendasEtd; overload;
    function Executar(const TipoVenda, TipoSigla: string; EmpresaId: Integer): OpInternasComTpVendasEtd; overload;
    function Executar(const OpInternaId: string): OpInternasComTpVendasEtd; overload;
  end;

implementation

{ ListarOpInternasComTpVendasPermitidasUseCase }

constructor ListarOpInternasComTpVendasUseCase.Create(const OpInternaComTpVendaRepo: IOpInternasComTpVendasRepository);
begin
  FOpInternaComTpVendaRepo := OpInternaComTpVendaRepo;
end;

function ListarOpInternasComTpVendasUseCase.Executar(CodTpVenda: Integer; const TipoTpVenda: string): OpInternasComTpVendasEtd;
begin
  Result := FOpInternaComTpVendaRepo.ListarPorTpVenda( CodTpVenda, TipoTpVenda );
end;

function ListarOpInternasComTpVendasUseCase.Executar(
  const OpInternaId: string
): OpInternasComTpVendasEtd;
begin
  Result := FOpInternaComTpVendaRepo.ListarPorOpInterna( OpInternaId );
end;

function ListarOpInternasComTpVendasUseCase.Executar(const TipoVenda,
  TipoSigla: string; EmpresaId: Integer): OpInternasComTpVendasEtd;
begin
  Result := FOpInternaComTpVendaRepo.ListarPorVenda( TipoVenda, TipoSigla, EmpresaId );
end;

end.
