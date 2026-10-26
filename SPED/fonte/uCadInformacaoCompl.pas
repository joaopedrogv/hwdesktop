unit uCadInformacaoCompl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, ButtonGroup, uDataSet_OOP;

type
  TfrmCadInformacaoCompl = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBComboBox1: TDBComboBox;
    SpeedButton16: TSpeedButton;
    ts_ref: TTabSheet;
    pn_ref: TPanel;
    group_cst_icm: TGroupBox;
    btgroup_cst: TButtonGroup;
    bt_trib_pref_new: TSpeedButton;
    SpeedButton9: TSpeedButton;
    lkAtivaNFe: TDBLookupComboBox;
    Label10: TLabel;
    Label11: TLabel;
    lkAtivaNFCe: TDBLookupComboBox;
    procedure SpeedButton9Click(Sender: TObject);
    procedure btgroup_cstButtonClicked(Sender: TObject; Index: Integer);
    procedure bt_trib_pref_newClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    simNaoLK: TDadosLookUp_OOP;

    procedure montarcomponentes;
  public
    { Public declarations }
  end;

var
  frmCadInformacaoCompl: TfrmCadInformacaoCompl;

implementation

uses uDtmAtivo, uClassesSped, uDtmSPED, DB, cst_icms_inf_cpl_class, uDadosIni, StrUtils;

{$R *.dfm}

procedure TfrmCadInformacaoCompl.BitBtn1Click(Sender: TObject);
begin
  try
  SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED005]';
  
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('SPED002', 'CONSULTA', '', 'SPED_INFORMACAO_COMPLEMENTAR', '', infCompl.buscas, False) then
      Exit;

    inherited;
    
    if MaskEdit2.Visible then
    begin
      if not infCompl.ConsultaCampos('SPED_INFORMACAO_COMPLEMENTAR', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if infCompl.ConsultaCampos('SPED_INFORMACAO_COMPLEMENTAR', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

  //  SpeedButton1.Visible := true;
  //  SpeedButton5.Visible := false;
    lixeiraVazia(not infCompl._statuslixeira);
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadInformacaoCompl.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;
    if not infCompl.Insert then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    SpeedButton16.Enabled := True;
    montarcomponentes;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadInformacaoCompl.BitBtn4Click(Sender: TObject);
begin
  if not infCompl.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(infCompl.vNomeCampoErro);
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
      if infCompl.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
        	DBComboBox1.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

procedure TfrmCadInformacaoCompl.BitBtn5Click(Sender: TObject);
begin
  infCompl.Cancel;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadInformacaoCompl.btgroup_cstButtonClicked(Sender: TObject;
  Index: Integer);
begin
  inherited;
  if vDadosIni.ShowConfirmacao('Excluir CST ou CSOSN da lista?') = IDYES then
  begin
    if infCompl.refCST.Remover(TButtonGroup(Sender).Items[Index].Caption) then
      TButtonGroup(Sender).Items.Delete(Index);
  end;
end;

procedure TfrmCadInformacaoCompl.bt_trib_pref_newClick(Sender: TObject);
begin
  inherited;
  if not Assigned(infCompl.refCST) then
    Exit;

  try
    pn_modal_top.Caption    := 'Selecione o CST ou CSOSN';
    pn_modal_top.Visible    := True;
    bt_modal_assume.Visible := True;
    bt_modal_cancel.Visible := True;
    grid_modal.DataSource   := infCompl.refCST.consCST._dataSourceOOP;
    infCompl.refCST.consCST.Open;

    if vDadosIni.abreForm('Lista de CST e CSOSN', pn_modal, [ofAlignAllClientWinCtrl, ofBIMinimizeOff, ofStoreMaximized]) then
      if infCompl.refCST.Adicionar(infCompl.refCST.consCST.f_str('cst_csosn')) then
          montarcomponentes;
  finally
    infCompl.refCST.consCST.Close;
    grid_modal.DataSource   := nil;
    pn_modal_top.Visible    := False;
    bt_modal_assume.Visible := False;
    bt_modal_cancel.Visible := False;
  end;
end;

procedure TfrmCadInformacaoCompl.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  DBEdit1.Enabled := False;
end;

procedure TfrmCadInformacaoCompl.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadInformacaoCompl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  infCompl.Free;
  infCompl := nil;

  simNaoLK.Free;

  Action := caFree;
  frmCadInformacaoCompl := nil;
end;

procedure TfrmCadInformacaoCompl.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  infCompl := TInformacaoComplementarSPED.create;
  simNaoLK := TDadosLookUp_OOP.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmCadInformacaoCompl.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (infCompl.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadInformacaoCompl.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmSPED.dsInfCompl;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not infCompl._statuslixeira);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadInformacaoCompl.montarcomponentes;
var
  I: Integer;
begin
  tsCadastro.TabVisible := True;
  infCompl.refCST.consCST.Open;
  try
    while btgroup_cst.Items.Count > 0 do
      btgroup_cst.Items.Delete(btgroup_cst.Items.Count - 1);
    for I := 0 to infCompl.refCST.Count - 1 do with infCompl.refCST.Items[I] do
      with btgroup_cst.Items.Add do
      begin
        Caption := cst_csosn;
        infCompl.refCST.consCST.filterStr('tipo = %s', [QuotedStr(cst_csosn)]);
        try
          Hint  := Format('%s - %s', [cst_csosn, infCompl.refCST.consCST.f_str('descricao')]);
        finally
          infCompl.refCST.consCST.filterClear;
        end;
      end;

    simNaoLK.setDadosDataSet(['S', 'N'], ['Sim', 'Não'], lkAtivaNFe);
    simNaoLK.setDBLookupComboBox(lkAtivaNFCe);
  finally
    infCompl.refCST.consCST.Close;
  end;
end;

procedure TfrmCadInformacaoCompl.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('SPED009', 'HABILITAR', '', 'SPED_INFORMACAO_COMPLEMENTAR', '', infCompl.buscas, False) then
  begin
    DBEdit1.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus;
  end;
end;

procedure TfrmCadInformacaoCompl.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not infCompl.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    SpeedButton16.Enabled := False;
    montarcomponentes;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadInformacaoCompl.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('SPED008', 'ABRIR A LIXEIRA', '', 'SPED_INFORMACAO_COMPLEMENTAR',
    '', infCompl.buscas, true) then
  Exit;

  inherited;

  if not infCompl._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED005]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [SPED005]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadInformacaoCompl.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    infCompl.Delete;
    lixeiraVazia(not infCompl._statuslixeira);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadInformacaoCompl.SpeedButton4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('SPED008', 'ABRIR A LIXEIRA', '', 'SPED_INFORMACAO_COMPLEMENTAR',
    '', infCompl.buscas, true) then
    Exit;

  inherited;
  if not infCompl._abrelixeira then
  begin
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;

end;

procedure TfrmCadInformacaoCompl.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('SPED007', '', '', 'SPED_INFORMACAO_COMPLEMENTAR', '', infCompl.buscas, false) then
    if infCompl._restauraLixeira then
      lixeiraVazia(not infCompl._statuslixeira);
end;

procedure TfrmCadInformacaoCompl.SpeedButton9Click(Sender: TObject);
var
  Atipo: string;
begin
  inherited;
  Atipo := infCompl.fstr('TIPO');
  if not MatchText(Atipo, ['CUPOM', 'DESONERACAO', 'NFE', 'NFCE']) then
    Exit;

  infCompl.dataSet.FieldByName('TXT').AsString := IfThen(Atipo = 'CUPOM'      , 'Ref ECF:') +
                                                  IfThen(Atipo = 'DESONERACAO', '') +
                                                  IfThen(Atipo = 'NFCE'       , 'Ref NFC-e:') +
                                                  IfThen(Atipo = 'NFE'        , 'Ref NF-e:');
  infCompl.dataSet.FieldByName('TXT_COMPL').AsString := IfThen(Atipo = 'CUPOM'      , '(Mod:[@COD_MOD] ECF:[@ECF_CX] Fab:[@ECF_FAB] COO:[@NUM_DOC] Data:[@DT_DOC])') +
                                                        IfThen(Atipo = 'DESONERACAO', 'Desconto no valor de R$[@VICMDESON] ref. ICMS desonerado conf. convenio de ICMS 100/97 e ajuste SINIEF 10/2012') +
                                                        IfThen(Atipo = 'NFCE'       , '[@chave_nfe_ref]') +
                                                        IfThen(Atipo = 'NFE'        , '[@chave_nfe_ref]');
end;

initialization
  RegisterClass(TfrmCadInformacaoCompl);
finalization
  UnRegisterClass(TfrmCadInformacaoCompl);

end.
