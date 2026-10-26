unit TributoDFeMonofasiaIbsCbsEtdUnit;

interface

uses
  DoubleNullableUnit,
  SysUtils;

type
  TributoDFeMonofasiaIbsCbsEtd = class
  private
    FId: string;
    FQbcmono: DoubleNullable;
    FAdremibs: DoubleNullable;
    FAdremcbs: DoubleNullable;
    FVibsmono: DoubleNullable;
    FVcbsmono: DoubleNullable;
    FQbcmonoreten: DoubleNullable;
    FAdremibsreten: DoubleNullable;
    FVibsmonoreten: DoubleNullable;
    FAdremcbsreten: DoubleNullable;
    FVcbsmonoreten: DoubleNullable;
    FQbcmonoret: DoubleNullable;
    FAdremibsret: DoubleNullable;
    FVibsmonoret: DoubleNullable;
    FAdremcbsret: DoubleNullable;
    FVcbsmonoret: DoubleNullable;
    FPdifibs: DoubleNullable;
    FVibsmonodif: DoubleNullable;
    FPdifcbs: DoubleNullable;
    FVcbsmonodif: DoubleNullable;
    FVtotibsmonoitem: Double;
    FVtotcbsmonoitem: Double;
  public
    constructor Create; overload;
    constructor Create(
      const AId: string;
      const AQbcmono: DoubleNullable;
      const AAdremibs: DoubleNullable;
      const AVibsmono: DoubleNullable;
      const AAdremcbs: DoubleNullable;
      const AVcbsmono: DoubleNullable;
      const AQbcmonoreten: DoubleNullable;
      const AAdremibsreten: DoubleNullable;
      const AVibsmonoreten: DoubleNullable;
      const AAdremcbsreten: DoubleNullable;
      const AVcbsmonoreten: DoubleNullable;
      const AQbcmonoret: DoubleNullable;
      const AAdremibsret: DoubleNullable;
      const AVibsmonoret: DoubleNullable;
      const AAdremcbsret: DoubleNullable;
      const AVcbsmonoret: DoubleNullable;
      const APdifibs: DoubleNullable;
      const AVibsmonodif: DoubleNullable;
      const APdifcbs: DoubleNullable;
      const AVcbsmonodif: DoubleNullable;
      AVtotibsmonoitem: Double;
      AVtotcbsmonoitem: Double
    ); overload;

    function Clone(): TributoDFeMonofasiaIbsCbsEtd;
    function IsEqualTo(const Other: TributoDFeMonofasiaIbsCbsEtd): Boolean;

    property Id: string read FId write FId;
    property Qbcmono: DoubleNullable read FQbcmono write FQbcmono;
    property Adremibs: DoubleNullable read FAdremibs write FAdremibs;
    property Adremcbs: DoubleNullable read FAdremcbs write FAdremcbs;
    property Vibsmono: DoubleNullable read FVibsmono write FVibsmono;
    property Vcbsmono: DoubleNullable read FVcbsmono write FVcbsmono;
    property Qbcmonoreten: DoubleNullable read FQbcmonoreten write FQbcmonoreten;
    property Adremibsreten: DoubleNullable read FAdremibsreten write FAdremibsreten;
    property Vibsmonoreten: DoubleNullable read FVibsmonoreten write FVibsmonoreten;
    property Adremcbsreten: DoubleNullable read FAdremcbsreten write FAdremcbsreten;
    property Vcbsmonoreten: DoubleNullable read FVcbsmonoreten write FVcbsmonoreten;
    property Qbcmonoret: DoubleNullable read FQbcmonoret write FQbcmonoret;
    property Adremibsret: DoubleNullable read FAdremibsret write FAdremibsret;
    property Vibsmonoret: DoubleNullable read FVibsmonoret write FVibsmonoret;
    property Adremcbsret: DoubleNullable read FAdremcbsret write FAdremcbsret;
    property Vcbsmonoret: DoubleNullable read FVcbsmonoret write FVcbsmonoret;
    property Pdifibs: DoubleNullable read FPdifibs write FPdifibs;
    property Vibsmonodif: DoubleNullable read FVibsmonodif write FVibsmonodif;
    property Pdifcbs: DoubleNullable read FPdifcbs write FPdifcbs;
    property Vcbsmonodif: DoubleNullable read FVcbsmonodif write FVcbsmonodif;
    property Vtotibsmonoitem: Double read FVtotibsmonoitem write FVtotibsmonoitem;
    property Vtotcbsmonoitem: Double read FVtotcbsmonoitem write FVtotcbsmonoitem;
  end;

implementation

constructor TributoDFeMonofasiaIbsCbsEtd.Create;
begin
  // Construtor vazio
end;

function TributoDFeMonofasiaIbsCbsEtd.Clone: TributoDFeMonofasiaIbsCbsEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeMonofasiaIbsCbsEtd.Create(
      FId,
      FQbcmono,
      FAdremibs,
      FAdremcbs,
      FVibsmono,
      FVcbsmono,
      FQbcmonoreten,
      FAdremibsreten,
      FVibsmonoreten,
      FAdremcbsreten,
      FVcbsmonoreten,
      FQbcmonoret,
      FAdremibsret,
      FVibsmonoret,
      FAdremcbsret,
      FVcbsmonoret,
      FPdifibs,
      FVibsmonodif,
      FPdifcbs,
      FVcbsmonodif,
      FVtotibsmonoitem,
      FVtotcbsmonoitem
    );
end;

constructor TributoDFeMonofasiaIbsCbsEtd.Create(
  const AId: string;
  const AQbcmono: DoubleNullable;
  const AAdremibs: DoubleNullable;
  const AVibsmono: DoubleNullable;
  const AAdremcbs: DoubleNullable;
  const AVcbsmono: DoubleNullable;
  const AQbcmonoreten: DoubleNullable;
  const AAdremibsreten: DoubleNullable;
  const AVibsmonoreten: DoubleNullable;
  const AAdremcbsreten: DoubleNullable;
  const AVcbsmonoreten: DoubleNullable;
  const AQbcmonoret: DoubleNullable;
  const AAdremibsret: DoubleNullable;
  const AVibsmonoret: DoubleNullable;
  const AAdremcbsret: DoubleNullable;
  const AVcbsmonoret: DoubleNullable;
  const APdifibs: DoubleNullable;
  const AVibsmonodif: DoubleNullable;
  const APdifcbs: DoubleNullable;
  const AVcbsmonodif: DoubleNullable;
  AVtotibsmonoitem: Double;
  AVtotcbsmonoitem: Double
);
begin
  FId := AId;
  FQbcmono := AQbcmono;
  FAdremibs := AAdremibs;
  FVibsmono := AVibsmono;
  FAdremcbs := AAdremcbs;
  FVcbsmono := AVcbsmono;
  FQbcmonoreten := AQbcmonoreten;
  FAdremibsreten := AAdremibsreten;
  FVibsmonoreten := AVibsmonoreten;
  FAdremcbsreten := AAdremcbsreten;
  FVcbsmonoreten := AVcbsmonoreten;
  FQbcmonoret := AQbcmonoret;
  FAdremibsret := AAdremibsret;
  FVibsmonoret := AVibsmonoret;
  FAdremcbsret := AAdremcbsret;
  FVcbsmonoret := AVcbsmonoret;
  FPdifibs := APdifibs;
  FVibsmonodif := AVibsmonodif;
  FPdifcbs := APdifcbs;
  FVcbsmonodif := AVcbsmonodif;
  FVtotibsmonoitem := AVtotibsmonoitem;
  FVtotcbsmonoitem := AVtotcbsmonoitem;
end;

function TributoDFeMonofasiaIbsCbsEtd.IsEqualTo(const Other: TributoDFeMonofasiaIbsCbsEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and Self.Qbcmono.IsEqualTo(Other.Qbcmono)
      and Self.Adremibs.IsEqualTo(Other.Adremibs)
      and Self.Adremcbs.IsEqualTo(Other.Adremcbs)
      and Self.Vibsmono.IsEqualTo(Other.Vibsmono)
      and Self.Vcbsmono.IsEqualTo(Other.Vcbsmono)
      and Self.Qbcmonoreten.IsEqualTo(Other.Qbcmonoreten)
      and Self.Adremibsreten.IsEqualTo(Other.Adremibsreten)
      and Self.Vibsmonoreten.IsEqualTo(Other.Vibsmonoreten)
      and Self.Adremcbsreten.IsEqualTo(Other.Adremcbsreten)
      and Self.Vcbsmonoreten.IsEqualTo(Other.Vcbsmonoreten)
      and Self.Qbcmonoret.IsEqualTo(Other.Qbcmonoret)
      and Self.Adremibsret.IsEqualTo(Other.Adremibsret)
      and Self.Vibsmonoret.IsEqualTo(Other.Vibsmonoret)
      and Self.Adremcbsret.IsEqualTo(Other.Adremcbsret)
      and Self.Vcbsmonoret.IsEqualTo(Other.Vcbsmonoret)
      and Self.Pdifibs.IsEqualTo(Other.Pdifibs)
      and Self.Vibsmonodif.IsEqualTo(Other.Vibsmonodif)
      and Self.Pdifcbs.IsEqualTo(Other.Pdifcbs)
      and Self.Vcbsmonodif.IsEqualTo(Other.Vcbsmonodif)
      and (Self.Vtotibsmonoitem = Other.Vtotibsmonoitem)
      and (Self.Vtotcbsmonoitem = Other.Vtotcbsmonoitem);
end;

end.
