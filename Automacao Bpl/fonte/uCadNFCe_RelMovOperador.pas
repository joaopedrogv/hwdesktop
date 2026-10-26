unit uCadNFCe_RelMovOperador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmCadNFCe_RelMovOperador = class(TfrmPadrao)
    rel: TQuickRep;
    TitleBand1: TQRBand;
    qr_empresa_nome: TQRLabel;
    qr_empresa_cnpj: TQRLabel;
    qr_mov_diamov: TQRLabel;
    qr_mov_diafech: TQRLabel;
    qr_mov_status: TQRLabel;
    qr_mov_id: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    qrdb: TQRBand;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    qr_cod_controle: TQRDBText;
    qr_tpag: TQRDBText;
    qr_nome_ctrl: TQRDBText;
    qr_vpag: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel28: TQRLabel;
    qr_meiopag_tot: TQRLabel;
    qr_count_suprimento: TQRDBText;
    qr_count_sangria: TQRDBText;
    qr_count_autorizadas: TQRDBText;
    qr_count_canceladas: TQRDBText;
    qr_count_inutilizadas: TQRDBText;
    qr_count_denegadas: TQRDBText;
    qr_count_contingencias: TQRDBText;
    qr_count_enviando: TQRDBText;
    qr_count_pendente: TQRDBText;
    qr_vprod: TQRDBText;
    qr_vdesc: TQRDBText;
    qr_vfrete: TQRDBText;
    qr_vseg: TQRDBText;
    qr_voutro: TQRDBText;
    qr_vsuprimento: TQRDBText;
    qr_vsangria: TQRDBText;
    QRSysData1: TQRSysData;
    qr_datahora: TQRLabel;
    QRLabel1: TQRLabel;
    qr_vnf: TQRDBText;
    qr_total_geral: TQRLabel;
    qr_operador: TQRLabel;
    qr_emissor: TQRLabel;
    qr_titile: TQRSysData;
    QRLabel29: TQRLabel;
    qr_dif: TQRLabel;
    QRLabel30: TQRLabel;
    qr_vtroco: TQRDBText;
    procedure relPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadNFCe_RelMovOperador: TfrmCadNFCe_RelMovOperador;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TfrmCadNFCe_RelMovOperador.relPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, rel.ReportTitle);
end;

end.
