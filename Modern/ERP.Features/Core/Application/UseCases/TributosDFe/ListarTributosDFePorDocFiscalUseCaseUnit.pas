unit ListarTributosDFePorDocFiscalUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  TributoDfeContextEtdUnit, ITributosDFeRepositoryUnit;

type  
  {$IFDEF INTF_ON}
  IListarTributosNFePorIdUseCase = interface
    ['{3428DD9D-3107-40A9-9618-7A63F811CC94}']
    function Executar(NotaFiscalId, EmpresaId: Integer): TributoDFeContextEtdList;
  end;

  IListarTributosNFCePorIdUseCase = interface
    ['{6E752588-A173-42CC-838C-F2F7C3798AF7}']
    function Executar(NFCeId, EmpresaId: Integer): TributoDFeContextEtdList;
  end;

  IListarTributosNFePorItemUseCase = interface
    ['{C51A34B1-BFB3-4C39-9E05-39F0B6080F9F}']
    function Executar(NotaFiscalId, EmpresaId, NItem: Integer): TributoDFeContextEtdList;
  end;
  {$ENDIF}

  ListarTributosDFeBase = class(BaseUseCase)
  private
    FTributosDFeRepo: ITributosDFeRepository;
  public
    constructor Create(const TributosDFeRepo: ITributosDFeRepository);
  end;
           
  {$IFDEF INTF_ON}                                                                                                  
  ListarTributosNFe = class(ListarTributosDFeBase, IListarTributosNFePorIdUseCase, IListarTributosNFePorItemUseCase)
  {$ELSE}
  ListarTributosNFe = class(ListarTributosDFeBase)
  {$ENDIF}
  public
    function Executar(NotaFiscalId, EmpresaId: Integer): TributoDFeContextEtdList; overload;
    function Executar(NotaFiscalId, EmpresaId, NItem: Integer): TributoDFeContextEtdList; overload;
  end;
                                                           
  {$IFDEF INTF_ON}
  ListarTributosNFCe = class(ListarTributosDFeBase, IListarTributosNFCePorIdUseCase)
  {$ELSE}
  ListarTributosNFCe = class(ListarTributosDFeBase)
  {$ENDIF}
  public
    function Executar(NFCeId, EmpresaId: Integer): TributoDFeContextEtdList;
  end;

implementation

{ ListarTributosDFeBase }

constructor ListarTributosDFeBase.Create(const TributosDFeRepo: ITributosDFeRepository);
begin
  FTributosDFeRepo := TributosDFeRepo;
end;

{ ListarTributosNFe }

function ListarTributosNFe.Executar(NotaFiscalId, EmpresaId: Integer): TributoDFeContextEtdList;
begin
  Result := FTributosDFeRepo.ListarPofNF( NotaFiscalId, EmpresaId );
end;

function ListarTributosNFe.Executar(NotaFiscalId, EmpresaId,
  NItem: Integer): TributoDFeContextEtdList;
begin
  Result := FTributosDFeRepo.ListarPofNF( NotaFiscalId, EmpresaId, NItem );
end;

{ ListarTributosNFCe }

function ListarTributosNFCe.Executar(NFCeId, EmpresaId: Integer): TributoDFeContextEtdList;
begin
  Result := FTributosDFeRepo.ListarPofNFCe( NFCeId, EmpresaId );
end;

end.
