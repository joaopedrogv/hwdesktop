program Md5Hw;

uses
  Forms,
  uPrincipalMD5 in 'uPrincipalMD5.pas' {Form1},
  MD5 in 'MD5.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
