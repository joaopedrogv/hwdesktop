program prTesteSPEDPISCOFINS;

uses
  Forms,
  uTesteSpedPISCOFINS in 'uTesteSpedPISCOFINS.pas' {Form1},
  uClassesSpedPISCOFINS in 'uClassesSpedPISCOFINS.pas',
  uFormSpedPISCOFINS in 'uFormSpedPISCOFINS.pas' {frmSpedPISCOFINS},
  uSpedHw in '..\..\Sped Fiscal\fonte\uSpedHw.pas',
  ACBRSpedPISCOFINSUtilHw in 'ACBRSpedPISCOFINSUtilHw.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
