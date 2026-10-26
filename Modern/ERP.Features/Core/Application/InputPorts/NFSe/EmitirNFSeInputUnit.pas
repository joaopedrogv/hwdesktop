unit EmitirNFSeInputUnit;

interface

uses TipoComunsUnit;

type
  EmitirNFSeInput = record
  private
    FId: string;
    FEmpresaId: Integer;
    FSilent: Boolean;
  public
    class function Create(
      const Id: string;
      EmpresaId: Integer;
      Silent: Boolean
    ): EmitirNFSeInput; static;

    property Id: string read FId;
    property EmpresaId: Integer read FEmpresaId;
    property Silent: Boolean read FSilent;
  end;

  EmitirLoteNFSeInput = record
  private
    FNFSeIDs: TArrayString;
    FEmpresaId: Integer;
    FSilent: Boolean;
    FImprimir: Boolean;
    FEmails: TArrayString;
  public
    class function Create(
      const ANFSeIDs: TArrayString;
      AEmpresaId: Integer;
      ASilent: Boolean;
      const AEmails: TArrayString
    ): EmitirLoteNFSeInput; static;

    property NFSeIDs: TArrayString read FNFSeIDs;
    property EmpresaId: Integer read FEmpresaId;
    property Silent: Boolean read FSilent;
    property Emails: TArrayString read FEmails;
  end;

implementation

{ EmitirNFSeInput }

class function EmitirNFSeInput.Create(
  const Id: string;
  EmpresaId: Integer;
  Silent: Boolean
): EmitirNFSeInput;
begin
  Result.FId := Id;
  Result.FEmpresaId := EmpresaId;
  Result.FSilent := Silent;
end;

{ EmitirLoteNFSeInput }

class function EmitirLoteNFSeInput.Create(
  const ANFSeIDs: TArrayString; AEmpresaId: Integer;
  ASilent: Boolean;
  const AEmails: TArrayString
): EmitirLoteNFSeInput;
begin
  Result.FNFSeIDs := ANFSeIDs;
  Result.FEmpresaId := AEmpresaId;
  Result.FSilent := ASilent;
  Result.FEmails := AEmails;
end;

end.