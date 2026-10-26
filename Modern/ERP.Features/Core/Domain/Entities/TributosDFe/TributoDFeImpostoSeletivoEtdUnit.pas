unit TributoDFeImpostoSeletivoEtdUnit;

interface

uses
  DoubleNullableUnit,
  SysUtils;

type
  TributoDFeImpostoSeletivoEtd = class
  private
    FId: string;
    FCstis: string;
    FCclasstribis: string;
    FVbcis: DoubleNullable;
    FPis: DoubleNullable;
    FPisespec: DoubleNullable;
    FUtrib: string;
    FQtrib: DoubleNullable;
    FVis: DoubleNullable;
  public
    constructor Create(
      AId: string;
      const ACstis: string;
      const ACclasstribis: string;
      const AVbcis: DoubleNullable;
      const APis: DoubleNullable;
      const APisespec: DoubleNullable;
      const AUtrib: string;
      const AQtrib: DoubleNullable;
      const AVis: DoubleNullable);

    function Clone(): TributoDFeImpostoSeletivoEtd;
    function IsEqualTo(const Other: TributoDFeImpostoSeletivoEtd): Boolean;

    property Id: string read FId write FId;
    property Cstis: string read FCstis write FCstis;
    property Classtribis: string read FCclasstribis write FCclasstribis;
    property Vbcis: DoubleNullable read FVbcis write FVbcis;
    property Pis: DoubleNullable read FPis write FPis;
    property Pisespec: DoubleNullable read FPisespec write FPisespec;
    property Utrib: string read FUtrib write FUtrib;
    property Qtrib: DoubleNullable read FQtrib write FQtrib;
    property Vis: DoubleNullable read FVis write FVis;
  end;

implementation

function TributoDFeImpostoSeletivoEtd.Clone: TributoDFeImpostoSeletivoEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeImpostoSeletivoEtd.Create(
      FId,
      FCstis,
      FCclasstribis,
      FVbcis,
      FPis,
      FPisespec,
      FUtrib,
      FQtrib,
      FVis
    );
end;

constructor TributoDFeImpostoSeletivoEtd.Create(
  AId: string;
  const ACstis: string;
  const ACclasstribis: string;
  const AVbcis: DoubleNullable;
  const APis: DoubleNullable;
  const APisespec: DoubleNullable;
  const AUtrib: string;
  const AQtrib: DoubleNullable;
  const AVis: DoubleNullable
);
begin
  FId := AId;
  FCstis := ACstis;
  FCclasstribis := ACclasstribis;
  FVbcis := AVbcis;
  FPis := APis;
  FPisespec := APisespec;
  FUtrib := AUtrib;
  FQtrib := AQtrib;
  FVis := AVis;
end;

function TributoDFeImpostoSeletivoEtd.IsEqualTo(const Other: TributoDFeImpostoSeletivoEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.Cstis = Other.Cstis)
      and (Self.Classtribis = Other.Classtribis)
      and Self.Vbcis.IsEqualTo(Other.Vbcis)
      and Self.Pis.IsEqualTo(Other.Pis)
      and Self.Pisespec.IsEqualTo(Other.Pisespec)
      and (Self.Utrib = Other.Utrib)
      and Self.Qtrib.IsEqualTo(Other.Qtrib)
      and Self.Vis.IsEqualTo(Other.Vis);
end;

end.
