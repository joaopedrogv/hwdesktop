unit uReestrutura_Versao7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao7 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao7: TfrmReestruturaVersao7;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao7.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 7;
  FBuild := 3;
end;

initialization
  RegisterClass(TfrmReestruturaVersao7);
finalization
  UnRegisterClass(TfrmReestruturaVersao7);

end.
