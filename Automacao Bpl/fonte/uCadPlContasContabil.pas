unit uCadPlContasContabil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, uClassesCIAP, DBCtrls, Spin, AppEvnts, DB;

type
  TfrmPlContasContabil = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    tsModGrupo: TTabSheet;
    pnModGrupo: TPanel;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    SpinEdit1: TSpinEdit;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    Panel5: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    tsImportacao: TTabSheet;
    pnImportacao: TPanel;
    GroupBox5: TGroupBox;
    Panel6: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Label7: TLabel;
    OpenDialog1: TOpenDialog;
    GroupBox6: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label17: TLabel;
    Label18: TLabel;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    Label19: TLabel;
    Label20: TLabel;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    Label21: TLabel;
    Label22: TLabel;
    SpinEdit8: TSpinEdit;
    SpinEdit9: TSpinEdit;
    Label23: TLabel;
    Label24: TLabel;
    SpinEdit10: TSpinEdit;
    SpinEdit11: TSpinEdit;
    Label25: TLabel;
    Label26: TLabel;
    BitBtn11: TBitBtn;
    tsLog: TTabSheet;
    pnLog: TPanel;
    Memo2: TMemo;
    BitBtn12: TBitBtn;
    Memo1: TMemo;
    tsCSTRel: TTabSheet;
    pnCSTRel: TPanel;
    GroupBox7: TGroupBox;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    BitBtn142: TBitBtn;
    BitBtn143: TBitBtn;
    BitBtn144: TBitBtn;
    BitBtn140: TBitBtn;
    pnCSTCadastro: TPanel;
    Panel127: TPanel;
    BitBtn148: TBitBtn;
    BitBtn149: TBitBtn;
    Label27: TLabel;
    Label29: TLabel;
    DBEdit5: TDBEdit;
    Label30: TLabel;
    DBEdit7: TDBEdit;
    DBComboBox3: TDBComboBox;
    DBRadioGroup1: TDBRadioGroup;
    tsDRE: TTabSheet;
    pnConfigDRE: TPanel;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    Panel8: TPanel;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Panel9: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    GroupBox10: TGroupBox;
    DBEdit2: TDBEdit;
    SpeedButton16: TSpeedButton;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    DBRadioGroup4: TDBRadioGroup;
    pnEscolhaConta: TPanel;
    GroupBox11: TGroupBox;
    Panel10: TPanel;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    DataSource1: TDataSource;
    BitBtn19: TBitBtn;
    DBGrid4: TDBGrid;
    DataSource2: TDataSource;
    PopupMenu3: TPopupMenu;
    Definircor1: TMenuItem;
    Fundo1: TMenuItem;
    Fonte1: TMenuItem;
    DetalhesOLAP1: TMenuItem;
    DetalhesdoRegistro1: TMenuItem;
    ColorDialog1: TColorDialog;
    BitBtn20: TBitBtn;
    DBComboBox4: TDBComboBox;
    Label28: TLabel;
    Label31: TLabel;
    DBEdit4: TDBEdit;
    Label32: TLabel;
    DBEdit8: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    SpinEdit12: TSpinEdit;
    SpinEdit13: TSpinEdit;
    procedure pnConfigDREEnter(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure GroupBox10Exit(Sender: TObject);
    procedure GroupBox10Enter(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure Fonte1Click(Sender: TObject);
    procedure Fundo1Click(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn144Click(Sender: TObject);
    procedure BitBtn143Click(Sender: TObject);
    procedure BitBtn142Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn140Click(Sender: TObject);
    procedure BitBtn148Click(Sender: TObject);
    procedure BitBtn149Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fUltimaFormulaValida: string;
    procedure formConfigDRECloseQuery(Sender: TObject; var CanClose: Boolean);
  public
    { Public declarations }
  end;

var
  frmPlContasContabil: TfrmPlContasContabil;
  obPlContasC: TPlanoContasContabil;

implementation

uses uDtmCIAP, uDtmAtivo, uDadosIni, uDataSet_OOP, DBClient;

{$R *.dfm}

procedure TfrmPlContasContabil.BitBtn10Click(Sender: TObject);
begin
  inherited;
  TForm(pnImportacao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmPlContasContabil.BitBtn11Click(Sender: TObject);
begin
  inherited;
  obPlContasC.vLayoutarquivo.CodCTA_Pos := SpinEdit2.Value;
  obPlContasC.vLayoutarquivo.CodCTA_Tamanho := SpinEdit3.Value;
  obPlContasC.vLayoutarquivo.NomeCTA_Pos := SpinEdit4.Value;
  obPlContasC.vLayoutarquivo.NomeCTA_Tamanho := SpinEdit5.Value;
  obPlContasC.vLayoutarquivo.NatCTA_Pos := SpinEdit6.Value;
  obPlContasC.vLayoutarquivo.NatCTA_Tamanho := SpinEdit7.Value;
  obPlContasC.vLayoutarquivo.IndCTA_Pos := SpinEdit8.Value;
  obPlContasC.vLayoutarquivo.IndCTA_Tamanho := SpinEdit9.Value;
  obPlContasC.vLayoutarquivo.NivelCTA_Pos := SpinEdit10.Value;
  obPlContasC.vLayoutarquivo.NivelCTA_Tamanho := SpinEdit11.Value;
  obPlContasC.vLayoutarquivo.RefRFBCTA_Pos := SpinEdit12.Value;
  obPlContasC.vLayoutarquivo.RefRFBCTA_Tamanho := SpinEdit13.Value;
  obPlContasC.vLayoutarquivo.memoImport := TMemo(Memo1);
  obPlContasC.vLayoutarquivo.memoLog := TMemo(Memo2);
  obPlContasC.importarArquivoTexto(Label7.Caption);
end;

procedure TfrmPlContasContabil.BitBtn12Click(Sender: TObject);
begin
  inherited;
  TForm(pnLog.Parent).ModalResult := IDOK;
end;

procedure TfrmPlContasContabil.BitBtn13Click(Sender: TObject);
begin
  inherited;
  obPlContasC.removerConfiguracaoSelecionadaDRE;
end;

procedure TfrmPlContasContabil.BitBtn140Click(Sender: TObject);
begin
  inherited;
  TForm(pnCSTRel.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmPlContasContabil.BitBtn142Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('SPED082','INCLUIR', '','RELACAO_CST_PIS_PCONTAS','',obPlContasC.buscas,False) then
    Exit;
  if obPlContasC.vCstRel.Insert then
    obPlContasC.abreFormCadastrRelacaoCST;
end;

procedure TfrmPlContasContabil.BitBtn143Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('SPED083','ALTERAR', '','RELACAO_CST_PIS_PCONTAS','',obPlContasC.buscas,False) then
    Exit;
  if obPlContasC.vCstRel.Edit then
    obPlContasC.abreFormCadastrRelacaoCST;
end;

procedure TfrmPlContasContabil.BitBtn144Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('SPED084','EXCLUIR', '','RELACAO_CST_PIS_PCONTAS','',obPlContasC.buscas,False) then
    Exit;
  obPlContasC.vCstRel.Delete;
end;

procedure TfrmPlContasContabil.BitBtn148Click(Sender: TObject);
begin
  inherited;
  
  if not vDadosIni.PesqPros('SPED085','SALVAR', '','RELACAO_CST_PIS_PCONTAS','',obPlContasC.buscas,False) then
    Exit;

  if obPlContasC.vCstRel.Post then
    TForm(pnCSTCadastro.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(obPlContasC.vCstRel.vNomeCampoErro);
end;

procedure TfrmPlContasContabil.BitBtn149Click(Sender: TObject);
begin
  inherited;
  obPlContasC.vCstRel.Cancel;
  TForm(pnCSTCadastro.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmPlContasContabil.BitBtn14Click(Sender: TObject);
begin
  inherited;
  try

    DBGrid4.DataSource := DBGrid1.DataSource;
    if not vDadosIni.abreForm('Selecione a conta desejada para configura-la', pnEscolhaConta, tsDRE) then
      Exit;

    obPlContasC.adicionarConfiguracaoSelecionadaDRE(tdAbaixo);

  finally
    
  end;
end;

procedure TfrmPlContasContabil.BitBtn16Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    BitBtn16.Enabled := False;

    obPlContasC.salvarConfiguracaoDRE;

  finally
    BitBtn16.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPlContasContabil.BitBtn19Click(Sender: TObject);
begin
  inherited;
  try

    DBGrid4.DataSource := DBGrid1.DataSource;
    if not vDadosIni.abreForm('Selecione a conta desejada para configura-la', pnEscolhaConta, tsDRE) then
      Exit;

    obPlContasC.adicionarConfiguracaoSelecionadaDRE(tdAcima);

  finally

  end;
end;

procedure TfrmPlContasContabil.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('SPED061','CONSULTA','','P_CONTAS_CONTABIL','',obPlContasC.buscas,False) then
    Exit;
  if MaskEdit2.Visible then
  begin
    if not obPlContasC.ConsultaCampos('P_CONTAS_CONTABIL', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if obPlContasC.ConsultaCampos('P_CONTAS_CONTABIL', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmPlContasContabil.BitBtn20Click(Sender: TObject);
begin
  inherited;
  try
    if obPlContasC.configDRE.IsEmpty then
      Exit;

    if ActiveControl <> BitBtn20 then
    	if (Self.Enabled) and (Self.Visible) and (BitBtn20.CanFocus) then
      	BitBtn20.SetFocus;

    DataSource2.DataSet := obPlContasC.espConfigDRE;
    DBGrid4.DataSource := DataSource2;
    obPlContasC.espConfigDRE.IndexFieldNames := 'ESTRUTURADRE';
    if not vDadosIni.abreForm('Selecione a conta desejada para incluir na fórmula', pnEscolhaConta, [ofAlignAllClientWinCtrl]) then
      Exit;

    if obPlContasC.configDRE.State = dsBrowse then
      obPlContasC.configDRE.Edit;

    obPlContasC.configDRE.FieldByName('FORMULA').AsString :=
      obPlContasC.configDRE.FieldByName('FORMULA').AsString + '@' + obPlContasC.espConfigDRE.FieldByName('COD_CTA').AsString + '@';
  finally
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
    DBEdit2.SelStart := Length(DBEdit2.Text);
  end;
end;

procedure TfrmPlContasContabil.BitBtn3Click(Sender: TObject);
begin
  ActiveControl := BitBtn3;
  if not obPlContasC.Insert then
    exit;
  inherited;

  obPlContasC.ExecutaComandosSql(
    'select null cod_contador, ''Nenhum'' nome_cont, null nome_escritorio from rdb$database' +
    ' union' +
    ' select cr.cod_contador, cr.nome_cont, cr.nome_escritorio from contador cr' +
    ' where cr.cod_empresa = ' + vDadosIni.codEmpresa + ' order by 1',  False);
  obPlContasC.lkContador.setDadosDataSet('COD_CONTADOR', 'NOME_CONT', obPlContasC.buscas, DBLookupComboBox1);

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmPlContasContabil.BitBtn4Click(Sender: TObject);
begin
  if not obPlContasC.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obPlContasC.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 2 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if obPlContasC.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmPlContasContabil.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obPlContasC.Cancel;
  if TelaCadastro = 2 then
  begin
    BitBtn6.Click;
    Exit;
  end;
end;

procedure TfrmPlContasContabil.BitBtn7Click(Sender: TObject);
begin
  inherited;
  TForm(pnModGrupo.Parent).ModalResult := IDOK;
end;

procedure TfrmPlContasContabil.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnModGrupo.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmPlContasContabil.BitBtn9Click(Sender: TObject);
begin
  inherited;
  TForm(pnImportacao.Parent).ModalResult := IDOK;
end;

procedure TfrmPlContasContabil.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    if obPlContasC.vCstRel.dataSet.State in [dsEdit, dsInsert] then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
      if vDadosIni.vPesquisa <> '' then
        TDBEdit(Sender).DataSource.DataSet.FieldByName(TDBEdit(Sender).DataField).AsString :=
          vDadosIni.vPesquisa;
    end;
end;

procedure TfrmPlContasContabil.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  SpeedButton1.Click;
end;

procedure TfrmPlContasContabil.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
  	SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
  	BitBtn3Click(Sender);
end;

procedure TfrmPlContasContabil.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if obPlContasC.configDRE.IsEmpty then
    Exit;

  if not (gdFocused in State) then
  begin
    if not (obPlContasC.configDRE.FieldByName('nivel').AsInteger = obPlContasC.MaxNivel) then
      TDBGrid(sender).canvas.Font.Style := [fsBold];
    TDBGrid(sender).canvas.Brush.Color := obPlContasC.getCorPersonalizadaFundo(obPlContasC.configDRE.FieldByName('nivel').AsInteger);
    TDBGrid(sender).canvas.Font.Color := obPlContasC.getCorPersonalizadaFonte(obPlContasC.configDRE.FieldByName('nivel').AsInteger);
    TDBGrid(sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmPlContasContabil.DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if obPlContasC.espConfigDRE.IsEmpty then
    Exit;

  if not (gdFocused in State) then
  begin
    if not (obPlContasC.espConfigDRE.FieldByName('nivel').AsInteger = obPlContasC.MaxNivel) then
      TDBGrid(sender).canvas.Font.Style := [fsBold];
    TDBGrid(sender).canvas.Brush.Color := obPlContasC.getCorPersonalizadaFundo(obPlContasC.espConfigDRE.FieldByName('nivel').AsInteger);
    TDBGrid(sender).canvas.Font.Color := obPlContasC.getCorPersonalizadaFonte(obPlContasC.espConfigDRE.FieldByName('nivel').AsInteger);
    TDBGrid(sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmPlContasContabil.DBGrid4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn18.Click;
end;

procedure TfrmPlContasContabil.DBGrid4TitleClick(Column: TColumn);
begin
  inherited;
  obPlContasC.dataSet.IndexFieldNames := Column.FieldName;
end;

procedure TfrmPlContasContabil.Fonte1Click(Sender: TObject);
begin
  inherited;
  try
    if ColorDialog1.Execute then
      obPlContasC.setCorPersonalizadaFonte(obPlContasC.espConfigDRE.FieldByName('nivel').AsInteger, ColorDialog1.Color);
  except
  end;
end;

procedure TfrmPlContasContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obPlContasC.Free;
  obPlContasC := nil;
  Action := caFree;
  frmPlContasContabil := nil;
end;

procedure TfrmPlContasContabil.formConfigDRECloseQuery(Sender: TObject; var CanClose: Boolean);
var
  vResposta: Integer;
begin
  if obPlContasC.configDRE.State in [dsEdit, dsInsert] then
    obPlContasC.configDRE.Post;
  if obPlContasC.configDREsofreuAlteracao then
  begin
    vResposta := Application.MessageBox('Foram feitas alterações. Deseja salvar?', 'Confirmação', MB_ICONQUESTION + MB_YESNOCANCEL);
    if vResposta = IDCANCEL then
      CanClose := False
    else if vResposta = IDYES then
      if obPlContasC.salvarConfiguracaoDRE then
        CanClose := True
      else
        CanClose := False;
  end;
  if CanClose then
    TForm(pnConfigDRE.Parent).WindowState := wsNormal;
end;

procedure TfrmPlContasContabil.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obPlContasC := TPlanoContasContabil.Create;
  obPlContasC.abrePlanoContasContabil;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  tsModGrupo.TabVisible := false;
  tsImportacao.TabVisible := false;
  tsLog.TabVisible := false;
  tsCSTRel.TabVisible := false;
  tsDRE.TabVisible := false;


  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmPlContasContabil.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmCIAP.dsPlContasC;
    inherited;
  	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if obPlContasC.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
  MaskEdit3.CharCase := ecNormal;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmPlContasContabil.Fundo1Click(Sender: TObject);
begin
  inherited;
  try
    if ColorDialog1.Execute then
      obPlContasC.setCorPersonalizadaFundo(obPlContasC.configDRE.FieldByName('nivel').AsInteger, ColorDialog1.Color);
  except
  end;
end;

procedure TfrmPlContasContabil.GroupBox10Enter(Sender: TObject);
begin
  inherited;
  fUltimaFormulaValida := obPlContasC.configDRE.FieldByName('FORMULA').AsString;
end;

procedure TfrmPlContasContabil.GroupBox10Exit(Sender: TObject);
begin
  inherited;
  if not obPlContasC.formulaValida then
  begin
    if obPlContasC.configDRE.State = dsBrowse then
      obPlContasC.configDRE.Edit;

    obPlContasC.configDRE.FieldByName('FORMULA').AsString := fUltimaFormulaValida;
  end;
end;

procedure TfrmPlContasContabil.pnConfigDREEnter(Sender: TObject);
begin
  inherited;
  TForm(pnConfigDRE.Parent).OnCloseQuery := formConfigDRECloseQuery;
end;

procedure TfrmPlContasContabil.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  obPlContasC.moverConfiguracaoDRE(tdAbaixo);
end;

procedure TfrmPlContasContabil.SpeedButton11Click(Sender: TObject);
var
  vTmp: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('SPED092', 'CONFIGURAR','','P_CONTAS_CONTABIL', '',obPlContasC.buscas,False) then
      Exit;

    vTmp := '';

    if not obPlContasC.iniciarConfiguracaoDREComparativo then
      Exit;

    DataSource1.DataSet := obPlContasC.configDRE;

    vTmp := obPlContasC.dataSet.IndexName;

    if not vDadosIni.abreForm('Configuração DRE Coparativo', pnConfigDRE, [ofAlignAllClientWinCtrl]) then
      Exit;

  finally
    obPlContasC.dataSet.IndexFieldNames := '';
    if vTmp <> '' then
      obPlContasC.dataSet.IndexName := vTmp;

    DataSource1.DataSet := nil;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPlContasContabil.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  obPlContasC.moverConfiguracaoDRE(tdEsquerda);
end;

procedure TfrmPlContasContabil.SpeedButton14Click(Sender: TObject);
begin
  inherited;
    obPlContasC.moverConfiguracaoDRE(tdDireira);
end;

procedure TfrmPlContasContabil.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  obPlContasC.formulaValida;
end;

procedure TfrmPlContasContabil.SpeedButton1Click(Sender: TObject);
begin
  if obPlContasC.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;
  inherited;
  if not obPlContasC.Edit then
    exit;

  obPlContasC.ExecutaComandosSql(
    'select null cod_contador, ''Nenhum'' nome_cont, null nome_escritorio from rdb$database' +
    ' union' +
    ' select cr.cod_contador, cr.nome_cont, cr.nome_escritorio from contador cr' +
    ' where cr.cod_empresa = ' + vDadosIni.codEmpresa,  False);
  obPlContasC.lkContador.setDadosDataSet('COD_CONTADOR', 'NOME_CONT', obPlContasC.buscas, DBLookupComboBox1);

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmPlContasContabil.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not obPlContasC.AbrirLixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED065]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [SPED064]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmPlContasContabil.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if obPlContasC.Delete then
  begin
    if obPlContasC.StatusLixeira then
      lixeiraVazia(false)
    else
      lixeiraVazia(true);
  end;
end;

procedure TfrmPlContasContabil.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if obPlContasC.restauraLixeira then
  begin
    if obPlContasC.StatusLixeira then
      lixeiraVazia(false)
    else
      lixeiraVazia(true);
  end;
end;

procedure TfrmPlContasContabil.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  obPlContasC.abreFormModificarDadosEmGrupo;
end;

procedure TfrmPlContasContabil.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('SPED081','CONSULTA','','RELACAO_CST_PIS_PCONTAS','',obPlContasC.buscas,False) then
    Exit;
  obPlContasC.abreFormRelacaoCST;
end;

procedure TfrmPlContasContabil.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    Label7.Caption := OpenDialog1.FileName;
    obPlContasC.abreFormImportacao;
    //    obPlContasC.importarArquivoTexto(OpenDialog1.FileName);
  end;
end;

procedure TfrmPlContasContabil.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  obPlContasC.moverConfiguracaoDRE(tdAcima);
end;

end.

