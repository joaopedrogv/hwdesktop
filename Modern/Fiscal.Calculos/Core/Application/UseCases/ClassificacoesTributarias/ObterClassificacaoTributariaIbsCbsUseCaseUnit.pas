unit ObterClassificacaoTributariaIbsCbsUseCaseUnit;

interface

uses    
  BaseUseCaseUnit,
  ClassificacaoTributariaEtdUnit,
  IClassificacaoTributariaRepositoryUnit,
  TipoComunsUnit;

type
  (*
  IObterClassificacaoTributariaIbsCbsUseCase = interface
    ['{5346954E-7CB3-4A9D-9EDD-9D9E9459F4AC}']
    function Executar(const CClassTrib: string; Data: TDate): ClassificacaoTributariaEtd;
  end;
  *)
  IObterClassificacaoTributariaIbsCbsUseCase = class(BaseUseCase)
  public
    function Executar(const CClassTrib: string; Data: TDate): ClassificacaoTributariaEtd; virtual; abstract;
  end;

  //ObterClassificacaoTributariaIbsCbsUseCase = class(TInterfacedObject, IObterClassificacaoTributariaIbsCbsUseCase)
  ObterClassificacaoTributariaIbsCbsUseCase = class(IObterClassificacaoTributariaIbsCbsUseCase)
  private
    FClassTribRepo: IClassificacaoTributariaRepository;
  public
    constructor Create(const ClassTribRepo: IClassificacaoTributariaRepository);

    //function Executar(const CClassTrib: string; Data: TDate): ClassificacaoTributariaEtd;
    function Executar(const CClassTrib: string; Data: TDate): ClassificacaoTributariaEtd; override;
  end;

implementation

uses
  SysUtils;

{ ObterClassificacaoTributariaIbsCbsUseCase }

constructor ObterClassificacaoTributariaIbsCbsUseCase.Create(
  const ClassTribRepo: IClassificacaoTributariaRepository);
begin
  FClassTribRepo := ClassTribRepo;
end;

function ObterClassificacaoTributariaIbsCbsUseCase.Executar(const CClassTrib: string; Data: TDate): ClassificacaoTributariaEtd;
begin
  Result := FClassTribRepo.ObterClassificacaoCbsIbs( CClassTrib, Data );
end;

end.
