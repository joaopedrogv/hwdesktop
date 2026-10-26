unit uReestrutura_Versao10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao10 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao10: TfrmReestruturaVersao10;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao10.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 10;
  FBuild := 1;
end;

initialization
  RegisterClass(TfrmReestruturaVersao10);
finalization
  UnRegisterClass(TfrmReestruturaVersao10);

end.
