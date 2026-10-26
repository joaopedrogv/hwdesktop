unit ObterPendenciaNFeSefazUseCaseUnit;

interface

uses
  SysUtils, Classes,
  INotasFiscaisRepositoryUnit, NotaFiscalPendenciaSefEtdUnit, NotaFiscalPendenciaSefModelUnit;

type
  IObterPendenciaNFeSefazUseCase = interface
    ['{DFB41ABF-683C-4664-BA56-3AE82A092FA3}']
    function Executar(const NfContingenciaId, EmpresaId: Integer): NotaFiscalPendenciaSefEtd;
  end;

//  IObterPendenciaSefazModelUseCase = interface
//    ['{4D8A37E0-FF4C-4DED-AE0D-27625F373E04}']
//    function Executar(const NfContingenciaId, EmpresaId: Integer): NotaFiscalPendenciaSefModel;
//  end;

  ObterPendenciaNFeSefazUseCaseBase = class(TInterfacedObject)
  private
    FNotasRepo: INotasFiscaisRepository;
  public
    constructor Create(NotasRepo: INotasFiscaisRepository);
  end;

  ObterPendenciaNFeSefazUseCase = class(ObterPendenciaNFeSefazUseCaseBase, IObterPendenciaNFeSefazUseCase)
  public
    function Executar(const NfContingenciaId, EmpresaId: Integer): NotaFiscalPendenciaSefEtd;
  end;

  // Nao usando
  ObterPendenciaSefazModelUseCase = class(ObterPendenciaNFeSefazUseCaseBase)//, IObterPendenciaSefazModelUseCase)
  private
    function Executar(const NfContingenciaId, EmpresaId: Integer): NotaFiscalPendenciaSefModel;
  end;

implementation

{ ObterPendenciaNFeSefazUseCaseBase }

constructor ObterPendenciaNFeSefazUseCaseBase.Create(NotasRepo: INotasFiscaisRepository);
begin
  FNotasRepo := NotasRepo;
end;

{ ObterPendenciaNFeSefazUseCaseBase }

function ObterPendenciaNFeSefazUseCase.Executar(const NfContingenciaId, EmpresaId: Integer): NotaFiscalPendenciaSefEtd;
begin
  Result := FNotasRepo.ObterNotaFiscalPendenciaSef(NfContingenciaId, EmpresaId);
end;

{ ObterPendenciaSefazModelUseCase }

function ObterPendenciaSefazModelUseCase.Executar(const NfContingenciaId,
  EmpresaId: Integer): NotaFiscalPendenciaSefModel;
begin
  Result := FNotasRepo.ObterPendenciaSefaz(NfContingenciaId, EmpresaId);
end;

end.
