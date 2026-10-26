unit uNFCeConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ExtCtrls, DB, Mask, DBCtrls, ComCtrls, Buttons,
  uDataSet_OOP;

type
  TfrmNFCeConfig = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    PageControl1: TPageControl;
    tsCertificado: TTabSheet;
    tsCSC: TTabSheet;
    tsWebService: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    lkAmbiente: TDBLookupComboBox;
    lkTipoEnvio: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    tsArquivos: TTabSheet;
    GroupBox5: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label22: TLabel;
    DBEdit18: TDBEdit;
    tsEmail: TTabSheet;
    GroupBox6: TGroupBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label23: TLabel;
    DBEdit19: TDBEdit;
    Label24: TLabel;
    DBEdit20: TDBEdit;
    Label25: TLabel;
    DBEdit21: TDBEdit;
    Label26: TLabel;
    DBEdit22: TDBEdit;
    Label28: TLabel;
    DBEdit24: TDBEdit;
    Label29: TLabel;
    Panel4: TPanel;
    Label30: TLabel;
    lkMesmaConfig: TDBLookupComboBox;
    DBEdit23: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label41: TLabel;
    DBMemo1: TDBMemo;
    tsEmissao: TTabSheet;
    Label42: TLabel;
    Label43: TLabel;
    DBEdit26: TDBEdit;
    Label44: TLabel;
    DBEdit27: TDBEdit;
    lkTpEmis: TDBLookupComboBox;
    btAtivarDesativarContingencia: TBitBtn;
    Label27: TLabel;
    lkUsaSSL: TDBLookupComboBox;
    Label45: TLabel;
    lkWsVisaulizar: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    Label46: TLabel;
    lkUsaTLS: TDBLookupComboBox;
    Label47: TLabel;
    BitBtn1: TBitBtn;
    Label48: TLabel;
    ed_wslibssl: TDBLookupComboBox;
    ed_wslibssl2: TDBLookupComboBox;
    Label49: TLabel;
    DBEdit25: TDBEdit;
    DBText1: TDBText;
    Label50: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btAtivarDesativarContingenciaClick(Sender: TObject);
    procedure lkMesmaConfigExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    lk_lib_ssl: TDadosLookUp_OOP;
    lk_SimNao: TDadosLookUp_OOP;
    lk_Ambiente: TDadosLookUp_OOP;
    lk_TipoEnvio: TDadosLookUp_OOP;
    lk_TpEmis: TDadosLookUp_OOP;
    procedure montarComponentes;
  public
    { Public declarations }
  end;

var
  frmNFCeConfig: TfrmNFCeConfig;

implementation

uses uDtmNFConsumidor, uClassesNFConsumidor, uDtmAtivo;

{$R *.dfm}

procedure TfrmNFCeConfig.btAtivarDesativarContingenciaClick(Sender: TObject);
begin
  inherited;
  ConfNFCe.AtivaDesativarContingencia;
  btAtivarDesativarContingencia.Caption := vDadosIni.IfThen(
    ConfNFCe.dataSet.FieldByName('tpemis').AsInteger = 9,
    'Desativar Contingência',
    'Ativar Contingência');
end;

procedure TfrmNFCeConfig.BitBtn1Click(Sender: TObject);
begin
  inherited;
  //talvez fazer o download aqui
end;

procedure TfrmNFCeConfig.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if ConfNFCe.Post then
    ModalResult := IDOK
  else
  begin
    setFocusCampoErro(ConfNFCe.vNomeCampoErro);
  end;
end;

procedure TfrmNFCeConfig.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ConfNFCe.Cancel;
  ConfNFCe.CancelUpdates;
  ConfNFCe.RollBackTransacao;
  ModalResult := IDCANCEL;
end;

procedure TfrmNFCeConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(lk_lib_ssl);
  FreeAndNil(lk_SimNao);
  FreeAndNil(lk_Ambiente);
  FreeAndNil(lk_TipoEnvio);
  FreeAndNil(lk_TpEmis);

  Action := caFree;
  frmNFCeConfig := nil;
end;

procedure TfrmNFCeConfig.FormCreate(Sender: TObject);
begin
  inherited;
  lk_lib_ssl := TDadosLookUp_OOP.create;
  lk_SimNao := TDadosLookUp_OOP.create;
  lk_Ambiente := TDadosLookUp_OOP.create;
  lk_TipoEnvio := TDadosLookUp_OOP.create;
  lk_TpEmis := TDadosLookUp_OOP.create;
end;

procedure TfrmNFCeConfig.FormShow(Sender: TObject);
begin
  inherited;

  montarComponentes;

  {if ConfNFCe.dataSet.FieldByName('USAR_CONF_NFE').AsString = 'S' then
  begin
    tsCertificado.TabVisible := False;
    tsWebService.TabVisible := False;
    tsArquivos.TabVisible := False;
    tsEmail.TabVisible := False;
    Label40.Visible := True;
    DBLookupComboBox1.Visible := True;
    ed_wslibssl2.Visible := True;
    Label48.Visible := True;
    PageControl1.ActivePage := tsCSC;
  end
  else}
  begin
    tsCertificado.TabVisible := True;
    tsWebService.TabVisible := True;
    tsArquivos.TabVisible := True;
    tsEmail.TabVisible := True;
    Label40.Visible := False;
    DBLookupComboBox1.Visible := False;
    ed_wslibssl2.Visible := False;
    Label48.Visible := False;
    PageControl1.ActivePage := tsCertificado;
  end;

  vDadosIni.fechaStatusProcessamento;

end;

procedure TfrmNFCeConfig.lkMesmaConfigExit(Sender: TObject);
begin
  inherited;

  if ConfNFCe.dataSet.FieldByName('USAR_CONF_NFE').AsString = 'S' then
  begin
    tsCertificado.TabVisible := False;
    tsWebService.TabVisible := False;
    tsArquivos.TabVisible := False;
    tsEmail.TabVisible := False;
    Label40.Visible := True;
    DBLookupComboBox1.Visible := True;
    ed_wslibssl2.Visible := True;
    Label48.Visible := True;
    PageControl1.ActivePage := tsCSC;
  end
  else
  begin
    tsCertificado.TabVisible := True;
    tsWebService.TabVisible := True;
    tsArquivos.TabVisible := True;
    tsEmail.TabVisible := True;
    Label40.Visible := False;
    DBLookupComboBox1.Visible := False;
    ed_wslibssl2.Visible := False;
    Label48.Visible := False;
    PageControl1.ActivePage := tsCertificado;
  end;

end;

procedure TfrmNFCeConfig.montarComponentes;
begin

  lk_SimNao.setDadosDataSet(['S', 'N'], ['Sim', 'Nao'], lkMesmaConfig);
  lk_SimNao.setDBLookupComboBox(lkUsaSSL);
  lk_SimNao.setDBLookupComboBox(lkUsaTLS);
  lk_SimNao.setDBLookupComboBox(lkWsVisaulizar);

  lk_Ambiente.setDadosDataSet(['1', '2'], ['1: Produção', '2: Homologação'], lkAmbiente);
  lk_TipoEnvio.setDadosDataSet(['A', 'S'], ['A: Assincrono', 'S: Sincrono'], lkTipoEnvio);
  lk_TpEmis.setDadosDataSet(['1', '9'], ['1: Normal', '9: Contingência OffLine'], lkTpEmis);
  lk_lib_ssl.setDadosDataSet(['0', '1', '2'], ['Capicom', 'OpenSSL', 'WinCrypt'], ed_wslibssl);

  lk_TipoEnvio.setDBLookupComboBox(DBLookupComboBox1);
  lk_lib_ssl.setDBLookupComboBox(ed_wslibssl2);

  btAtivarDesativarContingencia.Caption := vDadosIni.IfThen(
    ConfNFCe.dataSet.FieldByName('tpemis').AsInteger = 9,
    'Desativar Contingência',
    'Ativar Contingência');

end;

procedure TfrmNFCeConfig.SpeedButton1Click(Sender: TObject);
var
  FileOpen: TOpenDialog;
begin
  inherited;
  FileOpen := TOpenDialog.Create(Self);
  try
    FileOpen.Title := 'Selecione o certificado digital';
    if FileOpen.Execute then
      ConfNFCe.fdata('CERT_ARQUIVOPFX').Put(FileOpen.FileName);
  finally
    FreeAndNil(FileOpen);
  end;
end;

procedure TfrmNFCeConfig.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  ConfNFCe.ObterDadosPFX;
end;

procedure TfrmNFCeConfig.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  ConfNFCe.fdata('CERT_DADOSPFX').SetNull;
end;

procedure TfrmNFCeConfig.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  ConfNFCe.fdata('CERT_ARQUIVOPFX').SetNull;
end;

end.
