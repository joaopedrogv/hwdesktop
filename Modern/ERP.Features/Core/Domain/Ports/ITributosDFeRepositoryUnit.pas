unit ITributosDFeRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  TipoComunsUnit,
  TributoDFeContextEtdUnit,
  TributoDFeOrigemEnumUnit;

type
  ITributosDFeRepository = class(BaseRepository)
  public
    procedure Delete(const Ids: TArrayString; Origem: TributoDFeOrigemEnum); virtual; abstract;
    function GetById(const Id: string; Origem: TributoDFeOrigemEnum): TributoDFeContextEtd; virtual; abstract;
    function Post(Input: TributoDFeContextEtd): TributoDFeContextEtd; virtual; abstract;
    function ListarPofNF(NotaFiscalId, EmpresaId: Integer): TributoDFeContextEtdList; overload; virtual; abstract;
    function ListarPofNF(NotaFiscalId, EmpresaId, NItem: Integer): TributoDFeContextEtdList; overload; virtual; abstract;
    function ListarPofNFCe(NFCeId, EmpresaId: Integer): TributoDFeContextEtdList; virtual; abstract;
  end;

implementation

end.
