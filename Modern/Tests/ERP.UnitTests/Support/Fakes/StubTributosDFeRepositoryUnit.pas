unit StubTributosDFeRepositoryUnit;

interface

uses
  ITributosDFeRepositoryUnit,
  TipoComunsUnit,
  TributoDFeContextEtdUnit,
  TributoDFeOrigemEnumUnit;

type
  TTributosDFeRepositoryStub = class(ITributosDFeRepository)
  private
    FTributoToReturn: TributoDFeContextEtd;
    FGetByIdCalled: Boolean;
    FLastId: string;
    FLastOrigem: TributoDFeOrigemEnum;
    procedure UnexpectedCall(const AMethod: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Delete(const Ids: TArrayString; Origem: TributoDFeOrigemEnum); override;
    function GetById(const Id: string; Origem: TributoDFeOrigemEnum): TributoDFeContextEtd; override;
    function Post(Input: TributoDFeContextEtd): TributoDFeContextEtd; override;
    function ListarPofNF(NotaFiscalId, EmpresaId: Integer): TributoDFeContextEtdList; overload; override;
    function ListarPofNF(NotaFiscalId, EmpresaId, NItem: Integer): TributoDFeContextEtdList; overload; override;
    function ListarPofNFCe(NFCeId, EmpresaId: Integer): TributoDFeContextEtdList; override;

    property TributoToReturn: TributoDFeContextEtd read FTributoToReturn write FTributoToReturn;
    property GetByIdCalled: Boolean read FGetByIdCalled;
    property LastId: string read FLastId;
    property LastOrigem: TributoDFeOrigemEnum read FLastOrigem;
  end;

implementation

uses
  SysUtils;

constructor TTributosDFeRepositoryStub.Create;
begin
  inherited Create(nil);
end;

destructor TTributosDFeRepositoryStub.Destroy;
begin
  FTributoToReturn.Free;
  inherited;
end;

procedure TTributosDFeRepositoryStub.UnexpectedCall(const AMethod: string);
begin
  raise Exception.Create('Unexpected call to TTributosDFeRepositoryStub.' + AMethod);
end;

procedure TTributosDFeRepositoryStub.Delete(const Ids: TArrayString; Origem: TributoDFeOrigemEnum);
begin
  UnexpectedCall('Delete');
end;
function TTributosDFeRepositoryStub.GetById(const Id: string; Origem: TributoDFeOrigemEnum): TributoDFeContextEtd;
begin
  FGetByIdCalled := True;
  FLastId := Id;
  FLastOrigem := Origem;
  Result := FTributoToReturn;
  FTributoToReturn := nil;
end;
function TTributosDFeRepositoryStub.Post(Input: TributoDFeContextEtd): TributoDFeContextEtd;
begin
  UnexpectedCall('Post');
end;
function TTributosDFeRepositoryStub.ListarPofNF(NotaFiscalId, EmpresaId: Integer): TributoDFeContextEtdList;
begin
  UnexpectedCall('ListarPofNF');
end;
function TTributosDFeRepositoryStub.ListarPofNF(NotaFiscalId, EmpresaId, NItem: Integer): TributoDFeContextEtdList;
begin
  UnexpectedCall('ListarPofNF');
end;
function TTributosDFeRepositoryStub.ListarPofNFCe(NFCeId, EmpresaId: Integer): TributoDFeContextEtdList;
begin
  UnexpectedCall('ListarPofNFCe');
end;

end.
