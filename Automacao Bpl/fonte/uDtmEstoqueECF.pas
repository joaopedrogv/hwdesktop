unit uDtmEstoqueECF;

interface

uses
  SysUtils, Classes, IBDatabase, DB, DBClient, Provider, IBQuery,
  IBCustomDataSet, IBStoredProc;

type
  TdtmEstoqueECF = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    qrEstECF: TIBQuery;
    dspEstEcf: TDataSetProvider;
    cdsEstECF: TClientDataSet;
    dsEstECF: TDataSource;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    cdsEstECFN_SERIE_FAB: TStringField;
    cdsEstECFCOD_EMPRESA: TIntegerField;
    cdsEstECFIDENTIFICACAO: TStringField;
    cdsEstECFTIPO_ECF: TStringField;
    cdsEstECFMARCA_ECF: TStringField;
    cdsEstECFMODELO_ECF: TStringField;
    cdsEstECFVERSAOSB: TStringField;
    cdsEstECFN_MEMORIA_FISCAL: TStringField;
    cdsEstECFLACRE_EXTERNO1: TStringField;
    cdsEstECFLACRE_EXTERNO2: TStringField;
    cdsEstECFLACRE_EXTERNO3: TStringField;
    cdsEstECFLACRE_EXTERNO4: TStringField;
    cdsEstECFSTATUS: TStringField;
    cdsEstECFNREQ: TIntegerField;
    cdsEstECFNNF: TIntegerField;
    cdsEstECFSERIE: TStringField;
    cdsEstECFNNF_ENTRADA: TIntegerField;
    cdsEstECFSERIE_ENTRADA: TStringField;
    cdsEstECFCOD_FORNECEDOR: TIntegerField;
    cdsEstECFCOD_PROD: TStringField;
    cdsEstECFGRUPO_PROD: TIntegerField;
    cdsEstECFATIVO: TIntegerField;
    cdsEstECFHOUVE_INTERVENCAO: TStringField;
    cdsEstECFUSO_PROPRIO: TStringField;
    cdsEstECFTIPO_DISPOSITIVO: TStringField;
    cdsEstECFNUM_DISP_PROT_SB: TStringField;
    cdsEstECFLACRE_MFD: TStringField;
    dsCNIEE: TDataSource;
    cdsCNIEE: TClientDataSet;
    cdsCNIEEIDENTIFICACAO: TStringField;
    cdsCNIEETIPO_ECF: TStringField;
    cdsCNIEEMARCA_ECF: TStringField;
    cdsCNIEEMODELO_ECF: TStringField;
    cdsCNIEEVERSAOSB: TStringField;
    cdsCNIEEQTDELACRESEXTSL: TIntegerField;
    cdsCNIEEQTDELACRESEXTFAB: TIntegerField;
    cdsCNIEETEMFD: TStringField;
    cdsCNIEELACREMFD: TStringField;
    cdsCNIEEATO_APROVACAO: TStringField;
    cdsCNIEEATIVO: TIntegerField;
    dspCNIEE: TDataSetProvider;
    qrCNIEE: TIBQuery;
    cdsEstECFCOD_CLIENTE_INICIALIZACAO: TIntegerField;
    cdsEstECFDATA_INICIALIZACAO: TDateTimeField;
    cdsEstECFCHAVE_PUBLICA: TStringField;
    cdsEstECFCHAVE_PRIVADA: TStringField;
    cdsEstECFTIPO: TStringField;
    cdsEstECFCOD_NSERIE: TIntegerField;
    cdsEstECFNCUPOM: TIntegerField;
    cdsEstECFCOD_TERMINAL: TIntegerField;
    cdsEstECFNSERIETERMINAL: TStringField;
    cdsEstECFNPED: TIntegerField;
    cdsEstECFTIPO_PED: TStringField;
    procedure cdsEstECFBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmEstoqueECF: TdtmEstoqueECF;

implementation

uses uDtmAtivo;

{$R *.dfm}

procedure TdtmEstoqueECF.cdsEstECFBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet),dtmEstoqueECF);
end;

procedure TdtmEstoqueECF.DataModuleCreate(Sender: TObject);
var
  J, I: Integer;
begin
  for J := 0 to Self.ComponentCount - 1 do
    if Self.Components[J] is TClientDataSet then
      if TClientDataSet(Self.Components[J]).Tag = 1 then
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
