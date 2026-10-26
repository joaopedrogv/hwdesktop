unit uVisualizarHtml;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, OleCtrls, SHDocVw, StdCtrls, Buttons, ExtCtrls, MSHTML;

type
  TfrmVisualizarHtml = class(TForm)
    pnOpcoesHtml: TPanel;
    Panel114: TPanel;
    btOKHtml: TBitBtn;
    BtCancelHtml: TBitBtn;
    WebBrowser1: TWebBrowser;
    BtSairHtml: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtSairHtmlClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtCancelHtmlClick(Sender: TObject);
    procedure btOKHtmlClick(Sender: TObject);
    procedure DocumentoEmBranco(WebBrowser: TWebBrowser);
  private
    { Private declarations }
  public
    { Public declarations }
    vHtml: string;
  end;

var
  frmVisualizarHtml: TfrmVisualizarHtml;

implementation

uses uDadosIni, uDtmAtivo;

{$R *.dfm}

procedure TfrmVisualizarHtml.BtSairHtmlClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TfrmVisualizarHtml.BtCancelHtmlClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TfrmVisualizarHtml.btOKHtmlClick(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
  HTMLDocument := WebBrowser1.Document as IHTMLDocument2;
  vHtml := HTMLDocument.body.innerHTML;
  ModalResult := mrOk;
end;

procedure TfrmVisualizarHtml.DocumentoEmBranco(WebBrowser: TWebBrowser);
begin
	WebBrowser.Navigate('about:blank');
end;

procedure TfrmVisualizarHtml.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin         
	if Key = VK_ESCAPE then
  	BtSairHtmlClick(Sender);
end;

procedure TfrmVisualizarHtml.FormShow(Sender: TObject);
var
	ADoccument: Variant;
  vtemp: string;
  I: Integer;
  vFonte, vTamanho: string;
begin
	//Navega em uma página em Branco (About:Blank)
  DocumentoEmBranco(webbrowser1);

  {altera o modo design do webbrowse para ON, ou seja, toda página que abrirmos poderemos alterar, selecionar, excluir .. inserir ...}
//  (WebBrowser1.Document as IHTMLDocument2).designMode := 'On';
	(WebBrowser1.Document as IHTMLDocument2).designMode := 'Off';

  {Insere todas as fontes instalados no computador dentro do combobox}

  {verifique o nome correto do combobox que receberá as fontes.}

  vtemp := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">' +
     '<HTML><HEAD>' +
     '<META http-equiv=Content-Type content="text/html; charset=unicode">' +
     '<META content="MSHTML 6.00.2900.5512" name=GENERATOR></HEAD>' +
     '<BODY>' + vHtml +
     '</BODY></HTML>';

  ADoccument := WebBrowser1.Document;
  ADoccument.Clear;
  ADoccument.Write(vtemp);
  ADoccument.Close;

  if WebBrowser1.CanFocus then
  	WebBrowser1.SetFocus;
end;

end.
