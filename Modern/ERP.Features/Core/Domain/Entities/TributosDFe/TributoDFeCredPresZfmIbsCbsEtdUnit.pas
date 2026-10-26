unit TributoDFeCredPresZfmIbsCbsEtdUnit;

interface

uses
  SysUtils;

type
  TributoDFeCredPresZfmIbsCbsEtd = class
  private
    FId: string;
    FCompetapur: string;
    FTpcredpresibszfm: Integer;
    FVcredpresibszfm: Double;
  public
    constructor Create; overload;
    constructor Create(AId: string; const ACompetapur: string; ATpcredpresibszfm: Integer; AVcredpresibszfm: Double); overload;

    function Clone(): TributoDFeCredPresZfmIbsCbsEtd;
    function IsEqualTo(const Other: TributoDFeCredPresZfmIbsCbsEtd): Boolean;

    property Id: string read FId write FId;
    property Competapur: string read FCompetapur write FCompetapur;
    property Tpcredpresibszfm: Integer read FTpcredpresibszfm write FTpcredpresibszfm;
    property Vcredpresibszfm: Double read FVcredpresibszfm write FVcredpresibszfm;
  end;

implementation

constructor TributoDFeCredPresZfmIbsCbsEtd.Create;
begin
  // Construtor vazio
end;

function TributoDFeCredPresZfmIbsCbsEtd.Clone: TributoDFeCredPresZfmIbsCbsEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeCredPresZfmIbsCbsEtd.Create(
      FId,
      FCompetapur,
      FTpcredpresibszfm,
      FVcredpresibszfm
    );
end;

constructor TributoDFeCredPresZfmIbsCbsEtd.Create(AId: string; const ACompetapur: string; ATpcredpresibszfm: Integer; AVcredpresibszfm: Double);
begin
  FId := AId;
  FCompetapur := ACompetapur;
  FTpcredpresibszfm := ATpcredpresibszfm;
  FVcredpresibszfm := AVcredpresibszfm;
end;

function TributoDFeCredPresZfmIbsCbsEtd.IsEqualTo(const Other: TributoDFeCredPresZfmIbsCbsEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.Competapur = Other.Competapur)
      and (Self.Tpcredpresibszfm = Other.Tpcredpresibszfm)
      and (Self.Vcredpresibszfm = Other.Vcredpresibszfm);
end;

end.
