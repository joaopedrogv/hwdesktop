unit AjusteRedBenefPcModelUnit;

interface

uses
  Classes, SysUtils, Contnrs,
  EntityBaseUnit;

type
  DocFiscalReferenciado = class
  private
    FId: string;
    FRegular: Boolean;
  public
    constructor Create(const AId: string; ARegular: Boolean);

    property Id: string read FId;
    property Regular: Boolean read FRegular;
  end;

  AjusteRedBenefPcModel = class(EntityBase)
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
    FAutomatico: Boolean;
    FDescricaoAjuste: string;
    FInfComplementar: string;
    FCodContaContabil: string;
    FDocFiscalReferenciado: DocFiscalReferenciado;
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
      AVCofinsAj: Currency;
      AAutomatico: Boolean;
      const ADescricaoAjuste, AInfComplementar, ACodContaContabil: string;
      ADocFiscalReferenciado: DocFiscalReferenciado
    ); overload;

    destructor Destroy; override;

    function GetAuditLabel(const Additional: string = ''): string; override;
    function GetAuditKey(): string; override;

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
    property Automatico: Boolean read FAutomatico write FAutomatico;
    property DescricaoAjuste: string read FDescricaoAjuste;
    property InfComplementar: string read FInfComplementar;
    property CodContaContabil: string read FCodContaContabil;
    property DocFiscalReferenciado: DocFiscalReferenciado read FDocFiscalReferenciado;
  end;

  AjusteRedBenefPcModelList = class(TObjectList)
  private
    function GetItem(Index: Integer): AjusteRedBenefPcModel;
    procedure SetItem(Index: Integer; const Value: AjusteRedBenefPcModel);
  public
    function ObterDistinto(
      const CST: string; IndAj, CodAj: Integer; const ChaveDFe, DescricaoAj, InfComplAj: string
    ): AjusteRedBenefPcModel; // CST + Chave EFD, IndAj, CodAj, NumDoc e Descr
    property Items[Index: Integer]: AjusteRedBenefPcModel read GetItem write SetItem;
  end;

implementation

uses
  StrUtils;

{ AjusteRedBenefPcModel }

constructor AjusteRedBenefPcModel.Create();
begin
  FAutomatico := False;
end;

constructor AjusteRedBenefPcModel.Create(
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
  AVCofinsAj: Currency;
  AAutomatico: Boolean;
  const ADescricaoAjuste, AInfComplementar, ACodContaContabil: string;
  ADocFiscalReferenciado: DocFiscalReferenciado
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
  FVBC := AVBC;
  FPPisAj := APPisAj;
  FVPisAj := AVPisAj;
  FPCofinsAj := APCofinsAj;
  FVCofinsAj := AVCofinsAj;
  FAutomatico := AAutomatico;
  FDescricaoAjuste := ADescricaoAjuste;
  FInfComplementar := AInfComplementar;
  FCodContaContabil := ACodContaContabil;
  FDocFiscalReferenciado := ADocFiscalReferenciado;
end;

destructor AjusteRedBenefPcModel.Destroy;
begin
  FDocFiscalReferenciado.Free();
  inherited;
end;

function AjusteRedBenefPcModel.GetAuditKey: string;
begin
  Result := Format('%s - %s', [ FCst, FChaveDfe ]);
end;

function AjusteRedBenefPcModel.GetAuditLabel(const Additional: string): string;
begin
  Result := Self.GetAuditKey()
  + IfThen(Additional <> '', ' - ' + Additional);
end;

{ AjusteRedBenefPcModelList }

function AjusteRedBenefPcModelList.ObterDistinto(
  const CST: string; IndAj, CodAj: Integer; const ChaveDFe, DescricaoAj, InfComplAj: string
): AjusteRedBenefPcModel;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].Cst = CST)
      and (Self.Items[I].IndAj = IndAj)
      and (Self.Items[I].CodAj = CodAj)
      and (Self.Items[I].ChaveDfe = ChaveDFe)
      and (Self.Items[I].DescricaoAjuste = DescricaoAj)
      and (Self.Items[I].InfComplementar = InfComplAj) then
    begin
      Result := Self.Items[I];
      Exit;
    end;

  Result := nil;
end;

function AjusteRedBenefPcModelList.GetItem(Index: Integer): AjusteRedBenefPcModel;
begin
  Result := AjusteRedBenefPcModel(inherited Items[Index]);
end;

procedure AjusteRedBenefPcModelList.SetItem(Index: Integer; const Value: AjusteRedBenefPcModel);
begin
  Put(Index, Value);
end;

{ DocFiscalReferenciado }

constructor DocFiscalReferenciado.Create(const AId: string; ARegular: Boolean);
begin
  FId := AId;
  FRegular := ARegular;
end;

end.
