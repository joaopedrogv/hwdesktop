unit uReestrutura_Versao6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao6 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao6: TfrmReestruturaVersao6;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao6.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 6;
  FBuild := 1;
end;

initialization
  RegisterClass(TfrmReestruturaVersao6);
finalization
  UnRegisterClass(TfrmReestruturaVersao6);

end.
