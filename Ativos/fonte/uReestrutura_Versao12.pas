unit uReestrutura_Versao12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao12 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao12: TfrmReestruturaVersao12;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao12.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 12;
  FBuild := 2;
end;

initialization
  RegisterClass(TfrmReestruturaVersao12);
finalization
  UnRegisterClass(TfrmReestruturaVersao12);

end.
