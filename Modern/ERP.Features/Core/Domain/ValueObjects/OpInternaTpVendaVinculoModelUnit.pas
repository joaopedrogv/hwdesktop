unit OpInternaTpVendaVinculoModelUnit;

interface

type
  OpInternaTpVendaVinculoModel = record
  private
    FOpInternaId: string;
    FCodTpVenda: Integer;
    FTipoTpVenda: string;
    FPadrao: Boolean;
  public
    class function Create(
      const OpInternaId: string;
      CodTpVenda: Integer;
      const TipoTpVenda: string;
      const Padrao: Boolean
    ): OpInternaTpVendaVinculoModel; static;

    property OpInternaId: string read FOpInternaId;
    property CodTpVenda: Integer read FCodTpVenda;
    property TipoTpVenda: string read FTipoTpVenda;
    property Padrao: Boolean read FPadrao;
  end;

  OpInternaTpVendaVinculoModelArray = array of OpInternaTpVendaVinculoModel;

implementation

{ OpInternaTpVendaVinculoModel }

class function OpInternaTpVendaVinculoModel.Create(
  const OpInternaId: string;
  CodTpVenda: Integer;
  const TipoTpVenda: string;
  const Padrao: Boolean
): OpInternaTpVendaVinculoModel;
begin
  Result.FOpInternaId := OpInternaId;
  Result.FCodTpVenda := CodTpVenda;
  Result.FTipoTpVenda := TipoTpVenda;
  Result.FPadrao := Padrao;
end;

end.
