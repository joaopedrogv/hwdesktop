unit empresa_nfe_class;

interface

uses
{$IFDEF VER180}
  Classes,
  Contnrs,
  DB;
{$ELSE}
  System.Classes,
  System.Contnrs,
  Data.DB;
{$ENDIF}

type
  TEmpresa_nfe_class = class(TObject)
  private
    Fcgc_emp             : string;
    Fie_emp              : string;
    Fim_emp              : string;
    Fcnae_fiscal         : string;
    Fnome_emp            : string;
    Ffantasia_emp        : string;
    Fendreco_emp         : string;
    Fnumero_end          : Integer;
    Fcomplemento_emp     : string;
    Fbairro_emp          : string;
    Fibge_cod_cidade     : Integer;
    Fcep_emp             : string;
    Fcidade_emp          : string;
    Fwebserv_uf          : string;
    Ftelefone_emp        : string;
    Fnfe_numserie_cert   : string;
    Fwebserv_ambiente    : string;
    Fnfe_logomarca       : string;
    Fnfe_logpath         : string;
    Fsmtp_emp            : string;
    Fporta_smtp          : Integer;
    Flogin_emp           : string;
    Femail_emp           : string;
    Femail_senha         : string;
    Femail_usassl        : string;
    Femail_usatls        : string;
    Fassunto_nfe         : string;
    Fnfe_xjust           : string;
    Fnfe_dhcont          : TDateTime;
    Fwebserv_visualizar  : string;
    Fmensagem_nfe        : TStrings;
    Fnfe_tmpretornomil   : Integer;
    Fibge_codigo_uf      : Integer;
    Fnfe_gravalog        : string;
    Fms_val_liq_nfe      : string;
    Fcasas_decimais      : Integer;
    Fnfe_enderecopdf     : string;
    Fnfe_danfe_tipo      : string;
    Fnfe_qtdelimitenfpend: Integer;
    Fnfependemdias       : Integer;
    Fdias_aviso          : Integer;
    Fbusca_cod_no_prod   : string;
    Fnfe_caminho_cert    : string;
    Fnfe_senha__cert     : string;
    Fnfe_danfe_foremiss  : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property cgc_emp             : string    read Fcgc_emp              write Fcgc_emp;
    property ie_emp              : string    read Fie_emp               write Fie_emp;
    property im_emp              : string    read Fim_emp               write Fim_emp;
    property cnae_fiscal         : string    read Fcnae_fiscal          write Fcnae_fiscal;
    property nome_emp            : string    read Fnome_emp             write Fnome_emp;
    property fantasia_emp        : string    read Ffantasia_emp         write Ffantasia_emp;
    property endreco_emp         : string    read Fendreco_emp          write Fendreco_emp;
    property numero_end          : Integer   read Fnumero_end           write Fnumero_end;
    property complemento_emp     : string    read Fcomplemento_emp      write Fcomplemento_emp;
    property bairro_emp          : string    read Fbairro_emp           write Fbairro_emp;
    property ibge_cod_cidade     : Integer   read Fibge_cod_cidade      write Fibge_cod_cidade;
    property cep_emp             : string    read Fcep_emp              write Fcep_emp;
    property cidade_emp          : string    read Fcidade_emp           write Fcidade_emp;
    property webserv_uf          : string    read Fwebserv_uf           write Fwebserv_uf;
    property telefone_emp        : string    read Ftelefone_emp         write Ftelefone_emp;
    property nfe_numserie_cert   : string    read Fnfe_numserie_cert    write Fnfe_numserie_cert;
    property webserv_ambiente    : string    read Fwebserv_ambiente     write Fwebserv_ambiente;
    property nfe_logomarca       : string    read Fnfe_logomarca        write Fnfe_logomarca;
    property nfe_logpath         : string    read Fnfe_logpath          write Fnfe_logpath;
    property smtp_emp            : string    read Fsmtp_emp             write Fsmtp_emp;
    property porta_smtp          : Integer   read Fporta_smtp           write Fporta_smtp;
    property login_emp           : string    read Flogin_emp            write Flogin_emp;
    property email_emp           : string    read Femail_emp            write Femail_emp;
    property email_senha         : string    read Femail_senha          write Femail_senha;
    property email_usassl        : string    read Femail_usassl         write Femail_usassl;
    property email_usatls        : string    read Femail_usatls         write Femail_usatls;
    property assunto_nfe         : string    read Fassunto_nfe          write Fassunto_nfe;
    property nfe_xjust           : string    read Fnfe_xjust            write Fnfe_xjust;
    property nfe_dhcont          : TDateTime read Fnfe_dhcont           write Fnfe_dhcont;
    property webserv_visualizar  : string    read Fwebserv_visualizar   write Fwebserv_visualizar;
    property mensagem_nfe        : TStrings  read Fmensagem_nfe         write Fmensagem_nfe;
    property nfe_tmpretornomil   : Integer   read Fnfe_tmpretornomil    write Fnfe_tmpretornomil;
    property ibge_codigo_uf      : Integer   read Fibge_codigo_uf       write Fibge_codigo_uf;
    property nfe_gravalog        : string    read Fnfe_gravalog         write Fnfe_gravalog;
    property ms_val_liq_nfe      : string    read Fms_val_liq_nfe       write Fms_val_liq_nfe;
    property casas_decimais      : Integer   read Fcasas_decimais       write Fcasas_decimais;
    property nfe_enderecopdf     : string    read Fnfe_enderecopdf      write Fnfe_enderecopdf;
    property nfe_danfe_tipo      : string    read Fnfe_danfe_tipo       write Fnfe_danfe_tipo;
    property nfe_qtdelimitenfpend: Integer   read Fnfe_qtdelimitenfpend write Fnfe_qtdelimitenfpend;
    property nfependemdias       : Integer   read Fnfependemdias        write Fnfependemdias;
    property dias_aviso          : Integer   read Fdias_aviso           write Fdias_aviso;
    property busca_cod_no_prod   : string    read Fbusca_cod_no_prod    write Fbusca_cod_no_prod;
    property nfe_caminho_cert    : string    read Fnfe_caminho_cert     write Fnfe_caminho_cert;
    property nfe_senha__cert     : string    read Fnfe_senha__cert      write Fnfe_senha__cert;
    property nfe_danfe_foremiss  : string    read Fnfe_danfe_foremiss   write Fnfe_danfe_foremiss;
  end;

  TEmpresa_nfe_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TEmpresa_nfe_class;
    procedure SetItem(Index: Integer; const Value: TEmpresa_nfe_class);
  public
    function New: TEmpresa_nfe_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TEmpresa_nfe_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TEmpresa_nfe_class }

constructor TEmpresa_nfe_class.Create;
begin
  Fmensagem_nfe := TStringList.Create;
end;

destructor TEmpresa_nfe_class.Destroy;
begin
  if Assigned(Fmensagem_nfe) then
    FreeAndNil(Fmensagem_nfe);
  inherited;
end;

class function TEmpresa_nfe_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cgc_emp, @ie_emp, @im_emp, @cnae_fiscal, @nome_emp, @fantasia_emp, @endreco_emp, @numero_end,' +
            ' @complemento_emp, @bairro_emp, @ibge_cod_cidade, @cep_emp, @cidade_emp, @webserv_uf, @telefone_emp,' +
            ' @nfe_numserie_cert, @webserv_ambiente, @nfe_logomarca, @nfe_logpath, @smtp_emp, @porta_smtp, @login_emp,' +
            ' @email_emp, @email_senha, @email_usassl, @email_usatls, @assunto_nfe, @nfe_xjust, @nfe_dhcont, @webserv_visualizar,' +
            ' @mensagem_nfe, @nfe_tmpretornomil, @ibge_codigo_uf, @nfe_gravalog, @ms_val_liq_nfe, @casas_decimais,' +
            ' @nfe_enderecopdf, @nfe_danfe_tipo, @nfe_qtdelimitenfpend, @nfependemdias, @dias_aviso, @busca_cod_no_prod,' +
            ' @nfe_caminho_cert, @nfe_senha__cert, @nfe_danfe_foremiss';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TEmpresa_nfe_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcgc_emp              := Trim(ADataSet.FieldByName('CGC_EMP').AsString);
    Fie_emp               := Trim(ADataSet.FieldByName('IE_EMP').AsString);
    Fim_emp               := Trim(ADataSet.FieldByName('IM_EMP').AsString);
    Fcnae_fiscal          := Trim(ADataSet.FieldByName('CNAE_FISCAL').AsString);
    Fnome_emp             := Trim(ADataSet.FieldByName('NOME_EMP').AsString);
    Ffantasia_emp         := Trim(ADataSet.FieldByName('FANTASIA_EMP').AsString);
    Fendreco_emp          := Trim(ADataSet.FieldByName('ENDRECO_EMP').AsString);
    Fnumero_end           := ADataSet.FieldByName('NUMERO_END').AsInteger;
    Fcomplemento_emp      := Trim(ADataSet.FieldByName('COMPLEMENTO_EMP').AsString);
    Fbairro_emp           := Trim(ADataSet.FieldByName('BAIRRO_EMP').AsString);
    Fibge_cod_cidade      := ADataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;
    Fcep_emp              := Trim(ADataSet.FieldByName('CEP_EMP').AsString);
    Fcidade_emp           := Trim(ADataSet.FieldByName('CIDADE_EMP').AsString);
    Fwebserv_uf           := Trim(ADataSet.FieldByName('WEBSERV_UF').AsString);
    Ftelefone_emp         := Trim(ADataSet.FieldByName('TELEFONE_EMP').AsString);
    Fnfe_numserie_cert    := Trim(ADataSet.FieldByName('NFE_NUMSERIE_CERT').AsString);
    Fwebserv_ambiente     := Trim(ADataSet.FieldByName('WEBSERV_AMBIENTE').AsString);
    Fnfe_logomarca        := Trim(ADataSet.FieldByName('NFE_LOGOMARCA').AsString);
    Fnfe_logpath          := Trim(ADataSet.FieldByName('NFE_LOGPATH').AsString);
    Fsmtp_emp             := Trim(ADataSet.FieldByName('SMTP_EMP').AsString);
    Fporta_smtp           := ADataSet.FieldByName('PORTA_SMTP').AsInteger;
    Flogin_emp            := Trim(ADataSet.FieldByName('LOGIN_EMP').AsString);
    Femail_emp            := Trim(ADataSet.FieldByName('EMAIL_EMP').AsString);
    Femail_senha          := Trim(ADataSet.FieldByName('EMAIL_SENHA').AsString);
    Femail_usassl         := Trim(ADataSet.FieldByName('EMAIL_USASSL').AsString);
    Femail_usatls         := Trim(ADataSet.FieldByName('EMAIL_USATLS').AsString);
    Fassunto_nfe          := Trim(ADataSet.FieldByName('ASSUNTO_NFE').AsString);
    Fnfe_xjust            := Trim(ADataSet.FieldByName('NFE_XJUST').AsString);
    Fnfe_dhcont           := ADataSet.FieldByName('NFE_DHCONT').AsDateTime;
    Fwebserv_visualizar   := Trim(ADataSet.FieldByName('WEBSERV_VISUALIZAR').AsString);
    Fmensagem_nfe.Text    := Trim(ADataSet.FieldByName('MENSAGEM_NFE').AsString);
    Fnfe_tmpretornomil    := ADataSet.FieldByName('NFE_TMPRETORNOMIL').AsInteger;
    Fibge_codigo_uf       := ADataSet.FieldByName('IBGE_CODIGO_UF').AsInteger;
    Fnfe_gravalog         := Trim(ADataSet.FieldByName('NFE_GRAVALOG').AsString);
    Fms_val_liq_nfe       := Trim(ADataSet.FieldByName('MS_VAL_LIQ_NFE').AsString);
    Fcasas_decimais       := ADataSet.FieldByName('CASAS_DECIMAIS').AsInteger;
    Fnfe_enderecopdf      := Trim(ADataSet.FieldByName('NFE_ENDERECOPDF').AsString);
    Fnfe_danfe_tipo       := Trim(ADataSet.FieldByName('NFE_DANFE_TIPO').AsString);
    Fnfe_qtdelimitenfpend := ADataSet.FieldByName('NFE_QTDELIMITENFPEND').AsInteger;
    Fnfependemdias        := ADataSet.FieldByName('NFEPENDEMDIAS').AsInteger;
    Fdias_aviso           := ADataSet.FieldByName('DIAS_AVISO').AsInteger;
    Fbusca_cod_no_prod    := Trim(ADataSet.FieldByName('BUSCA_COD_NO_PROD').AsString);
    Fnfe_caminho_cert     := Trim(ADataSet.FieldByName('NFE_CAMINHO_CERT').AsString);
    Fnfe_senha__cert      := Trim(ADataSet.FieldByName('NFE_SENHA__CERT').AsString);
    Fnfe_danfe_foremiss   := Trim(ADataSet.FieldByName('NFE_DANFE_FOREMISS').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('CGC_EMP'             )) then Fcgc_emp              := Trim(ADataSet.FieldByName('CGC_EMP').AsString);
    if Assigned(ADataSet.FindField('IE_EMP'              )) then Fie_emp               := Trim(ADataSet.FieldByName('IE_EMP').AsString);
    if Assigned(ADataSet.FindField('IM_EMP'              )) then Fim_emp               := Trim(ADataSet.FieldByName('IM_EMP').AsString);
    if Assigned(ADataSet.FindField('CNAE_FISCAL'         )) then Fcnae_fiscal          := Trim(ADataSet.FieldByName('CNAE_FISCAL').AsString);
    if Assigned(ADataSet.FindField('NOME_EMP'            )) then Fnome_emp             := Trim(ADataSet.FieldByName('NOME_EMP').AsString);
    if Assigned(ADataSet.FindField('FANTASIA_EMP'        )) then Ffantasia_emp         := Trim(ADataSet.FieldByName('FANTASIA_EMP').AsString);
    if Assigned(ADataSet.FindField('ENDRECO_EMP'         )) then Fendreco_emp          := Trim(ADataSet.FieldByName('ENDRECO_EMP').AsString);
    if Assigned(ADataSet.FindField('NUMERO_END'          )) then Fnumero_end           := ADataSet.FieldByName('NUMERO_END').AsInteger;
    if Assigned(ADataSet.FindField('COMPLEMENTO_EMP'     )) then Fcomplemento_emp      := Trim(ADataSet.FieldByName('COMPLEMENTO_EMP').AsString);
    if Assigned(ADataSet.FindField('BAIRRO_EMP'          )) then Fbairro_emp           := Trim(ADataSet.FieldByName('BAIRRO_EMP').AsString);
    if Assigned(ADataSet.FindField('IBGE_COD_CIDADE'     )) then Fibge_cod_cidade      := ADataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;
    if Assigned(ADataSet.FindField('CEP_EMP'             )) then Fcep_emp              := Trim(ADataSet.FieldByName('CEP_EMP').AsString);
    if Assigned(ADataSet.FindField('CIDADE_EMP'          )) then Fcidade_emp           := Trim(ADataSet.FieldByName('CIDADE_EMP').AsString);
    if Assigned(ADataSet.FindField('WEBSERV_UF'          )) then Fwebserv_uf           := Trim(ADataSet.FieldByName('WEBSERV_UF').AsString);
    if Assigned(ADataSet.FindField('TELEFONE_EMP'        )) then Ftelefone_emp         := Trim(ADataSet.FieldByName('TELEFONE_EMP').AsString);
    if Assigned(ADataSet.FindField('NFE_NUMSERIE_CERT'   )) then Fnfe_numserie_cert    := Trim(ADataSet.FieldByName('NFE_NUMSERIE_CERT').AsString);
    if Assigned(ADataSet.FindField('WEBSERV_AMBIENTE'    )) then Fwebserv_ambiente     := Trim(ADataSet.FieldByName('WEBSERV_AMBIENTE').AsString);
    if Assigned(ADataSet.FindField('NFE_LOGOMARCA'       )) then Fnfe_logomarca        := Trim(ADataSet.FieldByName('NFE_LOGOMARCA').AsString);
    if Assigned(ADataSet.FindField('NFE_LOGPATH'         )) then Fnfe_logpath          := Trim(ADataSet.FieldByName('NFE_LOGPATH').AsString);
    if Assigned(ADataSet.FindField('SMTP_EMP'            )) then Fsmtp_emp             := Trim(ADataSet.FieldByName('SMTP_EMP').AsString);
    if Assigned(ADataSet.FindField('PORTA_SMTP'          )) then Fporta_smtp           := ADataSet.FieldByName('PORTA_SMTP').AsInteger;
    if Assigned(ADataSet.FindField('LOGIN_EMP'           )) then Flogin_emp            := Trim(ADataSet.FieldByName('LOGIN_EMP').AsString);
    if Assigned(ADataSet.FindField('EMAIL_EMP'           )) then Femail_emp            := Trim(ADataSet.FieldByName('EMAIL_EMP').AsString);
    if Assigned(ADataSet.FindField('EMAIL_SENHA'         )) then Femail_senha          := Trim(ADataSet.FieldByName('EMAIL_SENHA').AsString);
    if Assigned(ADataSet.FindField('EMAIL_USASSL'        )) then Femail_usassl         := Trim(ADataSet.FieldByName('EMAIL_USASSL').AsString);
    if Assigned(ADataSet.FindField('EMAIL_USATLS'        )) then Femail_usatls         := Trim(ADataSet.FieldByName('EMAIL_USATLS').AsString);
    if Assigned(ADataSet.FindField('ASSUNTO_NFE'         )) then Fassunto_nfe          := Trim(ADataSet.FieldByName('ASSUNTO_NFE').AsString);
    if Assigned(ADataSet.FindField('NFE_XJUST'           )) then Fnfe_xjust            := Trim(ADataSet.FieldByName('NFE_XJUST').AsString);
    if Assigned(ADataSet.FindField('NFE_DHCONT'          )) then Fnfe_dhcont           := ADataSet.FieldByName('NFE_DHCONT').AsDateTime;
    if Assigned(ADataSet.FindField('WEBSERV_VISUALIZAR'  )) then Fwebserv_visualizar   := Trim(ADataSet.FieldByName('WEBSERV_VISUALIZAR').AsString);
    if Assigned(ADataSet.FindField('MENSAGEM_NFE'        )) then Fmensagem_nfe.Text    := Trim(ADataSet.FieldByName('MENSAGEM_NFE').AsString);
    if Assigned(ADataSet.FindField('NFE_TMPRETORNOMIL'   )) then Fnfe_tmpretornomil    := ADataSet.FieldByName('NFE_TMPRETORNOMIL').AsInteger;
    if Assigned(ADataSet.FindField('IBGE_CODIGO_UF'      )) then Fibge_codigo_uf       := ADataSet.FieldByName('IBGE_CODIGO_UF').AsInteger;
    if Assigned(ADataSet.FindField('NFE_GRAVALOG'        )) then Fnfe_gravalog         := Trim(ADataSet.FieldByName('NFE_GRAVALOG').AsString);
    if Assigned(ADataSet.FindField('MS_VAL_LIQ_NFE'      )) then Fms_val_liq_nfe       := Trim(ADataSet.FieldByName('MS_VAL_LIQ_NFE').AsString);
    if Assigned(ADataSet.FindField('CASAS_DECIMAIS'      )) then Fcasas_decimais       := ADataSet.FieldByName('CASAS_DECIMAIS').AsInteger;
    if Assigned(ADataSet.FindField('NFE_ENDERECOPDF'     )) then Fnfe_enderecopdf      := Trim(ADataSet.FieldByName('NFE_ENDERECOPDF').AsString);
    if Assigned(ADataSet.FindField('NFE_DANFE_TIPO'      )) then Fnfe_danfe_tipo       := Trim(ADataSet.FieldByName('NFE_DANFE_TIPO').AsString);
    if Assigned(ADataSet.FindField('NFE_QTDELIMITENFPEND')) then Fnfe_qtdelimitenfpend := ADataSet.FieldByName('NFE_QTDELIMITENFPEND').AsInteger;
    if Assigned(ADataSet.FindField('NFEPENDEMDIAS'       )) then Fnfependemdias        := ADataSet.FieldByName('NFEPENDEMDIAS').AsInteger;
    if Assigned(ADataSet.FindField('DIAS_AVISO'          )) then Fdias_aviso           := ADataSet.FieldByName('DIAS_AVISO').AsInteger;
    if Assigned(ADataSet.FindField('BUSCA_COD_NO_PROD'   )) then Fbusca_cod_no_prod    := Trim(ADataSet.FieldByName('BUSCA_COD_NO_PROD').AsString);
    if Assigned(ADataSet.FindField('NFE_CAMINHO_CERT'    )) then Fnfe_caminho_cert     := Trim(ADataSet.FieldByName('NFE_CAMINHO_CERT').AsString);
    if Assigned(ADataSet.FindField('NFE_SENHA__CERT'     )) then Fnfe_senha__cert      := Trim(ADataSet.FieldByName('NFE_SENHA__CERT').AsString);
    if Assigned(ADataSet.FindField('NFE_DANFE_FOREMISS'  )) then Fnfe_danfe_foremiss   := Trim(ADataSet.FieldByName('NFE_DANFE_FOREMISS').AsString);
  end;
end;

{ TEmpresa_nfe_classList }

function TEmpresa_nfe_classList.GetItem(Index: Integer): TEmpresa_nfe_class;
begin
  Result := TEmpresa_nfe_class(inherited Items[Index]);
end;

function TEmpresa_nfe_classList.New: TEmpresa_nfe_class;
begin
  Result := TEmpresa_nfe_class.Create;
  Add(Result);
end;

procedure TEmpresa_nfe_classList.SetItem(Index: Integer; const Value: TEmpresa_nfe_class);
begin
  Put(Index, Value);
end;

procedure TEmpresa_nfe_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.

