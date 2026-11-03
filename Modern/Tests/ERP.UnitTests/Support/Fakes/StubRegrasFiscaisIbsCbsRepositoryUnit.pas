unit StubRegrasFiscaisIbsCbsRepositoryUnit;

interface

uses
  Classes,
  IRegrasFiscaisIbsCbsRepositoryUnit,
  RegraFiscalIbsCbsEtdUnit;

type
  TRegrasFiscaisIbsCbsRepositoryStub = class(IRegrasFiscaisIbsCbsRepository)
  private
    FRegras: TStringList;
    FUltimoId: string;
    FGetByIdChamadas: Integer;
    procedure UnexpectedCall(const AMethod: string);
  public
    constructor Create;
    destructor Destroy; override;

    function Post(Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd; override;
    function Put(Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd; override;
    function GetById(const Id: string): RegraFiscalIbsCbsEtd; override;
    function ListCurrentAndActives(const CurrentId: string): RegrasFiscaisIbsCbsEtd; override;

    procedure AdicionarRegra(const Regra: RegraFiscalIbsCbsEtd);

    property UltimoId: string read FUltimoId;
    property GetByIdChamadas: Integer read FGetByIdChamadas;
  end;

implementation

uses
  SysUtils;

{ TRegrasFiscaisIbsCbsRepositoryStub }

constructor TRegrasFiscaisIbsCbsRepositoryStub.Create;
begin
  inherited Create(nil);
  FRegras := TStringList.Create;
end;

destructor TRegrasFiscaisIbsCbsRepositoryStub.Destroy;
var
  i: Integer;
begin
  for i := 0 to FRegras.Count - 1 do
    if FRegras.Objects[i] <> nil then
      RegraFiscalIbsCbsEtd(FRegras.Objects[i]).Free;
  FRegras.Free;
  inherited;
end;

procedure TRegrasFiscaisIbsCbsRepositoryStub.UnexpectedCall(const AMethod: string);
begin
  raise Exception.Create('Unexpected call to TRegrasFiscaisIbsCbsRepositoryStub.' + AMethod);
end;

function TRegrasFiscaisIbsCbsRepositoryStub.Post(
  Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd;
begin
  UnexpectedCall('Post');
  Result := nil;
end;

function TRegrasFiscaisIbsCbsRepositoryStub.Put(
  Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd;
begin
  UnexpectedCall('Put');
  Result := nil;
end;

function TRegrasFiscaisIbsCbsRepositoryStub.GetById(
  const Id: string): RegraFiscalIbsCbsEtd;
var
  indice: Integer;
begin
  FUltimoId := Id;
  Inc(FGetByIdChamadas);

  indice := FRegras.IndexOf(Id);
  if indice >= 0 then
    Result := RegraFiscalIbsCbsEtd(FRegras.Objects[indice]).Clone
  else
    Result := nil;
end;

function TRegrasFiscaisIbsCbsRepositoryStub.ListCurrentAndActives(
  const CurrentId: string): RegrasFiscaisIbsCbsEtd;
begin
  UnexpectedCall('ListCurrentAndActives');
  Result := nil;
end;

procedure TRegrasFiscaisIbsCbsRepositoryStub.AdicionarRegra(
  const Regra: RegraFiscalIbsCbsEtd);
begin
  FRegras.AddObject(Regra.Id, Regra);
end;

end.
