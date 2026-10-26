unit HW.Servicos;

interface

uses
  uClasseConexao,
  config_sistema_class,
  HW.Utils.Classes.Registros_DX,
  Hw.Types,
  Hw.Api.Rest;

const
  CNPJ_HW = '03530705000109';

  //const
  //  HW_URL_API_PROD         = 'hwsistemas.homelinux.com/integra/api';
  //  HW_URL_API_HOM          = 'localhost/IntegraApiHw/api';
  //  HW_URL_API_HOM          = 'localhost:63475/api';
  //  HW_SERV_TOKEN_API       = 'integra_api_access_token';
  //  HW_STS_CONSULTANDO      = 'Consultando';
  //  HW_STS_CONCLUIDA        = 'Concluida';
  //  HW_STS_SEM_CONSULTA     = 'Sem Consulta';
  //  HW_STS_ERROR            = 'Erro';
  //  HW_STS_ERROR_API        = 'ErroApi';

type
  THwServicosJSON = class//(THwClassRegistros)
  private
    [JSONMarshalledAttribute(False)]
    FServico: string;
    FDataConsulta: TDateTime;
    FStatus: string;
  public
    property Servico: string read FServico write FServico;
    property DataConsulta: TDateTime read FDataConsulta write FDataConsulta;
    property Status: string read FStatus write FStatus;
  end;

  THwServicos = class(TConexao)
  private
    FCodEmpresa: Integer;
    FDataBasePath: string;
    FDevelopmentMode: Boolean;
    FLogEvent: TLogText;
    function ToB64(Text: string): string;
    function FromB64(Base64: string): string;
  protected
    //FToken: TTokenApi;
    FCnpj: string;
    FUrlApi: string;
    FDataHoraAtual: TDateTime;
    SilentMod: Boolean;
    DataSearch: THwServicosJSON;

    procedure GetUrlApi; virtual; abstract;
    function GetCNPJ: Boolean;
    function GetDadosApi: Boolean; virtual; abstract;
    function GetJson(ID: string): string; overload;
    function GetJson(ID: string; cod_empresa: Integer): string; overload;
    //function ToB64(Text: string): string;
    //function FromB64(Base64: string): string;

    function SaveJSON(ID, DadosJSON: string): Boolean;
  public
    constructor Create(); overload; override;
    constructor Create(silentMode: Boolean); overload; virtual;
    function GetConfig(name: string; empresaId: Integer): TConfig_sistema_class; virtual;
    procedure SaveConfig(conf: TConfig_sistema_class; commitAfter: Boolean = True); virtual;
    procedure InitRepo(); virtual;

    function IsCnpjHW: Boolean;


    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property UrlApi: string read FUrlApi write FUrlApi;
    property CnpjEmp: string read FCnpj write FCnpj;
    property DataBasePath: string read FDataBasePath write FDataBasePath;
    property DataHoraAtual: TDateTime read FDataHoraAtual write FDataHoraAtual;
    property DevelopmentMode: Boolean read FDevelopmentMode write FDevelopmentMode;
    property OnLog: TLogText read FLogEvent write FLogEvent;
  end;

implementation

uses
  Hw.Integra.Api.FinanceiroService,
  hw_utils,
  hw_win_utils,
  System.StrUtils,
  System.SysUtils,
  System.Math,
  HW.Utils.Classes.Funcoes_DX,
  Vcl.Forms;

{ THwServicos }

constructor THwServicos.Create(silentMode: Boolean);
begin
  Create();
  SilentMod := silentMode;
end;

constructor THwServicos.Create;
begin
  inherited Create();
  SilentMod := False;
  FDevelopmentMode := THwUtilsClass.GetIni('MD', 'MODODEVAPIS', 'N') = 'S';//ModoDesenvolvimentoApis
  DataHoraAtual := 0;
end;

function THwServicos.FromB64(Base64: string): string;
begin
  if FDevelopmentMode then
    Result := Base64
  else
    Result := THwUtilsClass.DecodeASCIIBase64(Base64);
end;

function THwServicos.GetCNPJ: Boolean;
begin
  Result := False;
  try
    with SqlOpen('select cgc_emp, (select current_ts from sp_current_ts(%d)) datahora from empresa where cod_empresa = %d', [FCodEmpresa, FCodEmpresa]) do
    begin
      FCnpj          := FieldByName('cgc_emp').AsString;
      DataHoraAtual := FieldByName('datahora').AsDateTime;
    end;

    Result := not FCnpj.Trim.IsEmpty;
    if not Result then
      if not SilentMod then
        ShowErro('Não foi possivel obter o CNPJ no banco de dados')
      else
        LogError('Cnpj vazio no banco de dados parra empresa %d', [FCodEmpresa]);

  except on E: Exception do
    begin
      LogError('THwIntegraServicos.GetCNPJ ', [e.Message]);
    end;
  end;
end;

function THwServicos.GetConfig(name: string;
  empresaId: Integer): TConfig_sistema_class;
begin
  Result := TConfig_sistema_class.getConf(name, Self.QrAux, empresaId)
end;

function THwServicos.GetJson(ID: string; cod_empresa: Integer): string;
begin
  with SqlOpen('select json, (select current_ts from sp_current_ts(%d)) datahora from dados_json where id = %s and cod_empresa = %d',
              [cod_empresa, ToB64(ID).Substring(0, 64).QuotedString, cod_empresa]) do
  begin
    Result := FromB64(FieldByName('json').AsString);
    if DataHoraAtual = 0 then
      DataHoraAtual := FieldByName('datahora').AsDateTime;
    Close;
  end;
end;

procedure THwServicos.InitRepo;
begin
  with SqlOpen('select cgc_emp, (select current_ts from sp_current_ts(%d)) datahora from empresa where cod_empresa = %d', [FCodEmpresa, FCodEmpresa]) do
  begin
    FCnpj          := FieldByName('cgc_emp').AsString;
    DataHoraAtual := FieldByName('datahora').AsDateTime;
  end;
end;

function THwServicos.IsCnpjHW: Boolean;
begin
  Result := CnpjEmp.Trim.PadLeft(14, '0').Equals(CNPJ_HW);
end;

function THwServicos.GetJson(ID: string): string;
begin
  Result := GetJson(ID, FCodEmpresa);
end;

procedure THwServicos.SaveConfig(conf: TConfig_sistema_class;
  commitAfter: Boolean);
begin
  conf.SaveConfDB(QrAux);

  if commitAfter then
    if Transacao.InTransaction then
      Transacao.Commit;
end;

function THwServicos.SaveJSON(ID, DadosJSON: string): Boolean;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text := Format('update or insert into DADOS_JSON (ID, COD_EMPRESA, JSON) values (%s, %d, :JSON)',
                             [ToB64(ID).Substring(0, 64).QuotedString, FCodEmpresa]);
    QrAux.ParamByName('JSON').AsString := ToB64(DadosJSON);
    QrAux.ExecSQL;
    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Rollback;
      LogError('THwIntegraServicos.SaveJSON ', [e.Message]);
      if not SilentMod then
        ShowErro('Erro ao salvar dados: %s', [E.Message]);
    end;
  end;
end;

function THwServicos.ToB64(Text: string): string;
begin
  if FDevelopmentMode then
    Result := Text
  else
    Result := THwUtilsClass.EncodeASCIIBase64(Text)
end;

end.
