unit ListarInfComplPorTipoPcUseCaseUnit;

interface

uses
  SysUtils, Classes,
  InfComplementarDFeEtdUnit, TipoInfComplementarEnumUnit, IInfComplementarDFeRepositoryUnit;

type
  IListarInfComplPorTipoPcUseCase = interface
    ['{C9F43FDF-7A19-4B8C-BAA7-C3EF035EC6DD}']
    function Executar(const Tipo: string): InfComplementarDFeEtdList; overload;
    function Executar(const Tipo: TipoInfComplementarEnum): InfComplementarDFeEtdList; overload;
  end;

  ListarInfComplPorTipoPcUseCase = class(TInterfacedObject, IListarInfComplPorTipoPcUseCase)
  private
    FInfComplRepo: IInfComplementarDFeRepository;
  public
    constructor Create(
      InfComplRepo: IInfComplementarDFeRepository
    );

    function Executar(const Tipo: string): InfComplementarDFeEtdList; overload;
    function Executar(const Tipo: TipoInfComplementarEnum): InfComplementarDFeEtdList; overload;
  end;

implementation

uses
  EValidacaoNegocioUnit;

{ ListarInfComplPorTipoPcUseCase }

constructor ListarInfComplPorTipoPcUseCase.Create(
  InfComplRepo: IInfComplementarDFeRepository
);
begin
  FInfComplRepo := InfComplRepo;
end;

function ListarInfComplPorTipoPcUseCase.Executar(const Tipo: TipoInfComplementarEnum): InfComplementarDFeEtdList;
begin
  Result := FInfComplRepo.ListarPorTipo( Tipo );
end;

function ListarInfComplPorTipoPcUseCase.Executar(const Tipo: string): InfComplementarDFeEtdList;
var
  eTipo: TipoInfComplementarEnum;
begin
  for eTipo := Low(TipoInfComplementarEnum) to High(TipoInfComplementarEnum) do
    if TipoInfComplementarEnumStr[eTipo] = Tipo then
    begin
      Result := Self.Executar(eTipo);
      Exit;
    end;

  raise EValidacaoNegocio.CreateFmt(
    'Nenhuma informação complementar encontrada com o tipo "%s". Por favor cadastre para continuar',
    [Tipo]
  );
end;

end.
