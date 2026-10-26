unit uReestrutura_Versao20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao20 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao20: TfrmReestruturaVersao20;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao20.FormCreate(Sender: TObject);
begin
  inherited;
  FBuild := 33;
end;

initialization
  RegisterClass(TfrmReestruturaVersao20);
finalization
  UnRegisterClass(TfrmReestruturaVersao20);

end.
