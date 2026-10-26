unit UCadDebitoCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask,UclassesColaborador, DBCtrls;

type
  TfrmCadDebitoCredito = class(TfrmCadPadraoM)
    Label8: TLabel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    tsOutros: TTabSheet;
    pnMesAno: TPanel;
    pnOKCancelar: TPanel;
    btnOKCancelar: TBitBtn;
    gbMesAno: TGroupBox;
    Label203: TLabel;
    Label51: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label7: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label10: TLabel;
    BitBtn7: TBitBtn;
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBComboBox1: TDBComboBox;
    BitBtn13: TBitBtn;
    BitBtn10: TBitBtn;
    GroupBox10: TGroupBox;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn61: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn61Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure btnOKCancelarClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDebitoCredito: TfrmCadDebitoCredito;
  obLancDebCred : TLancDebitoCredito;

implementation

uses uDtmAtivo, uDtmColaborador, UClassesCadastrosBasicos, uDadosIni,
  uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadDebitoCredito.BitBtn10Click(Sender: TObject);
begin
  inherited;
  obLancDebCred.vTipoLancDC.Cancel;
  GroupBox4.visible:=true;
  GroupBox5.Visible:=false;
  if (Self.Enabled) and (Self.Visible) and (BitBtn61.CanFocus) then
  	BitBtn61.SetFocus;
end;

procedure TfrmCadDebitoCredito.BitBtn12Click(Sender: TObject);
begin
  inherited;
  obLancDebCred.vTipoLancDC.Delete;
end;

procedure TfrmCadDebitoCredito.BitBtn13Click(Sender: TObject);
begin
  inherited;
  if obLancDebCred.vTipoLancDC.Post then
  begin
    GroupBox4.Visible:=true;
    GroupBox5.Visible:=false;
    if (Self.Enabled) and (Self.Visible) and (BitBtn61.CanFocus) then
    	BitBtn61.SetFocus;
  end;
end;

procedure TfrmCadDebitoCredito.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Excluir lançamento -  [COL030]';
  if vDadosIni.PesqPros('COL028', 'PESQUISAR', '', 'LANC_DEBCRED', '', obLancDebCred.buscas, true) then
  begin
    if vDadosIni.isnumeroint(vDadosIni.vPesquisa) then
    begin
      ComboBox1.Text:='Cod Vendedor';
      MaskEdit3.Text:= vDadosIni.vPesquisa;
    end;
    inherited;
    if vDadosIni.isnumeroint(vDadosIni.vPesquisa) then
    begin
      obLancDebCred.montaSelect('select * from lanc_debcred '+
        ' where lanc_debcred.cod_vendedor='+vDadosIni.vPesquisa+
        ' and lanc_debcred.cod_empresa='+vDadosIni.codEmpresa);
      vDadosIni.vPesquisa:='';
    end else if MaskEdit2.Visible then
    begin
      if not obLancDebCred.ConsultaCampos('LANC_DEBCRED', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not obLancDebCred.ConsultaCampos('LANC_DEBCRED', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
    obLancDebCred.ultimasql := obLancDebCred.dataSet.CommandText;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadDebitoCredito.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('COL029', 'INSERIR', 'INSERINDO NOVO LANÇAMENTO ', 'LANC_DEBCRED', '', obLancDebCred.buscas, true) then
  begin
    if not obLancDebCred.Insert then
      exit;
    ActiveControl := BitBtn3;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;
    Label6.Caption:='';

    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
    	DBLookupComboBox2.SetFocus;

    DBLookupComboBox2.ListSource.DataSet.First;
  end;
end;

procedure TfrmCadDebitoCredito.BitBtn4Click(Sender: TObject);
begin
  if not obLancDebCred.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obLancDebCred.vNomeCampoErro, obLancDebCred.vMensagemErro);
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
      if obLancDebCred.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
        	DBLookupComboBox2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadDebitoCredito.BitBtn5Click(Sender: TObject);
begin
  obLancDebCred.Cancel;
  obLancDebCred.RollBackTransacao;
  inherited;
end;

procedure TfrmCadDebitoCredito.BitBtn61Click(Sender: TObject);
begin
  inherited;
  TabSheet2.Show;
end;

procedure TfrmCadDebitoCredito.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if obLancDebCred.vTipoLancDC.Insert then
  begin
    GroupBox5.Visible:=true;
    GroupBox4.Visible:=false;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;
  end;
end;

procedure TfrmCadDebitoCredito.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if obLancDebCred.vTipoLancDC.Edit then
  begin
    GroupBox5.Visible:=true;
    GroupBox4.Visible:=false;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;
  end;
end;

procedure TfrmCadDebitoCredito.btnOKCancelarClick(Sender: TObject);
begin
  inherited;
  if trim(Edit2.Text)='' then
  begin
    Application.MessageBox('A descrição do lançamento precisa ser informada.', 'Informação', MB_ICONEXCLAMATION + MB_OK);
    Exit;
  end;
  TForm(pnMesAno.Parent).ModalResult := IDOK;
end;

procedure TfrmCadDebitoCredito.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key:= #0;
end;

procedure TfrmCadDebitoCredito.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadDebitoCredito.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox1.Text='' then
    Label6.Caption:=''
  else if obLancDebCred.vTipoLancDC.dataSet.FieldByName('NATUREZA_LAN').AsString='C' then
    Label6.Caption:='Lançamento de crédito'
  else  if obLancDebCred.vTipoLancDC.dataSet.FieldByName('NATUREZA_LAN').AsString='D' then
    Label6.Caption:='Lançamento de débito'
  else Label6.Caption:='';
  obLancDebCred.dataSet.FieldByName('DESCRICAO').AsString:=obLancDebCred.vTipoLancDC.dataSet.FieldByName('DESCRICAOLANC').AsString;
end;

procedure TfrmCadDebitoCredito.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
//  frmCadDebitoCredito.Label10.Caption:=trim(obLancDebCred.vTipoLancDC.dataSet.FieldByName('DESCRICAOLANC').AsString);
end;

procedure TfrmCadDebitoCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obLancDebCred.Cancel;
  obLancDebCred.RollBackTransacao;
  obLancDebCred.free;
  Action := caFree;
  frmCadDebitoCredito := nil;
end;

procedure TfrmCadDebitoCredito.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  obLancDebCred := TLancDebitoCredito.create;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
//  PageControl1.ActivePage:=TabSheet2;
//  PageControl3.ActivePage:=TabSheet3;
  SpeedButton4.Visible := false;
  SpeedButton5.Visible := false;
  SpeedButton25.Visible := false;
  Label6.Caption:='';
end;

procedure TfrmCadDebitoCredito.FormShow(Sender: TObject);
begin
  DBGrid1.DataSource := dtmColaborador.dsLancDebCred;
  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;
//  TabSheet3.Visible := true;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  tsOutros.TabVisible:=false;
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
//  if TelaCadastro = 1 then
//    BitBtn3Click(Sender)
  if vDadosIni.isnumeroint(vDadosIni.vPesquisa) then
    BitBtn1Click(Sender);
end;

procedure TfrmCadDebitoCredito.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  obLancDebCred.Delete;
end;

procedure TfrmCadDebitoCredito.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  obLancDebCred.creditoPorCumprimentoMeta(MaskEdit4.Text,MaskEdit5.Text);
end;

procedure TfrmCadDebitoCredito.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('COL033', 'ABRIR', 'TIPO LANC DÉBITOS E CRÉDITOS','TIPO_LANCDEBCRED' , '',
    obLancDebCred.buscas, True) then
    Exit;
  TabSheet4.Show;
  Panel3.Visible:=false;
  GroupBox5.Visible:=false;
  obLancDebCred.vTipoLancDC.ListaTipoLancDC;
end;

procedure TfrmCadDebitoCredito.TabSheet3Show(Sender: TObject);
begin
  inherited;
  Panel3.Visible:=true;
end;

end.
