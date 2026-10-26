unit UDtmEquipamentos;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBQuery, IBCustomDataSet, IBStoredProc,
  DBClient, RDprint, Provider;
type
  TDtmEquipamentos = class(TDataModule)
    IBTransEquipamentos: TIBTransaction;
    qrEquipamentos: TIBQuery;
    qrBuscasEquip: TIBQuery;
    dspEquipamentos: TDataSetProvider;
    cdsEquipamentos: TClientDataSet;
    dsEquipamentos: TDataSource;
    SpIncCodigo: TIBStoredProc;
    RdpCadEquip: TRDprint;
    cdsEquipamentosCOD_EQUIP: TIntegerField;
    cdsEquipamentosCOD_EMPRESA: TIntegerField;
    cdsEquipamentosDAT_CAD_EQUI: TDateTimeField;
    cdsEquipamentosESTADO_EQUI: TMemoField;
    cdsEquipamentosTIP_EQUIP: TStringField;
    cdsEquipamentosVLR_EQUI: TFloatField;
    cdsEquipamentosIND_DEPREC: TFloatField;
    cdsEquipamentosCOD_DEPART: TIntegerField;
    cdsEquipamentosCOD_PROP: TIntegerField;
    cdsEquipamentosNOM_EQUIP: TStringField;
    cdsEquipamentosN_SERIE: TStringField;
    cdsEquipamentosMARCA: TStringField;
    cdsEquipamentosMODELO: TStringField;
    cdsEquipamentosCOR: TStringField;
    cdsEquipamentosATIVO: TIntegerField;
    cdsEquipamentosCOD_MARCA: TIntegerField;
    cdsEquipamentosIDENTIFICACAO: TStringField;
    cdsEquipamentosN_SERIE_FAB: TStringField;
    cdsEquipamentosN_MEMORIA_FISCAL: TStringField;
    qrLocProprietario: TIBQuery;
    qrLocDepartamento: TIBQuery;
    dsLocProprietario: TDataSource;
    dsLocDepartamento: TDataSource;
    qrLocDepartamentoCOD_DEPTO: TIntegerField;
    qrLocDepartamentoNOME_DEPTO: TIBStringField;
    dspDepreciacao: TDataSetProvider;
    qrDepreciacao: TIBQuery;
    cdsDepreciacao: TClientDataSet;
    dsDepreciacao: TDataSource;
    cdsDepreciacaoCOD_EQUIP: TIntegerField;
    cdsDepreciacaoMES: TIntegerField;
    cdsDepreciacaoANO: TIntegerField;
    cdsDepreciacaoCOD_EMPRESA: TIntegerField;
    cdsDepreciacaoVALOR_DEPRECI: TFloatField;
    cdsDepreciacaoDATA_DEPRECI: TDateTimeField;
    cdsDepreciacaoATIVO: TIntegerField;
    dspManuEquip: TDataSetProvider;
    qrManuEquip: TIBQuery;
    cdsManuEquip: TClientDataSet;
    dsManuEquip: TDataSource;
    cdsManuEquipCOD_MANUTENCAO: TIntegerField;
    cdsManuEquipCOD_EMPRESA: TIntegerField;
    cdsManuEquipCOD_EQUIP: TIntegerField;
    cdsManuEquipCODIGO_F: TIntegerField;
    cdsManuEquipNOME_FORNECEDOR: TStringField;
    cdsManuEquipDESCRICAO: TStringField;
    cdsManuEquipCUSTO_MANUTEN: TFloatField;
    cdsManuEquipDAT_ENTRADA: TDateTimeField;
    cdsManuEquipDAT_PREV_SAIDA: TDateTimeField;
    cdsManuEquipDATA_LANCAMENTO: TDateTimeField;
    cdsManuEquipDATA_ENVIO_CAIXA: TDateTimeField;
    cdsManuEquipCOD_CONTRP: TIntegerField;
    cdsManuEquipATIVO: TIntegerField;
    dspCPManutEq: TDataSetProvider;
    qrCPManutEq: TIBQuery;
    cdsCPManutEq: TClientDataSet;
    dsCPManutEq: TDataSource;
    cdsCPManutEqCOD_CONTRP: TIntegerField;
    cdsCPManutEqNUM_NOTA_NFE: TIntegerField;
    cdsCPManutEqCOD_FORN_NFE: TIntegerField;
    cdsCPManutEqCODIGO_CTRL: TIntegerField;
    cdsCPManutEqN_CONTA_PLC: TFloatField;
    cdsCPManutEqNOME_FOR_CTP: TStringField;
    cdsCPManutEqDATA_ENT_CTP: TDateTimeField;
    cdsCPManutEqN_DOC_CTP: TStringField;
    cdsCPManutEqVALOR_CTP: TFloatField;
    cdsCPManutEqSTATUS_CTP: TStringField;
    cdsCPManutEqDATQ_CTP: TDateTimeField;
    cdsCPManutEqNATL_CTP: TStringField;
    cdsCPManutEqDATA_VENC_CTP: TDateTimeField;
    cdsCPManutEqTIPO_CTP: TStringField;
    cdsCPManutEqLOTE: TIntegerField;
    cdsCPManutEqTIPO_FOR_DUP: TStringField;
    cdsCPManutEqSUBT_FOR_DUP: TStringField;
    cdsCPManutEqSELEC: TStringField;
    cdsCPManutEqHISTORICO_CTP: TStringField;
    cdsCPManutEqDATA_CXL: TDateTimeField;
    cdsCPManutEqTIP_CNT: TStringField;
    cdsCPManutEqN_CHEQ_CTP: TStringField;
    cdsCPManutEqNOMINAL_CTP: TStringField;
    cdsCPManutEqDT_COMPENS: TDateTimeField;
    cdsCPManutEqCHASSI_CONC: TStringField;
    cdsCPManutEqDATA_BAIXA: TDateTimeField;
    cdsCPManutEqVALOR_PAGO: TFloatField;
    cdsCPManutEqACEITE_CTP: TStringField;
    cdsCPManutEqVL_CONTABIL: TFloatField;
    cdsCPManutEqCODIGO_EMP: TIntegerField;
    cdsCPManutEqCPF_CGC_F: TStringField;
    cdsCPManutEqCOD_EMP_MULT: TIntegerField;
    cdsCPManutEqNOME_BANCO_DUPL: TStringField;
    cdsCPManutEqSTATUS_HONDA: TStringField;
    qrLocEquip: TIBQuery;
    dspLocEquip: TDataSetProvider;
    cdsLocEquip: TClientDataSet;
    dsLocEquip: TDataSource;
    cdsLocEquipCOD_EQUIP: TIntegerField;
    cdsLocEquipNOM_EQUIP: TStringField;
    cdsLocEquipN_SERIE: TStringField;
    cdsLocEquipMARCA: TStringField;
    cdsLocEquipMODELO: TStringField;
    cdsManuEquipNUM_DOC_DESP: TStringField;
    qrDadosBalanco: TIBQuery;
    DtDadosDRE: TDataSource;
    qrDadosBalancoCODSEQ_BALANCO: TIntegerField;
    qrDadosBalancoTIPO_BALANCO: TIBStringField;
    qrDadosBalancoCODIGO_INT_BAL: TIBStringField;
    qrDadosBalancoDESC_BALANCO: TIBStringField;
    qrDadosBalancoATIVO: TIntegerField;
    qrDadosBalancoSUBTIPO: TIBStringField;
    qrDadosBalancoSINAL: TIBStringField;
    qrDadosBalancoPRAZOINICIAL: TIntegerField;
    qrDadosBalancoPRAZOFINAL: TIntegerField;
    cdsEquipamentosCODSEQ_BALANCO: TIntegerField;
    cdsEquipamentosTIPEQUIP: TStringField;
    cdsEquipamentosIDENT_MERC: TStringField;
    cdsEquipamentosCOD_PRNC: TIntegerField;
    cdsEquipamentosNR_PARC: TSmallintField;
    cdsEquipamentosCOD_CCUS: TSmallintField;
    cdsEquipamentosFUNC: TMemoField;
    cdsEquipamentosVIDA_UTIL: TSmallintField;
    cdsEquipamentosSPED: TStringField;
    cdsEquipamentosCOD_CTA_EQ: TStringField;
    cdsEquipamentosTIPOOSVINC: TStringField;
    cdsEquipamentosCOMCONTRATO: TStringField;
    cdsEquipamentosSTATUS_V: TStringField;
    cdsEquipamentosDATA_VEN: TDateTimeField;
    cdsEquipamentosCOD_ESTMOTO: TIntegerField;
    cdsEquipamentosCOD_NF_ENT: TIntegerField;
    cdsEquipamentosNITEM_ENT: TIntegerField;
    cdsEquipamentosCOD_NF_SAI: TIntegerField;
    cdsEquipamentosNITEM_SAI: TIntegerField;
    cdsEquipamentosUS_CAD: TIntegerField;
    qrServicosSugeridos: TIBQuery;
    dspServicosSugeridos: TDataSetProvider;
    cdsServicosSugeridos: TClientDataSet;
    StringField12: TStringField;
    cdsServicosSugeridosCODIGO: TIntegerField;
    cdsServicosSugeridosDESCRICAO: TStringField;
    dsServicosSugeridos: TDataSource;
    cdsServicosSugeridosINTERV_MES_SERV: TIntegerField;
    cdsEquipamentosPORTARIA_MODELO: TStringField;
    cdsEquipamentosNOME_PROPRIETARIO: TStringField;
    cdsEquipamentosRAZAO_PROPRIETARIO: TStringField;
    cdsEquipamentosENDERECO_PROPRIETARIO: TStringField;
    cdsEquipamentosFONE_PROPRIETARIO: TStringField;
    cdsEquipamentosCELULAR_PROPRIETARIO: TStringField;
    cdsEquipamentosEMAIL_PROPRIETARIO: TStringField;
    cdsEquipamentosSIGLA_PROPRIETARIO: TStringField;
    cdsEquipamentosCIDADE_PROPRIETARIO: TStringField;
    cdsEquipamentosLOCALIDADE_PROPRIETARIO: TStringField;
    cdsEquipamentosSETOR_PROPRIETARIO: TStringField;
    cdsEquipamentosBAIRRO_PROPRIETARIO: TStringField;
    cdsEquipamentosCEP_PROPRIETARIO: TStringField;
    cdsEquipamentosNUM_END_PROPRIETARIO: TStringField;
    cdsEquipamentosSEL: TStringField;
    procedure cdsEquipamentosFUNCGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsEquipamentosESTADO_EQUIGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsEquipamentosBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmEquipamentos: TDtmEquipamentos;

implementation
uses uDtmAtivo;

{$R *.dfm}

procedure TDtmEquipamentos.cdsEquipamentosBeforeOpen(DataSet: TDataSet);
begin
 dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmEquipamentos.cdsEquipamentosESTADO_EQUIGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
Text:= Copy (StringReplace(cdsEquipamentosESTADO_EQUI.AsString,''#$D#$A'',' | ',[rfReplaceAll, rfIgnoreCase]), 1, 300);
end;

procedure TDtmEquipamentos.cdsEquipamentosFUNCGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
Text:= Copy (StringReplace(cdsEquipamentosFUNC.AsString,''#$D#$A'',' | ',[rfReplaceAll, rfIgnoreCase]), 1, 300);
end;

procedure TDtmEquipamentos.DataModuleCreate(Sender: TObject);
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
