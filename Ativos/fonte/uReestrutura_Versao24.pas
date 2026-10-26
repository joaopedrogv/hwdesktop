unit uReestrutura_Versao24;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao24 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao24: TfrmReestruturaVersao24;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao24.FormCreate(Sender: TObject);
begin
  inherited;
  FBuild := 139;
end;       

initialization
  RegisterClass(TfrmReestruturaVersao24);
finalization
  UnRegisterClass(TfrmReestruturaVersao24);

end.
