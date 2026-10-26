unit uReestrutura_Versao16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao16 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao16: TfrmReestruturaVersao16;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao16.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 16;
  FBuild := 4;
end;

initialization
  RegisterClass(TfrmReestruturaVersao16);
finalization
  UnRegisterClass(TfrmReestruturaVersao16);

end.
