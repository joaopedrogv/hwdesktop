unit uReestrutura_Versao26;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao26 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao26: TfrmReestruturaVersao26;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao26.FormCreate(Sender: TObject);
begin
  inherited;
  FBuild := 332;
end;         

initialization
  RegisterClass(TfrmReestruturaVersao26);
finalization
  UnRegisterClass(TfrmReestruturaVersao26);

end.
