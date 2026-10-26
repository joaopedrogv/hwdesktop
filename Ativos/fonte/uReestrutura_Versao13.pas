unit uReestrutura_Versao13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao13 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao13: TfrmReestruturaVersao13;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao13.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 13;
  FBuild := 6;
end;

initialization
  RegisterClass(TfrmReestruturaVersao13);
finalization
  UnRegisterClass(TfrmReestruturaVersao13);


end.
