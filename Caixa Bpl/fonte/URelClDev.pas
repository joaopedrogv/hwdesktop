unit URelClDev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, CheckLst, Buttons, DBCtrls, Mask,uClassesContasAReceber, uEditHw;

type
  TFrmPRelClDev = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckListBox1: TCheckListBox;
    ComboBox1: TComboBox;
    CheckBox2: TCheckBox;
    Label5: TLabel;
    EditHw1: TEditHw;
    btUnSelectAll: TSpeedButton;
    btSelectAll: TSpeedButton;
    SpeedButton55: TSpeedButton;
    lbEmpresasUnif: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditHw1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CadContasAReceber: TContasAReceber;
  public
    { Public declarations }
  end;

var
  FrmPRelClDev: TFrmPRelClDev;

implementation

{$R *.dfm}
uses uDadosIni,udtmativo;

procedure TFrmPRelClDev.BitBtn1Click(Sender: TObject);
begin
  inherited;
  CadContasAReceber:=  TControleCredito.create;
  if not vDadosIni.PesqPros('CAR058', 'EMITIR', '', 'CONTASARECEBER',MaskEdit1.Text+' a '+MaskEdit2.text,
    CadContasAReceber.buscas, False) then
    Exit;
  try
    CadContasAReceber.vdata1:=StrToDate(MaskEdit1.text);
  except
    Application.MessageBox('Data inicial inválida. Informe no mínimo uma data correta', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
    	MaskEdit1.SetFocus;
    exit;
  end;

  try
    CadContasAReceber.vdata2:=StrToDate(MaskEdit2.text);
  except
    Application.MessageBox('Data final inválida. Informe no mínimo uma data correta', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit2.CanFocus) then
    	MaskEdit2.SetFocus;
    exit;
  end;

  if EditHw1.AsValue < 0 then
	  EditHw1.AsValue := 0;
    
  CadContasAReceber._emiteRelatorioDev(CheckListBox1,ComboBox1.Text,CheckBox1.Checked, CheckBox2.Checked, EditHw1.AsInteger);
end;

procedure TFrmPRelClDev.btSelectAllClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to CheckListBox1.Count - 1 do
    CheckListBox1.Checked[i] := True;
end;

procedure TFrmPRelClDev.btUnSelectAllClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to CheckListBox1.Count - 1 do
    CheckListBox1.Checked[i] := False;
end;

procedure TFrmPRelClDev.CheckBox1Click(Sender: TObject);
begin
  inherited;
  ComboBox1.Enabled := CheckBox1.Checked;
end;

procedure TFrmPRelClDev.ComboBox1Exit(Sender: TObject);
begin
  inherited;
 ComboBox1.Text:=ComboBox1.Items[ComboBox1.ItemIndex]
end;

procedure TFrmPRelClDev.EditHw1Exit(Sender: TObject);
begin
  inherited;
  CadContasAReceber._preencheCombovend(ComboBox1, EditHw1.AsInteger);
end;

procedure TFrmPRelClDev.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
 Action:=caFree;
end;

procedure TFrmPRelClDev.FormCreate(Sender: TObject);
begin
  inherited;
  CadContasAReceber:=TControleCredito.create;
end;

procedure TFrmPRelClDev.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  inherited;
  if Key = VK_F2 then
    btSelectAll.Click
  else if Key = VK_F4 then
    btUnSelectAll.Click;
end;

procedure TFrmPRelClDev.FormShow(Sender: TObject);
begin
  inherited;
 Label5.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
 EditHw1.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
 lbEmpresasUnif.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
 EditHw1.AsValue := StrToInt(vDadosIni.codEmpresa);
 CadContasAReceber._preenchecheck(CheckListBox1);
 CadContasAReceber._preencheCombovend(ComboBox1, EditHw1.AsInteger);

 MaskEdit1.Text := DateToStr(Date);
 MaskEdit2.Text := DateToStr(Date);
 ComboBox1.Enabled := false;

  if not vDadosIni.validarAcessoEmpresasUnificadas(CadContasAReceber.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    FrmPRelClDev.fechar := True;
    PostMessage(FrmPRelClDev.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;
end;

procedure TFrmPRelClDev.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('clientes_devedores_por_periodo%', CadContasAReceber.buscas);
end;

end.



