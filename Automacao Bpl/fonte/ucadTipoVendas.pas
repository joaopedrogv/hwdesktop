unit ucadTipoVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, QRCtrls, QuickRpt, DBCtrls, DB, uEditHw;

type
  TfrmCadTipoVendas = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    TabSheet4: TTabSheet;
    qrpPAgenda: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    lbEmpresa: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    DataSource1: TDataSource;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label88: TLabel;
    Label83: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit9: TDBEdit;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBComboBox8: TDBComboBox;
    DBComboBox9: TDBComboBox;
    DBComboBox10: TDBComboBox;
    DBComboBox11: TDBComboBox;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    EditHw3: TEditHw;
    DBMemo1: TDBMemo;
    DBComboBox12: TDBComboBox;
    DBComboBox13: TDBComboBox;
    DBComboBox14: TDBComboBox;
    DBComboBox15: TDBComboBox;
    DBComboBox16: TDBComboBox;
    DBComboBox17: TDBComboBox;
    Label33: TLabel;
    DBEdit2: TDBEdit;
    Label34: TLabel;
    DBComboBox18: TDBComboBox;
    Label35: TLabel;
    DBComboBox19: TDBComboBox;
    Label36: TLabel;
    DBComboBox20: TDBComboBox;
    Label37: TLabel;
    DBComboBox21: TDBComboBox;
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure qrpPAgendaPreview(Sender: TObject);
    procedure DBComboBox11Exit(Sender: TObject);
    procedure DBComboBox9Exit(Sender: TObject);
    procedure DBComboBox9KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox7KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HabilitarCampos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoVendas: TfrmCadTipoVendas;

implementation

uses
 Funcoes,
  uDtmAtivo, UClassesCadastrosBasicos, uCadBox, UDtmCadastrosBasicos;

{$R *.dfm}

procedure TfrmCadTipoVendas.BitBtn1Click(Sender: TObject);
var
 I: Integer;
begin
  if vDadosIni.PesqPros('BAS246', 'PESQUISAR', '',
    'TIPO_VENDAS', '', CadTipoVendas.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not CadTipoVendas.ConsultaCampos('TIPO_VENDAS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if CadTipoVendas.ConsultaCampos('TIPO_VENDAS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

     if CadTipoVendas.dataSet.Active then
        for I := 0 to DBGrid1.Columns.Count - 1 do
          if DBGrid1.Columns[i].FieldName = 'OBSERVACAO' then
            DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadTipoVendas.BitBtn3Click(Sender: TObject);
begin
  try
    if not CadTipoVendas.Insert then
      exit;

    inherited;
    Label36.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
    DBComboBox20.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
    EditHw1.AsValue:= CadTipoVendas.PercDescMax;
    EditHw2.AsValue:= CadTipoVendas.MinMarkUp;
    EditHw3.AsValue:= CadTipoVendas.MinMargemLiq;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    DBComboBox1.Enabled := True;

    Label19.Enabled := False;
    Label21.Enabled := False;
    Label20.Enabled := False;
    Label23.Enabled := False;
    Label24.Enabled := False;
    DBEdit2.Enabled := False;
    DBComboBox9.Enabled := False;
    DBComboBox11.Enabled := False;
    
    Label9.Enabled := (trim(DBComboBox1.Text) = 'OS') or (trim(DBComboBox1.Text) = 'VEI') or (trim(DBComboBox1.Text) = 'TMO');
    DBEdit4.Enabled := (trim(DBComboBox1.Text) = 'OS') or (trim(DBComboBox1.Text) = 'VEI') or (trim(DBComboBox1.Text) = 'TMO');

    Label10.Enabled := (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'ORC');
    DBEdit5.Enabled := (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'ORC');

    Label27.Enabled := (trim(DBComboBox1.Text) = 'VEI');
    DBComboBox12.Enabled := (trim(DBComboBox1.Text) = 'VEI');

    Label37.Visible := vDadosIni.vEmp.vModoFaturamento = 'S';
   	DBComboBox21.Visible := vDadosIni.vEmp.vModoFaturamento = 'S';
    if vDadosIni.vEmp.vModoFaturamento = 'S' then
    begin
    	if (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'OS') then
      begin
      	Label37.Enabled := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
      	DBComboBox21.Enabled := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
      end
      else if (trim(DBComboBox1.Text) = 'VEI') then
      begin
        Label37.Enabled := vDadosIni.vVeic.ReceberPeloFinanceiro;
      	DBComboBox21.Enabled := vDadosIni.vVeic.ReceberPeloFinanceiro;
      end;
      
      if (Label37.Enabled) and (Label37.Visible) then
      begin
        Label37.Enabled := CadTipoVendas._receberCaixa(
          CadTipoVendas.dataSet.FieldByName('tipo').AsString,
          CadTipoVendas.dataSet.FieldByName('tipo_os').AsString,
          CadTipoVendas.dataSet.FieldByName('sigla').AsString) = 'S';
        DBComboBox21.Enabled := Label37.Enabled;
      end;
    end;

    if trim(DBComboBox1.Text) = 'TMO' then
    	Label9.Caption := 'Status TMO:'
    else if trim(DBComboBox1.Text) = 'VEI' then
      Label9.Caption := 'Tipo de Veículo:'
    else
      Label9.Caption := 'Tipo de OS:';

    if trim(DBComboBox1.Text) = 'TMO' then
    begin
      DBEdit4.MaxLength := 40;
      DBEdit4.Width := DBEdit3.Width;
    end
    else
    begin
      DBEdit4.MaxLength := 10;
      DBEdit4.Width := DBComboBox1.Width;
      if trim(CadTipoVendas.dataSet.FieldByName('TIPO_OS').AsString) <> '' then
        CadTipoVendas.dataSet.FieldByName('TIPO_OS').AsString :=
          Copy(CadTipoVendas.dataSet.FieldByName('TIPO_OS').AsString, 1, 10);
    end;
    DBComboBox1Exit(Sender);

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
    	DBEdit4.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
    	DBEdit5.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadTipoVendas.Cancel;
      CadTipoVendas.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadTipoVendas.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
   BitBtn4.SetFocus;
  CadTipoVendas._setaAtributosTipoVND(EditHw1.AsValue,EditHw2.AsValue,EditHw3.AsValue);
  if not CadTipoVendas.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(CadTipoVendas.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if CadTipoVendas.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        	DBEdit3.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadTipoVendas.BitBtn5Click(Sender: TObject);
begin
  inherited;
  CadTipoVendas.Cancel;
  CadTipoVendas.RollBackTransacao;
end;

procedure TfrmCadTipoVendas.DBComboBox11Exit(Sender: TObject);
begin
  inherited;
 if CadTipoVendas.dataSet.FieldByName('N_USAR_CONFERENCIA_PRODUTO').AsString = 'S' then
    CadTipoVendas.dataSet.FieldByName('USAR_CONFERENCIA_PRODUTO').AsString := 'N';
end;

procedure TfrmCadTipoVendas.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  Label9.Enabled := (trim(DBComboBox1.Text) = 'OS') or (trim(DBComboBox1.Text) = 'VEI') or (trim(DBComboBox1.Text) = 'TMO');
  DBEdit4.Enabled := (trim(DBComboBox1.Text) = 'OS') or (trim(DBComboBox1.Text) = 'VEI') or (trim(DBComboBox1.Text) = 'TMO');

  Label10.Enabled := (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'ORC');
  DBEdit5.Enabled := (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'ORC');

  if vDadosIni.vEmp.vAbaterItens = 'S' then
  begin
    Label19.Enabled := trim(DBComboBox1.Text) = 'REQ';
    Label20.Enabled := trim(DBComboBox1.Text) = 'REQ';
    Label23.Enabled := trim(DBComboBox1.Text) = 'REQ';
    Label24.Enabled := trim(DBComboBox1.Text) = 'REQ';
    DBComboBox9.Enabled := trim(DBComboBox1.Text) = 'REQ';
    DBComboBox11.Enabled := trim(DBComboBox1.Text) = 'REQ';
  end;
  Label21.Enabled := trim(DBComboBox1.Text) = 'OS';
  DBEdit2.Enabled := trim(DBComboBox1.Text) = 'OS';
  if (trim(DBComboBox1.Text) <> 'OS') and (trim(DBComboBox1.Text) <> 'VEI') then
    CadTipoVendas.dataSet.FieldByName('TIPO_OS').IsNull;
  Label27.Enabled := (trim(DBComboBox1.Text) = 'VEI');
  DBComboBox12.Enabled := (trim(DBComboBox1.Text) = 'VEI');
  if trim(DBComboBox1.Text) = 'TMO' then
    Label9.Caption := 'Status TMO:'
  else if trim(DBComboBox1.Text) = 'VEI' then
    Label9.Caption := 'Tipo de Veículo:'
  else
    Label9.Caption := 'Tipo de OS:';

  if trim(DBComboBox1.Text) = 'TMO' then
  begin
    DBEdit4.MaxLength := 40;
    DBEdit4.Width := DBEdit3.Width;
  end
  else
  begin
    DBEdit4.MaxLength := 10;
    DBEdit4.Width := DBComboBox1.Width;
    if trim(CadTipoVendas.dataSet.FieldByName('TIPO_OS').AsString) <> '' then
       CadTipoVendas.dataSet.FieldByName('TIPO_OS').AsString :=
         Copy(CadTipoVendas.dataSet.FieldByName('TIPO_OS').AsString, 1, 10);
  end;

  Label37.Visible := vDadosIni.vEmp.vModoFaturamento = 'S';
  DBComboBox21.Visible := vDadosIni.vEmp.vModoFaturamento = 'S';
  if vDadosIni.vEmp.vModoFaturamento = 'S' then
  begin
    if (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'OS') then
    begin
       Label37.Enabled := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
       DBComboBox21.Enabled := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
    end
    else if (trim(DBComboBox1.Text) = 'REQ') then
    begin
       Label37.Enabled := vDadosIni.vVeic.ReceberPeloFinanceiro;
       DBComboBox21.Enabled := vDadosIni.vVeic.ReceberPeloFinanceiro;
    end;

    if (Label37.Enabled) and (Label37.Visible) then
    begin
      Label37.Enabled := CadTipoVendas._receberCaixa(
        CadTipoVendas.dataSet.FieldByName('tipo').AsString,
        CadTipoVendas.dataSet.FieldByName('tipo_os').AsString,
        CadTipoVendas.dataSet.FieldByName('sigla').AsString) = 'S';
      DBComboBox21.Enabled := Label37.Enabled;
    end;
  end;

  HabilitarCampos;
//  if DBComboBox1.Text <> 'OS' then
//  begin
//    DBEdit4.Field.AsString := '';
//    DBEdit4.Enabled := false;
//  end
//  else
//  begin
//   DBEdit4.Enabled := true;
//  end;

end;

procedure TfrmCadTipoVendas.DBComboBox7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  if not((Key = Chr(78)) or (Key = Chr(110)) or (Key = Chr(83)) or (Key = Chr(115))) then
  Key := #0;
end;

procedure TfrmCadTipoVendas.DBComboBox9Exit(Sender: TObject);
begin
  inherited;
  if CadTipoVendas.dataSet.FieldByName('USAR_CONFERENCIA_PRODUTO').AsString = 'S' then
    CadTipoVendas.dataSet.FieldByName('N_USAR_CONFERENCIA_PRODUTO').AsString := 'N';
end;

procedure TfrmCadTipoVendas.DBComboBox9KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #0;
end;

procedure TfrmCadTipoVendas.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  Label37.Visible := vDadosIni.vEmp.vModoFaturamento = 'S';
 	DBComboBox21.Visible := vDadosIni.vEmp.vModoFaturamento = 'S';
  if vDadosIni.vEmp.vModoFaturamento = 'S' then
  begin
    if (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'OS') then
    begin
    	Label37.Enabled := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
      DBComboBox21.Enabled := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
    end
    else if (trim(DBComboBox1.Text) = 'REQ') then
    begin
      Label37.Enabled := vDadosIni.vVeic.ReceberPeloFinanceiro;
      DBComboBox21.Enabled := vDadosIni.vVeic.ReceberPeloFinanceiro;
    end;

    if (Label37.Enabled) and (Label37.Visible) then
    begin
      Label37.Enabled := CadTipoVendas._receberCaixa(
        CadTipoVendas.dataSet.FieldByName('tipo').AsString,
        CadTipoVendas.dataSet.FieldByName('tipo_os').AsString,
        CadTipoVendas.dataSet.FieldByName('sigla').AsString) = 'S';
      DBComboBox21.Enabled := Label37.Enabled;
    end;
  end;
end;

procedure TfrmCadTipoVendas.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  Label37.Visible := vDadosIni.vEmp.vModoFaturamento = 'S';
 	DBComboBox21.Visible := vDadosIni.vEmp.vModoFaturamento = 'S';
  if vDadosIni.vEmp.vModoFaturamento = 'S' then
  begin
    if (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'OS') then
    begin
    	Label37.Enabled := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
      DBComboBox21.Enabled := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
    end
    else if (trim(DBComboBox1.Text) = 'REQ') then
    begin
      Label37.Enabled := vDadosIni.vVeic.ReceberPeloFinanceiro;
      DBComboBox21.Enabled := vDadosIni.vVeic.ReceberPeloFinanceiro;
    end;
    
    if (Label37.Enabled) and (Label37.Visible) then
    begin
      Label37.Enabled := CadTipoVendas._receberCaixa(
        CadTipoVendas.dataSet.FieldByName('tipo').AsString,
        CadTipoVendas.dataSet.FieldByName('tipo_os').AsString,
        CadTipoVendas.dataSet.FieldByName('sigla').AsString) = 'S';
      DBComboBox21.Enabled := Label37.Enabled;
    end;
  end;
end;

procedure TfrmCadTipoVendas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadTipoVendas.HabilitarCampos;
begin
 DBComboBox15.Enabled := (trim(CadTipoVendas.dataSet.FieldByName('TIPO').AsString) = 'REQ')
  or (trim(CadTipoVendas.dataSet.FieldByName('TIPO').AsString) = 'OS')
  or (trim(CadTipoVendas.dataSet.FieldByName('TIPO').AsString) = 'ORC');

 DBComboBox15.Clear;

 if DBComboBox15.Enabled then
 begin
   DBComboBox15.Items.Add('N - NÃO');
   DBComboBox15.Items.Add('A - NA ABERTURA');
   if (trim(CadTipoVendas.dataSet.FieldByName('TIPO').AsString) <> 'ORC') then
     DBComboBox15.Items.Add('F - NO FECHAMENTO');
   DBComboBox15.Text := CadTipoVendas.dataSet.FieldByName('ENV_EMAIL').AsString;

   if CadTipoVendas.dataSet.State in [dsInsert, dsEdit] then
     if (trim(CadTipoVendas.dataSet.FieldByName('TIPO').AsString) = 'ORC')
     and (trim(CadTipoVendas.dataSet.FieldByName('ENV_EMAIL').AsString) = 'F') then
      CadTipoVendas.dataSet.FieldByName('ENV_EMAIL').Value := Null;
 end;
end;

procedure TfrmCadTipoVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (CadTipoVendas <> nil) then
    CadTipoVendas.Cancel;

  CadTipoVendas.free;
  CadTipoVendas := nil;

  Action := caFree;
  if (frmCadTipoVendas <> nil) then
    frmCadTipoVendas := nil;
end;

procedure TfrmCadTipoVendas.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadTipoVendas := TTipoVendas.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadTipoVendas.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsTipoVendas;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS236]';
  end;

  DBMemo1.Hint := 'Para utilizar um campo na observação informe o nome do campo, exemplo: [@COD_CLIENTE]' + #13 + #13 +
  	'Para descobrir o nome do campo, entre no cadastro REQ/OS/ORC/MOT posicione no campo desejado e aperte as teclas (Shift + Ctrl + Alt + F10)';

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadTipoVendas._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadTipoVendas.lbEmpresaPrint(sender: TObject; var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadTipoVendas.qrpPAgendaPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Cadastro Tipos Vendas');
end;

procedure TfrmCadTipoVendas.SpeedButton1Click(Sender: TObject);
begin
  try
    if CadTipoVendas.dataSet.IsEmpty then
      Exit;
    if not vDadosIni.PesqPros('BAS248', 'ALTERAR', '', 'TIPO_VENDAS',
      CadTipoVendas.dataSet.FieldByName('COD_TIPO').AsString, CadTipoVendas.buscas, true) then
      exit;

    if not CadTipoVendas.Edit then
      Exit;
    inherited;

    Label36.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
    DBComboBox20.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
    EditHw1.AsValue:= CadTipoVendas.PercDescMax;
    EditHw2.AsValue:= CadTipoVendas.MinMarkUp;
    EditHw3.AsValue:= CadTipoVendas.MinMargemLiq;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    DBComboBox1.Enabled := False;
    
    Label19.Enabled := False;
    Label21.Enabled := False;
    Label20.Enabled := False;
    Label23.Enabled := False;
    Label24.Enabled := False;
    DBEdit2.Enabled := False;
    DBComboBox9.Enabled := False;
    DBComboBox11.Enabled := False;
    
    Label9.Enabled := (trim(DBComboBox1.Text) = 'OS') or (trim(DBComboBox1.Text) = 'VEI') or (trim(DBComboBox1.Text) = 'TMO');
    DBEdit4.Enabled := (trim(DBComboBox1.Text) = 'OS') or (trim(DBComboBox1.Text) = 'VEI') or (trim(DBComboBox1.Text) = 'TMO');

    Label10.Enabled := (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'ORC');
    DBEdit5.Enabled := (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'ORC');

    Label27.Enabled := (trim(DBComboBox1.Text) = 'VEI');
    DBComboBox12.Enabled := (trim(DBComboBox1.Text) = 'VEI');

    Label37.Visible := vDadosIni.vEmp.vModoFaturamento = 'S';
   	DBComboBox21.Visible := vDadosIni.vEmp.vModoFaturamento = 'S';
    if vDadosIni.vEmp.vModoFaturamento = 'S' then
    begin
    	if (trim(DBComboBox1.Text) = 'REQ') or (trim(DBComboBox1.Text) = 'OS') then
      begin
      	Label37.Enabled := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
      	DBComboBox21.Enabled := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
      end
      else if (trim(DBComboBox1.Text) = 'VEI') then
      begin
        Label37.Enabled := vDadosIni.vVeic.ReceberPeloFinanceiro;
      	DBComboBox21.Enabled := vDadosIni.vVeic.ReceberPeloFinanceiro;
      end;
      
      if (Label37.Enabled) and (Label37.Visible) then
      begin
        Label37.Enabled := CadTipoVendas._receberCaixa(
          CadTipoVendas.dataSet.FieldByName('tipo').AsString,
          CadTipoVendas.dataSet.FieldByName('tipo_os').AsString,
          CadTipoVendas.dataSet.FieldByName('sigla').AsString) = 'S';
        DBComboBox21.Enabled := Label37.Enabled;
      end;
    end;

    if trim(DBComboBox1.Text) = 'TMO' then
    	Label9.Caption := 'Status TMO:'
    else if trim(DBComboBox1.Text) = 'VEI' then
      Label9.Caption := 'Tipo de Veículo:'
    else
      Label9.Caption := 'Tipo de OS:';

    if trim(DBComboBox1.Text) = 'TMO' then
    begin
      DBEdit4.MaxLength := 40;
      DBEdit4.Width := DBEdit3.Width;
    end
    else
    begin
      DBEdit4.MaxLength := 10;
      DBEdit4.Width := DBComboBox1.Width;
      if trim(CadTipoVendas.dataSet.FieldByName('TIPO_OS').AsString) <> '' then
        CadTipoVendas.dataSet.FieldByName('TIPO_OS').AsString :=
          Copy(CadTipoVendas.dataSet.FieldByName('TIPO_OS').AsString, 1, 10);
    end;
    DBComboBox1Exit(Sender); 

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
    	DBEdit4.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
    	DBEdit5.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadTipoVendas.Cancel;
      CadTipoVendas.RollBackTransacao;
    end;
  end;

end;

procedure TfrmCadTipoVendas.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS249', 'ABRIR A LIXEIRA', '', 'TIPO_VENDAS',
    '', CadTipoVendas.buscas, true) then
    Exit;

  inherited;

  if not CadTipoVendas._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS249]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS250]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;

end;

procedure TfrmCadTipoVendas.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('BAS249', 'EXCLUIR', '', 'TIPO_VENDAS',
      CadTipoVendas.dataSet.FieldByName('COD_TIPO').AsString, CadTipoVendas.buscas, false) then
      Exit;

    CadTipoVendas.Delete;
    lixeiraVazia(not CadTipoVendas._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadTipoVendas.Cancel;
      CadTipoVendas.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadTipoVendas.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS254', 'IMPRIMIR', '', 'TIPO_VENDAS',
    CadTipoVendas.dataSet.FieldByName('COD_TIPO').AsString, CadTipoVendas.buscas, true) then
    exit;

  qrpPAgenda.Preview;
end;

procedure TfrmCadTipoVendas.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS251', '', '', 'TIPO_VENDAS', '', CadTipoVendas.buscas, false) then
    if CadTipoVendas._restauraLixeira then
      lixeiraVazia(not CadTipoVendas._lixeiraCheia);
end;

procedure TfrmCadTipoVendas.SpeedButton6Click(Sender: TObject);
type
  ProcShowModal = procedure (CodTipoVenda: Integer; const TipoVenda: string);
var
  ShowVinculosComTipoVenda: ProcShowModal;
begin
  if CadTipoVendas.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('MOD028', 'VISUALIZAR', '', 'TIPO_VENDAS',
    CadTipoVendas.dataSet.FieldByName('COD_TIPO').AsString, CadTipoVendas.buscas, false) then
    Exit;

  if vDadosIni.vModern.AHandle < 0 then
    CarregaPacote('pkModern', vDadosIni.vModern.AHandle);

  @ShowVinculosComTipoVenda := GetProcAddress(vDadosIni.vModern.AHandle, 'ShowVinculosComTipoVenda');

  if Assigned(ShowVinculosComTipoVenda) then
    ShowVinculosComTipoVenda( CadTipoVendas.fint('COD_TIPO'), CadTipoVendas.fstr('TIPO') );
end;

end.

