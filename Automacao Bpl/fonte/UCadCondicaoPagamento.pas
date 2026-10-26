unit UCadCondicaoPagamento;

interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadraoModal, grimgctrl, QRCtrls, qrpctrls,
  QuickRpt, DBCtrls, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  Controls, StdCtrls, Mask, Forms, Classes, AppEvnts, Graphics, uEditHw, Spin;

type
  TfrmCondicaoPagamento = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    DBComboBox1: TDBComboBox;
    TabSheet4: TTabSheet;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRPLabel1: TQRPLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    Label10: TLabel;
    Label11: TLabel;
    DBComboBox2: TDBComboBox;
    lbEmpresa: TQRLabel;
    DBLookupComboBox22: TDBLookupComboBox;
    Label12: TLabel;
    EditHw5: TEditHw;
    DBLookupComboBox1: TDBLookupComboBox;
    Label13: TLabel;
    tsSimulacao: TTabSheet;
    BitBtn8: TBitBtn;
    pnSimulador: TPanel;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    EditHw1: TEditHw;
    ComboBox4: TComboBox;
    ComboBox6: TComboBox;
    ComboBox5: TComboBox;
    SpinEdit1: TSpinEdit;
    MaskEdit6: TMaskEdit;
    BitBtn7: TBitBtn;
    Memo1: TMemo;
    ComboBox7: TComboBox;
    Label23: TLabel;
    Label24: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    lbDiaFixo: TLabel;
    lbInformarDia: TLabel;
    Panel4: TPanel;
    Label25: TLabel;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    Label26: TLabel;
    BitBtn9: TBitBtn;
    Panel5: TPanel;
    BitBtn10: TBitBtn;
    Label27: TLabel;
    DBEdit5: TDBEdit;
    SpinEdit2: TSpinEdit;
    Label28: TLabel;
    SpeedButton59: TSpeedButton;
    Label50: TLabel;
    DBComboBox3: TDBComboBox;
    Label29: TLabel;
    DBComboBox4: TDBComboBox;
    tsCondPagClienteVendas: TTabSheet;
    tsCondPagClientePrestacoes: TTabSheet;
    pnCondicaoPagClienteVendas: TPanel;
    pnTopAlterarVendCli: TPanel;
    BitBtn47: TBitBtn;
    BitBtn53: TBitBtn;
    RadioGroup1: TRadioGroup;
    GroupBox15: TGroupBox;
    DBText4: TDBText;
    Label71: TLabel;
    DBText5: TDBText;
    pnCondicaoPagClientePrestacoes: TPanel;
    Panel7: TPanel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RadioGroup2: TRadioGroup;
    GroupBox5: TGroupBox;
    DBText1: TDBText;
    Label30: TLabel;
    DBText2: TDBText;
    tsDefinirCondPagPorEmpresa: TTabSheet;
    pnDefinirCondPagPorEmpresa: TPanel;
    Panel12: TPanel;
    pnDefinirControlePorEmpresaBottom: TPanel;
    pnDefinirCondPagPorEmpresaTop: TPanel;
    btSelectAllDefControleEmpresa: TSpeedButton;
    btUnSelectAllDefControleEmpresa: TSpeedButton;
    DBGridDefinirControlePorEmpresa: TDBGrid;
    btDefinirEmp: TBitBtn;
    btnMultiempresaOK: TBitBtn;
    btnMultiempresaCancelar: TBitBtn;
    MarcarTodasCondPagClick: TMenuItem;
    DesmarcarTodasCondPagClick: TMenuItem;
    btUnSelectAll: TSpeedButton;
    btSelectAll: TSpeedButton;
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DesmarcarTodasCondPagClickClick(Sender: TObject);
    procedure MarcarTodasCondPagClickClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnMultiempresaOKClick(Sender: TObject);
    procedure btnMultiempresaCancelarClick(Sender: TObject);
    procedure btDefinirEmpClick(Sender: TObject);
    procedure DBGridDefinirControlePorEmpresaCellClick(Column: TColumn);
    procedure DBGridDefinirControlePorEmpresaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btUnSelectAllDefControleEmpresaClick(Sender: TObject);
    procedure btSelectAllDefControleEmpresaClick(Sender: TObject);
    procedure DBGridDefinirControlePorEmpresaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn53Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure lbDiaFixoClick(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure ComboBox7Exit(Sender: TObject);
    procedure ComboBox6Exit(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure EditHw5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox22Exit(Sender: TObject);
    procedure EditHw5Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCondicaoPagamento: TfrmCondicaoPagamento;
  obCondicaoPagamento: TCondicaoPagamento;

implementation

uses UDtmCadastrosBasicos, UdadosIni, UdtmAtivo, DB, SysUtils, Messages, hw_utils;

{$R *.dfm}

procedure TfrmCondicaoPagamento.BitBtn11Click(Sender: TObject);
begin
  TForm(pnCondicaoPagClientePrestacoes.Parent).ModalResult := IDOK;
end;

procedure TfrmCondicaoPagamento.BitBtn12Click(Sender: TObject);
begin
  TForm(pnCondicaoPagClientePrestacoes.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCondicaoPagamento.BitBtn1Click(Sender: TObject);
begin
	SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS090]';

  if vDadosIni.PesqPros('BAS097', 'PESQUISAR', '', 'COND_PAG', '', obCondicaoPagamento.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not obCondicaoPagamento.ConsultaCampos('COND_PAG', ComboBox1.Text,
        'COND_PAG.COD_COND_PAG', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
        'COND_PAG.*, COND_PAG_TABPRECO.COD_TAB_PRECO',
        'LEFT JOIN COND_PAG_TABPRECO ON COND_PAG_TABPRECO.COD_COND_PAG = COND_PAG.COD_COND_PAG AND COND_PAG_TABPRECO.COD_EMPRESA = '+vDadosIni.codEmpresa, '') then
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not obCondicaoPagamento.ConsultaCampos('COND_PAG', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, 'COND_PAG.COD_COND_PAG', true, vDadosIni.codEmpresa,
      'COND_PAG.*, COND_PAG_TABPRECO.COD_TAB_PRECO',
      'LEFT JOIN COND_PAG_TABPRECO ON COND_PAG_TABPRECO.COD_COND_PAG = COND_PAG.COD_COND_PAG AND COND_PAG_TABPRECO.COD_EMPRESA = '+vDadosIni.codEmpresa, '') then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    SpeedButton6.Visible := true;
    SpeedButton8.Visible := true;
    SpeedButton7.Visible := obCondicaoPagamento.vEmpresaDefCondPag.dataSet.RecordCount > 1;
    if obCondicaoPagamento.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    obCondicaoPagamento.ultimasql := obCondicaoPagamento.dataset.CommandText;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCondicaoPagamento.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    exit;
  end;

  if not vDadosIni.PesqPros('BAS088', 'INCLUIR', '', 'COND_PAG', '', obCondicaoPagamento.buscas, true) then
    Exit;

  if not obCondicaoPagamento.Insert then
  	exit;

  obCondicaoPagamento.vEmpresaDefCondPag.abreEmpresaDefCondPag(0);

  if obCondicaoPagamento.vEmpresaDefCondPag.dataSet.RecordCount > 1 then
    if not obCondicaoPagamento.abreFormDefinirCondPagPorEmpresa then
    begin
    	obCondicaoPagamento.Cancel;
    	obCondicaoPagamento.RollBackTransacao;
      exit;
    end;

  inherited;

  EditHw5.AsValue := 0;
  DBLookupComboBox22.KeyValue := 0;

  Label50.Visible := vDadosIni.vCliente.vCondPagPorCliente;
  DBComboBox3.Visible := vDadosIni.vCliente.vCondPagPorCliente;
  Label29.Visible := vDadosIni.vCliente.vCondPagPorCliente;
  DBComboBox4.Visible := vDadosIni.vCliente.vCondPagPorCliente;

  PageControl3.ActivePage:=TabSheet3;
  TabSheet3.Caption := 'Cadastro Condição de Pagamento';
  TabSheet3.TabVisible := True;
  TabSheet3.Show;

  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
end;

procedure TfrmCondicaoPagamento.BitBtn47Click(Sender: TObject);
begin
	TForm(pnCondicaoPagClienteVendas.Parent).ModalResult := IDOK;
end;

procedure TfrmCondicaoPagamento.BitBtn4Click(Sender: TObject);
begin
  if not obCondicaoPagamento.Post then
    setFocusCampoErro(obCondicaoPagamento.vNomeCampoErro)
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obCondicaoPagamento.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
    begin
      inherited;
      //      obCondicaoPagamento.abreCondicaoPagamento;
    end;
  end;
end;

procedure TfrmCondicaoPagamento.BitBtn53Click(Sender: TObject);
begin
  TForm(pnCondicaoPagClienteVendas.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCondicaoPagamento.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obCondicaoPagamento.Cancel;
  obCondicaoPagamento.RollBackTransacao;
//  if vDadosIni.PesqPros('BAS096','CANCELAR', '','COND_PAG',obCondicaoPagamento.dataSet.FieldByName('COD_COND_PAG').AsString, obCondicaoPagamento.buscas, true) then
//  begin
//    ActiveControl := BitBtn5;
//    PageControl1.ActivePage := TabSheet2;
//  end;
end;

procedure TfrmCondicaoPagamento.BitBtn7Click(Sender: TObject);
var
  Aretorno: RParcelamentos;
  I, J: Integer;
begin
  inherited;
  Aretorno := obCondicaoPagamento.MontarPacelamento(0, MaskEdit4.Text, EditHw1.AsValue, MaskEdit5.Text,
    Copy(ComboBox4.Text, 1, 2), Copy(ComboBox6.Text, 1, 1), Copy(ComboBox7.Text, 1, 3), Copy(ComboBox5.Text, 1, 2),
    SpinEdit1.Value, 0, StrToDate(MaskEdit6.Text), 0, SpinEdit2.Value);

  Memo1.Lines.Clear;
  Memo1.Lines.Add('Num Doc          Vencimento           Valor');
  for I := Low(Aretorno) to High(Aretorno) do
  begin
    Memo1.Lines.Add(
      vDadosIni.Space(Aretorno[I].NumeroDocumento, 9) + '        ' +
      FormatDateTime( 'dd/mm/yyyy', Aretorno[I].DataVencimento) + '        ' +
      Format( '%8.2n', [Aretorno[I].ValorParcela]));
    if Assigned(Aretorno[I].Feriados) then
      for J := 0 to Aretorno[I].Feriados.Count - 1 do
        Memo1.Lines.Add('                   ' + Aretorno[I].Feriados[J]);
  end;
end;

procedure TfrmCondicaoPagamento.BitBtn8Click(Sender: TObject);
begin
  inherited;
  MaskEdit4.Text := obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString;
  MaskEdit5.Text := '123456';
  EditHw1.AsValue := 100;
  ComboBox4.Text := '';
  ComboBox5.Text := '';
  ComboBox6.Text := '';
  ComboBox7.Text := '';
  SpinEdit1.Value := 0;
  SpinEdit2.Value := 0;
  MaskEdit6.Text := FormatDateTime('dd/mm/yyyy', Date);
  vDadosIni.abreForm('Simulador de parcelas', pnSimulador, [ofAutoSize, ofAutoScroll, ofEscapeExit]);
end;

procedure TfrmCondicaoPagamento.btDefinirEmpClick(Sender: TObject);
begin
  inherited;
	if not obCondicaoPagamento.abreFormDefinirCondPagPorEmpresa then
  	exit;
end;

procedure TfrmCondicaoPagamento.btnMultiempresaCancelarClick(Sender: TObject);
begin
  inherited;
	TForm(pnDefinirCondPagPorEmpresa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCondicaoPagamento.btnMultiempresaOKClick(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (btnMultiempresaOK.CanFocus) then
  	btnMultiempresaOK.SetFocus;

  TForm(pnDefinirCondPagPorEmpresa.Parent).ModalResult := IDOK;
end;

procedure TfrmCondicaoPagamento.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obCondicaoPagamento._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCondicaoPagamento.btSelectAllDefControleEmpresaClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    obCondicaoPagamento.vEmpresaDefCondPag._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCondicaoPagamento.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obCondicaoPagamento._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCondicaoPagamento.btUnSelectAllDefControleEmpresaClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    obCondicaoPagamento.vEmpresaDefCondPag._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCondicaoPagamento.ComboBox5Exit(Sender: TObject);
begin
  inherited;
  if (Pos('X', UpperCase(MaskEdit4.Text)) > 0) and //3x, 4x
    (StrToIntDef(Trim(copy(MaskEdit4.Text, 1, Pos('X', UpperCase(MaskEdit4.Text)) - 1)), -1) > 0) and
    (vDadosIni.strIn(Copy(ComboBox5.Text, 1, 2), ['D1', 'D2', 'D3', 'D4', 'D5', 'D6', 'D7'])) then
  begin
    ComboBox6.Tag := ComboBox6.ItemIndex;
    ComboBox6.Text := '';
    ComboBox6.Enabled := False;

//    ComboBox7.Tag := ComboBox7.ItemIndex;
//    ComboBox7.Text := '';
//    ComboBox7.Enabled := False;

    SpinEdit1.Enabled := True;
  end
  else
  begin
    ComboBox6.Enabled := True;
    ComboBox6.ItemIndex := ComboBox6.Tag;

//    ComboBox7.Enabled := True;
//    ComboBox7.ItemIndex := ComboBox7.Tag;


    SpinEdit1.Enabled := False;
    SpinEdit1.Value := 0;
  end;
end;

procedure TfrmCondicaoPagamento.ComboBox6Exit(Sender: TObject);
begin
  inherited;
  ComboBox6.Tag := ComboBox6.ItemIndex;
end;

procedure TfrmCondicaoPagamento.ComboBox7Exit(Sender: TObject);
begin
  inherited;
  ComboBox7.Tag := ComboBox7.ItemIndex;
end;

procedure TfrmCondicaoPagamento.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  TDBComboBox(sender).SelectAll;
  if (UpperCase(key) <> '1') and (UpperCase(key) <> '2') and (UpperCase(key) <> '3') and (UpperCase(key) <> '4') then
    key := #0;
end;

procedure TfrmCondicaoPagamento.DBComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  TDBComboBox(sender).SelectAll;
  if (UpperCase(key) <> 'V') and (UpperCase(key) <> 'C') and (UpperCase(key) <> 'T') then
    key := #0;
end;

procedure TfrmCondicaoPagamento.DBEdit2Change(Sender: TObject);
begin
  inherited;
  lbDiaFixo.Enabled :=
    (Pos('X', UpperCase(DBEdit2.Text)) > 0) and //3x, 4x
    (StrToIntDef(Trim(copy(DBEdit2.Text, 1, Pos('X', UpperCase(DBEdit2.Text)) - 1)), -1) > 0);
  lbInformarDia.Enabled := lbDiaFixo.Enabled;
end;

procedure TfrmCondicaoPagamento.DBGrid1CellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    obCondicaoPagamento._marcaDesmarcaLinha;
end;

procedure TfrmCondicaoPagamento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCondicaoPagamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not obCondicaoPagamento.dataSet.IsEmpty then
      obCondicaoPagamento._marcaDesmarcaLinha;
end;

procedure TfrmCondicaoPagamento.DBGridDefinirControlePorEmpresaCellClick(
  Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    obCondicaoPagamento.vEmpresaDefCondPag._marcaDesmarcaLinha;
end;

procedure TfrmCondicaoPagamento.DBGridDefinirControlePorEmpresaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then      
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCondicaoPagamento.DBGridDefinirControlePorEmpresaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if Key = VK_TAB then
  	Perform(WM_NEXTDLGCTL, 0, 0)
  else if Key = VK_SPACE then
    obCondicaoPagamento.vEmpresaDefCondPag._marcaDesmarcaLinha
  else if Key = VK_RETURN then
  	btnMultiempresaOKClick(Sender);
end;

procedure TfrmCondicaoPagamento.DBLookupComboBox22Exit(Sender: TObject);
begin
  inherited;
  EditHw5.AsValue := DBLookupComboBox22.KeyValue;
end;

procedure TfrmCondicaoPagamento.DesmarcarTodasCondPagClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obCondicaoPagamento._desmarcarTodos;
    
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCondicaoPagamento.EditHw5Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox22.KeyValue := EditHw5.AsInteger;
end;

procedure TfrmCondicaoPagamento.EditHw5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if Key = VK_F3 then
   begin
     vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PROMOCAO', ' and ((data_ini is null) or (data_fim is null)) and cod_promocao > 0 ', 'Tabela de Preço');
     if trim(vDadosIni.vPesquisa) <> '' then
       EditHw5.Text := vDadosIni.vPesquisa;
   end;
end;

procedure TfrmCondicaoPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obCondicaoPagamento.Cancel;
  obCondicaoPagamento.RollBackTransacao;
  obCondicaoPagamento.free;
  Action := caFree;
  FrmCondicaoPagamento := nil;
end;

procedure TfrmCondicaoPagamento.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  obCondicaoPagamento := TCondicaoPagamento.create;
  obCondicaoPagamento.vEmpresaDefCondPag.abreEmpresaDefCondPag(0);
  SpeedButton7.Visible := obCondicaoPagamento.vEmpresaDefCondPag.dataSet.RecordCount > 1;
  btDefinirEmp.Visible := obCondicaoPagamento.vEmpresaDefCondPag.dataSet.RecordCount > 1;

  TabSheet4.TabVisible := False;
  tsDefinirCondPagPorEmpresa.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCondicaoPagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if PageControl3.ActivePage = TabSheet3 then
      BitBtn5Click(Sender);
  end;
end;

procedure TfrmCondicaoPagamento.FormShow(Sender: TObject);
var
  I: integer;
begin
  tsSimulacao.TabVisible := False;
  tsCondPagClienteVendas.TabVisible := False;
  tsCondPagClientePrestacoes.TabVisible := False;

  SpeedButton6.Visible := vDadosIni.vCliente.vCondPagPorCliente;
  SpeedButton8.Visible := vDadosIni.vCliente.vCondPagPorCliente;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsCondPgto;

    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

    obCondicaoPagamento.lkModalidade.setDadosDataSet(
      ['D', 'S', 'Q', 'M'], ['D - Direta', 'S - Fora semana', 'Q - Fora quinzena', 'M - Fora mes'], DBLookupComboBox1);

    obCondicaoPagamento.lkConsideraDiaUtil.setDadosDataSet(
      ['N', 'S', 'S1', 'SA', 'SA1'], ['N - Não', 'S  - Sim', 'S1 - Sim, somente primeira parcela', 'SA - Sim, antecipar vencimento', 'SA1 - Sim, antecipar vencimento, somente primeira parcela'], DBLookupComboBox2);

		obCondicaoPagamento.vEmpresaDefCondPag.abreEmpresaDefCondPag(0);
  	SpeedButton7.Visible := obCondicaoPagamento.vEmpresaDefCondPag.dataSet.RecordCount > 1;
    btDefinirEmp.Visible := obCondicaoPagamento.vEmpresaDefCondPag.dataSet.RecordCount > 1;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not obCondicaoPagamento.statusLixeira);
  end;
end;

procedure TfrmCondicaoPagamento.lbDiaFixoClick(Sender: TObject);
var
  ADiaFixo, AInformarDia: Boolean;
begin
  inherited;
  if (lbDiaFixo.Enabled) and (obCondicaoPagamento.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if ActiveControl = DBEdit2 then
      Perform(WM_NEXTDLGCTL, 0, 0);

    ADiaFixo     := Pos('[DIA FIXO]'    , obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString) > 0;
    AInformarDia := Pos('[INFORMAR DIA]', obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString) > 0;

//    if (TComponent(Sender).Name = lbDiaFixo.Name) then

    if (Sender = lbDiaFixo) then
      if ADiaFixo then
      begin
        obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString :=
          StringReplace(obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString, ' [DIA FIXO]', '', [rfReplaceAll]);
        obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString :=
          StringReplace(obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString, '[DIA FIXO]', '', [rfReplaceAll]);
      end
      else
        obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString :=
          Trim(obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString) + ' [DIA FIXO]';

//    if (TComponent(Sender).Name is lbInformarDia.Name) then
    if (Sender = lbInformarDia) then
      if AInformarDia then
      begin
        obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString :=
          StringReplace(obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString, ' [INFORMAR DIA]', '', [rfReplaceAll]);
        obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString :=
          StringReplace(obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString, '[INFORMAR DIA]', '', [rfReplaceAll]);
      end
      else
        obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString :=
          Trim(obCondicaoPagamento.dataSet.FieldByName('DESC_COND_PAG').AsString) + ' [INFORMAR DIA]';

//  obCondicaoPagamento.dataSet.
  end;
end;

procedure TfrmCondicaoPagamento.MarcarTodasCondPagClickClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obCondicaoPagamento._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCondicaoPagamento.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCondicaoPagamento.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Condições de Pagamento');
end;

procedure TfrmCondicaoPagamento.SpeedButton1Click(Sender: TObject);
begin
 	if obCondicaoPagamento.dataSet.IsEmpty then
  	exit;

  if not vDadosIni.PesqPros('BAS089', 'ALTERAR', '', 'COND_PAG', obCondicaoPagamento.dataSet.FieldByName('COD_COND_PAG').AsString, obCondicaoPagamento.buscas, true) then
	  exit;

  if not obCondicaoPagamento.Edit then
    exit;

  obCondicaoPagamento.vEmpresaDefCondPag.abreEmpresaDefCondPag(obCondicaoPagamento.dataSet.FieldByName('cod_cond_pag').AsInteger);

  inherited;
  EditHw5.AsValue := obCondicaoPagamento.BuscarCodTabPrec;
  DBLookupComboBox22.KeyValue := EditHw5.AsInteger;

  Label50.Visible := vDadosIni.vCliente.vCondPagPorCliente;
  DBComboBox3.Visible := vDadosIni.vCliente.vCondPagPorCliente;
  Label29.Visible := vDadosIni.vCliente.vCondPagPorCliente;
  DBComboBox4.Visible := vDadosIni.vCliente.vCondPagPorCliente;

  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := True;
  TabSheet3.Caption := 'Alterando Condição de Pagamento';
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
end;

procedure TfrmCondicaoPagamento.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS093', 'ABRIR A LIXEIRA', '', 'COND_PAG', '', obCondicaoPagamento.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      if not obCondicaoPagamento.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira - [BAS090]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
        SpeedButton6.Visible := true;
        SpeedButton8.Visible := true;
        SpeedButton7.Visible := obCondicaoPagamento.vEmpresaDefCondPag.dataSet.RecordCount > 1;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente - [BAS091]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
        SpeedButton6.Visible := false;
        SpeedButton8.Visible := false;
        SpeedButton7.Visible := false;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCondicaoPagamento.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    inherited;
    if not obCondicaoPagamento.Delete then
      Exit;

    vStatusLixeira := obCondicaoPagamento.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);
      
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obCondicaoPagamento.Cancel;
      obCondicaoPagamento.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCondicaoPagamento.SpeedButton3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS092', 'IMPRIMIR', '', 'CONG_PAG', '', obCondicaoPagamento.buscas, true) then
  begin
    inherited;
    QuickRep1.Preview;
  end;
end;

procedure TfrmCondicaoPagamento.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('cond_pag_%', obCondicaoPagamento.buscas);
end;

procedure TfrmCondicaoPagamento.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not obCondicaoPagamento.restaurarRegistro then
  	Exit;
    
  if obCondicaoPagamento.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TfrmCondicaoPagamento.SpeedButton6Click(Sender: TObject);
begin
	if not vDadosIni.PesqPros('BAS501', 'IMPRIMIR', '', 'CONG_PAG', '', obCondicaoPagamento.buscas, true) then
  	exit;

  if obCondicaoPagamento.dataSet.IsEmpty then
  	exit;

	obCondicaoPagamento.abreFormIncluirCondPagClienteVenda;
end;

procedure TfrmCondicaoPagamento.SpeedButton7Click(Sender: TObject);
begin
  if obCondicaoPagamento.dataSet.IsEmpty then
  	exit;

  obCondicaoPagamento.vEmpresaDefCondPag.abreEmpresaDefCondPag(obCondicaoPagamento.dataSet.FieldByName('cod_cond_pag').AsInteger);

  pnDefinirCondPagPorEmpresaTop.Caption := IntToStr(obCondicaoPagamento.dataSet.FieldByName('cod_cond_pag').AsInteger) +
  	' - ' + trim(obCondicaoPagamento.dataSet.FieldByName('desc_cond_pag').AsString);
	if not obCondicaoPagamento.abreFormDefinirCondPagPorEmpresa then
  	exit;

  if not obCondicaoPagamento.definirCondPagPorEmpresa then
  	exit;
end;

procedure TfrmCondicaoPagamento.SpeedButton8Click(Sender: TObject);
begin
	if not vDadosIni.PesqPros('BAS504', 'IMPRIMIR', '', 'CONG_PAG', '', obCondicaoPagamento.buscas, true) then
  	exit;

  if obCondicaoPagamento.dataSet.IsEmpty then
  	exit;

	obCondicaoPagamento.abreFormIncluirCondPagClientePrestacao;
end;

end.

