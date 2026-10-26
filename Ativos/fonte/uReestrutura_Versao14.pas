unit uReestrutura_Versao14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao14 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao14: TfrmReestruturaVersao14;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao14.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 14;
  FBuild := 5;
end;

initialization
  RegisterClass(TfrmReestruturaVersao14);
finalization
  UnRegisterClass(TfrmReestruturaVersao14);

end.
