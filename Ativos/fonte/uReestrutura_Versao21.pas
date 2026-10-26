unit uReestrutura_Versao21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao21 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao21: TfrmReestruturaVersao21;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao21.FormCreate(Sender: TObject);
begin
  inherited;
  FBuild := 89;
end;

initialization
  RegisterClass(TfrmReestruturaVersao21);
finalization
  UnRegisterClass(TfrmReestruturaVersao21);

end.
