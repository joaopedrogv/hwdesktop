unit IControleCreditosRepositoryUnit;

interface

uses
  CacheableRepositoryUnit, ControleCreditoEtdUnit, UpdateControleCreditoNumDocumentoCommandUnit;

type
  IControleCreditosRepository = class(CacheableRepository)
  public
    function GetByKey(ControleCreditoId: Integer): ControleCreditoEtd; virtual; abstract;
    procedure AtualizarNumeroDocumento(const Input: UpdateControleCreditoNumDocumentoCommand); virtual; abstract;
  end;

implementation

end.
