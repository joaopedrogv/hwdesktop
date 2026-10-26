unit uCadOperacaoFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons,
  Grids, DBGrids, Mask, DBCtrls, uEditHw, Contnrs, uDataSet_OOP, CheckLst;

type
  TfrmCadOperacaoFiscal = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    pn_cadastro: TPanel;
    ck_lixeira: TCheckBox;
    pageOpfiscal: TPageControl;
    tsIcms: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    ed_id: TDBEdit;
    ed_descr: TDBEdit;
    pn_icms_cadastro: TPanel;
    Panel7: TPanel;
    ed_icms_tributacao: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    ed_icms_deson: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    gpIcmsInter: TGroupBox;
    Panel10: TPanel;
    pn_icms_cadastro_inter: TPanel;
    Panel17: TPanel;
    Label13: TLabel;
    ed_inter_picms: TEditHw;
    Panel18: TPanel;
    Label17: TLabel;
    ed_inter_pfcp: TEditHw;
    Panel19: TPanel;
    Label18: TLabel;
    ed_inter_predbc: TEditHw;
    Panel20: TPanel;
    Label19: TLabel;
    ed_inter_pdif: TEditHw;
    Panel21: TPanel;
    Label20: TLabel;
    ed_inter_pfcpdif: TEditHw;
    Panel22: TPanel;
    ed_inter_ufs: TListBox;
    Panel23: TPanel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Panel5: TPanel;
    bt_icms_cadastro_intra: TSpeedButton;
    pn_icms_cadastro_intra: TPanel;
    Panel8: TPanel;
    Label10: TLabel;
    ed_intra_picms: TEditHw;
    Panel9: TPanel;
    Label11: TLabel;
    ed_intra_pfcp: TEditHw;
    Panel11: TPanel;
    Label12: TLabel;
    ed_intra_predbc: TEditHw;
    Panel12: TPanel;
    Label14: TLabel;
    ed_intra_pdif: TEditHw;
    Panel13: TPanel;
    Label15: TLabel;
    ed_intra_pfcpdif: TEditHw;
    Panel16: TPanel;
    Label16: TLabel;
    ed_intra_cfop: TEditHw;
    Panel14: TPanel;
    bt_icms_cadastro_exterior: TSpeedButton;
    pn_icms_cadastro_exterior: TPanel;
    Panel25: TPanel;
    Label22: TLabel;
    ed_exterior_picms: TEditHw;
    Panel26: TPanel;
    Label23: TLabel;
    ed_exterior_pfcp: TEditHw;
    Panel27: TPanel;
    Label24: TLabel;
    ed_exterior_predbc: TEditHw;
    Panel28: TPanel;
    Label25: TLabel;
    ed_exterior_pdif: TEditHw;
    Panel29: TPanel;
    Label26: TLabel;
    ed_exterior_pfcpdif: TEditHw;
    Panel30: TPanel;
    Label27: TLabel;
    ed_exterior_cfop: TEditHw;
    bt_icms_cadastro: TSpeedButton;
    bt_piscofins_cadastro: TSpeedButton;
    pn_icms_cadastro_inter_botoes: TPanel;
    bt_icms_cadastro_inter_ante: TSpeedButton;
    bt_icms_cadastro_inter_prox: TSpeedButton;
    bt_icms_cadastro_inter_excluir: TSpeedButton;
    bt_icms_cadastro_inter_adiciona: TSpeedButton;
    pn_icms_cadastro_inter_cfop: TPanel;
    Label21: TLabel;
    ed_inter_cfop: TEditHw;
    bt_icms_cadastro_inter_cancela: TSpeedButton;
    bt_icms_cadastro_inter_salva: TSpeedButton;
    bt_icms_cadastro_inter_editar: TSpeedButton;
    bt_icms_cadastro_inter: TSpeedButton;
    pn_icms_cadastro_inter_desfazer: TPanel;
    pn_piscofins_cadastro: TPanel;
    GroupBox6: TGroupBox;
    Panel6: TPanel;
    DBGrid2: TDBGrid;
    Panel15: TPanel;
    GroupBox7: TGroupBox;
    Panel24: TPanel;
    DBGrid3: TDBGrid;
    pn_condicionais_opcionais_top: TPanel;
    ScrollBox4: TScrollBox;
    Panel32: TPanel;
    Panel33: TPanel;
    bt_cond_add_cid: TSpeedButton;
    ed_cond_cidade: TDBLookupComboBox;
    Panel34: TPanel;
    bt_cond_add_final: TSpeedButton;
    Panel35: TPanel;
    bt_cond_add_contrib: TSpeedButton;
    ed_cond_contrib: TComboBox;
    Panel36: TPanel;
    bt_cond_add_consfinal: TSpeedButton;
    Panel37: TPanel;
    bt_cond_add_pessoa: TSpeedButton;
    ed_cond_pessoa: TComboBox;
    Panel38: TPanel;
    bt_cond_add_tipoitem: TSpeedButton;
    ed_cond_tipo_item: TComboBox;
    Panel39: TPanel;
    bt_cond_add_tiponf: TSpeedButton;
    ed_cond_tipo_nf: TComboBox;
    Panel31: TPanel;
    bt_cond_add_uf: TSpeedButton;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    ed_cond_finalidade: TDBLookupComboBox;
    ed_cond_consfinal: TComboBox;
    ed_cond_estados: TMaskEdit;
    Panel40: TPanel;
    Label41: TLabel;
    ed_ncm_ini: TMaskEdit;
    Panel41: TPanel;
    Label42: TLabel;
    ed_ncm_fim: TMaskEdit;
    Panel42: TPanel;
    bt_ncm_add: TSpeedButton;
    bt_ncm_del: TSpeedButton;
    bt_cond_del: TSpeedButton;
    bt_cond_edit_uf: TSpeedButton;
    Panel43: TPanel;
    bt_cond_add_cst_icms: TSpeedButton;
    ed_cond_cst_icms: TComboBox;
    Panel44: TPanel;
    bt_cond_add_cst_pis_sai: TSpeedButton;
    ed_cond_cst_pis_sai: TComboBox;
    Label34: TLabel;
    Label40: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label44: TLabel;
    Label43: TLabel;
    Label39: TLabel;
    Label38: TLabel;
    lb_data_cad: TDBText;
    Label45: TLabel;
    lb_data_mod: TDBText;
    Label46: TLabel;
    tsOutras: TTabSheet;
    GroupBox9: TGroupBox;
    Panel46: TPanel;
    CheckListBox2: TCheckListBox;
    CheckBox4: TCheckBox;
    GroupBox8: TGroupBox;
    Panel45: TPanel;
    ck_icms_base: TCheckListBox;
    ed_icms_ent_sai: TComboBox;
    Label48: TLabel;
    Label50: TLabel;
    bt_icms_config: TSpeedButton;
    ck_icms_base_hab: TCheckBox;
    ed_memo: TMemo;
    Panel47: TPanel;
    Panel48: TPanel;
    GroupBox10: TGroupBox;
    Panel49: TPanel;
    Label54: TLabel;
    ck_pc_base: TCheckListBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    ed_pc_cst: TDBLookupComboBox;
    ed_pc_deson: TDBLookupComboBox;
    ed_pc_ppis: TEditHw;
    ed_pc_pcofins: TEditHw;
    ed_pc_natrec: TMaskEdit;
    Panel50: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    ed_pc_modelo: TComboBox;
    ed_pc_ent_sai: TComboBox;
    ck_pc_base_hab: TCheckBox;
    Panel51: TPanel;
    bt_pc_config: TSpeedButton;
    Panel52: TPanel;
    Panel53: TPanel;
    Label47: TLabel;
    ed_icms_modelo: TComboBox;
    Panel54: TPanel;
    Label51: TLabel;
    ed_icms_trib: TComboBox;
    Label49: TLabel;
    TabSheet4: TTabSheet;
    Label55: TLabel;
    ed_cod_inf: TDBLookupComboBox;
    TabSheet8: TTabSheet;
    grid_prod: TDBGrid;
    Panel55: TPanel;
    SpeedButton9: TSpeedButton;
    TabSheet7: TTabSheet;
    bt_rettrib_cadastro: TSpeedButton;
    pn_rettrib_cadastro: TPanel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    ed_ret_pir: TEditHw;
    ed_ret_pcsll: TEditHw;
    Panel57: TPanel;
    ed_ret_ppis: TEditHw;
    ed_ret_pcofins: TEditHw;
    Label56: TLabel;
    usarNCMProdutoPanel: TPanel;
    ncmProdutoEmEdicaoLabel: TLabel;
    procedure usarNCMProdutoPanelClick(Sender: TObject);
    procedure bt_rettrib_cadastroClick(Sender: TObject);
    procedure pageOpfiscalChange(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure bt_pc_configClick(Sender: TObject);
    procedure ck_pc_baseClickCheck(Sender: TObject);
    procedure ck_pc_base_habClick(Sender: TObject);
    procedure ed_pc_modeloChange(Sender: TObject);
    procedure bt_icms_configClick(Sender: TObject);
    procedure ed_icms_modeloChange(Sender: TObject);
    procedure ck_icms_baseClickCheck(Sender: TObject);
    procedure ck_icms_base_habClick(Sender: TObject);
    procedure bt_cond_add_cst_pis_saiClick(Sender: TObject);
    procedure bt_cond_add_cst_icmsClick(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_cond_edit_ufClick(Sender: TObject);
    procedure bt_cond_add_ufClick(Sender: TObject);
    procedure bt_cond_add_cidClick(Sender: TObject);
    procedure bt_cond_add_finalClick(Sender: TObject);
    procedure bt_cond_add_contribClick(Sender: TObject);
    procedure bt_cond_add_consfinalClick(Sender: TObject);
    procedure bt_cond_add_pessoaClick(Sender: TObject);
    procedure bt_cond_add_tipoitemClick(Sender: TObject);
    procedure bt_cond_add_tiponfClick(Sender: TObject);
    procedure bt_cond_delClick(Sender: TObject);
    procedure bt_ncm_addClick(Sender: TObject);
    procedure bt_ncm_delClick(Sender: TObject);
    procedure bt_piscofins_cadastroClick(Sender: TObject);
    procedure pn_icms_cadastro_inter_desfazerClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure bt_icms_cadastro_inter_editarClick(Sender: TObject);
    procedure bt_icms_cadastro_inter_salvaClick(Sender: TObject);
    procedure bt_icms_cadastro_interClick(Sender: TObject);
    procedure bt_icms_cadastro_inter_cancelaClick(Sender: TObject);
    procedure bt_icms_cadastro_inter_anteClick(Sender: TObject);
    procedure bt_icms_cadastro_inter_proxClick(Sender: TObject);
    procedure bt_icms_cadastro_inter_excluirClick(Sender: TObject);
    procedure bt_icms_cadastro_intraClick(Sender: TObject);
    procedure bt_icms_cadastro_inter_adicionaClick(Sender: TObject);
    procedure bt_icms_cadastroClick(Sender: TObject);
    procedure bt_icms_cadastro_exteriorClick(Sender: TObject);
    procedure pn_cadastroEnter(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  strict private
    lkCstIcms: TDadosLookUp_OOP;
    lkCstPC: TDadosLookUp_OOP;
    lkDeson: TDadosLookUp_OOP;
    lkCidades: TDadosLookUp_OOP;
    lkFinalidades: TDadosLookUp_OOP;
    lkInfCompl: TDadosLookUp_OOP;
    FopfEditId: Integer;
    FncmProduto: string;
  private
    indexInter: Integer;
    listInter: TObjectList;
    procedure buildCadastro(inEdit: Boolean);
    procedure buildCadastroIcms();
    procedure buildCadastroIcmsBase();
    procedure buildCadastroIcmsIntra();
    procedure buildCadastroIcmsInter();
    procedure buildCadastroIcmsExterior();
    procedure buildCadastroPisCofins();
    procedure buildCadastroPisCofinsBase();
    procedure buildCadastroRetTrib();
    procedure clearCadastroCondicoes();

    function ValidateForm: Boolean;

    procedure MapDataToForm;
    procedure MapFormToData;
    procedure MapDataInterToForm(index: Integer);
    procedure MapFormToDataInter(index: Integer);
  public
    property opfEditId: Integer read FopfEditId write FopfEditId;
    property ncmProduto: string read FncmProduto write FncmProduto;
  end;

var
  frmCadOperacaoFiscal: TfrmCadOperacaoFiscal;

implementation

uses
  uDtmAtivo,
  StrUtils,
  Math,
  hw_utils,
  opfiscal_model,
  uDadosIni,
  uClassesOperacaoFiscal, opf_icms_class, opf_icms_dest_class,
  opf_icms_dest_params_class, opf_pc_class, hw_strings;

{$R *.dfm}

procedure operacaofiscal_show(Amodal: Boolean);
begin
  vDadosIni.vTipoForm := 0;
  if not Assigned(frmCadOperacaoFiscal) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm(TfrmCadOperacaoFiscal, frmCadOperacaoFiscal);
  end;
  if frmCadOperacaoFiscal.FormStyle = fsMDIChild then
    frmCadOperacaoFiscal.Show
  else
    frmCadOperacaoFiscal.ShowModal;
end;

procedure operacaofiscal_edit(opfId: Integer);
begin
  vDadosIni.vTipoForm := 0;
  if Assigned(frmCadOperacaoFiscal) then
    if ShowConfirmacao('Cadastro já se encontra aberto no momento. Se continuar os dados em tela serão perdidos. Deseja continuar') <> IDYES then
      Exit;
  if Assigned(frmCadOperacaoFiscal) then
    FreeAndNil(frmCadOperacaoFiscal);

  vDadosIni.vModalOuChild := 'M';
  Application.CreateForm(TfrmCadOperacaoFiscal, frmCadOperacaoFiscal);
  frmCadOperacaoFiscal.opfEditId := opfId;
  frmCadOperacaoFiscal.ShowModal;
end;

procedure operacaofiscal_ncm_prod(ncmProduto: string);
begin
  vDadosIni.vTipoForm := 0;
  if Assigned(frmCadOperacaoFiscal) then
    if ShowConfirmacao('Cadastro já se encontra aberto no momento. Se continuar os dados em tela serão perdidos. Deseja continuar') <> IDYES then
      Exit;
  if Assigned(frmCadOperacaoFiscal) then
    FreeAndNil(frmCadOperacaoFiscal);

  vDadosIni.vModalOuChild := 'M';
  Application.CreateForm(TfrmCadOperacaoFiscal, frmCadOperacaoFiscal);
  frmCadOperacaoFiscal.ncmProduto := ncmProduto;
  frmCadOperacaoFiscal.ShowModal;
end;

exports
  operacaofiscal_show,
  operacaofiscal_edit,
  operacaofiscal_ncm_prod;

procedure TfrmCadOperacaoFiscal.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not opFiscal.Auditor.Processo('BAS486').Visualizar.Permitido then
      Exit;

    inherited;

    if MaskEdit2.Visible then
    begin
      if not opFiscal.ConsultaCampos(opFiscal.TableName, ComboBox1.Text,
        'ID', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, IfThen(ck_lixeira.Checked, 0, 1)) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if opFiscal.ConsultaCampos(opFiscal.TableName, MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, 'ID', true, vDadosIni.codEmpresa, IfThen(ck_lixeira.Checked, 0, 1)) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    BitBtn3.Enabled := not ck_lixeira.Checked;
    SpeedButton1.Enabled := not ck_lixeira.Checked;
    SpeedButton2.Enabled := not ck_lixeira.Checked;
    SpeedButton5.Enabled := ck_lixeira.Checked;

//    SpeedButton1.Enabled := True;
//    SpeedButton2.Enabled := True;
//    SpeedButton5.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOperacaoFiscal.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;

    if not opFiscal.Insert then
      Exit;

//    ncm_change(opFiscal.objeto.NCMs);
//    mva_change(opFiscal.objeto.MVAs);

    inherited;

    buildCadastro(False);
//    PageControl1.ActivePage := TabSheet1;
//    PageControl3.ActivePage := tsCadastro;
//
//    ed_cest.Enabled := True;
//    ed_ambito.Enabled := True;
//
//    if (Self.Enabled) and (Self.Visible) and (ed_cest.CanFocus) then
//      ed_cest.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOperacaoFiscal.BitBtn4Click(Sender: TObject);
begin  
  try
    BitBtn4.Enabled := False;
    Screen.Cursor := crHourGlass;

    if not ValidateForm then
      Exit;

    MapFormToData;

//    opFiscal.dataSet.FieldByName('ufs_convenio').AsString := list_uf.Items.Text;

    if not opFiscal.post then
    begin
      PageControl3.ActivePage := tsCadastro;
      setFocusCampoErro(opFiscal.vNomeCampoErro);
    end
    else
    begin
      if opfEditId > 0 then
        Close
      else if TelaCadastro = 1 then
      begin
        BitBtn6.Click;
        Exit;
      end;
      if CheckCadSeq.Checked then
      begin
        if opFiscal.Insert then
        begin
          PageControl3.ActivePage := tsCadastro;
          if (Self.Enabled) and (Self.Visible) and (ed_descr.CanFocus) then
          	ed_descr.SetFocus;
        end;
      end
      else if TelaCadastro = 2 then
        BitBtn5.Click
      else
        inherited;
    end;
  finally
    Screen.Cursor := crDefault;
    BitBtn4.Enabled := True;
  end;
end;

procedure TfrmCadOperacaoFiscal.BitBtn5Click(Sender: TObject);
begin
  inherited;
  opFiscal.Cancel;

  if opfEditId > 0 then
    Close;
  
end;

procedure TfrmCadOperacaoFiscal.bt_cond_add_cidClick(Sender: TObject);
begin
  inherited;
  if ed_cond_cidade.KeyValue <> Null then
  begin
    opFiscal.condicoes.AddOpcional(tcCidade, lkCidades.dataSet.FieldByName('id').AsString, lkCidades.dataSet.FieldByName('name').AsString);
    ed_cond_cidade.KeyValue := Null;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_cond_add_consfinalClick(Sender: TObject);
begin
  inherited;
  if ed_cond_consfinal.ItemIndex >= 0 then
  begin
    opFiscal.condicoes.AddOpcional(tcConsumoFinal, Copy(ed_cond_consfinal.Text, 1, 1), ed_cond_consfinal.Text);
    ed_cond_consfinal.ItemIndex := -1;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_cond_add_contribClick(Sender: TObject);
begin
  inherited;
  if ed_cond_contrib.ItemIndex >= 0 then
  begin
    opFiscal.condicoes.AddOpcional(tcContribuite, Copy(ed_cond_contrib.Text, 1, 1), ed_cond_contrib.Text);
    ed_cond_contrib.ItemIndex := -1;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_cond_add_cst_icmsClick(Sender: TObject);
begin
  inherited;
  if ed_cond_cst_icms.ItemIndex >= 0 then
  begin
    opFiscal.condicoes.AddOpcional(tcCstIcms, Copy(ed_cond_cst_icms.Text, 1, 2), ed_cond_cst_icms.Text);
    ed_cond_cst_icms.ItemIndex := -1;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_cond_add_cst_pis_saiClick(Sender: TObject);
begin
  inherited;
  if ed_cond_cst_pis_sai.ItemIndex >= 0 then
  begin
    opFiscal.condicoes.AddOpcional(tcCstPisSai, Copy(ed_cond_cst_pis_sai.Text, 1, 2), ed_cond_cst_pis_sai.Text);
    ed_cond_cst_pis_sai.ItemIndex := -1;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_cond_add_finalClick(Sender: TObject);
begin
  inherited;
  if ed_cond_finalidade.KeyValue <> Null then
  begin
    opFiscal.condicoes.AddOpcional(tcFinalidade, lkFinalidades.dataSet.FieldByName('id').AsString, lkFinalidades.dataSet.FieldByName('name').AsString);
    ed_cond_finalidade.KeyValue := Null;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_cond_add_pessoaClick(Sender: TObject);
begin
  inherited;
  if ed_cond_pessoa.ItemIndex >= 0 then
  begin
    opFiscal.condicoes.AddOpcional(tcPessoa, Copy(ed_cond_pessoa.Text, 1, 2), ed_cond_pessoa.Text);
    ed_cond_pessoa.ItemIndex := -1;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_cond_add_tipoitemClick(Sender: TObject);
begin
  inherited;
  if ed_cond_tipo_item.ItemIndex >= 0 then
  begin
    opFiscal.condicoes.AddOpcional(tcTipoItem, Copy(ed_cond_tipo_item.Text, 1, 2), ed_cond_tipo_item.Text);
    ed_cond_tipo_item.ItemIndex := -1;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_cond_add_tiponfClick(Sender: TObject);
begin
  inherited;
  if ed_cond_tipo_nf.ItemIndex >= 0 then
  begin
    opFiscal.condicoes.AddOpcional(tcTipoNf, Copy(ed_cond_tipo_nf.Text, 1, 1), ed_cond_tipo_nf.Text);
    ed_cond_tipo_nf.ItemIndex := -1;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_cond_add_ufClick(Sender: TObject);
var
  Str: string;
  I: Integer;
  list: TStrings;
begin
  inherited;

  Str := StrReplace(UpperCase(ed_cond_estados.Text), [';', ' ', '-', '|', '+', '.', '/', '*'], ',');

  opFiscal.condicoes.opcionais.prepare_loop(Format('cond = %d', [ord(tcEstados)]));
  try
    Str := Str + ',' + opFiscal.condicoes.opcionais.fstr('valor');
  finally
    opFiscal.condicoes.opcionais.prepare_loop_done();
  end;

  list := NewStringList(True, Str, ',');

  Str := '';
  for I := 0 to list.Count - 1 do
  begin
    if Length(Trim(list[I])) = 2 then
      if ContainsText(vDadosIni.getListaUF(), list[I]) then
        Str := Str + IfThen(Str <> '', ',') + list[I];
  end;

  if Str <> '' then
  begin
    opFiscal.condicoes.AddOpcional(tcEstados, Str, Str);
    ed_cond_estados.Clear;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_cond_delClick(Sender: TObject);
begin
  inherited;
  opFiscal.condicoes.RemoveOpcional();
end;

procedure TfrmCadOperacaoFiscal.bt_cond_edit_ufClick(Sender: TObject);
var
  Str: string;
  I: Integer;
  list: TStrings;
begin
  inherited;

  Str := StrReplace(UpperCase(ed_cond_estados.Text), [';', ' ', '-', '|', '+', '.', '/', '*'], ',');

  list := NewStringList(True, Str, ',');

  Str := '';
  for I := 0 to list.Count - 1 do
  begin
    if Length(Trim(list[I])) = 2 then
      if ContainsText(vDadosIni.getListaUF(), list[I]) then
        Str := Str + IfThen(Str <> '', ',') + list[I];
  end;

  if (Str <> '') and (ShowConfirmacao('Deseja mesmo alterar os Estados?') = IDYES) then
  begin
    opFiscal.condicoes.AddOpcional(tcEstados, Str, Str);
    ed_cond_estados.Clear;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastroClick(Sender: TObject);
begin
  inherited;

  if not opFiscal.Auditor.Processo('BAS492').Alterar
    .Msg('%d - %s - %s', [opFiscal.fint('id'), opFiscal.fstr('descricao'),
                          IfThen(opFiscal.objeto.icms.ativo = 1, 'Desativar', 'Ativar')])
    .Permitido then
    Exit;

  opFiscal.objeto.icms.ativo := IfThen(opFiscal.objeto.icms.ativo = 1, 0, 1);
  buildCadastroIcms();
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastro_exteriorClick(Sender: TObject);
begin
  inherited;

  if not opFiscal.Auditor.Processo('BAS495').Alterar
    .Msg('%d - %s - %s', [opFiscal.fint('id'), opFiscal.fstr('descricao'),
                          IfThen(opFiscal.objeto.icms.interno.ativo = 1, 'Desativar', 'Ativar')])
    .Permitido then
    Exit;

  opFiscal.objeto.icms.exterior.ativo := IfThen(opFiscal.objeto.icms.exterior.ativo = 1, 0, 1);
  buildCadastroIcmsExterior();        
  if (opFiscal.objeto.icms.exterior.ativo = 1) and (ed_exterior_cfop.AsValue = 0) then
    case TTributacao(VarToInt(ed_icms_tributacao.KeyValue)) of
      icm_00_20_51,
      icm_40,
      icm_41,
      icm_50:
        ed_exterior_cfop.AsValue := 7102;
      icm_10_70,
      icm_30,
      icm_60:
        ed_exterior_cfop.AsValue := 7403;
      else
        ed_exterior_cfop.AsValue := 7949;
    end;
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastro_intraClick(Sender: TObject);
begin
  inherited;

  if not opFiscal.Auditor.Processo('BAS493').Alterar
    .Msg('%d - %s - %s', [opFiscal.fint('id'), opFiscal.fstr('descricao'),
                          IfThen(opFiscal.objeto.icms.interno.ativo = 1, 'Desativar', 'Ativar')])
    .Permitido then
    Exit;

  opFiscal.objeto.icms.interno.ativo := IfThen(opFiscal.objeto.icms.interno.ativo = 1, 0, 1);
  buildCadastroIcmsIntra();
  if (opFiscal.objeto.icms.interno.ativo = 1) and (ed_intra_cfop.AsValue = 0) then
    case TTributacao(VarToInt(ed_icms_tributacao.KeyValue)) of
      icm_00_20_51,
      icm_40,
      icm_41,
      icm_50:
        ed_intra_cfop.AsValue := 5102;
      icm_10_70,
      icm_30,
      icm_60:
        ed_intra_cfop.AsValue := 5403;
      else                            
        ed_intra_cfop.AsValue := 5949;
    end;
end;

procedure TfrmCadOperacaoFiscal.bt_icms_configClick(Sender: TObject);
begin
  inherited;
  form_modal_configure([bt_modal_save, bt_modal_voltar]);
  grid_modal.Visible := False;
  ed_memo.Lines.Text := opFiscal.objeto.icms.conf_trib.Text;

  try
    ed_memo.Parent := pn_modal;
    ed_memo.Align := alClient;

    if vDadosIni.abreForm('Configurações avançadas do ICMS', pn_modal, opFormsDefCadEsc) then
    begin
      opFiscal.objeto.icms.conf_trib.Text := ed_memo.Lines.Text;
      buildCadastroIcmsBase;
    end;

  finally
    ed_memo.Parent := tsOutras;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_pc_configClick(Sender: TObject);
begin
  inherited;
  form_modal_configure([bt_modal_save, bt_modal_voltar]);
  grid_modal.Visible := False;
  ed_memo.Lines.Text := opFiscal.objeto.piscofins.conf_trib.Text;

  try
    ed_memo.Parent := pn_modal;
    ed_memo.Align := alClient;

    if vDadosIni.abreForm('Configurações avançadas do PISCOFINS', pn_modal, opFormsDefCadEsc) then
    begin
      opFiscal.objeto.piscofins.conf_trib.Text := ed_memo.Lines.Text;
      buildCadastroPisCofinsBase;
    end;

  finally
    ed_memo.Parent := tsOutras;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_piscofins_cadastroClick(Sender: TObject);
begin
  inherited;

  if not opFiscal.Auditor.Processo('BAS496').Alterar
    .Msg('%d - %s - %s', [opFiscal.fint('id'), opFiscal.fstr('descricao'),
                          IfThen(opFiscal.objeto.piscofins.ativo = 1, 'Desativar', 'Ativar')])
    .Permitido then
    Exit;

  opFiscal.objeto.piscofins.ativo := IfThen(opFiscal.objeto.piscofins.ativo = 1, 0, 1);
  buildCadastroPisCofins();
end;

procedure TfrmCadOperacaoFiscal.bt_rettrib_cadastroClick(Sender: TObject);
begin
  inherited;

  if not opFiscal.Auditor.Processo('BAS513').Alterar
    .Msg('%d - %s - %s', [opFiscal.fint('id'), opFiscal.fstr('descricao'),
                          IfThen(opFiscal.objeto.retTrib.ativo = 1, 'Desativar', 'Ativar')])
    .Permitido then
    Exit;

  opFiscal.objeto.retTrib.ativo := IfThen(opFiscal.objeto.retTrib.ativo = 1, 0, 1);
  buildCadastroRetTrib();
end;

procedure TfrmCadOperacaoFiscal.buildCadastro(inEdit: Boolean);
var
  I: Integer;
begin

//  pn_icms_cadastro.Visible          := opFiscal.objeto.icms.ativado;
//  bt_icms_cadastro.Visible          := not opFiscal.objeto.icms.ativado;
//  pn_icms_cadastro_intra.Visible    := opFiscal.objeto.icms.interno.ativado;
//  pn_icms_cadastro_inter.Visible    := opFiscal.objeto.icms.interestadual.ativado;
//  pn_icms_cadastro_exterior.Visible := opFiscal.objeto.icms.exterior.ativado;
//  bt_icms_cadastro_intra.Caption    := IfThen(opFiscal.objeto.icms.interno.ativado      , 'Desa', 'A') + 'tivar para operação interna?';
//  //bt_icms_cadastro_inter.Caption    := IfThen(opFiscal.objeto.icms.interestadual.ativado, 'Desa', 'A') + 'tivar para operação interestadual?';
//  bt_icms_cadastro_exterior.Caption := IfThen(opFiscal.objeto.icms.exterior.ativado     , 'Desa', 'A') + 'tivar para operação com exterior?';
//  bt_icms_cadastro.Caption          := IfThen(opFiscal.objeto.icms.ativado,
//                                              'Excluir o tributo ICMS para essa operação fiscal',
//                                              'O tributo do ICMS não está ativo para esta operação fiscal. Deseja ativar?');
//TTributacao = (icm_00_20_51, icm_10_70, icm_30, icm_40, icm_41, icm_50, icm_60, icm_90_comICM_comST, icm_90_comICM_semST, icm_90_semICM_comST, icm_90_semICM_semST);
  if not Assigned(lkCstIcms) then
    lkCstIcms := TDadosLookUp_OOP.create;
  lkCstIcms.setDadosDataSet(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
                               ['Tributada pelo ICMS Normal ou com Diferimento (00, 20, 51)',
                                'Tributada pelo ICMS ST (10, 70)',
                                'Isenta / Não tributada com cobrança do ICMS ST (30)',
                                'Isenta (40)',
                                'Não tributada (41)',
                                'Com suspensão (50)',
                                'ICMS cobrando anteriormente por substituição tributária (60)',
                                'Outras - Com ICMS OP e com ICMS ST (90)',
                                'Outras - Com ICMS OP e sem ICMS ST (90)',
                                'Outras - Sem ICMS OP e com ICMS ST (90)',
                                'Outras - Sem ICMS OP e sem ICMS ST (90)'],
                                ed_icms_tributacao);

  if not Assigned(lkDeson) then
    lkDeson := TDadosLookUp_OOP.create;
  lkDeson.setDadosDataSet(['0', '1', '3', '4', '5', '6', '7', '8', '9', '10', '11'],
                               ['0 - Sem desoneração',
                                '1 - Taxi',
                                '3 - Produtor Agropecuário',
                                '4 - Frotista/Locadora',
                                '5 - Diplomático/Consular',
                                '6 - Utilitários e Motocicletas da Amazônia Ocidental e Áreas de Livre Comércio (Resolução 714/88 e 790/94 – CONTRAN e suas alterações)',
                                '7 - SUFRAMA',
                                '8 - Venda a Órgão Público',
                                '9 - Outros. (NT 2011/004)',
                                '10 - Deficiente Condutor (Convênio ICMS 38/12)',
                                '11 - Deficiente Não Condutor (Convênio ICMS 38/12)'],
                                ed_icms_deson);
  lkDeson.setDBLookupComboBox(ed_pc_deson);

  if not Assigned(lkCstPC) then
    lkCstPC := TDadosLookUp_OOP.create;
  lkCstPC.setDadosDataSet(['01', '02', '03', '04', '05', '06', '07', '08', '09', '49'],
                               ['01 - Operação Tributável com Alíquota Básica',
                                '02 - Operação Tributável com Alíquota Diferenciada',
                                '03 - Operação Tributável com Alíquota por Unidade de Medida de Produto',
                                '04 - Operação Tributável Monofásica - Revenda a Alíquota Zero',
                                '05 - Operação Tributável por Substituição Tributária',
                                '06 - Operação Tributável a Alíquota Zero',
                                '07 - Operação Isenta da Contribuição',
                                '08 - Operação sem Incidência da Contribuição',
                                '09 - Operação com Suspensão da Contribuição',
                                '49 - Outras Operações de Saída'],
                                ed_pc_cst);

  if not Assigned(lkCidades) then
  begin
    lkCidades := TDadosLookUp_OOP.create;
    lkCidades.setDadosDataSet('id', 'name',
      opFiscal.SqlOpen('select codigo_mun_ibge id, (nome_municipio || '' - '' || codigo_mun_ibge || '' - '' || nome_uf) name  from cidades_ibge order by nome_municipio'),
      ed_cond_cidade);
  end;

  if not Assigned(lkFinalidades) then
  begin
    lkFinalidades := TDadosLookUp_OOP.create;
    lkFinalidades.setDadosDataSet('id', 'name',
      opFiscal.SqlOpen('select id, (descricao || '' - '' || id) name from finalidade where cod_empresa = %d order by descricao', [vdadosIni.cod_empresa]),
      ed_cond_finalidade);
  end;

  if not Assigned(lkInfCompl) then
  begin
    lkInfCompl := TDadosLookUp_OOP.create;
    lkInfCompl.setDadosDataSet('id', 'name',
      opFiscal.SqlOpen('select null id, '' '' name from rdb$database' +
                       ' union' +
                       ' select s.cod_inf id, (substring(iif(coalesce(s.txt,'''') <> '''', s.txt, s.txt_compl) from 1 for 48) || '' - '' || s.tipo) name' +
                       ' from sped_informacao_complementar s' +
                       ' where s.cod_empresa = %d and s.tipo <> ''DE OLHO NO IMPOSTO''' +
                       ' order by 2', [vdadosIni.cod_empresa]), ed_cod_inf);
  end;

  pageOpfiscal.ActivePage := tsIcms;
  grid_prod.Visible := False;

  buildCadastroIcms();
  buildCadastroIcmsIntra();
  buildCadastroIcmsInter();
  buildCadastroIcmsExterior();
  buildCadastroPisCofins();
  buildCadastroRetTrib;                                        
  clearCadastroCondicoes();

  if opFiscal.objeto.icms.interestadual.params.Count > 0 then
    indexInter := 0
  else
    indexInter := -1;

  listInter.Clear;
  for I := 0 to opFiscal.objeto.icms.interestadual.params.Count - 1 do
  begin
    listInter.Add((opFiscal.objeto.icms.interestadual.params.Items[I] as TOpFiscal_ICMS_Dest_Params).Clone);
    (listInter.Items[I] as TOpFiscal_ICMS_Dest_Params).ativado := True;
    (listInter.Items[I] as TOpFiscal_ICMS_Dest_Params).beginChanges;
  end;

  MapDataToForm;
  MapDataInterToForm(indexInter);

  buildCadastroIcmsBase();
  buildCadastroPisCofinsBase();

//  buildEstados;
//  ncm_change(opFiscal.objeto.NCMs);
//  mva_change(opFiscal.objeto.MVAs);
//  lb_origem_cadastro.Caption := TCest_Builder.VarToTipoCadastroCestStr(opFiscal.fint('origem'));
//
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tsCadastro;
//
//  ed_cest.Enabled := not inEdit;
//  ed_ambito.Enabled := not inEdit;
//
//  if (not inEdit) and (Self.Enabled) and (Self.Visible) and (ed_cest.CanFocus) then
//      ed_cest.SetFocus;
  if (Self.Enabled) and (Self.Visible) and (ed_descr.CanFocus) then
    ed_descr.SetFocus;
end;

procedure TfrmCadOperacaoFiscal.ck_icms_baseClickCheck(Sender: TObject);
var
  section: string;
  I: Integer;
begin
  inherited;
  section := Format('Composicao_BC_%s_%s_Modelo_%s', [ed_icms_trib.Text, ed_icms_ent_sai.Text, ed_icms_modelo.Text]);

  if ck_icms_base_hab.Checked then
  begin
    for I := 0 to ck_icms_base.Items.Count - 1 do
      opFiscal.objeto.icms.conf_trib.WriteString(section, 'Campo_' + ck_icms_base.Items[I], IfThen(ck_icms_base.Checked[I], 'S', 'N'));
  end;
end;

procedure TfrmCadOperacaoFiscal.ck_icms_base_habClick(Sender: TObject);
var
  section: string;
begin
  inherited;
  section := Format('Composicao_BC_%s_%s_Modelo_%s', [ed_icms_trib.Text, ed_icms_ent_sai.Text, ed_icms_modelo.Text]);

  opFiscal.objeto.icms.conf_trib.WriteBool(section, 'Habilitado', ck_icms_base_hab.Checked);
  buildCadastroIcmsBase();
  ck_icms_baseClickCheck(ck_icms_base);
end;

procedure TfrmCadOperacaoFiscal.ck_pc_baseClickCheck(Sender: TObject);
var
  section: string;
  I: Integer;
begin
  inherited;
  section := Format('Composicao_BC_%s_%s_Modelo_%s', ['PISCOFINS', ed_pc_ent_sai.Text, ed_pc_modelo.Text]);

  if ck_pc_base_hab.Checked then
  begin
    for I := 0 to ck_pc_base.Items.Count - 1 do
      opFiscal.objeto.piscofins.conf_trib.WriteString(section, 'Campo_' + ck_pc_base.Items[I], IfThen(ck_pc_base.Checked[I], 'S', 'N'));
  end;
end;

procedure TfrmCadOperacaoFiscal.ck_pc_base_habClick(Sender: TObject);
var
  section: string;
begin
  inherited;
  section := Format('Composicao_BC_%s_%s_Modelo_%s', ['PISCOFINS', ed_pc_ent_sai.Text, ed_pc_modelo.Text]);

  opFiscal.objeto.piscofins.conf_trib.WriteBool(section, 'Habilitado', ck_pc_base_hab.Checked);
  buildCadastroPisCofinsBase();
  ck_pc_baseClickCheck(ck_pc_base);
end;

procedure TfrmCadOperacaoFiscal.clearCadastroCondicoes;
begin
  ed_ncm_ini.Clear;
  ed_ncm_fim.Clear;

  ed_cond_cidade.KeyValue := Null;
  ed_cond_contrib.ItemIndex := -1;
  ed_cond_pessoa.ItemIndex := -1;
  ed_cond_tipo_item.ItemIndex := -1;
  ed_cond_tipo_nf.ItemIndex := -1;
  ed_cond_finalidade.KeyValue := Null;
  ed_cond_consfinal.ItemIndex := -1;
  ed_cond_estados.Clear;

end;

procedure TfrmCadOperacaoFiscal.buildCadastroIcms;
begin
  pn_icms_cadastro.Visible := opFiscal.objeto.icms.ativo = 1;
  bt_icms_cadastro.Caption := IfThen(opFiscal.objeto.icms.ativo = 1,
                                         'Excluir o tributo ICMS para essa operação fiscal',
                                         'O tributo do ICMS não está ativo para esta operação fiscal. Deseja ativar?');
end;

procedure TfrmCadOperacaoFiscal.buildCadastroIcmsBase;
var
  section: string;
  I: Integer;
begin
  inherited;
  section                  := Format('Composicao_BC_%s_%s_Modelo_%s', [ed_icms_trib.Text, ed_icms_ent_sai.Text, ed_icms_modelo.Text]);
  ck_icms_base_hab.Checked := opFiscal.objeto.icms.conf_trib.ReadBool(section, 'Habilitado');
  ck_icms_base.Enabled     := ck_icms_base_hab.Checked;

  if ck_icms_base_hab.Checked then
  begin
    for I := 0 to ck_icms_base.Items.Count - 1 do
      ck_icms_base.Checked[I] :=
        opFiscal.objeto.icms.conf_trib.ReadString(section, 'Campo_' + ck_icms_base.Items[I],
          IfThen((I >= 0) and (I <= 4), 'S') +                                                  // Valor + Seguro + Frete + Outras - Desconto + Frete
          IfThen((I = 5) and (ed_icms_trib.Text = 'ICMSST'), 'S') +                             // ValorIPI quando ICMSST
          IfThen((I >= 8) and (I <= 10) and (ed_icms_trib.Text = 'ICMSST'), 'S')                // - ( DesoneracaoICMS + DesoneracaoPIS + DesoneracaoCOFINS) quando ICMSST
        ) = 'S';
  end
  else
  begin
    ck_icms_base.Checked[00] := True;
    ck_icms_base.Checked[01] := True;
    ck_icms_base.Checked[02] := True;
    ck_icms_base.Checked[03] := True;
    ck_icms_base.Checked[04] := True;
    ck_icms_base.Checked[05] := ed_icms_trib.Text = 'ICMSST';
    ck_icms_base.Checked[06] := False;
    ck_icms_base.Checked[07] := False;
    ck_icms_base.Checked[08] := ed_icms_trib.Text = 'ICMSST';
    ck_icms_base.Checked[09] := ed_icms_trib.Text = 'ICMSST';
    ck_icms_base.Checked[10] := ed_icms_trib.Text = 'ICMSST';
  end;
end;

procedure TfrmCadOperacaoFiscal.buildCadastroIcmsExterior;
begin
  pn_icms_cadastro_exterior.Visible := opFiscal.objeto.icms.exterior.ativo = 1;
  bt_icms_cadastro_exterior.Caption := IfThen(opFiscal.objeto.icms.exterior.ativo = 1, 'Desa', 'A') + 'tivar operação com exterior?';
end;

procedure TfrmCadOperacaoFiscal.buildCadastroIcmsInter;
begin
  pn_icms_cadastro_inter_botoes.Visible := opFiscal.objeto.icms.interestadual.ativo = 1;
  pn_icms_cadastro_inter_cfop.Visible   := opFiscal.objeto.icms.interestadual.ativo = 1;
  pn_icms_cadastro_inter.Visible        := (opFiscal.objeto.icms.interestadual.ativo = 1) and (listInter.Count > 0);
  bt_icms_cadastro_inter.Caption        := IfThen(opFiscal.objeto.icms.interestadual.ativo = 1, 'Desa', 'A') + 'tivar operação interestadual';
end;

procedure TfrmCadOperacaoFiscal.buildCadastroIcmsIntra();
begin
  pn_icms_cadastro_intra.Visible := opFiscal.objeto.icms.interno.ativo = 1;
  bt_icms_cadastro_intra.Caption := IfThen(opFiscal.objeto.icms.interno.ativo = 1, 'Desa', 'A') + 'tivar operação interna?';
end;

procedure TfrmCadOperacaoFiscal.buildCadastroPisCofins;
begin
  pn_piscofins_cadastro.Visible := opFiscal.objeto.piscofins.ativo = 1;
  bt_piscofins_cadastro.Caption := IfThen(opFiscal.objeto.piscofins.ativo = 1,
                                          'Excluir a contribuição do PIS e da COFINS para essa operação fiscal',
                                          'A contribuição do PIS e da COFINS não está ativa para esta operação fiscal. Deseja ativar?');
end;

procedure TfrmCadOperacaoFiscal.buildCadastroPisCofinsBase;
var
  section: string;
  I: Integer;
begin
  inherited;
  section                  := Format('Composicao_BC_%s_%s_Modelo_%s', ['PISCOFINS', ed_pc_ent_sai.Text, ed_pc_modelo.Text]);
  ck_pc_base_hab.Checked := opFiscal.objeto.piscofins.conf_trib.ReadBool(section, 'Habilitado');
  ck_pc_base.Enabled     := ck_pc_base_hab.Checked;

  if ck_pc_base_hab.Checked then
  begin
    for I := 0 to ck_pc_base.Items.Count - 1 do
      ck_pc_base.Checked[I] :=
        opFiscal.objeto.piscofins.conf_trib.ReadString(section, 'Campo_' + ck_pc_base.Items[I],
          IfThen((I >= 0) and (I <= 4), 'S') +
          IfThen((I = 5) and (ed_pc_ent_sai.Text = 'Entrada'), 'S')
        ) = 'S';
  end
  else
  begin
    ck_pc_base.Checked[0] := True;
    ck_pc_base.Checked[1] := True;
    ck_pc_base.Checked[2] := True;
    ck_pc_base.Checked[3] := True;
    ck_pc_base.Checked[4] := True;
    ck_pc_base.Checked[5] := ed_pc_ent_sai.Text = 'Entrada';
    ck_pc_base.Checked[6] := False;
  end;
end;

procedure TfrmCadOperacaoFiscal.buildCadastroRetTrib;
begin
  pn_rettrib_cadastro.Visible := opFiscal.objeto.retTrib.ativo = 1;
  bt_rettrib_cadastro.Caption := IfThen(opFiscal.objeto.retTrib.ativo = 1,
                                          'Excluir a Retenção Federal para essa operação fiscal',
                                          'A Retenção Federal não está ativa para esta operação fiscal. Deseja ativar?');
end;

procedure TfrmCadOperacaoFiscal.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadOperacaoFiscal.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  R: TRect;
begin
  if (TDBGrid(sender).DataSource.DataSet.FieldByName('changes').AsInteger = 1)then
  begin
    if (TDBGrid(sender).DataSource.DataSet.FieldByName('ativo').AsInteger = 1) then
      TDBGrid(sender).Canvas.Brush.Color := $00DDE9DA
    else
      TDBGrid(sender).Canvas.Brush.Color := $00BFBFFF;
//    TDBGrid(sender).Canvas.Font.Color := clWhite;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

//    if (gdFocused in State) then
//    begin
//      TDBGrid(sender).canvas.brush.color := clWindow;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end
//    else
//    begin
//      TDBGrid(sender).canvas.brush.color := clHighlight;
//      TDBGrid(sender).canvas.Font.color := clWhite;
//    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadOperacaoFiscal.ed_icms_modeloChange(Sender: TObject);
begin
  inherited;
  buildCadastroIcmsBase();
end;

procedure TfrmCadOperacaoFiscal.ed_pc_modeloChange(Sender: TObject);
begin
  inherited;
  buildCadastroPisCofinsBase();
end;

procedure TfrmCadOperacaoFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCadOperacaoFiscal := nil;

  if Assigned(lkCstIcms) then
    FreeAndNil(lkCstIcms);
  if Assigned(lkDeson) then
    FreeAndNil(lkDeson);
  if Assigned(opFiscal) then
    FreeAndNil(opFiscal);
  if Assigned(listInter) then
    FreeAndNil(listInter);
  inherited;
end;

procedure TfrmCadOperacaoFiscal.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  if not Assigned(opFiscal) then
  begin
    opFiscal := TOperacaoFiscal.Create;
//    opFiscal.OnChange := cest_change;
    DBGrid1.DataSource := opFiscal._dataSourceOOP;

    DBGrid2.DataSource := opFiscal.condicoes.ncms._dataSourceOOP;
    DBGrid3.DataSource := opFiscal.condicoes.opcionais._dataSourceOOP;
    grid_prod.DataSource := opFiscal.produtos._dataSourceOOP;
  end;
  listInter := TObjectList.Create;
  tsCadastro.TabVisible := False;
  TabSheet1.TabVisible := False;
  tsOutras.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  bt_icms_cadastro_inter_adiciona.Align := alClient;
  bt_icms_cadastro_inter_salva.Align := alClient;
  pn_condicionais_opcionais_top.Align := alTop;
  ed_inter_ufs.Items.LineBreak := ',';
  indexInter := -1;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadOperacaoFiscal.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
//    ed_item_txt.BorderStyle   := bsNone;
//    ed_ambito_txt.BorderStyle := bsNone;
    DBGrid1.DataSource := opFiscal._dataSourceOOP;
    opFiscal.montaSelect('select * from %s where id = 0 and cod_empresa = 0', [opFiscal.TableName]);
    //opFiscal.dataSet.FieldByName('cod_empresa').Tag := 1;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
//  Panel4.BevelOuter := bvNone;

  tsOutras.TabVisible := False;

  if ncmProduto <> '' then
  begin
    ncmProdutoEmEdicaoLabel.Caption := Format('NCM do produto em edição: %s', [ncmProduto]);
    ncmProdutoEmEdicaoLabel.Visible := True;
    usarNCMProdutoPanel.Caption := Format('Usar NCM do produto %s', [ncmProduto]);
    usarNCMProdutoPanel.Visible := True;
  end
  else
  if opfEditId > 0 then
  begin
    opFiscal.ConsultaCampos(opFiscal.TableName, IntToStr(opfEditId), opFiscal.dataSet.FieldByName('id').DisplayLabel,
      'Igual', 'ID', true, vDadosIni.codEmpresa);
    if not opFiscal.dataSet.IsEmpty then
      SpeedButton1.Click;
  end
  else if TelaCadastro = 1 then
    BitBtn3Click(Sender);
                            {
  imgInformation.Hint := imgInformation.Hint + sLineBreak + sLineBreak +
   'CLI245 - BT PESQUISAR FINALIDADE' + sLineBreak +
   'CLI246 - BT INSERIR FINALIDADE' + sLineBreak +
   'CLI247 - BT ALTERAR FINALIDADE' + sLineBreak +
   'CLI248 - BT EXCLUIR FINALIDADE' + sLineBreak +
   'CLI249 - BT SALVAR FINALIDADE';
                           }
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadOperacaoFiscal.MapDataInterToForm(index: Integer);
begin
  if (index = -1) or (index > listInter.Count -1) then
  begin
    ed_inter_picms.AsValue   := 0;
    ed_inter_pfcp.AsValue    := 0;
    ed_inter_predbc.AsValue  := 0;
    ed_inter_pdif.AsValue    := 0;
    ed_inter_pfcpdif.AsValue := 0;
    ed_inter_ufs.Items.Clear;

    pn_icms_cadastro_inter.Visible := False;
    pn_icms_cadastro_inter_desfazer.Visible := False;
  end
  else
  begin
    ed_inter_picms.AsValue   := (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).aliq_icms;
    ed_inter_pfcp.AsValue    := (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).aliq_fcp;
    ed_inter_predbc.AsValue  := (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).aliq_red_bc;
    ed_inter_pdif.AsValue    := (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).aliq_icms_dif;
    ed_inter_pfcpdif.AsValue := (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).aliq_fcp_dif;
    ed_inter_ufs.Items.Text  := (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).ufs;

    pn_icms_cadastro_inter.Visible          := (opFiscal.objeto.icms.interestadual.ativo = 1) and (listInter.Count > 0);
    pn_icms_cadastro_inter_desfazer.Visible := (not (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).ativado) and
                                               ((listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).id > 0);
  end;
  bt_icms_cadastro_inter_excluir.Enabled  := (index >= 0) and (index <= listInter.Count - 1) and (not pn_icms_cadastro_inter_desfazer.Visible);
  bt_icms_cadastro_inter_editar.Enabled   := (index >= 0) and (index <= listInter.Count - 1) and (not pn_icms_cadastro_inter_desfazer.Visible);
  bt_icms_cadastro_inter_adiciona.Visible := True;
  bt_icms_cadastro_inter_cancela.Enabled  := False;
  bt_icms_cadastro_inter_salva.Visible    := False;
  bt_icms_cadastro_inter_ante.Enabled     := True;
  bt_icms_cadastro_inter_prox.Enabled     := True;
  bt_icms_cadastro_inter_prox.Left        := 99999;
  bt_icms_cadastro_inter_ante.Enabled     := (index > 0) and (index <= listInter.Count - 1);
  bt_icms_cadastro_inter_prox.Enabled     := (index < listInter.Count - 1);
  pn_icms_cadastro_inter.Enabled          := False;
  BitBtn4.Enabled                         := True;
  gpIcmsInter.Caption                     := 'Operação Interestadual' + Format(' - %d de %d', [index + 1, listInter.Count]);

//  pn_icms_cadastro_inter.Visible := True;
end;

procedure TfrmCadOperacaoFiscal.MapDataToForm;
begin
  ed_icms_tributacao.KeyValue := opFiscal.objeto.icms.tributacao;
  ed_icms_deson.KeyValue      := VarToInt(opFiscal.objeto.icms.motdesicm);

  ed_intra_cfop.AsValue      := opFiscal.objeto.icms.interno.cfop;
  if opFiscal.objeto.icms.interno.params.Count > 0 then
  begin
    ed_intra_picms.AsValue   := (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms;
    ed_intra_pfcp.AsValue    := (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp;
    ed_intra_predbc.AsValue  := (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_red_bc;
    ed_intra_pdif.AsValue    := (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms_dif;
    ed_intra_pfcpdif.AsValue := (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp_dif;
  end
  else
  begin
    ed_intra_picms.AsValue   := 0;
    ed_intra_pfcp.AsValue    := 0;
    ed_intra_predbc.AsValue  := 0;
    ed_intra_pdif.AsValue    := 0;
    ed_intra_pfcpdif.AsValue := 0;
  end;
  ed_icms_modelo.ItemIndex := 8;
  ed_icms_ent_sai.ItemIndex := 8;
  ed_icms_trib.ItemIndex := 0;
  //ck_icms_baseClickCheck(ck_icms_base);

  ed_inter_cfop.AsValue      := opFiscal.objeto.icms.interestadual.cfop;
  if opFiscal.objeto.icms.interestadual.params.Count > 0 then
  begin
    ed_inter_picms.AsValue   := (opFiscal.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms;
    ed_inter_pfcp.AsValue    := (opFiscal.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp;
    ed_inter_predbc.AsValue  := (opFiscal.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_red_bc;
    ed_inter_pdif.AsValue    := (opFiscal.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms_dif;
    ed_inter_pfcpdif.AsValue := (opFiscal.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp_dif;
    ed_inter_ufs.Items.Text  := (opFiscal.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).ufs;
  end
  else
  begin
    ed_inter_picms.AsValue   := 0;
    ed_inter_pfcp.AsValue    := 0;
    ed_inter_predbc.AsValue  := 0;
    ed_inter_pdif.AsValue    := 0;
    ed_inter_pfcpdif.AsValue := 0;
    ed_inter_ufs.Items.Text  := '';
  end;

  ed_exterior_cfop.AsValue    := opFiscal.objeto.icms.exterior.cfop;
  if opFiscal.objeto.icms.exterior.params.Count > 0 then
  begin
    ed_exterior_picms.AsValue   := (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms;
    ed_exterior_pfcp.AsValue    := (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp;
    ed_exterior_predbc.AsValue  := (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_red_bc;
    ed_exterior_pdif.AsValue    := (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms_dif;
    ed_exterior_pfcpdif.AsValue := (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp_dif;
  end
  else
  begin
    ed_exterior_picms.AsValue   := 0;
    ed_exterior_pfcp.AsValue    := 0;
    ed_exterior_predbc.AsValue  := 0;
    ed_exterior_pdif.AsValue    := 0;
    ed_exterior_pfcpdif.AsValue := 0;
  end;

  //piscofins
  ed_pc_cst.KeyValue    := opFiscal.objeto.piscofins.cst;
  ed_pc_deson.KeyValue  := VarToInt(opFiscal.objeto.piscofins.motdespc);
  ed_pc_ppis.AsValue    := VarToFloat(opFiscal.objeto.piscofins.aliq_pis);
  ed_pc_pcofins.AsValue := VarToFloat(opFiscal.objeto.piscofins.aliq_cofins);
  ed_pc_natrec.Text     := opFiscal.objeto.piscofins.nat_rec;

  //retenções
  ed_ret_pir.AsValue     := VarToFloat(opFiscal.objeto.retTrib.pir);
  ed_ret_pcsll.AsValue   := VarToFloat(opFiscal.objeto.retTrib.pcsll);
  ed_ret_ppis.AsValue    := VarToFloat(opFiscal.objeto.retTrib.ppis);
  ed_ret_pcofins.AsValue := VarToFloat(opFiscal.objeto.retTrib.pcofins);
end;

procedure TfrmCadOperacaoFiscal.MapFormToData;
var
  I: Integer;
  item: TOpFiscal_ICMS_Dest_Params;
begin
  opFiscal.objeto.icms.tributacao := VarToInt(ed_icms_tributacao.KeyValue);
  opFiscal.objeto.icms.motdesicm := ed_icms_deson.KeyValue;
  if opFiscal.objeto.icms.interno.ativo = 1 then
  begin
    opFiscal.objeto.icms.interno.cfop := ed_intra_cfop.AsInteger;

    if opFiscal.objeto.icms.interno.params.Count = 0 then
      opFiscal.objeto.icms.interno.params.Add(TOpFiscal_ICMS_Dest_Params.Create);

    (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms     := ed_intra_picms.AsValue;
    (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp      := ed_intra_pfcp.AsValue;
    (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_red_bc   := ed_intra_predbc.AsValue;
    (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms_dif := ed_intra_pdif.AsValue;
    (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp_dif  := ed_intra_pfcpdif.AsValue;
    (opFiscal.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).ativado       := True;
  end;

  if opFiscal.objeto.icms.interestadual.ativo = 1 then
  begin
    if (not (ed_inter_cfop.AsInteger >= 6000) and (ed_inter_cfop.AsInteger <= 6999)) then
    begin
      ShowErro('CFOP Interestadual deve começar com 6');
      Exit;
    end;

    opFiscal.objeto.icms.interestadual.cfop                 := ed_inter_cfop.AsInteger;
    opFiscal.objeto.icms.interestadual.params.Clear;
    for I := 0 to listInter.Count - 1 do
    begin
      item := ((listInter.Items[I] as TOpFiscal_ICMS_Dest_Params).Clone as TOpFiscal_ICMS_Dest_Params);
      item.ativado := (listInter.Items[I] as TOpFiscal_ICMS_Dest_Params).ativado;

      opFiscal.objeto.icms.interestadual.params.Add(item);
    end;
  end;

  if opFiscal.objeto.icms.exterior.ativo = 1 then
  begin
    if (not (ed_exterior_cfop.AsInteger >= 7000) and (ed_exterior_cfop.AsInteger <= 7999)) then
    begin
      ShowErro('CFOP para o Exterior deve começar com 7');
      Exit;
    end;

    opFiscal.objeto.icms.exterior.cfop := ed_exterior_cfop.AsInteger;
    if opFiscal.objeto.icms.exterior.params.Count = 0 then
      opFiscal.objeto.icms.exterior.params.Add(TOpFiscal_ICMS_Dest_Params.Create);

    (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms     := ed_exterior_picms.AsValue;
    (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp      := ed_exterior_pfcp.AsValue;
    (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_red_bc   := ed_exterior_predbc.AsValue;
    (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms_dif := ed_exterior_pdif.AsValue;
    (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp_dif  := ed_exterior_pfcpdif.AsValue;
    (opFiscal.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).ativado       := True;
  end;

  //piscofins
  opFiscal.objeto.piscofins.cst         := ed_pc_cst.KeyValue;
  opFiscal.objeto.piscofins.motdespc    := ed_pc_deson.KeyValue;
  opFiscal.objeto.piscofins.aliq_pis    := ed_pc_ppis.AsValue;
  opFiscal.objeto.piscofins.aliq_cofins := ed_pc_pcofins.AsValue;
  opFiscal.objeto.piscofins.nat_rec     := ed_pc_natrec.Text;

  //retencao federal
  opFiscal.objeto.retTrib.pir     := ed_ret_pir.AsValue;
  opFiscal.objeto.retTrib.pcsll   := ed_ret_pcsll.AsValue;
  opFiscal.objeto.retTrib.ppis    := ed_ret_ppis.AsValue;
  opFiscal.objeto.retTrib.pcofins := ed_ret_pcofins.AsValue;

end;

procedure TfrmCadOperacaoFiscal.MapFormToDataInter(index: Integer);
begin
  if (index = -1) or (index > listInter.Count -1) then
    Exit;

  (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).aliq_icms     := ed_inter_picms.AsValue;
  (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).aliq_fcp      := ed_inter_pfcp.AsValue;
  (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).aliq_red_bc   := ed_inter_predbc.AsValue;
  (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).aliq_icms_dif := ed_inter_pdif.AsValue;
  (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).aliq_fcp_dif  := ed_inter_pfcpdif.AsValue;
  (listInter.Items[index] as TOpFiscal_ICMS_Dest_Params).ufs           := ed_inter_ufs.Items.Text;
end;

procedure TfrmCadOperacaoFiscal.pageOpfiscalChange(Sender: TObject);
begin
  inherited;
  if not opFiscal.produtos.dataSet.Active then
    grid_prod.Visible := False;  
end;

procedure TfrmCadOperacaoFiscal.pn_cadastroEnter(Sender: TObject);
begin
  inherited;
  if not Assigned(ed_id.DataSource) then
  begin
    ed_id.DataSource         := opFiscal._dataSourceOOP;
    ed_descr.DataSource      := opFiscal._dataSourceOOP;
    ed_cod_inf.DataSource    := opFiscal._dataSourceOOP;
    lb_data_cad.DataSource   := opFiscal._dataSourceOOP;
    lb_data_mod.DataSource   := opFiscal._dataSourceOOP;
  end;
end;

procedure TfrmCadOperacaoFiscal.pn_icms_cadastro_inter_desfazerClick(
  Sender: TObject);
begin
  inherited;
  if (indexInter <= -1) or (indexInter > listInter.Count -1) then
    Exit;

  (listInter[indexInter] as TOpFiscal_ICMS_Dest_Params).ativado := True;

  MapDataInterToForm(indexInter);
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastro_inter_anteClick(Sender: TObject);
begin
  inherited;
  if (listInter.Count > 0) and ((indexInter - 1) > -1) then
    if ((indexInter - 1) < listInter.Count -1) then
    begin
      indexInter := indexInter - 1;
      MapDataInterToForm(indexInter);
    end;
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastro_inter_proxClick(Sender: TObject);
begin
  inherited;
  if listInter.Count > 0 then  
    if ((indexInter + 1) <= listInter.Count -1) then
    begin
      indexInter := indexInter + 1;
      MapDataInterToForm(indexInter);
    end;
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastro_inter_salvaClick(
  Sender: TObject);
begin
  inherited;

  if ed_inter_ufs.Items.Count = 0 then
  begin
    ShowAtencao('Nenhuma UF informada');
    Exit;
  end;  

  MapFormToDataInter(indexInter);
  MapDataInterToForm(indexInter);
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastro_inter_editarClick(
  Sender: TObject);
begin
  inherited;

  if (indexInter = -1) or (indexInter > listInter.Count -1) then
    Exit;

  (listInter.Items[listInter.Count - 1] as TOpFiscal_ICMS_Dest_Params).ativado := True;
  MapDataInterToForm(indexInter);

  bt_icms_cadastro_inter_excluir.Enabled := False;
  bt_icms_cadastro_inter_editar.Enabled := False;
  bt_icms_cadastro_inter_cancela.Enabled := True;
  bt_icms_cadastro_inter_adiciona.Visible := False;
  bt_icms_cadastro_inter_salva.Visible := True;
  bt_icms_cadastro_inter_ante.Enabled := False;
  bt_icms_cadastro_inter_prox.Enabled := False;
  pn_icms_cadastro_inter_desfazer.Visible := False;
  pn_icms_cadastro_inter.Enabled := True;
  BitBtn4.Enabled := False;
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastro_inter_excluirClick(Sender: TObject);
begin
  inherited;
  if (indexInter = -1) or (indexInter > listInter.Count -1) then
    Exit;

  if ShowConfirmacao('Deseja mesmo excluir o registro?') <> IDYES then
    Exit;

  if (listInter[indexInter] as TOpFiscal_ICMS_Dest_Params).id = 0 then
    listInter.Delete(indexInter)
  else
    (listInter[indexInter] as TOpFiscal_ICMS_Dest_Params).ativado := False;

  if (indexInter > listInter.Count -1) then
    indexInter := indexInter - 1;

  MapDataInterToForm(indexInter);

  if listInter.Count = 0 then
  begin
    opFiscal.objeto.icms.interestadual.ativo := 0;
    buildCadastroIcmsInter();
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastro_interClick(Sender: TObject);
begin
  inherited;

  if not opFiscal.Auditor.Processo('BAS494').Alterar
    .Msg('%d - %s - %s', [opFiscal.fint('id'), opFiscal.fstr('descricao'),
                          IfThen(opFiscal.objeto.icms.interestadual.ativo = 1, 'Desativar', 'Ativar')])
    .Permitido then
    Exit;

  opFiscal.objeto.icms.interestadual.ativo := IfThen(opFiscal.objeto.icms.interestadual.ativo = 1, 0, 1);
  buildCadastroIcmsInter();
  MapDataInterToForm(indexInter);
  if (opFiscal.objeto.icms.interestadual.ativo = 1) and (listInter.Count = 0) then
  begin
    bt_icms_cadastro_inter_adiciona.Click;
    if (Self.Enabled) and (Self.Visible) and (ed_inter_cfop.CanFocus) then
    	ed_inter_cfop.SetFocus;
  end;
  if (opFiscal.objeto.icms.interestadual.ativo = 1) and (ed_inter_cfop.AsValue = 0) then
    case TTributacao(VarToInt(ed_icms_tributacao.KeyValue)) of
      icm_00_20_51,
      icm_40,
      icm_41,
      icm_50:
        ed_inter_cfop.AsValue := 6102;
      icm_10_70,
      icm_30,
      icm_60:
        ed_inter_cfop.AsValue := 6403;
      else
        ed_inter_cfop.AsValue := 6949;
    end;
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastro_inter_adicionaClick(Sender: TObject);
begin
  inherited; 

  listInter.Add(TOpFiscal_ICMS_Dest_Params.Create);
  indexInter := listInter.Count - 1;
  (listInter.Items[listInter.Count - 1] as TOpFiscal_ICMS_Dest_Params).ativado := True;
  MapDataInterToForm(indexInter);

  bt_icms_cadastro_inter_excluir.Enabled := False;
  bt_icms_cadastro_inter_editar.Enabled := False;
  bt_icms_cadastro_inter_cancela.Enabled := True;
  bt_icms_cadastro_inter_adiciona.Visible := False;
  bt_icms_cadastro_inter_salva.Visible := True;
  bt_icms_cadastro_inter_ante.Enabled := False;
  bt_icms_cadastro_inter_prox.Enabled := False;
  pn_icms_cadastro_inter_desfazer.Visible := False;
  pn_icms_cadastro_inter.Enabled := True;
  BitBtn4.Enabled := False;
end;

procedure TfrmCadOperacaoFiscal.bt_icms_cadastro_inter_cancelaClick(Sender: TObject);
begin
  inherited;
  if (indexInter = -1) or (indexInter > listInter.Count -1) then
    Exit;

  if (listInter[indexInter] as TOpFiscal_ICMS_Dest_Params).id = 0 then
    listInter.Delete(indexInter);

  if (indexInter > listInter.Count -1) then
    indexInter := indexInter - 1;

  MapDataInterToForm(indexInter);

  if listInter.Count = 0 then
  begin
    opFiscal.objeto.icms.interestadual.ativo := 0;
    buildCadastroIcmsInter();
  end;
end;

procedure TfrmCadOperacaoFiscal.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if (ed_inter_ufs.Items.Count >= 0) and (ed_inter_ufs.ItemIndex >= 0) then
    if ShowConfirmacao('Excluir UF "%s"?', [ed_inter_ufs.Items[ed_inter_ufs.ItemIndex]]) = ID_YES then
      ed_inter_ufs.Items.Delete(ed_inter_ufs.ItemIndex);
end;

procedure TfrmCadOperacaoFiscal.SpeedButton15Click(Sender: TObject);
var
  Str: string;
  I: Integer;
  list, allUfs, jaExistem: TStrings;
begin
  inherited;

  if not InputQuery('UF', 'Informe a sigla da UF', Str) then
    Exit;

  Str := StrReplace(UpperCase(Str), [';', ' ', '-', '|', '+', '.', '/', '*'], ',');

  list := NewStringList(True, Str + ',' + ed_inter_ufs.Items.Text, ',');

  Str := '';
  for I := 0 to listInter.Count - 1 do
    if i <> indexInter then    
      Str := Str + ',' + (listInter.Items[I] as TOpFiscal_ICMS_Dest_Params).ufs;

  allUfs := NewStringList(True, Str, ',');
  jaExistem := NewStringList(True);

  ed_inter_ufs.Items.Clear;
  for I := 0 to list.Count - 1 do
  begin
    if Length(Trim(list[I])) = 2 then
      if ContainsText(vDadosIni.getListaUF(), list[I]) then
        if allUfs.IndexOf(list[I]) >= 0 then
          jaExistem.Add(list[I])
        else
          ed_inter_ufs.Items.Add(UpperCase(list[I]));
  end;

  if jaExistem.Count > 0 then
    ShowAtencao('Alguns estados já estão em outro registro' + sLineBreak + sLineBreak + jaExistem.Text);
end;

procedure TfrmCadOperacaoFiscal.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not opFiscal.Edit then
      exit;

//    ncm_change(opFiscal.objeto.NCMs);
//    mva_change(opFiscal.objeto.MVAs);

    inherited;
    buildCadastro(True);
//    PageControl1.ActivePage := TabSheet1;
//    PageControl3.ActivePage := tsCadastro;
//
//    ed_cest.Enabled := False;
//    ed_ambito.Enabled := False;
//
//    if (Self.Enabled) and (Self.Visible) and (ed_descricao.CanFocus) then
//      ed_descricao.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_ncm_addClick(Sender: TObject);
begin
  inherited;
  if opFiscal.condicoes.AddNCM(ed_ncm_ini.Text, ed_ncm_fim.Text) then
  begin
    ed_ncm_ini.Clear;
    ed_ncm_fim.Clear;
    opFiscal.produtos.Close;
  end;
end;

procedure TfrmCadOperacaoFiscal.bt_ncm_delClick(Sender: TObject);
begin
  inherited;
  opFiscal.condicoes.RemoveNCM();
  opFiscal.produtos.Close;
end;

procedure TfrmCadOperacaoFiscal.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

//    if not allowsChange() then
//      Exit;

    if opFiscal.dataSet.IsEmpty then
      vDadosIni.ShowErro('Sem registro selecionado')
    else if (opFiscal.fequals('ativo', '1')) and (vDadosIni.ShowConfirmacao('Deseja mesmo enviar o regitro para lixeira?') = IDYES) then
      opFiscal.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOperacaoFiscal.SpeedButton5Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

//    if not allowsChange() then
//      Exit;

    if opFiscal.dataSet.IsEmpty then
      vDadosIni.ShowErro('Sem registro selecionado')
    else if (opFiscal.fequals('ativo', '0')) and (vDadosIni.ShowConfirmacao('Deseja mesmo restaurar o regitro selecionado?') = IDYES) then
      opFiscal.Restaurar;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOperacaoFiscal.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  opFiscal.HandleProdutos;
  grid_prod.Visible := True;
end;

procedure TfrmCadOperacaoFiscal.usarNCMProdutoPanelClick(Sender: TObject);
begin
  inherited;
  ed_ncm_ini.Text := ncmProduto;
  ed_ncm_fim.Text := ncmProduto;
end;

function TfrmCadOperacaoFiscal.ValidateForm: Boolean;
var
  validations: TStrings;
  I: Integer;
begin
  validations := NewStringList();


  if opFiscal.objeto.icms.interno.ativo = 1 then
    if (not (ed_intra_cfop.AsInteger >= 5000) and (ed_intra_cfop.AsInteger <= 5999)) then
      validations.Add('* CFOP Interno deve começar com 5');

  if opFiscal.objeto.icms.interestadual.ativo = 1 then
    if (not (ed_inter_cfop.AsInteger >= 6000) and (ed_inter_cfop.AsInteger <= 6999)) then
      validations.Add('* CFOP Interestadual deve começar com 6');

  if opFiscal.objeto.icms.exterior.ativo = 1 then
    if (not (ed_exterior_cfop.AsInteger >= 7000) and (ed_exterior_cfop.AsInteger <= 7999)) then
      validations.Add('* CFOP para o Exterior deve começar com 7');

  if VarToInt(ed_icms_deson.KeyValue) > 0 then
  begin
    if opFiscal.objeto.icms.interno.ativo = 1 then
      if (ed_intra_picms.AsValue <= 0) then
        validations.Add('* Quando existe desoneração favor preencher a alíquoda do ICMS Interno');

    if opFiscal.objeto.icms.interestadual.ativo = 1 then
      for I := 0 to listInter.Count - 1 do
        if (listInter[I] as TOpFiscal_ICMS_Dest_Params).aliq_icms <= 0 then
          validations.Add('* Quando existe desoneração favor preencher a alíquoda do ICMS interestadual. UF''s: ' + (listInter[I] as TOpFiscal_ICMS_Dest_Params).ufs);

    if opFiscal.objeto.icms.exterior.ativo = 1 then
      if (ed_exterior_picms.AsValue <= 0) then
        validations.Add('* Quando existe desoneração favor preencher a alíquoda do ICMS Exterior');

  end;

  if opFiscal.objeto.piscofins.ativo = 1 then
  begin
    if (VarToStr(ed_pc_cst.KeyValue) = '') then
      validations.Add('* CST do PISCOFINS obrigatório');

    if MatchStr(VarToStr(ed_pc_cst.KeyValue), ['01', '02', '03']) then
    begin
      if ed_pc_ppis.AsValue <= 0  then
        validations.Add('* Campo Aliquota do PIS obrigatório');
      if ed_pc_ppis.AsValue <= 0  then
        validations.Add('* Campo Aliquota do COFINS obrigatório');
    end
    else if not MatchStr(VarToStr(ed_pc_cst.KeyValue), ['49']) then
      if Length(OnlyNumber(ed_pc_natrec.Text)) <> 3 then
        validations.Add('* Campo Natureza da receita inválido. Preencher 3 dígitos numericos');
  end;

  if opFiscal.objeto.retTrib.ativo = 1 then
  begin
    if ed_ret_pir.AsValue < 0  then
      validations.Add('* Campo Aliquota do IR deve ser maior ou igual a zero');

    if ed_ret_pcsll.AsValue < 0  then
      validations.Add('* Campo Aliquota do CSLL deve ser maior ou igual a zero');

    if ed_ret_ppis.AsValue < 0  then
      validations.Add('* Campo Aliquota do PIS deve ser maior ou igual a zero');

    if ed_ret_pcofins.AsValue < 0  then
      validations.Add('* Campo Aliquota do COFINS deve ser maior ou igual a zero');
  end;

  if validations.Count > 0 then
    ShowAtencao(validations.Text);

  Result := validations.Count = 0;
end;

end.
