unit uCadSpedConfAjustesAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uEditHw, DBCtrls, CheckLst, uDataset_OOP,
  hw_subapuracao_conf;

type
  TfrmCadSpedConfAjustesAuto = class(TfrmCadPadraoM)
    ck_lixeira: TCheckBox;
    tsCadastro: TTabSheet;
    pn_cadastro: TPanel;
    Panel5: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    lb_data_cad: TDBText;
    Label45: TLabel;
    lb_data_mod: TDBText;
    Label46: TLabel;
    ed_id: TDBEdit;
    ed_descr: TDBEdit;
    PageControl2: TPageControl;
    tab_confs: TTabSheet;
    tab_cond: TTabSheet;
    Panel6: TPanel;
    ScrollBox4: TScrollBox;
    Panel7: TPanel;
    ed_cfop: TMaskEdit;
    Label26: TLabel;
    bt_cond_add_cfop: TSpeedButton;
    Panel9: TPanel;
    Label27: TLabel;
    SpeedButton9: TSpeedButton;
    Panel10: TPanel;
    ed_ncm_ini: TMaskEdit;
    ed_ncm_fim: TMaskEdit;
    Panel11: TPanel;
    Label28: TLabel;
    SpeedButton10: TSpeedButton;
    ed_uf: TMaskEdit;
    Panel12: TPanel;
    Label29: TLabel;
    SpeedButton13: TSpeedButton;
    ed_cons_final: TComboBox;
    Panel13: TPanel;
    Label30: TLabel;
    SpeedButton14: TSpeedButton;
    ed_cont_icms: TComboBox;
    Panel14: TPanel;
    Label31: TLabel;
    SpeedButton15: TSpeedButton;
    ed_pessoa: TComboBox;
    panl33: TPanel;
    Label32: TLabel;
    SpeedButton16: TSpeedButton;
    ed_finalid: TDBLookupComboBox;
    Panel16: TPanel;
    Label33: TLabel;
    SpeedButton17: TSpeedButton;
    ed_opfiscal: TDBLookupComboBox;
    Panel17: TPanel;
    Label34: TLabel;
    SpeedButton18: TSpeedButton;
    Panel18: TPanel;
    Label35: TLabel;
    SpeedButton19: TSpeedButton;
    Panel19: TPanel;
    Label36: TLabel;
    ed_aliq_cond: TEditHw;
    Label37: TLabel;
    Label38: TLabel;
    ed_aliq_cond_usar: TEditHw;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    DBGrid3: TDBGrid;
    bt_cond_edit_uf: TSpeedButton;
    Panel15: TPanel;
    Label39: TLabel;
    SpeedButton20: TSpeedButton;
    ed_orig_merc: TComboBox;
    ed_cst_icms: TComboBox;
    bt_cond_del: TSpeedButton;
    ScrollBox5: TScrollBox;
    GridPanel1: TGridPanel;
    pn_C197: TGridPanel;
    Label8: TLabel;
    ed_cod_obs: TDBLookupComboBox;
    Label9: TLabel;
    ed_cod_aj: TMaskEdit;
    Label12: TLabel;
    pn_title_c197: TPanel;
    Panel4: TPanel;
    ed_ativo_c197: TCheckBox;
    ed_conf_c197: TCheckListBox;
    Label10: TLabel;
    Label11: TLabel;
    ed_descr_c197: TMaskEdit;
    ed_aliq_c197: TDBEdit;
    pn_1921: TGridPanel;
    pn_title_1921: TPanel;
    Panel8: TPanel;
    ed_ativo_1921: TCheckBox;
    Label13: TLabel;
    ed_cod_ajuste: TMaskEdit;
    Label15: TLabel;
    ed_DescricaoComplementar1921: TMaskEdit;
    Label17: TLabel;
    Label25: TLabel;
    ed_conf_1921: TCheckListBox;
    ed_aliq_1921: TDBEdit;
    SpeedButton59: TSpeedButton;
    Panel23: TPanel;
    Label14: TLabel;
    SpeedButton21: TSpeedButton;
    ed_finalid_emissao: TComboBox;
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_cond_delClick(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure bt_cond_edit_ufClick(Sender: TObject);
    procedure ed_cfopExit(Sender: TObject);
    procedure ed_cfopChange(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure bt_cond_add_cfopClick(Sender: TObject);
    procedure ed_ativo_c197Click(Sender: TObject);
    procedure ed_ativo_1921Click(Sender: TObject);
    procedure ed_cod_obsExit(Sender: TObject);
    procedure pn_cadastroEnter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    lkLancFiscal: TDadosLookUp_OOP;
    lkFinalidades: TDadosLookUp_OOP;
    lkOpFiscal: TDadosLookUp_OOP;

    procedure buildCadastro(inEdit: Boolean);

    function ValidateForm: Boolean;

    procedure MapDataToForm;
    procedure MapFormToData;

  public

  end;

var
  frmCadSpedConfAjustesAuto: TfrmCadSpedConfAjustesAuto;

implementation

uses
  Math,
  StrUtils,
  uDtmAtivo,
  uClassesSped,
  hw_utils, efd_ajustes_conf_tipo_class, DB;

{$R *.dfm}

procedure ajustesautoefd_show(Amodal: Boolean);
begin
  vDadosIni.vTipoForm := 0;
  if not Assigned(frmCadSpedConfAjustesAuto) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm(TfrmCadSpedConfAjustesAuto, frmCadSpedConfAjustesAuto);
  end;
  if frmCadSpedConfAjustesAuto.FormStyle = fsMDIChild then
    frmCadSpedConfAjustesAuto.Show
  else
    frmCadSpedConfAjustesAuto.ShowModal;
end;

exports
  ajustesautoefd_show;

procedure TfrmCadSpedConfAjustesAuto.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not ajustesConf.Auditor.Processo('SPED110').Visualizar.Permitido then
      Exit;

    inherited;

    if MaskEdit2.Visible then
    begin
      if not ajustesConf.ConsultaCampos(ajustesConf.TableName, ComboBox1.Text,
        'ID', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, IfThen(ck_lixeira.Checked, 0, 1)) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if ajustesConf.ConsultaCampos(ajustesConf.TableName, MaskEdit3.text, ComboBox1.Text,
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

procedure TfrmCadSpedConfAjustesAuto.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;

    if not ajustesConf.Insert then
      Exit;

//    ncm_change(ajustesConf.objeto.NCMs);
//    mva_change(ajustesConf.objeto.MVAs);

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

procedure TfrmCadSpedConfAjustesAuto.BitBtn4Click(Sender: TObject);
begin
  try
    BitBtn4.Enabled := False;
    Screen.Cursor := crHourGlass;

    if not ValidateForm then
      Exit;

    MapFormToData;

//    ajustesConf.dataSet.FieldByName('ufs_convenio').AsString := list_uf.Items.Text;

    if not ajustesConf.post then
    begin
      PageControl3.ActivePage := tsCadastro;
      setFocusCampoErro(ajustesConf.vNomeCampoErro);
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
        if ajustesConf.Insert then
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

procedure TfrmCadSpedConfAjustesAuto.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ajustesConf.Cancel;
end;

procedure TfrmCadSpedConfAjustesAuto.bt_cond_add_cfopClick(Sender: TObject);
var
  list, erros: TStrings;
  I: Integer;
begin
  inherited;

  ed_cfop.Text := OnlyNumber(StrReplace(ed_cfop.Text, [' ', '.', ';', '-', ':', '|', '/', '\'],','), ',');

  list := NewStringList(True, ajustesConf.condicoes.SortAndIgnoreDup(ed_cfop.Text), ',');
  erros := NewStringList(True);

  for I := list.Count - 1 downto 0 do
    if Trim(list[I]) = '' then
      list.Delete(I)
    else    
    if (Length(list[I]) <> 4)
      or (not MatchText(list[I][1], ['1','2','3','5','6','7'])) then
      erros.Add('* CFOP: ' + list[I] + ' inválido');

  if erros.Count > 0 then
  begin
    ShowAtencao(erros.Text);
    Exit;
  end;

  if list.Count = 0 then
  begin
    ShowAtencao('Nenhum CFOP informado');
    Exit;
  end;

  for I := 0 to List.Count - 1 do
    ajustesConf.condicoes.AddCondicao(tcaCFOP, list[I], list[I]);

  ed_cfop.Text := '';
    //ed_cond_pessoa.ItemIndex := -1;

end;

procedure TfrmCadSpedConfAjustesAuto.bt_cond_delClick(Sender: TObject);
begin
  inherited;

  ajustesConf.condicoes.RemoveCondicao();
end;

procedure TfrmCadSpedConfAjustesAuto.bt_cond_edit_ufClick(Sender: TObject);
var
  Str: string;
  I: Integer;
  list: TStrings;
begin
  inherited;

  Str := StrReplace(UpperCase(ed_uf.Text), [';', ' ', '-', '|', '+', '.', '/', '*'], ',');

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
    ajustesConf.condicoes.AddCondicao(tcaUF, Str, Str);
    ed_uf.Clear;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.buildCadastro(inEdit: Boolean);
begin

  if not Assigned(lkLancFiscal) then
    lkLancFiscal:= TDadosLookUp_OOP.create;
  
    lkLancFiscal.setDadosDataSet('cod_obs', 'txt;cod_padrao_ajuste',
      ajustesConf.queryCons
        .Table('SPED_LANCAMENTO_FISCAL', 'cod_obs, txt, cod_padrao_ajuste')
        .Equals('cod_empresa', vDadosIni.cod_empresa)
        .OrderBy('txt')
        .Open().query, ed_cod_obs);
  
  if not Assigned(lkFinalidades) then  
    lkFinalidades := TDadosLookUp_OOP.create;
    
    lkFinalidades.setDadosDataSet('id', 'name',
      ajustesConf.queryCons.Table('finalidade', 'id, (descricao || '' - '' || id) name')
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .OrderBy('descricao').Open().query,
      ed_finalid);
  
  if not Assigned(lkOpFiscal) then  
    lkOpFiscal := TDadosLookUp_OOP.create;
    
  lkOpFiscal.setDadosDataSet('id', 'name',
    ajustesConf.queryCons.Table('opf', 'id, (descricao || '' - '' || id) name')
    .Equals('cod_empresa', vDadosIni.cod_empresa)
    .Equals('ativo', 1)
    .OrderBy('descricao').Open().query,
    ed_opfiscal);

  MapDataToForm;

  PageControl1.ActivePage := TabSheet1;
  PageControl2.ActivePage := tab_confs;
  PageControl3.ActivePage := tsCadastro;

  ed_ativo_c197Click(ed_ativo_c197);
  ed_ativo_1921Click(ed_ativo_1921);

  if (Self.Enabled) and (Self.Visible) and (ed_descr.CanFocus) then
    ed_descr.SetFocus;
end;

procedure TfrmCadSpedConfAjustesAuto.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
    BitBtn3Click(Sender);
end;

procedure TfrmCadSpedConfAjustesAuto.DBGrid3DrawColumnCell(Sender: TObject;
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
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadSpedConfAjustesAuto.ed_ativo_1921Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;

  for I := 0 to Self.ComponentCount - 1 do
    if (Self.Components[I] is TControl)
      and ((Self.Components[I] as TControl).Parent = pn_1921)
      and ((Self.Components[I] as TControl) <> pn_title_1921)
    then
      (Self.Components[I] as TControl).Enabled := ed_ativo_1921.Checked;
end;

procedure TfrmCadSpedConfAjustesAuto.ed_ativo_c197Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;

  for I := 0 to Self.ComponentCount - 1 do
    if (Self.Components[I] is TControl)
      and ((Self.Components[I] as TControl).Parent = pn_C197)
      and ((Self.Components[I] as TControl) <> pn_title_c197)
    then
      (Self.Components[I] as TControl).Enabled := ed_ativo_c197.Checked;
end;

procedure TfrmCadSpedConfAjustesAuto.ed_cfopChange(Sender: TObject);
var
  i: Integer;
begin
  inherited;

end;

procedure TfrmCadSpedConfAjustesAuto.ed_cfopExit(Sender: TObject);
begin
  inherited;
  ed_cfop.Text := OnlyNumber(StrReplace(ed_cfop.Text, [' ', '.', ';', '-', ':', '|', '/', '\'],','), ',');
end;

procedure TfrmCadSpedConfAjustesAuto.ed_cod_obsExit(Sender: TObject);
begin
  inherited;
  if (lkLancFiscal.fstr('cod_padrao_ajuste') <> '')
    and (lkLancFiscal.fstr('cod_padrao_ajuste') <> ed_cod_aj.Text)
  then
    if (Trim(ed_cod_aj.Text) = '' )
      or (ShowConfirmacao('Codigo de ajuste(%s) difere do selecionado no lançamento(%s). Deseja alterar?',
                          [ed_cod_aj.Text, lkLancFiscal.fstr('cod_padrao_ajuste')]) = IDYES) then
      ed_cod_aj.Text := lkLancFiscal.fstr('cod_padrao_ajuste');
end;

procedure TfrmCadSpedConfAjustesAuto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadSpedConfAjustesAuto := nil;

//  if Assigned(lkCstIcms) then
//    FreeAndNil(lkCstIcms);
//  if Assigned(lkDeson) then
//    FreeAndNil(lkDeson);
//  if Assigned(ajustesConf) then
//    FreeAndNil(ajustesConf);
//  if Assigned(listInter) then
//    FreeAndNil(listInter);
end;

procedure TfrmCadSpedConfAjustesAuto.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  if not Assigned(ajustesConf) then
  begin
    ajustesConf := TEfdConfAjuestesAuto.Create;
//    ajustesConf.OnChange := cest_change;
    DBGrid1.DataSource := ajustesConf._dataSourceOOP;

//    DBGrid2.DataSource := ajustesConf.condicoes.ncms._dataSourceOOP;
    DBGrid3.DataSource := ajustesConf.condicoes._dataSourceOOP;
//    grid_prod.DataSource := ajustesConf.produtos._dataSourceOOP;
  end;
//  listInter := TObjectList.Create;
  tsCadastro.TabVisible := False;
  TabSheet1.TabVisible := False;
//  tsOutras.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
//  bt_icms_cadastro_inter_adiciona.Align := alClient;
//  bt_icms_cadastro_inter_salva.Align := alClient;
//  pn_condicionais_opcionais_top.Align := alTop;
//  ed_inter_ufs.Items.LineBreak := ',';
//  indexInter := -1;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadSpedConfAjustesAuto.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
//    ed_item_txt.BorderStyle   := bsNone;
//    ed_ambito_txt.BorderStyle := bsNone;
    DBGrid1.DataSource := ajustesConf._dataSourceOOP;
    ajustesConf.montaSelect('select * from %s where id = '''' and cod_empresa = 0', [ajustesConf.TableName]);
    //ajustesConf.dataSet.FieldByName('cod_empresa').Tag := 1;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
//  Panel4.BevelOuter := bvNone;

//  tsOutras.TabVisible := False;

  if TelaCadastro = 1 then
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

procedure TfrmCadSpedConfAjustesAuto.MapDataToForm;
var
  I: Integer;
  conf: TStrings;
  value: string;
begin
  ed_cod_obs.KeyValue   := ajustesConf.objeto.ajusteC197.cod_obs;
  ed_cod_aj.Text        := ajustesConf.objeto.ajusteC197.cod_ajuste;
  //ed_aliq_c197.AsValue := VarToFloat(ajustesConf.objeto.ajusteC197.aliquota);
  ed_descr_c197.Text    := ajustesConf.objeto.ajusteC197.conf.Values['DescricaoComplementar'];
  ed_ativo_c197.Checked := (ajustesConf.objeto.ajusteC197.ativo = 1) or (ajustesConf.objeto.ajusteC197.ativo = Null);

  //conf := ajustesConf.objeto.ajusteC197.conf;

  for I := 0 to ed_conf_c197.Items.Count - 1 do
    ed_conf_c197.Checked[I] := ajustesConf.objeto.ajusteC197.conf
      .Values[StringReplace(ed_conf_c197.Items[I], ' ', '', [rfReplaceAll])] = 'S';
                     {
  ed_IndicadorApuracaoIcms1900.ItemIndex := -1;

  value := Copy(ajustesConf.objeto.ajuste1921.conf.Values['IndicadorApuracaoIcms1900'], 1, 1);
  for I := 0 to ed_IndicadorApuracaoIcms1900.Items.Count - 1 do
    if Copy(ed_IndicadorApuracaoIcms1900.Items[I], 1, 1) = value then
      ed_IndicadorApuracaoIcms1900.ItemIndex := I;

  if ed_IndicadorApuracaoIcms1900.ItemIndex = -1 then
    ed_IndicadorApuracaoIcms1900.ItemIndex := 0;
    
  ed_DescricaoComplementar1900.Text := ajustesConf.objeto.ajuste1921.conf.Values['DescricaoComplementar1900'];
  ed_CodigoObrigacaoRecolher1926.Text := ajustesConf.objeto.ajuste1921.conf.Values['CodigoObrigacaoRecolher1926'];
  ed_CodigoReceitaObrigacaoRecolher1926.Text := ajustesConf.objeto.ajuste1921.conf.Values['CodigoReceitaObrigacaoRecolher1926'];
  ed_NumeroProcessoObrigacaoRecolher1926.Text := ajustesConf.objeto.ajuste1921.conf.Values['NumeroProcessoObrigacaoRecolher1926'];
  ed_DescricaoProcessoObrigacaoRecolher1926.Text := ajustesConf.objeto.ajuste1921.conf.Values['DescricaoProcessoObrigacaoRecolher1926'];
  ed_TextoComplementarObrigacaoRecolher1926.Text := ajustesConf.objeto.ajuste1921.conf.Values['TextoComplementarObrigacaoRecolher1926'];

  value := ajustesConf.objeto.ajuste1921.conf.Values['DiaVencimentoObrigacaoRecolher1926'];
  I := 9;
  TryStrToInt(value, I);
  ed_DiaVencimentoObrigacaoRecolher1926.AsValue := I;   

  value := Copy(ajustesConf.objeto.ajuste1921.conf.Values['IndicadorProcessoObrigacaoRecolher1926'], 1, 1);
  for I := 0 to ed_IndicadorProcessoObrigacaoRecolher1926.Items.Count - 1 do
    if Copy(ed_IndicadorProcessoObrigacaoRecolher1926.Items[I], 1, 1) = value then
      ed_IndicadorProcessoObrigacaoRecolher1926.ItemIndex := I;
    }

  ed_ativo_1921.Checked := (ajustesConf.objeto.ajuste1921.ativo = 1) or (ajustesConf.objeto.ajuste1921.ativo = Null);
  ed_cod_ajuste.Text := ajustesConf.objeto.ajuste1921.cod_ajuste;
  ed_DescricaoComplementar1921.Text := ajustesConf.objeto.ajuste1921.conf.Values['DescricaoComplementar1921'];


  for I := 0 to ed_conf_1921.Items.Count - 1 do
    ed_conf_1921.Checked[I] := ajustesConf.objeto.ajuste1921.conf
      .Values[StringReplace(ed_conf_1921.Items[I], ' ', '', [rfReplaceAll])] = 'S';

      {
  ed_intra_cfop.AsValue      := ajustesConf.objeto.icms.interno.cfop;
  if ajustesConf.objeto.icms.interno.params.Count > 0 then
  begin
    ed_intra_picms.AsValue   := (ajustesConf.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms;
    ed_intra_pfcp.AsValue    := (ajustesConf.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp;
    ed_intra_predbc.AsValue  := (ajustesConf.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_red_bc;
    ed_intra_pdif.AsValue    := (ajustesConf.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms_dif;
    ed_intra_pfcpdif.AsValue := (ajustesConf.objeto.icms.interno.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp_dif;
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

  ed_inter_cfop.AsValue      := ajustesConf.objeto.icms.interestadual.cfop;
  if ajustesConf.objeto.icms.interestadual.params.Count > 0 then
  begin
    ed_inter_picms.AsValue   := (ajustesConf.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms;
    ed_inter_pfcp.AsValue    := (ajustesConf.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp;
    ed_inter_predbc.AsValue  := (ajustesConf.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_red_bc;
    ed_inter_pdif.AsValue    := (ajustesConf.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms_dif;
    ed_inter_pfcpdif.AsValue := (ajustesConf.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp_dif;
    ed_inter_ufs.Items.Text  := (ajustesConf.objeto.icms.interestadual.params.Items[0] as TOpFiscal_ICMS_Dest_Params).ufs;
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

  ed_exterior_cfop.AsValue    := ajustesConf.objeto.icms.exterior.cfop;
  if ajustesConf.objeto.icms.exterior.params.Count > 0 then
  begin
    ed_exterior_picms.AsValue   := (ajustesConf.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms;
    ed_exterior_pfcp.AsValue    := (ajustesConf.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp;
    ed_exterior_predbc.AsValue  := (ajustesConf.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_red_bc;
    ed_exterior_pdif.AsValue    := (ajustesConf.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_icms_dif;
    ed_exterior_pfcpdif.AsValue := (ajustesConf.objeto.icms.exterior.params.Items[0] as TOpFiscal_ICMS_Dest_Params).aliq_fcp_dif;
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
  ed_pc_cst.KeyValue    := ajustesConf.objeto.piscofins.cst;
  ed_pc_deson.KeyValue  := VarToInt(ajustesConf.objeto.piscofins.motdespc);
  ed_pc_ppis.AsValue    := VarToFloat(ajustesConf.objeto.piscofins.aliq_pis);
  ed_pc_pcofins.AsValue := VarToFloat(ajustesConf.objeto.piscofins.aliq_cofins);
  ed_pc_natrec.Text     := ajustesConf.objeto.piscofins.nat_rec;
  }
end;

procedure TfrmCadSpedConfAjustesAuto.MapFormToData;
var
  I: Integer;
  value: string;
begin

  ajustesConf.objeto.ajusteC197.cod_obs := ed_cod_obs.KeyValue;
  ajustesConf.objeto.ajusteC197.cod_ajuste := ed_cod_aj.Text;
  ajustesConf.objeto.ajusteC197.conf.Values['DescricaoComplementar'] := ed_descr_c197.Text;
  ajustesConf.objeto.ajusteC197.ativo := IfThen(ed_ativo_c197.Checked, 1, 0);

  for I := 0 to ed_conf_c197.Items.Count - 1 do
    ajustesConf.objeto.ajusteC197.conf
      .Values[StringReplace(ed_conf_c197.Items[I], ' ', '', [rfReplaceAll])] :=
        IfThen(ed_conf_c197.Checked[I], 'S', 'N');


  ajustesConf.objeto.ajuste1921.ativo := IfThen(ed_ativo_1921.Checked, 1, 0);
  {
  ajustesConf.objeto.ajuste1921.conf.Values['IndicadorApuracaoIcms1900'] := Copy(ed_IndicadorApuracaoIcms1900.Text, 1, 1);
  ajustesConf.objeto.ajuste1921.conf.Values['DescricaoComplementar1900'] := ed_DescricaoComplementar1900.Text;

  ajustesConf.objeto.ajuste1921.conf.Values['CodigoObrigacaoRecolher1926'] := ed_CodigoObrigacaoRecolher1926.Text;
  ajustesConf.objeto.ajuste1921.conf.Values['CodigoReceitaObrigacaoRecolher1926'] := ed_CodigoReceitaObrigacaoRecolher1926.Text;
  ajustesConf.objeto.ajuste1921.conf.Values['NumeroProcessoObrigacaoRecolher1926'] := ed_NumeroProcessoObrigacaoRecolher1926.Text;
  ajustesConf.objeto.ajuste1921.conf.Values['DescricaoProcessoObrigacaoRecolher1926'] := ed_DescricaoProcessoObrigacaoRecolher1926.Text;
  ajustesConf.objeto.ajuste1921.conf.Values['TextoComplementarObrigacaoRecolher1926'] := ed_TextoComplementarObrigacaoRecolher1926.Text;
  ajustesConf.objeto.ajuste1921.conf.Values['DiaVencimentoObrigacaoRecolher1926'] := IntToStr(ed_DiaVencimentoObrigacaoRecolher1926.AsInteger);
  ajustesConf.objeto.ajuste1921.conf.Values['IndicadorProcessoObrigacaoRecolher1926'] := Copy(ed_IndicadorProcessoObrigacaoRecolher1926.Text, 1, 1);
  }

  ajustesConf.objeto.ajuste1921.cod_ajuste := ed_cod_ajuste.Text;
  ajustesConf.objeto.ajuste1921.conf.Values['DescricaoComplementar1921'] := ed_DescricaoComplementar1921.Text;

  for I := 0 to ed_conf_1921.Items.Count - 1 do
    ajustesConf.objeto.ajuste1921.conf
      .Values[StringReplace(ed_conf_1921.Items[I], ' ', '', [rfReplaceAll])] :=
        IfThen(ed_conf_1921.Checked[I], 'S', 'N');
end;

procedure TfrmCadSpedConfAjustesAuto.pn_cadastroEnter(Sender: TObject);
begin
  inherited;
  if not Assigned(ed_id.DataSource) then
  begin
    ed_id.DataSource         := ajustesConf._dataSourceOOP;
    ed_descr.DataSource      := ajustesConf._dataSourceOOP;
    lb_data_cad.DataSource   := ajustesConf._dataSourceOOP;
    lb_data_mod.DataSource   := ajustesConf._dataSourceOOP;
    ed_aliq_c197.DataSource  := ajustesConf._dataSourceOOP;
    ed_aliq_1921.DataSource  := ajustesConf._dataSourceOOP;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton10Click(Sender: TObject);
var
  Str: string;
  I: Integer;
  list: TStrings;
begin
  inherited;

  Str := StrReplace(UpperCase(ed_uf.Text), [';', ' ', '-', '|', '+', '.', '/', '*'], ',');

  ajustesConf.condicoes.prepare_loop(Format('cond = %d', [ord(tcaUF)]));
  try
    Str := Str + ',' + ajustesConf.condicoes.fstr('valor');
  finally
    ajustesConf.condicoes.prepare_loop_done();
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
    ajustesConf.condicoes.AddCondicao(tcaUF, Str, Str);
    ed_uf.Clear;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if ed_cons_final.ItemIndex >= 0 then
  begin
    ajustesConf.condicoes.AddCondicao(tcaConsumoFinal, Copy(ed_cons_final.Text, 1, 1), ed_cons_final.Text);
    ed_cons_final.ItemIndex := -1;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if ed_cont_icms.ItemIndex >= 0 then
  begin
    ajustesConf.condicoes.AddCondicao(tcaContribuite, Copy(ed_cont_icms.Text, 1, 1), ed_cont_icms.Text);
    ed_cont_icms.ItemIndex := -1;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  if ed_pessoa.ItemIndex >= 0 then
  begin
    ajustesConf.condicoes.AddCondicao(tcaPessoa, Copy(ed_pessoa.Text, 1, 2), ed_pessoa.Text);
    ed_pessoa.ItemIndex := -1;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  if ed_finalid.KeyValue <> Null then
  begin
    ajustesConf.condicoes.AddCondicao(tcaFinalidade, lkFinalidades.dataSet.FieldByName('id').AsString, lkFinalidades.dataSet.FieldByName('name').AsString);
    ed_finalid.KeyValue := Null;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  if ed_opfiscal.KeyValue <> Null then
  begin
    ajustesConf.condicoes.AddCondicao(tcaOperacaoFiscal, lkOpFiscal.dataSet.FieldByName('id').AsString, lkOpFiscal.dataSet.FieldByName('name').AsString);
    ed_opfiscal.KeyValue := Null;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  if ed_orig_merc.ItemIndex >= 0 then
  begin
    ajustesConf.condicoes.AddCondicao(tcaOrigemMerc, Copy(ed_orig_merc.Text, 1, 1), Copy(ed_orig_merc.Text, 1, 1));
    ed_orig_merc.ItemIndex := -1;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton19Click(Sender: TObject);
var
  sText: string;
begin
  inherited;
  if ed_aliq_cond.AsValue > 0 then
  begin
    sText := FloatToStr(ed_aliq_cond.AsValue);
    if ed_aliq_cond_usar.AsValue > 0then
      sText := 'Quando '+ sText + ' Utilizar ' +  FloatToStr(ed_aliq_cond_usar.AsValue);
      
    ajustesConf.condicoes.AddCondicao(tcaAliqICMS, FloatToStr(ed_aliq_cond.AsValue), sText, ed_aliq_cond_usar.AsValue);

    ed_aliq_cond.AsValue := 0;
    ed_aliq_cond_usar.AsValue := 0;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not ajustesConf.Edit then
      exit;

//    ncm_change(ajustesConf.objeto.NCMs);
//    mva_change(ajustesConf.objeto.MVAs);

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

procedure TfrmCadSpedConfAjustesAuto.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  if ed_cst_icms.ItemIndex >= 0 then
  begin
    ajustesConf.condicoes.AddCondicao(tcaCstIcms, Copy(ed_cst_icms.Text, 1, 2), Copy(ed_cst_icms.Text, 1, 2));
    ed_cst_icms.ItemIndex := -1;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  if ed_finalid_emissao.ItemIndex >= 0 then
  begin
    ajustesConf.condicoes.AddCondicao(tcaFinaliEmissao, Copy(ed_finalid_emissao.Text, 1, 1), ed_finalid_emissao.Text);
    ed_finalid_emissao.ItemIndex := -1;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

//    if not allowsChange() then
//      Exit;

    if ajustesConf.dataSet.IsEmpty then
      vDadosIni.ShowErro('Sem registro selecionado')
    else if (ajustesConf.fequals('ativo', '1')) and (vDadosIni.ShowConfirmacao('Deseja mesmo enviar o regitro para lixeira?') = IDYES) then
      ajustesConf.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  SubApuracaoUtils.ShowConf(ajustesConf.buscas.Database, vDadosIni.cod_empresa);
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton5Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

//    if not allowsChange() then
//      Exit;

    if ajustesConf.dataSet.IsEmpty then
      vDadosIni.ShowErro('Sem registro selecionado')
    else if (ajustesConf.fequals('ativo', '0')) and (vDadosIni.ShowConfirmacao('Deseja mesmo restaurar o regitro selecionado?') = IDYES) then
      ajustesConf.Restaurar;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedConfAjustesAuto.SpeedButton9Click(Sender: TObject);
var
  ncmIni, ncmFim: string;
begin
  inherited;

  ncmIni := OnlyNumber(ed_ncm_ini.Text);
  ncmFim := OnlyNumber(ed_ncm_fim.Text);

  if ((Length(ncmIni) > 0) and (Length(ncmIni) <> 8))
    or ((Length(ncmFim) > 0) and (Length(ncmFim) <> 8))
  then
  begin
    ShowAtencao('NCM deve conter 8 dígitos' + sLineBreak + sLineBreak +
                'Pode informar apenas o primeiro campo do NCM ou os dois campos');
    Exit;
  end;

  if ((Length(ncmIni) = 0) and (Length(ncmFim) = 0))
  then
  begin
    ShowAtencao('Nenhum NCM informado' + sLineBreak + sLineBreak + 
                'Pode informar apenas o primeiro campo do NCM ou os dois campos');
    Exit;
  end;

  if ((Length(ncmIni) = 8) and (Length(ncmFim) = 8) and (ncmFim > ncmIni))
  then
  begin
    ShowAtencao('NCM inicial deve ser menor que o NCM final');
    Exit;
  end;

  ncmIni := ncmIni + IfThen(Trim(ncmFim) <> '', '-' + ncmFim);

  ajustesConf.condicoes.AddCondicao(tcaNCM, ncmIni, ncmIni);
  ed_ncm_ini.Text := '';
  ed_ncm_fim.Text := '';
end;

function TfrmCadSpedConfAjustesAuto.ValidateForm: Boolean;
var
  validations: TStrings;
  I: Integer;
begin
  validations := NewStringList();

  if ed_ativo_c197.Checked then
  begin

    if (VarToInt(ed_cod_obs.KeyValue) = 0) then
      validations.Add('* Lançamento Fiscal - Registros 0460 obrigatório');

    if Trim(ed_cod_aj.Text) = ''then
      validations.Add('* Código de ajuste obrigatório');

    if Length(Trim(ed_cod_aj.Text)) <> 10 then
      validations.Add('* Código de ajuste inválido, precisa conter 10 dígitos');

    if NewStringList(vDadosIni.getListaUF()).IndexOf(Copy(ed_cod_aj.Text, 1, 2)) = -1 then
      validations.Add('* Código de ajuste inválido, precisa iniciar com a sigla de um Estado');

    if ajustesConf.ffloat('aliq_c197') < 0 then
      validations.Add('* Aliquota - C197 inválida, não pode ser negativa');
  end;

  if ed_ativo_1921.Checked then
  begin

//    if (ed_IndicadorApuracaoIcms1900.ItemIndex = -1 ) then
//      validations.Add('* Indicador Apuração ICMS obrigatório');

    if Trim(ed_cod_ajuste.Text) = ''then
      validations.Add('* Código de ajuste 1921 obrigatório');

    if Length(Trim(ed_cod_ajuste.Text)) <> 8 then
      validations.Add('* Código de ajuste 1921 inválido, precisa conter 8 dígitos');

    if NewStringList(vDadosIni.getListaUF()).IndexOf(Copy(ed_cod_ajuste.Text, 1, 2)) = -1 then
      validations.Add('* Código de ajuste 1921 inválido, precisa iniciar com a sigla de um Estado');

    if ajustesConf.ffloat('aliq_1921') < 0 then
      validations.Add('* Aliquota - 1921 inválida, não pode ser negativa');
      
    if ajustesConf.ffield('aliq_1921').IsNull then
      validations.Add('* Aliquota - 1921 obrigatória');
  end;

  if validations.Count > 0 then
    ShowAtencao(validations.Text);

  Result := validations.Count = 0;
end;

end.
