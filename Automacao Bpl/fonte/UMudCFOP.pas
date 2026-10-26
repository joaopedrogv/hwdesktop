unit UMudCFOP;

interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadraoModal, DBCtrls, ExtCtrls, Menus,
  ComCtrls, Buttons, Grids, DBGrids, Controls, StdCtrls, Mask, Forms, Classes,
  AppEvnts, Graphics;

type
  TFrmMudCFOP = class(TfrmCadPadraoM)
    Label11: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label6: TLabel;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    Label14: TLabel;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    Panel4: TPanel;
    SpeedButton16: TSpeedButton;
    SpeedButton15: TSpeedButton;
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton25Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMudCFOP: TFrmMudCFOP;
  CfopMud: TCFOPMud;
  CfopUFDestino: TCfopUFDestino;

implementation

uses UDtmCadastrosBasicos, uDtmAtivo, SysUtils;

{$R *.dfm}

procedure TFrmMudCFOP.BitBtn1Click(Sender: TObject);
begin
  inherited;
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS030]';
  if MaskEdit2.Visible then
  begin
    if not CfopMud.ConsultaCampos('CFOP_MUD', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if CfopMud.ConsultaCampos('CFOP_MUD', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmMudCFOP.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS028', 'INCLUIR', '', 'CFOP_MUD', '', CfopMud.buscas, true) then
//  if vDadosIni.PesqPros('BAS028', '', CfopMud.buscas, true) then
  begin
    if CfopMud.Insert then
    begin
      inherited;
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
      	DBLookupComboBox2.SetFocus;
      CfopMud.PreencheCampos;
    end;
  end;
end;

procedure TFrmMudCFOP.BitBtn4Click(Sender: TObject);
begin
  ActiveControl := BitBtn4;
  if vDadosIni.PesqPros('BAS033', 'CONFIRMAR', '', 'CFOP_MUD', ' UFO = ' +
      CfopMud.dataSet.FieldByName('CODIGO_UF').AsString + ' UFD = ' +
      CfopMud.dataSet.FieldByName('UF_DESTINO').AsString, CfopMud.buscas, true) then
//  if vDadosIni.PesqPros('BAS033', '', CfopMud.buscas, false) then
  begin
    if not CfopMud.ChecaCamposObrigatorios then
    begin
      if CfopMud.campoComErro = 'NATOP_INT_NC' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end
      else if CfopMud.campoComErro = 'NATOP_INT_C' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        	DBEdit3.SetFocus;
      end
      else if CfopMud.campoComErro = 'NATOP_EXT_NC' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
        	DBEdit6.SetFocus;
      end
      else if CfopMud.campoComErro = 'NATOP_EXT_C' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
        	DBEdit7.SetFocus;
      end;
    end
    else
    begin
      if not CfopMud.gravar then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
        	DBLookupComboBox2.SetFocus;
      end
      else
      begin
        if CheckCadSeq.Checked then
        begin
          if CfopMud.Insert then
          begin
          	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
            	DBLookupComboBox2.SetFocus;
          end
          else
            inherited;
          MudaCor;
        end
        else
          inherited;
      end;
    end;
  end;
end;

procedure TFrmMudCFOP.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS034', 'CANCELAR', '', 'CFOP_MUD', '', CfopMud.buscas, true) then
//  if vDadosIni.PesqPros('BAS034', '', CfopMud.buscas, false) then
  begin
    inherited;
    TabSheet2.Show;
    CfopMud.Cancel;
    CfopMud.RollBackTransacao;
  end;
end;

procedure TFrmMudCFOP.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('BAS035', 'PESQUISAR', '', 'CFOP_MUD', '', CfopMud.buscas, true) then
//    if vDadosIni.PesqPros('BAS035', '', CfopMud.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
        if vDadosIni.vPesquisa <> '' then
          CfopMud.dataSet.FieldByName('NATOP_INT_NC').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmMudCFOP.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('BAS035', 'PESQUISAR', '', 'CFOP_MUD', '', CfopMud.buscas, true) then
//    if vDadosIni.PesqPros('BAS035', '', CfopMud.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
        if vDadosIni.vPesquisa <> '' then
          CfopMud.dataSet.FieldByName('NATOP_INT_C').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmMudCFOP.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('BAS035', 'PESQUISAR', '', 'CFOP_MUD', '', CfopMud.buscas, true) then
//    if vDadosIni.PesqPros('BAS035', '', CfopMud.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
        if vDadosIni.vPesquisa <> '' then
          CfopMud.dataSet.FieldByName('NATOP_EXT_NC').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmMudCFOP.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('BAS035', 'PESQUISAR', '', 'CFOP_MUD', '', CfopMud.buscas, true) then
//    if vDadosIni.PesqPros('BAS035', '', CfopMud.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
        if vDadosIni.vPesquisa <> '' then
          CfopMud.dataSet.FieldByName('NATOP_EXT_C').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmMudCFOP.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    SpeedButton1Click(Sender);
  if key = VK_DELETE then
    SpeedButton2Click(Sender);
end;

procedure TFrmMudCFOP.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
    if CfopMud.dataSet.FieldByName('UF_DESTINO').IsNull then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
      	DBLookupComboBox2.SetFocus;
    end
//    else if CfopMud.dataSet.FieldByName('CODIGO_UF').IsNull then
//    begin
//			if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
//      	DBLookupComboBox1.SetFocus;
//    end;
end;

procedure TFrmMudCFOP.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
    if CfopMud.dataSet.FieldByName('CODIGO_UF').IsNull then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
      	DBLookupComboBox1.SetFocus;
    end;
//    else if CfopMud.dataSet.FieldByName('UF_DESTINO').IsNull then
//    begin
//			if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
//      	DBLookupComboBox2.SetFocus;
//		end;
end;

procedure TFrmMudCFOP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not ((CfopMud.dataSet.FieldByName('CODIGO_UF').IsNull) or (CfopMud.dataSet.FieldByName('UF_DESTINO').IsNull)) then
    CfopMud.Post
  else if CfopMud.emTransacao then
  begin
    CfopMud.Cancel;
    CfopMud.RollBackTransacao;
  end;
  if CfopMud.confirmaAlteracao then
  begin
    if CfopMud.Apply then
      CfopMud.CommitaTransacao;
  end
  else if CfopMud.emTransacao then
  begin
    CfopMud.Cancel;
    CfopMud.RollBackTransacao;
  end;
  CfopMud.Destroy;
  Action := caFree;
  FrmMudCFOP := nil;
end;

procedure TFrmMudCFOP.FormCreate(Sender: TObject);
begin
  inherited;
  CfopMud := TCfopMud.Create;
  CfopMud.abreCFOPMud;
  CfopUFDestino := TCfopUFDestino.create;
  CfopUFDestino.abreCfopUFDestino;
  CfopMud.ListaUFOrigem;
  DBGrid1.DataSource := DtmCadBasicos.dsCFOPMud;
end;

procedure TFrmMudCFOP.FormShow(Sender: TObject);
begin
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
end;

procedure TFrmMudCFOP.SpeedButton15Click(Sender: TObject);
begin
  inherited;
if CfopMud.Prior then
  CfopMud.Edit;
end;

procedure TFrmMudCFOP.SpeedButton16Click(Sender: TObject);
begin
  inherited;
if CfopMud.Next then
 CfopMud.Edit;
end;

procedure TFrmMudCFOP.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if not CfopMud.dataSet.IsEmpty then
  begin
    if CfopMud.dataSet.FieldByName('ATIVO').AsInteger = 1 then
    begin
      if vDadosIni.PesqPros('BAS029', 'EDITAR', '', 'CFOP_MUD', ' UFO = ' +
      CfopMud.dataSet.FieldByName('CODIGO_UF').AsString + ' UFD = ' +
      CfopMud.dataSet.FieldByName('UF_DESTINO').AsString, CfopMud.buscas, true) then
//      if vDadosIni.PesqPros('BAS029', ' UFO = ' + CfopMud.dataSet.FieldByName('CODIGO_UF').AsString + ' UFD = ' + CfopMud.dataSet.FieldByName('UF_DESTINO').AsString, CfopMud.buscas, true) then
      begin
        if CfopMud.Edit then
        begin
          PageControl1.ActivePage := TabSheet1;
          TabSheet1.show;
          PageControl3.ActivePage := TabSheet3;
          if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
          	DBLookupComboBox2.SetFocus;
          CfopMud.PreencheCampos;
        end;
      end;
    end
    else
      Application.MessageBox('Este registro está na lixeira.' + chr(13) + 'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end
  else
    Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
end;

procedure TFrmMudCFOP.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS031', 'ABRIR LIXEIRA', '', 'CFOP_MUD', '', CfopMud.buscas, true) then
//  if vDadosIni.PesqPros('BAS031', '', CfopMud.buscas, true) then
  begin
    inherited;
    if CfopMud.StatusLixeira(true) then
    begin
      if CfopMud.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS030]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end
      else
      begin
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end;
    end
    else
    begin
      CfopMud.abreCFOPMud;
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS030]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end;
  end;
end;

procedure TFrmMudCFOP.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not CfopMud.dataSet.IsEmpty then
    if vDadosIni.PesqPros('BAS030', 'EXCLUIR', '', 'CFOP_MUD', ' O = ' +
    CfopMud.dataSet.FieldByName('CODIGO_UF').AsString + ' D = ' +
    CfopMud.dataSet.FieldByName('UF_DESTINO').AsString, CfopMud.buscas, true) then
//    if vDadosIni.PesqPros('BAS030', ' O = ' + CfopMud.dataSet.FieldByName('CODIGO_UF').AsString + ' D = ' + CfopMud.dataSet.FieldByName('UF_DESTINO').AsString, CfopMud.buscas, false) then
    begin
      if CfopMud.dataSet.FieldByName('ATIVO').AsInteger = 1 then
        CfopMud.EnviaPraLixeira
      else
        CfopMud.Delete;
    end;
  TabSheet2Show(Sender);
end;

procedure TFrmMudCFOP.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  CfopMud.restauraLixeira;
  TabSheet2Show(Sender);
end;

procedure TFrmMudCFOP.TabSheet2Show(Sender: TObject);
begin
  inherited;
  if CfopMud.StatusLixeira(false) then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

end.

