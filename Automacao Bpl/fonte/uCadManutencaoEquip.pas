unit uCadManutencaoEquip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, UClassesEquipamentos, DBCtrls, Spin, AppEvnts;

type
  TfrmCadManutencaoEquip = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    tsEnvio: TTabSheet;
    tsDetalhes: TTabSheet;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    GroupBox6: TGroupBox;
    edParcelas: TSpinEdit;
    Label16: TLabel;
    cbCondPag: TComboBox;
    Label17: TLabel;
    ListBox1: TListBox;
    Panel11: TPanel;
    BitBtn45: TBitBtn;
    BitBtn47: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn9: TBitBtn;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn47Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
  end;

var
  frmCadManutencaoEquip: TfrmCadManutencaoEquip;
  obManutEquip: TManutencaoEquipamentos;

implementation

uses uDtmEquipamentos, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmCadManutencaoEquip.BitBtn1Click(Sender: TObject);
begin
   SpeedButton2.Hint := 'Enviar para Lixeira -  [EQU022]';
   
  if not vDadosIni.PesqPros('EQU020', 'PESQUISAR', '', 'MANUTENCAO', '', obManutEquip.buscas, true) then
//  if not vDadosIni.PesqPros('EQU020', '', obManutEquip.buscas, true) then
    exit;
  inherited;
  if MaskEdit2.Visible then
  begin
    if not obManutEquip.ConsultaCampos('MANUTENCAO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not obManutEquip.ConsultaCampos('MANUTENCAO', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;
        
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadManutencaoEquip.BitBtn2Click(Sender: TObject);
begin
  obManutEquip.Cancel;
  inherited;
end;

procedure TfrmCadManutencaoEquip.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('EQU019', 'INCLUINDO', '', 'MANUTENCAO', '', obManutEquip.buscas, true) then
//  if not vDadosIni.PesqPros('EQU019', '', obManutEquip.buscas, true) then
    exit;
  if not obManutEquip.Insert then
    exit;
  ActiveControl := BitBtn3;
  inherited;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TfrmCadManutencaoEquip.BitBtn45Click(Sender: TObject);
begin
  inherited;
  if ListBox1.Items.Count = 0 then
    exit;
  if obManutEquip.enviaManutencaoParaCaixa then
    PageControl1.ActivePage := tsDetalhes;
end;

procedure TfrmCadManutencaoEquip.BitBtn47Click(Sender: TObject);
begin
  inherited;
  ListBox1.Clear;
  edParcelas.Value := 0;
  cbCondPag.Text := cbCondPag.Items[0];
  obManutEquip.Cancel;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadManutencaoEquip.BitBtn4Click(Sender: TObject);
begin
  if not obManutEquip.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obManutEquip.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadManutencaoEquip.BitBtn5Click(Sender: TObject);
begin
  obManutEquip.Cancel;
  inherited;
end;

procedure TfrmCadManutencaoEquip.BitBtn7Click(Sender: TObject);
begin
  inherited;
  ListBox1.Clear;
end;

procedure TfrmCadManutencaoEquip.BitBtn8Click(Sender: TObject);
begin
  inherited;
  obManutEquip.vCondPag.setNumeroDocContaAPagar(obManutEquip.dataSet.FieldByName('NUM_DOC_DESP').AsInteger);
  if obManutEquip.vCondPag.montaParcelamento(ListBox1, edParcelas.Value, cbCondPag.Text,
    obManutEquip.dataSet.FieldByName('custo_manuten').AsCurrency) then
    	if (Self.Enabled) and (Self.Visible) and (BitBtn45.CanFocus) then
    		BitBtn45.SetFocus;
end;

procedure TfrmCadManutencaoEquip.BitBtn9Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadManutencaoEquip.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vEquip: TEquipamentos;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('EQU030', 'PESQUISAR', '', 'MANUTENCAO', '', obManutEquip.buscas, true) then
//    if vDadosIni.PesqPros('EQU030', '', obManutEquip.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := inttostr(obManutEquip.dataSet.FieldByName('COD_EQUIP').AsInteger);
        obManutEquip.dataSet.FieldByName('COD_EQUIP').asinteger :=
          strtoint(vDadosIni.pesquisaRapida('EQUIPAMENTO'));
      except
        obManutEquip.dataSet.FieldByName('COD_EQUIP').AsInteger := StrToInt(vDadosIni.vPesquisa);
      end;
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('EQU031', 'INCLUIR', '', 'MANUTENCAO', '', obManutEquip.buscas, true) then
//    if vDadosIni.PesqPros('EQU031', '', obManutEquip.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vEquip.CadEquipamentos(1);
        obManutEquip.vlocEquip.abreLocEquipManu;
        if vDadosIni.vPesquisa <> '' then
         obManutEquip.dataSet.FieldByName('COD_EQUIP').AsInteger := StrToInt(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmCadManutencaoEquip.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if obManutEquip.existeFornecedor then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
    	DBEdit5.SetFocus;
end;

procedure TfrmCadManutencaoEquip.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//VAR
//    vFornec: TFornecedores;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('EQU028', 'PESQUISAR', '', 'MANUTENCAO', '', obManutEquip.buscas, true) then
//    if vDadosIni.PesqPros('EQU028', '', obManutEquip.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := inttostr(obManutEquip.dataSet.FieldByName('CODIGO_F').AsInteger);
        obManutEquip.dataSet.FieldByName('CODIGO_F').asinteger :=strtoint(vDadosIni.pesquisaRapida('CLIENTES',
      ' AND ((CLIENTES.TIPO <> ''C'') OR (CLIENTES.TIPO IS NULL))', 'Pesquisa de Fornecedores'));
      except
        obManutEquip.dataSet.FieldByName('CODIGO_F').AsInteger := StrToInt(vDadosIni.vPesquisa);
      end;
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('EQU029', 'INCLUIR', '', 'MANUTENCAO', '', obManutEquip.buscas, true) then
//    if vDadosIni.PesqPros('EQU029', '', obManutEquip.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        //        vFornec.CadFornecedores(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmCadManutencaoEquip.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (Key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadManutencaoEquip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //  frmCadManutencaoEquip.Free;
  frmCadManutencaoEquip := nil;
end;

procedure TfrmCadManutencaoEquip.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obManutEquip := TManutencaoEquipamentos.Create;
  tsEnvio.TabVisible := false;
  tsDetalhes.TabVisible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadManutencaoEquip.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (obManutEquip.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadManutencaoEquip.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

  if vShow <> 1 then
  begin
  	DBGrid1.DataSource := DtmEquipamentos.dsManuEquip;
    inherited;
    if vCriou = 0 then
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadManutencaoEquip.SpeedButton1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('EQU021', 'EDITAR', '', 'MANUTENCAO',
  obManutEquip.dataSet.FieldByName('cod_manutencao').AsString , obManutEquip.buscas, true) then
//  if not vDadosIni.PesqPros('EQU021', obManutEquip.dataSet.FieldByName('cod_manutencao').AsString,
//    obManutEquip.buscas, true) then
    exit;
  if obManutEquip.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    Exit;
  if not obManutEquip.Edit then
    EXIT;
  inherited;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TfrmCadManutencaoEquip.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('EQU023', 'VISUALIZAR', '', 'MANUTENCAO','', obManutEquip.buscas, true) then
//  if not vDadosIni.PesqPros('EQU023', '', obManutEquip.buscas, true) then
    exit;
  if not obManutEquip.AbrirLixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [EQU022]';
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [EQU022]';
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
  end;
end;

procedure TfrmCadManutencaoEquip.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('EQU022', 'EXCLUIR', '', 'MANUTENCAO',
  obManutEquip.dataSet.FieldByName('cod_manutencao').AsString, obManutEquip.buscas, true) then
//  if not vDadosIni.PesqPros('EQU022', obManutEquip.dataSet.FieldByName('cod_manutencao').AsString,
//    obManutEquip.buscas, true) then
    exit;
  if not obManutEquip.dataSet.IsEmpty then
    if obManutEquip.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    begin
      if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
        if obManutEquip.Delete then
          if obManutEquip.Apply then
            if obManutEquip.emTransacao then
              obManutEquip.CommitaTransacao;
    end
    else if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      if obManutEquip.Edit then
      begin
        obManutEquip.dataSet.FieldByName('ATIVO').asinteger := 0;
        if obManutEquip.Post then
          if obManutEquip.Apply then
            if obManutEquip.emTransacao then
              obManutEquip.CommitaTransacao;
      end;
    end;
  obManutEquip.Refresh;
end;

procedure TfrmCadManutencaoEquip.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not obManutEquip.dataSet.IsEmpty then
    if obManutEquip.dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
      begin
        if not vDadosIni.PesqPros('EQU024', 'RESTAURAR', '', 'MANUTENCAO',
        obManutEquip.dataSet.FieldByName('cod_manutencao').AsString, obManutEquip.buscas, true) then
//        if not vDadosIni.PesqPros('EQU024',
//          obManutEquip.dataSet.FieldByName('cod_manutencao').AsString, obManutEquip.buscas, true)
//            then
          exit;
        if obManutEquip.Edit then
        begin
          obManutEquip.dataSet.FieldByName('ATIVO').asinteger := 1;
          if obManutEquip.Post then
            if obManutEquip.Apply then
              obManutEquip.CommitaTransacao;
        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + chr(13) +
        'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
  obManutEquip.Refresh;
end;

procedure TfrmCadManutencaoEquip.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('EQU026', 'ACESSAR', '', 'MANUTENCAO',
        obManutEquip.dataSet.FieldByName('cod_manutencao').AsString, obManutEquip.buscas, true) then
//  if not vDadosIni.PesqPros('EQU026', obManutEquip.dataSet.FieldByName('cod_manutencao').AsString,
//    obManutEquip.buscas, true) then
    exit;
  if obManutEquip.statusNoCaixa = 0 then
  begin
    if cbCondPag.Items.Count = 0 then
      obManutEquip.montaCondPag(cbCondPag,0);
    
    if obManutEquip.Edit then
      PageControl1.ActivePage := tsEnvio;
  end
  else
    Application.MessageBox('Manutenção já foi enviada para o Contas a Pagar', 'Antenção', mb_ok
      + MB_ICONINFORMATION);
end;

procedure TfrmCadManutencaoEquip.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('EQU027', 'VISUALIZAR', '', 'MANUTENCAO',
   obManutEquip.dataSet.FieldByName('cod_manutencao').AsString, obManutEquip.buscas, true) then
//  if not vDadosIni.PesqPros('EQU027', obManutEquip.dataSet.FieldByName('cod_manutencao').AsString,
//    obManutEquip.buscas, true) then
    exit;
  if obManutEquip.detalhesNoCaixa then
    PageControl1.ActivePage := tsDetalhes;
end;

end.

