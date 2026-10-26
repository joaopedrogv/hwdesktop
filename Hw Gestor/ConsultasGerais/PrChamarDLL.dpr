program PrChamarDLL;

uses
  Forms,
  UChamarDLL in 'UChamarDLL.pas' {FrmChamarDLL};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmChamarDLL, FrmChamarDLL);
  Application.Run;
end.
