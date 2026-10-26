unit TribDFeIbsCbsGrupoCompraGovFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEditHw, ExtCtrls, TributoDFeIbsCbsCompraGovEtdUnit;

type
  TTribDFeIbsCbsGrupoCompraGovFrame = class(TFrame)
    pn1: TPanel;
    lbAliqIbsUf: TLabel;
    lbVIbsUF: TLabel;
    lbPIbsMun: TLabel;
    edAliqIbsUf: TEditHw;
    edVIbsUF: TEditHw;
    edAliqIbsMun: TEditHw;
    lbVIbsMun: TLabel;
    edVIbsMun: TEditHw;
    pn2: TPanel;
    lbPCbs: TLabel;
    lbVCbs: TLabel;
    edAliqCbs: TEditHw;
    edVCbs: TEditHw;
  private
    FTributacaoId: string;
  public
    procedure Setup(Input: TributoDFeIbsCbsCompraGovEtd);

    function GetCompraGov(): TributoDFeIbsCbsCompraGovEtd;
  end;

implementation

{$R *.dfm}

{ TFrame3 }

function TTribDFeIbsCbsGrupoCompraGovFrame.GetCompraGov: TributoDFeIbsCbsCompraGovEtd;
begin
  Result := TributoDFeIbsCbsCompraGovEtd.Create(
    FTributacaoId,
    edAliqIbsUf.AsCurrency,
    edVIbsUF.AsCurrency,
    edAliqIbsMun.AsCurrency,
    edVIbsMun.AsCurrency,
    edAliqCbs.AsCurrency,
    edVCbs.AsCurrency
  );
end;

procedure TTribDFeIbsCbsGrupoCompraGovFrame.Setup(
  Input: TributoDFeIbsCbsCompraGovEtd);
begin
  if Input = nil then
  begin
    FTributacaoId := '';
    edAliqIbsUf.Clear;
    edVIbsUF.Clear;
    edAliqIbsMun.Clear;
    edVIbsMun.Clear;
    edAliqCbs.Clear;
    edVCbs.Clear;
  end
  else
  begin
    FTributacaoId := Input.Id;
    edAliqIbsUf.AsValue := Input.Paliqibsuf;
    edVIbsUF.AsValue := Input.Vtribibsuf;
    edAliqIbsMun.AsValue := Input.Paliqibsmun;
    edVIbsMun.AsValue := Input.Vtribibsmun;
    edAliqCbs.AsValue := Input.Paliqcbs;
    edVCbs.AsValue := Input.Vtribcbs;
  end;
end;

end.
