unit SituacaoTributariaServiceUnit;

interface

uses
  ISituacaoTributariaServiceUnit, TipoComunsUnit, ISituacaoTributariaRepositoryUnit, SituacaoTributariaEtdUnit,
  TipoTributoEnumUnit;

type
  SituacaoTributariaService = class(TInterfacedObject, ISituacaoTributariaService)
  private
     FSituacaoTributariaRepo: ISituacaoTributariaRepository;
  public
    constructor Create(SituacaoTributariaRepo: ISituacaoTributariaRepository);

    function ConsultarSituacaoTributariaPorCodigo(const CST: string; IdTributo: TipoTributoEnum; Data: TDate): SituacaoTributariaEtd;
  end;

implementation

uses
  SysUtils, CurrencyNullableUnit, EValidacaoRTCUnit;

{SituacaoTributariaService}

constructor SituacaoTributariaService.Create(SituacaoTributariaRepo: ISituacaoTributariaRepository);
begin
  FSituacaoTributariaRepo := SituacaoTributariaRepo;
end;

function SituacaoTributariaService.ConsultarSituacaoTributariaPorCodigo(const CST: string; IdTributo: TipoTributoEnum; Data: TDate): SituacaoTributariaEtd;
begin
  Result := FSituacaoTributariaRepo.ConsultarSituacaoTributariaPorCodigo(CST, IdTributo, Data);
end;

end.