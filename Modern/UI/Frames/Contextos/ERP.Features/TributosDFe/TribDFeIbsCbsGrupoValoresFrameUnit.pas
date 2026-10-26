unit TribDFeIbsCbsGrupoValoresFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEditHw, ExtCtrls, 
  DiferimentoModelUnit,
  DevolucaoTributosModelUnit,
  ReducaoAliquotaModelUnit,
  TipoComunsUnit;

type
  TributoDFeIbsCbsInput = class;

  TTribDFeIbsCbsGrupoValoresFrame = class(TFrame)
    pnTributo: TPanel;
    pn1: TPanel;
    lbAliqTributo: TLabel;
    lbPDif: TLabel;
    edPAliq: TEditHw;
    pnVDif: TPanel;
    Label9: TLabel;
    edPDif: TEditHw;
    edVDif: TEditHw;
    pn2: TPanel;
    lbVDevTrib: TLabel;
    edVDevTrib: TEditHw;
    pn2_1: TPanel;
    lbVTrib: TLabel;
    lbPRed: TLabel;
    pnVRed: TPanel;
    lbAliqEfet: TLabel;
    edPRed: TEditHw;
    edPAliqEfet: TEditHw;
    edVtrib: TEditHw;
    procedure edVDevTribChange(Sender: TObject);
    procedure edPRedChange(Sender: TObject);
    procedure edPDifChange(Sender: TObject);
  private
    FPreenchimentoLivre: Boolean;
  public
    procedure Setup(const NomeTributo: string); overload;
    procedure Setup(Input: TributoDFeIbsCbsInput); overload;
    procedure Setup(PreenchimentoLivre: Boolean); overload;

    function GetTributo(): TributoDFeIbsCbsInput;
  end;
  
  TributoDFeIbsCbsInput = class
  private
    FAliquota: Currency;
    FGDif: DiferimentoModel;
    FGDevTrib: DevolucaoTributosModel;
    FGRed: ReducaoAliquotaModel;
    FValorImposto: Currency;
    FMemoriaCalculo: string;
  public
    constructor Create(
      Aliquota: Currency;
      const GDif: DiferimentoModel;
      const GDevTrib: DevolucaoTributosModel;
      const GRed: ReducaoAliquotaModel;
      ValorImposto: Currency;
      const MemoriaCalculo: string
    );

    property Aliquota: Currency read FAliquota;
    property GDif: DiferimentoModel read FGDif;
    property GDevTrib: DevolucaoTributosModel read FGDevTrib;
    property GRed: ReducaoAliquotaModel read FGRed;
    property ValorImposto: Currency read FValorImposto;
    property MemoriaCalculo: string read FMemoriaCalculo;

    function GetVDif: Currency;
    function GetVDevTrib: Currency;
  end;

implementation

{$R *.dfm}

{ TributoDFeIbsCbsInput }

constructor TributoDFeIbsCbsInput.Create(
  Aliquota: Currency;
  const GDif: DiferimentoModel;
  const GDevTrib: DevolucaoTributosModel;
  const GRed: ReducaoAliquotaModel;
  ValorImposto: Currency;
  const MemoriaCalculo: string
);
begin
  FAliquota := Aliquota;
  FGDif := GDif;
  FGDevTrib := GDevTrib;
  FGRed := GRed;
  FValorImposto := ValorImposto;
  FMemoriaCalculo := MemoriaCalculo;
end;

function TributoDFeIbsCbsInput.GetVDif(): Currency;
begin
  Result := FGDif.VDif;
end;

function TributoDFeIbsCbsInput.GetVDevTrib(): Currency;
begin
  Result := FGDevTrib.VDevTrib;
end;

{ TTribDFeIbsCbsGrupoValoresFrame }

procedure TTribDFeIbsCbsGrupoValoresFrame.edPDifChange(Sender: TObject);
begin   
  pnVDif.Enabled := not edPDif.IsNull;
  if pnVDif.Enabled then
    pnVDif.ParentColor := True
  else
    pnVDif.Color := clBtnFace;
end;

procedure TTribDFeIbsCbsGrupoValoresFrame.edPRedChange(Sender: TObject);
begin
  pnVRed.Enabled := not edPRed.IsNull;
  if pnVRed.Enabled then
    pnVRed.ParentColor := True
  else
    pnVRed.Color := clBtnFace;
end;

procedure TTribDFeIbsCbsGrupoValoresFrame.edVDevTribChange(Sender: TObject);
begin
  if not edVDevTrib.IsNull then
    edVDevTrib.ParentColor := True
  else
    edVDevTrib.Color := clBtnFace;
end;

function TTribDFeIbsCbsGrupoValoresFrame.GetTributo: TributoDFeIbsCbsInput;
var
  GDif: DiferimentoModel;
  GRed: ReducaoAliquotaModel;
  GDev: DevolucaoTributosModel;
begin
  
  if edPDif.IsNull then
    GDif := DiferimentoModel.NullInstance()
  else
    GDif := DiferimentoModel.Create( edPDif.AsValue, edVDif.AsValue );

  if edVDevtrib.IsNull then  //**Pend** regulamento
    GDev := DevolucaoTributosModel.NullInstance()
  else
    GDev := DevolucaoTributosModel.Create( edVDevTrib.AsValue );

  if edPRed.IsNull then
    GRed := ReducaoAliquotaModel.NullInstance()
  else
    GRed := ReducaoAliquotaModel.Create( edPRed.AsValue, edPAliqEfet.AsValue );

  Result := TributoDFeIbsCbsInput.Create(
    edPAliq.AsValue,
    GDif,
    GDev,
    GRed,
    edVtrib.AsValue,
    ''
  );
end;

procedure TTribDFeIbsCbsGrupoValoresFrame.Setup(PreenchimentoLivre: Boolean);
begin
  FPreenchimentoLivre := PreenchimentoLivre;

  pn1.Enabled := FPreenchimentoLivre;
  pn2_1.Enabled := FPreenchimentoLivre;

  if pn1.Enabled then
  begin
    pn1.ParentFont := True;
    pn2_1.ParentFont := True;
  end
  else
  begin
    pn1.Font.Color := clGrayText;
    pn2_1.Font.Color := clGrayText;
  end;
end;

procedure TTribDFeIbsCbsGrupoValoresFrame.Setup(Input: TributoDFeIbsCbsInput);
begin
  if Input = nil then
  begin
    edPAliq.Clear;
    edPDif.Clear;
    edVDif.Clear;
    edVDevTrib.Clear;
    edPRed.Clear;
    edPAliqEfet.Clear;
    edVtrib.Clear;
  end
  else
  begin
    edPAliq.AsValue := Input.Aliquota;
    edPDif.UpdateValue( Input.GDif.PDif, Input.GDif.IsNull );
    edVDif.UpdateValue( Input.GDif.VDif, Input.GDif.IsNull );
    edVDevTrib.UpdateValue( Input.GDevTrib.VDevTrib, Input.GDevTrib.IsNull );
    edPRed.UpdateValue( Input.GRed.PRedAliq, Input.GRed.IsNull );
    edPAliqEfet.UpdateValue( Input.GRed.PAliqEfet, Input.GRed.IsNull );
    edVtrib.UpdateValue( Input.ValorImposto ) ;
  end;
end;

procedure TTribDFeIbsCbsGrupoValoresFrame.Setup(const NomeTributo: string);
begin
  lbAliqTributo.Caption := Format('Alíquota do %s', [ NomeTributo ]);
  lbVTrib.Caption := Format('Valor %s', [ NomeTributo ]);
end;

end.
