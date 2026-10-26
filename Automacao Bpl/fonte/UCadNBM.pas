unit UCadNBM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, Menus, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls, Mask,
  ComCtrls, UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo, DBCtrls, DB,
  uEditHw, AppEvnts, config_sistema_class;

type
  TFrmCadNBM = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    TabSheet4: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox7: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox10: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BitBtn12: TBitBtn;
    tsDefinirMVA: TTabSheet;
    Panel4: TPanel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    GroupBox4: TGroupBox;
    DBGrid3: TDBGrid;
    GroupBox5: TGroupBox;
    BitBtn16: TBitBtn;
    BitBtn31: TBitBtn;
    Panel6: TPanel;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    Label17: TLabel;
    DBEdit10: TDBEdit;
    GroupBox6: TGroupBox;
    Label18: TLabel;
    EditHw1: TEditHw;
    BitBtn13: TBitBtn;
    Label19: TLabel;
    EditHw4: TEditHw;
    BitBtn15: TBitBtn;
    Label15: TLabel;
    EditHw3: TEditHw;
    BitBtn14: TBitBtn;
    GroupBox8: TGroupBox;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    EditHw5: TEditHw;
    EditHw6: TEditHw;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit15: TDBEdit;
    Label25: TLabel;
    DBEdit16: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    Label26: TLabel;
    DBComboBox5: TDBComboBox;
    Label27: TLabel;
    BitBtn24: TBitBtn;
    ComboBox8: TComboBox;
    Label28: TLabel;
    DBEdit11: TDBEdit;
    Memo1: TMemo;
    Label29: TLabel;
    DBComboBox6: TDBComboBox;
    Label30: TLabel;
    Label31: TLabel;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    EditHw7: TEditHw;
    EditHw8: TEditHw;
    Label32: TLabel;
    BitBtn27: TBitBtn;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Edit1: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit14: TDBEdit;
    DBEdit17: TDBEdit;
    Label37: TLabel;
    DBEdit18: TDBEdit;
    Label38: TLabel;
    ComboBox9: TComboBox;
    DBEdit19: TDBEdit;
    groupNVE: TGroupBox;
    spBtAutXMLAdicionar: TSpeedButton;
    spBtAutXMLRemover: TSpeedButton;
    lbxNVE: TListBox;
    Label39: TLabel;
    DBEdit20: TDBEdit;
    Label40: TLabel;
    DBEdit21: TDBEdit;
    Label41: TLabel;
    DBEdit22: TDBEdit;
    GroupBox9: TGroupBox;
    GroupBox11: TGroupBox;
    BitBtn28: TBitBtn;
    MaskEdit4: TMaskEdit;
    BitBtn29: TBitBtn;
    ComboBox10: TComboBox;
    tsDadosFiscais: TTabSheet;
    pnDadosFiscais: TPanel;
    Panel7: TPanel;
    GroupBox13: TGroupBox;
    DBGrid4: TDBGrid;
    Panel8: TPanel;
    check_ncm: TCheckBox;
    check_mercadorias: TCheckBox;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    Panel9: TPanel;
    check_mva: TCheckBox;
    check_mva_inter: TCheckBox;
    check_aliq_intra: TCheckBox;
    check_fcp_aliq: TCheckBox;
    edmva: TEditHw;
    edmva_inter: TEditHw;
    edaliq_intra: TEditHw;
    edfcp_aliq: TEditHw;
    check_cest: TCheckBox;
    edcest: TMaskEdit;
    check_cst_piscofins: TCheckBox;
    check_cst_piscofins_ent: TCheckBox;
    check_nat_rec: TCheckBox;
    check_aliq_pis_diferenciada: TCheckBox;
    check_aliq_cofins_diferenciad: TCheckBox;
    check_aliq_cred_pis: TCheckBox;
    check_aliq_cred_cofins: TCheckBox;
    check_cenq_ipi_nfe: TCheckBox;
    edaliq_pis_diferenciada: TEditHw;
    edaliq_cofins_diferenciada: TEditHw;
    edaliq_cred_pis: TEditHw;
    edaliq_cred_cofins: TEditHw;
    Panel10: TPanel;
    Panel5: TPanel;
    Label42: TLabel;
    GroupBox12: TGroupBox;
    BitBtn30: TBitBtn;
    Edit2: TEdit;
    Splitter3: TSplitter;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    SpeedButton9: TSpeedButton;
    edcst_piscofins: TMaskEdit;
    edcst_piscofins_ent: TMaskEdit;
    ednat_rec: TMaskEdit;
    edcenq_ipi_nfe: TMaskEdit;
    Label43: TLabel;
    DBEdit23: TDBEdit;
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure spBtAutXMLRemoverClick(Sender: TObject);
    procedure spBtAutXMLAdicionarClick(Sender: TObject);
    procedure ComboBox9Exit(Sender: TObject);
    procedure ComboBox9KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Panel4Enter(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure ComboBox7Exit(Sender: TObject);
    procedure ComboBox6Exit(Sender: TObject);
    procedure DBComboBox6Enter(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox5Exit(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TabSheet4Exit(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    //    TelaCadastro: integer;
        { Private declarations }
    Fncm_manut: TNBM_ManutencaoDados;
    Fnf_icmsst_cest_v2: Boolean;
    procedure preencheComboNatReceita(pCST: string);
  public
    { Public declarations }
  end;

var
  FrmCadNBM: TFrmCadNBM;
  Nbm: TNBM;

implementation

uses uDataSet_OOP, nbm_class, strUtils;

procedure AtualizaAnexoXV(Bancohw: Pchar); external 'Compacta.dll';
procedure AtualizaImposto(Bancohw, codEmpresa: Pchar); external 'Compacta.dll';

{$R *.dfm}

procedure TFrmCadNBM.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO062', 'CANCELAR', '', 'NBM', '', Nbm.buscas, true) then
//  if vDadosIni.PesqPros('PRO062', '', Nbm.buscas, true) then
  begin
    Nbm.NbmUF.Cancel;
    Nbm.NbmUF.RollBackTransacao;
    Dbedit7.Enabled := false;
    Dbedit8.Enabled := false;
    //  BitBtn12.Enabled := ;
    BitBtn11.Enabled := true;
    BitBtn10.Enabled := false;
    BitBtn9.Enabled := true;
    BitBtn8.Enabled := false;
    BitBtn7.Enabled := true;
    DtmProdutos.qrNBMEStados.Open;
  end;
end;

procedure TFrmCadNBM.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO063', 'APAGAR', '', 'NBM', '', Nbm.buscas, true) then
//  if vDadosIni.PesqPros('PRO063', '', Nbm.buscas, true) then
  begin
    if not Nbm.NbmUF.IsEmpty then
    begin
      if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
        if Nbm.NbmUF.Delete then
          if Nbm.NbmUF.Apply then
          begin
            Nbm.NbmUF.CommitaTransacao;
            DtmProdutos.qrNBMEStados.Open;
          end;
    end
    else
      Application.MessageBox('Não há nenhum registro para ser excluído.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
  Nbm.NbmUF.Refresh;
end;

procedure TFrmCadNBM.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if Nbm.NbmUF.dataSet.State in [dsEdit, dsInsert] then
  begin
    BitBtn8Click(Sender);
  end;
  TabSheet1.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Visible := true;
  Panel3.Visible := true;
end;

procedure TFrmCadNBM.BitBtn13Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO162', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirMVA(EditHw1.AsValue);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn14Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO164', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirICMSInterno(EditHw3.AsValue);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn15Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO163', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirMVAInter(EditHw4.AsValue);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn16Click(Sender: TObject);
begin
  inherited;
  Nbm.abreNBM(Edit1.Text);
end;

procedure TFrmCadNBM.BitBtn17Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO165', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirCSTPISVenda(COPY(ComboBox4.Text, 1, 2));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn18Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO166', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirCSTCOFINSVenda(COPY(ComboBox5.Text, 1, 2));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn19Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO167', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirCSTPISEntrada(COPY(ComboBox6.Text, 1, 2));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO050', 'PESQUISAR', '', 'NBM', '', Nbm.buscas, true) then
//  if vDadosIni.PesqPros('PRO050', '', Nbm.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Nbm.ConsultaCampos('NBM', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        combobox1.setfocus;
    end
    else if not Nbm.ConsultaCampos('NBM', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadNBM.BitBtn20Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO168', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirCSTCOFINSEntrada(COPY(ComboBox7.Text, 1, 2));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn21Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO169', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirAliqDiferenciadaPIS(EditHw5.AsValue);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn22Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO170', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirAliqDiferenciadaCOFINS(EditHw6.AsValue);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn23Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO171', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirDadosPISCOFINSnosProdutos(DBGrid3);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn24Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO196', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirNaturezaReceitaPICOFINS(COPY(ComboBox8.Text, 1, 3));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn25Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO220', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirAliqCreditoPIS(EditHw7.AsValue);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn26Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO221', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirAliqCreditoCOFINS(EditHw8.AsValue);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn27Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO219', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirICMSeMVAnosProdutos(DBGrid3);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn28Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO290', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirCENQ(ComboBox10.Text);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn29Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('PRO289', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
      Nbm.definirCEST(MaskEdit4.Text);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNBM.BitBtn30Click(Sender: TObject);
begin
  inherited;
  Nbm.abreNBM(Edit2.Text);
end;

procedure TFrmCadNBM.BitBtn31Click(Sender: TObject);
begin
  inherited;
  TForm(Panel4.Parent).ModalResult := mrCancel;
end;

procedure TFrmCadNBM.BitBtn32Click(Sender: TObject);
var
  ArecNo: Integer;
begin
  inherited;

  if Nbm.dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('PRO171', 'APLICAR', '', 'NBM', '', Nbm.buscas, true) then
    Exit;

  Fncm_manut.check_mva                      :=  check_mva.Checked;
  Fncm_manut.check_mva_inter                :=  check_mva_inter.Checked;
  Fncm_manut.check_aliq_intra               :=  check_aliq_intra.Checked;
  Fncm_manut.check_cst_piscofins            :=  check_cst_piscofins.Checked;
  Fncm_manut.check_cst_piscofins_ent        :=  check_cst_piscofins_ent.Checked;
  Fncm_manut.check_aliq_pis_diferenciada    :=  check_aliq_pis_diferenciada.Checked;
  Fncm_manut.check_aliq_cofins_diferenciada :=  check_aliq_cofins_diferenciad.Checked;
  Fncm_manut.check_nat_rec                  :=  check_nat_rec.Checked;
  Fncm_manut.check_aliq_cred_pis            :=  check_aliq_cred_pis.Checked;
  Fncm_manut.check_aliq_cred_cofins         :=  check_aliq_cred_cofins.Checked;
  Fncm_manut.check_cenq_ipi_nfe             :=  check_cenq_ipi_nfe.Checked;
  Fncm_manut.check_cest                     :=  check_cest.Checked;
  Fncm_manut.check_fcp_aliq                 :=  check_fcp_aliq.Checked;

  Fncm_manut.check_ncm         :=  check_ncm.Checked;
  Fncm_manut.check_mercadorias :=  check_mercadorias.Checked;

  with Fncm_manut.dadosNCM do
  begin
    mva                      := edmva.AsValue;
    mva_inter                := edmva_inter.AsValue;
    aliq_intra               := edaliq_intra.AsValue;
    fcp_aliq                 := edfcp_aliq.AsValue;
    cest                     := edcest.Text;
    cst_pis                  := edcst_piscofins.Text;//IfThen(edcst_piscofins.Text <> '', .AsInteger, 2);
    cst_cofins               := edcst_piscofins.Text;
    cst_pis_ent              := edcst_piscofins_ent.Text;
    cst_cofins_ent           := edcst_piscofins_ent.Text;
    nat_rec                  := ednat_rec.Text;
    aliq_pis_diferenciada    := edaliq_pis_diferenciada.AsValue;
    aliq_cofins_diferenciada := edaliq_cofins_diferenciada.AsValue;
    aliq_cred_pis            := edaliq_cred_pis.AsValue;
    aliq_cred_cofins         := edaliq_cred_cofins.AsValue;
    cenq_ipi_nfe             := edcenq_ipi_nfe.Text;
  end;

  Fncm_manut.listNCM.Clear;
  Nbm.dataSet.DisableControls;
  ArecNo := Nbm.dataSet.RecNo;  
  Nbm.dataSet.Filter := 'SEL = ''S''';
  Nbm.dataSet.Filtered := True;
  try
    Nbm.dataSet.First;
    while not Nbm.dataSet.Eof do
    begin
      with Fncm_manut.listNCM.New do
        cod_ncm := Nbm.dataSet.FieldByName('cod_ncm').AsString;
      Nbm.dataSet.Next;
    end;


    Nbm.aplicarValoresNcmMercadorias(Fncm_manut);

  finally
    Nbm.dataSet.Filtered := False;
    Nbm.dataSet.Filter := '';
    Nbm.dataSet.Refresh;

    Nbm.dataSet.RecNo := ArecNo;;
    Nbm.dataSet.EnableControls;
  end;
end;

procedure TFrmCadNBM.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.PesqPros('PRO051', 'INCLUIR', '', 'NBM', '', Nbm.buscas, true) then
  	Exit;

  if not Nbm.Insert then
    Exit;

  inherited;

  for I := 0 to ComponentCount - 1 do
   	if (Components[I] is TScrollBox) then
    	TScrollBox(Components[I]).VertScrollBar.Position := 0;

  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;
  TabSheet4.TabVisible := false;

  Memo1.Lines.Text := Nbm.vTextoInfComplementar.Text;
  ComboBox9.Text := '';
  lbxNVE.Clear;

  if DBEdit3.CanFocus then
    DBEdit3.SetFocus;
end;

procedure TFrmCadNBM.BitBtn4Click(Sender: TObject);
var
  vListaTmp: TStringList;
begin
  if Nbm.dataSet.State = dsEdit then
    statusDataset := 'E'
  else
    statusDataset := 'I';

  if Nbm.dataSet.FieldByName('MVA').AsFloat > 0 then
  begin
    Nbm.dataSet.FieldByName('VLBCST').AsFloat := 0;
    Nbm.dataSet.FieldByName('MODBCST').AsInteger := 4;
  end
  else
  begin
    Nbm.dataSet.FieldByName('MVA').AsFloat := 0;
    Nbm.dataSet.FieldByName('MVA_INTER').AsFloat := 0;
    Nbm.dataSet.FieldByName('MODBCST').AsInteger := 0;
  end;

  vListaTmp := TStringList.Create;
  vListaTmp.Text := lbxNVE.Items.Text;

  if (Nbm.dataSet.State in [dsInsert, dsEdit]) then
    Nbm.dataSet.FieldByName('NVE').AsString := vDadosIni.Join(vListaTmp);

  if (Nbm.dataSet.State in [dsInsert, dsEdit]) then
    Nbm.dataSet.FieldByName('CEST').AsString := vDadosIni.apenasNumeros(Trim(Nbm.dataSet.FieldByName('CEST').AsString));
  if Trim(Nbm.dataSet.FieldByName('CEST').AsString) <> '' then
    if Length(Trim(Nbm.dataSet.FieldByName('CEST').AsString)) <> 7 then
    begin
      Application.MessageBox('Campo CEST com preenchimento inválido. Se preenchido deve conter 7 dígitos', 'Atenção', 0 + 64);
      if DBEdit21.CanFocus then
        DBEdit21.SetFocus;
      exit;
    end;

  if not Nbm.Post then
    Application.MessageBox('Erro ao gravar o NBM.' + chr(13) + 'Tente novamente.', 'Informação',
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  if Nbm.Apply then
  begin
    vDadosIni.vPesquisa := Nbm.dataSet.FieldByName('COD_NCM').asstring;
    if Nbm.CommitaTransacao then
    begin
      if statusDataset = 'E' then
        vDadosIni.GravaAuditoria('PRO056', 'ALTERAÇÃO CONFIRMADA', 'SUCESSO', 'NBM',
          Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas)
//        vDadosIni.GravaAuditoria('PRO056', 'ALTEREÇÃO CONFIRMADA ' +
//          Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas)
      else if statusDataset = 'I' then
        vDadosIni.GravaAuditoria('PRO056', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'NBM',
          Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas);
//        vDadosIni.GravaAuditoria('PRO056', 'INCLUSÃO CONFIRMADA ' +
//          Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas);
    end
    else
    begin
      if statusDataset = 'E' then
        vDadosIni.GravaAuditoria('PRO056', 'ALTERAÇÃO NAO CONFIRMADA', 'FALHA', 'NBM',
          Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas)
//        vDadosIni.GravaAuditoria('PRO056', 'ALTEREÇÃO NÃO CONFIRMADA ' +
//          Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas)
      else if statusDataset = 'I' then
        vDadosIni.GravaAuditoria('PRO056', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'NBM',
          Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas);
//        vDadosIni.GravaAuditoria('PRO056', 'INCLUSÃO NÃO CONFIRMADA ' +
//          Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas);
    end;
  end
  else
  begin
    Nbm.Cancel;
    Nbm.RollBackTransacao;
    if statusDataset = 'E' then
      vDadosIni.GravaAuditoria('PRO056', 'ALTERAÇÃO NAO CONFIRMADA', 'FALHA', 'NBM',
        Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas)
//      vDadosIni.GravaAuditoria('PRO056', 'ALTEREÇÃO NÃO CONFIRMADA ' +
//        Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas)
    else if statusDataset = 'I' then
      vDadosIni.GravaAuditoria('PRO056', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'NBM',
        Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas);
//      vDadosIni.GravaAuditoria('PRO056', 'INCLUSÃO NÃO CONFIRMADA ' +
//        Nbm.dataSet.FieldByName('COD_NCM').asstring, Nbm.buscas);
  end;
  Nbm.Refresh;
  TabSheet2.Visible := true;
  if TelaCadastro = 2 then
    BitBtn5.Click
  else
    inherited;
end;

procedure TFrmCadNBM.BitBtn5Click(Sender: TObject);
begin
  //if vDadosIni.PesqPros('PRO057', 'CANCELAR', '','NBM','', Nbm.buscas, true) then
//  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Visible := true;
    Nbm.Cancel;
    Nbm.RollBackTransacao;

    if TelaCadastro <> 2 then
      inherited;
//  end;
end;

procedure TFrmCadNBM.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO059', 'INCLUIR', '', 'NBM', '', Nbm.buscas, true) then
//  if vDadosIni.PesqPros('PRO059', '', Nbm.buscas, true) then
  begin
    Nbm.NbmUF.abreNbmUF;
    if Nbm.NbmUF.Insert then
    begin
      DtmProdutos.qrNBMEStados.Open;
      Dbedit6.Enabled := true;
      Dbedit6.SetFocus;
      Dbedit7.Enabled := true;
      Dbedit8.Enabled := true;
      //    BitBtn12.Enabled := true;
      BitBtn11.Enabled := false;
      BitBtn10.Enabled := true;
      BitBtn9.Enabled := false;
      BitBtn8.Enabled := true;
      BitBtn7.Enabled := false;
      Nbm.NbmUF.PreencheCampos(trim(Nbm.dataSet.FieldByName('COD_NCM').AsString));
    end;
  end;
end;

procedure TFrmCadNBM.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO060', 'SALVAR', '', 'NBM', '', Nbm.buscas, true) then
//  if vDadosIni.PesqPros('PRO060', '', Nbm.buscas, true) then
  begin
    try
      Nbm.NbmUF.dataSet.Post;
      if Nbm.NbmUF.Apply then
        Nbm.NbmUF.CommitaTransacao;
      Dbedit6.Enabled := false;
      Dbedit7.Enabled := false;
      Dbedit8.Enabled := false;
      BitBtn11.Enabled := true;
      BitBtn10.Enabled := false;
      BitBtn9.Enabled := true;
      BitBtn8.Enabled := false;
      BitBtn7.Enabled := true;
    except
      on E: Exception do
      begin
        Application.MessageBox(Pchar('Erro gravando relação NBM e Estado' + chr(13) + e.Message),
          'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        Nbm.NbmUF.registraErro('E0004 ' + e.Message);
        BitBtn10Click(Sender);
      end;
    end;
    DtmProdutos.qrNBMEStados.Open;
  end;
end;

procedure TFrmCadNBM.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO061', 'ALTERAR', '', 'NBM', '', Nbm.buscas, true) then
//  if vDadosIni.PesqPros('PRO061', '', Nbm.buscas, true) then
  begin
//    Nbm.NbmUF.abreNbmUF;
    if not Nbm.NbmUF.IsEmpty then
    begin
      if Nbm.NbmUF.Edit then
      begin
        DtmProdutos.qrNBMEStados.Open;
        Dbedit6.Enabled := true;
        Dbedit6.SetFocus;
        Dbedit7.Enabled := true;
        Dbedit8.Enabled := true;
        //      BitBtn12.Enabled := true;
        BitBtn11.Enabled := false;
        BitBtn10.Enabled := true;
        BitBtn9.Enabled := false;
        BitBtn8.Enabled := true;
        BitBtn7.Enabled := false;
//        Nbm.NbmUF.PreencheCampos(trim(Nbm.dataSet.FieldByName('COD_NCM').AsString));
      end;
    end
    else
      Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

procedure TFrmCadNBM.btSelectAllClick(Sender: TObject);
begin
  inherited;
  Nbm.checkUnCheckAllRows(True);
end;

procedure TFrmCadNBM.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  Nbm.checkUnCheckAllRows(False);
end;

procedure TFrmCadNBM.ComboBox4Exit(Sender: TObject);
begin
  inherited;
  if ComboBox4.ItemIndex <= -1 then
    Exit;
  ComboBox4.Text := ComboBox4.Items[ComboBox4.ItemIndex];
  ComboBox5.ItemIndex := ComboBox4.ItemIndex;
  preencheComboNatReceita(copy(ComboBox4.Text, 1, 2));
end;

procedure TFrmCadNBM.ComboBox5Exit(Sender: TObject);
begin
  inherited;
  if ComboBox5.ItemIndex <= -1 then
    Exit;
  ComboBox5.Text := ComboBox5.Items[ComboBox5.ItemIndex];
  ComboBox4.ItemIndex := ComboBox5.ItemIndex;
  preencheComboNatReceita(copy(ComboBox5.Text, 1, 2));
end;

procedure TFrmCadNBM.ComboBox6Exit(Sender: TObject);
begin
  inherited;
  if ComboBox6.ItemIndex <= -1 then
    Exit;
  ComboBox6.Text := ComboBox6.Items[ComboBox6.ItemIndex];
  ComboBox7.ItemIndex := ComboBox6.ItemIndex;
end;

procedure TFrmCadNBM.ComboBox7Exit(Sender: TObject);
begin
  inherited;
  if ComboBox7.ItemIndex <= -1 then
    Exit;
  ComboBox7.Text := ComboBox7.Items[ComboBox7.ItemIndex];
  ComboBox6.ItemIndex := ComboBox7.ItemIndex;
end;

procedure TFrmCadNBM.ComboBox9Exit(Sender: TObject);
begin
  inherited;
  try
    Nbm.dataSet.FieldByName('MODBCST').AsInteger := StrToInt(Copy(Trim(ComboBox9.Text), 1, 1));

    if Nbm.dataSet.FieldByName('MODBCST').AsInteger = 4 then
    begin
      Nbm.dataSet.FieldByName('VLBCST').AsFloat := 0;
      DBEdit2.Enabled := true and (not Fnf_icmsst_cest_v2);
      DBEdit9.Enabled := true and (not Fnf_icmsst_cest_v2);
      DBEdit18.Enabled := false and (not Fnf_icmsst_cest_v2);
      if DBEdit2.CanFocus then
       DBEdit2.SetFocus;
    end
    else
    begin
      Nbm.dataSet.FieldByName('MVA').AsFloat := 0;
      Nbm.dataSet.FieldByName('MVA_INTER').AsFloat := 0;
      DBEdit2.Enabled := false and (not Fnf_icmsst_cest_v2);
      DBEdit9.Enabled := false and (not Fnf_icmsst_cest_v2);
      DBEdit18.Enabled := true and (not Fnf_icmsst_cest_v2);
      if DBEdit18.CanFocus then
       DBEdit18.SetFocus;
    end;
  except
  end;
end;

procedure TFrmCadNBM.ComboBox9KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then Key := #0;
end;

procedure TFrmCadNBM.DBComboBox6Enter(Sender: TObject);
begin
  inherited;
  preencheComboNatReceita(copy(DBComboBox1.Text, 1, 2));
end;

procedure TFrmCadNBM.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  Nbm.existeInformacaoComplementar(Nbm.dataSet.FieldByName('cod_inf').AsInteger);
  Memo1.Lines.Text := Nbm.vTextoInfComplementar.Text;
end;

procedure TFrmCadNBM.DBEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('SPED_INFORMACAO_COMPLEMENTAR'));
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        StrToInt(vDadosIni.vPesquisa);
      except
        Exit;
      end;
      Nbm.existeInformacaoComplementar(StrToInt(vDadosIni.vPesquisa));
      Memo1.Lines.Text := Nbm.vTextoInfComplementar.Text;
    end;
  end;
end;

procedure TFrmCadNBM.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {if (key = VK_RETURN) and (TelaCadastro = 1) then
  begin
    vDadosIni.vPesquisa := Nbm.dataSet.FieldByName('COD_NCM').AsString;
    FrmCadNBM.Close;
  end
  else }
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TFrmCadNBM.DBGrid4CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    Nbm.checkUnCheckRow;
end;

procedure TFrmCadNBM.DBGrid4DblClick(Sender: TObject);
begin
  inherited;
  Nbm.checkUnCheckRow();
end;

procedure TFrmCadNBM.DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  vDadosIni.DBGridOnDrawColumnCell(Sender, Rect, DataCol, Column, State);
end;

procedure TFrmCadNBM.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    Nbm.checkUnCheckRow();
end;

procedure TFrmCadNBM.DBGrid4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    Nbm.checkUnCheckRow;
end;

procedure TFrmCadNBM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Nbm.Cancel;
  Nbm.RollBackTransacao;
  //  Nbm.abreNbm;
    //  if vDadosIni.vTipoForm <> 1 then
  Nbm.Destroy;
  Action := caFree;
  FrmCadNbm := nil;
end;

procedure TFrmCadNBM.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  Nbm := TNbm.Create;
	tsDefinirMVA.TabVisible := false;
  tsDadosFiscais.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet3.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadNBM.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (Nbm.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TFrmCadNBM.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsNBM;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  
  //Nbm.abreNBM;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
  SpeedButton8.Caption := 'Anexo' + #13 + 'XV';

  with vDadosIni.getConfSisObject('nf_icmsst_cest_v2', Nbm.buscas) do
    Fnf_icmsst_cest_v2 := (Trim(chave) <> '') and (value1_f = 1);

  SpeedButton5.Enabled    := not Fnf_icmsst_cest_v2;
  SpeedButton8.Enabled    := not Fnf_icmsst_cest_v2;
  Label37.Enabled         := not Fnf_icmsst_cest_v2;
  Label38.Enabled         := not Fnf_icmsst_cest_v2;
  Label9.Enabled          := not Fnf_icmsst_cest_v2;
  Label16.Enabled         := not Fnf_icmsst_cest_v2;
  ComboBox9.Enabled       := not Fnf_icmsst_cest_v2;
  DBEdit18.Enabled        := not Fnf_icmsst_cest_v2;
  DBEdit2.Enabled         := not Fnf_icmsst_cest_v2;
  DBEdit9.Enabled         := not Fnf_icmsst_cest_v2;
  EditHw1.Enabled         := not Fnf_icmsst_cest_v2;
  EditHw4.Enabled         := not Fnf_icmsst_cest_v2;
  Label18.Enabled         := not Fnf_icmsst_cest_v2;
  Label19.Enabled         := not Fnf_icmsst_cest_v2;
  check_mva.Enabled       := not Fnf_icmsst_cest_v2;
  check_mva_inter.Enabled := not Fnf_icmsst_cest_v2;
  edmva.Enabled           := not Fnf_icmsst_cest_v2;
  edmva_inter.Enabled     := not Fnf_icmsst_cest_v2;
  Nbm.dataSet.FieldByName('MODBCST').Tag   := 1;
  Nbm.dataSet.FieldByName('VLBCST').Tag    := 1;
  Nbm.dataSet.FieldByName('MVA').Tag       := 1;
  Nbm.dataSet.FieldByName('MVA_INTER').Tag := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadNBM.Panel4Enter(Sender: TObject);
begin
  inherited;
  ComboBox4.ItemIndex := -1;
  ComboBox5.ItemIndex := -1;
  ComboBox6.ItemIndex := -1;
  ComboBox7.ItemIndex := -1;
  ComboBox8.ItemIndex := -1;
  EditHw1.AsValue := 0;
  EditHw3.AsValue := 0;
  EditHw4.AsValue := 0;
  EditHw5.AsValue := 0;
  EditHw6.AsValue := 0;
  EditHw7.AsValue := 0;
  EditHw8.AsValue := 0;
end;

procedure TFrmCadNBM.preencheComboNatReceita(pCST: string);
begin
  if (Copy(pCST, 1, 2) = '04') then
  begin
    ComboBox8.Items.Clear;
    ComboBox8.Items.Add('');
    ComboBox8.Items.Add('101 - Gasolinas, Exceto Gasolina de Aviação');
    ComboBox8.Items.Add('102 - Óleo Diesel');
    ComboBox8.Items.Add('103 - Gás Liqüefeito de Petróleo – GLP');
    ComboBox8.Items.Add('104 - Querosene de Aviação');
    ComboBox8.Items.Add('105 - Correntes Destinadas à Formulação de Gasolinas');
    ComboBox8.Items.Add('106 - Correntes Destinadas à Formulação de Óleo Diesel');
    ComboBox8.Items.Add('107 - Nafta Petroquímica Destinada à Formulação de Gasolina ou de Óleo Diesel');
    ComboBox8.Items.Add('108 - Nafta Petroquímica Destinada à Formulação Exclusivamente de Óleo Diesel');
    ComboBox8.Items.Add('109 - Biodiesel');
    ComboBox8.Items.Add('110 - Nafta Petroquímica Destinada às Centrais Petroquímicas');
    ComboBox8.Items.Add('111 - Etano, Propano, Butano e Correntes Gasosas de Refinaria - HLR - Hidrocarbonetos Leves de Refino Destinados à Produção de Eteno e Propeno');
    ComboBox8.Items.Add('112 - Álcool, Inclusive para Fins Carburantes – Venda por Produtor ou Importador.');
    ComboBox8.Items.Add('113 - Álcool, Inclusive para Fins Carburantes – Venda por Distribuidor ou Comerciante Não Varejista.');
    ComboBox8.Items.Add('200 - FÁRMACOS E PERFUMARIAS');
    ComboBox8.Items.Add('201 - Produtos Farmacêuticos');
    ComboBox8.Items.Add('202 - Produtos de Perfumaria, de Toucador ou de Higiene Pessoal.');
    ComboBox8.Items.Add('301 - Veículos Automotores e Máquinas Agrícolas Autopropulsadas');
    ComboBox8.Items.Add('302 - Autopeças - Vendas para Atacadistas, Varejistas e Consumidores');
    ComboBox8.Items.Add('303 - Autopeças - Vendas para Fabricantes de Veículos e Máquinas e de Autopeças');
    ComboBox8.Items.Add('304 - Pneumáticos (Pneus Novos e Câmaras-de-Ar)');
    ComboBox8.Items.Add('401 - Águas Minerais Artificiais e Águas Gaseificadas Artificiais');
    ComboBox8.Items.Add('402 - Águas Minerais Naturais, Incluídas as Naturalmente Gaseificadas');
    ComboBox8.Items.Add('403 - Refrigerantes');
    ComboBox8.Items.Add('404 - Preparações Compostas, não Alcoólicas, para Elaboração de Bebida Refrigerante');
    ComboBox8.Items.Add('405 - Refrescos, Isotônicos e Energéticos');
    ComboBox8.Items.Add('406 - Cervejas de Malte e Cervejas Sem Álcool');
    ComboBox8.Items.Add('407 - Chope e Cervejas de Malte Quando Vendidas a Granel');
    ComboBox8.Items.Add('701 - Embalagens de Vidro não Retornáveis para Refrigerantes ou Cervejas');
    ComboBox8.Items.Add('702 - Embalagens de Vidro Retornáveis para Refrigerantes ou Cervejas');
    ComboBox8.Items.Add('703 - Garrafas e Garrafões com Capacidade Nominal de Envasamento Inferior a 10 Litros');
    ComboBox8.Items.Add('704 - Garrafas e Garrafões com Capacidade Nominal de Envasamento Igual ou Superior a 10 Litros');
    ComboBox8.Items.Add('705 - Lata de Aço para Refrigerantes, Cervejas sem Álcool ou Água');
    ComboBox8.Items.Add('706 - Lata de Aço para Cervejas de Malte');
    ComboBox8.Items.Add('707 - Lata de Alumínio para Refrigerantes, Cervejas sem Álcool ou Água');
    ComboBox8.Items.Add('708 - Lata de Alumínio para Cervejas de Malte');
    ComboBox8.Items.Add('709 - Pré-Formas de Embalagens com Faixa de Gramatura de até 30 g');
    ComboBox8.Items.Add('710 - Pré-Formas de Embalagens com Faixa de Gramatura Acima de 30 até 42 g');
    ComboBox8.Items.Add('711 - Pré-Formas de Embalagens com Faixa de Gramatura Acima de 42 g');
    ComboBox8.Items.Add('712 - Pré-Formas de Embalagens com Faixa de Gramatura Acima de 42 g');
    ComboBox8.Items.Add('811 - Águas Minerais Artificiais - Todas as Embalagens');
    ComboBox8.Items.Add('812 - Águas Gaseificadas Artificiais - Todas as Embalagens');
    ComboBox8.Items.Add('821 - Águas Minerais Naturais Envasadas em Embalagens de Capacidade até 10 Litros');
    ComboBox8.Items.Add('822 - Águas Minerais Naturais Envasadas em Embalagens de Capacidade Acima de 10 Litros');
    ComboBox8.Items.Add('831 - Águas e Refrigerantes, em PET/Plástico - Grupo 01');
    ComboBox8.Items.Add('832 - Águas e Refrigerantes, em PET/Plástico - Grupo 02');
    ComboBox8.Items.Add('833 - Águas e Refrigerantes, em PET/Plástico - Grupo 03');
    ComboBox8.Items.Add('834 - Águas e Refrigerantes, em PET/Plástico - Grupo 04');
    ComboBox8.Items.Add('835 - Águas e Refrigerantes, em PET/Plástico - Grupo 05');
    ComboBox8.Items.Add('836 - Águas e Refrigerantes, em PET/Plástico - Grupo 06');
    ComboBox8.Items.Add('837 - Águas e Refrigerantes, em PET/Plástico - Grupo 07');
    ComboBox8.Items.Add('838 - Águas e Refrigerantes, em PET/Plástico - Grupo 08');
    ComboBox8.Items.Add('839 - Águas e Refrigerantes, em PET/Plástico - Grupo 09');
    ComboBox8.Items.Add('840 - Águas e Refrigerantes, em PET/Plástico - Grupo 10');
    ComboBox8.Items.Add('841 - Águas e Refrigerantes, em PET/Plástico - Grupo 11');
    ComboBox8.Items.Add('842 - Águas e Refrigerantes, em PET/Plástico - Grupo 12');
    ComboBox8.Items.Add('843 - Águas e Refrigerantes, em PET/Plástico - Grupo 13');
    ComboBox8.Items.Add('844 - Águas e Refrigerantes, em PET/Plástico - Grupo 14');
    ComboBox8.Items.Add('845 - Águas e Refrigerantes, em PET/Plástico - Grupo 16');
    ComboBox8.Items.Add('846 - Águas e Refrigerantes, em PET/Plástico - Grupo 18');
    ComboBox8.Items.Add('847 - Águas e Refrigerantes, em PET/Plástico - Grupo 20');
    ComboBox8.Items.Add('848 - Águas e Refrigerantes, em PET/Plástico - Grupo 23');
    ComboBox8.Items.Add('849 - Águas e Refrigerantes, em PET/Plástico - Grupo 25');
    ComboBox8.Items.Add('850 - Águas e Refrigerantes, em PET/Plástico - Grupo 29');
    ComboBox8.Items.Add('861 - Águas e Refrigerantes, em Lata - Grupo 01');
    ComboBox8.Items.Add('862 - Águas e Refrigerantes, em Lata - Grupo 02');
    ComboBox8.Items.Add('863 - Águas e Refrigerantes, em Lata - Grupo 03');
    ComboBox8.Items.Add('864 - Águas e Refrigerantes, em Lata - Grupo 04');
    ComboBox8.Items.Add('865 - Águas e Refrigerantes, em Lata - Grupo 05');
    ComboBox8.Items.Add('866 - Águas e Refrigerantes, em Lata - Grupo 06');
    ComboBox8.Items.Add('867 - Águas e Refrigerantes, em Lata - Grupo 07');
    ComboBox8.Items.Add('868 - Águas e Refrigerantes, em Lata - Grupo 08');
    ComboBox8.Items.Add('869 - Águas e Refrigerantes, em Lata - Grupo 09');
    ComboBox8.Items.Add('870 - Águas e Refrigerantes, em Lata - Grupo 10');
    ComboBox8.Items.Add('871 - Águas e Refrigerantes, em Lata - Grupo 11');
    ComboBox8.Items.Add('872 - Águas e Refrigerantes, em Lata - Grupo 14');
    ComboBox8.Items.Add('881 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 01');
    ComboBox8.Items.Add('882 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 02');
    ComboBox8.Items.Add('883 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 03');
    ComboBox8.Items.Add('884 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 04');
    ComboBox8.Items.Add('885 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 05');
    ComboBox8.Items.Add('886 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 06');
    ComboBox8.Items.Add('887 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 07');
    ComboBox8.Items.Add('888 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 08');
    ComboBox8.Items.Add('889 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 09');
    ComboBox8.Items.Add('890 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 10');
    ComboBox8.Items.Add('891 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 11');
    ComboBox8.Items.Add('892 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 12');
    ComboBox8.Items.Add('893 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 13');
    ComboBox8.Items.Add('894 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 14');
    ComboBox8.Items.Add('895 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 15');
    ComboBox8.Items.Add('896 - Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 16');
  end
  else if (Copy(pCST, 1, 2) = '05') then
  begin
    ComboBox8.Items.Clear;
    ComboBox8.Items.Add('');
    ComboBox8.Items.Add('101 - Cigarros, de fumo (tabaco) ou dos seus sucedâneos');
    ComboBox8.Items.Add('201 - Motocicletas (incluídos os ciclomotores) e outros ciclos equipados com motor auxiliar, mesmo com carro lateral; carros laterais');
    ComboBox8.Items.Add('301 - Semeadores, plantadores e transplantadores');
    ComboBox8.Items.Add('401 - Álcool, inclusive para fins carburantes – Vendas por Produtor/Importador');
    ComboBox8.Items.Add('402 - Álcool, inclusive para fins carburantes – Vendas por Distribuidor');
    ComboBox8.Items.Add('403 - Gasolinas, Óleo Dieses e GLP');
    ComboBox8.Items.Add('404 - Veiculos');
    ComboBox8.Items.Add('405 - Autopeças');
    ComboBox8.Items.Add('406 - Pneus');
    ComboBox8.Items.Add('407 - Bebidas Frias');
    ComboBox8.Items.Add('408 - Embalagens para bebidas Frias');
    ComboBox8.Items.Add('409 - Artigos de Perfumaria');
  end
  else if (Copy(pCST, 1, 2) = '06') then
  begin
    ComboBox8.Items.Clear;
    ComboBox8.Items.Add('');
    ComboBox8.Items.Add('101 - Adubos ou fertilizantes classificados no Capítulo 31, exceto os produtos de uso veterinário, da TIPI, e suas matérias-primas');
    ComboBox8.Items.Add('102 - Defensivos agropecuários classificados na posição 38.08 da TIPI e suas matérias-primas');
    ComboBox8.Items.Add('103 - Sementes e mudas destinadas à semeadura e plantio, em conformidade com o disposto na Lei no 10.711/03, e produtos de natureza biológica utilizados em sua produção');
    ComboBox8.Items.Add('104 - Corretivo de solo de origem mineral classificado no Capítulo 25 da TIPI');
    ComboBox8.Items.Add('105 - Legumes de vagem, secos, em grão, mesmo pelados ou partidos; arroz; farinhas e sêmolas');
    ComboBox8.Items.Add('106 - Inoculantes agrícolas produzidos a partir de bactérias fixadoras de nitrogênio, classificados no código 3002.90.99 da TIPI');
    ComboBox8.Items.Add('107 - Vacinas para medicina veterinária');
    ComboBox8.Items.Add('108 - Farinha, grumos e sêmolas, grãos esmagados ou em flocos, de milho, classificados, respectivamente, nos códigos 1102.20, 1103.13 e 1104.19, todos da TIPI');
    ComboBox8.Items.Add('109 - Pintos de 1 (um) dia');
    ComboBox8.Items.Add('110 - Leite fluido pasteurizado ou industrializado, na forma de ultrapasteurizado, leite em pó, integral, semidesnatado ou desnatado, leite fermentado, bebidas e compostos lácteos e fórmulas infantis, assim definidas conforme previsão legal específica, ' + 'destinados ao consumo humano ou utilizados na industrialização de produtos que se destinam ao consumo humano');
    ComboBox8.Items.Add('111 - Queijos tipo mozarela, minas, prato, queijo de coalho, ricota, requeijão, queijo provolone, queijo parmesão e queijo fresco não maturado');
    ComboBox8.Items.Add('112 - Soro de leite fluido a ser empregado na industrialização de produtos destinados ao consumo humano');
    ComboBox8.Items.Add('113 - Farinha de trigo');
    ComboBox8.Items.Add('114 - Trigo');
    ComboBox8.Items.Add('115 - Pré-misturas próprias para fabricação de pão comum e pão comum');
    ComboBox8.Items.Add('116 - Produtos hortícolas e frutas');
    ComboBox8.Items.Add('117 - Ovos');
    ComboBox8.Items.Add('118 - Venda de semens e embriões');
    ComboBox8.Items.Add('119 - Massas alimentícias classificadas na posição 19.02 da TIPI.');
    ComboBox8.Items.Add('201 - Aeronaves classificadas na posição 88.02 da TIPI');
    ComboBox8.Items.Add('202 - Partes, peças, ferramentais, componentes, insumos, fluidos hidráulicos, tintas, anticorrosivos, lubrificantes, equipamentos, serviços e matérias-primas a serem empregados na manutenção, conservação, modernização, reparo, revisão, conversão e ' + 'industrialização das aeronaves, seus motores, partes, componentes, ferramentais e equipamentos das aeronaves referidas no código 201');
    ComboBox8.Items.Add('203 - Álcool anidro adicionado à gasolina, por distribuidores');
    ComboBox8.Items.Add('204 - Álcool, inclusive para fins carburantes, em operações realizadas em bolsa de mercadorias e futuros, exceto quando ocorra a liquidação física do contrato');
    ComboBox8.Items.Add('205 - Carvão mineral destinado à geração de energia elétrica');
    ComboBox8.Items.Add('206 - Biodiesel fabricado a partir de matérias-primas produzidas nas regiões norte, nordeste e no semi-árido, por agricultor familiar enquadrado no PRONAF');
    ComboBox8.Items.Add('207 - Valores recebidos pelos concessionários de que trata a Lei nº 6.729/1979, pela intermediação ou entrega dos veículos classificados nas posições 87.03 e 87.04 da TIPI, vendidos diretamente ao consumidor final');
    ComboBox8.Items.Add('208 - Veículos novos montados sobre chassis, com capacidade para vinte e três a quarenta e quatro passageiros, classificados no código 8702.10.00 Ex. 02 e 8702.90.90 Ex 02, da TIPI, destinados ao transporte escolar para a educação básica na zona ' + 'rural das redes estadual, municipal e distrital, quando adquiridos pelos Estados, Municípios e pelo Distrito Federal');
    ComboBox8.Items.Add('209 - Embarcações novas, com capacidade para vinte a trinta e cinco passageiros, classificadas no código 8901.90.00 da TIPI, destinadas ao transporte escolar para a educação básica na zona rural das redes estadual, municipal e distrital, quando ' + 'adquiridos pelos Estados, Municípios e pelo Distrito Federal');
    ComboBox8.Items.Add('210 - Materiais e equipamentos, inclusive partes, peças e componentes, destinados ao emprego na construção, conservação, modernização, conversão ou reparo de embarcações registradas ou pré-registradas no Registro Especial Brasileiro');
    ComboBox8.Items.Add('211 - Veículos e carros blindados de combate, novos, armados ou não, e suas partes, produzidos no Brasil, com peso bruto total até 30 (trinta) toneladas, classificados na posição 8710.00.00 da TIPI, destinados ao uso das Forças Armadas ou órgãos de ' + 'segurança pública brasileiros, quando adquiridos por órgãos e entidades da administração pública direta');
    ComboBox8.Items.Add('212 - Gás natural canalizado, destinado à produção de energia elétrica pelas usinas integrantes do Programa Prioritário de Termoeletricidade, nos termos e condições estabelecidos em ato conjunto dos Ministros de Estado de Minas Energia e da Fazenda');
    ComboBox8.Items.Add('213 - Serviços de transporte ferroviário em sistema de trens de alta velocidade (TAV), assim entendido como a composição utilizada para efetuar a prestação do serviço público de transporte ferroviário que consiga atingir velocidade igual ou superior' + ' a 250 km/h (duzentos e cinquenta quilômetros por hora)');
    ComboBox8.Items.Add('301 - Produtos classificados na posição 87.13 da NCM (cadeiras de rodas e outros veículos)');
    ComboBox8.Items.Add('302 - Artigos e aparelhos ortopédicos ou para fraturas classificados no código 90.21.10 da NCM');
    ComboBox8.Items.Add('303 - Artigos e aparelhos de próteses classificados no código 90.21.3 da NCM');
    ComboBox8.Items.Add('304 - Almofadas antiescaras classificadas nos Capítulos 39, 40, 63 e 94 da NCM');
    ComboBox8.Items.Add('305 - Bens relacionados em ato do Poder Executivo para aplicação nas Unidades Modulares de Saúde de que trata o Convênio ICMS no 114/2009 quando vendidos a órgãos da administração pública direta federal, estadual, distrital e municipal');
    ComboBox8.Items.Add('306 - Produtos químicosclassificados no Capítulo 29 da Nomenclatura Comum do Mercosul - NCM');
    ComboBox8.Items.Add('307 - Produtos químicos intermediários de síntese, classificados no Capítulo 29 da NCM');
    ComboBox8.Items.Add('308 - Produtos destinados ao uso em hospitais, clínicas e consultórios médicos e odontológicos, campanhas de saúde realizadas pelo poder público, laboratório de anatomia patológica, citológica ou de análises clínicas, classificados nas posições ' + '30.02, 30.06, 39.26, 40.15 e 90.18, da NCM');
    ComboBox8.Items.Add('309 - Produtos classificados nos códigos 8443.32.22, 8469.00.39 Ex 01, 8714.20.00, e 9021.40.00, todos da TIPI');
    ComboBox8.Items.Add('310 - Calculadoras equipadas com sintetizador de voz classificadas no código 8470.10.00 da TIPI');
    ComboBox8.Items.Add('311 - Teclados com colmeia classificados no código 8471.60.52 da TIPI');
    ComboBox8.Items.Add('312 - Indicadores ou apontadores - mouses - com entrada para acionador classificados no código 8471.60.53 da TIPI');
    ComboBox8.Items.Add('313 - Linhas braile classificadas no código 8471.60.90 da TIPI');
    ComboBox8.Items.Add('314 - Digitalizadores de imagens - scanners - equipados com sintetizador de voz classificados no código 8471.90.14 da TIPI');
    ComboBox8.Items.Add('315 - Duplicadores braile classificados no código 8472.10.00 da TIPI');
    ComboBox8.Items.Add('316 - Acionadores de pressão classificados no código 8471.60.53 da TIPI');
    ComboBox8.Items.Add('317 - Lupas eletrônicas do tipo utilizado por pessoas com deficiência visual classificadas no código 8525.80.19 da TIPI');
    ComboBox8.Items.Add('318 - Implantes cocleares classificados no código 9021.90.19 da TIPI');
    ComboBox8.Items.Add('319 - Próteses oculares classificadas no código 9021.90.89 da TIPI.');
    ComboBox8.Items.Add('401 - Venda a varejo de unidades de processamento digital classificadas no código 8471.50.10 da TIPI, desde que o preço de venda de cada unidade não exceda a R$ 2.000,00');
    ComboBox8.Items.Add('402 - Venda a varejo de máquinas automáticas para processamento de dados, digitais, portáteis, de peso inferior a 3,5Kg (três quilos e meio), com tela (écran) de área superior a 140cm2 (cento e quarenta centímetros quadrados), classificadas nos ' + 'códigos 8471.30.12, 8471.30.19 ou 8471.30.90 da TIPI, desde que o preço de venda de cada máquina não exceda a R$ 4.000,00');
    ComboBox8.Items.Add('403 - Venda a varejo de máquinas automáticas de processamento de dados, apresentadas sob a forma de sistemas, do código 8471.49 da TIPI, contendo exclusivamente 1 (uma) unidade de processamento digital, 1 (uma) unidade de saída por vídeo (monitor), ' + '1 (um) teclado (unidade de entrada), 1 (um) mouse (unidade de entrada), classificados, respectivamente, nos códigos 8471.50.10, 8471.60.7, 8471.60.52 e 8471.60.53 da TIPI, desde que o preço de venda de cada sistema não exceda a R$ 4.000,00 (dois mil' + ' e quinhentos reais)');
    ComboBox8.Items.Add('404 - Venda a varejo de teclado (unidade de entrada) e de mouse (unidade de entrada) classificados, respectivamente, nos códigos 8471.60.52 e 8471.60.53 da TIPI, quando acompanharem a unidade de processamento digital classificada no código 8471.50.10' + ' da TIPI, desde que o preço de venda de cada conjunto não exceda a R$ 2.100,00 (dois mil e cem reais).');
    ComboBox8.Items.Add('405 - PADIS - Programa de Apoio ao Desenvolvimento Tecnológico da Indústria de Semicondutores');
    ComboBox8.Items.Add('406 - PATVD - Programa de Apoio ao Desenvolvimento Tecnológico da Indústria de Equipamentos para a TV Digital');
    ComboBox8.Items.Add('407 - Máquinas automáticas de proc. de dados,portáteis,sem teclado,que tenham uma unidade central de processamento com E/S de dados por meio de uma tela sensível ao toque de área superior a 140cm2 e inferior a 600cm2,e que não possuam função de' + ' comando remoto (Tablet PC), classif. em 8471.41,prod. no País cfe. proc. produtivo básico estab. pelo P. Exec');
    ComboBox8.Items.Add('901 - Papel destinado à impressão de jornais');
    ComboBox8.Items.Add('902 - Papéis classificados nos códigos 4801.00.10, 4801.00.90, 4802.61.91, 4802.61.99, 4810.19.89 e 4810.22.90, todos da TIPI, destinados à impressão de periódicos');
    ComboBox8.Items.Add('903 - Livros, conforme definido no art. 2o da Lei no 10.753/03');
    ComboBox8.Items.Add('904 - Preparações compostas não-alcoólicas, classificadas no código 2106.90.10 Ex 01 da TIPI, destinadas à elaboração de bebidas pelas pessoas jurídicas industriais dos produtos referidos no art. 58-A da Lei no 10.833/2003');
    ComboBox8.Items.Add('905 - Material de defesa, classificado nas posições 87.10.00.00 e 89.06.10.00 da TIPI, além de partes, peças, componentes, ferramentais, insumos, equipamentos e matérias-primas a serem empregados na sua industrialização, montagem, manutenção, ' + 'modernização e conversão');
    ComboBox8.Items.Add('906 - Equipamentos de controle de produção, inclusive medidores de vazão, condutivímetros, aparelhos para controle, registro, gravação e transmissão dos quantitativos medidos, quando adquiridos por pessoas jurídicas legalmente obrigadas à sua ' + 'utilização');
    ComboBox8.Items.Add('907 - Valores pagos ou creditados pelos Estados, Distrito Federal e Municípios relativos ao ICMS e ao ISS, no âmbito de programas de concessão de crédito voltados ao estímulo à solicitação de documento fiscal na aquisição de mercadorias e serviços');
    ComboBox8.Items.Add('908 - Vendas de mercadorias destinadas ao consumo ou à industrialização na Zona Franca de Manaus – ZFM');
    ComboBox8.Items.Add('909 - Vendas de mercadorias destinadas ao consumo ou à industrialização nas Áreas de Livre Comércio – ALC, exceto quando tiver como destinatárias pessoas jurídicas atacadistas e varejistas, sujeitas ao regime de apuração não cumulativa da Contribuição' + ' para o PIS/Pasep e da Cofins');
    ComboBox8.Items.Add('910 - Vendas de matérias-primas, produtos intermediários e materiais de embalagem, produzidos na Zona Franca de Manaus para emprego em processo de industrialização por estabelecimentos industriais ali instalados e consoante projetos aprovados pelo SUFRAMA');
    ComboBox8.Items.Add('911 - Receitas financeiras, inclusive decorrentes de operações realizadas para fins de hedge, auferidas pelas pessoas jurídicas sujeitas ao regime de incidência não-cumulativa');
    ComboBox8.Items.Add('912 - Aquisição no mercado interno ou a importação, de forma combinada ou não, de mercadoria equivalente à empregada ou consumida na industrialização de produto exportado (Drawback Reposição de Estoque)');
    ComboBox8.Items.Add('913 - Projetores para exibição cinematográfica, classificados no código 9007.2 da NCM, e suas partes e acessórios, classificados no código 9007.9 da NCMs');
    ComboBox8.Items.Add('999 - Outros Produtos e Receitas');
  end
  else if (Copy(pCST, 1, 2) = '07') then
  begin
    ComboBox8.Items.Clear;
    ComboBox8.Items.Add('');
    ComboBox8.Items.Add('101 - Fornecimento de mercadorias ou serviços para uso ou consumo de bordo em embarcações e aeronaves em tráfego internacional, quando o pagamento for efetuado em moeda conversível (exceto querosene de aviação)');
    ComboBox8.Items.Add('102 - Transporte internacional de cargas ou passageiros');
    ComboBox8.Items.Add('103 - Receitas auferidas pelos estaleiros navais brasileiros nas atividades de construção, conservação, modernização, conversão e reparo de embarcações pré-registradas ou registradas no Registro Especial Brasileiro (REB), instituído pela Lei nº 9.432,' + ' de 8 de janeiro de 1997');
    ComboBox8.Items.Add('104 - Frete de mercadorias transportadas entre o País e o exterior pelas embarcações registradas no REB, de que trata o art. 11 da Lei nº 9.432, de 1997');
    ComboBox8.Items.Add('201 - Receitas relativas às atividades próprias dos templos de qualquer culto; partidos políticos; instituições de educação e de assistência social que preencham as condições e requisitos do art. 12 da Lei nº 9.532, de 10 de dezembro de 1997; instituições' + ' de caráter filantrópico, recreativo, cultural, científico e as ' + 'associações, que preencham as condições e requisitos do art. 15 da Lei nº 9.532, de 1997; sindicatos, federações e confederações; serviços sociais autônomos, criados ou autorizados por lei; ' + 'conselhos de fiscalização de profissões regulamentadas; fundações de direito privado; condomínios de proprietários de imóveis residenciais ou comerciais; e Organização das Cooperativas Brasileiras (OCB) e as ' + 'Organizações Estaduais de Cooperativas previstas no art. 105 e seu § 1º da Lei nº 5.764, de 16 de dezembro de 1971.');
    ComboBox8.Items.Add('202 - Receitas das entidades beneficentes de assistência social com a finalidade de prestação de serviços nas áreas de assistência social, saúde ou educação, que atendam aos requisitos do art. 29 da Lei nº 12.101, de 27 de novembro de 2009.');
    ComboBox8.Items.Add('301 - Venda de energia elétrica pela Itaipu Binacional');
    ComboBox8.Items.Add('401 - Importação de bens ou mercadorias para uso ou consumo exclusivo na organização e realização dos referidos eventos, promovida pela Fifa, Subsidiária Fifa no Brasil, Confederações Fifa, Associações estrangeiras membros da Fifa, Parceiros Comerciais ' + 'da Fifa domiciliados no exterior, Emissora Fonte da Fifa e Prestadores de Serviço da Fifa domiciliados no exterior, ou por intermédio de pessoa jurídica por eles contratada para representá-los');
    ComboBox8.Items.Add('402 - Receita auferida por Subsidiária Fifa no Brasil, decorrente das atividades próprias e diretamente vinculadas à organização ou realização dos referidos eventos, exceto as receitas decorrentes da venda de ingressos e de pacotes de hospedagem.');
    ComboBox8.Items.Add('403 - Receita das atividades próprias, auferida pelos Prestadores de Serviços da FIFA, estabelecidos no País sob a forma de sociedade com finalidade específica para o desenvolvimento de atividades diretamente relacionadas à realização dos eventos.');
    ComboBox8.Items.Add('901 - Recursos recebidos a título de repasse, oriundos do Orçamento Geral da União, dos Estados, do Distrito Federal e dos Municípios, pelas empresas públicas e sociedades de economia mista');
    ComboBox8.Items.Add('902 - Receita da instituição privada de ensino superior, com fins lucrativos ou sem fins lucrativos não beneficente, que aderir ao Programa Universidade para Todos (Prouni), no período de vigência do termo de adesão, decorrentes da realização de ' + 'atividades de ensino superior, proveniente de cursos de graduação ou cursos seqüenciais de formação específica');
    ComboBox8.Items.Add('999 - Outras receitas com isenção');
  end
  else
  begin
    ComboBox8.Clear;
    ComboBox8.Items.Clear;
    ComboBox8.Text := '';
  end;
  DBComboBox6.Items := ComboBox8.Items;
end;

procedure TFrmCadNBM.spBtAutXMLAdicionarClick(Sender: TObject);
const
  vAlfabeto: string = 'ABCDEFGHIJKLMNOPQRSTUVXYWZ';
var
  vTemp: string;
begin
  inherited;

  if not (Nbm.dataSet.State in [dsInsert, dsEdit]) then
    exit;

  if not InputQuery('NVE', 'Informe o NVE que você deseja adicionar ao NCM', vTemp) then
    Exit;

  try
    vTemp := UpperCase(Trim(vTemp));
    if Trim(vTemp) = '' then
      raise exception.Create('NVE não informado');

    if (Length(Trim(vTemp)) <> 6) then
      raise exception.Create('NVE inválido. O campo deve conter 6 dígitos, os 2 primeiros alfabéticos e os 4 últimos numéricos');

    if (Pos(Copy(vTemp, 1, 1), vAlfabeto) = 0) or (Pos(Copy(vTemp, 2, 1), vAlfabeto) = 0) then
      raise exception.Create('NVE inválido. O campo deve conter 6 dígitos, os 2 primeiros alfabéticos');

    if vDadosIni.apenasNumeros(Copy(vTemp, 3, 4)) <> Copy(vTemp, 3, 4) then
      raise exception.Create('NVE inválido. O campo deve conter 6 dígitos, os 4 últimos numéricos');

    if pos(Trim(vTemp), lbxNVE.Items.Text) > 0 then
      raise exception.Create('NVE já incluído');

    lbxNVE.Items.Add(Trim(vTemp));

  except on E: Exception do
    begin
      Application.MessageBox(Pchar(e.Message), 'Erro', 0 + 64);
    end;
  end;
end;

procedure TFrmCadNBM.spBtAutXMLRemoverClick(Sender: TObject);
begin
  inherited;
  if lbxNVE.ItemIndex <> - 1 then
    lbxNVE.DeleteSelected;
end;

procedure TFrmCadNBM.SpeedButton1Click(Sender: TObject);
var
  vListaTmp: TStringList;
  I: Integer;
begin
  if Nbm.dataSet.IsEmpty then
  	Exit;

  if not vDadosIni.PesqPros('PRO052', 'ALTERAR', '', 'NBM', Nbm.dataSet.FieldByName('COD_NCM').AsString, Nbm.buscas, true) then
  	Exit;

  if not Nbm.Edit then
    Exit;

  inherited;
  
  for I := 0 to ComponentCount - 1 do
   	if (Components[I] is TScrollBox) then
    	TScrollBox(Components[I]).VertScrollBar.Position := 0;

  TabSheet4.TabVisible := false;
  TabSheet2.TabVisible := false;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  TabSheet1.Visible := true;
  TabSheet2.Visible := false;
  TabSheet3.TabVisible := true;
  TabSheet3.Visible := true;

  Memo1.Lines.Text := Nbm.vTextoInfComplementar.Text;
  ComboBox9.Text := '';
  ComboBox9.Items[Nbm.dataSet.FieldByName('MODBCST').AsInteger];
  ComboBox9.Text := Nbm.dataSet.FieldByName('MODBCST').AsString;
  if Nbm.dataSet.FieldByName('MODBCST').AsInteger = 4 then
  begin
    Nbm.dataSet.FieldByName('VLBCST').AsFloat := 0;
    DBEdit2.Enabled := true and (not Fnf_icmsst_cest_v2);
    DBEdit9.Enabled := true and (not Fnf_icmsst_cest_v2);
    DBEdit18.Enabled := false and (not Fnf_icmsst_cest_v2);
  end
  else
  begin
    Nbm.dataSet.FieldByName('MVA').AsFloat := 0;
    Nbm.dataSet.FieldByName('MVA_INTER').AsFloat := 0;
    DBEdit2.Enabled := false and (not Fnf_icmsst_cest_v2);
    DBEdit9.Enabled := false and (not Fnf_icmsst_cest_v2);
    DBEdit18.Enabled := true and (not Fnf_icmsst_cest_v2);
  end;
  vListaTmp := TStringList.Create;
  vListaTmp := vDadosIni.Split(
    vDadosIni.retornoPorCondicao(Copy(Nbm.dataSet.FieldByName('NVE').AsString,1,1) = '|',
    Copy(Nbm.dataSet.FieldByName('NVE').AsString, 2, Length(Nbm.dataSet.FieldByName('NVE').AsString)),
    Nbm.dataSet.FieldByName('NVE').AsString));
  lbxNVE.Items.Text := vListaTmp.Text;

  if DBEdit3.CanFocus then
    DBEdit3.SetFocus;
end;

procedure TFrmCadNBM.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not Nbm.dataSet.IsEmpty then
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
      if vDadosIni.PesqPros('PRO053', 'EXLUIR', '', 'NBM', Nbm.dataSet.FieldByName('COD_NCM').AsString, Nbm.buscas, true) then
//      if vDadosIni.PesqPros('PRO053', Nbm.dataSet.FieldByName('COD_NCM').AsString, Nbm.buscas, true)
//        then
      begin
        if Nbm.Delete then
          if Nbm.Apply then
            if Nbm.emTransacao then
              Nbm.CommitaTransacao;
      end;

  Nbm.Refresh;
end;

procedure TFrmCadNBM.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO058', 'ACESSAR', '', 'NBM', '', Nbm.buscas, true) then
//  if vDadosIni.PesqPros('PRO058', '', Nbm.buscas, true) then
  begin
    PageControl1.ActivePage := TabSheet1;
    TabSheet3.TabVisible := false;
    TabSheet2.TabVisible := false;
    TabSheet2.Visible := false;
    TabSheet1.Visible := true;
    PageControl3.ActivePage := TabSheet4;
    TabSheet4.TabVisible := true;
    TabSheet4.Visible := true;
    Panel3.Visible := false;
    DBGrid2.SetFocus;
  end;
end;

procedure TFrmCadNBM.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO161', 'ACESSAR', '', 'NBM', '', Nbm.buscas, true) then
    Exit;


  SpeedButton9.Click;//aqui ja cria o Fncm_manut e copia os dados do ncm
  try
    vDadosIni.abreForm('Alteração de dados fiscais em lote', pnDadosFiscais, opFormsDefCad);
  finally
    FreeAndNil(Fncm_manut); 
  end;

//  if vDadosIni.PesqPros('PRO161', 'ACESSAR', '', 'NBM', '', Nbm.buscas, true) then
//  if vDadosIni.PesqPros('PRO161', '', Nbm.buscas, true) then
//    Nbm.abreFormDefinirMVA;
end;

procedure TFrmCadNBM.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO265', 'ALTERAR', '', 'NBM', '', Nbm.buscas, True) then
    AtualizaImposto(pchar(vDadosIni.vBancoHW), pchar(vDadosIni.codEmpresa));
end;

procedure TFrmCadNBM.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO179', 'ALTERAR', '', 'NBM', '', Nbm.buscas, True) then
    AtualizaAnexoXV(pchar(vDadosIni.vBancoHW));
end;

procedure TFrmCadNBM.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  Fncm_manut := TNBM_ManutencaoDados.Create(Nbm);

  with Fncm_manut.dadosNCM do
  begin
    edmva.AsValue                      := mva;
    edmva_inter.AsValue                := mva_inter;
    edaliq_intra.AsValue               := aliq_intra;
    edfcp_aliq.AsValue                 := fcp_aliq;
    edcest.Text                        := cest;
    edcst_piscofins.Text               := cst_pis;
    edcst_piscofins.Text               := cst_cofins;
    edcst_piscofins_ent.Text           := cst_pis_ent;
    edcst_piscofins_ent.Text           := cst_cofins_ent;
    ednat_rec.Text                     := nat_rec;
    edaliq_pis_diferenciada.AsValue    := aliq_pis_diferenciada;
    edaliq_cofins_diferenciada.AsValue := aliq_cofins_diferenciada;
    edaliq_cred_pis.AsValue            := aliq_cred_pis;
    edaliq_cred_cofins.AsValue         := aliq_cred_cofins;
    edcenq_ipi_nfe.Text                := cenq_ipi_nfe;
  end;
end;

procedure TFrmCadNBM.TabSheet4Exit(Sender: TObject);
begin
  inherited;
//  panel3.Visible := true;
end;

procedure TFrmCadNBM.TabSheet4Show(Sender: TObject);
begin
  inherited;
  Nbm.NbmUF.abreNbmUF;
  DtmProdutos.qrNBMEStados.Open;
  BitBtn8.Enabled := false;
  BitBtn10.Enabled := false;
end;

end.

