unit uCadCEST_v2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, ButtonGroup;

type
  TfrmCadCEST_v2 = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    pn_cadastro: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ed_id: TDBEdit;
    ed_cest: TDBEdit;
    ed_ambito: TDBEdit;
    ed_descricao: TDBMemo;
    dbt_data_cad: TDBText;
    dbt_data_mod: TDBText;
    Label12: TLabel;
    dbt_versao: TDBText;
    tv_mva: TTreeView;
    Label13: TLabel;
    Label14: TLabel;
    bt_mva_add: TSpeedButton;
    bt_mva_del: TSpeedButton;
    bt_mva_edit: TSpeedButton;
    bt_ncm_add: TSpeedButton;
    bt_ncm_del: TSpeedButton;
    list_ncm: TListBox;
    Panel4: TPanel;
    ed_item_txt: TMaskEdit;
    ed_ambito_txt: TMemo;
    Label15: TLabel;
    lb_origem_cadastro: TLabel;
    list_uf: TListBox;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    lbinfoUsuario: TLabel;
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure ed_ambitoExit(Sender: TObject);
    procedure ed_cestExit(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure bt_ncm_delClick(Sender: TObject);
    procedure bt_ncm_addClick(Sender: TObject);
    procedure bt_mva_editClick(Sender: TObject);
    procedure bt_mva_delClick(Sender: TObject);
    procedure bt_mva_addClick(Sender: TObject);
    procedure pn_cadastroEnter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure mva_change(Sender: TObject);
    procedure ncm_change(Sender: TObject);
    procedure cest_change(Sender: TObject);
    procedure buildEstados();
    procedure buildCadastro(inEdit: Boolean);
    function allowsChange(origemCadastro: Integer = -1): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadCEST_v2: TfrmCadCEST_v2;

implementation

uses
  StrUtils,
  uClassesCEST,
  hw_utils,
  cest_ncm_class,
  cest_mva_class,
  CestVarianteMvaNcmUf_Model,
  uDtmAtivo, cest_mva_uf_class, uCadCest_MVA, uDadosIni, cest_item_class,
  cest_ambito_class, uCadCEST_ConsultaDet, uDataSet_OOP, DB;

procedure AtualizarAnexoXV_v2(BancoHw: PChar; CodEmpresa: PChar); external 'hw.anexoxv.dll';

procedure hw_integra_anexoxv_consultaragora(banco: WideString; empresa: Integer); stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

function TfrmCadCEST_v2.allowsChange(origemCadastro: Integer): Boolean;
begin
  if origemCadastro = -1 then
    origemCadastro := Anexo.fint('origem');

  if MatchText(IntToStr(origemCadastro), ['1', '2']) then
  begin
    ShowAtencao('Alteração não permitida em cadastros com origem Anexo XV ou API' + sLineBreak +
                'Por favor faça um novo cadastro com os valores desejados, os cadastros com origem do Usuário tem preferência sobre os demais');
    Result := False;
  end
  else
    Result := True;
end;

procedure TfrmCadCEST_v2.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('PRO291', 'CONSULTA', '', Anexo.TableName, '', Anexo.buscas, False) then
      Exit;

    inherited;

    if MaskEdit2.Visible then
    begin
      if not Anexo.ConsultaCampos(Anexo.TableName, ComboBox1.Text,
        'CEST', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if Anexo.ConsultaCampos(Anexo.TableName, MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, 'CEST', true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (Combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    SpeedButton1.Enabled := True;
    SpeedButton2.Enabled := True;
    SpeedButton5.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadCEST_v2.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;

    if not Anexo.Insert then
      Exit;

//    ncm_change(Anexo.objeto.NCMs);
//    mva_change(Anexo.objeto.MVAs);

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

procedure TfrmCadCEST_v2.BitBtn4Click(Sender: TObject);
begin
  try
    BitBtn4.Enabled := False;
    Screen.Cursor := crHourGlass;

    Anexo.dataSet.FieldByName('ufs_convenio').AsString := list_uf.Items.Text;

    if not Anexo.post then
    begin
      PageControl3.ActivePage := tsCadastro;
      setFocusCampoErro(Anexo.vNomeCampoErro);
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
        if Anexo.Insert then
        begin
          PageControl3.ActivePage := tsCadastro;
          if (Self.Enabled) and (Self.Visible) and (ed_cest.CanFocus) then
          	ed_cest.SetFocus;
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

procedure TfrmCadCEST_v2.BitBtn5Click(Sender: TObject);
begin
  inherited;
  Anexo.Cancel;
end;

procedure TfrmCadCEST_v2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadCEST_v2.ed_ambitoExit(Sender: TObject);
begin
  inherited;
  if Length(Anexo.fstr('cest')) > 1  then
    ed_ambito_txt.Text := Anexo.GetCestAmbitoText(Anexo.fstr('cest'), Anexo.fint('ambito'));
end;

procedure TfrmCadCEST_v2.ed_cestExit(Sender: TObject);
begin
  inherited;
  if Length(Anexo.fstr('cest')) > 1  then
    ed_item_txt.Text := Anexo.GetCestItemText(Anexo.fstr('cest'));
end;

procedure TfrmCadCEST_v2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCadCEST_v2 := nil;

  if Assigned(Anexo) then
    FreeAndNil(Anexo);
  inherited;
end;

procedure TfrmCadCEST_v2.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  if not Assigned(Anexo) then
  begin
    Anexo := TCEST_.Create;
    Anexo.OnChange := cest_change;
    DBGrid1.DataSource := Anexo._dataSourceOOP;
  end;

  tsCadastro.TabVisible := False;
  TabSheet1.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadCEST_v2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then  
    BitBtn3.Click;
end;

procedure TfrmCadCEST_v2.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    ed_item_txt.BorderStyle   := bsNone;
    ed_ambito_txt.BorderStyle := bsNone;
    DBGrid1.DataSource := Anexo._dataSourceOOP;
    Anexo.montaSelect('select * from %s where id = 0 and cod_empresa = 0', [Anexo.TableName]);
    //Anexo.dataSet.FieldByName('cod_empresa').Tag := 1;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  Panel4.BevelOuter := bvNone;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
                            {
  imgInformation.Hint := imgInformation.Hint + sLineBreak + sLineBreak +
   'CLI245 - BT PESQUISAR FINALIDADE' + sLineBreak +
   'CLI246 - BT INSERIR FINALIDADE' + sLineBreak +
   'CLI247 - BT ALTERAR FINALIDADE' + sLineBreak +
   'CLI248 - BT EXCLUIR FINALIDADE' + sLineBreak +
   'CLI249 - BT SALVAR FINALIDADE' ;
                           }
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadCEST_v2.mva_change(Sender: TObject);
var
  node: TTreeNode;
  I, J: Integer;
  Str: string;
begin
  if Sender is TCestMvasM then
  begin
    tv_mva.Items.Clear;

    for I := 0 to TCestMvasM(Sender).Count - 1 do with TCestMvasM(Sender).Items[I] do
    begin
      {
      Str := '';
      for J := 0 to UFs.Count - 1 do
        Str := IfThen(J > 0, Str + ',') + UFs.Items[J].uf;
      }
      Str := Trim(ufs_aliq);
      while EndsText(',', Str) do
        Copy(Str, 1, Length(Str) - 1);

      node := tv_mva.Items.AddChild(nil, Format('%n - %s [%s]%s', [VarToFloat(mva), Variante.descricao, Str,
        IfThen(VarToInt(origem) = 1, '''') + IfThen(VarToInt(origem) = 2, '"') ]));

      tv_mva.Items.AddChild(node, Format('Estados: %s', [Ifthen(Str <> 'Padrao', Str, 'Todos da lista caso não tenha informado individualmente')]));

      Str := '';
      for J := 0 to ncm_excecao.Count - 1 do
        if Trim(ncm_excecao[J]) <> '' then
          Str := IfThen(J > 0, Str + ',') + ncm_excecao[J];

      tv_mva.Items.AddChild(node, Format('Exceto NCM''s: %s', [Str]));
    end;
  end;
end;

procedure TfrmCadCEST_v2.ncm_change(Sender: TObject);
var
  I: Integer;
begin
  if Sender is TCest_ncms_class then
  begin
    list_ncm.Clear;
    for I := 0 to TCest_ncms_class(Sender).Count - 1 do with TCest_ncms_class(Sender).Items[I] do
      list_ncm.Items.Add(ncm);
  end;
end;                

procedure TfrmCadCEST_v2.pn_cadastroEnter(Sender: TObject);
begin
  inherited;
  if not Assigned(ed_id.DataSource) then
  begin
    ed_id.DataSource        := Anexo._dataSourceOOP;
    ed_cest.DataSource      := Anexo._dataSourceOOP;
    ed_ambito.DataSource    := Anexo._dataSourceOOP;
    ed_descricao.DataSource := Anexo._dataSourceOOP;
    dbt_data_cad.DataSource := Anexo._dataSourceOOP;
    dbt_data_mod.DataSource := Anexo._dataSourceOOP;
    dbt_versao.DataSource   := Anexo._dataSourceOOP;
  end;
end;

procedure TfrmCadCEST_v2.bt_mva_addClick(Sender: TObject);
var
  NovoMVA: TCestMvaM;
begin
  inherited;
  if not vDadosIni.PesqPros('PRO337', 'INCLUIR', Format('%d - %s', [Anexo.fint('id'), Anexo.fstr('cest')]), 'CEST_MVA', Anexo.fstr('id'), Anexo.buscas) then
    Exit;

  NovoMVA := TCestMvaM.Create;
  Application.CreateForm(TfrmCadCEST_MVA, frmCadCEST_MVA);
  frmCadCEST_MVA.Owner := Anexo;
  frmCadCEST_MVA.MVA   := NovoMVA;
  frmCadCest_MVA.indiceMva := -1;
  frmCadCest_MVA.Estados   := list_uf.Items.Text;
  if frmCadCEST_MVA.ShowModal = IDOK then
  begin
    vDadosIni.Auditoria('PRO337', 'ALTERAR', Format('MVA %f - %s - CEST %d - %s',
                                                    [VarToFloat(NovoMVA.mva), NovoMVA.Variante.descricao, Anexo.fint('id'), Anexo.fstr('cest')]),
                                                     'CEST_MVA', Anexo.fstr('id'));

    Anexo.objeto.MVAs.Add(NovoMVA);
    mva_change(Anexo.objeto.MVAs);
  end
  else
    FreeAndNil(NovoMVA);
end;

procedure TfrmCadCEST_v2.bt_mva_delClick(Sender: TObject);
var
  index: Integer;
  node: TTreeNode;
begin
  inherited;
  if not Assigned(tv_mva.Selected) then
    Exit;

  node := tv_mva.Selected;
  while node.Level > 0 do
    if Assigned(node.Parent) then
      node := node.Parent
    else
      Exit;

  index := node.Index;

  if not allowsChange(VarToInt(Anexo.objeto.MVAs.Items[index].origem)) then
    Exit;

  if (index >= 0) and (index < Anexo.objeto.MVAs.Count) then
  begin
    with Anexo.objeto.MVAs.Items[index] do
      if not vDadosIni.PesqPros('PRO338', 'EXCLUIR',
                                Format('MVA %f - %s  CEST %d - %s',
                                       [VarToFloat(mva), Variante.descricao, Anexo.fint('id'), Anexo.fstr('cest')]),
                                        'CEST_MVA', Anexo.fstr('id'), Anexo.buscas) then
        Exit;

    Anexo.exclusoes.MVAs.Add(Anexo.objeto.MVAs.Items[index].Clone);
    Anexo.objeto.MVAs.Delete(index);
    mva_change(Anexo.objeto.MVAs);
  end;
end;

procedure TfrmCadCEST_v2.bt_mva_editClick(Sender: TObject);
var
  index: Integer;
  node: TTreeNode;
begin
  inherited;
  if not Assigned(tv_mva.Selected) then
    Exit;

  node := tv_mva.Selected;
  while node.Level > 0 do
    if Assigned(node.Parent) then
      node := node.Parent
    else
      Exit;

  index := node.Index;

  if not allowsChange(VarToInt(Anexo.objeto.MVAs.Items[index].origem)) then
    Exit;

  if (index >= 0) and (index < Anexo.objeto.MVAs.Count) then
  begin
    with Anexo.objeto.MVAs.Items[index] do
      if not vDadosIni.PesqPros('PRO339', 'ALTERAR',
                                Format('MVA %f - %s - CEST %d - %s',
                                       [VarToFloat(mva), Variante.descricao, Anexo.fint('id'), Anexo.fstr('cest')]),
                                        'CEST_MVA', Anexo.fstr('id'), Anexo.buscas) then
        Exit;

    Application.CreateForm(TfrmCadCEST_MVA, frmCadCEST_MVA);
    frmCadCEST_MVA.Owner := Anexo;
    frmCadCest_MVA.MVA   := Anexo.objeto.MVAs.Items[index];
    frmCadCest_MVA.indiceMva := index;
    frmCadCest_MVA.Estados := list_uf.Items.Text;

    if frmCadCEST_MVA.ShowModal = ID_OK then
      with Anexo.objeto.MVAs.Items[index] do
        vDadosIni.Auditoria('PRO339', 'ALTERAR', Format('MVA %f - %s - CEST %d - %s',
                                       [VarToFloat(mva), Variante.descricao, Anexo.fint('id'), Anexo.fstr('cest')]),
                                        'CEST_MVA', Anexo.fstr('id'));
//      Anexo.objeto.MVAs.Items[index] := frmCadCest_MVA.MVA;
//    end;

    mva_change(Anexo.objeto.MVAs);
  end;
end;

procedure TfrmCadCEST_v2.bt_ncm_addClick(Sender: TObject);
var
  Str: string;
  I: Integer;
begin
  inherited;
    
  if not allowsChange then
    Exit;

  if not vDadosIni.PesqPros('PRO340', 'INCLUIR', Format('%d - %s', [Anexo.fint('id'), Anexo.fstr('cest')]), 'CEST_NCM', Anexo.fstr('id'), Anexo.buscas) then
    Exit;

  if not InputQuery('NCM', 'Informe o NCM, minimo de 4 dígitos e máximo de 8', Str) then
    Exit;

  Str := OnlyNumber(Str);
  if not (Length(Str) in [4,5,6,7,8]) then
  begin
    ShowErro('NCM incorreto. Favor informar de 4 a 8 dígitos');
    Exit;
  end;

  for I := 0 to Anexo.objeto.NCMs.Count - 1 do
    if Anexo.objeto.NCMs.Items[I].ncm = Str then
    begin
      ShowErro('NCM já existe na lista');
      Exit;
    end;

  vDadosIni.Auditoria('PRO340', 'INCLUIR', Format('NCM %s - CEST %d - %s',
                                                  [Str, Anexo.fint('id'), Anexo.fstr('cest')]),
                                                   'CEST_NCM', Anexo.fstr('id'));
  Anexo.objeto.NCMs.New.ncm := Str;
  ncm_change(Anexo.objeto.NCMs);
end;

procedure TfrmCadCEST_v2.bt_ncm_delClick(Sender: TObject);
begin
  inherited;

  if not allowsChange then
    Exit;

  if (list_ncm.ItemIndex >= 0) and (list_ncm.ItemIndex <= Pred(Anexo.objeto.NCMs.Count)) then
  begin
    with Anexo.objeto.NCMs.Items[list_ncm.ItemIndex] do
      if not vDadosIni.PesqPros('PRO341', 'EXCLUIR',
                                Format('NCM %s - CEST %d - %s',
                                       [ncm, Anexo.fint('id'), Anexo.fstr('cest')]),
                                        'CEST_NCM', Anexo.fstr('id'), Anexo.buscas) then
        Exit;

    Anexo.exclusoes.NCMs.Add(Anexo.objeto.NCMs.Items[list_ncm.ItemIndex].Clone);
    Anexo.objeto.NCMs.Delete(list_ncm.ItemIndex);
    ncm_change(Anexo.objeto.NCMs);
  end;
end;

procedure TfrmCadCEST_v2.buildCadastro(inEdit: Boolean);
begin

  buildEstados;
  ncm_change(Anexo.objeto.NCMs);
  mva_change(Anexo.objeto.MVAs);
  lb_origem_cadastro.Caption := TCest_Builder.VarToTipoCadastroCestStr(Anexo.fint('origem'));

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tsCadastro;

  ed_cest.Enabled := not inEdit;
  ed_ambito.Enabled := not inEdit;

  if (not inEdit) and (Self.Enabled) and (Self.Visible) and (ed_cest.CanFocus) then
      ed_cest.SetFocus;
  if inEdit and (Self.Enabled) and (Self.Visible) and (ed_descricao.CanFocus) then
    ed_descricao.SetFocus;
end;

procedure TfrmCadCEST_v2.buildEstados;
begin
  list_uf.Items.Clear;
  list_uf.Items.LineBreak := ',';
  list_uf.Items.Text := Anexo.fstr('ufs_convenio');
end;

procedure TfrmCadCEST_v2.cest_change(Sender: TObject);
begin
  if Sender is TCEST_ then
  begin
    ed_item_txt.Text         := TCEST_(Sender).objeto.Item.descricao;
    ed_ambito_txt.Lines.Text := TCEST_(Sender).objeto.Ambit.descricao.Text;

    ncm_change(TCEST_(Sender).objeto.NCMs);
    mva_change(TCEST_(Sender).objeto.MVAs);
  end;
end;

procedure TfrmCadCEST_v2.SpeedButton10Click(Sender: TObject);
type
  typeOperacao = (opQuest, opAbort, opRemover);
var
  I: Integer;
  operacao: typeOperacao;
  list: TStrings;
  str: string;
begin
  inherited;
  
  if not allowsChange then
    Exit;
    
  operacao := opQuest;
  if (list_uf.Items.Count >= 0) and (list_uf.ItemIndex >= 0) then
    if ShowConfirmacao('Excluir UF "%s"?', [list_uf.Items[list_uf.ItemIndex]]) = ID_YES then
    begin
      for I := 0 to Anexo.objeto.MVAs.Count - 1 do
        if (ContainsText(Anexo.objeto.MVAs.Items[I].ufs_aliq, list_uf.Items[list_uf.ItemIndex])) then
          if (operacao = opRemover) or ((operacao = opQuest) and
            (ShowConfirmacao('UF já consta em alguns MVA''s. Se continuar irá remover dos MVA''s também' + sLineBreak +
                             'Deseja remover mesmo assim?') = ID_YES)) then
          begin
            operacao := opRemover;
            list := NewStringList(Anexo.objeto.MVAs.Items[I].ufs_aliq, ',');
            if list.IndexOf(list_uf.Items[list_uf.ItemIndex]) >= 0 then
              list.Delete(list.IndexOf(list_uf.Items[list_uf.ItemIndex]));
            str := Trim(list.Text);
            while EndsText(',', str) do
              str := Copy(str, 1, Length(str) - 1);
            Anexo.objeto.MVAs.Items[I].ufs_aliq := str;
            mva_change(Anexo.objeto.MVAs);
          end
          else
            Exit;

      list_uf.Items.Delete(list_uf.ItemIndex);
    end;
end;

procedure TfrmCadCEST_v2.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not Anexo.Edit then
      exit;

//    ncm_change(Anexo.objeto.NCMs);
//    mva_change(Anexo.objeto.MVAs);

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

procedure TfrmCadCEST_v2.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
  Anexo.montaSelect('select * from %s where cod_empresa = %s and ativo = 0', [Anexo.TableName, vDadosIni.codEmpresa]);
  SpeedButton5.Visible := Anexo.dataSet.RecordCount > 0;
end;

procedure TfrmCadCEST_v2.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadCEST_ConsultaDet, frmCadCEST_ConsultaDet);
  try
    frmCadCEST_ConsultaDet.ShowModal;
  finally
    vDadosIni.enterTela.Enabled := True;
    FreeAndNil(frmCadCEST_ConsultaDet);
  end;
end;

procedure TfrmCadCEST_v2.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not allowsChange() then
      Exit;

    if Anexo.dataSet.IsEmpty then
      vDadosIni.ShowErro('Sem registro selecionado')
    else if vDadosIni.ShowConfirmacao('Deseja mesmo excluir o registro') = IDYES then
      Anexo.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadCEST_v2.SpeedButton5Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if Anexo.dataSet.IsEmpty then
      vDadosIni.ShowErro('Sem registro selecionado')
    else if vDadosIni.ShowConfirmacao('Deseja mesmo restaura o registro') = IDYES then
      Anexo.Restaurar;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadCEST_v2.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO179', 'ALTERAR', '', 'CEST_', '', Anexo.buscas) then
    Exit;
  AtualizarAnexoXV_v2(pchar(vDadosIni.vBancoHW), pchar(vDadosIni.codEmpresa));
end;

procedure TfrmCadCEST_v2.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    hw_integra_anexoxv_consultaragora(WideString(vDadosIni.vBancoHW), vDadosIni.cod_empresa);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadCEST_v2.SpeedButton9Click(Sender: TObject);
var
  Str: string;
  I: Integer;
  list: TStrings;
begin
  inherited;

  if not allowsChange then
    Exit;

  if not InputQuery('UF', 'Informe a sigla da UF', Str) then
    Exit;

  Str := StrReplace(UpperCase(Str), [';', ' ', '-', '|', '+', '.', '/', '*'], ',');

  list := NewStringList(True, Str + ',' + list_uf.Items.Text, ',');

//  if NewStringList(False, vDadosIni.getListaUF()).IndexOf(Str) <= -1 then
//  begin
//    ShowErro('UF informada inválida');
//    Exit;
//  end;
//
//  for I := 0 to list_uf.Count - 1 do
//    if Trim(list_uf.Items[I]) = Str then
//    begin
//      ShowErro('UF já existe na lista');
//      Exit;
//    end;

  list_uf.Items.Clear;
  for I := 0 to list.Count - 1 do
  begin
    if Length(Trim(list[I])) = 2 then    
      if ContainsText(vDadosIni.getListaUF(), list[I]) then
        list_uf.Items.Add(UpperCase(list[I]));
  end;
end;

end.



