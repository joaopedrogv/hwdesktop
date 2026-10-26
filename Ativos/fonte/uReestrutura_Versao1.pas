unit uReestrutura_Versao1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao1 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao1: TfrmReestruturaVersao1;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao1.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 1;
  FBuild := 3;
end;

initialization
  RegisterClass(TfrmReestruturaVersao1);
finalization
  UnRegisterClass(TfrmReestruturaVersao1);

end.
