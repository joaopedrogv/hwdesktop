unit uSuporteOnline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, uPadrao;

type
  TfrmSuporteOnline = class(TfrmPadrao)
    WebBrowser1: TWebBrowser;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSuporteOnline: TfrmSuporteOnline;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TfrmSuporteOnline.FormActivate(Sender: TObject);
begin
  AlphaBlend := False;
  AlphaBlendValue := 255;
end;

procedure TfrmSuporteOnline.FormDeactivate(Sender: TObject);
begin
  AlphaBlend := True;
  AlphaBlendValue := 100;
end;

procedure TfrmSuporteOnline.FormShow(Sender: TObject);
begin
//  WebBrowser1.Navigate('http://hwsistemas.mysuite1.com.br/empresas/hwt/verifica.php');
//  WebBrowser1.Navigate('http://hwsistemas.mysuite1.com.br/empresas/hwt/atendimento.php?inf=');
  if Trim(vDadosIni.vEmp.vUrlSuporteOnLine) = '' then
    WebBrowser1.Navigate('http://hwsistemas.mysuite1.com.br/central.php')
  else
    WebBrowser1.Navigate(vDadosIni.vEmp.vUrlSuporteOnLine);
end;

end.
