unit uReestrutura_Versao25;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao25 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao25: TfrmReestruturaVersao25;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao25.FormCreate(Sender: TObject);
begin
  inherited;
  FBuild := 163;
end;          

initialization
  RegisterClass(TfrmReestruturaVersao25);
finalization
  UnRegisterClass(TfrmReestruturaVersao25);

end.
