unit uDtmFollowUpPosAtendimento;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, IBQuery, IBDatabase,
  IBCustomDataSet, IBStoredProc;

type
  TdtmFollowUpPosAtendimento = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    qrFlwGrupo: TIBQuery;
    dspFlwGrupo: TDataSetProvider;
    cdsFlwGrupo: TClientDataSet;
    dsFlwGrupo: TDataSource;
    qrPergunta: TIBQuery;
    dspPergunta: TDataSetProvider;
    cdsPergunta: TClientDataSet;
    dsPergunta: TDataSource;
    qrPergCompl: TIBQuery;
    dspPergCompl: TDataSetProvider;
    cdsPergCompl: TClientDataSet;
    dsPergCompl: TDataSource;
    qrPefilPerg: TIBQuery;
    dspPerfilPerg: TDataSetProvider;
    cdsPerfilPerg: TClientDataSet;
    dsPerfilPerg: TDataSource;
    qrAtend: TIBQuery;
    dspAtend: TDataSetProvider;
    cdsAtend: TClientDataSet;
    dsAtend: TDataSource;
    qrPesquisa: TIBQuery;
    dspPesquisa: TDataSetProvider;
    cdsPesquisa: TClientDataSet;
    dsPesquisa: TDataSource;
    qrResposta: TIBQuery;
    dspResposta: TDataSetProvider;
    cdsResposta: TClientDataSet;
    dsResposta: TDataSource;
    qrRespCompl: TIBQuery;
    dspRespCompl: TDataSetProvider;
    cdsRespCompl: TClientDataSet;
    dsRespCompl: TDataSource;
    qrColab: TIBQuery;
    dspColab: TDataSetProvider;
    cdsColab: TClientDataSet;
    dsColab: TDataSource;
    cdsFlwGrupoCODGRUPO: TIntegerField;
    cdsFlwGrupoCOD_EMPRESA: TIntegerField;
    cdsFlwGrupoDESCRICAO: TStringField;
    cdsFlwGrupoCATEGORIA: TStringField;
    cdsFlwGrupoATIVO: TSmallintField;
    qrFlwGrCons: TIBQuery;
    dspFlwGrCons: TDataSetProvider;
    cdsFlwGrCons: TClientDataSet;
    dsFlwGrCons: TDataSource;
    cdsFlwGrConsCODGRUPO: TIntegerField;
    cdsFlwGrConsCOD_EMPRESA: TIntegerField;
    cdsFlwGrConsDESCRICAO: TStringField;
    cdsFlwGrConsCATEGORIA: TStringField;
    cdsFlwGrConsATIVO: TSmallintField;
    cdsPerguntaCODPERGUNTA: TIntegerField;
    cdsPerguntaCOD_EMPRESA: TIntegerField;
    cdsPerguntaCODGRUPO: TIntegerField;
    cdsPerguntaPERGUNTA: TStringField;
    cdsPerguntaSIMNAONIVEL: TStringField;
    cdsPerguntaCOMPLEMENTO: TStringField;
    cdsPerguntaATIVO: TSmallintField;
    cdsPerguntaDESCRICAO: TStringField;
    cdsPerguntaCATEGORIA: TStringField;
    cdsPergComplCODPERGCOMPL: TIntegerField;
    cdsPergComplCOD_EMPRESA: TIntegerField;
    cdsPergComplCODPERGUNTA: TIntegerField;
    cdsPergComplALTERNATIVA: TStringField;
    qrPergCons: TIBQuery;
    dspPergCons: TDataSetProvider;
    cdsPergCons: TClientDataSet;
    dsPergCons: TDataSource;
    cdsPergConsCODPERGUNTA: TIntegerField;
    cdsPergConsCOD_EMPRESA: TIntegerField;
    cdsPergConsCODGRUPO: TIntegerField;
    cdsPergConsPERGUNTA: TStringField;
    cdsPergConsSIMNAONIVEL: TStringField;
    cdsPergConsCOMPLEMENTO: TStringField;
    cdsPergConsATIVO: TSmallintField;
    cdsPergConsDESCRICAO: TStringField;
    cdsPergConsCATEGORIA: TStringField;
    cdsPerfilPergMem: TClientDataSet;
    cdsPerfilPergMemCODPERFIL: TIntegerField;
    cdsPerfilPergMemCODPERGUNTA: TIntegerField;
    cdsPerfilPergMemPERGUNTA: TStringField;
    cdsPerfilPergMemCOMPLEMENTO: TStringField;
    cdsPerfilPergMemDESCRICAO: TStringField;
    cdsPerfilPergMemCATEGORIA: TStringField;
    cdsPerfilPergCODPERFIL: TIntegerField;
    cdsPerfilPergCOD_EMPRESA: TIntegerField;
    cdsPerfilPergCODPERGUNTA: TIntegerField;
    dsPerfilPergMem: TDataSource;
    cdsAtendCODATENDIMENTO: TIntegerField;
    cdsAtendCOD_EMPRESA: TIntegerField;
    cdsAtendCOD_VENDEDOR: TIntegerField;
    cdsAtendCOD_CLIENTE: TIntegerField;
    cdsAtendDATA_ATEND: TDateTimeField;
    cdsAtendCATEGORIA: TStringField;
    cdsAtendATENDIMENTO: TMemoField;
    cdsAtendCODATENDIMENTOHWAUTO: TIntegerField;
    cdsAtendNOME_VENDEDOR: TStringField;
    cdsAtendNOME_CLIENTE: TStringField;
    cdsAtendATIVO: TSmallintField;
    cdsPesquisaCODPESQUISA: TIntegerField;
    cdsPesquisaCOD_EMPRESA: TIntegerField;
    cdsPesquisaCODPERFIL: TIntegerField;
    cdsPesquisaCOD_CLIENTE: TIntegerField;
    cdsPesquisaCOD_VENDEDOR: TIntegerField;
    cdsPesquisaCODPESQUISADOR: TIntegerField;
    cdsPesquisaDATAPESQUISA: TDateTimeField;
    cdsPesquisaHORAPESQUISA: TStringField;
    cdsPesquisaTIPO: TStringField;
    cdsPesquisaNPED: TIntegerField;
    cdsPesquisaTIPO_PED: TStringField;
    cdsPesquisaDATAFECHAMENTO: TDateTimeField;
    cdsPesquisaHORAFECHAMENTO: TStringField;
    cdsPesquisaNOME_CLIENTE: TStringField;
    cdsPesquisaSTATUS: TStringField;
    cdsPesquisaDADOS: TMemoField;
    cdsPesquisaCODATENDIMENTO: TIntegerField;
    qrCli: TIBQuery;
    dspCli: TDataSetProvider;
    cdsCli: TClientDataSet;
    dsCli: TDataSource;
    cdsCliCOD_CLIENTE: TIntegerField;
    cdsCliNOME_CLIENTE: TStringField;
    cdsCliRAZAO: TStringField;
    cdsCliFONE_CLIENTE: TStringField;
    cdsCliRAMAL: TStringField;
    cdsCliTEL_RES_CF: TStringField;
    cdsCliFAX: TStringField;
    cdsCliCONTATO: TStringField;
    cdsCliEMAIL: TStringField;
    qrPergPesq: TIBQuery;
    dspPergPesq: TDataSetProvider;
    dsPergPesq: TDataSource;
    cdsPergPesq: TClientDataSet;
    cdsPergPesqCODPERGUNTA: TIntegerField;
    cdsPergPesqCOD_EMPRESA: TIntegerField;
    cdsPergPesqCODGRUPO: TIntegerField;
    cdsPergPesqPERGUNTA: TStringField;
    cdsPergPesqSIMNAONIVEL: TStringField;
    cdsPergPesqCOMPLEMENTO: TStringField;
    cdsPergPesqATIVO: TSmallintField;
    cdsPergPesqDESCRICAO: TStringField;
    cdsPergPesqCATEGORIA: TStringField;
    qrPergComplPesq: TIBQuery;
    dspPergComplPesq: TDataSetProvider;
    dsPergComplPesq: TDataSource;
    cdsPergComplPesq: TClientDataSet;
    cdsPergComplPesqCODPERGCOMPL: TIntegerField;
    cdsPergComplPesqCOD_EMPRESA: TIntegerField;
    cdsPergComplPesqCODPERGUNTA: TIntegerField;
    cdsPergComplPesqALTERNATIVA: TStringField;
    qrGrupoPesq: TIBQuery;
    dspGrupoPesq: TDataSetProvider;
    dsGrupoPesq: TDataSource;
    cdsGrupoPesq: TClientDataSet;
    cdsGrupoPesqCODGRUPO: TIntegerField;
    cdsGrupoPesqCOD_EMPRESA: TIntegerField;
    cdsGrupoPesqDESCRICAO: TStringField;
    cdsGrupoPesqCATEGORIA: TStringField;
    cdsGrupoPesqATIVO: TSmallintField;
    qrPesquisaCons: TIBQuery;
    dspPesquisaCons: TDataSetProvider;
    dsPesquisaCons: TDataSource;
    cdsPesquisaCons: TClientDataSet;
    qrFlwPerfil: TIBQuery;
    dspFlwPerfil: TDataSetProvider;
    cdsFlwPerfil: TClientDataSet;
    cdsFlwPerfilCODPERFIL: TIntegerField;
    cdsFlwPerfilCOD_EMPRESA: TIntegerField;
    cdsFlwPerfilDESCRICAO: TStringField;
    cdsFlwPerfilTIPO: TStringField;
    cdsFlwPerfilATIVO: TSmallintField;
    dsFlwPerfil: TDataSource;
    qrPerfPesq: TIBQuery;
    dspPerfPesq: TDataSetProvider;
    dsPerfPesq: TDataSource;
    cdsPerfPesq: TClientDataSet;
    cdsPerfPesqCODPERFIL: TIntegerField;
    cdsPerfPesqCOD_EMPRESA: TIntegerField;
    cdsPerfPesqDESCRICAO: TStringField;
    cdsPerfPesqTIPO: TStringField;
    cdsPerfPesqATIVO: TSmallintField;
    cdsPerfilPergORDEM: TSmallintField;
    cdsPerfilPergMemORDEM: TSmallintField;
    cdsPergComplORDEM: TSmallintField;
    cdsPergComplPesqORDEM: TSmallintField;
    cdsPesquisaConsCODPESQUISA: TIntegerField;
    cdsPesquisaConsCOD_EMPRESA: TIntegerField;
    cdsPesquisaConsCODPERFIL: TIntegerField;
    cdsPesquisaConsCOD_CLIENTE: TIntegerField;
    cdsPesquisaConsCOD_VENDEDOR: TIntegerField;
    cdsPesquisaConsCODPESQUISADOR: TIntegerField;
    cdsPesquisaConsDATAPESQUISA: TDateTimeField;
    cdsPesquisaConsHORAPESQUISA: TStringField;
    cdsPesquisaConsTIPO: TStringField;
    cdsPesquisaConsCODATENDIMENTO: TIntegerField;
    cdsPesquisaConsNPED: TIntegerField;
    cdsPesquisaConsTIPO_PED: TStringField;
    cdsPesquisaConsDATAFECHAMENTO: TDateTimeField;
    cdsPesquisaConsHORAFECHAMENTO: TStringField;
    cdsPesquisaConsNOME_CLIENTE: TStringField;
    cdsPesquisaConsSTATUS: TStringField;
    cdsPesquisaConsDADOS: TMemoField;
    cdsPesquisaConsNOME_VENDEDOR: TStringField;
    cdsPesquisaConsNOME_PESQUISADOR: TStringField;
    cdsPesquisaConsDESCRICAO: TStringField;
    cdsPesquisaATIVO: TSmallintField;
    cdsPesquisaConsATIVO: TSmallintField;
    qrImpPesq: TIBQuery;
    dspImpPesq: TDataSetProvider;
    cdsImpPesq: TClientDataSet;
    cdsImpPesqTIPO: TStringField;
    cdsImpPesqCOD_VENDEDOR: TIntegerField;
    cdsImpPesqNOME_VENDEDOR: TStringField;
    cdsImpPesqCOD_CLIENTE: TIntegerField;
    cdsImpPesqNOME_CLIENTE: TStringField;
    cdsImpPesqCATEGORIA: TStringField;
    cdsImpPesqCODIGO: TIntegerField;
    cdsImpPesqDATA: TDateTimeField;
    cdsImpPesqOBS: TMemoField;
    qrItImpPesq: TIBQuery;
    dspItImpPesq: TDataSetProvider;
    dsItImpPesq: TDataSource;
    cdsItImpPesq: TClientDataSet;
    cdsItImpPesqID: TIntegerField;
    cdsItImpPesqTIPO: TStringField;
    cdsItImpPesqNITEM: TIntegerField;
    cdsItImpPesqDESCRICAO: TStringField;
    cdsItImpPesqQUANTIDADE: TFloatField;
    cdsItImpPesqSTATUS: TStringField;
    cdsItImpPesqNOME_VENDEDOR1: TStringField;
    cdsItImpPesqNOME_VENDEDOR2: TStringField;
    cdsImpPesqSEL: TStringField;
    qrAtdmHw: TIBQuery;
    dspAtdmHw: TDataSetProvider;
    dsAtdmHw: TDataSource;
    cdsAtdmHw: TClientDataSet;
    cdsAtdmHwCODIGO: TIntegerField;
    cdsAtdmHwTIPO: TStringField;
    cdsAtdmHwCOD_CLIENTE: TIntegerField;
    cdsAtdmHwCOD_USUARIO: TIntegerField;
    cdsAtdmHwASSUNTO: TStringField;
    cdsAtdmHwCONTATO: TStringField;
    cdsAtdmHwEMAIL: TStringField;
    cdsAtdmHwFONE: TStringField;
    cdsAtdmHwDATA: TDateTimeField;
    cdsAtdmHwHORA: TStringField;
    cdsAtdmHwOBSERVACAO: TMemoField;
    cdsAtdmHwSTATUS: TStringField;
    cdsAtdmHwUS_STATUS: TIntegerField;
    cdsAtdmHwATIVO: TIntegerField;
    cdsAtdmHwTP_ATEND: TStringField;
    cdsAtdmHwTP_CONTR: TStringField;
    cdsAtdmHwHORA_INICIAL: TStringField;
    cdsAtdmHwHORA_FINAL: TStringField;
    cdsAtdmHwCOD_TIPOANOT: TIntegerField;
    cdsAtdmHwCOD_EMPRESA: TIntegerField;
    cdsAtdmHwCODATENDIMENTOHWAUTO: TIntegerField;
    cdsAtdmHwNOME_VENDEDOR: TStringField;
    cdsAtdmHwNOME_CLIENTE: TStringField;
    cdsAtdmHwDESCRICAO_TIPOANOT: TStringField;
    cdsAtdmHwSEL: TStringField;
    qrGraficos: TIBQuery;
    dspGraficos: TDataSetProvider;
    cdsGraficos: TClientDataSet;
    dsGraficos: TDataSource;
    qrUtil: TIBQuery;
    dspUtil: TDataSetProvider;
    cdsUtil: TClientDataSet;
    dsUtil: TDataSource;
    cdsPesquisaCONTATO: TStringField;
    cdsPesquisaConsCONTATO: TStringField;
    cdsImpPesqCONTATO: TStringField;
    IBQuery1: TIBQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    qrAnotacoes: TIBQuery;
    dspAnotacoes: TDataSetProvider;
    dsAnotacoes: TDataSource;
    cdsAnotacoes: TClientDataSet;
    cdsAnotacoesCODIGO: TIntegerField;
    cdsAnotacoesTIPO: TStringField;
    cdsAnotacoesCOD_CLIENTE: TIntegerField;
    cdsAnotacoesCOD_USUARIO: TIntegerField;
    cdsAnotacoesASSUNTO: TStringField;
    cdsAnotacoesCONTATO: TStringField;
    cdsAnotacoesEMAIL: TStringField;
    cdsAnotacoesFONE: TStringField;
    cdsAnotacoesDATA: TDateTimeField;
    cdsAnotacoesHORA: TStringField;
    cdsAnotacoesOBSERVACAO: TMemoField;
    cdsAnotacoesSTATUS: TStringField;
    cdsAnotacoesUS_STATUS: TIntegerField;
    cdsAnotacoesATIVO: TIntegerField;
    cdsAnotacoesTP_ATEND: TStringField;
    cdsAnotacoesTP_CONTR: TStringField;
    cdsAnotacoesHORA_INICIAL: TStringField;
    cdsAnotacoesHORA_FINAL: TStringField;
    cdsAnotacoesCOD_TIPOANOT: TIntegerField;
    cdsAnotacoesCOD_EMPRESA: TIntegerField;
    cdsAnotacoesCODPESQUISA: TIntegerField;
    qrTipoAnot: TIBQuery;
    dspTipoAnot: TDataSetProvider;
    dstipoAnot: TDataSource;
    cdsTipoAnot: TClientDataSet;
    cdsAnotacoesTP_CONTR_D: TStringField;
    cdsAnotacoesTP_ATEND_D: TStringField;
    cdsAnotacoesNOME_CL: TStringField;
    cdsTipoAnotCOD_TIPOANOT: TIntegerField;
    cdsTipoAnotDESCRICAO_TIPOANOT: TStringField;
    cdsAnotacoesNOME_CLIENTE: TStringField;
    cdsAnotacoesRAZAO: TStringField;
    cdsAnotacoesCPFCGC: TStringField;
    cdsAnotacoesCOLAB_ATEND: TStringField;
    cdsAnotacoesCOLAB_STATUS: TStringField;
    qrTVReq: TIBQuery;
    dspTVReq: TDataSetProvider;
    dsTVReq: TDataSource;
    cdsTVReq: TClientDataSet;
    cdsTVReqTIPO_VENDAS: TStringField;
    cdsTVReqTIPO: TStringField;
    cdsTVReqDESCRICAO: TStringField;
    qrTVOS: TIBQuery;
    dspTVOS: TDataSetProvider;
    dsTVOS: TDataSource;
    cdsTVOS: TClientDataSet;
    cdsTVOSTIPO_VENDAS: TStringField;
    cdsTVOSTIPO: TStringField;
    cdsTVOSDESCRICAO: TStringField;
    qrSoft: TIBQuery;
    dspSoft: TDataSetProvider;
    dsSoft: TDataSource;
    cdsSoft: TClientDataSet;
    cdsSoftCOD_SOFT: TIntegerField;
    cdsSoftCOD_EMPRESA: TIntegerField;
    cdsSoftNOME_SOFT: TStringField;
    cdsAnotacoesNOME_SOFT: TStringField;
    cdsAnotacoesCOD_SOFT: TIntegerField;
    procedure cdsAnotacoesOBSERVACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsImpPesqOBSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsPesquisaConsDADOSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsAtendATENDIMENTOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsFlwGrupoBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmFollowUpPosAtendimento: TdtmFollowUpPosAtendimento;

implementation

uses
  uDtmAtivo;
  
{$R *.dfm}

procedure TdtmFollowUpPosAtendimento.cdsAnotacoesOBSERVACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := Copy(Sender.AsString, 1, 8) + '...';
end;

procedure TdtmFollowUpPosAtendimento.cdsAtendATENDIMENTOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := Copy(Sender.AsString, 1, 64);
end;

procedure TdtmFollowUpPosAtendimento.cdsFlwGrupoBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), dtmFollowUpPosAtendimento);
end;

procedure TdtmFollowUpPosAtendimento.cdsImpPesqOBSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := 'Detalhes...';
end;

procedure TdtmFollowUpPosAtendimento.cdsPesquisaConsDADOSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := Copy(Sender.AsString, 1, 50);
end;

procedure TdtmFollowUpPosAtendimento.DataModuleCreate(Sender: TObject);
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
