unit uCadSetor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadSetor = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSetor: TfrmCadSetor;

implementation

uses uClassesOrdemCarregamento, uDtmAtivo, uDtmOrdemCarregamento, DB;

{$R *.dfm}

procedure TfrmCadSetor.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('OCR002', 'CONSULTA', '', 'SETOR', '',
    cadSetor.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not cadSetor.ConsultaCampos('SETOR', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1, 'SETOR.*, C.NOME_VENDEDOR',
      ' LEFT JOIN COLABORADOR C ON C.COD_VENDEDOR = SETOR.COD_VENDEDOR AND C.COD_EMPRESA = SETOR.COD_EMPRESA', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus
  end
  else
    if cadSetor.ConsultaCampos('SETOR', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa, 'SETOR.*, C.NOME_VENDEDOR',
      ' LEFT JOIN COLABORADOR C ON C.COD_VENDEDOR = SETOR.COD_VENDEDOR AND C.COD_EMPRESA = SETOR.COD_EMPRESA', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadSetor.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not cadSetor.Insert then
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

procedure TfrmCadSetor.BitBtn4Click(Sender: TObject);
begin
  if not cadSetor.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(cadSetor.vNomeCampoErro);
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
      if cadSetor.Insert then
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

procedure TfrmCadSetor.BitBtn5Click(Sender: TObject);
begin
  cadSetor.Cancel;
  inherited;     
end;

procedure TfrmCadSetor.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadSetor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  cadSetor.Free;
  cadSetor := nil;

  Action := caFree;
  frmCadSetor := nil;
end;

procedure TfrmCadSetor.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  cadSetor := TSetor.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadSetor.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (cadSetor.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadSetor.FormShow(Sender: TObject);
begin

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmOrdemCarregamento.dsSetor;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [OCR005]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(cadSetor._lixeiraVazia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadSetor.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not cadSetor.Edit then
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

procedure TfrmCadSetor.SpeedButton25Click(Sender: TObject);
begin
  if not cadSetor._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [OCR005]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [OCR006]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadSetor.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    cadSetor.Delete;
    lixeiraVazia( cadSetor._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSetor.SpeedButton5Click(Sender: TObject);
begin
  if cadSetor._restaurarRegistroDaLixeira then
    lixeiraVazia(cadSetor._lixeiraVazia);
end;

end.
