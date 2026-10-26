unit TributoDFeIbsCbsCompraGovEtdUnit;

interface

uses
  SysUtils;

type
  TributoDFeIbsCbsCompraGovEtd = class
  private
    FId: string;
    FPaliqibsuf: Double;
    FVtribibsuf: Double;
    FPaliqibsmun: Double;
    FVtribibsmun: Double;
    FPaliqcbs: Double;
    FVtribcbs: Double;
  public
    constructor Create; overload;
    constructor Create(
      const AId: string;
      APaliqibsuf: Double;
      AVtribibsuf: Double;
      APaliqibsmun: Double;
      AVtribibsmun: Double;
      APaliqcbs: Double;
      AVtribcbs: Double
    ); overload;

    function Clone(): TributoDFeIbsCbsCompraGovEtd;
    function IsEqualTo(const Other: TributoDFeIbsCbsCompraGovEtd): Boolean;

    property Id: string read FId write FId;
    property Paliqibsuf: Double read FPaliqibsuf write FPaliqibsuf;
    property Vtribibsuf: Double read FVtribibsuf write FVtribibsuf;
    property Paliqibsmun: Double read FPaliqibsmun write FPaliqibsmun;
    property Vtribibsmun: Double read FVtribibsmun write FVtribibsmun;
    property Paliqcbs: Double read FPaliqcbs write FPaliqcbs;
    property Vtribcbs: Double read FVtribcbs write FVtribcbs;
  end;

implementation

constructor TributoDFeIbsCbsCompraGovEtd.Create;
begin
  // Construtor vazio
end;

function TributoDFeIbsCbsCompraGovEtd.Clone: TributoDFeIbsCbsCompraGovEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeIbsCbsCompraGovEtd.Create(
      FId,
      FPaliqibsuf,
      FVtribibsuf,
      FPaliqibsmun,
      FVtribibsmun,
      FPaliqcbs,
      FVtribcbs
    );
end;

constructor TributoDFeIbsCbsCompraGovEtd.Create(const AId: string; APaliqibsuf: Double; AVtribibsuf: Double; APaliqibsmun: Double; AVtribibsmun: Double; APaliqcbs: Double; AVtribcbs: Double);
begin
  FId := AId;
  FPaliqibsuf := APaliqibsuf;
  FVtribibsuf := AVtribibsuf;
  FPaliqibsmun := APaliqibsmun;
  FVtribibsmun := AVtribibsmun;
  FPaliqcbs := APaliqcbs;
  FVtribcbs := AVtribcbs;
end;

function TributoDFeIbsCbsCompraGovEtd.IsEqualTo(const Other: TributoDFeIbsCbsCompraGovEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.Paliqibsuf = Other.Paliqibsuf)
      and (Self.Vtribibsuf = Other.Vtribibsuf)
      and (Self.Paliqibsmun = Other.Paliqibsmun)
      and (Self.Vtribibsmun = Other.Vtribibsmun)
      and (Self.Paliqcbs = Other.Paliqcbs)
      and (Self.Vtribcbs = Other.Vtribcbs);
end;

end.
