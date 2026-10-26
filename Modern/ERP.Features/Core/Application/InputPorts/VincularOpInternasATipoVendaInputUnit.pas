unit VincularOpInternasATipoVendaInputUnit;

interface

uses
  OpInternaTpVendaVinculoModelUnit;

type
  VincularOpInternasATipoVendaInput = record
  private
    FCodTpVenda: Integer;
    FTipoTpVenda: string;
    FOpInternas: OpInternaTpVendaVinculoModelArray;
  public
    class function Create(
      CodTpVenda: Integer;
      const TipoTpVenda: string;
      const OpInternas: OpInternaTpVendaVinculoModelArray
    ): VincularOpInternasATipoVendaInput; static;

    property CodTpVenda: Integer read FCodTpVenda;
    property TipoTpVenda: string read FTipoTpVenda;
    property OpInternas: OpInternaTpVendaVinculoModelArray read FOpInternas;
  end;

implementation

{ VincularOpInternasATipoVendaInput }

class function VincularOpInternasATipoVendaInput.Create(
  CodTpVenda: Integer;
  const TipoTpVenda: string;
  const OpInternas: OpInternaTpVendaVinculoModelArray
): VincularOpInternasATipoVendaInput;
begin
  Result.FCodTpVenda := CodTpVenda;
  Result.FTipoTpVenda := TipoTpVenda;
  Result.FOpInternas := OpInternas;
end;

end.
