unit TribDFeIbsCbsGrupoTribRegularFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, uEditHw, ExtCtrls, Mask, TributoDFeIbsCbsTribRegEtdUnit;

type
  TTribDFeIbsCbsGrupoTribRegularFrame = class(TFrame)
    pn1: TPanel;
    lbcClassTrib: TLabel;
    lbAliqIbsUF: TLabel;
    lbValorIbsUf: TLabel;
    lbAliqIbsMun: TLabel;
    edCst: TMaskEdit;
    edcClassTrib: TMaskEdit;
    edAliqIbsUF: TEditHw;
    edValorIbsUf: TEditHw;
    edAliqIbsMun: TEditHw;
    pn2: TPanel;
    lbValorIbsMun: TLabel;
    lbAliqCbs: TLabel;
    lbValorCbs: TLabel;
    edValorIbsMun: TEditHw;
    edAliqCbs: TEditHw;
    edValorCbs: TEditHw;
  private
    FTributacaoId: string;
    FPreenchimentoLivre: Boolean;
  public
    procedure Setup(Input: TributoDFeIbsCbsTribRegEtd);

    function GetTribRegular(): TributoDFeIbsCbsTribRegEtd;
  end;

implementation

{$R *.dfm}

{ TFrame2 }

function TTribDFeIbsCbsGrupoTribRegularFrame.GetTribRegular: TributoDFeIbsCbsTribRegEtd;
begin
  if Trim(edcClassTrib.Text) = '' then
  begin
    Result := nil;
    Exit;
  end;
  
  Result := TributoDFeIbsCbsTribRegEtd.Create(
    FTributacaoId,
    edCst.Text,
    edcClassTrib.Text,
    edAliqIbsUF.AsCurrency,
    edValorIbsUf.AsCurrency,
    edAliqIbsMun.AsCurrency,
    edValorIbsMun.AsCurrency,
    edAliqCbs.AsCurrency,
    edValorCbs.AsCurrency
  );
end;

procedure TTribDFeIbsCbsGrupoTribRegularFrame.Setup(Input: TributoDFeIbsCbsTribRegEtd);
begin
  if Input = nil then
  begin
    FTributacaoId := '';
    edCst.Clear;
    edcClassTrib.Clear;
    edAliqIbsUF.Clear;
    edValorIbsUf.Clear;
    edAliqIbsMun.Clear;
    edValorIbsMun.Clear;
    edAliqCbs.Clear;
    edValorCbs.Clear;
  end
  else
  begin                 
    FTributacaoId := Input.Id;
    edCst.Text := Input.Cstreg;
    edcClassTrib.Text := Input.CClasstribreg;
    edAliqIbsUF.AsValue := Input.Paliqefetregibsuf;
    edValorIbsUf.AsValue := Input.Vtribregibsuf;
    edAliqIbsMun.AsValue := Input.Paliqefetregibsmun;
    edValorIbsMun.AsValue := Input.Vtribregibsmun;
    edAliqCbs.AsValue := Input.Paliqefetregcbs;
    edValorCbs.AsValue := Input.Vtribregcbs;
  end;  
end;

end.
