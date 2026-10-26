unit UCadCabecalhonf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DB, DBCtrls, RDprint, ComObj,
  QuickRpt, grimgctrl, QRCtrls, uClassesConfigNf, uEditHw, AppEvnts, uCadPadrao;

type
  TfrmCadCabecalhonf = class(TfrmCadPadraoM)
    DataSource1: TDataSource;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBComboBox3: TDBComboBox;
    OpenDialog1: TOpenDialog;
    BitBtn7: TBitBtn;
    DBComboBox4: TDBComboBox;
    tsItensConfigNf: TTabSheet;
    pnItensConfigNf: TPanel;
    GroupBox8: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox9: TGroupBox;
    edCodItemCOnfig: TEditHw;
    edDescricaoItemConfig: TEdit;
    Panel51: TPanel;
    btNovoItemConfig: TBitBtn;
    btAlterarItemConfig: TBitBtn;
    btRemoverItemConfi: TBitBtn;
    btSalvarItemConfig: TBitBtn;
    btCancelarItemConfig: TBitBtn;
    tsConfigNf: TTabSheet;
    pnConfigNf: TPanel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    DBGrid4: TDBGrid;
    GroupBox7: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label6: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    tsRelatorio: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    GroupBox10: TGroupBox;
    DBGrid5: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit13: TDBEdit;
    btNovoCondifNf: TBitBtn;
    btAlterarConfigNg: TBitBtn;
    btRemoverConfigNf: TBitBtn;
    btSalvarConfigNf: TBitBtn;
    btCancelarConfigNf: TBitBtn;
    Panel6: TPanel;
    DBGrid3: TDBGrid;
    tsEntrelinhamento: TTabSheet;
    pnEntrelinhamento: TPanel;
    Panel8: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    cbEntrelinhamento: TComboBox;
    cbCondensado: TComboBox;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    tsCamposNf: TTabSheet;
    pnCamposNf: TPanel;
    Panel11: TPanel;
    GroupBox11: TGroupBox;
    ListBox1: TListBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    ListBox2: TListBox;
    BitBtn11: TBitBtn;
    ListBox3: TListBox;
    ComboBox4: TComboBox;
    BitBtn14: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    PopupMenu3: TPopupMenu;
    Imprimircampo1: TMenuItem;
    RemoverImpressodoCampo1: TMenuItem;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit1: TDBEdit;
    Panel7: TPanel;
    Label122: TLabel;
    BitBtn15: TBitBtn;
    OrdenarporDescrio1: TMenuItem;
    OrdenarporCdigo1: TMenuItem;
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OrdenarporCdigo1Click(Sender: TObject);
    procedure OrdenarporDescrio1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RemoverImpressodoCampo1Click(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure Imprimircampo1Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure btNovoCondifNfClick(Sender: TObject);
    procedure btAlterarConfigNgClick(Sender: TObject);
    procedure btRemoverConfigNfClick(Sender: TObject);
    procedure btSalvarConfigNfClick(Sender: TObject);
    procedure btCancelarConfigNfClick(Sender: TObject);
    procedure btRemoverItemConfiClick(Sender: TObject);
    procedure btCancelarItemConfigClick(Sender: TObject);
    procedure btSalvarItemConfigClick(Sender: TObject);
    procedure btAlterarItemConfigClick(Sender: TObject);
    procedure btNovoItemConfigClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    hdItensConfignf, hdConfignf: THandle;

  public
    { Public declarations }
  end;

var
  frmCadCabecalhonf: TfrmCadCabecalhonf;
  obCabecalhonf: TCabecalhonf;
  cadConfigNf: TConfignf;

implementation

uses uDadosIni, uDtmAtivo, uDataSet_OOP, Funcoes, UDtmConfigNf;

{$R *.dfm}

procedure TfrmCadCabecalhonf.BitBtn10Click(Sender: TObject);
begin
  inherited;
  TForm(pnItensConfigNf.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadCabecalhonf.BitBtn11Click(Sender: TObject);
begin
  inherited;
  cadConfigNf.vCampos.adicionaCampoNotaFiscal(ListBox2.Items[ListBox2.ItemIndex],cadConfigNf.vItem.dataSet.FieldByName('codigo').AsInteger);
  TForm(pnCamposNf.Parent).ModalResult := mrOk;
end;

procedure TfrmCadCabecalhonf.BitBtn12Click(Sender: TObject);
begin
  inherited;
  cadConfigNf.vCampos.adicionaOutrosCampo(ComboBox4.Text, ListBox3.Items[ListBox3.ItemIndex],
  cadConfigNf.vItem.dataSet.FieldByName('codigo').AsInteger);
  TForm(pnCamposNf.Parent).ModalResult := mrOk;
end;

procedure TfrmCadCabecalhonf.BitBtn13Click(Sender: TObject);
begin
  inherited;
  cadConfigNf.vCampos.adicionaParametro(ListBox1.ItemIndex,cadConfigNf.vItem.dataSet.FieldByName('codigo').AsInteger);
  TForm(pnCamposNf.Parent).ModalResult := mrOk;
end;

procedure TfrmCadCabecalhonf.BitBtn14Click(Sender: TObject);
begin
  inherited;
    TForm(pnCamposNf.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadCabecalhonf.BitBtn15Click(Sender: TObject);
begin
  inherited;
 TForm(pnConfigNf.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadCabecalhonf.BitBtn1Click(Sender: TObject);
begin
  inherited;
  SpeedButton2.Hint := 'Enviar para Lixeira -  [CFG016]';

  if not vDadosIni.PesqPros('CFG012', 'PESQUISAR', '','CABECALHO_NF','', obCabecalhonf.buscas, true) then
    exit;
  if MaskEdit2.Visible then
  begin
    if not obCabecalhonf.ConsultaCampos('Cabecalho_nf', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if obCabecalhonf.ConsultaCampos('Cabecalho_nf', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadCabecalhonf.BitBtn2Click(Sender: TObject);
begin
  inherited;
  obCabecalhonf.Cancel;
  obCabecalhonf.abreCabecalhonf;
end;

procedure TfrmCadCabecalhonf.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CFG013', 'INCLUIR', '','CABECALHO_NF','', obCabecalhonf.buscas, true) then
   exit;
  if not obCabecalhonf.Insert then
    exit;
  ActiveControl := BitBtn3;
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;
  TabSheet3.Caption := 'Cadastro de Notas Fiscais';
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TfrmCadCabecalhonf.btNovoCondifNfClick(Sender: TObject);
begin
  inherited;
  if cadConfigNf.Insert then
  begin
    GroupBox5.Enabled := False;
    GroupBox6.Enabled := False;
    GroupBox10.Enabled := False;
    Panel5.Enabled := False;
    Panel4.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
    	DBEdit9.SetFocus;
  end;
end;

procedure TfrmCadCabecalhonf.btNovoItemConfigClick(Sender: TObject);
begin
  inherited;
  GroupBox9.Enabled := true;
  edCodItemCOnfig.Enabled := true;
  edCodItemCOnfig.AsValue := 0;
  edDescricaoItemConfig.Text := '';
  if (Self.Enabled) and (Self.Visible) and (edCodItemCOnfig.CanFocus) then
  	edCodItemCOnfig.SetFocus;
  Panel51.Enabled := False;
end;

procedure TfrmCadCabecalhonf.btRemoverConfigNfClick(Sender: TObject);
begin
  inherited;
  cadConfigNf.Delete;
end;

procedure TfrmCadCabecalhonf.btRemoverItemConfiClick(Sender: TObject);
begin
  inherited;
  cadConfigNf.vItem.removerItem;
end;

procedure TfrmCadCabecalhonf.btSalvarConfigNfClick(Sender: TObject);
begin
  inherited;
  if cadConfigNf.Post then
  begin
    GroupBox5.Enabled := True;
    GroupBox6.Enabled := True;
    GroupBox10.Enabled := True;
    Panel5.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then
    	DBGrid4.SetFocus;
    Panel4.Enabled := False;
  end;
end;

procedure TfrmCadCabecalhonf.btSalvarItemConfigClick(Sender: TObject);
var
  vOK: Boolean;
begin
  inherited;
  if GroupBox8.Enabled then
    vOK := cadConfigNf.vItem.novoItem(edCodItemCOnfig.AsInteger, edDescricaoItemConfig.Text)
  else
    vOK := cadConfigNf.vItem.alteraItem(edCodItemCOnfig.AsInteger,
      edDescricaoItemConfig.Text);
  if vOK then
  begin
    GroupBox8.Enabled := True;
    Panel51.Enabled := True;
    edCodItemCOnfig.AsValue := 0;
    edDescricaoItemConfig.Clear;
    if(Self.Enabled) and (Self.Visible) and (btNovoItemConfig.CanFocus) then
    	btNovoItemConfig.SetFocus;
    GroupBox9.Enabled := False;
  end;
end;

procedure TfrmCadCabecalhonf.ComboBox4Exit(Sender: TObject);
var
  vLista: TStringList;
begin
  inherited;
  vLista := TStringList.Create;
  vLista.Text := cadConfigNf.vCampos.getCamposOutraTabela(ComboBox4.Text);
  ListBox3.Items.Text := vLista.Text;
//  ListBox3.Items.Text := cadConfigNf.vCampos.getCamposOutraTabela(ComboBox4.Text);
end;

procedure TfrmCadCabecalhonf.btAlterarConfigNgClick(Sender: TObject);
begin
  inherited;
  if cadConfigNf.Edit then
  begin
    GroupBox5.Enabled := False;
    GroupBox6.Enabled := False;
    GroupBox10.Enabled := False;
    Panel5.Enabled := False;
    Panel4.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
    	DBEdit9.SetFocus;
  end;
end;

procedure TfrmCadCabecalhonf.btAlterarItemConfigClick(Sender: TObject);
begin
  inherited;
  GroupBox9.Enabled := true;
  GroupBox8.Enabled := False;
  edCodItemCOnfig.Enabled := False;
  edCodItemCOnfig.AsValue := cadConfigNf.vItem.dataSet.FieldByName('codigo').AsInteger;
  edDescricaoItemConfig.Text := cadConfigNf.vItem.dataSet.FieldByName('descricao').AsString;
  if (Self.Enabled) and (Self.Visible) and (edDescricaoItemConfig.CanFocus) then
  	edDescricaoItemConfig.SetFocus;
  Panel51.Enabled := False;
end;

procedure TfrmCadCabecalhonf.btCancelarConfigNfClick(Sender: TObject);
begin
  inherited;
  cadConfigNf.Cancel;
  GroupBox5.Enabled := True;
  GroupBox6.Enabled := True;
  GroupBox10.Enabled := True;
  Panel5.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then
  	DBGrid4.SetFocus;
  Panel4.Enabled := False;
end;

procedure TfrmCadCabecalhonf.btCancelarItemConfigClick(Sender: TObject);
begin
  inherited;
  GroupBox8.Enabled := True;
  Panel51.Enabled := True;
  edCodItemCOnfig.AsValue := 0;
  edDescricaoItemConfig.Clear;
  if (Self.Enabled) and (Self.Visible) and (btNovoItemConfig.CanFocus) then
  	btNovoItemConfig.SetFocus;
  GroupBox9.Enabled := False;
end;

procedure TfrmCadCabecalhonf.BitBtn4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CFG014', 'CONFIRMAR', '','CABECALHO_NF','', obCabecalhonf.buscas, true) then
   exit;

  if not obCabecalhonf.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obCabecalhonf.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else begin
      inherited;
      obCabecalhonf.abreCabecalhonf;
    end;
  end;

end;

procedure TfrmCadCabecalhonf.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obCabecalhonf.Cancel;
  obCabecalhonf.abreCabecalhonf;
end;

procedure TfrmCadCabecalhonf.BitBtn7Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.Execute;
  obCabecalhonf.dataSet.FieldByName('PORTA_IMPRESSAO').asString :=
    ExtractFilePath(OpenDialog1.FileName);
end;

procedure TfrmCadCabecalhonf.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnEntrelinhamento.Parent).ModalResult := mrOk;
end;

procedure TfrmCadCabecalhonf.BitBtn9Click(Sender: TObject);
begin
  inherited;
  DBGrid2.ReadOnly := False;
  DBGrid2.DataSource.AutoEdit := true;
  if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
    DBGrid2.SetFocus;
end;

procedure TfrmCadCabecalhonf.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    SpeedButton1Click(sender);

  if (key = VK_DELETE) and not (obCabecalhonf.dataSet.State in [dsEdit, dsInsert]) then
    SpeedButton2Click(sender);

  if key = VK_INSERT then
    BitBtn3Click(sender);
end;

procedure TfrmCadCabecalhonf.DBGrid2Exit(Sender: TObject);
begin
  inherited;
  if not DBGrid2.ReadOnly  then
  begin
    cadConfigNf.vItem.salvaPosicao;
    DBGrid2.ReadOnly := true;
    DBGrid2.DataSource.AutoEdit := False;
  end;
end;

procedure TfrmCadCabecalhonf.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (cadConfigNf.vItem.dataSet.FieldByName('imp').AsInteger > 0) then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $00FFD9B3; // define uma cor de fundo //$00FFD9B3
    TDBGrid(Sender).Canvas.FillRect(Rect); // pinta a célula
    TDBGrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  end;
end;

procedure TfrmCadCabecalhonf.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    cadConfigNf.alteraOrdem;
end;

procedure TfrmCadCabecalhonf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadCabecalhonf := nil;
end;

procedure TfrmCadCabecalhonf.FormCreate(Sender: TObject);
begin
  inherited;
  obCabecalhonf := TCabecalhonf.create;
end;

procedure TfrmCadCabecalhonf.FormShow(Sender: TObject);
var
  I: Integer;
begin
  DBGrid1.DataSource := DtmConfigNf.dsCabecalhonf;
  obCabecalhonf.abreCabecalhonf;
  tsItensConfigNf.TabVisible := False;
  tsConfigNf.TabVisible := False;
  tsRelatorio.TabVisible := False;
  tsEntrelinhamento.TabVisible := False;
  tsCamposNf.TabVisible := False;
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
      TDBEdit(Components[I]).CharCase := ecUpperCase;
    if Components[I] is TDBComboBox then
      TDBComboBox(Components[I]).CharCase := ecUpperCase;
  end;

  DBComboBox3.CharCase := ecNormal;
  DBComboBox4.CharCase := ecNormal;

  if obCabecalhonf.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TfrmCadCabecalhonf.Imprimircampo1Click(Sender: TObject);
var
  vLista: TStringList;
begin
  inherited;
  vLista := TStringList.Create;
  vLista.Text := cadConfigNf.vCampos.getCamposNotaFiscal;
  vLista.Sorted := True;
  ListBox2.Items.Text := vLista.Text;

//  ListBox2.Items.Text := cadConfigNf.vCampos.getCamposNotaFiscal;
//  ListBox2.Items.Sorted:= True;

  cadConfigNf.abreFormCamposNf;
end;

procedure TfrmCadCabecalhonf.OrdenarporCdigo1Click(Sender: TObject);
begin
  inherited;
  cadConfigNf.vItem.IndexFieldNames := 'CODIGO';
end;

procedure TfrmCadCabecalhonf.OrdenarporDescrio1Click(Sender: TObject);
begin
  inherited;
  cadConfigNf.vItem.IndexFieldNames := 'DESCRICAO';
end;

procedure TfrmCadCabecalhonf.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Notas Fiscais');
end;

procedure TfrmCadCabecalhonf.RemoverImpressodoCampo1Click(Sender: TObject);
begin
  inherited;
  cadConfigNf.vCampos.removerTodasConfiguracoesDoCampo(cadConfigNf.vItem.dataSet.FieldByName('codigo').AsInteger);
end;

procedure TfrmCadCabecalhonf.SpeedButton1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CFG015', 'ALTERAR', '','CABECALHO_NF',
  obcabecalhonf.dataSet.FieldByName('CODIGO').AsString+' '+
  obcabecalhonf.dataSet.FieldByName('NOME_NF').AsString, obCabecalhonf.buscas, true) then
   exit;
  if obCabecalhonf.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;
  inherited;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  if obCabecalhonf.Edit then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
end;

procedure TfrmCadCabecalhonf.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG018', 'ACESSAR', '','CABECALHO_NF','', obCabecalhonf.buscas, true) then
   exit;
  if not obCabecalhonf.abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CFG016]';
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [CFG016]';
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
  end;

end;

procedure TfrmCadCabecalhonf.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG016', 'EXCLUIR', '','CABECALHO_NF',obcabecalhonf.dataSet.FieldByName('CODIGO').AsString+' '+
  obcabecalhonf.dataSet.FieldByName('NOME_NF').AsString, obCabecalhonf.buscas, true) then
   exit;
  if obCabecalhonf.Delete then
  begin
    if obCabecalhonf.StatusLixeira then
      lixeiraVazia(false)
    else
    begin
      lixeiraVazia(true);
      obCabecalhonf.abreCabecalhonf;
    end;
  end;
end;

procedure TfrmCadCabecalhonf.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG017', 'IMPRIMIR', '','CABECALHO_NF','', obCabecalhonf.buscas, true) then
   exit;
  QuickRep1.Preview;
end;

procedure TfrmCadCabecalhonf.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG019', 'RESTAURAR', '','CABECALHO_NF',obcabecalhonf.dataSet.FieldByName('CODIGO').AsString+' '+
  obcabecalhonf.dataSet.FieldByName('NOME_NF').AsString, obCabecalhonf.buscas, true) then
   exit;

  if obCabecalhonf.restauraLixeira then
  begin
    if obCabecalhonf.StatusLixeira then
      lixeiraVazia(false)
    else
    begin
      lixeiraVazia(true);
      obCabecalhonf.abreCabecalhonf;
    end;
  end;
end;

procedure TfrmCadCabecalhonf.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CFG020', 'ACESSAR', '','CABECALHO_NF',
  '', obCabecalhonf.buscas, true) then
   exit;

  cadConfigNf := TConfignf.create;
  cadConfigNf.abreFormItensConfig;
end;

procedure TfrmCadCabecalhonf.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  obCabecalhonf.imprimirRegua;
end;

procedure TfrmCadCabecalhonf.SpeedButton8Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CFG021', 'ACESSAR', '','CABECALHO_NF',obcabecalhonf.dataSet.FieldByName('CODIGO').AsString+' '+
  obcabecalhonf.dataSet.FieldByName('NOME_NF').AsString, obCabecalhonf.buscas, true) then
   exit;
  if obCabecalhonf.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;
  inherited;

  cadConfigNf := TConfignf.create;
  cadConfigNf.abreFormConfigNf;
end;

end.

