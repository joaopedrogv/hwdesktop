unit EmitirLoteNFSeCommandUnit;

interface

uses
  TipoComunsUnit;

type
  EmitirLoteNFSeCommand = record
  private
    FNFSeIDs: TArrayString;
    FEmpresaId: Integer;
    FSilent: Boolean;
    FEmails: TArrayString;
  public
    class function Create(
      const ANFSeIDs: TArrayString;
      AEmpresaId: Integer;
      ASilent: Boolean;
      const AEmails: TArrayString
    ): EmitirLoteNFSeCommand; static;

    property NFSeIDs: TArrayString read FNFSeIDs;
    property EmpresaId: Integer read FEmpresaId;
    property Silent: Boolean read FSilent;
    property Emails: TArrayString read FEmails;
  end;

implementation

{ EmitirLoteNFSeCommand }

class function EmitirLoteNFSeCommand.Create(
  const ANFSeIDs: TArrayString;
  AEmpresaId: Integer;
  ASilent: Boolean;
  const AEmails: TArrayString
): EmitirLoteNFSeCommand;
begin
  Result.FNFSeIDs := ANFSeIDs;
  Result.FEmpresaId := AEmpresaId;
  Result.FSilent := ASilent;
  Result.FEmails := AEmails;
end;

end.
