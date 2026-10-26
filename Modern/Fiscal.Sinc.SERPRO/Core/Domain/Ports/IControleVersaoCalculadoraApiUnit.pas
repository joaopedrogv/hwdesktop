unit IControleVersaoCalculadoraApiUnit;

interface

uses
  CompatibilidadeRtcModelUnit,
  PublicacaoRtcModelUnit;

type
  IControleVersaoCalculadoraApi = interface
    ['{F2D07704-982C-489D-B525-5F3A18C35A56}']
    /// <summary>
    ///   Armazena URL base e token apenas em memoria durante a operacao.
    ///   O token nunca e logado, serializado ou exibido.
    /// </summary>
    procedure Configurar(const ABaseUrl, AToken: string; AIsStaging: Boolean);

    /// <summary>
    ///   Retorna a ultima versao compativel ou nil quando a API nao retornar registro.
    /// </summary>
    function ObterUltimaCompativel(const AAppName: string; ARtcVersion: Integer): CompatibilidadeRtcModel;

    /// <summary>
    ///   Retorna a ultima versao publicada para o app, sem filtrar por dominio
    ///   (rtc_version), ou nil quando a API nao retornar registro.
    /// </summary>
    function ObterUltimaDisponivel(const AAppName: string): CompatibilidadeRtcModel;

    /// <summary>
    ///   Retorna a publicacao da calc_version informada ou nil quando nao houver registro.
    /// </summary>
    function ObterPublicacao(const ACalcVersion: string): PublicacaoRtcModel;
  end;

implementation

end.
