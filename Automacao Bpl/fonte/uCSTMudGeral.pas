unit uCSTMudGeral;

interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadraoModal, DBCtrls, ExtCtrls, Menus,
  ComCtrls, Buttons, Grids, DBGrids, Controls, StdCtrls, Mask, Forms, Classes,
  AppEvnts, Graphics;

type
  TFrmCSTMudGeral = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton25Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCSTMudGeral: TFrmCSTMudGeral;
  CstMudGeral: TCstMudGeral;
  CfopUFDestino: TCfopUFDestino;

implementation

uses UDtmCadastrosBasicos, uDtmAtivo, SysUtils;

{$R *.dfm}

procedure TFrmCSTMudGeral.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if MaskEdit2.Visible then
  begin
    if not CstMudGeral.ConsultaCampos('CST_MUD_GERAL', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if CstMudGeral.ConsultaCampos('CST_MUD_GERAL', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmCSTMudGeral.BitBtn3Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
  	BitBtn3.SetFocus;
  if vDadosIni.PesqPros('BAS022', 'INCLUIR', '', 'CST_MUD_GERAL', '', CstMudGeral.buscas, true) then
//  if vDadosIni.PesqPros('BAS022', '', CstMudGeral.buscas, true) then
  begin
    if CstMudGeral.Insert then
    begin
      inherited;
      CstMudGeral.ListaUFOrigem;
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
      	DBLookupComboBox1.SetFocus;
    end;
  end;
end;

procedure TFrmCSTMudGeral.BitBtn4Click(Sender: TObject);
begin
  ActiveControl := BitBtn4;
  if vDadosIni.PesqPros('BAS025', 'CONFIRMAR', '', 'CST_MUD_GERAL', '', CstMudGeral.buscas, true) then
//  if vDadosIni.PesqPros('BAS025', '', CstMudGeral.buscas, false) then
  begin
    if not CSTMudGeral.ChecaCamposObrigatorios then
    begin
      if CstMudGeral.campoComErro = 'CST_INTERNO' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        	DBEdit3.SetFocus;
      end
      else if CstMudGeral.campoComErro = 'CST_EXTERNO' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        	DBEdit4.SetFocus;
      end
      else if CstMudGeral.campoComErro = 'CFOP_INTERNO' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
        	DBEdit7.SetFocus;
      end
      else if CstMudGeral.campoComErro = 'CFOP_EXTERNO' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
        	DBEdit8.SetFocus;
      end;
    end
    else
    begin
      if not CstMudGeral.gravar then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
        	DBLookupComboBox1.SetFocus;
      end
      else
      begin
        if CheckCadSeq.Checked then
        begin
          if CstMudGeral.Insert then
          begin
          	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
            	DBLookupComboBox1.SetFocus;
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

procedure TFrmCSTMudGeral.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS026', 'CANCELAR', '', 'CST_MUD_GERAL', '', CstMudGeral.buscas, true) then
//  if vDadosIni.PesqPros('BAS026', '', CstMudGeral.buscas, false) then
  begin
    inherited;
    TabSheet2.show;
    CstMudGeral.Cancel;
    CstMudGeral.RollBackTransacao;
  end;
end;

procedure TFrmCSTMudGeral.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
    if not CSTMudGeral.TestarCst(DBEdit3.Text) then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      	DBEdit3.SetFocus;
end;

procedure TFrmCSTMudGeral.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
    if not CSTMudGeral.TestarCst(DBEdit4.Text) then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      	DBEdit4.SetFocus;
end;

procedure TFrmCSTMudGeral.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('BAS027', 'PESQUISAR', '', 'CST_MUD_GERAL', '', CstMudGeral.buscas, true) then
//    if vDadosIni.PesqPros('BAS027', '', CstMudGeral.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
        if vDadosIni.vPesquisa <> '' then
          CstMudGeral.dataSet.FieldByName('CFOP_INTERNO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCSTMudGeral.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('BAS022', 'PESQUISAR', '', 'CST_MUD_GERAL', '', CstMudGeral.buscas, true) then
//    if vDadosIni.PesqPros('BAS022', '', CstMudGeral.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
        if vDadosIni.vPesquisa <> '' then
          CstMudGeral.dataSet.FieldByName('CFOP_EXTERNO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCSTMudGeral.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender);
  if key = VK_DELETE then
    SpeedButton2Click(Sender);
end;

procedure TFrmCSTMudGeral.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
    if CstMudGeral.dataSet.FieldByName('UF_ORIGEM').IsNull then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
      	DBLookupComboBox1.SetFocus;
    end
    else if CstMudGeral.dataSet.FieldByName('UF_DESTINO').IsNull then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
      	DBLookupComboBox2.SetFocus;
    end;
end;

procedure TFrmCSTMudGeral.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) then
    if CstMudGeral.dataSet.FieldByName('UF_DESTINO').IsNull then
      DBLookupComboBox2.SetFocus
    else if CstMudGeral.dataSet.FieldByName('UF_ORIGEM').IsNull then
      DBLookupComboBox1.SetFocus;
end;

procedure TFrmCSTMudGeral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not ((CstMudGeral.dataSet.FieldByName('UF_ORIGEM').IsNull) or
    (CstMudGeral.dataSet.FieldByName('UF_DESTINO').IsNull) or
    (CstMudGeral.dataSet.FieldByName('CST_INTERNO').IsNull) or
    (CstMudGeral.dataSet.FieldByName('ALIQ_INTERNA').IsNull) or
    (CstMudGeral.dataSet.FieldByName('CFOP_INTERNO').IsNull)) then
    CstMudGeral.Post
  else if CstMudGeral.emTransacao then
  begin
    CstMudGeral.Cancel;
    CstMudGeral.RollBackTransacao;
  end;
  if CstMudGeral.confirmaAlteracao then
  begin
    if CstMudGeral.Apply then
      CstMudGeral.CommitaTransacao;
  end
  else if CstMudGeral.emTransacao then
  begin
    CstMudGeral.Cancel;
    CstMudGeral.RollBackTransacao;
  end;
  CstMudGeral.Destroy;
  Action := caFree;
  FrmCSTMudGeral := nil;
end;

procedure TFrmCSTMudGeral.FormCreate(Sender: TObject);
begin
  inherited;
  CstMudGeral := TCstMudGeral.Create;
  CstMudGeral.abreCstMudGeral;
  CfopUFDestino := TCfopUFDestino.create;
  CfopUFDestino.abreCfopUFDestino;
  DBGrid1.DataSource := DtmCadBasicos.dsCstMudGeral;
end;

procedure TFrmCSTMudGeral.FormKeyDown(Sender: TObject; var Key: Word;
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
    if PageControl3.ActivePage = TabSheet3 then
      BitBtn5Click(Sender);
  end;
end;

procedure TFrmCSTMudGeral.FormShow(Sender: TObject);
begin
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
end;

procedure TFrmCSTMudGeral.SpeedButton1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS023', 'PESQUISAR', '', 'CST_MUD_GERAL', 'OR: '+
  CstMudGeral.dataSet.FieldByName('UF_ORIGEM').AsString+' DEST: '+
  CstMudGeral.dataSet.FieldByName('UF_DESTINO').AsString, CstMudGeral.buscas, true) then
//  if vDadosIni.PesqPros('BAS023', '', CstMudGeral.buscas, true) then
  begin
    if not CstMudGeral.dataSet.IsEmpty then
    begin
      if CstMudGeral.Edit then
      begin
        inherited;
        //        CstMudGeral.ListaEstadosO;
        CstMudGeral.ListaUFOrigem;
        PageControl1.ActivePage := TabSheet1;
        TabSheet1.show;
        PageControl3.ActivePage := TabSheet3;
        DBLookupComboBox2.SetFocus;
      end;
    end
    else
      Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

procedure TFrmCSTMudGeral.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  {  CstMudGeral.AbrirLixeira;
    if CstMudGeral.dataSet.FieldByName('ATIVO').AsInteger = 1 then
    begin
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;}
end;

procedure TFrmCSTMudGeral.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('BAS024', 'PESQUISAR', '', 'CFOP_MUD', 'OR: '+
  CstMudGeral.dataSet.FieldByName('UF_ORIGEM').AsString+' DEST: '+
  CstMudGeral.dataSet.FieldByName('UF_DESTINO').AsString, CstMudGeral.buscas, true) then
//  if vDadosIni.PesqPros('BAS024', '', CstMudGeral.buscas, false) then
    CstMudGeral.Delete;
end;

end.

