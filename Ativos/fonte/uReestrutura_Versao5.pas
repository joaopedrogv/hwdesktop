unit uReestrutura_Versao5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao5 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao5: TfrmReestruturaVersao5;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao5.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 5;
  FBuild := 7;
end;

initialization
  RegisterClass(TfrmReestruturaVersao5);
finalization
  UnRegisterClass(TfrmReestruturaVersao5);

end.
