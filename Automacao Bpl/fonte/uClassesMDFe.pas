unit uClassesMDFe;

interface

uses
  uDataSet_OOP, uDtmAtivo, Db, Forms, DBClient, IBQuery, Classes;


type
  CPercurso = ( cpOrigem, cpDestino );
  CTipoMidia = (tmEmail, tmImpressao);

  RConsulta = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd: Boolean;
    //Opçoes Avanças
    avancada, adicional: boolean;
    situacaoAutAv, situacaoEventoAv: string;
    campoAd, valorAd, dataIniAd, dataFimAd, condicaoAd: string;
  end;

  TMDFe = class;
  TMDFe_Condutor = class;
  TMDFe_Carrega = class;
  TMDFe_Descarga = class;
  TMDFe_Descarga_NFe = class;
  TMDFe_Descarga_NFe_Unid_Tr = class;
  TMDFe_Descarga_NFe_Unid_Tr_Carga = class;
  TVeiculos_MDFe = class;

  TMDFE = class(TDataSet_OOP)
  private
    fIndiceEstado: Integer;
    fCodCarga: Integer;
    fListaEstados: TStringList;
    fBuscas, fBuscaStatus: TIBQuery;
    function GerarNumeroApply: Boolean;
  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    procedure cadMDFe(pTipoForm: integer);
    procedure alterarCondutor;
    function getCodIBGEUF(pPercurso: CPercurso): Integer;
    function lixeiraVazia: Boolean;
    function verLixeira: Boolean;
    procedure marcarMDFe;
    procedure marcarTodos;
    procedure desmarcarTodos;
    function validarDadosEnvio: Boolean;
    function confirmaMDFe: Boolean;
    procedure abreFormImpressaoEmail(pTipoMidia: CTipoMidia);
    function abreFormSelecionarEstado: Boolean;
    function inserirPelaCarga: Boolean;
    function getListaEstados: string;
    function montagemMDFePelaCargaEmAndamento: Boolean;
    procedure cancelarMontagemMDFePelaCarga;
    function mdfeAberto: Boolean;
    function consulta: Boolean;
    procedure somaTotais;

    procedure enviarLoteMDFe;
    procedure consultarLoteMDFe;
    procedure encerrarMDFe;
    procedure cancelarMDFe;
    procedure imprimeMDFe;
    procedure imprimeEventoMDFe;
    procedure enviaEmailMDFe(pSelecionados: Boolean);
    procedure enviaEmailEventoMDFe(pSelecionados: Boolean);
    function contingenciaAtivada: Boolean;
    procedure ativarDesativarContingencia;
    function validarConfiguracoes: Boolean;

//    1 - testar nfes sem cidades - - - - - -- - -  - - - - - - - - - - - - - - - OK
//    2 - colocar processos - - - - - -  - - - - - - - - - - - - - - - - - - - - -OK
//    3 - Testar status do MDFe antes de executar os metodos - - - - - - - - - - -OK
//    4 - Colocar Hint nos botoes e campos, todos - - - - -  - - - - --  - - - - -OK
//    5 - Colocar informacao nos hints de selecionar o lote ou o registro - - - - OK
//    6 - Montar por Ordem de Carregamento- - - - - - - - - - - - - - - - - - - - OK
//    7 - Tratar raiseexceptioncreate e colocar o metodo que deu o erro - - - - - OK
//    8 - colocar Screen.Cursosr:= crHourGlass; - - - - - - - - - - - - - - - - - OK
//    9 - Status processamento - -  - - -- - -  - - - - - - -- - - - - - - -- - --OK
//    10  Impressao em Contingencia - - - -  - - - - - - - - - -  --  - - -- - - -OK
//    11 Nao deixar enviar com a empresa em contingencia., apenas imprimir - - - -OK
//    12 Colocar para mudar a contingencia- - - - - -- - - - - - -  - - - - - - --OK
//    13 Colocar campos no cadastro da empresa- - - -- - - - - - -  - - - - - - --OK

    property IndiceEstado: Integer read fIndiceEstado write fIndiceEstado;
  var
    vCondutor: TMDFe_Condutor;
    vCarrega: TMDFe_Carrega;
    vDescarga: TMDFe_Descarga;
    vVeiculos: TVeiculos_MDFe;
    vCons: RConsulta;
  end;

  TMDFe_Condutor = class(TDataSet_OOP)
  private
    fCodMDFe: Integer;
    fBuscas: TIBQuery;
  public
    constructor create;
    function selecionaCondutor(pCodMDFe: Integer): Boolean;
    procedure adicionarCondutor(pNome, pCPF, pTerceiro: string);
    procedure removerCondutor;
  end;

  TMDFe_Carrega = class(TDataSet_OOP)
  private
    fCodMDFe: Integer;
    fBuscas: TIBQuery;
  public
    constructor Create;
    function selecionaCarrega(pCodMDFe: Integer): Boolean;
    procedure adicionarCidade(pCodIBGEUF: Integer; pCodIBGEMunicipio: Integer = 0);
    procedure removerCidade;
  end;

  TMDFe_Descarga = class(TDataSet_OOP)
  private
    FMDFe: TMDFe;
    fCodMDFe: Integer;
    fBuscas: TIBQuery;
  public
    destructor Destroy; override;
    constructor Create(AMDFe: TMDFe);

    function selecionaDescarga(pCodMDFe: Integer): Boolean;
    procedure adicionarCidade(pCodIBGEUF: Integer; pCodIBGEMunicipio: Integer = 0);
    procedure removerCidade;
  var
    vNFe: TMDFe_Descarga_NFe;
  end;

  TMDFe_Descarga_NFe = class(TDataSet_OOP)
  private
    FDescarga: TMDFe_Descarga;
    fCodMDFe: Integer;
    fBuscas: TIBQuery;
    FUnidTransporte: TMDFe_Descarga_NFe_Unid_Tr;
    FlkSimNao: TDadosLookUp_OOP;
  public
    destructor Destroy; override;
    constructor Create(ADescarga: TMDFe_Descarga);
    function selecinaNFe(pCodMDFe: Integer): Boolean;
    procedure adicionaNFE(pNumNF: Integer = 0; pCadMDFe: TMDFe = nil; pCodNF: Integer = 0); overload;
    procedure adicionaNFE(pNumNF, pCodEmpresa: Integer); overload;
    procedure adicionaNFE(ChaveNFe: string); overload;
    procedure removerNFe(pCadMDFe: TMDFe);
    procedure SalvarAlteracoes();

    property UnidTransporte: TMDFe_Descarga_NFe_Unid_Tr read FUnidTransporte write FUnidTransporte;
    property lkSimNao: TDadosLookUp_OOP read FlkSimNao write FlkSimNao;
  end;

  TMDFe_Descarga_NFe_Unid_Tr = class(TDataSet_OOP)
  private
    FOwer: TMDFe_Descarga_NFe;
    FUnidCarga: TMDFe_Descarga_NFe_Unid_Tr_Carga;
    FlkTipoUnTr: TDadosLookUp_OOP;
    procedure dataSetAfterScroll(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create(AOwer: TMDFe_Descarga_NFe);

    function post: Boolean; override;
    function Open: Boolean; override;
    function Delete: Boolean; override;
    function Filter: Boolean;

    property UnidCarga: TMDFe_Descarga_NFe_Unid_Tr_Carga read FUnidCarga write FUnidCarga;
    property lkTipoUnTr: TDadosLookUp_OOP read FlkTipoUnTr write FlkTipoUnTr;
  end;

  TMDFe_Descarga_NFe_Unid_Tr_Carga = class(TDataSet_OOP)
  private
    FOwer: TMDFe_Descarga_NFe_Unid_Tr;
    FlkTipoUnCarga: TDadosLookUp_OOP;
    procedure dataSetAfterOpen(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create(AOwer: TMDFe_Descarga_NFe_Unid_Tr);

    function post: Boolean; override;
    function Open: Boolean; override;
    function Filter: Boolean;
    function Delete: Boolean; override;

    property lkTipoUnCarga: TDadosLookUp_OOP read FlkTipoUnCarga write FlkTipoUnCarga;
  end;

  TVeiculos_MDFe = class(TDataSet_OOP)
  public
    constructor create;
    function abreVeiculos: Boolean;
    procedure filtrar(pReboque: Boolean);
  end;
var
  cadMDFe: TMDFe;

implementation

uses
  SysUtils, uDtmMDFe, uDadosIni, IBDatabase, uCadMDFe, Windows, Dialogs,
  uPadrao, hw_utils, StrUtils, Math;


function EnviarMDFE(vnumMDF: integer;codempresa: integer;vnumlote: integer;vendBanco: WideString;vusuario: WideString): WideString;stdcall;external 'hw.nfe.dx.dll';
function ConsultarMDFE(vnummdfe,vnumloteconsulta,codempresa: integer;vendBanco: WideString;vusuario: WideString): LongBool;stdcall;external 'hw.nfe.dx.dll';
function EnviaEventoMDFE(nmdfe: integer; codempresa: integer;vendBanco: WideString;vusuario: WideString): LongBool;stdcall;external 'hw.nfe.dx.dll';
function ImprimirMDFE(vnummdfe: integer;codempresa: integer;vendBanco: WideString;vusuario: WideString):LongBool;stdcall;external 'hw.nfe.dx.dll';
function ImprimirEventoMDFE(vnmdfe: integer;codempresa: integer;vendBanco: WideString;vusuario: WideString):LongBool;stdcall;external 'hw.nfe.dx.dll';
function EnviarEmailMDFE(vnmdfe: integer;codempresa,vtpop: integer;vendBanco: WideString;vusuario: WideString):LongBool;stdcall;external 'hw.nfe.dx.dll';
{
function EnviarMDFE(vnumMDF: integer;codempresa: integer;vnumlote: integer;vendBanco: WideString;vusuario: WideString): WideString;stdcall;external 'hw.mdfe.dx.dll';
function ConsultarMDFE(vnummdfe,vnumloteconsulta,codempresa: integer;vendBanco: WideString;vusuario: WideString): LongBool;stdcall;external 'hw.mdfe.dx.dll';
function EnviaEventoMDFE(nmdfe: integer; codempresa: integer;vendBanco: WideString;vusuario: WideString): LongBool;stdcall;external 'hw.mdfe.dx.dll';
function ImprimirMDFE(vnummdfe: integer;codempresa: integer;vendBanco: WideString;vusuario: WideString):LongBool;stdcall;external 'hw.mdfe.dx.dll';
function ImprimirEventoMDFE(vnmdfe: integer;codempresa: integer;vendBanco: WideString;vusuario: WideString):LongBool;stdcall;external 'hw.mdfe.dx.dll';
function EnviarEmailMDFE(vnmdfe: integer;codempresa,vtpop: integer;vendBanco: WideString;vusuario: WideString):LongBool;stdcall;external 'hw.mdfe.dx.dll';
}
{ TMDFE }

procedure TMDFE.abreFormImpressaoEmail(pTipoMidia: CTipoMidia);
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    if pTipoMidia = tmEmail then
      formulario.Caption := 'Envio de email'
    else
      formulario.Caption := 'Impressão MDF-e';
    frmCadMDFe.pnImpressaoEmail.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;
    formulario.ShowHint := True;
    formulario.ShowModal;

  finally
    frmCadMDFe.pnImpressaoEmail.Parent := frmCadMDFe.tsImpressaoEmail;
    formulario.Free;
    formulario := nil;
  end;
end;

function TMDFE.abreFormSelecionarEstado: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Selecione o estado para onde deseja criar o MDF-e';
    frmCadMDFe.pnSelecionaEstado.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;
    formulario.ShowHint := True;

    Result := (formulario.ShowModal = IDOK);

  finally
    frmCadMDFe.pnSelecionaEstado.Parent := frmCadMDFe.tsSelecionaEstado;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TMDFE.alterarCondutor;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  try

    if not mdfeAberto then
      raiseExceptionCreate('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', '');

    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR');
    if (Trim(vDadosIni.vPesquisa) <> '') then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select NOME_VENDEDOR, CPF_VENDEDOR from colaborador' +
        ' where COD_VENDEDOR = ' + vDadosIni.vPesquisa +
        ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
      buscas.Open;

      dataSet.FieldByName('XNOME_CONDUTOR').AsString := Copy(buscas.FieldByName('NOME_VENDEDOR').AsString, 1, 60);
      dataSet.FieldByName('CPF_CONDUTOR').AsString := Copy(buscas.FieldByName('CPF_VENDEDOR').AsString, 1, 11);
    end;

  except
    on e: exception do
    begin
      Application.MessageBox(PChar('Erro ao informar condutor' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TMDFE.ativarDesativarContingencia;
var
  vContingenciaAtivada: Boolean;
  vMensagem: string;
begin

  if not vDadosIni.PesqPros('MDFE029', 'CONFIGURAR', '', 'MDFE', '', buscas, true) then
    exit;

  try

    vContingenciaAtivada := contingenciaAtivada;

    if vContingenciaAtivada then
      vMensagem := 'Contingência Ativada. Deseja desativar?'
    else
      vMensagem := 'Deseja ativar a Contingência?';

    if Application.MessageBox(pchar(vMensagem), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'update empresa set TIPOMDFE = :TIPOMDFE' +
      ' where COD_EMPRESA = ' + vDadosIni.codEmpresa;
    if vContingenciaAtivada then
      buscas.ParamByName('TIPOMDFE').AsString := 'NORMAL'
    else
      buscas.ParamByName('TIPOMDFE').AsString := 'CONTINGENCIA';
    buscas.ExecSQL;

    CommitaTransacao;

    if vContingenciaAtivada then
      vDadosIni.GravaAuditoria('MDFE029', 'CONFIGURAR', 'CONTINGENCIA DESATIVADA', 'MDFE', '', buscas)
    else
      vDadosIni.GravaAuditoria('MDFE029', 'CONFIGURAR', 'CONTINGENCIA ATIVADA', 'MDFE', '', buscas);

  except
    on E: Exception do
    begin
      RollBackTransacao;

      vDadosIni.GravaAuditoria('MDFE029', 'CONFIGURAR', 'FALHA AO ATIVAR/DESATIVA CONTINGENCIA', 'MDFE', '', buscas);

      Application.MessageBox(PChar('Erro ao Ativar/Desativar Contingência' + #13 +
        'Erro: ' + e.Message), 'Atenção', 0 + 64);

      registraErro('procedure TMDFE.ativarDesativarContingencia. Erro: ' + e.Message);
    end;
  end;
end;

procedure TMDFE.cadMDFe(pTipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo MDFe');
  if dtmMDFe = nil then
    dtmMDFe := TdtmMDFe.Create(dtmMDFe);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('MDFE001', 'CONSULTA', '', 'MDFE', '', dtmMDFe.qrBuscas2, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadMDFe = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadMDFe, frmCadMDFe);
  end;

  if (pTipoForm > 0) and (not frmCadMDFe.Visible) then
    frmCadMDFe.ShowModal
  else if (not frmCadMDFe.Visible) then
    frmCadMDFe.Show
  else if frmCadMDFe.FormStyle = fsMDIChild then
    frmCadMDFe.Show
  else
    frmCadMDFe.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TMDFE.cancelarMDFe;
var
  vJustificativa: string;
begin

  if dataSet.IsEmpty then
    Exit;

  dataSet.RefreshRecord;

  try

    if contingenciaAtivada then
      raiseExceptionCreate('Contingência Ativada. Desative a Contingência para usar esta funcionalidade', '');

    if dataSet.FieldByName('NMDF').AsInteger = 0 then
      raiseExceptionCreate('MDFe ainda não foi Autorizado','');

    if Trim(dataSet.FieldByName('SITUACAO_MDFE').AsString) <> 'Autorizada' then
      raiseExceptionCreate('MDFe ainda não foi Autorizado','');

    if Trim(dataSet.FieldByName('SITUACAO_EVENTO').AsString) = 'Encerrado' then
      raiseExceptionCreate('MDFe não pode ser Cancelado pois ja foi Encerrado','');

    if Trim(dataSet.FieldByName('SITUACAO_EVENTO').AsString) = 'Cancelado' then
      raiseExceptionCreate('MDFe já esta Cancelado','');

    if not vDadosIni.PesqPros('MDFE013', 'CANCELAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
      ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
      exit;

    if not InputQuery('Justificativa', 'Descreva aqui sua justificativa para o cancelamento', vJustificativa) then
      Exit;

    if (Trim(vJustificativa) = '') or (Length(Trim(vJustificativa)) < 15) then
      raiseExceptionCreate('O preenchimento da justificativa é obrigatório e deve conter no mínimo 15 caracteres','');

    buscas.Close;
    buscas.SQL.Text := 'update MDFE set TIPO_EVENTO = ''CAN'',' +
      ' JUSTIFICATIVA = ' + QuotedStr(Trim(vJustificativa)) +
      ' where COD_MDFE = ' + IntToStr(dataSet.FieldByName('COD_MDFE').AsInteger) +
      ' and COD_EMPRESA =  ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    CommitaTransacao;

    if EnviaEventoMDFE(dataSet.FieldByName('NMDF').AsInteger, StrToInt(vDadosIni.codEmpresa), pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario)) then
    begin
      imprimeEventoMDFe;
      enviaEmailEventoMDFe(False);
//      ImprimirEventoMDFE(dataSet.FieldByName('NMDF').AsInteger, StrToInt(vDadosIni.codEmpresa), pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario));

      vDadosIni.GravaAuditoria('MDFE013', 'CANCELAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' SUCESSO', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
    end
    else
      vDadosIni.GravaAuditoria('MDFE013', 'CANCELAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' FALHA', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);

    dataSet.Refresh;
  except
    on E: Exception do
    begin
      RollBackTransacao;

      vDadosIni.GravaAuditoria('MDFE013', 'CANCELAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
      ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' FALHA', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);

      Application.MessageBox(PChar('Erro ao Cancelar MDFe' + #13 +
        'Erro: ' + e.Message), 'Atenção', 0 + 64);

      registraErro('procedure TMDFE.cancelarMDFe. Erro: ' + e.Message);

    end;
  end;
end;

procedure TMDFE.cancelarMontagemMDFePelaCarga;
begin
  fCodCarga := 0;
end;

function TMDFE.confirmaMDFe: Boolean;
var
  vOKAudit: Boolean;
begin

  Result := False;

  try

    if not mdfeAberto then
      raiseExceptionCreate('MDFe não pode mais ser alterado, pois já foi Autorizado ou está Em Processamento', '');

    vOKAudit := False;
    if dataSet.FieldByName('NMDF').AsInteger = 0 then
    begin
      vOKAudit := True;
      buscas.Close;
      buscas.SQL.Text := 'select e.serie_mdfe, e.rntrc, e.ciot, ' + vDadosIni.FusoSqlDate + ' databanco from empresa e where e.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;
    
      if Trim(buscas.FieldByName('serie_mdfe').AsString) = '' then
        raiseExceptionCreate('Série para emissão do MDFe não definida no cadastro da empresa', '');

      dataSet.FieldByName('DHEMI').AsDateTime := buscas.FieldByName('DATABANCO').AsDateTime;
      dataSet.FieldByName('SERIE').AsInteger := buscas.FieldByName('serie_mdfe').AsInteger;
      dataSet.FieldByName('MODAL').AsInteger := 1;
      dataSet.FieldByName('TPEMIT').AsInteger := 2;
      dataSet.FieldByName('MODELO').AsInteger := 58;

      if buscas.FieldByName('RNTRC').AsInteger > 0 then
        dataSet.FieldByName('RNTRC').AsInteger := buscas.FieldByName('RNTRC').AsInteger;

      if buscas.FieldByName('CIOT').AsInteger > 0 then
        dataSet.FieldByName('CIOT').AsInteger := buscas.FieldByName('CIOT').AsInteger;

      if vDadosIni.vEmp.vNfe.webServiceAmbiente = 'Produção' then
        dataSet.FieldByName('TPAMB').AsInteger := 1
      else
        dataSet.FieldByName('TPAMB').AsInteger := 2;

      dataSet.FieldByName('NMDF').AsInteger := Gencodigo('MDFE_NMDFE' + IntToStr(dataSet.FieldByName('SERIE').AsInteger),
        dtmMDFe.SpIncCodigo,vDadosIni.codEmpresa);
    end;

    somaTotais;

    Result := inherited Post;
    if (Result) and (dataSet.ChangeCount > 0) then
      Result := Apply;

    if (Result) and (vCondutor.dataSet.ChangeCount > 0) then
      Result := vCondutor.Apply;

    if (Result) and (vCarrega.dataSet.ChangeCount > 0) then
      Result := vCarrega.Apply;

    if (Result) and (vDescarga.dataSet.ChangeCount > 0) then
      Result := vDescarga.Apply;

    if (Result) and (vDescarga.vNFe.dataSet.ChangeCount > 0) then
      Result := vDescarga.vNFe.Apply;

    if Result then
    begin
      CommitaTransacao;
      if vOKAudit then
        vDadosIni.GravaAuditoria('MDFE025', 'CONFIRMAR', 'SUCESSO', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      if vOKAudit then
        vDadosIni.GravaAuditoria('MDFE025', 'CONFIRMAR', 'FALHA', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
    end;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TMDFE.confirmaMDFe. Erro: ' + e.Message);
    end;
  end;
end;

function TMDFE.consulta: Boolean;
var
  I, erro: Integer;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
begin
  try
    if vCons.porData then
    begin
      try
        erro := 0;
        StrToDate(vCons.dataIni);
      except
        vCons.dataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(vCons.dataFim);
      except
        vCons.dataFim := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
          MB_OK + MB_ICONINFORMATION);
      end;
    end; //porData
    vsqlAdicional := '';
    if vCons.adicional then
      if not vCons.porDataAd then
        if Trim(vCons.valorAd) = '' then
          vCons.adicional := False;

    if vCons.adicional then
    begin
      if vCons.porDataAd then
      begin
        try
          erro := 0;
          StrToDate(vCons.dataIniAd);
        except
          vCons.dataIniAd := '';
          erro := erro + 1;
        end;
        try
          StrToDate(vCons.dataFimAd);
        except
          vCons.dataFimAd := '';
          erro := erro + 1;
        end;
        if erro = 2 then
        begin
          Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
            'Atenção', MB_OK + MB_ICONINFORMATION);
        end
        else
        begin
          if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
            formatodata := 'mm/dd/yyyy'
          else if pos('.', ShortDateFormat) <> 0 then
            formatodata := 'dd.mm.yyyy';
          if vCons.dataIniAd <> '' then
            vCons.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataIniAd)));
          if vCons.dataFimAd <> '' then
            vCons.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataFimAd)));
        end;
      end
      else
      begin
        vCons.dataIniAd := '';
        vCons.dataFimAd := '';
      end;
      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
      else if vCons.condicaoAd = 'Diferente' then
        vCons.condicaoAd := '<>'
      else if (vCons.condicaoAd = 'Esta contido') then
        vCons.condicaoAd := 'like'
      else if (vCons.condicaoAd = 'Começa') then
        vCons.condicaoAd := 'Começa'
      else
        vCons.condicaoAd := '=';
      for I := 0 to dataSet.FieldCount - 1 do
      begin
        if Dataset.Fields[I].FieldKind = fkData then
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vCons.campoAd) then
          begin
            vCons.campoAd := DataSet.Fields[I].FieldName;
            if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
              (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
              ((vCons.condicaoAd = 'Começa') or (vCons.condicaoAd = 'Começa')) then
            begin
              vCons.condicaoAd := '=';
              if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              begin
                try
                  vCons.valorAd := IntToStr(StrToInt(Trim(vCons.valorAd)));
                except
                  vCons.valorAd := '0';
                  Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
                end;
              end
              else
              vCons.valorAd := vDadosIni.tirapontos(vCons.valorAd, 4);
            end
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
            begin
              if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := ' and ' + vCons.campoAd + ' >= ' + vCons.dataIniAd + ' and ' +
                  vCons.campoAd + ' <= ' + vCons.dataIniAd
              else if (vCons.dataFimAd <> '') then
                vsqlAdicional := ' and ' + vCons.campoAd + ' <= ' + vCons.dataIniAd
              else if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := ' and ' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
              Break;
            end;
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := ' and ' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd +
                '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := ' and ' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := ' and ' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' +
                QuotedStr(vCons.valorAd);
            Break;
          end;
        end;
      end;
    end; //adicional

    if vCons.avancada then
    begin
      if vCons.situacaoAutAv = 'Autorizados' then
        vsqlAdicional := vsqlAdicional + ' and SITUACAO_MDFE = ' + QuotedStr('Autorizada')
      else if vCons.situacaoAutAv = 'Em Processamento' then
        vsqlAdicional := vsqlAdicional + ' and SITUACAO_MDFE = ' + QuotedStr('Em Processamento')
      else if vCons.situacaoAutAv = 'Rejeitados' then
        vsqlAdicional := vsqlAdicional + ' and SITUACAO_MDFE = ' + QuotedStr('Rejeitada')
      else if vCons.situacaoAutAv = 'Não Autorizados' then
        vsqlAdicional := vsqlAdicional + ' and coalesce(SITUACAO_MDFE, '''') = ''''';

      if vCons.situacaoEventoAv = 'Encerrados' then
        vsqlAdicional := vsqlAdicional + ' and SITUACAO_EVENTO = ' + QuotedStr('Encerrado')
      else if vCons.situacaoEventoAv = 'Cancelados' then
        vsqlAdicional := vsqlAdicional + ' and SITUACAO_EVENTO = ' + QuotedStr('Cancelado')
      else if vCons.situacaoEventoAv = 'Sem Evento' then
        vsqlAdicional := vsqlAdicional + ' and coalesce(SITUACAO_EVENTO, '''') = ''''';
    end; //avancada

    vCons.ordem := 'COD_MDFE';

    if ((vCons.avancada) or (vcons.adicional)) and (Trim(vsqlAdicional) <> '') then
    begin
      if vCons.porData then
        result := ConsultaCampos('MDFE', vCons.campo, vCons.ordem, vCons.dataIni,
          vCons.dataFim, vsqlAdicional, vDadosIni.codEmpresa)
      else
        result := ConsultaCampos('MDFE', vCons.valor, vCons.campo, vCons.condicao,
          vCons.ordem, vsqlAdicional, False, vDadosIni.codEmpresa);
    end
    else
    begin
      if vCons.porData then
        result := ConsultaCampos('MDFE', vCons.campo, vCons.ordem, vCons.dataIni,
          vCons.dataFim, vDadosIni.codEmpresa)
      else
        result := ConsultaCampos('MDFE', vCons.valor, vCons.campo, vCons.condicao,
          vCons.ordem, False, vDadosIni.codEmpresa);
    end;
  finally
//    vsqlTemp := dataSet.CommandText;
  end;
end;

procedure TMDFE.consultarLoteMDFe;
var
  vLoteConsultaMDFe: Integer;
begin
  if not vDadosIni.PesqPros('MDFE011', 'CONSULTAR', '', 'MDFE', '', fbuscas, true) then
    exit;

  try

    if contingenciaAtivada then
      raiseExceptionCreate('Contingência Ativada. Desative a Contingência para usar esta funcionalidade', '');

    try
      dataSet.Filter := 'SEL = ''S''';
      dataSet.Filtered := True;

      if dataSet.IsEmpty then
      begin
        Application.MessageBox(pchar('Nenhum registro foi selecionado' + #13 +
          'Utilize Ctrl + Clique do Mouse ou barra de Espaço no(s) registro(s) desejado(s) e clique novamente no botão'),
          'Atenção', 0 + 64);
        Exit;
      end;

      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('NMDF').AsInteger = 0 then
          if Application.MessageBox('MDFe sem numero. Ele não irá ser consultado. Deseja continuar mesmo assim?',
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
            Exit;
        dataSet.Next;
      end;

      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('NMDF').AsInteger = 0 then
        begin
          dataSet.Edit;
          dataSet.FieldByName('SEL').AsString := '';
          dataSet.Post;
        end;
        dataSet.Next;
      end;
    
      dataSet.Filtered := False;
      dataSet.Filter := 'SEL = ''S''';
      dataSet.Filtered := True;

      if dataSet.IsEmpty then
        Exit;

      vLoteConsultaMDFe := 0;
      try

        vLoteConsultaMDFe := Gencodigo('MDFE_LOTE_CONSULTA', dtmMDFe.SpIncCodigo,vDadosIni.codEmpresa);

        dataSet.First;
        while not dataSet.Eof do
        begin
          dataSet.Edit;
          dataSet.FieldByName('LOTEMDFE_CONSULTA').AsInteger := vLoteConsultaMDFe;
          dataSet.Post;
          Apply;

          vDadosIni.GravaAuditoria('MDFE011', 'CONSULTA', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
            ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' ADICIONADO AO LOTE: ' + IntToStr(vLoteConsultaMDFe), 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);

          dataSet.Next;
        end;

        CommitaTransacao;

        if ConsultarMDFE(0, vLoteConsultaMDFe, StrToInt(vDadosIni.codEmpresa), pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario)) then
          vDadosIni.GravaAuditoria('MDFE011', 'CONSULTA', 'LOTE: ' + IntToStr(vLoteConsultaMDFe) + ' SUCESSO', 'MDFE', '', buscas)
        else
          vDadosIni.GravaAuditoria('MDFE011', 'CONSULTA', 'LOTE: ' + IntToStr(vLoteConsultaMDFe) + ' FALHA', 'MDFE', '', buscas);
      except
        on E: exception do
        begin
          RollBackTransacao;
          vDadosIni.GravaAuditoria('MDFE011', 'CONSULTA', 'LOTE: ' + IntToStr(vLoteConsultaMDFe) + ' FALHA', 'MDFE', '', buscas);

          Application.MessageBox(PChar('Erro na consulta do lote: ' + IntToStr(vLoteConsultaMDFe) + #13 +
            'Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        end;
      end;

    finally
      dataSet.Filtered := False;
      dataSet.Filter := '';
    end;

  except
    on e: exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TMDFE.contingenciaAtivada: Boolean;
begin
  Result := False;
  try
    buscas.Close;
    buscas.SQL.Text := 'select TIPOMDFE from empresa' +
      ' where COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;

    Result := (buscas.FieldByName('TIPOMDFE').AsString) = 'CONTINGENCIA';
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao verificar Contingência' + #13 +
        'Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TMDFE.contingenciaAtivada. Erro: ' + e.Message);
    end;
  end;
end;

constructor TMDFE.create;
begin
  if dtmMDFe = nil then
    dtmMDFe := TdtmMDFe.Create(dtmMDFe);
  dataSet := TClientDataSet(dtmmdfe.cdsMDFe);
  transacao := TIBTransaction(dtmMDFe.transacao);
  buscas := TIBQuery(dtmMDFe.qrBuscas);
  fBuscas := TIBQuery(dtmMDFe.qrBuscas2);
  fBuscaStatus := TIBQuery(dtmMDFe.qrBuscas3);
  fListaEstados := TStringList.Create;
  cancelarMontagemMDFePelaCarga;

  vCondutor := TMDFe_Condutor.create;
  vCarrega := TMDFe_Carrega.create;
  vDescarga := TMDFe_Descarga.create(Self);
  vVeiculos := TVeiculos_MDFe.create;

end;

function TMDFE.delete: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger = 0 then
    Exit;

  try

    if not mdfeAberto then
      raiseExceptionCreate('MDFe não pode mais ser excluído, pois já foi Autorizado ou está Em Processamento', '');

    if not vDadosIni.PesqPros('MDFE007', 'EXCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
      ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
      exit;

    if Application.MessageBox('Deseja mesmo excluir o registro selecionado', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    dataSet.Edit;
    dataSet.FieldByName('ativo').AsInteger := 0;
    dataSet.Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('MDFE007', 'EXCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' SUCESSO', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
      dataSet.Refresh;
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('MDFE007', 'EXCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' FALHA', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
      dataSet.Refresh;
    end;

  except
    on e: exception do
    begin
      RollBackTransacao;

      vDadosIni.GravaAuditoria('MDFE007', 'EXCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' FALHA', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);

      Application.MessageBox(PChar('Erro ao excluir MDFe' + #13 +
        'Erro: ' + e.Message), 'Atenção', 0 + 64);

      registraErro('function TMDFE.delete. Erro: ' + e.Message);
    end;
  end;
end;

procedure TMDFE.desmarcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if (not dataSet.Active) or (dataSet.IsEmpty) then
      Exit;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

destructor TMDFE.Destroy;
begin
  vCondutor.Free;
  vCondutor := nil;
  vCarrega.Free;
  vCarrega := nil;
  vDescarga.Free;
  vDescarga := nil;
  vVeiculos.Free;
  vVeiculos := nil;
  
  inherited;
end;

procedure TMDFE.encerrarMDFe;
begin
  if dataSet.IsEmpty then
    Exit;

  dataSet.RefreshRecord;

  if dataSet.FieldByName('NMDF').AsInteger = 0 then
    Exit;

  try

    if contingenciaAtivada then
      raiseExceptionCreate('Contingência Ativada. Desative a Contingência para usar esta funcionalidade', '');

    if dataSet.FieldByName('NMDF').AsInteger = 0 then
      raiseExceptionCreate('MDFe ainda não foi Autorizado','');

    if Trim(dataSet.FieldByName('SITUACAO_MDFE').AsString) <> 'Autorizada' then
      raiseExceptionCreate('MDFe ainda não foi Autorizado','');

    if Trim(dataSet.FieldByName('SITUACAO_EVENTO').AsString) = 'Cancelado' then
      raiseExceptionCreate('MDFe não pode ser Encerrado pois já foi Cancelado','');

    if Trim(dataSet.FieldByName('SITUACAO_EVENTO').AsString) = 'Encerrado' then
      raiseExceptionCreate('MDFe já esta Encerrado','');

    if not vDadosIni.PesqPros('MDFE012', 'ENCERRAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
      ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
      exit;

    buscas.Close;
    buscas.SQL.Text := 'update MDFE set TIPO_EVENTO = ''ENC''' +
      ' where COD_MDFE = ' + IntToStr(dataSet.FieldByName('COD_MDFE').AsInteger) +
      ' and COD_EMPRESA =  ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    CommitaTransacao;

    if EnviaEventoMDFE(dataSet.FieldByName('NMDF').AsInteger, StrToInt(vDadosIni.codEmpresa), pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario)) then
    begin
      imprimeEventoMDFe;
      enviaEmailEventoMDFe(False);
//      ImprimirEventoMDFE(dataSet.FieldByName('NMDF').AsInteger, StrToInt(vDadosIni.codEmpresa), pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario));

      vDadosIni.GravaAuditoria('MDFE012', 'ENCERRAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' SUCESSO', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
    end
    else
      vDadosIni.GravaAuditoria('MDFE012', 'ENCERRAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' FALHA', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);

    dataSet.Refresh;
  except
    on E: Exception do
    begin
      RollBackTransacao;

      vDadosIni.GravaAuditoria('MDFE012', 'ENCERRAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
      ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' FALHA', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);

      Application.MessageBox(PChar('Erro ao Encerrar MDFe' + #13 +
        'Erro: ' + e.Message), 'Atenção', 0 + 64);

      registraErro('procedure TMDFE.encerrarMDFe. Erro: ' + e.Message);

    end;
  end;
end;

function TMDFE.edit: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('MDFE005', 'ALTERAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
    ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
    exit;

  if inherited Edit then
  begin
    Result := True;

    vCondutor.selecionaCondutor(dataSet.FieldByName('COD_MDFE').AsInteger);
    vCarrega.selecionaCarrega(dataSet.FieldByName('COD_MDFE').AsInteger);
    vDescarga.selecionaDescarga(dataSet.FieldByName('COD_MDFE').AsInteger);
    vVeiculos.abreVeiculos;
    vDescarga.vNFe.dataSet.Filtered := False;
    vDescarga.vNFe.dataSet.Filter := '';

    if not mdfeAberto then
      dataSet.Cancel;
  end;
end;

procedure TMDFE.enviaEmailEventoMDFe(pSelecionados: Boolean);
begin

  try
    if dataSet.IsEmpty then
      Exit;

    if pSelecionados then
    begin
      if not vDadosIni.PesqPros('MDFE015', 'EMAIL', '', 'MDFE', '', fbuscas, true) then
        exit;
    end
    else if not vDadosIni.PesqPros('MDFE015', 'EMAIL', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
      ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
      exit;

    if pSelecionados then
      dataSet.Filter := 'SEL = ''S'''
    else
      dataSet.Filter := 'COD_MDFE = ' + IntToStr(dataSet.FieldByName('COD_MDFE').AsInteger);

    dataSet.Filtered := True;

    while not dataSet.Eof do
    begin
      //if Trim(dataSet.FieldByName('SITUACAO_EVENTO').AsString) <> '' then
      if queryCons.Table('MDFE', 'situacao_evento')
        .Equals('cod_mdfe', fint('NMDF'))
        .Equals('cod_empresa', fint('cod_empresa'))
        .Scalar.AsString <> ''
      then
        if EnviarEmailMDFE(dataSet.FieldByName('NMDF').AsInteger, StrToInt(vDadosIni.codEmpresa), 3, pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario)) then
          if pSelecionados then
            vDadosIni.GravaAuditoria('MDFE015', 'EMAIL', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
              ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
      dataSet.Next;
    end;

  finally
    dataSet.Filtered := False;
    dataSet.Filter := '';
  end;
end;

procedure TMDFE.enviaEmailMDFe(pSelecionados: Boolean);
begin
  try
    if dataSet.IsEmpty then
      Exit;

    if pSelecionados then
    begin
      if not vDadosIni.PesqPros('MDFE014', 'EMAIL', '', 'MDFE', '', fbuscas, true) then
        exit;
    end
    else if not vDadosIni.PesqPros('MDFE014', 'EMAIL', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
        exit;

    if pSelecionados then
      dataSet.Filter := 'SEL = ''S'''
    else
      dataSet.Filter := 'COD_MDFE = ' + IntToStr(dataSet.FieldByName('COD_MDFE').AsInteger);

    dataSet.Filtered := True;

    while not dataSet.Eof do
    begin
      if Trim(dataSet.FieldByName('SITUACAO_MDFE').AsString) <> '' then
      begin
        if EnviarEmailMDFE(dataSet.FieldByName('NMDF').AsInteger, StrToInt(vDadosIni.codEmpresa), 2, pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario)) then
          if pSelecionados then
            vDadosIni.GravaAuditoria('MDFE014', 'EMAIL', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
              ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
      end;
      dataSet.Next;
    end;

  finally
    dataSet.Filtered := False;
    dataSet.Filter := '';
  end;
end;

procedure TMDFE.enviarLoteMDFe;
var
  vLoteMDFe: Integer;
  vProcessoConfMDFE: Boolean;
begin
  if not vDadosIni.PesqPros('MDFE010', 'ENVIAR', '', 'MDFE', '', fbuscas, true) then
    exit;

  try

    if contingenciaAtivada then
      raiseExceptionCreate('Contingência Ativada. Utilize apenas a impressão ou desative a Contingência', '');

    try
      vProcessoConfMDFE := False;
      dataSet.Filter := 'SEL = ''S''';
      dataSet.Filtered := True;

      if dataSet.IsEmpty then
      begin
        Application.MessageBox(pchar('Nenhum registro foi selecionado' + #13 +
          'Utilize Ctrl + Clique do Mouse ou barra de Espaço no(s) registro(s) desejado(s) e clique novamente no botão'),
          'Atenção', 0 + 64);
        Exit;
      end;

      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('NMDF').AsInteger = 0 then
        begin
          if not vProcessoConfMDFE then
          begin
            vProcessoConfMDFE:= True;
            if not vDadosIni.PesqPros('MDFE025', 'SALVAR', '', 'MDFE', '', fbuscas, true) then
              exit;
          end;

          dataSet.Edit;
          vCondutor.selecionaCondutor(dataSet.FieldByName('COD_MDFE').AsInteger);
          vCarrega.selecionaCarrega(dataSet.FieldByName('COD_MDFE').AsInteger);
          vDescarga.selecionaDescarga(dataSet.FieldByName('COD_MDFE').AsInteger);

          vDadosIni.GravaAuditoria('MDFE025', 'SALVAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
              ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);

          if not confirmaMDFe then
            raiseExceptionCreate('Ha MDFe''s sem número. Houve falhas durante o processo. Repita a operação', '');
        end;
        dataSet.Next;
      end;

      // Comentei aqui e abaixo pois o componente do ACBR nao estava aceitando mais de um MDFe por lote
      // Caso futuramente ele aceitar basta descomentar estas linhas e comenta-las dentro do while
      //vLoteMDFe := Gencodigo('MDFE_LOTE_ENVIO', dtmMDFe.SpIncCodigo,vDadosIni.codEmpresa);

      dataSet.First;
      while not dataSet.Eof do
      begin
        vCondutor.selecionaCondutor(dataSet.FieldByName('COD_MDFE').AsInteger);
        vCarrega.selecionaCarrega(dataSet.FieldByName('COD_MDFE').AsInteger);
        vDescarga.selecionaDescarga(dataSet.FieldByName('COD_MDFE').AsInteger);
        if (mdfeAberto) and (validarDadosEnvio) then
        begin

          try
            vDadosIni.GravaAuditoria('MDFE010', 'ENVIAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
              ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);

            // Teste acbr comentado acima
            vLoteMDFe := Gencodigo('MDFE_LOTE_ENVIO', dtmMDFe.SpIncCodigo,vDadosIni.codEmpresa);
            //
            dataSet.Edit;
            dataSet.FieldByName('LOTE_MDFE').AsInteger := vLoteMDFe;
            dataSet.Post;
            Apply;
            if vCondutor.dataSet.ChangeCount > 0 then
              vCondutor.Apply;
            if vDescarga.dataSet.ChangeCount > 0 then
              vDescarga.Apply;

            // Teste acbr comentado acima
            CommitaTransacao;
            EnviarMDFE(0,StrToInt(vDadosIni.codEmpresa), vLoteMDFe, pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario));

            vDadosIni.GravaAuditoria('MDFE010', 'ENVIAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
              ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' SUCESSO', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
            //

          except
            on e: exception do
            begin
              RollBackTransacao;

              vDadosIni.GravaAuditoria('MDFE010', 'ENVIAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
                ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' FALHA', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);

              Application.MessageBox(PChar('Falha no processo de envio do MDFe: ' + dataSet.FieldByName('NMDF').AsString + #13 +
                'Erro: ' + e.Message), 'Atenção', 0 + 64);

              if Application.MessageBox('Deseja continuar com o processamento?',
                'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
                Exit;
            end;
          end;
        end;
        dataSet.Next;
      end;

      // Teste acbr comentado acima
      //CommitaTransacao;
      //EnviarMDFE(0,StrToInt(vDadosIni.codEmpresa), vLoteMDFe, pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario));
      //

      dataSet.Refresh;
    finally
      dataSet.Filtered := False;
      dataSet.Filter := '';
    end;
  except
    on e: exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TMDFE.GerarNumeroApply: Boolean;
  procedure SetCodMDFE(ADataSet: TClientDataSet);
  begin
    ADataSet.Filtered := False;
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      ADataSet.Edit;
      ADataSet.FieldByName('COD_MDFE').AsInteger := DataSet.FieldByName('COD_MDFE').AsInteger;
      ADataSet.Post;
      ADataSet.Next;
    end;
  end;

begin

  if dataSet.State = dsInsert then
  begin
    dataSet.FieldByName('COD_MDFE').AsInteger := Gencodigo('MDFE', dtmMDFe.SpIncCodigo,vDadosIni.codEmpresa);

    vDescarga.vNFe.UnidTransporte.dataSet.AfterScroll := nil;

    SetCodMDFE(vCondutor.dataSet);
    SetCodMDFE(vCarrega.dataSet);
    SetCodMDFE(vDescarga.dataSet);
    SetCodMDFE(vDescarga.vNFe.dataSet);
    SetCodMDFE(vDescarga.vNFe.UnidTransporte.dataSet);
    SetCodMDFE(vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet);

    Result :=  inherited Post;

    if Result then
      Result := Apply;

    dataSet.Edit;

    if (Result) and (vCondutor.dataSet.ChangeCount > 0) then
      Result := vCondutor.Apply;

    if (Result) and (vCarrega.dataSet.ChangeCount > 0) then
      Result := vCarrega.Apply;

    if (Result) and (vDescarga.dataSet.ChangeCount > 0) then
      Result := vDescarga.Apply;

    if (Result) and (vDescarga.vNFe.dataSet.ChangeCount > 0) then
      Result := vDescarga.vNFe.Apply;

    if (Result) and (vDescarga.vNFe.UnidTransporte.dataSet.ChangeCount > 0) then
      Result := vDescarga.vNFe.UnidTransporte.Apply;

    if (Result) and (vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet.ChangeCount > 0) then
      Result := vDescarga.vNFe.UnidTransporte.UnidCarga.Apply;
  end;

end;

function TMDFE.getCodIBGEUF(pPercurso: CPercurso): Integer;
begin
  buscas.Close;
  buscas.SQL.Text := 'select IBGE_CODIGO_UF from ESTADOS' +
    ' where SIGLA_UF = :SIGLA_UF and ATIVO = 1';
  if pPercurso = cpOrigem then
    buscas.ParamByName('SIGLA_UF').AsString := dataSet.FieldByName('UFINI').AsString
  else
    buscas.ParamByName('SIGLA_UF').AsString := dataSet.FieldByName('UFFIM').AsString;
  buscas.Open;

  Result := buscas.FieldByName('IBGE_CODIGO_UF').AsInteger;

end;

function TMDFE.getListaEstados: string;
begin
  Result := fListaEstados.Text;
end;

procedure TMDFE.imprimeEventoMDFe;
begin
  if not vDadosIni.PesqPros('MDFE009', 'IMPRIMIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
    ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
    exit;
  ImprimirEventoMDFE(dataSet.FieldByName('NMDF').AsInteger, StrToInt(vDadosIni.codEmpresa), pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario));
end;

procedure TMDFE.imprimeMDFe;
begin
  if not vDadosIni.PesqPros('MDFE008', 'IMPRIMIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
    ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
    exit;

  imprimirMDFe(dataSet.FieldByName('NMDF').AsInteger, StrToInt(vDadosIni.codEmpresa), pchar(vDadosIni.vBancoHW), pchar(vDadosIni.vNomeUsuario));
end;

function TMDFE.inserirPelaCarga: Boolean;
var
  vCarga: string;
  vCodCarga: Integer;
  vChaves: TClientDataSet;
  I: Integer;
  vOK: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('MDFE004', 'INCLUIR', '', 'MDFE', '', fbuscas, true) then
    exit;

  if dataSet.Active then
    dataSet.Cancel;

  if fCodCarga = 0 then
    if not InputQuery('Carga', 'Informe o número da carga', vCarga) then
      Exit;

  try

    if fCodCarga > 0 then
      vCodCarga := fCodCarga
    else
      try
        vCodCarga := StrToInt(Trim(vCarga));
        if vCodCarga <= 0 then
          raiseExceptionCreate('','');
      except
        raiseExceptionCreate('Carga informada inválida','');
      end;

    vDadosIni.abreStatusProcessamento('MDF-e pela Carga', 'Pesquisando carga no banco de dados');

    buscas.Close;
    buscas.SQL.Text :=
      'select e.sigla_uf, c.status, c.data_saida, nf.cod_nf,  nf.chave_nfe, count(nf.cod_nf) from carga c' +
      ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
      ' inner join notafiscal_item ni on ni.nped = ci.cod_venda and ni.tipo_ped = ci.tipo_venda and' +
      ' ni.cod_empresa = ci.cod_empresa' +
      ' inner join notafiscal nf on nf.cod_nf = ni.cod_nf and nf.cod_empresa = ni.cod_empresa and' +
      ' nf.natureza_nf = ''S'' and nf.status = ''Fechada'' and nf.modelo_nf = ''55'' and' +
      ' nf.situacao_nfe = ''Autorizada'' and nf.ativo = 1' +
      ' left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
  //
      ' left join cidades cid on cid.cod_cidade = cl.cod_cidade' +
      ' left join cidades_ibge ibge on ibge.codigo_mun_ibge = cid.ibge_cod_cidade' +
      ' left join estados e on e.ibge_codigo_uf = ibge.codigo_uf_ibge' +
  //    ' inner join estados e on e.codigo_uf = cl.codigo_uf' +
      ' where c.cod_carga = ' + IntToStr(vCodCarga) +
      ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
      ' group by 1,2,3,4,5' +
      ' order by 1';
    buscas.Open;

    if buscas.IsEmpty then
      if fCodCarga = 0 then
        raiseExceptionCreate('Não foram encontradas NF-e(s) para a Carga informada ou ela não existe', '')
      else
        Exit;

    vDadosIni.GravaAuditoria('MDFE004', 'INCLUIR', 'CARGA: ' + IntToStr(vCodCarga) + ' STATUS: ' + Trim(buscas.FieldByName('status').AsString),
      'MDFE', '', fBuscas);

    if fCodCarga = 0 then
      if Trim(buscas.FieldByName('status').AsString) <> 'FECHADA' then
      begin
        Application.MessageBox('Carga informada não esta Fechada', 'Atenção', 0 + 64);

        if not vDadosIni.PesqPros('MDFE028', 'VALIDAR', 'CARGA: ' + IntToStr(vCodCarga) + ' STATUS: ' + Trim(buscas.FieldByName('status').AsString),
          'MDFE', '', fBuscas, True, True) then
          Exit;
      end;

    vChaves := TClientDataSet.Create(Application);
    try
      vChaves.FieldDefs.Clear;
      vChaves.FieldDefs.Add('SIGLA_UF', ftString, 2, False);
      vChaves.FieldDefs.Add('COD_NF', ftInteger, 0, False);
      vChaves.FieldDefs.Add('CHAVE_NFE', ftString, 44, False);
      vChaves.CreateDataSet;
      vChaves.EmptyDataSet;

      vDadosIni.abreStatusProcessamento('', 'Salvando informações das NF-e(s)');

      buscas.First;
      while not buscas.Eof do
      begin
        vChaves.Insert;
        vChaves.FieldByName('SIGLA_UF').AsString := buscas.FieldByName('SIGLA_UF').AsString;
        vChaves.FieldByName('COD_NF').AsString := buscas.FieldByName('COD_NF').AsString;
        vChaves.FieldByName('CHAVE_NFE').AsString := buscas.FieldByName('CHAVE_NFE').AsString;
        vChaves.Post;
        buscas.Next;
      end;

      fListaEstados.Clear;

      buscas.First;
      while not buscas.Eof do
      begin
        vOK := True;
        for I := 0 to fListaEstados.Count - 1 do
          if Trim(fListaEstados[I]) = Trim(buscas.FieldByName('sigla_uf').AsString) then
          begin
            vOK := False;
            Break;
          end;

        if vOK then
          fListaEstados.Add(Trim(buscas.FieldByName('sigla_uf').AsString));
        buscas.Next;
      end;

      for I := 0 to fListaEstados.Count - 1 do
      begin
        buscas.Close;
        buscas.SQL.Text := 'select m.cod_mdfe, m.nmdf, m.situacao_mdfe, m.situacao_evento from mdfe m' +
          ' where m.COD_CARGA = ' + IntToStr(vCodCarga) +
          ' and m.COD_EMPRESA = ' + vDadosIni.codEmpresa +
          ' and m.UFFIM = ' + QuotedStr(Copy(fListaEstados[I],1,2)) +
          ' and coalesce(m.SITUACAO_EVENTO,'''') <> ''Cancelado''' +
          ' and m.ATIVO = 1';
        buscas.Open;

        if not buscas.IsEmpty then
          fListaEstados[i] := Copy(fListaEstados[I],1,2) + ' - ' +
            ' Cod: ' + IntToStr(buscas.FieldByName('cod_mdfe').AsInteger) +
            ' Num MDFe: ' + IntToStr(buscas.FieldByName('nmdf').AsInteger) +
            ' Situacao: ' + Trim(buscas.FieldByName('situacao_mdfe').AsString) +
            ' Evento: ' + Trim(buscas.FieldByName('situacao_evento').AsString);
      end;

      fIndiceEstado := 0;
      for I := 0 to fListaEstados.Count - 1 do
        if Length(fListaEstados[I]) = 2 then
        begin
          fIndiceEstado := I;
          Break;
        end;

      if fCodCarga > 0 then
      begin
        vOK := False;
        for I := 0 to fListaEstados.Count - 1 do
          if Length(fListaEstados[I]) = 2 then
          begin
            vOK := True;
            Break;
          end;
        if not vOK then
          Exit;
      end;

      if fListaEstados.Count > 1 then
      begin
        if not abreFormSelecionarEstado then
          Exit;

        if (fIndiceEstado < 0) or (fIndiceEstado > (fListaEstados.Count - 1)) then
          Exit;
      end;

      if Length(fListaEstados[fIndiceEstado]) > 2 then
      begin
        Application.MessageBox(pchar('Já existe MDFe para esta combinação de Carga: ' + IntToStr(vCodCarga) +
          ' e Estado: ' + fListaEstados[fIndiceEstado]), 'Atenção', 0 + 64);

        if not vDadosIni.PesqPros('MDFE027', 'VALIDAR', 'CARGA: ' + IntToStr(vCodCarga) + ' ESTADO: ' + UpperCase(fListaEstados[fIndiceEstado]),
          'MDFE', '', fBuscas, True, True) then
          Exit;
      end;

      vDadosIni.abreStatusProcessamento('', 'Montando MDF-e');

      if not Insert then
        Exit;

      buscas.Close;
      buscas.SQL.Text := 'select c.cod_veic,  col.nome_vendedor, col.cpf_vendedor from carga c' +
        ' left join colaborador col on col.cod_vendedor = c.cod_motorista and col.cod_empresa = c.cod_empresa' +
        ' where c.cod_carga = ' + IntToStr(vCodCarga) +
        ' and c.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      dataSet.FieldByName('COD_CARGA').AsInteger := vCodCarga;
      dataSet.FieldByName('COD_VEIC').AsInteger := buscas.FieldByName('COD_VEIC').AsInteger;
      dataSet.FieldByName('UFFIM').AsString := copy(fListaEstados[fIndiceEstado],1,2);
      dataSet.FieldByName('XNOME_CONDUTOR').AsString := buscas.FieldByName('NOME_VENDEDOR').AsString;
      dataSet.FieldByName('CPF_CONDUTOR').AsString := buscas.FieldByName('CPF_VENDEDOR').AsString;

      try
        vChaves.Filter := 'SIGLA_UF = ' + QuotedStr(dataSet.FieldByName('UFFIM').AsString);
        vChaves.Filtered := True;

        vChaves.First;
        while not vChaves.Eof do
        begin
          vDescarga.vNFe.adicionaNFE(0, Self, vChaves.FieldByName('COD_NF').AsInteger);
          vChaves.Next;
        end;
      finally
        vChaves.Filtered := False;
        vChaves.Filter := '';
      end;

      fListaEstados[fIndiceEstado] := Copy(fListaEstados[fIndiceEstado],1,2) + ' - Em Andamento';
      fCodCarga := vCodCarga;

      Result := True;
    finally
      vChaves.Free;
      vChaves := nil;
      if not Result then
        cancelarMontagemMDFePelaCarga;
      vDadosIni.fechaStatusProcessamento;
    end;

  except
    on e: exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TMDFE.insert: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('MDFE003', 'INCLUIR', '', 'MDFE', '', fbuscas, true) then
    exit;

  if not dataSet.Active then
    montaSelect('select * from MDFE where COD_MDFE = 0 and COD_EMPRESA = ' + vDadosIni.codEmpresa);

  if inherited insert then
  begin
    dataSet.FieldByName('COD_MDFE').AsInteger := 0;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('CUNID').AsInteger := 1;
    dataSet.FieldByName('UFINI').AsString := vDadosIni.vEmp.vSiglaUF;   
    dataSet.FieldByName('VERSAO').AsInteger := 1;

    vCondutor.selecionaCondutor(dataSet.FieldByName('COD_MDFE').AsInteger);
    vCarrega.selecionaCarrega(dataSet.FieldByName('COD_MDFE').AsInteger);
    vDescarga.selecionaDescarga(dataSet.FieldByName('COD_MDFE').AsInteger);
    vVeiculos.abreVeiculos;

    vCarrega.adicionarCidade(getCodIBGEUF(cpOrigem), vDadosIni.vEmp.vNfe.ibgeCodCidade);
    Result := True;
  end;
end;

function TMDFE.lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('select first 1 cod_mdfe from mdfe where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 0');
end;

procedure TMDFE.marcarMDFe;
begin
  if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;  
end;

procedure TMDFE.marcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if (not dataSet.Active) or (dataSet.IsEmpty) then
      Exit;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TMDFE.mdfeAberto: Boolean;
begin
  Result := True;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('COD_MDFE').AsInteger = 0 then
    Exit;

  if dataSet.FieldByName('NMDF').AsInteger = 0 then
    Exit;

  fBuscaStatus.Close;
  fBuscaStatus.SQL.Text := 'select SITUACAO_MDFE from MDFE' +
    ' where COD_MDFE = ' + IntToStr(dataSet.FieldByName('COD_MDFE').AsInteger) +
    ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
  fBuscaStatus.Open;

  Result := (Trim(fBuscaStatus.FieldByName('SITUACAO_MDFE').AsString) <> 'Autorizada') and (Trim(fBuscaStatus.FieldByName('SITUACAO_MDFE').AsString) <> 'Em Processamento');
end;

function TMDFE.montagemMDFePelaCargaEmAndamento: Boolean;
begin
  Result := fCodCarga > 0;
end;

function TMDFE.post: Boolean;
var
  acao: string;
  vCodMDFe: Integer;
  AListUFPer: TStrings;

  procedure validarVeiculos(pCodVeiculo: Integer; pTextoVeiculo, pCampo: string);
  begin

    buscas.Close;
    buscas.SQL.Text := 'select COD_VEIC from VEICULOS_TRANSPORTE' +
      ' where COD_VEIC = ' + IntToStr(pCodVeiculo) +
      ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
      raiseExceptionCreate(pTextoVeiculo + ' não encontrado no cadastro', pCampo);

    if buscas.FieldByName('COD_VEIC').AsInteger = 0 then
      raiseExceptionCreate(pTextoVeiculo + ' não encontrado no cadastro', pCampo);
  end;

  procedure SetCodMDFE(ADataSet: TClientDataSet);
  begin
    ADataSet.Filtered := False;
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      ADataSet.Edit;
      ADataSet.FieldByName('COD_MDFE').AsInteger := DataSet.FieldByName('COD_MDFE').AsInteger;
      ADataSet.Post;
      ADataSet.Next;
    end;
  end;

begin
  Result := False;

  if not vDadosIni.PesqPros('MDFE006', 'SALVAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
    ' NUM: ' + dataSet.FieldByName('NMDF').AsString, 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
    exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('UFINI').AsString) = '' then
      raiseExceptionCreate('UF Partida não preenchida', 'DBComboBox1');

    if Trim(dataSet.FieldByName('UFFIM').AsString) = '' then
      raiseExceptionCreate('UF Destino não preenchida', 'DBComboBox2');

    if Trim(dataSet.FieldByName('COD_VEIC').AsString) <> '' then
      validarVeiculos(dataSet.FieldByName('COD_VEIC').AsInteger, 'Veículo', 'DBEdit11');

    if Trim(dataSet.FieldByName('COD_VEIC_REBOQUE_1').AsString) <> '' then
      validarVeiculos(dataSet.FieldByName('COD_VEIC_REBOQUE_1').AsInteger, 'Reboque 1', 'DBEdit12');

    if Trim(dataSet.FieldByName('COD_VEIC_REBOQUE_2').AsString) <> '' then
      validarVeiculos(dataSet.FieldByName('COD_VEIC_REBOQUE_2').AsInteger, 'Reboque 2', 'DBEdit13');

    if Trim(dataSet.FieldByName('COD_VEIC_REBOQUE_3').AsString) <> '' then
      validarVeiculos(dataSet.FieldByName('COD_VEIC_REBOQUE_3').AsInteger, 'Reboque 3', 'DBEdit14');

    AListUFPer := TStringList.Create();
    try
      AListUFPer.LineBreak := ',';
      AListUFPer.Text := dataSet.FieldByName('UFPER').AsString;

      if AListUFPer.IndexOf(dataSet.FieldByName('UFINI').AsString) >= 0 then
        AListUFPer.Delete(AListUFPer.IndexOf(dataSet.FieldByName('UFINI').AsString));

      if AListUFPer.IndexOf(dataSet.FieldByName('UFFIM').AsString) >= 0 then
        AListUFPer.Delete(AListUFPer.IndexOf(dataSet.FieldByName('UFFIM').AsString));

      dataSet.FieldByName('UFPER').AsString := AListUFPer.Text;
    finally
      FreeAndNil(AListUFPer);
    end;

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('COD_MDFE').AsInteger := Gencodigo('MDFE', dtmMDFe.SpIncCodigo,vDadosIni.codEmpresa);

      vDescarga.vNFe.UnidTransporte.dataSet.AfterScroll := nil;

      SetCodMDFE(vCondutor.dataSet);
      SetCodMDFE(vCarrega.dataSet);
      SetCodMDFE(vDescarga.dataSet);
      SetCodMDFE(vDescarga.vNFe.dataSet);
      SetCodMDFE(vDescarga.vNFe.UnidTransporte.dataSet);
      SetCodMDFE(vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet);
      {
      vCondutor.dataSet.First;
      while not vCondutor.dataSet.Eof do
      begin
        vCondutor.dataSet.Edit;
        vCondutor.dataSet.FieldByName('COD_MDFE').AsInteger := dataSet.FieldByName('COD_MDFE').AsInteger;
        vCondutor.dataSet.Post;
        vCondutor.dataSet.Next;
      end;

      vCarrega.dataSet.First;
      while not vCarrega.dataSet.Eof do
      begin
        vCarrega.dataSet.Edit;
        vCarrega.dataSet.FieldByName('COD_MDFE').AsInteger := dataSet.FieldByName('COD_MDFE').AsInteger;
        vCarrega.dataSet.Post;
        vCarrega.dataSet.Next;
      end;

      vDescarga.dataSet.First;
      while not vDescarga.dataSet.Eof do
      begin
        vDescarga.dataSet.Edit;
        vDescarga.dataSet.FieldByName('COD_MDFE').AsInteger := dataSet.FieldByName('COD_MDFE').AsInteger;
        vDescarga.dataSet.Post;
        vDescarga.dataSet.Next;
      end;

      vDescarga.vNFe.dataSet.First;
      while not vDescarga.vNFe.dataSet.Eof do
      begin
        vDescarga.vNFe.dataSet.Edit;
        vDescarga.vNFe.dataSet.FieldByName('COD_MDFE').AsInteger := dataSet.FieldByName('COD_MDFE').AsInteger;
        vDescarga.vNFe.dataSet.Post;
        vDescarga.vNFe.dataSet.Next;
      end;

      vDescarga.vNFe.UnidTransporte.dataSet.AfterScroll := nil;
      vDescarga.vNFe.UnidTransporte.dataSet.Filtered := False;
      vDescarga.vNFe.UnidTransporte.dataSet.First;
      while not vDescarga.vNFe.UnidTransporte.dataSet.Eof do
      begin
        vDescarga.vNFe.UnidTransporte.dataSet.Edit;
        vDescarga.vNFe.UnidTransporte.dataSet.FieldByName('COD_MDFE').AsInteger := dataSet.FieldByName('COD_MDFE').AsInteger;
        vDescarga.vNFe.UnidTransporte.dataSet.Post;
        vDescarga.vNFe.UnidTransporte.dataSet.Next;
      end;

      vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet.Filtered := False;
      vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet.First;
      while not vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet.Eof do
      begin
        vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet.Edit;
        vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet.FieldByName('COD_MDFE').AsInteger := dataSet.FieldByName('COD_MDFE').AsInteger;
        vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet.Post;
        vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet.Next;
      end;
      }
    end;

    vCodMDFe := dataSet.FieldByName('COD_MDFE').AsInteger;

    Result := inherited Post;
    if (Result) and (dataSet.ChangeCount > 0) then
      Result := Apply;

    if (Result) and (vCondutor.dataSet.ChangeCount > 0) then
      Result := vCondutor.Apply;

    if (Result) and (vCarrega.dataSet.ChangeCount > 0) then
      Result := vCarrega.Apply;

    if (Result) and (vDescarga.dataSet.ChangeCount > 0) then
      Result := vDescarga.Apply;

    if (Result) and (vDescarga.vNFe.dataSet.ChangeCount > 0) then
      Result := vDescarga.vNFe.Apply;

    if (Result) and (vDescarga.vNFe.UnidTransporte.dataSet.ChangeCount > 0) then
      Result := vDescarga.vNFe.UnidTransporte.Apply;

    if (Result) and (vDescarga.vNFe.UnidTransporte.UnidCarga.dataSet.ChangeCount > 0) then
      Result := vDescarga.vNFe.UnidTransporte.UnidCarga.Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('MDFE006', 'SALVAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' SUCESSO', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
      try dataSet.Refresh; except end;

      vCondutor.selecionaCondutor(vCodMDFe);
      vCarrega.selecionaCarrega(vCodMDFe);
      vDescarga.selecionaDescarga(vCodMDFe);
      if dataSet.FieldByName('cod_mdfe').AsInteger <> vCodMDFe then
        montaSelect('select * from MDFE where COD_MDFE = ' + IntToStr(vCodMDFe) + ' and COD_EMPRESA = ' + vDadosIni.codEmpresa);
      if dataSet.FieldByName('cod_mdfe').AsInteger = vCodMDFe then
        dataSet.Edit;

      vDescarga.vNFe.dataSet.Filtered := False;
      vDescarga.vNFe.dataSet.Filter := '';
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('MDFE006', 'SALVAR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + dataSet.FieldByName('NMDF').AsString + ' FALHA', 'MDFE', dataSet.FieldByName('COD_MDFE').AsString, buscas);
    end;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TMDFE.post. Erro: ' + e.Message);
    end;
  end;

end;

procedure TMDFE.somaTotais;
var
  vQtdNF: Integer;
  vValorNF, vPesoNF: Extended;
  vFiltro: string;
begin
  try
    vQtdNF := 0;
    vValorNF := 0;
    vPesoNF := 0;
    vFiltro := '';

    vDescarga.dataSet.Filtered := False;
    vDescarga.dataSet.Filter := '';

    vDescarga.vNFe.dataSet.Filtered := False;
    vDescarga.vNFe.dataSet.Filter := '';



    vDescarga.vNFe.dataSet.First;
    while not vDescarga.vNFe.dataSet.Eof do
    begin
      vQtdNF := vQtdNF + 1;
      vValorNF := vValorNF + vDescarga.vNFe.dataSet.FieldByName('VALOR_TOTAL_NF').AsFloat;
      vPesoNF := vPesoNF + vDescarga.vNFe.dataSet.FieldByName('PESO_BRUTO_NF').AsFloat;
      
      vDescarga.vNFe.dataSet.Next;
    end;

    if dataSet.State in [dsEdit, dsInsert] then
    begin
      dataSet.FieldByName('QNFE').AsInteger := vQtdNF;
      dataSet.FieldByName('VCARGA').AsFloat := vValorNF;
      dataSet.FieldByName('QCARGA').AsFloat := vPesoNF;
    end;

  finally
  end;
end;

function TMDFE.validarConfiguracoes: Boolean;
begin
  Result := False;
  try
    buscas.Close;
    buscas.SQL.Text := 'select SERIE_MDFE, TIPOMDFE from empresa' +
      ' where COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if ((buscas.FieldByName('TIPOMDFE').AsString) <> 'CONTINGENCIA') and
      ((buscas.FieldByName('TIPOMDFE').AsString) <> 'NORMAL') then
    begin
      buscas.Close;
      buscas.SQL.Text := 'UPDATE EMPRESA SET TIPOMDFE = ''NORMAL'' WHERE TIPOMDFE IS NULL';
      buscas.ExecSQL;

      CommitaTransacao;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select SERIE_MDFE, TIPOMDFE from empresa' +
      ' where COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if ((buscas.FieldByName('TIPOMDFE').AsString) <> 'CONTINGENCIA') and
      ((buscas.FieldByName('TIPOMDFE').AsString) <> 'NORMAL') then
      raiseExceptionCreate('Tipo de Emissão não Configurado. Clique no botão Ativar/Desativar Contingência para configurar', '');
      
    buscas.Close;
    buscas.SQL.Text := 'select SERIE_MDFE, TIPOMDFE from empresa' +
      ' where COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.FieldByName('SERIE_MDFE').AsInteger <= 0 then
    begin
      buscas.Close;
      buscas.SQL.Text := 'UPDATE EMPRESA SET SERIE_MDFE = 1 WHERE coalesce(SERIE_MDFE, 0) <= 0';
      buscas.ExecSQL;

      CommitaTransacao;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select SERIE_MDFE, TIPOMDFE from empresa' +
      ' where COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.FieldByName('SERIE_MDFE').AsInteger <= 0 then
      raiseExceptionCreate('Série do MDFe não Configurada. Acesse o cadastro da empresa e defina um valor maior que zero', '');

    Result := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao validar configurações' + #13 +
        'Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TMDFE.contingenciaAtivada. Erro: ' + e.Message);
    end;
  end;
end;

function TMDFE.validarDadosEnvio: Boolean;
var
  vFiltroTemp: string;

  procedure validarVeiculos(pCodVeiculo: Integer; pTextoVeiculo, pCampo: string);
  begin

    buscas.Close;
    buscas.SQL.Text := 'select * from VEICULOS_TRANSPORTE' +
      ' where COD_VEIC = ' + IntToStr(pCodVeiculo) +
      ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
      raiseExceptionCreate(pTextoVeiculo + ' não encontrado no cadastro', pCampo);

    if buscas.FieldByName('COD_VEIC').AsInteger = 0 then
      raiseExceptionCreate(pTextoVeiculo + ' não encontrado no cadastro', pCampo);

    if Trim(buscas.FieldByName('PLACA').AsString) = '' then
      raiseExceptionCreate('Placa não informada para o ' + pTextoVeiculo, pCampo);

    if buscas.FieldByName('TARA').AsInteger <= 0 then
      raiseExceptionCreate('Tara não informada ou inválida para o ' + pTextoVeiculo, pCampo);

    if buscas.FieldByName('PESO_MAXIMO').AsInteger < 0 then
      raiseExceptionCreate('Peso Máximo em KG inválido no cadastro do ' + pTextoVeiculo, pCampo);

    if buscas.FieldByName('CAPM3').AsInteger < 0 then
      raiseExceptionCreate('Capacidade Máx em Metros Cúbicos inválida no cadastro do ' + pTextoVeiculo, pCampo);

    if buscas.FieldByName('TPROD').AsInteger <= 0 then
      raiseExceptionCreate('Tipo de Rodado não informado ou inválido para o ' + pTextoVeiculo, pCampo);

    if (buscas.FieldByName('TPCAR').AsInteger < 0) or (Trim(buscas.FieldByName('TPCAR').AsString) = '') then
      raiseExceptionCreate('Tipo de Carroceria não informado ou inválido para o ' + pTextoVeiculo, pCampo);

    if Trim(buscas.FieldByName('UF_LICENCIADO').AsString) = '' then
      raiseExceptionCreate('UF em que veiculo esta licenciado não informada para o ' + pTextoVeiculo, pCampo);

    if (Pos(Trim(buscas.FieldByName('UF_LICENCIADO').AsString), vDadosIni.getListaUF) = 0) then
      raiseExceptionCreate('UF em que veiculo esta licenciado não encontrada na lista de UF''s para o ' + pTextoVeiculo, pCampo);

    if Trim(buscas.FieldByName('TERCEIRO').AsString) = 'S' then
    begin
      if buscas.FieldByName('RNTRC_TERCEIRO').AsInteger <= 0 then
        raiseExceptionCreate('RNTRC do Terceiro Proprietário do ' + pTextoVeiculo + ' não informada no cadastro', pCampo);

      if (buscas.FieldByName('TPPROP_TERCEIRO').AsInteger < 0) or (Trim(buscas.FieldByName('TPPROP_TERCEIRO').AsString) = '') then
        raiseExceptionCreate('Tipo Proprietário não informado ou inválido para o ' + pTextoVeiculo + ' no cadastro', pCampo);

      fBuscas.Close;
      fBuscas.SQL.Text := 'select cpfcgc from CLIENTES' +
        ' where COD_CLIENTE = ' + IntToStr(buscas.FieldByName('COD_PROP_TERCEIRO').AsInteger) +
        ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
      fBuscas.Open;

      if fBuscas.IsEmpty then
        raiseExceptionCreate('Proprietário não informado ou inválido para o ' + pTextoVeiculo + ' no cadastro', pCampo);

      if Trim(fBuscas.FieldByName('cpfcgc').AsString) = '' then
        raiseExceptionCreate('CPF ou CNPJ do Proprietário não informado ou inválido para o ' + pTextoVeiculo, pCampo);
    end;

  end;
begin
  Result :=  False;

  try

    if Trim(dataSet.FieldByName('UFINI').AsString) = '' then
      raiseExceptionCreate('UF Partida não preenchida', 'DBComboBox1');

    if Trim(dataSet.FieldByName('UFFIM').AsString) = '' then
      raiseExceptionCreate('UF Destino não preenchida', 'DBComboBox2');

    if (Trim(dataSet.FieldByName('XNOME_CONDUTOR').AsString) = '') then
      raiseExceptionCreate('Nome do condutor não informado', '');

    if (Trim(dataSet.FieldByName('CPF_CONDUTOR').AsString) = '') then
      raiseExceptionCreate('CPF do condutor não informado', '');

    if dataSet.FieldByName('COD_VEIC').AsInteger = 0 then
      raiseExceptionCreate('Veículo principal não informado', '');

    if Trim(dataSet.FieldByName('COD_VEIC').AsString) <> '' then
      validarVeiculos(dataSet.FieldByName('COD_VEIC').AsInteger, 'Veículo', 'DBEdit11');

    if Trim(dataSet.FieldByName('COD_VEIC_REBOQUE_1').AsString) <> '' then
      validarVeiculos(dataSet.FieldByName('COD_VEIC_REBOQUE_1').AsInteger, 'Reboque 1', 'DBEdit12');

    if Trim(dataSet.FieldByName('COD_VEIC_REBOQUE_2').AsString) <> '' then
      validarVeiculos(dataSet.FieldByName('COD_VEIC_REBOQUE_2').AsInteger, 'Reboque 2', 'DBEdit13');

    if Trim(dataSet.FieldByName('COD_VEIC_REBOQUE_3').AsString) <> '' then
      validarVeiculos(dataSet.FieldByName('COD_VEIC_REBOQUE_3').AsInteger, 'Reboque 3', 'DBEdit14');

    vCondutor.adicionarCondutor(
      dataSet.FieldByName('XNOME_CONDUTOR').AsString,
      dataSet.FieldByName('CPF_CONDUTOR').AsString,
      dataSet.FieldByName('TERCEIRO_CONDUTOR').AsString);

    if vCondutor.dataSet.RecordCount = 0 then
      raiseExceptionCreate('Nenhuma condutor informado', '');

    if vCarrega.dataSet.RecordCount = 0 then
      raiseExceptionCreate('Nenhuma cidades para carregamento informada', '');

    if vDescarga.dataSet.RecordCount = 0 then
      raiseExceptionCreate('Nenhuma cidades para descarregamento informada', '');

    if vDescarga.vNFe.dataSet.RecordCount = 0 then
      raiseExceptionCreate('Nenhuma NFe informada', '');

    buscas.Close;
    buscas.SQL.Text := 'select m.cod_mdfe, m.nmdf, m.situacao_mdfe, m.situacao_evento from mdfe m' +
      ' where m.COD_VEIC = ' + IntToStr(dataSet.FieldByName('COD_VEIC').AsInteger) +
      ' and m.UFINI = ' + QuotedStr(dataSet.FieldByName('UFINI').AsString) +
      ' and m.UFFIM = ' + QuotedStr(dataSet.FieldByName('UFFIM').AsString) +
      ' and coalesce(m.situacao_evento,'''') <> ''Cancelado''' +
      ' and coalesce(m.situacao_evento,'''') <> ''Encerrado''' +
      ' and coalesce(m.situacao_mdfe,'''') = ''Autorizada''' +
      ' and m.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if not buscas.IsEmpty then
      raiseExceptionCreate('Já existe o MDFe de número: ' + IntToStr(buscas.FieldByName('NMDF').AsInteger) +
        ' pendente de Encerramento para o mesmo UF Origem, UF Destino e mesmo veículo', '');

    try
      vFiltroTemp := '';
      vDescarga.dataSet.First;
      while not vDescarga.dataSet.Eof do
      begin
        vDescarga.vNFe.dataSet.Filter := 'CMUNDESCARGA = ' + IntToStr(vDescarga.dataSet.FieldByName('CMUNDESCARGA').AsInteger);
        vDescarga.vNFe.dataSet.Filtered := True;

        if vDescarga.vNFe.dataSet.IsEmpty then
          if Application.MessageBox(pchar(
          'Cidade ' + vDescarga.dataSet.FieldByName('XMUNDESCARGA').AsString + ' sem nenhuma NF-e informada. O sistema irá remover a cidade deste MDFe. Deseja continuar?'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) <> ID_YES then
            Exit;

        vDescarga.dataSet.Next;
      end;

//      A propria constraint ja remove, nao precisa do codigo abaixo
//      vDescarga.dataSet.First;
//      while not vDescarga.dataSet.Eof do
//      begin
//        vDescarga.vNFe.dataSet.Filter := 'CMUNDESCARGA = ' + IntToStr(vDescarga.dataSet.FieldByName('CMUNDESCARGA').AsInteger);
//        vDescarga.vNFe.dataSet.Filtered := True;
//
//        if vDescarga.vNFe.dataSet.IsEmpty then
//          vDescarga.dataSet.Delete;
//
//        vDescarga.dataSet.Next;
//      end;
    finally
      vDescarga.vNFe.dataSet.Filter := Trim(vFiltroTemp);
      vDescarga.vNFe.dataSet.Filtered := Trim(vFiltroTemp) <> '';
    end;

    Result := True;

  except
    on e: exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TMDFE.verLixeira: Boolean;
begin
  Result := False;
  if lixeiraVazia then
    Exit;

  montaSelect('select * from MDFE where ATIVO = 0 and COD_EMPRESA = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

{ TMDFe_Condutor }

procedure TMDFe_Condutor.adicionarCondutor(pNome, pCPF, pTerceiro: string);
begin

  try

    if Trim(pNome) = '' then
      raiseExceptionCreate('Nome do Condutor deve ser informado', 'DBEdit9');

    if Trim(pCPF) = '' then
      raiseExceptionCreate('CPF do Condutor deve ser informado', 'DBEdit10')
    else if not Cpf(pCPF) then
      raiseExceptionCreate('CPF do Condutor informado inválido', 'DBEdit10');

    try
      dataSet.Filter := 'CPF = ' + QuotedStr(pCPF);
      dataSet.Filtered := True;
      if Trim(dataSet.FieldByName('CPF').AsString) = (Trim(pCPF)) then
        Exit;
    finally
      dataSet.Filtered := True;
      dataSet.Filter := '';
    end;
  
    if not vDadosIni.PesqPros('MDFE020', 'INCLUIR', 'COD: ' + IntToStr(fCodMDFe) +
      ' CONDUTOR: ' + Trim(pNome) + ' CPF: ' + Trim(pCPF), 'MDFE_CONDUTOR',
      IntToStr(fCodMDFe) , fbuscas, true) then
      exit;

    dataSet.Insert;
    dataSet.FieldByName('COD_MDFE').AsInteger := fCodMDFe;
    dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('CPF').AsString := Copy(pCPF,1,11);
    dataSet.FieldByName('XNOME').AsString := Copy(pNome, 1, 60);
    dataSet.FieldByName('TERCEIRO').AsString := Copy(pTerceiro, 1, 1);
    dataSet.Post;

    if fCodMDFe > 0 then
      Apply;

    vDadosIni.GravaAuditoria('MDFE020', 'INCLUIR', 'COD: ' + IntToStr(fCodMDFe)  +
      ' CONDUTOR: ' + Trim(dataSet.FieldByName('XNOME').AsString) + ' CPF: ' + Trim(dataSet.FieldByName('CPF').AsString) + ' A CONFIRMAR', 'MDFE_CONDUTOR',
        IntToStr(fCodMDFe) , buscas);

    IndexFieldNames := 'XNOME';

  except
    on e: exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

constructor TMDFe_Condutor.create;
begin
  if dtmMDFe = nil then
    dtmMDFe := TdtmMDFe.Create(dtmMDFe);
  dataSet := TClientDataSet(dtmmdfe.cdsMDFeCond);
  transacao := TIBTransaction(dtmMDFe.transacao);
  buscas := TIBQuery(dtmMDFe.qrBuscas);
  fBuscas := TIBQuery(dtmMDFe.qrBuscas2);
end;

procedure TMDFe_Condutor.removerCondutor;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('MDFE021', 'EXCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
    ' CONDUTOR: ' + Trim(dataSet.FieldByName('XNOME').AsString) + ' CPF: ' + Trim(dataSet.FieldByName('CPF').AsString), 'MDFE_CONDUTOR',
    dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
    Exit;

  if Application.MessageBox('Deseja mesmo excluir o registro selecionado?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  if dataSet.RecordCount = 1 then
    if Application.MessageBox('Deve existir pelo menos 1 Condutor no MDFe. Deseja mesmo remover o único condutor informado?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

  dataSet.Delete;
  if fCodMDFe > 0 then
    Apply;

  vDadosIni.GravaAuditoria('MDFE021', 'EXCLUIR', 'SUCESSO - A CONFIRMAR', 'MDFE_CONDUTOR', '', buscas); 
end;

function TMDFe_Condutor.selecionaCondutor(pCodMDFe: Integer): Boolean;
begin
  Result := montaSelect('select * from MDFE_CONDUTOR' +
    ' where COD_MDFE = ' + IntToStr(pCodMDFe) +
    ' and COD_EMPRESA = ' + vDadosIni.codEmpresa);
  fCodMDFe := pCodMDFe;
end;

{ TMDFe_Carrega }

procedure TMDFe_Carrega.adicionarCidade(pCodIBGEUF: Integer; pCodIBGEMunicipio: Integer = 0);
begin

  try

    if pCodIBGEMunicipio = 0 then
    begin
      if not vDadosIni.PesqPros('MDFE016', 'INCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' UF IBGE: ' + IntToStr(pCodIBGEUF) + ' CIDADE IBGE: ' + IntToStr(pCodIBGEMunicipio), 'MDFE_CARREGA',
          dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
        exit;

      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES_IBGE', 'and CIDADES_IBGE.CODIGO_UF_IBGE = ' + IntToStr(pCodIBGEUF), 'Consulta de Cidades Cadastradas pelo IBGE');
    end
    else
      vDadosIni.vPesquisa := IntToStr(pCodIBGEMunicipio);
    if (vDadosIni.vPesquisa) = '' then
      Exit;

    try
      StrToInt(Trim(vDadosIni.vPesquisa));
    except
      if pCodIBGEMunicipio = 0 then
        raiseExceptionCreate('Cidade não encontrada','')
      else
        raiseExceptionCreate('Cidade não encontrada pelo codigo IBGE do Cadastro da Empresa','')
    end;

    buscas.Close;
    buscas.SQL.Text := 'select CODIGO_MUN_IBGE, NOME_MUNICIPIO from CIDADES_IBGE' +
      ' where CODIGO_MUN_IBGE =  ' + Trim(vDadosIni.vPesquisa) +
      ' and ATIVO = 1';
    buscas.Open;

    if buscas.IsEmpty then
      if pCodIBGEMunicipio = 0 then
        raiseExceptionCreate('Cidade não encontrada','')
      else
        raiseExceptionCreate('Cidade não encontrada pelo codigo IBGE do Cadastro da Empresa','');

    try
      dataSet.Filter := 'CMUNCARREGA = ' + IntToStr(buscas.FieldByName('CODIGO_MUN_IBGE').AsInteger);
      dataSet.Filtered := True;
      if dataSet.FieldByName('CMUNCARREGA').AsInteger = buscas.FieldByName('CODIGO_MUN_IBGE').AsInteger then
        Exit;
    finally
      dataSet.Filtered := True;
      dataSet.Filter := '';
    end;

    if pCodIBGEMunicipio <> 0 then
      if not vDadosIni.PesqPros('MDFE016', 'INCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' UF IBGE: ' + IntToStr(pCodIBGEUF) + ' CIDADE IBGE: ' + IntToStr(pCodIBGEMunicipio), 'MDFE_CARREGA',
          dataSet.FieldByName('COD_MDFE').AsString, fBuscas, true) then
        exit;

    dataSet.Insert;
    dataSet.FieldByName('COD_MDFE').AsInteger := fCodMDFe;
    dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('CMUNCARREGA').AsInteger := buscas.FieldByName('CODIGO_MUN_IBGE').AsInteger;
    dataSet.FieldByName('XMUNCARREGA').AsString := Copy(buscas.FieldByName('NOME_MUNICIPIO').AsString, 1, 60);
    dataSet.Post;

    if fCodMDFe > 0 then
      Apply;

    vDadosIni.GravaAuditoria('MDFE016', 'INCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
      ' UF IBGE: ' + IntToStr(pCodIBGEUF) + ' CIDADE IBGE: ' + dataSet.FieldByName('CMUNCARREGA').AsString + ' ' +
      dataSet.FieldByName('XMUNCARREGA').AsString + ' - A CONFIRMAR', 'MDFE_CARREGA', dataSet.FieldByName('COD_MDFE').AsString, buscas);

    IndexFieldNames := 'XMUNCARREGA';

  except
    on e: exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;

end;

constructor TMDFe_Carrega.Create;
begin
  if dtmMDFe = nil then
    dtmMDFe := TdtmMDFe.Create(dtmMDFe);
  dataSet := TClientDataSet(dtmmdfe.cdsMDFeCar);
  transacao := TIBTransaction(dtmMDFe.transacao);
  buscas := TIBQuery(dtmMDFe.qrBuscas);
  fBuscas := TIBQuery(dtmMDFe.qrBuscas2);
end;

procedure TMDFe_Carrega.removerCidade;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('MDFE017', 'EXCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
    ' CIDADE IBGE: ' + dataSet.FieldByName('CMUNCARREGA').AsString + ' ' +
    dataSet.FieldByName('XMUNCARREGA').AsString, 'MDFE_CARREGA',
    dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
    exit;

  if Application.MessageBox('Deseja mesmo excluir o registro selecionado?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  if dataSet.RecordCount = 1 then
    if Application.MessageBox('Deve existir pelo menos 1 Cidade para carregamento. Deseja mesmo remover a unica cidade informada?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

  dataSet.Delete;

  if fCodMDFe > 0 then
    Apply;

  vDadosIni.GravaAuditoria('MDFE017', 'EXCLUIR', ' SUCESSO - A CONFIRMAR', 'MDFE_CARREGA', '', buscas);

end;

function TMDFe_Carrega.selecionaCarrega(pCodMDFe: Integer): Boolean;
begin
  Result := montaSelect('select * from MDFE_CARREGA' +
    ' where COD_MDFE = ' + IntToStr(pCodMDFe) +
    ' and COD_EMPRESA = ' + vDadosIni.codEmpresa);
  fCodMDFe := pCodMDFe;
end;

{ TMDFe_Descarga }

procedure TMDFe_Descarga.adicionarCidade(pCodIBGEUF, pCodIBGEMunicipio: Integer);
begin

  try

    if pCodIBGEMunicipio = 0 then
    begin
      if not vDadosIni.PesqPros('MDFE018', 'INCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' UF IBGE: ' + IntToStr(pCodIBGEUF) + ' CIDADE IBGE: ' + IntToStr(pCodIBGEMunicipio), 'MDFE_DESCARGA',
          dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
        exit;

      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES_IBGE', 'and CIDADES_IBGE.CODIGO_UF_IBGE = ' + IntToStr(pCodIBGEUF), 'Consulta de Cidades Cadastradas pelo IBGE');
    end
    else
      vDadosIni.vPesquisa := IntToStr(pCodIBGEMunicipio);
    if (Trim(vDadosIni.vPesquisa) = '') or (Trim(vDadosIni.vPesquisa) = '0') then
      Exit;

    try
      StrToInt(Trim(vDadosIni.vPesquisa));
    except
      if pCodIBGEMunicipio = 0 then
        raiseExceptionCreate('Cidade não encontrada','')
      else
        raiseExceptionCreate('Cidade não encontrada pelo codigo IBGE do Cadastro da Empresa','')
    end;

    buscas.Close;
    buscas.SQL.Text := 'select CODIGO_MUN_IBGE, NOME_MUNICIPIO from CIDADES_IBGE' +
      ' where CODIGO_MUN_IBGE =  ' + Trim(vDadosIni.vPesquisa) +
      ' and ATIVO = 1';
    buscas.Open;

    if buscas.IsEmpty then
      if pCodIBGEMunicipio = 0 then
        raiseExceptionCreate('Cidade não encontrada','')
      else
        raiseExceptionCreate('Cidade não encontrada pelo codigo IBGE do Cadastro da Empresa','');

    try
      dataSet.Filter := 'CMUNDESCARGA = ' + IntToStr(buscas.FieldByName('CODIGO_MUN_IBGE').AsInteger);
      dataSet.Filtered := True;
      if dataSet.FieldByName('CMUNDESCARGA').AsInteger = buscas.FieldByName('CODIGO_MUN_IBGE').AsInteger then
        Exit;
    finally
      dataSet.Filtered := False;
      dataSet.Filter := '';
    end;

    if pCodIBGEMunicipio <> 0 then
      if not vDadosIni.PesqPros('MDFE018', 'INCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' UF IBGE: ' + IntToStr(pCodIBGEUF) + ' CIDADE IBGE: ' + IntToStr(pCodIBGEMunicipio), 'MDFE_DESCARGA',
          dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
        exit;

    dataSet.Insert;
    dataSet.FieldByName('COD_MDFE').AsInteger := fCodMDFe;
    dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('CMUNDESCARGA').AsInteger := buscas.FieldByName('CODIGO_MUN_IBGE').AsInteger;
    dataSet.FieldByName('XMUNDESCARGA').AsString := Copy(buscas.FieldByName('NOME_MUNICIPIO').AsString, 1, 60);
    dataSet.Post;

    if fCodMDFe > 0 then
    begin
      Apply;
      selecionaDescarga(fCodMDFe);
    end;

    vDadosIni.GravaAuditoria('MDFE018', 'INCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
      ' UF IBGE: ' + IntToStr(pCodIBGEUF) + ' CIDADE IBGE: ' + dataSet.FieldByName('CMUNDESCARGA').AsString + ' ' +
      dataSet.FieldByName('XMUNDESCARGA').AsString + ' - A CONFIRMAR', 'MDFE_DESCARGA', dataSet.FieldByName('COD_MDFE').AsString, buscas);

    IndexFieldNames := 'XMUNDESCARGA';

  except
    on e: exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

constructor TMDFe_Descarga.Create(AMDFe: TMDFe);
begin
  if dtmMDFe = nil then
    dtmMDFe := TdtmMDFe.Create(dtmMDFe);
  dataSet := TClientDataSet(dtmmdfe.cdsMDFeDes);
  transacao := TIBTransaction(dtmMDFe.transacao);
  buscas := TIBQuery(dtmMDFe.qrBuscas);
  fBuscas := TIBQuery(dtmMDFe.qrBuscas2);

  FMDFe := AMDFe;

  vNFe := TMDFe_Descarga_NFe.Create(Self);
end;

destructor TMDFe_Descarga.Destroy;
begin
  vNFe.Free;
  vNFe := nil;
  inherited;
end;

procedure TMDFe_Descarga.removerCidade;
var
  vStringTemAud: string;
  vCodIBGE: Integer;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('MDFE019', 'EXCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
    ' CIDADE IBGE: ' + dataSet.FieldByName('CMUNDESCARGA').AsString + ' ' +
    dataSet.FieldByName('XMUNDESCARGA').AsString, 'MDFE_DESCARGA',
    dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
    exit;

  if Application.MessageBox('Deseja mesmo excluir o registro selecionado?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;


  if fCodMDFe = 0 then
  try
    vNFe.dataSet.Filter := 'CMUNDESCARGA = ' + IntToStr(dataSet.FieldByName('CMUNDESCARGA').AsInteger);
    vNFe.dataSet.Filtered := True;

    vNFe.dataSet.Last;

    if not vNFe.dataSet.IsEmpty then
    begin
      Application.MessageBox(pchar('Esta cidade possui ' + IntToStr(vNFe.dataSet.RecordCount) + ' NFe(s) incluídas neste MDF-e'), 'Atenção', 0 + 64);
      if Application.MessageBox('Deseja remover a(s) NF-e(s) desta cidade?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

      if not vDadosIni.PesqPros('MDFE024', 'EXCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
        ' CIDADE IBGE: ' + dataSet.FieldByName('CMUNDESCARGA').AsString + ' ' +
        dataSet.FieldByName('XMUNDESCARGA').AsString, 'MDFE_DESCARGA_NFE',
        vNFe.dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
        exit;

      vNFe.dataSet.First;
      while ((vNFe.dataSet.FieldByName('CMUNDESCARGA').AsInteger = dataSet.FieldByName('CMUNDESCARGA').AsInteger) and 
        (vNFe.dataSet.FieldByName('CMUNDESCARGA').AsInteger > 0)) do
      begin
        vStringTemAud := 'COD: ' + vNFe.dataSet.FieldByName('COD_MDFE').AsString +
          ' NFE COD/CHAVE: ' + vNFe.dataSet.FieldByName('COD_NF').AsString + ' ' +
          vNFe.dataSet.FieldByName('CHNFE').AsString;
        
        vNFe.dataSet.Delete;
        vDadosIni.GravaAuditoria('MDFE024', 'EXCLUIR', vStringTemAud + ' SUCESSO - A CONFIRMAR', 'MDFE_DESCARGA_NFE', '', buscas);
      end;
    end;
  finally
    vNFe.dataSet.Filtered := False;
    vNFe.dataSet.Filter := '';
  end;

  if dataSet.RecordCount = 1 then
    if Application.MessageBox('Deve existir pelo menos 1 Cidade para descarregamento. Deseja mesmo remover a unica cidade informada?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

  vCodIBGE := dataSet.FieldByName('CMUNDESCARGA').AsInteger;

  dataSet.Delete;
  if fCodMDFe > 0 then
  begin
    Apply;
    selecionaDescarga(fCodMDFe);
  end;

  vDadosIni.GravaAuditoria('MDFE019', 'EXCLUIR', ' SUCESSO - A CONFIRMAR', 'MDFE_DESCARGA', '', buscas);
end;

function TMDFe_Descarga.selecionaDescarga(pCodMDFe: Integer): Boolean;
begin
  Result := montaSelect('select * from MDFE_DESCARGA' +
    ' where COD_MDFE = ' + IntToStr(pCodMDFe) +
    ' and COD_EMPRESA = ' + vDadosIni.codEmpresa);
  fCodMDFe := pCodMDFe;
  vNFe.selecinaNFe(fCodMDFe);
end;

{ TMDFe_Descarga_NFe }

procedure TMDFe_Descarga_NFe.adicionaNFE(pNumNF: Integer; pCadMDFe: TMDFe; pCodNF: Integer);
var
  vChaveNFe, vSiglaUF: string;
  vCodIBGECidade, vCodNF: Integer;
  vValorNF, vPesoNF: Extended;
  vLista: TStringList;
  I: Integer;
begin

  try

    if not (pCadMDFe.dataSet.State in [dsInsert, dsEdit]) then
      raiseExceptionCreate('Cadastro não esta habilitado para modificações', '');

    if pCadMDFe = nil then
      raiseExceptionCreate('Chamada de método incorreta', '');


    if (pNumNF > 0) and (pCodNF = 0) then
    begin
        {
      if not vDadosIni.PesqPros('MDFE022', 'INCLUIR', 'COD: ' + pCadMDFe.dataSet.FieldByName('COD_MDFE').AsString +
        ' NUM: ' + pCadMDFe.dataSet.FieldByName('NMDF').AsString +
        ' NFE: ' + IntToStr(pNumNF), 'MDFE_DESCARGA_NFE',
        pCadMDFe.dataSet.FieldByName('COD_MDFE').AsString, fbuscas, true) then
        exit;
        }

      buscas.Close;
      buscas.SQL.Text := 'select cod_nf, chave_nfe num_nf from notafiscal' +
        ' where num_nf = ' + IntToStr(pNumNF) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and emissao_propria = ''S''' +
        ' and status = ''Fechada''' +
        ' and modelo_nf = ''55'' and situacao_nfe = ''Autorizada''' +
        ' and ativo = 1';
      buscas.Open;

      buscas.FetchAll;

      if buscas.RecordCount > 1 then
      begin
        Application.MessageBox(pchar('O sistema encontrou mais de uma NF-e com o número informado' + #13 +
          'Por favor na tela seguinte pesquise novamente e selecione a NF-e correta'), 'Atenção', 0 + 64);
        pNumNF := 0;
      end
      else if buscas.FieldByName('cod_nf').AsInteger = 0 then
      begin
        Application.MessageBox(pchar('O sistema não encontrou a NF-e com o número informado' + #13 +
          'Por favor na tela seguinte pesquise novamente e selecione a NF-e correta'), 'Atenção', 0 + 64);
        pNumNF := 0;
      end
      else
        pNumNF := buscas.FieldByName('cod_nf').AsInteger;
    end;

    if pCodNF > 0 then
      vDadosIni.vPesquisa := IntToStr(pCodNF)
    else if pNumNF = 0 then
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NOTAFISCAL',
        ' and NOTAFISCAL.EMISSAO_PROPRIA = ''S'' and NOTAFISCAL.MODELO_NF = ''55'' and NOTAFISCAL.SITUACAO_NFE = ''Autorizada''', 'Consulta de NF-e de saída Autorizadas')
    else
      vDadosIni.vPesquisa := IntToStr(pNumNF);

    if (Trim(vDadosIni.vPesquisa) = '') and (Trim(vDadosIni.vPesquisa) = '0') then
      Exit;

    try
      StrToInt(Trim(vDadosIni.vPesquisa));
    except
      raiseExceptionCreate('NF-e não encontrada','');
    end;

    vLista := TStringList.Create;
    vLista.Clear;

    buscas.Close;
    buscas.SQL.Text := 'select mn.cod_mdfe, mn.cod_nf, m.nmdf, m.situacao_mdfe, m.situacao_evento from MDFE_DESCARGA_NFE mn' +
      ' inner join mdfe m on m.cod_mdfe = mn.cod_mdfe and m.cod_empresa = mn.cod_empresa' +
      ' where mn.COD_NF = ' + vDadosIni.vPesquisa +
      ' and mn.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and mn.COD_MDFE <> ' + IntToStr(dataSet.FieldByName('cod_mdfe').AsInteger) +
      ' and coalesce(m.SITUACAO_EVENTO,'''') <> ''Cancelado''' +
      ' and m.ATIVO = 1';
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
      vLista.Add(
        'Cod: ' + IntToStr(buscas.FieldByName('cod_mdfe').AsInteger) +
        ' Num MDFe: ' + IntToStr(buscas.FieldByName('nmdf').AsInteger) +
        ' Situacao: ' + Trim(buscas.FieldByName('situacao_mdfe').AsString) +
        ' Evento: ' + Trim(buscas.FieldByName('situacao_evento').AsString)
      );
      buscas.Next;
    end;

    if vLista.Count > 0 then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select nf.num_nf from notafiscal nf' +
        ' where nf.COD_NF = ' + Trim(vDadosIni.vPesquisa) +
        ' and nf.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      pNumNF := buscas.FieldByName('num_nf').AsInteger;

      Application.MessageBox(pchar('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) +
        ' já foi adiciona a outro(s) MDFe(s)' + #13 +
        vLista.Text), 'Atenção', 0 + 64);

      if not vDadosIni.PesqPros('MDFE026', 'VALIDAR', '', 'MDFE', '', fbuscas, True, True) then
        exit;

      for I := 0 to vLista.Count - 1 do
        vDadosIni.GravaAuditoria('MDFE026', 'ALTERAR', 'COD: ' + pCadMDFe.dataSet.FieldByName('COD_MDFE').AsString +
          ' NUM: ' + pCadMDFe.dataSet.FieldByName('NMDF').AsString + ' NFE: ' + IntToStr(pNumNF) + ' MDFE: ' + UpperCase(vLista[I]), 'MDFE', pCadMDFe.dataSet.FieldByName('COD_MDFE').AsString, buscas);
    end;

    buscas.Close;
    buscas.SQL.Text :=
      'select nf.cod_nf, nf.emissao_propria, nf.status, nf.modelo_nf, nf.chave_nfe, nf.num_nf, nf.situacao_nfe, nf.valor_total,' +
      ' es.ibge_codigo_uf, c.ibge_cod_cidade, es.sigla_uf, sum(coalesce(ni.peso_b,0) * coalesce(ni.quantidade, 0)) peso_bruto' +
      ' from notafiscal nf' +
      ' left join notafiscal_item ni on ni.cod_nf = nf.cod_nf and ni.cod_empresa = nf.cod_empresa' +
      ' left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
      ' left join cidades c on c.cod_cidade = cl.cod_cidade' +
      ' left join estados es on es.codigo_uf = cl.codigo_uf' +
      ' where nf.COD_NF = ' + Trim(vDadosIni.vPesquisa) +
      ' and nf.cod_empresa = ' + vDadosIni.codEmpresa +
      ' group by 1,2,3,4,5,6,7,8,9,10,11';
    buscas.Open;

    if buscas.IsEmpty then
      raiseExceptionCreate('NFe não encontrada', '');


    if FDescarga.FMDFe.fint('versao') > 0 then
    begin
      adicionaNFE(buscas.FieldByName('chave_nfe').AsString);
      Exit;
    end;

    if Trim(buscas.FieldByName('emissao_propria').AsString) <> 'S' then
      raiseExceptionCreate('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' não é de Emissão Própria', '');

    if Trim(buscas.FieldByName('status').AsString) <> 'Fechada' then
      raiseExceptionCreate('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' não esta Fechada', '');

    if Trim(buscas.FieldByName('modelo_nf').AsString) <> '55' then
      raiseExceptionCreate('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' não é modelo 55', '');

    if Trim(buscas.FieldByName('situacao_nfe').AsString) <> 'Autorizada' then
      raiseExceptionCreate('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' não esta Autorizada', '');

    if Trim(buscas.FieldByName('chave_nfe').AsString) = '' then
      raiseExceptionCreate('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' sem chave de acesso', '');

    if buscas.FieldByName('ibge_cod_cidade').AsInteger = 0 then
      raiseExceptionCreate('Cidade no cadastro do cliente da NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' sem Código IBGE', '');

    vCodNF := buscas.FieldByName('cod_nf').AsInteger;
    vCodIBGECidade := buscas.FieldByName('ibge_cod_cidade').AsInteger;
    vChaveNFe := buscas.FieldByName('chave_nfe').AsString;
    vSiglaUF := buscas.FieldByName('sigla_uf').AsString;
    vValorNF := vDadosIni.StrToFloatFormat(buscas.FieldByName('valor_total').AsFloat, 2);
    vPesoNF := vDadosIni.StrToFloatFormat(buscas.FieldByName('peso_bruto').AsFloat,3);
    pNumNF := buscas.FieldByName('num_nf').AsInteger;

    if (Trim(pCadMDFe.dataSet.FieldByName('UFFIM').AsString) <> '') and
      (Copy(IntToStr(buscas.FieldByName('ibge_cod_cidade').AsInteger), 1, 2) <>
      Copy(IntToStr(pCadMDFe.getCodIBGEUF(cpDestino)), 1, 2)) then
      raiseExceptionCreate('Cidade do cliente da NFe: ' + IntToStr(pNumNF) + ' não pertence ao estado de Destino selecionado', '');

    try
      dataSet.Filter := 'CMUNDESCARGA = ' + IntToStr(vCodIBGECidade) +
        ' and COD_NF = ' + IntToStr(vCodNF);
      dataSet.Filtered := True;
      if (dataSet.FieldByName('CMUNDESCARGA').AsInteger = vCodIBGECidade) and
        (dataSet.FieldByName('COD_NF').AsInteger = vCodNF) then
        Exit;
    finally
      dataSet.Filtered := True;
      dataSet.Filter := '';
    end;

    if (Trim(pCadMDFe.dataSet.FieldByName('UFFIM').AsString) = '') then
      pCadMDFe.dataSet.FieldByName('UFFIM').AsString := vSiglaUF;

    pCadMDFe.vDescarga.adicionarCidade(pCadMDFe.getCodIBGEUF(cpDestino), vCodIBGECidade);

    pCadMDFe.dataSet.FieldByName('QNFE').AsInteger := pCadMDFe.dataSet.FieldByName('QNFE').AsInteger + 1;
    pCadMDFe.dataSet.FieldByName('VCARGA').AsFloat := vDadosIni.StrToFloatFormat(pCadMDFe.dataSet.FieldByName('VCARGA').AsFloat + vValorNF,2);
    pCadMDFe.dataSet.FieldByName('QCARGA').AsFloat := vDadosIni.StrToFloatFormat(pCadMDFe.dataSet.FieldByName('QCARGA').AsFloat + vPesoNF,3);

    dataSet.Insert;
    dataSet.FieldByName('COD_MDFE').AsInteger := fCodMDFe;
    dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('CMUNDESCARGA').AsInteger := vCodIBGECidade;
    dataSet.FieldByName('COD_NF').AsInteger := vCodNF;
    dataSet.FieldByName('CHNFE').AsString := vChaveNFe;
    dataSet.FieldByName('VALOR_TOTAL_NF').AsFloat := vValorNF;
    dataSet.FieldByName('PESO_BRUTO_NF').AsFloat := vPesoNF;
    dataSet.Post;

    if fCodMDFe > 0 then
    begin
      Apply;
      selecinaNFe(fCodMDFe);
    end;

    vDadosIni.GravaAuditoria('MDFE022', 'INCLUIR', 'COD: ' + pCadMDFe.dataSet.FieldByName('COD_MDFE').AsString +
      ' NUM: ' + pCadMDFe.dataSet.FieldByName('NMDF').AsString +
      ' NFE: ' + IntToStr(pNumNF) + ' CHAVE: ' + vChaveNFe + ' - A CONFIRMAR', 'MDFE_DESCARGA_NFE',
      pCadMDFe.dataSet.FieldByName('COD_MDFE').AsString, buscas);

    IndexFieldNames := 'CMUNDESCARGA';

  except
    on e: exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TMDFe_Descarga_NFe.adicionaNFE(ChaveNFe: string);
var
  sCnpj, sNNf, vChaveNFe, vSiglaUF: string;
  vCodIBGECidade, vCodNF: Integer;
  vValorNF, vPesoNF: Extended;
  vLista: TStringList;
  bSalvarDepois: Boolean;
  I: Integer;
begin
  vLista := TStringList.Create;
  try
    try
      if (FDescarga = nil) or (FDescarga.FMDFe = nil) then
        raiseExceptionCreate('Chamada de método incorreta. nil', '');

      if not (FDescarga.FMDFe.dataSet.State in [dsInsert, dsEdit]) then
        raiseExceptionCreate('Cadastro não esta habilitado para modificações', '');
      

      if (trim(ChaveNFe) = '') or (Length(OnlyNumber(ChaveNFe)) <> 44) then
        raiseExceptionCreate('Chave da NFe [' + ChaveNFe + '] não exite ou inválida', '');

      sCnpj := Copy(ChaveNFe, 7, 14);
      sNNf  := Copy(ChaveNFe, 26, 9);
      while StartsText('0', sNNf) do
        sNNf := Copy(sNNf, 2, Length(sNNF) - 1);

      if Copy(sCnpj, 1, 8) <> Copy(vDadosIni.vEmp.vCNPJ, 1, 8) then
        raiseExceptionCreate('NFe: ' + sNNF + ' não é de Emissão Própria', '');
        {
      if not vDadosIni.PesqPros('MDFE022', 'INCLUIR', 'COD: ' + FDescarga.FMDFe.fstr('COD_MDFE') +
        ' NUM: ' + FDescarga.FMDFe.fstr('NMDF') +
        ' CHAVE: ' + ChaveNFe, 'MDFE_DESCARGA_NFE',
        FDescarga.FMDFe.fstr('COD_MDFE'), fbuscas, true) then
        Exit;
        }

      buscas.Close;
      buscas.SQL.Text := 'select mn.cod_mdfe, mn.cod_nf, m.nmdf, m.situacao_mdfe, m.situacao_evento from VW_MDFE_DESCARGA_NFE mn' +
        ' inner join mdfe m on m.cod_mdfe = mn.cod_mdfe and m.cod_empresa = mn.cod_empresa' +
        ' where mn.CHNFE = ' + QuotedStr(ChaveNFe) +
        ' and mn.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and mn.COD_MDFE <> ' + IntToStr(dataSet.FieldByName('cod_mdfe').AsInteger) +
        ' and coalesce(m.SITUACAO_EVENTO,'''') <> ''Cancelado''' +
        ' and m.ATIVO = 1';
      buscas.Open;

      vLista := TStringList.Create;
      vLista.Clear;

      buscas.First;
      while not buscas.Eof do
      begin
        vLista.Add(
          'Cod: ' + IntToStr(buscas.FieldByName('cod_mdfe').AsInteger) +
          ' Num MDFe: ' + IntToStr(buscas.FieldByName('nmdf').AsInteger) +
          ' Situacao: ' + Trim(buscas.FieldByName('situacao_mdfe').AsString) +
          ' Evento: ' + Trim(buscas.FieldByName('situacao_evento').AsString)
        );
        buscas.Next;
      end;

      if vLista.Count > 0 then
      begin
        ShowAtencao('NFe ' + sNNf + ' com chave ' + ChaveNFe + ' já foi adiciona a outro(s) MDFe(s)' + #13 + vLista.Text);

        if not vDadosIni.PesqPros('MDFE026', 'VALIDAR', '', 'MDFE', '', fbuscas, True, True) then
          exit;

        for I := 0 to vLista.Count - 1 do
          vDadosIni.GravaAuditoria('MDFE026', 'ALTERAR', 'COD: ' + FDescarga.FMDFe.fstr('COD_MDFE') +
            ' NUM: ' + FDescarga.FMDFe.fstr('NMDF') + ' CHAVE: ' + ChaveNFe + ' MDFE: ' + UpperCase(vLista[I]), 'MDFE', FDescarga.FMDFe.fstr('COD_MDFE'), buscas);
      end;

      buscas.Close;
      buscas.SQL.Text :=
        'select nf.cod_nf, nf.emissao_propria, nf.status, nf.modelo_nf, nf.chave_nfe, nf.num_nf, nf.situacao_nfe, nf.valor_total,' +
        ' es.ibge_codigo_uf, c.ibge_cod_cidade, es.sigla_uf, sum(coalesce(ni.peso_b,0) * coalesce(ni.quantidade, 0)) peso_bruto' +
        ' from notafiscal nf' +
        ' left join notafiscal_item ni on ni.cod_nf = nf.cod_nf and ni.cod_empresa = nf.cod_empresa' +
        ' left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
        ' left join cidades c on c.cod_cidade = cl.cod_cidade' +
        ' left join estados es on es.codigo_uf = cl.codigo_uf' +
        ' where nf.chave_nfe = ' + QuotedStr(ChaveNFe) +
        ' and nf.emissao_propria = ''S'' and nf.modelo_nf = ''55'' and nf.situacao_nfe = ''Autorizada''' + // isso pra aceitar qualquer nota do banco e atender as filiais
        ' group by 1,2,3,4,5,6,7,8,9,10,11';
      buscas.Open;

      if buscas.IsEmpty then
        raiseExceptionCreate('NFe não encontrada, não é emissão própria ou não esta Autorizada', '');

      if Trim(buscas.FieldByName('emissao_propria').AsString) <> 'S' then
        raiseExceptionCreate('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' não é de Emissão Própria', '');

      if Trim(buscas.FieldByName('status').AsString) <> 'Fechada' then
        raiseExceptionCreate('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' não esta Fechada', '');

      if Trim(buscas.FieldByName('modelo_nf').AsString) <> '55' then
        raiseExceptionCreate('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' não é modelo 55', '');

      if Trim(buscas.FieldByName('situacao_nfe').AsString) <> 'Autorizada' then
        raiseExceptionCreate('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' não esta Autorizada', '');

      if Trim(buscas.FieldByName('chave_nfe').AsString) = '' then
        raiseExceptionCreate('NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' sem chave de acesso', '');

      if buscas.FieldByName('ibge_cod_cidade').AsInteger = 0 then
        raiseExceptionCreate('Cidade no cadastro do cliente da NFe: ' + IntToStr(buscas.FieldByName('num_nf').AsInteger) + ' sem Código IBGE', '');

      vCodNF := buscas.FieldByName('cod_nf').AsInteger;
      vCodIBGECidade := buscas.FieldByName('ibge_cod_cidade').AsInteger;
      vChaveNFe := buscas.FieldByName('chave_nfe').AsString;
      vSiglaUF := buscas.FieldByName('sigla_uf').AsString;
      vValorNF := vDadosIni.StrToFloatFormat(buscas.FieldByName('valor_total').AsFloat, 2);
      vPesoNF := vDadosIni.StrToFloatFormat(buscas.FieldByName('peso_bruto').AsFloat,3);
      sNNf := buscas.FieldByName('num_nf').AsString;

      if (Trim(FDescarga.FMDFe.fstr('UFFIM') ) <> '') and
        (Copy(IntToStr(buscas.FieldByName('ibge_cod_cidade').AsInteger), 1, 2) <>
        Copy(IntToStr(FDescarga.FMDFe.getCodIBGEUF(cpDestino)), 1, 2)) then
        raiseExceptionCreate('Cidade do cliente da NFe: ' + sNNf + ' não pertence ao estado de Destino selecionado', '');

      try
        dataSet.Filter := 'CMUNDESCARGA = ' + IntToStr(vCodIBGECidade) +
          ' and CHNFE = ' + QuotedStr(ChaveNFe);
        dataSet.Filtered := True;
        if (dataSet.FieldByName('CMUNDESCARGA').AsInteger = vCodIBGECidade) and
          (dataSet.FieldByName('CHNFE').AsString = ChaveNFe) then
          Exit;
      finally
        dataSet.Filtered := True;
        dataSet.Filter := '';
      end;

      if (FDescarga.FMDFe.fstr('UFFIM') = '') then
        FDescarga.FMDFe.dataSet.FieldByName('UFFIM').AsString := vSiglaUF;

      FDescarga.adicionarCidade(FDescarga.FMDFe.getCodIBGEUF(cpDestino), vCodIBGECidade);

      FDescarga.FMDFe.dataSet.FieldByName('QNFE').AsInteger := FDescarga.FMDFe.dataSet.FieldByName('QNFE').AsInteger + 1;
      FDescarga.FMDFe.dataSet.FieldByName('VCARGA').AsFloat := RoundTo(FDescarga.FMDFe.ffloat('VCARGA') + vValorNF, -2);
      FDescarga.FMDFe.dataSet.FieldByName('QCARGA').AsFloat := RoundTo(FDescarga.FMDFe.ffloat('QCARGA') + vPesoNF , -3);

      bSalvarDepois := False;
      if fCodMDFe = 0 then
      begin
        FDescarga.FMDFe.GerarNumeroApply;
        fCodMDFe := FDescarga.FMDFe.fint('cod_mdfe');
        bSalvarDepois := True;
      end;

      FDescarga.FMDFe.queryCons.Table('MDFE_DESCARGA_NFEA')
        .SQL('insert into MDFE_DESCARGA_NFEA' +
             ' (ID, COD_MDFE, COD_EMPRESA, CMUNDESCARGA, CHNFE, PESO_BRUTO_NF, VALOR_TOTAL_NF)' +
             ' values ' +
             ' (:ID, :COD_MDFE, :COD_EMPRESA, :CMUNDESCARGA, :CHNFE, :PESO_BRUTO_NF, :VALOR_TOTAL_NF)')
        .ParamIncCodigo('ID')
        .ParamValue('COD_MDFE', fCodMDFe)
        .ParamValue('COD_EMPRESA', vDadosIni.cod_empresa)
        .ParamValue('CMUNDESCARGA', vCodIBGECidade)
        .ParamValue('CHNFE', ChaveNFe)
        .ParamAsFloat('VALOR_TOTAL_NF', vValorNF)
        .ParamAsFloat('PESO_BRUTO_NF', vPesoNF)
        .ExecSQL;

      vDadosIni.GravaAuditoria('MDFE022', 'INCLUIR', 'COD: ' + FDescarga.FMDFe.fstr('COD_MDFE') +
        ' NUM: ' + FDescarga.FMDFe.fstr('NMDF') +
        ' NFE: ' + sNNf + ' CHAVE: ' + ChaveNFe + ' - A CONFIRMAR', 'MDFE_DESCARGA_NFE',
        FDescarga.FMDFe.fstr('COD_MDFE'), buscas);
                                      
      if bSalvarDepois then
        FDescarga.FMDFe.Post;

      selecinaNFe(fCodMDFe);
      IndexFieldNames := 'CMUNDESCARGA';

    except
      on e: exception do
      begin
        Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
      end;
    end;
  finally
    vLista.Free;
  end;
end;

procedure TMDFe_Descarga_NFe.adicionaNFE(pNumNF, pCodEmpresa: Integer);
var
  rescueEmpresaID: string;
  vChaveNFe: string;
//  vCodIBGECidade, vCodNF: Integer;
//  vValorNF, vPesoNF: Extended;
//  vLista: TStringList;
//  I: Integer;
begin
  try
    if (FDescarga = nil) or (FDescarga.FMDFe = nil) then
      raiseExceptionCreate('Chamada de método incorreta. nil', '');

    if not (FDescarga.FMDFe.dataSet.State in [dsInsert, dsEdit]) then
      raiseExceptionCreate('Cadastro não esta habilitado para modificações', '');

    if (pNumNF > 0) then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select cod_nf, chave_nfe num_nf from notafiscal' +
        ' where num_nf = ' + IntToStr(pNumNF) +
        ' and cod_empresa = ' + IntToStr(pCodEmpresa) +
        ' and emissao_propria = ''S''' +
        ' and status = ''Fechada''' +
        ' and modelo_nf = ''55'' and situacao_nfe = ''Autorizada''' +
        ' and ativo = 1';
      buscas.Open;

      buscas.FetchAll;

      if buscas.RecordCount > 1 then
      begin
        Application.MessageBox(pchar('O sistema encontrou mais de uma NF-e com o número informado' + #13 +
          'Por favor na tela seguinte pesquise novamente e selecione a NF-e correta'), 'Atenção', 0 + 64);
        pNumNF := 0;
      end
      else if buscas.FieldByName('cod_nf').AsInteger = 0 then
      begin
        Application.MessageBox(pchar('O sistema não encontrou a NF-e com o número informado' + #13 +
          'Por favor na tela seguinte pesquise novamente e selecione a NF-e correta'), 'Atenção', 0 + 64);
        pNumNF := 0;
      end
      else
        pNumNF := buscas.FieldByName('cod_nf').AsInteger;
    end;

    if pNumNF = 0 then
    begin
      rescueEmpresaID := vDadosIni.codEmpresa;
      try
        vDadosIni.codEmpresa := IntToStr(pCodEmpresa);

        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NOTAFISCAL',
          ' and NOTAFISCAL.EMISSAO_PROPRIA = ''S'' and NOTAFISCAL.MODELO_NF = ''55'' and NOTAFISCAL.SITUACAO_NFE = ''Autorizada''', 'Consulta de NF-e de saída Autorizadas [Emp:' + vDadosIni.codEmpresa + ']' );

      finally
        vDadosIni.codEmpresa := rescueEmpresaID;
      end;
    end
    else
      vDadosIni.vPesquisa := IntToStr(pNumNF);

    if (Trim(vDadosIni.vPesquisa) = '') and (Trim(vDadosIni.vPesquisa) = '0') then
      Exit;

    try
      StrToInt(Trim(vDadosIni.vPesquisa));
    except
      raiseExceptionCreate('NF-e não encontrada','');
    end;

    vChaveNFe := queryCons.Table('notafiscal', 'chave_nfe')
      .Equals('cod_nf', StrToInt(vDadosIni.vPesquisa))
      .Equals('cod_empresa', pCodEmpresa)
      .Scalar.AsString;

    adicionaNFE(vChaveNFe);

  except
    on e: exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

constructor TMDFe_Descarga_NFe.Create(ADescarga: TMDFe_Descarga);
begin
  if dtmMDFe = nil then
    dtmMDFe := TdtmMDFe.Create(dtmMDFe);
  dataSet := TClientDataSet(dtmmdfe.cdsMDFeDesNFe);
  transacao := TIBTransaction(dtmMDFe.transacao);
  buscas := TIBQuery(dtmMDFe.qrBuscas);
  fBuscas := TIBQuery(dtmMDFe.qrBuscas2);

  FDescarga := ADescarga;

  FUnidTransporte := TMDFe_Descarga_NFe_Unid_Tr.create(Self);
  FlkSimNao := TDadosLookUp_OOP.create;
end;

destructor TMDFe_Descarga_NFe.Destroy;
begin
  FreeAndNil(FUnidTransporte);
  FreeAndNil(FlkSimNao);
  inherited;
end;

procedure TMDFe_Descarga_NFe.removerNFe(pCadMDFe: TMDFe);
begin
  if not (pCadMDFe.dataSet.State in [dsInsert, dsEdit]) then
    raiseExceptionCreate('Cadastro não esta habilitado para modificações', '');

  if not vDadosIni.PesqPros('MDFE024', 'INCLUIR', 'COD: ' + dataSet.FieldByName('COD_MDFE').AsString +
    ' CHAVE: ' + dataSet.FieldByName('CHNFE').AsString, 'MDFE_DESCARGA_NFE',
    dataSet.FieldByName('COD_MDFE').AsString, fbuscas,  True) then
    Exit;


  pCadMDFe.dataSet.FieldByName('QNFE').AsInteger := pCadMDFe.dataSet.FieldByName('QNFE').AsInteger - 1;
  pCadMDFe.dataSet.FieldByName('VCARGA').AsFloat := vDadosIni.StrToFloatFormat(pCadMDFe.dataSet.FieldByName('VCARGA').AsFloat - dataSet.FieldByName('VALOR_TOTAL_NF').AsFloat,2);
  pCadMDFe.dataSet.FieldByName('QCARGA').AsFloat := vDadosIni.StrToFloatFormat(pCadMDFe.dataSet.FieldByName('QCARGA').AsFloat - dataSet.FieldByName('PESO_BRUTO_NF').AsFloat,3);

  if FDescarga.FMDFe.fint('versao') = 0 then
  begin
    dataSet.Delete;

    if fCodMDFe > 0 then
    begin
      Apply;
      selecinaNFe(fCodMDFe);
    end;
  end
  else
  begin
    queryCons.SQL('delete from MDFE_DESCARGA_NFEA')
      .Equals('id', fint('id'))
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .ExecSQL;

    selecinaNFe(fCodMDFe);
  end;

  vDadosIni.GravaAuditoria('MDFE024', 'EXCLUIR', ' SUCESSO - A CONFIRMAR', 'MDFE_DESCARGA_NFE', '', buscas);
end;

procedure TMDFe_Descarga_NFe.SalvarAlteracoes;
begin
  if FDescarga.FMDFe.fint('versao') = 0 then
    dataSet.Post

  else
  begin
    queryCons.SQL('update MDFE_DESCARGA_NFEA set SEGCODBARRA = :SEGCODBARRA, INDREENTREGA = :INDREENTREGA')
      .Equals('id', fint('id'))
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .ParamReplace('segcodbarra', IfThen(fempty('segcodbarra'), 'null', fstrq('segcodbarra')))
      .ParamReplace('indreentrega', IfThen(fempty('indreentrega'), 'null', fstr('indreentrega')))
      .ExecSQL();

    dataSet.Cancel;
    dataSet.Close;
    dataSet.Open;
    //Refresh;
  end;

end;

function TMDFe_Descarga_NFe.selecinaNFe(pCodMDFe: Integer): Boolean;
begin
  if FDescarga.FMDFe.fint('versao') = 0 then
    Result := montaSelect(
      'select mn.*, nf.data_lanc, nf.num_nf, cl.cod_cliente, cl.razao, cl.cpfcgc, ci.nome_municipio, 0 id from mdfe_descarga_nfe mn' +
      ' left join notafiscal nf on nf.cod_nf = mn.cod_nf and nf.cod_empresa = mn.cod_empresa' +
      ' left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
      ' left join cidades_ibge ci on ci.codigo_mun_ibge = mn.cmundescarga' +
      ' where mn.COD_MDFE = ' + IntToStr(pCodMDFe) +
      ' and mn.COD_EMPRESA = ' + vDadosIni.codEmpresa)
  else
    Result := montaSelect(
      'select mn.*, nf.data_lanc, nf.num_nf, cl.cod_cliente, cl.razao, cl.cpfcgc, ci.nome_municipio from vw_mdfe_descarga_nfe mn' +
      ' left join notafiscal nf on nf.chave_nfe = mn.chnfe and nf.situacao_nfe = ''Autorizada''' +
      ' left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
      ' left join cidades_ibge ci on ci.codigo_mun_ibge = mn.cmundescarga' +
      ' where mn.COD_MDFE = ' + IntToStr(pCodMDFe) +
      ' and mn.COD_EMPRESA = ' + vDadosIni.codEmpresa);
  fCodMDFe := pCodMDFe;
  UnidTransporte.Open;
end;

{ TVeiculos_MDFe }

function TVeiculos_MDFe.abreVeiculos: Boolean;
begin
  Result :=
    montaSelect('select vt.cod_veic, vt.cod_empresa, vt.placa, vt.modelo, vt.reboque from VEICULOS_TRANSPORTE vt' +
      ' where vt.cod_empresa =  ' + vDadosIni.codEmpresa);
end;

constructor TVeiculos_MDFe.create;
begin
  if dtmMDFe = nil then
    dtmMDFe := TdtmMDFe.Create(dtmMDFe);
  dataSet := TClientDataSet(dtmmdfe.cdsVeic);
  transacao := TIBTransaction(dtmMDFe.transacao);
  buscas := TIBQuery(dtmMDFe.qrBuscas);
end;

procedure TVeiculos_MDFe.filtrar(pReboque: Boolean);
begin
  if pReboque then
    dataSet.Filter := 'REBOQUE = ''S'''
  else
    dataSet.Filter := 'REBOQUE = ''N'' OR REBOQUE = '''' OR REBOQUE IS NULL';
  dataSet.Filtered := True;

end;

{ TMDFe_Descarga_NFe_Unid_Tr_Carga }

constructor TMDFe_Descarga_NFe_Unid_Tr_Carga.create(
  AOwer: TMDFe_Descarga_NFe_Unid_Tr);
begin
  if not Assigned(AOwer) then
    raise Exception.Create('Ower não referenciado');

  FOwer := TMDFe_Descarga_NFe_Unid_Tr(AOwer);

  dataSet := TClientDataSet.Create(Application);
  CreateDbComponents(dtmAtivo.bancoHw, FOwer.transacao);
  FlkTipoUnCarga := TDadosLookUp_OOP.create;
end;

procedure TMDFe_Descarga_NFe_Unid_Tr_Carga.dataSetAfterOpen(DataSet: TDataSet);
begin
  dataSet.FieldByName('TPUNIDCARGA').DisplayLabel := 'Tipo';
  dataSet.FieldByName('IDUNIDCARGA').DisplayLabel := 'Identificação';
  dataSet.FieldByName('LACUNIDCARGA_LACRES').DisplayLabel := 'Lacres';
  dataSet.FieldByName('QTDRAT').DisplayLabel := 'Qtde rateada (Peso, Volume)';
  TFloatField(dataSet.FieldByName('QTDRAT')).DisplayFormat := '##0.00';
end;

function TMDFe_Descarga_NFe_Unid_Tr_Carga.Delete: Boolean;
begin
  if FOwer.FOwer.FDescarga.FMDFe.fint('versao') = 0 then
    inherited Delete

  else
  begin
    queryCons.SQL('delete from MDFE_DESCARGA_NFEA_UN_TR_CARGA')
      .Equals('id', fint('id'))
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .ExecSQL();

    Refresh;
  end;
end;

destructor TMDFe_Descarga_NFe_Unid_Tr_Carga.Destroy;
begin
  FreeDbComponents;
  FreeAndNil(FlkTipoUnCarga);
  inherited;
end;

function TMDFe_Descarga_NFe_Unid_Tr_Carga.Filter: Boolean;
begin
  if FOwer.FOwer.FDescarga.FMDFe.fint('versao') = 0 then
    filterStr( ' cmundescarga = ' + IntToStr(FOwer.dataSet.FieldByName('cmundescarga').AsInteger) +
               ' and cod_nf = ' + IntToStr(FOwer.dataSet.FieldByName('cod_nf').AsInteger) +
               ' and seqid = ' + IntToStr(FOwer.dataSet.FieldByName('seqid').AsInteger))

  else
    filterStr(' untr_id = %d', [ FOwer.fint('id') ]);
end;

function TMDFe_Descarga_NFe_Unid_Tr_Carga.Open: Boolean;
var
  I: Integer;
begin
  Close;

  if FOwer.FOwer.FDescarga.FMDFe.fint('versao') = 0 then
    dataSet.CommandText := ('select MDFE_DESCARGA_NFE_UN_TR_CARGA.*, 0 id, 0 untr_id from MDFE_DESCARGA_NFE_UN_TR_CARGA' +
      ' where cod_mdfe = ' + IntToStr(FOwer.dataSet.FieldByName('cod_mdfe').AsInteger) +
      ' and cod_empresa = ' + IntToStr(vDadosIni.cod_empresa) +
      ' order by seqid_carga')

  else
    dataSet.CommandText := 'select a.cod_mdfe, ca.cod_empresa, a.cmundescarga, 0 cod_nf, 0 seqid, 0 seqid_carga,' +
      ' ca.tpunidcarga, ca.idunidcarga, ca.lacunidcarga_lacres, ca.qtdrat, ca.id, ca.untr_id' +
      ' from mdfe_descarga_nfea_un_tr_carga ca' +
      ' inner join mdfe_descarga_nfea_un_tr ua on ua.id = ca.untr_id and ua.cod_empresa = ca.cod_empresa' +
      ' inner join mdfe_descarga_nfea a on a.id = ua.descarga_id and a.cod_empresa = ua.cod_empresa' +
      ' where a.cod_mdfe = ' + IntToStr(FOwer.FOwer.fint('cod_mdfe')) +
      ' and a.cod_empresa = ' + IntToStr(vDadosIni.cod_empresa) +
      ' order by ca.id';

  Result := inherited Open;

  if FOwer.FOwer.FDescarga.FMDFe.fint('versao') = 0 then
    dataSet.IndexFieldNames := 'SEQID_CARGA'
  else
    dataSet.IndexFieldNames := 'ID';

  for I := 0 to dataSet.Fields.Count - 1 do
    dataSet.Fields[I].Visible := False;

  dataSet.FieldByName('TPUNIDCARGA').Visible := True;
  dataSet.FieldByName('IDUNIDCARGA').Visible := True;
  dataSet.FieldByName('QTDRAT').Visible := True;

  dataSet.FieldByName('TPUNIDCARGA').DisplayLabel := 'Tipo';
  dataSet.FieldByName('IDUNIDCARGA').DisplayLabel := 'Identificação';
  dataSet.FieldByName('QTDRAT').DisplayLabel := 'Qtde rateada (Peso, Volume)';

  TFloatField(dataSet.FieldByName('QTDRAT')).DisplayFormat := '##0.00';
end;

function TMDFe_Descarga_NFe_Unid_Tr_Carga.post: Boolean;
begin
  try
    if FOwer.dataSet.IsEmpty then
      raiseExceptionCreate('Unidade de Transpote vazia', '');

    checkFieldEmpty('TPUNIDCARGA', 'Tipo da Unidade de Carga precisa ser preenchido', '');
    checkFieldEmpty('IDUNIDCARGA', 'Identificação da Unidade de carga precisa ser preenchida', '');

    case dataSet.State of
      dsEdit:
        begin
          if FOwer.FOwer.FDescarga.FMDFe.fint('versao') = 0 then
          begin
            queryCons
              .SQL('update MDFE_DESCARGA_NFEA_UN_TR_CARGA set' +
                   ' tpunidcarga = :tpunidcarga,' +
                   ' idunidcarga = :idunidcarga,' +
                   ' lacunidcarga_lacres = :lacunidcarga_lacres' +
                   ' qtdrat = :qtdrat')
              .Equals('id', fint('id'))
              .Equals('cod_empresa', vDadosIni.cod_empresa)
              .ParamValue('tpunidcarga', fint('tpunidcarga'))
              .ParamValue('idunidcarga', fstr('idunidcarga'))
              .ParamValue('lacunidcarga_lacres', fstr('lacunidcarga_lacres'))
              .ParamAsFloat('qtdrat', ffloat('qtdrat'))
              .ExecSQL;
            dataSet.Cancel;
            dataSet.Refresh;
          end;
        end;

      dsInsert:
        begin
          if FOwer.FOwer.FDescarga.FMDFe.fint('versao') = 0 then
          begin
            dataSet.FieldByName('COD_MDFE').AsInteger := FOwer.dataSet.FieldByName('COD_MDFE').AsInteger;
            dataSet.FieldByName('COD_EMPRESA').AsInteger := vDadosIni.cod_empresa;
            dataSet.FieldByName('CMUNDESCARGA').AsInteger := FOwer.dataSet.FieldByName('CMUNDESCARGA').AsInteger;
            dataSet.FieldByName('COD_NF').AsInteger := FOwer.dataSet.FieldByName('COD_NF').AsInteger;
            dataSet.FieldByName('SEQID').AsInteger := FOwer.dataSet.FieldByName('SEQID').AsInteger;
            dataSet.FieldByName('SEQID_CARGA').AsInteger := Gencodigo('MDFE_DESCARGA_NFE_UN_TR_CARGA', buscas, vDadosIni.codEmpresa);
          end

          else
          begin
            queryCons.Table('MDFE_DESCARGA_NFEA_UN_TR_CARGA')
              .SQL('insert into MDFE_DESCARGA_NFEA_UN_TR_CARGA' +
                   ' (id, cod_empresa, untr_id, tpunidcarga, idunidcarga, lacunidcarga_lacres, qtdrat)' +
                   ' values ' +
                   ' (:id, :cod_empresa, :untr_id, :tpunidcarga, :idunidcarga, :lacunidcarga_lacres, :qtdrat)')
              .ParamIncCodigo('id')
              .ParamValue('cod_empresa', vDadosIni.cod_empresa)
              .ParamValue('untr_id', FOwer.fint('id'))
              .ParamValue('tpunidcarga', fint('tpunidcarga'))
              .ParamValue('idunidcarga', fstr('idunidcarga'))
              .ParamValue('lacunidcarga_lacres', fstr('lacunidcarga_lacres'))
              .ParamAsFloat('qtdrat', ffloat('qtdrat'))
              .ExecSQL;
            dataSet.Cancel;
            dataSet.Refresh;
            Filter;
          end;
        end;
      else
        Exit;
    end;

    if FOwer.FOwer.FDescarga.FMDFe.fint('versao') = 0 then
    begin
      Result := inherited Post;

      if Result then
        if dataSet.FieldByName('COD_MDFE').AsInteger > 0 then
          Result := Apply;
    end

    else
      Result := True;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro ao salvar Unidades de Carga. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TMDFe_Descarga_NFe_Unid_Tr_Carga.post. Erro: ' + e.Message);
    end;
  end;
end;

{ TMDFe_Descarga_NFe_Unid_Tr }

constructor TMDFe_Descarga_NFe_Unid_Tr.create(AOwer: TMDFe_Descarga_NFe);
begin
  if not Assigned(AOwer) then
    raise Exception.Create('Ower não referenciado');

  FOwer := TMDFe_Descarga_NFe(AOwer);

  dataSet := TClientDataSet.Create(Application);
  CreateDbComponents(dtmAtivo.bancoHw, FOwer.transacao);
  FUnidCarga := TMDFe_Descarga_NFe_Unid_Tr_Carga.create(Self);
  FlkTipoUnTr := TDadosLookUp_OOP.create;
end;

procedure TMDFe_Descarga_NFe_Unid_Tr.dataSetAfterScroll(DataSet: TDataSet);
begin
  UnidCarga.Filter;
end;

function TMDFe_Descarga_NFe_Unid_Tr.Delete: Boolean;
begin
  if not UnidCarga.dataSet.IsEmpty then
    if vDadosIni.ShowConfirmacao('Existe unidades de Carga. Deseja continuar?') <> IDYES then
      Exit;

//  while not UnidCarga.dataSet.IsEmpty do
//    UnidCarga.dataSet.Delete;

  if FOwer.FDescarga.FMDFe.fint('versao') = 0 then
    inherited Delete

  else
  begin
    queryCons.SQL('delete from MDFE_DESCARGA_NFEA_UN_TR')
      .Equals('id', fint('id'))
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .ExecSQL();

    Refresh;
  end;

  UnidCarga.Filter;
end;

destructor TMDFe_Descarga_NFe_Unid_Tr.Destroy;
begin
  FreeDbComponents;
  FreeAndNil(FUnidCarga);
  FreeAndNil(FlkTipoUnTr);
  inherited;
end;

function TMDFe_Descarga_NFe_Unid_Tr.Filter: Boolean;
begin
  if FOwer.FDescarga.FMDFe.fint('versao') = 0 then
    filterStr(' cmundescarga = ' + IntToStr(FOwer.dataSet.FieldByName('cmundescarga').AsInteger) +
              ' and cod_nf = ' + IntToStr(FOwer.fint('cod_nf')))
                      
  else                    
    filterStr(' descarga_id = %d', [ FOwer.fint('id') ]);
end;

function TMDFe_Descarga_NFe_Unid_Tr.Open: Boolean;
var
  I: Integer;
begin
  try
    Close;
    if FOwer.FDescarga.FMDFe.fint('versao') = 0 then
      dataSet.CommandText := ('select MDFE_DESCARGA_NFE_UN_TR.*, 0 id, 0 descarga_id from MDFE_DESCARGA_NFE_UN_TR' +
        ' where cod_mdfe = ' + IntToStr(FOwer.dataSet.FieldByName('cod_mdfe').AsInteger) +
        ' and cod_empresa = ' + IntToStr(vDadosIni.cod_empresa) +
        ' order by seqid')

    else
      dataSet.CommandText := ('select a.cod_mdfe, ua.cod_empresa, a.cmundescarga, 0 cod_nf, 0 seqid, ' +
        ' ua.tpunidtransp,  ua.idunidtransp,  ua.lacunidtransp_lacres, ua.qtdrat, ua.id, ua.descarga_id ' +
        ' from mdfe_descarga_nfea_un_tr ua' +
        ' inner join mdfe_descarga_nfea a on a.id = ua.descarga_id and a.cod_empresa = ua.cod_empresa ' +
        ' where a.cod_mdfe = ' + IntToStr(FOwer.fint('cod_mdfe')) +
        ' and a.cod_empresa = ' + IntToStr(vDadosIni.cod_empresa) +
        ' order by ua.id');

    Result := inherited Open;
    if FOwer.FDescarga.FMDFe.fint('versao') = 0 then
      dataSet.IndexFieldNames := 'SEQID'
    else
      dataSet.IndexFieldNames := 'ID';

    for I := 0 to dataSet.Fields.Count - 1 do
      dataSet.Fields[I].Visible := False;

    dataSet.FieldByName('TPUNIDTRANSP').Visible := True;
    dataSet.FieldByName('IDUNIDTRANSP').Visible := True;
    dataSet.FieldByName('QTDRAT').Visible := True;

    dataSet.FieldByName('TPUNIDTRANSP').DisplayLabel := 'Tipo';
    dataSet.FieldByName('IDUNIDTRANSP').DisplayLabel := 'Identificação';
    dataSet.FieldByName('QTDRAT').DisplayLabel := 'Qtde rateada (Peso, Volume)';

    TFloatField(dataSet.FieldByName('QTDRAT')).DisplayFormat := '##0.00';

    UnidCarga.Open;
    UnidCarga.Filter;
  finally
    dataSet.AfterScroll := dataSetAfterScroll;
  end;
end;

function TMDFe_Descarga_NFe_Unid_Tr.post: Boolean;
begin
  try
    if FOwer.dataSet.IsEmpty then
      raiseExceptionCreate('Nota Fiscal eletrônica vazia', '');
      
    checkFieldEmpty('TPUNIDTRANSP', 'Tipo da Unidade de Transporte precisa ser preenchido', '');
    checkFieldEmpty('IDUNIDTRANSP', 'Identificação da Unidade de Transporte precisa ser preenchida', '');

    case dataSet.State of
      dsEdit:
        begin
          if FOwer.FDescarga.FMDFe.fint('versao') > 0 then
          begin
            FOwer.FDescarga.FMDFe.queryCons
              .SQL('update MDFE_DESCARGA_NFEA_UN_TR set' +
                   ' tpunidtransp = :tpunidtransp,' +
                   ' idunidtransp = :idunidtransp,' +
                   ' lacunidtransp_lacres = :lacunidtransp_lacres' +
                   ' qtdrat = :qtdrat')
              .Equals('id', fint('id'))
              .Equals('cod_empresa', vDadosIni.cod_empresa)
              .ParamValue('tpunidtransp', fint('tpunidtransp'))
              .ParamValue('idunidtransp', fstr('idunidtransp'))
              .ParamValue('lacunidtransp_lacres', fstr('lacunidtransp_lacres'))
              .ParamAsFloat('qtdrat', ffloat('qtdrat'))
              .ExecSQL;
            dataSet.Cancel;
            dataSet.Refresh;
          end;
        end;

      dsInsert:
        begin
          if FOwer.FDescarga.FMDFe.fint('versao') = 0 then
          begin
            dataSet.FieldByName('COD_MDFE').AsInteger := FOwer.dataSet.FieldByName('COD_MDFE').AsInteger;
            dataSet.FieldByName('COD_EMPRESA').AsInteger := vDadosIni.cod_empresa;
            dataSet.FieldByName('CMUNDESCARGA').AsInteger := FOwer.dataSet.FieldByName('CMUNDESCARGA').AsInteger;
            dataSet.FieldByName('COD_NF').AsInteger := FOwer.dataSet.FieldByName('COD_NF').AsInteger;
            dataSet.FieldByName('SEQID').AsInteger := Gencodigo('MDFE_DESCARGA_NFE_UN_TR', buscas, vDadosIni.codEmpresa);
          end
          else
          begin
            queryCons.Table('MDFE_DESCARGA_NFEA_UN_TR')
              .SQL('insert into MDFE_DESCARGA_NFEA_UN_TR' +
                   ' (id, cod_empresa, descarga_id, tpunidtransp, idunidtransp, lacunidtransp_lacres, qtdrat)' +
                   ' values ' +
                   ' (:id, :cod_empresa, :descarga_id, :tpunidtransp, :idunidtransp, :lacunidtransp_lacres, :qtdrat)')
              .ParamIncCodigo('id')
              .ParamValue('cod_empresa', vDadosIni.cod_empresa)
              .ParamValue('descarga_id', FOwer.fint('id'))
              .ParamValue('tpunidtransp', fint('tpunidtransp'))
              .ParamValue('idunidtransp', fstr('idunidtransp'))
              .ParamValue('lacunidtransp_lacres', fstr('lacunidtransp_lacres'))
              .ParamAsFloat('qtdrat', ffloat('qtdrat'))
              .ExecSQL;
            dataSet.Cancel;
            dataSet.Refresh;
          end;
        end;
      else
        Exit;
    end;

    if FOwer.FDescarga.FMDFe.fint('versao') = 0 then
    begin

      Result := inherited Post;

      if Result then
        if dataSet.FieldByName('COD_MDFE').AsInteger > 0 then
          Result := Apply;
    end

    else
      Result := True;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro ao salvar Unidades de Transporte. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TMDFe_Descarga_NFe_Unid_Tr.post. Erro: ' + e.Message);
    end;
  end;
end;

end.
