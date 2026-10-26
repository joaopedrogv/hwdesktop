unit ObterNcmUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  INcmsRepositoryUnit,
  TipoComunsUnit,
  NcmEtdUnit;

type
  IObterNcmUseCase = interface
    ['{9427C9DE-1E8C-4255-8432-3E75218B5782}']
    function Executar(const Ncm: string; Data: TDate): NcmEtd;
  end;

  IObterNcmMaisRecenteUseCase = interface
    ['{42A1D974-3BC5-45FF-BEDF-AC656AE36F8D}']
    function Executar(const Ncm: string): NcmEtd;
  end;

  ObterNcmUseCase = class(TInterfacedBaseUseCase, IObterNcmUseCase, IObterNcmMaisRecenteUseCase)
  protected
    FNcmRepo: INcmsRepository;
  public
    constructor Create( const NcmRepo: INcmsRepository );
    function Executar(const Ncm: string; Data: TDate): NcmEtd; overload;
    function Executar(const Ncm: string): NcmEtd; overload;
  end;

implementation

uses
  SysUtils;

{ ObterNcmUseCase }

constructor ObterNcmUseCase.Create(const NcmRepo: INcmsRepository);
begin
  FNcmRepo := NcmRepo;
end;

function ObterNcmUseCase.Executar(const Ncm: string; Data: TDate): NcmEtd;
begin
  Result := FNcmRepo.ObterNcm( Ncm, Data );
end;

function ObterNcmUseCase.Executar(const Ncm: string): NcmEtd;
begin
  Result := FNcmRepo.ObterNcmMaisRecente( Ncm );
end;

end.
