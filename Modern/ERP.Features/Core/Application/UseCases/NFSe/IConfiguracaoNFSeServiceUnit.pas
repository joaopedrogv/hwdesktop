unit IConfiguracaoNFSeServiceUnit;

interface

uses
  ConfiguracaoNFSeModelUnit;

type
  IConfiguracaoNFSeService = interface
    ['{32837C4C-07FC-4CC8-8DDC-F6344A04E640}']
    function Executar( EmpresaId: Integer ): ConfiguracaoNFSeModel;
    function ObterSerieDPS( EmpresaId: Integer ): string;
  end;

implementation

end.
