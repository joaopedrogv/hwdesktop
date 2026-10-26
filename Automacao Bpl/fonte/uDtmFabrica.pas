unit uDtmFabrica;

interface

uses
  SysUtils, Classes, IBQuery, IBDatabase, DB, IBCustomDataSet, IBStoredProc,
  RDprint, DBClient, Provider,uDtmAtivo;

type
  TdtmFabrica = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    RDprint1: TRDprint;
    qrBuscas1: TIBQuery;
    DspcomunicaAssohonda: TDataSetProvider;
    CdsComunicaAssohonda: TClientDataSet;
    QrComunicaAssohonda: TIBQuery;
    CdsComunicaAssohondaDATA_ARQUIVO: TDateTimeField;
    CdsComunicaAssohondaCOD_MODELO: TIntegerField;
    CdsComunicaAssohondaCOD_COR: TIntegerField;
    CdsComunicaAssohondaCOD_EMPRESA: TIntegerField;
    CdsComunicaAssohondaDESC_MODELO: TStringField;
    CdsComunicaAssohondaDESC_COR: TStringField;
    CdsComunicaAssohondaESTOQUEFISICO: TIntegerField;
    CdsComunicaAssohondaTRANSITO: TIntegerField;
    CdsComunicaAssohondaSALDOFATURAR: TIntegerField;
    CdsComunicaAssohondaPEDIDOFIRME: TIntegerField;
    CdsComunicaAssohondaCONFIRMADOHONDA: TIntegerField;
    CdsComunicaAssohondaPEDIDOADICIONAL: TIntegerField;
    CdsComunicaAssohondaCANCELAMENTO: TIntegerField;
    CdsComunicaAssohondaVENDASDIA: TIntegerField;
    CdsComunicaAssohondaVENDASACUMULADA: TIntegerField;
    CdsComunicaAssohondaSTATUS_RETORNO: TStringField;
    CdsComunicaAssohondaCOD_STATUS_RET: TIntegerField;
    DtcomunicaAssoHonda: TDataSource;
    CdsComunicaAssohondaORDTIPO: TIntegerField;
    CdsComunicaAssohondaCOD_STATUS_RETV: TIntegerField;
    CdsComunicaAssohondaSTATUS_RETORNOV: TStringField;
    QrTipoModelo: TIBQuery;
    QrTipoModeloCODIGO: TIntegerField;
    QrTipoModeloDESCRICAO: TIBStringField;
    QrTipoModeloORDTIPO: TIntegerField;
    Ibcodigocorfab: TIBQuery;
    IbcodigocorfabCOD_COR: TIntegerField;
    IbcodigocorfabDESCRICAO_COR: TIBStringField;
    DtTipoModelo: TDataSource;
    DtCodigoCorFab: TDataSource;
    CdsComunicaAssohondaTP_INCLUSAO: TStringField;
    procedure CdsComunicaAssohondaBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmFabrica: TdtmFabrica;

implementation

//uses
//  DBClient;

{$R *.dfm}

procedure TdtmFabrica.CdsComunicaAssohondaBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmFabrica.DataModuleCreate(Sender: TObject);
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
