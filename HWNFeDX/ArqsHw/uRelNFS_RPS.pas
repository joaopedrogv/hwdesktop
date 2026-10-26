unit uRelNFS_RPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, grimgctrl, jpeg, QuickRpt, ExtCtrls,UqrVisualizar,QRPDFFilt;

type
  TFrmRelRPSNFSe = class(TForm)
    qrpNFS_RPS: TQuickRep;
    QRBand1: TQRBand;
    QRShape6: TQRShape;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRHRule1: TQRHRule;
    QRImage3: TQRImage;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRHRule6: TQRHRule;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRBand2: TQRBand;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRHRule3: TQRHRule;
    QRLabel5: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRHRule7: TQRHRule;
    tr: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel73: TQRLabel;
    QRBand4: TQRBand;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRMemo1: TQRMemo;
    QRBand5: TQRBand;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRHRule8: TQRHRule;
    QRHRule9: TQRHRule;
    QRLabel74: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRHRule10: TQRHRule;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRHRule11: TQRHRule;
    QRLabel44: TQRLabel;
    QRLabel100: TQRLabel;
    QRShape7: TQRShape;
    procedure qrpNFS_RPSPreview(Sender: TObject);
    procedure VisualizaRelQrp(sender: Tobject; vnome: string);
    function gerarPDF(vdest: string): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelRPSNFSe: TFrmRelRPSNFSe;

implementation

uses
  QRPrntr;


{$R *.dfm}

function TFrmRelRPSNFSe.gerarPDF(vdest: string): boolean;
begin
// qrpNFS_RPS.Print;
 qrpNFS_RPS.ExportToFilter(TQRPDFDocumentFilter.Create(vdest));
 sleep(3000);
end;

procedure TFrmRelRPSNFSe.qrpNFS_RPSPreview(Sender: TObject);
begin
  inherited;
//qrLabels prefeitura:
//QRImage1.Picture.LoadFromFile('C:\Projeto_Fiscal40\Bpl\icone.ico'); //ou bmp,jpg,jpeg
//QRImage3.Picture.LoadFromFile('C:\Projeto_Fiscal40\Bpl\icone.ico');
{QRLabel1.Caption:='PREFEIRURA MUNICIPAL DE';
QRLabel11.Caption:='Secretaria Municipal de Finanças';
QRLabel12.Caption:='Central do ISSIntel';
QRLabel13.Caption:='Logradouro da prefeitura';
QRLabel14.Caption:='Cidade UF e CEP da Prefeitura';
QRLabel15.Caption:='Número nota';
QRLabel16.Caption:='0000003';
QRLabel17.Caption:='Cod.Verificação';
QRLabel101.Caption:='Codigo QR';
//qrLabels Nota Fiscal
QRLabel23.Caption:='Data e Hora';
QRLabel24.Caption:='Periodo compet.';
QRLabel25.Caption:='Município Prestação';
QRLabel26.Caption:='Regime trib.';
QRLabel27.Caption:='Natureza de operação.';
//qrLabels prestador
QRLabel33.Caption:='Razão Social';
QRLabel34.Caption:='Periodo compet.';
QRLabel35.Caption:='Nome Fantasia';
QRLabel36.Caption:='Simples';
QRLabel37.Caption:='Incentivador SIM';
QRLabel43.Caption:='CNPJ';
QRLabel44.Caption:='Incentivador SIM';
QRLabel45.Caption:='Inscr. M';
QRLabel46.Caption:='Incentivador SIM';
QRLabel47.Caption:='Inscr. E';
QRLabel48.Caption:='Endereço Prestador';
QRLabel50.Caption:='email@email.com';
QRLabel52.Caption:='fone';

//tomador de serviços
QRLabel56.Caption:='Razão Social';
QRLabel58.Caption:='Nome Fantasia';
QRLabel65.Caption:='CNPJ';
QRLabel66.Caption:='Inscr. M';
QRLabel67.Caption:='Inscr. E';
QRLabel68.Caption:='Endereço tomador';
QRLabel70.Caption:='email@email.com';
QRLabel72.Caption:='fone';

//dados complementares
QRLabel54.Caption:='COD. Serviço';
QRLabel55.Caption:='CNAE';
QRLabel79.Caption:='Intermediario';
QRLabel66.Caption:='Inscr. M';
QRLabel67.Caption:='Inscr. E';
QRLabel68.Caption:='Endereço tomador';
QRLabel70.Caption:='email@email.com';
QRLabel72.Caption:='fone';

//Discriminação dos serviços
qrMemo1.Lines.text:='Descrição dos serviços';

//Valor total da nota
QRLabel84.Caption:='PiS';
QRLabel85.Caption:='Cofins';
QRLabel86.Caption:='INSS';
QRLabel87.Caption:='IR';
QRLabel88.Caption:='CSLL';
QRLabel89.Caption:='Outras Retencoes';
QRLabel91.Caption:='Deducoes';
QRLabel92.Caption:='Desconto incondicionado';
QRLabel95.Caption:='Desconto condicionado';
QRLabel96.Caption:='Base Calculo';
QRLabel99.Caption:='Aliquota';
QRLabel108.Caption:='ISS';
QRLabel111.Caption:='ISS Retido';
QRLabel112.Caption:='Valor Liquido';

//Outras informacoes
qrmemo2.Lines.Text:='outras informacoes';}

VisualizaRelQrp(sender, 'Nota Fiscal de Serviços');
end;

procedure TFrmRelRPSNFSe.VisualizaRelQrp(sender: Tobject; vnome: string);
begin
 if FrmQrVisualizar <> nil then
   FrmQrVisualizar.close;
  Application.CreateForm(TFrmQrVisualizar, FrmQrVisualizar);
  FrmQrVisualizar.QRPreview1.QRPrinter :=TQRPrinter(sender);
  //FrmQrVisualizar.Caption := FrmQrVisualizar.Caption + ' [' + TquickRep(sender).ReportTitle + ']';
//  FrmQrVisualizar.Caption := FrmQrVisualizar.Caption + ' [' + qrpNFS_RPS.ReportTitle + ']';
  FrmQrVisualizar.Show;
end;

end.
