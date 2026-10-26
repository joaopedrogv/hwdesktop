unit ConfiguracaoRtcUnit;

interface

const
  RTC_APP_NAME = 'HW-DESKTOP';

  // Integer; a API retorna rtc_version como Integer NOT NULL.
  VERSAO_DOMINIO_RTC = 2;

  RTC_SYNC_LEASE_MINUTES = 10;

  // Configuracoes globais da calculadora (COD_EMPRESA = 0).
  RTC_EMPRESA_ID = 0;

  RTC_API_URL_KEY = 'rtc_api_url';                        // VALUE1_VC = URL base
  RTC_API_TOKEN_KEY = 'rtc_api_token';                    // VALUE1_VC = bearer token
  RTC_PUBLICACAO_SHA256_KEY = 'rtc_publicacao_sha256';    // VALUE1_VC = hash aplicado
  RTC_SINCRONIZACAO_LOCK_KEY = 'rtc_sincronizacao_lock';  // VALUE_DT + VALUE1_VC
  RTC_VERSAO_CALCULADORA_KEY = 'rtc_versao_calculadora';  // Replica os dados da tabela VERSAO_BASE_DADOS
  RTC_AMBIENTE_LOCAL_DEV = 'rtc_ambiente_local_dev';      // VALUE1_F = 1 = true = testes

  RTC_API_URL_DEFAULT = 'https://data.hwsistemasti.com.br';

implementation

end.
