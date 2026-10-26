unit UCadRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, uclassesRecibo, DB, QRCtrls, qrpctrls, grimgctrl,
  QuickRpt, AppEvnts;

type
  TfrmCadRecibo = class(TfrmCadPadraoM)
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label17: TLabel;
    CheckBox2: TCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    Label23: TLabel;
    DBEdit15: TDBEdit;
    DBText4: TDBText;
    DBText3: TDBText;
    DBText2: TDBText;
    DBText1: TDBText;
    tsRecebimento: TTabSheet;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    tsHistorico: TTabSheet;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn10: TBitBtn;
    BtnExcluirBaixa: TBitBtn;
    TabSheet4: TTabSheet;
    ScrollBox4: TScrollBox;
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRShape2: TQRShape;
    QRPShape1: TQRPShape;
    QRHRule1: TQRHRule;
    QRPLabel1: TQRPLabel;
    QRPLabel3: TQRPLabel;
    QRPLabel5: TQRPLabel;
    QRPLabel6: TQRPLabel;
    QRPLabel7: TQRPLabel;
    QRPLabel8: TQRPLabel;
    QRLabel30: TQRLabel;
    QRHRule2: TQRHRule;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape1: TQRShape;
    QRPShape2: TQRPShape;
    QRHRule3: TQRHRule;
    QRPLabel2: TQRPLabel;
    QRPLabel4: TQRPLabel;
    QRPLabel9: TQRPLabel;
    QRPLabel10: TQRPLabel;
    QRPLabel11: TQRPLabel;
    QRPLabel12: TQRPLabel;
    QRLabel5: TQRLabel;
    QRHRule4: TQRHRule;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape3: TQRShape;
    DBCheckBox1: TDBCheckBox;
    TabSheet5: TTabSheet;
    ScrollBox5: TScrollBox;
    GroupBox6: TGroupBox;
    Shape5: TShape;
    Shape6: TShape;
    Label15: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit27: TDBEdit;
    CheckBox4: TCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit28: TDBEdit;
    Label34: TLabel;
    SpeedButton40: TSpeedButton;
    TabSheet6: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label32: TLabel;
    Label19: TLabel;
    Label33: TLabel;
    Label26: TLabel;
    Label31: TLabel;
    Shape4: TShape;
    ScrollBox6: TScrollBox;
    QuickRep2: TQuickRep;
    QRBand1: TQRBand;
    QRSchape3: TQRShape;
    QRPShape3: TQRPShape;
    QRHRule5: TQRHRule;
    QRPLabel13: TQRPLabel;
    QRPLabel14: TQRPLabel;
    QRPLabel15: TQRPLabel;
    QRPLabel16: TQRPLabel;
    QRPLabel17: TQRPLabel;
    QRPLabel18: TQRPLabel;
    QRHRule6: TQRHRule;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel6: TQRLabel;
    SummaryBand2: TQRBand;
    QRShape6: TQRShape;
    QRPLabel25: TQRPLabel;
    QRDBText41: TQRDBText;
    QRPLabel26: TQRPLabel;
    QRPLabel27: TQRPLabel;
    QRDBText22: TQRDBText;
    QRShape4: TQRShape;
    QRPShape4: TQRPShape;
    QRHRule7: TQRHRule;
    QRPLabel19: TQRPLabel;
    QRPLabel20: TQRPLabel;
    QRPLabel21: TQRPLabel;
    QRPLabel22: TQRPLabel;
    QRPLabel23: TQRPLabel;
    QRPLabel24: TQRPLabel;
    QRHRule8: TQRHRule;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRLabel11: TQRLabel;
    QRPLabel28: TQRPLabel;
    QRDBText40: TQRDBText;
    QRPLabel29: TQRPLabel;
    QRPLabel30: TQRPLabel;
    QRDBText42: TQRDBText;
    QRShape5: TQRShape;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    Label35: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    DBLookupComboBox6: TDBLookupComboBox;
    DBText9: TDBText;
    lbCodUnificada: TLabel;
    DBEditCodUnificada: TDBEdit;
    DBLookupComboBoxCodUnificada: TDBLookupComboBox;
    lbCodUnificada2: TLabel;
    DBEditCodUnificada2: TDBEdit;
    DBLookupComboBoxCodUnificada2: TDBLookupComboBox;
    ckRecebido: TCheckBox;
    ckNaoRecebido: TCheckBox;
    tsImpressao: TTabSheet;
    pnImpressao: TPanel;
    Panel67: TPanel;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure BitBtn56Click(Sender: TObject);
    procedure BitBtn55Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QuickRep2Preview(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBEditCodUnificadaExit(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure DBLookupComboBox6Exit(Sender: TObject);
    procedure DBEdit28Exit(Sender: TObject);
    procedure QuickRep2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SpeedButton40Click(Sender: TObject);
    procedure DBEdit28KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBEdit15Enter(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BtnExcluirBaixaClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DBEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit10Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vCriou: Smallint;
    vDtDia: TDate;
  public
	  vHabilitarCampoDepartamento, vHabilitarCampoResponsavel, vHabilitarRespDepart: boolean;
    { Public declarations }
  end;

var
  frmCadRecibo: TfrmCadRecibo;
  obRecibo: TRecibo;
  vNRecibo: Integer;

implementation

uses UdtmRecibo, uDtmAtivo, uDataSet_OOP, uDadosIni;

{$R *.dfm}

procedure TfrmCadRecibo.BitBtn10Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadRecibo.BitBtn1Click(Sender: TObject);
var
 I: Integer;
begin
  inherited;
  if vDadosIni.PesqPros('REC001', 'PESQUISAR', '', 'RECIBOS', '', obrecibo.buscas, true) then
  begin
    if MaskEdit2.Visible then
    begin
      if not obRecibo.ConsultaCampos('RECIBOS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
        ' recibos.*, empresa.identificacao_emp, colaborador.nome_vendedor, depto.nome_depto ',
        ' left join empresa on empresa.cod_empresa = recibos.' +
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
       	'cod_emp_mult', 'cod_empresa') +
        ' left join colaborador on colaborador.cod_vendedor = recibos.cod_us and colaborador.cod_empresa = recibos.cod_empresa ' +
        ' left join depto on depto.cod_depto = recibos.cod_depto ',

        vDadosIni.IfThen(ckRecebido.Checked <> ckNaoRecebido.Checked,
          vDadosIni.IfThen(ckRecebido.Checked,
            ' trim(recibos.status_rec) = ''RECEBIDO'' ',
            ' trim(coalesce(recibos.status_rec, '''')) = '''' '), ''),

        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' (case when (empresa.financeiro_unificado = ''S'') then ' + vDadosIni.codEmpresa +
          ' else recibos.cod_empresa end) ',
          vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', ''))) then
          	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        			combobox1.setfocus;
    end
    else
      if obRecibo.ConsultaCampos('RECIBOS', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
        ' recibos.*, empresa.identificacao_emp, colaborador.nome_vendedor, depto.nome_depto ',
        ' left join empresa on empresa.cod_empresa = recibos.' +
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
       	'cod_emp_mult', 'cod_empresa') +
        ' left join colaborador on colaborador.cod_vendedor = recibos.cod_us and colaborador.cod_empresa = recibos.cod_empresa ' +
        ' left join depto on depto.cod_depto = recibos.cod_depto ',

        vDadosIni.IfThen(ckRecebido.Checked <> ckNaoRecebido.Checked,
          vDadosIni.IfThen(ckRecebido.Checked,
            ' trim(recibos.status_rec) = ''RECEBIDO'' ',
            ' trim(coalesce(recibos.status_rec, '''')) = '''' '), ''),
            
       	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' (case when (empresa.financeiro_unificado = ''S'') then ' + vDadosIni.codEmpresa +
          ' else recibos.cod_empresa end) ',
          vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', ''))) then
          	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        			ComboBox1.SetFocus;

    if obRecibo.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
        if (DBGrid1.Columns[i].FieldName = 'ATRAVES') or (DBGrid1.Columns[i].FieldName = 'OBSERVACAO') then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
    obRecibo.IndexFieldNames := 'NRECIBO';
  end;
  SpeedButton6.Visible := true;
  SpeedButton7.Visible := true;
  SpeedButton8.Visible := true;
  SpeedButton11.Visible := true;

  vDtDia := vDadosIni.getDataBanco(obRecibo.buscas);
end;

procedure TfrmCadRecibo.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  try
    if not vDadosIni.PesqPros('REC002', 'INCLUIR', '', 'RECIBOS', '', obrecibo.buscas, true) then
      exit;

    lbCodUnificada.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
    lbCodUnificada2.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
    DBEditCodUnificada.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
    DBEditCodUnificada2.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
    DBLookupComboBoxCodUnificada.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
    DBLookupComboBoxCodUnificada2.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));

    if not obRecibo.Insert then
      exit;

    DBEditCodUnificada.Enabled := obRecibo.dataSet.State = dsInsert;
    DBEditCodUnificada2.Enabled := obRecibo.dataSet.State = dsInsert;
    DBLookupComboBoxCodUnificada.Enabled := obRecibo.dataSet.State = dsInsert;
    DBLookupComboBoxCodUnificada2.Enabled := obRecibo.dataSet.State = dsInsert;

    inherited;
    obRecibo.vBenef.BuscaPeloCodigo(-1, -1, false);

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    PageControl1.ActivePage := TabSheet1;
    if vDadosIni.vRecibo.HabRecPorDepart then
    begin
      DBLookupComboBox6.Enabled := vHabilitarCampoDepartamento;
      DBEdit28.Enabled := vHabilitarCampoResponsavel;
      DBLookupComboBox5.Enabled := vHabilitarCampoResponsavel;
      Label34.Caption := '';
      PageControl3.ActivePage := TabSheet5;
      CheckBox4.Checked := false;
      DBEdit17.Enabled := True;
      if (Self.Enabled) and (Self.Visible) and (DBEditCodUnificada2.CanFocus) then
        DBEditCodUnificada2.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
      	DBLookupComboBox6.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit28.CanFocus) then
        DBEdit28.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
	      DBEdit25.SetFocus;
    end
    else
    begin
      Label10.Caption := '';
    	PageControl3.ActivePage := TabSheet3;
      CheckBox2.Checked := false;
      DBEdit4.Enabled := True;
      if (Self.Enabled) and (Self.Visible) and (DBEditCodUnificada.CanFocus) then
        DBEditCodUnificada.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
        DBEdit10.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        DBEdit2.SetFocus;
    end;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      obRecibo.Cancel;
      obRecibo.RollBackTransacao;
    end;
  end;

end;

procedure TfrmCadRecibo.BitBtn4Click(Sender: TObject);
var
 vDepart: string;
 vIndex: Integer;
begin
  if ((vDadosIni.vRecibo.TestarGerenteDepart) and (vHabilitarRespDepart)) then
  begin
    if not vDadosIni.PesqPros('REC003', 'INCLUIR', '', 'RECIBOS', '', obrecibo.buscas, true, False, False, obRecibo.vDepartamento.dataSet.FieldByName('NOME_DEPTO').AsString) then
    	exit;
	end
  else
  begin
    if not vDadosIni.PesqPros('REC003', 'INCLUIR', '', 'RECIBOS', '', obrecibo.buscas, true) then
      exit;
  end;

  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not obRecibo.Post then
    setFocusCampoErro(obRecibo.vNomeCampoErro, obRecibo.vMensagemErro)
  else
  begin
    if Application.MessageBox('Deseja imprimir o recibo?',
     'Impressão', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
        SpeedButton3Click(Sender);
    if CheckCadSeq.Checked then
    begin
      if obRecibo.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
        	DBEdit10.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadRecibo.BitBtn55Click(Sender: TObject);
begin
  TForm(pnImpressao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadRecibo.BitBtn56Click(Sender: TObject);
begin
  TForm(pnImpressao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadRecibo.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obRecibo.Cancel;
end;

procedure TfrmCadRecibo.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('REC011', 'BAIXAR', '', 'RECIBOS',
    obRecibo.dataSet.FieldByName('NRECIBO').AsString, obrecibo.buscas, true) then
    exit;

  if not obRecibo.verificarRegistro then
   exit;

  if not obRecibo.vHistRecibo.Recebimento(obRecibo) then
  	exit;
    
  if not obRecibo.vHistRecibo.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) then
    	DBEdit11.SetFocus;
    exit;
  end
  else
    obrecibo.apply;
    
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadRecibo.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if obRecibo.vHistRecibo.Cancel then
    PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadRecibo.BtnExcluirBaixaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('REC012', 'EXCLUIR', '', 'RECIBOS',
    obRecibo.dataSet.FieldByName('NRECIBO').AsString, obrecibo.buscas, true) then
    exit;

  if not obRecibo.verificarRegistro then
   exit;
   
  obRecibo.vHistRecibo.delete(obRecibo);
end;

procedure TfrmCadRecibo.CheckBox2Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
    if CheckBox4.Checked then
    begin
      DBEdit26.Enabled := true;
      DBLookupComboBox3.Enabled := true;
    end
    else
    begin
      DBEdit26.Enabled := false;
      DBLookupComboBox3.Enabled := false;
    end;
  end
  else
  begin
    if CheckBox2.Checked then
    begin
      DBEdit12.Enabled := true;
      DBLookupComboBox1.Enabled := true;
    end
    else
    begin
      DBEdit12.Enabled := false;
      DBLookupComboBox1.Enabled := false;
    end;
  end;
end;

procedure TfrmCadRecibo.DBEdit10Exit(Sender: TObject);
var
  vNomeDev: string;
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if obRecibo.dataSet.FieldByName('COD_DEVEDOR').AsInteger <= 0 then
  	exit;
      
  vNomeDev := '';
  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
    vNomeDev := obRecibo.vDevedor.BuscaPeloCodigo(StrToInt(DBEdit25.Text),
    	obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    if trim(vNomeDev) = '' then
      if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
        DBEdit25.SetFocus;
  end
  else
  begin
    vNomeDev := obRecibo.vDevedor.BuscaPeloCodigo(StrToInt(DBEdit10.Text),
    	obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    if trim(vNomeDev) = '' then
      if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
        DBEdit10.SetFocus;
  end;
  if trim(vNomeDev) <> '' then
     obRecibo.dataSet.FieldByName('NOME_DEV').AsString := trim(vNomeDev);
end;

procedure TfrmCadRecibo.DBEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vcodigo: integer;
begin
  inherited;
  if key = VK_F3 then
    obRecibo.dataSet.FieldByName('COD_DEVEDOR').AsString := vDadosIni.pesquisaRapida('CLIENTES');
end;

procedure TfrmCadRecibo.DBEdit12Exit(Sender: TObject);
begin
  inherited;
  if trim(DBEdit12.Text) <> '' then
    obRecibo.vPrep.BuscaPeloCodigo(StrToInt(DBEdit12.Text), obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
end;

procedure TfrmCadRecibo.DBEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vcodigo: string;
begin
  inherited;
  if key = VK_F3 then
  begin
    vcodigo := vDadosIni.pesquisaRapida('CLIENTES');
    if trim(vcodigo) <> '' then
      obRecibo.dataSet.FieldByName('COD_PREP').AsString := vcodigo;
  end;
end;

procedure TfrmCadRecibo.DBEdit15Enter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadRecibo.DBEdit28Exit(Sender: TObject);
var
 vNomeResp: string;
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;
    
  if obRecibo.dataSet.FieldByName('COD_US').AsInteger <= 0 then 
    exit;

  vNomeResp := obRecibo.vColaborador.BuscaPeloCodigo(StrToInt(DBEdit28.Text));
  if trim(vNomeResp) = '' then
    if (Self.Enabled) and (Self.Visible) and (DBEdit28.CanFocus) then
      DBEdit28.SetFocus;

//  vNomeResp := obRecibo.vColaborador.BuscaPeloCodigo(StrToInt(DBEdit28.Text), trim(obRecibo.vDepartamento.dataSet.FieldByName('NOME_DEPTO').AsString));
//  if trim(vNomeResp) = '' then
//    if (Self.Enabled) and (Self.Visible) and (DBEdit28.CanFocus) then
//      DBEdit28.SetFocus;
end;

procedure TfrmCadRecibo.DBEdit28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vcodigo: integer;
begin
  inherited;
  if key = VK_F3 then
    obRecibo.dataSet.FieldByName('COD_US').AsString := vDadosIni.pesquisaRapida('COLABORADOR');
end;

procedure TfrmCadRecibo.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;
    
  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
    if trim(DBEdit24.Text) = '' then
    	exit;
    obRecibo.BuscaPeloCodigo(StrToInt(DBEdit24.Text),
    	obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    if trim(DBEdit24.Text) = '' then
      if (Self.Enabled) and (Self.Visible) and (DBEdit24.CanFocus) then
        DBEdit24.SetFocus;
  end
  else
  begin
    if trim(DBEdit3.Text) = '' then
	    exit;      
    obRecibo.BuscaPeloCodigo(StrToInt(DBEdit3.Text),
    	obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    if trim(DBEdit3.Text) = '' then
      if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        DBEdit3.SetFocus;
  end;
end;

procedure TfrmCadRecibo.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vcodigo: string;
begin
  inherited;
  if key = VK_F3 then
  begin
    vcodigo := vDadosIni.pesquisaRapida('CLIENTES');
    if trim(vcodigo) <> '' then
      obRecibo.dataSet.FieldByName('COD_BENEF').AsString := vcodigo;
  end;
end;

procedure TfrmCadRecibo.DBEdit4Exit(Sender: TObject);
var
 vTemp: string;
begin
  inherited;
  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
  	vTemp := trim(vDadosIni.Extenso(obRecibo.dataSet.FieldByName('VALOR').AsFloat));//Extenso2
    if trim(vTemp) <> '' then
		  label34.Caption := '(' + UpperCase(Copy(vTemp, 1, 1)) +  LowerCase(Copy(vTemp, 2, Length(vTemp) - 1)) + ')'
    else
      label34.Caption := '';
  end
	else
	  label10.Caption := vDadosIni.Extenso(obRecibo.dataSet.FieldByName('VALOR').AsFloat);
end;

procedure TfrmCadRecibo.DBEditCodUnificadaExit(Sender: TObject);
var
  vTemp: string;
begin
  if vDadosIni.vEmp.vFinanceiroUnificado then
   if (obRecibo.dataSet.FieldByName('COD_DEVEDOR').AsInteger > 0)
    or (obRecibo.dataSet.FieldByName('COD_BENEF').AsInteger > 0)
    or (obRecibo.dataSet.FieldByName('COD_PREP').AsInteger > 0) then
     if obRecibo.vCodEmpMult <> obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger then
     begin
        vTemp := '';
        if (obRecibo.dataSet.FieldByName('COD_DEVEDOR').AsInteger > 0) then
          vTemp := vTemp + 'Recebemos de, ';

        if (obRecibo.dataSet.FieldByName('COD_BENEF').AsInteger > 0) then
          vTemp := vTemp + 'Beneficiário' +
          vDadosIni.IfThen((obRecibo.dataSet.FieldByName('COD_BENEF').AsInteger > 0),
          	', ', ' ');

        if (obRecibo.dataSet.FieldByName('COD_BENEF').AsInteger > 0) then
          vTemp := vTemp +
          vDadosIni.IfThen((obRecibo.dataSet.FieldByName('COD_DEVEDOR').AsInteger > 0) or (obRecibo.dataSet.FieldByName('COD_BENEF').AsInteger > 0),
            'e ', '') + 'Préposto ';

        if Application.MessageBox(pchar('Empresa Unificada foi alterada,' +
          ' é necessário informar o ' + vTemp + ' novamente, Deseja continuar assim mesmo?'),
          'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
        begin
           obRecibo.vCodEmpMult := obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
           obRecibo.dataSet.FieldByName('cod_devedor').Value := null;
           obRecibo.dataSet.FieldByName('nome_dev').Value := null;
           obRecibo.dataSet.FieldByName('cod_benef').Value := null;
           obRecibo.dataSet.FieldByName('benef_client').Value := null;
           obRecibo.dataSet.FieldByName('cod_prep').Value := null;
           exit;
        end
        else
        begin
          if (Sender is TDBEdit) then
          begin
           if (Self.Enabled) and (Self.Visible) and ((Sender as TDBEdit).CanFocus) then
             (Sender as TDBEdit).SetFocus;
          end
          else if (Sender is TDBLookupComboBox) then
          begin
            if (Self.Enabled) and (Self.Visible) and ((Sender as TDBLookupComboBox).CanFocus) then
              (Sender as TDBLookupComboBox).SetFocus;
          end;
        end;
     end;
end;

procedure TfrmCadRecibo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if (Column.FieldName = 'DATA_VENC') and
  	(not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_VENC').IsNull) and
    (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_VENC').AsDateTime < vDtDia) and
    (Trim(TDBGrid(sender).DataSource.dataSet.FieldByName('STATUS_REC').AsString) <> 'RECEBIDO') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadRecibo.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadRecibo.DBLookupComboBox6Exit(Sender: TObject);
begin
  if trim(obRecibo.vDepar) <> trim(obRecibo.vDepartamento.dataSet.FieldByName('NOME_DEPTO').AsString) then
  begin
     if not DBEdit28.Enabled then
       obRecibo.dataSet.FieldByName('COD_US').AsInteger := obRecibo.vColaborador.dataSet.FieldByName('COD_VENDEDOR').AsInteger
     else
	     obRecibo.dataSet.FieldByName('COD_US').AsInteger := 0;
     obRecibo.vDepar := trim(obRecibo.vDepartamento.dataSet.FieldByName('NOME_DEPTO').AsString);
     if vHabilitarRespDepart then
	     obRecibo.vColaborador.abreColaborador(obRecibo.vDepar);
  end;
end;

procedure TfrmCadRecibo.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if trim(obRecibo.dataSet.FieldByName('RECANT').AsString) = 'S' then
    QRLabel30.Caption := 'RECIBO ATENCIPADO'
  else
    QRLabel30.Caption := '';
end;

procedure TfrmCadRecibo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if (obRecibo <> nil) then
  	obRecibo.Cancel;

  obRecibo.Free;
  obRecibo := Nil;

  Action := caFree;
  frmCadRecibo := nil;

  if (frmCadRecibo <> nil) then
  	frmCadRecibo := Nil;
end;

procedure TfrmCadRecibo.FormCreate(Sender: TObject);
begin
	vCriou := 0;
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obRecibo := TRecibo.create;
  
  vNRecibo := 0;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CADRECIBO' then
  begin
		if dtmRecibo = nil then
      dtmRecibo := tdtmRecibo.Create(dtmRecibo);
    vDadosIni.vTipoForm := 0;
    vDadosIni.vModalOuChild := 'M';
    vDadosIni.vPesquisa := '';
    frmCadRecibo := TfrmCadRecibo(self);
    TelaCadastro := vDadosIni.vTipoForm;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'IMPRIMIRRECIBO' then
  begin
    if dtmRecibo = nil then
      dtmRecibo := tdtmRecibo.Create(dtmRecibo);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    vNRecibo := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    vDadosIni.vPesquisa := '';
    frmCadRecibo := TfrmCadRecibo(self);
    TelaCadastro := vDadosIni.vTipoForm;
  end;

  tsRecebimento.TabVisible := false;
  tsHistorico.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  tsImpressao.TabVisible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadRecibo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PageControl1.ActivePage = TabSheet2  then
    if Key = VK_F11 then
      ckRecebido.Checked := not ckRecebido.Checked
    else if Key = VK_F12 then
      ckNaoRecebido.Checked := not ckNaoRecebido.Checked;
      
  if key = VK_INSERT then
    BitBtn3Click(sender)
  else if (obRecibo.dataSet.State in [dsEdit, dsInsert]) and (key = VK_ESCAPE) then
    BitBtn5Click(sender)
  else if (Key = VK_F5) and (PageControl1.ActivePage = TabSheet1) and
    (PageControl3.ActivePage = TabSheet3) and (obRecibo.dataSet.State in [dsEdit, dsInsert]) then
  begin
    DBCheckBox1.Checked := not DBCheckBox1.Checked;
    obRecibo.setRecAntecipado(DBCheckBox1.Checked);
  end
  else if (Key = VK_F6) and (PageControl1.ActivePage = TabSheet1) and (PageControl3.ActivePage = TabSheet3) then
  begin
    CheckBox2.Checked := not CheckBox2.Checked;
    CheckBox2Click(Sender);
  end;
end;

procedure TfrmCadRecibo.FormShow(Sender: TObject);
var
  I: Integer;
begin
	if not Self.Enabled then
    Exit;

	if vShow <> 1 then
  begin
  	DBGrid1.DataSource := dtmRecibo.dsRecibo;
	  DBGrid2.DataSource := dtmRecibo.dsHistRecibo;
    inherited;
    if vCriou = 0 then
	    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  obRecibo.dataSet.FieldByName('COD_EMP_MULT').Tag :=
  	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);
  obRecibo.dataSet.FieldByName('IDENTIFICACAO_EMP').Tag :=
  	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);

  obRecibo.abreRecibo(0);

  GroupBox1.Color := clBtnHighlight;
  Shape1.Brush.Color := clWhite;
  GroupBox6.Color := clBtnHighlight;
  Shape4.Brush.Color := clWhite;

  vDadosIni.vInibeMensPesqPros := 'S';
  vHabilitarCampoDepartamento := vDadosIni.PesqPros('REC018', 'HABILITAR', '', 'RECIBOS', '', obRecibo.buscas, true);
  vDadosIni.vInibeMensPesqPros := 'S';
  vHabilitarCampoResponsavel := vDadosIni.PesqPros('REC019', 'HABILITAR', '', 'RECIBOS', '', obRecibo.buscas, true);
  vDadosIni.vInibeMensPesqPros := 'S';
  vHabilitarRespDepart := vDadosIni.PesqPros('REC022', 'HABILITAR', '', 'RECIBOS', '', obRecibo.buscas, true);

  if not vDadosIni.vRecibo.HabRecPorDepart then
  begin
    obRecibo.dataSet.FieldByName('NUM_REC_DEP').Index := DBGrid1.FieldCount;
    DBGrid1.DataSource.DataSet.FieldByName('NUM_REC_DEP').Visible := false;
    obRecibo.dataSet.FieldByName('NUM_REC_DEP').Tag := 1;
    obRecibo.dataSet.FieldByName('NUM_REC_DEP').Visible := false;
    obRecibo.dataSet.FieldByName('NRECIBO').Tag := 0;
    obRecibo.dataSet.FieldByName('NRECIBO').Visible := true;
  end
  else
  begin
    obRecibo.dataSet.FieldByName('NUM_REC_DEP').Index := 0;
    DBGrid1.DataSource.DataSet.FieldByName('NRECIBO').Visible := false;
    obRecibo.dataSet.FieldByName('NRECIBO').Tag := 1;
    obRecibo.dataSet.FieldByName('NRECIBO').Visible := false;
    obRecibo.dataSet.FieldByName('NUM_REC_DEP').Tag := 0;
    obRecibo.dataSet.FieldByName('NUM_REC_DEP').Visible := true;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
      TDBEdit(Components[I]).CharCase := ecUpperCase;
    if Components[I] is TDBComboBox then
      TDBComboBox(Components[I]).CharCase := ecUpperCase;
  end;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "REC016" HABILITAR NOVO RECIBO SEMPRE COMO ANTECIPADO' + #13 +
    'Processo "REC018" HABILITAR CAMPO DEPARTAMENTO' + #13 +
    'Processo "REC019" HABILITAR CAMPO RESPONSAVEL' + #13 +
    'Processo "REC020" PERMITIR BAIXA PARCIAL RECIBO SOBRA MENOR QUE R$X (FORMA DE PAGAMENTO)' + #13 +
    'Processo "REC021" PERMITIR BAIXA PARCIAL RECIBO SOBRA MENOR QUE R$X (CONTROLE DE CREDITO)' + #13 +
    'Processo "REC022" HABILITAR VENDEDOR PARA O DEPARTAMENTO' + #13 +
    'Processo "REC024" HABILITAR RECEBIMENTO DE RECIBOS PELO FINANCEIRO';

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else if TelaCadastro = 6 then
  begin
    if not obRecibo.abreRecibo(vNRecibo) then
    begin
    	frmCadRecibo.fechar := True;
	    PostMessage(frmCadRecibo.Handle, WM_CLOSE, 0, 0);
    end;
    vDadosIni.fechaStatusProcessamento;
    SpeedButton3Click(Sender);
    frmCadRecibo.fechar := True;
    PostMessage(frmCadRecibo.Handle, WM_CLOSE, 0, 0);
  end
  else
  begin
    lixeiraVazia(not obRecibo._lixeiraCheia);
  end;

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadRecibo.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  obRecibo.vBenef.BuscaPeloCodigo(obRecibo.dataSet.FieldByName('COD_BENEF').AsInteger,
  	obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger);

  if (RadioGroup1.ItemIndex = 1) and (obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat > 0) then
  	QRLabel2.Caption := FormatFloat('##,##0.00', obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat) + '  ' +
      vDadosIni.Extenso(obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat)
  else
    QRLabel2.Caption := FormatFloat('##,##0.00', obRecibo.dataSet.FieldByName('VALOR').AsFloat) + '  ' +
      vDadosIni.Extenso(obRecibo.dataSet.FieldByName('VALOR').AsFloat);

  QRLabel3.Caption := trim(obRecibo.vBenef.dataSet.FieldByName('CIDADE').AsString) + ', ' +
    vDadosIni.DataPorExtenso(obRecibo.dataSet.FieldByName('DATA_REC').AsDateTime);
end;

procedure TfrmCadRecibo.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Recibo');
end;

procedure TfrmCadRecibo.QuickRep2BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
 vTemp: string;
begin
  inherited;
  obRecibo.vBenef.BuscaPeloCodigo(obRecibo.dataSet.FieldByName('COD_BENEF').AsInteger,
  	obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger);

  if (RadioGroup1.ItemIndex = 1) and (obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat > 0) then
  	vTemp := trim(vDadosIni.Extenso(obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat))
  else
  	vTemp := trim(vDadosIni.Extenso(obRecibo.dataSet.FieldByName('VALOR').AsFloat)); //Extenso2

  if (RadioGroup1.ItemIndex = 1) and (obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat > 0) then
  	QRLabel1.Caption := FormatFloat('##,##0.00', obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat) + '  ' +
       '(' + UpperCase(Copy(vTemp, 1, 1)) + LowerCase(Copy(vTemp, 2, Length(vTemp) - 1)) + ')'
  else
    QRLabel1.Caption := FormatFloat('##,##0.00', obRecibo.dataSet.FieldByName('VALOR').AsFloat) + '  ' +
       '(' + UpperCase(Copy(vTemp, 1, 1)) + LowerCase(Copy(vTemp, 2, Length(vTemp) - 1)) + ')';

	QRLabel4.Caption := trim(obRecibo.vBenef.dataSet.FieldByName('CIDADE').AsString) + ', ' +
    vDadosIni.DataPorExtenso(obRecibo.dataSet.FieldByName('DATA_REC').AsDateTime);
end;

procedure TfrmCadRecibo.QuickRep2Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Recibo');
end;

procedure TfrmCadRecibo.SpeedButton11Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('REC017', 'ALTERAR', '', 'RECIBOS', obRecibo.dataSet.FieldByName('NRECIBO').AsString, obrecibo.buscas, true) then
    exit;

  if not obRecibo.verificarRegistro then
    exit;  

  if obRecibo.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;

  if not obRecibo.AlterarDepartamento then
   exit;
   
  Application.MessageBox(pchar('Alteração do departamento conclúido.'), 'Informação',  MB_OK + MB_DEFBUTTON1);
end;

procedure TfrmCadRecibo.SpeedButton12Click(Sender: TObject);
begin
  if not obRecibo.enviarBoletoPorEmail then
    exit;
end;

procedure TfrmCadRecibo.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.PesqPros('REC004', 'EDITAR', '', 'RECIBOS', obRecibo.dataSet.FieldByName('NRECIBO').AsString, obrecibo.buscas, true) then
    exit;
  if obRecibo.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;

  lbCodUnificada.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
  lbCodUnificada2.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
  DBEditCodUnificada.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
  DBEditCodUnificada2.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
  DBLookupComboBoxCodUnificada.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
  DBLookupComboBoxCodUnificada2.Visible := (vDadosIni.vEmp.vFinanceiroUnificado);
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));

  inherited;
  if not obRecibo.Edit then
    exit;

  DBEditCodUnificada.Enabled := obRecibo.dataSet.State = dsInsert;
  DBEditCodUnificada2.Enabled := obRecibo.dataSet.State = dsInsert;
  DBLookupComboBoxCodUnificada.Enabled := obRecibo.dataSet.State = dsInsert;
  DBLookupComboBoxCodUnificada2.Enabled := obRecibo.dataSet.State = dsInsert;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
 		  TScrollBox(Components[I]).VertScrollBar.Position := 0;

  PageControl1.ActivePage := TabSheet1;
  if ((trim(obRecibo.dataSet.FieldByName('NUM_REC_DEP').AsString) <> '') and (vDadosIni.vRecibo.HabRecPorDepart)) then
  begin
    DBLookupComboBox6.Enabled := False;
    DBEdit28.Enabled := False;
    DBLookupComboBox5.Enabled := False;
    PageControl3.ActivePage := TabSheet5;
    TabSheet5.Caption := 'Alterando Recibo';
    DBEdit17.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (DBEditCodUnificada2.CanFocus) then
      DBEditCodUnificada2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
      DBLookupComboBox6.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit28.CanFocus) then
      DBEdit28.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
      DBEdit25.SetFocus;

    obRecibo.vBenef.BuscaPeloCodigo(obRecibo.dataSet.FieldByName('COD_BENEF').AsInteger,
    	obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    if trim(obRecibo.dataSet.FieldByName('COD_PREP').AsString) <> '' then
    begin
      CheckBox4.Checked := true;
      DBEdit28.Enabled := true;
      DBLookupComboBox3.Enabled := true;
    end;
    DBEdit4Exit(sender);
    obRecibo.vHistRecibo.abreHistoricoRec(obRecibo.dataSet.FieldByName('NRECIBO').AsInteger);
  end
  else
  begin
  	PageControl3.ActivePage := TabSheet3;
    TabSheet3.Caption := 'Alterando Recibo';
    DBEdit4.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (DBEditCodUnificada.CanFocus) then
      DBEditCodUnificada.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
	    DBEdit10.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
	    DBEdit2.SetFocus;

    obRecibo.vBenef.BuscaPeloCodigo(obRecibo.dataSet.FieldByName('COD_BENEF').AsInteger,
    	obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    if trim(obRecibo.dataSet.FieldByName('COD_PREP').AsString) <> '' then
    begin
      CheckBox2.Checked := true;
      DBEdit2.Enabled := true;
      DBLookupComboBox1.Enabled := true;
    end;
    DBEdit4Exit(sender);
    obRecibo.vHistRecibo.abreHistoricoRec(obRecibo.dataSet.FieldByName('NRECIBO').AsInteger);
  end;
end;

procedure TfrmCadRecibo.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('REC007', 'ACESSAR', '', 'RECIBOS', '', obrecibo.buscas, true) then
    exit;
  if not obRecibo.abrirLixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [REC005]';
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    SpeedButton6.Visible := true;
    SpeedButton7.Visible := true;
    SpeedButton8.Visible := true;
    SpeedButton11.Visible := true;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [REC013]';
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
    SpeedButton6.Visible := false;
    SpeedButton7.Visible := false;
    SpeedButton8.Visible := false;
    SpeedButton11.Visible := false;
  end;
end;

procedure TfrmCadRecibo.SpeedButton2Click(Sender: TObject);
begin
  inherited;

  obRecibo.Delete;
  lixeiraVazia(not obRecibo._lixeiraCheia);
end;

procedure TfrmCadRecibo.SpeedButton3Click(Sender: TObject);
var
 vTemp: string;
 I: Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('REC006', 'IMPRIMIR', '', 'RECIBOS', obRecibo.dataSet.FieldByName('NRECIBO').AsString, obrecibo.buscas, true) then
    exit;

  RadioGroup1.ItemIndex := 0;
  RadioGroup2.ItemIndex := 0;
  if not vDadosIni.abreForm('Impressão', pnImpressao, tsImpressao) then
  	exit;

  if (RadioGroup1.ItemIndex = 1) and (obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat > 0) then
  begin
    QRLabel2.Caption := FormatFloat('##,##0.00', obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat) + '  ' +
      vDadosIni.Extenso(obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat);
    vTemp := trim(vDadosIni.Extenso(obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat)); //Extenso2
    QRLabel1.Caption := FormatFloat('##,##0.00', obRecibo.dataSet.FieldByName('VALOR_ORIG').AsFloat) + '  ' +
      '(' + UpperCase(Copy(vTemp, 1, 1)) + LowerCase(Copy(vTemp, 2, Length(vTemp) - 1)) + ')';
  end
  else
  begin
    QRLabel2.Caption := FormatFloat('##,##0.00', obRecibo.dataSet.FieldByName('VALOR').AsFloat) + '  ' +
      vDadosIni.Extenso(obRecibo.dataSet.FieldByName('VALOR').AsFloat);
    vTemp := trim(vDadosIni.Extenso(obRecibo.dataSet.FieldByName('VALOR').AsFloat)); //Extenso2
    QRLabel1.Caption := FormatFloat('##,##0.00', obRecibo.dataSet.FieldByName('VALOR').AsFloat) + '  ' +
      '(' + UpperCase(Copy(vTemp, 1, 1)) + LowerCase(Copy(vTemp, 2, Length(vTemp) - 1)) + ')';
  end;


  QRLabel7.Caption := QRLabel2.Caption;
  QRLabel9.Caption := QRLabel1.Caption;
  
  obRecibo.vBenef.BuscaPeloCodigo(obRecibo.dataSet.FieldByName('COD_BENEF').AsInteger,
  	obRecibo.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
  QRLabel3.Caption := trim(obRecibo.vBenef.dataSet.FieldByName('CIDADE').AsString) + ', ' +
    vDadosIni.DataPorExtenso(obRecibo.dataSet.FieldByName('DATA_REC').AsDateTime);
  QRLabel4.Caption := trim(obRecibo.vBenef.dataSet.FieldByName('CIDADE').AsString) + ', ' +
    vDadosIni.DataPorExtenso(obRecibo.dataSet.FieldByName('DATA_REC').AsDateTime);
  QRLabel8.Caption := QRLabel3.Caption;
  QRLabel10.Caption := QRLabel4.Caption;

  if obRecibo.dataSet.FieldByName('RECANT').AsString = 'S' then
  begin
    QRLabel30.Caption := 'RECIBO ANTECIPADO';
    QRLabel6.Caption := 'RECIBO ANTECIPADO';
  end
  else
  begin
    QRLabel30.Caption := '';
    QRLabel6.Caption := '';
  end;

  if RadioGroup2.ItemIndex = 0 then
  begin
    QRShape3.Height := 409;
    QRShape3.Width  := 721;

    QRShape5.Height := 473;
    QRShape5.Width  := 721;
  end
  else
  begin
    QRLabel5.Caption := QRLabel30.Caption;
    QRLabel11.Caption := QRLabel6.Caption;

   	QRShape3.Height := 0;
    QRShape3.Width  := 0;

    QRShape5.Height := 0;
    QRShape5.Width  := 0;
  end;

  if ((trim(obRecibo.dataSet.FieldByName('NUM_REC_DEP').AsString) <> '') and (vDadosIni.vRecibo.HabRecPorDepart)) then
    QuickRep2.Preview
  else
	  QuickRep1.Preview;
end;

procedure TfrmCadRecibo.SpeedButton40Click(Sender: TObject);
begin
  vDadosIni.configurarSistema('rec_%', obRecibo.buscas);
end;

procedure TfrmCadRecibo.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('REC008', 'RESTAURAR', '', 'RECIBOS',
    obRecibo.dataSet.FieldByName('NRECIBO').AsString, obrecibo.buscas, true) then
    exit;
  if obRecibo.restaurarLixeira then
    lixeiraVazia(not obRecibo._lixeiraCheia);
end;

procedure TfrmCadRecibo.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('REC009', 'RECEBER', '', 'RECIBOS',
    obRecibo.dataSet.FieldByName('NRECIBO').AsString, obrecibo.buscas, true) then
    exit;

  if not obRecibo.verificarRegistro then
   exit;
      
  if obRecibo.recebido then
  begin
    Application.MessageBox('Recibo já Quitado!', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    exit;
  end;

  if not obRecibo.vHistRecibo.Insert then
  	exit;

  PageControl1.ActivePage := tsRecebimento;
  tsRecebimento.Show;
end;

procedure TfrmCadRecibo.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('REC014', 'DETALHAR', '', 'RECIBOS',
    obRecibo.dataSet.FieldByName('NRECIBO').AsString, obRecibo.Buscas, True) then
    if (obRecibo.dataSet.FieldByName('NRECIBO').AsInteger >= 100000) then
    begin
      Application.MessageBox(pchar('Vale Compra não possui forma de pagamento!'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      exit;
    end;
    obRecibo.detalhesrec;
end;

procedure TfrmCadRecibo.SpeedButton8Click(Sender: TObject);
var
 I: Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('REC010', 'ACESSAR', '', 'RECIBOS',
    obRecibo.dataSet.FieldByName('NRECIBO').AsString, obrecibo.buscas, true) then
    exit;

  if not obRecibo.verificarRegistro then
   exit;
     
  if obRecibo.abreBaixas then
    PageControl1.ActivePage := tsHistorico;

  for I := 0 to DBGrid2.FieldCount - 1 do
  begin
    if not vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      if (DBGrid2.Columns[I].FieldName = 'COD_EMPRESA') then
	      DBGrid2.Columns[I].Visible := false
    end;

    if not vDadosIni.vRecibo.HabRecPorDepart then
    begin
      if (DBGrid2.Columns[I].FieldName = 'NUM_REC_DEP') then
	      DBGrid2.Columns[I].Visible := false
    end
    else
    begin
      if trim(obRecibo.dataSet.FieldByName('NUM_REC_DEP').AsString) <> '' then
      begin
        if (DBGrid2.Columns[I].FieldName = 'NRECIBO') then
		      DBGrid2.Columns[I].Visible := false;
      end
      else
      begin
        if (DBGrid2.Columns[I].FieldName = 'NUM_REC_DEP') then
		      DBGrid2.Columns[I].Visible := false;
      end;    
    end;
  end;  
end;

initialization
  RegisterClass(TfrmCadRecibo);
finalization
  UnRegisterClass(TfrmCadRecibo);


end.

