unit ITokenDecryptorUnit;

interface

type
  ITokenDecryptor = interface
    ['{25F44F0C-3DB2-4AA8-A79C-5755C74E9FBE}']
    /// <summary>
    ///   Executa a descriptografia de um Token
    /// </summary>
    function Decrypt(const AEncryptedToken: string): string;
  end;

implementation

end.
