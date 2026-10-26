unit uReestrutura_Versao8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao8 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao8: TfrmReestruturaVersao8;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao8.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 8;
  FBuild := 1;
end;

initialization
  RegisterClass(TfrmReestruturaVersao8);
finalization
  UnRegisterClass(TfrmReestruturaVersao8);


end.
