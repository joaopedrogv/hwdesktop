unit uCadLocalidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadLocalidade = class(TfrmCadPadraoM)
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
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadLocalidade: TfrmCadLocalidade;

implementation

uses uDtmOrdemCarregamento, uClassesOrdemCarregamento, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmCadLocalidade.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('OCR011', 'CONSULTA', '', 'LOCALIDADE', '',
    cadLocalidade.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not cadLocalidade.ConsultaCampos('LOCALIDADE', ComboBox1.Text,
      'LOCALIDADE.LOCALIDADE', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      'LOCALIDADE.*, S.SETOR, C.NOME_VENDEDOR, I.NOME_CIDADE, E.SIGLA_UF',
      ' INNER JOIN SETOR S ON S.COD_SETOR = LOCALIDADE.COD_SETOR AND S.COD_EMPRESA = LOCALIDADE.COD_EMPRESA' +
      ' LEFT JOIN COLABORADOR C ON C.COD_VENDEDOR = S.COD_VENDEDOR AND C.COD_EMPRESA = S.COD_EMPRESA' +
      ' LEFT JOIN CIDADES I ON I.COD_CIDADE = LOCALIDADE.COD_CIDADE' +
      ' LEFT JOIN ESTADOS E ON E.CODIGO_UF = LOCALIDADE.COD_ESTADO', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus
  end
  else
    if cadLocalidade.ConsultaCampos('LOCALIDADE', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, 'LOCALIDADE.LOCALIDADE', true, vDadosIni.codEmpresa,
      'LOCALIDADE.*, S.SETOR, C.NOME_VENDEDOR, I.NOME_CIDADE, E.SIGLA_UF',
      ' INNER JOIN SETOR S ON S.COD_SETOR = LOCALIDADE.COD_SETOR AND S.COD_EMPRESA = LOCALIDADE.COD_EMPRESA' +
      ' LEFT JOIN COLABORADOR C ON C.COD_VENDEDOR = S.COD_VENDEDOR AND C.COD_EMPRESA = S.COD_EMPRESA' +
      ' LEFT JOIN CIDADES I ON I.COD_CIDADE = LOCALIDADE.COD_CIDADE' +
      ' LEFT JOIN ESTADOS E ON E.CODIGO_UF = LOCALIDADE.COD_ESTADO', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadLocalidade.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not cadLocalidade.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadLocalidade.BitBtn4Click(Sender: TObject);
begin
  if not cadLocalidade.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(cadLocalidade.vNomeCampoErro);
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
      if cadLocalidade.Insert then
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

procedure TfrmCadLocalidade.BitBtn5Click(Sender: TObject);
begin
  cadLocalidade.Cancel;
  inherited;
end;

procedure TfrmCadLocalidade.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadLocalidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  cadLocalidade.Free;
  cadLocalidade := nil;

  Action := caFree;
  frmCadLocalidade := nil;
end;

procedure TfrmCadLocalidade.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  cadLocalidade := TLocalidade.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadLocalidade.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (cadLocalidade.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadLocalidade.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmOrdemCarregamento.dsLocalidade;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [OCR014]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(cadLocalidade._lixeiraVazia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadLocalidade.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not cadLocalidade.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;    
end;

procedure TfrmCadLocalidade.SpeedButton25Click(Sender: TObject);
begin
  if not cadLocalidade._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [OCR014]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [OCR015]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadLocalidade.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    cadLocalidade.Delete;
    lixeiraVazia( cadLocalidade._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadLocalidade.SpeedButton5Click(Sender: TObject);
begin
  if cadLocalidade._restaurarRegistroDaLixeira then
    lixeiraVazia(cadLocalidade._lixeiraVazia);
end;        

initialization
  RegisterClass(TfrmCadLocalidade);
finalization
  UnRegisterClass(TfrmCadLocalidade);

end.

