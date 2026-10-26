unit uCadRegrasTravOsReq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, QRCtrls, QuickRpt;

type
  TfrmCadRegrasTravReqOS = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    TabSheet4: TTabSheet;
    qrpRegrasTravOsReq: TQuickRep;
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
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    Label11: TLabel;
    Label12: TLabel;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRegrasTravReqOS: TfrmCadRegrasTravReqOS;

implementation

uses UDtmCadastrosBasicos, uDtmAtivo, UClassesCadastrosBasicos;

{$R *.dfm}

procedure TfrmCadRegrasTravReqOS.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS477', 'CONSULTA', '', 'REGRAS_TRAVOSREQ', '',
    CadRegrasTravReqOS.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not CadRegrasTravReqOS.ConsultaCampos('REGRAS_TRAVOSREQ', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not CadRegrasTravReqOS.ConsultaCampos('REGRAS_TRAVOSREQ', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadRegrasTravReqOS.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  try
    if not CadRegrasTravReqOS.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    DBComboBox1.Enabled := true;
    DBComboBox2.Enabled := true;
    DBEdit1.Enabled := true;
    DBEdit2.Enabled := false;
    DBEdit3.Enabled := true;

    CadRegrasTravReqOS.verificatipovenda2(DBComboBox2, 'REQ');
    CadRegrasTravReqOS.verificatipovenda(ComboBox5, 'REQ');

    for I := 0 to ComboBox4.Items.Count - 1 do
    	if (trim(ComboBox4.Items[I]) = trim(CadRegrasTravReqOS.dataSet.FieldByName('TIPO').AsString)) then
      begin
	    	DBComboBox1.ItemIndex := I;
        break;
      end;

    for I := 0 to ComboBox5.Items.Count - 1 do
    	if (trim(ComboBox5.Items[I]) = trim(CadRegrasTravReqOS.dataSet.FieldByName('TIPV').AsString)) then
      begin
	    	DBComboBox2.ItemIndex := I;
        Break;
      end;

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      DBComboBox2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadRegrasTravReqOS.Cancel;
      CadRegrasTravReqOS.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadRegrasTravReqOS.BitBtn4Click(Sender: TObject);
var
	vIndexTipo: Integer;
  vIndexTipV: Integer;
begin
	vIndexTipo := DBComboBox1.ItemIndex;
  vIndexTipV := DBComboBox2.ItemIndex;

  CadRegrasTravReqOS.dataSet.FieldByName('TIPO').AsString := trim(ComboBox4.Items[DBComboBox1.ItemIndex]);
  CadRegrasTravReqOS.dataSet.FieldByName('TIPV').AsString := trim(ComboBox5.Items[DBComboBox2.ItemIndex]);
  DBComboBox1.ItemIndex := vIndexTipo;
  DBComboBox2.ItemIndex := vIndexTipV;
  if not CadRegrasTravReqOS.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    DBComboBox1.ItemIndex := vIndexTipo;
    DBComboBox2.ItemIndex := vIndexTipV;
    setFocusCampoErro(CadRegrasTravReqOS.vNomeCampoErro, CadRegrasTravReqOS.vMensagemErro);
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
      if CadRegrasTravReqOS.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        
        if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
          DBComboBox1.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
          DBComboBox2.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          DBEdit1.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          DBEdit2.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
          DBEdit3.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadRegrasTravReqOS.BitBtn5Click(Sender: TObject);
begin
  inherited;
	CadRegrasTravReqOS.Cancel;
  CadRegrasTravReqOS.RollBackTransacao;
end;

procedure TfrmCadRegrasTravReqOS.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  CadRegrasTravReqOS.verificatipovenda2(DBComboBox2, DBComboBox1.Items[DBComboBox1.ItemIndex]);
	CadRegrasTravReqOS.verificatipovenda(ComboBox5, DBComboBox1.Items[DBComboBox1.ItemIndex]);

  DBEdit2.Enabled := DBComboBox1.ItemIndex = 2;
  if not DBEdit2.Enabled then
  	CadRegrasTravReqOS.dataSet.FieldByName('QTDE_DIAS_RES').AsInteger := 0;
end;

procedure TfrmCadRegrasTravReqOS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadRegrasTravReqOS.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadRegrasTravReqOS := TCadRegrasTravReqOS.create;
  tsCadastro.TabVisible := False;
  TabSheet4.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadRegrasTravReqOS.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsRegrasTravOsReq;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira - [BAS480]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadRegrasTravReqOS._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadRegrasTravReqOS.lbEmpresaPrint(sender: TObject;
  var Value: string);
begin
  inherited;
	Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadRegrasTravReqOS.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  try
    if CadRegrasTravReqOS.dataSet.IsEmpty then
      Exit;
    if not CadRegrasTravReqOS.Edit then
      Exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    DBComboBox1.Enabled := false;
    DBComboBox2.Enabled := false;
    DBEdit1.Enabled := true;
    DBEdit2.Enabled := trim(CadRegrasTravReqOS.dataSet.FieldByName('TIPO').AsString) = 'ESF';
    DBEdit3.Enabled := true;

    CadRegrasTravReqOS.verificatipovenda2(DBComboBox2, trim(CadRegrasTravReqOS.dataSet.FieldByName('TIPO').AsString));
    CadRegrasTravReqOS.verificatipovenda(ComboBox5, trim(CadRegrasTravReqOS.dataSet.FieldByName('TIPO').AsString));

    for I := 0 to ComboBox4.Items.Count - 1 do
    	if (trim(ComboBox4.Items[I]) = trim(CadRegrasTravReqOS.dataSet.FieldByName('TIPO').AsString)) then
      begin
	    	DBComboBox1.ItemIndex := I;
        Break;
      end;

    for I := 0 to ComboBox5.Items.Count - 1 do
    	if (trim(ComboBox5.Items[I]) = trim(CadRegrasTravReqOS.dataSet.FieldByName('TIPV').AsString)) then
      begin
	    	DBComboBox2.ItemIndex := I;
        Break;
      end;

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      DBComboBox2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadRegrasTravReqOS.Cancel;
      CadRegrasTravReqOS.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadRegrasTravReqOS.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS484', 'ABRIR A LIXEIRA', '', 'REGRAS_TRAVOSREQ',
    '', CadRegrasTravReqOS.buscas, true) then
    Exit;

  inherited;

  if not CadRegrasTravReqOS._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira - [BAS480]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente - [BAS481]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadRegrasTravReqOS.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    CadRegrasTravReqOS.Delete;
    lixeiraVazia(not CadRegrasTravReqOS._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadRegrasTravReqOS.Cancel;
      CadRegrasTravReqOS.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadRegrasTravReqOS.SpeedButton3Click(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('BAS485', 'IMPRIMIR', '', 'REGRAS_TRAVOSREQ',
    '', CadRegrasTravReqOS.buscas, true) then
    exit;

  qrpRegrasTravOsReq.Preview;
end;

procedure TfrmCadRegrasTravReqOS.SpeedButton5Click(Sender: TObject);
begin
  if CadRegrasTravReqOS._restauraLixeira then
    lixeiraVazia(not CadRegrasTravReqOS._lixeiraCheia);
end;

end.
