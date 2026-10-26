unit uCadAdmCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons,
  Grids, DBGrids, Mask, DBCtrls, DB;

type
  TfrmCadAdmCartao = class(TfrmCadPadraoM)
    tsTerminalCartao: TTabSheet;
    pnTerminalCartao: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Panel6: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit5: TDBEdit;
    Panel7: TPanel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    DBComboBox1: TDBComboBox;
    Label12: TLabel;
    tsBandeiraCartao: TTabSheet;
    pnBandConsulta: TPanel;
    pnBandCadastro: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    Panel10: TPanel;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    DBEdit10: TDBEdit;
    DBGrid3: TDBGrid;
    Panel8: TPanel;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    tsTaxasCartao: TTabSheet;
    pnTaxasConsulta: TPanel;
    DBGrid4: TDBGrid;
    Panel9: TPanel;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    pnTaxasCadastro: TPanel;
    Panel12: TPanel;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    GroupBox4: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label23: TLabel;
    DBEdit14: TDBEdit;
    BitBtn27: TBitBtn;
    GroupBox5: TGroupBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    Label15: TLabel;
    Label24: TLabel;
    pnAdmCartaoCodDescr: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    pnAdmCartaoEstab: TPanel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    pnAdmCartaoTaxaRedes: TPanel;
    groupRedes: TGroupBox;
    spBtRedesAdicionar: TSpeedButton;
    spBtRedesRemover: TSpeedButton;
    lbxRedes: TListBox;
    pnAdmCartaoCodCliente: TPanel;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    pnAdmCartaoAdquirente: TPanel;
    Label25: TLabel;
    DBEdit11: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    pnAdmCartaoDefinirTaxa: TPanel;
    lbTaxaPorCtrlBandeira: TLabel;
    DBComboBoxTaxaPorCtrlBandeira: TDBComboBox;
    pnCamposObrigatorio: TPanel;
    lbNSUobrigatorio: TLabel;
    Label27: TLabel;
    DBComboBoxNSUobrig: TDBComboBox;
    DBComboBoxNumAutObrig: TDBComboBox;
    pnAdmCartaoEnd: TPanel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    procedure DBComboBoxTaxaPorCtrlBandeiraExit(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure spBtRedesAdicionarClick(Sender: TObject);
    procedure spBtRedesRemoverClick(Sender: TObject);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure montarComponentes;
  public
    { Public declarations }
  end;

var
  frmCadAdmCartao: TfrmCadAdmCartao;

implementation

uses
  UClassesCadastrosBasicosCx, uDtmAtivo, UDtmCadastrosBasicosCx, uDadosIni,
  uCadAdmCartao_RedesTEF;

{$R *.dfm}

procedure TfrmCadAdmCartao.BitBtn10Click(Sender: TObject);
begin
  inherited;
  TForm(pnTerminalCartao.Parent).ModalResult := IDCANCEL;
  BitBtn9.Hint := 'Enviar para Lixeira -  [CXG086]';
  BitBtn13.Hint := 'Ver Lixeira - [CXG090]';
  BitBtn13.Caption := 'Lixeira';
  BitBtn7.Visible := True;
  BitBtn8.Visible := True;
  BitBtn14.Visible := False;
end;

procedure TfrmCadAdmCartao.BitBtn11Click(Sender: TObject);
begin
  inherited;
  cadAdm.vTermCartao.Cancel;
  Panel5.Enabled := True;
  Panel6.Visible := False;
  DBGrid2.Visible := True;
end;

procedure TfrmCadAdmCartao.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if cadAdm.vTermCartao.Post then
    BitBtn11.Click
  else
    setFocusCampoErro(cadAdm.vTermCartao.vNomeCampoErro);
end;

procedure TfrmCadAdmCartao.BitBtn13Click(Sender: TObject);
begin
	if not (cadAdm.vTermCartao._verLixeira) or (BitBtn13.Caption = 'Voltar') then
  begin
    inherited;
    BitBtn9.Hint := 'Enviar para Lixeira -  [CXG085]';
    BitBtn13.Hint := 'Ver Lixeira - [CXG089]';
    BitBtn13.Caption := 'Lixeira';
  	BitBtn14.Visible := False;    
    BitBtn7.Visible := True;
    BitBtn8.Visible := True;
		cadAdm.vTermCartao.abreOuAtualizaTerminalCartao(cadAdm.dataSet.FieldByName('COD_ADM').AsString);    
  end
  else
  begin
    BitBtn9.Hint := 'Excluir Permanentemente -  [CXG086]';
    BitBtn13.Hint := '';
    BitBtn13.Caption := 'Voltar';
  	BitBtn14.Visible := True;
    BitBtn7.Visible := False;
    BitBtn8.Visible := False;
  end
end;

procedure TfrmCadAdmCartao.BitBtn14Click(Sender: TObject);
begin
  inherited;
  if cadAdm.vTermCartao._restaurarRegistroDaLixeira then
    lixeiraVazia(cadAdm._lixeiraVazia);
end;

procedure TfrmCadAdmCartao.BitBtn15Click(Sender: TObject);
begin
  inherited;
  if cadBandeira.Edit then
    vDadosIni.abreForm('Bandeiras de Cartão de Crédito', pnBandCadastro, [ofAutoSize]);
end;

procedure TfrmCadAdmCartao.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if cadBandeira.Insert then
    vDadosIni.abreForm('Bandeiras de Cartão de Crédito', pnBandCadastro, [ofAutoSize]);
end;

procedure TfrmCadAdmCartao.BitBtn17Click(Sender: TObject);
begin
  inherited;
  cadBandeira.Delete;
end;

procedure TfrmCadAdmCartao.BitBtn19Click(Sender: TObject);
begin
  inherited;
  if BitBtn19.Caption = 'Abrir' then
  begin
    if not vDadosIni.PesqPros('CXG107', 'VERLIXEIRA', cadBandeira.StrAuditoria, cadBandeira.TableName,
      cadBandeira.StrAuditoriaCod, cadBandeira.buscas) then
      Exit;
    cadBandeira.abrirBandeiras(True);
    BitBtn20.Visible := True;
    BitBtn19.Caption := 'Voltar';
    BitBtn19.Hint := '';
    BitBtn17.Hint := 'Excluir definitivamente - [CXG104]';
  end
  else
  begin
    cadBandeira.abrirBandeiras(False);
    BitBtn20.Visible := False;
    BitBtn19.Caption := 'Abrir';
    BitBtn19.Hint := 'Ver Lixeira - [CXG107]';
    BitBtn17.Hint := 'Enviar para a Lixeira - [CXG103]';
  end;
end;

procedure TfrmCadAdmCartao.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  if not vDadosIni.PesqPros('CXG074', 'CONSULTA', '', 'ADM_CARTAO', '',
    cadAdm.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not cadAdm.ConsultaCampos('ADM_CARTAO', ComboBox1.Text,
      'COD_ADM', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not cadAdm.ConsultaCampos('ADM_CARTAO', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, 'COD_ADM', true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  if cadAdm.dataSet.Active then
    for I := 0 to DBGrid1.Columns.Count - 1 do
      if DBGrid1.Columns[i].FieldName = 'REDES' then
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;


  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  SpeedButton6.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadAdmCartao.BitBtn20Click(Sender: TObject);
begin
  inherited;
  cadBandeira.restaurar;
end;

procedure TfrmCadAdmCartao.BitBtn21Click(Sender: TObject);
begin
  inherited;
  cadBandeira.dataSet.Cancel;
  vDadosIni.GravaAuditoria('CXG106', 'CANCELA', cadBandeira.StrAuditoria, cadBandeira.TableName,
    cadBandeira.StrAuditoriaCod, cadBandeira.buscas);
end;

procedure TfrmCadAdmCartao.BitBtn22Click(Sender: TObject);
begin
  inherited;
  if cadBandeira.Post then
    TForm(pnBandCadastro.Parent).ModalResult := IDOK
  else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
    DBEdit9.SetFocus;
end;

procedure TfrmCadAdmCartao.BitBtn23Click(Sender: TObject);
begin
  inherited;
  if cadTaxas.Edit then
    vDadosIni.abreForm('Taxas de Cartão de Crédito ou Débito', pnTaxasCadastro, [ofAutoSize]);
end;

procedure TfrmCadAdmCartao.BitBtn24Click(Sender: TObject);
begin
  inherited;
  GroupBox4.Visible := true;
  if cadTaxas.Insert then
    vDadosIni.abreForm('Taxas de Cartão de Crédito ou Débito', pnTaxasCadastro, [ofAutoSize]);
end;

procedure TfrmCadAdmCartao.BitBtn25Click(Sender: TObject);
begin
  inherited;
  cadTaxas.Delete;
end;

procedure TfrmCadAdmCartao.BitBtn27Click(Sender: TObject);
begin
  inherited;
  montarComponentes;
  cadTaxas.abrirTaxasCartao(0, cadBandeira.dataSet.FieldByName('cod_bandeira').AsInteger);
  vDadosIni.abreForm('Consulta de Taxas de Cartão de Crédito ou Débito', pnTaxasConsulta, [ofAutoSize]);
end;

procedure TfrmCadAdmCartao.BitBtn29Click(Sender: TObject);
begin
  inherited;
  cadTaxas.Cancel;
  vDadosIni.GravaAuditoria('CXG114', 'CANCELA', cadTaxas.StrAuditoria, cadTaxas.TableName,
    cadTaxas.StrAuditoriaCod, cadTaxas.buscas);
end;

procedure TfrmCadAdmCartao.BitBtn30Click(Sender: TObject);
begin
  inherited;
  if cadTaxas.Post then
    TForm(pnTaxasCadastro.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(cadTaxas.vNomeCampoErro, cadTaxas.vMensagemErro);
end;

procedure TfrmCadAdmCartao.BitBtn3Click(Sender: TObject);
begin
 try
    Screen.Cursor := crHourGlass;
    if not cadAdm.Insert then
      exit;

    inherited;

    lbxRedes.Clear;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;

    pnAdmCartaoCodDescr.Visible    := false;
    pnAdmCartaoEstab.Visible       := false;
    pnAdmCartaoEnd.Visible         := false;
    pnAdmCartaoAdquirente.Visible  := false;
    pnAdmCartaoCodCliente.Visible  := false;
    pnAdmCartaoDefinirTaxa.Visible := false;
    pnCamposObrigatorio.Visible    := false;
//    pnAdmCartaoTaxaRedes.Visible   := false;

    pnAdmCartaoCodDescr.Align      := alBottom;
    pnAdmCartaoEstab.Align         := alBottom;
    pnAdmCartaoEnd.Align           := alBottom;
    pnAdmCartaoAdquirente.Align    := alBottom;
    pnAdmCartaoCodCliente.Align    := alBottom;
    pnAdmCartaoDefinirTaxa.Align   := alBottom;
    pnCamposObrigatorio.Align      := alBottom;
//    pnAdmCartaoTaxaRedes.Align     := alBottom;

    pnAdmCartaoCodDescr.Visible    := true;
    pnAdmCartaoCodDescr.Align      := alTop;

    pnAdmCartaoEstab.Visible       := not vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;
    pnAdmCartaoEstab.Align         := alTop;

    pnAdmCartaoEnd.Visible         := true;
    pnAdmCartaoEnd.Align           := alTop;

    pnAdmCartaoAdquirente.Visible  :=
    	(vDadosIni.vConcCartao.vHabilitarConcCartaoAPI)
      or (trim(vDadosIni.vConcCartao.vVersaoConcCartao) <> '1');
    pnAdmCartaoAdquirente.Align    := alTop;

    pnAdmCartaoCodCliente.Visible  := true;
    pnAdmCartaoCodCliente.Align    := alTop;

    pnAdmCartaoDefinirTaxa.Visible := not vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;
    pnAdmCartaoDefinirTaxa.Align   := alTop;

  	pnCamposObrigatorio.Visible    := not vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;
    pnCamposObrigatorio.Align      := alTop;

//    pnAdmCartaoTaxaRedes.Visible  := not vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;
//    pnAdmCartaoTaxaRedes.Align    := alTop;

    if cadAdm.dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString = 'B' then
    	DBComboBoxTaxaPorCtrlBandeira.ItemIndex := 1
    else
    	DBComboBoxTaxaPorCtrlBandeira.ItemIndex := 0;
      
  	if cadAdm.dataSet.FieldByName('CAMPO_NSU_OBRIG').AsString = 'N' then
    	DBComboBoxNSUobrig.ItemIndex := 1
    else
    	DBComboBoxNSUobrig.ItemIndex := 0;

    if cadAdm.dataSet.FieldByName('CAMPO_NUM_AUT_OBRIG').AsString = 'N' then
	    DBComboBoxNumAutObrig.ItemIndex := 1
    else
    	DBComboBoxNumAutObrig.ItemIndex := 0;

    DBComboBoxNSUobrig.Enabled    := DBComboBoxTaxaPorCtrlBandeira.ItemIndex = 1;
  	DBComboBoxNumAutObrig.Enabled := DBComboBoxTaxaPorCtrlBandeira.ItemIndex = 1;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAdmCartao.BitBtn4Click(Sender: TObject);
var
  vListaTmp: TStringList;
begin
  vListaTmp := TStringList.Create;
  vListaTmp.Text := lbxRedes.Items.Text;

  if (cadAdm.dataSet.State in [dsInsert, dsEdit]) then
    cadAdm.dataSet.FieldByName('redes').AsString := vDadosIni.Join(vListaTmp);

 if not cadAdm.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(cadAdm.vNomeCampoErro);
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
      if cadAdm.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadAdmCartao.BitBtn5Click(Sender: TObject);
begin
  cadAdm.Cancel;
  inherited;
end;

procedure TfrmCadAdmCartao.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if cadAdm.vTermCartao.Edit then
  begin
    Panel5.Enabled := False;
    Panel6.Visible := True;
    DBGrid2.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
      DBEdit5.SetFocus;
  end;
end;

procedure TfrmCadAdmCartao.BitBtn8Click(Sender: TObject);
begin
  if cadAdm.vTermCartao.Insert then
  begin
    Panel5.Enabled := False;
    Panel6.Visible := True;
    DBGrid2.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
      DBEdit5.SetFocus;
  end;
end;

procedure TfrmCadAdmCartao.BitBtn9Click(Sender: TObject);
begin
	cadAdm.vTermCartao.Delete;
end;

procedure TfrmCadAdmCartao.montarComponentes;
begin
  if not Assigned(cadTaxas) then
  begin
    cadTaxas := TTaxas_Bandeiras.create(nil);
    setTClientDataSet(vDadosIni.dataSetCol, DBGrid4, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  try
    if Assigned(cadTaxas.lkConsAdm.dataSet) then
      cadTaxas.lkConsAdm.dataSet.AfterScroll := nil;
    if Assigned(cadTaxas.lkConsBand.dataSet) then
      cadTaxas.lkConsBand.dataSet.AfterScroll := nil;

    cadTaxas.ExecutaComandosSql('select COD_BANDEIRA, DESCRICAO, ATIVO from BANDEIRAS_CARTAO WHERE cod_empresa = ' + vDadosIni.codEmpresa + ' order by 2', False);
    cadTaxas.lkBandeira.setDadosDataSet('COD_BANDEIRA', 'DESCRICAO', cadTaxas.buscas,  DBLookupComboBox1);

    cadTaxas.ExecutaComandosSql('select COD_ADM, DESCRICAO_ADM from ADM_CARTAO WHERE cod_empresa = ' + vDadosIni.codEmpresa + ' order by 2' , False);
    cadTaxas.lkAdministradora.setDadosDataSet('COD_ADM', 'DESCRICAO_ADM', cadTaxas.buscas,  DBLookupComboBox2);

    cadTaxas.lkDebCred.setDadosDataSet([ 'C', 'D'], [ 'C - Crédito', 'D - Débito'], DBLookupComboBox3);

    cadTaxas.ExecutaComandosSql(
      'select 0 COD_ADM, '' '' DESCRICAO_ADM from RDB$DATABASE' +
      ' union ' +
      'select COD_ADM, DESCRICAO_ADM from ADM_CARTAO WHERE cod_empresa = ' + vDadosIni.codEmpresa + ' order by 1'
      , False);
    cadTaxas.lkConsAdm.setDadosDataSet('COD_ADM', 'DESCRICAO_ADM', cadTaxas.buscas,  DBLookupComboBox4);
    if (Assigned(cadAdm)) and (cadAdm.dataSet.Active) then
      DBLookupComboBox4.KeyValue := cadAdm.dataSet.FieldByName('cod_adm').AsInteger
    else
      DBLookupComboBox4.KeyValue := 0;

    cadTaxas.ExecutaComandosSql(
      'select 0 COD_BANDEIRA, '' '' DESCRICAO, 1 ATIVO from RDB$DATABASE' +
      ' union ' +
      'select COD_BANDEIRA, DESCRICAO, ATIVO from BANDEIRAS_CARTAO WHERE cod_empresa = ' + vDadosIni.codEmpresa + ' order by 1'
      , False);
    cadTaxas.lkConsBand.setDadosDataSet('COD_BANDEIRA', 'DESCRICAO', cadTaxas.buscas,  DBLookupComboBox5);
    if (Assigned(cadBandeira)) and (cadBandeira.dataSet.Active) then
      DBLookupComboBox5.KeyValue := cadBandeira.dataSet.FieldByName('cod_bandeira').AsInteger
    else
      DBLookupComboBox5.KeyValue := 0;

  finally
    cadTaxas.lkConsAdm.dataSet.AfterScroll := cadTaxas.ConsultaAfterScroll;
    cadTaxas.lkConsBand.dataSet.AfterScroll := cadTaxas.ConsultaAfterScroll;
  end;
end;

procedure TfrmCadAdmCartao.DBComboBoxTaxaPorCtrlBandeiraExit(Sender: TObject);
begin
  inherited;
  if DBComboBoxTaxaPorCtrlBandeira.ItemIndex = 0 then
  begin
  	DBComboBoxNSUobrig.ItemIndex    := 0;
  	DBComboBoxNumAutObrig.ItemIndex := 0;
  end;

  DBComboBoxNSUobrig.Enabled    := DBComboBoxTaxaPorCtrlBandeira.ItemIndex = 1;
  DBComboBoxNumAutObrig.Enabled := DBComboBoxTaxaPorCtrlBandeira.ItemIndex = 1;
end;

procedure TfrmCadAdmCartao.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CXG099', 'PESQUISAR', '', 'CLIENTES', '', cadAdm.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        cadAdm._abreClientes;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
        if vDadosIni.vPesquisa <> '' then
        begin
          cadAdm.dataSet.FieldByName('COD_CLIENTE').asinteger := strtoint(vDadosIni.vPesquisa);
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmCadAdmCartao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadAdmCartao.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
  GroupBox4.Visible := trim(cadTaxas.dataSet.FieldByName('DEBITO_CREDITO').AsString) = 'C';

  if (Self.Enabled) and (Self.Visible) and (GroupBox4.CanFocus) then
  	GroupBox4.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit14.CanFocus) then
  	DBEdit14.SetFocus;  
end;

procedure TfrmCadAdmCartao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
 	cadAdm.Free;
  cadAdm := nil;

  Action := caFree;
  frmCadAdmCartao := nil;
end;

procedure TfrmCadAdmCartao.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  cadAdm := TAdministradoraCartao.create;

  TabSheet3.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadAdmCartao.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (cadAdm.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadAdmCartao.FormShow(Sender: TObject);
begin
	tsTerminalCartao.TabVisible := False;
  tsBandeiraCartao.TabVisible := False;
  tsTaxasCartao.TabVisible    := False;
 if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicosCx.dsAdmCartao;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CXG077]';
    CheckBox1.Visible := False;
    CheckBox3.Visible := False;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(cadAdm._lixeiraVazia);
  end;
  pnAdmCartaoTaxaRedes.Visible := false;//nao usa mais isso, e sim um cadastro a parte
  groupRedes.Visible := false;//nao usa mais isso, e sim um cadastro a parte
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadAdmCartao.spBtRedesAdicionarClick(Sender: TObject);
var
  vTemp: string;
begin
  inherited;

  if not (cadAdm.dataSet.State in [dsInsert, dsEdit]) then
    exit;

  if not InputQuery('Rede', 'Informe o a Rede que deseja adicionar', vTemp) then
    Exit;

  try
    if Trim(vTemp) = '' then
      raise exception.Create('Rede não informada');


    if pos(Trim(vTemp), lbxRedes.Items.Text) > 0 then
      raise exception.Create('Rede já incluída');

    lbxRedes.Items.Add(Trim(vTemp));

  except on E: Exception do
    begin
      Application.MessageBox(Pchar(e.Message), 'Erro', 0 + 64);
    end;
  end;
end;

procedure TfrmCadAdmCartao.spBtRedesRemoverClick(Sender: TObject);
begin
  inherited;
  if lbxRedes.ItemIndex <> - 1 then
    lbxRedes.DeleteSelected;
end;

procedure TfrmCadAdmCartao.SpeedButton1Click(Sender: TObject);
var
  vListaTmp: TStringList;
begin
 try
    Screen.Cursor := crHourGlass;
    if not cadAdm.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;

    pnAdmCartaoCodDescr.Visible    := false;
    pnAdmCartaoEstab.Visible       := false;
    pnAdmCartaoEnd.Visible         := false;
    pnAdmCartaoAdquirente.Visible  := false;
    pnAdmCartaoCodCliente.Visible  := false;
    pnAdmCartaoDefinirTaxa.Visible := false;
    pnCamposObrigatorio.Visible    := false;
//    pnAdmCartaoTaxaRedes.Visible   := false;

    pnAdmCartaoCodDescr.Align      := alBottom;
    pnAdmCartaoEstab.Align         := alBottom;
    pnAdmCartaoEnd.Align           := alBottom;
    pnAdmCartaoAdquirente.Align    := alBottom;
    pnAdmCartaoCodCliente.Align    := alBottom;
    pnAdmCartaoDefinirTaxa.Align   := alBottom;
    pnCamposObrigatorio.Align      := alBottom;
//    pnAdmCartaoTaxaRedes.Align     := alBottom;

    pnAdmCartaoCodDescr.Visible    := true;
    pnAdmCartaoCodDescr.Align      := alTop;

    pnAdmCartaoEstab.Visible       := not vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;
    pnAdmCartaoEstab.Align         := alTop;

    pnAdmCartaoEnd.Visible         := true;
    pnAdmCartaoEnd.Align           := alTop;

    pnAdmCartaoAdquirente.Visible  :=
    	(vDadosIni.vConcCartao.vHabilitarConcCartaoAPI)
      or (trim(vDadosIni.vConcCartao.vVersaoConcCartao) <> '1');
    pnAdmCartaoAdquirente.Align    := alTop;

    pnAdmCartaoCodCliente.Visible  := true;
    pnAdmCartaoCodCliente.Align    := alTop;

    pnAdmCartaoDefinirTaxa.Visible := not vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;
    pnAdmCartaoDefinirTaxa.Align   := alTop;

    pnCamposObrigatorio.Visible    := not vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;
    pnCamposObrigatorio.Align      := alTop;

//    pnAdmCartaoTaxaRedes.Visible   := not vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;
//    pnAdmCartaoTaxaRedes.Align     := alTop;

    if cadAdm.dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString = 'B' then
    	DBComboBoxTaxaPorCtrlBandeira.ItemIndex := 1
    else
    	DBComboBoxTaxaPorCtrlBandeira.ItemIndex := 0;

    if cadAdm.dataSet.FieldByName('CAMPO_NSU_OBRIG').AsString = 'N' then
    	DBComboBoxNSUobrig.ItemIndex := 1
    else
    	DBComboBoxNSUobrig.ItemIndex := 0;

    if cadAdm.dataSet.FieldByName('CAMPO_NUM_AUT_OBRIG').AsString = 'N' then
	    DBComboBoxNumAutObrig.ItemIndex := 1
    else
    	DBComboBoxNumAutObrig.ItemIndex := 0;

    DBComboBoxNSUobrig.Enabled    := DBComboBoxTaxaPorCtrlBandeira.ItemIndex = 1;
  	DBComboBoxNumAutObrig.Enabled := DBComboBoxTaxaPorCtrlBandeira.ItemIndex = 1;

    vListaTmp := TStringList.Create;
    vListaTmp := vDadosIni.Split(
      vDadosIni.retornoPorCondicao(Copy(cadAdm.dataSet.FieldByName('redes').AsString,1,1) = '|',
      Copy(cadAdm.dataSet.FieldByName('redes').AsString,2,Length(cadAdm.dataSet.FieldByName('redes').AsString)),
      cadAdm.dataSet.FieldByName('redes').AsString));
    lbxRedes.Items.Text := vListaTmp.Text;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAdmCartao.SpeedButton25Click(Sender: TObject);
begin
	if not cadAdm._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CXG077]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
    SpeedButton6.Visible := True;    
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [CXG078]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
    SpeedButton6.Visible := False;
  end;
end;

procedure TfrmCadAdmCartao.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadAdmCartao_RedesTEF, frmCadAdmCartao_RedesTEF);
  frmCadAdmCartao_RedesTEF.ShowModal;
end;

procedure TfrmCadAdmCartao.SpeedButton2Click(Sender: TObject);
begin
 try
    Screen.Cursor := crHourGlass;
    cadAdm.Delete;
    lixeiraVazia( cadAdm._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAdmCartao.SpeedButton5Click(Sender: TObject);
begin
  if cadAdm._restaurarRegistroDaLixeira then
    lixeiraVazia(cadAdm._lixeiraVazia);
end;

procedure TfrmCadAdmCartao.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not cadAdm.dataSet.IsEmpty then
    cadAdm.vTermCartao.abreFormTermCartao(cadAdm.dataset.FieldByName('COD_ADM').AsString);
end;

procedure TfrmCadAdmCartao.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  montarComponentes;

  if not vDadosIni.PesqPros('CXG109', 'CONSULTA', '', cadTaxas.TableName, '',
    cadAdm.buscas) then
    Exit;

  cadTaxas.abrirTaxasCartao(cadAdm.dataSet.FieldByName('cod_adm').AsInteger, 0);
  vDadosIni.abreForm('Consulta de Taxas de Cartão de Crédito ou Débito', pnTaxasConsulta, [ofAutoSize]);
end;

procedure TfrmCadAdmCartao.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if cadBandeira = nil then
  begin
    cadBandeira := TBandeiras_Cartao.create();
    setTClientDataSet(vDadosIni.dataSetCol, DBGrid3, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if not vDadosIni.PesqPros('CXG100', 'CONSULTA', '', cadBandeira.TableName, '',
    cadAdm.buscas) then
    Exit;

  BitBtn20.Visible := False;
  BitBtn19.Caption := 'Abrir';
  BitBtn19.Hint := 'Ver Lixeira - [CXG107]';
  BitBtn17.Hint := 'Enviar para a Lixeira - [CXG103]';

  cadBandeira.abrirBandeiras(False);
  vDadosIni.abreForm('Bandeiras de Cartão de Crédito', pnBandConsulta, [ofAutoSize]);
  salvarGridNoConfigColunas(DBGrid3);

end;

end.
