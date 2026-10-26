unit uCadTipoReserva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, uClassesCadastrosBasicos, DBCtrls;

type
  TfrmCadTipoReserva = class(TfrmCadPadraoM)
    Label_Codigo: TLabel;
    Label9: TLabel;
    DBEdit_Descricao: TDBEdit;
    DBEdit_Codigo: TDBEdit;
    DBComboBox_Tipo: TDBComboBox;
    Label7: TLabel;
    Label10: TLabel;
    DBEdit_Sigla: TDBEdit;
    Label14: TLabel;
    DBEdit_Ordem: TDBEdit;
    Label6: TLabel;
    DBEdit_DiasReserva: TDBEdit;
    Label8: TLabel;
    DBComboBox_Cliente: TDBComboBox;
    Label11: TLabel;
    DBComboBox_Vendedor: TDBComboBox;
    Label12: TLabel;
    DBComboBox_RetirarReservas: TDBComboBox;
    Label13: TLabel;
    Label16: TLabel;
    DBComboBox_VisualizarReservas: TDBComboBox;
    Label17: TLabel;
    Label15: TLabel;
    DBEdit_DiasExibirVencimento: TDBEdit;
    Label18: TLabel;
    DBEdit_DiasRenov: TDBEdit;
    Label19: TLabel;
    DBEdit_DiasReservaAss: TDBEdit;
    Label20: TLabel;
    DBEdit_DiasRenovAss: TDBEdit;
    Label21: TLabel;
    DBEdit_DiasReservaVencimento: TDBEdit;
    Label22: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GroupBox1Enter(Sender: TObject);
    procedure DBComboBox_TipoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  public
    { Public declarations }
  end;

var
  frmCadTipoReserva: TfrmCadTipoReserva;

implementation

uses
 uDtmAtivo, UDtmCadastrosBasicos, DB, uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadTipoReserva.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS356]';
  if vDadosIni.PesqPros('BAS353', 'PESQUISAR', '', 'TIPO_RESERVA', '',
    TipoReserva.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not TipoReserva.ConsultaCampos('TIPO_RESERVA', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, 'CODIGO', vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not TipoReserva.ConsultaCampos('TIPO_RESERVA', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, 'CODIGO', true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if TipoReserva._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadTipoReserva.BitBtn3Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS354', 'INSERIR', '', 'TIPO_RESERVA',
      '', TipoReserva.buscas, true) then
    begin
      if TipoReserva.Insert then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrar tipo de reserva';
        TabSheet3.TabVisible := true;
        TabSheet3.Show;
        DBComboBox_Tipo.Enabled := true;
        if (Self.Enabled) and (Self.Visible) and (DBComboBox_Tipo.CanFocus) then
          DBComboBox_Tipo.SetFocus;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoReserva.Cancel;
    TipoReserva.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoReserva.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not TipoReserva.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(TipoReserva.vNomeCampoErro, TipoReserva.vMensagemErro);
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
      if TipoReserva.Insert then
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

procedure TfrmCadTipoReserva.BitBtn5Click(Sender: TObject);
begin
  inherited;
  TipoReserva.Cancel;
  TipoReserva.RollBackTransacao;
end;

procedure TfrmCadTipoReserva.DBComboBox_TipoExit(Sender: TObject);
begin
  inherited;
  if not (TipoReserva.dataSet.State in [dsInsert, dsEdit]) then
   exit;

//  DBEdit_DiasReserva.Enabled := (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'F')
//    and (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'T');
//  DBEdit_DiasRenov.Enabled := (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'F')
//    and (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'T');
  DBEdit_Ordem.Enabled := (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'F')
    and (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'T');
  DBComboBox_Cliente.Enabled := (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'M')
    and (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'F')
    and (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'T');
  DBComboBox_Vendedor.Enabled := (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'M')
    and (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'F')
    and (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'T');
//  DBComboBox_VisualizarReservas.Enabled := trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'M';
  DBEdit_DiasReservaAss.Enabled := trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) = 'C';
  DBEdit_DiasRenovAss.Enabled := trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) = 'C';
  DBEdit_DiasReservaVencimento.Enabled := (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'M')
    and (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'F')
    and (trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'T');
  if trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) = 'V'  then
  begin
    if trim(TipoReserva.dataSet.FieldByName('CONFIG_CLIENTE').AsString) = '' then
      TipoReserva.dataSet.FieldByName('CONFIG_CLIENTE').AsString := 'T';
    if trim(TipoReserva.dataSet.FieldByName('CONFIG_VENDEDOR').AsString) = '' then
      TipoReserva.dataSet.FieldByName('CONFIG_VENDEDOR').AsString := 'M';
    if trim(TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString) = '' then
      TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString := 'S';
    if trim(TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString) = '' then
      TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString := 'S';
  end
  else if trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) = 'M'  then
  begin
    TipoReserva.dataSet.FieldByName('CONFIG_CLIENTE').AsString := 'N';
    TipoReserva.dataSet.FieldByName('CONFIG_VENDEDOR').AsString := 'N';
    if trim(TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString) = '' then
	    TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString := 'S';
    if trim(TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString) = '' then
	    TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString := 'S';
  end
  else if trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) = 'B'  then
  begin
    if trim(TipoReserva.dataSet.FieldByName('CONFIG_CLIENTE').AsString) = '' then
      TipoReserva.dataSet.FieldByName('CONFIG_CLIENTE').AsString := 'T';
    if trim(TipoReserva.dataSet.FieldByName('CONFIG_VENDEDOR').AsString) = '' then
      TipoReserva.dataSet.FieldByName('CONFIG_VENDEDOR').AsString := 'T';
    if trim(TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString) = '' then
      TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString := 'S';
    if trim(TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString) = '' then
      TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString := 'S';
  end
  else if trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) = 'C'  then
  begin
    if trim(TipoReserva.dataSet.FieldByName('CONFIG_CLIENTE').AsString) = '' then
      TipoReserva.dataSet.FieldByName('CONFIG_CLIENTE').AsString := 'T';
    if trim(TipoReserva.dataSet.FieldByName('CONFIG_VENDEDOR').AsString) = '' then
      TipoReserva.dataSet.FieldByName('CONFIG_VENDEDOR').AsString := 'T';
    if trim(TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString) = '' then
      TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString := 'S';
    if trim(TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString) = '' then
      TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString := 'S';
  end
	else
  begin
		TipoReserva.dataSet.FieldByName('CONFIG_CLIENTE').AsString := 'N';
    TipoReserva.dataSet.FieldByName('CONFIG_VENDEDOR').AsString := 'N';
    if trim(TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString) = '' then
      TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString := 'S';
    if trim(TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString) = '' then
      TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString := 'S';
  end;
  if trim(TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString) = 'S' then
    TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString := 'S';
  if trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString) <> 'C' then
  begin
    TipoReserva.dataSet.FieldByName('QUANT_DIAS_RESERVA_ASS').Value := Null;
    TipoReserva.dataSet.FieldByName('DIAS_RENOV_ASS').Value := Null;
  end;
end;

procedure TfrmCadTipoReserva.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadTipoReserva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TipoReserva.Cancel;
  TipoReserva.RollBackTransacao;
  TipoReserva.free;
  Action := caFree;
  frmCadTipoReserva := nil;
end;

procedure TfrmCadTipoReserva.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  TipoReserva := TTipoReserva.create;
  TipoReserva._AbreTipoReserva;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadTipoReserva.FormShow(Sender: TObject);
begin
   if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsTipoReserva;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS356]';
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

procedure TfrmCadTipoReserva.GroupBox1Enter(Sender: TObject);
begin
  inherited;
  DBComboBox_TipoExit(Sender);
end;

procedure TfrmCadTipoReserva.SpeedButton1Click(Sender: TObject);
begin
  try
    if TipoReserva.dataSet.IsEmpty then
      exit;
    if TipoReserva.Edit then
    begin
      inherited;
      DBComboBox_Tipo.Text := trim(TipoReserva.dataSet.FieldByName('TIPO_RES').AsString);
      DBComboBox_Cliente.Text := trim(TipoReserva.dataSet.FieldByName('CONFIG_CLIENTE').AsString);
      DBComboBox_Vendedor.Text := trim(TipoReserva.dataSet.FieldByName('CONFIG_VENDEDOR').AsString);
      DBComboBox_RetirarReservas.Text := trim(TipoReserva.dataSet.FieldByName('RETIRAR_RESERVAS_VENC').AsString);
      DBComboBox_VisualizarReservas.Text := trim(TipoReserva.dataSet.FieldByName('VISUALIZAR_RESERVAS_VENC').AsString);
      PageControl1.ActivePage := TabSheet1;
      TabSheet1.Show;
      TabSheet3.Caption := 'Alterar tipo de reserva';
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      DBComboBox_Tipo.Enabled := false;
      if (Self.Enabled) and (Self.Visible) and (DBComboBox_Tipo.CanFocus) then
        DBComboBox_Tipo.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
        DBEdit_Descricao.SetFocus;  
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoReserva.Cancel;
    TipoReserva.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoReserva.SpeedButton25Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS360', 'ABRIR A LIXEIRA', '', 'TIPO_RESERVA',
      '', TipoReserva.buscas, true) then
    begin
      inherited;
      if not TipoReserva._AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS356]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS357]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoReserva.Cancel;
    TipoReserva.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoReserva.SpeedButton2Click(Sender: TObject);
begin
  try
    inherited;
    if not TipoReserva.Delete then
      exit;
    if TipoReserva._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoReserva.Cancel;
    TipoReserva.RollBackTransacao;
  end;
end;

procedure TfrmCadTipoReserva.SpeedButton5Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS358', '', '', 'TIPO_RESERVA', '', TipoReserva.buscas, false) then
    begin
      inherited;
      TipoReserva._RestaurarLixeira;
      if TipoReserva._StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TipoReserva.Cancel;
    TipoReserva.RollBackTransacao;
  end;
end;


initialization
  RegisterClass(TfrmCadTipoReserva);
finalization
  UnRegisterClass(TfrmCadTipoReserva);

end.
