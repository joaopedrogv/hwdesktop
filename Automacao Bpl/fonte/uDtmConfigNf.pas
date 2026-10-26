unit uDtmConfigNf;

interface

uses
  SysUtils, Classes, DB, DBClient, IBStoredProc, IBDatabase, IBCustomDataSet,
  IBQuery, Provider, RDprint;

type
  TdtmConfigNf = class(TDataModule)
    dsCabecalhonf: TDataSource;
    cdsCabecalhonf: TClientDataSet;
    cdsCabecalhonfCODIGO: TIntegerField;
    cdsCabecalhonfNOME_NF: TStringField;
    cdsCabecalhonfPORTA_IMPRESSAO: TStringField;
    cdsCabecalhonfTIPO_NOTA: TStringField;
    cdsCabecalhonfQTDELINHA: TIntegerField;
    cdsCabecalhonfTAMANHOFONTE: TStringField;
    cdsCabecalhonfENTRELINHAMENTO: TStringField;
    cdsCabecalhonfATIVO: TIntegerField;
    dspCabecalhonf: TDataSetProvider;
    qrCabecalhonf: TIBQuery;
    dsItensConfignf: TDataSource;
    cdsItensConfignf: TClientDataSet;
    cdsItensConfignfCODIGO: TIntegerField;
    cdsItensConfignfDESCRICAO: TStringField;
    cdsItensConfignfATIVO: TIntegerField;
    dspItensConfignf: TDataSetProvider;
    qrItensConfignf: TIBQuery;
    qrConfignf: TIBQuery;
    dsConfignf: TDataSource;
    cdsConfignf: TClientDataSet;
    cdsConfignfCOD_NOTAFISCAL: TIntegerField;
    cdsConfignfCOD_ITEM: TIntegerField;
    cdsConfignfORDEM_CFG: TIntegerField;
    cdsConfignfLINHA_CFG: TIntegerField;
    cdsConfignfCOLUNA_CFG: TIntegerField;
    cdsConfignfCONDENSADO: TIntegerField;
    cdsConfignfNEGRITO: TIntegerField;
    cdsConfignfMAXLINHAS: TIntegerField;
    cdsConfignfSEQCFGNOTA: TIntegerField;
    cdsConfignfATIVO: TIntegerField;
    dspConfignf: TDataSetProvider;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    SpIncCodigo: TIBStoredProc;
    qrImpressao: TIBQuery;
    RDprint1: TRDprint;
    qrCamposNf: TIBQuery;
    dsCamposNf: TDataSource;
    cdsCamposNf: TClientDataSet;
    dspCamposNf: TDataSetProvider;
    cdsCamposNfPORTA_IMPRESSAO: TStringField;
    cdsCamposNfENTRELINHAMENTO: TStringField;
    cdsCamposNfNORDEM_CAMP: TIntegerField;
    cdsCamposNfTABELA: TStringField;
    cdsCamposNfDESCRICAO_CAMP: TStringField;
    cdsCamposNfLINHA_CFG: TIntegerField;
    cdsCamposNfCOLUNA_CFG: TIntegerField;
    cdsCamposNfCONDENSADO: TIntegerField;
    cdsCamposNfMAXLINHAS: TIntegerField;
    cdsCamposNfNEGRITO: TIntegerField;
    cdsCamposNfTAMANHO_CAMPO: TIntegerField;
    cdsConfignfTAMANHO_CAMPO: TIntegerField;
    cdsItensConfignfIMP: TIntegerField;
    qrItensConfignfCODIGO: TIntegerField;
    qrItensConfignfDESCRICAO: TIBStringField;
    qrItensConfignfORDEM: TIntegerField;
    qrItensConfignfATIVO: TIntegerField;
    qrItensConfignfIMP: TIntegerField;
    cdsCamposNfORDEM_CFG: TIntegerField;
    procedure cdsCabecalhonfBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConfigNf: TdtmConfigNf;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TdtmConfigNf.cdsCabecalhonfBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet),Self);
end;

procedure TdtmConfigNf.DataModuleCreate(Sender: TObject);
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
