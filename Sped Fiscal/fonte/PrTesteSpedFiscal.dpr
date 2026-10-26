program PrTesteSpedFiscal;

uses
  Forms,
  uTesteSpedFiscal in 'uTesteSpedFiscal.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
//  Application.CreateForm(TfrmSpedFiscal, frmSpedFiscal);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
