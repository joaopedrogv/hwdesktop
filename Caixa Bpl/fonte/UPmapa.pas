unit UPmapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask,uclasseslancamentos, uEditHw;

type
  TFrmpMapa = class(TfrmPadrao)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox3: TCheckBox;
    EditHw1: TEditHw;
    Label4: TLabel;
    SpeedButton55: TSpeedButton;
    Label5: TLabel;
    ComboBox2: TComboBox;
    CheckBox4: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Cadmapadesprec: TLancamentos;
  public
    { Public declarations }
  end;

var
  FrmpMapa: TFrmpMapa;

implementation

{$R *.dfm}
uses uDadosIni,udtmativo;

procedure TFrmpMapa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('LANC016', 'EMITIR', '', 'LANCAMENTOS',MaskEdit1.Text+' a '+MaskEdit2.text,
    Cadmapadesprec.buscas, False) then
    Exit;
  try
    Cadmapadesprec.vdata1:=StrToDate(MaskEdit1.text);
    Cadmapadesprec.vdata2:=StrToDate(MaskEdit2.text);
  Except
    Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if vDadosIni.vEmp.vFinanceiroUnificado then
    if EditHw1.AsInteger <> 0 then
      if not vDadosIni.empresaEstaUnificada(EditHw1.AsInteger) then
      begin
        Application.MessageBox(PChar('Código informado para Unificada inválido, informe um dos seguintes valores: ' + vDadosIni.vEmp.vCodigoUnificadas), 'Atenção', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

  Cadmapadesprec._EmiteMapaDespRec(
  	strtodate(MaskEdit1.text),
    StrToDate(MaskEdit2.text),
  	CheckBox1.Checked,
    CheckBox4.Checked,
    CheckBox2.Checked,
    ComboBox1.Text,
    CheckBox3.Checked,
    EditHw1.AsInteger,
  	vDadosIni.IfThen(ComboBox2.ItemIndex = 0, 'S', 'N'));
end;

procedure TFrmpMapa.BitBtn2Click(Sender: TObject);
begin
  inherited;
 if Cadmapadesprec <> nil then
   Cadmapadesprec.Free;
 close;
end;

procedure TFrmpMapa.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
		CheckBox4.Enabled := True
  else
  begin
    CheckBox4.Enabled := False;
    CheckBox4.Checked := False;
  end;
end;

procedure TFrmpMapa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
Action:=caFree;
end;

procedure TFrmpMapa.FormCreate(Sender: TObject);
begin
  inherited;
  Cadmapadesprec:=  TLancamentos.create;
end;

procedure TFrmpMapa.FormShow(Sender: TObject);
begin
  inherited;
  Label4.Visible := False;
  EditHw1.Visible := False;
  Label5.Visible := False;
  ComboBox2.Visible := False;
  MaskEdit1.Text := DateToStr(Date);
  MaskEdit2.Text := DateToStr(Date);
  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    Height := 216;
    Label4.Visible := True;
    EditHw1.Visible := True;
    Label5.Visible := True;
    ComboBox2.Visible := True;
  end
  else
    Height := 156;

  if not vDadosIni.validarAcessoEmpresasUnificadas(Cadmapadesprec.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    PostMessage(FrmpMapa.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;
end;

procedure TFrmpMapa.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('mapa_despesas%', Cadmapadesprec.buscas);
end;

end.
