unit uCadNfSerieD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, Menus, Buttons, Grids, DBGrids, StdCtrls, Mask,
  ComCtrls, ExtCtrls, DBCtrls, UClassesNfSerieD, AppEvnts;

type
  TfrmCadNfSerieD = class(TfrmCadPadraoM)
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox14: TDBLookupComboBox;
    DBLookupComboBox16: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    GroupBox5: TGroupBox;
    Panel5: TPanel;
    Label16: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit13: TDBEdit;
    Panel9: TPanel;
    BitBtn64: TBitBtn;
    BitBtn65: TBitBtn;
    BitBtn66: TBitBtn;
    BitBtn67: TBitBtn;
    GroupBox6: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox7: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    SpeedButton9: TSpeedButton;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit12: TDBEdit;
    SpeedButton59: TSpeedButton;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton59Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure DBEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn67Click(Sender: TObject);
    procedure BitBtn66Click(Sender: TObject);
    procedure BitBtn65Click(Sender: TObject);
    procedure BitBtn64Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadNfSerieD: TfrmCadNfSerieD;
  cadNfSD: TNfSerieD;
  vCodNF: Integer;

implementation

uses UDtmNfSerieD, UDtmAtivo, DB;

{$R *.dfm}

procedure TfrmCadNfSerieD.BitBtn1Click(Sender: TObject);
begin
  inherited;
  //SpeedButton2.Hint := 'Enviar para Lixeira - [NSD005]';
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('NSD005', 'PESQUISAR', '', 'NF_SERIE_D', '', cadNfSD.buscas, FALSE) then
      Exit;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
      
    if MaskEdit2.Visible then
    begin
      if not cadNfSD.ConsultaCampos('NF_SERIE_D', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            combobox1.setfocus;
    end
    else if not cadNfSD.ConsultaCampos('NF_SERIE_D', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton25.Visible := cadNfSD.lixeiraCheia;
  SpeedButton4.Visible := not SpeedButton25.Visible;
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  SpeedButton6.Visible := true;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNfSerieD.BitBtn2Click(Sender: TObject);
begin
  BitBtn5Click(Sender);
  inherited;
end;

procedure TfrmCadNfSerieD.BitBtn3Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('NSD001', 'INCLUIR', '', 'NF_SERIE_D', '', cadNfSD.buscas, true) then
      Exit;
    if cadNfSD.inserirVenda then
    begin
      PageControl3.ActivePage := TabSheet3;
      TabSheet1.Show;
      TabSheet3.Show;
      cadNfSD.calculaTotais;
      DBEdit1.Enabled := true;
      if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      	DBEdit1.SetFocus;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNfSerieD.BitBtn4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('NSD006', 'SALVAR', 'NFSD Nº ' +
    cadNfSD.dataSet.FieldByName('numeronota').AsString, 'NF_SERIE_D', cadNfSD.dataSet.FieldByName('numeronota').AsString, cadNfSD.buscas, true) then
    Exit;
  if not cadNfSD.ChecaCamposObrigatorios then
  begin
  	setFocusCampoErro(cadNfSD.vNomeCampoErro, cadNfSD.vMensagemErro);
    exit;
  end
  else if not cadNfSD.Post then
  begin
  	setFocusCampoErro(cadNfSD.vNomeCampoErro, cadNfSD.vMensagemErro);
    exit;
  end
  else
  begin
    inherited;
    if CheckCadSeq.Checked then
    begin
      cadNfSD.inserirVenda;
      if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      	DBEdit1.SetFocus;
    end;
    if vDadosIni.vSistema = 'Fiscal' then
    	Close;
    TabSheet2.Show;
    if (Self.Enabled) and (Self.Visible) and (Combobox1.CanFocus) then
    	ComboBox1.SetFocus;
  end;
end;

procedure TfrmCadNfSerieD.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if cadNfSD.Cancel then
  begin
    cadNfSD.CancelUpdates;
    cadNfSD.vItem.dataSet.Cancel;
    cadNfSD.vItem.CancelUpdates;
    if vDadosIni.vSistema = 'Fiscal' then
      Close;
    TabSheet2.Show;
    if (Self.Enabled) and (Self.Visible) and (Combobox1.CanFocus) then
    	ComboBox1.SetFocus;
  end;
end;

procedure TfrmCadNfSerieD.BitBtn64Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NSD007', 'INCLUIR',  '', 'NF_SERIE_D_ITENS', '', cadNfSD.buscas, true) then
    Exit;
  if cadNfSD.vendaFechada then
  begin
    Application.MessageBox('Notafiscal esta FECHADA','Atenção',0+64);
    Exit;
  end;
  if cadNfSD.vItem.Insert(cadNfSD) then
  begin
    Panel5.Enabled := true;
    GroupBox6.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (DBEdit13.CanFocus) then
    	DBEdit13.SetFocus;
  end;
end;

procedure TfrmCadNfSerieD.BitBtn65Click(Sender: TObject);
begin
  inherited;
  if cadNfSD.vendaFechada then
  begin
    Application.MessageBox('Notafiscal esta FECHADA','Atenção',0+64);
    Exit;
  end;
  if not cadNfSD.vItem.Post(cadNfSD) then
  begin
    Panel5.Enabled := true;
    GroupBox6.Enabled := false;
    setFocusCampoErro(cadNfSD.vItem.vNomeCampoErro, cadNfSD.vItem.vMensagemErro);
    exit;
  end
  else
  begin
    Panel5.Enabled := false;
    GroupBox6.Enabled := true;
    cadNfSD.calculaTotais;
    ActiveControl := DBEdit2;
  end;
end;

procedure TfrmCadNfSerieD.BitBtn66Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NSD009', 'ALTERAR', '', 'NF_SERIE_D_ITENS', '', cadNfSD.buscas, true) then
    Exit;
  if cadNfSD.vendaFechada then
  begin
    Application.MessageBox('Notafiscal esta FECHADA','Atenção',0+64);
    Exit;
  end;
  if cadNfSD.vItem.Edit then
  begin
    Panel5.Enabled := true;
    GroupBox6.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (DBEdit13.CanFocus) then
    	DBEdit13.SetFocus;
  end;
end;

procedure TfrmCadNfSerieD.BitBtn67Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NSD010', 'EXCLUIR', '', 'NF_SERIE_D_ITENS', '', cadNfSD.buscas, true) then
    Exit;
  if cadNfSD.vendaFechada then
  begin
    Application.MessageBox('Notafiscal esta FECHADA','Atenção',0+64);
    Exit;
  end;
  if cadNfSD.vItem.Cancel(cadNfSD) then
  begin
    cadNfSD.calculaTotais;
    GroupBox6.Enabled := true;
    Panel5.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (BitBtn64.CanFocus) then
    	BitBtn64.SetFocus;
  end;
end;

procedure TfrmCadNfSerieD.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
//  if cadNfSD.dataSet.State in [dsInsert, dsEdit] then
//    cadNfSD.dataSet.FieldByName('modelo').AsString :=
//      Copy(DBComboBox1.Text,1,2);
//  DBComboBox1.Text := DBComboBox1.Items[DBComboBox1.ItemIndex];
  if (trim(DBComboBox1.Text) = '') and (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
  begin
    Application.MessageBox('Modelo inválido','Atenção',0+64);
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;
  end;
end;

procedure TfrmCadNfSerieD.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
//  if cadNfSD.dataSet.State in [dsInsert, dsEdit] then
//    cadNfSD.dataSet.FieldByName('serie').AsString :=
//      Copy(DBComboBox2.Text,1,2);
//  DBComboBox2.Text := DBComboBox2.Items[DBComboBox2.ItemIndex];
  if (trim(DBComboBox2.Text) = '') and (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
  begin
    Application.MessageBox('Série inválida','Atenção',0+64);
    if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
    	DBComboBox2.SetFocus;
  end;
end;

procedure TfrmCadNfSerieD.DBEdit13Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn67)  then
    Exit;
  if cadNfSD.vendaFechada then
    exit;
  if TDBEdit(Sender).Text = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if cadNfSD.vItem.dataSet.State in [dsInsert, dsEdit] then
        cadNfSD.vItem.dataSet.FieldByName('num_fab_prod').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  if trim(TDBEdit(Sender).Text) <> '' then
  begin
    if not cadNfSD.vItem.buscaProduto(cadNfSD.vItem.dataSet.FieldByName('num_fab_prod').AsString, 0, '', cadNfSD) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
      	TDBEdit(Sender).SetFocus;
      Exit;
    end;
  end
  else
  begin
  	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
    	TDBEdit(Sender).SetFocus;
    Exit;
  end;
  if (Self.Enabled) and (Self.Visible) and (DBEdit19.CanFocus) then
  	DBEdit19.SetFocus;
end;

procedure TfrmCadNfSerieD.DBEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if cadNfSD.vendaFechada then
    exit;
  if Key = VK_F3 then
  begin
      DBEdit13Exit(DBEdit13);
  end;
end;

procedure TfrmCadNfSerieD.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit15.CanFocus) then
		DBEdit15.SetFocus;
end;

procedure TfrmCadNfSerieD.DBEdit15Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn67) then
    exit;
  if cadNfSD.vendaFechada then
    exit;
  if not cadNfSD.vItem.checaValoresItens then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit19.CanFocus) then
  		DBEdit19.SetFocus;
    Exit;
  end;
end;

procedure TfrmCadNfSerieD.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn64.CanFocus) then
  	BitBtn64.SetFocus;
end;

procedure TfrmCadNfSerieD.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) then
    Exit;
  if cadNfSD.vendaFechada then
    exit;

  if not (cadNfSD.dataSet.State in [dsinsert, dsedit]) then
    Exit;
  if TDbedit(sender).text = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
      if (Trim(vDadosIni.vPesquisa) = '') then vDadosIni.vPesquisa := '0';
      cadNfSD.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  if TDbedit(sender).text <> '' then
  begin
    if not cadNfSD.vCliente.LocCliente(cadNfSD.dataSet.FieldByName('COD_CLIENTE').AsInteger)
      then
    begin
    	if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
      	TDbedit(sender).SetFocus;
      exit;
    end;
  end;

  if trim(TDbedit(sender).Text) = '' then
  begin
    Application.MessageBox('Campo Cliente não pode ser vazio', 'Informação', MB_OK + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
    	TDbedit(sender).setfocus;
    exit;
  end;
end;

procedure TfrmCadNfSerieD.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if cadNfSD.vendaFechada then
    exit;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := inttostr(cadNfSD.dataSet.FieldByName('COD_CLIENTE').AsInteger);
      cadNfSD.dataSet.FieldByName('COD_CLIENTE').AsString :=
        vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    //chamar modulo cliente cadastro JC
  end;
end;

procedure TfrmCadNfSerieD.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_RETURN then
  	SpeedButton1Click(Sender)
  else if Key = VK_INSERT then
		BitBtn3Click(Sender)
  else if Key = VK_DELETE then
  	SpeedButton2Click(Sender);  
end;

procedure TfrmCadNfSerieD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cadNfSD.Cancel;
  cadNfSD.CancelUpdates;
  cadNfSD.Free;
  cadNfSD :=nil;
  Action := caFree;
  frmCadNfSerieD := nil;
end;

procedure TfrmCadNfSerieD.FormCreate(Sender: TObject);
begin
  inherited;
  if dtmNfSerieD = nil then
    dtmNfSerieD := TdtmNfSerieD.Create(dtmNfSerieD);
  if Pos('NFD_FICHAPRODUTO|', vDadosIni.vPesquisa) > 0 then
  begin
     if frmCadNfSerieD = nil then
	     frmCadNfSerieD := TfrmCadNfSerieD(Self);
     vCodNF := StrToIntDef(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2), 0);
     vDadosIni.vTipoForm := 10;
     vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  if (TelaCadastro = 10) then
  begin
    if vDadosIni.vModalOuChild <> 'M' then
      FormStyle := fsMDIChild;
  end
  else if (vDadosIni.vSistema <> 'Fiscal') then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadNfSerieD.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

  DBGrid1.DataSource := dtmNfSerieD.dsNFSD;
  TabSheet1.TabVisible :=false;
  TabSheet2.TabVisible :=false;
  TabSheet3.TabVisible :=false;
  inherited;
  cadNfSD := TNfSerieD.create;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if vDadosIni.vSistema = 'Fiscal' then
  begin
    TabSheet1.Show;
    TabSheet3.Show;
    frmCadNfSerieD.Caption := 'Registros Nota Fiscal de Venda a coonsumidor modelo 2';
    cadNfSD.inserirVenda;
    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then    
      DBEdit1.SetFocus;
    exit;
  end;
  SpeedButton25.Visible := cadNfSD.lixeiraCheia;
  SpeedButton4.Visible := not SpeedButton25.Visible;
  SpeedButton2.Hint := 'Excluir registro permanentemente -  [NSD012]';

  if (TelaCadastro = 10) then
  begin
    cadNfSD.abreNfSerieD(vCodNF);
    if cadNfSD.dataSet.IsEmpty then
    begin
      Application.MessageBox('Registro não encontrado', 'Atenção', 0 + 64);
      Self.fechar := True;
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;
    SpeedButton1Click(Sender);
  end;

end;

procedure TfrmCadNfSerieD.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('NSD003', 'ALTERAR', 'EDITAR NFSD Nº ' +
      cadNfSD.dataSet.FieldByName('numeronota').AsString, '', cadNfSD.dataSet.FieldByName('numeronota').AsString, cadNfSD.buscas, true) then
      Exit;

    if not cadNfSD.Edit then
      exit;
    PageControl3.ActivePage := TabSheet3;
    TabSheet1.Show;
    TabSheet3.Show;
    DBEdit1.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      DBEdit4.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNfSerieD.SpeedButton25Click(Sender: TObject);
begin
  inherited;
//  try
//    Screen.Cursor := crHourGlass;
//    cadNfSD.sairdaLixeira;
//    SpeedButton1.Enabled := true;
//    SpeedButton6.Enabled := True;
//    SpeedButton7.Enabled := True;
//    SpeedButton5.Enabled := false;
//    SpeedButton25.Visible := false;
//    SpeedButton4.Visible := true;
//  finally
//    Screen.Cursor := crDefault;
//  end;
  try
    Screen.Cursor := crHourGlass;
    cadNfSD.AbrirLixeira;
    SpeedButton1.Visible := false;
    SpeedButton6.Visible := false;
    SpeedButton7.Enabled := false;
    SpeedButton5.Visible := true;
    SpeedButton25.Visible := true;
    SpeedButton4.Visible := false;
    //SpeedButton2.Hint := 'Excluir registro permanentemente -  [NSD012]';
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNfSerieD.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadNfSD.Delete;
    SpeedButton25.Visible := cadNfSD.lixeiraCheia;
    SpeedButton4.Visible := not SpeedButton25.Visible;
  finally
    cadNfSD.Refresh;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNfSerieD.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadNfSD.AbrirLixeira;
    SpeedButton1.Visible := false;
    SpeedButton6.Visible := false;
    SpeedButton7.Enabled := false;
    SpeedButton25.Visible := true;
    SpeedButton4.Visible := false;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNfSerieD.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('nf_serie_d_%', cadNfSD.buscas);
end;

procedure TfrmCadNfSerieD.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadNfSD.restaurar;
    SpeedButton25.Visible := cadNfSD.lixeiraCheia;
  SpeedButton4.Visible := not SpeedButton25.Visible;
  finally
    cadNfSD.Refresh;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNfSerieD.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadNfSD.reabrirVenda;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNfSerieD.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  cadNfSD.calculaTotais;
end;

initialization
  RegisterClass(TfrmCadNfSerieD);
finalization
  UnRegisterClass(TfrmCadNfSerieD);

end.

