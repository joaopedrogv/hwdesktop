unit UTestando;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfRMTeste = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRMTeste: TfRMTeste;

implementation

{$R *.dfm}

procedure TfRMTeste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=caFree;
end;

procedure TfRMTeste.FormCreate(Sender: TObject);
begin
// BringToFront;
end;

end.
