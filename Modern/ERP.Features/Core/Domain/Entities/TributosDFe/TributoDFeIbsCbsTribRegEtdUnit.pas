unit TributoDFeIbsCbsTribRegEtdUnit;

interface

uses
  SysUtils;

type
  TributoDFeIbsCbsTribRegEtd = class
  private
    FId: string;
    FCstreg: string;
    FCclasstribreg: string;
    FPaliqefetregibsuf: Double;
    FVtribregibsuf: Double;
    FPaliqefetregibsmun: Double;
    FVtribregibsmun: Double;
    FPaliqefetregcbs: Double;
    FVtribregcbs: Double;
  public
    constructor Create; overload;
    constructor Create(
      const AId: string;
      const ACstreg: string;
      const ACclasstribreg: string;
      APaliqefetregibsuf: Double;
      AVtribregibsuf: Double;
      APaliqefetregibsmun: Double;
      AVtribregibsmun: Double;
      APaliqefetregcbs: Double;
      AVtribregcbs: Double
    ); overload;

    function Clone(): TributoDFeIbsCbsTribRegEtd;
    function IsEqualTo(const Other: TributoDFeIbsCbsTribRegEtd): Boolean;

    property Id: string read FId write FId;
    property Cstreg: string read FCstreg write FCstreg;
    property CClasstribreg: string read FCclasstribreg write FCclasstribreg;
    property Paliqefetregibsuf: Double read FPaliqefetregibsuf write FPaliqefetregibsuf;
    property Vtribregibsuf: Double read FVtribregibsuf write FVtribregibsuf;
    property Paliqefetregibsmun: Double read FPaliqefetregibsmun write FPaliqefetregibsmun;
    property Vtribregibsmun: Double read FVtribregibsmun write FVtribregibsmun;
    property Paliqefetregcbs: Double read FPaliqefetregcbs write FPaliqefetregcbs;
    property Vtribregcbs: Double read FVtribregcbs write FVtribregcbs;
  end;

implementation

constructor TributoDFeIbsCbsTribRegEtd.Create;
begin
  // Construtor vazio
end;

function TributoDFeIbsCbsTribRegEtd.Clone: TributoDFeIbsCbsTribRegEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeIbsCbsTribRegEtd.Create(
      FId,
      FCstreg,
      FCclasstribreg,
      FPaliqefetregibsuf,
      FVtribregibsuf,
      FPaliqefetregibsmun,
      FVtribregibsmun,
      FPaliqefetregcbs,
      FVtribregcbs
    );
end;

constructor TributoDFeIbsCbsTribRegEtd.Create(const AId: string; const ACstreg: string; const ACclasstribreg: string; APaliqefetregibsuf: Double; AVtribregibsuf: Double; APaliqefetregibsmun: Double; AVtribregibsmun: Double; APaliqefetregcbs: Double; AVtribregcbs: Double);
begin
  FId := AId;
  FCstreg := ACstreg;
  FCclasstribreg := ACclasstribreg;
  FPaliqefetregibsuf := APaliqefetregibsuf;
  FVtribregibsuf := AVtribregibsuf;
  FPaliqefetregibsmun := APaliqefetregibsmun;
  FVtribregibsmun := AVtribregibsmun;
  FPaliqefetregcbs := APaliqefetregcbs;
  FVtribregcbs := AVtribregcbs;
end;

function TributoDFeIbsCbsTribRegEtd.IsEqualTo(const Other: TributoDFeIbsCbsTribRegEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.Cstreg = Other.Cstreg)
      and (Self.CClasstribreg = Other.CClasstribreg)
      and (Self.Paliqefetregibsuf = Other.Paliqefetregibsuf)
      and (Self.Vtribregibsuf = Other.Vtribregibsuf)
      and (Self.Paliqefetregibsmun = Other.Paliqefetregibsmun)
      and (Self.Vtribregibsmun = Other.Vtribregibsmun)
      and (Self.Paliqefetregcbs = Other.Paliqefetregcbs)
      and (Self.Vtribregcbs = Other.Vtribregcbs);
end;

end.
