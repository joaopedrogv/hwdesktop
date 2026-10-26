unit uReestrutura_Versao15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao15 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao15: TfrmReestruturaVersao15;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao15.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 15;
  FBuild := 5;
end;

initialization
  RegisterClass(TfrmReestruturaVersao15);
finalization
  UnRegisterClass(TfrmReestruturaVersao15);


end.
