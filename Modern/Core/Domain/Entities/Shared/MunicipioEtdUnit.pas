unit MunicipioEtdUnit;

interface

uses
  EntityBaseUnit,
  TipoComunsUnit,
  EstadoEtdUnit,
  Contnrs;

type
  MunicipioEtd = class(EntityBase)
  private
    FCodigo: Integer;
    FNome: string;
    FEstado: EstadoEtd;
    FEstadoId: Integer;
  public
    constructor Create(
      Codigo: Integer;
      const Nome: string;
      Estado: EstadoEtd
    ); overload;

    constructor Create(
      Codigo: Integer;
      EstadoId: Integer;
      const Nome: string
    ); overload;

    function Clone(): EntityBase; override;

    property Codigo: Integer read FCodigo;
    property Nome: string read FNome;
    property EstadoId: Integer read FEstadoId;
    property Estado: EstadoEtd read FEstado;
  end;

  MunicipiosEtd = class(TObjectList);

implementation

{ MunicipioEtd }

function MunicipioEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := MunicipioEtd.Create(
      FCodigo, FNome, FEstado.Clone()
    );
end;

constructor MunicipioEtd.Create(Codigo: Integer; const Nome: string; Estado: EstadoEtd);
begin
  Create(Codigo, Estado.Codigo, Nome);
  FEstado := Estado;
end;

constructor MunicipioEtd.Create(Codigo, EstadoId: Integer; const Nome: string);
begin
  FCodigo := Codigo;
  FEstadoId := EstadoId;
  FNome := Nome;
end;

end.
