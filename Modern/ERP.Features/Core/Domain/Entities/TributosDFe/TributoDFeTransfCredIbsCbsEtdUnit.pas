unit TributoDFeTransfCredIbsCbsEtdUnit;

interface

uses
  SysUtils;

type
  TributoDFeTransfCredIbsCbsEtd = class
  private
    FId: string;
    FVibs: Double;
    FVcbs: Double;
  public
    constructor Create; overload;
    constructor Create(const AId: string; AVibs: Double; AVcbs: Double); overload;

    function Clone(): TributoDFeTransfCredIbsCbsEtd;
    function IsEqualTo(const Other: TributoDFeTransfCredIbsCbsEtd): Boolean;

    property Id: string read FId write FId;
    property Vibs: Double read FVibs write FVibs;
    property Vcbs: Double read FVcbs write FVcbs;
  end;

implementation

constructor TributoDFeTransfCredIbsCbsEtd.Create;
begin
  // Construtor vazio
end;

function TributoDFeTransfCredIbsCbsEtd.Clone: TributoDFeTransfCredIbsCbsEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeTransfCredIbsCbsEtd.Create(
      FId,
      FVibs,
      FVcbs
    );
end;

constructor TributoDFeTransfCredIbsCbsEtd.Create(const AId: string; AVibs: Double; AVcbs: Double);
begin
  FId := AId;
  FVibs := AVibs;
  FVcbs := AVcbs;
end;

function TributoDFeTransfCredIbsCbsEtd.IsEqualTo(const Other: TributoDFeTransfCredIbsCbsEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.Vibs = Other.Vibs)
      and (Self.Vcbs = Other.Vcbs);
end;

end.

