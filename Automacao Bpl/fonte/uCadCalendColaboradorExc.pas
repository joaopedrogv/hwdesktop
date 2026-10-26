unit uCadCalendColaboradorExc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UclassesColaborador, DBCtrls;

type
  TfrmCadCalendColaboradoExc = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    bt_limpar_datas: TSpeedButton;
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure bt_limpar_datasClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCalendColaboradoExc: TfrmCadCalendColaboradoExc;
  obCalendColaboradorExc: TCalendColaboradorExc;

implementation

uses
  uDtmColaborador, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmCadCalendColaboradoExc.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('COL046', 'CONSULTA', '', 'CALEND_COLAB_EXC', '',
    obCalendColaboradorExc.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not obCalendColaboradorExc.ConsultaCampos('CALEND_COLAB_EXC', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      ' CALEND_COLAB_EXC.*, COLABORADOR.NOME_VENDEDOR ',
      ' INNER JOIN COLABORADOR ON ' +
      '   COLABORADOR.COD_VENDEDOR = CALEND_COLAB_EXC.COD_COLABORADOR ' +
      '   AND COLABORADOR.COD_EMPRESA = CALEND_COLAB_EXC.COD_EMPRESA ', '') then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if not obCalendColaboradorExc.ConsultaCampos('CALEND_COLAB_EXC', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
      ' CALEND_COLAB_EXC.*, COLABORADOR.NOME_VENDEDOR ',
      ' INNER JOIN COLABORADOR ON ' +
      '   COLABORADOR.COD_VENDEDOR = CALEND_COLAB_EXC.COD_COLABORADOR ' +
      '   AND COLABORADOR.COD_EMPRESA = CALEND_COLAB_EXC.COD_EMPRESA ', '') then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadCalendColaboradoExc.BitBtn3Click(Sender: TObject);
begin
  try
    if not obCalendColaboradorExc.Insert then
      exit;

    inherited;

    DBCheckBox1Click(Sender);
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
      obCalendColaboradorExc.Cancel;
      obCalendColaboradorExc.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadCalendColaboradoExc.BitBtn4Click(Sender: TObject);
begin
  if not obCalendColaboradorExc.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(obCalendColaboradorExc.vNomeCampoErro, obCalendColaboradorExc.vMensagemErro);
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
      if obCalendColaboradorExc.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadCalendColaboradoExc.BitBtn5Click(Sender: TObject);
begin
  obCalendColaboradorExc.Cancel;
  obCalendColaboradorExc.RollBackTransacao;
  inherited;
end;

procedure TfrmCadCalendColaboradoExc.bt_limpar_datasClick(
  Sender: TObject);
begin
  inherited;
  DBEdit3.Field.AsString := FormatDateTime('DD/MM/YYYY', Date);
  DBEdit4.Field.AsString := FormatDateTime('DD/MM/YYYY', Date);
  Perform(WM_NEXTDLGCTL, 0, 0);
  DBEdit3.Field.Clear;
  DBEdit4.Field.Clear;
end;

procedure TfrmCadCalendColaboradoExc.DBCheckBox1Click(Sender: TObject);
begin
  inherited;
  Label8.Enabled := DBCheckBox1.Checked;
  DBEdit3.Enabled := DBCheckBox1.Checked;
  Label9.Enabled := DBCheckBox1.Checked;
  DBEdit4.Enabled := DBCheckBox1.Checked;
  bt_limpar_datas.Enabled := DBCheckBox1.Checked;

  if (not DBCheckBox1.Checked) then
  begin
    if (obCalendColaboradorExc.dataSet.State in [dsInsert, dsEdit]) then
    begin
      DBEdit3.Field.Clear;
      DBEdit4.Field.Clear;
    end;
  end;
end;

procedure TfrmCadCalendColaboradoExc.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;
    
  if not obCalendColaboradorExc.ColaboradorCalendColaboradorExc.BuscarColaborador(
    obCalendColaboradorExc.dataSet.FieldByName('COD_COLABORADOR').AsInteger) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
      DBEdit5.SetFocus;
    Exit;
  end;
end;

procedure TfrmCadCalendColaboradoExc.DBEdit5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR');
    if trim(vDadosIni.vPesquisa) <> '' then
      obCalendColaboradorExc.dataSet.FieldByName('COD_COLABORADOR').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadCalendColaboradoExc.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadCalendColaboradoExc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if (obCalendColaboradorExc <> nil) then
    obCalendColaboradorExc.Cancel;

  obCalendColaboradorExc.free;
  obCalendColaboradorExc := nil;

  Action := caFree;
  if (frmCadCalendColaboradoExc <> nil) then
    frmCadCalendColaboradoExc := nil;
end;

procedure TfrmCadCalendColaboradoExc.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obCalendColaboradorExc := TCalendColaboradorExc.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadCalendColaboradoExc.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmColaborador.dsCalendColaboradorExc;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Apagar Registro - [COL049]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadCalendColaboradoExc.SpeedButton1Click(Sender: TObject);
begin
  try
    if obCalendColaboradorExc.dataSet.IsEmpty then
      Exit;
    if not obCalendColaboradorExc.Edit then
      Exit;
    inherited;

    DBCheckBox1Click(Sender);
    DBEdit1.Enabled := False;
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
      obCalendColaboradorExc.Cancel;
      obCalendColaboradorExc.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadCalendColaboradoExc.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    obCalendColaboradorExc.Delete;
    
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obCalendColaboradorExc.Cancel;
      obCalendColaboradorExc.RollBackTransacao;
    end;
  end;
end;

end.
