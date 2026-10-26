unit uGerarChaveNFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Menus, Vcl.Buttons;

type
  TfrmGerarChaveNFe = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbUF: TLabel;
    lbCNPJ: TLabel;
    Label11: TLabel;
    edNumNF: TEdit;
    edSerie: TEdit;
    edCodigo: TEdit;
    edTpEmiss: TEdit;
    edChave: TEdit;
    edDataEmi: TMaskEdit;
    PopupMenu1: TPopupMenu;
    Copiar1: TMenuItem;
    BitBtn1: TBitBtn;
    Label8: TLabel;
    lbMod: TLabel;
    procedure lbUFDblClick(Sender: TObject);
    procedure lbCNPJDblClick(Sender: TObject);
    procedure edDataEmiExit(Sender: TObject);
    procedure edNumNFExit(Sender: TObject);
    procedure edSerieExit(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure edTpEmissExit(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNumNFKeyPress(Sender: TObject; var Key: Char);
    procedure edChaveDblClick(Sender: TObject);
    procedure lbModDblClick(Sender: TObject);
  private
    { Private declarations }
    FUF: Integer;
    FCNPJ: string;
    FcNF: Integer;
    Fmod: Integer;
    FcSerie: Integer;
    FnNF: Integer;
    FtpEmiss: Integer;
    FDataEmi: string;

    procedure GeraChave;
  public
    { Public declarations }
    property UF: Integer read FUF write FUF;
    property CNPJ: string read FCNPJ write FCNPJ;
    property cNF: Integer read FcNF write FcNF;
    property cSerie: Integer read FcSerie write FcSerie;
    property nNF: Integer read FnNF write FnNF;
    property tpEmiss: Integer read FtpEmiss write FtpEmiss;
    property DataEmi: string read FDataEmi write FDataEmi;
  end;

var
  frmGerarChaveNFe: TfrmGerarChaveNFe;

implementation

uses
  UFuncoesDll, uDataSet_OOP_DX, Vcl.Clipbrd;

{$R *.dfm}

procedure TfrmGerarChaveNFe.edNumNFExit(Sender: TObject);
begin
  if (string(edNumNF.Text).Trim.IsEmpty) then
  begin
    Application.MessageBox('Número da Nota Fiscal inválido', 'Atenção', 0 + 64);
    edNumNF.SetFocus;
    Exit;
  end;
  FnNF := string(edNumNF.Text).Trim.ToInteger();
  GeraChave;
end;

procedure TfrmGerarChaveNFe.edNumNFKeyPress(Sender: TObject; var Key: Char);
begin
//  if not ( Key in [0..9] ) then
//    Key := #0;
end;

procedure TfrmGerarChaveNFe.edSerieExit(Sender: TObject);
begin
  if (string(edSerie.Text).Trim.IsEmpty) then
  begin
    Application.MessageBox('Série da Nota Fiscal inválida', 'Atenção', 0 + 64);
    edSerie.SetFocus;
    Exit;
  end;
  FcSerie := string(edSerie.Text).Trim.ToInteger();
  GeraChave;
end;

procedure TfrmGerarChaveNFe.edTpEmissExit(Sender: TObject);
begin
  if (string(edTpEmiss.Text).Trim.IsEmpty) then
  begin
    Application.MessageBox('Tipo de Emissão Nota Fiscal inválido', 'Atenção', 0 + 64);
    edTpEmiss.SetFocus;
    Exit;
  end;
  FtpEmiss := string(edTpEmiss.Text).Trim.ToInteger();
  GeraChave;
end;

procedure TfrmGerarChaveNFe.FormShow(Sender: TObject);
begin
  lbUF.Caption := FUF.ToString;
  lbCNPJ.Caption := FCNPJ.Trim;
  edDataEmi.Text := FDataEmi;
  edNumNF.Text := FnNF.ToString;
  edSerie.Text := FcSerie.ToString;
  edCodigo.Text := FcNF.ToString;
  edTpEmiss.Text := FtpEmiss.ToString;
  lbMod.Caption := '55';
  Fmod := 55;
  GeraChave;
end;

procedure TfrmGerarChaveNFe.GeraChave;
begin
  edChave.Text := GeraChaveNFe(FUF, FcNF, Fmod, FcSerie, FnNF, FtpEmiss, DataEmi, FCNPJ);;
end;

procedure TfrmGerarChaveNFe.lbCNPJDblClick(Sender: TObject);
var
  ACNPJ: string;
  AValidardor: TDataSet_OOP_DX;
begin
  ACNPJ := FCNPJ;
  if not InputQuery('CNPJ Emitente', 'Informe o CNPJ do emitente:', ACNPJ) then
    Exit;

  if not AValidardor.cgc(ACNPJ) then
  begin
    Application.MessageBox('CNPJ inválido', 'Atenção', 0 + 64);
    Exit;
  end;

  FCNPJ := ACNPJ;
  lbCNPJ.Caption := FCNPJ.Trim;
  GeraChave;
end;

procedure TfrmGerarChaveNFe.lbModDblClick(Sender: TObject);
var
  Amod: string;
  Imod: Integer;
  AValidardor: TDataSet_OOP_DX;
begin
  Amod := IntToStr(Fmod);
  if not InputQuery('Modelo DFe', 'Informe o Modelo DFe:', Amod) then
    Exit;

  if not TryStrToInt(Amod, Imod) then
    Exit;

  if (Imod < 1) or (Imod > 99) then
    Exit;

  lbMod.Caption := IntToStr(Imod).PadLeft(2, '0');
  Fmod := Imod;
  GeraChave;
end;

procedure TfrmGerarChaveNFe.lbUFDblClick(Sender: TObject);
var
  AUFStr: string;
  AInteger, AVal: Integer;
const
  UFIBGE: array of Integer = [11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 32, 33, 35, 41, 42, 43, 50, 51, 52, 53];
begin
  AUFStr := IntToStr(FUF);
  if not InputQuery('UF IBGE', 'Informe o código da UF IBGE:', AUFStr) then
    Exit;

  if not TryStrToInt(AUFStr, AInteger) then
  begin
    Application.MessageBox('UF IBGE inválida', 'Atenção', 0 + 64);
    Exit;
  end
  else
    for AVal in UFIBGE do
      if AInteger = AVal then
      begin
        FUF := AInteger;
        lbUF.Caption := FUF.ToString;
        GeraChave;
        Exit;
      end;

  Application.MessageBox('UF IBGE inválida', 'Atenção', 0 + 64);
end;

procedure TfrmGerarChaveNFe.Copiar1Click(Sender: TObject);
begin
  Clipboard.AsText := edChave.Text;
end;

procedure TfrmGerarChaveNFe.edChaveDblClick(Sender: TObject);
begin
  edChave.SelectAll;
  PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmGerarChaveNFe.edCodigoExit(Sender: TObject);
begin
  if (string(edCodigo.Text).Trim.IsEmpty) then
  begin
    Application.MessageBox('Código da Nota Fiscal inválido', 'Atenção', 0 + 64);
    edCodigo.SetFocus;
    Exit;
  end;
  FcNF := string(edCodigo.Text).Trim.ToInteger();
  GeraChave;
end;

procedure TfrmGerarChaveNFe.edDataEmiExit(Sender: TObject);
begin
  FDataEmi := edDataEmi.Text;
  GeraChave;
end;

end.
