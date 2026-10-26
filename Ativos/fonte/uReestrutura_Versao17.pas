unit uReestrutura_Versao17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao17 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao17: TfrmReestruturaVersao17;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao17.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 17;
  FBuild := 13;
end;

initialization
  RegisterClass(TfrmReestruturaVersao17);
finalization
  UnRegisterClass(TfrmReestruturaVersao17);

end.
