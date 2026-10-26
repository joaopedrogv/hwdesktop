unit UdtmTerminalF;

interface

uses
  SysUtils, Classes, IBDatabase, DBClient, Provider, DB, IBCustomDataSet,
  IBQuery, IBStoredProc, RDprint;

type
  TdtmTerminaisF = class(TDataModule)
    TsTerminalF: TIBTransaction;
    IbTerminalF: TIBQuery;
    DspTerminalF: TDataSetProvider;
    CdsTerminalF: TClientDataSet;
    DtTerminalF: TDataSource;
    QrBuscasFin: TIBQuery;
    CdsTerminalFCOD_TERMINAL: TIntegerField;
    CdsTerminalFCOD_EMPRESA: TIntegerField;
    CdsTerminalFNOME_TERMINAL: TStringField;
    CdsTerminalFEND_TERMINAL: TStringField;
    CdsTerminalFCOD_FISCAL: TIntegerField;
    SpIncCodigo: TIBStoredProc;
    IbSoftFiscal: TIBQuery;
    CdsSoftFiscal: TClientDataSet;
    DspSoftFiscal: TDataSetProvider;
    CdsSoftFiscalCOD_FISCAL: TIntegerField;
    CdsSoftFiscalCOD_EMPDES: TIntegerField;
    CdsSoftFiscalNOME_PAF: TStringField;
    CdsSoftFiscalVERSAO_PAF: TStringField;
    CdsSoftFiscalMD5_PAF: TStringField;
    CdsSoftFiscalDATA_CAD_FISCAL: TDateTimeField;
    CdsSoftFiscalDATA_MOD_FISCAL: TDateTimeField;
    CdsSoftFiscalATIVO: TIntegerField;
    CdsSoftFiscalER_PAF_ECF: TStringField;
    CdsTerminalFATIVO: TIntegerField;
    CdsSoftFiscalNOMEAPRES: TStringField;
    DtSoftFiscal: TDataSource;
    IbResumoD: TIBQuery;
    DspResumoD: TDataSetProvider;
    CdsResumoD: TClientDataSet;
    DtResumoD: TDataSource;
    CdsResumoDCOD_TERMINAL: TIntegerField;
    CdsResumoDCOORED: TIntegerField;
    CdsResumoDCOD_EMPRESA: TIntegerField;
    CdsResumoDNSERIEECF: TStringField;
    CdsResumoDDATA_MOV: TDateTimeField;
    CdsResumoDSEQINI: TIntegerField;
    CdsResumoDSEQFIM: TIntegerField;
    CdsResumoDVLVENDAB: TFloatField;
    CdsResumoDVLTOTGERAL: TFloatField;
    CdsResumoDCRO_MOV: TIntegerField;
    CdsResumoDNREDUCOES: TIntegerField;
    CdsResumoDVLTOTLIQ: TFloatField;
    CdsResumoDVLCANCEL: TFloatField;
    CdsResumoDVLACRESCIMO: TFloatField;
    CdsResumoDVLDESCONTOS: TFloatField;
    CdsResumoDVLISS: TFloatField;
    CdsResumoDVLISENTOS: TFloatField;
    CdsResumoDVLNINCIDENCIA: TFloatField;
    CdsResumoDVLSUBST: TFloatField;
    CdsResumoDDATA_EMISSAO_Z: TDateTimeField;
    CdsResumoDHORA_EMISSAO_Z: TStringField;
    IbEmpDesenvolv: TIBQuery;
    DspEmpDesenvolv: TDataSetProvider;
    CdsEmpDesenvolv: TClientDataSet;
    DtEmpDes: TDataSource;
    CdsEmpDesenvolvCOD_EMPDES: TIntegerField;
    CdsEmpDesenvolvNOME_EMPDES: TStringField;
    CdsEmpDesenvolvCNPJ_EMPDES: TStringField;
    CdsEmpDesenvolvCODIGO_UF: TIntegerField;
    CdsEmpDesenvolvIE_EMPDES: TStringField;
    CdsEmpDesenvolvIM_EMPDES: TStringField;
    CdsEmpDesenvolvDATA_CAD_EMPDES: TDateTimeField;
    CdsEmpDesenvolvDATA_MOD_EMPDES: TDateTimeField;
    CdsEmpDesenvolvATIVO: TIntegerField;
    IbSoftFiscalCOD_FISCAL: TIntegerField;
    IbSoftFiscalCOD_EMPDES: TIntegerField;
    IbSoftFiscalNOME_PAF: TIBStringField;
    IbSoftFiscalVERSAO_PAF: TIBStringField;
    IbSoftFiscalMD5_PAF: TIBStringField;
    IbSoftFiscalDATA_CAD_FISCAL: TDateTimeField;
    IbSoftFiscalDATA_MOD_FISCAL: TDateTimeField;
    IbSoftFiscalATIVO: TIntegerField;
    IbSoftFiscalER_PAF_ECF: TIBStringField;
    IbSoftFiscalNOMEAPRES: TIBStringField;
    IbDocNaoFiscal: TIBQuery;
    DspDocNaoFiscal: TDataSetProvider;
    CdsDocNaoFiscal: TClientDataSet;
    DtDocNaoFiscal: TDataSource;
    CdsDocNaoFiscalCOD_TERMINAL: TIntegerField;
    CdsDocNaoFiscalCOO_ECF: TIntegerField;
    CdsDocNaoFiscalCOD_EMPRESA: TIntegerField;
    CdsDocNaoFiscalGNF_ECF: TIntegerField;
    CdsDocNaoFiscalGRG_ECF: TIntegerField;
    CdsDocNaoFiscalCDC_ECF: TIntegerField;
    CdsDocNaoFiscalDATA_F_EMISSAO: TDateTimeField;
    CdsDocNaoFiscalHORA_F_EMISSAO: TStringField;
    CdsDocNaoFiscalTIPO_DOC_ECF: TStringField;
    IbimpCNIEE: TIBQuery;
    DspImpCNIEE: TDataSetProvider;
    CdsImpCNIEE: TClientDataSet;
    DtImpCNIEE: TDataSource;
    IbImprTerminal: TIBQuery;
    DspImprTerminal: TDataSetProvider;
    CdsImprTerminal: TClientDataSet;
    DtImprTerminal: TDataSource;
    CdsImpCNIEEIDENTIFICACAO: TStringField;
    CdsImpCNIEETIPO_ECF: TStringField;
    CdsImpCNIEEMARCA_ECF: TStringField;
    CdsImpCNIEEMODELO_ECF: TStringField;
    CdsImpCNIEEVERSAOSB: TStringField;
    CdsImpCNIEEQTDELACRESEXTSL: TIntegerField;
    CdsImpCNIEEQTDELACRESEXTFAB: TIntegerField;
    CdsImpCNIEETEMFD: TStringField;
    CdsImpCNIEELACREMFD: TStringField;
    CdsImpCNIEEATO_APROVACAO: TStringField;
    CdsImprTerminalIDENT_CNIEE: TStringField;
    CdsImprTerminalCOD_TERMINAL: TIntegerField;
    CdsImprTerminalNUM_SERIE_ECF: TStringField;
    CdsImprTerminalMF_ADICIONAL: TStringField;
    CdsImprTerminalCOD_EMPRESA: TIntegerField;
    CdsImprTerminalDATA_CAD_TERM: TDateTimeField;
    CdsImprTerminalDATA_MOD_TERM: TDateTimeField;
    CdsImprTerminalDATA_SB: TDateTimeField;
    CdsImprTerminalHORA_SB: TStringField;
    CdsImprTerminalISSQNDESC: TStringField;
    CdsImprTerminalATUAL: TStringField;
    IbDetalheResumoD: TIBQuery;
    DspDetalhesMpD: TDataSetProvider;
    CdsDetallhesResumoD: TClientDataSet;
    DtDetalhesResumoD: TDataSource;
    CdsDetallhesResumoDCOD_TERMINAL: TIntegerField;
    CdsDetallhesResumoDCOORED: TIntegerField;
    CdsDetallhesResumoDCOD_EMPRESA: TIntegerField;
    CdsDetallhesResumoDALIQ_SEQ: TStringField;
    CdsDetallhesResumoDDESCALIQ: TStringField;
    CdsDetallhesResumoDVALORALIQ: TFloatField;
    IbBuscaTerminal: TIBQuery;
    IbTerminalRetag: TIBQuery;
    IbTerminalinloco: TIBQuery;
    IbTransTerminalInLoco: TIBTransaction;
    CdsBuscaTerminal: TClientDataSet;
    DspTerminalFiscal: TDataSetProvider;
    CdsTerminalRet: TClientDataSet;
    DspTerminalRet: TDataSetProvider;
    CdsTerminalFENDREDEHWF_FDB: TStringField;
    IbSoftFiscalPRINCIPAL_EXEC: TIBStringField;
    IbSoftFiscalN_LAUDO_FISCAL: TIBStringField;
    CdsSoftFiscalPRINCIPAL_EXEC: TStringField;
    CdsSoftFiscalN_LAUDO_FISCAL: TStringField;
    IbArquivosFiscal: TIBQuery;
    DspArquivosFiscal: TDataSetProvider;
    CdsArquivosFiscal: TClientDataSet;
    CdsArquivosFiscalCOD_ARQUIVO: TIntegerField;
    CdsArquivosFiscalCOD_FISCAL: TIntegerField;
    CdsArquivosFiscalNOME_ARQUIVO: TStringField;
    CdsArquivosFiscalMD5_ARQUIVO: TStringField;
    DtArquivosFiscal: TDataSource;
    CdsEmpDesenvolvENDERECO_EMPDES: TStringField;
    CdsEmpDesenvolvBAIRRO_EMPDES: TStringField;
    CdsEmpDesenvolvCIDADE_EMPDES: TStringField;
    CdsEmpDesenvolvFONE_EMPDES: TStringField;
    CdsEmpDesenvolvCONTATO_EMPDES: TStringField;
    DtbHwFFDB: TIBDatabase;
    IbDestinoHwF: TIBQuery;
    DspDestinoHwF: TDataSetProvider;
    CdsDestinoHWFFDB: TClientDataSet;
    IbapagarHwfdb: TIBQuery;
    IbTransHwFFdb: TIBTransaction;
    qrTermConf: TIBQuery;
    dspTermConf: TDataSetProvider;
    cdsTerminalConfig: TClientDataSet;
    cdsTerminalConfigCOD_TERMINAL: TIntegerField;
    cdsTerminalConfigCOD_EMPRESA: TIntegerField;
    cdsTerminalConfigNOME_TERMINAL: TStringField;
    cdsTerminalConfigEND_TERMINAL: TStringField;
    cdsTerminalConfigMECANICO: TIntegerField;
    cdsTerminalConfigATIVO: TIntegerField;
    cdsTerminalConfigCOD_FISCAL: TIntegerField;
    cdsTerminalConfigENDREDEHWF_FDB: TStringField;
    dsTerminalConfig: TDataSource;
    qrLayout: TIBQuery;
    dspLayout: TDataSetProvider;
    cdsLayout: TClientDataSet;
    dsLayout: TDataSource;
    dsVendTerminais: TDataSource;
    cdsDetVendT: TClientDataSet;
    cdsDetVendTdescricao: TStringField;
    cdsDetVendTvalor: TCurrencyField;
    dsDetVendT: TDataSource;
    cdsVendTerminais: TClientDataSet;
    cdsVendTerminaisTerminal: TStringField;
    cdsVendTerminaisDataMovimento: TDateField;
    cdsVendTerminaisVendaBruta: TCurrencyField;
    cdsVendTerminaisDesconto: TCurrencyField;
    cdsVendTerminaisVendaLiquida: TCurrencyField;
    cdsVendTerminaisAcrescimo: TCurrencyField;
    cdsVendTerminaiscod_terminal: TIntegerField;
    rdpRel: TRDprint;
    qrBuscas2: TIBQuery;
    qrBuscas3: TIBQuery;
    qrBuscas4: TIBQuery;
    qrOlap: TIBQuery;
    qrOlapCOD_VENDEDOR: TIntegerField;
    qrOlapNOME_VENDEDOR: TIBStringField;
    qrOlapHORAABERTURA: TIntegerField;
    qrOlapHORAFECHAMENTO: TIntegerField;
    qrOlapMINABERTURA: TIntegerField;
    qrOlapMINFECHAMENTO: TIntegerField;
    qrOlapGRUPO_PROD: TIntegerField;
    qrOlapCOD_PROD: TIBStringField;
    qrOlapDESCR_PROD: TIBStringField;
    qrOlapNOMEGRUPO: TIBStringField;
    qrOlapNOMESUBGRUPO: TIBStringField;
    qrOlapNPED: TIntegerField;
    qrOlapDIASEMANA: TIBStringField;
    qrOlapVENDABRUTA: TFloatField;
    qrOlapDESCONTO: TFloatField;
    qrOlapACRESCIMO: TFloatField;
    qrOlapVENDALIQUIDA: TFloatField;
    qrOlapQTDEITENSDAVENDA: TIntegerField;
    qrOlapQTDEPRODUTOSVENDIDOS: TFloatField;
    CdsImprTerminalCOD_PROPRIETARIO: TIntegerField;
    qrOlapNCUPOM: TIntegerField;
    qrOlapOPERADOR: TIntegerField;
    qrHwf: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure mudaSelect(DataSet: TClientDataSet);
    procedure CdsPendBalcaoBeforeOpen(DataSet: TDataSet);
    function criaDtm: boolean;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  dtmTerminaisF: TdtmTerminaisF;

implementation

{$R *.dfm}
uses uDadosIni, Dialogs,funcoes,uDtmAtivo;

procedure TdtmTerminaisF.DataModuleCreate(Sender: TObject);
var
  J, I: Integer;
begin
  try
//    vDadosIni:= TSingleton.GetInstance;
//    vDadosIni.codEmpresa:='1';
//    vDadosIni.vCodOpCxl:=1;
//    vDadosIni.diaFCxl:=strtodate('25/10/2008');
    // vDadosIniEnt.setDadosConfig(vDadosIniFP);chamar este metodo logo apos a criacao deste dtm
//    criaDtm; //chamar este metodo tambem para conectar ao banco
  except
  end;
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

procedure TdtmTerminaisF.mudaSelect(DataSet: TClientDataSet);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to dtmTerminaisF.ComponentCount - 1 do
    begin
      if (dtmTerminaisF.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(dtmTerminaisF.Components[i]).Name) = UpperCase(DataSet.ProviderName)
          then
        begin
          TIBQuery(TDataSetProvider(dtmTerminaisF.Components[i]).DataSet).SQL.Text := DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;

procedure TdtmTerminaisF.CdsPendBalcaoBeforeOpen(DataSet: TDataSet);
begin
 mudaSelect(TClientDataSet(DataSet));
end;

function TdtmTerminaisF.criaDtm: boolean;
begin
  vDadosIni.LerConfigini;
  try
    if vDadosIni.vSistema <> 'Fiscal' then
      vDadosIni.conectaBanco(dtmAtivo.bancoHw,vDadosIni.GetBaseDados('Banco', 'HW'),true);
    Result := true;
  except
    MessageDlg('A base de dados Hw.fdb não se encontra no caminho especificado:'
      + #13 + vDadosIni.GetBaseDados('Banco', 'HW'), mtInformation, [mbOK], 0);
    Result := false;
  end;
end;

end.
