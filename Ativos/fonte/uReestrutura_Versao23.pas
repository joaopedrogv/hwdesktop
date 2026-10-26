unit uReestrutura_Versao23;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uReestrutura_Versao, StdCtrls, ExtCtrls;

type
  TfrmReestruturaVersao23 = class(TfrmReestruturaVersao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestruturaVersao23: TfrmReestruturaVersao23;

implementation

{$R *.dfm}


procedure TfrmReestruturaVersao23.FormCreate(Sender: TObject);
begin
  inherited;
  FBuild := 41;
end;

initialization
  RegisterClass(TfrmReestruturaVersao23);
finalization                                 
  UnRegisterClass(TfrmReestruturaVersao23);

end. 
