unit ISincronizarCalculadoraUseCaseUnit;

interface

uses
  AtualizacaoCalculadoraModelUnit;

type
  /// <summary>
  ///   Aplicacao (com escrita) da publicacao da calculadora SERPRO.
  ///   Ordem obrigatoria (design 8.2): lease -> configurar reader/API ->
  ///   re-checar sha256 -> leitura sem transacao -> transacao propria
  ///   (aplicar + gravar rtc_publicacao_sha256) -> commit -> release;
  ///   rollback em falha. O hash so persiste em commit bem-sucedido e o bearer
  ///   token nunca e logado. Unidade 2006-compativel (sem marcador).
  /// </summary>
  ISincronizarCalculadoraUseCase = interface
    ['{0A54F761-D5D8-476A-83A9-0D92FDF76783}']
    procedure Executar(const AAtualizacao: AtualizacaoCalculadoraModel);
  end;

implementation

end.
