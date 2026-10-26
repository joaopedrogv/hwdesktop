unit UCadTipoPendencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, uclassescadastrosbasicos;

type
  TfrmCadTipoPendencia = class(TfrmCadPadraoM)
    DBEdit_Descricao: TDBEdit;
    DBEdit_Codigo: TDBEdit;
    Label_Codigo: TLabel;
    Label9: TLabel;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
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
  frmCadTipoPendencia: TfrmCadTipoPendencia;
  TipoPendencias: ttipoPendencia;

implementation
uses
  uDtmAtivo, UDtmCadastrosBasicos;
{$R *.dfm}

procedure TfrmCadTipoPendencia.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS129]';
  if vDadosIni.PesqPros('BAS125', 'PESQUISAR', '', 'TIPO_PENDENCIA', '',
    TipoPendencias.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not TipoPendencias.ConsultaCampos('TIPO_PENDENCIA', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not TipoPendencias.ConsultaCampos('TIPO_PENDENCIA', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if TipoPendencias._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadTipoPendencia.BitBtn3Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS126', 'INSERIR', '', 'TIPO_PENDENCIA',
      '', TipoPendencias.buscas, true) then
    begin
      if TipoPendencias.Insert then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrar tipo de pendência';
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
    TipoPendencias.Cancel;
    TipoPendencias.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoPendencia.BitBtn4Click(Sender: TObject);
begin
  if not TipoPendencias.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(TipoPendencias.vNomeCampoErro);
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
      if TipoPendencias.Insert then
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

procedure TfrmCadTipoPendencia.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS133', 'CANCELAR', '', 'TIPO_PENDENCIA',
    TipoPendencias.dataSet.FieldByName('COD_TP_PENDENCIA').AsString, TipoPendencias.buscas, true) then
  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    TipoPendencias.Cancel;
    TipoPendencias.RollBackTransacao;
    inherited;
  end;

end;

procedure TfrmCadTipoPendencia.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadTipoPendencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TipoPendencias.Cancel;
  TipoPendencias.RollBackTransacao;
  TipoPendencias.free;
  Action := caFree;
  frmCadTipoPendencia := nil;

end;

procedure TfrmCadTipoPendencia.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'TPPENDENCIA' then
  begin
    if DtmCadBasicos = nil then
      DtmCadBasicos := TDtmCadBasicos.Create(DtmCadBasicos);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  TipoPendencias := TTipoPendencia.create;
  DBGrid1.DataSource := DtmCadBasicos.dsTipoPendencias;
  //Configuração de colunas
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadTipoPendencia.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadTipoPendencia.FormShow(Sender: TObject);
begin
  inherited;
  if vShow <> 1 then
  begin
    inherited;
    DBGrid1.DataSource := DtmCadBasicos.dsTipoPendencias;
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

procedure TfrmCadTipoPendencia.SpeedButton1Click(Sender: TObject);
begin
  try
    if TipoPendencias.dataSet.IsEmpty then
      exit;
    if TipoPendencias.Edit then
    begin
      inherited;
      PageControl1.ActivePage := TabSheet1;
      TabSheet1.Show;
      TabSheet3.Caption := 'Alterar tipo de pendência';
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
    TipoPendencias.Cancel;
    TipoPendencias.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoPendencia.SpeedButton25Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS131', 'ABRIR A LIXEIRA', '', 'TIPO_PENDENCIA',
      '', TipoPendencias.buscas, true) then
    begin
      inherited;
      if not TipoPendencias._AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS129]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS128]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoPendencias.Cancel;
    TipoPendencias.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoPendencia.SpeedButton2Click(Sender: TObject);
begin
  try
    inherited;
    if not TipoPendencias.Delete then
      exit;
    if TipoPendencias._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoPendencias.Cancel;
    TipoPendencias.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoPendencia.SpeedButton5Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS130', '', '', 'TIPO_PENDENCIA', '', TipoPendencias.buscas, false) then
    begin
      inherited;
      TipoPendencias._RestaurarLixeira;
      if TipoPendencias._StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoPendencias.Cancel;
    TipoPendencias.RollBackTransacao;
  end;
end;

initialization
  RegisterClass(TfrmCadTipoPendencia);
finalization
  UnRegisterClass(TfrmCadTipoPendencia);

end.

