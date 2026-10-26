program HwGuardUp;

uses
  Forms,
  uGuardUp in 'uGuardUp.pas' {frmGuardUp};

{$R *.res}

begin
  Application.Initialize;
  guard := TGuardUpdate.create;
  Application.CreateForm(TfrmGuardUp, frmGuardUp);
  guard._Run;
  Application.Run;
end.
