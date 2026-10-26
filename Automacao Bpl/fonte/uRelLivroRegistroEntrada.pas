unit uRelLivroRegistroEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, QRCtrls,
  QuickRpt, UClassesPedVenda;

type
  TfrmRelLivroRegistroEntrada = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel19: TQRLabel;
    QRBand1: TQRBand;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    QRLabel21: TQRLabel;
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    obRelLivro: TLivroRegistroDeEntrada;
    vseq: integer;
  public
    { Public declarations }
  end;

var
  frmRelLivroRegistroEntrada: TfrmRelLivroRegistroEntrada;

implementation

uses uDtmPedVenda, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TfrmRelLivroRegistroEntrada.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    MaskEdit1.Enabled := False;
    MaskEdit2.Enabled := False;
    ComboBox1.Enabled := False;
    Edit1.Enabled := False;
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;
    BitBtn3.Enabled := True;
    if obRelLivro.abrirRelatorioLivroRegistroEntrada(MaskEdit1.Text, MaskEdit2.Text, ComboBox1.Text,
      Edit1.Text) then
    begin
      vseq := StrToInt(Edit1.Text);
      BorderIcons:=[biMinimize,biMaximize];
      QuickRep1.Preview;
      Close;
    end;
  finally
    BorderIcons:=[biSystemMenu,biMinimize,biMaximize];
    MaskEdit1.Enabled := true;
    MaskEdit2.Enabled := true;
    ComboBox1.Enabled := true;
    Edit1.Enabled := true;
    BitBtn1.Enabled := True;
    BitBtn2.Enabled := True;
    BitBtn3.Enabled := False;
  end;
end;

procedure TfrmRelLivroRegistroEntrada.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelLivroRegistroEntrada.BitBtn3Click(Sender: TObject);
begin
  inherited;
  obRelLivro.vParar := 1;
end;

procedure TfrmRelLivroRegistroEntrada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obRelLivro.Free;
  obRelLivro := nil;
  Action := caFree;
  frmRelLivroRegistroEntrada := nil;
end;

procedure TfrmRelLivroRegistroEntrada.FormShow(Sender: TObject);
begin
  inherited;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  PageControl1.ActivePage := TabSheet1;
  obRelLivro := TLivroRegistroDeEntrada.create;
  if (Self.Enabled) and (Self.Visible) and (maskedit1.CanFocus) then
  	maskedit1.setfocus;
end;

procedure TfrmRelLivroRegistroEntrada.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (obRelLivro.buscas.FieldByName('NUM_NF').asinteger <> 0) or (obRelLivro.buscas.FieldByName('NUM_NFEEXT').asinteger <> 0) then
  begin  
    QRLabel13.caption := vDadosIni.strzero(obRelLivro.buscas.FieldByName('SEQ_FECH').AsInteger, 5);
    if obRelLivro.buscas.FieldByName('NUM_NFEEXT').asinteger <> 0 then
    begin
      QRLabel14.caption := obRelLivro.buscas.FieldByName('DATA_NFEXT').asstring;
      QRLabel15.caption := 'NF: ' +
      vDadosIni.strzero(obRelLivro.buscas.FieldByName('NUM_NFEEXT').AsString, 11);
      QRLabel20.caption := format('%n', [obRelLivro.buscas.FieldByName('VALOR_NFEXT').AsCurrency]);
    end
    else
    begin
      QRLabel14.caption := obRelLivro.buscas.FieldByName('DATA_NF').asstring;
      QRLabel15.caption := 'NF: ' +
      vDadosIni.strzero(obRelLivro.buscas.FieldByName('NUM_NF').AsInteger, 7);
      QRLabel20.caption := format('%n', [obRelLivro.buscas.FieldByName('VALOR_NF').AsCurrency]);
    end;
  end
  else
  begin
    QRLabel13.caption := vDadosIni.strzero(obRelLivro.buscas.FieldByName('SEQ_FECH').AsInteger, 5);
    QRLabel14.caption := obRelLivro.buscas.FieldByName('DATA_FECH').AsString;
    if obRelLivro.buscas.FieldByName('NCUPOM').AsInteger <> 0 then
    begin
      QRLabel15.caption := 'CF: ' +
        vDadosIni.strzero(obRelLivro.buscas.FieldByName('NCUPOM').AsInteger, 11);
      QRLabel20.caption := format('%n', [obRelLivro.buscas.FieldByName('VALOR_TOTAL').AsCurrency]);
    end
    else
    begin
      QRLabel15.caption := vDadosIni.strzero(0, 5);
      QRLabel20.caption := format('%n', [0.00]);
    end;
  end;
end;

procedure TfrmRelLivroRegistroEntrada.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  Qrlabel19.caption := vDadosIni.strzero(vseq, 6);
  Inc(vseq);
end;

procedure TfrmRelLivroRegistroEntrada.QuickRep1AfterPreview(Sender: TObject);
begin
  inherited;
  vseq := StrToInt(Edit1.Text);
end;

procedure TfrmRelLivroRegistroEntrada.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  QRLabel16.Caption := 'Período de: ' + maskedit1.text + ' a ' + maskedit2.text;
  QRLabel21.Caption := vDadosIni.vEmp.vRazaoSocial;
end;

procedure TfrmRelLivroRegistroEntrada.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender,QRLabel12.Caption);
end;

end.

