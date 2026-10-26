program hw.efd.dx.teste;

uses
  Vcl.Forms,
  hw.efd.dx.form.teste in 'hw.efd.dx.form.teste.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
