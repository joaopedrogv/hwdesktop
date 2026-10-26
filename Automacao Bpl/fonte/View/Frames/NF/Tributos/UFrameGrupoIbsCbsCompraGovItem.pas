unit UFrameGrupoIbsCbsCompraGovItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, uEditHw, ExtCtrls, TributoDFeIbsCbsCompraGovEtdUnit;

type
  TFrameGrupoIbsCbsCompraGovItem = class(TFrame)
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

{ TFrameGrupoIbsCbsCompraGovItem }

function TFrameGrupoIbsCbsCompraGovItem.GetCompraGov: TributoDFeIbsCbsCompraGovEtd;
begin
  Result := TributoDFeIbsCbsCompraGovEtd.Create(
    FTributacaoId,
    edAliqIbsUf.AsValue,
    edVIbsUF.AsValue,
    edAliqIbsMun.AsValue,
    edVIbsMun.AsValue,
    edAliqCbs.AsValue,
    edVCbs.AsValue
  );
end;

procedure TFrameGrupoIbsCbsCompraGovItem.Setup(
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
