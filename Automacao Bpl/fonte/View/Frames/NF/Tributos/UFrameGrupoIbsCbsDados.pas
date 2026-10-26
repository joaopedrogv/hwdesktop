unit UFrameGrupoIbsCbsDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, uEditHw, ImpostoCalculadoModelUnit;

type
  TFrameGrupoIbsCbsDados = class(TFrame)
    pnTributo: TPanel;
    pn1: TPanel;
    lbAliqTributo: TLabel;
    edPAliq: TEditHw;
    ckPDif: TCheckBox;
    pnVDif: TPanel;
    Label9: TLabel;
    edPDif: TEditHw;
    edVDif: TEditHw;
    pn2: TPanel;
    lbVTrib: TLabel;
    ckVDevtrib: TCheckBox;
    ckPRed: TCheckBox;
    edVDevTrib: TEditHw;
    pnVRed: TPanel;
    lbAliqEfet: TLabel;
    edPRed: TEditHw;
    edPAliqEfet: TEditHw;
    edVtrib: TEditHw;
    pn2_1: TPanel;
    lbPDif: TLabel;
    lbPRed: TLabel;
    lbVDevTrib: TLabel;
    procedure lbVDevTribClick(Sender: TObject);
    procedure lbPRedClick(Sender: TObject);
    procedure lbPDifClick(Sender: TObject);
    procedure ckPRedClick(Sender: TObject);
    procedure ckVDevtribClick(Sender: TObject);
    procedure ckPDifClick(Sender: TObject);
  private
    FPreenchimentoLivre: Boolean;
  public
    procedure Setup(const NomeTributo: string); overload;
    procedure Setup(Input: ImpostoCalculadoModel); overload;
    procedure Setup(PreenchimentoLivre: Boolean); overload;

    function GetTributo(): ImpostoCalculadoModel;
  end;

implementation

uses
  DiferimentoModelUnit,
  DevolucaoTributosModelUnit,
  ReducaoAliquotaModelUnit;

{$R *.dfm}

{ TFrameGrupoIbsCbsDados }

procedure TFrameGrupoIbsCbsDados.ckPDifClick(Sender: TObject);
begin
  pnVDif.Enabled := ckPDif.Checked;
  if pnVDif.Enabled then
    pnVDif.ParentFont := True
  else
    pnVDif.Font.Color := clGrayText;
end;

procedure TFrameGrupoIbsCbsDados.ckPRedClick(Sender: TObject);
begin
  pnVRed.Enabled := ckPRed.Checked;
  if pnVRed.Enabled then
    pnVRed.ParentFont := True
  else
    pnVRed.Font.Color := clGrayText;
end;

procedure TFrameGrupoIbsCbsDados.ckVDevtribClick(Sender: TObject);
begin
  edVDevTrib.Enabled := ckVDevtrib.Checked;
end;

function TFrameGrupoIbsCbsDados.GetTributo: ImpostoCalculadoModel;
var
  GDif: DiferimentoModel;
  GRed: ReducaoAliquotaModel;
  GDev: DevolucaoTributosModel;
begin
  
  if not ckPDif.Checked then
    GDif := DiferimentoModel.NullInstance()
  else
    GDif := DiferimentoModel.Create( edPDif.AsValue, edVDif.AsValue );

  if not ckVDevtrib.Checked then  //**Pend** regulamento
    GDev := DevolucaoTributosModel.NullInstance()
  else
    GDev := DevolucaoTributosModel.Create( edVDevTrib.AsValue );

  if not ckPRed.Checked then
    GRed := ReducaoAliquotaModel.NullInstance()
  else
    GRed := ReducaoAliquotaModel.Create( edPRed.AsValue, edPAliqEfet.AsValue );

  Result := ImpostoCalculadoModel.Create(
    edPAliq.AsValue,
    GDif,
    GDev,
    GRed,
    edVtrib.AsValue,
    ''
  );
end;

procedure TFrameGrupoIbsCbsDados.lbVDevTribClick(Sender: TObject);
begin
  ckVDevtrib.Checked := not ckVDevtrib.Checked;
  ckVDevtribClick(ckVDevtrib);
end;

procedure TFrameGrupoIbsCbsDados.lbPDifClick(Sender: TObject);
begin
  ckPDif.Checked := not ckPDif.Checked;
  ckPDifClick(ckPDif);
end;

procedure TFrameGrupoIbsCbsDados.lbPRedClick(Sender: TObject);
begin
  ckPRed.Checked := not ckPRed.Checked;
  ckPRedClick(ckPRed);
end;

procedure TFrameGrupoIbsCbsDados.Setup(PreenchimentoLivre: Boolean);
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

procedure TFrameGrupoIbsCbsDados.Setup(Input: ImpostoCalculadoModel);
begin
  if Input = nil then
  begin
    edPAliq.Clear;
    ckPDif.State := cbGrayed;
    edPDif.Clear;
    edVDif.Clear;
    ckVDevtrib.State := cbGrayed;
    edVDevTrib.Clear;
    ckPRed.State := cbGrayed;
    edPRed.Clear;
    edPAliqEfet.Clear;
    edVtrib.Clear;
  end
  else
  begin
    edPAliq.AsValue := Input.Aliquota;
    ckPDif.Checked := not Input.GDif.IsNull();
    edPDif.AsValue := Input.GDif.PDif;
    edVDif.AsValue := Input.GDif.VDif;
    ckVDevtrib.Checked := not Input.GDevTrib.IsNull();
    edVDevTrib.AsValue := Input.GDevTrib.VDevTrib;
    ckPRed.Checked := not Input.GRed.IsNull();
    edPRed.AsValue := Input.GRed.PRedAliq;
    edPAliqEfet.AsValue := Input.GRed.PAliqEfet;
    edVtrib.AsValue := Input.ValorImposto;
  end;
end;

procedure TFrameGrupoIbsCbsDados.Setup(const NomeTributo: string);
begin
  lbAliqTributo.Caption := Format('Alíquota do %s', [ NomeTributo ]);
  lbVTrib.Caption := Format('Valor %s', [ NomeTributo ]);
end;

end.
