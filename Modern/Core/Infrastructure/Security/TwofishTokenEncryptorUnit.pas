unit TwofishTokenEncryptorUnit;

interface

uses
  ITokenEncryptorUnit;

type
  TwofishTokenEncryptor = class(TInterfacedObject, ITokenEncryptor)
  private
    FSecretKey: string;
  public
    constructor Create(const ASecretKey: string);

    function Encrypt(const AToken: string): string;
  end;

implementation

uses
  SysUtils,
  uTPLb_CryptographicLibrary, uTPLb_Constants, uTPLb_Codec;

{ TwofishTokenDecryptor }

constructor TwofishTokenEncryptor.Create(const ASecretKey: string);
begin
  FSecretKey := ASecretKey;
end;

function TwofishTokenEncryptor.Encrypt(const AToken: string): string;
var
  CryptoLib: TCryptographicLibrary;
  Codec: TCodec;
  encryptedStr: String;
  EncrytpString: string;
begin
  CryptoLib := TCryptographicLibrary.Create(nil);
  Codec := TCodec.Create(nil);
  try
    Codec.CryptoLibrary := CryptoLib;
    Codec.StreamCipherId := BlockCipher_ProgId;
    Codec.BlockCipherId := Twofish_ProgId;
    Codec.ChainModeId := CBC_ProgId;

    Codec.Reset;
    Codec.Password := FSecretKey;
    Codec.EncryptString(AToken, encryptedStr, TEncoding.UTF8);
  finally
    CryptoLib.Free;
    Codec.Free;
  end;

  Result := encryptedStr;
end;

end.
