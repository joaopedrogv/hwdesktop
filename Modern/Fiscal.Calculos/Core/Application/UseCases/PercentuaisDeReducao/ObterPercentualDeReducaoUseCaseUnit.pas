unit ObterPercentualDeReducaoUseCaseUnit;

interface

uses             
  BaseUseCaseUnit,
  PercentualReducaoEtdUnit,
  IPercentualReducaoRepositoryUnit,
  TipoComunsUnit,
  TipoTributoEnumUnit;

type                                   
  (*
  IObterPercentualDeReducaoUseCase = interface
    ['{17863458-5561-4D2C-9391-79E86BFD6D3C}']
    function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): PercentualReducaoEtd;
  end;
  *)
  IObterPercentualDeReducaoUseCase = class(BaseUseCase)
  public
    function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): PercentualReducaoEtd; virtual; abstract;
  end;

  //ObterPercentualDeReducaoUseCase = class(TInterfacedObject, IObterPercentualDeReducaoUseCase)
  ObterPercentualDeReducaoUseCase = class(IObterPercentualDeReducaoUseCase)
  private
    FPercentuaisReducaoRepo: IPercentualReducaoRepository;
  public
    constructor Create(const TratamentoClassRepo: IPercentualReducaoRepository);

    //function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): PercentualReducaoEtd;
    function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): PercentualReducaoEtd; override;
  end;

implementation

{ ObterPercentualDeReducaoUseCase }

constructor ObterPercentualDeReducaoUseCase.Create(
  const TratamentoClassRepo: IPercentualReducaoRepository);
begin
  FPercentuaisReducaoRepo := TratamentoClassRepo;
end;

function ObterPercentualDeReducaoUseCase.Executar(
  const CClassTrib: string;
  TipoTributo: TipoTributoEnum;
  Data: TDate
): PercentualReducaoEtd;
begin
  Result := FPercentuaisReducaoRepo.ObterporCClassTribETributo( CClassTrib, TipoTributo, Data );
end;

end.
