unit ConfiguracoesRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  IConfiguracoesRepositoryUnit,
  ConfiguracaoEtdUnit,
  ParameterValueUnit,
  QueryResultUnit,
  ConfigLegacyTypes,
  TipoComunsUnit,
  EmailConfigRemetenteEnumUnit,
  EmailConfigModelUnit;

type

  ConfiguracoesRepository = class(IConfiguracoesRepository)
  private
    function CreateItemFromQuery(Q: QueryResult): ConfiguracaoEtd;
  public
    procedure Post(Input: ConfiguracaoEtd); override;
    procedure Put(Input: ConfiguracaoEtd); override;
    function GetByKey(const Chave: string): ConfiguracaoEtd; overload; override;
    function GetByKey(const Chave: string; EmpresaId: Integer): ConfiguracaoEtd; overload; override;
    function GetByKey(const Chaves: TArrayString): ConfiguracaoEtdList; overload; override;
    function GetByKey(const Chaves: TArrayString; EmpresaId: Integer): ConfiguracaoEtdList; overload; override;
    function GetLegacy(AConfigs: ConfigLegacySet): ConfigLegacyData; override;
    function GetEmailConfig(RemetenteConfig: EmailConfigRemetenteEnum): EmailConfigModel; override;
    procedure SaveLegacy(const AConfigs: ConfigLegacyData); override;
    function GetLegacyPrefeituraNFSe(): string; override;
  end;

implementation

uses
  Classes, SysUtils,
  StatusRegistroEnumUnit,
  StringNullableUnit, StringServiceUnit, ScalarResultUnit, Contnrs, CacheableRepositoryUnit;

const
  CFG_FIELDS: array[ConfigLegacyEnum] of string = (
    'CGC_EMP', 'IM_EMP', 'REGIME', 'IBGE_COD_CIDADE' , 'SERIE_SERV_NFE', 'NFS_OPTANTESIMPLES', 'NFS_REGIMETRIB',
    'SIMPLES_EMP', 'ALIQ_SIMPLES_ICM', 'ALIQ_SIMPLES_ISS', 'PIS_EMP', 'COFINS_EMP', 'NFE_CAMINHO_CERT',
    'NFE_SENHA__CERT', 'NFE_NUMSERIE_CERT', 'NFS_CERT', 'LICENCANFSE', 'WEBSERV_AMBIENTE', 'NFE_LOGPATH', 'NFS_CERT',
    'LICENCANFSE', 'INCENTIVADORCULT', 'NFSE_OBSOS_SEMENTER', 'NFE_DHCONT', 'NFE_XJUST', 'NFE_GRAVALOG'
	);

type
  WraperConfigEmailModel = class(RecordWrapper)
    Data: EmailConfigModel;
  end;

  WraperPrefeituraEmpresa = class(RecordWrapper)
    Data: string;
  end;

{ ConfiguracoesRepository }

function ConfiguracoesRepository.CreateItemFromQuery(
  Q: QueryResult): ConfiguracaoEtd;
var
  AValorStrings: TStrings;
  S: StringNullable;
begin
  S := Q.FieldAsStringNullable('VALUE1_B');
  if S.IsNull then
    AValorStrings := nil
  else
  begin
    AValorStrings := TStringList.Create();
    AValorStrings.Text := S.Value;
  end;

  Result := ConfiguracaoEtd.Create(
    Q.FieldAsString('CHAVE'),
    Q.FieldAsInteger('COD_EMPRESA'),
    Q.FieldAsString('DISPLAY_'),
    Q.FieldAsString('TYPE1_'),
    Q.FieldAsStringNullable('VALUE1_VC'),
    Q.FieldAsDoubleNullable('VALUE1_F'),
    AValorStrings,
    Q.FieldAsDateTimeNullable('VALUE_DT'),
    Q.FieldAsString('TAG'),
    StatusRegistroEnum( Q.FieldAsInteger('ATIVO') )
  );
end;

function ConfiguracoesRepository.GetByKey(const Chave: string;
  EmpresaId: Integer): ConfiguracaoEtd;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT ORDEM, CHAVE, COD_EMPRESA, DISPLAY_, TAG, TYPE1_, VALUE1_VC, VALUE1_F, VALUE1_B, ' +
    '       ATIVO, VALUE_DT ' +
    ' FROM CONFIG_SISTEMA' +
    ' where CHAVE = ''%s'' and COD_EMPRESA = %D ', [ Chave, EmpresaId ]
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( Q );

  finally
    Q.Free();
  end;
end;

function ConfiguracoesRepository.GetByKey(const Chaves: TArrayString;
  EmpresaId: Integer): ConfiguracaoEtdList;
var
  Q: QueryResult;
  Keys: TArrayString;
  I: Integer;
begin
  SetLength(Keys, Length(Chaves));
  for I := Low(Chaves) to High(Chaves) do
    Keys[I] := QuotedStr(Chaves[I]);

  Q := FConnection.CreateQuery(
    'SELECT ORDEM, CHAVE, COD_EMPRESA, DISPLAY_, TAG, TYPE1_, VALUE1_VC, VALUE1_F, VALUE1_B, ' +
    '       ATIVO, VALUE_DT ' +
    ' FROM CONFIG_SISTEMA' +
    ' where CHAVE in (%s) and COD_EMPRESA = %D ', [ StringService.Join(',', Keys), EmpresaId ]
  );
  Result := ConfiguracaoEtdList.Create();
  try
    while not Q.Eof do
    begin
      Result.Add( CreateItemFromQuery( Q ) );

      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

function ConfiguracoesRepository.GetByKey(const Chave: string): ConfiguracaoEtd;
begin
  Result := Self.GetByKey( Chave, FSession.EmpresaId );
end;

function ConfiguracoesRepository.GetByKey(const Chaves: TArrayString): ConfiguracaoEtdList;
begin
  Result := Self.GetByKey( Chaves, FSession.EmpresaId );
end;

function ConfiguracoesRepository.GetEmailConfig(
  RemetenteConfig: EmailConfigRemetenteEnum
): EmailConfigModel;
var
  CacheKey: string;
  SQL: string;
  Q: QueryResult;
  W: WraperConfigEmailModel;
begin
  CacheKey := Format('GetConfigEmail_%d_%d', [ FSession.EmpresaId, Ord(RemetenteConfig) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  case RemetenteConfig of
    cerDFes: SQL :=
      'select ' +
      'e.smtp_emp smtp, e.porta_smtp port, e.login_emp username, e.email_senha password, e.email_emp fromemail, ' +
      'e.nome_emp fromname, e.email_usassl usessl, e.email_usatls usetls, e.assunto_nfe SubjectTemplate, ' +
      'e.mensagem_nfe BodyTemplate ' +
      'from empresa e ' +
      'where e.cod_empresa = %d';

    cerOthers: SQL :=
      'select ' +
      'e.smtp_cobranca smtp, e.smtpporta_cobranca port, e.login_cobranca username, e.senha_email_cobranca password, ' +
      'e.email_cobranca fromemail, e.remetente_email_cobranca fromname, e.email_cob_segurancassl usessl, ' +
      '''S''  usetls, '''' SubjectTemplate, '''' BodyTemplate ' +
      'from empresa e ' +
      'where e.cod_empresa = %d';
  end;

  Q := FConnection.CreateQuery(SQL, [ FSession.EmpresaId ]);
  try
    Result := EmailConfigModel.Create(
      {SMTPServer} Q.FieldAsString('smtp'),
      {SMTPPort} Q.FieldAsString('port'),
      {Username} Q.FieldAsString('username'),
      {Password} Q.FieldAsString('password'),
      {FromEmail} Q.FieldAsString('fromemail'),
      {FromName} Q.FieldAsString('fromname'),
      {SubjectTemplate} Q.FieldAsString('SubjectTemplate'),
      {BodyTemplate} Q.FieldAsString('BodyTemplate'),
      {UseSSL} Q.FieldAsString('usessl') = 'S',
      {UseTLS} Q.FieldAsString('usetls') = 'S'
    );
    W := WraperConfigEmailModel.Create();
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W, 1);
  finally
    Q.Free();
  end;
end;

function ConfiguracoesRepository.GetLegacy(AConfigs: ConfigLegacySet): ConfigLegacyData;
var
  Q: QueryResult;
  S: TArrayString;
  E: ConfigLegacyEnum;
  V: ConfigLegacyArray;
  I: Integer;
begin
  SetLength(S, Ord(High(ConfigLegacyEnum)) + 1);
  I := -1;
  for E := Low(ConfigLegacyEnum) to High(ConfigLegacyEnum) do
    if E in AConfigs then
    begin
      Inc(I);
      S[I] := CFG_FIELDS[E];
    end;
  SetLength(S, I + 1);

  if Length(S) = 0 then
  begin
    Result := ConfigLegacyData.Create(AConfigs, V);
    Exit;
  end;

  Q := FConnection.CreateQuery(
    'SELECT %s ' +
    ' FROM EMPRESA' +
    ' where COD_EMPRESA = %D ', [ StringService.Join(',', S), FSession.EmpresaId ]
  );
  try

    if Q.IsEmpty then
      Exit;

    for E := Low(ConfigLegacyEnum) to High(ConfigLegacyEnum) do
      if E in AConfigs then
        V[E] := Q.FieldAsScalar( CFG_FIELDS[E] );

    Result := ConfigLegacyData.Create( AConfigs, V );

  finally
    Q.Free();
  end;
end;

function ConfiguracoesRepository.GetLegacyPrefeituraNFSe(): string;
var
  CacheKey: string;
  SQL: string;
  Q: QueryResult;
  W: WraperPrefeituraEmpresa;
begin
  CacheKey := Format('GetLegacyPrefeituraNFSe_%d', [ FSession.EmpresaId ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  Q := FConnection.CreateQuery(
    'select ' +
    'e.cidade_emp, e.endereco_pref, e.bairro_pref, es.sigla_uf, e.cep_pref ' +
    'from empresa e ' +                                                                 
    'left join estados es on es.codigo_uf = e.uf_emp ' +
    'where e.cod_empresa = %d',                                 
     [ FSession.EmpresaId ]);

  try
    Result := Format('PREFEITURA MUNICIPAL DE %s' + sLineBreak + '%s - %s - %s - %s - %s', [
      Q.FieldAsString('cidade_emp'),
      Q.FieldAsString('endereco_pref'),
      Q.FieldAsString('bairro_pref'),
      //sLineBreak,
      Q.FieldAsString('cidade_emp'),
      Q.FieldAsString('sigla_uf'),
      Q.FieldAsString('cep_pref')
    ]);

    W := WraperPrefeituraEmpresa.Create();
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W, 5);
  finally
    Q.Free();
  end;
end;

procedure ConfiguracoesRepository.Post(Input: ConfiguracaoEtd);
var
  ValorStrings: StringNullable;
begin
  if Input.ValorStrings = nil then
    ValorStrings := StringNullable.NullInstance()
  else
    ValorStrings := StringNullable.Create(Input.ValorStrings.Text);

  FConnection.ExecuteCommand(
    'INSERT INTO CONFIG_SISTEMA ' +
    '(CHAVE, COD_EMPRESA, DISPLAY_, TAG, TYPE1_, VALUE1_VC, VALUE1_F, VALUE1_B, ATIVO, VALUE_DT ) ' +
    'VALUES ' +
    '(:CHAVE, :COD_EMPRESA, :DISPLAY_, :TAG, :TYPE1_, :VALUE1_VC, :VALUE1_F, :VALUE1_B, :ATIVO, :VALUE_DT )',
    ParametersBuilder.Create(10)
      .ByName( 'CHAVE', Input.Chave )
      .ByName( 'COD_EMPRESA', Input.EmpresaId )
      .ByName( 'DISPLAY_', Input.Display )
      .ByName( 'TAG', Input.Tags )
      .ByName( 'TYPE1_', Input.Tipo )
      .ByName( 'VALUE1_VC', Input.ValorString )
      .ByName( 'VALUE1_F', Input.ValorDouble )
      .ByName( 'VALUE1_B', ValorStrings )
      .ByName( 'ATIVO', Ord(Input.Ativo) )
      .ByName( 'VALUE_DT', Input.ValorDateTime )
      .Build()
  );
end;

procedure ConfiguracoesRepository.Put(Input: ConfiguracaoEtd);
var
  ValorStrings: StringNullable;
begin
  if Input.ValorStrings = nil then
    ValorStrings := StringNullable.NullInstance()
  else
    ValorStrings := StringNullable.Create(Input.ValorStrings.Text);

  FConnection.ExecuteCommand(
    'UPDATE CONFIG_SISTEMA SET ' +
    'DISPLAY_ = :DISPLAY_, TAG = :TAG, TYPE1_ = :TYPE1_, VALUE1_VC = :VALUE1_VC, VALUE1_F = :VALUE1_F, ' +
    'VALUE1_B = :VALUE1_B, ATIVO = :ATIVO, VALUE_DT = :VALUE_DT ' +
    'WHERE CHAVE = :CHAVE AND COD_EMPRESA = :COD_EMPRESA ',
    ParametersBuilder.Create(10)
      .ByName( 'CHAVE', Input.Chave )
      .ByName( 'COD_EMPRESA', Input.EmpresaId )
      .ByName( 'DISPLAY_', Input.Display )
      .ByName( 'TAG', Input.Tags )
      .ByName( 'TYPE1_', Input.Tipo )
      .ByName( 'VALUE1_VC', Input.ValorString )
      .ByName( 'VALUE1_F', Input.ValorDouble )
      .ByName( 'VALUE1_B', ValorStrings )
      .ByName( 'ATIVO', Ord(Input.Ativo) )
      .ByName( 'VALUE_DT', Input.ValorDateTime )
      .Build()
  );
end;

procedure ConfiguracoesRepository.SaveLegacy(const AConfigs: ConfigLegacyData);
var
  S: TArrayString;
  E: ConfigLegacyEnum;
  I: Integer;
  Params: IParametersBuilder;
  SC: ScalarResult;
begin
  Params := ParametersBuilder.Create(0);

  SetLength(S, Ord(High(ConfigLegacyEnum)) + 1);

  I := -1;
  for E := Low(ConfigLegacyEnum) to High(ConfigLegacyEnum) do
    if AConfigs.HasValue(E) then
    begin
      Inc(I);
      S[I] := Format('%s = :%s ', [ CFG_FIELDS[E], CFG_FIELDS[E] ]);
      SC := AConfigs.GetScalar(E);
      case SC.DataType of
        srtNull    : Params.ByName( CFG_FIELDS[E], StringNullable.NullInstance() );
        srtString  : Params.ByName( CFG_FIELDS[E], SC.AsString );
        srtDateTime: Params.ByName( CFG_FIELDS[E], SC.AsDateTime );
        srtDouble  : Params.ByNameF( CFG_FIELDS[E], SC.AsFloat );
        srtCurrency: Params.ByNameC( CFG_FIELDS[E], SC.AsCurrency );
        srtInt     : Params.ByNameI64( CFG_FIELDS[E], SC.AsInt64 );
        //srtBool    : Params.ByName( CFG_FIELDS[E], SC.AsBoolean );
        else
          raise Exception.Create('ConfiguracoesRepository.SaveLegacy SC.DataType unknow');
      end;
    end;
  SetLength(S, I + 1);

  if Length(S) = 0 then
    Exit;

  FConnection.ExecuteCommand( Format(
      'UPDATE EMPRESA ' +
      'SET %s ' +
      ' WHERE COD_EMPRESA = %D ', [ StringService.Join(',', S), FSession.EmpresaId ]
    ),
    Params.Build()
  );
end;

end.
