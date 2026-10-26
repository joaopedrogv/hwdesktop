unit TwofishTokenDecryptorUnit;

interface

uses
  ITokenDecryptorUnit;

type
  TwofishTokenDecryptor = class(TInterfacedObject, ITokenDecryptor)
  private
    FSecretKey: string;
  public
    constructor Create(const ASecretKey: string);

    function Decrypt(const AEncryptedToken: string): string;
  end;

implementation

uses
  SysUtils,
  uTPLb_CryptographicLibrary, uTPLb_Constants, uTPLb_Codec;

{ TwofishTokenDecryptor }

constructor TwofishTokenDecryptor.Create(const ASecretKey: string);
begin
  FSecretKey := ASecretKey;
end;

function TwofishTokenDecryptor.Decrypt(const AEncryptedToken: string): string;
var
  CryptoLib: TCryptographicLibrary;
  Codec: TCodec;
  decryptedStr: String;
  DecryptString: string;
begin

  CryptoLib := TCryptographicLibrary.Create(nil);
  Codec := TCodec.Create(nil);
  try
    Codec.CryptoLibrary  := CryptoLib;
    Codec.StreamCipherId := BlockCipher_ProgId;
    Codec.BlockCipherId  := Twofish_ProgId;
    Codec.ChainModeId    := CBC_ProgId;

    Codec.Reset;
    Codec.Password := FSecretKey;
    Codec.DecryptString(decryptedStr, AEncryptedToken, TEncoding.UTF8);
  finally
    CryptoLib.Free;
    Codec.Free;
  end;

  Result := decryptedStr;
end;

end.
