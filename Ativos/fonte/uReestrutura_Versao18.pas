unit uReestrutura_Versao18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao18 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao18: TfrmReestruturaVersao18;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao18.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 18;
  FBuild := 4;
end;

initialization
  RegisterClass(TfrmReestruturaVersao18);
finalization
  UnRegisterClass(TfrmReestruturaVersao18);

end.
