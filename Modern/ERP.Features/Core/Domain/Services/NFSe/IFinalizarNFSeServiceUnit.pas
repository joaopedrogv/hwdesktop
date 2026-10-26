unit IFinalizarNFSeServiceUnit;

interface

type
  // Servico que vai selar a NFSe, fazer todos os processamentos relacionados
  IFinalizarNFSeService = interface
    ['{BA97789C-1872-453F-856D-D11D76CD696B}']
    procedure Executar(const NFSeId: string; EmpresaId: Integer);
  end;

implementation

end.
