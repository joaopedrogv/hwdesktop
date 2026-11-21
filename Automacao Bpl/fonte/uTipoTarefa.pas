unit uTipoTarefa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uClassesConfigWS, DBCtrls;

type
  TfrmTipoTarefa = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBComboBox1: TDBComboBox;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
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
  frmTipoTarefa: TfrmTipoTarefa;
  MsgTipoTarefa: TMsgTipoTarefa;

implementation

uses
  UDtmConfig, uDtmAtivo, DB, uDataSet_OOP, hw_win_utils, ShellAPI, uDadosIni;

{$R *.dfm}

procedure TfrmTipoTarefa.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CFG089', 'CONSULTA', '', 'MSG_TIPO_TAREFA', '',
    MsgTipoTarefa.buscas, true) then
    Exit;

  inherited;

  MsgTipoTarefa.rCons.vCampo := ComboBox1.Text;
  MsgTipoTarefa.rCons.vCondicao := ComboBox3.Text;
  MsgTipoTarefa.rCons.vDataIni := trim(MaskEdit1.Text);
  MsgTipoTarefa.rCons.vDataFim := trim(MaskEdit2.Text);
  MsgTipoTarefa.rCons.vValor := trim(MaskEdit3.Text);

  if MaskEdit2.Visible then
  begin
    if not MsgTipoTarefa.ConsultaCampos('MSG_TIPO_TAREFA',
    	MsgTipoTarefa.rCons.vCampo,
      'MSG_TIPO_TAREFA.TIPO ',
      MsgTipoTarefa.rCons.vDataIni,
      MsgTipoTarefa.rCons.vDataFim,
      vDadosIni.codEmpresa, 1,
      'MSG_TIPO_TAREFA.* ', '',
      MsgTipoTarefa.rCons.vSqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not MsgTipoTarefa.ConsultaCampos('MSG_TIPO_TAREFA',
  	MsgTipoTarefa.rCons.vValor,
    MsgTipoTarefa.rCons.vCampo,
    MsgTipoTarefa.rCons.vCondicao,
    'MSG_TIPO_TAREFA.TIPO ',
    true, vDadosIni.codEmpresa,
    'MSG_TIPO_TAREFA.* ', ' ',
    MsgTipoTarefa.rCons.vSqlAdicional) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmTipoTarefa.BitBtn3Click(Sender: TObject);
begin
  try
    if not MsgTipoTarefa.Insert then
      exit;

    inherited;

    DBEdit1.Enabled := True;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      MsgTipoTarefa.Cancel;
      MsgTipoTarefa.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoTarefa.BitBtn4Click(Sender: TObject);
begin
  if not MsgTipoTarefa.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(MsgTipoTarefa.vNomeCampoErro, MsgTipoTarefa.vMensagemErro);
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
      if MsgTipoTarefa.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmTipoTarefa.BitBtn5Click(Sender: TObject);
begin
  inherited;
  MsgTipoTarefa.Cancel;
  MsgTipoTarefa.RollBackTransacao;
end;

procedure TfrmTipoTarefa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmTipoTarefa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (MsgTipoTarefa <> nil) then
    MsgTipoTarefa.Cancel;

  MsgTipoTarefa.free;
  MsgTipoTarefa := nil;

  Action := caFree;
  if (frmTipoTarefa <> nil) then
    frmTipoTarefa := nil;
end;

procedure TfrmTipoTarefa.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  MsgTipoTarefa := TMsgTipoTarefa.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet3.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmTipoTarefa.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (MsgTipoTarefa.dataSet.State in [dsEdit, dsInsert]) then
    begin
    	ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmTipoTarefa.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dsMsgTipoTarefa;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmTipoTarefa.SpeedButton1Click(Sender: TObject);
begin
  try
    if MsgTipoTarefa.dataSet.IsEmpty then
      Exit;

    if not MsgTipoTarefa.Edit then
      Exit;

    inherited;

    DBEdit1.Enabled := False;

    if MsgTipoTarefa.dataSet.FieldByName('EXEC_AUTO').AsString = 'S' then
      DBComboBox1.ItemIndex := 1
    else
      DBComboBox1.ItemIndex := 0;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      MsgTipoTarefa.Cancel;
      MsgTipoTarefa.RollBackTransacao;
    end;
  end;
end;

procedure TfrmTipoTarefa.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    MsgTipoTarefa.Delete;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      MsgTipoTarefa.Cancel;
      MsgTipoTarefa.RollBackTransacao;
    end;
  end;
end;

end.
