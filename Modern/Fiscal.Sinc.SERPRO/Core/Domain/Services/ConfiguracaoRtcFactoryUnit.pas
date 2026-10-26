unit ConfiguracaoRtcFactoryUnit;

interface

uses
  ConfiguracaoEtdUnit,
  ConfiguracaoRtcUnit,
  StringNullableUnit,
  DoubleNullableUnit,
  DateAndTimeNullableUnit,
  StatusRegistroEnumUnit;

type
  /// <summary>
  ///   Apoio a construcao/clonagem de ConfiguracaoEtd para as chaves RTC
  ///   (rtc_publicacao_sha256, rtc_sincronizacao_lock), com ownership explicito
  ///   do TStrings: a entidade retornada pertence ao chamador e deve ser liberada
  ///   apos Post/Put (o repositorio nao toma posse).
  ///   Unidade 2006-compativel (sem marcador).
  /// </summary>
  ConfiguracaoRtcFactory = class
  public
    class function CriarAtualizacao(
      const AChave: string;
      const AValorString: StringNullable;
      const AValorDateTime: DateTimeNullable
    ): ConfiguracaoEtd;

    class function ClonarCom(
      const AOrigem: ConfiguracaoEtd;
      const AValorString: StringNullable;
      const AValorDateTime: DateTimeNullable
    ): ConfiguracaoEtd;
  end;

implementation

uses
  SysUtils, Classes;

{ ConfiguracaoRtcFactory }

class function ConfiguracaoRtcFactory.CriarAtualizacao(
  const AChave: string;
  const AValorString: StringNullable;
  const AValorDateTime: DateTimeNullable
): ConfiguracaoEtd;
begin
  // TStringList novo (ownership da entidade); nunca compartilhado com outra entidade.
  Result := ConfiguracaoEtd.Create(
    AChave,
    RTC_EMPRESA_ID,
    '',
    'string',
    AValorString,
    DoubleNullable.NullInstance(),
    TStringList.Create(),
    AValorDateTime,
    '',
    saAtivo
  );
end;

class function ConfiguracaoRtcFactory.ClonarCom(
  const AOrigem: ConfiguracaoEtd;
  const AValorString: StringNullable;
  const AValorDateTime: DateTimeNullable
): ConfiguracaoEtd;
begin
  if AOrigem = nil then
    raise Exception.Create('ConfiguracaoRtcFactory.ClonarCom: configuracao de origem nao informada.');

  // Copia Chave/EmpresaId/Display/Tipo/ValorDouble/Tags/Ativo; ValorString e
  // ValorDateTime vem dos parametros. ValorStrings e SEMPRE clonado.
  Result := ConfiguracaoEtd.Create(
    AOrigem.Chave,
    AOrigem.EmpresaId,
    AOrigem.Display,
    AOrigem.Tipo,
    AValorString,
    AOrigem.ValorDouble,
    TStringList.Create(),
    AValorDateTime,
    AOrigem.Tags,
    AOrigem.Ativo
  );

  if Assigned(AOrigem.ValorStrings) then
    Result.ValorStrings.AddStrings(AOrigem.ValorStrings);
end;

end.
