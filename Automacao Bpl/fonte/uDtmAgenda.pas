unit uDtmAgenda;

interface

uses
  SysUtils, Classes, IBCustomDataSet, IBQuery, DB, DBClient, Provider,
  IBDatabase, uDadosIni, IBStoredProc, RDprint, UCrpeClasses, UCrpe32;

type
  TDtmAgenda = class(TDataModule)
    SpIncCodigo: TIBStoredProc;
    transacao: TIBTransaction;
    qrBuscas: TIBQuery;
    qrAgenda: TIBQuery;
    dspAgenda: TDataSetProvider;
    cdsAgenda: TClientDataSet;
    dsAgenda: TDataSource;
    cdsAgendaCOD_AGENDA: TIntegerField;
    cdsAgendaCOD_EMPRESA: TIntegerField;
    cdsAgendaCOD_CLIENTE: TIntegerField;
    cdsAgendaNOME_CLIENTE: TStringField;
    cdsAgendaDATA_AGENDA: TDateTimeField;
    cdsAgendaHORA_AGENDA: TStringField;
    cdsAgendaDESCR_AGENDA: TStringField;
    cdsAgendaOBSERVACAO: TMemoField;
    cdsAgendaSTATUS_AGENDA: TStringField;
    cdsAgendaFONE_CLIENTE: TStringField;
    cdsServicoCons: TClientDataSet;
    qrServicoCons: TIBQuery;
    dsServicoCons: TDataSource;
    dspServicoCons: TDataSetProvider;
    cdsServicoConsCOD_SERVICO: TIntegerField;
    cdsServicoConsDESC_SERVICO: TStringField;
    cdsServicoConsTMO: TFloatField;
    cdsClienteCons: TClientDataSet;
    qrClienteCons: TIBQuery;
    dsClienteCons: TDataSource;
    dspClienteCons: TDataSetProvider;
    cdsClienteConsCOD_CLIENTE: TIntegerField;
    cdsClienteConsNOME_CLIENTE: TStringField;
    cdsClienteConsATIVO: TIntegerField;
    cdsClienteConsFONE_CLIENTE: TStringField;
    cdsServicoConsATIVO: TIntegerField;
    cdsMecanicoCons: TClientDataSet;
    qrMecanicoCons: TIBQuery;
    dsMecanicoCons: TDataSource;
    dspMecanicoCons: TDataSetProvider;
    cdsBoxCons: TClientDataSet;
    qrBoxCons: TIBQuery;
    dsBoxCons: TDataSource;
    dspBoxCons: TDataSetProvider;
    cdsBoxConsCOD_BOX: TIntegerField;
    cdsBoxConsDESCR_BOX: TStringField;
    cdsAgendaTMO_SERVICO: TFloatField;
    qrAgendaItens: TIBQuery;
    dspAgendaItens: TDataSetProvider;
    cdsAgendaItens: TClientDataSet;
    dsAgendaItens: TDataSource;
    cdsAgendaItensCOD_AGENDA: TIntegerField;
    cdsAgendaItensCOD_EMPRESA: TIntegerField;
    cdsAgendaItensNITEM: TIntegerField;
    cdsAgendaItensCOD_SERVICO: TIntegerField;
    cdsAgendaItensDESC_SERVICO: TStringField;
    cdsAgendaItensTMO_SERVICO: TFloatField;
    cdsAgendaItensCOD_BOX: TIntegerField;
    cdsAgendaItensCOD_VENDEDOR: TIntegerField;
    cdsAgendaItensNPED: TIntegerField;
    cdsAgendaItensCODIGO_NOP: TFloatField;
    cdsAgendaItensVALOR_SERVICO: TFloatField;
    cdsAgendaItensSEL: TStringField;
    qrLembreteAgenda: TIBQuery;
    dspLembreteAgenda: TDataSetProvider;
    cdsLembreteAgenda: TClientDataSet;
    dsLembreteAgenda: TDataSource;
    cdsLembreteAgendaNPED: TIntegerField;
    cdsLembreteAgendaCOD_EMPRESA: TIntegerField;
    cdsLembreteAgendaSTATUS_OS: TStringField;
    cdsLembreteAgendaDATA: TDateTimeField;
    cdsLembreteAgendaLEMBRETE: TStringField;
    cdsLembreteAgendaATIVO: TIntegerField;
    cdsLembreteAgendaHORA: TTimeField;
    cdsAgendaItensNOME_VENDEDOR: TStringField;
    cdsAgendaNPED: TIntegerField;
    cdsAgendaItensTemp: TClientDataSet;
    cdsAgendaItensTempCOD_AGENDA: TIntegerField;
    cdsAgendaItensTempCOD_SERVICO: TIntegerField;
    cdsAgendaItensTempNITEM: TIntegerField;
    cdsAgendaItensTempTMO_SERVICO: TFloatField;
    cdsAgendaItensCODNOMEVENDEDOR: TStringField;
    cdsAgendaItensCODBOX: TStringField;
    cdsAgendaItensDESCR_BOX: TStringField;
    cdsBoxConsCOD_EMPRESA: TIntegerField;
    cdsMecanicoConsCOD_VENDEDOR: TIntegerField;
    cdsMecanicoConsNOME_VENDEDOR: TStringField;
    cdsMecanicoConsDESC_FUNCAO: TStringField;
    cdsAgendaMecanico: TClientDataSet;
    qrAgendaMecanico: TIBQuery;
    dsAgendaMecanico: TDataSource;
    dspAgendaMecanico: TDataSetProvider;
    cdsAgendaMecanicoCOD_AGENDA: TIntegerField;
    cdsAgendaMecanicoCOD_EMPRESA: TIntegerField;
    cdsAgendaMecanicoNITEM: TIntegerField;
    cdsAgendaMecanicoCOD_SERVICO: TIntegerField;
    cdsAgendaMecanicoDESC_SERVICO: TStringField;
    cdsAgendaMecanicoTMO_SERVICO: TFloatField;
    cdsAgendaMecanicoCODIGO_NOP: TFloatField;
    cdsAgendaMecanicoVALOR_SERVICO: TFloatField;
    cdsAgendaMecanicoCOD_BOX: TIntegerField;
    cdsAgendaMecanicoCOD_VENDEDOR: TIntegerField;
    cdsAgendaMecanicoNPED: TIntegerField;
    cdsAgendaMecanicoCOD_CLIENTE: TIntegerField;
    cdsAgendaMecanicoNOME_CLIENTE: TStringField;
    cdsAgendaMecanicoNOME_VENDEDOR: TStringField;
    cdsAgendaMecanicoDESCR_BOX: TStringField;
    cdsAgendaMecanicoDATA_AGENDA: TDateTimeField;
    cdsAgendaMecanicoSTATUS_AGENDA: TStringField;
    qrApar: TIBQuery;
    dspApar: TDataSetProvider;
    cdsApar: TClientDataSet;
    cdsAparCOD_EQUIP: TIntegerField;
    cdsAparCOD_PROP: TIntegerField;
    cdsAparNOM_EQUIP: TStringField;
    cdsAparN_SERIE: TStringField;
    cdsAparMARCA: TStringField;
    cdsAparMODELO: TStringField;
    cdsAparCOR: TStringField;
    cdsAparTIP_EQUIP: TStringField;
    cdsAparTIPOOSVINC: TStringField;
    cdsAparCOMCONTRATO: TStringField;
    cdsveic: TClientDataSet;
    cdsveicPLACA: TStringField;
    cdsveicCHASSI: TStringField;
    cdsveicCODIGO: TIntegerField;
    cdsveicESPECIE: TStringField;
    cdsveicMARCA_V: TStringField;
    cdsveicMODELO: TIntegerField;
    cdsveicANOFAB: TIntegerField;
    cdsveicANOMOD: TIntegerField;
    cdsveicDESCMODELO: TStringField;
    cdsveicCOR: TStringField;
    cdsveicOBS: TStringField;
    cdsveicCOD_EMPRESA: TIntegerField;
    cdsveicCOD_CLIENTE: TIntegerField;
    cdsveicRENAVAM: TStringField;
    dspVeic: TDataSetProvider;
    qrVeic: TIBQuery;
    cdsAgendaCOD_EQUIP: TIntegerField;
    cdsAgendaCOD_VEICULO: TIntegerField;
    dsApar: TDataSource;
    dsveic: TDataSource;
    cdsAgendaPLACA: TStringField;
    cdsAgendaCHASSI: TStringField;
    cdsTemp: TClientDataSet;
    dsTemp: TDataSource;
    cdsTempCOD_VENDEDOR: TIntegerField;
    cdsTempNOME_VENDEDOR: TStringField;
    cdsTempDATA: TDateField;
    cdsTempDESC_FUNCAO: TStringField;
    cdsTempTIPO: TStringField;
    cdsAgendaMecanicoHORA_AGENDA: TStringField;
    cdsAgendaMecanicoCOD_VEICULO: TIntegerField;
    cdsAgendaMecanicoPLACA: TStringField;
    cdsAgendaMecanicoCHASSI: TStringField;
    cdsAgendaMecanicoCOD_EQUIP: TIntegerField;
    cdsAgendaMINUTO_AGENDA: TStringField;
    cdsAgendaMecanicoMINUTO_AGENDA: TStringField;
    procedure cdsAgendaOBSERVACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsveicBeforeOpen(DataSet: TDataSet);
    procedure cdsAparBeforeOpen(DataSet: TDataSet);
    procedure cdsAgendaMecanicoBeforeOpen(DataSet: TDataSet);
    procedure cdsServicosOSBeforeOpen(DataSet: TDataSet);
    procedure cdsBoxConsBeforeOpen(DataSet: TDataSet);
    procedure cdsMecanicoConsBeforeOpen(DataSet: TDataSet);
    procedure cdsClienteConsBeforeOpen(DataSet: TDataSet);
    procedure cdsServicoConsBeforeOpen(DataSet: TDataSet);
    procedure cdsAgendaItensBeforeOpen(DataSet: TDataSet);
    procedure cdsAgendaBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmAgenda: TDtmAgenda;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TDtmAgenda.cdsAgendaBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmAgenda.cdsAgendaItensBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmAgenda.cdsAgendaMecanicoBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmAgenda.cdsAgendaOBSERVACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not cdsAgendaOBSERVACAO.IsNull then
    Text := Copy(cdsAgendaOBSERVACAO.AsString, 1, 7) + '...';
end;

procedure TDtmAgenda.cdsAparBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmAgenda.cdsBoxConsBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmAgenda.cdsClienteConsBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmAgenda.cdsMecanicoConsBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmAgenda.cdsServicoConsBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmAgenda.cdsServicosOSBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmAgenda.cdsveicBeforeOpen(DataSet: TDataSet);
begin
  dtmAtivo.mudaSelect(TClientDataSet(DataSet), self);
end;

procedure TDtmAgenda.DataModuleCreate(Sender: TObject);
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

  try
    //    vDadosIniPedVenda := TSingleton.GetInstance;
    //    vDadosIniPedVenda.codEmpresa := '1';
    //    vDadosIniPedVenda.vCodOpCxl := 117;
    //    vDadosIniPedVenda.vNomeUsuario:= 'Teste';
    //    vDadosIniPedVenda.diaFCxl := strtodate('14/03/2008');
    //    vDadosIniPedVenda.vnomeEmpresa:= 'TesteNomeEmp';
    //    vDadosIniPedVenda.vNivel:=5;
    //    vDadosIniPedVenda.vUsarAuditoria:='S';
        //vdados.vPortaImpressao := vPortaImpressao;
        //vDadosIniPedVenda.vPortaImpressao :='';
        // vDadosIniEnt.setDadosConfig(vDadosIniFP);chamar este metodo logo apos a criacao deste dtm
        //criaDtm; chamar este metodo tambem para conectar ao banco
  except
  end;


end;

end.

