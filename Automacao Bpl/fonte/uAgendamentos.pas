unit uAgendamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao,UClassesClientes, StdCtrls, DBCtrls, Mask, Buttons, Grids,
  DBGrids, ExtCtrls, Menus, ComCtrls, DB, DBClient, uEditHw;

type
  TFrmAgendamentos = class(TfrmPadrao)
    MainMenu1: TMainMenu;
    AgendadoDia1: TMenuItem;
    AgendadoCliente1: TMenuItem;
    AgendaOficina1: TMenuItem;
    PrevisodeServio1: TMenuItem;
    TiposdeContatoeFinalizao1: TMenuItem;
    PageControl1: TPageControl;
    tsCadastro: TTabSheet;
    tsTipoContato: TTabSheet;
    tsAgendamento: TTabSheet;
    pnConsulta: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn12: TBitBtn;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    SpeedButton1: TSpeedButton;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Bevel1: TBevel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBMemo2: TDBMemo;
    DBEdit11: TDBEdit;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    BitBtn5: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Image1: TImage;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    Bevel2: TBevel;
    GroupBox7: TGroupBox;
    Label6: TLabel;
    DBText15: TDBText;
    Label7: TLabel;
    DBText16: TDBText;
    Label8: TLabel;
    DBText17: TDBText;
    Label9: TLabel;
    Label10: TLabel;
    DBText18: TDBText;
    DBText19: TDBText;
    GroupBox8: TGroupBox;
    Label11: TLabel;
    DBText20: TDBText;
    Label14: TLabel;
    DBText21: TDBText;
    Label16: TLabel;
    DBText22: TDBText;
    Label34: TLabel;
    Label35: TLabel;
    DBText23: TDBText;
    DBText24: TDBText;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox4: TGroupBox;
    SpeedButton7: TSpeedButton;
    DBLookupComboBox3: TDBLookupComboBox;
    pnCadastro: TPanel;
    Panel7: TPanel;
    Label32: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit5: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    GroupBox5: TGroupBox;
    SpeedButton5: TSpeedButton;
    DBEdit6: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    Panel8: TPanel;
    BitBtn1: TBitBtn;
    BitBtn13: TBitBtn;
    pnTipoContato: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn14: TBitBtn;
    GroupBox6: TGroupBox;
    DBGrid1: TDBGrid;
    tsFinalizacaoContato: TTabSheet;
    pnProximoAgendamento: TPanel;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    tsRedistribuirAgend: TTabSheet;
    pnRedistribuirAgendamentos: TPanel;
    GroupBox9: TGroupBox;
    DBLookupComboBox7: TDBLookupComboBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    DBLookupComboBox8: TDBLookupComboBox;
    GroupBox12: TGroupBox;
    Panel1: TPanel;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Panel2: TPanel;
    BitBtn19: TBitBtn;
    RedistribuirAgendamentos1: TMenuItem;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    MaskEdit1: TMaskEdit;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    SpeedButton13: TSpeedButton;
    tsProm: TTabSheet;
    GroupBox13: TGroupBox;
    Panel4: TPanel;
    Panel9: TPanel;
    Shape1: TShape;
    Label36: TLabel;
    Shape2: TShape;
    Label37: TLabel;
    DBGrid5: TDBGrid;
    GroupBox14: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel10: TPanel;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    Panel11: TPanel;
    DBText25: TDBText;
    procedure Image1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid5KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton13Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure DBLookupComboBox7Exit(Sender: TObject);
    procedure pnRedistribuirAgendamentosExit(Sender: TObject);
    procedure pnRedistribuirAgendamentosEnter(Sender: TObject);
    procedure RedistribuirAgendamentos1Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure pnProximoAgendamentoEnter(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure TiposdeContatoeFinalizao1Click(Sender: TObject);
    procedure PrevisodeServio1Click(Sender: TObject);
    procedure AgendaOficina1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBMemo2Enter(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure GroupBox5Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure AgendadoCliente1Click(Sender: TObject);
    procedure AgendadoDia1Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure pnCadastroExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure pnCadastroEnter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    vCodCli:integer;
    vShiftClick, vMouseMove: Boolean;
    procedure _voltaParaConsulta;
    procedure _desabilitaMenus;
    procedure _irParaCadastro(pReagendamento: Boolean = False);
    procedure _irParaTipoContato;
    procedure _irParaRedistribuirAgendamentos;
    procedure _irParaPromocoes;
    procedure _setCapsLock(pAtivo: Boolean);
    function _mdiAberto(pNomeFormMDI: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgendamentos: TFrmAgendamentos;

implementation

uses
  UDtmCRM, uclassescrm, uDtmAtivo, uDadosIni, uDataSet_OOP, funcoes;

//  UClassesCadastrosBasicos, UDtmClientes, uDtmAtivo,
//  SysUtils, DB, Variants, uDataSet_OOP, uDadosIni;


{$R *.dfm}

procedure TFrmAgendamentos.AgendadoCliente1Click(Sender: TObject);
begin
  inherited;
  agenda._abreAgendaCliente;
end;

procedure TFrmAgendamentos.AgendadoDia1Click(Sender: TObject);
begin
  inherited;
 
  agenda._abreAgendaDoDia;
end;

procedure TFrmAgendamentos.AgendaOficina1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM003', 'CONSULTA', '', 'AGENDAMENTO', '',
    agenda.buscas, True) then
    Exit;
end;

procedure TFrmAgendamentos.BitBtn10Click(Sender: TObject);
begin
  inherited;
  agenda.Prior;
end;

procedure TFrmAgendamentos.BitBtn11Click(Sender: TObject);
begin
  inherited;
  agenda.Next;
end;

procedure TFrmAgendamentos.BitBtn12Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmAgendamentos.BitBtn13Click(Sender: TObject);
begin
  inherited;

  _voltaParaConsulta;

//  agenda.Cancel;
//  pnConsulta.Visible := True;
//  pnCadastro.Visible := False;
//  if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
//  	DBGrid2.SetFocus;
end;

procedure TFrmAgendamentos.BitBtn14Click(Sender: TObject);
begin
  inherited;
  agenda.vTpA_A.Post;
end;

procedure TFrmAgendamentos.BitBtn15Click(Sender: TObject);
begin
  inherited;
  if agenda._reagendar(True) then
    TForm(pnProximoAgendamento.Parent).ModalResult := IDOK;
end;

procedure TFrmAgendamentos.BitBtn16Click(Sender: TObject);
var
	vTempDt: string;
begin
  inherited;
  if InputQuery('Data para agendamento', 'Informe uma data para o agendamento. Usar o formato DD/MM/AAAA', vTempDt) then
    try
      agenda.vDtAgendamento := StrToDate(vTempDt);
      if agenda._reagendar(True) then
        TForm(pnProximoAgendamento.Parent).ModalResult := IDOK;
    except
      Application.MessageBox('Data informada inválida', 'Atenção', 0 + 64);
    end;  
end;

procedure TFrmAgendamentos.BitBtn17Click(Sender: TObject);
begin
  inherited;
  agenda.vClA._clienteNaoAceitaContato;
  TForm(pnProximoAgendamento.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmAgendamentos.BitBtn18Click(Sender: TObject);
begin
  inherited;
  TForm(pnProximoAgendamento.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmAgendamentos.BitBtn1Click(Sender: TObject);
begin
  inherited;

  if agenda.Post then
    _voltaParaConsulta
  else
    setFocusCampoErro(agenda.vNomeCampoErro);
//  begin
//    pnConsulta.Visible := True;
//    pnCadastro.Visible := False;
//    if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
//    	DBGrid2.SetFocus;
//  end;
end;

procedure TFrmAgendamentos.BitBtn20Click(Sender: TObject);
begin
  inherited;
  if agenda._confirmarAgendamentosRedistribuidos then
    _voltaParaConsulta
  else
    setFocusCampoErro(agenda.vNomeCampoErro);
end;

procedure TFrmAgendamentos.BitBtn21Click(Sender: TObject);
begin
  inherited;
  _voltaParaConsulta;
end;

procedure TFrmAgendamentos.BitBtn22Click(Sender: TObject);
begin
  inherited;
  agenda.vPromProd.DIAS_BASE_CONSULTA := EditHw1.AsInteger;
  agenda.vPromProd.QTDE_MAX_REGISTROS := EditHw2.AsInteger;
  agenda.vPromProd.ORDEM_QTDE := RadioButton1.Checked;
  agenda.vPromProd.COD_CLIENTE := agenda.DataSet.FieldByName('COD_CLIENTE').asinteger;
  agenda.vPromProd._abrePromocoesParaCliente;
end;

procedure TFrmAgendamentos.BitBtn24Click(Sender: TObject);
begin
  inherited;
  _irParaPromocoes;
end;

procedure TFrmAgendamentos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_TELEVENDAS', 'I', agenda.buscas) then
    Exit;

  if agenda.Insert then
    _irParaCadastro;
//  begin
//    pnCadastro.Visible := True;
//    pnConsulta.Visible := False;
//    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
//    	DBLookupComboBox4.SetFocus;
//  end;

end;

procedure TFrmAgendamentos.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_TELEVENDAS', 'A', agenda.buscas) then
    Exit;

  if agenda.Edit then
    _irParaCadastro;
//  begin
//    pnCadastro.Visible := True;
//    pnConsulta.Visible := False;
//	  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
//    	DBLookupComboBox4.SetFocus;
//  end;

end;

procedure TFrmAgendamentos.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_TELEVENDAS', 'E', agenda.buscas) then
    Exit;
  agenda.Delete;
end;

procedure TFrmAgendamentos.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_TELEVENDAS', 'A', agenda.buscas) then
    Exit;
  if agenda.vTpA_F.dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsInteger = 5 then
    SpeedButton9.Click
  else if agenda.vTpA_F.dataSet.FieldByName('COD_TIPO_AGENDAMENTO').AsInteger = 6 then
    Application.MessageBox('Utilize os botões "Vender Mercadorias" ou "Vender Serviços" para finalizar este atendimento com uma venda',
     'Atenção', 64)
  else if not agenda._finalizarAgendamento then
     setFocusCampoErro(agenda.vNomeCampoErro)
  else if not agenda._abreFormReagendamento then
    setFocusCampoErro(agenda.vNomeCampoErro)
  else
    _irParaCadastro(False);
end;

procedure TFrmAgendamentos.BitBtn6Click(Sender: TObject);
var
  formulario: TForm;
  hdTemp: THandle;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_TELEVENDAS', 'A', agenda.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'I', agenda.buscas) then
    Exit;
  if _mdiAberto('TFrmCadPedVenda') then
    Exit;

  if not vDadosIni.PesqPros('CRM015', 'INCLUIR', 'COD CLIENTE: ' + agenda.dataSet.FieldByName('COD_CLIENTE').AsString,
    'AGENDAMENTO', agenda.dataSet.FieldByName('cod_agendamento').AsString, agenda.Buscas, True) then
    Exit;

  if PageControl1.ActivePage =  tsProm then
    agenda.vPromProd._selecionarItensParaVenda
  else
    agenda.vPromProd.Close;

  if not agenda._finalizarAgendamento('REQ') then
    setFocusCampoErro(agenda.vNomeCampoErro)
  else if not agenda._abreFormReagendamento then
    setFocusCampoErro(agenda.vNomeCampoErro)
  else
    _irParaCadastro(False);

  if PageControl1.ActivePage =  tsProm then
    agenda.vPromProd._abrePromocoesParaCliente
  else
    agenda.vPromProd.Close;

//  vDadosIni.vPesquisa := 'TELEVENDA|PED|' + IntToStr(agenda.dataSet.FieldByName('cod_agendamento').AsInteger) + '|';
//  vDadosIni.vtpVenda := 'REQ';
//
//  formulario := Funcoes.AbreForm('pkPedidoVenda', 'TFrmCadPedVenda', hdTemp);
//
//  try
//    formulario.ShowModal;
//  finally
//    vDadosIni.vPesquisa := '';
//    formulario.Free;
//    unLoadPackage(hdTemp);
//  end;
//  agenda.montaSelect(agenda.dataSet.CommandText);
end;

procedure TFrmAgendamentos.BitBtn7Click(Sender: TObject);
var
  formulario: TForm;
  hdTemp: THandle;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_TELEVENDAS', 'A', agenda.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'I', agenda.buscas) then
    Exit;

  if _mdiAberto('TFrmCadPedVenda') then
    Exit;

  if not vDadosIni.PesqPros('CRM016', 'INCLUIR', 'COD CLIENTE: ' + agenda.dataSet.FieldByName('COD_CLIENTE').AsString,
    'AGENDAMENTO', agenda.dataSet.FieldByName('cod_agendamento').AsString, agenda.Buscas, True) then
    Exit;

  if not agenda._finalizarAgendamento('OS') then
    setFocusCampoErro(agenda.vNomeCampoErro)
  else if not agenda._abreFormReagendamento then
    setFocusCampoErro(agenda.vNomeCampoErro)
  else
    _irParaCadastro(False);
//
//  vDadosIni.vPesquisa := 'TELEVENDA|OS|' + IntToStr(agenda.dataSet.FieldByName('cod_agendamento').AsInteger) + '|';
//  vDadosIni.vtpVenda := 'OS';
//
//  formulario := Funcoes.AbreForm('pkPedidoVenda', 'TFrmCadPedVenda', hdTemp);
//
//  try
//    formulario.ShowModal;
//  finally
//    vDadosIni.vPesquisa := '';
//    formulario.Free;
//    unLoadPackage(hdTemp);
//  end;
//  agenda.montaSelect(agenda.dataSet.CommandText);
end;

procedure TFrmAgendamentos.BitBtn8Click(Sender: TObject);
begin
  inherited;
  agenda.vTpA_A.Delete;
end;

procedure TFrmAgendamentos.BitBtn9Click(Sender: TObject);
begin
  inherited;
  _voltaParaConsulta;
end;

procedure TFrmAgendamentos.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if agenda.dataSet.State in [dsInsert, dsEdit] then
    if agenda.dataSet.FieldByName('cod_cliente').AsInteger = 0 then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
      if Trim(vDadosIni.vPesquisa) <> '' then
        agenda.dataSet.FieldByName('cod_cliente').AsString := Trim(vDadosIni.vPesquisa);
    end;
  agenda._validaCliente;
end;

procedure TFrmAgendamentos.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
    if Trim(vDadosIni.vPesquisa) <> '' then
      if agenda.dataSet.State in [dsInsert, dsEdit] then
      begin
        agenda.dataSet.FieldByName('cod_cliente').AsString := Trim(vDadosIni.vPesquisa);
        agenda.vClA._selecionaCliente(agenda.dataSet.FieldByName('cod_cliente').AsInteger);
      end;
  end;
end;

procedure TFrmAgendamentos.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('automatico').AsString = 'S' then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($00E9E6C5);
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmAgendamentos.DBGrid2TitleClick(Column: TColumn);
var
  vTemp: string;
  I: Integer;
begin
  inherited;
  if vShiftClick then
  begin
    if (TClientDataSet(DBGrid2.DataSource.DataSet).IndexName <> '') and
      (copy(TClientDataSet(DBGrid2.DataSource.DataSet).IndexName, 1, 4) <> 'IDX$') then
      vTemp := TClientDataSet(DBGrid2.DataSource.DataSet).IndexName + ';' + Column.Field.FieldName
    else
    begin
      vTemp := Column.Field.FieldName;
      for I := 0 to DBGrid2.Columns.Count - 1 do
        DBGrid2.Columns[i].Title.Font.Style := [];
    end;
    TClientDataSet(DBGrid2.DataSource.DataSet).IndexDefs.Clear;
    TClientDataSet(DBGrid2.DataSource.DataSet).IndexDefs.Add( vTemp, vTemp , []);
    try
      TClientDataSet(DBGrid2.DataSource.DataSet).IndexName := vTemp;
      Column.Title.Font.Style := [fsBold];
    except
    end;
  end
  else
  begin
    TClientDataSet(DBGrid2.DataSource.DataSet).IndexDefs.Clear;

    if Column.Field.Tag = 0 then
    begin
      Column.Field.Tag := 1;
      vTemp := 'IDX$A' + Column.Field.FieldName;
      TClientDataSet(DBGrid2.DataSource.DataSet).IndexDefs.Add(vTemp, Column.Field.FieldName,[]);
    end
    else
    begin
      Column.Field.Tag := 0;
      vTemp := 'IDX$D' + Column.Field.FieldName;
      TClientDataSet(DBGrid2.DataSource.DataSet).IndexDefs.Add(vTemp, Column.Field.FieldName,[ixDescending]);
    end;
    TClientDataSet(DBGrid2.DataSource.DataSet).IndexName := vTemp;
    for I := 0 to DBGrid2.Columns.Count - 1 do
      DBGrid2.Columns[i].Title.Font.Style := [];
    Column.Title.Font.Style := [fsBold];
  end;
end;

procedure TFrmAgendamentos.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  R: TRect;
begin
  inherited;

  if (Column.FieldName = 'DESCRICAO') or (Column.FieldName = 'VALOR_PROMOCAO') or (Column.FieldName = 'DESCR_PROD') then
  begin
    if Column.Field.Dataset.FieldbyName('tipo').AsString = 'P' then
    begin
      TDBGrid(sender).Canvas.Brush.Color := TColor($006AD2FF);
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
      TDBGrid(sender).Canvas.Brush.Color := TColor($008AFF8A);
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  end;
end;

procedure TFrmAgendamentos.DBGrid5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_DOWN then
    if DBGrid5.DataSource.DataSet.FieldByName('num_fab_prod').IsNull then
      DBGrid5.DataSource.DataSet.Cancel;
end;

procedure TFrmAgendamentos.DBLookupComboBox2Enter(Sender: TObject);
begin
  inherited;
  if agenda.dataSet.FieldByName('data_finalizacao').AsString = '' then
    DBLookupComboBox2.DataSource.AutoEdit := True
  else
    DBLookupComboBox2.DataSource.AutoEdit := False;
end;

procedure TFrmAgendamentos.DBLookupComboBox7Exit(Sender: TObject);
begin
  inherited;
  if not agenda._validaTrocaColaborador then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
  	  DBLookupComboBox7.SetFocus;
    Exit;
  end;  
  agenda.vColR._abreColaborador(agenda.vCol.dataSet.FieldByName('cod_vendedor').AsInteger);
  DBLookupComboBox8.KeyValue := agenda.vColR.dataSet.FieldByName('cod_vendedor').AsInteger;
  agenda._abreAgendaColaborador(agenda.vCol.dataSet.FieldByName('cod_vendedor').AsInteger);
  MaskEdit1Exit(MaskEdit1);
end;

procedure TFrmAgendamentos.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  _setCapsLock(True);
end;

procedure TFrmAgendamentos.DBMemo2Enter(Sender: TObject);
begin
  inherited;
  _setCapsLock(True);
  if agenda.dataSet.FieldByName('data_finalizacao').AsString = '' then
    DBMemo2.DataSource.AutoEdit := True
  else
    DBMemo2.DataSource.AutoEdit := False;
end;

procedure TFrmAgendamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmAgendamentos := nil;
end;

procedure TFrmAgendamentos.FormCreate(Sender: TObject);
begin
  inherited;
  agenda := TAgenda.create;
  vShiftClick := False;
//  obAgendamento := TAgendamentos.create;

//  FrmCadPedVenda.DBLookupComboBox24.ListSource:= vdtsourceTemp;
//  FrmCadPedVenda.DBLookupComboBox24.ListField:='CONTATOFINALIZACAO';
//  FrmCadPedVenda.DBLookupComboBox24.KeyField:='CONTATOFINALIZACAO';
//    FrmCadPedVenda.DBLookupComboBox24.DataField:='TIPOCONTATO';
//    FrmCadPedVenda.DBLookupComboBox24.DataSource:= DtmPedVenda.dsPedVenda;
end;

procedure TFrmAgendamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  vShiftClick := Key = VK_SHIFT;
end;

procedure TFrmAgendamentos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SHIFT then
    vShiftClick := False;
end;

procedure TFrmAgendamentos.FormShow(Sender: TObject);
begin
  inherited;
  pnCadastro.Visible := False;
  pnCadastro.Align := alClient;
  pnTipoContato.Align := alClient;
  tsCadastro.TabVisible := False;
  tsTipoContato.TabVisible := False;
  tsAgendamento.TabVisible := False;
  tsFinalizacaoContato.TabVisible := False;
  tsRedistribuirAgend.TabVisible := False;
  tsProm.TabVisible := False;

  PageControl1.ActivePage := tsAgendamento;

  agenda.vCol._abreColaborador(vDadosIni.vCodUsuario);

  if agenda.vCol.IsEmpty then
  begin
    Application.MessageBox('Colaborador não configurado para usar o Televendas', 'Atenção', 0 + 64);
    PostMessage(Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  agenda.vTpA_A._verificaTipoAgendamento;
  agenda._removerCarteiraDeClientesSemCompras;
  agenda._agendarAutomaticamenteAtendimentos;

  if Tag > 0 then
  begin
    agenda.vClA._selecionaCliente(Tag);
    agenda._abreAgendaCliente;
  end
  else
    agenda._abreAgendaDoDia;
  GroupBox1.Height := GroupBox1.Tag;
  DBLookupComboBox3.KeyValue := agenda.vCol.dataSet.FieldByName('cod_vendedor').AsInteger;
  vMouseMove := False;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmAgendamentos.GroupBox5Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox3.KeyValue := agenda.vCol.dataSet.FieldByName('cod_vendedor').AsInteger;
end;

procedure TFrmAgendamentos.Image1Click(Sender: TObject);
begin
  inherited;
  if not vMouseMove then
    if GroupBox1.Height = 56 then
    begin
      if vDadosIni.vEmp.vConcess = 'S' then
        GroupBox1.Height := 238
      else
        GroupBox1.Height := 174;
    end
    else
      GroupBox1.Height := 56;
end;

procedure TFrmAgendamentos.Image1MouseEnter(Sender: TObject);
begin
  inherited;
  vMouseMove := true;
  if vDadosIni.vEmp.vConcess = 'S' then
    GroupBox1.Height := 238
  else
    GroupBox1.Height := 174;
end;

procedure TFrmAgendamentos.Image1MouseLeave(Sender: TObject);
begin
  inherited;
  vMouseMove := true;
  GroupBox1.Height := 56;
end;

procedure TFrmAgendamentos.MaskEdit1Exit(Sender: TObject);
begin
  inherited;
  agenda.dataSet.Filtered := False;
  if MaskEdit1.Text <> '  /  /    ' then
    agenda.dataSet.Filter := 'COD_VENDEDOR = ' + IntToStr(agenda.vCol.dataSet.FieldByName('COD_VENDEDOR').AsInteger) +
      ' AND DATA_AGENDADA = ' + QuotedStr(MaskEdit1.Text)
  else
    agenda.dataSet.Filter := 'COD_VENDEDOR = ' + IntToStr(agenda.vCol.dataSet.FieldByName('COD_VENDEDOR').AsInteger);
  agenda.dataSet.Filtered := True;
end;

procedure TFrmAgendamentos.TiposdeContatoeFinalizao1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_TELEVENDAS', 'A', agenda.buscas) then
    Exit;
  agenda.vTpA_A._abreTipoAgendamento;
  _irParaTipoContato;
end;

procedure TFrmAgendamentos.pnCadastroEnter(Sender: TObject);
var
  vTemp: string;
  I: Integer;
begin
  inherited;
  vTemp := _LerConfiguracoesRegistroString('DBLookupComboBox5ListField');

  if Trim(vTemp) <> '' then
  begin
    DBLookupComboBox5.ListField := vTemp;
    for I := 0 to DBGrid2.Columns.Count - 1 do
    begin
      if (DBGrid2.Columns[I].FieldName = 'RAZAO') and (Copy(vtemp, 1, 1) = 'N') then
        DBGrid2.Columns[I].FieldName := 'NOME_CLIENTE'
      else if (DBGrid2.Columns[I].FieldName = 'NOME_CLIENTE') and (copy(vtemp, 1, 1) = 'R') then
        DBGrid2.Columns[I].FieldName := 'RAZAO';
    end;
  end;

  DBEdit6.Enabled := False;
  DBLookupComboBox6.Enabled := False;
end;

procedure TFrmAgendamentos.pnCadastroExit(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesString('DBLookupComboBox5ListField', DBLookupComboBox5.ListField);
end;

procedure TFrmAgendamentos.pnProximoAgendamentoEnter(Sender: TObject);
begin
  inherited;
  BitBtn15.Caption := 'Agendar novo contato para ' + FormatDateTime('dd/mm/yyyy', agenda.vDtAgendamento);
end;

procedure TFrmAgendamentos.pnRedistribuirAgendamentosEnter(Sender: TObject);
begin
  inherited;
  agenda.dataSet.BeforeScroll := nil;
  agenda.vDtSetTmp.EmptyDataSet;
  agenda.vCol._abreColaborador;
//  agenda.vCol.dataSet.AfterScroll := agenda._AfterScrollAgendaColab;
  DBLookupComboBox7.KeyValue := agenda.vCol.dataSet.FieldByName('cod_vendedor').AsInteger;
  MaskEdit1Exit(MaskEdit1);
  DBLookupComboBox8.KeyValue := agenda.vColR.dataSet.FieldByName('cod_vendedor').AsInteger;
end;

procedure TFrmAgendamentos.pnRedistribuirAgendamentosExit(Sender: TObject);
begin
  inherited;
  if not agenda._validaTrocaColaborador then
  begin
    agenda.vDtSetTmp.EmptyDataSet;
    agenda.dataSet.CancelUpdates;
  end;
  agenda.vCol.dataSet.AfterScroll := nil;
  agenda.dataSet.Filter := '';
  agenda.dataSet.Filtered := False;
  agenda.vDtSetTmp.EmptyDataSet;
  agenda.create;
  agenda._abreAgendaDoDia;
end;

procedure TFrmAgendamentos.PrevisodeServio1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM004', 'CONSULTA', '', 'AGENDAMENTO', '',
    agenda.buscas, True) then
    Exit;
end;

procedure TFrmAgendamentos.RedistribuirAgendamentos1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_TELEVENDAS', 'A', agenda.buscas) then
    Exit;
  if not vDadosIni.PesqPros('CRM025', 'ALTERAR', '', 'AGENDAMENTO', '',
    agenda.buscas, True) then
    Exit;
  _irParaRedistribuirAgendamentos;
end;

procedure TFrmAgendamentos.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  agenda._moverAgendamentoColaborador;
end;

procedure TFrmAgendamentos.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  agenda._moverAllAgendamentosColaborador;
end;

procedure TFrmAgendamentos.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  agenda._moverAllAgendamentoEntreColaboradores;
end;

procedure TFrmAgendamentos.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  MaskEdit1.Text := '  /  /    ';
  MaskEdit1Exit(MaskEdit1);
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
  	DBLookupComboBox7.SetFocus;
end;

procedure TFrmAgendamentos.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  agenda.vTpA_C._addTipoAgendamento;
end;

procedure TFrmAgendamentos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  agenda.vTpA_F._addTipoAgendamento;
end;

procedure TFrmAgendamentos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  agenda._abreAgendaProxima;
end;

procedure TFrmAgendamentos.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  agenda._abreAgendaAnterior;
end;

procedure TFrmAgendamentos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM017', 'INCLUIR', 'COD CLIENTE: ' + agenda.dataSet.FieldByName('COD_CLIENTE').AsString,
    'AGENDAMENTO', agenda.dataSet.FieldByName('cod_agendamento').AsString, agenda.Buscas, True) then
    Exit;
  agenda.vCol._abreColaborador;
  DBEdit6.Enabled := True;
  DBLookupComboBox6.Enabled := True;
end;

procedure TFrmAgendamentos.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox5.ListField = 'NOME_CLIENTE;RAZAO' then
  begin
    DBLookupComboBox5.ListField := 'RAZAO;NOME_CLIENTE';
    DBGrid2.Columns[1].FieldName := 'RAZAO';
  end
  else
  begin
    DBLookupComboBox5.ListField := 'NOME_CLIENTE;RAZAO';
    DBGrid2.Columns[1].FieldName := 'NOME_CLIENTE';
  end;
end;

procedure TFrmAgendamentos.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM017', 'INCLUIR', 'COD CLIENTE: ' + agenda.dataSet.FieldByName('COD_CLIENTE').AsString,
    'AGENDAMENTO', agenda.dataSet.FieldByName('cod_agendamento').AsString, agenda.Buscas, True) then
    Exit;

  agenda.vCol._abreColaborador;
end;

procedure TFrmAgendamentos.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  agenda.vTpA_C._addTipoAgendamento;
end;

procedure TFrmAgendamentos.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_TELEVENDAS', 'A', agenda.buscas) then
    Exit;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    DBLookupComboBox1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
    DBLookupComboBox2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit13.CanFocus) then
    DBEdit13.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
    DBEdit12.SetFocus;

  if agenda._reagendar then
    _irParaCadastro(True)
  else
    setFocusCampoErro(agenda.vNomeCampoErro);
//  begin
//    pnCadastro.Visible := True;
//    pnConsulta.Visible := False;
//    DBLookupComboBox4.Enabled := False;
//    DBEdit5.Enabled := False;
//    DBLookupComboBox5.Enabled := False;
//    GroupBox5.Enabled := False;
//    if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
//    	DBMemo1.SetFocus;
//  end;

end;

procedure TFrmAgendamentos._desabilitaMenus;
begin
  AgendadoDia1.Visible := False;
  AgendadoCliente1.Visible := False;
  AgendaOficina1.Visible := False;
  PrevisodeServio1.Visible := False;
  TiposdeContatoeFinalizao1.Visible := False;
  RedistribuirAgendamentos1.Visible := False;
end;

procedure TFrmAgendamentos._irParaCadastro(pReagendamento: Boolean);
begin
  pnCadastro.Visible := True;
  pnConsulta.Visible := False;
  ///
  _desabilitaMenus;
  PageControl1.ActivePage := tsCadastro;
  ///
  if pReagendamento then
  begin
    DBLookupComboBox4.Enabled := False;
    DBEdit5.Enabled := False;
    DBLookupComboBox5.Enabled := False;
    GroupBox5.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      DBEdit4.SetFocus;
  end
  else
  begin
    DBLookupComboBox4.Enabled := True;
    DBEdit5.Enabled := True;
    DBLookupComboBox5.Enabled := True;
    GroupBox5.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
      DBLookupComboBox4.SetFocus;
  end;
end;

procedure TFrmAgendamentos._irParaPromocoes;
begin
  EditHw1.AsValue := agenda.vPromProd.DIAS_BASE_CONSULTA;
  EditHw2.AsValue := agenda.vPromProd.QTDE_MAX_REGISTROS;
  RadioButton1.Checked := agenda.vPromProd.ORDEM_QTDE;

  _desabilitaMenus;
  PageControl1.ActivePage := tsProm;

  agenda.vPromProd.COD_CLIENTE := agenda.DataSet.FieldByName('COD_CLIENTE').asinteger;
  agenda.vPromProd._abrePromocoesParaCliente;
  if (Self.Enabled) and (Self.Visible) and (DBGrid5.CanFocus) then
  	DBGrid5.SetFocus;
end;

procedure TFrmAgendamentos._irParaRedistribuirAgendamentos;
begin
  _desabilitaMenus;
  PageControl1.ActivePage := tsRedistribuirAgend;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
  	DBLookupComboBox7.SetFocus;
end;

procedure TFrmAgendamentos._irParaTipoContato;
begin
  pnTipoContato.Visible := True;
  pnConsulta.Visible := False;
  ///
  _desabilitaMenus;
  PageControl1.ActivePage := tsTipoContato;
  ///
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

function TFrmAgendamentos._mdiAberto(pNomeFormMDI: string): Boolean;
var
  x: Byte;
begin
  Result := False;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := True;
        Application.MessageBox('Venda ja esta aberta, feche a janela da venda para utilizar esta funcionalidade', 'Atenção', 64);
        Exit;
      end;
end;

procedure TFrmAgendamentos._setCapsLock(pAtivo: Boolean);
begin
  if (pAtivo and ((GetKeyState(VK_CAPITAL) and 1) = 0)) or
     ((not pAtivo) and ((GetKeyState(VK_CAPITAL) and 1) = 1)) then
  begin
    keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;

procedure TFrmAgendamentos._voltaParaConsulta;
begin
  agenda.dataSet.Cancel;
  agenda.dataSet.CancelUpdates;
  pnConsulta.Visible := True;
  pnTipoContato.Visible := False;
  pnCadastro.Visible := False;
  ///
  AgendadoDia1.Visible := True;
  AgendadoCliente1.Visible := True;
  AgendaOficina1.Visible := True;
  PrevisodeServio1.Visible := True;
  TiposdeContatoeFinalizao1.Visible := True;
  RedistribuirAgendamentos1.Visible := True;
  PageControl1.ActivePage := tsAgendamento;
  ///
  if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
    DBGrid2.SetFocus;
end;

end.
