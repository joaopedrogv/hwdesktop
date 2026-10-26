unit FakeTokenDecryptorUnit;

interface
uses
  ITokenDecryptorUnit;

type
  TFakeTokenDecryptor = class(TInterfacedObject, ITokenDecryptor)
  public
    function Decrypt(const AEncryptedToken: string): string;
  end;

implementation

{ TFakeTokenDecryptor }

function TFakeTokenDecryptor.Decrypt(const AEncryptedToken: string): string;
begin
  Result := AEncryptedToken;
end;

end.
