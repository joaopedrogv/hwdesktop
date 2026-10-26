unit TributoDFeAjusteCompetIbsCbsEtdUnit;

interface

uses
  SysUtils;

type
  TributoDFeAjusteCompetIbsCbsEtd = class
  private
    FId: string;
    FCompetapur: string;
    FVibs: Double;
    FVcbs: Double;
  public
    constructor Create; overload;
    constructor Create(AId: string; const ACompetapur: string; AVibs: Double; AVcbs: Double); overload;

    function Clone(): TributoDFeAjusteCompetIbsCbsEtd;
    function IsEqualTo(const Other: TributoDFeAjusteCompetIbsCbsEtd): Boolean;

    property Id: string read FId write FId;
    property Competapur: string read FCompetapur write FCompetapur;
    property Vibs: Double read FVibs write FVibs;
    property Vcbs: Double read FVcbs write FVcbs;
  end;

implementation

constructor TributoDFeAjusteCompetIbsCbsEtd.Create;
begin
  // Construtor vazio
end;

function TributoDFeAjusteCompetIbsCbsEtd.Clone: TributoDFeAjusteCompetIbsCbsEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeAjusteCompetIbsCbsEtd.Create(
      FId,
      FCompetapur,
      FVibs,
      FVcbs
    );
end;

constructor TributoDFeAjusteCompetIbsCbsEtd.Create(AId: string; const ACompetapur: string; AVibs: Double; AVcbs: Double);
begin
  FId := AId;
  FCompetapur := ACompetapur;
  FVibs := AVibs;
  FVcbs := AVcbs;
end;

function TributoDFeAjusteCompetIbsCbsEtd.IsEqualTo(const Other: TributoDFeAjusteCompetIbsCbsEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.Competapur = Other.Competapur)
      and (Self.Vibs = Other.Vibs)
      and (Self.Vcbs = Other.Vcbs);
end;

end.
