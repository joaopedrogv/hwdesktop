unit UFrameGrupoIbsCbsTribRegular;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, StdCtrls, uEditHw, ExtCtrls, TributoDFeIbsCbsTribRegEtdUnit;

type
  TFrameGrupoIbsCbsTribRegular = class(TFrame)
    pn1: TPanel;
    lbCst: TLabel;
    lbcClassTrib: TLabel;
    lbAliqIbsUF: TLabel;
    edCst: TMaskEdit;
    edcClassTrib: TMaskEdit;
    edAliqIbsUF: TEditHw;
    lbValorIbsUf: TLabel;
    edValorIbsUf: TEditHw;
    pn2: TPanel;
    lbValorIbsMun: TLabel;
    edValorIbsMun: TEditHw;
    lbAliqIbsMun: TLabel;
    edAliqIbsMun: TEditHw;
    lbAliqCbs: TLabel;
    edAliqCbs: TEditHw;
    lbValorCbs: TLabel;
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

{ TFrameGrupoIbsCbsTribRegular }

function TFrameGrupoIbsCbsTribRegular.GetTribRegular: TributoDFeIbsCbsTribRegEtd;
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
    edAliqIbsUF.AsValue,
    edValorIbsUf.AsValue,
    edAliqIbsMun.AsValue,
    edValorIbsMun.AsValue,
    edAliqCbs.AsValue,
    edValorCbs.AsValue
  );
end;

procedure TFrameGrupoIbsCbsTribRegular.Setup(Input: TributoDFeIbsCbsTribRegEtd);
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
