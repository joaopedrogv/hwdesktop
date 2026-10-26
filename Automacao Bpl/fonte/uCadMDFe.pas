unit uCadMDFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, DB, DBCtrls;

type
  TfrmCadMDFe = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    gbMDFe: TGroupBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    Label15: TLabel;
    gbPercurso: TGroupBox;
    Panel4: TPanel;
    gbCidadesDescarregamento: TGroupBox;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    gbCidadesCarregamento: TGroupBox;
    DBGrid3: TDBGrid;
    Panel6: TPanel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    gbCondutor: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    Label17: TLabel;
    DBEdit10: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    DBComboBox3: TDBComboBox;
    Label20: TLabel;
    DBEdit11: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label22: TLabel;
    DBEdit13: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Label23: TLabel;
    DBEdit14: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label24: TLabel;
    DBEdit15: TDBEdit;
    Label25: TLabel;
    DBEdit16: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit17: TDBEdit;
    Panel7: TPanel;
    DBGrid4: TDBGrid;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    BitBtn7: TBitBtn;
    Edit1: TEdit;
    BitBtn8: TBitBtn;
    Panel8: TPanel;
    Panel9: TPanel;
    SpeedButton19: TSpeedButton;
    DBGrid5: TDBGrid;
    tsImpressaoEmail: TTabSheet;
    pnImpressaoEmail: TPanel;
    btImpMDFe: TBitBtn;
    btImpMDFeEvento: TBitBtn;
    BitBtn81: TBitBtn;
    btEmailMDFe: TBitBtn;
    btEmailMDFeEvento: TBitBtn;
    CheckBox2: TCheckBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    BitBtn9: TBitBtn;
    tsSelecionaEstado: TTabSheet;
    pnSelecionaEstado: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    ListBox1: TListBox;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Panel12: TPanel;
    SpeedButton18: TSpeedButton;
    Label28: TLabel;
    GroupBox4: TGroupBox;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    GroupBox5: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    GroupBox6: TGroupBox;
    Panel13: TPanel;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    lbxUFPerc: TListBox;
    tsUnidTr_Carga: TTabSheet;
    pnDadosAdicionaisNFe: TPanel;
    Panel14: TPanel;
    SpeedButton22: TSpeedButton;
    Label29: TLabel;
    DBEdit18: TDBEdit;
    GroupBox7: TGroupBox;
    Panel15: TPanel;
    GroupBox8: TGroupBox;
    Panel16: TPanel;
    DBGrid6: TDBGrid;
    Panel17: TPanel;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    pnUnidTr_Carga: TPanel;
    pnUnidTransp: TPanel;
    Label30: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit19: TDBEdit;
    Label31: TLabel;
    ListBox2: TListBox;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    Label32: TLabel;
    DBEdit20: TDBEdit;
    Panel19: TPanel;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    Panel18: TPanel;
    DBGrid7: TDBGrid;
    Panel20: TPanel;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    pnUnidCarga: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    Label35: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit21: TDBEdit;
    ListBox3: TListBox;
    DBEdit22: TDBEdit;
    Panel22: TPanel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    DBLookupComboBox7: TDBLookupComboBox;
    Label36: TLabel;
    BitBtn16: TBitBtn;
    Panel21: TPanel;
    SpeedButton37: TSpeedButton;
    procedure SpeedButton37Click(Sender: TObject);
    procedure DBEdit19KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit18KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn15Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure ListBox3DblClick(Sender: TObject);
    procedure pnUnidCargaEnter(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure pnDadosAdicionaisNFeEnter(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure pnUnidTranspEnter(Sender: TObject);
    procedure ScrollBox4Enter(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure pnSelecionaEstadoEnter(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure CheckBox2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn81KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn81Click(Sender: TObject);
    procedure btEmailMDFeEventoClick(Sender: TObject);
    procedure btEmailMDFeClick(Sender: TObject);
    procedure btImpMDFeEventoClick(Sender: TObject);
    procedure btImpMDFeClick(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure gbCondutorExit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure DBEdit12Enter(Sender: TObject);
    procedure DBEdit11Enter(Sender: TObject);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit9Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    popMenuAddNF: TPopupMenu;
    FRecNo: Integer;
    procedure fieldsMemoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure atualizaLabelContingencia;
    procedure popMenuAddNFAddFilialClick(Sender: TObject);
    procedure popMenuAddNFProcurarFilialClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmCadMDFe: TfrmCadMDFe;

implementation

uses uDtmMDFe, uDtmAtivo, uClassesMDFe, uDadosIni, uDataSet_OOP, Math, strutils, empresa_model, hw_utils;

{$R *.dfm}

procedure TfrmCadMDFe.atualizaLabelContingencia;
begin
  if cadMDFe.contingenciaAtivada then
    Label28.Caption := 'Contingência Ativada'
  else
    Label28.Caption := 'Contingência Desativada';
end;

procedure TfrmCadMDFe.BitBtn10Click(Sender: TObject);
begin
  inherited;
  cadMDFe.IndiceEstado := ListBox1.ItemIndex;
  
  TForm(pnSelecionaEstado.Parent).ModalResult := IDOK;
end;

procedure TfrmCadMDFe.BitBtn11Click(Sender: TObject);
begin
  inherited;
  TForm(pnSelecionaEstado.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadMDFe.BitBtn12Click(Sender: TObject);
begin
  inherited;
  cadMDFe.vDescarga.vNFe.UnidTransporte.dataSet.Cancel;
end;

procedure TfrmCadMDFe.BitBtn13Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    with cadMDFe.vDescarga.vNFe.UnidTransporte do
      if not Post then
        setFocusCampoErro(vNomeCampoErro, vMensagemErro)
      else
        TForm(pnUnidTransp.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.BitBtn15Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    with cadMDFe.vDescarga.vNFe.UnidTransporte.UnidCarga do
      if not Post then
        setFocusCampoErro(vNomeCampoErro, vMensagemErro)
      else
        TForm(pnUnidCarga.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin

  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('MDFE002', 'PESQUISAR', '', 'MDFE', '', cadMDFe.buscas, true) then
      exit;

    inherited;

    cadMDFe.vCons.campo := ComboBox1.Text;
    cadMDFe.vCons.ordem := ComboBox2.Text;
    cadMDFe.vCons.condicao := ComboBox3.Text;
    cadMDFe.vCons.valor := MaskEdit3.Text;
    cadMDFe.vCons.dataIni := MaskEdit1.Text;
    cadMDFe.vCons.dataFim := MaskEdit2.Text;
    cadMDFe.vCons.porData := MaskEdit1.Visible;

    cadMDFe.vCons.avancada := CheckBox3.Checked;
    cadMDFe.vCons.adicional := CheckBox1.Checked;
    cadMDFe.vCons.situacaoAutAv := RadioGroup1.Items[RadioGroup1.ItemIndex];
    cadMDFe.vCons.situacaoEventoAv := RadioGroup2.Items[RadioGroup2.ItemIndex];

    cadMDFe.vCons.campoAd := ComboBox11.Text;
    cadMDFe.vCons.valorAd := MaskEdit7.Text;
    cadMDFe.vCons.dataIniAd := MaskEdit9.Text;
    cadMDFe.vCons.dataFimAd := MaskEdit8.Text;
    cadMDFe.vCons.condicaoAd := ComboBox12.Text;
    cadMDFe.vCons.porDataAd := MaskEdit9.Visible;

    cadMDFe.consulta;

//    if MaskEdit2.Visible then
//    begin
//      if not cadMDFe.ConsultaCampos('MDFE', ComboBox1.Text,
//        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
//			begin
//				if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
//        	combobox1.setfocus;
//			end
//    end
//    else if not cadMDFe.ConsultaCampos('MDFE', MaskEdit3.text, ComboBox1.Text,
//      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
//		begin
//			if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
//      	ComboBox1.SetFocus;
//		end

    if cadMDFe.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
        if TField(DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[i].FieldName)) is TMemoField then
        begin
          TField(DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[i].FieldName)).OnGetText := fieldsMemoGetText;
  //      if DBGrid1.Columns[i].FieldName = 'OCORRENCIABANCARIA' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        end;

    SpeedButton1.Visible := True;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
  	gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.BitBtn2Click(Sender: TObject);
begin
  
  cadMDFe.vDescarga.vNFe.CancelUpdates;
  cadMDFe.vDescarga.CancelUpdates;
  cadMDFe.vCarrega.CancelUpdates;
  cadMDFe.Cancel;
  cadMDFe.CancelUpdates;
  cadMDFe.RollBackTransacao;

  inherited;
end;

procedure TfrmCadMDFe.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if cadMDFe.dataSet.Active then
      cadMDFe.storeRecNo;
    if not cadMDFe.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    DBComboBox1.Enabled := cadMDFe.vCarrega.dataSet.IsEmpty;
    DBComboBox2.Enabled := cadMDFe.vDescarga.dataSet.IsEmpty;
    BitBtn7.Enabled := (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
    BitBtn4.Enabled := (cadMDFe.dataSet.FieldByName('cod_mdfe').AsInteger > 0) and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      DBComboBox2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      DBEdit9.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.BitBtn4Click(Sender: TObject);
begin

  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('MDFE025', 'SALVAR', 'COD: ' + cadMDFe.dataSet.FieldByName('COD_MDFE').AsString +
      ' NUM: ' + cadMDFe.dataSet.FieldByName('NMDF').AsString, 'MDFE', cadMDFe.dataSet.FieldByName('COD_MDFE').AsString, cadMDFe.buscas, true) then
      exit;

    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    if not cadMDFe.validarDadosEnvio then
    begin
      PageControl3.ActivePage := tsCadastro;
      setFocusCampoErro(cadMDFe.vNomeCampoErro);
    end
    else if not cadMDFe.confirmaMDFe then
    begin
      PageControl3.ActivePage := tsCadastro;
      setFocusCampoErro(cadMDFe.vNomeCampoErro);
    end
    else if (cadMDFe.montagemMDFePelaCargaEmAndamento) then
      BitBtn9.Click
    else
    begin
      cadMDFe.restoreRecNo;
      inherited;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.BitBtn5Click(Sender: TObject);
begin
  if (cadMDFe.dataSet.FieldByName('cod_mdfe').AsInteger > 0) and (cadMDFe.montagemMDFePelaCargaEmAndamento) then
  begin
    BitBtn9.Click;
    if cadMDFe.dataSet.State = dsInsert then
      Exit;
  end
  else
    cadMDFe.cancelarMontagemMDFePelaCarga;

  cadMDFe.vDescarga.vNFe.CancelUpdates;
  cadMDFe.vDescarga.CancelUpdates;
  cadMDFe.vCarrega.CancelUpdates;
  cadMDFe.Cancel;
  cadMDFe.CancelUpdates;
  cadMDFe.RollBackTransacao;
  cadMDFe.restoreRecNo;

  inherited;
end;

procedure TfrmCadMDFe.btImpMDFeClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.imprimeMDFe;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.btEmailMDFeClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.enviaEmailMDFe(CheckBox2.Checked);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.BitBtn7Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.post then
    begin
      PageControl3.ActivePage := tsCadastro;
      setFocusCampoErro(cadMDFe.vNomeCampoErro);
    end
    else
    begin
      BitBtn7.Enabled := (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
      BitBtn4.Enabled := (cadMDFe.dataSet.FieldByName('cod_mdfe').AsInteger > 0) and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.btImpMDFeEventoClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.imprimeEventoMDFe;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    cadMDFe.marcarTodos;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    cadMDFe.desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.CheckBox2Click(Sender: TObject);
begin
  inherited;
  if CheckBox2.Checked then
  begin
    btEmailMDFe.Enabled := True;
    btEmailMDFeEvento.Enabled := True;
  end
  else
  begin
    btEmailMDFe.Enabled := Trim(cadMDFe.dataSet.FieldByName('SITUACAO_MDFE').AsString) <> '';
    btEmailMDFeEvento.Enabled := Trim(cadMDFe.dataSet.FieldByName('SITUACAO_EVENTO').AsString) <> '';
  end;
end;

procedure TfrmCadMDFe.CheckBox3Click(Sender: TObject);
begin
  inherited;
  GroupBox4.Visible := CheckBox3.Checked;
  GroupBox5.Visible := CheckBox1.Checked;
end;

procedure TfrmCadMDFe.ComboBox11Exit(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if ComboBox11.Text = '' then
  begin
  	if ComboBox11.ItemIndex<0 then
      ComboBox11.ItemIndex := ComboBox11.Items.Count - 1;
  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
end;

procedure TfrmCadMDFe.BitBtn81Click(Sender: TObject);
begin
  inherited;
  TForm(pnImpressaoEmail.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadMDFe.BitBtn81KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn81.Click;
end;

procedure TfrmCadMDFe.btEmailMDFeEventoClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.enviaEmailEventoMDFe(CheckBox2.Checked);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.BitBtn8Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    cadMDFe.vCondutor.adicionarCondutor(
      cadMDFe.dataSet.FieldByName('XNOME_CONDUTOR').AsString,
      cadMDFe.dataSet.FieldByName('CPF_CONDUTOR').AsString,
      cadMDFe.dataSet.FieldByName('TERCEIRO_CONDUTOR').AsString);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.BitBtn9Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
//    SaveRecNo;

    cadMDFe.storeRecNo;
    if not cadMDFe.inserirPelaCarga then
    begin
      cadMDFe.restoreRecNo;
      exit;
    end;

//    inherited BitBtn3Click;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    DBComboBox1.Enabled := cadMDFe.vCarrega.dataSet.IsEmpty;
    DBComboBox2.Enabled := cadMDFe.vDescarga.dataSet.IsEmpty;
    BitBtn7.Enabled := (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
    BitBtn4.Enabled := (cadMDFe.dataSet.FieldByName('cod_mdfe').AsInteger > 0) and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      DBComboBox2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      DBEdit9.SetFocus;

  finally
//    CloseOpenAndSetRecNo;
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.DBEdit11Enter(Sender: TObject);
begin
  inherited;
  cadMDFe.vVeiculos.filtrar(False);
end;

procedure TfrmCadMDFe.DBEdit12Enter(Sender: TObject);
begin
  inherited;
  cadMDFe.vVeiculos.filtrar(True);
end;

procedure TfrmCadMDFe.DBEdit18KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9']) then
    if (Key <> #13) and (Key <> #8) then
      Key := #0;  
end;

procedure TfrmCadMDFe.DBEdit19KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not ((Key in ['0'..'9']) or (Key in ['a'..'z']) or (Key in ['A'..'Z'])) then
    if (Key <> #13) and (Key <> #8) then
      Key := #0;
end;

procedure TfrmCadMDFe.DBEdit9Enter(Sender: TObject);
begin
  inherited;
  DBEdit9.ReadOnly := cadMDFe.dataSet.FieldByName('TERCEIRO_CONDUTOR').AsString <> 'S';
  DBEdit10.ReadOnly := DBEdit9.ReadOnly;
end;

procedure TfrmCadMDFe.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  DBEdit9.ReadOnly := cadMDFe.dataSet.FieldByName('TERCEIRO_CONDUTOR').AsString <> 'S';
  DBEdit10.ReadOnly := DBEdit9.ReadOnly;
end;

procedure TfrmCadMDFe.DBEdit9KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    cadMDFe.alterarCondutor;
end;

procedure TfrmCadMDFe.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    cadMDFe.marcarMDFe;
end;

procedure TfrmCadMDFe.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = 'SEL' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing];
end;

procedure TfrmCadMDFe.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = 'SEL' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing];
end;

procedure TfrmCadMDFe.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not cadMDFe.dataSet.IsEmpty then
    SpeedButton1.Click;
end;

procedure TfrmCadMDFe.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if cadMDFe.dataSet.FieldByName('sel').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    DBGrid1.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadMDFe.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    DBGrid1DblClick(DBGrid1)
  else if Key = VK_SPACE  then
    cadMDFe.marcarMDFe;
end;

procedure TfrmCadMDFe.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    cadMDFe.marcarMDFe;
end;

procedure TfrmCadMDFe.fieldsMemoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := '...';
end;

procedure TfrmCadMDFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

	gravaConfiguracoesFormRegistro;

  cadMDFe.vDescarga.vNFe.CancelUpdates;
  cadMDFe.vDescarga.CancelUpdates;
  cadMDFe.vCarrega.CancelUpdates;
  cadMDFe.Cancel;
  cadMDFe.CancelUpdates;
  cadMDFe.RollBackTransacao;

  cadMDFe.Free;
  cadMDFe := nil;

  Action := caFree;
  frmCadMDFe := nil;
end;

procedure TfrmCadMDFe.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  cadMDFe := TMDFe.create;

  tsCadastro.TabVisible := False;
  tsImpressaoEmail.TabVisible := False;
  tsSelecionaEstado.TabVisible := False;
  tsUnidTr_Carga.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
  FRecNo := 0;
end;

procedure TfrmCadMDFe.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      if BitBtn3.Visible then
        BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (cadMDFe.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadMDFe.FormShow(Sender: TObject);
var
  I: Integer;
begin

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmMDFe.dsMDFe;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    inherited;
    imgInformation.Hint := imgInformation.Hint + #13 + #13 +
      'Processo "MDFE026" ADICIONAR NFE JA ADIOCIONADA A OUTRO MDFE'+ #13 +
      'Processo "MDFE027" PERMITIR NOVO MDFE PARA COMBINACAO CARGA E ESTADO'+ #13 +
      'Processo "MDFE028" PERMITIR NOVO MDFE DE CARGA ABERTA';
    if not cadMDFe.validarConfiguracoes then
    begin
      Application.MessageBox('Depois de corrigido a configuração entre novamente nesta tela', 'Atenção', 0 + 64);
      BitBtn1.Enabled := False;
      BitBtn3.Enabled := False;
      BitBtn9.Enabled := False;
      Panel2.Enabled := False;
    end;
  end;

  leConfiguracoesFormRegistro;

  lbxUFPerc.Items.LineBreak := ',';
  ComboBox11.Items := ComboBox1.Items;
  ComboBox11.Text := ComboBox1.Text;

  for I := 0 to ParamCount do
    if LowerCase(ParamStr(I)) = 'modomdfe' then
      TelaCadastro := 0;  

  if TelaCadastro = 1 then
    BitBtn3.Click
  else if TelaCadastro = 2 then
    BitBtn7.Click;

  BitBtn9.Visible := vDadosIni.vEmp.vOC_UsarOrdemCarregamento <> 'N';
//  BitBtn3.Visible := vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D';
//  SpeedButton1.Enabled := vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D';
//  SpeedButton6.Enabled := vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D';
//  SpeedButton7.Enabled := vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D';
//  SpeedButton8.Enabled := vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D';
  DBComboBox1.Items.Text := vDadosIni.getListaUF;
  DBComboBox2.Items.Text := DBComboBox1.Items.Text;
  lixeiraVazia(cadMDFe.lixeiraVazia);
  atualizaLabelContingencia;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadMDFe.gbCondutorExit(Sender: TObject);
begin
  inherited;
  DBEdit9.ReadOnly := cadMDFe.dataSet.FieldByName('TERCEIRO_CONDUTOR').AsString <> 'S';
  DBEdit10.ReadOnly := DBEdit9.ReadOnly;
end;

procedure TfrmCadMDFe.gravaConfiguracoesFormRegistro;
begin
	if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
  	_GravaConfiguracoesInteger(RadioGroup1.Name, RadioGroup1.ItemIndex);

    _GravaConfiguracoesInteger(RadioGroup2.Name, RadioGroup2.ItemIndex);
  end;

	if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
  end;
end;

procedure TfrmCadMDFe.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
  	RadioGroup1.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup1.Name);

    RadioGroup2.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup2.Name);
  end;

	if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
 	  CheckBox1Click(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox11.Name)) <> '' then
    	ComboBox11.Text   := _LerConfiguracoesRegistroString(ComboBox11.Name);
    for I := 0 to ComboBox11.Items.Count - 1 do
    begin
 			if trim(ComboBox11.Items[I]) = trim(ComboBox11.Text) then
      begin
      	ComboBox11.ItemIndex := I;
        Break;
      end;
    end;

    ComboBox11Exit(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox12.Name)) <> '' then
    	ComboBox12.Text       := _LerConfiguracoesRegistroString(ComboBox12.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text        := _LerConfiguracoesRegistroString(MaskEdit7.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text        := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text        := _LerConfiguracoesRegistroString(MaskEdit9.Name);
  end;
end;

procedure TfrmCadMDFe.ListBox1DblClick(Sender: TObject);
begin
  inherited;
  BitBtn10.Click;
end;

procedure TfrmCadMDFe.ListBox2DblClick(Sender: TObject);
var
  ALacre: string;
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte do
  begin
    if not (dataSet.State in [dsEdit, dsInsert]) then
      Exit;

    if ListBox2.ItemIndex < 0 then
      Exit;

    ALacre := ListBox2.Items[ListBox2.ItemIndex];
    if not InputQuery('Lacres', 'Alterar lacre (20 caracteres)', ALacre) then
      Exit;

    ALacre := UpperCase(Copy(ALacre, 1, 20));
    ListBox2.Items[ListBox2.ItemIndex] := ALacre;

    dataSet.FieldByName('LACUNIDTRANSP_LACRES').AsString := ListBox2.Items.Text;
  end;
end;

procedure TfrmCadMDFe.ListBox3DblClick(Sender: TObject);
var
  ALacre: string;
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte.UnidCarga do
  begin
    if not (dataSet.State in [dsEdit, dsInsert]) then
      Exit;

    if ListBox3.ItemIndex < 0 then
      Exit;

    ALacre := ListBox3.Items[ListBox3.ItemIndex];
    if not InputQuery('Lacres', 'Alterar lacre (20 caracteres)', ALacre) then
      Exit;

    ALacre := UpperCase(Copy(ALacre, 1, 20));
    ListBox3.Items[ListBox3.ItemIndex] := ALacre;

    dataSet.FieldByName('LACUNIDCARGA_LACRES').AsString := ListBox3.Items.Text;
  end;
end;

procedure TfrmCadMDFe.pnUnidCargaEnter(Sender: TObject);
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte.UnidCarga do
  begin
    DBLookupComboBox6.DataSource := _dataSourceOOP;
    DBLookupComboBox6.DataField  := 'TPUNIDCARGA';
    lkTipoUnCarga.setDadosDataSet(
      ['1', '2', '3', '4'],
      [ '1 - Container',
        '2 - ULD',
        '3 - Pallet',
        '4 - Outros;'], DBLookupComboBox6);

    DBEdit21.DataSource := _dataSourceOOP;
    DBEdit22.DataSource := _dataSourceOOP;

    DBEdit21.DataField := 'IDUNIDCARGA';
    DBEdit22.DataField := 'QTDRAT';

    ListBox3.Items.LineBreak := ',';
    ListBox3.Items.Text := dataSet.FieldByName('LACUNIDCARGA_LACRES').AsString;
  end;
end;

procedure TfrmCadMDFe.pnUnidTranspEnter(Sender: TObject);
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte do
  begin
    DBLookupComboBox5.DataSource := _dataSourceOOP;
    DBLookupComboBox5.DataField  := 'TPUNIDTRANSP';
    lkTipoUnTr.setDadosDataSet(
      ['1', '2', '3', '4', '5', '6', '7'],
      [ '1 - Rodoviário Tração',
        '2 - Rodoviário Reboque',
        '3 - Navio',
        '4 - Balsa',
        '5 - Aeronave',
        '6 - Vagão',
        '7 - Outros'], DBLookupComboBox5);

    DBEdit19.DataSource := _dataSourceOOP;
    DBEdit20.DataSource := _dataSourceOOP;

    DBEdit19.DataField := 'IDUNIDTRANSP';
    DBEdit20.DataField := 'QTDRAT';

    ListBox2.Items.LineBreak := ',';
    ListBox2.Items.Text := dataSet.FieldByName('LACUNIDTRANSP_LACRES').AsString;
  end;
end;

procedure TfrmCadMDFe.popMenuAddNFAddFilialClick(Sender: TObject);
var
  vNumNF: string;
  iEmpresa: Integer;
begin
  inherited;

  if (Sender is TMenuItem) and ((Sender as TMenuItem).Tag > 0) then
    iEmpresa := (Sender as TMenuItem).Tag
  else
    Exit;

  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    if not vDadosIni.PesqPros('MDFE022', 'INCLUIR', 'COD: ' + cadMDFe.dataSet.FieldByName('COD_MDFE').AsString +
      ' NUM: ' + cadMDFe.dataSet.FieldByName('NMDF').AsString, 'MDFE_DESCARGA_NFE',
      cadMDFe.dataSet.FieldByName('COD_MDFE').AsString) then
      Exit;

    if ActiveControl = DBComboBox2 then
      Perform(WM_NEXTDLGCTL,0,0);

    if not InputQuery('Número NF-e', 'Informe o número da NF-e', vNumNF) then
      Exit;

    try
      StrToInt(Trim(vNumNF));
    except
      raise Exception.Create('Número digitado inválido');
    end;

    cadMDFe.vDescarga.vNFe.adicionaNFE(StrToInt(Trim(vNumNF)), iEmpresa);
    BitBtn7.Enabled := (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
    BitBtn4.Enabled := (cadMDFe.dataSet.FieldByName('cod_mdfe').AsInteger > 0) and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.popMenuAddNFProcurarFilialClick(Sender: TObject);
var
  iEmpresa: Integer;
begin
  inherited;

  if (Sender is TMenuItem) and ((Sender as TMenuItem).Tag > 0) then
    iEmpresa := (Sender as TMenuItem).Tag
  else
    Exit;

  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    if not vDadosIni.PesqPros('MDFE023', 'INCLUIR', 'COD: ' + cadMDFe.dataSet.FieldByName('COD_MDFE').AsString,
      'MDFE_DESCARGA_NFE', cadMDFe.dataSet.FieldByName('COD_MDFE').AsString, cadMDFe.buscas, true) then
      exit;

    if ActiveControl = DBComboBox2 then
      Perform(WM_NEXTDLGCTL,0,0);

    cadMDFe.vDescarga.vNFe.adicionaNFE(0, iEmpresa);
    BitBtn7.Enabled := (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
    BitBtn4.Enabled := (cadMDFe.dataSet.FieldByName('cod_mdfe').AsInteger > 0) and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.pnDadosAdicionaisNFeEnter(Sender: TObject);
begin
  inherited;
  DBGrid6.DataSource := cadMDFe.vDescarga.vNFe.UnidTransporte._dataSourceOOP;
  DBGrid7.DataSource := cadMDFe.vDescarga.vNFe.UnidTransporte.UnidCarga._dataSourceOOP;
  cadMDFe.vDescarga.vNFe.lkSimNao.setDadosDataSet( ['0', '1'], [ 'Não', 'Sim'], DBLookupComboBox7);
end;

procedure TfrmCadMDFe.pnSelecionaEstadoEnter(Sender: TObject);
begin
  inherited;
  ListBox1.Items.Text := cadMDFe.getListaEstados;
  ListBox1.ItemIndex := cadMDFe.IndiceEstado
end;

procedure TfrmCadMDFe.ScrollBox4Enter(Sender: TObject);
begin
  inherited;
  lbxUFPerc.Items.Text := cadMDFe.dataSet.FieldByName('ufper').AsString;
end;

procedure TfrmCadMDFe.SpeedButton10Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    cadMDFe.vDescarga.removerCidade;
    cadMDFe.somaTotais;
    DBComboBox2.Enabled := cadMDFe.vDescarga.dataSet.IsEmpty;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.storeRecNo;
    btImpMDFe.Visible := False;
    btImpMDFeEvento.Visible := False;
    btEmailMDFe.Visible := True;
    btEmailMDFeEvento.Visible := True;
    btEmailMDFe.Enabled := Trim(cadMDFe.dataSet.FieldByName('SITUACAO_MDFE').AsString) <> '';
    btEmailMDFeEvento.Enabled := Trim(cadMDFe.dataSet.FieldByName('SITUACAO_EVENTO').AsString) <> '';
    CheckBox2.Visible := True;
    CheckBox2.Enabled := cadMDFe.dataSet.RecordCount > 1;
    cadMDFe.abreFormImpressaoEmail(tmEmail);
  finally
    cadMDFe.restoreRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    if ActiveControl = DBComboBox1 then
      Perform(WM_NEXTDLGCTL,0,0);

    cadMDFe.vCarrega.adicionarCidade(cadMDFe.getCodIBGEUF(cpOrigem));
    DBComboBox1.Enabled := cadMDFe.vCarrega.dataSet.IsEmpty;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton14Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    cadMDFe.vCarrega.removerCidade;
    DBComboBox1.Enabled := cadMDFe.vCarrega.dataSet.IsEmpty;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton15Click(Sender: TObject);
var
  vNumNF: string;
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    if not vDadosIni.PesqPros('MDFE022', 'INCLUIR', 'COD: ' + cadMDFe.dataSet.FieldByName('COD_MDFE').AsString +
      ' NUM: ' + cadMDFe.dataSet.FieldByName('NMDF').AsString, 'MDFE_DESCARGA_NFE',
      cadMDFe.dataSet.FieldByName('COD_MDFE').AsString) then
      Exit;

    if ActiveControl = DBComboBox2 then
      Perform(WM_NEXTDLGCTL,0,0);

    if not InputQuery('Número NF-e', 'Informe o número da NF-e ou a Chave', vNumNF) then
      Exit;

    if Length(OnlyNumber(vNumNF)) = 44 then
    begin
      cadMDFe.vDescarga.vNFe.adicionaNFE(OnlyNumber(vNumNF));
      BitBtn7.Enabled := (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
      BitBtn4.Enabled := (cadMDFe.dataSet.FieldByName('cod_mdfe').AsInteger > 0) and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
      Exit;
    end;

    try
      StrToInt(Trim(vNumNF));
    except
      raise Exception.Create('Número digitado inválido');
    end;

    cadMDFe.vDescarga.vNFe.adicionaNFE(StrToInt(Trim(vNumNF)), cadMDFe);
    BitBtn7.Enabled := (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
    BitBtn4.Enabled := (cadMDFe.dataSet.FieldByName('cod_mdfe').AsInteger > 0) and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton16Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    if not vDadosIni.PesqPros('MDFE023', 'INCLUIR', 'COD: ' + cadMDFe.dataSet.FieldByName('COD_MDFE').AsString,
      'MDFE_DESCARGA_NFE', cadMDFe.dataSet.FieldByName('COD_MDFE').AsString, cadMDFe.buscas, true) then
      exit;

    if ActiveControl = DBComboBox2 then
      Perform(WM_NEXTDLGCTL,0,0);

    cadMDFe.vDescarga.vNFe.adicionaNFE(0, cadMDFe);
    BitBtn7.Enabled := (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
    BitBtn4.Enabled := (cadMDFe.dataSet.FieldByName('cod_mdfe').AsInteger > 0) and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton17Click(Sender: TObject);
begin
  inherited;

  cadMDFe.vDescarga.vNFe.storeRecNo;
  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    cadMDFe.vDescarga.vNFe.removerNFe(cadMDFe);
  finally
    Screen.Cursor := crDefault;
    cadMDFe.vDescarga.vNFe.restoreRecNo;
  end;
end;

procedure TfrmCadMDFe.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.ativarDesativarContingencia;
    atualizaLabelContingencia;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton19Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    cadMDFe.vCondutor.removerCondutor;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.storeRecNo;
    if not cadMDFe.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    DBComboBox1.Enabled := cadMDFe.vCarrega.dataSet.IsEmpty;
    DBComboBox2.Enabled := cadMDFe.vDescarga.dataSet.IsEmpty;
    BitBtn7.Enabled := (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');
    BitBtn4.Enabled := (cadMDFe.dataSet.FieldByName('cod_mdfe').AsInteger > 0) and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Autorizada') and (Trim(cadMDFe.dataSet.FieldByName('situacao_mdfe').AsString) <> 'Em Processamento');

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      DBComboBox2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      DBEdit9.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton20Click(Sender: TObject);
var
  AIndex: Integer;
begin
  inherited;
  if not (cadMDFe.dataSet.State in [dsEdit, dsInsert]) then
    Exit;

  AIndex := lbxUFPerc.ItemIndex;
  if AIndex < 0 then
    Exit;
  lbxUFPerc.Items.Delete(AIndex);
  cadMDFe.dataSet.FieldByName('ufper').AsString := lbxUFPerc.Items.Text;

  if lbxUFPerc.Count = 0 then
    Exit;

  lbxUFPerc.ItemIndex := IfThen(
                                 AIndex > (lbxUFPerc.Count - 1),
                                 lbxUFPerc.Count - 1,
                                 AIndex);
end;

procedure TfrmCadMDFe.SpeedButton21Click(Sender: TObject);
var
  AUF: string;
begin
  inherited;
  if not (cadMDFe.dataSet.State in [dsEdit, dsInsert]) then
    Exit;

  ListBox1.Items.Text := vDadosIni.getListaUF;

  try
    pnSelecionaEstado.OnEnter := nil;
    if not vDadosIni.abreForm('Selecione o estado', pnSelecionaEstado, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]) then
      Exit;
  finally
    pnSelecionaEstado.OnEnter := pnSelecionaEstadoEnter;
  end;

  if ListBox1.ItemIndex < 0 then
    Exit;

  AUF := ListBox1.Items[ListBox1.ItemIndex];

  if lbxUFPerc.Items.IndexOf(AUF) >= 0 then
    Exit;

  if lbxUFPerc.Items.IndexOf(cadMDFe.dataSet.FieldByName('UFINI').AsString) >= 0 then
    Exit;

  if lbxUFPerc.Items.IndexOf(cadMDFe.dataSet.FieldByName('UFFIM').AsString) >= 0 then
    Exit;

  lbxUFPerc.Items.Add(AUF);
  cadMDFe.dataSet.FieldByName('ufper').AsString := lbxUFPerc.Items.Text;
end;

procedure TfrmCadMDFe.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  if not cadMDFe.mdfeAberto then
  begin
    vDadosIni.ShowAtencao('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento');
    Exit;
  end;

  with cadMDFe.vDescarga.vNFe do
  begin
    if dataSet.IsEmpty then
    begin
      vDadosIni.ShowAtencao('Nenhuma NF-e selecionada');
      Exit;
    end;

    UnidTransporte.Filter;
    UnidTransporte.UnidCarga.Filter;

    storeRecNo;
    dataSet.Edit;
    try
      if not vDadosIni.abreForm('Mais dados do MDF-e', pnDadosAdicionaisNFe, opFormsDefCad + [ofEscapeExit]) then
        Exit;
    finally
      SalvarAlteracoes;
      restoreRecNo;
    end;
  end;
end;

procedure TfrmCadMDFe.SpeedButton25Click(Sender: TObject);
begin
  if not cadMDFe.verLixeira then
  begin
    inherited;
//    SpeedButton2.Hint := 'Enviar para Lixeira -  [OCR005]';
    SpeedButton1.Visible := True;
  end
  else
  begin
//    SpeedButton2.Hint := 'Excluir registro permanentemente -  [OCR006]';
    SpeedButton1.Visible := False;
  end;
end;

procedure TfrmCadMDFe.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.storeRecNo;
    atualizaLabelContingencia;
    cadMDFe.enviarLoteMDFe;
  finally
    cadMDFe.restoreRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton27Click(Sender: TObject);
var
  AEmptyBefore: Boolean;
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte do
  begin
    AEmptyBefore := dataSet.IsEmpty;
    if not Insert then
      Exit;

    try
      if not vDadosIni.abreForm('Unidades de Transporte', pnUnidTransp, opFormsDefCad) then
        Exit;
    finally
      Cancel;
      if AEmptyBefore then
        UnidCarga.Filter;
    end;
  end;
end;

procedure TfrmCadMDFe.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte do
  begin
    if not Edit then
      Exit;

    try
      if not vDadosIni.abreForm('Unidades de Transporte', pnUnidTransp, opFormsDefCad) then
        Exit;
    finally
      Cancel;
    end;
  end;
end;

procedure TfrmCadMDFe.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  cadMDFe.vDescarga.vNFe.UnidTransporte.Delete;
end;

procedure TfrmCadMDFe.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.storeRecNo;
    cadMDFe.Delete;
    lixeiraVazia(cadMDFe.lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton30Click(Sender: TObject);
var
  AIndex: Integer;
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte do
  begin
    if not (dataSet.State in [dsEdit, dsInsert]) then
      Exit;

    AIndex := ListBox2.ItemIndex;
    if AIndex < 0 then
      Exit;
    ListBox2.Items.Delete(AIndex);
    dataSet.FieldByName('lacunidtransp_lacres').AsString := ListBox2.Items.Text;

    if ListBox2.Count = 0 then
      Exit;

    ListBox2.ItemIndex := IfThen(
                                 AIndex > (ListBox2.Count - 1),
                                 ListBox2.Count - 1,
                                 AIndex);
  end;
end;

procedure TfrmCadMDFe.SpeedButton31Click(Sender: TObject);
var
  ALacre: string;
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte do
  begin
    if not (dataSet.State in [dsEdit, dsInsert]) then
      Exit;

    if ListBox2.ItemIndex > -1 then
      ALacre := ListBox2.Items[ListBox2.ItemIndex]
    else
      ALacre := '';

    if not InputQuery('Lacres', 'Novo lacre (20 caracteres)', ALacre) then
      Exit;

    ALacre := UpperCase(Copy(ALacre, 1, 20));
    ListBox2.Items.Add(ALacre);

    dataSet.FieldByName('LACUNIDTRANSP_LACRES').AsString := ListBox2.Items.Text;
  end;
end;

procedure TfrmCadMDFe.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte.UnidCarga do
  begin
    if not Insert then
      Exit;

    try
      if not vDadosIni.abreForm('Unidades de Carga', pnUnidCarga, opFormsDefCad) then
        Exit;
    finally
      Cancel;
    end;
  end;
end;

procedure TfrmCadMDFe.SpeedButton33Click(Sender: TObject);
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte.UnidCarga do
  begin
    if not Edit then
      Exit;

    try
      if not vDadosIni.abreForm('Unidades de Carga', pnUnidCarga, opFormsDefCad) then
        Exit;
    finally
      Cancel;
    end;
  end;
end;

procedure TfrmCadMDFe.SpeedButton34Click(Sender: TObject);
begin
  inherited;
  cadMDFe.vDescarga.vNFe.UnidTransporte.UnidCarga.Delete;
end;

procedure TfrmCadMDFe.SpeedButton35Click(Sender: TObject);
var
  AIndex: Integer;
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte.UnidCarga do
  begin
    if not (dataSet.State in [dsEdit, dsInsert]) then
      Exit;

    AIndex := ListBox3.ItemIndex;
    if AIndex < 0 then
      Exit;
    ListBox3.Items.Delete(AIndex);
    dataSet.FieldByName('LACUNIDCARGA_LACRES').AsString := ListBox3.Items.Text;

    if ListBox3.Count = 0 then
      Exit;

    ListBox3.ItemIndex := IfThen(
                                 AIndex > (ListBox3.Count - 1),
                                 ListBox3.Count - 1,
                                 AIndex);
  end;
end;

procedure TfrmCadMDFe.SpeedButton36Click(Sender: TObject);
var
  ALacre: string;
begin
  inherited;
  with cadMDFe.vDescarga.vNFe.UnidTransporte.UnidCarga do
  begin
    if not (dataSet.State in [dsEdit, dsInsert]) then
      Exit;

    if ListBox3.ItemIndex > -1 then
      ALacre := ListBox3.Items[ListBox3.ItemIndex]
    else
      ALacre := '';

    if not InputQuery('Lacres', 'Novo lacre (20 caracteres)', ALacre) then
      Exit;

    ALacre := UpperCase(Copy(ALacre, 1, 20));
    ListBox3.Items.Add(ALacre);

    dataSet.FieldByName('LACUNIDCARGA_LACRES').AsString := ListBox3.Items.Text;
  end;
end;

procedure TfrmCadMDFe.SpeedButton37Click(Sender: TObject);
var
  mnItem, mnSubMn: TMenuItem;
  empresas: TEmpresaList;
  I: Integer;
begin
  inherited;
  if Assigned(popMenuAddNF) then
    FreeAndNil(popMenuAddNF);

  popMenuAddNF := TPopupMenu.Create(Self);

  mnItem := popMenuAddNF.CreateMenuItem;
  mnItem.Caption := 'Adicionar NF filial';
  popMenuAddNF.Items.Add(mnItem);

  cadMDFe.queryCons.Table('empresa', 'cod_empresa, cgc_emp, identificacao_emp')
    .OrderBy('cod_empresa')
    .Open;

  empresas := TEmpresaList.Create(False);
  try
    empresas.CopyFrom(TEmpresaModel, cadMDFe.queryCons.query, False);

    for I := 0 to empresas.Count - 1 do
    begin
      mnSubMn := TMenuItem.Create(mnItem);
      mnSubMn.Caption := Format('%d - %s - %s', [empresas.Items[I].cod_empresa, empresas.Items[I].cgc_emp, empresas.Items[I].identificacao_emp]);
      mnSubMn.OnClick := popMenuAddNFAddFilialClick;
      mnSubMn.Tag := empresas.Items[I].cod_empresa;
      mnItem.Add(mnSubMn);
    end;

    mnItem := popMenuAddNF.CreateMenuItem;
    mnItem.Caption := 'Procurar NF filial';
    popMenuAddNF.Items.Add(mnItem);
    
    for I := 0 to empresas.Count - 1 do
    begin
      mnSubMn := TMenuItem.Create(mnItem);
      mnSubMn.Caption := Format('%d - %s - %s', [empresas.Items[I].cod_empresa, empresas.Items[I].cgc_emp, empresas.Items[I].identificacao_emp]);
      mnSubMn.OnClick := popMenuAddNFProcurarFilialClick;
      mnSubMn.Tag := empresas.Items[I].cod_empresa;
      mnItem.Add(mnSubMn);
    end;

  finally
    FreeAndNil(empresas);
  end;

  popMenuAddNF.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadMDFe.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.storeRecNo;
    btImpMDFe.Visible := True;
    btImpMDFeEvento.Visible := True;
    btImpMDFe.Enabled := (Trim(cadMDFe.dataSet.FieldByName('SITUACAO_MDFE').AsString) <> '') or (cadMDFe.dataSet.FieldByName('NMDF').AsInteger > 0) and (cadMDFe.contingenciaAtivada);
    btImpMDFeEvento.Enabled := Trim(cadMDFe.dataSet.FieldByName('SITUACAO_EVENTO').AsString) <> '';
    btEmailMDFe.Visible := False;
    btEmailMDFeEvento.Visible := False;
    CheckBox2.Visible := False;
    cadMDFe.abreFormImpressaoEmail(tmImpressao);
  finally
    cadMDFe.restoreRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.storeRecNo;
    atualizaLabelContingencia;
    cadMDFe.consultarLoteMDFe;
  finally
    cadMDFe.restoreRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadMDFe.storeRecNo;
    atualizaLabelContingencia;
    cadMDFe.cancelarMDFe;
  finally
    cadMDFe.restoreRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
//    SaveRecNo;
    cadMDFe.storeRecNo;
    atualizaLabelContingencia;
    cadMDFe.encerrarMDFe;
  finally
    cadMDFe.restoreRecNo;
    //CloseOpenAndSetRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMDFe.SpeedButton9Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    if not cadMDFe.mdfeAberto then
    begin
      Application.MessageBox('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', 'Atenção', 0 + 64);
      Exit;
    end;

    if ActiveControl = DBComboBox2 then
      Perform(WM_NEXTDLGCTL,0,0);

    cadMDFe.vDescarga.adicionarCidade(cadMDFe.getCodIBGEUF(cpDestino));
    DBComboBox2.Enabled := cadMDFe.vDescarga.dataSet.IsEmpty;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
