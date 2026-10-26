unit uDataSet_OOP;

interface

uses
  DBClient, StdCtrls, SysUtils, Classes, Controls, IBDatabase, IBQuery,
  IBStoredProc, AppEvnts, DBGrids, DB, DBCtrls, Provider, Forms, Windows,
  Messages, Contnrs, Math, hw_audit_utils, Query_OOP, Types_OOP, hw_filters, FieldsConfigUnit;

type
  // Clsse TDataSet_OOP, implementação de metodos e eventos na classe.
  TOperacaoMaskFones = (omfDefiniInicio, omfGetText, omfEditMask);
  TOperacaoMaskFone  = set of TOperacaoMaskFones;
  TOptions_loop      = set of (ol_storeRecno, ol_storeFilter, ol_disableControls, ol_filterClear_done, ol_go_first, ol_storeAfterScroll);

const
  loop_options_all        : TOptions_loop = [ol_storeRecno, ol_storeFilter, ol_disableControls, ol_filterClear_done, ol_go_first, ol_storeAfterScroll];
  loop_options_with_filter: TOptions_loop = [ol_storeRecno, ol_storeFilter, ol_disableControls, ol_go_first];

type

  Tevent_ = procedure of object;

  TEtiquetasQuickReport = procedure(tabela, CaptionTabela: PChar; EnderecoDB: PChar; CodEmp: integer; Grid: TDBGrid; SoSelecionado, EtiPreGravadaProd, ImprimirQtdEst: boolean); stdcall;
  TmarcarProdutoParaEtiqueta = procedure(EnderecoDB: PChar; GrupoProd: Integer; CodProd: PChar; CodEmp, Qtde: Integer); stdcall;
  TManutencaoAlteracoesArquivosPAF = Class;
  TFieldValue_OOP = class;

  ArrayInts = array of Integer;

  LogStoreOOP = record
    filename: string;
    textAux: string;
    tStarted: TDateTime;//inicio registrado da ultima operacao de log
    tStartSet: TDateTime;// setado um tempo para ser usado acima no registro de inicio
    started: Boolean;
  end;

  ScalarValue = Types_OOP.ScalarValue;

  {
  TCondition_OOP = (cIgual, cDif, cMaior, cMenor, cMaiorOuIgual, cMenorOuIgual, cComeca, cEstaContido, cTermina);
  TSelect_OOP = class(TObject)
  private
    Client: TClientDataSet;
    Query : TIBQuery;
  public

    constructor Create(DataSet: TDataSet_OOP): overload;
    destructor Destroy; override;

//    function Client(DataSet: TClientDataSet): TSelect_OOP;// passar o client e liberar a query - iniciar o select
//    function Query(DataSet: TIBQuery): TSelect_OOP;       // passar a quer e liberar o client  - iniciar o select
    function Select(DataSet: TClientDataSet): TSelect_OOP;// passar o client e liberar a query - iniciar o select
    function Select(DataSet: TIBQuery): TSelect_OOP;      // passar a quer e liberar o client  - iniciar o select
//    function Update(DataSet: TIBQuery): TSelect_OOP;
    function Table(TableName: string): TSelect_OOP;
    function Field(FieldName: string): TSelect_OOP;       // add field ao selec
    function Field(FieldName: string): TSelect_OOP;       // add field ao selec
    function Where(FieldName: string; Condition: TCondition_OOP; Value: string): TSelect_OOP; overload; // add field ao where
    function Where(FieldName: string; Condition: TCondition_OOP; Value: Integer): TSelect_OOP; overload; // add field ao where
    function Where(FieldName: string; Condition: TCondition_OOP; Value: Double): TSelect_OOP; overload; // add field ao where
    function Where(FieldName: string; Condition: TCondition_OOP; Value: TDate): TSelect_OOP; overload; // add field ao where
    function Where(FieldName: string; Condition: TCondition_OOP; Value: TDateTime): TSelect_OOP; overload; // add field ao where
    function OrderBy(FieldName: string): TSelect_OOP;       // add field ao selec
    function Open: TDataSet_OOP;

    //talveze simplificar os metodos colocando apenas a primeira sigla, S, F, W, O
  end;
  }

  TDataSet_OOP = class(TObject)
  strict private
    uniqueComponentName: string;
  private
    FDataSet: TClientDataSet;
    FTransacao: TIBTransaction;
    FBuscas: TIBQuery;
    fCampoCodEmpresa: string;
    fPossuiTelefone: string;
    fCamposTelefone: array of string;
    fCampoUF: string;           
    Ffb_t    : TIBTransaction;
    Ffb_q    : TIBQuery;
    F_dataSetProvideOOP: TDataSetProvider;
    F_queryOOP: TIBQuery;
    F_dataSourceOOP: TDataSource;
    F_transactionOOP: TIBTransaction;
    F_Free_Transaction: Boolean;
    F_Free_Client: Boolean;
    FFieldsConfig: FieldsConfigModel;
    FDontChangeDisplayFields: Boolean;
    FTableName: string;
    FStrAuditoria: string;
    FStrAuditoriaCod: string;
    Frecno: Integer;
    Ffilter: string;
    Ffiltered: Boolean;
    FprepareOptions: TOptions_loop;
    FlogStore: LogStoreOOP;
    FultimoErro: string;
    F_dataSetOOP_AfterOpen: TNotifyEvent;
    Flist_fdata: TObjectList;
    FAuditor: TAudit_OOP;
    FrescueDataSetAfterScroll: TDataSetNotifyEvent;
    FCheckValue: string;
    FUncheckValue: string;
    FqueryCons: TQuery_OOP;
    FSQLMaker: TSqlMaker;
    function GetQueryCons: TQuery_OOP;
    procedure SetTableName(const Value: string);
    function GetAuditor: TAudit_OOP;
    function GetIndexFieldNames: string;
    procedure SetIndexFieldNames(const Value: string);
    procedure campoFoneMaskGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure dataSetDBBeforeOpen(DataSet: TDataSet);//usar apenas quando usar metodo CreateDbComponents
    procedure dataSetDBAfterOpen(DataSet: TDataSet);//usar apenas quando usar metodo CreateDbComponents
    procedure InicializarTabelaCampoCaseSentitive;
    function horaFimData(Data: string): string;
  protected
    TabelaCampoCaseSentitive: TStringList;
    function ajustar_consulta_incasesensitive(Afield: TField; Atable, AvalorConsulta: string): string;
    procedure configuraCamposTelefone(pOperacao:TOperacaoMaskFone);
    procedure dataSetReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction); virtual;
    function reconectaEmBaseLocal(E: Exception): boolean;
    function reconectaNoServidor(E: Exception): boolean;
    function recuperarDadosDigitados: boolean; virtual;
    procedure _OnGetTextMascaraFONE(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure datasetMaskFoneBeforeInsertEdit(DataSet: TDataSet);
    procedure datasetMaskFoneBeforeCancelPost(DataSet: TDataSet);
    procedure datasetMaskFoneAfterEditInsert(DataSet: TDataSet);
    procedure datasetMaskFoneUFValidate(Sender: TField);
    procedure checkFieldEmpty(pFieldName, pMessage: string; pComponentFocus: string = ''; pCheckNull: Boolean = False); overload;
    procedure checkFieldEmpty(pFieldName, pMessage: string; pComponentFocus: string; pDataSet: TDataSet; pCheckNull: Boolean = False); overload;

    function CreateDbComponents(ADataBase: TIBDatabase; ATransaction: TIBTransaction = nil; AMainDataSet: Boolean = True; AnameUnq: string = ''): Boolean; virtual;
    function Create_fb_query(Atr: TIBTransaction): TIBQuery;
    function Create_fb_transaction(Adb: TIBDatabase): TIBTransaction;
    function InitFieldsDef(sqlSemRetornarDados: string; const Args: array of const): TDataSet_OOP;
    function AddFieldInternalCalc(fieldName: string; fieldType: TFieldType; fieldSize: Smallint = 0): TDataSet_OOP;
    procedure AssignAndCreateFieldsFrom(ADataSet: TDataSet);
    function AddFieldDef(fieldName: string; fieldType: TFieldType; fieldKind: TFieldKind = fkData; fieldSize: Smallint = 0): TDataSet_OOP; //Ainda nao usei, parece nao funcionar

  public
    constructor Create; overload; virtual;
    constructor Create(ADataBase: TIBDatabase; ATransaction: TIBTransaction = nil; AMainDataSet: Boolean = True; AnameUnq: string = ''); overload;
    destructor Destroy; override;
    function FreeDbComponents(AdataSet_to: Boolean = False): Boolean;
    function Active: Boolean;
    function Apply: Boolean; virtual;
    function ApplyChanges(const ACheckChanges: Boolean = True): Boolean; virtual;
    function Cancel: Boolean; virtual;
    function CancelUpdates: Boolean; virtual;
    function Close: Boolean; virtual;
    function Refresh: Boolean; virtual;
    function Delete: Boolean; virtual;
    function Edit: Boolean; virtual;
    function Insert: Boolean; virtual;
    function Next: Boolean; virtual;
    function Open: Boolean; virtual;
    function Post: Boolean; virtual;
    function Prior: Boolean; virtual;
    function First: Boolean; virtual;
    function Last: Boolean; virtual;
    function Bof: Boolean; virtual;
    function Eof: Boolean; virtual;
    function IsEmpty: Boolean; virtual;
    function AcceptChanges: Boolean; virtual;
    procedure FindNearest(const KeyValues: array of const);
    function CheckUnCheckRow(Acheck: Boolean; AFieldName: string = 'SEL'): TDataSet_OOP; overload; virtual;
    function CheckUnCheckRow(AFieldName: string = 'SEL'): TDataSet_OOP; overload; virtual;
    function CheckUnCheckAllRows(Acheck: Boolean; AFieldName: string = 'SEL'; Afilter: string = ''): TDataSet_OOP;
    function Create_new_fb_query(Atr: TIBTransaction): TIBQuery;
    function Create_new_fb_transaction(Adb: TIBDatabase): TIBTransaction;
    function CloneDataSetProps(sourceDts: TDataSet_OOP; kinds: TFieldKinds = [fkData, fkCalculated, fkInternalCalc]): TDataSet_OOP; overload;
    function CloneDataSetProps(sourceCds: TClientDataSet; kinds: TFieldKinds = [fkData, fkCalculated, fkInternalCalc]): TDataSet_OOP; overload;
    //function NewQueryOOP(ASql: string; AQuery: TIBQuery): TQuery_OOP;
    procedure ConfigFields(const Builder: IFieldsConfigBuilder);

    property dataSet: TClientDataSet read FDataSet write FDataSet;
    property transacao: TIBTransaction read FTransacao write FTransacao;
    property buscas: TIBQuery read FBuscas write FBuscas;
    property IndexFieldNames: string read GetIndexFieldNames write SetIndexFieldNames;
    //
    property _transactionOOP: TIBTransaction read F_transactionOOP write F_transactionOOP;
    property _queryOOP: TIBQuery read F_queryOOP write F_queryOOP;
    property _dataSetProvideOOP: TDataSetProvider read F_dataSetProvideOOP write F_dataSetProvideOOP;
    property _dataSourceOOP: TDataSource read F_dataSourceOOP write F_dataSourceOOP;
    property _dataSetOOP_AfterOpen: TNotifyEvent read F_dataSetOOP_AfterOpen write F_dataSetOOP_AfterOpen;

    property queryCons: TQuery_OOP read GetQueryCons write FqueryCons;

    property StrAuditoria   : string read FStrAuditoria    write FStrAuditoria;
    property StrAuditoriaCod: string read FStrAuditoriaCod write FStrAuditoriaCod;
    property TableName      : string read FTableName       write SetTableName;
    property ultimoErro     : string read FultimoErro write FultimoErro;
    property Auditor        : TAudit_OOP read GetAuditor   write FAuditor;
    property CheckValue     : string read FCheckValue      write FCheckValue;
    property UncheckValue   : string read FUncheckValue    write FUncheckValue;
    property SQLMaker       : TSqlMaker read FSQLMaker     write FSQLMaker;

    function Gencodigo(Tabela: string; procedureCodigo: TIBStoredProc; codemp: string): integer; overload;
    function Gencodigo(Tabela: string; buscas: TIBQuery; codemp: string): integer; overload;
    function Cpf(Num: string): boolean;
    function cgc(Num: string): boolean;
    function CNPJ(const AInput: string): boolean;
    function ConsisteInscricaoEstadual(const Insc, UF: WideString): Integer;
    function montaSelect(sqlComandos: string): boolean; overload;
    function montaSelect(sqlComandos: string; dataIni, dataFim: TDate): boolean; overload;
    function montaSelect(sqlComandos: string; const Args: array of const; AdataSet: TClientDataSet = nil): boolean; overload;
    function montaSelect(sqlComandos: string; dataIni, dataFim: TDate; const Args: array of const; AdataSet: TClientDataSet = nil): boolean; overload;
    function ClientOpen(ASql: string; ADataSet: TClientDataSet = nil): TClientDataSet ; overload;
    function ClientOpen(ASql: string; const Args: array of const; ADataSet: TClientDataSet = nil): TClientDataSet; overload;
    function ExecutaComandosSql(comandosSql: string; pCloseQueryAfter: Boolean = True): boolean; overload;
    function ExecutaComandosSql(comandosSql: string; dataIni, dataFim: TDate; pCloseQueryAfter: Boolean = True): boolean; overload;
    function SqlOpen(ASql: string; AQuery: TIBQuery = nil): TIBQuery; overload;
    function SqlOpen(ASql: string; const Args: array of const; AQuery: TIBQuery = nil): TIBQuery; overload;
    function SqlExec(ASql: string; AQuery: TIBQuery = nil): TIBQuery; overload;
    function SqlExec(ASql: string; const Args: array of const; AQuery: TIBQuery = nil): TIBQuery; overload;
    function SqlScalar(ASql: string; AQuery: TIBQuery = nil): ScalarValue; overload;
    function SqlScalar(ASql: string; const Args: array of const; AQuery: TIBQuery = nil): ScalarValue; overload;
    function SqlInsertID(Asql: string; AreturnField: string; AQuery: TIBQuery = nil): Integer; overload;
    function SqlInsertID(Asql: string; const Args: array of const; AreturnField: string; AQuery: TIBQuery = nil): Integer; overload;
    function SqlInsertGuid(Asql: string; AreturnField: string; AQuery: TIBQuery = nil): string; overload;
    function SqlInsertGuid(Asql: string; const Args: array of const; AreturnField: string; AQuery: TIBQuery = nil): string; overload;
    function ExecutaComandosSqlExec(comandosSql: string): boolean;
    function IniciaTransacao: boolean;
    function CommitaTransacao: Boolean;
    function emTransacao: boolean;
    procedure RollBackTransacao;
    procedure RetornaAtributos(Vcomb: Tcombobox; vcombord: TCombobox);
    function ConsultaCampos(tabela, valorConsulta, Campo, condicao, ordem: string; constante: boolean; codemp: string): boolean; overload; virtual;
    function ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim: string; codemp: string): boolean; overload; virtual;
    function ConsultaCampos(tabela, valorConsulta, Campo, condicao, ordem, sqlAdicional: string; constante: boolean; codemp: string): boolean; overload; virtual;
    function ConsultaCamposOutrasEmp(tabela, valorConsulta, Campo, condicao, ordem, sqlAdicional: string; constante: boolean; codemp: string): boolean; overload; virtual;
    function ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim, sqlAdicional: string; codemp: string): boolean; overload; virtual;
    function ConsultaCamposOutrasEmp(tabela, Campo, ordem, dataIni, dataFim, sqlAdicional: string; codemp: string): boolean; overload; virtual;
    function ConsultaCampos(tabela, valorConsulta, Campo, condicao, ordem: string; constante: boolean; codemp: string; ativo: integer): boolean; overload; virtual;
    function ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim: string; codemp: string; ativo: integer): boolean; overload; virtual;
    // se passar ':' para  dataini e também para datafim ele entende que é DateTime e acrescenta 00:00:00 a 23:59:59
    function ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim, codemp: string; ativo: integer; CamposExibir, INNER_JOIN,CondicaoWHERE: string; CampoCodEmpresa: string = ''): boolean; overload; virtual;
    function ConsultaCamposOutrasEmp(tabela, Campo, ordem, dataIni, dataFim, codemp: string; ativo: integer; CamposExibir, INNER_JOIN,CondicaoWHERE: string): boolean; overload; virtual;
    function ConsultaCampos(tabela, valorConsulta, Campo, condicao, ordem: string; constante: boolean; codemp, CamposExibir, INNER_JOIN,CondicaoWHERE: string; CampoCodEmpresa: string = ''): boolean; overload; virtual;
    function ConsultaCamposOutrasEmp(tabela, valorConsulta, Campo, condicao, ordem: string; constante: boolean; codemp, CamposExibir, INNER_JOIN,CondicaoWHERE: string): boolean; overload; virtual;
    //Para resolver problemas de ambiguidade de campos sabendo a qual tabela o campo pertence informe informe o nome desta no parâmetro pTabela2
    function ConsultaCampos(pTabela1,pTabela2, valorConsulta, Campo, condicao, ordem: string; constante: boolean; codemp, CamposExibir, INNER_JOIN,CondicaoWHERE: string; pUpperCase:boolean=false): boolean; overload; virtual;
    function RunSQLMaker(): TDataSet_OOP; virtual;

    function ConsultaCamposLixeira(tabela, valorConsulta, Campo, condicao, ordem: string; constante: boolean; codemp: string): boolean; overload; virtual;
    function ConsultaCamposLixeira(tabela, Campo, ordem, dataIni, dataFim: string; codemp: string): boolean; overload; virtual;
    function ConsultaCamposLixeira(tabela, valorConsulta, Campo, condicao, ordem, sqlAdicional: string; constante: boolean; codemp: string): boolean; overload; virtual;
    function ConsultaCamposLixeira(tabela, Campo, ordem, dataIni, dataFim, sqlAdicional: string; codemp: string): boolean; overload; virtual;
    function ConsultaCamposLixeira(tabela, Campo, ordem, dataIni, dataFim, codemp: string; ativo: integer; CamposExibir, INNER_JOIN,CondicaoWHERE: string; CampoCodEmpresa: string = ''): boolean; overload; virtual;
    function ConsultaCamposLixeira(tabela, valorConsulta, Campo, condicao, ordem: string; constante: boolean; codemp, CamposExibir, INNER_JOIN,CondicaoWHERE: string; CampoCodEmpresa: string = ''): boolean; overload; virtual;

    procedure raiseExceptionCreate(eMessage: string; pNomeCampo: string = ''); overload;
    procedure raiseExceptionCreate(eMessage: string; const Args: array of const; pNomeCampo: string = ''); overload;

    procedure registraErro(vMenserro: string); overload;
    procedure registraErro(vMenserro: string; const Args: array of const); overload;
    function retornaValor(comandosSql: string; pAplicarTrim: Boolean = True): string; overload;
    function retornaValor(comandosSql: string; dataIni, dataFim: TDate; pAplicarTrim: Boolean = True): string; overload;
    procedure MarcaProdutoParaEtiquetaQRP(GrupoProd: Integer; CodProd: string; Qtde: Integer);
    procedure ImprimirEtiquetasQRP(Tabela, Caption: string; Grid: TDBGrid; EtiPreGravadaProd, ImprimirQtdEst: boolean);
    function verificarDNA(vcoddep: integer): boolean;
    function cfopValido(CFOP: Double; entradaSaida: string): boolean;
    function existeCFOP(CFOP: Double): boolean;
    function ultdiaCXL: boolean;
    procedure SalvarDisplays(dataModule: TComponent; componentName: string);

    procedure storeRecNo;
    procedure restoreRecNo;
    procedure storeFilter;
    procedure restoreFilter;
    procedure filterClear;
    function filterStr(Afilter: string): TDataSet_OOP; overload;
    function filterStr(Afilter: string; const Args: array of const): TDataSet_OOP; overload;

    function ffDisplayLabel(field, display: string): TDataSet_OOP;
    function ffDisplayFormat(field: string; format: string = '#,##0.00'): TDataSet_OOP;

    function prepare_loop(Aoptions: TOptions_loop): TDataSet_OOP; overload;
    function prepare_loop(Afilter: string = ''; Aoptions: TOptions_loop = [ol_storeRecno, ol_storeFilter, ol_disableControls, ol_filterClear_done, ol_go_first]): TDataSet_OOP; overload;
    function prepare_loop_fmt(Afilter: string; const ArgsFilter: array of const; Aoptions: TOptions_loop = [ol_storeRecno, ol_storeFilter, ol_disableControls, ol_filterClear_done, ol_go_first]): TDataSet_OOP; overload;
    function prepare_loop_done: TDataSet_OOP;

    procedure logs(Atext, Afilename: string; Asingleline: Boolean = False; AtimeStart: TDateTime = 0);
    procedure logs_sl(Atext, Afilename: string; AtimeStart: TDateTime = 0);
    procedure logs_elapsed_time(Atext: string = '');

    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    procedure _GravaConfiguracoesDouble(NomeVariavel : string; Valor : Double);
    procedure _GravaConfiguracoesBoolean(NomeVariavel : string; Valor : Boolean);
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);
    function _LerConfiguracoesRegistroString(NomeVariavel : string; pDefault: string = '') : string;
    function _LerConfiguracoesRegistroDouble(NomeVariavel : string; pDefault: Double = 0) : Double;
    function _LerConfiguracoesRegistroBoolean(NomeVariavel : string; pDefault: Boolean = False) : Boolean;
    function _LerConfiguracoesRegistroInteger(NomeVariavel : string; pDefault: Integer = 0) : Integer;
    function retornaTabela(pDataSet: TClientDataSet): string;
    function tabelaExiste(pNomeTabela: string): boolean;
    function permiteCadastro(pNomeTabela: string; pState: TClientDataSet): boolean;
    function GetIni(pChave, pIdentificador, pValorDefault: string): string; overload;
    function GetIni(pChave, pIdentificador, pValorDefault: string; IniText: TStrings): string; overload;
    function AsTrueValue(Avalue: Double): Boolean;
    function f_int(Afield: string): Integer;
    function f_float(Afield: string): Double; overload;
    function f_float(Afield: string; const ADigit: TRoundToRange): Double; overload;
    function f_date(Afield: string): TDate;
    function f_datet(Afield: string): TDateTime;
    function f_str(Afield: string; Atrim: Boolean = True): string;
    function fint(Afield: string): Integer;
    function ffloat(Afield: string): Double; overload;
    function ffloat(Afield: string; const ADigit: TRoundToRange): Double; overload;
    function ffloat_fb(Afield: string): string; overload;
    function ffloat_fb(Adouble: Double): string; overload;
    function fdate(Afield: string): TDate;
    function fdatet(Afield: string): TDateTime;
    function fdate_fb(Afield: string; AquoteStr: Boolean = True): string;
    function fdatet_fb(Afield: string; AquoteStr: Boolean = True): string;
    function fstr(Afield: string; Atrim: Boolean = True): string; overload;
    function fstr(Afield: string; index, count: Integer; atrim: Boolean = True): string; overload;
    function ftext(Afield: string; Atrim: Boolean = True): string; overload;
    function ftext(Afield: string; index, count: Integer; atrim: Boolean = True): string; overload;
    function fstrin(Afield: string; Values: array of string; Atrim: Boolean = True; CaseSensitive: Boolean = False): Boolean;
    //function fcopy(Afield: string; Index, Count: Integer; Atrim: Boolean = True): string;
    function fdif(Afield, Text: string; Atrim: Boolean = True): Boolean;
    function fequals(Afield, Text: string; Atrim: Boolean = True): Boolean; overload;
    function fequals(Afield: string; Value: Integer): Boolean; overload;
    function fstrq(Afield: string; Atrim: Boolean = True): string; overload;
    function fstrq(Afield: string; Index, Count: Integer; Atrim: Boolean = True): string; overload;
    function fstrdef(Afield: string; const defValue: string; Atrim: Boolean = True): string; 
    function fmatchText(Afield: string; const AValues: array of string; Atrim: Boolean = True): Boolean;
    function fsum(Afield: string; Prepare: Boolean = True): Double;
    function fcount(Afield, value: string): Double;
    function fempty(Afield: string; Atrim: Boolean = True): Boolean;
    function fnull(Afield: string): Boolean;
    function fdata(Afield: string): TFieldValue_OOP;
    function ffield(Afield: string): TField;
    function flist(Afield: string; DupIgnore: Boolean = False; Prepare: Boolean = True): TStrings; overload;
    function flist(Afield: string; aLineBreak: string; DupIgnore: Boolean = False; Prepare: Boolean = True): TStrings; overload;
    function str_empty(Afield: string; Atrim: Boolean = True): Boolean;
    function GetArrayInts(fieldId: string; preparaLoop: Boolean = False; fieldSel: string = 'SEL'): ArrayInts; overload;
    function GetArrayInts(fieldId: string; preparaLoop: Boolean; selectAsDefaultCurrent: Boolean = True; fieldSel: string = 'SEL'): ArrayInts; overload;
    function GetArrayDistinctInts(fieldId: string; preparaLoop: Boolean; selectAsDefaultCurrent: Boolean = True; fieldSel: string = 'SEL'): ArrayInts; overload;


    function SQLClient(sqlText: string): TDataSet_OOP; overload;
    function ParamValue(param: string; value: string): TDataSet_OOP; overload;
    function ParamValue(param: string; value: Integer): TDataSet_OOP; overload;
    function ParamValue(param: string; value: TDateTime): TDataSet_OOP; overload;

  var
    inibeErro, vNomeCampoErro, vMensagemErro: string;
    vfatapura, vMargemMin, vMarkupmin, VCFgeral, VCFprod, VPERCCF, VCMV, VCF, VOCV, vPercBaseADIRRF: real;
    VDepto, vDNA: string;
    vmesap, vanoap: integer;
    vMD5Func : TManutencaoAlteracoesArquivosPAF;
  end;

  TDataSetChild_OOP = class(TDataSet_OOP)
  protected
    FOwner: TDataSet_OOP;
  public
    constructor Create(AOwner: TDataSet_OOP); virtual;
  end;

  TFieldValue_OOP = class(TObject)
  private
    FField      : TField;
    FFieldName  : string;
    FTrimStrings: Boolean;
    FOwner      : TDataSet_OOP;
    function GetDisplayFormat: string;
    procedure SetDisplayFormat(const Value: string);
    function PutValue(Value: Variant): TFieldValue_OOP;
    function GetAsString: string;
    function GetAsFloat: Double;
    function GetAsInteger: Longint;
    function GetIsNull: Boolean;
    procedure SetAsString(const Value: string);
    procedure SetAsFloat(const Value: Double);
    procedure SetAsInteger(const Value: Longint);
  public
    constructor Create(Field: TField; AOwner: TDataSet_OOP);
    function Put(Value: string): TFieldValue_OOP; overload;
    function Put(Value: Integer): TFieldValue_OOP; overload;
    function Put(Value: Double): TFieldValue_OOP; overload;
    function Put(Value: Double; const ADigit: TRoundToRange): TFieldValue_OOP; overload;
    function AutoPut(Value: Variant): TFieldValue_OOP;//Quando objeto não esta em modo de edição, ativa automaticamente, e aplica o post no metodo PutValue
    function SubString(Index, Count: Integer): string;
    function Sum: Double;
    //function Count: Integer; overload;
    function Count(value: string): Integer; 
    function SetNull: TFieldValue_OOP;
    function Length: Integer;
    function SetNumberDisplayFormat(Decimal: Integer; ThousandSeparat: Boolean = True): TFieldValue_OOP;

    property AsFloat      : Double  read GetAsFloat       write SetAsFloat;
    property AsInteger    : Longint read GetAsInteger     write SetAsInteger;
    property AsString     : string  read GetAsString      write SetAsString;
    property FieldName    : string  read FFieldName       write FFieldName;
    property DisplayFormat: string  read GetDisplayFormat write SetDisplayFormat;
    property IsNull       : Boolean read GetIsNull;
    property TrimStrings  : Boolean                       write FTrimStrings;
  end;

  /// Classe responsavel pela manutenção do MD5 dos arquivos eletronicos
  TManutencaoAlteracoesArquivosPAF = class
  public
    constructor create;

    procedure _gravaMD5_DAV(query: TIBQuery; pNumeroDAV: integer );
    procedure _gravaMD5_DAV_Produtos_Sevicos(query: TIBQuery; pNped: integer; pTipo: string);
    procedure _gravaMD5_Produtos(query: TIBQuery; pGrupo: integer ; pCodigo: string; pCommit: Boolean = True); overload;
		procedure _gravaMD5_Produtos(query, query2: TIBQuery; pTipo: string; pNPed: integer; pCommit: Boolean = True); overload;
    procedure _gravaMD5_Servicos(query: TIBQuery; pCodigo: integer; pCommit: Boolean = True);
    procedure _gravaMD5_RegistrosPAF(query: TIBQuery; pTextoAcript, pTabela, pWhere: string; pCampoMD5: string = 'MD5');
                                   
    function _validaMD5_registrosPAF(pTextoAvalidar, pTextoMD5: string): Boolean;

    function _validaMD5_DAV(query: TIBQuery; pNumeroDAV: integer ): Boolean; // EM DESUSO
    function _validaMD5_DAV_Produtos_Sevicos(query: TIBQuery; pNped: integer; pTipo: string; pPS: string; pGrupo: Integer; pCodProd: string; pGrade: Integer; pCodServico: Integer; pNItem: Integer): Boolean; // EM DESUSO
    function _validaMD5_DAV_Itens(query: TIBQuery; pNumeroDAV: integer ): Boolean; // EM DESUSO
    function _validaMD5_Produtos(query: TIBQuery; pGrupo: integer ; pCodigo: string): Boolean; // EM DESUSO
    function _validaMD5_Servicos(query: TIBQuery; pCodigo: integer ): Boolean; // EM DESUSO
    function _validaMD5_TerminalImpressoras(query: TIBQuery; pCodigoTerminal: integer ; pCNIEE, pNSerieECF: string): Boolean; // EM DESUSO
    function _validaMD5_EmpresaDes(query: TIBQuery; pCodigo: integer ): Boolean; // EM DESUSO
    function _validaMD5_EmpresaUsuaria(query: TIBQuery; pCodigo: integer ): Boolean; // EM DESUSO
    function _validaMD5_ReducaoZ(query: TIBQuery; pCOOReducao, pCodTerminal: integer ; pNSerieECF, pDataMov: string): Boolean; // EM DESUSO
    function _validaMD5_DetalhesReducaoZ(query: TIBQuery; pCOOReducao, pCodTerminal: integer ; pNSerieECF, pDescAliq: string): Boolean; // EM DESUSO
    function _validaMD5_Cupom(query: TIBQuery; pCupom, pCodTerminal, pRegistro: integer; pNSerieECF: string): Boolean; // EM DESUSO
    function _validaMD5_Cupom2(query: TIBQuery; pCodTerminal, pRegistro, pnItem, pCupom, pOrdem : integer; pNumSerieECF:string): Boolean; // EM DESUSO
    function _validaMD5_DocNaoFiscal(query: TIBQuery; pCOODocumento, pCodTerminal: integer ; pNSerieECF: string): Boolean; // EM DESUSO
    function _validaMD5_FinCupom(query: TIBQuery; pRegistro, pCodTerminal: integer ; pNSerieECF: string): Boolean; // EM DESUSO
  end;

  TDadosLookUp_OOP = class(TObject)
  private
    // Componentes de acesso a dados pra montar a estrutura do dataset a ser vinculado com o dblookup ou dbgrid
    fDataSet         : TClientDataSet;
    fDataSource      : TDataSource;
    fDataSetProvider : TDataSetProvider;
    fQuery           : TIBQuery;
    // Associacao aos componentes da tela que vao ser manipulados por esta classe
    fDBLookupComboBox: TDBLookupComboBox;
    fDBEdit          : TDBEdit;
    fDBgrid          : TDBGrid;
    // Demais variaveis auxiliares
    fSql             : string;           // Campos da tabela de gravacao de dados
    fKeyField        : string;           // Campo keyfield do dblookup - metodo 1 e 2
    fListField       : string;           // Campo listfield do dblookup - metodo 1 e 2
    fTarget          : array of string;  // Campo que contem todos os campos que vao receber um valor da tabela de origem - metodo 3
    fSource          : array of string;  // Campo que contem todos os campos da tabela de origem que vai atribuir nos campos acima -
    fValues          : array of Variant; // Valores dos campos acima atribuidos no evento afterscroll do dataset
    fValuesOld       : array of Variant; // Valores dos campos acima na primeira entrada nos componentes, para voltar os dados caso nao confirme
    fDbgridTitle     : Boolean;          // Variavel que indica se o titulo do grid será visivel ou não
    fPrimeiraEntrada : Boolean;          // Variavel que indica que já ouve a primeira entrada no componente, na primeira entrada ele atribui os valores no array ValoresOld
    fVoltarAoSair    : Boolean;          // Variavel que indica que deve voltar os valores ao sair dos componentes, isso caso a confirmacao do usuário nao tenha sido feita
    fFilter          : string;           // Variavel que vai ser usada como filtro caso o usuario queira usar apenas um filtro, passar como parametro um "%" antes do campo no pSource - metodo 3
    fFilterOld       : string;           // Variavel com o valor original da variavel acima, pressionado F7 esta variavel permite alternar o metodo de filtro
    fFilterCondicao  : string;           // Condicao para o filtro, alterna entre começa e esta contido
    fTopGrid         : integer;
    fLeftGrid        : integer;
    fHeightGrid      : integer;
    fWidthGrid       : integer;
    fFormParent      : TForm;

    fNoChange        : Boolean;          // Variavel que é setada no exit do edit e dbgrid para impedir que o evento Change ative os componentes novamente

    fKeyEnvent       : TKeyEvent;
    fEnterEvent      : TNotifyEvent;
    fExitEvent       : TNotifyEvent;
    fChangeEvent     : TNotifyEvent;

    fDBEditsOld      : array of TDBEdit;
    fDBGridsOld      : array of TDBGrid;

    procedure ClientDataSetAfterScroll(DataSet: TDataSet); // metodo 3
    procedure ClientDataSetAfterRefresh(DataSet: TDataSet);

    procedure DBEditChange(Sender: TObject);// metodo 3
    procedure DBEditEnter(Sender: TObject);// metodo 3
    procedure DBEditExit(Sender: TObject);// metodo 3
    procedure DBEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);// metodo 3

    procedure DBGridExit(Sender: TObject);// metodo 3
    procedure DBGridDblClick(Sender: TObject);// metodo 3
    procedure DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);// metodo 3

    procedure voltarValores;// metodo 3
    procedure aplicarFilter;
  public
    constructor create; 
    destructor Destroy; override;
    procedure limpar;
    procedure iniciar(); overload;
    procedure iniciar(FieldType: TFieldType; ASize: Smallint); overload;

    function setDadosDataSet(pKeyData, pListData: array of string; pDBLookupComboBox: TDBLookupComboBox = nil; pClear: Boolean = True): Boolean; overload; // metodo 1
    function setDadosDataSet(pKeyField, pListField: string; pDataSet: TDataSet; pDBLookupComboBox: TDBLookupComboBox = nil; pClear: Boolean = True): Boolean; overload; // metodo 2
    function setDadosDataSet(pTarget, pSource, pDisplay: array of string; pQuery: TIBQuery; pDBEdit: TDBEdit = nil; pDBGrid: TDBGrid = nil; pDbgridTitle: Boolean = False; pTop: Integer = 0; pLeft: Integer = 0; pHeight: integer = 0; pWidth: integer = 0): Boolean; overload; // metodo 3
    function setDadosDataSetV(TipoField: TFieldTypeDB; pKeyData: array of Variant; pListData: array of string; pDBLookupComboBox: TDBLookupComboBox = nil; pClear: Boolean = True): Boolean; // metodo 4

    function setDBLookupComboBox(pDBLookupComboBox: TDBLookupComboBox = nil): boolean;
    function setDBEditDBGrid(pDBEdit: TDBEdit = nil; pDBGrid: TDBGrid = nil; pTop: Integer = 0; pLeft: integer = 0; pHeight: integer = 0; pWidth: integer = 0 ): boolean;

    function KeyAsString: string;
    function KeyAsInteger: Integer;
    function fstr(Afield: string; Atrim: Boolean = True): string;
    function fint(Afield: string): Integer;

    property dataSet   : TClientDataSet read fDataSet    write fDataSet;
    property dataSource: TDataSource    read fDataSource write fDataSource;
    property Sql       : string         read fSql        write fSql;
  end;

  //pode usar em um metodo que retorna um tdataset_aux e liberar ao final, ex:
  //function getdados: TDataSet_Aux;
  //...
  //  with getdados do
  //  begin
  //    minhavar := Data.fint('nomecampo');
  //    FreeOb;// liberada o objeto TDataSet_OOP
  //  end
  TDataSet_Aux = class(TObject)
  public
    Data: TDataSet_OOP;

    procedure FreeOb;
  end;

implementation

uses
  Dialogs, IniFiles, uDtmAtivo, IB, Variants, uDadosIni,
  Registry, MaskUtils, IBCustomDataSet, StrUtils, DateUtils, hw_utils,
  hw_doc_utils, json_utils;

type     
  TFieldDisplay = class(TPersistent)
  private
    FDisplay: string;
    FName: string;
    FMask: string;
    FVisible: Boolean;
  published
    property Name: string read FName write FName;
    property Display: string read FDisplay write FDisplay;
    property Visible: Boolean read FVisible write FVisible;
    property Mask: string read FMask write FMask;
  end;

//  {$M+}
  TFieldDisplayList = class(TObjectList)
  private
    function GetItem(Index: Integer): TFieldDisplay;
    procedure SetItem(Index: Integer; const Value: TFieldDisplay);
  public
    property Items[Index: Integer]: TFieldDisplay read GetItem write SetItem;
  end;
//  {$M-}

  {$M+}
  TConfigDisplay = class
  private
    FName: string;
    FFieldList: TFieldDisplayList;
  published
    property Name: string read FName write FName;
    property FieldDisplayList: TFieldDisplayList read FFieldList write FFieldList;
  end;
  {$M-}

{ TDataSet_OOP }

constructor TDataSet_OOP.Create;
begin
  vMD5Func := TManutencaoAlteracoesArquivosPAF.create;
  fPossuiTelefone := '';
  F_Free_Transaction := False;
  F_Free_Client      := False;
  Frecno := -1;
  Ffiltered := False;
  Ffilter   := '';
  FCheckValue := 'S';
  FUncheckValue := '';
  InicializarTabelaCampoCaseSentitive;
  FSQLMaker := TSqlMaker.Create;
  FDontChangeDisplayFields := False
end;

constructor TDataSet_OOP.Create(ADataBase: TIBDatabase;
  ATransaction: TIBTransaction; AMainDataSet: Boolean; AnameUnq: string);
begin
  Create;
  //FDataSet := TClientDataSet.Create(Application);
  FDataSet := vDadosIni.dbComponents.dbClients.HandleNewClient(AnameUnq, Application);
  FDataSet.name := AnameUnq;
  uniqueComponentName := AnameUnq;
  F_Free_Client := True;
  CreateDbComponents(ADataBase, ATransaction, AMainDataSet, AnameUnq);
end;

function TDataSet_OOP.CreateDbComponents(ADataBase: TIBDatabase;
  ATransaction: TIBTransaction; AMainDataSet: Boolean; AnameUnq: string): Boolean;
var
  AComponentName: string;
begin
  try
    Randomize;

    if ATransaction = nil then
    begin
      FTransacao := TIBTransaction.Create(FDataSet.Owner);
      FTransacao.DefaultDatabase := ADataBase;
      FTransacao.Params.Clear;
      FTransacao.Params.Add('read_committed');
      FTransacao.Params.Add('rec_version');
      FTransacao.Params.Add('nowait');
      F_Free_Transaction := True;
    end
    else
      FTransacao := ATransaction;

    FBuscas := TIBQuery.Create(FDataSet.Owner);
    FBuscas.Database := ADataBase;
    FBuscas.Transaction := FTransacao;

    F_queryOOP := TIBQuery.Create(FDataSet.Owner);
    F_queryOOP.Database := ADataBase;
    F_queryOOP.Transaction := FTransacao;

    F_dataSetProvideOOP := TDataSetProvider.Create(FDataSet.Owner);
    F_dataSetProvideOOP.Options := [poAllowCommandText, poUseQuoteChar];
    F_dataSetProvideOOP.DataSet := F_queryOOP;
    F_dataSetProvideOOP.UpdateMode := upWhereChanged;

    AComponentName:= 'DSP_' + Self.ClassName + '_' + IntToStr(Random(100000));
    while FDataSet.Owner.FindComponent( AComponentName) <> nil do
      AComponentName := 'Provider' + IntToStr(Random(100000));
    F_dataSetProvideOOP.Name := AComponentName;

    {FDataSet := TClientDataSet.Create(Application);
    if AMainDataSet then
      FDataSet.Name := 'DTS_' + Self.ClassName
    else
    begin
      AComponentName:= 'DTS_' + Self.ClassName + ' ' + IntToStr(Random(100000));
      while Application.FindComponent(AComponentName) <> nil do
        AComponentName := 'DTS_' + IntToStr(Random(100000));
      FDataSet.Name := AComponentName;
    end;}
    if not FDataSet.Active then
      FDataSet.ProviderName := F_dataSetProvideOOP.Name;

    F_dataSourceOOP := TDataSource.Create(FDataSet.Owner);
    F_dataSourceOOP.DataSet := FDataSet;
    F_dataSourceOOP.AutoEdit := False;

    FDontChangeDisplayFields := False;

    FDataSet.BeforeOpen := dataSetDBBeforeOpen;
    FDataSet.AfterOpen  := dataSetDBAfterOpen;

    Result := True;
  except
    on e: exception do
    begin
      Result := False;
      raise Exception.Create('CreateDbComponents: ' + e.Message);
    end;
  end;
end;

function TDataSet_OOP.Create_fb_query(Atr: TIBTransaction): TIBQuery;
begin
  Ffb_q               := TIBQuery.Create(Atr.Owner);
  Ffb_q.Database      := Atr.DefaultDatabase;
  Ffb_q.Transaction   := Atr;

  Result := Ffb_q;
end;

function TDataSet_OOP.Create_fb_transaction(Adb: TIBDatabase): TIBTransaction;
begin
  Ffb_t := TIBTransaction.Create(Adb.Owner);
  Ffb_t.DefaultDatabase := Adb;
  Ffb_t.Params.Clear;
  Ffb_t.Params.Add('read_committed');
  Ffb_t.Params.Add('rec_version');
  Ffb_t.Params.Add('nowait');

  Result := Ffb_t;
end;

function TDataSet_OOP.Create_new_fb_query(Atr: TIBTransaction): TIBQuery;
begin
  Result               := TIBQuery.Create(Atr.Owner);
  Result.Database      := Atr.DefaultDatabase;
  Result.Transaction   := Atr;
end;

function TDataSet_OOP.Create_new_fb_transaction(
  Adb: TIBDatabase): TIBTransaction;
begin
  Result := TIBTransaction.Create(Adb.Owner);
  Result.DefaultDatabase := Adb;
  Result.Params.Clear;
  Result.Params.Add('read_committed');
  Result.Params.Add('rec_version');
  Result.Params.Add('nowait');
end;

procedure TDataSet_OOP.dataSetDBAfterOpen(DataSet: TDataSet);
var
  I: integer;
  AField: TField;
  Adisplay: string;
  FieldConfig: FieldConfigModel; 
begin
  for I := 0 to DataSet.Fields.Count - 1 do //with DataSet.Fields[I] do
  begin
    AField := DataSet.Fields[I];

    FieldConfig := nil;
    if FFieldsConfig <> nil then
      FieldConfig := FFieldsConfig[AField.FieldName];

    if not FDontChangeDisplayFields and ((FieldConfig = nil) or (FieldConfig.DisplayLabel = '')) then
    begin
      Adisplay            := Trim(StringReplace(LowerCase(AField.FieldName), '_', ' ', [rfReplaceAll, rfIgnoreCase]));
      AField.DisplayLabel := UpperCase(Copy(Adisplay, 1, 1)) + Copy(Adisplay, 2, Length(Adisplay));
    end;

    if FieldConfig <> nil then
    begin
      if FieldConfig.DisplayLabel <> '' then
        AField.DisplayLabel := FieldConfig.DisplayLabel;

      if FieldConfig.EditMask <> '' then
        AField.EditMask := FieldConfig.EditMask;

      if FieldConfig.DisplayFormat <> '' then
        TNumericField(AField).DisplayFormat := FieldConfig.DisplayFormat;

      if Assigned(FieldConfig.GetText) then
      begin
        AField.Alignment := taLeftJustify;
        AField.OnGetText := FieldConfig.GetText;
      end;

      AField.Tag := FieldConfig.Tag;
      AField.Visible := FieldConfig.Visibilidade in [ fvConfiguravel, fvSempreVisivel ];      
    end;
  end;

  if Assigned(F_dataSetOOP_AfterOpen) then
    F_dataSetOOP_AfterOpen(Self);
end;

procedure TDataSet_OOP.dataSetDBBeforeOpen(DataSet: TDataSet);
var
  I: integer;
  AOwner: TComponent;
begin
  if TClientDataSet(DataSet).CommandText <> '' then
  begin
    AOwner := DataSet.Owner;
    for I := 0 to AOwner.ComponentCount - 1 do
    begin
      if (AOwner.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(AOwner.Components[i]).Name) = UpperCase(TClientDataSet(DataSet).ProviderName) then
        begin
          TIBQuery(TDataSetProvider(AOwner.Components[i]).DataSet).SQL.Text := TClientDataSet(DataSet).CommandText;
          Break;
        end;
    end;
  end;
end;

procedure TDataSet_OOP.datasetMaskFoneAfterEditInsert(DataSet: TDataSet);
var
  I: Integer;
begin
  if fPossuiTelefone = 'S' then
    if DataSet.State in [dsInsert, dsEdit] then
      for I := 0 to Length(fCamposTelefone) - 1 do
        if dataSet.FieldByName(fCamposTelefone[i]).FieldKind = fkData then
          try dataSet.FieldByName(fCamposTelefone[i]).AsString := Trim(vDadosIni.apenasNumeros(dataSet.FieldByName(fCamposTelefone[i]).AsString)); except end;
end;

procedure TDataSet_OOP.datasetMaskFoneBeforeCancelPost(DataSet: TDataSet);
begin
  configuraCamposTelefone([omfGetText]);
end;

procedure TDataSet_OOP.datasetMaskFoneBeforeInsertEdit(DataSet: TDataSet);
begin
  configuraCamposTelefone([omfEditMask]);
end;

procedure TDataSet_OOP.datasetMaskFoneUFValidate(Sender: TField);
begin
  configuraCamposTelefone([omfEditMask]);
end;

function TDataSet_OOP.ClientOpen(ASql: string;
  ADataSet: TClientDataSet): TClientDataSet;
begin
  logs(ASql, Self.ClassName + '.ClientOpen');

  if ADataSet = nil then
    ADataSet := FDataSet;

  ADataSet.Close;
  ADataSet.CommandText := ASql;
  ADataSet.Open;

  Result := ADataSet;

  logs_elapsed_time();
end;

function TDataSet_OOP.ClientOpen(ASql: string; const Args: array of const;
  ADataSet: TClientDataSet): TClientDataSet;
begin
  Result := ClientOpen(Format(ASql, Args), ADataSet);
end;

procedure TDataSet_OOP.dataSetReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ultimoErro := E.Message;
  if (Pos('FK_', UpperCase(e.Message)) <> 0) then
  begin
    Application.MessageBox(pchar('Erro de violação de chave estrangeira.' + #13 + 'Mensagem: ' + E.Message), 'Erro', MB_OK + MB_ICONERROR);
    registraErro('Violação de chave estrangeira: Componente: ' + DataSet.Name + ' Erro: ' + e.Message);
    Abort;
  end
  else if (Pos('PK_', UpperCase(e.Message)) <> 0) then
  begin
    Application.MessageBox(pchar('Erro de violação de chave primaria.' + #13 + 'Mensagem: ' + E.Message), 'Erro', MB_OK + MB_ICONERROR);
    registraErro('Violação de chave primaria: Componente: ' + DataSet.Name + ' Erro: ' + e.Message);
    Abort;
  end
  else if (Pos('LOCK CONFLICT', UpperCase(e.Message)) <> 0) then
  begin
    Application.MessageBox(pchar('Erro de Conflito.' + #13 +
      'O registro esta sendo alterado por outro neste momento.' + #13 + 'Mensagem: ' + E.Message), 'Erro', MB_OK + MB_ICONERROR);
    registraErro('Conflito DeadLock: Componente ' + DataSet.Name + ' Erro: ' + e.Message);
    Abort;
  end
  else if (Pos('RECORD NOT FOUND OR CHANGED BY ANOTHER USER', UpperCase(e.Message)) <> 0) then
  begin
    Application.MessageBox(pchar('Erro ao salvar dados.' + #13 +
    	'O registro foi modificado, favor consultar novamente antes de continuar.' + #13 + 'Mensagem: ' + E.Message), 'Erro', MB_OK + MB_ICONERROR);
    registraErro('Conflito Record not found or changed by another user: Componente: ' + DataSet.Name + ' Erro: ' + e.Message);
    Abort;
  end
  else
  begin
    Application.MessageBox(pchar('Erro ao salvar dados.' + #13 + 'Mensagem: ' + E.Message), 'Erro', MB_OK + MB_ICONERROR);
    registraErro('Erro não detectado: Componente: ' + DataSet.Name + ' Erro: ' + e.Message);
    Abort;
  end;
end;

procedure TDataSet_OOP.configuraCamposTelefone(pOperacao: TOperacaoMaskFone);
var
  I, vCountFone: Integer;
  vMask: string;
  vValor: string;
begin
  if omfDefiniInicio in pOperacao then
  begin
    if fPossuiTelefone = '' then
    begin
      vCountFone := 0;
      fPossuiTelefone := 'N';
      fCampoUF := '';
      SetLength(fCamposTelefone, DataSet.Fields.Count);
      for I := 0 to DataSet.Fields.Count - 1 do
      begin
        if (vDadosIni.strEstaContidoEm(DataSet.Fields[i].EditMask, [
          '(99) 9999-9999;0;_', '(99) 99999-9999;0;_', '(99)9999-9999;0;_', '(99)99999-9999;0;_', '(99)9999-99999;0;_', '(99) 9999-99999;0;_',
          '(00) 0000-0000;0;_', '(00) 00000-0000;0;_', '(00)0000-0000;0;_', '(00)00000-0000;0;_', '(00)0000-00000;0;_', '(00) 0000-00000;0;_'])) then
        begin
          fCamposTelefone[vCountFone] := DataSet.Fields[i].FieldName;
          vCountFone := vCountFone + 1;
          fPossuiTelefone := 'S';
        end;
        if DataSet.Fields[i].FieldName = 'CODIGO_UF' then
          fCampoUF := 'CODIGO_UF'
        else if DataSet.Fields[i].FieldName = 'UF_TR' then
          fCampoUF := 'UF_TR'
        else if DataSet.Fields[i].FieldName = 'UF_EMP' then
          fCampoUF := 'UF_EMP'
        else if DataSet.Fields[i].FieldName = 'ESTADO' then
          fCampoUF := 'ESTADO';
      end;
      if fCampoUF <> '' then
        dataSet.FieldByName(fCampoUF).OnValidate := datasetMaskFoneUFValidate;
    end;
    SetLength(fCamposTelefone, vCountFone);
    if fPossuiTelefone = 'S' then
    begin
      dataSet.BeforeInsert := datasetMaskFoneBeforeInsertEdit;
      dataSet.BeforeEdit := datasetMaskFoneBeforeInsertEdit;
      dataSet.BeforePost := datasetMaskFoneBeforeCancelPost;
      dataSet.BeforeCancel := datasetMaskFoneBeforeCancelPost;
      dataSet.AfterInsert := datasetMaskFoneAfterEditInsert;
      dataSet.AfterEdit := datasetMaskFoneAfterEditInsert;
    end;
  end;

  if omfGetText in pOperacao then
    if fPossuiTelefone = 'S' then
      for I := 0 to Length(fCamposTelefone) - 1 do
        dataSet.FieldByName(fCamposTelefone[i]).OnGetText := campoFoneMaskGetText;

  if omfEditMask in pOperacao then
    if fPossuiTelefone = 'S' then
    begin
      if Trim(fCampoUF) <> '' then
        vValor := dataSet.FieldByName(fCampoUF).AsString
      else
        vValor := vDadosIni.vEmp.vTelefone;
      vMask := Trim(vDadosIni.buscarMascaraFone(fCampoUF, vValor));

      for I := 0 to Length(fCamposTelefone) - 1 do
      begin
        dataSet.FieldByName(fCamposTelefone[i]).OnGetText := nil;
        if (vMask <> '') and (dataSet.FieldByName(fCamposTelefone[i]).EditMask <> vMask) then
          dataSet.FieldByName(fCamposTelefone[i]).EditMask := vMask;
      end;
    end;
end;

destructor TDataSet_OOP.Destroy;
begin
  FFieldsConfig.Free;

  FreeAndNil(TabelaCampoCaseSentitive);

  if Assigned(Flist_fdata) then
  begin
    Flist_fdata.Clear;
    FreeAndNil(Flist_fdata);
  end;  

  if dataset <> nil then
    if dataset.Active then
      DataSet.close;

  if Assigned(Ffb_q) then
  begin
    if Ffb_q.Active then
      Ffb_q.Close;

    FreeAndNil(Ffb_q);
  end;

  if Assigned(Ffb_t) then
  begin
    if Ffb_t.InTransaction then
      Ffb_t.Rollback;

    FreeAndNil(Ffb_t);
  end;

  if F_Free_Client then
    FreeDbComponents(F_Free_Client);

  if Assigned(FAuditor) then
    FreeAndNil(FAuditor);

  if Assigned(FqueryCons) then
    FreeAndNil(FqueryCons);

  if Assigned(FSQLMaker) then
    FreeAndNil(FSQLMaker);
end;

function TDataSet_OOP.ajustar_consulta_incasesensitive(Afield: TField;
  Atable, AvalorConsulta: string): string;
var
  ApalavrasChave: TStringList;
  I: Integer;
begin
  InicializarTabelaCampoCaseSentitive;
  ApalavrasChave := vDadosIni.NewStringList(True);

  {$REGION 'palavras chaves no nome do campo que serão case insensitive'}
    ApalavrasChave.Add('EMAIL');
  {$ENDREGION}

  try
    if (Afield is TMemoField) or (not (Afield is TStringField)) then
      Result := AvalorConsulta
    else if TabelaCampoCaseSentitive.IndexOf(UpperCase(Trim(Atable) + '.' + Trim(Afield.FieldName))) >= 0 then
      Result := AvalorConsulta
    else
    begin
      for I := 0 to ApalavrasChave.Count - 1 do
        if ContainsText(Afield.FieldName, ApalavrasChave[I]) then
        begin
          Result := AvalorConsulta;
          Exit;
        end;
      Result := AnsiUpperCase(AvalorConsulta);
    end;

  finally
    FreeAndNil(ApalavrasChave);
  end;
end;

function TDataSet_OOP.Apply: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  ultimoErro := '';
  Result := true;
  try
    try
      if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
      begin
        dataSet.OnReconcileError := dataSetReconcileError;
        if DataSet.ApplyUpdates(-1) > 0 then
        begin
          Result := false;
          raise Exception.Create('Erro ao salvar dados');
        end;
      end
      else
        result := false;
    except
      on E: Exception do
      begin
        if ultimoErro = '' then
          ultimoErro := e.Message;
        MessageDlg(e.Message, mtInformation, [mbOK], 0);
        registraErro(e.Message);
        Result := False;
      end;
    end;
  finally
    dataSet.OnReconcileError := nil;
  end;
end;

function TDataSet_OOP.ApplyChanges(const ACheckChanges: Boolean): Boolean;
begin
  // Retorna verdadeiro mesaamo se o dataset nao possui alteracoesa
  ultimoErro := '';

  Result := False;
  try
    try
      if (DataSet = nil) or (not DataSet.Active) then
        Exit;

      if (DataSet.ChangeCount <= 0) then
      begin
        Result  := not ACheckChanges;
        Exit;
      end;

      dataSet.OnReconcileError := dataSetReconcileError;
      if DataSet.ApplyUpdates(-1) > 0 then
        raise Exception.Create('Erro ao salvar dados');

      Result := True;

    except
      on E: Exception do
      begin
        if ultimoErro = '' then
          ultimoErro := e.Message;
        MessageDlg(e.Message, mtInformation, [mbOK], 0);
        registraErro(e.Message);
      end;
    end;

  finally
    dataSet.OnReconcileError := nil;
  end;
end;

procedure TDataSet_OOP.AssignAndCreateFieldsFrom(ADataSet: TDataSet);
var
  I: Integer;
  FieldDef: TFieldDef;
begin
  FDataSet.Close;
  FDataSet.Fields.Clear();
  FDataSet.FieldDefs.Assign(ADataSet.FieldDefs);

  for I := 0 to FDataSet.FieldDefs.Count - 1 do
  begin
    FieldDef := FDataSet.FieldDefs[i];
    FieldDef.CreateField(FDataSet);
  end;
end;

function TDataSet_OOP.AsTrueValue(Avalue: Double): Boolean;
begin
  Result := Avalue = 1;
end;

function TDataSet_OOP.Cancel: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
  configuraCamposTelefone([omfGetText]);
    if (DataSet <> nil) and (dataSet.State in [dsEdit, dsInsert]) then
      DataSet.Cancel
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP.CancelUpdates: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
      DataSet.CancelUpdates
    else
      Result := False;
  except
    Result := False;
  end;
end;

procedure TDataSet_OOP._OnGetTextMascaraFONE(Sender: TField; var Text: string;
  DisplayText: Boolean);
var
  pCampo, pMascaraFone: string;
begin
 if Sender.DataSet.FindField('CODIGO_UF') <> nil  then
   pCampo := 'CODIGO_UF'
 else if Sender.DataSet.FindField('UF_TR') <> nil  then
   pCampo := 'UF_TR'
 else if Sender.DataSet.FindField('UF_EMP') <> nil  then
   pCampo := 'UF_EMP'
 else if Sender.DataSet.FindField('ESTADO') <> nil  then
   pCampo := 'ESTADO';

 if not (Sender.dataSet.State in [dsInsert, dsEdit]) then
   Text := FormatMaskText(vDadosIni.buscarMascaraFone(pCampo, Sender.DataSet.FieldByName(pCampo).AsString),
    vDadosIni.apenasNumeros(Sender.AsString))
 else
 begin
   pMascaraFone := vDadosIni.buscarMascaraFone(pCampo, Sender.DataSet.FieldByName(pCampo).AsString);
   if (trim(pMascaraFone) <> trim(Sender.EditMask)) then
     Sender.EditMask := pMascaraFone;
   Text := FormatMaskText(pMascaraFone, vDadosIni.apenasNumeros(Sender.AsString));
 end;
end;

function TDataSet_OOP.CloneDataSetProps(sourceDts: TDataSet_OOP;
  kinds: TFieldKinds): TDataSet_OOP;
begin
  Result := CloneDataSetProps(sourceDts.dataSet, kinds);
end;

function TDataSet_OOP.CloneDataSetProps(sourceCds: TClientDataSet;
  kinds: TFieldKinds): TDataSet_OOP;
var
  iSrc, iDst, rescPkgR, I: Integer;
  FiSrc, FiDst, Field: TField;
  FieldClassType: TFieldClass;
  FieldDef: TFieldDef;
begin
  for i := 0 to sourceCds.Fields.Count - 1 do
    if (sourceCds.Fields[I].FieldKind = fkData) and
      (sourceCds.Fields[I].FieldKind in kinds) then
    begin
      FieldDef := Self.dataSet.FieldDefs.AddFieldDef;
      try
        FieldDef.Name := sourceCds.Fields[I].FieldName;
        FieldDef.DataType := sourceCds.Fields[I].DataType;
        FieldDef.Size := sourceCds.Fields[I].Size;
        FieldDef.Required := False;
      except
        FieldDef.Free;
        raise;
      end;

      Field              := FieldDef.CreateField(Self.dataSet);
      Field.DisplayLabel := sourceCds.Fields[I].DisplayLabel;

      if Field is TNumericField then
        TNumericField(Field).DisplayFormat := TNumericField(sourceCds.Fields[I]).DisplayFormat;
      if Field is TNumericField then
        TFloatField(Field).currency := TFloatField(sourceCds.Fields[I]).currency;
      if Field is TStringField then
        TStringField(Field).EditMask := TStringField(sourceCds.Fields[I]).EditMask;

    end;

  kinds := kinds - [ fkData ] ;

  for i := 0 to sourceCds.Fields.Count - 1 do
    if sourceCds.Fields[I].FieldKind in kinds then
    begin
      FieldClassType := DefaultFieldClasses[sourceCds.Fields[I].DataType];
      if FieldClassType = nil then
        raise Exception.Create('TDataSet_OOP.CloneDataSetProps > Tipo não definido' + sourceCds.Fields[I].FieldName);

      Field              := FieldClassType.Create(Self.dataSet);
      Field.FieldName    := sourceCds.Fields[I].FieldName;
      Field.FieldKind    := sourceCds.Fields[I].FieldKind;
      Field.Size         := sourceCds.Fields[I].Size;
      Field.DisplayLabel := sourceCds.Fields[I].DisplayLabel;
      Field.Name         := '';

      if Field is TNumericField then
        TNumericField(Field).DisplayFormat := TNumericField(sourceCds.Fields[I]).DisplayFormat;
      if Field is TNumericField then
        TFloatField(Field).currency := TFloatField(sourceCds.Fields[I]).currency;
      if Field is TStringField then
        TStringField(Field).EditMask := TStringField(sourceCds.Fields[I]).EditMask;

      Field.DataSet      := Self.dataSet;
    end;
    
  FDontChangeDisplayFields := True;
end;

function TDataSet_OOP.Close: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Close
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP.Delete: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := False;
  try
    if (DataSet <> nil) and (DataSet.Active) then
    begin
      if (DataSet.RecordCount > 0) then
      begin
  			if not permiteCadastro(retornaTabela(dataSet), dataSet) then
    			Exit;
        DataSet.Delete;
        Result := True;
      end;
    end;
  except
    on E: Exception do
    begin
      MessageDlg('E0002 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0002 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDataSet_OOP.Edit: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;

  try
    if (DataSet <> nil) and (DataSet.Active) and (DataSet.State = dsBrowse)
      {//and (not DataSet.IsEmpty)}then
    begin
      DataSet.Edit;
  		if not permiteCadastro(retornaTabela(dataSet), dataSet) then
      begin
      	Result := False;
        Exit;
      end;      
    end
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP.AcceptChanges: Boolean;
begin
  Result := False;
  if (DataSet <> nil) and (DataSet.Active) then Result := DataSet.State in [dsEdit, dsInsert];
end;

function TDataSet_OOP.emTransacao: boolean;
begin
  Result := transacao.InTransaction;
end;

function TDataSet_OOP.Insert: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) and (dataSet.State = dsBrowse) then
    begin
      DataSet.Insert;
  		if not permiteCadastro(retornaTabela(dataSet), dataSet) then
      begin
      	Result := False;
        Exit;
      end;
    end
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP.IsEmpty: Boolean;
begin
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      Result := DataSet.IsEmpty
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP.Next: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Next
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP.Open: Boolean;
var
  I: Integer;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if fPossuiTelefone = '' then
      configuraCamposTelefone([omfDefiniInicio, omfGetText]);
    if (DataSet <> nil) and (not DataSet.Active) then
    begin
      {$REGION 'log de registro'}
      if not FlogStore.started then
      begin
        FlogStore.textAux := '>' + dataSet.Name;
        if dataSet.Params.Count > 0 then
          for I := 0 to Pred(dataset.Params.Count) do
            FlogStore.textAux := FlogStore.textAux + IfThen(FlogStore.textAux <> '', ' | ') + '@' + dataset.Params.Items[I].Name + '@=' + dataset.Params.Items[I].Text;
        logs(dataSet.CommandText + sLineBreak + FlogStore.textAux, Self.ClassName + '.Open');
      end;
      {$ENDREGION}

      DataSet.Open;

      {$REGION 'log de registro'}
      if not FlogStore.started then
        logs_elapsed_time();
      {$ENDREGION}
    end
    else
      Result := False;
  except
    on E: Exception do
    begin
      Result := False;
      registraErro('E0003' + e.Message);
      {
      if (vDadosIni.vSistema <> 'Fiscal') and
        (pos('Unable to complete network request to host', e.Message) > 0) then
      }
      if (vDadosIni.vSistema <> 'Fiscal') and
         ((Pos('Dataset open', e.Message) > 0) or (Pos('Unable to complete network', e.Message) > 0) or (Pos('shutdown', e.Message) > 0)) then
      begin
        if not reconectaNoServidor(e) then
        try
          dataSet.Open;
          Result := true;
        except
          raise exception.create('Rede inacessivel');
        end;
      end
      else if (vDadosIni.vSistema = 'Fiscal') and
        (pos('Unable to complete network request to host', e.Message) > 0) then
      begin
        if reconectaEmBaseLocal(e) then
        begin
          try
            dataSet.Open;
            Result := true;
          except
            on e: exception do
            begin
              Result := False;
              registraErro('E0003' + e.Message);
              if (vDadosIni.vSistema = 'Fiscal') and
                (pos('Unable to complete network request to host', e.Message) > 0) then
                if not reconectaEmBaseLocal(e) then
                  exit;

            end;
          end;
        end;
      end
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

function TDataSet_OOP.ParamValue(param, value: string): TDataSet_OOP;
begin
  Result := Self;
  dataSet.Params.ParamByName(param).AsString := value;
end;

function TDataSet_OOP.ParamValue(param: string; value: Integer): TDataSet_OOP;
begin
  Result := Self;
  dataSet.Params.ParamByName(param).AsInteger := value;
end;

function TDataSet_OOP.ParamValue(param: string; value: TDateTime): TDataSet_OOP;
begin
  Result := Self;
  dataSet.Params.ParamByName(param).AsDateTime := value;
end;

function TDataSet_OOP.permiteCadastro(pNomeTabela: string;
  pState: TClientDataSet): boolean;
var
  vAcao: string;
  buscas2: TIBQuery;
begin
	try
    Result := True;

    buscas2 := TIBQuery(dtmAtivo.IbBuscas);

    if ((StrToInt(vDadosIni.codEmpresa) = vDadosIni.vCodEmpresaFisica) or (vDadosIni.vCodEmpresaFisica = 0))then
    	Exit;
    if Trim(pNomeTabela) = '' then
    	Exit;

    buscas2.Close;
  	 buscas2.SQL.Text := 'select cod_empresa from EMPRESA_FISICA ' +
  		' where cod_empresa = ' + vDadosIni.codEmpresa;
  	 buscas2.Open;

    if not buscas2.IsEmpty then
	    exit;

    buscas2.Close;
    case pState.State of
      dsBrowse:
      	begin
      		buscas2.SQL.Text := 'select cod_emp_acesso from cadastros_emp where cod_emp_acesso = ' + vDadosIni.codEmpresa +
    			' and cadastro = ' + QuotedStr(pNomeTabela) + ' and ((nivel_exclusao = 0) or (nivel_exclusao <= ' + IntToStr(vDadosIni.vNivel)+ '))';
					vAcao := 'DELETAR';
      	end;
      dsEdit:
      	begin
      		buscas2.SQL.Text := 'select cod_emp_acesso from cadastros_emp where cod_emp_acesso = ' + vDadosIni.codEmpresa +
    			' and cadastro = ' + QuotedStr(pNomeTabela) + ' and ((nivel_alteracao = 0) or (nivel_alteracao <= ' + IntToStr(vDadosIni.vNivel)+ '))';
					vAcao := 'EDITAR';
      	end;
      dsInsert:
      	begin
      		buscas2.SQL.Text := 'select cod_emp_acesso from cadastros_emp where cod_emp_acesso = ' + vDadosIni.codEmpresa +
    			' and cadastro = ' + QuotedStr(pNomeTabela) + ' and ((nivel_inclusao = 0) or (nivel_inclusao <= ' + IntToStr(vDadosIni.vNivel)+ '))';
					vAcao := 'INSERIR';          
      	end;
    end;
    buscas2.Open;

    if buscas2.IsEmpty then
    begin
      Result := False;
      if (dataSet.State in [dsInsert, dsEdit]) then
      	dataSet.Cancel;
      Application.MessageBox(pchar('Usuário não tem acesso a efetuar esta funcionalidade porque a empresa logada não é a mesma da empresa física configurada internamente' + #13 +
        'Funcionalidade: ' + pNomeTabela + ' Acão: ' + vAcao + #13 +
        'Favor verificar com o administrador do sistema'), 'Atenção', 0 + 64);
      Exit;
    end;
    
  except on E: Exception do
    begin
      Result := False;
      MessageDlg('E0004 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0004 ' + e.Message);
    end;
  end;
end;

function TDataSet_OOP.Post: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  try
    Result := True;

    configuraCamposTelefone([omfGetText]);
    if (DataSet <> nil) and (DataSet.State in [dsInsert, dsEdit]) then
      DataSet.Post
    else
      result := false;
  except
    on E: Exception do
    begin
      MessageDlg('E0004 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0004 ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDataSet_OOP.prepare_loop(Afilter: string;
  Aoptions: TOptions_loop): TDataSet_OOP;
begin
  Result := Self;
  FprepareOptions := Aoptions;

  if ol_storeRecno in FprepareOptions then
    storeRecNo;

  if ol_storeFilter in FprepareOptions then
    storeFilter;

  if ol_disableControls in FprepareOptions then
    dataSet.DisableControls;

  if ol_storeAfterScroll in FprepareOptions then
  begin
    if Assigned(FDataSet.AfterScroll) then
      FrescueDataSetAfterScroll := FDataSet.AfterScroll
    else
      FrescueDataSetAfterScroll := nil;
    FDataSet.AfterScroll := nil;
  end;

  if Trim(Afilter) <> '' then
    filterStr(Afilter);

  if ol_go_First in FprepareOptions then
    dataSet.First;
end;

function TDataSet_OOP.prepare_loop_fmt(Afilter: string;
  const ArgsFilter: array of const; Aoptions: TOptions_loop): TDataSet_OOP;
begin
  Result := prepare_loop(Format(Afilter, ArgsFilter), Aoptions);
end;

function TDataSet_OOP.prepare_loop(Aoptions: TOptions_loop): TDataSet_OOP;
begin
  Result := prepare_loop('', Aoptions);
end;

function TDataSet_OOP.prepare_loop_done: TDataSet_OOP;
begin
  Result := Self;

  if ol_filterClear_done in FprepareOptions then
    filterClear
  else if ol_storeFilter in FprepareOptions then
    restoreFilter;

  if ol_storeRecno in FprepareOptions then
    restoreRecNo;

  if ol_disableControls in FprepareOptions then
    dataSet.EnableControls;

  if ol_storeAfterScroll in FprepareOptions then
    if Assigned(FrescueDataSetAfterScroll) then
      FDataSet.AfterScroll := FrescueDataSetAfterScroll;
end;

function TDataSet_OOP.Prior: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Prior
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP.Refresh: Boolean;
begin
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Refresh
    else
      Result := False;
  except
    Result := False;
  end;
end;

procedure TDataSet_OOP.registraErro(vMenserro: string);
var
  Arq: TextFile;
  NomeArq: string;
  auxstr: string;
begin
  //jp  if vDadosIniF.vGravaErros = 'S' then
  begin
    Nomearq := ExtractFilePath(Application.Exename) + 'erros.log';
    AssignFile(Arq, NomeArq);
    if not FileExists(NomeArq) then
      Rewrite(arq)
    else
      append(arq);
    auxstr := 'ERRO: ' + vmenserro + ' Dia: ' + datetostr(date) +
      ' Hora: ' + timetostr(time) + ' ' + vDadosIni.vSistema;
    WriteLn(arq, auxstr);
    closeFile(arq);
  end;
end;

procedure TDataSet_OOP.registraErro(vMenserro: string;
  const Args: array of const);
begin
  registraErro(Format(vMenserro, Args));
end;

procedure TDataSet_OOP.restoreFilter;
begin
  dataSet.Filter := Ffilter;
  dataSet.Filtered := Ffiltered;
end;

procedure TDataSet_OOP.restoreRecNo;
begin
  if (Frecno > 0) and (Frecno <= dataSet.RecordCount) then
    dataSet.RecNo := Frecno;
end;

function TDataSet_OOP.Last: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.Last
    else
      Result := False;
  except
    Result := False;
  end;
end;

procedure TDataSet_OOP.logs(Atext, Afilename: string; Asingleline: Boolean;
  AtimeStart: TDateTime);
var
  Afile: TextFile;
  Adir, Alogname, Atimestr: string;
begin
  if IndexText(vDadosIni.loggeral, ['S', 'D']) < 0 then
    Exit;

  FlogStore.filename     := Afilename;

  if FlogStore.tStartSet > 0 then
  begin
    FlogStore.tStarted := FlogStore.tStartSet;
    FlogStore.tStartSet       := 0;
  end
  else
    FlogStore.tStarted := Now;

  try
    Atimestr := '';
    if AtimeStart > 0 then
      if (Now - AtimeStart) >= 1  then
      begin
        Atimestr := IntToStr(Trunc(Now - AtimeStart));
        AtimeStart := (Now - AtimeStart) - Trunc(Now - AtimeStart);
        Atimestr := Atimestr + ' dia(s) ' + FormatDateTime('hh:mm:ss.zzz', AtimeStart);
      end
      else
        Atimestr := FormatDateTime('hh:mm:ss.zzz', Now - AtimeStart);

    Alogname := ExtractFileName(Afilename);
    if vDadosIni.loggeral = 'S' then //Simplificado, Unico arquivo, com o nome da classe
      if Pos('.', Afilename) > 0 then
        System.Delete(Afilename, Pos('.', Afilename), Length(Afilename));

    Adir := ExtractFilePath(Application.ExeName) + 'log\' +
            FormatDateTime('YYYY-MM-DD', Date) + '\';

    ForceDirectories(ExtractFilePath(Adir));

    Afilename := Adir + '\' + Afilename + '.log';

    AssignFile(Afile, Afilename);
    if FileExists(Afilename) then
      Append(Afile)
    else
      Rewrite(Afile);
    if not Asingleline then
    begin
      if Atimestr <> '' then
        Writeln(Afile, Format('/*[%s] {%s} (%s)*/', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atimestr]))
      else
        Writeln(Afile, Format('/*[%s] {%s}*/', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname]));
      Writeln(Afile, Atext);
    end
    else if Atimestr <> '' then
      Writeln(Afile, Format('/*[%s] {%s} (%s)*/ %s', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atimestr, Atext]))
    else
      Writeln(Afile, Format('/*[%s] {%s}*/ %s', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atext]));
    CloseFile(Afile);

  except on E: Exception do
    begin
      registraErro('TDataSet_OOP.logs ' + E.Message);
    end;
  end;
end;

procedure TDataSet_OOP.logs_elapsed_time(Atext: string);
begin
  logs_sl(Atext, FlogStore.filename, FlogStore.tStarted);
end;

procedure TDataSet_OOP.logs_sl(Atext, Afilename: string; AtimeStart: TDateTime);
begin
  logs(Atext, Afilename, True, AtimeStart);
end;

function TDataSet_OOP.montaSelect(sqlComandos: string;
  const Args: array of const; AdataSet: TClientDataSet): boolean;
begin
  if not Assigned(AdataSet) then
    AdataSet := TClientDataSet(dataSet);
  try
    AdataSet.Close;
    AdataSet.CommandText := Format(sqlComandos, Args);
    logs(AdataSet.CommandText + sLineBreak + '>' + AdataSet.Name, Self.ClassName + '.montaSelect');
    AdataSet.Open;
    logs_elapsed_time();
    result := true;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('E0014 Erro ao executar comandos sql.' + #13 + 'Comandos: ' + sqlComandos + #13 +
        'Erro: ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0014 ' + sqlComandos + ' ' + e.Message);
    end;
  end;
end;

function TDataSet_OOP.montaSelect(sqlComandos: string; dataIni, dataFim: TDate;
  const Args: array of const; AdataSet: TClientDataSet): boolean;
begin
  if not Assigned(AdataSet) then
    AdataSet := TClientDataSet(dataSet);
  try
    AdataSet.Close;
    AdataSet.CommandText := Format(sqlComandos, Args);
    AdataSet.Params[0].AsDate := dataIni;
    AdataSet.Params[1].AsDate := dataFim;
    FlogStore.textAux := '>' + AdataSet.Name +
                         '@' + AdataSet.Params[0].Name + '@=' + AdataSet.Params[0].Text +
                         '@' + AdataSet.Params[1].Name + '@=' + AdataSet.Params[1].Text;
    logs(AdataSet.CommandText + sLineBreak + FlogStore.textAux, Self.ClassName + '.montaSelect');                         
    AdataSet.Open;
    logs_elapsed_time();
    result := true;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('E0014 Erro ao executar comandos sql.' + #13 + 'Comandos: ' + sqlComandos + #13 +
        'Erro: ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0014 ' + sqlComandos + ' ' + e.Message);
    end;
  end;
end;

function TDataSet_OOP.montaSelect(sqlComandos: string; dataIni,
  dataFim: TDate): boolean;
begin
  try
    Close;
    dataSet.CommandText := sqlComandos;
    dataSet.Params[0].AsDate := dataIni;
    dataSet.Params[1].AsDate := dataFim;
    FlogStore.started := True;
    try
      FlogStore.textAux := '>' + dataSet.Name +
                           '@' + dataSet.Params[0].Name + '@=' + dataSet.Params[0].Text +
                           '@' + dataSet.Params[1].Name + '@=' + dataSet.Params[1].Text;
      logs(dataSet.CommandText + sLineBreak + FlogStore.textAux, Self.ClassName + '.montaSelect');
      Open;
      logs_elapsed_time();
      result := true;
    finally
      FlogStore.started := False;
    end;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('E0014 Erro ao executar comandos sql.' + #13 + 'Comandos: ' + sqlComandos + #13 +
        'Erro: ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0014 ' + sqlComandos + ' ' + e.Message);
    end;
  end;
end;

function TDataSet_OOP.montaSelect(sqlComandos: string): boolean;
begin
  try
    Close;
    dataSet.CommandText := sqlComandos;
    FlogStore.started := True;
    try
      logs(dataSet.CommandText + sLineBreak + dataSet.Name, Self.ClassName + '.montaSelect');
      result := Open;
      logs_elapsed_time();
    finally
      FlogStore.started := False;
    end;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('E0013 Erro ao executar comandos sql.' + #13 + 'Comandos: ' + sqlComandos + #13 +
        'Erro: ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0013 ' + sqlComandos + ' ' + e.Message);
    end;
  end;
end;

procedure TDataSet_OOP.FindNearest(const KeyValues: array of const);
begin
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.FindNearest(KeyValues);
  except
  end;
end;

function TDataSet_OOP.fint(Afield: string): Integer;
begin
  Result := dataSet.FieldByName(Afield).AsInteger;
end;

function TDataSet_OOP.First: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      DataSet.First
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TDataSet_OOP.flist(Afield: string; DupIgnore, Prepare: Boolean): TStrings;
begin
  Result := flist(Afield, sLineBreak, DupIgnore, Prepare);
  {
  Result := NewStringList(DupIgnore);
  if Prepare then
    prepare_loop();
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      if not fempty(Afield) then
        Result.Add(fstr(Afield));
      dataSet.Next;
    end;
  finally
    if Prepare then
      prepare_loop_done();
  end;
  }
end;

function TDataSet_OOP.flist(Afield, aLineBreak: string; DupIgnore,
  Prepare: Boolean): TStrings;
begin
  Result := NewStringList(DupIgnore, '', aLineBreak);
  if Prepare then
    prepare_loop();
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      if not fempty(Afield) then
        Result.Add(fstr(Afield));
      dataSet.Next;
    end;
  finally
    if Prepare then
      prepare_loop_done();
  end;
end;

function TDataSet_OOP.fmatchText(Afield: string;
  const AValues: array of string; Atrim: Boolean): Boolean;
begin
  Result := MatchText(fstr(Afield, Atrim), AValues);
end;

function TDataSet_OOP.fnull(Afield: string): Boolean;
begin
  Result := dataSet.FieldByName(Afield).IsNull;
end;

function TDataSet_OOP.FreeDbComponents(AdataSet_to: Boolean): Boolean;
begin
  try
    if F_Free_Transaction and Assigned(FTransacao) then
      FreeAndNil(FTransacao);

    if Assigned(F_dataSourceOOP) then
    FreeAndNil(F_dataSourceOOP);

    if Assigned(F_dataSetProvideOOP) then
    FreeAndNil(F_dataSetProvideOOP);

    if Assigned(F_queryOOP) then
    FreeAndNil(F_queryOOP);

    if Assigned(FBuscas) then
    FreeAndNil(FBuscas);

    if AdataSet_to and Assigned(FDataSet) then
      if Trim(uniqueComponentName) <> '' then
        vDadosIni.dbComponents.dbClients.HandleFreeClient(uniqueComponentName)
      else
        FreeAndNil(FDataSet);

    Result := True;
  except
    on e: exception do
    begin
      Result := False;
      raise Exception.Create('FreeeDbComponents: ' + e.Message);
    end;
  end;
end;

function TDataSet_OOP.Bof: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      Result := DataSet.Bof
    else
      Result := False;
  except
    Result := False;
  end;
end;

procedure TDataSet_OOP.campoFoneMaskGetText(Sender: TField; var Text: string; DisplayText: Boolean);
var
  vMask, vValor: string;
begin
  if not (Sender.DataSet.State in [dsInsert, dsEdit]) then
  begin
    if Trim(Sender.AsString) = '' then
    begin
      Text := '';
      Exit;
    end;
    
    if Trim(fCampoUF) <> '' then
      vValor := dataSet.FieldByName(fCampoUF).AsString
    else
      vValor := Sender.AsString;
    vMask := Trim(vDadosIni.buscarMascaraFone(fCampoUF, vValor));
    Text := FormatMaskText(vDadosIni.retornoPorCondicao(vMask <> '', vMask, Sender.EditMask), Sender.AsString);
  end;
end;

function TDataSet_OOP.Eof: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := True;
  try
    if (DataSet <> nil) and (DataSet.Active) then
      Result := DataSet.Eof
    else
      Result := False;
  except
    Result := False;
  end;
end;

procedure TDataSet_OOP.raiseExceptionCreate(eMessage, pNomeCampo: string);
begin
  vNomeCampoErro := pNomeCampo;
  vMensagemErro := eMessage;
  raise exception.create(eMessage);
end;

procedure TDataSet_OOP.raiseExceptionCreate(eMessage: string;
  const Args: array of const; pNomeCampo: string);
begin
  vNomeCampoErro := pNomeCampo;
  vMensagemErro := Format(eMessage, Args);
  raise exception.create(vMensagemErro);
end;

function TDataSet_OOP.reconectaEmBaseLocal(E: Exception): boolean;
begin
  Result := true;
  if (vDadosIni.vSistema = 'Fiscal') and
    (pos('Unable to complete network request to host', e.Message) > 0) then
  begin
    Application.MessageBox(pchar('Rede inacessivel.' + #13 +
      'Sistema será redirecionado para uso local'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    vDadosIni.bancoConectado := 'local';
    if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHwF, True) then
    begin
      Result := False;
      Application.MessageBox(pchar('Foi impossível conectar a base local. Contacte o suporte'),
        'Atenção', MB_ICONEXCLAMATION + MB_OK);
      abort;
      Application.Terminate;
      Abort;
      close;
      Exit;
    end;
  end;
end;

function TDataSet_OOP.reconectaNoServidor(E: Exception): boolean;
var
  i: integer;
begin
  i := 1;
  Result := true;
  if (vDadosIni.vSistema <> 'Fiscal')
  	and ((Pos('Dataset open', e.Message) > 0)
    	or (Pos('Unable to complete network', e.Message) > 0)
      or (Pos('shutdown', e.Message) > 0)) then
  begin
    while true do
    begin
      if Application.MessageBox(pchar('Rede inacessivel. Tentativa ' + IntToStr(i) + #13 +
        'Deseja tentar reconectar ao servidor?'), 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = IDNO then
      begin
        abort;
        Application.Terminate;
        Abort;
        close;
        Exit;
      end;
      if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, True) then
      begin
        Result := False;
        Application.MessageBox(pchar('Foi impossível conectar ao servidor. Se o problema persistir contacte o suporte'),
          'Atenção', MB_ICONEXCLAMATION + MB_OK);
      end
      else
      begin
        SqlOpen('select RDB$SET_CONTEXT(''USER_SESSION'', ''COD_EMPRESA'', ''%s'') from RDB$DATABASE', [Trim(vDadosIni.codEmpresa)]);
        SqlOpen('select RDB$SET_CONTEXT(''USER_SESSION'', ''USERNAME'', ''%s'') from RDB$DATABASE', [Trim(Copy(vDadosIni.vNomeUsuario, 1, 32))]).Close;
        Break;
      end;
      inc(i);
    end;
  end;
end;

function TDataSet_OOP.recuperarDadosDigitados: boolean;
var
  vdtSetTp: TClientDataSet;
  I: Integer;
begin
  try
    if Application.MessageBox(pchar('Erro ao tentar salvar dados. Deseja que o sistema tente recuperar os dados?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      begin
        Result := False;
        Exit;
      end;
    try
      vdtSetTp := TClientDataSet.Create(Application);

      vdtSetTp.FieldDefs.Clear;
      for I := 0 to dataSet.FieldDefs.Count - 1 do
        vdtSetTp.FieldDefs.Add(
          dataSet.FieldDefs[i].Name,
          dataSet.FieldDefs[i].DataType,
          dataSet.FieldDefs[i].Size,false);

      try
        vdtSetTp.CreateDataSet;
      except
      end;
      vdtSetTp.EmptyDataSet;

      vdtSetTp.Insert;
      for I := 0 to dataSet.Fields.Count - 1 do
        if dataSet.Fields[i].FieldKind = fkData then
          vdtSetTp.FieldByName(dataSet.Fields[i].FieldName).Value := dataSet.FieldByName(dataSet.Fields[i].FieldName).Value;
      vdtSetTp.Post;

      dataSet.CancelUpdates;
      RollBackTransacao;

      dataSet.Insert;

      for I := 0 to dataSet.Fields.Count - 1 do
        if dataSet.Fields[i].FieldKind = fkData then
          dataSet.FieldByName(dataSet.Fields[i].FieldName).Value :=
            vdtSetTp.FieldByName(dataSet.Fields[i].FieldName).Value;

      Result := True;

      vdtSetTp.EmptyDataSet;

    finally
      vdtSetTp.Destroy;
    end;

  except
    on e: exception do
    begin
      Result := False;
      dataSet.CancelUpdates;
      Application.MessageBox(pchar('Não foi possivel recuperar os dados. Os dados terão de ser digitados novamente'+#13+
        'Erro: '+e.Message),
        'Atenção', 0+64);
      registraErro('function recuperarDadosDigitados Erro: '+e.Message);
    end;
  end;
end;

function TDataSet_OOP.ExecutaComandosSql(comandosSql: string;
  pCloseQueryAfter: Boolean): boolean;
begin
  //Pesquisa gerais atraves de comandos sql.
  try
    buscas.close;
    buscas.SQL.Text := comandosSql;
    logs(comandosSql + sLineBreak + '>' + buscas.Name, Self.ClassName + '.ExecutaComandosSql');
    buscas.Open;
    logs_elapsed_time();
    if buscas.IsEmpty then
      Result := false
    else
      Result := true;
    if pCloseQueryAfter then
      buscas.close;
  except
    on E: Exception do
    begin
      result := false;
      if inibeErro <> 'S' then
        MessageDlg('E0006 ' + 'Erro ao ler executar comandos sql: ' + comandosSql +
          #13 + 'Erro: ' + e.Message, mtinformation, [mbOK], 0);
      inibeErro := 'N';
      registraErro('E0006 ' + e.Message + ' ' + comandosSql);
    end;
  end;
end;

function TDataSet_OOP.ExecutaComandosSql(comandosSql: string; dataIni,
  dataFim: TDate; pCloseQueryAfter: Boolean): boolean;
begin
  //Pesquisa gerais atraves de comandos sql.
  try
    buscas.close;
    buscas.SQL.Text := comandosSql;
    buscas.Params[0].AsDate := dataIni;
    buscas.Params[1].AsDate := dataFim;
    FlogStore.textAux := '>' + buscas.Name +
                         '@' + buscas.Params[0].Name + '@=' + buscas.Params[0].Text +
                         '@' + buscas.Params[1].Name + '@=' + buscas.Params[1].Text;
    logs(comandosSql + sLineBreak + FlogStore.textAux, Self.ClassName + '.ExecutaComandosSql');
    buscas.Open;
    logs_elapsed_time();
    if buscas.IsEmpty then
      Result := false
    else
      Result := true;
    if pCloseQueryAfter then
      buscas.close;
  except
    on E: Exception do
    begin
      result := false;
      if inibeErro <> 'S' then
        MessageDlg('E0006 ' + 'Erro ao ler executar comandos sql: ' + comandosSql, mtinformation,
          [mbOK], 0);
      inibeErro := 'N';
      registraErro('E0006 ' + e.Message + ' ' + comandosSql);
    end;
  end;
end;

function TDataSet_OOP.ExecutaComandosSqlExec(comandosSql: string): boolean;
begin
  //Pesquisa gerais atraves de comandos sql.
  try
    buscas.close;
    buscas.SQL.Text := comandosSql;
    logs(comandosSql + sLineBreak + '>' + buscas.Name, Self.ClassName + '.ExecutaComandosSqlExec');
    buscas.Prepare;
    buscas.ExecSQL;
    logs_elapsed_time();
    Result := true;
    buscas.close;
  except
    on E: Exception do
    begin
      result := false;
      if inibeErro <> 'S' then
        MessageDlg('E0006 ' + 'Erro ao ler executar comandos sql: ' + comandosSql, mtinformation,
          [mbOK], 0);
      inibeErro := 'N';
      registraErro('E0006 ' + e.Message + ' ' + comandosSql);
    end;
  end;
end;

function TDataSet_OOP.existeCFOP(CFOP: Double): boolean;
begin
  Result := ExecutaComandosSql('select * from nat_op where codigo_nop = ' + FloatToStr(CFOP));
end;

function TDataSet_OOP.fstr(Afield: string; Atrim: Boolean): string;
begin
  Result := dataSet.FieldByName(Afield).AsString;
  if Atrim then
    Result := Trim(Result);
end;

function TDataSet_OOP.fstr(Afield: string; index, count: Integer;
  atrim: Boolean): string;
begin
  Result := Copy(fstr(Afield, atrim), index, count);
end;

function TDataSet_OOP.fstrdef(Afield: string; const defValue: string;
  Atrim: Boolean): string;
begin
  Result := IfThen(fempty(Afield, Atrim), defValue, fstr(Afield, Atrim));
end;

function TDataSet_OOP.fstrin(Afield: string; Values: array of string;
  Atrim, CaseSensitive: Boolean): Boolean;
begin
  if CaseSensitive then
    Result := IndexStr(fstr(Afield, Atrim), Values) >= 0
  else
    Result := IndexText(fstr(Afield, Atrim), Values) >= 0;
end;

function TDataSet_OOP.fstrq(Afield: string; Index, Count: Integer;
  Atrim: Boolean): string;
begin
  Result := QuotedStr(Copy(fstr(Afield, Atrim), Index, Count));
end;

function TDataSet_OOP.fsum(Afield: string; Prepare: Boolean): Double;
begin
  Result := 0;
  if Prepare then
    prepare_loop();
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      Result := Result + ffloat(Afield);
      dataSet.Next;
    end;
  finally
    if Prepare then
      prepare_loop_done();
  end;
end;

function TDataSet_OOP.ftext(Afield: string; Atrim: Boolean): string;
begin
  Result := dataSet.FieldByName(Afield).Text;
  if Atrim then
    Result := Trim(Result);
end;

function TDataSet_OOP.ftext(Afield: string; index, count: Integer;
  atrim: Boolean): string;
begin
  Result := Copy(ftext(Afield, atrim), index, count);
end;

function TDataSet_OOP.fstrq(Afield: string; Atrim: Boolean): string;
begin
  Result := QuotedStr(fstr(Afield, Atrim));
end;

function TDataSet_OOP.f_date(Afield: string): TDate;
begin
  Result := DateOf(dataSet.FieldByName(Afield).AsDateTime);
end;

function TDataSet_OOP.f_datet(Afield: string): TDateTime;
begin
  Result := dataSet.FieldByName(Afield).AsDateTime;
end;

function TDataSet_OOP.f_float(Afield: string;
  const ADigit: TRoundToRange): Double;
begin
  Result := RoundTo(dataSet.FieldByName(Afield).AsFloat, ADigit);
end;

function TDataSet_OOP.f_float(Afield: string): Double;
begin
  Result := dataSet.FieldByName(Afield).AsFloat;
end;

function TDataSet_OOP.f_int(Afield: string): Integer;
begin
  Result := dataSet.FieldByName(Afield).AsInteger;
end;

function TDataSet_OOP.f_str(Afield: string; Atrim: Boolean): string;
begin
  Result := dataSet.FieldByName(Afield).AsString;
  if Atrim then
    Result := Trim(Result);  
end;

function TDataSet_OOP.fcount(Afield, value: string): Double;
begin
  Result := fdata(Afield).Count(value);
end;

function TDataSet_OOP.fdata(Afield: string): TFieldValue_OOP;
var
  I: Integer;

begin
  if not Assigned(Flist_fdata) then
    Flist_fdata := TObjectList.Create;

  for I := 0 to Flist_fdata.Count - 1 do with TFieldValue_OOP(Flist_fdata.Items[I]) do
    if FieldName = Afield then
    begin
      Result := TFieldValue_OOP(Flist_fdata.Items[I]);
      Exit;
    end;

  Result := TFieldValue_OOP.Create(dataSet.FieldByName(Afield), Self);
  Flist_fdata.Add(Result);  
end;

function TDataSet_OOP.fdate(Afield: string): TDate;
begin
  Result := DateOf(dataSet.FieldByName(Afield).AsDateTime);
end;

function TDataSet_OOP.fdate_fb(Afield: string; AquoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD', fdate(Afield));
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function TDataSet_OOP.fdif(Afield, Text: string; Atrim: Boolean): Boolean;
begin
  Result := not fequals(Afield, Text, Atrim);
end;

function TDataSet_OOP.fempty(Afield: string; Atrim: Boolean): Boolean;
begin
  Result := fstr(Afield, Atrim) = '';
end;

function TDataSet_OOP.fequals(Afield: string; Value: Integer): Boolean;
begin
  Result := fint(Afield) = Value;
end;

function TDataSet_OOP.fequals(Afield, Text: string; Atrim: Boolean): Boolean;
begin
  Result := fstr(Afield, Atrim) = IfThen(Atrim, Trim(Text), Text);
end;

function TDataSet_OOP.fdatet(Afield: string): TDateTime;
begin
  Result := dataSet.FieldByName(Afield).AsDateTime;
end;

function TDataSet_OOP.fdatet_fb(Afield: string; AquoteStr: Boolean): string;
begin
  Result := FormatDateTime('YYYY-MM-DD hh:mm:ss', fdatet(Afield));
  if AquoteStr then
    Result := QuotedStr(Result);
end;

function TDataSet_OOP.ffDisplayFormat(field, format: string): TDataSet_OOP;
begin
  Result := Self;
  TFloatField(dataSet.FieldByName(field)).DisplayFormat := format;
end;

function TDataSet_OOP.ffDisplayLabel(field, display: string): TDataSet_OOP;
begin
  Result := Self;
  dataSet.FieldByName(field).DisplayLabel := display;
end;

function TDataSet_OOP.ffield(Afield: string): TField;
begin
  Result := dataSet.FieldByName(Afield);
end;

function TDataSet_OOP.ffloat(Afield: string;
  const ADigit: TRoundToRange): Double;
begin
  Result := RoundTo(dataSet.FieldByName(Afield).AsFloat, ADigit);
end;

function TDataSet_OOP.ffloat_fb(Adouble: Double): string;
begin
  Result := StringReplace(Format('%0.14f', [Adouble]), ',', '.', []);
  if Result <> '' then
    while Result[Length(Result)] = '0' do
      System.Delete(Result, Length(Result), 1);
  if Result[Length(Result)] = '.' then
    System.Delete(Result, Length(Result), 1);
end;

function TDataSet_OOP.ffloat_fb(Afield: string): string;
begin
  Result := ffloat_fb(ffloat(Afield));
end;

function TDataSet_OOP.ffloat(Afield: string): Double;
begin
  Result := dataSet.FieldByName(Afield).AsFloat;
end;

procedure TDataSet_OOP.filterClear;
begin
  dataSet.Filtered := False;
  dataSet.Filter := '';
end;

function TDataSet_OOP.filterStr(Afilter: string; const Args: array of const): TDataSet_OOP;
begin
  Result := filterStr(Format(Afilter, Args));
end;

function TDataSet_OOP.filterStr(Afilter: string): TDataSet_OOP;
begin
  Result := Self;
  dataSet.Filter := Afilter;
  dataSet.Filtered := True;
end;

function TDataSet_OOP.Active: Boolean;
begin
  // Retorno verdadeiro caso não haja erro para baixa.
  Result := false;
  try
    if (DataSet <> nil) then
      Result := DataSet.Active
  except
    Result := False;
  end;
end;

function TDataSet_OOP.AddFieldDef(fieldName: string; fieldType: TFieldType;
  fieldKind: TFieldKind; fieldSize: Smallint): TDataSet_OOP;
var
  Field: TField;
  FieldDef: TFieldDef;
  FieldClassType: TFieldClass;
begin
  if fieldKind = fkInternalCalc then
    raise Exception.Create('fkInternalCalc now allowed'); // dá erro no metodo createdataset quando usa o FieldDefs, usa o outro metodo por segurança

  Result := Self;

  FieldDef := Self.dataSet.FieldDefs.AddFieldDef;
  try
    FieldDef.Name     := fieldName;
    FieldDef.DataType := fieldType;
    FieldDef.Size     := fieldSize;

    FieldDef.Required := False;
  except
    FieldDef.Free;
    raise;
  end;

  Field := FieldDef.CreateField(Self.dataSet);
  Field.FieldKind := fieldKind;
end;

function TDataSet_OOP.AddFieldInternalCalc(fieldName: string;
  fieldType: TFieldType; fieldSize: Smallint): TDataSet_OOP;
var
  Field: TField;
begin
  Result := Self;

  if dataSet.FindField(fieldName) <> nil then
    Exit;

  if fieldType = ftString then
    Field := TStringField.Create(FDataSet)
  else
  if fieldType = ftSmallint then
    Field := TSmallintField.Create(FDataSet)
  else
  if fieldType = ftInteger then
    Field := TIntegerField.Create(FDataSet)
  else
  if fieldType = ftFloat then
    Field := TFloatField.Create(FDataSet)
  else
  if fieldType = ftBoolean then
    Field := TBooleanField.Create(FDataSet)
  else
    raise Exception.Create('TDataSet_OOP.AddFieldInternalCalc > Tipo não definido');

  Field.FieldName := fieldName;
  Field.FieldKind := fkInternalCalc;
  Field.Size      := fieldSize;
  Field.DataSet   := FDataSet;
end;

function TDataSet_OOP.Gencodigo(Tabela: string; procedureCodigo: TIBStoredProc; codemp: string):
  integer;
begin
  while true do
  begin
    try
      procedureCodigo.Close;
      procedureCodigo.ParamByName('VCOD_EMPRESA').Text := codemp;
      procedureCodigo.ParamByName('VTABELA').Text := UpperCase(Tabela);
      procedureCodigo.ExecProc;
      Result := procedureCodigo.ParamByName('COD').Value;
      procedureCodigo.Close;
      exit;
    except
      on E: Exception do
      begin
        MessageDlg('E0005 ' + 'Erro ao obter código para: "' + Tabela +'"'+ #13 +
          'Não desligue o computador durante este processamento' + #13 +
          'Operação será repetida' + #13 +
          'Se o processo ficar repetitivo procure o Suporte' + sLineBreak +
          E.Message, mtinformation, [mbOK], 0);
        registraErro('E0005 ' + e.Message + ' ' + Tabela);
        //     Result := False;
      end;
    end;
  end;
end;

function TDataSet_OOP.Gencodigo(Tabela: string; buscas: TIBQuery; codemp: string): integer;
begin
  while true do
  begin
    try

      buscas.Close;
      buscas.SQL.Text := 'SELECT COD FROM INCREMENTA_CODIGO(:VCOD_EMPRESA, :VTABELA)';
      buscas.ParamByName('VCOD_EMPRESA').Text := codemp;
      buscas.ParamByName('VTABELA').Text := UpperCase(Tabela);
      buscas.Open;
      Result := buscas.FieldByName('COD').Value;
      buscas.Close;
      exit;
    except
      on E: Exception do
      begin
        MessageDlg('E0005 ' + 'Erro ao obter código para: "' + Tabela +'"'+ #13 +
          'Não desligue o computador durante este processamento' + #13 +
          'Operação será repetida' + #13 +
          'Se o processo ficar repetitivo procure o Suporte' + sLineBreak +
          E.Message, mtinformation, [mbOK], 0);
        registraErro('E0005 ' + e.Message + ' ' + Tabela);
        //     Result := False;
      end;
    end;
  end;
end;

function TDataSet_OOP.GetArrayInts(fieldId: string;
  preparaLoop: Boolean;
  fieldSel: string): ArrayInts;
begin
  SetLength(Result, 0);
  try
    if fieldSel = '' then // sem filtro, dataset completo
      storeRecNo
    else
    if preparaLoop then
      prepare_loop( fieldSel +  ' = ''S''')
    else
      filterStr( fieldSel +  ' = ''S''');

    while not dataSet.Eof do
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := fint(fieldId);

      dataSet.Next;
    end;
  finally
    if fieldSel = '' then // sem filtro, dataset completo
      restoreRecNo
    else
    if preparaLoop then
      prepare_loop_done()
    else
      filterClear;
  end;
end;

function TDataSet_OOP.GetArrayDistinctInts(fieldId: string; preparaLoop,
  selectAsDefaultCurrent: Boolean; fieldSel: string): ArrayInts;
var
  valores: ArrayInts;
  vEnc: Boolean;
  I, J: Integer;
begin
	valores := GetArrayInts(fieldId, preparaLoop, selectAsDefaultCurrent, fieldSel);

  SetLength(Result, 0);
  for I := Low(valores) to High(valores) do
  begin
  	vEnc := False;
    if Length(Result) <= 0 then
    begin
    	SetLength(Result, Length(Result) + 1);
    	Result[High(Result)] := valores[I];
    end
    else
    begin
      for J := Low(Result) to High(Result) do
      begin
        if valores[I] = Result[J] then
        begin
          vEnc := True;
          Break;
        end;
      end;
      if not vEnc then
      begin
        SetLength(Result, Length(Result) + 1);
        Result[High(Result)] := valores[I];
      end;
    end;
  end;
end;

function TDataSet_OOP.GetArrayInts(fieldId: string; preparaLoop,
  selectAsDefaultCurrent: Boolean; fieldSel: string): ArrayInts;
var
  defaultVal: Integer;
begin

  if dataSet.IsEmpty then
  begin
    SetLength(Result, 0);
    Exit;
  end;

  defaultVal := fint(fieldId);

  Result := GetArrayInts(fieldId, preparaLoop, fieldSel);

  if Length(Result) = 0 then
  begin
    SetLength(Result, 1);
    Result[0] := defaultVal;
  end;
end;

function TDataSet_OOP.GetAuditor: TAudit_OOP;
begin
  if not Assigned(FAuditor) then
  begin
    FAuditor := TAudit_OOP.Create;
    FAuditor.Tabela := Self.TableName;
  end;
  Result := FAuditor;
end;

function TDataSet_OOP.GetIndexFieldNames: string;
begin
  Result := DataSet.IndexFieldNames;
end;

function TDataSet_OOP.GetIni(pChave, pIdentificador,
  pValorDefault: string): string;
begin
  Result := vDadosIni.GetIni(pChave, pIdentificador, pValorDefault);
end;

function TDataSet_OOP.GetIni(pChave, pIdentificador, pValorDefault: string;
  IniText: TStrings): string;
begin
  Result := vDadosIni.GetIni(pChave, pIdentificador, pValorDefault, IniText);
end;

function TDataSet_OOP.GetQueryCons: TQuery_OOP;
begin
  if not Assigned(FqueryCons) then
    FqueryCons := QueryHelper.CreateObj(buscas);
  
  Result := FqueryCons;
end;

function TDataSet_OOP.horaFimData(Data: string): string;
begin
  if Length(Trim(Data)) <= 10 then
    Result := ' 23:59:59'
  else
    Result := '';
end;

function TDataSet_OOP.Cpf(Num: string): boolean;
var
  N1, n2, n3, n4, n5, n6, n7, n8, n9: integer;
  D1, d2: integer;
  Digitado, calculado: string;
begin
  try
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    calculado := inttostr(d1) + inttostr(d2);
    digitado := num[10] + num[11];
    if calculado = digitado then
      cpf := true
    else
      cpf := false;
  except
    cpf := false;
  end;
end;

function TDataSet_OOP.cfopValido(CFOP: Double; entradaSaida: string): boolean;
var
  cfopStr: string;
begin
  Result := false;
  cfopStr := FloatToStr(CFOP);
  if Length(cfopStr) <> 4 then
    exit;
  if entradaSaida = 'E' then
  begin
    if (copy(cfopStr, 1, 1) <> '1') and (copy(cfopStr, 1, 1) <> '2') then
      exit;
  end
  else if entradaSaida = 'S' then
  begin
    if (copy(cfopStr, 1, 1) <> '5') and (copy(cfopStr, 1, 1) <> '6') then
      exit;
  end;
  Result := true;
end;

function TDataSet_OOP.cgc(Num: string): boolean;
begin
  Result := HelperCNPJ.Valida(Num);
end;

function TDataSet_OOP.CNPJ(const AInput: string): boolean;
begin
  Result := HelperCNPJ.Valida(AInput);
end;

procedure TDataSet_OOP.checkFieldEmpty(pFieldName, pMessage: string; pComponentFocus: string; pDataSet: TDataSet; pCheckNull: Boolean);
begin
  if pCheckNull then
  begin
    if pDataSet.FieldByName(pFieldName).IsNull then
      raiseExceptionCreate(pMessage, pComponentFocus);
  end
  else
  if (pDataSet.FieldByName(pFieldName) is TIntegerField) or
    (pDataSet.FieldByName(pFieldName) is TFloatField) or
    (pDataSet.FieldByName(pFieldName) is TCurrencyField) then
  begin
    if pDataSet.FieldByName(pFieldName).AsFloat <= 0 then
      raiseExceptionCreate(pMessage, pComponentFocus);
  end
  else
  if Trim(pDataSet.FieldByName(pFieldName).AsString) = '' then
    raiseExceptionCreate(pMessage, pComponentFocus);
end;

function TDataSet_OOP.CheckUnCheckAllRows(Acheck: Boolean; AFieldName: string;
  Afilter: string): TDataSet_OOP;
var
  ArecNo: Integer;
  eventAfScroll: TDataSetNotifyEvent;
begin
  Result := Self;
  if not dataSet.Active then
    Exit;

  if dataSet.IsEmpty then
    Exit;

  ArecNo := dataSet.RecNo;

  FCheckValue := IfThen(FCheckValue = '', 'S', FCheckValue);

  eventAfScroll := dataSet.AfterScroll;
  try
    dataSet.AfterScroll := nil;
    dataSet.DisableControls;
    if Afilter <> '' then
    begin
      dataSet.Filter   := Afilter;
      dataSet.Filtered := True;
    end;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName(AFieldName).AsString := IfThen(Acheck, FCheckValue, FUncheckValue);
      dataSet.Post;
      dataSet.Next;
    end;

  finally
    if Afilter <> '' then
      filterClear;
    dataSet.RecNo := ArecNo;
    dataSet.EnableControls;
    dataSet.AfterScroll := eventAfScroll;
    if Assigned(eventAfScroll) then
      eventAfScroll(dataSet);
  end;
end;

function TDataSet_OOP.CheckUnCheckRow(Acheck: Boolean;
  AFieldName: string): TDataSet_OOP;
begin
  Result := Self;
  if dataSet.IsEmpty then
    Exit;

  FCheckValue := IfThen(FCheckValue = '', 'S', FCheckValue);

  dataSet.Edit;
  dataSet.FieldByName(AFieldName).AsString := IfThen(Acheck, FCheckValue, FUncheckValue);
  dataSet.Post;
end;

function TDataSet_OOP.CheckUnCheckRow(AFieldName: string): TDataSet_OOP;
begin
  Result := Self;
  if dataSet.IsEmpty then
    Exit;

  FCheckValue := IfThen(FCheckValue = '', 'S', FCheckValue);

  dataSet.Edit;
  dataSet.FieldByName(AFieldName).AsString := IfThen(dataSet.FieldByName(AFieldName).AsString = FCheckValue, FUncheckValue, FCheckValue);
  dataSet.Post;
end;

procedure TDataSet_OOP.checkFieldEmpty(pFieldName, pMessage: string; pComponentFocus: string; pCheckNull: Boolean);
begin
  checkFieldEmpty(pFieldName, pMessage, pComponentFocus, dataSet, pCheckNull);
end;

procedure TDataSet_OOP.MarcaProdutoParaEtiquetaQRP(GrupoProd: Integer; CodProd: string; Qtde: Integer);
var
  HandleRel: THandle;
  MarcaProdutoParaEtiquetaQRP: TmarcarProdutoParaEtiqueta;
begin
  try
    HandleRel := LoadLibrary('RelQReportHW.dll');
    if HandleRel <> 0 then
    begin
      @MarcaProdutoParaEtiquetaQRP := GetProcAddress(HandleRel, 'marcarProdutoParaEtiqueta');

      MarcaProdutoParaEtiquetaQRP(Pchar(vDadosIni.vBancoHW), GrupoProd, Pchar(CodProd), strtoint(vDadosIni.codEmpresa), Qtde);
    end
  finally
    FreeLibrary(HandleRel);
  end;    
end;

procedure TDataSet_OOP.ImprimirEtiquetasQRP(Tabela, Caption: string; Grid: TDBGrid; EtiPreGravadaProd, ImprimirQtdEst: boolean);
var
  HandleRel: THandle;
  EtiquetasQRP: TEtiquetasQuickReport;
  GridComGrade: boolean;
  buscas2, buscas3: TIBQuery;
  CodGrade: Integer;
  I: Integer;
  vSomenteSelecionado: boolean;
  vOK: Boolean;

  function inserirAtualizarCodEtiq(
  	pBuscas: TIBQuery;
    pBuscas2: TIBQuery;
    pGrupoProd: Integer;
    pCodProd: string;
    pCodGrade: Integer): boolean;
  begin
  	Result := False;

    try
	    if pCodGrade > 0 then
      begin
      	pBuscas.Close;
        pBuscas.SQL.Text := ' SELECT GRUPO_PROD, COD_PROD, COD_EMPRESA FROM COD_BARRA_ETIQ' +
        	' WHERE GRUPO_PROD = :GRUPO_PROD ' +
          ' AND COD_PROD = :COD_PROD ' +
          ' AND COD_GRADE = :COD_GRADE ' +
          ' AND COD_EMPRESA = :COD_EMPRESA ';
        pBuscas.ParamByName('GRUPO_PROD').AsInteger := pGrupoProd;
        pBuscas.ParamByName('COD_PROD').AsString := pCodProd;
        pBuscas.ParamByName('COD_GRADE').AsInteger := pCodGrade;
        pBuscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        pBuscas.Open;

        if pBuscas.IsEmpty then
        begin
          pBuscas.Close;
          pBuscas.SQL.Text := 'INSERT INTO COD_BARRA_ETIQ ' +
          	' (GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA) ' +
            ' VALUES (:GRUPO_PROD, :COD_PROD, :COD_GRADE, :COD_EMPRESA) ';
          pBuscas.ParamByName('GRUPO_PROD').AsInteger := pGrupoProd;
          pBuscas.ParamByName('COD_PROD').AsString := pCodProd;
          pBuscas.ParamByName('COD_GRADE').AsInteger := pCodGrade;
          pBuscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
          pBuscas.ExecSQL;
        end;
      end
      else
      begin
      	pBuscas2.Close;
        pBuscas2.SQL.Text := 'SELECT GRUPO_PROD, COD_PROD, COD_GRADE FROM COD_GRADE_PROD ' +
          ' WHERE GRUPO_PROD = :GRUPO_PROD ' +
          ' AND COD_PROD = :COD_PROD ' +
          ' AND COD_GRADE > 0 ' +
          ' AND COD_EMPRESA = :COD_EMPRESA ';
        pBuscas2.ParamByName('GRUPO_PROD').AsInteger := pGrupoProd;
        pBuscas2.ParamByName('COD_PROD').AsString := pCodProd;
        pBuscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        pBuscas2.Open;

        if pBuscas2.RecordCount > 0 then
        begin
          pBuscas2.First;
          while not pBuscas2.Eof do
          begin
          	pBuscas.Close;
            pBuscas.SQL.Text := ' SELECT GRUPO_PROD, COD_PROD, COD_EMPRESA FROM COD_BARRA_ETIQ' +
              ' WHERE GRUPO_PROD = :GRUPO_PROD ' +
              ' AND COD_PROD = :COD_PROD ' +
              ' AND COD_GRADE = :COD_GRADE ' +
              ' AND COD_EMPRESA = :COD_EMPRESA ';
            pBuscas.ParamByName('GRUPO_PROD').AsInteger := pGrupoProd;
            pBuscas.ParamByName('COD_PROD').AsString := pCodProd;
            pBuscas.ParamByName('COD_GRADE').AsInteger := pBuscas2.FieldByName('COD_GRADE').AsInteger;
            pBuscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
            pBuscas.Open;

            if pBuscas.IsEmpty then
            begin
              pBuscas.Close;
              pBuscas.SQL.Text := 'INSERT INTO COD_BARRA_ETIQ ' +
              	' (GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA) ' +
                ' VALUES (:GRUPO_PROD, :COD_PROD, :COD_GRADE, :COD_EMPRESA) ';
              pBuscas.ParamByName('GRUPO_PROD').AsInteger := pGrupoProd;
              pBuscas.ParamByName('COD_PROD').AsString := pCodProd;
              pBuscas.ParamByName('COD_GRADE').AsInteger := pBuscas2.FieldByName('COD_GRADE').AsInteger;
              pBuscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
              pBuscas.ExecSQL;
            end;

            pBuscas2.Next;
          end;
        end
        else
        begin
        	pBuscas.Close;
          pBuscas.SQL.Text := ' SELECT GRUPO_PROD, COD_PROD, COD_EMPRESA FROM COD_BARRA_ETIQ' +
            ' WHERE GRUPO_PROD = :GRUPO_PROD ' +
            ' AND COD_PROD = :COD_PROD ' +
            ' AND COD_GRADE = :COD_GRADE ' +
            ' AND COD_EMPRESA = :COD_EMPRESA ';
          pBuscas.ParamByName('GRUPO_PROD').AsInteger := pGrupoProd;
          pBuscas.ParamByName('COD_PROD').AsString := pCodProd;
          pBuscas.ParamByName('COD_GRADE').AsInteger := 0;
          pBuscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
          pBuscas.Open;

          if pBuscas.IsEmpty then
          begin
            pBuscas.Close;
            pBuscas.SQL.Text := 'INSERT INTO COD_BARRA_ETIQ ' +
            	' (GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA) ' +
              ' VALUES (:GRUPO_PROD, :COD_PROD, :COD_GRADE, :COD_EMPRESA) ';
            pBuscas.ParamByName('GRUPO_PROD').AsInteger := pGrupoProd;
            pBuscas.ParamByName('COD_PROD').AsString := pCodProd;
            pBuscas.ParamByName('COD_GRADE').AsInteger := 0;
            pBuscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
            pBuscas.ExecSQL;
          end;
        end
      end;


    	Result := True;
    except
    	on e: exception do
      begin
        Result := False;
        raise Exception.Create('TDataSet_OOP.inserirAtualizarCodEtiq: ' + e.Message);
      end;
    end;
  end;
begin
  if Grid.DataSource.DataSet.IsEmpty then
  begin
  	 Application.MessageBox(PChar('Nenhum item informado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
    
	GridComGrade := False;
                               
	buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas3 := TIBQuery.Create(Application);
  buscas3.Database := buscas.Database;
  buscas3.Transaction := buscas.Transaction;

  if trim(Tabela) = 'PRODUTOS' then
  begin
    for I := 0 to Grid.FieldCount - 1 do
    	if Grid.Columns[I].FieldName = 'COD_GRADE' then
      begin
      	GridComGrade := True;
        Break;
      end;
  end;

  vSomenteSelecionado := Application.MessageBox('Imprimir somente os itens selecionados?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES;

  if vSomenteSelecionado then
  begin
  	vOK := False;

    try
      Grid.DataSource.DataSet.DisableControls;
      Grid.DataSource.DataSet.First;
      while not Grid.DataSource.DataSet.Eof do
      begin
        if Grid.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
        begin
          vOK := True;
          Break;
        end;

        Grid.DataSource.DataSet.Next;
      end;
    finally
      Grid.DataSource.DataSet.First;
  		Grid.DataSource.DataSet.EnableControls;
    end;

    if not vOK then
    begin
    	Application.MessageBox(PChar('Nenhum item selecionado.'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  inherited;
  HandleRel := 0;
  try
    HandleRel := LoadLibrary('RelQReportHW.dll');
    if HandleRel <> 0 then
    begin
      @EtiquetasQRP := GetProcAddress(HandleRel, 'ChamaReport');
      if vSomenteSelecionado then
      begin
      	if trim(Tabela) = 'PRODUTOS' then
        begin
          Grid.DataSource.DataSet.First;
          while not Grid.DataSource.DataSet.Eof do
          begin
            if Grid.SelectedRows.CurrentRowSelected then
            begin
            	CodGrade := 0;
              if GridComGrade then
              	CodGrade := Grid.DataSource.DataSet.FieldByName('COD_GRADE').AsInteger;

            	if not inserirAtualizarCodEtiq(
                buscas2,
                buscas3,
                Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsInteger,
                Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
                CodGrade) then
                		exit;
            end;

            Grid.DataSource.DataSet.Next;
          end;

          if buscas2.Transaction.InTransaction then
      			buscas2.Transaction.Commit;
        end;
  
        EtiquetasQRP(Pchar(Tabela), PChar(Caption), Pchar(vDadosIni.vBancoHW), strtoint(vDadosIni.codEmpresa), Grid, true, EtiPreGravadaProd, ImprimirQtdEst);
      end
      else
      begin
      	if trim(Tabela) = 'PRODUTOS' then
        begin
          Grid.DataSource.DataSet.First;
          while not Grid.DataSource.DataSet.Eof do
          begin
          	CodGrade := 0;
            if GridComGrade then
              CodGrade := Grid.DataSource.DataSet.FieldByName('COD_GRADE').AsInteger;

            if not inserirAtualizarCodEtiq(
              buscas2,
              buscas3,
              Grid.DataSource.DataSet.FieldByName('GRUPO_PROD').AsInteger,
              Grid.DataSource.DataSet.FieldByName('COD_PROD').AsString,
              CodGrade) then
                	exit;

            Grid.DataSource.DataSet.Next;
          end;

          if buscas2.Transaction.InTransaction then
      			buscas2.Transaction.Commit;
        end;

        EtiquetasQRP(Pchar(Tabela), Pchar(Caption), Pchar(vDadosIni.vBancoHW), strtoint(vDadosIni.codEmpresa), Grid, false, EtiPreGravadaProd, ImprimirQtdEst);
      end;
    end;
  finally
    FreeLibrary(HandleRel);
  end;
end;

procedure TDataSet_OOP.InicializarTabelaCampoCaseSentitive;
begin
  if Assigned(TabelaCampoCaseSentitive) then
    Exit;

  TabelaCampoCaseSentitive := vDadosIni.NewStringList(True);

  {$REGION 'lista de tabela/campo que será também case insensitive'}
  TabelaCampoCaseSentitive.Add('CLIENTES.WEBSITE');
  {$ENDREGION}
end;

function TDataSet_OOP.IniciaTransacao: boolean;
begin
  if not emTransacao then
  begin
    try
      transacao.StartTransaction;
      result := true;
    except
      on e: exception do
      begin
        Result := False;
        MessageDlg('E0007 ' + e.Message, mtInformation, [mbOK], 0);
        registraErro('E0007 ' + e.Message);
      end;
    end;
  end;
end;

function TDataSet_OOP.InitFieldsDef(sqlSemRetornarDados: string; const Args: array of const): TDataSet_OOP;
var
  I, rescuePackageRec: Integer;
begin
  // Esse metodo serve permitir adicionar campos no dataset em runtime
  // Chamar sempre antes de para atribuir o Field apos
  // Ex: uClassesSped > TEfdConfAjuestesAuto.Create

  Result := Self;

  rescuePackageRec := dataSet.PacketRecords;
  try
    dataSet.PacketRecords := 0; // aqui vai definir os campos sem obter dados
    montaSelect(sqlSemRetornarDados, Args);

    dataSet.Close;
  finally
    dataSet.PacketRecords := rescuePackageRec;
  end;

  dataSet.FieldDefs.Update;

  for i := 0 to dataSet.FieldDefs.Count - 1 do
    dataSet.FieldDefs[i].CreateField(dataSet);
end;

function TDataSet_OOP.CommitaTransacao: Boolean;
begin
  if emTransacao then
  begin
    try
      transacao.Commit;
      result := true;
    except
      on e: exception do
      begin
        RollBackTransacao;
        Result := False;
        MessageDlg('E0008 ' + e.Message, mtInformation, [mbOK], 0);
        registraErro('E0008 ' + e.Message);
      end;
    end;
  end;
end;

procedure TDataSet_OOP.ConfigFields(const Builder: IFieldsConfigBuilder);
var
  newConfigs: FieldsConfigModel;
begin
  // bloco assegura transferencia de objetos segura, sem possibilidade de vazamento de memoria
  newConfigs := Builder.List.Clone();
  try
    FFieldsConfig.Free();

    FFieldsConfig := newConfigs;

  except on E: Exception do
    begin
      newConfigs;
      raise;
    end;
  end;
end;

function TDataSet_OOP.ConsultaCampos(tabela, valorConsulta, Campo, condicao,
  ordem: string; constante: boolean; codemp: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string; // F (Integer, Float); S String; D Data; I Indefinido
  vSqlAdicional: string;
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
  valorConsulta := Trim(valorConsulta);
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos1';
  try

    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    result := false;
    vSqlAdicional := '';
    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Maior ou Igual' then
          condicao := '>='
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Menor ou Igual' then
          condicao := '<='
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          begin
            valorConsulta := ajustar_consulta_incasesensitive(DataSet.Fields[I], tabela, valorConsulta);
            Campo := DataSet.Fields[I].FieldName;

            if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
              ordem := DataSet.Fields[I].FieldName;

            if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
            begin
            	if Trim(UpperCase(tabela)) <> 'TIPO_SERVICO' then
              	possuiCodEmpresa := true
              else
                vSqlAdicional := ' and ((cod_empresa = ' + vDadosIni.codEmpresa + ') or (coalesce(cod_empresa, 0) = 0))';
              fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            end;
            if Dataset.Fields[I].FieldName = 'ATIVO' then
              possuiAtivo := true;

            if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              tipo := 'I'
            else if (Dataset.Fields[I] is TCurrencyField) or (Dataset.Fields[I] is TFloatField) then
              tipo := 'F'
            else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
              tipo := 'S'
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              tipo := 'D'
            else
              tipo := 'I';

            condicao := IfThen( MatchText(tipo, ['F', 'I']) and MatchText(condicao, ['like', 'Começa']), '=', condicao );
            break;
          end;
        end;
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
          	if Trim(UpperCase(tabela)) <> 'TIPO_SERVICO' then
            	possuiCodEmpresa := true
            else
            	vSqlAdicional := ' and ((cod_empresa = ' + vDadosIni.codEmpresa + ') or (coalesce(cod_empresa, 0) = 0))';
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if tipo = 'I' then
        try
          strtoint(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end
        else if tipo = 'F' then
        try
          strtofloat(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end;

        DataSet.Close;

        if (tipo = 'F') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
              + condicao + ' ' + vDadosIni.trocaVirgulaPorPonto(valorConsulta);
        end
        else if (tipo = 'S') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' ' + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + fCampoCodEmpresa + ' = ' + codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ativo = 1';

        if ordem = 'Todos' then
        begin
          if DataSet.Fields[0].Required then
          	ordem := DataSet.Fields[0].FieldName
          else
          begin
          	ordem := DataSet.Fields[0].FieldName;

            for I := 0 to DataSet.Fields.Count - 1 do
            begin
            	if DataSet.Fields[I].Required then
              begin
            		ordem := DataSet.Fields[I].FieldName;
                Break;
              end;
            end;
          end;
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + vSqlAdicional +' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
          	if Trim(UpperCase(tabela)) <> 'TIPO_SERVICO' then
          		possuiCodEmpresa := true
            else
							vSqlAdicional := ' and ((cod_empresa = ' + vDadosIni.codEmpresa + ') or (coalesce(cod_empresa, 0) = 0))';
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if ordem = 'Todos' then
        begin
        	if DataSet.Fields[0].Required then
          	ordem := DataSet.Fields[0].FieldName
          else
          begin
          	ordem := DataSet.Fields[0].FieldName;

            for I := 0 to DataSet.Fields.Count - 1 do
            begin
            	if DataSet.Fields[I].Required then
              begin
            		ordem := DataSet.Fields[I].FieldName;
                Break;
              end;
            end;
          end;
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + fCampoCodEmpresa + ' = ' + codemp;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ativo = 1'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ativo = 1';
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + vSqlAdicional + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');

        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    possuiCodEmpresa := false;
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCampos(tabela, Campo, ordem, dataIni,
  dataFim: string; codemp: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao, vDataI, vDataF, formatodata: string;
  vSqlAdicional: string;
begin
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos2';
  result := false;
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    vSqlAdicional := '';
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
        Campo := DataSet.Fields[I].FieldName;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        if Trim(UpperCase(tabela)) <> 'TIPO_SERVICO' then
          possuiCodEmpresa := True
        else
          vSqlAdicional := ' and ((cod_empresa = ' + vDadosIni.codEmpresa + ') or (coalesce(cod_empresa, 0) = 0))';
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;

    if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
      formatodata := 'mm/dd/yyyy'
    else if pos('.', ShortDateFormat) <> 0 then
      formatodata := 'dd.mm.yyyy';

    vDataI := StringReplace(dataIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(dataFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    if ((vDataI <> '      ') and (vDataI <> '        ')) or
      ((vDataF <> '      ') and (vDataF <> '        ')) then
    begin
      try
        DataSet.Close;
        if (((vDataI <> '      ') and (vDataI <> '        ')) and
          ((vDataF <> '      ') and (vDataF <> '        '))) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni))) + ' and ' + tabela + '.' + Campo +
            ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim))
        else if ((vDataI <> '      ') and (vDataI <> '        ')) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni)))
        else if ((vDataF <> '      ') and (vDataF <> '        ')) then
          condicao := ' where ' + tabela + '.' + Campo + ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim));
        DataSet.CommandText := 'select * from ' + tabela + condicao;
        if (possuiCodEmpresa) and (pos('where', dataSet.CommandText) > 0) then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 1';
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + vSqlAdicional + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp + ' and ' + tabela + '.' + 'ativo = 1'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'ativo = 1'
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + vSqlAdicional + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCampos(tabela, valorConsulta, Campo, condicao, ordem,
  sqlAdicional: string; constante: boolean; codemp: string): boolean;
var
  //Para evitar possíveis erros em centenças SQL sqladicional
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string;
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
  valorConsulta := Trim(valorConsulta);
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos3';
  try
    result := false;
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
      begin
        valorConsulta := ajustar_consulta_incasesensitive(DataSet.Fields[I], tabela, valorConsulta);
        Campo := DataSet.Fields[I].FieldName;
        //        if (Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
        //          (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField) then
        //          tipo := 'F'
        if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
          tipo := 'I'
        else if (Dataset.Fields[I] is TCurrencyField) or (Dataset.Fields[I] is TFloatField) then
          tipo := 'F'
        else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
          tipo := 'S'
        else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          tipo := 'D'
        else
          tipo := 'I';
      end;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        possuiCodEmpresa := true;
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
    end;

    if ordem = 'Todos' then
    begin
      if DataSet.Fields[0].Required then
        ordem := DataSet.Fields[0].FieldName
      else
      begin
        ordem := DataSet.Fields[0].FieldName;
            
        for I := 0 to DataSet.Fields.Count - 1 do
        begin
          if DataSet.Fields[I].Required then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;
        end;
      end;
    end;

    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Maior ou Igual' then
          condicao := '>='
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Menor ou Igual' then
          condicao := '<='
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';

        condicao := IfThen( MatchText(tipo, ['F', 'I']) and MatchText(condicao, ['like', 'Começa']), '=', condicao );

        if tipo = 'I' then
        try
          strtoint(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end
        else if tipo = 'F' then
        try
          strtofloat(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end;

        DataSet.Close;
        if (tipo = 'F') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
              + condicao + ' ' + vDadosIni.trocaVirgulaPorPonto(valorConsulta);
        end
        else if (tipo = 'S') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
              + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 1';

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        //Particularidade para a buscas de produtos
        if upperCase(Tabela) = 'PRODUTOS' then
        begin
          if UpperCase(Campo) = 'NUM_FAB_PROD' then
          begin
          	if Pos('PRODUTOS.NUM_FAB_PROD', UpperCase(dataSet.CommandText)) > 0 then
              dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), 'PRODUTOS.NUM_FAB_PROD',
                'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

    				if Pos('* FROM PRODUTOS WHERE', UpperCase(dataSet.CommandText)) > 0 then
              dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), '* FROM PRODUTOS WHERE',
                'distinct(PRODUTOS.*) from PRODUTOS,COD_BARRA where COD_BARRA.cod_prod = PRODUTOS.cod_prod AND COD_BARRA.grupo_prod = PRODUTOS.grupo_prod AND PRODUTOS.cod_empresa = COD_BARRA.cod_empresa and ',
                [rfReplaceAll, rfIgnoreCase]);
          end;
        end;

        //Particularidade para a buscas de vendas
        if upperCase(Tabela) = 'PEDVENDA' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from pedvenda',
            'pedvenda.*,clientes.nome_cliente from pedvenda inner join clientes on pedvenda.cod_cliente=clientes.cod_cliente ' +
            'and pedvenda.cod_empresa=clientes.cod_empresa', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'pedvenda.nome_cliente',
            'clientes.nome_cliente', [rfReplaceAll, rfIgnoreCase]);
        end
        //Particularidades para buscas de lancamentos
        else if upperCase(Tabela) = 'LANCAMENTOS' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from lancamentos',
            'lancamentos.*, controles.nome_ctrl from lancamentos' +
            ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and' +
            ' lancamentos.codigo_emp = controles.codigo_emp', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'lancamentos.nome_ctrl',
            'controles.nome_ctrl', [rfReplaceAll, rfIgnoreCase]);
//          if campo = 'Todos' then
//            dataset.commandText:=dataset.commandText+' order by cod_lanc ';
        end;
        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where  ' + tabela + '.' + fCampoCodEmpresa + ' = '
            + codemp;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + 'ativo = 1'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'ativo = 1';

        //Particularidade para a buscas de vendas
        if upperCase(Tabela) = 'PEDVENDA' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from pedvenda',
            'pedvenda.*,clientes.nome_cliente from pedvenda inner join clientes on pedvenda.cod_cliente=clientes.cod_cliente ' +
            'and pedvenda.cod_empresa=clientes.cod_empresa', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'pedvenda.nome_cliente',
            'clientes.nome_cliente', [rfReplaceAll, rfIgnoreCase]);
        end
        //Particularidades para buscas de lancamentos
        else if upperCase(Tabela) = 'LANCAMENTOS' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from lancamentos',
            'lancamentos.*, controles.nome_ctrl from lancamentos' +
            ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and' +
            ' lancamentos.codigo_emp = controles.codigo_emp', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'lancamentos.nome_ctrl',
            'controles.nome_ctrl', [rfReplaceAll, rfIgnoreCase]);
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        dataSet.CommandText := dataSet.CommandText + ' order by ' + ordem;

        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    //    possuiCodEmpresa := false;
    FlogStore.started := False;
  end;
end;

procedure TDataSet_OOP.RollBackTransacao;
begin
  if emTransacao then
    transacao.Rollback;
end;

function TDataSet_OOP.RunSQLMaker: TDataSet_OOP;
var
  I: Integer;
begin
  Result := Self;

  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.RunSQLMaker';

  try
    if (not Assigned(FSQLMaker.FilterMk.Field['COD_EMPRESA'])) and
       (not Assigned(FSQLMaker.FilterMk.Field['CODIGO_EMP'])) then
    begin
      for I := 0 to dataSet.Fields.Count - 1 do
        if MatchText(dataSet.Fields[I].FieldName, ['COD_EMPRESA', 'CODIGO_EMP']) then
        begin
          FSQLMaker.FilterMk.Add(dataSet.Fields[I].FieldName, vDadosIni.cod_empresa);
          Break;
        end;
    end;

    dataSet.Close;
    dataSet.CommandText := FSQLMaker.GetSQL();

    logs(dataSet.CommandText, FlogStore.textAux );

    dataSet.Open;

    logs_elapsed_time();
  finally
    FlogStore.started := False;
  end;
end;

procedure TDataSet_OOP.SalvarDisplays(dataModule: TComponent;
  componentName: string);
const
  ID_DISPLAY = 'fields-display-';
var
  I, J: Integer;
  sJson: string;
  oConf: TConfigDisplay;
  oField: TFieldDisplay;
  dtsDtm: TDataSet;
  fieldsDisplay: TFieldDisplayList;
begin
  RegisterClasses([TFieldDisplay]);
  if (Trim(componentName) <> '')  then
    componentName := LowerCase(Trim(componentName))
  else if (dataSet <> nil) then
    componentName := LowerCase(Trim(dataSet.Name))
  else
    raise Exception.Create('SalvarDisplays. componentName empty');

  for I := 0 to dataModule.ComponentCount - 1 do
    if dataModule.Components[I] is TDataSet then
      if LowerCase(dataModule.Components[I].Name) = LowerCase(componentName) then
      begin
        dtsDtm := (dataModule.Components[I] as TDataSet);
        sJson := queryCons.Table('dados_json', 'json')
          .Equals('id', ID_DISPLAY + componentName )
          .Scalar().AsString;

        try
          if sJson <> '' then
          begin
            fieldsDisplay := JsonUtils.ToList(TConfigDisplay, TFieldDisplayList, sJson) as TFieldDisplayList;
            if Assigned(fieldsDisplay) and (fieldsDisplay.Count > 0) then
              if fieldsDisplay.Count = dtsDtm.FieldCount then
                Exit;

//            oConf := JsonUtils.ToObject(TConfigDisplay, sJson) as TConfigDisplay;
//
//            if Assigned(oConf) and Assigned(oConf.FieldDisplayList) and (oConf.FieldDisplayList.Count > 0) then
//              if oConf.FieldDisplayList.Count = dtsDtm.FieldCount then
//                Exit;
          end;

//          if not Assigned(oConf) then
//            oConf := TConfigDisplay.Create;

//          if not Assigned(oConf.FieldDisplayList) then
//            oConf.FieldDisplayList := TFieldDisplayList.Create;

          if not Assigned(fieldsDisplay) then
            fieldsDisplay := TFieldDisplayList.Create;

          fieldsDisplay.Clear;

          for J := 0 to dtsDtm.Fields.Count - 1 do
          begin
            oField := TFieldDisplay.Create;
            oField.Name := dtsDtm.Fields[J].FieldName;
            oField.Display := dtsDtm.Fields[J].DisplayLabel;
            oField.Visible := dtsDtm.Fields[J].Visible and (dtsDtm.Fields[J].Tag <> 1);

            if dtsDtm.Fields[J] is TFloatField then
              oField.Mask := TFloatField(dtsDtm.Fields[J]).DisplayFormat
            else
              oField.Mask := dtsDtm.Fields[J].EditMask;

            fieldsDisplay.Add(oField);
          end;

          sJson := JsonUtils.ToJson(fieldsDisplay);

          queryCons.SQL('update or insert into dados_json(id, cod_empresa, json) values (:id, :cod_empresa, :json) matching(id)')
            .ParamValue('id', ID_DISPLAY + componentName)
            .ParamValue('cod_empresa', vDadosIni.cod_empresa)
            .ParamValue('json', sJson)
            .ExecSQL()
            .query.Transaction.Commit;

        finally
          if Assigned(oConf) and Assigned(oConf.FieldDisplayList) and (oConf.FieldDisplayList.Count > 0) then
            oConf.FieldDisplayList.Clear;

          if Assigned(oConf) and Assigned(oConf.FieldDisplayList) then
            oConf.FieldDisplayList.Free;

          if Assigned(oConf) then
            oConf.Free;
        end;

        Exit;
      end;
end;

procedure TDataSet_OOP.SetIndexFieldNames(const Value: string);
begin
  DataSet.IndexFieldNames := Value;
end;

procedure TDataSet_OOP.SetTableName(const Value: string);
begin
  FTableName := Value;
  Auditor.Tabela := Value;
end;

function TDataSet_OOP.SQLClient(sqlText: string): TDataSet_OOP;
begin
  Result := Self;
  dataSet.CommandText := sqlText;
end;

function TDataSet_OOP.SqlExec(ASql: string; AQuery: TIBQuery): TIBQuery;
begin
  logs(ASql, Self.ClassName + '.SqlExec');
  if AQuery = nil then
    AQuery := buscas;

  AQuery.Close;
  AQuery.SQL.Text := ASql;
  if not AQuery.Prepared then
    AQuery.Prepare;
  AQuery.ExecSQL;

  Result := AQuery;

  logs_elapsed_time();
end;

function TDataSet_OOP.SqlExec(ASql: string; const Args: array of const;
  AQuery: TIBQuery): TIBQuery;
begin
  Result := SqlExec(Format(ASql, Args), AQuery);
end;

function TDataSet_OOP.SqlInsertID(Asql, AreturnField: string;
  AQuery: TIBQuery): Integer;
begin
  try
    Asql := Format('select id from sp_sql_insert(%s, %s)', [QuotedStr(Asql), QuotedStr(AreturnField)]);
  except on E: Exception do
    begin
      logs(ASql, Self.ClassName + '.SqlInsertID-ERRO Format');
      Exit;
    end;
  end;

  logs(ASql, Self.ClassName + '.SqlInsertID');

  if AQuery = nil then
    AQuery := buscas;

  AQuery.Close;
  AQuery.SQL.Text := Asql;// Format('select id from sp_sql_insert(%s, %s)', [QuotedStr(Asql), QuotedStr(AreturnField)]);
  AQuery.Open;

  logs_elapsed_time();

  Result := AQuery.FieldByName('id').AsInteger;

  AQuery.Close;
end;

function TDataSet_OOP.SqlInsertID(Asql: string; const Args: array of const;
  AreturnField: string; AQuery: TIBQuery): Integer;
begin
  Result := SqlInsertID(Format(ASql, Args), AreturnField, AQuery);
end;

function TDataSet_OOP.SqlInsertGuid(Asql, AreturnField: string;
  AQuery: TIBQuery): string;
begin
  try
    Asql := Format('select id from sp_sql_insert_guid(%s, %s)', [QuotedStr(Asql), QuotedStr(AreturnField)]);
  except on E: Exception do
    begin
      logs(ASql, Self.ClassName + '.SqlInsertGuid-ERRO Format');
      Exit;
    end;
  end;

  logs(ASql, Self.ClassName + '.SqlInsertGuid');

  if AQuery = nil then
    AQuery := buscas;

  AQuery.Close;
  AQuery.SQL.Text := Asql;// Format('select id from sp_sql_insert(%s, %s)', [QuotedStr(Asql), QuotedStr(AreturnField)]);
  AQuery.Open;

  Result := AQuery.Fields[0].AsString;

  logs_elapsed_time();

  //Result := AQuery.FieldByName('id').AsInteger;

  AQuery.Close;
end;

function TDataSet_OOP.SqlInsertGuid(Asql: string; const Args: array of const;
  AreturnField: string; AQuery: TIBQuery): string;
begin
  Result := SqlInsertGuid(Format(ASql, Args), AreturnField, AQuery);
end;

function TDataSet_OOP.SqlOpen(ASql: string; const Args: array of const;
  AQuery: TIBQuery): TIBQuery;
begin
  Result := SqlOpen(Format(ASql, Args), AQuery);
end;

function TDataSet_OOP.SqlScalar(ASql: string; const Args: array of const;
  AQuery: TIBQuery): ScalarValue;
begin
  Result := SqlScalar(Format(Asql, Args), AQuery);
end;

function TDataSet_OOP.SqlScalar(ASql: string; AQuery: TIBQuery): ScalarValue;
begin
  with SqlOpen(ASql, AQuery) do
  begin
    Result.Value := Fields[0].Value;
    Result.AsString := Fields[0].AsString;
    if Fields[0].DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftLargeint, ftAutoInc] then
    begin
      Result.AsInteger  := Fields[0].AsInteger;
      Result.AsFloat    := Fields[0].AsFloat;
      Result.AsCurrency := Fields[0].AsCurrency;
    end;
    if Fields[0].DataType in [ftDateTime, ftDate, ftTime] then
    begin
      Result.AsDateTime := Fields[0].AsDateTime;
      Result.AsDate := DateOf(Fields[0].AsDateTime);
      Result.AsDateTime := TimeOf(Fields[0].AsDateTime);
    end;
  end;
end;

function TDataSet_OOP.SqlOpen(ASql: string; AQuery: TIBQuery): TIBQuery;
begin
  logs(ASql, Self.ClassName + '.SqlOpen');

  if AQuery = nil then
    AQuery := buscas;

  AQuery.Close;
  AQuery.SQL.Text := ASql;
  AQuery.Open;

  Result := AQuery;

  logs_elapsed_time();
end;

procedure TDataSet_OOP.storeFilter;
begin
  Ffilter   := dataSet.Filter;
  Ffiltered := dataSet.Filtered;
end;

procedure TDataSet_OOP.storeRecNo;
begin
  if (not dataSet.IsEmpty) and (dataSet.RecordCount > 0) then
    Frecno := dataSet.RecNo
  else
    Frecno := -1;
end;

function TDataSet_OOP.str_empty(Afield: string; Atrim: Boolean): Boolean;
begin
  Result := fstr(Afield, Atrim) = '';
end;

function TDataSet_OOP.tabelaExiste(pNomeTabela: string): boolean;
var
   buscas2: TIBQuery;
begin
	try
    Result := True;
    if Trim(pNomeTabela) = '' then
    begin
      Result := False;
      Exit;
    end;
    buscas2 := TIBQuery(dtmAtivo.IbBuscas);

    buscas2.Close;
    buscas2.SQL.Text := 'SELECT RDB$RELATION_NAME FROM RDB$RELATIONS WHERE RDB$VIEW_BLR ' +
    'IS NULL AND (RDB$SYSTEM_FLAG = 0 OR RDB$SYSTEM_FLAG IS NULL) AND RDB$RELATION_NAME = ' + QuotedStr(UpperCase(Trim(pNomeTabela)));
    buscas2.Open;

    if buscas2.IsEmpty then
    begin
      Result := False;
      Exit;
    end;

  except on E: Exception do
    Result := False;
  end;
end;

function TDataSet_OOP.ultdiaCXL: boolean;
var
  temp: string;
begin
  result := true;
  temp := retornaValor('SELECT first 1 DIA_F_CXL as valor FROM FECD_CXL fdx' +
    ' where fdx.op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) +
    ' and fdx.CODIGO_EMP = ' + vDadosIni.codEmpresa +
    ' and (fdx.status_cxl <> ''FECHADO'' or ' +
    ' status_cxl is null )  ORDER BY DIA_F_CXL DESC');
  if trim(Temp) <> '' then
  begin
    //    result := StrToDate(Temp);
    if vDadosIni.diaAbertoCxl <> StrToDate(Temp) then
    begin
      Application.MessageBox(pchar('Dia ' + datetostr(vDadosIni.diaAbertoCxl) + ' do Caixa Auxiliar foi fechado. Este caixa Será atualizado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      vDadosIni.diaAbertoCxl := StrToDate(Temp);
      vDadosIni.diaFCxl := vDadosIni.diaAbertoCxl;
      exit;
    end
    else
      result := false;
  end
  else
    result := false;
end;

function TDataSet_OOP.verificarDNA(vcoddep: integer): boolean;
var
  vultano, vultmes: integer;
  vultdep: string;
begin
  Result := true;
  //  vEmp.abreEmpresa;
  buscas.close;
  buscas.SQL.Text := 'SELECT * FROM APURACAO_DEPTO WHERE COD_DEP = ' +
    IntToStr(vcoddep) + ' AND COD_EMPRESA = ' +
    vDadosIni.codEmpresa +
    ' and tpdesp <> ''RAT''' +
    ' ORDER BY DATACAD_AP DESC';
  buscas.Open;
  if buscas.IsEmpty then
  begin
    buscas.close;
    buscas.SQL.Text := 'SELECT * FROM APURACAO_DEPTO WHERE COD_DEP = 99' +
      ' AND COD_EMPRESA = ' +
      vDadosIni.codEmpresa +
    ' and tpdesp <> ''RAT''' +
    ' ORDER BY DATACAD_AP DESC';
    buscas.Open;
  end;
  if not buscas.isempty then
  begin
    vultano := buscas.FieldByName('ANO').AsInteger;
    vultmes := buscas.FieldByName('MES').AsInteger;
    vultdep := buscas.FieldByName('COD_DEP').AsString;
    while not buscas.Eof do
    begin
      if (buscas.FieldByName('MES').AsInteger = vultmes) and
        (buscas.FieldByName('ANO').AsInteger = vultano) then
      begin
        if trim(buscas.FieldByName('TPDESP').AsString) = 'CF' then
        begin
          VCF := buscas.FieldByName('VALOR').AsCurrency;
          VPERCCF := buscas.FieldByName('PERC_VALOR').AsCurrency;
        end;
        if trim(buscas.FieldByName('TPDESP').AsString) = 'CMV' then
          VCMV := buscas.FieldByName('VALOR').AsCurrency;
        if trim(buscas.FieldByName('TPDESP').AsString) = 'OCV' then
          VOCV := buscas.FieldByName('VALOR').AsCurrency;
        vDNA := buscas.FieldByName('DNADEP').AsString;
        vMargemMin := buscas.FieldByName('MARGMIN').AsFloat;
        vMarkupmin := buscas.FieldByName('MARKUPMIN').AsFloat;
        vfatapura := buscas.FieldByName('VALOR_FATURADO').AsCurrency;
      end;
      buscas.next;
    end;
    if vcoddep <> 99 then
    begin
      if (VCF = 0) or (VOCV = 0) then
      begin
       Application.MessageBox(Pchar('Custo Fixo ou OCV não encontrado para o depto: '+vDadosIni.StrZero(vcoddep,3)), 'Atenção', MB_OK);
      end;
    end;

    buscas.close;
    buscas.SQL.Text := 'SELECT * FROM APURACAO_DEPTO WHERE COD_DEP = 99' +
      ' AND TPDESP = ''AIR'' AND ANO = ' + IntToStr(vultano) + ' AND MES = ' + IntToStr(vultmes) +
      ' AND COD_EMPRESA = ' +
      vDadosIni.codEmpresa + ' ORDER BY DATACAD_AP DESC';
    buscas.Open;
    vPercBaseADIRRF := buscas.FieldByName('VALOR').AsCurrency;

    buscas.Close;
    buscas.SQL.text := 'SELECT * FROM DEPART_CT WHERE COD_DEP = ' + vultdep;
    buscas.open;
    if not buscas.IsEmpty then
      VDepto := buscas.FieldByName('DESC_DEP').asstring
    else
      VDepto := 'EMPRESA';
    vmesap := vultmes;
    vanoap := vultano;
  end
  else
    Result := false;
end;

procedure TDataSet_OOP._GravaConfiguracoesBoolean(NomeVariavel: string;
  Valor: Boolean);
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteBool(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TDataSet_OOP._GravaConfiguracoesDouble(NomeVariavel: string;
  Valor: Double);
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteFloat(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TDataSet_OOP._GravaConfiguracoesInteger(NomeVariavel: string;
  Valor: Integer);
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteInteger(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TDataSet_OOP._GravaConfiguracoesString(NomeVariavel, Valor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TDataSet_OOP._LerConfiguracoesRegistroBoolean(
  NomeVariavel: string; pDefault: Boolean): Boolean;
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
  vTemp: Boolean;
begin
  Result := pDefault;
  try
    vTemp := pDefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(NomeVariavel) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadBool(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

function TDataSet_OOP._LerConfiguracoesRegistroDouble(
  NomeVariavel: string; pDefault: Double): Double;
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
  vTemp: double;
begin
  Result := pDefault;
  try
    vTemp := pDefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(NomeVariavel) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadFloat(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

function TDataSet_OOP._LerConfiguracoesRegistroInteger(
  NomeVariavel: string; pDefault: Integer): Integer;
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
  vTemp: Integer;
begin
  Result := pDefault;
  try
    vTemp := pDefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(NomeVariavel) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadInteger(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

function TDataSet_OOP._LerConfiguracoesRegistroString(
  NomeVariavel: string; pDefault: string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  Result := pDefault;
  try
    vTemp := pDefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(NomeVariavel) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadString(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

procedure TDataSet_OOP.RetornaAtributos(Vcomb: Tcombobox; vcombord: TCombobox);
var
  I: Integer;
begin
  try
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      Vcomb.Items.Add(DataSet.Fields[I].DisplayName);
      vcombord.Items.Add(DataSet.Fields[I].DisplayName);
    end;
    Vcomb.Items.Add('TODOS');
  except
    on E: EListError do
      raise EListError.Create('Error na Montagem da Lista');
    on Exception do
      raise Exception.Create('Erro Interno com a Pesquisa');
  end; // Try...Except
end;

function TDataSet_OOP.retornaTabela(pDataSet: TClientDataSet): string;
var
	vAux: string;
  i: integer;
  buscas2: TIBQuery;
  
  function tabelaPrincipal(pNomeTabela: string): boolean;
  var
    vFrom: string;
  begin
  	try
      vFrom := Copy(pDataSet.CommandText, (Pos(pNomeTabela, pDataSet.CommandText) - 5), 4);
      Result := not (UpperCase(Trim(vFrom)) = 'JOIN');
    except on E: Exception do
    	Result := False;
    end;
  end;
begin
	try
  	Result := '';

   buscas2 := TIBQuery(dtmAtivo.IbBuscas);
    
  	if ((StrToInt(vDadosIni.codEmpresa) = vDadosIni.vCodEmpresaFisica) or (vDadosIni.vCodEmpresaFisica = 0))then
    	Exit;

   buscas2.Close;
  	buscas2.SQL.Text := 'select cod_empresa from EMPRESA_FISICA ' +
  		' where cod_empresa = ' + vDadosIni.codEmpresa;
  	buscas2.Open;

   if not buscas2.IsEmpty then
	  exit;

    if pDataSet = nil then
    begin
    	Result := '';
      Exit;
    end;

    for I := 0 to pDataSet.FieldCount - 1 do
    begin
      vAux := Copy(pDataSet.Fields.Fields[i].Origin, 2, (Pos('.', pDataSet.Fields.Fields[i].Origin) - 3));
      if tabelaExiste(vAux) then
        if tabelaPrincipal(vAux) then
        begin
        	Result := UpperCase(Trim(vAux));
        	Exit;
        end;
    end;
  except on E: Exception do
    begin
      Result := '';
      MessageDlg('E0004 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('E0004 ' + e.Message);
    end;
  end;
end;

function TDataSet_OOP.retornaValor(comandosSql: string; dataIni,
  dataFim: TDate; pAplicarTrim: Boolean = True): string;
begin
  //Pesquisa gerais atraves de comandos sql.
  try
//    buscas.Database.DatabaseName;
//    buscas.Database.Connected;
    buscas.close;
    buscas.SQL.Text := comandosSql;
    buscas.Params[0].AsDate := dataIni;
    buscas.Params[1].AsDate := dataFim;
    FlogStore.textAux := '>' + buscas.Name +
                         '@' + buscas.Params[0].Name + '@=' + buscas.Params[0].Text +
                         '@' + buscas.Params[1].Name + '@=' + buscas.Params[1].Text;
    logs(comandosSql + sLineBreak + FlogStore.textAux, Self.ClassName + '.retornaValor');
    buscas.Open;
    logs_elapsed_time();
    if buscas.IsEmpty then
      Result := ''
    else if pAplicarTrim then
      Result := Trim(buscas.FieldByName('valor').AsString)
    else
      Result := buscas.FieldByName('valor').AsString;
    buscas.close;
  except
    on E: Exception do
    begin
      result := '';
      MessageDlg('E0019 ' + 'Erro ao ler executar comandos sql: ' + comandosSql, mtinformation,
        [mbOK], 0);
      registraErro('E0019 ' + e.Message + ' ' + comandosSql);
    end;
  end;
end;

function TDataSet_OOP.retornaValor(comandosSql: string; pAplicarTrim: Boolean = True): string;
begin
  //Pesquisa gerais atraves de comandos sql.
  try
//    buscas.Database.DatabaseName;
//    buscas.Database.Connected;
    buscas.close;
    buscas.SQL.Text := comandosSql;
    logs(comandosSql, Self.ClassName + '.retornaValor');
    buscas.Open;
    if buscas.IsEmpty then
      Result := ''
    else if pAplicarTrim then
      Result := Trim(buscas.FieldByName('valor').AsString)
    else
      Result := buscas.FieldByName('valor').AsString;
    buscas.close;
    logs_elapsed_time();
  except
    on E: Exception do
    begin
      result := '';
      MessageDlg('E0019 ' + 'Erro ao ler executar comandos sql: ' + comandosSql, mtinformation,
        [mbOK], 0);
      registraErro('E0019 ' + e.Message + ' ' + comandosSql);
    end;
  end;
end;

function TDataSet_OOP.ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim,
  sqlAdicional, codemp: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao, vDataI, vDataF, formatodata: string;
begin
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos4';
  result := false;
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
        Campo := DataSet.Fields[I].FieldName;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        possuiCodEmpresa := true;
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;
    if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
      formatodata := 'mm/dd/yyyy'
    else if pos('.', ShortDateFormat) <> 0 then
      formatodata := 'dd.mm.yyyy';

    vDataI := StringReplace(dataIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(dataFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    if ((vDataI <> '      ') and (vDataI <> '        ')) or
      ((vDataF <> '      ') and (vDataF <> '        ')) then
    begin
      try
        DataSet.Close;
        if (((vDataI <> '      ') and (vDataI <> '        ')) and
          ((vDataF <> '      ') and (vDataF <> '        '))) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni))) + ' and ' + tabela + '.' + Campo +
            ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim))
        else if ((vDataI <> '      ') and (vDataI <> '        ')) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni)))
        else if ((vDataF <> '      ') and (vDataF <> '        ')) then
          condicao := ' where ' +  tabela + '.' + Campo + ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim));
        DataSet.CommandText := 'select * from ' + tabela + condicao;
        if (possuiCodEmpresa) and (pos('where', dataSet.CommandText) > 0) then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 1';
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        //Particularidade para a buscas de vendas
        if upperCase(Tabela) = 'PEDVENDA' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from pedvenda',
            'pedvenda.*,clientes.nome_cliente from pedvenda inner join clientes on pedvenda.cod_cliente=clientes.cod_cliente ' +
            'and pedvenda.cod_empresa=clientes.cod_empresa', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'pedvenda.nome_cliente',
            'clientes.nome_cliente', [rfReplaceAll, rfIgnoreCase]);
        end
          //Particularidades para buscas de lancamentos
          else if upperCase(Tabela) = 'LANCAMENTOS' then
          begin
            dataSet.CommandText := StringReplace(dataSet.CommandText, '* from lancamentos',
              'lancamentos.*, controles.nome_ctrl from lancamentos' +
              ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and' +
              ' lancamentos.codigo_emp = controles.codigo_emp', [rfIgnoreCase]);
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'lancamentos.nome_ctrl',
              'controles.nome_ctrl', [rfReplaceAll, rfIgnoreCase]);
          end;
        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp
            + ' and ' + tabela + '.' + 'ativo = 1'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.ativo = 1'
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;

        //Particularidade para a buscas de vendas
        if upperCase(Tabela) = 'PEDVENDA' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from pedvenda',
            'pedvenda.*,clientes.nome_cliente from pedvenda inner join clientes on pedvenda.cod_cliente=clientes.cod_cliente ' +
            'and pedvenda.cod_empresa=clientes.cod_empresa', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'pedvenda.nome_cliente',
            'clientes.nome_cliente', [rfReplaceAll, rfIgnoreCase]);
        end
          //Particularidades para buscas de lancamentos
          else if upperCase(Tabela) = 'LANCAMENTOS' then
          begin
            dataSet.CommandText := StringReplace(dataSet.CommandText, '* from lancamentos',
              'lancamentos.*, controles.nome_ctrl from lancamentos' +
              ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and' +
              ' lancamentos.codigo_emp = controles.codigo_emp', [rfIgnoreCase]);
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'lancamentos.nome_ctrl',
              'controles.nome_ctrl', [rfReplaceAll, rfIgnoreCase]);
          end;
        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCampos(tabela, valorConsulta, Campo, condicao,
  ordem: string; constante: boolean; codemp: string; ativo: integer): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string; // F (Integer, Float); S String; D Data; I Indefinido
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
  valorConsulta := Trim(valorConsulta);
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos5';
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    result := false;
    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Maior ou Igual' then
          condicao := '>='
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Menor ou Igual' then
          condicao := '<='
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          begin
            valorConsulta := ajustar_consulta_incasesensitive(DataSet.Fields[I], tabela, valorConsulta);
            Campo := DataSet.Fields[I].FieldName;

            if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
              ordem := DataSet.Fields[I].FieldName;

            if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
            begin
              possuiCodEmpresa := true;
              fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            end;
            if Dataset.Fields[I].FieldName = 'ATIVO' then
              possuiAtivo := true;

            //            if (Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            //              (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField) then
            //              tipo := 'F'
            if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              tipo := 'I'
            else if (Dataset.Fields[I] is TCurrencyField) or (Dataset.Fields[I] is TFloatField) then
              tipo := 'F'
            else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
              tipo := 'S'
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              tipo := 'D'
            else
              tipo := 'I';

            condicao := IfThen( MatchText(tipo, ['F', 'I']) and MatchText(condicao, ['like', 'Começa']), '=', condicao );

            break;
          end;
        end;
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
            possuiCodEmpresa := true;
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;
        if tipo = 'I' then
        try
          strtoint(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end
        else if tipo = 'F' then
        try
          strtofloat(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end;

        DataSet.Close;
        if (tipo = 'F') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
              + condicao + ' ' + vDadosIni.trocaVirgulaPorPonto(valorConsulta);
        end
        else if (tipo = 'S') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' ' + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + fCampoCodEmpresa + ' = ' + codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ativo = ' + inttostr(ativo);

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          if not possuiCodEmpresa and (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
            possuiCodEmpresa := true;
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
          end;

          if not possuiAtivo and (Dataset.Fields[I].FieldName = 'ATIVO') then
            possuiAtivo := true;

          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
            ordem := DataSet.Fields[I].FieldName;
        end;

        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + fCampoCodEmpresa + ' = ' + codemp;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ativo = ' + inttostr(ativo)
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ativo = ' + inttostr(ativo);

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    possuiCodEmpresa := false;
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsisteInscricaoEstadual(const Insc,
  UF: WideString): Integer;
type
  TInscricaoEstadual = function(const Insc, UF: WideString; Silent: Boolean): Integer; stdcall;
var
  HandleIE: THandle;
  InscricaoEstadual: TInscricaoEstadual;
  resultadoIE: Integer;
begin
  if Trim(UpperCase(UF)) = 'RO' then
  begin
    Result := IfThen(not HelperIE.Valida(UF, Insc), 1);
    if (Result <> 0) then
      ShowAtencao('Inscricao Estadual incorreta para o estado "' + UF + '"');
    Exit;
  end;

  HandleIE := 0;
  try
    HandleIE := LoadLibrary('hw.nfe.dx.dll');
    if HandleIE <> 0 then
    begin
      @InscricaoEstadual := GetProcAddress(HandleIE, 'ConsisteInscricaoEstadual');
      Result := InscricaoEstadual(Insc, UF, vDadosIni.vInibeMensagemInscEstadual = 'S');
      {
      if vDadosIni.vInibeMensagemInscEstadual <> 'S' then
      begin
        if Result = 1 then
          Application.MessageBox(PChar('Inscricao Estadual incorreta para o estado ' + UF), 'Informação', MB_OK + MB_ICONERROR + MB_DEFBUTTON1)
        else if Result <> 0 then
          Application.MessageBox(PChar('Inscrição Estadual informada com caracteres impróprios ou UF ''' + UF + ''' inexistente.'), 'Informação', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      end;
      }
    end
    else
    begin
      Result := 2;
      Application.MessageBox(PChar('DLL(hw.nfe.dx.dll) para validação de Incdcrição Estadual não encontrada'), 'Informação', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    end;
  finally
    FreeLibrary(HandleIE);
  end;
end;

function TDataSet_OOP.ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim,
  codemp: string; ativo: integer): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao, vDataI, vDataF, formatodata: string;
begin
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos6';
  result := false;
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
        Campo := DataSet.Fields[I].FieldName;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        possuiCodEmpresa := true;
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;

    if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
      formatodata := 'mm/dd/yyyy'
    else if pos('.', ShortDateFormat) <> 0 then
      formatodata := 'dd.mm.yyyy';

    vDataI := StringReplace(dataIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(dataFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    if ((vDataI <> '      ') and (vDataI <> '        ')) or
      ((vDataF <> '      ') and (vDataF <> '        ')) then
    begin
      try
        DataSet.Close;
        if (((vDataI <> '      ') and (vDataI <> '        ')) and
          ((vDataF <> '      ') and (vDataF <> '        '))) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni))) + ' and ' + tabela + '.' + Campo +
            ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim))
        else if ((vDataI <> '      ') and (vDataI <> '        ')) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni)))
        else if ((vDataF <> '      ') and (vDataF <> '        ')) then
          condicao := ' where ' + tabela + '.' + Campo + ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim));
        DataSet.CommandText := 'select * from ' + tabela + condicao;
        if (possuiCodEmpresa) and (pos('where', dataSet.CommandText) > 0) then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = ' + inttostr(ativo);
        DataSet.CommandText := DataSet.CommandText + ' order by ' + tabela + '.' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp + ' and ' + tabela + '.' + 'ativo = ' + inttostr(ativo)
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'ativo = ' + inttostr(ativo)
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        DataSet.CommandText := DataSet.CommandText + ' order by ' + tabela + '.' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    FlogStore.started := False;
  end;
end;

{ TManutencaoAlteracoesArquivosPAF }

constructor TManutencaoAlteracoesArquivosPAF.create;
begin

end;

procedure TManutencaoAlteracoesArquivosPAF._gravaMD5_DAV(query: TIBQuery;
  pNumeroDAV: integer);
var
	vTempMD5, vTempMD52: string;
  pNPed, vCont: integer;
  pTipo: string;
begin
  if pNumeroDAV <= 0 then
    Exit;

  query.Close;
  query.SQL.Text := 'select pa.nped, pa.coo_impressao, pa.nprevenda, pa.data_ped,' +
    ' case when pa.tipo = ''REQ'' then ''Pedido''' +
    ' when pa.tipo = ''ORC'' then ''Orcamento''' +
		' else ''Ordem de Servico'' end titulo, pa.tipo, pa.valor_total, pa.ncupom, pa.operador,' +
		' pa.nome_clientedav, pa.cpfcgc, pa.horaabertura, pa.minabertura, pa.valor_total, pa.coo_conta_cliente,' +
		' pa.nserieecf_conta_cliente, pa.md5' +
		' from pedvenda pa' +
    ' where pa.nprevenda = ' +IntToStr(pNumeroDAV) +
    ' and pa.cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  pNPed := query.FieldByName('nped').AsInteger;
  pTipo := query.FieldByName('tipo').AsString;

	vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
		vDadosIni.vEmp.vCNPJ + '|' +
		query.FieldByName('coo_impressao').AsString + '|' +
		query.FieldByName('nprevenda').AsString + '|' +
		FormatDateTime('dd/mm/yyyy', query.FieldByName('data_ped').AsDateTime) + '|' +
		query.FieldByName('titulo').AsString + '|' +
		query.FieldByName('valor_total').AsString + '|' +
		query.FieldByName('ncupom').AsString + '|' +
		query.FieldByName('operador').AsString + '|' +
		query.FieldByName('nome_clientedav').AsString + '|' +
		query.FieldByName('cpfcgc').AsString + '|'
	);

//	if Trim(pTipo) = 'OS' then
//		vTempMD52 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
//			vDadosIni.vEmp.vCNPJ + '|' +
//			query.FieldByName('DATA_PED').AsString + '|' +
//			query.FieldByName('HORAABERTURA').AsString + '|' +
//			query.FieldByName('MINABERTURA').AsString + '|' +
//			query.FieldByName('NPREVENDA').AsString + '|' +
//			query.FieldByName('VALOR_TOTAL').AsString + '|' +
//			query.FieldByName('COO_CONTA_CLIENTE').AsString + '|' +
//			query.FieldByName('NSERIEECF_CONTA_CLIENTE').AsString + '|'
//		);

	query.Close;
	query.SQL.Text := 'update pedvenda set md5 = ' + QuotedStr(vTempMD5) +
//		', md52 = :md52' +
		' where nped = ' + IntToStr(pNPed) +
		' and tipo = ' + QuotedStr(pTipo) +
		' and cod_empresa = ' + vDadosIni.codEmpresa;
//	if Trim(pTipo) = 'OS' then
//		query.ParamByName('md52').AsString := Copy(vTempMD52, 1, 32);
	query.ExecSQL;

//  query.Close;
//  query.SQL.Text := 'select count(nped) contador from pedvenda_prod' +
//    ' where nped = ' + IntToStr(pNPed) +
//    ' and tipo = ' + QuotedStr(pTipo) +
//    ' and cod_empresa = ' + vDadosIni.codEmpresa;
//  query.Open;

//  vCont := query.FieldByName('contador').AsInteger;

//  query.Close;
//  query.SQL.Text := 'select count(nped) contador from pedvenda_serv' +
//    ' where nped = ' + IntToStr(pNPed) +
//    ' and tipo = ' + QuotedStr(pTipo) +
//    ' and cod_empresa = ' + vDadosIni.codEmpresa;
//  query.Open;

//  vCont := vCont + query.FieldByName('contador').AsInteger;

//  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
//    IntToStr(pNPed) + '|' +
//    Trim(pTipo) + '|' +
//    vDadosIni.codEmpresa + '|' +
//    IntToStr(vCont) + '|'
//  );

//  query.Close;
//  query.SQL.Text := 'update pedvenda set md52 = ' + QuotedStr(vTempMD5) +
//    ' where nprevenda = ' +IntToStr(pNumeroDAV) +
//    ' and cod_empresa = ' + vDadosIni.codEmpresa;
//  query.ExecSQL;

  if query.Transaction.InTransaction then
    query.Transaction.Commit;

	_gravaMD5_DAV_Produtos_Sevicos(query, pNPed, pTipo);
end;

procedure TManutencaoAlteracoesArquivosPAF._gravaMD5_DAV_Produtos_Sevicos(
  query: TIBQuery; pNped: integer; pTipo: string);
var
  vTempMD5: string;
  vLista, vListaChave, vListaDadosACrip: TStringList;
  I: Integer;
begin
//  vLista := TStringList.Create;
//  vLista.Clear;
                 
  vListaChave := TStringList.Create;
  vListaChave.Clear;
  vListaDadosACrip := TStringList.Create;
  vListaDadosACrip.Clear;

  query.Close;
  query.SQL.Text :=
    'select pv.data_ped, pp.nprevenda, pp.data_inclusao, pp.nitem, pp.grupo_prod||pp.cod_prod codigo, pp.num_fab_prod, pp.descr_prod_ped descricao,' +
    ' pp.quant_ped_item qtde, pp.unidade, pp.vlun_ped_item vl_unit, pp.rateio_desc, pp.rateio_acresc, pp.vltot_ped_item vl_tot,' +
    ' pp.sit_trib, pp.icm_prod aliquota, pp.status, pp.csdecqtde, pp.csdecvlunt, pp.grupo_prod, pp.cod_prod, pp.cod_grade, pp.codigo_nop, 0 cod_servico, ''P'' prod_serv ' +
    ' from pedvenda pv' +
    ' inner join pedvenda_prod pp on pp.nped = pv.nped and pp.tipo = pv.tipo and pp.cod_empresa = pv.cod_empresa' +
    ' where pv.nped = ' +IntToStr(pNped) +
    ' and pv.tipo = ' + QuotedStr(pTipo) +
    ' union' +
    ' select pv.data_ped, ps.nprevenda, ps.data_inclusao, ps.nitem, ps.cod_servico codigo, ps.cod_servico num_fab_prod, ps.desc_serv_ped descricao,' +
    ' ps.quant_serv_ped qtde, '''' unidade, ps.valor_un_serv vl_unit, ps.rateio_desc, ps.rateio_acresc, ps.valor_tot_serv vl_tot,' +
    ' ps.sit_trib, ps.aliq_iss aliquota, ps.status, 0 csdecqtde, ps.csdecvlunt, 0 grupo_prod, '''' cod_prod, 0 cod_grade, ps.codigo_nop, ps.cod_servico, ''S'' prod_serv' +
    ' from pedvenda pv' +
    ' inner join pedvenda_serv ps on ps.nped = pv.nped and ps.tipo = pv.tipo and ps.cod_empresa = pv.cod_empresa' +
    ' where pv.nped = ' +IntToStr(pNped) +
    ' and pv.tipo = ' + QuotedStr(pTipo) +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  query.First;
  while not query.Eof do
  begin
    if query.FieldByName('prod_serv').AsString = 'P' then
    begin
      vListaChave.Add( 'P|' +
        query.FieldByName('grupo_prod').AsString + '|' +
        query.FieldByName('cod_prod').AsString + '|' +
        query.FieldByName('nitem').AsString + '|' +
        query.FieldByName('cod_grade').AsString + '|'
      );
    end
    else
    begin
      vListaChave.Add( 'S|' +
        query.FieldByName('cod_servico').AsString + '|' +
        query.FieldByName('nitem').AsString + '|'
      );
    end;
    vListaDadosACrip.Add(
      Trim(query.FieldByName('nprevenda').AsString) + '|' +
      Trim(query.FieldByName('data_inclusao').AsString) + '|' +
      Trim(query.FieldByName('nitem').AsString) + '|' +
      Trim(query.FieldByName('codigo').AsString) + '|' +
      Trim(query.FieldByName('num_fab_prod').AsString) + '|' +
      Trim(query.FieldByName('descricao').AsString) + '|' +
      Trim(query.FieldByName('qtde').AsString) + '|' +
      Trim(query.FieldByName('unidade').AsString) + '|' +
      Trim(query.FieldByName('vl_unit').AsString) + '|' +
      Trim(query.FieldByName('rateio_desc').AsString) + '|' +
      Trim(query.FieldByName('rateio_acresc').AsString) + '|' +
      Trim(query.FieldByName('vl_tot').AsString) + '|' +
      Trim(query.FieldByName('sit_trib').AsString) + '|' +
      Trim(query.FieldByName('aliquota').AsString) + '|' +
      Trim(query.FieldByName('status').AsString) + '|' +
      Trim(query.FieldByName('csdecqtde').AsString) + '|' +
      Trim(query.FieldByName('csdecvlunt').AsString) + '|'
    );
    query.Next;
  end;

  for I := 0 to vListaChave.Count - 1 do
  begin
    vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto( vListaDadosACrip[I] );
    if vDadosIni.getCampoPipe(vListaChave[i], 1) = 'P' then
    begin
      query.Close;
      query.SQL.Text := 'update pedvenda_prod set md5 = ' + QuotedStr(vTempMD5) +
        ' where nped = ' + IntToStr(pNped) +
        ' and tipo = ' + QuotedStr(pTipo) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and grupo_prod = ' + vDadosIni.getCampoPipe(vListaChave[i], 2) +
        ' and cod_prod = ' + QuotedStr(vDadosIni.getCampoPipe(vListaChave[i], 3)) +
        ' and nitem = ' + vDadosIni.getCampoPipe(vListaChave[i], 4) +
        ' and cod_grade = ' + vDadosIni.getCampoPipe(vListaChave[i], 5);
      query.ExecSQL;
    end
    else
    begin
      query.Close;
      query.SQL.Text := 'update pedvenda_serv set md5 = ' + QuotedStr(vTempMD5) +
        ' where nped = ' + IntToStr(pNped) +
        ' and tipo = ' + QuotedStr(pTipo) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_servico = ' + vDadosIni.getCampoPipe(vListaChave[i], 2) +
        ' and nitem = ' + vDadosIni.getCampoPipe(vListaChave[i], 3);
      query.ExecSQL;
    end;
  end;

  if query.Transaction.InTransaction then
    query.Transaction.Commit;

exit;

  //// nao usar daqui pra baixo

  query.Close;
  query.SQL.Text := 'select nped, tipo, grupo_prod, cod_prod, nitem, cod_grade, codigo_nop' +
    ' from pedvenda_prod where nped = ' +IntToStr(pNped) +
    ' and tipo = ' + QuotedStr(pTipo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  query.First;
  while not query.Eof do
  begin
    vLista.Add( 'P|' +
      query.FieldByName('grupo_prod').AsString + '|' +
      query.FieldByName('cod_prod').AsString + '|' +
      query.FieldByName('nitem').AsString + '|' +
      query.FieldByName('cod_grade').AsString + '|'
    );
    query.Next;
  end;

  query.Close;
  query.SQL.Text := 'select nped, tipo, cod_servico, nitem, codigo_nop' +
    ' from pedvenda_serv where nped = ' +IntToStr(pNped) +
    ' and tipo = ' + QuotedStr(Trim(pTipo) )+
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  query.First;
  while not query.Eof do
  begin
    vLista.Add( 'S|' +
      query.FieldByName('cod_servico').AsString + '|' +
      query.FieldByName('nitem').AsString + '|'
    );
    query.Next;
  end;       

  for I := 0 to vLista.Count - 1 do
  begin
    if vDadosIni.getCampoPipe(vLista[i], 1) = 'P' then
    begin
      query.Close;
      query.SQL.Text := 'select data_inclusao, nitem, grupo_prod, cod_prod, num_fab_prod, descr_prod_ped,' +
        ' quant_ped_item, vlun_ped_item, vltot_ped_item, rateio_desc, rateio_acresc, status' +
        ' from pedvenda_prod' +
        ' where nped = ' + IntToStr(pNped) +
        ' and tipo = ' + QuotedStr(pTipo) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and grupo_prod = ' + vDadosIni.getCampoPipe(vLista[i], 2) +
        ' and cod_prod = ' + QuotedStr(vDadosIni.getCampoPipe(vLista[i], 3)) +
        ' and nitem = ' + vDadosIni.getCampoPipe(vLista[i], 4) +
        ' and cod_grade = ' + vDadosIni.getCampoPipe(vLista[i], 5);
      query.Open;

      vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
        query.FieldByName('data_inclusao').AsString + '|' +
        query.FieldByName('nitem').AsString + '|' +
        query.FieldByName('grupo_prod').AsString + '|' +
        query.FieldByName('cod_prod').AsString + '|' +
        query.FieldByName('num_fab_prod').AsString + '|' +
        query.FieldByName('descr_prod_ped').AsString + '|' +
        query.FieldByName('quant_ped_item').AsString + '|' +
        query.FieldByName('vlun_ped_item').AsString + '|' +
        query.FieldByName('vltot_ped_item').AsString + '|' +
        query.FieldByName('rateio_desc').AsString + '|' +
        query.FieldByName('rateio_acresc').AsString + '|' +
        query.FieldByName('status').AsString + '|'
      );

      query.Close;
      query.SQL.Text := 'update pedvenda_prod set md5 = ' + QuotedStr(vTempMD5) +
        ' where nped = ' + IntToStr(pNped) +
        ' and tipo = ' + QuotedStr(pTipo) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and grupo_prod = ' + vDadosIni.getCampoPipe(vLista[i], 2) +
        ' and cod_prod = ' + QuotedStr(vDadosIni.getCampoPipe(vLista[i], 3)) +
        ' and nitem = ' + vDadosIni.getCampoPipe(vLista[i], 4) +
        ' and cod_grade = ' + vDadosIni.getCampoPipe(vLista[i], 5);
      query.ExecSQL;

    end
    else if vDadosIni.getCampoPipe(vLista[i], 1) = 'S' then
    begin
      query.Close;
      query.SQL.Text := 'select data_inclusao, nitem, cod_servico, quant_serv_ped, valor_un_serv, valor_tot_serv,' +
        ' desc_serv_ped, rateio_desc, rateio_acresc, status' +
        ' from pedvenda_serv' +
        ' where nped = ' + IntToStr(pNped) +
        ' and tipo = ' + QuotedStr(Trim(pTipo)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_servico = ' + vDadosIni.getCampoPipe(vLista[i], 2) +
        ' and nitem = ' + vDadosIni.getCampoPipe(vLista[i], 3);
      query.Open;

      vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
        query.FieldByName('data_inclusao').AsString + '|' +
        query.FieldByName('nitem').AsString + '|' +
        query.FieldByName('cod_servico').AsString + '|' +
        query.FieldByName('quant_serv_ped').AsString + '|' +
        query.FieldByName('valor_un_serv').AsString + '|' +
        query.FieldByName('valor_tot_serv').AsString + '|' +
        query.FieldByName('desc_serv_ped').AsString + '|' +
        query.FieldByName('rateio_desc').AsString + '|' +
        query.FieldByName('rateio_acresc').AsString + '|' +
        query.FieldByName('status').AsString + '|'
      );

      query.Close;
      query.SQL.Text := 'update pedvenda_serv set md5 = ' + QuotedStr(vTempMD5) +
        ' where nped = ' + IntToStr(pNped) +
        ' and tipo = ' + QuotedStr(pTipo) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_servico = ' + vDadosIni.getCampoPipe(vLista[i], 2) +
        ' and nitem = ' + vDadosIni.getCampoPipe(vLista[i], 3);
      query.ExecSQL;

    end;
  end;

  if query.Transaction.InTransaction then
    query.Transaction.Commit;
end;

procedure TManutencaoAlteracoesArquivosPAF._gravaMD5_Produtos(query,
  query2: TIBQuery; pTipo: string; pNPed: integer; pCommit: Boolean = True);
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text :=
    'select p.grupo_prod||p.cod_prod codigo, p.num_fab_prod, p.descr_prod, p.unidade,' +
    ' case when coalesce(p.arredondar_truncar, ''T'') = ''T'' then ''T'' else ''A'' end iat,' +
    ' case when coalesce(p.tipo_fab, ''T'') = ''T'' then ''T'' else ''P'' end ippt,' +
		' p.sit_trib, p.icm_prod aliquota, p.prec_tab_prod valor_unitario, ''P'' prodserv, p.est_f, p.grupo_prod, p.cod_prod' +
		' from produtos p' +
		' inner join pedvenda_prod pp on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and' +
		' p.cod_empresa = pp.cod_empresa' +
		' where pp.nped = '+IntToStr(pNPed)+
		' and pp.tipo = '+QuotedStr(pTipo)+
		' and pp.cod_empresa = ' + vDadosIni.codEmpresa;
	query.Open;

	query.First;
	while not query.Eof do
	begin

	vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    Trim(query.FieldByName('prodserv').AsString) + '|' +
    Trim(query.FieldByName('codigo').AsString) + '|' +
    Trim(query.FieldByName('num_fab_prod').AsString) + '|' +
    Trim(query.FieldByName('descr_prod').AsString) + '|' +
    Trim(query.FieldByName('unidade').AsString) + '|' +
		Trim(query.FieldByName('iat').AsString) + '|' +
		Trim(query.FieldByName('ippt').AsString) + '|' +
		Trim(query.FieldByName('sit_trib').AsString) + '|' +
    Trim(query.FieldByName('aliquota').AsString) + '|' +
    FloatToStr(vDadosIni.StrToFloatFormat(query.FieldByName('valor_unitario').AsFloat, 2)) + '|' +
    FloatToStr(vDadosIni.StrToFloatFormat(query.FieldByName('est_f').AsFloat, 3)) + '|'
  );

	query2.Close;
	query2.SQL.Text := 'update produtos set md5 = ' + QuotedStr( vTempMD5 ) +
		' where grupo_prod = ' + IntToStr(query.FieldByName('grupo_prod').AsInteger) +
		' and cod_prod = ' + QuotedStr(query.FieldByName('cod_prod').AsString) +
		' and cod_empresa = ' + vDadosIni.codEmpresa;
	query2.ExecSQL;

	query.Next
  end;

  if pCommit then
    if query.Transaction.InTransaction then
      query.Transaction.Commit;
end;

procedure TManutencaoAlteracoesArquivosPAF._gravaMD5_Produtos(query: TIBQuery;
  pGrupo: integer; pCodigo: string; pCommit: Boolean);
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select grupo_prod||cod_prod codigo, num_fab_prod, descr_prod, unidade,' +
    ' case when coalesce(arredondar_truncar, ''T'') = ''T'' then ''T'' else ''A'' end iat,' +
    ' case when coalesce(tipo_fab, ''T'') = ''T'' then ''T'' else ''P'' end ippt,' +
		' sit_trib, icm_prod aliquota, prec_tab_prod valor_unitario, ''P'' prodserv, est_f' +
		' from produtos where grupo_prod = ' + IntToStr(pGrupo) +
		' and cod_prod = ' + QuotedStr(pCodigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
	query.Open;

	vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    Trim(query.FieldByName('prodserv').AsString) + '|' +
    Trim(query.FieldByName('codigo').AsString) + '|' +
    Trim(query.FieldByName('num_fab_prod').AsString) + '|' +
    Trim(query.FieldByName('descr_prod').AsString) + '|' +
    Trim(query.FieldByName('unidade').AsString) + '|' +
		Trim(query.FieldByName('iat').AsString) + '|' +
		Trim(query.FieldByName('ippt').AsString) + '|' +
		Trim(query.FieldByName('sit_trib').AsString) + '|' +
    Trim(query.FieldByName('aliquota').AsString) + '|' +
    FloatToStr(vDadosIni.StrToFloatFormat(query.FieldByName('valor_unitario').AsFloat, 2)) + '|' +
    FloatToStr(vDadosIni.StrToFloatFormat(query.FieldByName('est_f').AsFloat, 3)) + '|'
  );

  query.Close;
  query.SQL.Text := 'update produtos set md5 = ' + QuotedStr( vTempMD5 ) +
    ' where grupo_prod = ' + IntToStr(pGrupo) +
    ' and cod_prod = ' + QuotedStr(pCodigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.ExecSQL;

  if pCommit then
    if query.Transaction.InTransaction then
      query.Transaction.Commit;
end;

procedure TManutencaoAlteracoesArquivosPAF._gravaMD5_RegistrosPAF(
  query: TIBQuery; pTextoAcript, pTabela, pWhere: string; pCampoMD5: string);
var
  vTempMD5: string;
begin

  try
    vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto( pTextoAcript );

    query.Close;
    query.SQL.Text := 'update ' + pTabela + ' set ' + pCampoMD5 + ' = ' + QuotedStr(vTempMD5) +
      ' where ' + pWhere;
    query.ExecSQL;

    if query.Transaction.InTransaction then
      query.Transaction.Commit;
  except
  end;
end;

procedure TManutencaoAlteracoesArquivosPAF._gravaMD5_Servicos(query: TIBQuery;
  pCodigo: integer; pCommit: Boolean);
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select cast(cod_servico as varchar(20)) codigo, cast(cod_servico as varchar(20)) num_fab_prod,' +
		' desc_servico descr_prod, ''UND'' unidade, ''T'' iat, ''P'' ippt, sit_trib, aliq_iss aliquota,' +
		' valor_servico valor_unitario, 0 est_f, ''S'' prodserv, md5 from tipo_servico' +
		' where cod_servico = ' +IntToStr(pCodigo) +
		' and coalesce(cod_empresa, ' +vDadosIni.codEmpresa +') = ' + vDadosIni.codEmpresa;
	query.Open;

	vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
		Trim(query.FieldByName('prodserv').AsString) + '|' +
		Trim(query.FieldByName('codigo').AsString) + '|' +
		Trim(query.FieldByName('num_fab_prod').AsString) + '|' +
		Trim(query.FieldByName('descr_prod').AsString) + '|' +
		Trim(query.FieldByName('unidade').AsString) + '|' +
		Trim(query.FieldByName('iat').AsString) + '|' +
		Trim(query.FieldByName('ippt').AsString) + '|' +
		Trim(query.FieldByName('sit_trib').AsString) + '|' +
    Trim(query.FieldByName('aliquota').AsString) + '|' +
    FloatToStr(vDadosIni.StrToFloatFormat(query.FieldByName('valor_unitario').AsFloat, 2)) + '|' +
    FloatToStr(vDadosIni.StrToFloatFormat(query.FieldByName('est_f').AsFloat, 3)) + '|'
  );

  query.Close;
  query.SQL.Text := 'update tipo_servico set md5 = '+QuotedStr(vTempMD5) +
    ' where cod_servico = ' +IntToStr(pCodigo) ;
  query.ExecSQL;

  if pCommit then
    if query.Transaction.InTransaction then
      query.Transaction.Commit;
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_Cupom(query: TIBQuery;
  pCupom, pCodTerminal, pRegistro: integer; pNSerieECF: string): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select nserieecf, ccf, cupom, valorcupom, status_cp, md5' +
    ' from cupom where cupom = ' +IntToStr(pCupom) +
    ' and cod_terminal = ' +IntToStr(pCodTerminal) +
    ' and registro = ' +IntToStr(pRegistro) +
    ' and nserieecf = '+QuotedStr(pNSerieECF) +
    ' and cod_empresa = '+vDadosIni.codEmpresa;
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    query.FieldByName('nserieecf').AsString + '|' +
    query.FieldByName('ccf').AsString + '|' +
    query.FieldByName('cupom').AsString + '|' +
    query.FieldByName('valorcupom').AsString + '|' +
    query.FieldByName('status_cp').AsString + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_Cupom2(query: TIBQuery;
  pCodTerminal, pRegistro, pnItem, pCupom, pOrdem: integer;
  pNumSerieECF: string): Boolean;
var
  vTempSql: string;
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select cod_terminal, nserieecf, cod_empresa,'+
    ' registro, nitem, cupom, ordem, ccf, grupo_prod, codbarra,'+
    ' cod_prod, prod_serv, quantidade, preco, total, descaliq,'+
    ' status_it, md5 from cupom2' +
    ' where cod_terminal = ' +IntToStr(pCodTerminal) +
    ' and nserieecf = ' +QuotedStr(pNumSerieECF) +
    ' and cod_empresa = ' +vDadosIni.codEmpresa +
    ' and registro = ' +IntToStr(pRegistro) +
    ' and nitem = ' +IntToStr(pnItem) +
    ' and cupom = ' +IntToStr(pCupom) +
    ' and ordem = ' +IntToStr(pOrdem);
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    query.FieldByName('nserieecf').AsString + '|' +
    query.FieldByName('cupom').AsString + '|' +
    query.FieldByName('ccf').AsString + '|' +
    query.FieldByName('grupo_prod').AsString + '|' +
    query.FieldByName('cod_prod').AsString + '|' +
    query.FieldByName('prod_serv').AsString + '|' +
    query.FieldByName('quantidade').AsString + '|' +
    query.FieldByName('preco').AsString + '|' +
    query.FieldByName('total').AsString + '|' +
    query.FieldByName('descaliq').AsString + '|' +
    query.FieldByName('status_it').AsString + '|' +
    query.FieldByName('codbarra').AsString + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_DAV(query: TIBQuery;
  pNumeroDAV: integer): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select ncupom, nprevenda, data_ped, data_fech, valor_total,' +
    ' operador, nserieecf, nome_clientedav, cpfcgc, coo_impressao, nseriecf_impressao, operador_impressao, md5' +
    ' from pedvenda where nprevenda = ' +IntToStr(pNumeroDAV) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    query.FieldByName('ncupom').AsString + '|' +
    query.FieldByName('nprevenda').AsString + '|' +
    query.FieldByName('data_ped').AsString + '|' +
    query.FieldByName('data_fech').AsString + '|' +
    query.FieldByName('valor_total').AsString + '|' +
    query.FieldByName('operador').AsString + '|' +
    query.FieldByName('nserieecf').AsString + '|' +
    query.FieldByName('nome_clientedav').AsString + '|' +
    query.FieldByName('cpfcgc').AsString + '|' +
    query.FieldByName('coo_impressao').AsString + '|' +
    query.FieldByName('nseriecf_impressao').AsString + '|' +
    query.FieldByName('operador_impressao').AsString + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_DAV_Itens(query: TIBQuery;
  pNumeroDAV: integer): Boolean;
var
  pNped, vCont: Integer;
  pTipo: string;
  vTempMD52, vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select nped, tipo, md52' +
    ' from pedvenda where nprevenda = ' +IntToStr(pNumeroDAV) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  pNPed := query.FieldByName('nped').AsInteger;
  pTipo := query.FieldByName('tipo').AsString;
  vTempMD52 := query.FieldByName('md52').AsString;

  query.Close;
  query.SQL.Text := 'select count(nped) contador from pedvenda_prod' +
    ' where nped = ' + IntToStr(pNPed) +
    ' and tipo = ' + QuotedStr(pTipo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  vCont := query.FieldByName('contador').AsInteger;

  query.Close;
  query.SQL.Text := 'select count(nped) contador from pedvenda_serv' +
    ' where nped = ' + IntToStr(pNPed) +
    ' and tipo = ' + QuotedStr(pTipo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  vCont := vCont + query.FieldByName('contador').AsInteger;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    IntToStr(pNPed) + '|' +
    Trim(pTipo) + '|' +
    vDadosIni.codEmpresa + '|' +
    IntToStr(vCont) + '|'
  );

  Result := Trim(vTempMD52) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_DAV_Produtos_Sevicos(
  query: TIBQuery; pNped: integer; pTipo: string; pPS: string; pGrupo: Integer;
  pCodProd: string; pGrade: Integer; pCodServico: Integer; pNItem: Integer): Boolean;
var
  vTempMD5: string;
begin

  Result := True;

  if pPS = 'P' then
  begin
    query.Close;
    query.SQL.Text := 'select data_inclusao, nitem, grupo_prod, cod_prod, num_fab_prod, descr_prod_ped,' +
      ' quant_ped_item, vlun_ped_item, vltot_ped_item, rateio_desc, rateio_acresc, status, md5' +
      ' from pedvenda_prod' +
      ' where nped = ' + IntToStr(pNped) +
      ' and tipo = ' + QuotedStr(pTipo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and grupo_prod = ' + IntToStr(pGrupo) +
      ' and cod_prod = ' + QuotedStr(pCodProd) +
      ' and nitem = ' + IntToStr(pNItem) +
      ' and cod_grade = ' + IntToStr(pGrade);
    query.Open;

    vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
      query.FieldByName('data_inclusao').AsString + '|' +
      query.FieldByName('nitem').AsString + '|' +
      query.FieldByName('grupo_prod').AsString + '|' +
      query.FieldByName('cod_prod').AsString + '|' +
      query.FieldByName('num_fab_prod').AsString + '|' +
      query.FieldByName('descr_prod_ped').AsString + '|' +
      query.FieldByName('quant_ped_item').AsString + '|' +
      query.FieldByName('vlun_ped_item').AsString + '|' +
      query.FieldByName('vltot_ped_item').AsString + '|' +
      query.FieldByName('rateio_desc').AsString + '|' +
      query.FieldByName('rateio_acresc').AsString + '|' +
      query.FieldByName('status').AsString + '|'
    );

    Result :=
      Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);

  end
  else if pPS = 'S' then
  begin
    query.Close;
    query.SQL.Text := 'select data_inclusao, nitem, cod_servico, quant_serv_ped, valor_un_serv, valor_tot_serv,' +
      ' desc_serv_ped, rateio_desc, rateio_acresc, status, md5' +
      ' from pedvenda_serv' +
      ' where nped = ' + IntToStr(pNped) +
      ' and tipo = ' + QuotedStr(pTipo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_servico = ' + IntToStr(pCodServico) +
      ' and nitem = ' + IntToStr(pNItem);
    query.Open;

    vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
      query.FieldByName('data_inclusao').AsString + '|' +
      query.FieldByName('nitem').AsString + '|' +
      query.FieldByName('cod_servico').AsString + '|' +
      query.FieldByName('quant_serv_ped').AsString + '|' +
      query.FieldByName('valor_un_serv').AsString + '|' +
      query.FieldByName('valor_tot_serv').AsString + '|' +
      query.FieldByName('desc_serv_ped').AsString + '|' +
      query.FieldByName('rateio_desc').AsString + '|' +
      query.FieldByName('rateio_acresc').AsString + '|' +
      query.FieldByName('status').AsString + '|'
    );

    Result :=
      Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);

  end;

end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_DetalhesReducaoZ(
  query: TIBQuery; pCOOReducao, pCodTerminal: integer; pNSerieECF,
  pDescAliq: string): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select nserieecf, descaliq, coored, md5 from mapa_resumo_aliq where coored = ' +IntToStr(pCOOReducao) +
    ' and cod_terminal = ' + IntToStr(pCodTerminal) +
    ' and nserieecf = ' + QuotedStr(pNSerieECF) +
    ' and descaliq = ' + QuotedStr(pDescAliq) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    query.FieldByName('nserieecf').AsString + '|' +
    query.FieldByName('descaliq').AsString + '|' +
    query.FieldByName('coored').AsString + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_DocNaoFiscal(
  query: TIBQuery; pCOODocumento, pCodTerminal: integer;
  pNSerieECF: string): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select nserieecf, coo_ecf, gnf_ecf, cdc_ecf, tipo_doc_ecf,' +
    ' data_f_emissao, md5 from doc_naofiscal_terminal where coo_ecf = ' +IntToStr(pCOODocumento) +
    ' and cod_terminal = ' + IntToStr(pCodTerminal) +
    ' and nserieecf = ' + QuotedStr(pNSerieECF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    query.FieldByName('nserieecf').AsString + '|' +
    query.FieldByName('coo_ecf').AsString + '|' +
    query.FieldByName('gnf_ecf').AsString + '|' +
    query.FieldByName('cdc_ecf').AsString + '|' +
    query.FieldByName('tipo_doc_ecf').AsString + '|' +
    query.FieldByName('data_f_emissao').AsString + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_EmpresaDes(query: TIBQuery;
  pCodigo: integer): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select cnpj_empdes, md5 from empdesvolv where cod_empdes = ' +IntToStr(pCodigo);
    //' and cod_empresa = '+vDadosIni.codEmpresa;
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    query.FieldByName('cnpj_empdes').AsString + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_EmpresaUsuaria(
  query: TIBQuery; pCodigo: integer): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select cgc_emp, md5 from empresa' +
    ' where cod_empresa = '+IntToStr(pCodigo);
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    query.FieldByName('cgc_emp').AsString + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_FinCupom(query: TIBQuery;
  pRegistro, pCodTerminal: integer; pNSerieECF: string): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select nserieecf, cupom, ccf_ecf, gnf_ecf, md5' +
    ' from fincupom where registro = ' +IntToStr(pRegistro) +
    ' and cod_terminal = ' + IntToStr(pCodTerminal) +
    ' and nserieecf = ' + QuotedStr(pNSerieECF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    query.FieldByName('nserieecf').AsString + '|' +
    query.FieldByName('cupom').AsString + '|' +
    query.FieldByName('ccf_ecf').AsString + '|' +
    query.FieldByName('gnf_ecf').AsString + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_Produtos(query: TIBQuery;
  pGrupo: integer; pCodigo: string): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select grupo_prod, cod_prod, num_fab_prod, descr_prod, est_f, est_r, data_ult_compra,' +
    ' tributacao, isento_prod, n_incidencia_prod, icm_prod, prec_tab_prod, md5 from produtos where grupo_prod = ' + IntToStr(pGrupo) +
    ' and cod_prod = ' + QuotedStr(pCodigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    Trim(query.FieldByName('grupo_prod').AsString) + '|' +
    Trim(query.FieldByName('cod_prod').AsString) + '|' +
    Trim(query.FieldByName('num_fab_prod').AsString) + '|' +
    Trim(query.FieldByName('descr_prod').AsString) + '|' +
    Trim(query.FieldByName('est_f').AsString) + '|' +
    Trim(query.FieldByName('est_r').AsString) + '|' +
    Trim(query.FieldByName('data_ult_compra').AsString) + '|' +
    Trim(query.FieldByName('tributacao').AsString) + '|' +
    Trim(query.FieldByName('isento_prod').AsString) + '|' +
    Trim(query.FieldByName('n_incidencia_prod').AsString) + '|' +
    Trim(query.FieldByName('prec_tab_prod').AsString) + '|' +
    Trim(query.FieldByName('icm_prod').AsString) + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_ReducaoZ(query: TIBQuery;
  pCOOReducao, pCodTerminal: integer; pNSerieECF, pDataMov: string): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select nserieecf, nreducoes, coored, cro_mov, data_mov,' +
    ' data_emissao_z, hora_emissao_z, vlvendab, md5 from resumod where coored = ' +IntToStr(pCOOReducao) +
    ' and cod_terminal = ' + IntToStr(pCodTerminal) +
    ' and nserieecf = ' + QuotedStr(pNSerieECF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    query.FieldByName('nserieecf').AsString + '|' +
    query.FieldByName('nreducoes').AsString + '|' +
    query.FieldByName('coored').AsString + '|' +
    query.FieldByName('cro_mov').AsString + '|' +
    query.FieldByName('data_mov').AsString + '|' +
    query.FieldByName('data_emissao_z').AsString + '|' +
    query.FieldByName('hora_emissao_z').AsString + '|' +
    query.FieldByName('vlvendab').AsString + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_registrosPAF(
  pTextoAvalidar, pTextoMD5: string): Boolean;
var
  vTempMD5: string;
begin
  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto( pTextoAvalidar );
  Result := Trim(pTextoMD5) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_Servicos(query: TIBQuery;
  pCodigo: integer): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select cod_servico, desc_servico, aliq_iss, isento_serv, n_incidencia_serv,' +
    ' md5 from tipo_servico where cod_servico = ' +IntToStr(pCodigo) ;
    //' and cod_empresa = '+vDadosIni.codEmpresa;
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    Trim(query.FieldByName('cod_servico').AsString) + '|' +
    Trim(query.FieldByName('desc_servico').AsString) + '|' +
    Trim(query.FieldByName('aliq_iss').AsString) + '|' +
    Trim(query.FieldByName('isento_serv').AsString) + '|' +
    Trim(query.FieldByName('n_incidencia_serv').AsString) + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TManutencaoAlteracoesArquivosPAF._validaMD5_TerminalImpressoras(
  query: TIBQuery; pCodigoTerminal: integer; pCNIEE,
  pNSerieECF: string): Boolean;
var
  vTempMD5: string;
begin
  query.Close;
  query.SQL.Text := 'select num_serie_ecf, data_alt_est_ecf, hora_alt_est_ecf, md5 from terminal_impressoras' +
    ' where ident_cniee = ' +QuotedStr(pCNIEE) +
    ' and cod_terminal = ' + IntToStr(pCodigoTerminal) +
    ' and num_serie_ecf = ' + QuotedStr(pNSerieECF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  query.Open;

  vTempMD5 := vDadosIni.Sign_RSA_MD5_SomenteTexto(
    Trim(query.FieldByName('num_serie_ecf').AsString) + '|' +
    Trim(query.FieldByName('data_alt_est_ecf').AsString) + '|' +
    Trim(query.FieldByName('hora_alt_est_ecf').AsString) + '|'
  );
  Result :=
    Trim(query.FieldByName('md5').AsString) = Trim(vTempMD5);
end;

function TDataSet_OOP.ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim,
  codemp: string; ativo: integer;
  CamposExibir, INNER_JOIN, CondicaoWHERE: string; CampoCodEmpresa: string = ''): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao, vDataI, vDataF, formatodata,horadataini,horadatafim: string;
begin
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos7';
  result := false;
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
        Campo := DataSet.Fields[I].FieldName;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        possuiCodEmpresa := true;
        if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
          fCampoCodEmpresa := CampoCodEmpresa
        else
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;

    if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
      formatodata := 'mm/dd/yyyy'
    else if pos('.', ShortDateFormat) <> 0 then
      formatodata := 'dd.mm.yyyy';

    if (pos(':', dataIni) <> 0) then
    begin
     horadataini := ' 00:00:00';
     horadatafim := ' 23:59:59';
     dataIni:= StringReplace(dataIni,':','',[rfReplaceAll]);
     dataFim := StringReplace(dataFim,':','',[rfReplaceAll]);
    end
    else
    begin
     horadataini := '';
     horadatafim := '';
    end;

    vDataI := StringReplace(dataIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(dataFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    if ((vDataI <> '      ') and (vDataI <> '        ')) or
      ((vDataF <> '      ') and (vDataF <> '        ')) then
    begin
      try
        if (CondicaoWHERE<>'') then
        CondicaoWHERE := CondicaoWHERE + ' and ';
        DataSet.Close;
        if (((vDataI <> '      ') and (vDataI <> '        ')) and
          ((vDataF <> '      ') and (vDataF <> '        '))) then
          condicao := ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, StrTodate(dataIni))+ horadataini)  + ' and ' + tabela + '.' + Campo +
            ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim))+ horadatafim)
        else if ((vDataI <> '      ') and (vDataI <> '        ')) then
          condicao := ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni))+ horadataini)
        else if ((vDataF <> '      ') and (vDataF <> '        ')) then
          condicao := ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim))+ horadatafim);

        if(CamposExibir = '') then
        DataSet.CommandText := 'select * from ' + tabela + ' ' + INNER_JOIN + ' ' + condicao
        else
        DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela + ' ' + INNER_JOIN + ' ' + condicao;

        if (possuiCodEmpresa) and (pos('where', dataSet.CommandText) > 0) then
        begin
          if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
            DataSet.CommandText := DataSet.CommandText + ' and ' + CampoCodEmpresa + ' = ' + codemp
          else
            DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp;
        end
        else if possuiCodEmpresa then
        begin
          if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
            DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + CampoCodEmpresa + ' = ' + codemp
          else
            DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp;
        end;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = ' + inttostr(ativo);

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        if (CamposExibir='') then
        DataSet.CommandText := 'select * from ' + tabela + ' ' + INNER_JOIN
        else
        DataSet.CommandText := 'select '+ CamposExibir +' from ' + tabela + ' ' + INNER_JOIN;

        if possuiAtivo and possuiCodEmpresa then
        begin
          if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
            DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + CampoCodEmpresa + ' = ' +
              codemp + ' and ' + tabela + '.' + 'ativo = ' + inttostr(ativo)
          else
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
              codemp + ' and ' + tabela + '.' + 'ativo = ' + inttostr(ativo);
        end
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + tabela + '.' + 'ativo = ' + inttostr(ativo)
        else if possuiCodEmpresa then
        begin
          if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
            DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + CampoCodEmpresa + ' = ' + codemp
          else
            DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp;
        end;
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCampos(tabela, valorConsulta, Campo, condicao,
  ordem: string; constante: boolean; codemp, CamposExibir,
  INNER_JOIN, CondicaoWHERE: string; CampoCodEmpresa: string = ''): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string; // F (Integer, Float); S String; D Data; I Indefinido
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
  CamposExibir := Trim(CamposExibir);
  valorConsulta := Trim(valorConsulta);
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos8';
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    result := false;
    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Maior ou Igual' then
          condicao := '>='
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Menor ou Igual' then
          condicao := '<='
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          begin
            valorConsulta := ajustar_consulta_incasesensitive(DataSet.Fields[I], tabela, valorConsulta);
            Campo := DataSet.Fields[I].FieldName;

            if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
              ordem := DataSet.Fields[I].FieldName;

            if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
            begin
              possuiCodEmpresa := true;
              if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
                fCampoCodEmpresa := CampoCodEmpresa
              else
              fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            end;
            if Dataset.Fields[I].FieldName = 'ATIVO' then
              possuiAtivo := true;

            if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              tipo := 'I'
            else if (Dataset.Fields[I] is TCurrencyField) or (Dataset.Fields[I] is TFloatField) then
              tipo := 'F'
            else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
              tipo := 'S'
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              tipo := 'D'
            else
              tipo := 'I';

            condicao := IfThen( MatchText(tipo, ['F', 'I']) and MatchText(condicao, ['like', 'Começa']), '=', condicao );

            break;
          end;
        end;
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
            possuiCodEmpresa := true;
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if tipo = 'I' then
        try
          strtoint(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end
        else if tipo = 'F' then
        try
          strtofloat(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end;

        DataSet.Close;

        if Campo <> 'Todos' then
          if CondicaoWHERE <> '' then
            CondicaoWHERE := CondicaoWHERE + ' and ';

        if Campo = 'Todos' then
          DataSet.CommandText := 'select ' + CamposExibir + ' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE
        else if (tipo = 'F') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE  + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '
            + INNER_JOIN + ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' '
              + condicao + ' ' + vDadosIni.trocaVirgulaPorPonto(valorConsulta);
        end
        else if (tipo = 'S') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
            ' where ' + CondicaoWHERE  + tabela + '.' + Campo + ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
            ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' ' + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
        begin
          if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
	          DataSet.CommandText := DataSet.CommandText + ' and ' + CampoCodEmpresa + ' = ' + codemp
          else
          DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.' + fCampoCodEmpresa + ' = ' + codemp;
        end;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.ativo = 1';

        if ordem = 'Todos' then
        begin
          if DataSet.Fields[0].Required then
          	ordem := DataSet.Fields[0].FieldName
          else
          begin
          	ordem := DataSet.Fields[0].FieldName;
            
            for I := 0 to DataSet.Fields.Count - 1 do
            begin
            	if DataSet.Fields[I].Required then
              begin
            		ordem := DataSet.Fields[I].FieldName;
                Break;
              end;
            end;
          end;
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        //Particularidade para a buscas de produtos
        if upperCase(Tabela) = 'PRODUTOS' then
        begin
          if (UpperCase(Campo) = 'NUM_FAB_PROD') or (Pos('NUM_FAB_PROD', CondicaoWHERE) > 0) then
          begin
          	if Pos('DISTINCT PRODUTOS.*', UpperCase(dataSet.CommandText)) > 0 then
            begin
              if Pos('PRODUTOS.NUM_FAB_PROD', UpperCase(dataSet.CommandText)) > 0 then
              	dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), 'PRODUTOS.NUM_FAB_PROD',
                	'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

              if Pos('* FROM PRODUTOS WHERE', UpperCase(dataSet.CommandText)) > 0 then
                dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), '* FROM PRODUTOS WHERE',
                    'distinct PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA from PRODUTOS,COD_BARRA where COD_BARRA.cod_prod = PRODUTOS.cod_prod AND COD_BARRA.grupo_prod = PRODUTOS.grupo_prod AND PRODUTOS.cod_empresa = COD_BARRA.cod_empresa and ',
                  [rfReplaceAll, rfIgnoreCase]);
            end
            else
            begin
            	if Pos(' GETESTOQUEDISPONIVEL ', UpperCase(dataSet.CommandText)) > 0 then
              begin
              	dataSet.CommandText := StringReplace(dataSet.CommandText, 'PRODUTOS.NUM_FAB_PROD',
	                'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

              	dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), ' ' + CamposExibir + ' FROM PRODUTOS ',
                  ' distinct PRODUTOS.*, EST.ESTOQUE, EST.EST_PRIMA from PRODUTOS ' +
                  ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
         	        ' ',
                  [rfReplaceAll, rfIgnoreCase]);
              end
              else if Pos('CAST(0 AS FLOAT) ESTOQUE', UpperCase(dataSet.CommandText)) > 0 then
            	begin
              	dataSet.CommandText := StringReplace(dataSet.CommandText, 'PRODUTOS.NUM_FAB_PROD',
	                'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

              	dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), ' ' + CamposExibir + ' FROM PRODUTOS ',
                  ' distinct PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA from PRODUTOS ' +
                  ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
                  ' ',
                  [rfReplaceAll, rfIgnoreCase]);
              end;
            end;
          end;
        end;

        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
            possuiCodEmpresa := true;
            if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
              fCampoCodEmpresa := CampoCodEmpresa
            else
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if ordem = 'Todos' then
        begin
        	if DataSet.Fields[0].Required then
          	ordem := DataSet.Fields[0].FieldName
          else
          begin
          	ordem := DataSet.Fields[0].FieldName;
            
            for I := 0 to DataSet.Fields.Count - 1 do
            begin
            	if DataSet.Fields[I].Required then
              begin
            		ordem := DataSet.Fields[I].FieldName;
                Break;
              end;
            end;
          end;
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.close;
        DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN;
        if CondicaoWHERE <> '' then
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE;

        if possuiCodEmpresa then
          if pos('WHERE', UpperCase(string(DataSet.CommandText))) > 0 then
          begin
            if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
              DataSet.CommandText := DataSet.CommandText + ' and ' + CampoCodEmpresa + ' = ' + codemp
          else
              DataSet.CommandText := DataSet.CommandText + ' and ' + tabela+'.' + fCampoCodEmpresa + ' = ' + codemp;
          end
          else
          begin
            if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
              DataSet.CommandText := DataSet.CommandText + ' where ' + CampoCodEmpresa + ' = ' + codemp
            else
            DataSet.CommandText := DataSet.CommandText + ' where ' + tabela+'.' + fCampoCodEmpresa + ' = ' + codemp;
          end;

       if possuiAtivo then
         if pos('WHERE', UpperCase(string(DataSet.CommandText))) > 0 then
           DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.ativo = 1'
         else
           DataSet.CommandText := DataSet.CommandText + ' where '+tabela+'.ativo = 1';
//        if CondicaoWHERE = '' then
//        DataSet.CommandText := DataSet.CommandText + ' where ' + tabela+'.' + fCampoCodEmpresa + ' = ' + codemp
//        else
//          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + ' and ' +tabela+'.' + fCampoCodEmpresa + ' = ' + codemp;
//        if possuiAtivo and possuiCodEmpresa then

//          DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.ativo = 1'
//        else if possuiAtivo then
//          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + ' and ' +tabela+'.ativo = 1';
        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    possuiCodEmpresa := false;
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCampos(pTabela1, pTabela2, valorConsulta, Campo,
  condicao, ordem: string; constante: boolean; codemp, CamposExibir, INNER_JOIN,
  CondicaoWHERE: string;pUpperCase:boolean=false): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string;
begin
	CamposExibir := Trim(CamposExibir);
  valorConsulta := Trim(valorConsulta);
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos9';
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    result := false;
    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Maior ou Igual' then
          condicao := '>='
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Menor ou Igual' then
          condicao := '<='
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          begin
            valorConsulta := ajustar_consulta_incasesensitive(DataSet.Fields[I], pTabela1, valorConsulta);
            Campo := DataSet.Fields[I].FieldName;

            if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
              ordem := DataSet.Fields[I].FieldName;

            if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
            begin
              possuiCodEmpresa := true;
              fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            end;
            if Dataset.Fields[I].FieldName = 'ATIVO' then
              possuiAtivo := true;

            if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              tipo := 'I'
            else if (Dataset.Fields[I] is TCurrencyField) or (Dataset.Fields[I] is TFloatField) then
              tipo := 'F'
            else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
              tipo := 'S'
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              tipo := 'D'
            else
              tipo := 'I';

            condicao := IfThen( MatchText(tipo, ['F', 'I']) and MatchText(condicao, ['like', 'Começa']), '=', condicao );

            break;
          end;
        end;
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
            possuiCodEmpresa := true;
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if tipo = 'I' then
        try
          strtoint(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end
        else if tipo = 'F' then
        try
          strtofloat(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end;

        DataSet.Close;

        if CondicaoWHERE <> '' then
          CondicaoWHERE := CondicaoWHERE + ' and ';

        if (tipo = 'F') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + pTabela1 +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE + pTabela2 + '.' + Campo +
              ' like ' +
              QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + pTabela1 +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE  + pTabela2 + '.' + Campo +
              ' like ' +
              QuotedStr(vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else
            DataSet.CommandText := 'select '+CamposExibir+' from ' + pTabela1 +' '
            + INNER_JOIN + ' where ' + CondicaoWHERE + pTabela2 + '.' + Campo + ' '
              + condicao + ' ' + vDadosIni.trocaVirgulaPorPonto(valorConsulta);
        end
        else if (tipo = 'S') then
        begin
          if condicao = 'like' then
          begin
            if pUpperCase then
              DataSet.CommandText := 'select '+CamposExibir+' from ' + pTabela1 +' '+ INNER_JOIN +
              ' where ' + CondicaoWHERE +'upper('+ pTabela2 +'.'+ Campo + ') like ' +
              QuotedStr('%' + valorConsulta + '%')
            else DataSet.CommandText := 'select '+CamposExibir+' from ' + pTabela1 +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE + pTabela2 +'.'+ Campo + ' like ' +
              QuotedStr('%' + valorConsulta + '%');
          end
          else if condicao = 'Começa' then
          begin
            if pUpperCase then
              DataSet.CommandText := 'select '+CamposExibir+' from ' + pTabela1 +' '+ INNER_JOIN +
            ' where ' + CondicaoWHERE  +'upper('+ pTabela2 +'.'+ Campo + ') like ' +
              QuotedStr(valorConsulta + '%')
            else DataSet.CommandText := 'select '+CamposExibir+' from ' + pTabela1 +' '+ INNER_JOIN +
            ' where ' + CondicaoWHERE  + pTabela2 +'.'+ Campo + ' like ' +
              QuotedStr(valorConsulta + '%');
          end
          else begin
            if pUpperCase then
              DataSet.CommandText := 'select '+CamposExibir+' from ' + pTabela1 +' '+ INNER_JOIN +
              ' where ' + CondicaoWHERE +'upper('+ pTabela2 +'.'+ Campo + ') ' + condicao +
              ' ' + QuotedStr(valorConsulta)
            else DataSet.CommandText := 'select '+CamposExibir+' from ' + pTabela1 +' '+ INNER_JOIN +
            ' where ' + CondicaoWHERE + pTabela2 +'.'+ Campo + ' ' + condicao +
              ' ' + QuotedStr(valorConsulta);
          end;
        end;

        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and '+pTabela1+'.' + fCampoCodEmpresa + ' = ' + codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and '+pTabela1+'.ativo = 1';

        DataSet.CommandText := DataSet.CommandText + ' order by ' + pTabela2 +'.'+ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
            possuiCodEmpresa := true;
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        DataSet.close;
        DataSet.CommandText := 'select '+CamposExibir+' from ' + pTabela1 +' '+ INNER_JOIN;
        if possuiCodEmpresa then
        if CondicaoWHERE = '' then
        DataSet.CommandText := DataSet.CommandText + ' where ' + pTabela1+'.' + fCampoCodEmpresa + ' = ' + codemp
        else
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + ' and ' +pTabela1+'.' + fCampoCodEmpresa + ' = ' + codemp;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and '+pTabela1+'.ativo = 1'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + ' and ' +pTabela1+'.ativo = 1';
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    possuiCodEmpresa := false;
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCamposLixeira(tabela, Campo, ordem, dataIni,
  dataFim, sqlAdicional, codemp: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao, vDataI, vDataF, formatodata: string;
  vSqlAdicional: string;
begin
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos2';
  result := false;
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    vSqlAdicional := '';
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
        Campo := DataSet.Fields[I].FieldName;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        if Trim(UpperCase(tabela)) <> 'TIPO_SERVICO' then
          possuiCodEmpresa := True
        else
          vSqlAdicional := ' and ((cod_empresa = ' + vDadosIni.codEmpresa + ') or (coalesce(cod_empresa, 0) = 0))';
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;

    if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
      formatodata := 'mm/dd/yyyy'
    else if pos('.', ShortDateFormat) <> 0 then
      formatodata := 'dd.mm.yyyy';

    vDataI := StringReplace(dataIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(dataFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    if ((vDataI <> '      ') and (vDataI <> '        ')) or
      ((vDataF <> '      ') and (vDataF <> '        ')) then
    begin
      try
        DataSet.Close;
        if (((vDataI <> '      ') and (vDataI <> '        ')) and
          ((vDataF <> '      ') and (vDataF <> '        '))) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni))) + ' and ' + tabela + '.' + Campo +
            ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim))
        else if ((vDataI <> '      ') and (vDataI <> '        ')) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni)))
        else if ((vDataF <> '      ') and (vDataF <> '        ')) then
          condicao := ' where ' + tabela + '.' + Campo + ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim));
        DataSet.CommandText := 'select * from ' + tabela + condicao;
        if (possuiCodEmpresa) and (pos('where', dataSet.CommandText) > 0) then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 0';
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + vSqlAdicional + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp + ' and ' + tabela + '.' + 'ativo = 1'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'ativo = 0'
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + vSqlAdicional + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCamposLixeira(tabela, valorConsulta, Campo,
  condicao, ordem, sqlAdicional: string; constante: boolean;
  codemp: string): boolean;
var
  //Para evitar possíveis erros em centenças SQL sqladicional
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string;
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
	valorConsulta := Trim(valorConsulta);
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos3';
  try
    result := false;
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
      begin
        valorConsulta := ajustar_consulta_incasesensitive(DataSet.Fields[I], tabela, valorConsulta);
        Campo := DataSet.Fields[I].FieldName;
        //        if (Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
        //          (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField) then
        //          tipo := 'F'
        if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
          tipo := 'I'
        else if (Dataset.Fields[I] is TCurrencyField) or (Dataset.Fields[I] is TFloatField) then
          tipo := 'F'
        else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
          tipo := 'S'
        else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          tipo := 'D'
        else
          tipo := 'I';
      end;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        possuiCodEmpresa := true;
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
    end;

    if ordem = 'Todos' then
    begin
      if DataSet.Fields[0].Required then
        ordem := DataSet.Fields[0].FieldName
      else
      begin
        ordem := DataSet.Fields[0].FieldName;

        for I := 0 to DataSet.Fields.Count - 1 do
        begin
          if DataSet.Fields[I].Required then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;
        end;
      end;
    end;

    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Maior ou Igual' then
          condicao := '>='
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Menor ou Igual' then
          condicao := '<='
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';

        condicao := IfThen( MatchText(tipo, ['F', 'I']) and MatchText(condicao, ['like', 'Começa']), '=', condicao );

        if tipo = 'I' then
        try
          strtoint(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end
        else if tipo = 'F' then
        try
          strtofloat(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end;

        DataSet.Close;
        if (tipo = 'F') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
              + condicao + ' ' + vDadosIni.trocaVirgulaPorPonto(valorConsulta);
        end
        else if (tipo = 'S') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
              + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 0';

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        //Particularidade para a buscas de produtos
        if upperCase(Tabela) = 'PRODUTOS' then
        begin
          if UpperCase(Campo) = 'NUM_FAB_PROD' then
          begin
          	if Pos('PRODUTOS.NUM_FAB_PROD', UpperCase(dataSet.CommandText)) > 0 then
              dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), 'PRODUTOS.NUM_FAB_PROD',
                'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

            if Pos('* FROM PRODUTOS WHERE', UpperCase(dataSet.CommandText)) > 0 then
              dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), '* FROM PRODUTOS WHERE',
                'distinct(PRODUTOS.*) from PRODUTOS,COD_BARRA where COD_BARRA.cod_prod = PRODUTOS.cod_prod AND COD_BARRA.grupo_prod = PRODUTOS.grupo_prod AND PRODUTOS.cod_empresa = COD_BARRA.cod_empresa and ',
                [rfReplaceAll, rfIgnoreCase]);
          end;
        end;

        //Particularidade para a buscas de vendas
        if upperCase(Tabela) = 'PEDVENDA' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from pedvenda',
            'pedvenda.*,clientes.nome_cliente from pedvenda inner join clientes on pedvenda.cod_cliente=clientes.cod_cliente ' +
            'and pedvenda.cod_empresa=clientes.cod_empresa', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'pedvenda.nome_cliente',
            'clientes.nome_cliente', [rfReplaceAll, rfIgnoreCase]);
        end
        //Particularidades para buscas de lancamentos
        else if upperCase(Tabela) = 'LANCAMENTOS' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from lancamentos',
            'lancamentos.*, controles.nome_ctrl from lancamentos' +
            ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and' +
            ' lancamentos.codigo_emp = controles.codigo_emp', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'lancamentos.nome_ctrl',
            'controles.nome_ctrl', [rfReplaceAll, rfIgnoreCase]);
//          if campo = 'Todos' then
//            dataset.commandText:=dataset.commandText+' order by cod_lanc ';
        end;
        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where  ' + tabela + '.' + fCampoCodEmpresa + ' = '
            + codemp;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + 'ativo = 0'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'ativo = 0';

        //Particularidade para a buscas de vendas
        if upperCase(Tabela) = 'PEDVENDA' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from pedvenda',
            'pedvenda.*,clientes.nome_cliente from pedvenda inner join clientes on pedvenda.cod_cliente=clientes.cod_cliente ' +
            'and pedvenda.cod_empresa=clientes.cod_empresa', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'pedvenda.nome_cliente',
            'clientes.nome_cliente', [rfReplaceAll, rfIgnoreCase]);
        end
        //Particularidades para buscas de lancamentos
        else if upperCase(Tabela) = 'LANCAMENTOS' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from lancamentos',
            'lancamentos.*, controles.nome_ctrl from lancamentos' +
            ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and' +
            ' lancamentos.codigo_emp = controles.codigo_emp', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'lancamentos.nome_ctrl',
            'controles.nome_ctrl', [rfReplaceAll, rfIgnoreCase]);
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        dataSet.CommandText := dataSet.CommandText + ' order by ' + ordem;

        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    //    possuiCodEmpresa := false;
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCamposOutrasEmp(tabela, valorConsulta, Campo,
  condicao, ordem: string; constante: boolean; codemp, CamposExibir, INNER_JOIN,
  CondicaoWHERE: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string; // F (Integer, Float); S String; D Data; I Indefinido
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
  CamposExibir := Trim(CamposExibir);
  valorConsulta := Trim(valorConsulta);
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCamposOutrasEmp4';
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    result := false;
    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Maior ou Igual' then
          condicao := '>='
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Menor ou Igual' then
          condicao := '<='
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          begin
            valorConsulta := ajustar_consulta_incasesensitive(DataSet.Fields[I], tabela, valorConsulta);
            Campo := DataSet.Fields[I].FieldName;

            if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
              ordem := DataSet.Fields[I].FieldName;

            if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
            begin
              possuiCodEmpresa := true;
              fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            end;
            if Dataset.Fields[I].FieldName = 'ATIVO' then
              possuiAtivo := true;

            if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              tipo := 'I'
            else if (Dataset.Fields[I] is TCurrencyField) or (Dataset.Fields[I] is TFloatField) then
              tipo := 'F'
            else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
              tipo := 'S'
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              tipo := 'D'
            else
              tipo := 'I';

            condicao := IfThen( MatchText(tipo, ['F', 'I']) and MatchText(condicao, ['like', 'Começa']), '=', condicao );

            break;
          end;
        end;
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
            possuiCodEmpresa := true;
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if tipo = 'I' then
        try
          strtoint(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end
        else if tipo = 'F' then
        try
          strtofloat(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end;

        DataSet.Close;

        if Campo <> 'Todos' then
          if CondicaoWHERE <> '' then
            CondicaoWHERE := CondicaoWHERE + ' and ';

        if Campo = 'Todos' then
          DataSet.CommandText := 'select ' + CamposExibir + ' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE
        else if (tipo = 'F') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE  + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '
            + INNER_JOIN + ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' '
              + condicao + ' ' + vDadosIni.trocaVirgulaPorPonto(valorConsulta);
        end
        else if (tipo = 'S') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
            ' where ' + CondicaoWHERE  + tabela + '.' + Campo + ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
            ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' ' + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.' + fCampoCodEmpresa + ' <> ' + codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.ativo = 1';

        if ordem = 'Todos' then
        begin
          if DataSet.Fields[0].Required then
          	ordem := DataSet.Fields[0].FieldName
          else
          begin
          	ordem := DataSet.Fields[0].FieldName;
            
            for I := 0 to DataSet.Fields.Count - 1 do
            begin
            	if DataSet.Fields[I].Required then
              begin
            		ordem := DataSet.Fields[I].FieldName;
                Break;
              end;
            end;
          end;
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        //Particularidade para a buscas de produtos
        if upperCase(Tabela) = 'PRODUTOS' then
        begin
          if (UpperCase(Campo) = 'NUM_FAB_PROD') or (Pos('NUM_FAB_PROD', CondicaoWHERE) > 0) then
          begin
          	if Pos('DISTINCT PRODUTOS.*', UpperCase(dataSet.CommandText)) > 0 then
            begin
              if Pos('PRODUTOS.NUM_FAB_PROD', UpperCase(dataSet.CommandText)) > 0 then
              	dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), 'PRODUTOS.NUM_FAB_PROD',
                	'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

              if Pos('* FROM PRODUTOS WHERE', UpperCase(dataSet.CommandText)) > 0 then
                dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), '* FROM PRODUTOS WHERE',
                    'distinct PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA from PRODUTOS,COD_BARRA where COD_BARRA.cod_prod = PRODUTOS.cod_prod AND COD_BARRA.grupo_prod = PRODUTOS.grupo_prod AND PRODUTOS.cod_empresa = COD_BARRA.cod_empresa and ',
                  [rfReplaceAll, rfIgnoreCase]);
            end
            else
            begin
            	if Pos(' GETESTOQUEDISPONIVEL ', UpperCase(dataSet.CommandText)) > 0 then
              begin
              	dataSet.CommandText := StringReplace(dataSet.CommandText, 'PRODUTOS.NUM_FAB_PROD',
	                'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

              	dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), ' ' + CamposExibir + ' FROM PRODUTOS ',
                  ' distinct PRODUTOS.*, EST.ESTOQUE, EST.EST_PRIMA from PRODUTOS ' +
                  ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
         	        ' ',
                  [rfReplaceAll, rfIgnoreCase]);
              end
              else if Pos('CAST(0 AS FLOAT) ESTOQUE', UpperCase(dataSet.CommandText)) > 0 then
            	begin
              	dataSet.CommandText := StringReplace(dataSet.CommandText, 'PRODUTOS.NUM_FAB_PROD',
	                'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

              	dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), ' ' + CamposExibir + ' FROM PRODUTOS ',
                  ' distinct PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA from PRODUTOS ' +
                  ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
                  ' ',
                  [rfReplaceAll, rfIgnoreCase]);
              end;
            end;
          end;
        end;

        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
            possuiCodEmpresa := true;
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if ordem = 'Todos' then
        begin
          if DataSet.Fields[0].Required then
          	ordem := DataSet.Fields[0].FieldName
          else
          begin
          	ordem := DataSet.Fields[0].FieldName;
            
            for I := 0 to DataSet.Fields.Count - 1 do
            begin
            	if DataSet.Fields[I].Required then
              begin
            		ordem := DataSet.Fields[I].FieldName;
                Break;
              end;
            end;
          end;
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.close;
        DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN;
        if CondicaoWHERE <> '' then
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE;

        if possuiCodEmpresa then
          if pos('WHERE', UpperCase(string(DataSet.CommandText))) > 0 then
            DataSet.CommandText := DataSet.CommandText + ' and ' + tabela+'.' + fCampoCodEmpresa + ' <> ' + codemp
          else
            DataSet.CommandText := DataSet.CommandText + ' where ' + tabela+'.' + fCampoCodEmpresa + ' <> ' + codemp;

       if possuiAtivo then
         if pos('WHERE', UpperCase(string(DataSet.CommandText))) > 0 then
           DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.ativo = 1'
         else
           DataSet.CommandText := DataSet.CommandText + ' where '+tabela+'.ativo = 1';
//        if CondicaoWHERE = '' then
//        DataSet.CommandText := DataSet.CommandText + ' where ' + tabela+'.' + fCampoCodEmpresa + ' = ' + codemp
//        else
//          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + ' and ' +tabela+'.' + fCampoCodEmpresa + ' = ' + codemp;
//        if possuiAtivo and possuiCodEmpresa then

//          DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.ativo = 1'
//        else if possuiAtivo then
//          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + ' and ' +tabela+'.ativo = 1';
        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    possuiCodEmpresa := false;
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCamposOutrasEmp(tabela, Campo, ordem, dataIni,
  dataFim, codemp: string; ativo: integer; CamposExibir, INNER_JOIN,
  CondicaoWHERE: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao, vDataI, vDataF, formatodata,horadataini,horadatafim: string;
begin
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCamposOutrasEmp3';
  result := false;
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
        Campo := DataSet.Fields[I].FieldName;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        possuiCodEmpresa := true;
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;


    if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
      formatodata := 'mm/dd/yyyy'
    else if pos('.', ShortDateFormat) <> 0 then
      formatodata := 'dd.mm.yyyy';

    if (pos(':', dataIni) <> 0) then
    begin
     horadataini := ' 00:00:00';
     horadatafim := ' 23:59:59';
     dataIni:= StringReplace(dataIni,':','',[rfReplaceAll]);
     dataFim := StringReplace(dataFim,':','',[rfReplaceAll]);
    end
    else
    begin
     horadataini := '';
     horadatafim := '';
    end;

    vDataI := StringReplace(dataIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(dataFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    if ((vDataI <> '      ') and (vDataI <> '        ')) or
      ((vDataF <> '      ') and (vDataF <> '        ')) then
    begin
      try
        if (CondicaoWHERE<>'') then
        CondicaoWHERE := CondicaoWHERE + ' and ';
        DataSet.Close;
        if (((vDataI <> '      ') and (vDataI <> '        ')) and
          ((vDataF <> '      ') and (vDataF <> '        '))) then
          condicao := ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, StrTodate(dataIni))+ horadataini)  + ' and ' + tabela + '.' + Campo +
            ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim))+ horadatafim)
        else if ((vDataI <> '      ') and (vDataI <> '        ')) then
          condicao := ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni))+ horadataini)
        else if ((vDataF <> '      ') and (vDataF <> '        ')) then
          condicao := ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim))+ horadatafim);

        if(CamposExibir = '') then
        DataSet.CommandText := 'select * from ' + tabela + ' ' + INNER_JOIN + ' ' + condicao
        else
        DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela + ' ' + INNER_JOIN + ' ' + condicao;

        if (possuiCodEmpresa) and (pos('where', dataSet.CommandText) > 0) then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' <> ' + codemp
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + tabela + '.' + fCampoCodEmpresa + ' <> ' +
            codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = ' + inttostr(ativo);

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        if (CamposExibir='') then
        DataSet.CommandText := 'select * from ' + tabela + ' ' + INNER_JOIN
        else
        DataSet.CommandText := 'select '+ CamposExibir +' from ' + tabela + ' ' + INNER_JOIN;

        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + tabela + '.' + fCampoCodEmpresa + ' <> ' +
            codemp + ' and ' + tabela + '.' + 'ativo = ' + inttostr(ativo)
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + tabela + '.' + 'ativo = ' + inttostr(ativo)
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + tabela + '.' + fCampoCodEmpresa + ' <> ' +
            codemp;
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCamposOutrasEmp(tabela, valorConsulta, Campo,
  condicao, ordem, sqlAdicional: string; constante: boolean;
  codemp: string): boolean;
var
  //Para evitar possíveis erros em centenças SQL sqladicional
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string;
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
  valorConsulta := Trim(valorConsulta);
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCamposOutrasEmp1';
  try
    result := false;
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
      begin
        valorConsulta := ajustar_consulta_incasesensitive(DataSet.Fields[I], tabela, valorConsulta);
        Campo := DataSet.Fields[I].FieldName;
        //        if (Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
        //          (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField) then
        //          tipo := 'F'
        if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
          tipo := 'I'
        else if (Dataset.Fields[I] is TCurrencyField) or (Dataset.Fields[I] is TFloatField) then
          tipo := 'F'
        else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
          tipo := 'S'
        else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          tipo := 'D'
        else
          tipo := 'I';
      end;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        possuiCodEmpresa := true;
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
    end;
    
    if ordem = 'Todos' then
    begin
      if DataSet.Fields[0].Required then
        ordem := DataSet.Fields[0].FieldName
      else
      begin
        ordem := DataSet.Fields[0].FieldName;

        for I := 0 to DataSet.Fields.Count - 1 do
        begin
          if DataSet.Fields[I].Required then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;
        end;
      end;
    end;

    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Maior ou Igual' then
          condicao := '>='
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Menor ou Igual' then
          condicao := '<='
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';

        condicao := IfThen( MatchText(tipo, ['F', 'I']) and MatchText(condicao, ['like', 'Começa']), '=', condicao );

        if tipo = 'I' then
        try
          strtoint(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end
        else if tipo = 'F' then
        try
          strtofloat(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end;

        DataSet.Close;
        if (tipo = 'F') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
              + condicao + ' ' + vDadosIni.trocaVirgulaPorPonto(valorConsulta);
        end
        else if (tipo = 'S') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
              + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' <> ' +
            codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 1';

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        //Particularidade para a buscas de produtos
        if upperCase(Tabela) = 'PRODUTOS' then
        begin
          if UpperCase(Campo) = 'NUM_FAB_PROD' then
          begin
      			if Pos('PRODUTOS.NUM_FAB_PROD', UpperCase(dataSet.CommandText)) > 0 then
              dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), 'PRODUTOS.NUM_FAB_PROD',
                'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

            if Pos('* FROM PRODUTOS WHERE', UpperCase(dataSet.CommandText)) > 0 then
              dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), '* FROM PRODUTOS WHERE',
                'distinct(PRODUTOS.*) from PRODUTOS,COD_BARRA where COD_BARRA.cod_prod = PRODUTOS.cod_prod AND COD_BARRA.grupo_prod = PRODUTOS.grupo_prod AND PRODUTOS.cod_empresa = COD_BARRA.cod_empresa and ',
                [rfReplaceAll, rfIgnoreCase]);
          end;
        end;

        //Particularidade para a buscas de vendas
        if upperCase(Tabela) = 'PEDVENDA' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from pedvenda',
            'pedvenda.*,clientes.nome_cliente from pedvenda inner join clientes on pedvenda.cod_cliente=clientes.cod_cliente ' +
            'and pedvenda.cod_empresa=clientes.cod_empresa', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'pedvenda.nome_cliente',
            'clientes.nome_cliente', [rfReplaceAll, rfIgnoreCase]);
        end
        //Particularidades para buscas de lancamentos
        else if upperCase(Tabela) = 'LANCAMENTOS' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from lancamentos',
            'lancamentos.*, controles.nome_ctrl from lancamentos' +
            ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and' +
            ' lancamentos.codigo_emp = controles.codigo_emp', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'lancamentos.nome_ctrl',
            'controles.nome_ctrl', [rfReplaceAll, rfIgnoreCase]);
//          if campo = 'Todos' then
//            dataset.commandText:=dataset.commandText+' order by cod_lanc ';
        end;
        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where  ' + tabela + '.' + fCampoCodEmpresa + ' <> '
            + codemp;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + 'ativo = 1'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'ativo = 1';

        //Particularidade para a buscas de vendas
        if upperCase(Tabela) = 'PEDVENDA' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from pedvenda',
            'pedvenda.*,clientes.nome_cliente from pedvenda inner join clientes on pedvenda.cod_cliente=clientes.cod_cliente ' +
            'and pedvenda.cod_empresa=clientes.cod_empresa', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'pedvenda.nome_cliente',
            'clientes.nome_cliente', [rfReplaceAll, rfIgnoreCase]);
        end
        //Particularidades para buscas de lancamentos
        else if upperCase(Tabela) = 'LANCAMENTOS' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from lancamentos',
            'lancamentos.*, controles.nome_ctrl from lancamentos' +
            ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and' +
            ' lancamentos.codigo_emp = controles.codigo_emp', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'lancamentos.nome_ctrl',
            'controles.nome_ctrl', [rfReplaceAll, rfIgnoreCase]);
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        dataSet.CommandText := dataSet.CommandText + ' order by ' + ordem;

        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    //    possuiCodEmpresa := false;
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCamposOutrasEmp(tabela, Campo, ordem, dataIni,
  dataFim, sqlAdicional, codemp: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao, vDataI, vDataF, formatodata: string;
begin
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCamposOutrasEmp2';
  result := false;
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
        Campo := DataSet.Fields[I].FieldName;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        possuiCodEmpresa := true;
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;
    if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
      formatodata := 'mm/dd/yyyy'
    else if pos('.', ShortDateFormat) <> 0 then
      formatodata := 'dd.mm.yyyy';

    vDataI := StringReplace(dataIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(dataFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    if ((vDataI <> '      ') and (vDataI <> '        ')) or
      ((vDataF <> '      ') and (vDataF <> '        ')) then
    begin
      try
        DataSet.Close;
        if (((vDataI <> '      ') and (vDataI <> '        ')) and
          ((vDataF <> '      ') and (vDataF <> '        '))) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni))) + ' and ' + tabela + '.' + Campo +
            ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim))
        else if ((vDataI <> '      ') and (vDataI <> '        ')) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni)))
        else if ((vDataF <> '      ') and (vDataF <> '        ')) then
          condicao := ' where ' +  tabela + '.' + Campo + ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim));
        DataSet.CommandText := 'select * from ' + tabela + condicao;
        if (possuiCodEmpresa) and (pos('where', dataSet.CommandText) > 0) then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' <> ' + codemp
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' <> ' +
            codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 1';
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        //Particularidade para a buscas de vendas
        if upperCase(Tabela) = 'PEDVENDA' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from pedvenda',
            'pedvenda.*,clientes.nome_cliente from pedvenda inner join clientes on pedvenda.cod_cliente=clientes.cod_cliente ' +
            'and pedvenda.cod_empresa=clientes.cod_empresa', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'pedvenda.nome_cliente',
            'clientes.nome_cliente', [rfReplaceAll, rfIgnoreCase]);
        end
          //Particularidades para buscas de lancamentos
          else if upperCase(Tabela) = 'LANCAMENTOS' then
          begin
            dataSet.CommandText := StringReplace(dataSet.CommandText, '* from lancamentos',
              'lancamentos.*, controles.nome_ctrl from lancamentos' +
              ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and' +
              ' lancamentos.codigo_emp = controles.codigo_emp', [rfIgnoreCase]);
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'lancamentos.nome_ctrl',
              'controles.nome_ctrl', [rfReplaceAll, rfIgnoreCase]);
          end;
        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' <> ' + codemp
            + ' and ' + tabela + '.' + 'ativo = 1'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.ativo = 1'
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' <> ' +
            codemp;
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;

        //Particularidade para a buscas de vendas
        if upperCase(Tabela) = 'PEDVENDA' then
        begin
          dataSet.CommandText := StringReplace(dataSet.CommandText, '* from pedvenda',
            'pedvenda.*,clientes.nome_cliente from pedvenda inner join clientes on pedvenda.cod_cliente=clientes.cod_cliente ' +
            'and pedvenda.cod_empresa=clientes.cod_empresa', [rfIgnoreCase]);
          dataSet.CommandText := StringReplace(dataSet.CommandText, 'pedvenda.nome_cliente',
            'clientes.nome_cliente', [rfReplaceAll, rfIgnoreCase]);
        end
          //Particularidades para buscas de lancamentos
          else if upperCase(Tabela) = 'LANCAMENTOS' then
          begin
            dataSet.CommandText := StringReplace(dataSet.CommandText, '* from lancamentos',
              'lancamentos.*, controles.nome_ctrl from lancamentos' +
              ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and' +
              ' lancamentos.codigo_emp = controles.codigo_emp', [rfIgnoreCase]);
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'lancamentos.nome_ctrl',
              'controles.nome_ctrl', [rfReplaceAll, rfIgnoreCase]);
          end;
        if sqlAdicional <> '' then
          if pos('ORDER BY', upperCase(dataSet.CommandText)) > 0 then
            dataSet.CommandText := StringReplace(dataSet.CommandText, 'order by', sqlAdicional +
              ' order by ', [rfReplaceAll, rfIgnoreCase])
          else
            dataSet.CommandText := dataSet.CommandText + sqlAdicional;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    FlogStore.started := False;
  end;
end;

{ TDadosLookUp_OOP }

procedure TDadosLookUp_OOP.aplicarFilter;
var
  I: Integer;
  vFilter: string;
  vAt1, vAt2: string;
begin
  if Trim(fDBEdit.Text) = '' then
  begin
    fDataSet.Filtered := False;
    fDataSet.Filter := '';
  end
  else
  begin

    vFilter := '';
    fDataSet.Filtered := True;
    if fFilter <> '' then
      vFilter := fFilter + ' like ''' + fFilterCondicao + fDBEdit.Text + '%'''
    else
    begin
      for I := 0 to fDataSet.Fields.Count  - 1 do
        if fDataSet.Fields[I] is TStringField then
          if vFilter = '' then
            vFilter := fDataSet.Fields[I].FieldName + ' like ''' + fFilterCondicao  + fDBEdit.Text + '%'''
          else
            vFilter := vFilter + ' or ' + fDataSet.Fields[I].FieldName + ' like ''' + fFilterCondicao + fDBEdit.Text + '%''';
    end;
    fDataSet.Filter := vFilter;//'nome_cidade like ''G%''';//vFilter;
  end;
  if fFilter = '' then
    vAt1 := '- Todos os campos'
  else
    vAt1 := '- Um campo';
  if fFilterCondicao = '' then
    vAt2 := '- Começa'
  else
    vAt2 := '- Esta contido';

  fDBgrid.Hint := 'F7 para alternar o filtro entre um campo ou todos ' + vAt1 + #13 +
                  'F8 para alternar o filtro entre começa e esta contido ' + vAt2;
end;

procedure TDadosLookUp_OOP.ClientDataSetAfterRefresh(DataSet: TDataSet);
var
  I: Integer;
begin
  try
    if fDBEdit.DataSource.DataSet.State in [dsEdit, dsInsert] then
      for I := 0 to Length(fTarget) - 1 do
        if Trim(fTarget[I]) <> '' then
          if fDBEdit.DataSource.DataSet.FindField(Trim(fTarget[I])) <> nil then
            fDBEdit.DataSource.DataSet.FieldByName(Trim(fTarget[I])).Value := fValues[I];
  except
  end;
end;

procedure TDadosLookUp_OOP.ClientDataSetAfterScroll(DataSet: TDataSet);
var
  I: Integer;
begin
  if fDataSet = nil then
    Exit;

  for I := 0 to Length(fSource) - 1 do
    if fDataSet.FindField(UpperCase(Trim(fSource[I]))) <> nil then
      fValues[I] := fDataSet.FindField(UpperCase(Trim(fSource[I]))).Value;
end;

constructor TDadosLookUp_OOP.create;
begin
  fNoChange := False;
  fPrimeiraEntrada := True;
  fVoltarAoSair := True;
end;

procedure TDadosLookUp_OOP.DBEditChange(Sender: TObject);
begin
  try
    if fDBEdit = nil then
      Exit;

    if fNoChange then
      Exit;

    if not Assigned(fDBEdit.OnEnter) then
      fDBEdit.OnEnter := DBEditEnter;

    if Assigned(Screen.ActiveForm) then
    if Screen.ActiveForm.ActiveControl = fDBEdit then
      begin
      if not fDBgrid.Visible then
        fDBgrid.Visible := True;

    aplicarFilter;
      end;

  finally
    if Assigned(fChangeEvent) then
      fChangeEvent(Sender);
  end;
end;

procedure TDadosLookUp_OOP.DBEditEnter(Sender: TObject);
var
  I: Integer;
begin
  try
    if not fDBgrid.Visible then
    begin
      if fPrimeiraEntrada then
      begin
        for I := 0 to Length(fTarget) - 1 do
          if Trim(fTarget[I]) <> '' then
            if fDBEdit.DataSource.DataSet.FindField(Trim(fTarget[I])) <> nil then
              fValuesOld[i] := fDBEdit.DataSource.DataSet.FieldByName(Trim(fTarget[I])).Value;

        aplicarFilter;
      end;
      fPrimeiraEntrada := False;
    end;

    fDBgrid.Parent := fDBEdit.Parent;
    fDBgrid.Left := fLeftGrid;
    fDBgrid.Top := fTopGrid;
    fDBgrid.Height := fHeightGrid;
    fDBgrid.Width := fWidthGrid;
    fDBGrid.DataSource := fDataSource;
    fDBGrid.OnDblClick := DBGridDblClick;
    fDBgrid.OnKeyDown := DBGridKeyDown;
    fDBgrid.OnExit := DBGridExit;
    if fDbgridTitle then
      fDBgrid.Options := fDBgrid.Options + [dgTitles]
    else
      fDBgrid.Options := fDBgrid.Options - [dgTitles];
  //  fDBgrid.Visible := True;
    fDBgrid.TabOrder := fDBEdit.TabOrder + 9999;
    fDBgrid.TabOrder := fDBEdit.TabOrder + 1;
    if not Assigned(fDBEdit.OnChange) then
      fDBEdit.OnChange := DBEditChange;
           
  finally
    if Assigned(fEnterEvent) then
      fEnterEvent(Sender);
  end;
end;

procedure TDadosLookUp_OOP.DBEditExit(Sender: TObject);
begin
  try
    if Screen.ActiveForm.ActiveControl <> fDBgrid then
    begin
      fDBEdit.OnChange := nil;
      fDBgrid.Visible := False;

      try
        fNoChange := True;
        voltarValores;
      finally
        fNoChange := False;
      end;
      fPrimeiraEntrada := True;
    end;
  finally
    if Assigned(fExitEvent) then
      fExitEvent(Sender);
  end;
end;

procedure TDadosLookUp_OOP.DBEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  try
    if Key = VK_DOWN then
      fDataSet.Next
    else if key = VK_UP then
      fDataSet.Prior
    else if key = VK_NEXT then
      fDataSet.MoveBy(7)
    else if key = VK_PRIOR then
      fDataSet.MoveBy(-7)
    else if Key = VK_ESCAPE then
      fDBgrid.Visible := False
    else if Key = VK_F7 then
    begin
      if fFilter = '' then
        fFilter := fFilterOld
      else
        fFilter := '';
      aplicarFilter;
    end
    else if Key = VK_F8 then
    begin
      if fFilterCondicao = '' then
        fFilterCondicao := '%'
      else
        fFilterCondicao := '';
      aplicarFilter;
    end;
  finally
    if Assigned(fKeyEnvent) then
      fKeyEnvent(Sender, Key, Shift);
  end;
end;

procedure TDadosLookUp_OOP.DBGridDblClick(Sender: TObject);
var
  I: Integer;
begin
  fDBEdit.OnChange := nil;

  if fDBEdit.DataSource.DataSet.State in [dsEdit, dsInsert] then
    for I := 0 to Length(fTarget) - 1 do
      if Trim(fTarget[I]) <> '' then
        if fDBEdit.DataSource.DataSet.FindField(Trim(fTarget[I])) <> nil then
          fDBEdit.DataSource.DataSet.FieldByName(Trim(fTarget[I])).Value := fValues[I];

  fVoltarAoSair := False;

  Screen.ActiveForm.Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TDadosLookUp_OOP.DBGridExit(Sender: TObject);
begin
  if (fDBEdit = nil) or (fDBgrid = nil) then
    Exit;
  if Screen.ActiveForm.ActiveControl <> fDBEdit then
  begin
    fDBEdit.OnChange := nil;
    fDBgrid.Visible := False;

    try
      fNoChange := True;
      voltarValores;
    finally
      fNoChange := False;
    end;
    fPrimeiraEntrada := True;
  end;
end;

procedure TDadosLookUp_OOP.DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    DBGridDblClick(fDBgrid);
  end
  else if Key = VK_ESCAPE then
  begin
    if fDBEdit.CanFocus then
    begin

//      SendMessage(fDBEdit.Handle, WM_KEYDOWN, VK_ESCAPE, 0);
      fDBEdit.SetFocus;
//      fDBEdit.da
    end;
    fDBgrid.Visible := False;
  end;
end;

destructor TDadosLookUp_OOP.Destroy;
var
  I: Integer;
begin
  limpar;

  for I := 0 to Length(fDBEditsOld) - 1 do
  begin
    if fDBEditsOld[I] <> nil then
    begin
      fDBEditsOld[I].OnEnter := nil;
      fDBEditsOld[I].OnExit := nil;
      fDBEditsOld[I].OnChange := nil;
      fDBEditsOld[I].OnKeyDown := nil;
    end;
  end;

  fDataSource.Free;

  fDataSet.free;

  if fDataSetProvider <> nil then
    FreeAndNil(fDataSetProvider);
  if fQuery <> nil then
    FreeAndNil(fQuery);

  inherited;
end;

function TDadosLookUp_OOP.fint(Afield: string): Integer;
begin
  Result := dataSet.FieldByName(Afield).AsInteger;
end;

function TDadosLookUp_OOP.fstr(Afield: string; Atrim: Boolean): string;
begin
  Result := dataSet.FieldByName(Afield).AsString;
  if Atrim then
    Result := Trim(Result);
end;

procedure TDadosLookUp_OOP.iniciar;
begin
  iniciar(ftString, 64);
end;

procedure TDadosLookUp_OOP.iniciar(FieldType: TFieldType; ASize: Smallint);
begin
  if fDataSet = nil then
  begin
    fDataSet := TClientDataSet.Create(Application);
    fDataSet.FieldDefs.Add('KeyField', FieldType, ASize);
    fDataSet.FieldDefs.Add('ListField', ftString, 128);
    fDataSet.CreateDataSet;
  end;

  if fDataSource = nil then
  begin
    fDataSource := TDataSource.Create(Application);
    fDataSource.AutoEdit := False;
  end;
  fDataSource.DataSet := fDataSet;
end;

function TDadosLookUp_OOP.KeyAsInteger: Integer;
begin
  Result := StrToInt(KeyAsString);
end;

function TDadosLookUp_OOP.KeyAsString: string;
begin
  Result := dataSet.FieldByName('KeyField').AsString;
end;

procedure TDadosLookUp_OOP.limpar;
begin
  if fDataSet <> nil then
  begin
    fDataSet.AfterScroll := nil;
    fDataSet.AfterRefresh := nil;
  end;

  if fDBLookupComboBox <> nil then
  begin
    fDBLookupComboBox.ListSource := nil;
    fDBLookupComboBox.ListField := '';
    fDBLookupComboBox.KeyField := '';
  end;

  if fDBEdit <> nil then
  begin
    fDBEdit.OnExit := nil;
    fDBEdit.OnEnter := nil;
    fDBEdit.OnKeyDown := nil;
    fDBEdit.OnChange := nil;
  end;

  if fDBgrid <> nil then
  begin
    fDBgrid.Visible := False;
    fDBgrid.OnExit := nil;
    fDBgrid.OnEnter := nil;
    fDBgrid.OnKeyDown := nil;
  end;

  fFilter := '';
end;

function TDadosLookUp_OOP.setDadosDataSet(pKeyData, pListData: array of string;
  pDBLookupComboBox: TDBLookupComboBox; pClear: Boolean): Boolean;
var
  I: Integer;
begin
  Result := False;
  if (Length(pKeyData) = 0) or (Length(pListData) = 0) then
    Exit;

  if (Length(pKeyData) <> Length(pListData)) then
    Exit;

  if fDataSet <> nil then
    FreeAndNil(fDataSet);

  limpar;

  iniciar;

  if pClear then
    dataSet.EmptyDataSet;

  for I := 0 to Length(pKeyData) - 1 do
  begin
    dataSet.Append;
    dataSet.FieldByName('KeyField').Value := pKeyData[i];
    dataSet.FieldByName('ListField').AsString := pListData[i];
    dataSet.Post;
  end;
  dataSet.First;

  fKeyField := 'KeyField';
  fListField := 'ListField';
  if pDBLookupComboBox <> nil then
  begin
    fDBLookupComboBox := TDBLookupComboBox(pDBLookupComboBox);
    fDBLookupComboBox.ListSource := fDataSource;
    fDBLookupComboBox.ListField := fListField;
    fDBLookupComboBox.KeyField := fKeyField;
  end;
end;

function TDadosLookUp_OOP.setDadosDataSet(pKeyField, pListField: string; pDataSet: TDataSet;
  pDBLookupComboBox: TDBLookupComboBox; pClear: Boolean): Boolean;
var
  vListaFields: TStringList;
  I: Integer;
begin
  result := False;
  pKeyField := UpperCase(Trim(pKeyField));

  if pDataSet = nil then
    raise Exception.Create('DataSet para preencher o LookUp não associado');

  if pDBLookupComboBox = nil then
    raise Exception.Create('LookUp não associado');

  if pDataSet.FindField(pKeyField) = nil then
    raise Exception.Create(PChar('Campo chave para o LookUp não existe' + #13 + pKeyField));

  iniciar;

  limpar;

  vListaFields := TStringList.Create;
  vListaFields := vDadosIni.Split(pListField, ';');

  if vListaFields.Count = 0 then
    raise Exception.Create(PChar('Nenhum campo de exibição para o LookUp'));

  for I := 0 to vListaFields.Count - 1 do
    if pDataSet.FindField(UpperCase(Trim(vListaFields[I]))) = nil then
      raise Exception.Create(PChar('Campo de exibição para o LookUp não existe' + #13 + vListaFields[i]));

  fKeyField := pKeyField;
  fListField := UpperCase(Trim(pListField));

  fDataSource.DataSet := nil;

  fDataSet.Free;
  fDataSet := TClientDataSet.Create(Application);

  {fDataSet.FieldDefs.Add(pKeyField,
        pDataSet.FindField(pKeyField).DataType,
        pDataSet.FindField(pKeyField).Size);
  for I := 0 to vListaFields.Count - 1 do
    fDataSet.FieldDefs.Add(UpperCase(Trim(vListaFields[I])),
      pDataSet.FindField(UpperCase(Trim(vListaFields[I]))).DataType,
      pDataSet.FindField(UpperCase(Trim(vListaFields[I]))).Size);}

  for I := 0 to pDataSet.Fields.Count - 1 do
    fDataSet.FieldDefs.Add(pDataSet.Fields[I].FieldName,
                           pDataSet.Fields[I].DataType,
                           pDataSet.Fields[I].Size);
    //if not Assigned(fDataSet.FindField(pDataSet.Fields[I].FieldName)) then

  fDataSet.CreateDataSet;

  fDataSource.DataSet := fDataSet;
  
  try
    pDataSet.DisableControls;
    fDataSet.DisableControls;

    pDataSet.First;
    while not pDataSet.Eof do
    begin
      fDataSet.Append;
      for I := 0 to fDataSet.Fields.Count - 1 do
        fDataSet.FieldByName(fDataSet.Fields[I].FieldName).Value :=
          pDataSet.FieldByName(fDataSet.Fields[I].FieldName).Value;
      fDataSet.Post;
      pDataSet.Next;
    end;
  finally
    pDataSet.EnableControls;
    fDataSet.EnableControls;
  end;

  if pDBLookupComboBox <> nil then
  begin
    fDBLookupComboBox := TDBLookupComboBox(pDBLookupComboBox);
    fDBLookupComboBox.ListSource := fDataSource;
    fDBLookupComboBox.ListField := fListField;
    fDBLookupComboBox.KeyField := fKeyField;
  end;
end;

function TDadosLookUp_OOP.setDadosDataSet(pTarget, pSource, pDisplay: array of string; pQuery: TIBQuery;
  pDBEdit: TDBEdit; pDBGrid: TDBGrid; pDbgridTitle: Boolean;
  pTop: Integer; pLeft: Integer; pHeight: integer; pWidth: integer): Boolean;
var
  I: Integer;
  vrTempField: string;
begin
  // o % no campo target vai indicar o campo de filtro ao usuario digitar os dados

  if Length(pTarget) = 0 then
    raise Exception.Create('Sem campos destino');

  if Length(pSource) = 0 then
    raise Exception.Create('Sem campos origem');

  if pQuery = nil then
    raise Exception.Create('Query de entrada de parametros nao associada');

  if pDBEdit = nil then
    raise Exception.Create('DBEdit não associado');

  if pDBGrid = nil then
    raise Exception.Create('DBGrid não associado');

  for I := 0 to Length(pTarget) - 1 do
    if pDBEdit.DataSource.DataSet.FindField(pTarget[I]) = nil then
      raise Exception.Create(PChar('Campo destino não existe' + #13 + pTarget[I]));

  iniciar;

  if fDataSetProvider = nil then
    fDataSetProvider := TDataSetProvider.Create(Application);

  if fQuery = nil then
    fQuery := TIBQuery.Create(Application);

  limpar;
  SetLength(fValuesOld, Length(pSource));

  fQuery.Transaction := pQuery.Transaction;
  fQuery.Database := pQuery.Database;

  fDataSetProvider.DataSet := fQuery;
  fDataSetProvider.Options := [poAllowCommandText,poUseQuoteChar];
  fDataSetProvider.Name := 'DSP' + IntToStr(vDadosIni.getContador);

  fDataSource.DataSet := nil;
  fDataSet.Free;
  fDataSet := TClientDataSet.Create(Application);
  fDataSet.ProviderName := fDataSetProvider.Name;
  fDataSource.DataSet := fDataSet;

  fQuery.SQL.Text := fSql;
  fDataSet.CommandText := fSql;
  fDataSet.Open;

  for I := 0 to Length(pSource) - 1 do
  begin
    vrTempField := StringReplace(pSource[I], '%', '', [rfReplaceAll]);;
    if fDataSet.FindField(vrTempField) = nil then
      raise Exception.Create(PChar('Campo origem não existe' + #13 + vrTempField));
  end;

  fDBEdit := TDBEdit(pDBEdit);
  if Assigned(fDBEdit.OnExit) then
    fExitEvent := fDBEdit.OnExit;
  if Assigned(fDBEdit.OnEnter) then
    fEnterEvent := fDBEdit.OnEnter;
  if Assigned(fDBEdit.OnKeyDown) then
    fKeyEnvent := fDBEdit.OnKeyDown;
  if Assigned(fDBEdit.OnChange) then
    fChangeEvent := fDBEdit.OnChange;

  fDBEdit.OnExit := DBEditExit;
  fDBEdit.OnKeyDown := DBEditKeyDown;
  fDBEdit.OnChange := DBEditChange;
  fDBEdit.OnEnter := DBEditEnter;

  if pTop = 0 then
    fTopGrid := fDBEdit.Top + 27
  else
    fTopGrid := pTop;

  if pLeft = 0 then
    fLeftGrid := fDBEdit.Left
  else
    fLeftGrid := pLeft;

  if pHeight = 0 then
    fHeightGrid := 150
  else
    fHeightGrid := pHeight;

  if pWidth = 0 then
    fWidthGrid := fDBEdit.Width
  else
    fWidthGrid := pWidth;

  fDBgrid := TDBGrid(pDBGrid);
  fDBgrid.BringToFront;
  fDBgrid.Hint := 'F7 para alternar o filtro entre um campo ou todos' + #13 +
                  'F8 para alternar o filtro entre começa e esta contido';
  fDbgridTitle := pDbgridTitle;

  try
    if fDbgridTitle then
      for I := 0 to Length(pDisplay) - 1 do
        fDataSet.FieldByName(fDataSet.Fields[I].FieldName).DisplayLabel := pDisplay[I];
  except
  end;

  SetLength(fTarget, Length(pTarget));
  SetLength(fSource, Length(pSource));
  SetLength(fValues, Length(pSource));
  for I := 0 to Length(pTarget) - 1 do fTarget[I] := pTarget[I];
  for I := 0 to Length(pSource) - 1 do
  begin
    if Copy(pSource[i], 1, 1) = '%' then
      fFilter := StringReplace(pSource[I], '%', '', [rfReplaceAll]);
    fSource[I] :=StringReplace(pSource[I], '%', '', [rfReplaceAll]);
  end;
  fFilterOld := fFilter;

  fDataSet.AfterScroll := ClientDataSetAfterScroll;
  fDataSet.AfterRefresh := ClientDataSetAfterRefresh;
end;

function TDadosLookUp_OOP.setDBEditDBGrid(pDBEdit: TDBEdit; pDBGrid: TDBGrid;
  pTop, pLeft: integer; pHeight: integer; pWidth: integer): boolean;
var
  I: Integer;
  vJaTem: Boolean;
begin

  if pDBEdit = nil then
    raise Exception.Create('DBEdit não associado');

  if pDBGrid = nil then
    raise Exception.Create('DBGrid não associado');

  for I := 0 to Length(fTarget) - 1 do
    if pDBEdit.DataSource.DataSet.FindField(fTarget[I]) = nil then
      raise Exception.Create(PChar('Campo destino não existe' + #13 + fTarget[I]));

  if fDBEdit <> nil then
  begin
    vJaTem := False;
    for I := 0 to Length(fDBEditsOld) - 1 do
      if fDBEditsOld[I].Name = fDBEdit.Name then
        vJaTem := True;

    if not vJaTem then
    begin
      SetLength(fDBEditsOld,  Length(fDBEditsOld) + 1);
      fDBEditsOld[Length(fDBEditsOld) - 1] := TDBEdit(fDBEdit);
    end;
  end;
  fDBEdit := TDBEdit(pDBEdit);

  limpar;

  fDataSet.AfterScroll := ClientDataSetAfterScroll;
  fDataSet.AfterRefresh := ClientDataSetAfterRefresh;

  if fDBEdit.Text <> fDBEdit.DataSource.DataSet.FieldByName(fDBEdit.DataField).Text then
    fDBEdit.Text := fDBEdit.DataSource.DataSet.FieldByName(fDBEdit.DataField).Text;
  fDBEdit.OnExit := DBEditExit;
  fDBEdit.OnKeyDown := DBEditKeyDown;
  fDBEdit.OnChange := DBEditChange;
  fDBEdit.OnEnter := DBEditEnter;

  fDBgrid := TDBGrid(pDBGrid);
  fDBgrid.Hint := 'F7 para alternar o filtro entre um campo ou todos' + #13 +
                  'F8 para alternar o filtro entre começa e esta contido';

  if pTop = 0 then
    fTopGrid := fDBEdit.Top + 27
  else
    fTopGrid := pTop;

  if pLeft = 0 then
    fLeftGrid := fDBEdit.Left
  else
    fLeftGrid := pLeft;

  if pHeight = 0 then
    fHeightGrid := 150
  else
    fHeightGrid := pHeight;

  if pWidth = 0 then
    fWidthGrid := fDBEdit.Width
  else
    fWidthGrid := pWidth;
end;

function TDadosLookUp_OOP.setDBLookupComboBox(pDBLookupComboBox: TDBLookupComboBox): boolean;
begin
  if fDataSource.DataSet = nil then
    fDataSource.DataSet := fDataSet;

  if pDBLookupComboBox <> nil then
  begin
    fDBLookupComboBox := TDBLookupComboBox(pDBLookupComboBox);
    fDBLookupComboBox.ListSource := fDataSource;
    fDBLookupComboBox.ListField := fListField;
    fDBLookupComboBox.KeyField := fKeyField;
  end;
end;

procedure TDadosLookUp_OOP.voltarValores;
var
  I: Integer;
begin
  if fDBEdit = nil then
    Exit;

  if fVoltarAoSair then
    if fDBEdit.DataSource.DataSet.State in [dsEdit, dsInsert] then
      for I := 0 to Length(fTarget) - 1 do
        if Trim(fTarget[I]) <> '' then
          if fDBEdit.DataSource.DataSet.FindField(Trim(fTarget[I])) <> nil then
            fDBEdit.DataSource.DataSet.FieldByName(Trim(fTarget[I])).Value := fValuesOld[I];

  fVoltarAoSair := True;
end;

function TDadosLookUp_OOP.setDadosDataSetV(TipoField: TFieldTypeDB; 
  pKeyData: array of Variant;
  pListData: array of string;
  pDBLookupComboBox: TDBLookupComboBox; pClear: Boolean): Boolean;
var
  I: Integer;
begin
  Result := False;
  if (Length(pKeyData) = 0) or (Length(pListData) = 0) then
    Exit;

  if (Length(pKeyData) <> Length(pListData)) then
    Exit;

  if fDataSet <> nil then
    FreeAndNil(fDataSet);

  limpar;

  iniciar(TipoField, IfThen(TipoField = ftString, 64, 0));

  if pClear then
    dataSet.EmptyDataSet;

  for I := 0 to Length(pKeyData) - 1 do
  begin
    dataSet.Append;
    dataSet.FieldByName('KeyField').Value     := pKeyData[i];
    dataSet.FieldByName('ListField').AsString := pListData[i];
    dataSet.Post;
  end;
  dataSet.First;

  fKeyField := 'KeyField';
  fListField := 'ListField';
  if pDBLookupComboBox <> nil then
  begin
    fDBLookupComboBox := TDBLookupComboBox(pDBLookupComboBox);
    fDBLookupComboBox.ListSource := fDataSource;
    fDBLookupComboBox.ListField := fListField;
    fDBLookupComboBox.KeyField := fKeyField;
  end;
end;

{ TFieldValue_OOP }

function TFieldValue_OOP.AutoPut(Value: Variant): TFieldValue_OOP;
begin
  if not (FOwner.dataSet.State in [dsInsert, dsEdit]) then
    if FOwner.dataSet.State = dsBrowse then
      FOwner.Edit;

  Result := PutValue(Value);

  FOwner.Post;
end;

function TFieldValue_OOP.Count(value: string): Integer;
var
  PrepareLoop: Boolean;
  RecNo      : Integer;
begin
  Result      := 0;
  PrepareLoop := not FOwner.dataSet.ControlsDisabled;

  if PrepareLoop then
    FOwner.prepare_loop()
  else
    RecNo := FOwner.dataSet.RecNo;

  try

    FOwner.dataSet.First;
    while not FOwner.dataSet.Eof do
    begin
      if GetAsString = value then
        Result := Result + 1;
      FOwner.dataSet.Next;
    end;

  finally
    if PrepareLoop then
      FOwner.prepare_loop_done()
    else
      FOwner.dataSet.RecNo := RecNo;
  end;
end;

constructor TFieldValue_OOP.Create(Field: TField; AOwner: TDataSet_OOP);
begin
  FField       := TField(Field);
  FFieldName   := FField.FieldName;
  FTrimStrings := True;
  FOwner       := AOwner;
end;

function TFieldValue_OOP.GetAsFloat: Double;
begin
  Result := FField.AsFloat;
end;

function TFieldValue_OOP.GetAsInteger: Longint;
begin
  Result := FField.AsInteger;
end;

function TFieldValue_OOP.GetAsString: string;
begin
  Result := IfThen(FTrimStrings, Trim(FField.AsString), FField.AsString);
end;

function TFieldValue_OOP.GetDisplayFormat: string;
begin
  Result := TFloatField(FField).DisplayFormat;
end;

function TFieldValue_OOP.GetIsNull: Boolean;
begin
  Result := FField.IsNull;
end;

function TFieldValue_OOP.Put(Value: string): TFieldValue_OOP;
begin
  Result := PutValue(Value);
end;

function TFieldValue_OOP.Length: Integer;
begin
  Result := System.Length(AsString);
end;

function TFieldValue_OOP.Put(Value: Integer): TFieldValue_OOP;
begin
  Result := PutValue(Value);
end;

function TFieldValue_OOP.Put(Value: Double): TFieldValue_OOP;
begin         
  Result := PutValue(Value);
end;

function TFieldValue_OOP.Put(Value: Double;
  const ADigit: TRoundToRange): TFieldValue_OOP;
begin
  Result := PutValue(RoundTo(Value, ADigit));
end;

function TFieldValue_OOP.PutValue(Value: Variant): TFieldValue_OOP;
begin
  Result := Self;
  FField.Value := Value;
end;

procedure TFieldValue_OOP.SetAsFloat(const Value: Double);
begin
  FField.AsFloat := Value;
end;

procedure TFieldValue_OOP.SetAsInteger(const Value: Longint);
begin
  FField.AsInteger := Value;
end;

procedure TFieldValue_OOP.SetAsString(const Value: string);
begin
  FField.AsString := IfThen(FTrimStrings, Trim(Value), Value);
end;

procedure TFieldValue_OOP.SetDisplayFormat(const Value: string);
begin
  TFloatField(FField).DisplayFormat := Value;
end;

function TFieldValue_OOP.SetNull: TFieldValue_OOP;
begin
  Result := PutValue(Null);
end;

function TFieldValue_OOP.SetNumberDisplayFormat(Decimal: Integer;
  ThousandSeparat: Boolean): TFieldValue_OOP;
var
  Display: string;
begin
  if Decimal > 0  then
    Display := '0.' + PadR(0, Decimal)
  else
    Display := '0';

  DisplayFormat := IfThen(ThousandSeparat, '#,##') + Display;
end;

function TFieldValue_OOP.SubString(Index, Count: Integer): string;
begin
  Result := Copy(AsString, Index + 1, Count);
end;

function TFieldValue_OOP.Sum: Double;
var
  PrepareLoop: Boolean;
  RecNo      : Integer;
begin
  Result      := 0;
  PrepareLoop := not FOwner.dataSet.ControlsDisabled;

  if PrepareLoop then
    FOwner.prepare_loop()
  else
    RecNo := FOwner.dataSet.RecNo;

  try

    FOwner.dataSet.First;
    while not FOwner.dataSet.Eof do
    begin
      Result := Result + AsFloat;
      FOwner.dataSet.Next;
    end;

  finally
    if PrepareLoop then
      FOwner.prepare_loop_done()
    else
      FOwner.dataSet.RecNo := RecNo;
  end;
end;

{ TDataSet_Aux }

procedure TDataSet_Aux.FreeOb;
begin
  if Assigned(Data) then
    FreeAndNil(Data);
end;

function TDataSet_OOP.ConsultaCamposLixeira(tabela, Campo, ordem, dataIni,
  dataFim, codemp: string; ativo: integer; CamposExibir, INNER_JOIN,
  CondicaoWHERE, CampoCodEmpresa: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao, vDataI, vDataF, formatodata,horadataini,horadatafim: string;
begin
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos7';
  result := false;
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
        Campo := DataSet.Fields[I].FieldName;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        possuiCodEmpresa := true;
        if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
          fCampoCodEmpresa := CampoCodEmpresa
        else
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;

    if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
      formatodata := 'mm/dd/yyyy'
    else if pos('.', ShortDateFormat) <> 0 then
      formatodata := 'dd.mm.yyyy';

    if (pos(':', dataIni) <> 0) then
    begin
     horadataini := ' 00:00:00';
     horadatafim := ' 23:59:59';
     dataIni:= StringReplace(dataIni,':','',[rfReplaceAll]);
     dataFim := StringReplace(dataFim,':','',[rfReplaceAll]);
    end
    else
    begin
     horadataini := '';
     horadatafim := '';
    end;

    vDataI := StringReplace(dataIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(dataFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    if ((vDataI <> '      ') and (vDataI <> '        ')) or
      ((vDataF <> '      ') and (vDataF <> '        ')) then
    begin
      try
        if (CondicaoWHERE<>'') then
        CondicaoWHERE := CondicaoWHERE + ' and ';
        DataSet.Close;
        if (((vDataI <> '      ') and (vDataI <> '        ')) and
          ((vDataF <> '      ') and (vDataF <> '        '))) then
          condicao := ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, StrTodate(dataIni))+ horadataini)  + ' and ' + tabela + '.' + Campo +
            ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim))+ horadatafim)
        else if ((vDataI <> '      ') and (vDataI <> '        ')) then
          condicao := ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni))+ horadataini)
        else if ((vDataF <> '      ') and (vDataF <> '        ')) then
          condicao := ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim))+ horadatafim);

        if(CamposExibir = '') then
        DataSet.CommandText := 'select * from ' + tabela + ' ' + INNER_JOIN + ' ' + condicao
        else
        DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela + ' ' + INNER_JOIN + ' ' + condicao;

        if (possuiCodEmpresa) and (pos('where', dataSet.CommandText) > 0) then
        begin
          if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
            DataSet.CommandText := DataSet.CommandText + ' and ' + CampoCodEmpresa + ' = ' + codemp
          else
            DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp;
        end
        else if possuiCodEmpresa then
        begin
          if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
            DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + CampoCodEmpresa + ' = ' + codemp
          else
            DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp;
        end;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 0';

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        if (CamposExibir='') then
        DataSet.CommandText := 'select * from ' + tabela + ' ' + INNER_JOIN
        else
        DataSet.CommandText := 'select '+ CamposExibir +' from ' + tabela + ' ' + INNER_JOIN;

        if possuiAtivo and possuiCodEmpresa then
        begin
          if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
            DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + CampoCodEmpresa + ' = ' +
              codemp + ' and ' + tabela + '.' + 'ativo = ' + inttostr(ativo)
          else
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
              codemp + ' and ' + tabela + '.' + 'ativo = ' + inttostr(ativo);
        end
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + tabela + '.' + 'ativo = ' + inttostr(ativo)
        else if possuiCodEmpresa then
        begin
          if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
            DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + CampoCodEmpresa + ' = ' + codemp
          else
            DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE +' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp;
        end;
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCamposLixeira(tabela, valorConsulta, Campo,
  condicao, ordem: string; constante: boolean; codemp, CamposExibir, INNER_JOIN,
  CondicaoWHERE, CampoCodEmpresa: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string; // F (Integer, Float); S String; D Data; I Indefinido
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
  CamposExibir := Trim(CamposExibir);
  valorConsulta := Trim(valorConsulta);
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos8';
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    result := false;
    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Maior ou Igual' then
          condicao := '>='
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Menor ou Igual' then
          condicao := '<='
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          begin
            valorConsulta := ajustar_consulta_incasesensitive(DataSet.Fields[I], tabela, valorConsulta);
            Campo := DataSet.Fields[I].FieldName;

            if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
              ordem := DataSet.Fields[I].FieldName;

            if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
            begin
              possuiCodEmpresa := true;
              if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
                fCampoCodEmpresa := CampoCodEmpresa
              else
              fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            end;
            if Dataset.Fields[I].FieldName = 'ATIVO' then
              possuiAtivo := true;

            if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              tipo := 'I'
            else if (Dataset.Fields[I] is TCurrencyField) or (Dataset.Fields[I] is TFloatField) then
              tipo := 'F'
            else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
              tipo := 'S'
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              tipo := 'D'
            else
              tipo := 'I';

            condicao := IfThen( MatchText(tipo, ['F', 'I']) and MatchText(condicao, ['like', 'Começa']), '=', condicao );

            break;
          end;
        end;
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
            possuiCodEmpresa := true;
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if tipo = 'I' then
        try
          strtoint(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end
        else if tipo = 'F' then
        try
          strtofloat(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end;

        DataSet.Close;

        if Campo <> 'Todos' then
          if CondicaoWHERE <> '' then
            CondicaoWHERE := CondicaoWHERE + ' and ';

        if Campo = 'Todos' then
          DataSet.CommandText := 'select ' + CamposExibir + ' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE
        else if (tipo = 'F') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE  + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '
            + INNER_JOIN + ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' '
              + condicao + ' ' + vDadosIni.trocaVirgulaPorPonto(valorConsulta);
        end
        else if (tipo = 'S') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
             ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
            ' where ' + CondicaoWHERE  + tabela + '.' + Campo + ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN +
            ' where ' + CondicaoWHERE + tabela + '.' + Campo + ' ' + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
        begin
          if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
	          DataSet.CommandText := DataSet.CommandText + ' and ' + CampoCodEmpresa + ' = ' + codemp
          else
         	  DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.' + fCampoCodEmpresa + ' = ' + codemp;
        end;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.ativo = 0';

        if ordem = 'Todos' then
        begin
          if DataSet.Fields[0].Required then
          	ordem := DataSet.Fields[0].FieldName
          else
          begin
          	ordem := DataSet.Fields[0].FieldName;
            
            for I := 0 to DataSet.Fields.Count - 1 do
            begin
            	if DataSet.Fields[I].Required then
              begin
            		ordem := DataSet.Fields[I].FieldName;
                Break;
              end;
            end;
          end;
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
      	//Particularidade para a buscas de produtos
        if upperCase(Tabela) = 'PRODUTOS' then
        begin
          if (UpperCase(Campo) = 'NUM_FAB_PROD') or (Pos('NUM_FAB_PROD', CondicaoWHERE) > 0) then
          begin
          	if Pos('DISTINCT PRODUTOS.*', UpperCase(dataSet.CommandText)) > 0 then
            begin
              if Pos('PRODUTOS.NUM_FAB_PROD', UpperCase(dataSet.CommandText)) > 0 then
              	dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), 'PRODUTOS.NUM_FAB_PROD',
                	'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

              if Pos('* FROM PRODUTOS WHERE', UpperCase(dataSet.CommandText)) > 0 then
                dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), '* FROM PRODUTOS WHERE',
                    'distinct PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA from PRODUTOS,COD_BARRA where COD_BARRA.cod_prod = PRODUTOS.cod_prod AND COD_BARRA.grupo_prod = PRODUTOS.grupo_prod AND PRODUTOS.cod_empresa = COD_BARRA.cod_empresa and ',
                  [rfReplaceAll, rfIgnoreCase]);
            end
            else
            begin
            	if Pos(' GETESTOQUEDISPONIVEL ', UpperCase(dataSet.CommandText)) > 0 then
              begin
              	dataSet.CommandText := StringReplace(dataSet.CommandText, 'PRODUTOS.NUM_FAB_PROD',
	                'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

              	dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), ' ' + CamposExibir + ' FROM PRODUTOS ',
                  ' distinct PRODUTOS.*, EST.ESTOQUE, EST.EST_PRIMA from PRODUTOS ' +
                  ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
         	        ' ',
                  [rfReplaceAll, rfIgnoreCase]);
              end
              else if Pos('CAST(0 AS FLOAT) ESTOQUE', UpperCase(dataSet.CommandText)) > 0 then
            	begin
              	dataSet.CommandText := StringReplace(dataSet.CommandText, 'PRODUTOS.NUM_FAB_PROD',
	                'COD_BARRA.COD_BARRA', [rfReplaceAll, rfIgnoreCase]);

              	dataSet.CommandText := StringReplace(UpperCase(dataSet.CommandText), ' ' + CamposExibir + ' FROM PRODUTOS ',
                  ' distinct PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA from PRODUTOS ' +
                  ' INNER JOIN COD_BARRA ON COD_BARRA.GRUPO_PROD = PRODUTOS.GRUPO_PROD AND COD_BARRA.COD_PROD = PRODUTOS.COD_PROD AND COD_BARRA.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
                  ' ',
                  [rfReplaceAll, rfIgnoreCase]);
              end;
            end;
          end;
        end;

        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
            possuiCodEmpresa := true;
            if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
              fCampoCodEmpresa := CampoCodEmpresa
            else
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if ordem = 'Todos' then
        begin
        	if DataSet.Fields[0].Required then
          	ordem := DataSet.Fields[0].FieldName
          else
          begin
          	ordem := DataSet.Fields[0].FieldName;
            
            for I := 0 to DataSet.Fields.Count - 1 do
            begin
            	if DataSet.Fields[I].Required then
              begin
            		ordem := DataSet.Fields[I].FieldName;
                Break;
              end;
            end;
          end;
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.close;
        DataSet.CommandText := 'select '+CamposExibir+' from ' + tabela +' '+ INNER_JOIN;
        if CondicaoWHERE <> '' then
          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE;

        if possuiCodEmpresa then
          if pos('WHERE', UpperCase(string(DataSet.CommandText))) > 0 then
          begin
            if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
              DataSet.CommandText := DataSet.CommandText + ' and ' + CampoCodEmpresa + ' = ' + codemp
          else
              DataSet.CommandText := DataSet.CommandText + ' and ' + tabela+'.' + fCampoCodEmpresa + ' = ' + codemp;
          end
          else
          begin
            if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(CampoCodEmpresa) <> '') then
              DataSet.CommandText := DataSet.CommandText + ' where ' + CampoCodEmpresa + ' = ' + codemp
            else
            DataSet.CommandText := DataSet.CommandText + ' where ' + tabela+'.' + fCampoCodEmpresa + ' = ' + codemp;
          end;

       if possuiAtivo then
         if pos('WHERE', UpperCase(string(DataSet.CommandText))) > 0 then
           DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.ativo = 0'
         else
           DataSet.CommandText := DataSet.CommandText + ' where '+tabela+'.ativo = 0';
//        if CondicaoWHERE = '' then
//        DataSet.CommandText := DataSet.CommandText + ' where ' + tabela+'.' + fCampoCodEmpresa + ' = ' + codemp
//        else
//          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + ' and ' +tabela+'.' + fCampoCodEmpresa + ' = ' + codemp;
//        if possuiAtivo and possuiCodEmpresa then

//          DataSet.CommandText := DataSet.CommandText + ' and '+tabela+'.ativo = 0'
//        else if possuiAtivo then
//          DataSet.CommandText := DataSet.CommandText + ' where ' + CondicaoWHERE + ' and ' +tabela+'.ativo = 0';
        DataSet.CommandText := DataSet.CommandText + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    possuiCodEmpresa := false;
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCamposLixeira(tabela, Campo, ordem, dataIni,
  dataFim, codemp: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  condicao, vDataI, vDataF, formatodata: string;
  vSqlAdicional: string;
begin
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos2';
  result := false;
  try
    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    vSqlAdicional := '';
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
        Campo := DataSet.Fields[I].FieldName;
      if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
        ordem := DataSet.Fields[I].FieldName;
      if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
      begin
        if Trim(UpperCase(tabela)) <> 'TIPO_SERVICO' then
          possuiCodEmpresa := True
        else
          vSqlAdicional := ' and ((cod_empresa = ' + vDadosIni.codEmpresa + ') or (coalesce(cod_empresa, 0) = 0))';
        fCampoCodEmpresa := Dataset.Fields[I].FieldName;
      end;
      if Dataset.Fields[I].FieldName = 'ATIVO' then
        possuiAtivo := true;
    end;

    if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
      formatodata := 'mm/dd/yyyy'
    else if pos('.', ShortDateFormat) <> 0 then
      formatodata := 'dd.mm.yyyy';

    vDataI := StringReplace(dataIni, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(dataFim, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    if ((vDataI <> '      ') and (vDataI <> '        ')) or
      ((vDataF <> '      ') and (vDataF <> '        ')) then
    begin
      try
        DataSet.Close;
        if (((vDataI <> '      ') and (vDataI <> '        ')) and
          ((vDataF <> '      ') and (vDataF <> '        '))) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni))) + ' and ' + tabela + '.' + Campo +
            ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim))
        else if ((vDataI <> '      ') and (vDataI <> '        ')) then
          condicao := ' where ' + tabela + '.' + Campo + ' >= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataIni)))
        else if ((vDataF <> '      ') and (vDataF <> '        ')) then
          condicao := ' where ' + tabela + '.' + Campo + ' <= ' + quotedstr(FormatDateTime(formatodata, strtodate(dataFim)) + horaFimData(dataFim));
        DataSet.CommandText := 'select * from ' + tabela + condicao;
        if (possuiCodEmpresa) and (pos('where', dataSet.CommandText) > 0) then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.' + fCampoCodEmpresa + ' = ' + codemp
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ' + tabela + '.ativo = 0';
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + vSqlAdicional + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Result := open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0011 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0011 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp + ' and ' + tabela + '.' + 'ativo = 1'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + 'ativo = 0'
        else if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + tabela + '.' + fCampoCodEmpresa + ' = ' +
            codemp;
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;
        DataSet.CommandText := DataSet.CommandText + vSqlAdicional + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');
        Result := Open;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0012 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0012 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    FlogStore.started := False;
  end;
end;

function TDataSet_OOP.ConsultaCamposLixeira(tabela, valorConsulta, Campo,
  condicao, ordem: string; constante: boolean; codemp: string): boolean;
var
  I: integer;
  possuiCodEmpresa, possuiAtivo: boolean;
  tipo: string; // F (Integer, Float); S String; D Data; I Indefinido
  vSqlAdicional: string;
begin //Começa    Igual    Diferente   Maior   Menor   Esta Contido
  valorConsulta := Trim(valorConsulta);
  FlogStore.started   := True;
  FlogStore.tStartSet := Now;
  FlogStore.textAux   := Self.ClassName + '.ConsultaCampos1';
  try

    possuiCodEmpresa := false;
    fCampoCodEmpresa := '';
    possuiAtivo := false;
    result := false;
    vSqlAdicional := '';
    if valorConsulta <> '' then
    begin
      try
        if condicao = 'Igual' then
          condicao := '='
        else if condicao = 'Maior' then
          condicao := '>'
        else if condicao = 'Maior ou Igual' then
          condicao := '>='
        else if condicao = 'Menor' then
          condicao := '<'
        else if condicao = 'Menor ou Igual' then
          condicao := '<='
        else if condicao = 'Diferente' then
          condicao := '<>'
        else if (condicao = 'Esta contido') then
          condicao := 'like'
        else if (condicao = 'Começa') then
          condicao := 'Começa'
        else
          condicao := '=';
        for I := 0 to DataSet.FieldCount - 1 do
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Campo) then
          begin
            valorConsulta := ajustar_consulta_incasesensitive(DataSet.Fields[I], tabela, valorConsulta);
            Campo := DataSet.Fields[I].FieldName;

            if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
              ordem := DataSet.Fields[I].FieldName;

            if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
            begin
            	if Trim(UpperCase(tabela)) <> 'TIPO_SERVICO' then
              	possuiCodEmpresa := true
              else
                vSqlAdicional := ' and ((cod_empresa = ' + vDadosIni.codEmpresa + ') or (coalesce(cod_empresa, 0) = 0))';
              fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            end;
            if Dataset.Fields[I].FieldName = 'ATIVO' then
              possuiAtivo := true;

            if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              tipo := 'I'
            else if (Dataset.Fields[I] is TCurrencyField) or (Dataset.Fields[I] is TFloatField) then
              tipo := 'F'
            else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
              tipo := 'S'
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              tipo := 'D'
            else
              tipo := 'I';

            condicao := IfThen( MatchText(tipo, ['F', 'I']) and MatchText(condicao, ['like', 'Começa']), '=', condicao );
            break;
          end;
        end;
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
          	if Trim(UpperCase(tabela)) <> 'TIPO_SERVICO' then
            	possuiCodEmpresa := true
            else
            	vSqlAdicional := ' and ((cod_empresa = ' + vDadosIni.codEmpresa + ') or (coalesce(cod_empresa, 0) = 0))';
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if tipo = 'I' then
        try
          strtoint(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end
        else if tipo = 'F' then
        try
          strtofloat(valorConsulta);
        except
          Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          exit;
        end;

        DataSet.Close;

        if (tipo = 'F') or (tipo = 'I') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo +
              ' like ' +
              QuotedStr(vDadosIni.trocaVirgulaPorPonto(valorConsulta) + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + tabela + '.' + Campo + ' '
              + condicao + ' ' + vDadosIni.trocaVirgulaPorPonto(valorConsulta);
        end
        else if (tipo = 'S') then
        begin
          if condicao = 'like' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' like ' +
              QuotedStr('%' + valorConsulta + '%')
          else if condicao = 'Começa' then
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' like ' +
              QuotedStr(valorConsulta + '%')
          else
            DataSet.CommandText := 'select * from ' + tabela + ' where ' + Campo + ' ' + condicao +
              ' ' + QuotedStr(valorConsulta);
        end;

        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ' + fCampoCodEmpresa + ' = ' + codemp;
        if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' and ativo = 0';

        if ordem = 'Todos' then
        begin
          if DataSet.Fields[0].Required then
          	ordem := DataSet.Fields[0].FieldName
          else
          begin
          	ordem := DataSet.Fields[0].FieldName;

            for I := 0 to DataSet.Fields.Count - 1 do
            begin
            	if DataSet.Fields[I].Required then
              begin
            		ordem := DataSet.Fields[I].FieldName;
                Break;
              end;
            end;
          end;
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + vSqlAdicional +' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_if');
        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0009 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end
    else
    begin
      try
        for I := 0 to DataSet.FieldCount - 1 do
          if (Dataset.Fields[I].FieldName = 'COD_EMPRESA') or (Dataset.Fields[I].FieldName = 'CODIGO_EMP') then
          begin
          	if Trim(UpperCase(tabela)) <> 'TIPO_SERVICO' then
          		possuiCodEmpresa := true
            else
							vSqlAdicional := ' and ((cod_empresa = ' + vDadosIni.codEmpresa + ') or (coalesce(cod_empresa, 0) = 0))';
            fCampoCodEmpresa := Dataset.Fields[I].FieldName;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if Dataset.Fields[I].FieldName = 'ATIVO' then
          begin
            possuiAtivo := true;
            Break;
          end;
        for I := 0 to DataSet.FieldCount - 1 do
          if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(ordem) then
          begin
            ordem := DataSet.Fields[I].FieldName;
            Break;
          end;

        if ordem = 'Todos' then
        begin
        	if DataSet.Fields[0].Required then
          	ordem := DataSet.Fields[0].FieldName
          else
          begin
          	ordem := DataSet.Fields[0].FieldName;

            for I := 0 to DataSet.Fields.Count - 1 do
            begin
            	if DataSet.Fields[I].Required then
              begin
            		ordem := DataSet.Fields[I].FieldName;
                Break;
              end;
            end;
          end;
        end;

        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.close;
        DataSet.CommandText := 'select * from ' + tabela;
        if possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' where ' + fCampoCodEmpresa + ' = ' + codemp;
        if possuiAtivo and possuiCodEmpresa then
          DataSet.CommandText := DataSet.CommandText + ' and ativo = 0'
        else if possuiAtivo then
          DataSet.CommandText := DataSet.CommandText + ' where ativo = 0';
        if Pos('.', ordem) = 0 then
          ordem := tabela + '.' + ordem;

        DataSet.CommandText := DataSet.CommandText + vSqlAdicional + ' order by ' + ordem;
        logs(dataSet.CommandText, FlogStore.textAux + '_else');

        Open;
        Result := true;
      except
        on e: exception do
        begin
          Result := false;
          MessageDlg('E0010 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText,
            mtInformation, [mbOK], 0);
          registraErro('E0010 ' + e.Message + DataSet.CommandText);
        end;
      end;
    end;
    logs_elapsed_time();
  finally
    possuiCodEmpresa := false;
    FlogStore.started := False;
  end;
end;

{ TFieldDisplayList }

function TFieldDisplayList.GetItem(Index: Integer): TFieldDisplay;
begin
  Result := TFieldDisplay(inherited Items[Index]);
end;

procedure TFieldDisplayList.SetItem(Index: Integer; const Value: TFieldDisplay);
begin
  Put(Index, Value);
end;

{ TDataSetChild_OOP }

constructor TDataSetChild_OOP.Create(AOwner: TDataSet_OOP);
begin
  inherited Create(dtmAtivo.bancoHw);
  FOwner                := AOwner;
  _queryOOP.Transaction := FOwner.transacao;
  buscas.Transaction    := FOwner.transacao;
end;

end.
