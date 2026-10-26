unit UCadDepartamentos;

interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadrao, DBCtrls, ExtCtrls, Menus,
  ComCtrls, Buttons, Grids, DBGrids, Controls, StdCtrls, Mask, Forms, Classes,
  QRCtrls, QuickRpt, AppEvnts,UcadPadraoModal, Graphics;

type
  TFrmCadDepartamento = class(TfrmCadPadraoM)
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    TabSheet4: TTabSheet;
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRDBText13: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    lbEmpresa: TQRLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadDepartamento: TFrmCadDepartamento;
  Departamento: TDepartamentos;

implementation

uses
  uDtmAtivo, UDtmCadastrosBasicos;

{$R *.dfm}

procedure TFrmCadDepartamento.BitBtn1Click(Sender: TObject);
begin
  inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS003]';
    
  if MaskEdit2.Visible then
  begin
    if not Departamento.ConsultaCampos('DEPTO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not Departamento.ConsultaCampos('DEPTO', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if Departamento.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
  Departamento.ultimasql := Departamento.dataset.CommandText;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmCadDepartamento.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS001', 'INSERIR', '', 'DEPTO', '', Departamento.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      if Departamento.Insert then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrando novo departamento';
        TabSheet3.TabVisible := true;
        TabSheet3.Show;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadDepartamento.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
  try
    Screen.Cursor := crHourGlass;
    if not Departamento.Post then
    begin
      PageControl3.ActivePage := TabSheet3;
	    setFocusCampoErro(Departamento.vNomeCampoErro, Departamento.vMensagemErro);
    end
    else
    begin
      if CheckCadSeq.Checked then
      begin
        if Departamento.Insert then
        	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;
        MudaCor;
      end
      else
        inherited;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadDepartamento.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS007', 'CANCELAR', '', 'DEPTO', '', Departamento.buscas, true) then
//  if vDadosIni.PesqPros('BAS007', '', Departamento.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      PageControl1.ActivePage := TabSheet2;
      Departamento.Cancel;
      Departamento.RollBackTransacao;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadDepartamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadDepartamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Departamento.Cancel;
  Departamento.RollBackTransacao;
  Departamento.Destroy;
  Action := caFree;
  FrmCadDepartamento := nil;

end;

procedure TFrmCadDepartamento.FormCreate(Sender: TObject);
begin
  inherited;
  TabSheet4.TabVisible := False;
  DBGrid1.DataSource := DtmCadBasicos.dsDepartamentos;
  Departamento := TDepartamentos.create;
  Departamento.abreDepartamentos;
  TelaCadastro := vDadosIni.vTipoForm;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadDepartamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end;
end;

procedure TFrmCadDepartamento.FormShow(Sender: TObject);
begin
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadDepartamento.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TFrmCadDepartamento.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Departamentos da Empresa');
end;

procedure TFrmCadDepartamento.SpeedButton1Click(Sender: TObject);
begin
  if not Departamento.dataSet.IsEmpty then
    if vDadosIni.PesqPros('BAS002', 'EDITAR', '', 'DEPTO', Departamento.dataSet.FieldByName('COD_DEPTO').AsString, Departamento.buscas, true) then
    begin
      if Departamento.dataSet.FieldByName('ATIVO').AsInteger = 1 then
        if Departamento.Edit then
        begin
          inherited;
          PageControl1.ActivePage := TabSheet1;
          TabSheet1.Show;
          TabSheet3.Caption := 'Alterando departamento';
          TabSheet3.TabVisible := true;
          PageControl3.ActivePage := TabSheet3;
          if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;
          Departamento.abreDeptoFinanceiro;
          Departamento.PreencheCampos;
        end;
    end;
end;

procedure TFrmCadDepartamento.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS004', 'ABRIR A LIXEIRA', '', 'DEPTO', '', Departamento.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      if not Departamento.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS003]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS003]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadDepartamento.SpeedButton2Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS003', '', '', 'BAIRROS', '', Departamento.buscas, false) then
  begin
    inherited;
    Departamento.Delete;
    if Departamento.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TFrmCadDepartamento.SpeedButton3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS106', 'IMPRIMIR', '', 'DEPTO', '', Departamento.buscas, true) then
  begin
    inherited;
    QuickRep1.Preview;
  end;
end;

procedure TFrmCadDepartamento.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS005', '', '', 'DEPTO', '', Departamento.buscas, false) then
  begin
    inherited;
    Departamento.restauraRegistro;
    if Departamento.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

end.

