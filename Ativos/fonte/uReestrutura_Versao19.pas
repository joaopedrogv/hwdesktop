unit uReestrutura_Versao19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao19 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao19: TfrmReestruturaVersao19;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao19.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 19;
  FBuild := 9;
end;

initialization
  RegisterClass(TfrmReestruturaVersao19);
finalization
  UnRegisterClass(TfrmReestruturaVersao19);

end.
