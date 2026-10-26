unit uDtmOrdemCarregamento;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBQuery, IBDatabase,
  IBCustomDataSet, IBStoredProc, RDprint;

type
  TdtmOrdemCarregamento = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    qrSetor: TIBQuery;
    dspSetor: TDataSetProvider;
    cdsSetor: TClientDataSet;
    dsSetor: TDataSource;
    qrLocalidade: TIBQuery;
    dspLocalidade: TDataSetProvider;
    cdsLocalidade: TClientDataSet;
    dsLocalidade: TDataSource;
    cdsSetorCOD_EMPRESA: TIntegerField;
    cdsSetorATIVO: TSmallintField;
    cdsLocalidadeCOD_LOCALIDADE: TIntegerField;
    cdsLocalidadeCOD_EMPRESA: TIntegerField;
    cdsLocalidadeLOCALIDADE: TStringField;
    cdsLocalidadeCOD_CIDADE: TIntegerField;
    cdsLocalidadeCOD_ESTADO: TIntegerField;
    cdsLocalidadeATIVO: TSmallintField;
    cdsSetorCOD_VENDEDOR: TIntegerField;
    qrColab: TIBQuery;
    dspColab: TDataSetProvider;
    cdsColab: TClientDataSet;
    dsColab: TDataSource;
    cdsColabCOD_VENDEDOR: TIntegerField;
    cdsColabNOME_VENDEDOR: TStringField;
    cdsSetorNOME_VENDEDOR: TStringField;
    qrSetorCons: TIBQuery;
    dspSetorCons: TDataSetProvider;
    cdsSetorCons: TClientDataSet;
    dsSetorCons: TDataSource;
    cdsSetorConsCOD_EMPRESA: TIntegerField;
    cdsSetorConsCOD_VENDEDOR: TIntegerField;
    cdsSetorConsATIVO: TSmallintField;
    cdsSetorConsNOME_VENDEDOR: TStringField;
    cdsLocalidadeNOME_VENDEDOR: TStringField;
    cdsLocalidadeNOME_CIDADE: TStringField;
    cdsLocalidadeSIGLA_UF: TStringField;
    cdsSetorCOD_SETOR: TIntegerField;
    cdsSetorSETOR: TStringField;
    cdsSetorConsCOD_SETOR: TIntegerField;
    cdsSetorConsSETOR: TStringField;
    cdsLocalidadeCOD_SETOR: TIntegerField;
    cdsLocalidadeSETOR: TStringField;
    qrCid: TIBQuery;
    dspCid: TDataSetProvider;
    cdsCid: TClientDataSet;
    dsCid: TDataSource;
    cdsCidCOD_CIDADE: TIntegerField;
    cdsCidNOME_CIDADE: TStringField;
    qrEst: TIBQuery;
    dspEst: TDataSetProvider;
    cdsEst: TClientDataSet;
    dsEst: TDataSource;
    cdsEstCODIGO_UF: TIntegerField;
    cdsEstSIGLA_UF: TStringField;
    qrVeicTr: TIBQuery;
    dspVeicTr: TDataSetProvider;
    cdsVeicTr: TClientDataSet;
    dsVeicTr: TDataSource;
    cdsVeicTrCOD_VEIC: TIntegerField;
    cdsVeicTrCOD_EMPRESA: TIntegerField;
    cdsVeicTrPLACA: TStringField;
    cdsVeicTrMODELO: TStringField;
    cdsVeicTrPESO_MAXIMO: TFloatField;
    cdsVeicTrCOD_VENDEDOR: TIntegerField;
    cdsVeicTrATIVO: TSmallintField;
    cdsVeicTrNOME_VENDEDOR: TStringField;
    qrCarga: TIBQuery;
    dspCarga: TDataSetProvider;
    cdsCarga: TClientDataSet;
    dsCarga: TDataSource;
    cdsCargaCOD_CARGA: TIntegerField;
    cdsCargaCOD_EMPRESA: TIntegerField;
    cdsCargaDESCRICAO: TStringField;
    cdsCargaCOD_SETOR: TIntegerField;
    cdsCargaSTATUS: TStringField;
    cdsCargaCOD_VEIC: TIntegerField;
    cdsCargaCOD_MOTORISTA: TIntegerField;
    cdsCargaCOD_FATURISTA: TIntegerField;
    cdsCargaCOD_CONFERENTE: TIntegerField;
    cdsCargaAJUDANTES: TMemoField;
    cdsCargaDATA_CADASTRO: TDateTimeField;
    cdsCargaDATA_CARREGAMENTO: TDateTimeField;
    cdsCargaDATA_FECHAMENTO: TDateTimeField;
    cdsCargaPESO_MAX: TFloatField;
    cdsCargaPESO_CARGA: TFloatField;
    cdsCargaTIPO_ENTREGA: TStringField;
    cdsCargaSETOR: TStringField;
    cdsCargaMODELO: TStringField;
    cdsCargaNOME_VENDEDOR: TStringField;
    cdsCargaNOME_VENDEDOR_F: TStringField;
    cdsCargaNOME_VENDEDOR_E: TStringField;
    qrCargaIt: TIBQuery;
    dspCargaIt: TDataSetProvider;
    cdsCargaIt: TClientDataSet;
    dsCargaIt: TDataSource;
    cdsCargaItCOD_CARGA: TIntegerField;
    cdsCargaItCOD_EMPRESA: TIntegerField;
    cdsCargaItNITEM: TIntegerField;
    cdsCargaItGRUPO_PROD: TIntegerField;
    cdsCargaItCOD_PROD: TStringField;
    cdsCargaItDESCRICAO: TStringField;
    cdsCargaItCOD_VENDA: TIntegerField;
    cdsCargaItNITEM_VENDA: TIntegerField;
    cdsCargaItTIPO_VENDA: TStringField;
    cdsCargaItQUANTIDADE_VENDA: TFloatField;
    qrCargaItH: TIBQuery;
    dspCargaItH: TDataSetProvider;
    cdsCargaItH: TClientDataSet;
    dsCargaItH: TDataSource;
    cdsCargaItHCOD_CARGA: TIntegerField;
    cdsCargaItHCOD_EMPRESA: TIntegerField;
    cdsCargaItHNITEM: TIntegerField;
    cdsCargaItHNITEM_H: TIntegerField;
    cdsCargaItHQUANTIDADE_ENTREGUE: TFloatField;
    cdsCargaItHDATA_ENTREGA: TDateTimeField;
    cdsCargaItNUM_FAB_PROD: TStringField;
    qrSetorCons2: TIBQuery;
    dspSetorCons2: TDataSetProvider;
    dsSetorCons2: TDataSource;
    qrLocalCons2: TIBQuery;
    dspLocalCons2: TDataSetProvider;
    dsLocalCons2: TDataSource;
    cdsLocalCons2: TClientDataSet;
    cdsLocalCons2COD_LOCALIDADE: TIntegerField;
    cdsLocalCons2LOCALIDADE: TStringField;
    cdsLocalCons2SETOR: TStringField;
    cdsLocalCons2NOME_VENDEDOR: TStringField;
    cdsLocalCons2NOME_CIDADE: TStringField;
    cdsLocalCons2SIGLA_UF: TStringField;
    cdsLocalCons2COD_SETOR: TIntegerField;
    cdsLocalCons2COD_CIDADE: TIntegerField;
    cdsLocalCons2COD_ESTADO: TIntegerField;
    cdsLocalCons2COD_EMPRESA: TIntegerField;
    cdsLocalCons2ATIVO: TSmallintField;
    cdsSetorCons2: TClientDataSet;
    cdsSetorCons2COD_SETOR: TIntegerField;
    cdsSetorCons2SETOR: TStringField;
    cdsSetorCons2NOME_VENDEDOR: TStringField;
    cdsSetorCons2COD_VENDEDOR: TIntegerField;
    cdsSetorCons2COD_EMPRESA: TIntegerField;
    cdsSetorCons2ATIVO: TSmallintField;
    qrVeicTrCons2: TIBQuery;
    dspVeicTrCons2: TDataSetProvider;
    cdsVeicTrCons2: TClientDataSet;
    cdsVeicTrCons2COD_VEIC: TIntegerField;
    cdsVeicTrCons2PLACA: TStringField;
    cdsVeicTrCons2MODELO: TStringField;
    cdsVeicTrCons2PESO_MAXIMO: TFloatField;
    cdsVeicTrCons2NOME_VENDEDOR: TStringField;
    cdsVeicTrCons2COD_VENDEDOR: TIntegerField;
    cdsVeicTrCons2ATIVO: TSmallintField;
    cdsVeicTrCons2COD_EMPRESA: TIntegerField;
    dsVeicTrCons2: TDataSource;
    qrColabCons2: TIBQuery;
    dspColabCons2: TDataSetProvider;
    cdsColabCons2: TClientDataSet;
    cdsColabCons2COD_VENDEDOR: TIntegerField;
    cdsColabCons2NOME_VENDEDOR: TStringField;
    dsColabCons2: TDataSource;
    cdsCargaItPESO_UN: TFloatField;
    cdsCargaItPESO_TOTAL: TFloatField;
    cdsCargaItNUM_VENDA: TIntegerField;
    cdsCargaItENTREGUE: TStringField;
    cdsCargaPESO_ENTREGUE: TFloatField;
    cdsCargaPESO_PENDENTE: TFloatField;
    cdsCargaItSEL: TStringField;
    cdsCargaCONFERIR: TStringField;
    cdsCargaItPEND: TStringField;
    cdsCargaItHDATA_CARREGAMENTO: TDateTimeField;
    cdsCargaItHDATA_HORA_CARREGAMENTO: TDateTimeField;
    cdsCargaItHTIPO_ENTREGA: TStringField;
    cdsCargaItHCOD_ENTREGA: TIntegerField;
    qrBuscas2: TIBQuery;
    qrBuscas3: TIBQuery;
    qrEntr: TIBQuery;
    dspEntr: TDataSetProvider;
    cdsEntr: TClientDataSet;
    dsEntr: TDataSource;
    cdsEntrCOD_ENTREGA: TIntegerField;
    cdsEntrDATA_ENTREGA: TDateTimeField;
    cdsEntrDATA_CARREGAMENTO: TDateTimeField;
    cdsEntrSEL: TStringField;
    cdsSetorCons2SEL: TStringField;
    cdsLocalCons2SEL: TStringField;
    qrCl: TIBQuery;
    dspCl: TDataSetProvider;
    cdsCl: TClientDataSet;
    dsCl: TDataSource;
    cdsClCOD_CLIENTE: TIntegerField;
    cdsClNOME_CLIENTE: TStringField;
    cdsClRAZAO: TStringField;
    cdsClCPFCGC: TStringField;
    cdsClSEL: TStringField;
    cdsClCOD_LOCALIDADE: TIntegerField;
    cdsClTemp: TClientDataSet;
    cdsClTempCOD_CLIENTE: TIntegerField;
    cdsClTempNOME_CLIENTE: TStringField;
    cdsClTempRAZAO: TStringField;
    cdsClTempCPFCGC: TStringField;
    dsClTemp: TDataSource;
    qrVendasCons: TIBQuery;
    dspVendasCons: TDataSetProvider;
    cdsVendasCons: TClientDataSet;
    dsVendasCons: TDataSource;
    cdsVendasConsNUM_VENDA: TIntegerField;
    cdsVendasConsCOD_CLIENTE: TIntegerField;
    cdsVendasConsNOME_CLIENTE: TStringField;
    cdsVendasConsDATA_VENDA: TDateTimeField;
    cdsVendasConsVALOR_TOTAL: TFloatField;
    cdsVendasConsCOD_VENDA: TIntegerField;
    cdsVendasConsTIPO: TStringField;
    cdsVendasConsRAZAO: TStringField;
    cdsVendasConsSEL: TStringField;
    cdsVndTemp: TClientDataSet;
    dsVndTemp: TDataSource;
    cdsVndTempNUM_VENDA: TIntegerField;
    cdsVndTempNOME_CLIENTE: TStringField;
    cdsVndTempRAZAO: TStringField;
    cdsVndTempDATA_VENDA: TDateTimeField;
    cdsVndTempVALOR_TOTAL: TFloatField;
    cdsVndTempCOD_VENDA: TIntegerField;
    cdsVndTempTIPO: TStringField;
    cdsVndTempCOD_CLIENTE: TIntegerField;
    dsCargaItTemp: TDataSource;
    cdsCargaItTemp: TClientDataSet;
    cdsCargaItTempCOD_CARGA: TIntegerField;
    cdsCargaItTempCOD_EMPRESA: TIntegerField;
    cdsCargaItTempNITEM: TIntegerField;
    cdsCargaItTempGRUPO_PROD: TIntegerField;
    cdsCargaItTempCOD_PROD: TStringField;
    cdsCargaItTempNUM_FAB_PROD: TStringField;
    cdsCargaItTempDESCRICAO: TStringField;
    cdsCargaItTempCOD_VENDA: TIntegerField;
    cdsCargaItTempNUM_VENDA: TIntegerField;
    cdsCargaItTempNITEM_VENDA: TIntegerField;
    cdsCargaItTempTIPO_VENDA: TStringField;
    cdsCargaItTempQUANTIDADE_VENDA: TFloatField;
    cdsCargaItTempPESO_UN: TFloatField;
    cdsCargaItTempENTREGUE: TStringField;
    cdsCargaItTempPESO_TOTAL: TFloatField;
    cdsCargaTIPO_CARGA: TStringField;
    qrCargabkp: TIBQuery;
    dspCargabkp: TDataSetProvider;
    cdsCargabkp: TClientDataSet;
    cdsCargabkpCOD_CARGA: TIntegerField;
    cdsCargabkpDESCRICAO: TStringField;
    cdsCargabkpSTATUS: TStringField;
    cdsCargabkpAJUDANTES: TMemoField;
    cdsCargabkpDATA_CADASTRO: TDateTimeField;
    cdsCargabkpDATA_CARREGAMENTO: TDateTimeField;
    cdsCargabkpDATA_FECHAMENTO: TDateTimeField;
    cdsCargabkpPESO_MAX: TFloatField;
    cdsCargabkpPESO_CARGA: TFloatField;
    cdsCargabkpTIPO_ENTREGA: TStringField;
    cdsCargabkpSETOR: TStringField;
    cdsCargabkpMODELO: TStringField;
    cdsCargabkpNOME_VENDEDOR: TStringField;
    cdsCargabkpNOME_VENDEDOR_F: TStringField;
    cdsCargabkpNOME_VENDEDOR_E: TStringField;
    cdsCargabkpCOD_SETOR: TIntegerField;
    cdsCargabkpCOD_VEIC: TIntegerField;
    cdsCargabkpCOD_MOTORISTA: TIntegerField;
    cdsCargabkpCOD_FATURISTA: TIntegerField;
    cdsCargabkpCOD_CONFERENTE: TIntegerField;
    cdsCargabkpCOD_EMPRESA: TIntegerField;
    cdsCargabkpPESO_ENTREGUE: TFloatField;
    cdsCargabkpPESO_PENDENTE: TFloatField;
    cdsCargabkpCONFERIR: TStringField;
    cdsCargabkpTIPO_CARGA: TStringField;
    qrCargaItbkp: TIBQuery;
    dspCargaItbkp: TDataSetProvider;
    cdsCargaItbkp: TClientDataSet;
    cdsCargaItbkpCOD_CARGA: TIntegerField;
    cdsCargaItbkpCOD_EMPRESA: TIntegerField;
    cdsCargaItbkpNITEM: TIntegerField;
    cdsCargaItbkpGRUPO_PROD: TIntegerField;
    cdsCargaItbkpCOD_PROD: TStringField;
    cdsCargaItbkpNUM_FAB_PROD: TStringField;
    cdsCargaItbkpDESCRICAO: TStringField;
    cdsCargaItbkpCOD_VENDA: TIntegerField;
    cdsCargaItbkpNUM_VENDA: TIntegerField;
    cdsCargaItbkpNITEM_VENDA: TIntegerField;
    cdsCargaItbkpTIPO_VENDA: TStringField;
    cdsCargaItbkpQUANTIDADE_VENDA: TFloatField;
    cdsCargaItbkpPESO_UN: TFloatField;
    cdsCargaItbkpPESO_TOTAL: TFloatField;
    cdsCargaItbkpENTREGUE: TStringField;
    cdsCargaItbkpSEL: TStringField;
    cdsCargaItbkpPEND: TStringField;
    qrCargaItHbkp: TIBQuery;
    dspCargaItHbkp: TDataSetProvider;
    cdsCargaItHbkp: TClientDataSet;
    cdsCargaItHbkpCOD_CARGA: TIntegerField;
    cdsCargaItHbkpCOD_EMPRESA: TIntegerField;
    cdsCargaItHbkpNITEM: TIntegerField;
    cdsCargaItHbkpNITEM_H: TIntegerField;
    cdsCargaItHbkpQUANTIDADE_ENTREGUE: TFloatField;
    cdsCargaItHbkpTIPO_ENTREGA: TStringField;
    cdsCargaItHbkpDATA_ENTREGA: TDateTimeField;
    cdsCargaItHbkpDATA_CARREGAMENTO: TDateTimeField;
    cdsCargaItHbkpDATA_HORA_CARREGAMENTO: TDateTimeField;
    cdsCargaItHbkpCOD_ENTREGA: TIntegerField;
    cdsTempSoma: TClientDataSet;
    cdsTempSomaCODIGO: TIntegerField;
    cdsTempSomaDESCRICAO: TStringField;
    cdsTempSomaVALOR: TFloatField;
    cdsCargaSTATUS_FIN: TStringField;
    cdsCargaDATA_SAIDA: TDateTimeField;
    cdsVeicTrTARA: TFloatField;
    cdsVeicTrCAPM3: TFloatField;
    cdsVeicTrREBOQUE: TStringField;
    cdsVeicTrTERCEIRO: TStringField;
    cdsVeicTrRNTRC_TERCEIRO: TIntegerField;
    cdsVeicTrCOD_PROP_TERCEIRO: TIntegerField;
    cdsVeicTrTPPROP_TERCEIRO: TSmallintField;
    cdsVeicTrTPROD: TSmallintField;
    cdsVeicTrTPCAR: TSmallintField;
    cdsVeicTrUF_LICENCIADO: TStringField;
    qrTerc: TIBQuery;
    dspTerc: TDataSetProvider;
    cdsTerc: TClientDataSet;
    cdsTercNOME_CLIENTE: TStringField;
    cdsTercRAZAO: TStringField;
    cdsTercCOD_CLIENTE: TIntegerField;
    cdsTercCPFCGC: TStringField;
    dsTerc: TDataSource;
    cdsCargaItPREC_CUS_PROD: TFloatField;
    cdsCargaItPREC_CUSM_PROD: TFloatField;
    cdsCargaItPREC_TAB_PROD: TFloatField;
    cdsCargaItPREC_PUBLICO: TFloatField;
    cdsCargaItPREC_30_PROD: TFloatField;
    cdsCargaItPREC_60_PROD: TFloatField;
    cdsCargaItPREC_90_PROD: TFloatField;
    cdsCargaItEST_F: TFloatField;
    rdpOrdem: TRDprint;
    cdsCargaCOD_ROTA: TIntegerField;
    procedure cdsCargaAJUDANTESGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsCargaItHDATA_HORA_CARREGAMENTOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsSetorBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmOrdemCarregamento: TdtmOrdemCarregamento;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TdtmOrdemCarregamento.cdsCargaAJUDANTESGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Trim(TStringField(Sender).AsString) <> '' then
    Text := copy(TStringField(Sender).AsString,1,6)+'...'
  else
    Text := '';
end;

procedure TdtmOrdemCarregamento.cdsCargaItHDATA_HORA_CARREGAMENTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := FormatDateTime('hh:mm:ss',TDateTimeField(Sender).AsDateTime);
end;

procedure TdtmOrdemCarregamento.cdsSetorBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), dtmOrdemCarregamento);
end;

procedure TdtmOrdemCarregamento.DataModuleCreate(Sender: TObject);
var
  J, I: Integer;
begin
  for J := 0 to Self.ComponentCount - 1 do
    if (Self.Components[J] is TClientDataSet) and (TClientDataSet(Self.Components[J]).Tag = 1) then
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
