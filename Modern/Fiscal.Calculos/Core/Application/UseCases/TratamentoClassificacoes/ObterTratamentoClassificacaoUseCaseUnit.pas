unit ObterTratamentoClassificacaoUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  TratamentoClassificacaoEtdUnit,
  ITratamentoClassificacaoRepositoryUnit,
  TipoComunsUnit,
  TipoTributoEnumUnit;

type                         
  (*
  IObterTratamentoClassificacaoUseCase = interface
    ['{AD694B57-1EC1-4397-B439-F214DA259F46}']
    function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd;
  end;
  *)

  IObterTratamentoClassificacaoUseCase = class(BaseUseCase)
  public
    function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd; virtual; abstract;
  end;

  //ObterTratamentoClassificacaoUseCase = class(TInterfacedObject, IObterTratamentoClassificacaoUseCase)
  ObterTratamentoClassificacaoUseCase = class(IObterTratamentoClassificacaoUseCase)
  private
    FTratamentoClassificacoesRepo: ITratamentoClassificacaoRepository;
  public
    constructor Create(const TratamentoClassRepo: ITratamentoClassificacaoRepository);

    //function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd;
    function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd; override;
  end;

implementation

{ ObterTratamentoClassificacaoUseCase }

constructor ObterTratamentoClassificacaoUseCase.Create(
  const TratamentoClassRepo: ITratamentoClassificacaoRepository);
begin
  FTratamentoClassificacoesRepo := TratamentoClassRepo;
end;

function ObterTratamentoClassificacaoUseCase.Executar(
  const CClassTrib: string;
  TipoTributo: TipoTributoEnum;
  Data: TDate
): TratamentoClassificacaoEtd;
begin
  Result := FTratamentoClassificacoesRepo.ObterTratamentoClassificacao( CClassTrib, TipoTributo, Data );
end;

end.
