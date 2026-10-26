unit uReestrutura_Versao9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao9 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao9: TfrmReestruturaVersao9;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao9.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 9;
  FBuild := 1;
end;

initialization
  RegisterClass(TfrmReestruturaVersao9);
finalization
  UnRegisterClass(TfrmReestruturaVersao9);

end.
