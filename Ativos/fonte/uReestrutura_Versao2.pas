unit uReestrutura_Versao2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao2 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao2: TfrmReestruturaVersao2;

implementation

{$R *.dfm}

procedure TfrmReestruturaVersao2.FormCreate(Sender: TObject);
begin
  inherited;
  FVersao := 2;
  FBuild := 1;
end;

initialization
  RegisterClass(TfrmReestruturaVersao2);
finalization
  UnRegisterClass(TfrmReestruturaVersao2);

end.
