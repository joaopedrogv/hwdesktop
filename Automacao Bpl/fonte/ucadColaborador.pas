unit ucadColaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
  Dialogs, uCadPadrao, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, DB, QRCtrls, QuickRpt, Controls, UclassesColaborador,UCadPadraoModal,
  AppEvnts, CheckLst, uDataSet_OOP;

type
  TfrmCadcolaborador = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit13: TDBEdit;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    DBEdit15: TDBEdit;
    Label21: TLabel;
    DBMemo1: TDBMemo;
    Label44: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label48: TLabel;
    DBEdit37: TDBEdit;
    TabSheet7: TTabSheet;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    SummaryBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData2: TQRSysData;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
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
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    ScrollBox5: TScrollBox;
    ScrollBox6: TScrollBox;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    DBEdit34: TDBEdit;
    DBEdit38: TDBEdit;
    SpeedButton15: TSpeedButton;
    Label40: TLabel;
    DBEdit39: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit40: TDBEdit;
    Label47: TLabel;
    DBEdit41: TDBEdit;
    Label49: TLabel;
    Label50: TLabel;
    DBComboBox1: TDBComboBox;
    tsOutros: TTabSheet;
    pnSaldoExtrato: TPanel;
    pnOKCancelar: TPanel;
    btnOKCancelar: TBitBtn;
    gbSaldoExtrato: TGroupBox;
    Label203: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label51: TLabel;
    RadioGroup1: TRadioGroup;
    Label52: TLabel;
    DBEdit42: TDBEdit;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodosColaboradoresClick: TMenuItem;
    DesmarcarTodosColaboradoresClick: TMenuItem;
    Panel7: TPanel;
    BitBtn9: TBitBtn;
    Panel8: TPanel;
    BitBtn10: TBitBtn;
    Panel6: TPanel;
    BitBtn8: TBitBtn;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    BitBtn7: TBitBtn;
    DBGrid2: TDBGrid;
    SpeedButtonContatoPlataforma: TSpeedButton;
    tsContatoPlataforma: TTabSheet;
    pnContatoPlataforma: TPanel;
    GroupBoxContatoPlataforma: TGroupBox;
    pn_contatos_pla_cad: TPanel;
    lb_contato_pla_contato: TLabel;
    lb_contato_pla_aplicativo: TLabel;
    lb_contato_pla_identificacao: TLabel;
    lb_contrato_pla_tipos_contato: TLabel;
    bt_contato_pla_tipo: TSpeedButton;
    Panel95: TPanel;
    bt_contatos_pla_save: TSpeedButton;
    bt_contatos_pla_cancel: TSpeedButton;
    ed_contato_pla_contato: TDBEdit;
    ed_contato_pla_aplicativo: TDBLookupComboBox;
    ed_contato_pla_identificacao: TDBEdit;
    ck_contrato_pla_tipos_contato: TCheckListBox;
    Panel96: TPanel;
    bt_contatos_pla_add: TSpeedButton;
    bt_contatos_pla_del: TSpeedButton;
    bt_contatos_pla_edit: TSpeedButton;
    pn_contatos_pla_view: TPanel;
    grid_contatos_pla: TDBGrid;
    Panel97: TPanel;
    BitBtn11: TBitBtn;
    Label53: TLabel;
    DBEdit43: TDBEdit;
    Label54: TLabel;
    DBEdit44: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    procedure DBEdit44KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit43KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit44Exit(Sender: TObject);
    procedure DBEdit43Exit(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure ed_contato_pla_aplicativoExit(Sender: TObject);
    procedure SpeedButtonContatoPlataformaClick(Sender: TObject);
    procedure pnContatoPlataformaEnter(Sender: TObject);
    procedure pn_contatos_pla_viewEnter(Sender: TObject);
    procedure pn_contatos_pla_cadEnter(Sender: TObject);
    procedure bt_contatos_pla_cancelClick(Sender: TObject);
    procedure bt_contatos_pla_saveClick(Sender: TObject);
    procedure bt_contatos_pla_delClick(Sender: TObject);
    procedure bt_contatos_pla_editClick(Sender: TObject);
    procedure bt_contatos_pla_addClick(Sender: TObject);
    procedure bt_contato_pla_tipoClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DesmarcarTodosColaboradoresClickClick(Sender: TObject);
    procedure MarcarTodosColaboradoresClickClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PageControl3Change(Sender: TObject);
    procedure DBEdit42Exit(Sender: TObject);
    procedure btnOKCancelarClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBEdit39Exit(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBLookupComboBox3DropDown(Sender: TObject);
    procedure DBLookupComboBox4DropDown(Sender: TObject);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit34Exit(Sender: TObject);
    procedure DBEdit34KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit38KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit38Exit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    lk_tipo_contato_pla: TDadosLookUp_OOP;
    lk_aplicativo_contato_pla: TDadosLookUp_OOP;
    
    pop_menu_tipo_contato_pla: TPopupMenu;

    procedure contato_tipo_pla_add(Sender: TObject);
    procedure contato_tipo_pla_edit(Sender: TObject);
    procedure contato_tipo_pla_del(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmCadcolaborador: TfrmCadcolaborador;
  obColaborador: TColaborador;

  vCodPlataforma: Integer;

  //  obPerfil_comissao: Tperfil_comissao;   Se estes objetos ja tem dentro do objeto colaborador não é
  //  obPerfil_colab: TPerfil_colab;         necessario declaralos aqui.
  /// Dicas para o padrao das telas de cadastro em geral.
  ///    - Colocar os Label's ao lado dos DBEdit's correspondentes.
  ///    - Nos Label's colocar os Caption's com sua descrição, não deixar igual ao campo no banco de dados.
  ///    - Colocar os Titulos dos TabSheets
  ///    - Colocar o Caption do Formulário.
  ///    - Nos fields do DataSet no DataModule definir os nomes dos campos igual ao label's
  ///    - Nao use no create dos objetos para abrir a qualquer tabela sem necessidade.
  ///      Pois consome memoria e talvez o usuário não irá alterar o incluir nada.
  ///
implementation

uses uDtmAtivo, uDtmColaborador, UClassesCadastrosBasicos, uDadosIni, hw_utils;

{$R *.dfm}

procedure TfrmCadcolaborador.BitBtn10Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('COL012', 'DELETANDO INCIDÊNCIA VENDEDOR', '', 'LANC_PAG', obColaborador.cadIncidenciaColab.dataSet.FieldByName('COD_INCIDENCIA').AsString, obColaborador.buscas, true) then
  begin
    inherited;
    obColaborador.cadIncidenciaColab.Delete;
  end;
end;



procedure TfrmCadcolaborador.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [COL004]';
  if vDadosIni.PesqPros('COL001', '', '', 'COLABORADOR', '', obColaborador.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not obColaborador.ConsultaCampos('COLABORADOR', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not obColaborador.ConsultaCampos('COLABORADOR', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;
          
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if obColaborador.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    obColaborador.ultimasql := obColaborador.dataSet.CommandText;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadcolaborador.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    Exit;
  end;

  if not vDadosIni.PesqPros('COL002', '', '', 'COLABORADOR', '', obColaborador.buscas, true) then
  	Exit;

  if not obColaborador.Insert then
    Exit;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;

  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;

  ActiveControl := BitBtn3;
  inherited;

  Label53.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';
  DBEdit43.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';
  DBLookupComboBox6.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';

  Label54.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';
  DBEdit44.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';
  DBLookupComboBox7.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';

  SpeedButtonContatoPlataforma.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';

  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TfrmCadcolaborador.BitBtn4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('COL008', '', '', 'COLABORADOR', '', obColaborador.buscas, true) then
  	exit;

  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not obColaborador.Post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obColaborador.vNomeCampoErro, obColaborador.vMensagemErro);
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obColaborador.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadcolaborador.BitBtn5Click(Sender: TObject);
begin
  obColaborador.Cancel;
  obColaborador.cadPerfil_colab.Cancel;
  obColaborador.cadIncidenciaColab.Cancel;
  obColaborador.RollBackTransacao;
  inherited;
end;

procedure TfrmCadcolaborador.BitBtn7Click(Sender: TObject);
var
  I: Integer;
begin
  if vDadosIni.PesqPros('COL009', 'INCLUINDO PERFIL VENDEDOR', '', 'PERFIL_VENDEDOR', '', obColaborador.buscas, true) then
  begin
    if obColaborador.cadPerfil_colab.insert(obColaborador) then
      obColaborador.cadPerfil_colab.Post;

    obColaborador.cadPerfil_colab.abrePerfil_colab(obColaborador.dataSet.FieldByName('cod_vendedor').AsInteger);
  end;
end;

procedure TfrmCadcolaborador.BitBtn8Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('COL010', 'DELETANDO PERFIL VENDEDOR', '', 'PERFIL_VENDEDOR', obColaborador.cadPerfil_colab.dataSet.FieldByName('CODIGO_PERFIL').AsString, obColaborador.buscas, true) then
  begin
    inherited;
    obColaborador.cadPerfil_colab.Delete;
  end;
end;

procedure TfrmCadcolaborador.BitBtn9Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('COL011', 'INCLUINDO INCIDÊNCIA VENDEDOR', '', 'LANC_PAG', '', obColaborador.buscas, true) then
  begin
    inherited;
    if obColaborador.cadIncidenciaColab.Insert(obColaborador) then
      obColaborador.cadIncidenciaColab.Post;
    obColaborador.cadIncidenciaColab.abreIcidenciaColab(obColaborador.dataSet.FieldByName('COD_VENDEDOR').AsInteger);
  end;
end;

procedure TfrmCadcolaborador.btnOKCancelarClick(Sender: TObject);
begin
  inherited;
  TForm(pnSaldoExtrato.Parent).ModalResult := IDOK;
end;

procedure TfrmCadcolaborador.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obColaborador._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadcolaborador.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obColaborador._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadcolaborador.bt_contatos_pla_addClick(Sender: TObject);
begin
  inherited;
	if not obColaborador.ContatoMsg.Auditor.Processo('COL041').Inserir.Permitido then
    Exit;

  if (Self.Enabled) and (Self.Visible) and (GroupBoxContatoPlataforma.CanFocus) then
    GroupBoxContatoPlataforma.SetFocus;
  if obColaborador.ContatoMsg.Insert then
  begin
	  pn_contatos_pla_view.Enabled := False;
  	pn_contatos_pla_view.Visible := False;

    pn_contatos_pla_cad.Enabled := True;
    pn_contatos_pla_cad.Visible := True;

    lb_contato_pla_identificacao.Caption := 'Identificação';
    obColaborador.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';
    ed_contato_pla_identificacao.CharCase := ecLowerCase;

    vCodPlataforma := 0;
    obColaborador.ContatoMsg.InserirTipoContato(ck_contrato_pla_tipos_contato);

    ed_contato_pla_aplicativo.Enabled := True;
    ed_contato_pla_contato.Enabled := True;
    ed_contato_pla_identificacao.Enabled := True;

    if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_aplicativo.CanFocus) then
      ed_contato_pla_aplicativo.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_contato.CanFocus) then
      ed_contato_pla_contato.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_identificacao.CanFocus) then
      ed_contato_pla_identificacao.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ck_contrato_pla_tipos_contato.CanFocus) then
      ck_contrato_pla_tipos_contato.SetFocus;
  end;
end;

procedure TfrmCadcolaborador.bt_contatos_pla_cancelClick(Sender: TObject);
begin
  inherited;
  lb_contato_pla_identificacao.Caption := 'Identificação';
  obColaborador.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';
  vCodPlataforma := 0;

  obColaborador.ContatoMsg.dataSet.Cancel;

  pn_contatos_pla_cad.Enabled := False;
  pn_contatos_pla_cad.Visible := False;

  pn_contatos_pla_view.Enabled := True;
  pn_contatos_pla_view.Visible := True;

  if (Self.Enabled) and (Self.Visible) and (grid_contatos_pla.CanFocus) then
    grid_contatos_pla.SetFocus;
end;

procedure TfrmCadcolaborador.bt_contatos_pla_delClick(Sender: TObject);
begin
  inherited;
  obColaborador.ContatoMsg.Delete;
end;

procedure TfrmCadcolaborador.bt_contatos_pla_editClick(Sender: TObject);
begin
  if not obColaborador.ContatoMsg.Auditor.Processo('COL042').Inserir.Permitido then
    Exit;

  if (Self.Enabled) and (Self.Visible) and (GroupBoxContatoPlataforma.CanFocus) then
    GroupBoxContatoPlataforma.SetFocus;
  if obColaborador.ContatoMsg.Edit then
  begin
	  pn_contatos_pla_view.Enabled := False;
  	pn_contatos_pla_view.Visible := False;

    pn_contatos_pla_cad.Enabled := True;
    pn_contatos_pla_cad.Visible := True;

    lb_contato_pla_identificacao.Caption := 'Identificação';
    obColaborador.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';
    ed_contato_pla_identificacao.CharCase := ecLowerCase;

    vCodPlataforma := 0;
    obColaborador.ContatoMsg.EditarTipoContato(ck_contrato_pla_tipos_contato);

    ed_contato_pla_aplicativo.Enabled := False;
    ed_contato_pla_contato.Enabled := False;
    ed_contato_pla_identificacao.Enabled := False;

    if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_aplicativo.CanFocus) then
      ed_contato_pla_aplicativo.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_contato.CanFocus) then
      ed_contato_pla_contato.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_identificacao.CanFocus) then
      ed_contato_pla_identificacao.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ck_contrato_pla_tipos_contato.CanFocus) then
      ck_contrato_pla_tipos_contato.SetFocus;
  end;
end;

procedure TfrmCadcolaborador.bt_contatos_pla_saveClick(Sender: TObject);
begin
  inherited;
  with obColaborador.ContatoMsg do
    if not Auditor.Processo('COL044', StrAuditoria, StrAuditoriaCod).Salvar.Permitido then
      Exit;

  if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_contato.CanFocus) then
    ed_contato_pla_contato.SetFocus;
  if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_identificacao.CanFocus) then
    ed_contato_pla_identificacao.SetFocus;

  if not obColaborador.ContatoMsg.Post(ck_contrato_pla_tipos_contato) then
  begin
  	setFocusCampoErro(obColaborador.ContatoMsg.vNomeCampoErro, obColaborador.ContatoMsg.vMensagemErro);
  	Exit;
  end;

  lb_contato_pla_identificacao.Caption := 'Identificação';
  obColaborador.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';
  vCodPlataforma := 0;

  bt_contatos_pla_cancel.Click;

  pn_contatos_pla_cad.Enabled := False;
  pn_contatos_pla_cad.Visible := False;

  pn_contatos_pla_view.Enabled := True;
  pn_contatos_pla_view.Visible := True;
end;

procedure TfrmCadcolaborador.bt_contato_pla_tipoClick(Sender: TObject);
var
  MenuItem: TMenuItem;
begin
  inherited;

  if not Assigned(pop_menu_tipo_contato_pla) then
  begin
    pop_menu_tipo_contato_pla := TPopupMenu.Create(Self);

    MenuItem := TMenuItem.Create(pop_menu_tipo_contato_pla);
    MenuItem.Caption := 'Novo Tipo de Contato - [COL038]';
    MenuItem.OnClick := contato_tipo_pla_add;
    pop_menu_tipo_contato_pla.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_tipo_contato_pla);
    MenuItem.Caption := 'Alterar Tipo de Contato - [COL039]';
    MenuItem.OnClick := contato_tipo_pla_edit;
    pop_menu_tipo_contato_pla.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_tipo_contato_pla);
    MenuItem.Caption := 'Excluir Tipo de Contato - [COL040]';
    MenuItem.OnClick := contato_tipo_pla_del;
    pop_menu_tipo_contato_pla.Items.Add(MenuItem);
  end;

  pop_menu_tipo_contato_pla.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadcolaborador.contato_tipo_pla_add(Sender: TObject);
var
  Tipo: string;
begin
  if not obColaborador.ContatoMsg.Auditor.Processo('COL038').Inserir.Permitido then
    Exit;
  //form_modal_configure([bt_modal_assume, bt_mo);
  if not InputQuery('Novo tipo de contato', 'Informe o tipo de contato', Tipo) then
    Exit;

  Tipo := Trim(UpperCase(Tipo));

  obColaborador.ContatoMsg.Tipo.Insert;
  obColaborador.ContatoMsg.Tipo.fdata('tipo').Put(Tipo);
  if (obColaborador.ContatoMsg.Tipo.Post) then
    obColaborador.ContatoMsg.EditarTipoContato(ck_contrato_pla_tipos_contato);
end;

procedure TfrmCadcolaborador.contato_tipo_pla_edit(Sender: TObject);
var
  Tipo: string;
begin
  bt_modal_assume.Caption := 'Selecionar';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  grid_modal.DataSource := obColaborador.ContatoMsg.Tipo._dataSourceOOP;

  obColaborador.ContatoMsg.Tipo.First;
  if not vDadosIni.abreForm('Alteração de tipo de contato', pn_modal, opFormsDefCad) then
    Exit;

  Tipo := obColaborador.ContatoMsg.Tipo.fstr('tipo');
  
  with obColaborador.ContatoMsg.Tipo do
    if not Auditor.Processo('COL039', fstr('tipo'), fstr('id')).Alterar.Permitido then
      Exit;

  if not InputQuery('Alteração do tipo de contato', 'Informe o tipo de contato', Tipo) then
    Exit;

  if not obColaborador.ContatoMsg.Tipo.Edit then
    Exit;

  Tipo := Trim(UpperCase(Tipo));

  obColaborador.ContatoMsg.Tipo.fdata('tipo').Put(Tipo);

  if (obColaborador.ContatoMsg.Tipo.Post) then
  	obColaborador.ContatoMsg.EditarTipoContato(ck_contrato_pla_tipos_contato);
end;

procedure TfrmCadcolaborador.contato_tipo_pla_del(Sender: TObject);
begin
  bt_modal_assume.Caption := 'Excluir';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  grid_modal.DataSource := obColaborador.ContatoMsg.Tipo._dataSourceOOP;

  obColaborador.ContatoMsg.Tipo.First;
  if not vDadosIni.abreForm('Excluir tipo de contato', pn_modal, opFormsDefCad) then
    Exit;

  with obColaborador.ContatoMsg.Tipo do
    if not Auditor.Processo('COL040', fstr('tipo'), fstr('id')).Excluir.Permitido then
      Exit;

  if (obColaborador.ContatoMsg.Tipo.Delete) then
    obColaborador.ContatoMsg.EditarTipoContato(ck_contrato_pla_tipos_contato);
end;

procedure TfrmCadcolaborador.DBEdit34Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;
    
  if trim(TDBedit(Sender).text) = '' then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'COLABORADOR', '', obColaborador.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obColaborador.vCidades.abreCidade;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          obColaborador.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
        	DBLookupComboBox4.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
  	DBLookupComboBox4.SetFocus;
end;

procedure TfrmCadcolaborador.DBEdit34KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vBairros: TBairros;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('COL014', 'PESQUISAR', '', 'COLABORADOR', '', obColaborador.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obColaborador.vBairro.abreBairro;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          obColaborador.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);

        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
        	DBLookupComboBox4.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('COL015', 'CADASTRAR', '', 'COLABORADOR', '', obColaborador.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vBairros.CadBairro(1);
        obColaborador.vBairro.abreBairro;
        if vDadosIni.vPesquisa <> '' then
          obColaborador.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmCadcolaborador.DBEdit38Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;
    
  if trim(TDBedit(Sender).text) = '' then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'COLABORADOR', '', obColaborador.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obColaborador.vCidades.abreCidade;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          obColaborador.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);

        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
        	DBLookupComboBox3.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
  	DBLookupComboBox3.SetFocus;
end;

procedure TfrmCadcolaborador.DBEdit38KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCidade: TCidades;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('COL016', 'PESQUISAR', '', 'COLABORADOR', '', obColaborador.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obColaborador.vCidades.abreCidade;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          obColaborador.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);

        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
        	DBLookupComboBox3.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('COL017', 'CADASTRAR', '', 'COLABORADOR', '', obColaborador.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vCidade.CadCidade(1);
        obColaborador.vCidades.abreCidade;
        if vDadosIni.vPesquisa <> '' then
          obColaborador.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmCadcolaborador.DBEdit39Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox5.KeyValue := DBEdit39.DataSource.DataSet.FieldByName(DBEdit39.DataField).AsInteger;
end;

procedure TfrmCadcolaborador.DBEdit3Exit(Sender: TObject);
var
ListaCep : TStringList;
CEPs : TCEP;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if ((obColaborador.dataSet.FieldByName('END_VENDEDOR').IsNull) and
     (obColaborador.dataSet.FieldByName('CEP_VENDEDOR').IsNull)) then
    begin
      Application.MessageBox('Endereço do Colaborador não informado' + chr(13) +
        'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      	DBEdit3.SetFocus;
    end
    else
    begin
      if (obColaborador.dataSet.FieldByName('COD_BAIRRO').IsNull
        or obColaborador.dataSet.FieldByName('COD_CIDADE').IsNull
        or obColaborador.dataSet.FieldByName('CODIGO_UF').IsNull
        or obColaborador.dataSet.FieldByName('END_VENDEDOR').IsNull) then
      begin

        ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString);

        if ListaCep[0] <> '' then
        begin
          if obColaborador.dataSet.FieldByName('COD_BAIRRO').IsNull then
            obColaborador.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
          if obColaborador.dataSet.FieldByName('COD_CIDADE').IsNull then
            obColaborador.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
          if obColaborador.dataSet.FieldByName('CODIGO_UF').IsNull then
            obColaborador.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
          if obColaborador.dataSet.FieldByName('END_VENDEDOR').IsNull then
            obColaborador.dataSet.FieldByName('END_VENDEDOR').asstring := ListaCep[3];
        end;
      end;

    end;
end;

procedure TfrmCadcolaborador.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CEPs: TCEP;
  ListaCep: TStringList;
    Antes,Depois : string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._AbreCEP;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CEP');
      if vDadosIni.vPesquisa <> '' then
      begin
      	if vDadosIni.vPesquisa <> null then
          ListaCep :=
              CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(vDadosIni.vPesquisa);

      	obColaborador.dataSet.FieldByName('END_VENDEDOR').asstring := ListaCep[3];

        if ((obColaborador.dataSet.FieldByName('CEP_VENDEDOR').IsNull) and (ListaCep[0] <> '')) then
        begin
       	  antes :=  Copy(vDadosIni.vPesquisa,0,5) + '-';
       	  depois := Copy(vDadosIni.vPesquisa,6,8);
         	obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString := antes+depois;
        end;
      end;
      
      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      	DBEdit4.SetFocus;
    finally
      CEPs.Cancel;
      CEPs.Free;
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
    CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._CadCEP(1);
      CEPs._AbreCEP;
      if vDadosIni.vPesquisa <> '' then
      begin
      if vDadosIni.vPesquisa <> null then
       ListaCep :=
       CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(vDadosIni.vPesquisa);
       obColaborador.dataSet.FieldByName('END_VENDEDOR').asstring := ListaCep[3];
       if ((obColaborador.dataSet.FieldByName('CEP_VENDEDOR').IsNull) and (ListaCep[0] <> '')) then
       begin
         antes :=  Copy(vDadosIni.vPesquisa,0,5) + '-';
         depois := Copy(vDadosIni.vPesquisa,6,8);
         obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString := antes+depois;
       end;
      end;

    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadcolaborador.DBEdit42Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  obColaborador.dataSet.FieldByName('RG_VENDEDOR').AsString := vDadosIni.apenasLetraseNumeros(obColaborador.dataSet.FieldByName('RG_VENDEDOR').AsString);
end;

procedure TfrmCadcolaborador.DBEdit43Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if not obColaborador.vJornadaTrabalho.BuscarJornadaTrabalho(obColaborador.dataSet.FieldByName('COD_JORNADA_TRABALHO').AsInteger) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit43.CanFocus) then
      DBEdit43.SetFocus;
    Exit;
  end;
end;

procedure TfrmCadcolaborador.DBEdit43KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('JORNADA_TRABALHO');
    if trim(vDadosIni.vPesquisa) <> '' then
      obColaborador.dataSet.FieldByName('COD_JORNADA_TRABALHO').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadcolaborador.DBEdit44Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if not obColaborador.vEscalaSemanal.BuscarEscalaSemanal(obColaborador.dataSet.FieldByName('COD_ESCALA_SEMANAL').AsInteger) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit44.CanFocus) then
      DBEdit44.SetFocus;
    Exit;
  end;
end;

procedure TfrmCadcolaborador.DBEdit44KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CALEND_ESCALA_SEMANAL');
    if trim(vDadosIni.vPesquisa) <> '' then
      obColaborador.dataSet.FieldByName('COD_ESCALA_SEMANAL').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadcolaborador.DBEdit4Exit(Sender: TObject);
var
ListaCep : TStringList;
CEPs : TCEP;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if obColaborador.dataSet.FieldByName('CEP_VENDEDOR').IsNull then
    begin
      //Application.MessageBox('CEP de cobrança do Colaborador não informado' + chr(13) +
      //  'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      //if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      //	DBEdit4.SetFocus;
      obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString := '00000-000';
    end
    else
    if obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString <> '00000-000'  then
    begin
      if (obColaborador.dataSet.FieldByName('COD_BAIRRO').IsNull
        or obColaborador.dataSet.FieldByName('COD_CIDADE').IsNull
        or obColaborador.dataSet.FieldByName('CODIGO_UF').IsNull
        or obColaborador.dataSet.FieldByName('END_VENDEDOR').IsNull) then
      begin

        ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString);

        if ListaCep[0] <> '' then
        begin
          if obColaborador.dataSet.FieldByName('COD_BAIRRO').IsNull then
            obColaborador.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
          if obColaborador.dataSet.FieldByName('COD_CIDADE').IsNull then
            obColaborador.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
          if obColaborador.dataSet.FieldByName('CODIGO_UF').IsNull then
            obColaborador.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
          if obColaborador.dataSet.FieldByName('END_VENDEDOR').IsNull then
            obColaborador.dataSet.FieldByName('END_VENDEDOR').asstring := ListaCep[3];
        end;
      end;

    end;
end;

procedure TfrmCadcolaborador.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ListaCEP : TStringList;
  CEPs: TCEP;
  Antes,Depois : string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._AbreCEP;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CEP');
      if vDadosIni.vPesquisa <> '' then
      begin
       antes :=  Copy(vDadosIni.vPesquisa,0,5) + '-';
       depois := Copy(vDadosIni.vPesquisa,6,8);
        obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString := antes+depois;

         ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString);

        if ListaCep[0] <> '' then
        begin
            obColaborador.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
            obColaborador.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
            obColaborador.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
            obColaborador.dataSet.FieldByName('END_VENDEDOR').asstring := ListaCep[3];
        end;
      end;

      // if (Self.Enabled) and (Self.Visible) and (DBEdit34.CanFocus) then
      //   DBEdit34.SetFocus;
    finally
      CEPs.Cancel;
      CEPs.Free;
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
    CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._CadCEP(1);
      CEPs._AbreCEP;
      if vDadosIni.vPesquisa <> '' then
      begin
       antes :=  Copy(vDadosIni.vPesquisa,0,5) + '-';
       depois := Copy(vDadosIni.vPesquisa,6,8);
        obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString := antes+depois;

         ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString);

        if ListaCep[0] <> '' then
        begin
            obColaborador.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
            obColaborador.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
            obColaborador.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
            obColaborador.dataSet.FieldByName('END_VENDEDOR').asstring := ListaCep[3];
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadcolaborador.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not obColaborador.Cpf(DBEdit8.text) then
  begin
    Application.MessageBox('CPF Inválido', 'Atenção', MB_ICONWARNING + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
    	DBEdit8.SetFocus
  end;
end;

procedure TfrmCadcolaborador.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    obColaborador._marcaDesmarcaLinha;
end;

procedure TfrmCadcolaborador.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmCadcolaborador.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not obColaborador.dataSet.IsEmpty then
      obColaborador._marcaDesmarcaLinha;
end;

procedure TfrmCadcolaborador.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  BitBtn7Click(sender);
end;

procedure TfrmCadcolaborador.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    BitBtn7Click(sender)
  else if (Key = VK_RETURN) or (key = VK_TAB) then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadcolaborador.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
  BitBtn8Click(sender);
end;

procedure TfrmCadcolaborador.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    BitBtn8Click(sender)
  else if (Key = VK_RETURN) or (key = VK_TAB) then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadcolaborador.DBGrid4DblClick(Sender: TObject);
begin
  inherited;
  BitBtn9Click(sender);
end;

procedure TfrmCadcolaborador.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    BitBtn9Click(sender)
  else if (Key = VK_RETURN) or (key = VK_TAB) then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadcolaborador.DBGrid5DblClick(Sender: TObject);
begin
  inherited;
  BitBtn10Click(sender);
end;

procedure TfrmCadcolaborador.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    BitBtn10Click(sender)
  else if (Key = VK_RETURN) or (key = VK_TAB) then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadcolaborador.DBLookupComboBox1DropDown(Sender: TObject);
begin
  inherited;
  obColaborador.cadFuncao.abreFuncoes;
end;

procedure TfrmCadcolaborador.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('COL018', 'CADASTRAR', '', 'COLABORADOR', '', obColaborador.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        obColaborador.cadFuncao.CadFuncao(1);
        obColaborador.cadFuncao.abreFuncoes;
        if vDadosIni.vPesquisa <> '' then
          obColaborador.dataSet.FieldByName('COD_FUNCAO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmCadcolaborador.DBLookupComboBox3DropDown(Sender: TObject);
begin
  inherited;
  obColaborador.vCidades.abreCidade;
end;

procedure TfrmCadcolaborador.DBLookupComboBox4DropDown(Sender: TObject);
begin
  inherited;
  obColaborador.vBairro.abreBairro;
end;

procedure TfrmCadcolaborador.DesmarcarTodosColaboradoresClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obColaborador._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadcolaborador.ed_contato_pla_aplicativoExit(Sender: TObject);
begin
  inherited;
  if not (obColaborador.ContatoMsg.dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if vCodPlataforma = vDadosIni.IfThen(ed_contato_pla_aplicativo.KeyValue = Null, 0, ed_contato_pla_aplicativo.KeyValue) then
  	Exit;

  ed_contato_pla_identificacao.Field.AsString := '';

  if vDadosIni.IfThen(ed_contato_pla_aplicativo.KeyValue = Null, 0, ed_contato_pla_aplicativo.KeyValue) <= 0 then
  	lb_contato_pla_identificacao.Caption := 'Identificação'
  else 
  	lb_contato_pla_identificacao.Caption :=
    	Copy(trim(ed_contato_pla_aplicativo.Text), 1, 1) +
      LowerCase(Copy(trim(ed_contato_pla_aplicativo.Text), 2, Length(trim(ed_contato_pla_aplicativo.Text)) - 1));

  if vDadosIni.retornaNomeAplicativo(vDadosIni.IfThen(ed_contato_pla_aplicativo.KeyValue = Null, 0, ed_contato_pla_aplicativo.KeyValue)) = 'WHATSAPP' then
  	obColaborador.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '(99) 99999-9999;0;_'
  else
  	obColaborador.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';

  vCodPlataforma := vDadosIni.IfThen(ed_contato_pla_aplicativo.KeyValue = Null, 0, ed_contato_pla_aplicativo.KeyValue);
end;

procedure TfrmCadcolaborador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obColaborador.Cancel;
  obColaborador.cadPerfil_colab.Cancel;
  obColaborador.cadIncidenciaColab.Cancel;
  obColaborador.RollBackTransacao;
  obColaborador.free;

  if Assigned(lk_tipo_contato_pla) then
    lk_tipo_contato_pla.Free;
  if Assigned(lk_aplicativo_contato_pla) then
    lk_aplicativo_contato_pla.Free;
    
  Action := caFree;
  frmCadcolaborador := nil;
end;

procedure TfrmCadcolaborador.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  obColaborador := TColaborador.create;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadcolaborador.FormShow(Sender: TObject);
var
  I: Integer;
begin
  DBGrid1.DataSource := dtmColaborador.dsCola;
  DBGrid2.DataSource := dtmColaborador.dsPerfilComissao;
  DBGrid3.DataSource := dtmColaborador.dsPercolab;
  DBGrid4.DataSource := dtmColaborador.dsIncidencia;
  DBGrid5.DataSource := dtmColaborador.dsIncidenciaColab;
  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;
  TabSheet3.Visible := true;
  TabSheet7.TabVisible := false;
  tsOutros.TabVisible := false;
  tsContatoPlataforma.TabVisible := false;
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to self.ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).CharCase := ecUpperCase;

  end;
  DBEdit14.CharCase := ecLowerCase;
  DBComboBox1.Visible := vDadosIni.vEmp.vUsarTelevenda = 'S';
  Label50.Visible := vDadosIni.vEmp.vUsarTelevenda = 'S';
  
  SpeedButton23.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';
  SpeedButton7.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';
  SpeedButton11.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "COL014" PESQUISAR BAIRRO' + #13 +
    'Processo "COL015" CADASTRAR BAIRRO' + #13 +
    'Processo "COL016" PESQUISAR CIDADE' + #13 +
    'Processo "COL017" CADASTRAR CIDADE';
end;

procedure TfrmCadcolaborador.MarcarTodosColaboradoresClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    obColaborador._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadcolaborador.PageControl3Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
	for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TfrmCadcolaborador.pnContatoPlataformaEnter(Sender: TObject);
begin
  inherited;
  grid_contatos_pla.DataSource := obColaborador.ContatoMsg._dataSourceOOP;
	ed_contato_pla_aplicativo.DataSource := obColaborador.ContatoMsg._dataSourceOOP;
  ed_contato_pla_contato.DataSource := obColaborador.ContatoMsg._dataSourceOOP;
  ed_contato_pla_identificacao.DataSource := obColaborador.ContatoMsg._dataSourceOOP;

  if not Assigned(lk_tipo_contato_pla) then
    lk_tipo_contato_pla := TDadosLookUp_OOP.create;
  if not Assigned(lk_aplicativo_contato_pla) then
    lk_aplicativo_contato_pla := TDadosLookUp_OOP.create;

  lk_aplicativo_contato_pla.setDadosDataSet('ID', 'APLICATIVO', obColaborador.ContatoMsg.Aplicativo.dataSet, ed_contato_pla_aplicativo);

  pn_contatos_pla_view.Enabled := True;
  pn_contatos_pla_cad.Enabled := False;
  pn_contatos_pla_cad.Visible := False;
  obColaborador.ContatoMsg.dataSet.Cancel;
end;

procedure TfrmCadcolaborador.pn_contatos_pla_cadEnter(Sender: TObject);
begin
  inherited;
  pn_contatos_pla_view.Enabled := False;
  pn_contatos_pla_view.Visible := False; 
  bt_contatos_pla_add.Enabled := pn_contatos_pla_view.Enabled;
  bt_contatos_pla_del.Enabled := pn_contatos_pla_view.Enabled;
  bt_contatos_pla_save.Enabled := pn_contatos_pla_cad.Enabled;
  bt_contatos_pla_cancel.Enabled := pn_contatos_pla_cad.Enabled;
end;

procedure TfrmCadcolaborador.pn_contatos_pla_viewEnter(Sender: TObject);
begin
  inherited;
  pn_contatos_pla_cad.Enabled := False;
  pn_contatos_pla_cad.Visible := False;
  bt_contatos_pla_add.Enabled := pn_contatos_pla_view.Enabled;
  bt_contatos_pla_del.Enabled := pn_contatos_pla_view.Enabled;
  bt_contatos_pla_save.Enabled := pn_contatos_pla_cad.Enabled;
  bt_contatos_pla_cancel.Enabled := pn_contatos_pla_cad.Enabled;
end;

procedure TfrmCadcolaborador.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;

  while not obColaborador.Eof do
    obColaborador.Next;
  obColaborador.First;

end;

procedure TfrmCadcolaborador.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Colaboradores');
end;

procedure TfrmCadcolaborador.SpeedButton11Click(Sender: TObject);
var
  CalendEscalaSemanal: TCalendEscalaSemanal;
begin
  CalendEscalaSemanal._cadCalendEscalaSemanal(0);
end;

procedure TfrmCadcolaborador.SpeedButton15Click(Sender: TObject);
var
  CEPs: TCEP;
  ListaCep: TStringList;
  Bairros: TListaBairros1;
  Cidades: TListaCidades1;
  Estado: TListaEtados1;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
  	DBEdit3.SetFocus;
  ListaCep := CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(
    obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString);
  //  if(CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(
  //  obColaborador.dataSet.FieldByName('CEP').AsString)[0] = '') then
  if (ListaCep[0] = '') then
  begin
    if (CEPs._ConsultarWebService(obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString)) then
    begin
      ListaCep :=
        CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(obColaborador.dataSet.FieldByName('CEP_VENDEDOR').AsString);
      if (ListaCep[0] <> '') then
      begin
        Bairros := TListaBairros1.create;
        Bairros.buscas.Close;
        Bairros.buscas.Open;
        Cidades := TListaCidades1.create;
        Cidades.buscas.Close;
        Cidades.buscas.Open;
        Estado := TListaEtados1.create;
        Estado.buscas.Close;
        Estado.buscas.Open;
        obColaborador.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
        obColaborador.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
        obColaborador.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
        obColaborador.dataSet.FieldByName('END_VENDEDOR').asstring := ListaCep[3];
        Bairros.Free;
        Bairros := nil;
        Cidades.Free;
        Cidades := nil;
        Estado.Free;
        Estado := nil;
      end;
    end;
  end 
  else if ListaCep[0] <> '' then
  begin
    //    if obColaborador.dataSet.FieldByName('COD_BAIRRO').IsNull then
    obColaborador.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
    //    if obColaborador.dataSet.FieldByName('COD_CIDADE').IsNull then
    obColaborador.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
    //    if obColaborador.dataSet.FieldByName('CODIGO_UF').IsNull then
    obColaborador.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
    //    if obColaborador.dataSet.FieldByName('ENDERECO').IsNull then
    obColaborador.dataSet.FieldByName('END_VENDEDOR').asstring := ListaCep[3];
  end;
  if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus;
end;

procedure TfrmCadcolaborador.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  if (obColaborador.dataSet.FieldByName('ATIVO').AsInteger <> 1) then
    exit;

  if not vDadosIni.PesqPros('COL003', 'EDITAR', '', 'COLABORADOR', obColaborador.dataSet.FieldByName('COD_VENDEDOR').AsString, obColaborador.buscas, true) then
  	exit;

  if not vDadosIni.sincronizarDadosContatoColaboradorAplicativo(
  	obColaborador.dataSet.FieldByName('COD_VENDEDOR').AsInteger) then
    	Exit;

  if not obColaborador.Edit then
    Exit;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;

  inherited;

  Label53.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';
  DBEdit43.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';
  DBLookupComboBox6.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';

  Label54.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';
  DBEdit44.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';
  DBLookupComboBox7.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';

  SpeedButtonContatoPlataforma.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';

  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;
  TabSheet5.TabVisible := true;
  TabSheet6.TabVisible := true;
  
  obColaborador.cadIncidenciaColab.abreIcidenciaColab(obColaborador.dataSet.FieldByName('COD_VENDEDOR').AsInteger);
  obColaborador.cadPerfil_colab.abrePerfil_colab(obColaborador.dataSet.FieldByName('COD_VENDEDOR').AsInteger);

  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TfrmCadcolaborador.SpeedButton23Click(Sender: TObject);
var
  JornadaTrabalho: TJornadaTrabalho;
begin
  JornadaTrabalho._cadJornadaTrabalho(0);
end;

procedure TfrmCadcolaborador.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('COL006', 'ABRIR A LIXEIRA', '', 'COLABORADOR', '', obColaborador.buscas, true) then
  begin
    inherited;
    if not obColaborador.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [COL004]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [COL013]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;

    obColaborador.ultimasql := obColaborador.dataSet.CommandText;
  end;
end;

procedure TfrmCadcolaborador.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    inherited;
    if not obColaborador.Delete then
      Exit;

    vStatusLixeira := obColaborador.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obColaborador.Cancel;
      obColaborador.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadcolaborador.SpeedButton3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('COL005', 'IMPRIMIR', '', 'COLABORADOR', '', obColaborador.buscas, true) then
  begin
    inherited;
    QuickRep1.Preview;
  end;
end;

procedure TfrmCadcolaborador.SpeedButton5Click(Sender: TObject);
begin
  if not obColaborador.restaurarLixeira then
  	Exit;

  if obColaborador.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TfrmCadcolaborador.SpeedButton6Click(Sender: TObject);
var
  obLancDC: TLancDebitoCredito;
begin
  inherited;
  try
    if not vDadosIni.PesqPros('COL030', 'ABRIR', 'DÉBITOS E CRÉDITOS DOS COLABORADORES','lanc_debcred' , '',
      obColaborador.buscas, True) then
      Exit;
    inherited;
    vDadosIni.vPesquisa := inttostr(obColaborador.dataSet.FieldByName('cod_vendedor').AsInteger);
    obLancDC.CadLancDebCred(0);
  finally
  end;
end;

procedure TfrmCadcolaborador.SpeedButton7Click(Sender: TObject);
var
  CalendarioColExc: TCalendColaboradorExc;
begin
  CalendarioColExc._cadCalendColaboradorExc(0);
end;

procedure TfrmCadcolaborador.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  obColaborador.abreFormSaldoExtrato;
end;

procedure TfrmCadcolaborador.SpeedButtonContatoPlataformaClick(Sender: TObject);
begin
  inherited;
  if (obColaborador.ContatoMsg.dataSet.State in [dsInsert, dsEdit]) then
  	obColaborador.ContatoMsg.dataSet.Cancel;

  pn_contatos_pla_cad.Enabled    := False;
  pn_contatos_pla_cad.Visible    := False;

  pn_contatos_pla_view.Enabled   := True;
  pn_contatos_pla_view.Visible   := True;

  bt_contatos_pla_add.Enabled    := True;
  bt_contatos_pla_del.Enabled    := True;

  bt_contatos_pla_save.Enabled   := False;
  bt_contatos_pla_cancel.Enabled := False;

  lb_contato_pla_identificacao.Caption := 'Identificação';
  obColaborador.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';
  vCodPlataforma := 0;

  vDadosIni.abreForm('Mais dados - Contato / Telefones', pnContatoPlataforma, [ofAutoSize, ofEscapeExit]);
end;

end.

