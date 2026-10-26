unit uReestrutura_Versao11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao11 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao11: TfrmReestruturaVersao11;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao11.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 11;
  FBuild := 1;
end;

initialization
  RegisterClass(TfrmReestruturaVersao11);
finalization
  UnRegisterClass(TfrmReestruturaVersao11);

end.
