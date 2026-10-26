unit UCadTipoDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, uClassesCadastrosBasicos, DBCtrls;

type
  TfrmCadTipoDespesa = class(TfrmCadPadraoM)
    Label_Codigo: TLabel;
    Label9: TLabel;
    DBEdit_Descricao: TDBEdit;
    DBEdit_Codigo: TDBEdit;
    Label7: TLabel;
    DBEdit_NumPlano: TDBEdit;
    DBLookupComboBox_NumPlano: TDBLookupComboBox;
    procedure DBEdit_NumPlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoDespesa: TfrmCadTipoDespesa;
  TipoDespesas: ttipodespesa;

implementation
uses
  uDtmAtivo, UDtmCadastrosBasicos;
{$R *.dfm}

procedure TfrmCadTipoDespesa.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS147]';
  if vDadosIni.PesqPros('BAS143', 'PESQUISAR', '', 'TIPO_DESPESA', '',
    TipoDespesas.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not TipoDespesas.ConsultaCampos('TIPO_DESPESA', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not TipoDespesas.ConsultaCampos('TIPO_DESPESA', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if TipoDespesas._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadTipoDespesa.BitBtn3Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS144', 'INSERIR', '', 'TIPO_DESPESA',
      '', TipoDespesas.buscas, true) then
    begin
      if TipoDespesas.Insert then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrar tipo de despesa';
        TabSheet3.TabVisible := true;
        TabSheet3.Show;
        if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
          DBEdit_Descricao.SetFocus;
        DBEdit_Codigo.Visible := false;
        Label_Codigo.Visible := False;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoDespesas.Cancel;
    TipoDespesas.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoDespesa.BitBtn4Click(Sender: TObject);
begin
  if not TipoDespesas.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(TipoDespesas.vNomeCampoErro);
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
      if TipoDespesas.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
        	DBEdit_Descricao.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadTipoDespesa.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS151', 'CANCELAR', '', 'TIPO_DESPESA',
    TipoDespesas.dataSet.FieldByName('COD_TP_DESPESA').AsString, TipoDespesas.buscas, true) then
  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    TipoDespesas.Cancel;
    TipoDespesas.RollBackTransacao;
    inherited;
  end;

end;

procedure TfrmCadTipoDespesa.DBEdit_NumPlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      TipoDespesas.dataSet.FieldByName('N_CONTA_PLC').AsString :=
        vDadosIni.pesquisaRapida('P_CONTAS', ' AND TIPO_PLC = ''S'' ', 'Consultar do Plano de Contas');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadTipoDespesa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadTipoDespesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TipoDespesas.Cancel;
  TipoDespesas.RollBackTransacao;
  TipoDespesas.free;
  Action := caFree;
  frmCadTipoDespesa := nil;

end;

procedure TfrmCadTipoDespesa.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'TPDESPESA' then
  begin
    if DtmCadBasicos = nil then
      DtmCadBasicos := TDtmCadBasicos.Create(DtmCadBasicos);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  TipoDespesas := TTipoDespesa.create;
  DBGrid1.DataSource := DtmCadBasicos.dsTipoDespesas;
  //Configuração de colunas
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadTipoDespesa.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadTipoDespesa.FormShow(Sender: TObject);
begin
  inherited;
  if vShow <> 1 then
  begin
    inherited;
    DBGrid1.DataSource := DtmCadBasicos.dsTipoDespesas;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  if (TelaCadastro = 6) then
    BitBtn3.Click;

  CheckBox3.Visible := false;
  CheckBox1.Visible := false;
  SpeedButton3.Visible := false;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadTipoDespesa.SpeedButton1Click(Sender: TObject);
begin
  try
    if TipoDespesas.dataSet.IsEmpty then
      exit;
    if TipoDespesas.Edit then
    begin
      inherited;
      PageControl1.ActivePage := TabSheet1;
      TabSheet1.Show;
      TabSheet3.Caption := 'Alterar tipo de despesa';
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      Label_Codigo.Visible := true;
      DBEdit_Codigo.Visible := true;
      if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
        DBEdit_Descricao.SetFocus;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoDespesas.Cancel;
    TipoDespesas.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoDespesa.SpeedButton25Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS149', 'ABRIR A LIXEIRA', '', 'TIPO_DESPESA',
      '', TipoDespesas.buscas, true) then
    begin
      inherited;
      if not TipoDespesas._AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS147]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS146]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoDespesas.Cancel;
    TipoDespesas.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoDespesa.SpeedButton2Click(Sender: TObject);
begin
  try
    inherited;
    if not TipoDespesas.Delete then
      exit;
    if TipoDespesas._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoDespesas.Cancel;
    TipoDespesas.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoDespesa.SpeedButton5Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS148', '', '', 'TIPO_DESPESA', '', TipoDespesas.buscas, false) then
    begin
      inherited;
      TipoDespesas._RestaurarLixeira;
      if TipoDespesas._StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoDespesas.Cancel;
    TipoDespesas.RollBackTransacao;
  end;
end;

initialization
  RegisterClass(TfrmCadTipoDespesa);
finalization
  UnRegisterClass(TfrmCadTipoDespesa);

end.

