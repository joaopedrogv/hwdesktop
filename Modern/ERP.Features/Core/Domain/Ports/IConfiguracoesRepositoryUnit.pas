unit IConfiguracoesRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  CacheableRepositoryUnit,
  ConfiguracaoEtdUnit,
  ConfigLegacyTypes,
  TipoComunsUnit,
  EmailConfigModelUnit,
  EmailConfigRemetenteEnumUnit;

type
  IConfiguracoesRepository = class(CacheableRepository)
  public
    procedure Post(Input: ConfiguracaoEtd); virtual; abstract;
    procedure Put(Input: ConfiguracaoEtd); virtual; abstract;
    function GetByKey(const Chave: string): ConfiguracaoEtd;  overload; virtual; abstract;
    function GetByKey(const Chave: string; EmpresaId: Integer): ConfiguracaoEtd;  overload; virtual; abstract;
    function GetByKey(const Chaves: TArrayString): ConfiguracaoEtdList; overload; virtual; abstract;
    function GetByKey(const Chaves: TArrayString; EmpresaId: Integer): ConfiguracaoEtdList; overload; virtual; abstract;
    function GetLegacy(AConfigs: ConfigLegacySet): ConfigLegacyData; virtual; abstract;
    function GetEmailConfig(RemetenteConfig: EmailConfigRemetenteEnum): EmailConfigModel; virtual; abstract;
    procedure SaveLegacy(const AConfigs: ConfigLegacyData); virtual; abstract;
    function GetLegacyPrefeituraNFSe(): string; virtual; abstract;
  end;

implementation

end.
