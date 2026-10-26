unit UParBoletim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, ExtCtrls,uClassesLancamentos;

type
  TFrmParBol = class(TfrmPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton55: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
   CadBoletim: TLancamentos;
  public
    { Public declarations }
  end;

var
  FrmParBol: TFrmParBol;

implementation

{$R *.dfm}
uses uDadosIni,udtmativo;

procedure TFrmParBol.BitBtn1Click(Sender: TObject);
var
 vdatamov: Tdate;
begin
  inherited;
  if not vDadosIni.PesqPros('LANC014', 'EMITIR', '', 'LANCAMENTOS',MaskEdit1.Text,
    CadBoletim.buscas, False) then
    Exit;
  try
    vdatamov:=StrToDate(MaskEdit1.Text);
  Except
    Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if (vdatamov > vDadosIni.diaFFinanceiro) then
  begin
    Application.MessageBox('Dia ainda não fechado', 'Atenção',
    MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  CadBoletim._EmiteBoletim(vdatamov, CheckBox1.Checked, CheckBox2.Checked);
end;

procedure TFrmParBol.BitBtn2Click(Sender: TObject);
begin
  inherited;
 if CadBoletim <> nil then
   CadBoletim.Free;
 close;
end;

procedure TFrmParBol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action:=caFree;
end;

procedure TFrmParBol.FormCreate(Sender: TObject);
begin
  inherited;
  CadBoletim:=  TLancamentos.create;
end;

procedure TFrmParBol.FormShow(Sender: TObject);
begin
  inherited;
  MaskEdit1.Text:=datetostr(vDadosIni.diaFFinanceiro);

  if not vDadosIni.validarAcessoEmpresasUnificadas(CadBoletim.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    PostMessage(FrmParBol.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;
end;

procedure TFrmParBol.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('boletim_caixa_%', CadBoletim.buscas);
end;

end.
