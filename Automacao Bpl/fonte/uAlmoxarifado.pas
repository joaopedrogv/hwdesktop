unit uAlmoxarifado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, QuickRpt, QRCtrls, ExtCtrls, StdCtrls, Grids,
  DBGrids, Buttons, Mask, uEditMoeda, uClassesAlmoxarifado, grimgctrl;

type
  TfrmAlmoxarifado = class(TfrmPadrao)
    PageControl1: TPageControl;
    tsControleAlmoxarifado: TTabSheet;
    tsRelMovProd: TTabSheet;
    tsRelRelacAtend: TTabSheet;
    ScrollBox1: TScrollBox;
    qkRMovProd: TQuickRep;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrLEstAt: TQRLabel;
    QRLabel14: TQRLabel;
    tsOpcoesRel: TTabSheet;
    ScrollBox2: TScrollBox;
    qkRRelacAtend: TQuickRep;
    TitleBand2: TQRBand;
    ColumnHeaderBand2: TQRBand;
    DetailBand2: TQRBand;
    PageFooterBand2: TQRBand;
    QRSysData3: TQRSysData;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText29: TQRDBText;
    qrLperiodoMov: TQRLabel;
    qrLPeriodoAtend: TQRLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    CheckBox1: TCheckBox;
    GroupBox4: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edCodVendedor: TEditMoeda;
    Label12: TLabel;
    cbSituacao: TComboBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    edNumVenda: TEditMoeda;
    edNumFabProd: TMaskEdit;
    btProcurar: TBitBtn;
    GroupBox5: TGroupBox;
    DBGrid3: TDBGrid;
    Panel10: TPanel;
    btConfirmar: TBitBtn;
    btRemoverItem: TBitBtn;
    btConfirmarVenda: TBitBtn;
    btRemoverAtendimento: TBitBtn;
    btSair: TBitBtn;
    btRelatorios: TBitBtn;
    MaskEdit3: TMaskEdit;
    QRLabel13: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText30: TQRDBText;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure qkRRelacAtendPreview(Sender: TObject);
    procedure qkRMovProdPreview(Sender: TObject);
    procedure edNumFabProdChange(Sender: TObject);
    procedure edNumFabProdExit(Sender: TObject);
    procedure edNumFabProdEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btRelatoriosClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure MaskEdit3Enter(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btConfirmarVendaClick(Sender: TObject);
    procedure btRemoverItemClick(Sender: TObject);
    procedure btRemoverAtendimentoClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure edCodVendedorExit(Sender: TObject);
    procedure edCodVendedorEnter(Sender: TObject);
    procedure edCodVendedorChange(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure btProcurarClick(Sender: TObject);
    procedure BitBtn58Click(Sender: TObject);
    procedure BitBtn57Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlmoxarifado: TfrmAlmoxarifado;
  obAlmox: TAlmoxarifado;

implementation

uses uDtmAlmoxarifado, uDtmPedVenda, UClassesPedVenda, DB, uDtmAtivo;

{$R *.dfm}

procedure TfrmAlmoxarifado.btProcurarClick(Sender: TObject);
begin
  inherited;
  if obAlmox.vVenda.vColab.DataSet.State = dsinactive then
  begin
    obAlmox.vVenda.vColab.abreColaboradorVendedor;
    if MaskEdit3.text <> '' then
     MaskEdit3Exit(sender);
  end;
  if obAlmox.selecionaAlmoxarifado(Trunc(edNumVenda.Valor),
    obAlmox.vVenda.vColab.DataSet.FieldByName('COD_VENDEDOR').AsInteger,
    cbSituacao.Text, RadioButton3.Checked) then
  begin
    btConfirmar.Enabled := (obAlmox.dataSet.FieldByName('sit_atd').AsString = 'NT');
    btRemoverAtendimento.Enabled := (obAlmox.dataSet.FieldByName('sit_atd').AsString = 'AT');
    btRemoverItem.Enabled := true;
    btConfirmarVenda.Enabled := (obAlmox.dataSet.FieldByName('status_ped').AsString <> 'FECHADA')
      and (obAlmox.dataSet.FieldByName('stat_req').AsString = 'A') and
      (obAlmox.dataSet.FieldByName('tipo').AsString = 'REQ');
    btRelatorios.Enabled := true;

    if (Self.Enabled) and (Self.Visible) and (btConfirmar.CanFocus) then
      btConfirmar.setfocus
    else if (Self.Enabled) and (Self.Visible) and (btRemoverAtendimento.CanFocus) then
      btRemoverAtendimento.setfocus
    else if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
      DBGrid3.SetFocus;
  end
  else
  begin
    btConfirmar.Enabled := False;
    btRemoverAtendimento.Enabled := False;
    btRemoverItem.Enabled := False;
    btConfirmarVenda.Enabled := False;
    btRelatorios.Enabled := true;
//    btConfirmar.setfocus;
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
	    MaskEdit3.SetFocus;
  end;
end;

procedure TfrmAlmoxarifado.btConfirmarClick(Sender: TObject);
begin
  inherited;
  obAlmox.incluirAtendimento;
end;

procedure TfrmAlmoxarifado.btRemoverItemClick(Sender: TObject);
begin
  inherited;
  obAlmox.removerItemDaVenda;
end;

procedure TfrmAlmoxarifado.btConfirmarVendaClick(Sender: TObject);
var
 vflag: integer;
begin
  inherited;
  vflag:=0;
  if obAlmox.dataSet.IsEmpty then
  begin
    if not obAlmox.selecionaAlmoxarifado(Trunc(edNumVenda.Valor),
     obAlmox.vVenda.vColab.DataSet.FieldByName('COD_VENDEDOR').AsInteger,
     'AT', RadioButton3.Checked) then
      exit
     else
      vflag:=1;
  end;
  obAlmox.confirmarVenda;
  if vflag = 1 then
   obAlmox.selecionaAlmoxarifado(Trunc(edNumVenda.Valor),
   obAlmox.vVenda.vColab.DataSet.FieldByName('COD_VENDEDOR').AsInteger,
   cbSituacao.Text, RadioButton3.Checked);
end;

procedure TfrmAlmoxarifado.btRelatoriosClick(Sender: TObject);
begin
  inherited;
  Label7.Visible := False;
  obAlmox.relatorio;
end;

procedure TfrmAlmoxarifado.btSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmAlmoxarifado.btRemoverAtendimentoClick(Sender: TObject);
begin
  inherited;
  obAlmox.removerAtendimento;
end;

procedure TfrmAlmoxarifado.BitBtn57Click(Sender: TObject);
begin
  inherited;
  if MaskEdit1.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data Inicial não informada', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if MaskEdit2.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data Final não informada', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Label7.Visible := true;
  BitBtn57.Tag := 1;
end;

procedure TfrmAlmoxarifado.BitBtn58Click(Sender: TObject);
begin
  inherited;
  BitBtn57.Tag := 2;
end;

procedure TfrmAlmoxarifado.DBGrid2Exit(Sender: TObject);
begin
  inherited;
  //edCodVendedor.Valor := obAlmox.vVenda.vColab.DataSet.FieldByName('COD_VENDEDOR').AsInteger;
  MaskEdit3.Text := obAlmox.vVenda.vColab.DataSet.FieldByName('NOME_VENDEDOR').AsString;
end;

procedure TfrmAlmoxarifado.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
    	MaskEdit3.SetFocus;
end;

procedure TfrmAlmoxarifado.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  	if (Self.Enabled) and (Self.Visible) and (edNumFabProd.CanFocus) then
  	  edNumFabProd.SetFocus;
end;

procedure TfrmAlmoxarifado.edCodVendedorChange(Sender: TObject);
var
  i: Double;
begin
  inherited;
  obAlmox.vVenda.vColab.FindNearest([i]);
end;

procedure TfrmAlmoxarifado.edCodVendedorEnter(Sender: TObject);
begin
  inherited;
  edCodVendedor.OnChange := edCodVendedorChange;
end;

procedure TfrmAlmoxarifado.edCodVendedorExit(Sender: TObject);
begin
  inherited;
  edCodVendedor.OnChange := nil;
end;

procedure TfrmAlmoxarifado.edNumFabProdChange(Sender: TObject);
begin
  inherited;
  obAlmox.FindNearest([edNumFabProd.Text]);
end;

procedure TfrmAlmoxarifado.edNumFabProdEnter(Sender: TObject);
begin
  inherited;
  edNumFabProd.OnChange := edNumFabProdChange;
end;

procedure TfrmAlmoxarifado.edNumFabProdExit(Sender: TObject);
begin
  inherited;
edNumFabProd.OnChange := nil;
end;

procedure TfrmAlmoxarifado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  frmAlmoxarifado := nil;
end;

procedure TfrmAlmoxarifado.FormCreate(Sender: TObject);
begin
  inherited;
  obAlmox := TAlmoxarifado.create;
  if tsControleAlmoxarifado.TabVisible then
    tsControleAlmoxarifado.TabVisible := false;
  if tsRelMovProd.TabVisible then
    tsRelMovProd.TabVisible := false;
  if tsRelRelacAtend.TabVisible then
    tsRelRelacAtend.TabVisible := false;
  if tsOpcoesRel.TabVisible then
    tsOpcoesRel.TabVisible := false;
end;

procedure TfrmAlmoxarifado.FormShow(Sender: TObject);
begin
  inherited;
  if (PageControl1.ActivePageIndex < 0) or (PageControl1.TabIndex < 0) or (PageControl1.ActivePage = nil) then
    PageControl1.ActivePage := tsControleAlmoxarifado;

  if PageControl1.ActivePage = tsControleAlmoxarifado then
    if (Self.Enabled) and (Self.Visible) and (maskedit3.CanFocus) then
    	maskedit3.setfocus;
end;

procedure TfrmAlmoxarifado.MaskEdit3Change(Sender: TObject);
begin
  inherited;
  obAlmox.vVenda.vColab.FindNearest([MaskEdit3.Text]);
  DBGrid2.SelectedRows.CurrentRowSelected := TRUE;
end;

procedure TfrmAlmoxarifado.MaskEdit3Enter(Sender: TObject);
begin
  inherited;
  MaskEdit3.OnChange := MaskEdit3Change;
end;

procedure TfrmAlmoxarifado.MaskEdit3Exit(Sender: TObject);
begin
  inherited;
  MaskEdit3.OnChange := nil;
  DBGrid2Exit(DBGrid2);
end;

procedure TfrmAlmoxarifado.qkRMovProdPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Movimentação de Produtos');
end;

procedure TfrmAlmoxarifado.qkRRelacAtendPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relação de Atendimentos');
end;

end.
//VER ERROS NO FORMULARIO. ABRE O PEDVENDA E DEPOIS ABRE ESTE AQUI NAO ABRE OS VENDEDORES
//SAIR DO GRID E O NOMEDO VENDEDOR DEVE ATRIBUIR O NOME.VER TODOS OS TESTES

