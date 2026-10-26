unit uFotosProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UClassesProdutos, uDtmAtivo, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmFotosProdutos = class(TForm)
    GroupBox1: TGroupBox;
    Label201: TLabel;
    Label202: TLabel;
    Label203: TLabel;
    Label216: TLabel;
    Label218: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    pnImagemProduto: TPanel;
    buscas: TIBQuery;
    Panel1: TPanel;
    Panel55: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    SpeedButton52: TSpeedButton;
    SpeedButton49: TSpeedButton;
    SpeedButton51: TSpeedButton;
    lbS_qtdeImgProd: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    BitBtn19: TBitBtn;
    Label8: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton52Click(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure SpeedButton49Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFotosProdutos: TfrmFotosProdutos;
  vImagens: TImagemsProd;

implementation

uses DateUtils, uDadosIni;

function montarArquivosBuscaPreco(pBanco: PChar; pCodEmpresa: PChar; pProgressMessage: LongBool): LongBool; stdcall; external 'CompativelHW.dll';
procedure viewImage(Source: PChar); stdcall; external 'graphicHw.dll';

{$R *.dfm}

procedure TfrmFotosProdutos.BitBtn19Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFotosProdutos.FormCreate(Sender: TObject);
begin
  vImagens := TImagemsProd.create;
end;

procedure TfrmFotosProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BitBtn19Click(Sender)
  else if Key = VK_F10 then
    SpeedButton52click(Sender);
end;

procedure TfrmFotosProdutos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case ord(Key) of
    VK_Left : SpeedButton51click(Sender);
    VK_Right : SpeedButton49click(Sender);
  end;
  Key := 0; 
end;

procedure TfrmFotosProdutos.FormShow(Sender: TObject);
var
  vListaImagens: string;
  vListaUrl: string;
begin
  buscas.Close;
  buscas.SQL.Text := ' select prec_tab_prod, prec_publico, lista_imagens, null url_imagens from produtos ' +
    ' where grupo_prod = :grupo_prod ' +
    ' and cod_prod = :cod_prod ' +
    ' and cod_empresa = :cod_empresa ';
  buscas.ParamByName('grupo_prod').AsString := Label2.Caption;
  buscas.ParamByName('cod_prod').AsString := Label3.Caption;
  buscas.ParamByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  buscas.Open;

  if (StrToFloat(Label5.Caption) <= 0) then
	 Label5.Caption := Format('%8.2n', [buscas.FieldByName('prec_tab_prod').AsFloat]);
  if (StrToFloat(Label6.Caption) <= 0) then
    Label6.Caption := Format('%8.2n', [buscas.FieldByName('prec_publico').AsFloat]);

  vDadosIni.retornaImagens(
  	buscas,
    StrToInt(Label2.Caption),
    Label3.Caption,
    vListaImagens,
    vListaUrl);

  vImagens.SetPathPadraoImagens(vDadosIni.getConfSisStr('prod_cad_diretorio_padrao_imagens', buscas));
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'LISTA_IMAGENS' then
	vImagens.SetListImg(Trim(vListaImagens), Trim(vListaUrl));
  if vImagens.img.Count > 0 then
  begin
    Image1.Picture := vImagens.img.First.miniatura.Picture;
	  Image1.Hint    := vImagens.img.ItemSelected.fileNameImagem;
  end;
  lbS_qtdeImgProd.Caption := IntToStr(vImagens.img.ItemIndex + 1) + '/' + IntToStr(vImagens.img.Count);
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmFotosProdutos.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFotosProdutos.SpeedButton49Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if vImagens.img.Count > 0 then
      if (vImagens.img.ItemIndex + 1 = vImagens.img.Count) then
      begin
        Application.MessageBox(PChar('Fim da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        exit;
      end;

    if vImagens.img.Count > 0 then
    begin
      Image1.Picture := vImagens.img.Next.miniatura.Picture;
      Image1.Hint    := vImagens.img.ItemSelected.fileNameImagem;
    end;
    lbS_qtdeImgProd.Caption := IntToStr(vImagens.img.ItemIndex + 1) + '/' + IntToStr(vImagens.img.Count);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmFotosProdutos.SpeedButton51Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if vImagens.img.Count > 0 then
      if (vImagens.img.ItemIndex + 1 <= 1) then
      begin
        Application.MessageBox(PChar('Início da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        exit;
      end;

    if vImagens.img.Count > 0 then
    begin
      Image1.Picture := vImagens.img.Previous.miniatura.Picture;
      Image1.Hint    := vImagens.img.ItemSelected.fileNameImagem;
    end;
    lbS_qtdeImgProd.Caption := IntToStr(vImagens.img.ItemIndex + 1) + '/' + IntToStr(vImagens.img.Count);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmFotosProdutos.SpeedButton52Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if vImagens.img.Count <= 0 then
    	Exit;

    if not FileExists(vImagens.img.ItemSelected.fileNameImagemToZoom) then
    begin
      Application.MessageBox(PChar('Imagem não encontrada: ' + #13 + #13 +
        vImagens.img.ItemSelected.fileNameImagemToZoom),
        'Atenção', 0 + 64);
      exit;
    end
    else
      viewImage(PChar(vImagens.img.ItemSelected.fileNameImagemToZoom));
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
