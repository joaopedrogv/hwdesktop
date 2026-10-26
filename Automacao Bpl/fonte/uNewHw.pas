unit uNewHw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, OleCtrls, SHDocVw, StdCtrls, Buttons, ExtCtrls;

type
  TfrmNews = class(TfrmPadrao)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNews: TfrmNews;

implementation

uses
  uDtmAtivo, IBQuery;

function _naoMostrarEstaNewsNovamente(pUsuario: PChar; pBancoHw: PChar): Boolean; stdcall; external 'cons40.dll';

{$R *.dfm}

procedure TfrmNews.BitBtn1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    _naoMostrarEstaNewsNovamente(pchar(vDadosIni.vNomeUsuario), pchar(vDadosIni.vBancoHW));
    vDadosIni.hw_registra_estatistica(Self.Name + '.Inibir');
  end;
  ModalResult := IDCANCEL;
end;

procedure TfrmNews.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmNews := nil;
end;

procedure TfrmNews.FormShow(Sender: TObject);
var
  vQuery: TIBQuery;
begin
  inherited;
  try
    vQuery := TIBQuery(dtmAtivo.IbBuscas);
    WebBrowser1.Navigate( vDadosIni.getConfSisStr('hw_url_servicos', vQuery) + '/newshw.aspx');
  except
    Application.MessageBox('Erro ao mostrar New''s da Hw Sistemas. Favor consultar no menu Ajuta', 'Atenção', 0 + 64);
  end;
end;

end.
