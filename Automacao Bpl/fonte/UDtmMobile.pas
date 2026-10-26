unit UDtmMobile;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBQuery, IBDatabase,
  IBCustomDataSet, IBStoredProc;

type
  TdtmMobile = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    qrMobile: TIBQuery;
    dspMobile: TDataSetProvider;
    cdsMobile: TClientDataSet;
    dsMobile: TDataSource;
    cdsMobileIDMOBILE: TIntegerField;
    cdsMobileCOD_EMPRESA: TIntegerField;
    cdsMobileDESCRICAO_MOB: TStringField;
    cdsMobileSTATUS_MOB: TStringField;
    cdsMobileATIVO: TIntegerField;
    qrMensMobile: TIBQuery;
    dspMensMobile: TDataSetProvider;
    cdsMensMobile: TClientDataSet;
    dsMensMobile: TDataSource;
    cdsMobileCons: TClientDataSet;
    qrMobileCons: TIBQuery;
    dsMobileCons: TDataSource;
    dspMobileCons: TDataSetProvider;
    cdsMensMobileIDMOBILE: TIntegerField;
    cdsMensMobileCOD_EMPRESA: TIntegerField;
    cdsMensMobileNATUREZA_MENS: TStringField;
    cdsMensMobileDATA_ENVIO: TDateTimeField;
    cdsMensMobileHORA_ENVIO: TStringField;
    cdsMensMobileMENSAGEM: TStringField;
    cdsMensMobileDATA_RECEPCAO: TDateTimeField;
    cdsMensMobileHORA_RECEPCAO: TStringField;
    cdsMensMobileCOD_US_LEU: TIntegerField;
    cdsMensMobileATIVO: TIntegerField;
    cdsMensMobileUS_ENVIO: TIntegerField;
    cdsMobileConsIDMOBILE: TIntegerField;
    cdsMobileConsDESCRICAO_MOB: TStringField;
    cdsMensMobileIDSEQM: TIntegerField;
    cdsMensMobileTIPO: TStringField;
    cdsMensMobileDESCRICAO_MOB: TStringField;
    qrUsuarioMensMobile: TIBQuery;
    dspUsuarioMensMobile: TDataSetProvider;
    cdsUsuarioMensMobile: TClientDataSet;
    dsUsuarioMensMobile: TDataSource;
    cdsUsuarioMensMobileCOD_VENDEDOR: TIntegerField;
    cdsUsuarioMensMobileNOME_VENDEDOR: TStringField;
    cdsMensMobileUSUARIO_LEU: TStringField;
    cdsMensMobileUSUARIO_ENVIO: TStringField;
    cdsMobileConsSEL: TStringField;
    cdsMensMobileSTATUS_MENS: TStringField;
    cdsMensMobileUS_DEST: TStringField;
    qrSenhasCons: TIBQuery;
    dspSenhasCons: TDataSetProvider;
    cdsSenhasCons: TClientDataSet;
    dsSenhasCons: TDataSource;
    cdsSenhasConsCODIGO: TIntegerField;
    cdsSenhasConsUSUARIO: TStringField;
    cdsSenhasConsSEL: TStringField;
    cdsMensMobileSEL: TStringField;
    cdsMensMobileORIG_MENS: TStringField;
    cdsMensMobileSTATUS_ENV: TStringField;
    cdsMensMobileAPLICATIVO: TStringField;
    cdsMensMobilePLATAFORMA: TStringField;
    cdsMensMobileHTML: TMemoField;
    cdsMensMobileUUID: TStringField;
    cdsMensMobileID_MSG_APLICATIVO: TIntegerField;
    cdsMensMobileID_MSG_PLATAFORMA: TIntegerField;
    qrDocEletronicoMensMobile: TIBQuery;
    dspDocEletronicoMensMobile: TDataSetProvider;
    cdsDocEletronicoMensMobile: TClientDataSet;
    dsDocEletronicoMensMobile: TDataSource;
    cdsDocEletronicoMensMobileDOC: TMemoField;
    cdsDocEletronicoMensMobileDATA: TDateTimeField;
    cdsDocEletronicoMensMobileSEQID: TLargeintField;
    cdsMensMobileASSUNTO: TStringField;
    cdsMensMobileOBS_ENV: TMemoField;
    cdsMensMobileCOD_CARTA: TIntegerField;
    cdsMensMobileORIGEM: TStringField;
    cdsMensMobileDESTINO: TStringField;
    cdsMensMobileCOD_TAREFA: TIntegerField;
    cdsMensMobileEXEC_AUTO: TStringField;
    cdsMensMobileCOD_PROF_RESP: TIntegerField;
    cdsMensMobileID_MSG_APLICATIVO_RESP: TIntegerField;
    cdsMensMobileID_MSG_PLATAFORMA_RESP: TIntegerField;
    cdsMensMobileIDENTIFICADOR_RESP: TStringField;
    cdsMensMobilePROF_RESP: TStringField;
    cdsMensMobileAPLICATIVO_RESP: TStringField;
    cdsMensMobilePLATAFORMA_RESP: TStringField;
    procedure cdsMensMobileOBS_ENVGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsMensMobileHTMLGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsMobileBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMobile: TdtmMobile;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TdtmMobile.cdsMensMobileHTMLGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
	if not cdsMensMobileHTML.IsNull then
    Text := Copy(cdsMensMobileHTML.AsString, 1, 50) + '...';
end;

procedure TdtmMobile.cdsMensMobileOBS_ENVGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
	if not cdsMensMobileOBS_ENV.IsNull then
    Text := cdsMensMobileOBS_ENV.AsString;//Copy(cdsMensMobileOBS_ENV.AsString, 1, 50) + '...';
end;

procedure TdtmMobile.cdsMobileBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmMobile.DataModuleCreate(Sender: TObject);
var
  J, I: Integer;
begin
  for J := 0 to Self.ComponentCount - 1 do
    if Self.Components[J] is TClientDataSet then
      for I := 0 to TClientDataSet(Self.Components[J]).FieldCount - 1 do
      begin
        TClientDataSet(Self.Components[J]).IndexDefs.Add('IDXA' +
          TClientDataSet(Self.Components[J]).Fields[I].FieldName,
          TClientDataSet(Self.Components[J]).Fields[I].FieldName, []);
        TClientDataSet(Self.Components[J]).IndexDefs.Add('IDXD' +
          TClientDataSet(Self.Components[J]).Fields[I].FieldName,
          TClientDataSet(Self.Components[J]).Fields[I].FieldName, [ixDescending]);
      end;
end;

end.
