unit StubEmpresasRepositoryUnit;

interface

uses
  Contnrs,
  IEmpresasRepositoryUnit,
  EmpresaEtdUnit;

type
  TEmpresasRepositoryStub = class(IEmpresasRepository)
  private
    FEmpresas: TObjectList;
    function IndicePorId(AEmpresaId: Integer): Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarPorUsuarioPermitido(const Usuario: string): EmpresasEtd; override;
    function ListarTodas(): EmpresasEtd; override;
    function GetByKey(EmpresaId: Integer): EmpresaEtd; override;

    procedure Adicionar(const AEmpresa: EmpresaEtd);
  end;

implementation

uses
  SysUtils;

constructor TEmpresasRepositoryStub.Create;
begin
  inherited Create(nil);

  FEmpresas := TObjectList.Create(True);
end;

destructor TEmpresasRepositoryStub.Destroy;
begin
  FEmpresas.Free;
  inherited;
end;

function TEmpresasRepositoryStub.IndicePorId(AEmpresaId: Integer): Integer;
var
  Indice: Integer;
begin
  for Indice := 0 to FEmpresas.Count - 1 do
    if EmpresaEtd(FEmpresas[Indice]).Id = AEmpresaId then
      Exit(Indice);

  Result := -1;
end;

function TEmpresasRepositoryStub.ListarPorUsuarioPermitido(
  const Usuario: string): EmpresasEtd;
begin
  Result := EmpresasEtd.Create;
end;

function TEmpresasRepositoryStub.ListarTodas: EmpresasEtd;
begin
  Result := EmpresasEtd.Create;
end;

function TEmpresasRepositoryStub.GetByKey(EmpresaId: Integer): EmpresaEtd;
var
  Indice: Integer;
begin
  Indice := IndicePorId(EmpresaId);

  if Indice < 0 then
    Exit(nil);

  Result := EmpresaEtd(EmpresaEtd(FEmpresas[Indice]).Clone());
end;

procedure TEmpresasRepositoryStub.Adicionar(const AEmpresa: EmpresaEtd);
begin
  FEmpresas.Add(AEmpresa.Clone());
end;

end.
