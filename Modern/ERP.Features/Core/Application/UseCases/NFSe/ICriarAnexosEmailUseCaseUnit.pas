unit ICriarAnexosEmailUseCaseUnit;

interface

uses
  TipoComunsUnit;

type
  ICriarAnexosEmailPorOSUseCase = interface
    ['{BEB732ED-B2BC-4B0D-B350-D7BD49AB6E12}']
    function Executar(NumeroOS: Integer): TArrayString; overload;
  end;

  ICriarAnexosEmailPorNFSeIDsUseCase = interface
    ['{B86A83B0-E982-4C08-BABC-436715EE300C}']
    function Executar(const NFSeIDs: TArrayString; ComPDF: Boolean): TArrayString;
  end;

implementation

end.
