unit UFrameCreditoPresumidoIbsCbs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEditHw, ExtCtrls, Mask,
  TributoDFeCredPresOpIbsCbsEtdUnit, TributoDFeCredPresZfmIbsCbsEtdUnit;

type
  TFrameCreditoPresumidoIbsCbs = class(TFrame)
    pn1: TPanel;
    ckgCredPresOper: TCheckBox;
    ckgCredPresIBSZFM: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    edvBCCredPres: TEditHw;
    Label2: TLabel;
    edcCredPres: TComboBox;
    pnCredPresIbs: TPanel;
    edpCredPresIbs: TEditHw;
    pnCredOper: TPanel;
    lbCompraGovIt: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtpCredPresIBSZFM: TComboBox;
    Panel5: TPanel;
    Label6: TLabel;
    edvCredPresIBSZFM: TEditHw;
    Label8: TLabel;
    edvCredPresIbs: TEditHw;
    Label9: TLabel;
    edvCredPresCondSusIbs: TEditHw;
    Panel2: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    edpCredPresCbs: TEditHw;
    edvCredPresCbs: TEditHw;
    edvCredPresCondSusCbs: TEditHw;
    edcompetApur: TMaskEdit;
    ckCredPresOpIbs: TCheckBox;
    ckCredPresOpCbs: TCheckBox;
  private
    FTributacaoId: string;
    procedure SetupOp(InputOp: TributoDFeCredPresOpIbsCbsEtd);
    procedure SetupZFM(InputZFM: TributoDFeCredPresZfmIbsCbsEtd);
  public
    procedure Setup(const TribucacaoId: string; InputOp: TributoDFeCredPresOpIbsCbsEtd; InputZFM: TributoDFeCredPresZfmIbsCbsEtd);

    function GetCreditoPresumidoOperacao(): TributoDFeCredPresOpIbsCbsEtd;
    function GetCreditoPresumidoZFM(): TributoDFeCredPresZfmIbsCbsEtd;
  end;

implementation

uses
  Math,
  DoubleNullableUnit;

{$R *.dfm}

{ TFrameCreditoPresumidoIbsCbs }

function TFrameCreditoPresumidoIbsCbs.GetCreditoPresumidoOperacao: TributoDFeCredPresOpIbsCbsEtd;
begin
  if not ckgCredPresOper.Checked then
  begin
    Result := nil;
    Exit;
  end;

  Result := TributoDFeCredPresOpIbsCbsEtd.Create(
    FTributacaoId,
    edvBCCredPres.AsValue,
    Copy(edcCredPres.Text, 1, 2),
    DoubleNullable.Create(edpCredPresIbs.AsValue, not ckCredPresOpIbs.Checked),
    DoubleNullable.Create(edvCredPresIbs.AsValue, not ckCredPresOpIbs.Checked),
    DoubleNullable.Create(edvCredPresCondSusIbs.AsValue, not ckCredPresOpIbs.Checked),
    DoubleNullable.Create(edpCredPresCbs.AsValue, not ckCredPresOpCbs.Checked),
    DoubleNullable.Create(edvCredPresCbs.AsValue, not ckCredPresOpCbs.Checked),
    DoubleNullable.Create(edvCredPresCondSusCbs.AsValue, not ckCredPresOpCbs.Checked)
  );
end;

function TFrameCreditoPresumidoIbsCbs.GetCreditoPresumidoZFM: TributoDFeCredPresZfmIbsCbsEtd;
begin
  if not ckgCredPresIBSZFM.Checked then
  begin
    Result := nil;
    Exit;
  end;

  Result := TributoDFeCredPresZfmIbsCbsEtd.Create(
    FTributacaoId,
    edcompetApur.Text,
    Max(0, edtpCredPresIBSZFM.ItemIndex),
    edvCredPresIBSZFM.AsValue
  );
end;

procedure TFrameCreditoPresumidoIbsCbs.Setup(
  const TribucacaoId: string;
  InputOp: TributoDFeCredPresOpIbsCbsEtd;
  InputZFM: TributoDFeCredPresZfmIbsCbsEtd);
begin
  FTributacaoId := TribucacaoId;
  if (InputOp = nil) and (InputZFM = nil) then
  begin
    SetupOp( nil );
    SetupZFM( nil );
  end
  else if (InputOp <> nil) then
  begin
    SetupOp( InputOp );
    SetupZFM( nil );
  end
  else
  begin             
    SetupOp( nil );
    SetupZFM( InputZFM );
  end;
end;

procedure TFrameCreditoPresumidoIbsCbs.SetupOp(
  InputOp: TributoDFeCredPresOpIbsCbsEtd);
begin
  // gCredPresOper
  if InputOp = nil then
  begin
    edvBCCredPres.Clear();
    edcCredPres.ItemIndex := -1;
  end
  else
  begin
    edvBCCredPres.AsValue := InputOp.Vbccredpres;
    edcCredPres.ItemIndex := -1; //**Pend**
  end;

  // gCredPresOper.gIBSCredPres
  if (InputOp = nil) or (InputOp.IbsPcredpres.IsNull) then
  begin
    edpCredPresIbs.Clear;
    edvCredPresIbs.Clear;
    edvCredPresCondSusIbs.Clear;
    ckCredPresOpIbs.State := cbGrayed;
  end
  else
  begin
    edpCredPresIbs.AsValue := InputOp.IbsPcredpres.Value;
    edvCredPresIbs.AsValue := InputOp.IbsVcredpres.Value;
    edvCredPresCondSusIbs.AsValue := InputOp.IbsVcredprescondsus.Value;
    ckCredPresOpIbs.Checked := True;
  end;
                               
  // gCredPresOper.gCBSCredPres
  if (InputOp = nil) or (InputOp.CbsPcredpres.IsNull) then
  begin
    edpCredPresCbs.Clear();
    edvCredPresCbs.Clear();
    edvCredPresCondSusCbs.Clear();
    ckCredPresOpCbs.State := cbGrayed;
  end
  else
  begin
    edpCredPresCbs.AsValue := InputOp.CbsPcredpres.Value;
    edvCredPresCbs.AsValue := InputOp.CbsVcredpres.Value;
    edvCredPresCondSusCbs.AsValue := InputOp.CbsVcredprescondsus.Value;
    ckCredPresOpCbs.Checked := True;
  end;

  ckgCredPresOper.Checked := InputOp <> nil;
end;

procedure TFrameCreditoPresumidoIbsCbs.SetupZFM(
  InputZFM: TributoDFeCredPresZfmIbsCbsEtd);
begin
  // gCredPresIBSZFM
  if InputZFM = nil then
  begin
    edcompetApur.Clear();
    edtpCredPresIBSZFM.ItemIndex := -1;
    edvCredPresIBSZFM.Clear;
  end
  else
  begin
    edcompetApur.Text := InputZFM.Competapur;
    edtpCredPresIBSZFM.ItemIndex := -1; //**Pend**
    edvCredPresIBSZFM.AsValue := InputZFM.Vcredpresibszfm;
  end;

  ckgCredPresIBSZFM.Checked := InputZFM <> nil;
end;

end.
