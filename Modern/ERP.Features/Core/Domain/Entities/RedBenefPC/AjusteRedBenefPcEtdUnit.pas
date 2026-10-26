unit AjusteRedBenefPcEtdUnit;

interface

uses
  Classes, SysUtils, Contnrs;

type
  AjusteRedBenefPcEtd = class
  private
    FId: string;
    FChaveDfe: string;
    FCodEmpresa: Integer;
    FRegraId: string;
    FIndAj: Integer;
    FCodAj: Integer;
    FDataRef: TDateTime;
    FCst: string;
    FVBC: Currency;
    FPPisAj: Currency;
    FVPisAj: Currency;
    FPCofinsAj: Currency;
    FVCofinsAj: Currency;
  public
    constructor Create(); overload;
    constructor Create(
      const AId: string;
      const AChaveDfe: string;
      ACodEmpresa: Integer;
      const ARegraId: string;
      AIndAj: Integer;
      ACodAj: Integer;
      ADataRef: TDateTime;
      const ACst: string;
      AVBC: Currency;
      APPisAj: Currency;
      AVPisAj: Currency;
      APCofinsAj: Currency;
      AVCofinsAj: Currency
    ); overload;

    property Id: string read FId write FId;
    property ChaveDfe: string read FChaveDfe write FChaveDfe;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property RegraId: string read FRegraId write FRegraId;
    property IndAj: Integer read FIndAj write FIndAj;
    property CodAj: Integer read FCodAj write FCodAj;
    property DataRef: TDateTime read FDataRef write FDataRef;
    property Cst: string read FCst write FCst;
    property VBC: Currency read FVBC write FVBC;
    property PPisAj: Currency read FPPisAj write FPPisAj;
    property VPisAj: Currency read FVPisAj write FVPisAj;
    property PCofinsAj: Currency read FPCofinsAj write FPCofinsAj;
    property VCofinsAj: Currency read FVCofinsAj write FVCofinsAj;
  end;

  AjusteRedBenefPcEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): AjusteRedBenefPcEtd;
    procedure SetItem(Index: Integer; const Value: AjusteRedBenefPcEtd);
  public
    property Items[Index: Integer]: AjusteRedBenefPcEtd read GetItem write SetItem;
  end;

implementation

{ AjusteRedBenefPcEtd }

constructor AjusteRedBenefPcEtd.Create();
begin
  inherited Create;
end;

constructor AjusteRedBenefPcEtd.Create(
  const AId: string;
  const AChaveDfe: string;
  ACodEmpresa: Integer;
  const ARegraId: string;
  AIndAj: Integer;
  ACodAj: Integer;
  ADataRef: TDateTime;
  const ACst: string;
  AVBC: Currency;
  APPisAj: Currency;
  AVPisAj: Currency;
  APCofinsAj: Currency;
  AVCofinsAj: Currency
);
begin
  Create();
  FId := AId;
  FChaveDfe := AChaveDfe;
  FCodEmpresa := ACodEmpresa;
  FRegraId := ARegraId;
  FIndAj := AIndAj;
  FCodAj := ACodAj;
  FDataRef := ADataRef;
  FCst := ACst;
  FVBC := FVBC;
  FPPisAj := APPisAj;
  FVPisAj := AVPisAj;
  FPCofinsAj := APCofinsAj;
  FVCofinsAj := AVCofinsAj;
end;

{ AjusteRedBenefPcEtdList }

function AjusteRedBenefPcEtdList.GetItem(Index: Integer): AjusteRedBenefPcEtd;
begin
  Result := AjusteRedBenefPcEtd(inherited Items[Index]);
end;

procedure AjusteRedBenefPcEtdList.SetItem(Index: Integer; const Value: AjusteRedBenefPcEtd);
begin
  Put(Index, Value);
end;

end.
