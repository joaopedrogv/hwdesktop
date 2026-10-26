unit FakeConfiguracoesRepositoryUnit;

interface

uses
  Classes,
  System.Generics.Collections,
  IConfiguracoesRepositoryUnit,
  ConfiguracaoEtdUnit,
  ConfigLegacyTypes,
  EmailConfigModelUnit,
  EmailConfigRemetenteEnumUnit,
  TipoComunsUnit,
  StatusRegistroEnumUnit,
  StringNullableUnit,
  DoubleNullableUnit,
  DateAndTimeNullableUnit;

type
  /// <summary>
  ///   Fake em memoria de IConfiguracoesRepository para testes de use case.
  ///   - GetByKey devolve copia desanexada de propriedade do chamador (ValorStrings clonado).
  ///   - Post colide (levanta excecao) quando a chave ja existe; Post/Put devolvem nil.
  ///   - Metodos nao usados pelos cenarios cobertos levantam excecao explicita.
  /// </summary>
  TFakeConfiguracoesRepository = class(IConfiguracoesRepository)
  private
    FConfiguracoes: TObjectDictionary<string, ConfiguracaoEtd>;

    function MontarChave(const AChave: string; AEmpresaId: Integer): string;
    function ClonarConfiguracao(const AOrigem: ConfiguracaoEtd): ConfiguracaoEtd;
    procedure Armazenar(const AChave: string; AEmpresaId: Integer; AConfiguracao: ConfiguracaoEtd);
    procedure NaoSuportado(const AMetodo: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure ConfigurarString(const AChave, AValor: string; AEmpresaId: Integer = 0);
    procedure ConfigurarDouble(const AChave: string; AValor: Double; AEmpresaId: Integer = 0);

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
  SysUtils;

{ TFakeConfiguracoesRepository }

constructor TFakeConfiguracoesRepository.Create;
begin
  inherited Create(nil);
  FConfiguracoes := TObjectDictionary<string, ConfiguracaoEtd>.Create([doOwnsValues]);
end;

destructor TFakeConfiguracoesRepository.Destroy;
begin
  FConfiguracoes.Free;
  inherited;
end;

function TFakeConfiguracoesRepository.MontarChave(const AChave: string; AEmpresaId: Integer): string;
begin
  Result := AChave + '#' + IntToStr(AEmpresaId);
end;

function TFakeConfiguracoesRepository.ClonarConfiguracao(const AOrigem: ConfiguracaoEtd): ConfiguracaoEtd;
begin
  Result := ConfiguracaoEtd.Create(
    AOrigem.Chave,
    AOrigem.EmpresaId,
    AOrigem.Display,
    AOrigem.Tipo,
    AOrigem.ValorString,
    AOrigem.ValorDouble,
    TStringList.Create(),
    AOrigem.ValorDateTime,
    AOrigem.Tags,
    AOrigem.Ativo
  );

  if Assigned(AOrigem.ValorStrings) then
    Result.ValorStrings.AddStrings(AOrigem.ValorStrings);
end;

procedure TFakeConfiguracoesRepository.Armazenar(
  const AChave: string;
  AEmpresaId: Integer;
  AConfiguracao: ConfiguracaoEtd
);
var
  ChaveInterna: string;
begin
  ChaveInterna := MontarChave(AChave, AEmpresaId);

  if FConfiguracoes.ContainsKey(ChaveInterna) then
    FConfiguracoes.Remove(ChaveInterna);

  FConfiguracoes.Add(ChaveInterna, AConfiguracao);
end;

procedure TFakeConfiguracoesRepository.NaoSuportado(const AMetodo: string);
begin
  raise Exception.Create('TFakeConfiguracoesRepository: metodo nao suportado no cenario - ' + AMetodo);
end;

procedure TFakeConfiguracoesRepository.ConfigurarString(
  const AChave, AValor: string;
  AEmpresaId: Integer
);
begin
  Armazenar(AChave, AEmpresaId, ConfiguracaoEtd.Create(
    AChave,
    AEmpresaId,
    '',
    'string',
    StringNullable.Create(AValor),
    DoubleNullable.NullInstance(),
    TStringList.Create(),
    DateTimeNullable.NullInstance(),
    '',
    saAtivo
  ));
end;

procedure TFakeConfiguracoesRepository.ConfigurarDouble(
  const AChave: string;
  AValor: Double;
  AEmpresaId: Integer
);
begin
  Armazenar(AChave, AEmpresaId, ConfiguracaoEtd.Create(
    AChave,
    AEmpresaId,
    '',
    'float',
    StringNullable.NullInstance(),
    DoubleNullable.Create(AValor),
    TStringList.Create(),
    DateTimeNullable.NullInstance(),
    '',
    saAtivo
  ));
end;

procedure TFakeConfiguracoesRepository.Post(Input: ConfiguracaoEtd);
var
  ChaveInterna: string;
begin
  ChaveInterna := MontarChave(Input.Chave, Input.EmpresaId);
  if FConfiguracoes.ContainsKey(ChaveInterna) then
    raise Exception.Create('TFakeConfiguracoesRepository: Post com chave duplicada (' + Input.Chave + ').');

  FConfiguracoes.Add(ChaveInterna, ClonarConfiguracao(Input));
end;

procedure TFakeConfiguracoesRepository.Put(Input: ConfiguracaoEtd);
begin
  Armazenar(Input.Chave, Input.EmpresaId, ClonarConfiguracao(Input));
end;

function TFakeConfiguracoesRepository.GetByKey(const Chave: string): ConfiguracaoEtd;
begin
  Result := GetByKey(Chave, 0);
end;

function TFakeConfiguracoesRepository.GetByKey(const Chave: string; EmpresaId: Integer): ConfiguracaoEtd;
var
  Configuracao: ConfiguracaoEtd;
begin
  Result := nil;

  if FConfiguracoes.TryGetValue(MontarChave(Chave, EmpresaId), Configuracao) then
    Result := ClonarConfiguracao(Configuracao);
end;

function TFakeConfiguracoesRepository.GetByKey(const Chaves: TArrayString): ConfiguracaoEtdList;
begin
  NaoSuportado('GetByKey(TArrayString)');
  Result := nil;
end;

function TFakeConfiguracoesRepository.GetByKey(
  const Chaves: TArrayString;
  EmpresaId: Integer
): ConfiguracaoEtdList;
begin
  NaoSuportado('GetByKey(TArrayString, Integer)');
  Result := nil;
end;

function TFakeConfiguracoesRepository.GetLegacy(AConfigs: ConfigLegacySet): ConfigLegacyData;
begin
  NaoSuportado('GetLegacy');
  Result := Default(ConfigLegacyData);
end;

function TFakeConfiguracoesRepository.GetEmailConfig(
  RemetenteConfig: EmailConfigRemetenteEnum
): EmailConfigModel;
begin
  NaoSuportado('GetEmailConfig');
  Result := EmailConfigModel.Create('', '', '', '', '', '', '', '', False, False);
end;

procedure TFakeConfiguracoesRepository.SaveLegacy(const AConfigs: ConfigLegacyData);
begin
  NaoSuportado('SaveLegacy');
end;

function TFakeConfiguracoesRepository.GetLegacyPrefeituraNFSe(): string;
begin
  NaoSuportado('GetLegacyPrefeituraNFSe');
  Result := '';
end;

end.
