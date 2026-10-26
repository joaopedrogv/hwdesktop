unit UpdateControleCreditoNumDocumentoCommandUnit;

interface

type
  UpdateControleCreditoNumDocumentoCommand = record
  private
    FControleCreditoId: Integer;
    FEmpresaId: Integer;
    FNumDocumeto: string;
  public
    class function Create(
      AControleCreditoId, AEmpresaId: Integer;
      const ANumDocumeto: string
    ): UpdateControleCreditoNumDocumentoCommand; static;

    property ControleCreditoId: Integer read FControleCreditoId;
    property EmpresaId: Integer read FEmpresaId;
    property NumDocumeto: string read FNumDocumeto;
  end;

implementation

{ UpdateControleCreditoNumDocumentoCommand }

class function UpdateControleCreditoNumDocumentoCommand.Create(AControleCreditoId, AEmpresaId: Integer;
  const ANumDocumeto: string): UpdateControleCreditoNumDocumentoCommand;
begin
  Result.FControleCreditoId := AControleCreditoId;
  Result.FEmpresaId := AEmpresaId;
  Result.FNumDocumeto := ANumDocumeto;
end;

end.
