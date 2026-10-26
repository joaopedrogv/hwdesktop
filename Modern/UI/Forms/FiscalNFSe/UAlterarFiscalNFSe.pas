unit UAlterarFiscalNFSe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, StringNullableUnit, Buttons, UCorrelFiscalNFSe;

type
  TFormAlterarFiscalNFSeResult = record
  private
    FCCNAE: StringNullable;
    FCLC116: StringNullable;
    FCTribNac: StringNullable;
    FCTribMun: StringNullable;
    FCNBS: StringNullable;
    FCIndOp: StringNullable;
  public
    class function Create(const
      CCNAE, CLC116, CTribNac, CTribMun, CNBS, CIndOp: StringNullable
    ): TFormAlterarFiscalNFSeResult; static;

    property CCNAE: StringNullable read FCCNAE;
    property CLC116: StringNullable read FCLC116;
    property CTribNac: StringNullable read FCTribNac;
    property CTribMun: StringNullable read FCTribMun;
    property CNBS: StringNullable read FCNBS;
    property CIndOp: StringNullable read FCIndOp;
  end;

  TFormAlterarFiscalNFSe = class(TForm)
    Panel1: TPanel;
    PanelServicos2: TPanel;
    edCIndOp: TMaskEdit;
    edClc116: TMaskEdit;
    edCTribNac: TMaskEdit;
    edCNBS: TMaskEdit;
    Panel2: TPanel;
    lbCaption: TLabel;
    edCTribMun: TMaskEdit;
    ckLc116: TCheckBox;
    ckCtribNac: TCheckBox;
    ckcTribMun: TCheckBox;
    ckcNbs: TCheckBox;
    ckcIndOp: TCheckBox;
    BitBtn1: TBitBtn;
    btConcluir: TBitBtn;
    Panel3: TPanel;
    ckCCNAE: TCheckBox;
    edCcnae: TMaskEdit;
    Label1: TLabel;
    procedure ckCCNAEClick(Sender: TObject);
    procedure btConcluirClick(Sender: TObject);
    procedure ckcIndOpClick(Sender: TObject);
    procedure ckcNbsClick(Sender: TObject);
    procedure ckcTribMunClick(Sender: TObject);
    procedure ckCtribNacClick(Sender: TObject);
    procedure ckLc116Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure SelecionadoCampoFiscalNFSe(Campo: TFormCorrelFiscalCampo; const Value: string);
  public
    procedure Setup(const ACaption: string; const CCNAE, CLC116, CTribNac, CTribMun, CNBS, CIndOp: StringNullable);
    function GetResult(): TFormAlterarFiscalNFSeResult;
  end;

var
  FormAlterarFiscalNFSe: TFormAlterarFiscalNFSe;

implementation

{$R *.dfm}

{ TFormAlterarFiscalNFSeResult }

class function TFormAlterarFiscalNFSeResult.Create(const CCNAE, CLC116, CTribNac, CTribMun, CNBS,
  CIndOp: StringNullable): TFormAlterarFiscalNFSeResult;
begin
  Result.FCCNAE := CCNAE;
  Result.FCLC116 := CLC116;
  Result.FCTribNac := CTribNac;
  Result.FCTribMun := CTribMun;
  Result.FCNBS := CNBS;
  Result.FCIndOp := CIndOp;
end;

{ TFormAlterarFiscalNFSeEmLote }

procedure TFormAlterarFiscalNFSe.BitBtn1Click(Sender: TObject);
var
  form: TFormCorrelFiscalNFSe;
begin
  inherited;
  form := TFormCorrelFiscalNFSe.Create(nil);
  try
    form.Setup(
      edClc116.Text, edCTribNac.Text, edCNBS.Text, edCIndOp.Text
    );
    form.OnSelectCampo := SelecionadoCampoFiscalNFSe;

    form.ShowModal();

  finally
    FreeAndNil(form);
  end;
end;

procedure TFormAlterarFiscalNFSe.btConcluirClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormAlterarFiscalNFSe.ckCCNAEClick(Sender: TObject);
begin
  edCcnae.Enabled := ckCCNAE.Checked;
end;

procedure TFormAlterarFiscalNFSe.ckcIndOpClick(Sender: TObject);
begin
  edCIndOp.Enabled := ckcIndOp.Checked;
end;

procedure TFormAlterarFiscalNFSe.ckcTribMunClick(Sender: TObject);
begin
  edCTribMun.Enabled := ckcTribMun.Checked;
end;

procedure TFormAlterarFiscalNFSe.ckCtribNacClick(Sender: TObject);
begin
  edCTribNac.Enabled := ckCtribNac.Checked;
end;

procedure TFormAlterarFiscalNFSe.ckLc116Click(Sender: TObject);
begin
  edClc116.Enabled := ckLc116.Checked;
end;

procedure TFormAlterarFiscalNFSe.ckcNbsClick(Sender: TObject);
begin
  edCNBS.Enabled := ckcNbs.Checked;
end;

function TFormAlterarFiscalNFSe.GetResult: TFormAlterarFiscalNFSeResult;
begin
  Result := TFormAlterarFiscalNFSeResult.Create(
    StringNullable.Create(edCcnae.Text, not ckCCNAE.Checked ),
    StringNullable.Create(edClc116.Text, not ckLc116.Checked ),
    StringNullable.Create(edCTribNac.Text, not ckCtribNac.Checked ),
    StringNullable.Create(edCTribMun.Text, not ckcTribMun.Checked ),
    StringNullable.Create(edCNBS.Text, not ckcNbs.Checked ),
    StringNullable.Create(edCIndOp.Text, not ckcIndOp.Checked )
  );
end;

procedure TFormAlterarFiscalNFSe.SelecionadoCampoFiscalNFSe(Campo: TFormCorrelFiscalCampo; const Value: string);
begin
  case Campo of
    cfLC116:
      begin
        edClc116.Text := Value;
        ckLc116.Checked := True;
        ckLc116Click(ckLc116);
      end;

    cfCTribNac:
      begin
        edCTribNac.Text := Value;
        ckCtribNac.Checked := True;
        ckCtribNacClick(ckCtribNac);
      end;

    cfNBS:
      begin
        edCNBS.Text := Value;
        ckcNbs.Checked := True;
        ckcNbsClick(ckcNbs);
      end;

    cfCIndOp:
      begin
        edCIndOp.Text := Value;
        ckcIndOp.Checked := True;
        ckcIndOpClick(ckcIndOp);
      end;
  end;
end;

procedure TFormAlterarFiscalNFSe.Setup(const ACaption: string; const CCNAE, CLC116, CTribNac, CTribMun, CNBS,
  CIndOp: StringNullable);
begin
  lbCaption.Caption := ACaption;

  edCcnae.Text := CCNAE.Value;
  ckCCNAE.Checked := not CCNAE.IsNull;

  edClc116.Text := CLC116.Value;
  ckLc116.Checked := not CLC116.IsNull;

  edCTribNac.Text := CTribNac.Value;
  ckCtribNac.Checked := not CTribNac.IsNull;

  edCTribMun.Text := CTribMun.Value;
  ckcTribMun.Checked := not CTribMun.IsNull;

  edCNBS.Text := CNBS.Value;
  ckcNbs.Checked := not CNBS.IsNull;

  edCIndOp.Text := CIndOp.Value;
  ckcIndOp.Checked := not CIndOp.IsNull;

  ckCCNAEClick(ckCCNAE);
  ckLc116Click(ckLc116);
  ckCtribNacClick(ckCtribNac);
  ckcTribMunClick(ckcTribMun);
  ckcNbsClick(ckcNbs);
  ckcIndOpClick(ckcIndOp);
end;

end.
