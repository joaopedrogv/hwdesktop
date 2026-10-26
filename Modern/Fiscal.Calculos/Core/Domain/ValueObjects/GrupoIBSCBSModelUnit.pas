unit GrupoIBSCBSModelUnit;

interface

uses
  TipoComunsUnit,
  IBSUFModelUnit,
  IBSMunModelUnit,
  CBSModelUnit,
  TributacaoRegularModelUnit,
  TributacaoCompraGovernamentalModelUnit,
  CurrencyNullableUnit;

type
  GrupoIBSCBSModel = class
  private
    FVBC: CurrencyNullable;
    FGIBSUF: IBSUFModel;
    FGIBSMun: IBSMunModel;
    FVIBS: Currency;
    FGCBS: CBSModel;
    FGTribRegular: TributacaoRegularModel;
    FGTribCompraGov: TributacaoCompraGovernamentalModel;

    function GetVBC: CurrencyNullable;
    function GetGIBSUF: IBSUFModel;
    function GetGIBSMun: IBSMunModel;
    function GetGCBS: CBSModel;
    function GetGTribRegular: TributacaoRegularModel;
    function GetGTribCompraGov: TributacaoCompraGovernamentalModel;
    function GetTributacaoRegular: TributacaoRegularModel;
    function GetValorBaseCalculoIBSCBS: Currency;
  public
    constructor Create(
      VBC: CurrencyNullable;
      GIBSUF: IBSUFModel;
      GIBSMun: IBSMunModel;
      VIBS: Currency;
      GCBS: CBSModel;
      const GTribRegular: TributacaoRegularModel;
      const GTribCompraGov: TributacaoCompraGovernamentalModel
    );

    destructor Destroy; override;

    function PossuiBaseCalculoIBSCBS: Boolean;
    function PossuiCbs: Boolean;
    function PossuiIBSUF: Boolean;
    function PossuiIBSMun: Boolean;
    function PossuiTributacaoRegular: Boolean;

    property VBC: CurrencyNullable read GetVBC;
    property GIBSUF: IBSUFModel read GetGIBSUF;
    property GIBSMun: IBSMunModel read GetGIBSMun;
    property VIBS: Currency read FVIBS;
    property GCBS: CBSModel read GetGCBS;
    property GTribCompraGov: TributacaoCompraGovernamentalModel read GetGTribCompraGov;
    property TributacaoRegular: TributacaoRegularModel read GetTributacaoRegular;
    property ValorBaseCalculoIBSCBS: Currency read GetValorBaseCalculoIBSCBS;
  end;

implementation

{ GrupoIBSCBSModel }

uses NumberServiceUnit;

constructor GrupoIBSCBSModel.Create(
  VBC: CurrencyNullable;
  GIBSUF: IBSUFModel;
  GIBSMun: IBSMunModel;
  VIBS: Currency;
  GCBS: CBSModel;
  const GTribRegular: TributacaoRegularModel;
  const GTribCompraGov: TributacaoCompraGovernamentalModel
);
begin
  if VBC.IsNull then
    FVBC := CurrencyNullable.NullInstance()
  else
    FVBC := CurrencyNullable.Create(NumberService.RoundHalfUpTo2(VBC.Value));

  FGIBSUF := GIBSUF;
  FGIBSMun := GIBSMun;
  FVIBS := NumberService.RoundHalfUpTo2(VIBS);
  FGCBS := GCBS;
  FGTribRegular := GTribRegular;
  FGTribCompraGov := GTribCompraGov;
end;

function GrupoIBSCBSModel.GetVBC: CurrencyNullable;
begin
  Result := FVBC;
end;

function GrupoIBSCBSModel.GetGIBSUF: IBSUFModel;
begin
  Result := FGIBSUF;
end;

function GrupoIBSCBSModel.GetGIBSMun: IBSMunModel;
begin
  Result := FGIBSMun;
end;

destructor GrupoIBSCBSModel.Destroy;
begin
  FGIBSUF.Free();
  FGIBSMun.Free();
  FGCBS.Free();
  inherited;
end;

function GrupoIBSCBSModel.GetGCBS: CBSModel;
begin
  Result := FGCBS;
end;

function GrupoIBSCBSModel.GetGTribRegular: TributacaoRegularModel;
begin
  Result := FGTribRegular;
end;

function GrupoIBSCBSModel.GetGTribCompraGov: TributacaoCompraGovernamentalModel;
begin
  Result := FGTribCompraGov;
end;

function GrupoIBSCBSModel.PossuiBaseCalculoIBSCBS: Boolean;
begin
  Result := not FVBC.IsNull and (FVBC.Value > 0.00);
end;

function GrupoIBSCBSModel.GetValorBaseCalculoIBSCBS: Currency;
begin
  if PossuiBaseCalculoIBSCBS then
    Result := FVBC.Value
  else
    Result := 0.00;
end;

function GrupoIBSCBSModel.PossuiCbs: Boolean;
begin
  Result := FGCBS <> nil;
end;

function GrupoIBSCBSModel.PossuiIBSMun: Boolean;
begin
  Result := FGIBSMun <> nil;
end;

function GrupoIBSCBSModel.PossuiIBSUF: Boolean;
begin
  Result := FGIBSUF <> nil;
end;

function GrupoIBSCBSModel.PossuiTributacaoRegular: Boolean;
begin
  Result := not FGTribRegular.IsNull();
end;

function GrupoIBSCBSModel.GetTributacaoRegular: TributacaoRegularModel;
begin
  Result := FGTribRegular;
end;

end.
