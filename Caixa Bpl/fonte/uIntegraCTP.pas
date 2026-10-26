unit uIntegraCTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmIntegraCTP = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIntegraCTP: TfrmIntegraCTP;

implementation

uses
  uDtmAtivo, uClassesContasAPagar, uDadosIni;

{$R *.dfm}

procedure TfrmIntegraCTP.FormShow(Sender: TObject);
var
  vCtp: TContasAPagar;
begin
  if Pos('FOPAG|', vDadosIni.vPesquisa) > 0 then
  begin
    vCtp := TContasAPagar.create;
    vCtp.dataSet := vDadosIni.vDtSetTmp;
    vCtp.buscas := vDadosIni.vQueryTmp;
    vCtp.transacao := vDadosIni.vTransactionTmp;

    vCtp.Post;
    vCtp.Free;
    vCtp := nil;
    PostMessage(Self.Handle, WM_CLOSE, 0, 0);
  end;
end;

initialization
  RegisterClass(TfrmIntegraCTP);
finalization
  UnRegisterClass(TfrmIntegraCTP);

end.
