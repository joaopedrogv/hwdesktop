unit UFrameMonofasiaIbsCbs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEditHw, ExtCtrls, TributoDFeMonofasiaIbsCbsEtdUnit;

type
  TFrameMonofasiaIbsCbs = class(TFrame)
    pn1: TPanel;
    pnPadrao: TPanel;
    pnReten: TPanel; 
    pnRet: TPanel;
    pnTot: TPanel;
    lbAliqIbsUf: TLabel;
    lbVIbsUF: TLabel;
    lbPIbsMun: TLabel;
    lbVIbsMun: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    pnDifer: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label44: TLabel;
    Label26: TLabel;
    edQtBcPad: TEditHw;
    edAliqAdRemIbs: TEditHw;
    edAliqAdRemCbs: TEditHw;
    edVlrMonoIbs: TEditHw;
    edVlrMonoCbs: TEditHw;
    ckMonoPadrao: TCheckBox;
    ckSujeitoRetencao: TCheckBox;
    ckRetidaAnt: TCheckBox;
    ckComDifer: TCheckBox;
    edQtBcReten: TEditHw;
    edAliqAdRemIbsReten: TEditHw;
    edAliqAdRemCbsReten: TEditHw;
    edVlrMonoIbsReten: TEditHw;
    edVlrMonoCbsReten: TEditHw;
    edQtBcRet: TEditHw;
    edAliqAdRemIbsRet: TEditHw;
    edAliqAdRemCbsRet: TEditHw;
    edVlrMonoIbsRet: TEditHw;
    edVlrMonoCbsRet: TEditHw;
    edPerdDifIbs: TEditHw;
    edVlrDifIbs: TEditHw;
    edPerdDifCbs: TEditHw;
    edVlrDifCbs: TEditHw;
    edVlTotIbsMono: TEditHw;
    edVlTotCbsMono: TEditHw;
  private
    FTributacaoId: string;
  public
    procedure Setup(Input: TributoDFeMonofasiaIbsCbsEtd);

    function GetMonofasia(): TributoDFeMonofasiaIbsCbsEtd;
  end;

implementation

uses
  DoubleNullableUnit;

{$R *.dfm}

{ TFrameMonofasiaIbsCbs }

function TFrameMonofasiaIbsCbs.GetMonofasia: TributoDFeMonofasiaIbsCbsEtd;
begin
  Result := TributoDFeMonofasiaIbsCbsEtd.Create(
    FTributacaoId,
    DoubleNullable.Create(edQtBcPad.AsValue, not ckMonoPadrao.Checked),
    DoubleNullable.Create(edAliqAdRemIbs.AsValue, not ckMonoPadrao.Checked),
    DoubleNullable.Create(edVlrMonoIbs.AsValue, not ckMonoPadrao.Checked),
    DoubleNullable.Create(edAliqAdRemCbs.AsValue, not ckMonoPadrao.Checked),
    DoubleNullable.Create(edVlrMonoCbs.AsValue, not ckMonoPadrao.Checked),
    DoubleNullable.Create(edQtBcReten.AsValue, not ckSujeitoRetencao.Checked),
    DoubleNullable.Create(edAliqAdRemIbsReten.AsValue, not ckSujeitoRetencao.Checked),
    DoubleNullable.Create(edVlrMonoIbsReten.AsValue, not ckSujeitoRetencao.Checked),
    DoubleNullable.Create(edAliqAdRemCbsReten.AsValue, not ckSujeitoRetencao.Checked),
    DoubleNullable.Create(edVlrMonoCbsReten.AsValue, not ckSujeitoRetencao.Checked),
    DoubleNullable.Create(edQtBcRet.AsValue, not ckRetidaAnt.Checked),
    DoubleNullable.Create(edAliqAdRemIbsRet.AsValue, not ckRetidaAnt.Checked),
    DoubleNullable.Create(edVlrMonoIbsRet.AsValue, not ckRetidaAnt.Checked),
    DoubleNullable.Create(edAliqAdRemCbsRet.AsValue, not ckRetidaAnt.Checked),
    DoubleNullable.Create(edVlrMonoCbsRet.AsValue, not ckRetidaAnt.Checked),
    DoubleNullable.Create(edPerdDifIbs.AsValue, not ckComDifer.Checked),
    DoubleNullable.Create(edVlrDifIbs.AsValue, not ckComDifer.Checked),
    DoubleNullable.Create(edPerdDifCbs.AsValue, not ckComDifer.Checked),
    DoubleNullable.Create(edVlrDifCbs.AsValue, not ckComDifer.Checked),
    edVlTotIbsMono.AsValue,
    edVlTotCbsMono.AsValue
  );
end;

procedure TFrameMonofasiaIbsCbs.Setup(Input: TributoDFeMonofasiaIbsCbsEtd);
begin
  if Input = nil then
  begin
    FTributacaoId := '';
    edVlTotIbsMono.Clear();
    edVlTotCbsMono.Clear();
  end
  else
  begin
    FTributacaoId := Input.Id;
    edVlTotIbsMono.AsValue := Input.Vtotibsmonoitem;
    edVlTotCbsMono.AsValue := Input.Vtotcbsmonoitem;
  end;

  {$REGION 'Mono Padrao'}

  if (Input = nil) or (Input.Qbcmono.IsNull) then
  begin
    edQtBcPad.Clear();
    edAliqAdRemIbs.Clear();
    edVlrMonoIbs.Clear();
    edAliqAdRemCbs.Clear();
    edVlrMonoCbs.Clear();
    ckMonoPadrao.State := cbGrayed;
  end
  else
  begin
    edQtBcPad.AsValue := Input.Qbcmono.Value;
    edAliqAdRemIbs.AsValue := Input.Adremibs.Value;
    edVlrMonoIbs.AsValue := Input.Vibsmono.Value;
    edAliqAdRemCbs.AsValue := Input.Adremcbs.Value;
    edVlrMonoCbs.AsValue := Input.Vcbsmono.Value;
    ckMonoPadrao.Checked := True;
  end;

  {$ENDREGION}

  {$REGION 'Mono Retencao'}

  if (Input = nil) or (Input.Qbcmonoreten.IsNull) then
  begin
    edQtBcReten.Clear();
    edAliqAdRemIbsReten.Clear();
    edVlrMonoIbsReten.Clear();
    edAliqAdRemCbsReten.Clear();
    edVlrMonoCbsReten.Clear();
    ckSujeitoRetencao.State := cbGrayed;
  end
  else
  begin
    edQtBcReten.AsValue := Input.Qbcmonoreten.Value;
    edAliqAdRemIbsReten.AsValue := Input.Adremibsreten.Value;
    edVlrMonoIbsReten.AsValue := Input.Vibsmonoreten.Value;
    edAliqAdRemCbsReten.AsValue := Input.Adremcbsreten.Value;
    edVlrMonoCbsReten.AsValue := Input.Vcbsmonoreten.Value;
    ckSujeitoRetencao.Checked := True;
  end;

  {$ENDREGION}

  {$REGION 'Mono Retido Anteriormente'}

  if (Input = nil) or (Input.Qbcmonoret.IsNull) then
  begin
    edQtBcRet.Clear();
    edAliqAdRemIbsRet.Clear();
    edVlrMonoIbsRet.Clear();
    edAliqAdRemCbsRet.Clear();
    edVlrMonoCbsRet.Clear();
    ckRetidaAnt.State := cbGrayed;
  end
  else
  begin
    edQtBcRet.AsValue := Input.Qbcmonoret.Value;
    edAliqAdRemIbsRet.AsValue := Input.Adremibsret.Value;
    edVlrMonoIbsRet.AsValue := Input.Vibsmonoret.Value;
    edAliqAdRemCbsRet.AsValue := Input.Adremcbsret.Value;
    edVlrMonoCbsRet.AsValue := Input.Vcbsmonoret.Value;
    ckRetidaAnt.Checked := True;
  end;

  {$ENDREGION}

  {$REGION 'Mono Diferimento'}

  if (Input = nil) or (Input.Pdifibs.IsNull) then
  begin
    edPerdDifIbs.Clear();
    edVlrDifCbs.Clear();
    edPerdDifCbs.Clear();
    edVlrDifCbs.Clear();
    ckComDifer.State := cbGrayed;
  end
  else
  begin
    edPerdDifIbs.AsValue := Input.Pdifibs.Value;
    edVlrDifCbs.AsValue := Input.Vibsmonodif.Value;
    edPerdDifCbs.AsValue := Input.Pdifcbs.Value;
    edVlrDifCbs.AsValue := Input.Vcbsmonodif.Value;
    ckComDifer.Checked := True;
  end;

  {$ENDREGION}
end;

end.
