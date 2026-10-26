unit nfce_config_class;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  System.Variants;
{$ENDIF}

type
  TNfce_config_class = class(TBaseFb_class)
  private
    Fcod_empresa     : Integer;
    Fusar_conf_nfe   : string;
    Fcert_arquivopfx : string;
    Fcert_num_serie  : string;
    Fcert_senha      : string;
    Fcsc_id1         : string;
    Fcsc_token1      : string;
    Fcsc_id2         : string;
    Fcsc_token2      : string;
    Fws_uf           : string;
    Fws_tbamb        : string;
    Fws_sinc_assinc  : string;
    Fws_aguardar     : Variant;
    Fws_tentativas   : Variant;
    Fws_intervalo    : Variant;
    Fws_proxy_host   : string;
    Fws_proxy_port   : string;
    Fws_proxy_user   : string;
    Fws_proxy_pass   : string;
    Fws_timeout      : Variant;
    Fws_visualizar   : string;
    Farq_path_salvar : string;
    Farq_path_schema : string;
    Farq_logo_emp    : string;
    Femail_smpt_host : string;
    Femail_smtp_porta: Variant;
    Femail_username  : string;
    Femail_password  : string;
    Femail_usa_ssl   : string;
    Femail_assunto   : string;
    Femail_mensagem  : TStrings;
    Ftpemis          : Variant;
    Fxjust           : string;
    Femail_usa_tls   : string;
    Fws_lib_ssl      : Variant;
    Fxjust_auto      : string;
    Fdhcont          : Variant;
    Fcert_dadospfx   : TStrings;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property cod_empresa     : Integer  read Fcod_empresa      write Fcod_empresa;
    property usar_conf_nfe   : string   read Fusar_conf_nfe    write Fusar_conf_nfe;
    property cert_arquivopfx : string   read Fcert_arquivopfx  write Fcert_arquivopfx;
    property cert_num_serie  : string   read Fcert_num_serie   write Fcert_num_serie;
    property cert_senha      : string   read Fcert_senha       write Fcert_senha;
    property csc_id1         : string   read Fcsc_id1          write Fcsc_id1;
    property csc_token1      : string   read Fcsc_token1       write Fcsc_token1;
    property csc_id2         : string   read Fcsc_id2          write Fcsc_id2;
    property csc_token2      : string   read Fcsc_token2       write Fcsc_token2;
    property ws_uf           : string   read Fws_uf            write Fws_uf;
    property ws_tbamb        : string   read Fws_tbamb         write Fws_tbamb;
    property ws_sinc_assinc  : string   read Fws_sinc_assinc   write Fws_sinc_assinc;
    property ws_aguardar     : Variant  read Fws_aguardar      write Fws_aguardar;
    property ws_tentativas   : Variant  read Fws_tentativas    write Fws_tentativas;
    property ws_intervalo    : Variant  read Fws_intervalo     write Fws_intervalo;
    property ws_proxy_host   : string   read Fws_proxy_host    write Fws_proxy_host;
    property ws_proxy_port   : string   read Fws_proxy_port    write Fws_proxy_port;
    property ws_proxy_user   : string   read Fws_proxy_user    write Fws_proxy_user;
    property ws_proxy_pass   : string   read Fws_proxy_pass    write Fws_proxy_pass;
    property ws_timeout      : Variant  read Fws_timeout       write Fws_timeout;
    property ws_visualizar   : string   read Fws_visualizar    write Fws_visualizar;
    property arq_path_salvar : string   read Farq_path_salvar  write Farq_path_salvar;
    property arq_path_schema : string   read Farq_path_schema  write Farq_path_schema;
    property arq_logo_emp    : string   read Farq_logo_emp     write Farq_logo_emp;
    property email_smpt_host : string   read Femail_smpt_host  write Femail_smpt_host;
    property email_smtp_porta: Variant  read Femail_smtp_porta write Femail_smtp_porta;
    property email_username  : string   read Femail_username   write Femail_username;
    property email_password  : string   read Femail_password   write Femail_password;
    property email_usa_ssl   : string   read Femail_usa_ssl    write Femail_usa_ssl;
    property email_assunto   : string   read Femail_assunto    write Femail_assunto;
    property email_mensagem  : TStrings read Femail_mensagem   write Femail_mensagem;
    property tpemis          : Variant  read Ftpemis           write Ftpemis;
    property xjust           : string   read Fxjust            write Fxjust;
    property email_usa_tls   : string   read Femail_usa_tls    write Femail_usa_tls;
    property ws_lib_ssl      : Variant  read Fws_lib_ssl       write Fws_lib_ssl;
    property xjust_auto      : string   read Fxjust_auto       write Fxjust_auto;
    property dhcont          : Variant  read Fdhcont           write Fdhcont;
    property cert_dadospfx   : TStrings read Fcert_dadospfx    write Fcert_dadospfx;
  end;

  TNfce_configs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TNfce_config_class;
    procedure SetItem(Index: Integer; const Value: TNfce_config_class);
  public
    function New: TNfce_config_class;

    property Items[Index: Integer]: TNfce_config_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TNfce_config_class }

procedure TNfce_config_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('NFCE_CONFIG');
  with FTable.Fields do
  begin
    AddField('COD_EMPRESA'     , fkInteger , 0  , False, True);
    AddField('USAR_CONF_NFE'   , fkString  , 1               );
    AddField('CERT_ARQUIVOPFX' , fkString  , 256             );
    AddField('CERT_NUM_SERIE'  , fkString  , 64              );
    AddField('CERT_SENHA'      , fkString  , 32              );
    AddField('CSC_ID1'         , fkString  , 6               );
    AddField('CSC_TOKEN1'      , fkString  , 36              );
    AddField('CSC_ID2'         , fkString  , 6               );
    AddField('CSC_TOKEN2'      , fkString  , 36              );
    AddField('WS_UF'           , fkString  , 2               );
    AddField('WS_TBAMB'        , fkString  , 1               );
    AddField('WS_SINC_ASSINC'  , fkString  , 1               );
    AddField('WS_AGUARDAR'     , fkInteger                   );
    AddField('WS_TENTATIVAS'   , fkInteger                   );
    AddField('WS_INTERVALO'    , fkInteger                   );
    AddField('WS_PROXY_HOST'   , fkString  , 64              );
    AddField('WS_PROXY_PORT'   , fkString  , 32              );
    AddField('WS_PROXY_USER'   , fkString  , 64              );
    AddField('WS_PROXY_PASS'   , fkString  , 64              );
    AddField('WS_TIMEOUT'      , fkInteger                   );
    AddField('WS_VISUALIZAR'   , fkString  , 1               );
    AddField('ARQ_PATH_SALVAR' , fkString  , 256             );
    AddField('ARQ_PATH_SCHEMA' , fkString  , 256             );
    AddField('ARQ_LOGO_EMP'    , fkString  , 256             );
    AddField('EMAIL_SMPT_HOST' , fkString  , 50              );
    AddField('EMAIL_SMTP_PORTA', fkInteger                   );
    AddField('EMAIL_USERNAME'  , fkString  , 50              );
    AddField('EMAIL_PASSWORD'  , fkString  , 30              );
    AddField('EMAIL_USA_SSL'   , fkString  , 1               );
    AddField('EMAIL_ASSUNTO'   , fkString  , 70              );
    AddField('EMAIL_MENSAGEM'  , fkTStrings                  );
    AddField('TPEMIS'          , fkInteger                   );
    AddField('XJUST'           , fkString  , 256             );
    AddField('EMAIL_USA_TLS'   , fkString  , 1               );
    AddField('WS_LIB_SSL'      , fkInteger                   );
    AddField('XJUST_AUTO'      , fkString  , 256             );
    AddField('DHCONT'          , fkDateTime                  );
    AddField('CERT_DADOSPFX'   , fkTStrings                  );
  end;
  Femail_mensagem := TStringList.Create;
  Fcert_dadospfx  := TStringList.Create;
end;

constructor TNfce_config_class.Create;
begin
  InitializeObjects;
end;

destructor TNfce_config_class.Destroy;
begin
  if Assigned(Femail_mensagem) then
    FreeAndNil(Femail_mensagem);
  if Assigned(Fcert_dadospfx) then
    FreeAndNil(Fcert_dadospfx);
  inherited;
end;

{ TNfce_configs_class }

function TNfce_configs_class.GetItem(Index: Integer): TNfce_config_class;
begin
  Result := TNfce_config_class(inherited Items[Index]);
end;

function TNfce_configs_class.New: TNfce_config_class;
begin
  Result := TNfce_config_class.Create;
  Add(Result);
end;

procedure TNfce_configs_class.SetItem(Index: Integer; const Value: TNfce_config_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TNfce_config_class);
finalization
  UnRegisterClass(TNfce_config_class);

end.
