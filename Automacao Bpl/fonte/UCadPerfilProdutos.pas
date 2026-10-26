unit UCadPerfilProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, Buttons, Grids, DBGrids, StdCtrls, Mask,
  ComCtrls, UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo, DBCtrls, DB,
  AppEvnts;

type
  TFrmCadPerfilProdutos = class(TfrmCadPadraoM)
    GroupBox7: TGroupBox;
    Label47: TLabel;
    DBEdit45: TDBEdit;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label35: TLabel;
    Label40: TLabel;
    Label8: TLabel;
    Label24: TLabel;
    dbeNatOperacao: TDBEdit;
    dbeDescricao: TDBEdit;
    dbeMarca: TDBEdit;
    dbeUnidade: TDBEdit;
    dbeCST: TDBEdit;
    dbeEmbProduto: TDBEdit;
    dbeQtdeEmbalagem: TDBEdit;
    dbeValBalanca: TDBEdit;
    dbeNBM: TDBEdit;
    dbeIsento: TDBComboBox;
    dbeIsentoPis: TDBComboBox;
    dbcbBalanca: TDBComboBox;
    dbeDescCupom: TDBComboBox;
    dbcbAlteraCodCupom: TDBComboBox;
    dbcbTipoProd: TDBComboBox;
    dbeNaoIncidencia: TDBComboBox;
    dbeCodSubGrupo: TDBEdit;
    dblkSubGrupo: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label33: TLabel;
    dbeLocacao1: TDBEdit;
    dbeLocacao2: TDBEdit;
    dbePercTabela: TDBEdit;
    dbeP30: TDBEdit;
    dbeP60: TDBEdit;
    dbeP90: TDBEdit;
    dbePMN: TDBEdit;
    dbePMNVarejo: TDBEdit;
    dbePerc30: TDBEdit;
    dbePerc60: TDBEdit;
    dbePerc90: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox6: TGroupBox;
    Label14: TLabel;
    Label23: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label34: TLabel;
    Label44: TLabel;
    Label82: TLabel;
    dbeIPI: TDBEdit;
    dbeICM: TDBEdit;
    dbeComissaoProd: TDBEdit;
    dbeDias: TDBEdit;
    dbcbNecAcomp: TDBComboBox;
    dblkcbPPS: TDBLookupComboBox;
    dbeComProdGer: TDBEdit;
    dbeAliquotaRed: TDBEdit;
    DBEdit72: TDBEdit;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbcbTipoProdExit(Sender: TObject);
    procedure dbePercTabelaExit(Sender: TObject);
    procedure dbeP90Exit(Sender: TObject);
    procedure dbeP60Exit(Sender: TObject);
    procedure dbeP30Exit(Sender: TObject);
    procedure dbeCodSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeNBMExit(Sender: TObject);
    procedure dbeNBMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbcbNecAcompExit(Sender: TObject);
    procedure dbeDescCupomExit(Sender: TObject);
    procedure dbcbAlteraCodCupomExit(Sender: TObject);
    procedure dbcbBalancaExit(Sender: TObject);
    procedure dbeIsentoExit(Sender: TObject);
    procedure dbeNaoIncidenciaExit(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPerfilProdutos: TFrmCadPerfilProdutos;
  PerfilProd: TPerfilProduto;

implementation

{$R *.dfm}

procedure TFrmCadPerfilProdutos.BitBtn1Click(Sender: TObject);
begin
SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO129]';

  if vDadosIni.PesqPros('PRO125', 'PESQUISAR', '','PERFIL_PRODUTOS','', PerfilProd.buscas, true) then
//  if vDadosIni.PesqPros('PRO125', '', PerfilProd.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not PerfilProd.ConsultaCampos('PERFIL_PRODUTOS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, '', vDadosIni.codEmpresa) then
      begin
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
         	combobox1.setfocus
      end
      else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      	DBGrid1.SetFocus;
    end
    else
    begin
      if not PerfilProd.ConsultaCampos('PERFIL_PRODUTOS', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, '', true, vDadosIni.codEmpresa) then
      begin
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        	ComboBox1.SetFocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        DBGrid1.SetFocus;
    end;
    PerfilProd.ultimasql := PerfilProd.dataSet.CommandText;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    CheckBox1.Checked := false;
    CheckBox3.Checked := false;
    if PerfilProd.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TFrmCadPerfilProdutos.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO126', 'INCLUIR', '','PERFIL_PRODUTOS','', PerfilProd.buscas, true) then
//  if vDadosIni.PesqPros('PRO126', '', PerfilProd.buscas, true) then
  begin
    inherited;
    if PerfilProd.Insert then
    begin
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      TabSheet3.Show;
      if (Self.Enabled) and (Self.Visible) and (DBEdit45.CanFocus) then
      	DBEdit45.SetFocus;
      PerfilProd.PreencheCampos;
      TabSheet3.Caption := 'Cadastrando um novo Perfil de produtos';
    end;
  end;
end;

procedure TFrmCadPerfilProdutos.BitBtn4Click(Sender: TObject);
begin
  if not PerfilProd.post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit45.CanFocus) then
   	  DBEdit45.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if PerfilProd.Insert then
      begin
        PerfilProd.PreencheCampos;
        if (Self.Enabled) and (Self.Visible) and (DBEdit45.CanFocus) then
        	DBEdit45.SetFocus;
      end;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadPerfilProdutos.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO133', 'CANCELAR', '','PERFIL_PRODUTOS',PerfilProd.dataSet.FieldByName('COD_PERFIL').AsString, PerfilProd.buscas, true) then
//  if vDadosIni.PesqPros('PRO133', PerfilProd.dataSet.FieldByName('COD_PERFIL').AsString, PerfilProd.buscas, true) then
  begin
    inherited;
    TabSheet2.Show;
    PerfilProd.Cancel;
    PerfilProd.RollBackTransacao;
  end;
end;

procedure TFrmCadPerfilProdutos.dbcbAlteraCodCupomExit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if not PerfilProd.ChecaSimNao('ALT_COD_CUPOM') then
    begin
    	if (Self.Enabled) and (Self.Visible) and (dbeIsento.CanFocus) then
      	dbeIsento.SetFocus;
      exit;
    end;
  end;
end;

procedure TFrmCadPerfilProdutos.dbcbBalancaExit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if not PerfilProd.ChecaSimNao('BALANCA_PROD') then
    begin
    	if (Self.Enabled) and (Self.Visible) and (dbeIsento.CanFocus) then
      	dbeIsento.SetFocus;
      exit;
    end;
  end;
end;

procedure TFrmCadPerfilProdutos.dbcbNecAcompExit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if not PerfilProd.ChecaSimNao('NEC_ACOMP') then
    begin
    	if (Self.Enabled) and (Self.Visible) and (dbeIsento.CanFocus) then
      	dbeIsento.SetFocus;
      exit;
    end;
  end;
end;

procedure TFrmCadPerfilProdutos.dbcbTipoProdExit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not PerfilProd.TipoProdInd(dbcbTipoProd.Text) then
    	if (Self.Enabled) and (Self.Visible) and (dbcbTipoProd.CanFocus) then
      	dbcbTipoProd.SetFocus;
end;

procedure TFrmCadPerfilProdutos.dbeCodSubGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('PRO134', 'PESQUISAR', '','PERFIL_PRODUTOS','', PerfilProd.buscas, true) then
//    if vDadosIni.PesqPros('PRO134', '', PerfilProd.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SUB_GRUPO');
        if vDadosIni.vPesquisa <> '' then
          PerfilProd.dataSet.FieldByName('SUB_G_PROD').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (dbeCodSubGrupo.CanFocus) then
        	dbeCodSubGrupo.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end
  else if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('PRO135', 'INCLUIR', '','SUB_GRUPO','', PerfilProd.buscas, true) then
//    if vDadosIni.PesqPros('PRO135', '', PerfilProd.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        PerfilProd.CadSubGrupos(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end

end;

procedure TFrmCadPerfilProdutos.dbeDescCupomExit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if not PerfilProd.ChecaSimNao('ALT_DESC_CUPOM') then
    begin
    	if (Self.Enabled) and (Self.Visible) and (dbeIsento.CanFocus) then
      	dbeIsento.SetFocus;
      exit;
    end;
  end;
end;

procedure TFrmCadPerfilProdutos.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if TDBEdit(Sender).Text = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD');
        if PerfilProd.dataSet.State in [dsInsert, dsEdit] then
          if vDadosIni.vPesquisa <> '' then
            PerfilProd.dataSet.FieldByName('COD_MARCA').AsInteger := strtoint(vDadosIni.vPesquisa)
          else if (Self.Enabled) and (Self.Visible) and (dbeUnidade.CanFocus) then
            dbeUnidade.SetFocus;
        PerfilProd.RetornaMarca;
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else
    begin
      if PerfilProd.RetornaMarca then
      begin
        if (Self.Enabled) and (Self.Visible) and (dbeUnidade.CanFocus) then
      	  dbeUnidade.SetFocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        DBEdit1.SetFocus;
    end;
  end;
end;

procedure TFrmCadPerfilProdutos.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD');
      if PerfilProd.dataSet.State in [dsInsert, dsEdit] then
        if vDadosIni.vPesquisa <> '' then
          PerfilProd.dataSet.FieldByName('COD_MARCA').AsInteger := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
    if TDBEdit(Sender).Text <> '' then
    begin
      if PerfilProd.RetornaMarca then
      begin
      	if (Self.Enabled) and (Self.Visible) and (dbeUnidade.CanFocus) then
        	dbeUnidade.SetFocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        DBEdit1.SetFocus;
    end;
  end;
end;

procedure TFrmCadPerfilProdutos.dbeIsentoExit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if not PerfilProd.ChecaSimNao('ISENTO_PROD') then
    begin
    	if (Self.Enabled) and (Self.Visible) and (dbeIsento.CanFocus) then
      	dbeIsento.SetFocus;
      exit;
    end;
    PerfilProd.ChecaICMPROD;
  end;
end;

procedure TFrmCadPerfilProdutos.dbeNaoIncidenciaExit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if not PerfilProd.ChecaSimNao('N_INCIDENCIA_PROD') then
    begin
    	if (Self.Enabled) and (Self.Visible) and (dbeNaoIncidencia.CanFocus) then
      	dbeNaoIncidencia.SetFocus;
      exit;
    end;
    PerfilProd.ChecaICMPROD;
  end;
end;

procedure TFrmCadPerfilProdutos.dbeNBMExit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if dbeNBM.Text <> '' then
      if not PerfilProd.ValidaNBM then
      	if (Self.Enabled) and (Self.Visible) and (dbeNBM.CanFocus) then
        	dbeNBM.SetFocus;
end;

procedure TFrmCadPerfilProdutos.dbeNBMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('PRO136', 'PESQUISAR', '','PERFIL_PRODUTOS','', PerfilProd.buscas, true) then
//    if vDadosIni.PesqPros('PRO136', '', PerfilProd.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NBM');
        if vDadosIni.vPesquisa <> '' then
          PerfilProd.dataSet.FieldByName('NBM').asstring := vDadosIni.vPesquisa;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('PRO137', 'INCLUIR', '','PERFIL_PRODUTOS','', PerfilProd.buscas, true) then
//    if vDadosIni.PesqPros('PRO137', '', PerfilProd.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        PerfilProd.CadNbm(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadPerfilProdutos.dbeP30Exit(Sender: TObject);
begin
  inherited;
  if not PerfilProd.ChecaPercPreco(PerfilProd.dataSet.FieldByName('PERC_TB_PROD3').AsFloat) then
  	if (Self.Enabled) and (Self.Visible) and (dbeP30.CanFocus) then
    	dbeP30.setfocus;
end;

procedure TFrmCadPerfilProdutos.dbeP60Exit(Sender: TObject);
begin
  inherited;
  if not PerfilProd.ChecaPercPreco(PerfilProd.dataSet.FieldByName('PERC_TB_PROD6').AsFloat) then
  	if (Self.Enabled) and (Self.Visible) and (dbeP60.CanFocus) then
    	dbeP60.setfocus;
end;

procedure TFrmCadPerfilProdutos.dbeP90Exit(Sender: TObject);
begin
  inherited;
  if not PerfilProd.ChecaPercPreco(PerfilProd.dataSet.FieldByName('PERC_TB_PROD9').AsFloat) then
  	if (Self.Enabled) and (Self.Visible) and (dbeP90.CanFocus) then
    	dbeP90.setfocus;
end;

procedure TFrmCadPerfilProdutos.dbePercTabelaExit(Sender: TObject);
begin
  inherited;
  if not PerfilProd.ChecaPercPreco(PerfilProd.dataSet.FieldByName('PERC_TB_PROD').AsFloat) then
  	if (Self.Enabled) and (Self.Visible) and (dbePercTabela.CanFocus) then
    	dbePercTabela.setfocus;
end;

procedure TFrmCadPerfilProdutos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadPerfilProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PerfilProd.Cancel;
  PerfilProd.RollBackTransacao;
  PerfilProd.free;
  Action := caFree;
  FrmCadPerfilProdutos := nil;
end;

procedure TFrmCadPerfilProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  PerfilProd := TPerfilProduto.Create;
  PerfilProd.abrePerfilProd(true);
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadPerfilProdutos.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (PerfilProd.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TFrmCadPerfilProdutos.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsPerfilProd;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadPerfilProdutos.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO127', 'EDITAR', '','PERFIL_PRODUTOS',PerfilProd.dataSet.FieldByName('COD_PERFIL').AsString, PerfilProd.buscas, true) then
//  if vDadosIni.PesqPros('PRO127', PerfilProd.dataSet.FieldByName('COD_PERFIL').AsString,
//    PerfilProd.buscas, true) then
  begin
    if not PerfilProd.dataSet.IsEmpty then
    begin
      if PerfilProd.dataSet.FieldByName('ATIVO').AsInteger = 1 then
      begin
        if not PerfilProd.Edit then
          exit;

        PerfilProd.dataSet.FieldByName('DESCR_PROD').AsString :=
        	trim(PerfilProd.dataSet.FieldByName('DESCR_PROD').AsString);
        PerfilProd.dataSet.FieldByName('DESCR_PERFIL').AsString :=
        	trim(PerfilProd.dataSet.FieldByName('DESCR_PERFIL').AsString);
        inherited;
        //        statusDataset := 'E';
        PerfilProd.PreencheCampos;
        PageControl1.ActivePage := TabSheet1;
        TabSheet1.Show;
        TabSheet3.TabVisible := true;
        PageControl3.ActivePage := TabSheet3;
        TabSheet3.Caption := 'Alterando Perfil de produtos';
        if (Self.Enabled) and (Self.Visible) and (DBEdit45.CanFocus) then
        	DBEdit45.SetFocus;
      end
      else
        Application.MessageBox('Este registro está na lixeira.' + chr(13) +
          'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION +
          MB_DEFBUTTON1);
    end
    else
      Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;

end;

procedure TFrmCadPerfilProdutos.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO130', 'ABRIR LIXEIRA', '','PERFIL_PRODUTOS','', PerfilProd.buscas, true) then
//  if vDadosIni.PesqPros('PRO130', '', PerfilProd.buscas, true) then
  begin
    if not PerfilProd.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO129]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [PRO128]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmCadPerfilProdutos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not PerfilProd.dataSet.IsEmpty then
    if PerfilProd.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    begin
      if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
        if vDadosIni.PesqPros('PRO128', 'EXCLUIR', '','PERFIL_PRODUTOS',PerfilProd.dataSet.FieldByName('COD_PERFIL').AsString, PerfilProd.buscas, true) then
//        if vDadosIni.PesqPros('PRO128', PerfilProd.dataSet.FieldByName('COD_PERFIL').AsString, PerfilProd.buscas, true) then
        begin
          if PerfilProd.Delete then
            if PerfilProd.Apply then
              PerfilProd.CommitaTransacao;
        end;
    end
    else if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
      PerfilProd.EnviarRegistroLixeira;

  PerfilProd.Refresh;
  if PerfilProd.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

procedure TFrmCadPerfilProdutos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  PerfilProd.RestaurarRegistro;
  if PerfilProd.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

end.

