unit UCadEquipamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, Buttons, Grids, DBGrids, StdCtrls, Mask,
  ComCtrls, uDtmAtivo, UDtmEquipamentos, UClassesEquipamentos, db, uDadosIni,
  DBCtrls, AppEvnts, Spin;

type
  TFrmCadEquipamentos = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    Label18: TLabel;
    tsDepreciacao: TTabSheet;
    GroupBox5: TGroupBox;
    Label23: TLabel;
    DBText2: TDBText;
    Label24: TLabel;
    DBText3: TDBText;
    Label25: TLabel;
    DBText4: TDBText;
    Label26: TLabel;
    DBText5: TDBText;
    Label27: TLabel;
    Label28: TLabel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    Label22: TLabel;
    DBText1: TDBText;
    BitBtn7: TBitBtn;
    tsDadosSped: TTabSheet;
    GroupBox6: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBComboBox2: TDBComboBox;
    pnDadosSped: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    Panel5: TPanel;
    Label32: TLabel;
    DBEdit14: TDBEdit;
    Label33: TLabel;
    DBEdit15: TDBEdit;
    Label34: TLabel;
    DBEdit19: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    GroupBox4: TGroupBox;
    Label21: TLabel;
    DBEdit13: TDBEdit;
    DBMemo2: TDBMemo;
    Panel6: TPanel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Label57: TLabel;
    DBEdit38: TDBEdit;
    Label35: TLabel;
    Label36: TLabel;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    Label37: TLabel;
    DBComboBox5: TDBComboBox;
    Label38: TLabel;
    s: TDBEdit;
    TabSheet4: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox7: TGroupBox;
    pnServicosSugeridos: TPanel;
    Panel8: TPanel;
    DBGrid3: TDBGrid;
    Label211: TLabel;
    Label212: TLabel;
    SpeedButton40: TSpeedButton;
    Label39: TLabel;
    DBMemo3: TDBMemo;
    groupAdicional: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    ts_replica: TTabSheet;
    pn_replica: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    BitBtn14: TBitBtn;
    GroupBox8: TGroupBox;
    bt_replica_run: TBitBtn;
    Label48: TLabel;
    ed_replica_quantidade: TSpinEdit;
    GroupBox9: TGroupBox;
    bt_replica_remove: TBitBtn;
    ck_replica_parcelas: TCheckBox;
    Panel10: TPanel;
    memo_replica: TMemo;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodosEquipamentosClick: TMenuItem;
    DesmarcarTodosEquipamentosClick: TMenuItem;
    procedure ComboBox11Exit(Sender: TObject);
    procedure DesmarcarTodosEquipamentosClickClick(Sender: TObject);
    procedure MarcarTodosEquipamentosClickClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PageControl3Change(Sender: TObject);
    procedure bt_replica_runClick(Sender: TObject);
    procedure bt_replica_removeClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure groupAdicionalExit(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton40Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure DBComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox4Exit(Sender: TObject);
    procedure DBEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit9Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    { Private declarations }
    vCriou: Smallint;
  public
    procedure EditarEquipamento(Sender: TObject);
    { Public declarations }
  end;

var
  FrmCadEquipamentos: TFrmCadEquipamentos;
  Equipamento: TEquipamentos;

implementation

uses
  UClassesClientes,
  UClassesCadastrosBasicos,
  uDataSet_OOP,
  StrUtils,
  hw_utils,
  uRecord;
{$R *.dfm}

procedure TFrmCadEquipamentos.BitBtn10Click(Sender: TObject);
begin
  Equipamento.vServicosSugeridos.SalvarServicos(Equipamento.dataSet);
end;

procedure TFrmCadEquipamentos.BitBtn1Click(Sender: TObject);
var
i : integer;
begin
	try
  	Screen.Cursor := crHourGlass;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    SpeedButton6.Visible := true;
    SpeedButton8.Visible := true;
    SpeedButton7.Visible := true;
    SpeedButton11.Visible := true;
    SpeedButton12.Visible := true;

    SpeedButton2.Hint := 'Enviar para Lixeira - [EQU003]';

    inherited;
    Equipamento.vCons.campo := ComboBox1.Text;
    Equipamento.vCons.ordem := ComboBox2.Text;
    Equipamento.vCons.condicao := ComboBox3.Text;
    Equipamento.vCons.valor := MaskEdit3.Text;
    Equipamento.vCons.dataIni := MaskEdit1.Text;
    Equipamento.vCons.dataFim := MaskEdit2.Text;
    Equipamento.vCons.porData := MaskEdit1.Visible;

    Equipamento.vCons.adicional := CheckBox1.Checked;
    Equipamento.vCons.campoAd := ComboBox11.Text;
    Equipamento.vCons.valorAd := MaskEdit7.Text;
    Equipamento.vCons.dataIniAd := MaskEdit9.Text;
    Equipamento.vCons.dataFimAd := MaskEdit8.Text;
    Equipamento.vCons.condicaoAd := ComboBox12.Text;
    Equipamento.vCons.porDataAd := MaskEdit9.Visible;

    Equipamento.consulta;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;

    if Equipamento.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
      begin
        IF DBGrid1.Columns[i].FieldName = 'ESTADO_EQUI' THEN
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
        IF DBGrid1.Columns[i].FieldName = 'FUNC' THEN
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
      end;
  finally
    gravaConfiguracoesFormRegistro;
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadEquipamentos.BitBtn3Click(Sender: TObject);
var
  I: Integer;
begin
  if not vDadosIni.PesqPros('EQU001', 'INCLUINDO EQUIPAMENTO', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
    exit;

  try
    Screen.Cursor := crHourGlass;

    if not Equipamento.Insert then
    	Exit;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    inherited;
    TabSheet3.TabVisible := true;
    PageControl3.ActivePage := TabSheet3;
    Label39.Visible := (vDadosIni.vEquipamentos.HabAtivReparoInstrucacaoInMetr)
    	and (vDadosIni.vEmp.vUsarAparelho = 'S');
    DBMemo3.Visible := (vDadosIni.vEquipamentos.HabAtivReparoInstrucacaoInMetr)
    	and (vDadosIni.vEmp.vUsarAparelho = 'S');
    Equipamento.verificatipovenda(1, DBComboBox4, 'OS', '');

    if Equipamento.dataSet.FieldByName('TIP_EQUIP').AsString = 'I' then
      DBComboBox1.ItemIndex := 1
    else
      DBComboBox1.ItemIndex := 0;
    Equipamento.LocDepartamentos.abreDepartamentos;
    DBComboBox5.Enabled := ((Equipamento.dataSet.FieldByName('cod_nf_ent').AsInteger = 0) and (Equipamento.dataSet.FieldByName('TIP_EQUIP').AsString = 'I'));
    DBComboBox2.Enabled := True;
    TabSheet3.Caption := 'Cadastrando um novo Equipamento';

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
	   	DBComboBox1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadEquipamentos.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  try
    if not vDadosIni.PesqPros('EQU006', 'BT OK', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//    if not vDadosIni.PesqPros('EQU006', '', Equipamento.buscas, false) then
      Exit;
    Screen.Cursor := crHourGlass;
    if not Equipamento.Post then
    begin
      setFocusCampoErro(Equipamento.vNomeCampoErro, Equipamento.vMensagemErro);
      exit;
    end
    else if CheckCadSeq.Checked then
    begin
      if Equipamento.Insert then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
        	DBComboBox1.SetFocus;
      end;
      MudaCor;  
    end
    else
      inherited;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadEquipamentos.BitBtn5Click(Sender: TObject);
begin
  inherited;
  //inherited;
  PageControl1.ActivePage := TabSheet2;
  Equipamento.Cancel;
  if vDadosIni.vEquipamento.COD_NF_ENT = 0 then
  	Equipamento.RollBackTransacao;
end;

procedure TFrmCadEquipamentos.BitBtn7Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TFrmCadEquipamentos.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnDadosSped.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadEquipamentos.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if Equipamento.salvaDadosSped then
    TForm(pnDadosSped.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(Equipamento.vNomeCampoErro);
end;

procedure TFrmCadEquipamentos.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Equipamento._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadEquipamentos.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Equipamento._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadEquipamentos.bt_replica_removeClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    if not vDadosIni.PesqPros('EQU003', 'EXCLUIR', 'REPLICAS DE ' + Equipamento.fstr('COD_EQUIP'), 'EQUIPAMENTO', '', Equipamento.buscas) then
      Exit;

    if ContainsText(memo_replica.Lines.Text, 'parcelas de movimentação CIAP') then
    begin
      if not vDadosIni.PesqPros('SPED073', 'EXCLUIR', 'REPLICAS DE ' + Equipamento.fstr('COD_EQUIP'), 'MOVIMENTO_CIAP', '', Equipamento.buscas) then
        Exit;

      if ShowConfirmacao('As replicas podem conter movimentação CIAP, elas serão excluidas também. Continuar mesmo assim?') <> IDYES then
        Exit;
    end;

    if Equipamento.RemoverReplicas(Equipamento.fint('cod_equip')) then
      TForm(pn_replica.Parent).ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadEquipamentos.bt_replica_runClick(Sender: TObject);
begin
  inherited;  
  Screen.Cursor := crHourGlass;
  try
    if ck_replica_parcelas.Checked then
      if not vDadosIni.PesqPros('SPED109', 'REPLICAR', 'REPLICAS DE ' + Equipamento.fstr('cod_equip'), 'MOVIMENTO_CIAP', '', Equipamento.buscas) then
        Exit;

    if Equipamento.ReplicarEquipamento(Equipamento.fint('cod_equip'), ed_replica_quantidade.Value, ck_replica_parcelas.Checked) then
      TForm(pn_replica.Parent).ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadEquipamentos.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 193
  else
    GroupBox3.Height := 73;

  groupAdicional.Visible := CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;
  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    ComboBox11.SetFocus;
end;

procedure TFrmCadEquipamentos.ComboBox11Exit(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if trim(ComboBox11.Text) = '' then
  begin
  	ComboBox11.Text := Equipamento.dataSet.FieldByName('DAT_CAD_EQUI').DisplayLabel;
    
  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
end;

procedure TFrmCadEquipamentos.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox1.Text, 0, 1) = 'I') or (copy(DBComboBox1.Text, 0, 1) = 'E')) then
    begin
      Application.MessageBox('Selecione ''INTERNO'' ou ''EXTERNO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      	DBComboBox1.SetFocus;
      exit;
    end;
  Equipamento.LocProprietario.abreClienteColaborador(DBLookupComboBox1);
  DBComboBox5.Enabled := ((Equipamento.dataSet.FieldByName('cod_nf_ent').AsInteger = 0) and (Equipamento.dataSet.FieldByName('TIP_EQUIP').AsString = 'I'));
  if Equipamento.dataSet.FieldByName('TIP_EQUIP').AsString = 'I' then
  begin
    dbedit3.Enabled := true;
    DBLookupComboBox2.Enabled := true;
    DBLookupComboBox3.Enabled := true;
    DBEdit8.Enabled := true;
    DBEdit6.Enabled:=true;
  end
  else
  begin
    dbedit3.Text := '';
    dbedit3.Enabled := false;
    DBLookupComboBox2.Enabled := false;
    DBLookupComboBox3.Enabled := false;
    DBEdit8.Enabled := false;
    DBEdit6.Enabled:=false;
  end;
end;

procedure TFrmCadEquipamentos.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
  label35.Visible:= Equipamento.dataSet.FieldByName('COMCONTRATO').AsString='S';//DBComboBox3.Text='SIM';
  DBComboBox4.Visible:= Equipamento.dataSet.FieldByName('COMCONTRATO').AsString='S';//DBComboBox3.Text='SIM';
  if (Self.Enabled) and (Self.Visible) and (DBComboBox4.CanFocus) then
    DBComboBox4.SetFocus;
end;

procedure TFrmCadEquipamentos.DBComboBox3KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:=#0;
end;

procedure TFrmCadEquipamentos.DBComboBox4Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;
  if not Equipamento.verificatipovenda(2, DBComboBox4, 'OS', DBComboBox4.Text) then
     setFocusCampoErro(Equipamento.vNomeCampoErro);
end;

procedure TFrmCadEquipamentos.DBEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa :=
      vDadosIni.pesquisaRapida('CENTRO_CUSTOS');
    if Trim(vDadosIni.vPesquisa) <> '' then
    begin
      if Equipamento.dataSet.State = dsBrowse then
        Equipamento.dataSet.Edit;

      Equipamento.dataSet.FieldByName('COD_CCUS').AsString:=
        Trim(vDadosIni.vPesquisa);
    end;
  end;
end;

procedure TFrmCadEquipamentos.DBEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa :=
      vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL');
    if Trim(vDadosIni.vPesquisa) <> '' then
    begin
      if Equipamento.dataSet.State = dsBrowse then
        Equipamento.dataSet.Edit;
      
      Equipamento.dataSet.FieldByName('COD_CTA_EQ').AsString:=
        Trim(vDadosIni.vPesquisa);
    end;
  end;
end;

procedure TFrmCadEquipamentos.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn4) and (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if Equipamento.dataSet.FieldByName('COD_PROP').IsNull then
    begin
      if Equipamento.dataSet.FieldByName('TIP_EQUIP').AsString = 'E' then
      begin
        if vDadosIni.PesqPros('EQU008', 'PESQUISAR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//        if vDadosIni.PesqPros('EQU008', '', Equipamento.buscas, true) then
        begin
          try
            Screen.Cursor := crHourGlass;
            vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
            if vDadosIni.vPesquisa <> '' then
              Equipamento.dataSet.FieldByName('COD_PROP').asinteger := strtoint(vDadosIni.vPesquisa);
          finally
            Screen.Cursor := crDefault;
          end;
        end;
      end
      else
      if vDadosIni.PesqPros('EQU010', 'PESQUISAR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//      if vDadosIni.PesqPros('EQU010', '', Equipamento.buscas, true) then
      begin
        try
          Screen.Cursor := crHourGlass;
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR');
          if vDadosIni.vPesquisa <> '' then
            Equipamento.dataSet.FieldByName('COD_PROP').asinteger := strtoint(vDadosIni.vPesquisa);
        finally
          Screen.Cursor := crDefault;
        end;
      end;
    end
    else if not Equipamento.ChecaProprietario then
    begin
    	if (Self.Enabled) and (Self.Visible) and (dbedit2.CanFocus) then
      	dbedit2.SetFocus;
      exit;
    end;
end;

procedure TFrmCadEquipamentos.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Cliente: TCadClientes;
  //colaborador: TColaborador;
begin
  inherited;
  if Equipamento.dataSet.FieldByName('TIP_EQUIP').AsString = 'E' then
  begin
    if Key = VK_F3 then
    begin
      if vDadosIni.PesqPros('EQU008', 'PESQUISAR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//      if vDadosIni.PesqPros('EQU008', '', Equipamento.buscas, true) then
      begin
        try
          Screen.Cursor := crHourGlass;
          vDadosIni.vPesquisa := inttostr(Equipamento.dataSet.FieldByName('COD_PROP').AsInteger);
          Equipamento.dataSet.FieldByName('COD_PROP').asinteger :=
            strtoint(vDadosIni.pesquisaRapida('CLIENTES'));
        except
          Equipamento.dataSet.FieldByName('COD_PROP').AsInteger := StrToInt(vDadosIni.vPesquisa);
        end;
        Screen.Cursor := crDefault;
      end;
    end;
    if Key = VK_F4 then
    begin
      if vDadosIni.PesqPros('EQU009', 'INCLUIR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//      if vDadosIni.PesqPros('EQU009', '', Equipamento.buscas, true) then
      begin
        try
          Screen.Cursor := crHourGlass;
          Cliente.CadCliente(1);
          if vDadosIni.vPesquisa <> '' then
           Equipamento.dataSet.FieldByName('COD_PROP').AsInteger := StrToInt(vDadosIni.vPesquisa);
        finally
          Screen.Cursor := crDefault;
        end;
      end;
    end;
  end
  else
  begin
    if Key = VK_F3 then
    begin
      if vDadosIni.PesqPros('EQU010', 'PESQUISAR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//      if vDadosIni.PesqPros('EQU010', '', Equipamento.buscas, true) then
      begin
        try
          Screen.Cursor := crHourGlass;
          vDadosIni.vPesquisa := inttostr(Equipamento.dataSet.FieldByName('COD_PROP').AsInteger);
          Equipamento.dataSet.FieldByName('COD_PROP').asinteger :=
            strtoint(vDadosIni.pesquisaRapida('COLABORADOR'));
        except
          Equipamento.dataSet.FieldByName('COD_PROP').AsInteger := StrToInt(vDadosIni.vPesquisa);
        end;
        Screen.Cursor := crDefault;
      end;
    end;
    if Key = VK_F4 then
    begin
      if vDadosIni.PesqPros('EQU011', 'INCLUIR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//      if vDadosIni.PesqPros('EQU011', '', Equipamento.buscas, true) then
      begin
        try
{          Screen.Cursor := crHourGlass;
          colaborador.CadColab(1);
//          Cliente.CadCliente(1); //corrigir mudar
          Equipamento.LocProprietario.abreClienteColaborador(DBLookupComboBox1);
 }
        finally
          Screen.Cursor := crDefault;
        end;
      end;
    end;
  end;
end;

procedure TFrmCadEquipamentos.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Departamento: TDepartamentos;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('EQU012', 'PESQUISAR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//    if vDadosIni.PesqPros('EQU012', '', Equipamento.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := inttostr(Equipamento.dataSet.FieldByName('COD_DEPART').AsInteger);
        Equipamento.dataSet.FieldByName('COD_DEPART').asinteger :=
          strtoint(vDadosIni.pesquisaRapida('DEPTO'));
      except
        Equipamento.dataSet.FieldByName('COD_DEPART').AsInteger := StrToInt(vDadosIni.vPesquisa);
      end;
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('EQU013', 'INCLUIR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//    if vDadosIni.PesqPros('EQU013', '', Equipamento.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Departamento.CadDepartamentos(1);
        Equipamento.LocDepartamentos.abreDepartamentos;
        if vDadosIni.vPesquisa <> '' then
         Equipamento.dataSet.FieldByName('COD_DEPART').AsInteger := StrToInt(vDadosIni.vPesquisa);
       finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadEquipamentos.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  if Equipamento.dataSet.FieldByName('IND_DEPREC').IsNull then
    Equipamento.dataSet.FieldByName('IND_DEPREC').AsInteger := 0;
end;

procedure TFrmCadEquipamentos.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn4) and (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if Equipamento.dataSet.FieldByName('COD_MARCA').IsNull then
    begin
      if vDadosIni.PesqPros('EQU015', 'PESQUISAR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//      if vDadosIni.PesqPros('EQU015', '', Equipamento.buscas, true) then
      begin
        try
          Screen.Cursor := crHourGlass;
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD');
          if vDadosIni.vPesquisa <> '' then
          begin
            Equipamento.dataSet.FieldByName('COD_MARCA').asinteger := strtoint(vDadosIni.vPesquisa);
            if not Equipamento.ChecaMarma then
            	if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
              	DBEdit9.SetFocus;
          end
          else
          	Equipamento.dataSet.FieldByName('MARCA').AsString := '';
        finally
          Screen.Cursor := crDefault;
        end;
      end;
    end
    else if not Equipamento.ChecaMarma then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      	DBEdit9.SetFocus;
  end;
end;

procedure TFrmCadEquipamentos.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Marca: TMarcas;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('EQU015', 'PESQUISAR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//    if vDadosIni.PesqPros('EQU015', '', Equipamento.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD');
        if vDadosIni.vPesquisa <> '' then
          Equipamento.dataSet.FieldByName('COD_MARCA').asinteger := strtoint(vDadosIni.vPesquisa);
        //
        //        vDadosIni.vPesquisa := inttostr(Equipamento.dataSet.FieldByName('COD_MARCA').AsInteger);
        //        Equipamento.dataSet.FieldByName('COD_MARCA').asinteger :=
        //          strtoint(vDadosIni.pesquisaRapida('MARCA_PROD'));
        //      except
        //        Equipamento.dataSet.FieldByName('COD_MARCA').AsInteger := StrToInt(vDadosIni.vPesquisa);
        //      end;
        //      Screen.Cursor := crDefault;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('EQU016', 'INCLUIR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
//    if vDadosIni.PesqPros('EQU016', '', Equipamento.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Marca.CadMarcas(1);
        if vDadosIni.vPesquisa <> '' then
          Equipamento.dataSet.FieldByName('COD_MARCA').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

end;

procedure TFrmCadEquipamentos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    Equipamento._marcaDesmarcaLinha;
end;

procedure TFrmCadEquipamentos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadEquipamentos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (Key = VK_INSERT) then
  	BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not Equipamento.dataSet.IsEmpty then
      Equipamento._marcaDesmarcaLinha;
end;

procedure TFrmCadEquipamentos.DBGrid3CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	if not Equipamento.vServicosSugeridos.dataSet.IsEmpty then
	    	Equipamento.vServicosSugeridos._marcaDesmarcaLinha;
end;

procedure TFrmCadEquipamentos.DBGrid3DblClick(Sender: TObject);
begin
  if not Equipamento.vServicosSugeridos.dataSet.IsEmpty then
   	Equipamento.vServicosSugeridos._marcaDesmarcaLinha;
end;

procedure TFrmCadEquipamentos.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

	if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end; 
end;

procedure TFrmCadEquipamentos.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
		Equipamento.vServicosSugeridos._marcaDesmarcaLinha
  else if Key = VK_F2 then
  	Equipamento.vServicosSugeridos._marcarLinha
  else if Key = VK_F3 then
  	Equipamento.vServicosSugeridos._desmarcarLinha;
end;

procedure TFrmCadEquipamentos.DesmarcarTodosEquipamentosClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Equipamento._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadEquipamentos.EditarEquipamento(Sender: TObject);
begin
 try
  Equipamento.montaSelect(' SELECT * FROM EQUIPAMENTO ' +
   ' WHERE COD_ESTMOTO = ' + trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2)) +
   ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa);

  if not Equipamento.dataSet.IsEmpty then
  begin
   FrmCadEquipamentos.Caption := FrmCadEquipamentos.Caption + ' ' + trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3));
   trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3));
   GroupBox1.Caption := GroupBox1.Caption + ' - Favor conferir os dados do Equipamento';
   SpeedButton1Click(Sender);
  end;
 except
 end;
end;

procedure TFrmCadEquipamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  gravaConfiguracoesFormRegistro;
    
  Equipamento.Cancel;
  if vDadosIni.vEquipamento.COD_NF_ENT = 0 then
    Equipamento.RollBackTransacao;
  Equipamento.Destroy;
  FrmCadEquipamentos := nil;
end;

procedure TFrmCadEquipamentos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (pos('*SM*', vDadosIni.vPesquisa) > 0) then
    CanClose := True;
  inherited;
end;

procedure TFrmCadEquipamentos.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EQUIP_NOTA' then
  begin
    if DtmEquipamentos = nil then
      DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    FrmCadEquipamentos := TFrmCadEquipamentos(self);
  end;
  Equipamento := TEquipamentos.create;
  tsDepreciacao.TabVisible := False;
  tsDadosSped.TabVisible := False;
  ts_replica.TabVisible := False;
	TabSheet4.TabVisible := (vDadosIni.vEmp.vUsarAparelho = 'S') and (vDadosIni.vSugServico.vHabilitarSug);
  Equipamento.abreEquipamentos('');
  SpeedButton11.Enabled := vDadosIni.vEmp.vVersaoVeiculos = '4';
  if trim(vDadosIni.vEmp.vCredencInterventor) = '' then
    GroupBox6.Visible := false;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadEquipamentos.FormKeyDown(Sender: TObject; var Key: Word;
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
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn5Click(Sender);
  end;
end;

procedure TFrmCadEquipamentos.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

  if vShow <> 1 then
  begin
  	DBGrid1.DataSource := DtmEquipamentos.dsEquipamentos;
    if vCriou = 0 then
    begin
      inherited;
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    end;
  end;

  leConfiguracoesFormRegistro;

	if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EQUIP_NOTA' then
  begin
    if DtmEquipamentos = nil then
      DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    FrmCadEquipamentos := TFrmCadEquipamentos(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  vDadosIni.vPesquisa := '';
  vDadosIni.vTipoForm := 0;

  CheckBox3.Enabled := false;
//  CheckBox1.Enabled := false;


  if POS('CIAP',Caption) > 0 then
    TelaCadastro :=0;
  if TelaCadastro = 1 then
  begin
    if vDadosIni.vEquipamento.COD_NF_ENT > 0 then
      //Equipamento.montaSelect('SELECT EQUIPAMENTO.*, '' '' NOME_PROPRIETARIO FROM EQUIPAMENTO where COD_EQUIP = 0 and cod_empresa = ' + vDadosIni.codEmpresa);
      Equipamento.abreEquipamentos(0);
    BitBtn3Click(Sender);
  end;
  if (TelaCadastro = 6) then
    EditarEquipamento(Sender);

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "BAS406" PERMITIR INCLUIR/ALTERAR EQUIPAMENTO SEM INFORMAR SERVICO';

  if vCriou = 0 then
    vCriou := 1;

	vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadEquipamentos.gravaConfiguracoesFormRegistro;
begin
	if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
  end;
end;

procedure TFrmCadEquipamentos.groupAdicionalExit(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TFrmCadEquipamentos.GroupBox1Enter(Sender: TObject);
begin
  inherited;
  if Equipamento.dataSet.FieldByName('TIP_EQUIP').AsString = 'I' then
  begin
    dbedit3.Enabled := true;
    DBLookupComboBox2.Enabled := true;
    DBLookupComboBox3.Enabled := true;
    DBEdit8.Enabled := true;
    DBEdit6.Enabled:=true;
  end
  else
  begin
    dbedit3.Text := '';
    dbedit3.Enabled := false;
    DBLookupComboBox2.Enabled := false;
    DBLookupComboBox3.Enabled := false;
    DBEdit8.Enabled := false;
    DBEdit6.Enabled:=false;
  end;
end;

procedure TFrmCadEquipamentos.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
    CheckBox1Click(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox11.Name)) <> '' then
    	ComboBox11.Text   := _LerConfiguracoesRegistroString(ComboBox11.Name);
    for I := 0 to ComboBox11.Items.Count - 1 do
    begin
      if trim(ComboBox11.Items[I]) = trim(ComboBox11.Text) then
      begin
        ComboBox11.ItemIndex := I;
        Break;
      end;
    end;

    ComboBox11Exit(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox12.Name)) <> '' then
    	ComboBox12.Text   := _LerConfiguracoesRegistroString(ComboBox12.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text      := _LerConfiguracoesRegistroString(MaskEdit9.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text      := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text     := _LerConfiguracoesRegistroString(MaskEdit7.Name);
  end;
end;

procedure TFrmCadEquipamentos.MarcarTodosEquipamentosClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Equipamento._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadEquipamentos.PageControl3Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TFrmCadEquipamentos.SpeedButton11Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('EQU032', 'VENDER', '', 'EQUIPAMENTO', Equipamento.dataSet.FieldByName('COD_EQUIP').AsString, Equipamento.buscas, true) then
   Equipamento.verificaComando;
end;

procedure TFrmCadEquipamentos.SpeedButton12Click(Sender: TObject);
var
  model: TReplicaModel;
begin
  inherited;

  if Equipamento.fint('cod_equip') = 0 then
    Exit;

  if not vDadosIni.PesqPros('EQU001', 'INCLUSAO', 'REPLICAS DE ' + Equipamento.fstr('cod_equip'), 'EQUIPAMENTO', '', Equipamento.buscas, true) then
    exit;

  try
    model := Equipamento.GetReplica(Equipamento.fint('cod_equip'));

    memo_replica.Lines.Clear;
    if model.OriginalId > 0 then
      memo_replica.Lines.Add(Format('Esse registro é uma replica do registro %d', [model.OriginalId]));
    if model.ReplicasCriadas > 0 then
      memo_replica.Lines.Add(Format('Esse registro já possui %d replicas', [model.ReplicasCriadas]))
    else
      memo_replica.Lines.Add('Esse registro não possui nenhuma replica ainda');

    if model.ParcelasCriadas > 0 then
      memo_replica.Lines.Add(Format('Esse registro possui %d parcelas de movimentação CIAP', [model.ParcelasCriadas]));

    bt_replica_remove.Enabled := model.ReplicasCriadas > 0;
    ck_replica_parcelas.Checked := model.ParcelasCriadas > 0;
    ck_replica_parcelas.Enabled := model.ParcelasCriadas > 0;

    vDadosIni.abreForm('Replicação de Equipamento', pn_replica, opFormsDefCad);

  finally
    Equipamento.dataSet.Refresh;
  end;
end;

procedure TFrmCadEquipamentos.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.PesqPros('EQU002', 'EDITAR', '', 'EQUIPAMENTO', Equipamento.dataSet.FieldByName('COD_EQUIP').AsString, Equipamento.buscas, true) then
  	Exit;

  try
    Screen.Cursor := crHourGlass;
    if Equipamento.dataSet.IsEmpty then
      Exit;

    if not Equipamento.Edit then
      Exit;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    TabSheet3.TabVisible := true;
    PageControl3.ActivePage := TabSheet3;
    Label39.Visible := (vDadosIni.vEquipamentos.HabAtivReparoInstrucacaoInMetr)
      and (vDadosIni.vEmp.vUsarAparelho = 'S');
    DBMemo3.Visible := (vDadosIni.vEquipamentos.HabAtivReparoInstrucacaoInMetr)
      and (vDadosIni.vEmp.vUsarAparelho = 'S');
    TabSheet3.Show;

    label35.Visible:= Equipamento.dataSet.FieldByName('COMCONTRATO').AsString='S';
    DBComboBox4.Visible:= Equipamento.dataSet.FieldByName('COMCONTRATO').AsString='S';
    DBComboBox5.Enabled := ((Equipamento.dataSet.FieldByName('cod_nf_ent').AsInteger = 0) and (Equipamento.dataSet.FieldByName('TIP_EQUIP').AsString = 'I'));
    DBComboBox2.Enabled := (Equipamento.dataSet.FieldByName('COD_ESTMOTO').AsInteger <= 0);
    Equipamento.verificatipovenda(1, DBComboBox4, 'OS', '');
    Equipamento.LocDepartamentos.abreDepartamentos;
    Equipamento.LocDadosBalanco.abreDadosBalanco;
    TabSheet3.Caption := 'Alterando dados do Equipamento';

    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadEquipamentos.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('EQU004', 'VISUALIZAR', '', 'EQUIPAMENTO', '', Equipamento.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      if not Equipamento.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira - [EQU003]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
        SpeedButton6.Visible := true;
        SpeedButton8.Visible := true;
        SpeedButton7.Visible := true;
        SpeedButton11.Visible := true;
        SpeedButton12.Visible := true;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente - [EQU014]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
        SpeedButton6.Visible := false;
        SpeedButton8.Visible := false;
        SpeedButton7.Visible := false;
        SpeedButton11.Visible := false;
        SpeedButton12.Visible := false;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadEquipamentos.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
	try
    inherited;
    if not Equipamento.Delete then
      Exit;

    vStatusLixeira := Equipamento.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      Equipamento.Cancel;
      Equipamento.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadEquipamentos.SpeedButton40Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('equip_%', Equipamento.buscas);
end;

procedure TFrmCadEquipamentos.SpeedButton5Click(Sender: TObject);
begin
  if not Equipamento.restaurarRegistro then
  	Exit;
    
  if Equipamento.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TFrmCadEquipamentos.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('EQU017', 'CALCULAR', '', 'EQUIPAMENTO', Equipamento.dataSet.FieldByName('COD_EQUIP').AsString, Equipamento.buscas, true) then
//  if not vDadosIni.PesqPros('EQU017', Equipamento.dataSet.FieldByName('COD_EQUIP').AsString,
//    Equipamento.buscas, true) then
    Exit;
  if Equipamento.vDepreciacao.verificaDepreciacao(Equipamento) then
  begin
    Label28.Caption := 'R$ ' + FormatFloat('0.00',
      (equipamento.dataSet.FieldByName('VLR_EQUI').AsFloat - equipamento.vDepreciacao.ValorDepreciado));
    PageControl1.ActivePage := tsDepreciacao;
  end;
end;

procedure TFrmCadEquipamentos.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('EQU032', 'ACESSAR', '', 'EQUIPAMENTO',
  Equipamento.dataSet.FieldByName('COD_EQUIP').AsString, Equipamento.buscas, true) then
//  if not vDadosIni.PesqPros('EQU032', Equipamento.dataSet.FieldByName('COD_EQUIP').AsString,
//    Equipamento.buscas, False) then
    Exit;
  Equipamento.abreFormDadosSped;
end;

procedure TFrmCadEquipamentos.SpeedButton8Click(Sender: TObject);
var
  vManu: TManutencaoEquipamentos;
begin
  inherited;
  if not vDadosIni.PesqPros('EQU018', 'ACESSAR', '', 'EQUIPAMENTO', Equipamento.dataSet.FieldByName('COD_EQUIP').AsString, Equipamento.buscas, true) then
//  if not vDadosIni.PesqPros('EQU018', Equipamento.dataSet.FieldByName('COD_EQUIP').AsString,
//    Equipamento.buscas, true) then
    Exit;
  vManu.cadManutencaoEquipamentos(0);
end;

procedure TFrmCadEquipamentos.TabSheet2Show(Sender: TObject);
begin
  inherited;
  if Equipamento.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

initialization
  RegisterClass(TFrmCadEquipamentos);
finalization
  UnRegisterClass(TFrmCadEquipamentos);

end.

