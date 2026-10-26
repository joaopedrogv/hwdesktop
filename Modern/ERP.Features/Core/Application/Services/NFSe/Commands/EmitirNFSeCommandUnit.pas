unit EmitirNFSeCommandUnit;

interface

type
  EmitirNFSeCommand = record
  private
    FId: string;
    FEmpresaId: Integer;
    FImprimir: Boolean;
    FGerarPDF: Boolean;
    FSilent: Boolean;
    FEmail: string;
  public
    class function Create(
      const Id: string;
      EmpresaId: Integer;
      Silent: Boolean;
      const Email: string
    ): EmitirNFSeCommand; static;

    property Id: string read FId;
    property EmpresaId: Integer read FEmpresaId;
    property Silent: Boolean read FSilent;
    property Email: string read FEmail;
  end;

implementation

{ EmitirNFSeCommand }

class function EmitirNFSeCommand.Create(
  const Id: string;
  EmpresaId: Integer;
  Silent: Boolean;
  const Email: string
): EmitirNFSeCommand;
begin
  Result.FId := Id;
  Result.FEmpresaId := EmpresaId;
  Result.FSilent := Silent;
  Result.FEmail := Email;
end;

end.
