unit uServiceConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Spin, uNFC_Types;

type
  TfrmConfServicoNFC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    edCodEmpresa: TEdit;
    Panel4: TPanel;
    Label3: TLabel;
    edToken: TEdit;
    ckServerEnvioNFCe: TCheckBox;
    ckServerEnvioSAT: TCheckBox;
    ckServerImpressao: TCheckBox;
    Label4: TLabel;
    edBancoDeDados: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ckServerEmail: TCheckBox;
    edSleepThread: TSpinEdit;
    edSleepNoThread: TSpinEdit;
    Label7: TLabel;
    Label8: TLabel;
    edThreadNFCe: TSpinEdit;
    edThreadSAT: TSpinEdit;
    ckSalvarLogNFCe: TCheckBox;
    ckSalvarLogSAT: TCheckBox;
    Label9: TLabel;
    edTimeVerConting: TSpinEdit;
    Label10: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfServicoNFC: TfrmConfServicoNFC;
  Utils: TServiceUtils;

implementation

uses IniFiles;

{$R *.dfm}

procedure TfrmConfServicoNFC.BitBtn1Click(Sender: TObject);
var
  Cfg: RConfiguracoes;
begin
  try
    Cfg.CodEmpresa                     := StrToIntDef(edCodEmpresa.Text,0);
    Cfg.Token                          := edToken.Text;
    Cfg.ServidorDeEnvioNFCe            := ckServerEnvioNFCe.Checked;
    //Cfg.ServidorDeEnvioSAT             := ckServerEnvioSAT.Checked;
    Cfg.ServidorDeImpressao            := ckServerImpressao.Checked;
    Cfg.ServidorDeEmail                := ckServerEmail.Checked;
    Cfg.ThreadsAtivasNFCe              := edThreadNFCe.Value;
    //Cfg.ThreadsAtivasSAT               := edThreadSAT.Value;
    Cfg.SleepTimeServiceThread         := edSleepThread.Value;
    Cfg.SleepTimeServiceNoThread       := edSleepNoThread.Value;
    Cfg.EnderecoBancoDeDados           := edBancoDeDados.Text;
    Cfg.SalvarLogNFCe                  := ckSalvarLogNFCe.Checked;
    //Cfg.SalvarLogSAT                   := ckSalvarLogSAT.Checked;
    Cfg.TimeVerificarEnvioContingencia := edTimeVerConting.Value;

    Utils.Conf := Cfg;
    Utils.SalvarConfig;
    ModalResult := IDOK;
  except
  end;
end;

procedure TfrmConfServicoNFC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Utils <> nil then
    FreeAndNil(Utils);
  Action := caFree;
  frmConfServicoNFC := nil;
end;

procedure TfrmConfServicoNFC.FormShow(Sender: TObject);
begin
  if Utils = nil then
    Utils := TServiceUtils.create('Nenhum');

  try
    Utils.LerConfig;
    edCodEmpresa.Text         := IntToStr(Utils.Conf.CodEmpresa);
    edToken.Text              := Utils.Conf.Token;
    ckServerEnvioNFCe.Checked := Utils.Conf.ServidorDeEnvioNFCe;
    //ckServerEnvioSAT.Checked  := Utils.Conf.ServidorDeEnvioSAT;
    ckServerImpressao.Checked := Utils.Conf.ServidorDeImpressao;
    ckServerEmail.Checked     := Utils.Conf.ServidorDeEmail;
    edThreadNFCe.Value        := Utils.Conf.ThreadsAtivasNFCe;
    //edThreadSAT.Value         := Utils.Conf.ThreadsAtivasSAT;
    edSleepThread.Value       := Utils.Conf.SleepTimeServiceThread;
    edSleepNoThread.Value     := Utils.Conf.SleepTimeServiceNoThread;
    edBancoDeDados.Text       := Utils.Conf.EnderecoBancoDeDados;
    ckSalvarLogNFCe.Checked   := Utils.Conf.SalvarLogNFCe;
    //ckSalvarLogSAT.Checked    := Utils.Conf.SalvarLogSAT;
    edTimeVerConting.Value    := Utils.Conf.TimeVerificarEnvioContingencia;
  except
  end;
end;

end.
