unit uReestrutura_Versao3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao3 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao3: TfrmReestruturaVersao3;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao3.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 3;
  FBuild := 1;
end;

initialization
  RegisterClass(TfrmReestruturaVersao3);
finalization
  UnRegisterClass(TfrmReestruturaVersao3);

end.
