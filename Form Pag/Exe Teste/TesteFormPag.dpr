program TesteFormPag;

uses
  Forms,
  uTeste in 'uTeste.pas' {Form1},
  uFuncoes in 'uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
