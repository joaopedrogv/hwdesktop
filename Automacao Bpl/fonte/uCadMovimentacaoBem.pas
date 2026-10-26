unit uCadMovimentacaoBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, uClassesCIAP, uEditHw, AppEvnts, Spin;

type
  TfrmMovimentacaoBem = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    tsMovimentacao: TTabSheet;
    pnMovimentacao: TPanel;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    ComboBox4: TComboBox;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    EditHw3: TEditHw;
    EditHw4: TEditHw;
    EditHw5: TEditHw;
    EditHw6: TEditHw;
    EditHw7: TEditHw;
    MaskEdit4: TMaskEdit;
    Panel6: TPanel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    CheckBox2: TCheckBox;
    Label24: TLabel;
    EditHw8: TEditHw;
    Label25: TLabel;
    EditHw9: TEditHw;
    BitBtn7: TBitBtn;
    GroupBox7: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    tsConsultaNf: TTabSheet;
    pnConsultaNF: TPanel;
    GroupBox9: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    EditHw10: TEditHw;
    EditHw11: TEditHw;
    BitBtn10: TBitBtn;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    DBGrid13: TDBGrid;
    DBGrid3: TDBGrid;
    Panel7: TPanel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBEdit3: TDBEdit;
    Label26: TLabel;
    tsRepli: TTabSheet;
    pnReplic: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    SpinEdit1: TSpinEdit;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Label32: TLabel;
    DBEdit4: TDBEdit;
    Label33: TLabel;
    DBEdit11: TDBEdit;
    Label34: TLabel;
    DBEdit12: TDBEdit;
    Label44: TLabel;
    DBEdit13: TDBEdit;
    Label45: TLabel;
    DBEdit14: TDBEdit;
    Label46: TLabel;
    DBEdit15: TDBEdit;
    Panel4: TPanel;
    ed_qtde_aplic: TEditHw;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit16: TDBEdit;
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBEdit28KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBEdit21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBEdit20Change(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure EditHw2Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure EditHw1Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimentacaoBem: TfrmMovimentacaoBem;
  obMovCiap: TMovimento_CIAP;

implementation

uses uDtmCIAP, uDtmAtivo, DBClient, uDataSet_OOP, DB, uDadosIni,
  Math, hw_utils;

{$R *.dfm}

procedure TfrmMovimentacaoBem.BitBtn10Click(Sender: TObject);
var
  vEntS:string;
begin
  inherited;
  vEntS := 'S';
  if (obMovCiap.dataSet.FieldByName('tipo_mov').AsString = 'IM') or
  (obMovCiap.dataSet.FieldByName('tipo_mov').AsString = 'IA') then
    vEntS := 'E';
  if obMovCiap.vNf.pesquisaNF(MaskEdit5.Text,MaskEdit6.Text,vEntS,EditHw10.AsInteger,EditHw11.AsInteger) then
    if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
      DBGrid3.SetFocus;
end;

procedure TfrmMovimentacaoBem.BitBtn11Click(Sender: TObject);
begin
  inherited;
TForm(pnConsultaNF.Parent).ModalResult :=IDCANCEL;
end;

procedure TfrmMovimentacaoBem.BitBtn12Click(Sender: TObject);
begin
  inherited;

  if RoundTo(ed_qtde_aplic.AsValue, -5) > obMovCiap.vNf.vItemNf.ffloat('quantidade', -5) then
  begin
    ShowErro('Quantidade informada superior a quantidade do item na nota fiscal');
    Exit;
  end;

  if RoundTo(ed_qtde_aplic.AsValue, -5) < 0 then
  begin
    ShowErro('Quantidade informada não pode ser menor que 0');
    Exit;
  end;

  obMovCiap.vNf.vItemNf.QtdeAplicada := ed_qtde_aplic.AsValue;
  TForm(pnConsultaNF.Parent).ModalResult :=IDOK;
end;

procedure TfrmMovimentacaoBem.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('SPED070','CONSULTA','','MOVIMENTO_CIAP','',obMovCiap.buscas,False) then
    Exit;
  if MaskEdit2.Visible then
  begin
    if not obMovCiap.ConsultaCampos('MOVIMENTO_CIAP', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if obMovCiap.ConsultaCampos('MOVIMENTO_CIAP', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmMovimentacaoBem.BitBtn3Click(Sender: TObject);
begin
  ActiveControl := BitBtn3;
  if not obMovCiap.Insert then
    exit;
  inherited;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmMovimentacaoBem.BitBtn4Click(Sender: TObject);
begin
  if not obMovCiap.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obMovCiap.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 2 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if obMovCiap.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmMovimentacaoBem.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obMovCiap.Cancel;
  if TelaCadastro = 2 then
  begin
    BitBtn6.Click;
    Exit;
  end;
end;

procedure TfrmMovimentacaoBem.BitBtn7Click(Sender: TObject);
begin
  obMovCiap.abreFormMovimentacaoBem;
end;

procedure TfrmMovimentacaoBem.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnMovimentacao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmMovimentacaoBem.BitBtn9Click(Sender: TObject);
begin
  inherited;
  obMovCiap.vLancarBaixaUltimaParcela := CheckBox2.Checked;
  obMovCiap.vCOD_IND_BEM := EditHw1.AsInteger;
  obMovCiap.vNUM_PARC_INI := EditHw6.AsInteger;
  obMovCiap.vNUM_PARC_FIM := EditHw8.AsInteger;
  obMovCiap.vDT_MOV := MaskEdit4.Text;
  obMovCiap.vTIPO_MOV := copy(ComboBox4.Text, 1, 2);
  obMovCiap.vVL_IMOB_ICMS_OP := EditHw2.AsValue;
  obMovCiap.vVL_IMOB_ICMS_ST := EditHw3.AsValue;
  obMovCiap.vVL_IMOB_ICMS_FRT := EditHw4.AsValue;
  obMovCiap.vVL_IMOB_ICMS_DIF := EditHw5.AsValue;
  obMovCiap.vVL_PARC_PASS := EditHw7.AsValue;

  if obMovCiap.salvaMovimentacaoBemComp then
    TForm(pnMovimentacao.Parent).ModalResult := IDOK;
end;

procedure TfrmMovimentacaoBem.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
      if (copy(DBComboBox1.Text,1,2) = 'BA')  or (copy(DBComboBox1.Text,1,2) = 'AT')  or
    (copy(DBComboBox1.Text,1,2) = 'PE')  or (copy(DBComboBox1.Text,1,2) = 'OT')  then
  begin
    DBEdit5.Enabled := False;
    DBEdit6.Enabled := False;
    DBEdit7.Enabled := False;
    DBEdit8.Enabled := False;
    DBEdit9.Enabled := False;
    DBEdit10.Enabled := False;
  end
  else
  begin
    DBEdit5.Enabled := True;
    DBEdit6.Enabled := True;
    DBEdit7.Enabled := True;
    DBEdit8.Enabled := True;
    DBEdit9.Enabled := True;
    DBEdit10.Enabled := True;
  end;
end;

procedure TfrmMovimentacaoBem.DBEdit20Change(Sender: TObject);
begin
  inherited;
  if (DBEdit20.Text = 'N') or (DBEdit20.Text = 'S') then
  else
    DBEdit20.Text := '';
end;

procedure TfrmMovimentacaoBem.DBEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    obMovCiap.buscaClienteOuNotaFiscal('NF');
end;

procedure TfrmMovimentacaoBem.DBEdit21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    obMovCiap.buscaClienteOuNotaFiscal('C');
end;

procedure TfrmMovimentacaoBem.DBEdit28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    obMovCiap.buscaProduto;
end;

procedure TfrmMovimentacaoBem.DBGrid13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    if (Self.Enabled) and (Self.Visible) and (BitBtn12.CanFocus) then
    	BitBtn12.SetFocus;
end;

procedure TfrmMovimentacaoBem.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  SpeedButton1.Click;
end;

procedure TfrmMovimentacaoBem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
  	SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
  	BitBtn3Click(Sender);
end;

procedure TfrmMovimentacaoBem.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    if (Self.Enabled) and (Self.Visible) and (DBGrid13.CanFocus) then
      DBGrid13.SetFocus;
end;

procedure TfrmMovimentacaoBem.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  try
    EditHw1.AsValue := DBLookupComboBox2.KeyValue;
    if ActiveControl <> BitBtn8 then
      if not obMovCiap.existeBemOuComponente(EditHw1.AsInteger) then
      begin
      	if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
      	  EditHw1.SetFocus;
      end
      else
      begin
        EditHw9.AsValue := obMovCiap.vNUM_PARC;
        EditHw6.AsValue := obMovCiap.vNUM_PARC_INI;
        EditHw8.AsValue := obMovCiap.vNUM_PARC_FIM;
      end;
  except
  end;
end;

procedure TfrmMovimentacaoBem.EditHw1Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl <> BitBtn8 then
  begin
    DBLookupComboBox2.KeyValue := EditHw1.AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
    	DBLookupComboBox2.SetFocus;
  end;
end;

procedure TfrmMovimentacaoBem.EditHw2Exit(Sender: TObject);
begin
  inherited;
  try
    EditHw7.AsValue :=
      (EditHw2.AsValue + EditHw3.AsValue + EditHw4.AsValue + EditHw5.AsValue) /
      EditHw9.AsValue;
  except
  end;
end;

procedure TfrmMovimentacaoBem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obMovCiap.Free;
  obMovCiap := nil;
  Action := caFree;
  frmMovimentacaoBem := nil;
end;

procedure TfrmMovimentacaoBem.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  TelaCadastro := 0;
  obMovCiap := TMovimento_CIAP.Create;
end;

procedure TfrmMovimentacaoBem.FormShow(Sender: TObject);
begin
  DBGrid1.DataSource := dtmCIAP.dsmovciap;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  tsMovimentacao.TabVisible := false;
  tsConsultaNf.TabVisible := false;
  tsRepli.TabVisible := false;

  inherited;

  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

end;

procedure TfrmMovimentacaoBem.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if not obMovCiap.Edit then
    exit;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmMovimentacaoBem.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  obMovCiap.Delete;
end;

procedure TfrmMovimentacaoBem.SpeedButton6Click(Sender: TObject);
begin
  if obMovCiap.dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED109','REPLICAR', obMovCiap.dataSet.FieldByName('COD_IND_BEM').AsString  + ' ' +
    obMovCiap.dataSet.FieldByName('DT_MOV').AsString  + ' ' +
    obMovCiap.dataSet.FieldByName('TIPO_MOV').AsString, 'MOVIMENTO_CIAP','',obMovCiap.buscas,True) then
    Exit;

  Label29.Caption := Format('%m', [obMovCiap.dataSet.FieldByName('VL_PARC_PASS').AsFloat]);
  Label30.Caption := IntToStr(obMovCiap.dataSet.FieldByName('NUM_PARC').AsInteger);
  SpinEdit1.MinValue := obMovCiap.dataSet.FieldByName('NUM_PARC').AsInteger + 1;
  SpinEdit1.Value := SpinEdit1.MinValue;

  if not vDadosIni.abreForm('Replicação de Movimentação', pnReplic, [ofAutoSize, ofAutoScroll, ofEscapeExit]) then
    Exit;

  obMovCiap.ReplicarMovimentacao(obMovCiap.dataSet.FieldByName('NUM_PARC').AsInteger + 1, SpinEdit1.Value);

end;

end.

