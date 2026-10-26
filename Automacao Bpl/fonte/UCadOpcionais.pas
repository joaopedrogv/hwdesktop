unit UCadOpcionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, uclassescadastrosbasicos;

type
  TfrmCadOpcionais = class(TfrmCadPadraoM)
    Label9: TLabel;
    Label_Codigo: TLabel;
    DBEdit_Codigo: TDBEdit;
    DBEdit_Descricao: TDBEdit;
    DBEdit_CodigoFabrica: TDBEdit;
    Label6: TLabel;
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
  frmCadOpcionais: TfrmCadOpcionais;
  Opcionais: TOpcionais;

implementation
uses
  uDtmAtivo, UDtmCadastrosBasicos;

{$R *.dfm}

procedure TfrmCadOpcionais.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS189]';

  if vDadosIni.PesqPros('BAS185', 'PESQUISAR', '', 'OPCIONAIS', '',
    Opcionais.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Opcionais.ConsultaCampos('OPCIONAIS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not Opcionais.ConsultaCampos('OPCIONAIS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if Opcionais._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
      
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadOpcionais.BitBtn3Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS186', 'INSERIR', '', 'OPCIONAIS',
      '', Opcionais.buscas, true) then
    begin
      if Opcionais.Insert then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrar opcionais';
        TabSheet3.TabVisible := true;
        TabSheet3.Show;

        DBEdit_Codigo.Visible := false;
        Label_Codigo.Visible := False;
        if (Self.Enabled) and (Self.Visible) and (DBEdit_CodigoFabrica.CanFocus) then
          DBEdit_CodigoFabrica.SetFocus;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Opcionais.Cancel;
    Opcionais.RollBackTransacao;
  end;
end;

procedure TfrmCadOpcionais.BitBtn4Click(Sender: TObject);
begin
  if not Opcionais.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(Opcionais.vNomeCampoErro);
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
      if Opcionais.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit_CodigoFabrica.CanFocus) then
        	DBEdit_CodigoFabrica.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadOpcionais.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS193', 'CANCELAR', '', 'OPCIONAIS',
    Opcionais.dataSet.FieldByName('COD_OPCIONAIS').AsString, Opcionais.buscas, true) then
  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    Opcionais.Cancel;
    Opcionais.RollBackTransacao;
    inherited;
  end;

end;

procedure TfrmCadOpcionais.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadOpcionais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Opcionais.Cancel;
  Opcionais.RollBackTransacao;
  Opcionais.free;
  Action := caFree;
  frmCadOpcionais := nil;

end;

procedure TfrmCadOpcionais.FormCreate(Sender: TObject);
begin
  inherited;

  if (vDadosIni.vModalOuChild = 'M') then
  begin
    self.FormStyle := fsNormal;
  end;

  TelaCadastro := vDadosIni.vTipoForm;
  Opcionais := TOpcionais.create;
  DBGrid1.DataSource := DtmCadBasicos.dsOpcional;
  //Configuração de colunas
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadOpcionais.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadOpcionais.FormShow(Sender: TObject);
begin
  inherited;
  if vShow <> 1 then
  begin
    inherited;
    DBGrid1.DataSource := DtmCadBasicos.dsOpcional;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  CheckBox3.Visible := false;
  CheckBox1.Visible := false;
  SpeedButton3.Visible := false;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadOpcionais.SpeedButton1Click(Sender: TObject);
begin
  try
    if Opcionais.dataSet.IsEmpty then
      exit;
    if Opcionais.Edit then
    begin
      inherited;
      PageControl1.ActivePage := TabSheet1;
      TabSheet1.Show;
      TabSheet3.Caption := 'Alterar opcionais';
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      Label_Codigo.Visible := true;
      DBEdit_Codigo.Visible := true;
      if (Self.Enabled) and (Self.Visible) and (DBEdit_CodigoFabrica.CanFocus) then
        DBEdit_CodigoFabrica.SetFocus;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Opcionais.Cancel;
    Opcionais.RollBackTransacao;
  end;
end;

procedure TfrmCadOpcionais.SpeedButton25Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS191', 'ABRIR A LIXEIRA', '', 'OPCIONAIS',
      '', Opcionais.buscas, true) then
    begin
      inherited;
      if not Opcionais._AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS189]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS188]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Opcionais.Cancel;
    Opcionais.RollBackTransacao;
  end;
end;

procedure TfrmCadOpcionais.SpeedButton2Click(Sender: TObject);
begin
  try
    inherited;
    if not Opcionais.Delete then
      exit;
    if Opcionais._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Opcionais.Cancel;
    Opcionais.RollBackTransacao;
  end;
end;

procedure TfrmCadOpcionais.SpeedButton5Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS190', '', '', 'OPCIONAIS', '', Opcionais.buscas, false) then
    begin
      inherited;
      Opcionais._RestaurarLixeira;
      if Opcionais._StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Opcionais.Cancel;
    Opcionais.RollBackTransacao;
  end;
end;

initialization
  RegisterClass(TfrmCadOpcionais);
finalization
  UnRegisterClass(TfrmCadOpcionais);


end.

