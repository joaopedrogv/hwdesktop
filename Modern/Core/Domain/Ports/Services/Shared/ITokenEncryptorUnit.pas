unit ITokenEncryptorUnit;

interface

type
  ITokenEncryptor = interface
    ['{82773F97-0BCA-4758-ACC1-A5C6F870D31C}']
    /// <summary>
    ///   Executa a criptografia de um Token
    /// </summary>
    function Encrypt(const AToken: string): string;
  end;

implementation

end.
