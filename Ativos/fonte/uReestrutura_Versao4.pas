unit uReestrutura_Versao4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao4 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao4: TfrmReestruturaVersao4;
  
implementation

{$R *.dfm}

procedure TfrmReestruturaVersao4.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 4;
  FBuild := 5;
end;

initialization
  RegisterClass(TfrmReestruturaVersao4);
finalization
  UnRegisterClass(TfrmReestruturaVersao4);

end.
