unit uDtmInterventor;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBStoredProc, IBDatabase, IBQuery,
  DBClient, Provider;

type
  TdtmInterventor = class(TDataModule)
    dspAtestado: TDataSetProvider;
    cdsAtestado: TClientDataSet;
    qrAtestado: TIBQuery;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    SpIncCodigo: TIBStoredProc;
    dsAtestado: TDataSource;
    dspImpCNIEE: TDataSetProvider;
    cdsImpCNIEE: TClientDataSet;
    qrImpCNIEE: TIBQuery;
    dsImpCNIEE: TDataSource;
    cdsAtestadoN_OS: TIntegerField;
    cdsAtestadoTIPO: TStringField;
    cdsAtestadoCOD_EQUIP: TIntegerField;
    cdsAtestadoCOD_EMPRESA: TIntegerField;
    cdsAtestadoLACRE_MFD: TStringField;
    cdsAtestadoACUMULADOS_ANTES: TMemoField;
    cdsAtestadoACUMULADOS_DEPOIS: TMemoField;
    cdsAtestadoLACRERETIRADO: TMemoField;
    cdsAtestadoCORRETIRADO: TMemoField;
    cdsAtestadoLACREAPLICADO: TMemoField;
    cdsAtestadoCORAPLICADO: TMemoField;
    cdsAtestadoLACREUTIL: TMemoField;
    cdsAtestadoCORUTIL: TMemoField;
    cdsAtestadoLOCALINTERVENCAO: TStringField;
    cdsAtestadoDATAINICIO: TDateTimeField;
    cdsAtestadoDATAFINAL: TDateTimeField;
    cdsAtestadoPERDADADOS_MT: TStringField;
    cdsAtestadoEMPRESA_INTER_ANT: TStringField;
    cdsAtestadoNUM_ATEST_INTER_ANT: TStringField;
    cdsAtestadoMOTIVO_INTERVENCAO: TStringField;
    cdsAtestadoSUBSTITUICAO_SB: TStringField;
    cdsAtestadoVERSAO_SB_ANT: TStringField;
    cdsAtestadoVERSAO_SB_ATUAL: TStringField;
    cdsAtestadoNUM_DISP_SB_ANT: TStringField;
    cdsAtestadoNUM_DISP_SB_ATUAL: TStringField;
    cdsAtestadoNUM_LACRE_SB_RET: TStringField;
    cdsAtestadoNUM_LACRE_SB_COLOCADO: TStringField;
    cdsAtestadoSERVICOS: TMemoField;
    cdsAtestadoN_NF_PROD: TIntegerField;
    cdsAtestadoN_NF_SERV: TIntegerField;
    cdsAtestadoTIPO_DISPOSITIVO: TStringField;
    cdsAtestadoATIVO: TIntegerField;
    cdsImpCNIEEIDENTIFICACAO: TStringField;
    cdsImpCNIEETIPO_ECF: TStringField;
    cdsImpCNIEEMARCA_ECF: TStringField;
    cdsImpCNIEEMODELO_ECF: TStringField;
    cdsImpCNIEEVERSAOSB: TStringField;
    cdsImpCNIEEQTDELACRESEXTSL: TIntegerField;
    cdsImpCNIEEQTDELACRESEXTFAB: TIntegerField;
    cdsImpCNIEETEMFD: TStringField;
    cdsImpCNIEELACREMFD: TStringField;
    cdsImpCNIEEATO_APROVACAO: TStringField;
    cdsImpCNIEEATIVO: TIntegerField;
    cdsAtestadoTOTALIZADORES: TMemoField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsAtestadoBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmInterventor: TdtmInterventor;

implementation

uses uDtmAtivo;

{$R *.dfm}

procedure TdtmInterventor.cdsAtestadoBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TdtmInterventor.DataModuleCreate(Sender: TObject);
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
