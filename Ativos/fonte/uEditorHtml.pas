unit uEditorHtml;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, StdCtrls, Buttons, ExtCtrls, MSHTML, Menus;

const
  IDM_MARCADOR = 2184;
  IDM_MARCADOR_LISTA = 2185;
  IDM_OUTDENT = 2187;
  IDM_INDENT = 2186;
  IDM_ALINHARESQ = 59;
  IDM_CENTRALIZAR = 57;
  IDM_JUSTIFICAR = 50;
  IDM_ALINHADIR = 60;
  IDM_IMAGEM = 2168;
  IDM_LINHAHORIZ = 2150;
  IDM_RECORTAR = 16;
  IDM_COPIAR = 15;
  IDM_COLAR = 26;
  IDM_HYPERLINK = 2124;
  IDM_DESFAZER = 43;  
  
type
	Tcadastrosbasicos_inserirtag_html = function(): string;
  Tcadastrosbasicos_inserircampo_html = function(pId: string): string;

  TFrmEditorHtml = class(TForm)
    Panel80: TPanel;
    Panel81: TPanel;
    btNegrito: TSpeedButton;
    btItalico: TSpeedButton;
    btSublinhado: TSpeedButton;
    btCor: TSpeedButton;
    Panel82: TPanel;
    btnNumList: TSpeedButton;
    btnBullet: TSpeedButton;
    btnDecreaseIndent: TSpeedButton;
    btnIncreaseIndent: TSpeedButton;
    Panel83: TPanel;
    btnAlignLeft: TSpeedButton;
    btnCenter: TSpeedButton;
    btnAlignRight: TSpeedButton;
    btnJustificar: TSpeedButton;
    Panel89: TPanel;
    btImageHiberlink: TSpeedButton;
    btnHR: TSpeedButton;
    Panel90: TPanel;
    Panel84: TPanel;
    Panel85: TPanel;
    btnCut: TSpeedButton;
    btnCopy: TSpeedButton;
    btnPaste: TSpeedButton;
    SpeedButton61: TSpeedButton;
    SpeedButton62: TSpeedButton;
    Label421: TLabel;
    combofont: TComboBox;
    Panel86: TPanel;
    Label422: TLabel;
    ComboSize: TComboBox;
    pnOpcoesHtml: TPanel;
    Panel114: TPanel;
    btOKHtml: TBitBtn;
    BtCancelHtml: TBitBtn;
    WebBrowser1: TWebBrowser;
    MainMenu1: TMainMenu;
    Arquivo: TMenuItem;
    Novo1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    cdColor: TColorDialog;
    Formatar1: TMenuItem;
    InserirTag: TMenuItem;
    btImagePc: TSpeedButton;
    InserirCampoConsultaSql: TMenuItem;
    procedure InserirCampoConsultaSqlClick(Sender: TObject);
    procedure btImagePcClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboSizeKeyPress(Sender: TObject; var Key: Char);
    procedure combofontKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InserirTagClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtCancelHtmlClick(Sender: TObject);
    procedure btOKHtmlClick(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure ComboSizeChange(Sender: TObject);
    procedure combofontChange(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure SpeedButton62Click(Sender: TObject);
    procedure btnPasteClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnCutClick(Sender: TObject);
    procedure btnHRClick(Sender: TObject);
    procedure btImageHiberlinkClick(Sender: TObject);
    procedure btnJustificarClick(Sender: TObject);
    procedure btnAlignRightClick(Sender: TObject);
    procedure btnCenterClick(Sender: TObject);
    procedure btnAlignLeftClick(Sender: TObject);
    procedure btnIncreaseIndentClick(Sender: TObject);
    procedure btnDecreaseIndentClick(Sender: TObject);
    procedure btnBulletClick(Sender: TObject);
    procedure btnNumListClick(Sender: TObject);
    procedure btCorClick(Sender: TObject);
    procedure btSublinhadoClick(Sender: TObject);
    procedure btItalicoClick(Sender: TObject);
    procedure btNegritoClick(Sender: TObject);
    procedure DocumentoEmBranco(WebBrowser: TWebBrowser);
  private
    { Private declarations }
  public
    { Public declarations }
    vIdConsSql: string;
    vHtml: string;
  end;

var
  FrmEditorHtml: TFrmEditorHtml;
  HTMLDocumento: IHTMLDocument2;

implementation

uses
  ActiveX, funcoes, udtmAtivo, uDadosIni, Clipbrd;

function _strImagetoBase64(FileName: WideString): WideString; stdcall; external 'MD5XE3.dll';  

{$R *.dfm}


function GetIEHandle(WebBrowser: TWebbrowser; ClassName: string): HWND;
var
  hwndChild, hwndTmp: HWND;
  oleCtrl: TOleControl;
  szClass: array [0..255] of char;
begin
  oleCtrl :=WebBrowser;
  hwndTmp := oleCtrl.Handle;
  while (true) do
  begin
    hwndChild := GetWindow(hwndTmp, GW_CHILD);
    GetClassName(hwndChild, szClass, SizeOf(szClass));
    if (string(szClass)=ClassName) then
    begin
      Result :=hwndChild;
      Exit;
    end;
    hwndTmp := hwndChild;
  end;
  Result := 0;
end;

procedure TFrmEditorHtml.Abrir1Click(Sender: TObject);
begin
	{se o Opendialog for executado e o kara selecionar um arquivo então navegaaaa webbrowser rsrsr.}
  if OpenDialog1.Execute=true then
	  webbrowser1.Navigate(OpenDialog1.FileName)
  else
  	abort;
end;

procedure TFrmEditorHtml.BtCancelHtmlClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TFrmEditorHtml.btnAlignLeftClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_ALINHARESQ, 0);
end;

procedure TFrmEditorHtml.btnAlignRightClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_ALINHADIR, 0);
end;

procedure TFrmEditorHtml.btnBulletClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_MARCADOR_LISTA, 0);
end;

procedure TFrmEditorHtml.btnCenterClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_CENTRALIZAR, 0);
end;

procedure TFrmEditorHtml.btnCopyClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_COPIAR, 0);
end;

procedure TFrmEditorHtml.btnCutClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_RECORTAR, 0);
end;

procedure TFrmEditorHtml.btnDecreaseIndentClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_OUTDENT, 0);
end;

procedure TFrmEditorHtml.btnHRClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_LINHAHORIZ, 0);
end;

procedure TFrmEditorHtml.btnIncreaseIndentClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_INDENT, 0);
end;

procedure TFrmEditorHtml.btnJustificarClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_JUSTIFICAR, 0);
end;

procedure TFrmEditorHtml.btnNumListClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_MARCADOR, 0);
end;

procedure TFrmEditorHtml.btnPasteClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_COLAR, 0);
end;

procedure TFrmEditorHtml.btOKHtmlClick(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
	try
    HTMLDocument := WebBrowser1.Document as IHTMLDocument2;
    vHtml := HTMLDocument.body.innerHTML;
    ModalResult := mrOk;
  finally
    vDadosIni._GravaConfiguracoesString(combofont.Name, combofont.Text);
    vDadosIni._GravaConfiguracoesString(ComboSize.Name, ComboSize.Text);
  end;
end;

procedure TFrmEditorHtml.combofontChange(Sender: TObject);
begin
	HTMLDocumento := WebBrowser1.Document as IHTMLDocument2;
  HTMLDocumento.execCommand('FontName', False,ComboFont.Text);
end;

procedure TFrmEditorHtml.combofontKeyPress(Sender: TObject; var Key: Char);
begin
	key := #0;
end;

procedure TFrmEditorHtml.ComboSizeChange(Sender: TObject);
begin
	//altera o tamanho da fonte
  HTMLDocumento := WebBrowser1.Document as IHTMLDocument2;
  if Combosize.ItemIndex = 0 then
    HTMLDocumento.execCommand('FontSize', False,1)
  else if Combosize.ItemIndex = 1 then
    HTMLDocumento.execCommand('FontSize', False,2)
  else if Combosize.ItemIndex = 2 then
    HTMLDocumento.execCommand('FontSize', False,3)
  else if Combosize.ItemIndex = 3 then
    HTMLDocumento.execCommand('FontSize', False,5)
  else if Combosize.ItemIndex = 4 then
    HTMLDocumento.execCommand('FontSize', False,6)
  else if Combosize.ItemIndex = 5 then
    HTMLDocumento.execCommand('FontSize', False,7)
end;

procedure TFrmEditorHtml.ComboSizeKeyPress(Sender: TObject; var Key: Char);
begin
	key := #0;
end;

procedure TFrmEditorHtml.DocumentoEmBranco(WebBrowser: TWebBrowser);
begin
	WebBrowser.Navigate('about:blank');
end;

procedure TFrmEditorHtml.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	vDadosIni.enterTela.DeleteExclusion(combofont);
  vDadosIni.enterTela.DeleteExclusion(ComboSize);    
end;

procedure TFrmEditorHtml.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  HTMLDocument: IHTMLDocument2;
begin
	HTMLDocument := WebBrowser1.Document as IHTMLDocument2;
  if vHtml <> HTMLDocument.body.innerHTML then
  begin
  	if Application.MessageBox('Deseja salvar as alterações?', 'Confirmação',
    	MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES then
    begin
      vHtml := HTMLDocument.body.innerHTML;
      ModalResult := mrOk;
    end;
  end;
end;

procedure TFrmEditorHtml.FormShow(Sender: TObject);
var
	ADoccument: Variant;
  vtemp: string;
  I: Integer;
  vFonte, vTamanho: string;
begin
	//Navega em uma página em Branco (About:Blank)
  DocumentoEmBranco(webbrowser1);

  {altera o modo design do webbrowse para ON, ou seja, toda página que abrirmos poderemos alterar, selecionar, excluir .. inserir ...}
  (WebBrowser1.Document as IHTMLDocument2).designMode := 'On';

  {Insere todas as fontes instalados no computador dentro do combobox}

  combofont.Items:=screen.Fonts;

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

	vFonte := vDadosIni._LerConfiguracoesRegistroString(combofont.Name);
  if vFonte = '' then	vFonte := 'arial';

  for I := 0 to combofont.Items.Count - 1 do
  	if LowerCase(trim(combofont.Items[I])) = LowerCase(trim(vFonte)) then
    begin
    	combofont.ItemIndex := I;
      Break;
    end;

  vTamanho := vDadosIni._LerConfiguracoesRegistroString(ComboSize.Name);
  if vTamanho = '' then	vTamanho := 'normal';
    
  for I := 0 to ComboSize.Items.Count - 1 do
  	if LowerCase(trim(ComboSize.Items[I])) = LowerCase(trim(vTamanho)) then
    begin
    	ComboSize.ItemIndex := I;
      Break;
    end;

  vDadosIni.enterTela.AddExclusion(combofont);
  vDadosIni.enterTela.AddExclusion(ComboSize);

  if WebBrowser1.CanFocus then
  	WebBrowser1.SetFocus;
end;

procedure TFrmEditorHtml.InserirCampoConsultaSqlClick(Sender: TObject);
var
	ACampoHtml: THandle;
  AProcedure: Tcadastrosbasicos_inserircampo_html;
begin
	if ACampoHtml = 0 then
    CarregaPacote('pkCadastrosBasicos', ACampoHtml);

  if ACampoHtml = 0 then
  begin
    Application.MessageBox('Pacote Cadastros Básicos não carregado', 'Anteção', 0 + 64);
    Exit;
  end;
  @AProcedure := GetProcAddress(ACampoHtml, 'cadastrosbasicos_inserircampo_html');
  if Assigned(AProcedure) then
  begin
  	Clipboard.AsText := AProcedure(vIdConsSql);
   	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_COLAR, 0);
  end;
end;

procedure TFrmEditorHtml.InserirTagClick(Sender: TObject);
var
	ATagHtml: THandle;
  AProcedure: Tcadastrosbasicos_inserirtag_html;
begin
	if ATagHtml = 0 then
    CarregaPacote('pkCadastrosBasicos', ATagHtml);

  if ATagHtml = 0 then
  begin
    Application.MessageBox('Pacote Cadastros Básicos não carregado', 'Anteção', 0 + 64);
    Exit;
  end;
  @AProcedure := GetProcAddress(ATagHtml, 'cadastrosbasicos_inserirtag_html');
  if Assigned(AProcedure) then
  begin
  	Clipboard.AsText := AProcedure();
   	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_COLAR, 0);
  end;
end;

procedure TFrmEditorHtml.Novo1Click(Sender: TObject);
begin
	DocumentoEmBranco(webbrowser1);
end;

procedure TFrmEditorHtml.Salvar1Click(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
  PersistFile: IPersistFile;
begin
  HTMLDocument := WebBrowser1.Document as IHTMLDocument2;
  if SaveDialog1.Execute=true then
  begin
    PersistFile := HTMLDocument as IPersistFile;
    PersistFile.Save(StringToOleStr(savedialog1.FileName), System.True);
  end
  else
  begin
  	abort;
  end;
end;

procedure TFrmEditorHtml.btImagePcClick(Sender: TObject);
var
	vMD5: string;
	vBase64: string;
  vTemp: string;
  vExtensao: string;
  vHtml: string;
  HTMLDocument: IHTMLDocument2;
  ADoccument: Variant;
begin
	OpenDialog1.Filter :=
      'Todos os arquivos (*.jpg;*.jpeg;*.bmp;)|' +
      '*.jpg;*.jpeg;*.bmp;|'+
      'Arquivo de Imagem JPEG (*.jpg)|'+
      '*.jpg|'+
      'Arquivo de Imagem JPEG (*.jpeg)|'+
      '*.jpeg|'+
      'Arquivo de Imagem Bitmaps (*.bmp)|'+
      '*.bmp';
	if OpenDialog1.Execute=true then
  begin
  	vExtensao := ExtractFileExt(OpenDialog1.FileName);
    System.Delete(vExtensao, 1, 1);

  	vBase64 := _strImagetoBase64(OpenDialog1.FileName);
    vMD5    := vDadosIni.Sign_RSA_MD5_SomenteTexto(vBase64);

    Clipboard.AsText := '[imagetemp]';
    SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_COLAR, 0);

    HTMLDocument := WebBrowser1.Document as IHTMLDocument2;
    vHtml := HTMLDocument.body.innerHTML;

    vHtml := StringReplace(vHtml, '[imagetemp]', '<img src="data:image/' + vExtensao + ';base64,' +
    	vBase64 + '">', [rfReplaceAll]);

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
  end;
end;

procedure TFrmEditorHtml.btNegritoClick(Sender: TObject);
begin
	HTMLDocumento := WebBrowser1.Document as IHTMLDocument2;
  HTMLDocumento.execCommand('Bold', False,0);
end;

procedure TFrmEditorHtml.btItalicoClick(Sender: TObject);
begin
	HTMLDocumento := WebBrowser1.Document as IHTMLDocument2;
  HTMLDocumento.execCommand('Italic', False,0);
end;

procedure TFrmEditorHtml.btSublinhadoClick(Sender: TObject);
begin
	HTMLDocumento := WebBrowser1.Document as IHTMLDocument2;
  HTMLDocumento.execCommand('Underline', False,0);
end;

procedure TFrmEditorHtml.btCorClick(Sender: TObject);
begin
	HTMLDocumento := WebBrowser1.Document as IHTMLDocument2;
  if cdColor.Execute then
    HTMLDocumento.execCommand('ForeColor', False, cdColor.Color)
  else
    abort;
end;

procedure TFrmEditorHtml.btImageHiberlinkClick(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_IMAGEM, 0);
end;

procedure TFrmEditorHtml.SpeedButton61Click(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_HYPERLINK,0);
end;

procedure TFrmEditorHtml.SpeedButton62Click(Sender: TObject);
begin
	SendMessage(GetIEHandle(webbrowser1, 'Internet Explorer_Server'), WM_COMMAND,IDM_DESFAZER,0);
end;

end.
