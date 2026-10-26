unit URecuperaXML;

interface

uses UrlMon, JvGIF, MSHtml, ACBrUtil, pcnAuxiliar,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, Buttons,WinInet,comobj;

type
  TFrmRecuperaXML = class(TForm)
    WebBrowser1: TWebBrowser;
    btnPegarHTML: TButton;
    edtCaptcha: TEdit;
    Image1: TImage;
    edtChaveNFe: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    Memo2: TMemo;
    btnNovaConsulta: TButton;
    lblStatus: TLabel;
    btnGerarXML: TButton;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnPegarHTMLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure WebBrowser1ProgressChange(Sender: TObject; Progress,
      ProgressMax: Integer);
    procedure btnNovaConsultaClick(Sender: TObject);
    procedure btnGerarXMLClick(Sender: TObject);
    function DownloadArquivo(const Origem, Destino: String): Boolean;
  private
    { Private declarations }
    function DownloadFile(SourceFile, DestFile: string): Boolean;
    function StripHTML(S: string): string;
  public
    { Public declarations }
    vendXML: string;
    vchave: string;
  end;

var
  FrmRecuperaXML: TFrmRecuperaXML;

implementation

uses ACBrNFeUtil, ACBrHTMLtoXML;

{$R *.dfm}
function TFrmRecuperaXML.DownloadFile(SourceFile, DestFile: string): Boolean;
begin
  try
    Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0,
      nil) = 0;
  except
    Result := False;
  end;
end;

function TFrmRecuperaXML.StripHTML(S: string): string;
var
  TagBegin, TagEnd, TagLength: integer;
begin
  TagBegin := Pos( '<', S);      // search position of first <

  while (TagBegin > 0) do begin  // while there is a < in S
    TagEnd := Pos('>', S);              // find the matching >
    TagLength := TagEnd - TagBegin + 1;
    Delete(S, TagBegin, TagLength);     // delete the tag
    TagBegin:= Pos( '<', S);            // search for next <
  end;

  Result := S;                   // give the result
end;

function TFrmRecuperaXML.DownloadArquivo(const Origem, Destino: String): Boolean;
const BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: File;
  sAppName: string;
begin
 Result   := False;
 sAppName := ExtractFileName(Application.ExeName);
 hSession := InternetOpen(PChar(sAppName),
                INTERNET_OPEN_TYPE_PRECONFIG,
               nil, nil, 0);
 try
  hURL := InternetOpenURL(hSession,
            PChar(Origem),
            nil,0,0,0);
  try
   AssignFile(f, Destino);
   Rewrite(f,1);
   repeat
    InternetReadFile(hURL, @Buffer,
                     SizeOf(Buffer), BufferLen);
    BlockWrite(f, Buffer, BufferLen)
   until BufferLen = 0;
   CloseFile(f);
   Result:=True;
  finally
   InternetCloseHandle(hURL)
  end
 finally
  InternetCloseHandle(hSession)
 end
end;

procedure TFrmRecuperaXML.btnPegarHTMLClick(Sender: TObject);
begin
  edtChaveNFe.Text := OnlyNumber(edtChaveNFe.Text);

  if not ValidarChave('NFe'+edtChaveNFe.Text) then
   begin
     MessageDlg('Chave Inválida.',mtError,[mbok],0);
     edtChaveNFe.SetFocus;
     exit;
   end;

  if trim(edtCaptcha.Text) = '' then
   begin
     MessageDlg('Digite o valor da imagem.',mtError,[mbok],0);
     edtCaptcha.SetFocus;
     exit;
   end;

  Memo2.Lines.Clear;

  btnPegarHTML.Enabled    := False;
  btnNovaConsulta.Enabled := False;
  btnGerarXML.Enabled     := False;
  try
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$txtChaveAcessoCompleta', 0).value := edtChaveNFe.Text;
     //WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder3$chaveAcesso', 0).value := edtChaveNFe.Text;
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$txtCaptcha', 0).value := edtCaptcha.Text;
    // WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder3$intercepta', 0).value := edtCaptcha.Text;
    WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$btnConsultar', 0).click;
//     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder3$btcontinuar', 0).click;
//     vendXML:=GerarXML(Memo2.Lines.Text);
//     WBXML.Navigate(vendXML);
  except
     btnNovaConsulta.Enabled := True;
     raise;
  end;
end;

procedure TFrmRecuperaXML.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  WebBrowser1.Free;
end;

procedure TFrmRecuperaXML.FormCreate(Sender: TObject);
begin

//                       'https://www.nfe.fazenda.gov.br/portal/FormularioDePesquisa.aspx?tipoconsulta=completa'
end;

procedure TFrmRecuperaXML.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=');
//  'https://www.nfe.fazenda.gov.br/portal/FormularioDePesquisa.aspx?tipoconsulta=completa');
  edtChaveNFe.Text:=vchave;
end;

procedure TFrmRecuperaXML.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  k, i: Integer;
  Source, dest: string;
  textoNFe : IHTMLDocument2;
begin
  Application.ProcessMessages;
  if WebBrowser1.LocationURL ='http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=' then
//  'https://www.nfe.fazenda.gov.br/portal/FormularioDePesquisa.aspx?tipoconsulta=completa' then
   begin
     for k := 0 to WebBrowser1.OleObject.Document.Images.Length - 1 do
      begin
        Source := WebBrowser1.OleObject.Document.Images.Item(k).Src;
        if (Source = 'http://www.nfe.fazenda.gov.br/scripts/srf/intercepta/captcha.aspx?opt=image') then
         begin
           dest := ExtractFilePath(ParamStr(0)) + 'captcha.gif';
           DownloadArquivo(source,dest);
//           DownloadFile(Source, dest);
         end;
      end;
     Image1.Picture.LoadFromFile(dest);
     btnPegarHTML.Enabled := True;
   end
   else if WebBrowser1.LocationURL ='http://www.nfe.fazenda.gov.br/portal/consultaCompleta.aspx?tipoConteudo=XbSeqxE8pl8=' then
//  'https://www.nfe.fazenda.gov.br/portal/visualizacaoNFe/completa/Default.aspx' then
   begin
      WebBrowser1.Navigate('http://www.nfe.fazenda.gov.br/portal/consultaImpressao.aspx?tipoConsulta=completa');
//      'http://www.nfe.fazenda.gov.br/PORTAL/visualizacaoNFe/completa/impressao.aspx');
   end
  else if WebBrowser1.LocationURL =  'http://www.nfe.fazenda.gov.br/portal/consultaImpressao.aspx?tipoConsulta=completa' then
  //'https://www.nfe.fazenda.gov.br/PORTAL/visualizacaoNFe/completa/impressao.aspx' then
   begin
      textoNFe := WebBrowser1.Document as IHTMLDocument2;
      repeat
         Application.ProcessMessages;
      until Assigned(textoNFe.body);
      Memo2.Lines.Text := StripHTML(textoNFe.body.innerHTML);
      Memo2.Lines.Text := StringReplace(Memo2.Lines.Text,'&nbsp;','',[rfReplaceAll, rfIgnoreCase]);

      i:= 0;
      while i < memo2.Lines.Count-1 do
       begin
         if trim(Memo2.Lines[i]) = '' then
          begin
            Memo2.Lines.Delete(i);
            i := i - 1;
          end;
         i := i + 1;
       end;
     Image1.Picture := nil;
     btnGerarXML.Enabled := True;
     btnNovaConsulta.Enabled := True;
   end
  else if WebBrowser1.LocationURL = 'http://www.nfe.fazenda.gov.br/portal/inexistente_completa.aspx' then
   begin
     MessageDlg('NF-e INEXISTENTE na base nacional, favor consultar esta NF-e no site da SEFAZ de origem.',mtError,[mbok],0);
     Image1.Picture := nil;
     btnGerarXML.Enabled := True;
     btnNovaConsulta.Enabled := True;
   end
  else
   begin
   begin
     MessageDlg('Erro carregando URL: '+WebBrowser1.LocationURL,mtError,[mbok],0);
     Image1.Picture := nil;
     btnGerarXML.Enabled := True;
     btnNovaConsulta.Enabled := True;
   end
   end;
end;

procedure TFrmRecuperaXML.WebBrowser1ProgressChange(Sender: TObject; Progress,
  ProgressMax: Integer);
begin
 if ProgressMax = 0 then
  begin
    ProgressBar1.Visible := False;
    lblStatus.Visible := False;
    exit;
  end
 else
  begin
    ProgressBar1.Visible := True;
    lblStatus.Visible := True;
    try
       ProgressBar1.Max := ProgressMax;
       if (Progress <> -1) and (Progress <= ProgressMax) then
          ProgressBar1.Position := Progress
       else
        begin
          ProgressBar1.Visible := False;
          lblStatus.Visible := False;
        end;
    except
       on EDivByZero do
         exit;
    end;
  end;
end;

procedure TFrmRecuperaXML.btnNovaConsultaClick(Sender: TObject);
begin
  btnNovaConsulta.Enabled := False;
  btnGerarXML.Enabled := False;
  Memo2.Lines.Clear;

  WebBrowser1.Navigate('http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=');
  //https://www.nfe.fazenda.gov.br/portal/FormularioDePesquisa.aspx?tipoconsulta=completa');
end;

procedure TFrmRecuperaXML.BitBtn1Click(Sender: TObject);
begin
 WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$btnDownload', 0).click;
end;

procedure TFrmRecuperaXML.btnGerarXMLClick(Sender: TObject);
begin
  vendXML:=GerarXML(Memo2.Lines.Text);
//  WBXML.Navigate(vendXML);
  Close;
end;

end.


