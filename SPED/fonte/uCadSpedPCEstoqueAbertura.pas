unit uCadSpedPCEstoqueAbertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadSpedPCEstoqueAbertura = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel2: TBevel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    GroupBox7: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBComboBox2: TDBComboBox;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    GroupBox9: TGroupBox;
    DBComboBox3: TDBComboBox;
    GroupBox10: TGroupBox;
    DBEdit14: TDBEdit;
    edNomeConta: TEdit;
    GroupBox12: TGroupBox;
    DBEdit2: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit7Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GroupBox4Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSpedPCEstoqueAbertura: TfrmCadSpedPCEstoqueAbertura;

implementation

uses uClassesSpedPCBlocoF, uDtmSPED, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmCadSpedPCEstoqueAbertura.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  try
   SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED042]';
   
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('SPED039', 'CONSULTA', '', 'SPED_ESTOQUE_ABERTURA', '', estAbertura.buscas, False) then
      Exit;

    inherited;
    
    if MaskEdit2.Visible then
    begin
      if not estAbertura.ConsultaCampos('SPED_ESTOQUE_ABERTURA', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if estAbertura.ConsultaCampos('SPED_ESTOQUE_ABERTURA', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        		ComboBox1.SetFocus;

    for I := 0 to DBGrid1.Columns.Count - 1 do
    begin
      if DBGrid1.Columns[i].FieldName = 'DESC_BEM_IMOB' THEN
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
      else if DBGrid1.Columns[i].FieldName = 'PROCESSOS_REF' THEN
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
    end;

    lixeiraVazia(not estAbertura._statuslixeira);
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCEstoqueAbertura.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;
    if not estAbertura.Insert then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
      DBEdit5.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCEstoqueAbertura.BitBtn4Click(Sender: TObject);
begin
  if not estAbertura.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(estAbertura.vNomeCampoErro);
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
      if estAbertura.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
        	DBEdit5.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

procedure TfrmCadSpedPCEstoqueAbertura.BitBtn5Click(Sender: TObject);
begin
  estAbertura.Cancel;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadSpedPCEstoqueAbertura.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox1.ItemIndex <= -1 then
  begin
    estAbertura._calcularPISCOFINS;
    Exit;
  end;
  if DBComboBox1.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    DBComboBox1.DataSource.DataSet.FieldByName(DBComboBox1.DataField).AsString :=
      Trim(DBComboBox1.Items[DBComboBox1.ItemIndex]);
    DBComboBox2.DataSource.DataSet.FieldByName(DBComboBox2.DataField).AsString :=
      DBComboBox1.DataSource.DataSet.FieldByName(DBComboBox1.DataField).AsString;
    DBComboBox2.ItemIndex := DBComboBox1.ItemIndex;
  end;
  estAbertura._calcularPISCOFINS;
end;

procedure TfrmCadSpedPCEstoqueAbertura.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox2.ItemIndex <= -1 then
  begin
    estAbertura._calcularPISCOFINS;
    Exit;
  end;
  if DBComboBox2.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    DBComboBox2.DataSource.DataSet.FieldByName(DBComboBox2.DataField).AsString :=
      Trim(DBComboBox2.Items[DBComboBox2.ItemIndex]);
    DBComboBox1.DataSource.DataSet.FieldByName(DBComboBox1.DataField).AsString :=
      DBComboBox2.DataSource.DataSet.FieldByName(DBComboBox2.DataField).AsString;
    DBComboBox1.ItemIndex := DBComboBox2.ItemIndex;
  end;
  estAbertura._calcularPISCOFINS;
end;

procedure TfrmCadSpedPCEstoqueAbertura.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  estAbertura._existeContaContabil;
  edNomeConta.Text := estAbertura.NomeContaAnalitica;
end;

procedure TfrmCadSpedPCEstoqueAbertura.DBEdit14KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    if DBEdit14.DataSource.DataSet.State in [dsEdit, dsInsert] then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
      if Trim(vDadosIni.vPesquisa) <> '' then
        DBEdit14.DataSource.DataSet.FieldByName(DBEdit14.DataField).AsString :=
          vDadosIni.vPesquisa;
    end;
end;

procedure TfrmCadSpedPCEstoqueAbertura.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  estAbertura._calcularPISCOFINS;
end;

procedure TfrmCadSpedPCEstoqueAbertura.DBGrid1KeyDown(Sender: TObject;
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

procedure TfrmCadSpedPCEstoqueAbertura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  estAbertura.Free;
  estAbertura := nil;

  Action := caFree;
  frmCadSpedPCEstoqueAbertura := nil;
end;

procedure TfrmCadSpedPCEstoqueAbertura.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  estAbertura := TCredEstoqueAbertura.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadSpedPCEstoqueAbertura.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (estAbertura.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadSpedPCEstoqueAbertura.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmSPED.dsEstAb;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not estAbertura._statuslixeira);
  end;

  edNomeConta.Text := '';
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadSpedPCEstoqueAbertura.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
  	DBEdit5.SetFocus;
end;

procedure TfrmCadSpedPCEstoqueAbertura.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not estAbertura.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
      DBEdit5.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCEstoqueAbertura.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('SPED045', 'ABRIR A LIXEIRA', '', 'SPED_ESTOQUE_ABERTURA',
    '', estAbertura.buscas, true) then
    Exit;

  inherited;
  if not estAbertura._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED042]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [SPED042]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadSpedPCEstoqueAbertura.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    estAbertura.Delete;
    lixeiraVazia(not estAbertura._statuslixeira);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCEstoqueAbertura.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('SPED044', '', '', 'SPED_ESTOQUE_ABERTURA', '', estAbertura.buscas, false) then
    if estAbertura._restauraLixeira then
      lixeiraVazia(not estAbertura._statuslixeira);
end;

end.
