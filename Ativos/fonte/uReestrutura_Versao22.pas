unit uReestrutura_Versao22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao22 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao22: TfrmReestruturaVersao22;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao22.FormCreate(Sender: TObject);
begin
  inherited;
  FBuild := 26;
end;

initialization
  RegisterClass(TfrmReestruturaVersao22);
finalization
  UnRegisterClass(TfrmReestruturaVersao22);

end.
