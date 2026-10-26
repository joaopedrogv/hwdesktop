unit UCadCombustivel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, uClassesCadastrosBasicos, DBCtrls;

type
  TfrmCadCombustivel = class(TfrmCadPadraoM)
    DBEdit_Codigo: TDBEdit;
    Label_Codigo: TLabel;
    DBEdit_Descricao: TDBEdit;
    Label9: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCombustivel: TfrmCadCombustivel;
  Combustiveis: TCombustivel;

implementation
uses uDtmAtivo, UDtmCadastrosBasicos;
{$R *.dfm}

procedure TfrmCadCombustivel.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS120]';
  if vDadosIni.PesqPros('BAS116', 'PESQUISAR', '', 'TP_COMB_RENAVAM', '',
    Combustiveis.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Combustiveis.ConsultaCampos('TP_COMB_RENAVAM', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
          if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not Combustiveis.ConsultaCampos('TP_COMB_RENAVAM', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if Combustiveis._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
   // Cores.ultimasql := Cidade.dataset.CommandText;
   	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
   	  DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadCombustivel.BitBtn3Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS117', 'INSERIR', '', 'TP_COMB_RENAVAM',
      '', Combustiveis.buscas, true) then
    begin
      if Combustiveis.Insert then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrar combustível';
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
    Combustiveis.Cancel;
    Combustiveis.RollBackTransacao;
  end;
end;

procedure TfrmCadCombustivel.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not Combustiveis.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(Combustiveis.vNomeCampoErro, Combustiveis.vMensagemErro);
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
      if Combustiveis.Insert then
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

procedure TfrmCadCombustivel.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS124', 'CANCELAR', '', 'TP_COMB_RENAVAM',
    Combustiveis.dataSet.FieldByName('CODIGO_TPCOMB').AsString, Combustiveis.buscas, true) then
  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    Combustiveis.Cancel;
    Combustiveis.RollBackTransacao;
    inherited;
  end;

end;

procedure TfrmCadCombustivel.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadCombustivel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Combustiveis.Cancel;
  Combustiveis.RollBackTransacao;
  Combustiveis.free;
  Action := caFree;
  frmCadCombustivel := nil;
end;

procedure TfrmCadCombustivel.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'COMBUSTIVEL' then
  begin
    if DtmCadBasicos = nil then
      DtmCadBasicos := TDtmCadBasicos.Create(DtmCadBasicos);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  Combustiveis := TCombustivel.create;
  DBGrid1.DataSource := DtmCadBasicos.dsCombustiveis;
  //Configuração de colunas
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadCombustivel.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadCombustivel.FormShow(Sender: TObject);
begin
  inherited;
  if vShow <> 1 then
  begin
    inherited;
    DBGrid1.DataSource := DtmCadBasicos.dsCores;
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

procedure TfrmCadCombustivel.SpeedButton1Click(Sender: TObject);
begin
  try
    if Combustiveis.dataSet.IsEmpty then
      exit;
    if Combustiveis.Edit then
    begin
      inherited;
      PageControl1.ActivePage := TabSheet1;
      TabSheet1.Show;
      TabSheet3.Caption := 'Alterar combustível';
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
    Combustiveis.Cancel;
    Combustiveis.RollBackTransacao;
  end;

end;



procedure TfrmCadCombustivel.SpeedButton25Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS122', 'ABRIR A LIXEIRA', '', 'TP_COMB_RENAVAM', '', Combustiveis.buscas, true) then
    begin
      inherited;
      if not Combustiveis._AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS120]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS119]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Combustiveis.Cancel;
    Combustiveis.RollBackTransacao;
  end;
end;

procedure TfrmCadCombustivel.SpeedButton2Click(Sender: TObject);
begin
  try
    inherited;
    if not Combustiveis.Delete then
      exit;
    if Combustiveis._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Combustiveis.Cancel;
    Combustiveis.RollBackTransacao;
  end;
end;

procedure TfrmCadCombustivel.SpeedButton5Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS121', '', '', 'TP_COMB_RENAVAM', '', Combustiveis.buscas, false) then
    begin
      inherited;
      Combustiveis._RestaurarLixeira;
      if Combustiveis._StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Combustiveis.Cancel;
    Combustiveis.RollBackTransacao;
  end;
end;

initialization
  RegisterClass(TfrmCadCombustivel);
finalization
  UnRegisterClass(TfrmCadCombustivel);

end.

