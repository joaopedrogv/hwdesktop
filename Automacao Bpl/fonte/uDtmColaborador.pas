unit uDtmColaborador;

interface

uses
  SysUtils, Classes, IBDatabase, DB, DBClient, Provider, IBQuery,
  IBCustomDataSet, IBStoredProc;

type
  TdtmColaborador = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    qrColab: TIBQuery;
    dspColab: TDataSetProvider;
    cdsColab: TClientDataSet;
    dsCola: TDataSource;
    transacaoColab: TIBTransaction;
    qrBuscas: TIBQuery;
    qrFuncao: TIBQuery;
    dspFuncao: TDataSetProvider;
    cdsFuncao: TClientDataSet;
    dsFuncao: TDataSource;
    cdsFuncaoCOD_FUNCAO: TIntegerField;
    cdsFuncaoCOD_DEPTO: TIntegerField;
    cdsFuncaoDESC_FUNCAO: TStringField;
    cdsFuncaoTPDOCS_VND: TMemoField;
    cdsFuncaoATIVO: TIntegerField;
    qrDpto: TIBQuery;
    dsDepto: TDataSource;
    qrPerfilcomissao: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    MemoField1: TMemoField;
    MemoField2: TMemoField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    IntegerField2: TIntegerField;
    dspPerfilComissao: TDataSetProvider;
    cdsPerfilComissao: TClientDataSet;
    dsPerfilComissao: TDataSource;
    qrIncidencia: TIBQuery;
    dtpIncidencia: TDataSetProvider;
    cdsIncidencia: TClientDataSet;
    dsIncidencia: TDataSource;
    qrIncidenciaColab: TIBQuery;
    dspIncidenciaColab: TDataSetProvider;
    cdsIncidenciaColab: TClientDataSet;
    dsIncidenciaColab: TDataSource;
    cdsPerfilComissaoCODIGO_PERFIL: TIntegerField;
    cdsPerfilComissaoNOME_PERFIL: TStringField;
    cdsPerfilComissaoTIPO_PERFIL: TStringField;
    cdsPerfilComissaoABRANG_PERFIL: TStringField;
    cdsPerfilComissaoEM_CIMA_PERFIL: TStringField;
    cdsPerfilComissaoTIPO_SERV_PROD: TStringField;
    cdsPerfilComissaoFLAG_SERV_PROD: TStringField;
    cdsPerfilComissaoCONTEUDO_FLAG: TMemoField;
    cdsPerfilComissaoTABELAS_PERFIL: TMemoField;
    cdsPerfilComissaoDATA_CADASTRO: TDateTimeField;
    cdsPerfilComissaoPERC_PESO: TFloatField;
    cdsPerfilComissaoATIVO: TIntegerField;
    CdsPColab: TClientDataSet;
    dspPcolab: TDataSetProvider;
    qrPColab: TIBQuery;
    dsPercolab: TDataSource;
    CdsPColabCOD_VENDEDOR: TIntegerField;
    CdsPColabCODIGO_PERFIL: TIntegerField;
    CdsPColabCOD_EMPRESA: TIntegerField;
    CdsPColabATIVO: TIntegerField;
    dsCidades: TDataSource;
    qrCidades: TIBQuery;
    dsUF: TDataSource;
    grUF: TIBQuery;
    cdsIncidenciaCODIGO: TIntegerField;
    cdsIncidenciaCOD_EMPRESA: TIntegerField;
    cdsIncidenciaDESCRICAO: TStringField;
    cdsIncidenciaTIPO: TStringField;
    cdsIncidenciaVALOR: TFloatField;
    cdsIncidenciaCODFUNC: TIntegerField;
    cdsIncidenciaNATUREZA: TStringField;
    cdsIncidenciaCOD_FUNCAO: TIntegerField;
    cdsIncidenciaATIVO: TIntegerField;
    cdsIncidenciaColabCOD_INCIDENCIA: TIntegerField;
    cdsIncidenciaColabCOD_COLABORADOR: TIntegerField;
    cdsIncidenciaColabCOD_EMPRESA: TIntegerField;
    cdsIncidenciaColabATIVO: TIntegerField;
    dsBairro: TDataSource;
    qrBairro: TIBQuery;
    cdsColabCOD_VENDEDOR: TIntegerField;
    cdsColabCOD_EMPRESA: TIntegerField;
    cdsColabCODIGO_UF: TIntegerField;
    cdsColabCOD_FUNCAO: TIntegerField;
    cdsColabNOME_VENDEDOR: TStringField;
    cdsColabEND_VENDEDOR: TStringField;
    cdsColabBAIRRO_VENDEDOR: TStringField;
    cdsColabCIDADE_VENDEDOR: TStringField;
    cdsColabCEP_VENDEDOR: TStringField;
    cdsColabFONE_VENDEDOR: TStringField;
    cdsColabCPF_VENDEDOR: TStringField;
    cdsColabPC_VEND_SERV: TFloatField;
    cdsColabPC_VEND_PROD: TFloatField;
    cdsColabOBS_VENDEDOR: TMemoField;
    cdsColabDATA_MOD_COL: TDateTimeField;
    cdsColabDATA_CAD_COL: TDateTimeField;
    cdsColabDAT_NASC_COL: TDateTimeField;
    cdsColabNOME_ULT_EMP: TStringField;
    cdsColabENDERECO_ULT_EMP: TStringField;
    cdsColabFONE_ULT_EMP: TStringField;
    cdsColabCONT_ULT_EMP: TStringField;
    cdsColabULT_SAL_EMP: TFloatField;
    cdsColabDTENT_ULT_EMP: TDateTimeField;
    cdsColabDTSAI_ULT_EMP: TDateTimeField;
    cdsColabNOME_PLT_EMP: TStringField;
    cdsColabENDERECO_PLT_EMP: TStringField;
    cdsColabFONE_PLT_EMP: TStringField;
    cdsColabCONT_PLT_EMP: TStringField;
    cdsColabPLT_SAL_EMP: TFloatField;
    cdsColabDTENT_PLT_EMP: TDateTimeField;
    cdsColabDTSAI_PLT_EMP: TDateTimeField;
    cdsColabDT_ULT_FERIAS: TDateTimeField;
    cdsColabTMP_ULT_FERIAS: TIntegerField;
    cdsColabVL_ULT_FERIAS: TFloatField;
    cdsColabDTVND_ULT_FERIAS: TDateTimeField;
    cdsColabDT_13_SAL: TDateTimeField;
    cdsColabVL_13_SAL: TFloatField;
    cdsColabVL_SAL: TFloatField;
    cdsColabCOD_CIDADE: TSmallintField;
    cdsColabCOD_BAIRRO: TSmallintField;
    cdsColabSALARIO_REGISTRO: TFloatField;
    cdsColabVALOR_SALARIO: TFloatField;
    cdsColabQUANT_SAL_FAMILIA: TFloatField;
    cdsColabVALOR_SALARIO_FAMILIA: TFloatField;
    cdsColabPERC_PESO: TFloatField;
    cdsColabATIVO: TIntegerField;
    cdsColabEMAIL: TStringField;
    cdsColabSITE: TStringField;
    cdsColabFONE_CONTATO: TStringField;
    cdsColabSiglaUF: TStringField;
    qrF: TIBQuery;
    dspF: TDataSetProvider;
    cdsF: TClientDataSet;
    dsF: TDataSource;
    cdsFCOD_FUNCAO: TIntegerField;
    cdsFCOD_DEPTO: TIntegerField;
    cdsFDESC_FUNCAO: TStringField;
    cdsFTPDOCS_VND: TMemoField;
    cdsFATIVO: TIntegerField;
    cdsFuncaoDPTO: TStringField;
    cdsFDPTO: TStringField;
    CdsPColabNOME_PERFIL: TStringField;
    qrPColabCOD_VENDEDOR: TIntegerField;
    qrPColabCODIGO_PERFIL: TIntegerField;
    qrPColabCOD_EMPRESA: TIntegerField;
    qrPColabATIVO: TIntegerField;
    qrPColabNOME_PERFIL: TIBStringField;
    qrBuscasPColab: TIBQuery;
    transacaoFuncoes: TIBTransaction;
    qrBuscasFunc: TIBQuery;
    cdsColabCOD_GERENTE: TIntegerField;
    qrGerente: TIBQuery;
    dspGerente: TDataSetProvider;
    cdsGerente: TClientDataSet;
    dsGerente: TDataSource;
    cdsGerenteCOD_VENDEDOR: TIntegerField;
    cdsGerenteNOME_VENDEDOR: TStringField;
    cdsGerenteCOD_EMPRESA: TIntegerField;
    cdsColabDATA_INI_AUSENCIA: TDateTimeField;
    cdsColabDATA_FIM_AUSENCIA: TDateTimeField;
    cdsColabVENDEDOR_TLV: TStringField;
    qrLancDebCred: TIBQuery;
    dspLancDebCred: TDataSetProvider;
    cdsLancDebCred: TClientDataSet;
    dsLancDebCred: TDataSource;
    cdsLancDebCredCOD_LANC: TIntegerField;
    cdsLancDebCredCOD_EMPRESA: TIntegerField;
    cdsLancDebCredCOD_VENDEDOR: TIntegerField;
    cdsLancDebCredDATA_LANC: TDateTimeField;
    cdsLancDebCredHORA_LANC: TTimeField;
    cdsLancDebCredVL_LANCDEBCRED: TFloatField;
    cdsLancDebCredDESCRICAO: TStringField;
    cdsLancDebCredNPEDORIGEM: TIntegerField;
    transacaoLanDebCred: TIBTransaction;
    qrTipoLancdc: TIBQuery;
    dspTipoLancdc: TDataSetProvider;
    cdsTipoLancdc: TClientDataSet;
    dsTipoLancdc: TDataSource;
    cdsTipoLancdcCOD_TIPOLANCDC: TIntegerField;
    cdsTipoLancdcCOD_EMPRESA: TIntegerField;
    cdsTipoLancdcNATUREZA_LAN: TStringField;
    cdsTipoLancdcTIPO_LANC: TStringField;
    cdsTipoLancdcDESCRICAOLANC: TStringField;
    cdsLancDebCredORIGEM_LANC: TStringField;
    qrLcolab: TIBQuery;
    dspLcolab: TDataSetProvider;
    cdsLcolab: TClientDataSet;
    dsLcolab: TDataSource;
    cdsLcolabCOD_VENDEDOR: TIntegerField;
    cdsLcolabNOME_VENDEDOR: TStringField;
    qrParticipante: TIBQuery;
    dspParticipante: TDataSetProvider;
    cdsParticipante: TClientDataSet;
    dsParticipante: TDataSource;
    cdsParticipanteCOD_PARTICIPANTE: TIntegerField;
    cdsParticipanteCOD_EMPRESA: TIntegerField;
    cdsParticipanteCODIGO_UF: TSmallintField;
    cdsParticipanteCOD_CIDADE: TSmallintField;
    cdsParticipanteCOD_BAIRRO: TSmallintField;
    cdsParticipanteNOME_PARTICIPANTE: TStringField;
    cdsParticipanteEND_PARTICIPANTE: TStringField;
    cdsParticipanteBAIRRO_PARTICIPANTE: TStringField;
    cdsParticipanteCIDADE_PARTICIPANTE: TStringField;
    cdsParticipanteCEP_PARTICIPANTE: TStringField;
    cdsParticipanteFONE_PARTICIPANTE: TStringField;
    cdsParticipanteCPF_PARTICIPANTE: TStringField;
    cdsParticipanteOBS_PARTICIPANTE: TMemoField;
    cdsParticipanteDATA_MOD_PART: TDateTimeField;
    cdsParticipanteDATA_CAD_PART: TDateTimeField;
    cdsParticipanteDAT_NASC_PART: TDateTimeField;
    cdsParticipanteEMAIL: TStringField;
    cdsParticipanteFONE_CONTATO: TStringField;
    cdsParticipanteATIVO: TIntegerField;
    cdsParticipanteSIGLA_UF: TStringField;
    cdsColabRG_VENDEDOR: TStringField;
    cdsParticipantePC_VEND_PROD: TFloatField;
    cdsColabSEL: TStringField;
    cdsParticipanteSEL: TStringField;
    cdsFuncaoSEL: TStringField;
    qrCalendColaboradorExc: TIBQuery;
    dspCalendColaboradorExc: TDataSetProvider;
    cdsCalendColaboradorExc: TClientDataSet;
    dsCalendColaboradorExc: TDataSource;
    cdsCalendColaboradorExcCODIGO: TIntegerField;
    cdsCalendColaboradorExcCOD_EMPRESA: TIntegerField;
    cdsCalendColaboradorExcCOD_COLABORADOR: TIntegerField;
    cdsCalendColaboradorExcDATA: TDateTimeField;
    cdsCalendColaboradorExcMOTIVO: TStringField;
    cdsCalendColaboradorExcHORA_INI: TStringField;
    cdsCalendColaboradorExcHORA_FIM: TStringField;
    cdsCalendColaboradorExcTRABALHAR: TStringField;
    cdsCalendColaboradorExcNOME_VENDEDOR: TStringField;
    qrColaboradorCalendColaboradorExc: TIBQuery;
    dspColaboradorCalendColaboradorExc: TDataSetProvider;
    cdsColaboradorCalendColaboradorExc: TClientDataSet;
    dsColaboradorCalendColaboradorExc: TDataSource;
    cdsColaboradorCalendColaboradorExcCOD_VENDEDOR: TIntegerField;
    cdsColaboradorCalendColaboradorExcNOME_VENDEDOR: TStringField;
    qrCalendEscalaSemanal: TIBQuery;
    dspCalendEscalaSemanal: TDataSetProvider;
    cdsCalendEscalaSemanal: TClientDataSet;
    dsCalendEscalaSemanal: TDataSource;
    cdsCalendEscalaSemanalCODIGO: TIntegerField;
    cdsCalendEscalaSemanalCOD_EMPRESA: TIntegerField;
    cdsCalendEscalaSemanalDESCRICAO: TStringField;
    qrCalendEscalaSemanalDia: TIBQuery;
    dspCalendEscalaSemanalDia: TDataSetProvider;
    cdsCalendEscalaSemanalDia: TClientDataSet;
    dsCalendEscalaSemanalDia: TDataSource;
    cdsCalendEscalaSemanalDiaCODIGO: TIntegerField;
    cdsCalendEscalaSemanalDiaCOD_EMPRESA: TIntegerField;
    cdsCalendEscalaSemanalDiaDIA: TIntegerField;
    cdsCalendEscalaSemanalDiaHORA_INI: TStringField;
    cdsCalendEscalaSemanalDiaHORA_FIM: TStringField;
    qrJornadaTrabalho: TIBQuery;
    dspJornadaTrabalho: TDataSetProvider;
    cdsJornadaTrabalho: TClientDataSet;
    dsJornadaTrabalho: TDataSource;
    cdsJornadaTrabalhoCODIGO: TIntegerField;
    cdsJornadaTrabalhoCOD_EMPRESA: TIntegerField;
    cdsJornadaTrabalhoDESCRICAO: TStringField;
    cdsJornadaTrabalhoHORARIO_INI_PADRAO: TStringField;
    cdsJornadaTrabalhoHORARIO_FIM_PADRAO: TStringField;
    cdsJornadaTrabalhoDIAS_FOLGA_SEMANAIS: TStringField;
    cdsColabCOD_JORNADA_TRABALHO: TIntegerField;
    cdsColabCOD_ESCALA_SEMANAL: TIntegerField;
    qrEscalaSemanalCol: TIBQuery;
    dspEscalaSemanalCol: TDataSetProvider;
    cdsEscalaSemanalCol: TClientDataSet;
    dsEscalaSemanalCol: TDataSource;
    cdsEscalaSemanalColCODIGO: TIntegerField;
    cdsEscalaSemanalColDESCRICAO: TStringField;
    qrJornadaTrabalhoCol: TIBQuery;
    dspJornadaTrabalhoCol: TDataSetProvider;
    cdsJornadaTrabalhoCol: TClientDataSet;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    dsJornadaTrabalhoCol: TDataSource;
    procedure cdsFuncaoTPDOCS_VNDGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure CdsPColabBeforeOpen(DataSet: TDataSet);
    procedure cdsColabBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmColaborador: TdtmColaborador;

implementation

uses uDtmAtivo;

{$R *.dfm}

procedure TdtmColaborador.cdsColabBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet),dtmColaborador);
end;

procedure TdtmColaborador.cdsFuncaoTPDOCS_VNDGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
	if not cdsFuncaoTPDOCS_VND.IsNull then
    Text := vDadosIni.IfThen(Length(trim(cdsFuncaoTPDOCS_VND.AsString)) > 50,
    	Copy(trim(cdsFuncaoTPDOCS_VND.AsString), 1, 50) + '...',
      trim(cdsFuncaoTPDOCS_VND.AsString));
end;

procedure TdtmColaborador.CdsPColabBeforeOpen(DataSet: TDataSet);
begin
 dtmAtivo.mudaSelect(TClientDataSet(DataSet),dtmColaborador);
end;

procedure TdtmColaborador.DataModuleCreate(Sender: TObject);
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
