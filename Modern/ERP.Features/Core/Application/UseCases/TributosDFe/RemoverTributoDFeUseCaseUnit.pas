unit RemoverTributoDFeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  TipoComunsUnit,
  ITributosDFeRepositoryUnit,
  TributoDFeContextEtdUnit,
  TributoDFeOrigemEnumUnit,
  IRemoverTributoDFeUseCaseUnit;

type         
  {$IFDEF INTF_ON}                                                              
  RemoverTributoDFeUseCase = class(BaseUseCase, IRemoverTributoDFeUseCase)
  {$ELSE}
  RemoverTributoDFeUseCase = class(IRemoverTributoDFeUseCase)
  {$ENDIF}
  private
    FTributosDFeRepo: ITributosDFeRepository;
  public
    constructor Create(const TributosDFeRepo: ITributosDFeRepository);

    procedure Executar(const Ids: TArrayString; Origem: TributoDFeOrigemEnum); override;
  end;

implementation

uses
  Sysutils, EValidacaoNegocioUnit, StatusRegistroEnumUnit;

{ RemoverTributoDFeUseCase }

constructor RemoverTributoDFeUseCase.Create(const TributosDFeRepo: ITributosDFeRepository);
begin
  FTributosDFeRepo := TributosDFeRepo;
end;

procedure RemoverTributoDFeUseCase.Executar(
  const Ids: TArrayString;
  Origem: TributoDFeOrigemEnum
);
var
  AIds: TArrayString;
  I: Integer;
begin
  I := Length(Ids);
  if I <= 0 then
    Exit;

  SetLength(AIds, I);
  for I := Low(Ids) to High(Ids) do
    if Trim(Ids[I]) = '' then
    raise EValidacaoNegocio.Create(Format('Id do índice (%d) registro vazio', [I]));
                             
  FTributosDFeRepo.Delete(Ids, Origem);
end;

end.
