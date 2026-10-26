unit uPrincipalMD5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    function md5Arquivo(pNomeArquivo: string):string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses MD5;

{$R *.dfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text := md5Arquivo(OpenDialog1.FileName);
end;

function TForm1.md5Arquivo(pNomeArquivo: string): string;
begin
  Result := MD5Print(MD5File(pNomeArquivo));
end;

end.
