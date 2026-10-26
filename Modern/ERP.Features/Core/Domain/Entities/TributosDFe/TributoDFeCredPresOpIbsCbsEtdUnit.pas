unit TributoDFeCredPresOpIbsCbsEtdUnit;

interface

uses
  DoubleNullableUnit,
  SysUtils;

type
  TributoDFeCredPresOpIbsCbsEtd = class
  private
    FId: string;
    FVbccredpres: Double;
    FCcredpres: string;
    FIbsPcredpres: DoubleNullable;
    FIbsVcredpres: DoubleNullable;
    FIbsVcredprescondsus: DoubleNullable;
    FCbsPcredpres: DoubleNullable;
    FCbsVcredpres: DoubleNullable;
    FCbsVcredprescondsus: DoubleNullable;
    constructor Create; overload;
  public
    constructor Create(
      const AId: string;
      AVbccredpres: Double;
      const ACcredpres: string;
      const AIbsPcredpres: DoubleNullable;
      const AIbsVcredpres: DoubleNullable;
      const AIbsVcredprescondsus: DoubleNullable;
      const ACbsPcredpres: DoubleNullable;
      const ACbsVcredpres: DoubleNullable;
      const ACbsVcredprescondsus: DoubleNullable
    ); overload;

    function Clone(): TributoDFeCredPresOpIbsCbsEtd;
    function IsEqualTo(const Other: TributoDFeCredPresOpIbsCbsEtd): Boolean;

    property Id: string read FId write FId;
    property Vbccredpres: Double read FVbccredpres write FVbccredpres;
    property Ccredpres: string read FCcredpres write FCcredpres;
    property IbsPcredpres: DoubleNullable read FIbsPcredpres write FIbsPcredpres;
    property IbsVcredpres: DoubleNullable read FIbsVcredpres write FIbsVcredpres;
    property IbsVcredprescondsus: DoubleNullable read FIbsVcredprescondsus write FIbsVcredprescondsus;
    property CbsPcredpres: DoubleNullable read FCbsPcredpres write FCbsPcredpres;
    property CbsVcredpres: DoubleNullable read FCbsVcredpres write FCbsVcredpres;
    property CbsVcredprescondsus: DoubleNullable read FCbsVcredprescondsus write FCbsVcredprescondsus;
  end;

implementation

constructor TributoDFeCredPresOpIbsCbsEtd.Create;
begin
  // Construtor vazio
end;

function TributoDFeCredPresOpIbsCbsEtd.Clone: TributoDFeCredPresOpIbsCbsEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeCredPresOpIbsCbsEtd.Create(
      FId,
      FVbccredpres,
      FCcredpres,
      FIbsPcredpres,
      FIbsVcredpres,
      FIbsVcredprescondsus,
      FCbsPcredpres,
      FCbsVcredpres,
      FCbsVcredprescondsus
    );
end;

constructor TributoDFeCredPresOpIbsCbsEtd.Create(
  const AId: string;
  AVbccredpres: Double;
  const ACcredpres: string;
  const AIbsPcredpres: DoubleNullable;
  const AIbsVcredpres: DoubleNullable;
  const AIbsVcredprescondsus: DoubleNullable;
  const ACbsPcredpres: DoubleNullable;
  const ACbsVcredpres: DoubleNullable;
  const ACbsVcredprescondsus: DoubleNullable
);
begin
  FId := AId;
  FVbccredpres := AVbccredpres;
  FCcredpres := ACcredpres;
  FIbsPcredpres := AIbsPcredpres;
  FIbsVcredpres := AIbsVcredpres;
  FIbsVcredprescondsus := AIbsVcredprescondsus;
  FCbsPcredpres := ACbsPcredpres;
  FCbsVcredpres := ACbsVcredpres;
  FCbsVcredprescondsus := ACbsVcredprescondsus;
end;

function TributoDFeCredPresOpIbsCbsEtd.IsEqualTo(const Other: TributoDFeCredPresOpIbsCbsEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.Vbccredpres = Other.Vbccredpres)
      and (Self.Ccredpres = Other.Ccredpres)
      and Self.IbsPcredpres.IsEqualTo(Other.IbsPcredpres)
      and Self.IbsVcredpres.IsEqualTo(Other.IbsVcredpres)
      and Self.IbsVcredprescondsus.IsEqualTo(Other.IbsVcredprescondsus)
      and Self.CbsPcredpres.IsEqualTo(Other.CbsPcredpres)
      and Self.CbsVcredpres.IsEqualTo(Other.CbsVcredpres)
      and Self.CbsVcredprescondsus.IsEqualTo(Other.CbsVcredprescondsus);
end;

end.
